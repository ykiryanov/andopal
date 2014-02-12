/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//    Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#include "umc_h264_segment_decoder_mt.h"
#include "vm_event.h"
#include "vm_semaphore.h"
#include "vm_thread.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_segment_decoder_templates.h"

#include "umc_h264_task_broker.h"
#include "umc_h264_frame_info.h"

#include "umc_h264_task_supplier.h"
#include "umc_h264_frame_list.h"

#include "umc_h264_timing.h"

namespace UMC
{
static
#ifdef __ICL
    __declspec(align(16))
#endif
const Ipp8u BlkOrder[16] =
{
    0, 1, 4, 5, 2, 3, 6, 7, 8, 9, 12, 13, 10, 11, 14, 15
};

H264SegmentDecoderMultiThreaded::H264SegmentDecoderMultiThreaded(TaskBroker * pTaskBroker)
    : H264SegmentDecoder(pTaskBroker)
{
    InitializeSDCreator();
} // H264SegmentDecoderMultiThreaded::H264SegmentDecoderMultiThreaded(H264SliceStore *Store)

H264SegmentDecoderMultiThreaded::~H264SegmentDecoderMultiThreaded(void)
{
    Release();

} // H264SegmentDecoderMultiThreaded::~H264SegmentDecoderMultiThreaded(void)

Status H264SegmentDecoderMultiThreaded::Init(Ipp32s iNumber)
{
    // release object before initialization
    Release();

    // call parent's Init
    return H264SegmentDecoder::Init(iNumber);
} // Status H264SegmentDecoderMultiThreaded::Init(Ipp32u nNumber)

void H264SegmentDecoderMultiThreaded::StartProcessingSegment(H264Task &Task)
{
    switch (Task.m_iTaskID)
    {
    case TASK_DEB_FRAME:
                // reset decoding variables
        m_pSlice = NULL;
        m_pCurrentFrame = Task.m_pSlice->GetCurrentFrame();
        m_pSliceHeader = NULL;
        m_field_index = Task.m_pSlice->GetSliceHeader()->bottom_field_flag;
        break;
    default:
        {
            m_pSlice = Task.m_pSlice;
            m_pCurrentFrame = m_pSlice->GetCurrentFrame();
            m_pSliceHeader = m_pSlice->GetSliceHeader();
            m_field_index = m_pSliceHeader->bottom_field_flag;

            // reset decoding variables
            m_pBitStream = m_pSlice->GetBitStream();
            mb_height = m_pSlice->GetMBHeight();
            mb_width = m_pSlice->GetMBWidth();
            m_pPicParamSet = m_pSlice->GetPicParam();
            m_pPredWeight[0] = m_pSlice->GetPredWeigthTable(0);
            m_pPredWeight[1] = m_pSlice->GetPredWeigthTable(1);
            m_pSeqParamSet = m_pSlice->GetSeqParam();
            m_pCoeffBlocksWrite = m_psBuffer = Task.m_pBuffer;
            m_pMBIntraTypes = m_pSlice->GetMBIntraTypes();

            m_bNeedToCheckMBSliceEdges = m_pSlice->NeedToCheckSliceEdges();
            m_mbinfo = m_pSlice->GetMBInfo();

            bit_depth_luma = m_pCurrentFrame->IsAuxiliaryFrame() ? m_pSlice->GetSeqParamEx()->bit_depth_aux :
                                                    m_pSeqParamSet->bit_depth_luma;
            bit_depth_chroma = m_pCurrentFrame->IsAuxiliaryFrame() ? 8 : m_pSeqParamSet->bit_depth_chroma;

            m_SD = CreateSegmentDecoder();

            m_MVDistortion[0] = 0;
            m_MVDistortion[1] = 0;
        }
        break;
    }

    m_gmbinfo = &(m_pCurrentFrame->m_mbinfo);

    if (TASK_PROCESS != Task.m_iTaskID && TASK_DEC != Task.m_iTaskID
        && TASK_REC != Task.m_iTaskID && TASK_DEC_REC != Task.m_iTaskID)
        return;

    //  DEBUG : ADB - should initialize context only for reconstruction or decoding tasks
    // InitContext
    bool is_field = m_pCurrentFrame->m_PictureStructureForDec < FRM_STRUCTURE;
    m_isMBAFF = 0 != m_pSliceHeader->MbaffFrameFlag;

    m_IsUseSpatialDirectMode = (m_pSliceHeader->direct_spatial_mv_pred_flag != 0);

    //static ReferenceFlags pFields_stub = {0};
    Ipp32s sliceNum = m_pSlice->GetSliceNum();
    m_pFields[0] = m_pCurrentFrame->GetRefPicList(sliceNum, 0)->m_Flags;
    m_pFields[1] = m_pCurrentFrame->GetRefPicList(sliceNum, 1)->m_Flags;
    m_pRefPicList[0] = m_pCurrentFrame->GetRefPicList(sliceNum, 0)->m_RefPicList;
    m_pRefPicList[1] = m_pCurrentFrame->GetRefPicList(sliceNum, 1)->m_RefPicList;

    if (TASK_PROCESS == Task.m_iTaskID || TASK_DEC == Task.m_iTaskID || TASK_DEC_REC == Task.m_iTaskID)
        m_pSlice->GetStateVariables(m_MBSkipCount, m_QuantPrev, m_prev_dquant);

    m_IsUseConstrainedIntra = (m_pPicParamSet->constrained_intra_pred_flag != 0);
    m_IsUseDirect8x8Inference = (m_pSeqParamSet->direct_8x8_inference_flag != 0);
    m_IsBSlice = (m_pSliceHeader->slice_type == BPREDSLICE);

    m_uPitchLuma = m_pCurrentFrame->pitch_luma();
    m_uPitchChroma = m_pCurrentFrame->pitch_chroma();

    m_pYPlane = m_pCurrentFrame->m_pYPlane;
    m_pUPlane = m_pCurrentFrame->m_pUPlane;
    m_pVPlane = m_pCurrentFrame->m_pVPlane;

    if (is_field)
    {
        if(m_field_index)
        {
            Ipp32s pixel_luma_sz    = bit_depth_luma > 8 ? 2 : 1;
            Ipp32s pixel_chroma_sz  = bit_depth_chroma > 8 ? 2 : 1;

            m_pYPlane += m_uPitchLuma*pixel_luma_sz;
            m_pUPlane += m_uPitchChroma*pixel_chroma_sz;
            m_pVPlane += m_uPitchChroma*pixel_chroma_sz;
        }

        m_uPitchLuma *= 2;
        m_uPitchChroma *= 2;
    }

    // reset neighbouringing blocks numbers
    m_cur_mb.CurrentBlockNeighbours.m_bInited = 0;
}

void H264SegmentDecoderMultiThreaded::EndProcessingSegment(H264Task &Task)
{
    // return performed task
    Task.m_WrittenSize = (Ipp8u*)m_pCoeffBlocksWrite - (Ipp8u*)Task.m_pBuffer;
    if (Task.m_bError)
    {
        Task.m_WrittenSize += COEFFICIENTS_BUFFER_SIZE;
    }

    if (TASK_DEC == Task.m_iTaskID)
    {
        m_MVDistortion[0] = (m_MVDistortion[0] + 6) >> INTERP_SHIFT;
        m_MVDistortion[1] = (m_MVDistortion[1] + 6) >> INTERP_SHIFT;

        if (m_pSlice->IsField() || m_pSlice->GetSliceHeader()->MbaffFrameFlag)
        {
            m_MVDistortion[0] <<= 1;
            m_MVDistortion[1] <<= 1;
        }

        m_MVDistortion[0] = IPP_MAX(m_MVDistortion[0], m_MVDistortion[1]);
        m_pTaskBroker->Lock();
        m_pSlice->m_MVsDistortion = IPP_MAX(m_MVDistortion[0], m_pSlice->m_MVsDistortion);
        m_pTaskBroker->Unlock();
    }

    m_pTaskBroker->AddPerformedTask(&Task);
}

Status H264SegmentDecoderMultiThreaded::ProcessSegment(void)
{
    H264Task Task(m_iNumber);

    while (m_pTaskBroker->GetNextTask(&Task))
    {
        Status umcRes = UMC_OK;

        VM_ASSERT(Task.pFunction);

        StartProcessingSegment(Task);

        if (!m_pCurrentFrame->IsSkipped() && (!m_pSlice || !m_pSlice->IsError()))
        {
            try // do decoding
            {
                Ipp32s firstMB = Task.m_iFirstMB;
                if (m_field_index)
                {
                    firstMB += mb_width*mb_height / 2;
                }

                umcRes = (this->*(Task.pFunction))(firstMB, Task.m_iMBToProcess);

                if (UMC_ERR_END_OF_STREAM == umcRes)
                {
                    Task.m_iMaxMB = Task.m_iFirstMB + Task.m_iMBToProcess;
                    VM_ASSERT(m_pSlice);
                    // if we decode less macroblocks if we need try to recovery:
                    RestoreErrorRect(Task.m_iFirstMB + Task.m_iMBToProcess, m_pSlice->GetMaxMB(), m_pSlice);
                    umcRes = UMC_OK;
                }
                else if (UMC_OK != umcRes)
                {
                    umcRes = UMC_ERR_INVALID_STREAM;
                }

                Task.m_bDone = true;

            } catch(const h264_exception & ex)
            {
                umcRes = ex.GetStatus();
            } catch(...)
            {
                umcRes = UMC_ERR_INVALID_STREAM;
            }
        }

        if (umcRes != UMC_OK)
        {
            Task.m_bError = true;
            Task.m_iMaxMB = Task.m_iFirstMB + Task.m_iMBToProcess;
            if (m_pSlice)
                RestoreErrorRect(Task.m_iFirstMB + Task.m_iMBToProcess, m_pSlice->GetMaxMB(), m_pSlice);
            // break; // DEBUG : ADB should we return if error occur??
        }

        EndProcessingSegment(Task);
    }

    return UMC_OK;

} // Status H264SegmentDecoderMultiThreaded::ProcessSegment(void)

void H264SegmentDecoderMultiThreaded::RestoreErrorRect(Ipp32s startMb, Ipp32s endMb, H264Slice * pSlice)
{
    m_pSlice = pSlice;

    if (startMb >= endMb || !m_pSlice || m_pSlice->IsSliceGroups())
        return;

    try
    {
        H264DecoderFrame * pCurrentFrame = m_pSlice->GetCurrentFrame();

        if (!pCurrentFrame)
        {
            VM_ASSERT(false);
            return;
        }

        H264DecoderFrame * pRefFrame = pCurrentFrame->GetRefPicList(m_pSlice->GetSliceNum(), 0)->m_RefPicList[0];

        pCurrentFrame->SetFrameExistFlag(false);
        pCurrentFrame->SetError(1);

        if (!pRefFrame || pRefFrame->IsSkipped())
        {
            pRefFrame = m_pTaskBroker->m_pTaskSupplier->GetDPBList()->FindClosest(pCurrentFrame);
        }

        m_SD->RestoreErrorRect(startMb, endMb, pRefFrame, this);
    } catch (...)
    {
        // nothing to do
    }
}

Status H264SegmentDecoderMultiThreaded::DecodeSegment(Ipp32s iCurMBNumber, Ipp32s &iMBToProcess)
{
    Status umcRes = UMC_OK;
    Ipp32s iMaxMBNumber = iCurMBNumber + iMBToProcess;
    Ipp32s iMBRowSize = m_pSlice->GetMBRowWidth();
    Ipp32s iFirstMB = iCurMBNumber;

    START_TICK

    // this is a cicle for rows of MBs
    for (; iCurMBNumber < iMaxMBNumber;)
    {
        Ipp32u nBorder;
        Ipp32s iPreCallMBNumber;

        // calculate the last MB in a row
        nBorder = IPP_MIN(iMaxMBNumber,
                      iCurMBNumber -
                      (iCurMBNumber % iMBRowSize) +
                      iMBRowSize);

        // perform the decoding on the current row
        iPreCallMBNumber = iCurMBNumber;

        try
        {
            if (m_pPicParamSet->entropy_coding_mode)
            {
                umcRes = DecodeMacroBlockCABAC(iCurMBNumber, nBorder);
            }
            else
            {
                umcRes = DecodeMacroBlockCAVLC(iCurMBNumber, nBorder);
            }
        } catch(...)
        {
            iMBToProcess = m_CurMBAddr - iFirstMB;
            throw;
        }

        // check error(s)
        if ((UMC_OK != umcRes) || (m_CurMBAddr >= iMaxMBNumber))
            break;

        // correct the MB number in a MBAFF case
        iCurMBNumber = iPreCallMBNumber -
                       (iPreCallMBNumber % iMBRowSize) +
                       iMBRowSize;
    }

    END_TICK(decode_time)

    if (UMC_ERR_END_OF_STREAM == umcRes)
    {
        iMBToProcess = m_CurMBAddr - iFirstMB;
    }

    return umcRes;

} // Status H264SegmentDecoderMultiThreaded::DecodeSegment(Ipp32s iCurMBNumber, Ipp32s &iMBToDecode)

Status H264SegmentDecoderMultiThreaded::ReconstructSegment(Ipp32s iCurMBNumber, Ipp32s &iMBToProcess)
{
    Status umcRes = UMC_OK;
    Ipp32s iMaxMBNumber = iCurMBNumber + iMBToProcess;
    Ipp32s iMBRowSize = m_pSlice->GetMBRowWidth();
    Ipp32s iFirstMB = iCurMBNumber;

    START_TICK

    // this is a cicle for rows of MBs
    for (; iCurMBNumber < iMaxMBNumber;)
    {
        Ipp32u nBorder;
        Ipp32s iPreCallMBNumber;

        // calculate the last MB in a row
        nBorder = IPP_MIN(iMaxMBNumber,
                      iCurMBNumber -
                      (iCurMBNumber % iMBRowSize) +
                      iMBRowSize);

        // perform the decoding on the current row
        iPreCallMBNumber = iCurMBNumber;

        try
        {
            if (m_pPicParamSet->entropy_coding_mode)
            {
                umcRes = ReconstructMacroBlockCABAC(iCurMBNumber, nBorder);
            }
            else
            {
                umcRes = ReconstructMacroBlockCAVLC(iCurMBNumber, nBorder);
            }
        } catch(...)
        {
            iMBToProcess = m_CurMBAddr - iFirstMB;
            throw;
        }

        // check error(s)
        if ((UMC_OK != umcRes) || (m_CurMBAddr >= iMaxMBNumber))
            break;

        // correct the MB number in a MBAFF case
        iCurMBNumber = iPreCallMBNumber -
                       (iPreCallMBNumber % iMBRowSize) +
                       iMBRowSize;
    }

    END_TICK(decode_time)

    return umcRes;

} // Status H264SegmentDecoderMultiThreaded::ReconstructSegment(Ipp32s iCurMBNumber, Ipp32s &iMBToReconstruct)

Status H264SegmentDecoderMultiThreaded::DecRecSegment(Ipp32s iCurMBNumber, Ipp32s &iMBToProcess)
{
    Status umcRes = UMC_OK;
    Ipp32s iBorder = iCurMBNumber + iMBToProcess;

    m_psBuffer = align_pointer<UMC::CoeffsPtrCommon> (m_pCoefficientsBuffer, DEFAULT_ALIGN_VALUE);

    try
    {
        if (m_pPicParamSet->entropy_coding_mode)
        {
            umcRes = m_SD->DecodeSegmentCABAC_Single(iCurMBNumber, iBorder, this);
            
        }
        else
        {
            umcRes = m_SD->DecodeSegmentCAVLC_Single(iCurMBNumber, iBorder, this);
        }
    }
    catch(...)
    {
        iMBToProcess = m_CurMBAddr - iCurMBNumber;
        throw;
    }

    iMBToProcess = m_CurMBAddr - iCurMBNumber;

    return umcRes;

} // Status H264SegmentDecoderMultiThreaded::DecRecSegment(Ipp32s iCurMBNumber, Ipp32s &iMBToReconstruct)

Status H264SegmentDecoderMultiThreaded::DeblockSegmentTask(Ipp32s iCurMBNumber, Ipp32s &iMBToDeblock)
{
    START_TICK
    // when there is slice groups or threaded deblocking
    if (NULL == m_pSlice)
        H264SegmentDecoder::DeblockFrame(iCurMBNumber, iMBToDeblock);
    else
        H264SegmentDecoder::DeblockSegment(iCurMBNumber, iMBToDeblock);

    END_TICK(deblocking_time)

    return UMC_OK;

} // Status H264SegmentDecoderMultiThreaded::DeblockSegmentTask(Ipp32s iCurMBNumber, Ipp32s &iMBToDeblock)

void H264SegmentDecoderMultiThreaded::DecodeMotionVectors_CABAC(void)
{
    Ipp32s curmb_fdf = pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
    // initialize blocks coding pattern maps

    Ipp32s type = m_cur_mb.GlobalMacroblockInfo->mbtype - MBTYPE_FORWARD;
    if(type >= 0)
    {
        if (m_cur_mb.LocalMacroblockInfo->sbdir[0] > D_DIR_BIDIR) // direct or skip MB
        {
            memset(m_cur_mb.MVs[LIST_0 + MV_DELTAS_OFFSET], 0, sizeof(H264DecoderMacroblockMVs));
            memset(m_cur_mb.MVs[LIST_1 + MV_DELTAS_OFFSET], 0, sizeof(H264DecoderMacroblockMVs));
            return;
        }

        // get all ref_idx_L0
        GetRefIdx4x4_CABAC(
                    m_pSliceHeader->num_ref_idx_l0_active<<curmb_fdf,
                    pCodFBD[type][0],
                    0);
        // get all ref_idx_L1
        GetRefIdx4x4_CABAC(
                    m_pSliceHeader->num_ref_idx_l1_active<<curmb_fdf,
                    pCodFBD[type][1],
                    1);
        // get all mvd_L0
        GetMVD4x4_CABAC(
                    pCodFBD[type][2],
                    0);
        // get all mvd_L1
        GetMVD4x4_CABAC(
                    pCodFBD[type][3],
                    1);
    }
    else
    {
        Ipp32u i, j;
        const Ipp8u *pRIxL0, *pRIxL1, *pMVdL0, *pMVdL1;

#ifdef __ICL
        __declspec(align(16))Ipp8u pCodRIxL0[16];
        __declspec(align(16))Ipp8u pCodRIxL1[16];
        __declspec(align(16))Ipp8u pCodMVdL0[16];
        __declspec(align(16))Ipp8u pCodMVdL1[16];
#else
        Ipp8u pCodRIxL0[16];
        Ipp8u pCodRIxL1[16];
        Ipp8u pCodMVdL0[16];
        Ipp8u pCodMVdL1[16];
#endif
        pRIxL0 = pCodRIxL0;
        pRIxL1 = pCodRIxL1;
        pMVdL0 = pCodMVdL0;
        pMVdL1 = pCodMVdL1;

        Ipp8u cL0;
        Ipp8u cL1;
        switch (m_cur_mb.GlobalMacroblockInfo->mbtype)
        {
        case MBTYPE_INTER_16x8:
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[0] = cL0;
                pCodRIxL1[0] = cL1;
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[8] = cL0;
                pCodRIxL1[8] = cL1;

                // get all ref_idx_L0
                GetRefIdx4x4_16x8_CABAC(
                            m_pSliceHeader->num_ref_idx_l0_active<<curmb_fdf,
                            pRIxL0,
                            0);

                // get all ref_idx_L1
                GetRefIdx4x4_16x8_CABAC(
                            m_pSliceHeader->num_ref_idx_l1_active<<curmb_fdf,
                            pRIxL1,
                            1);

                // get all mvd_L0
                GetMVD4x4_16x8_CABAC(
                            pRIxL0,
                            0);

                // get all mvd_L1
                GetMVD4x4_16x8_CABAC(
                            pRIxL1,
                            1);
                break;
            case MBTYPE_INTER_8x16:
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[0] = cL0;
                pCodRIxL1[0] = cL1;
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[2] = cL0;
                pCodRIxL1[2] = cL1;

                GetRefIdx4x4_8x16_CABAC(
                            m_pSliceHeader->num_ref_idx_l0_active<<curmb_fdf,
                            pRIxL0,
                            0);

                // get all ref_idx_L1
                GetRefIdx4x4_8x16_CABAC(
                            m_pSliceHeader->num_ref_idx_l1_active<<curmb_fdf,
                            pRIxL1,
                            1);

                // get all mvd_L0
                GetMVD4x4_8x16_CABAC(
                            pRIxL0,
                            0);

                // get all mvd_L1
                GetMVD4x4_8x16_CABAC(
                            pRIxL1,
                            1);
                break;
            case MBTYPE_INTER_8x8:
            case MBTYPE_INTER_8x8_REF0:
                memcpy(pCodRIxL0, pCodTemplate, sizeof(pCodTemplate[0])*16);
                memcpy(pCodRIxL1, pCodTemplate, sizeof(pCodTemplate[0])*16);
                memcpy(pCodMVdL0, pCodTemplate, sizeof(pCodTemplate[0])*16);
                memcpy(pCodMVdL1, pCodTemplate, sizeof(pCodTemplate[0])*16);
                {
                for (i = 0; i < 4; i ++)
                {
                    j = subblock_block_mapping[i];

                    if (m_cur_mb.LocalMacroblockInfo->sbdir[i] > D_DIR_BIDIR)
                    {
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_DIRECT_SPATIAL_BWD) ? CodNone : CodSkip;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_DIRECT_SPATIAL_FWD) ? CodNone : CodSkip;
                        pCodRIxL0[j] = pCodRIxL0[j + 1] = pCodRIxL0[j + 4] = pCodRIxL0[j + 5] = cL0;
                        pCodRIxL1[j] = pCodRIxL1[j + 1] = pCodRIxL1[j + 4] = pCodRIxL1[j + 5] = cL1;
                        pCodMVdL0[j] = pCodMVdL0[j + 1] = pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = cL0;
                        pCodMVdL1[j] = pCodMVdL1[j + 1] = pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = cL1;
                        continue;
                    }

                    switch (m_cur_mb.GlobalMacroblockInfo->sbtype[i])
                    {
                    case SBTYPE_8x8:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodMVdL0[j] = cL0;
                        pCodMVdL1[j] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j + 4] = CodAbov;
                        pCodMVdL1[j + 4] = CodAbov;
                        break;
                    case SBTYPE_8x4:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodMVdL0[j] = cL0;
                        pCodMVdL1[j] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j + 4] = cL0;
                        pCodMVdL1[j + 4] = cL1;
                        break;
                    case SBTYPE_4x8:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodMVdL0[j] = cL0;
                        pCodMVdL1[j] = cL1;
                        pCodMVdL0[j + 1] = cL0;
                        pCodMVdL1[j + 1] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = CodAbov;
                        pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = CodAbov;
                        break;
                    case SBTYPE_4x4:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j] = pCodMVdL0[j + 1] = pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = cL0;
                        pCodMVdL1[j] = pCodMVdL1[j + 1] = pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = cL1;
                        break;
                    case SBTYPE_DIRECT:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_DIRECT_SPATIAL_BWD) ? CodNone : CodSkip;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_DIRECT_SPATIAL_FWD) ? CodNone : CodSkip;
                        pCodRIxL0[j] = pCodRIxL0[j + 1] = pCodRIxL0[j + 4] = pCodRIxL0[j + 5] = cL0;
                        pCodRIxL1[j] = pCodRIxL1[j + 1] = pCodRIxL1[j + 4] = pCodRIxL1[j + 5] = cL1;
                        pCodMVdL0[j] = pCodMVdL0[j + 1] = pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = cL0;
                        pCodMVdL1[j] = pCodMVdL1[j + 1] = pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = cL1;
                        break;
                    default:
                        throw h264_exception(UMC_ERR_INVALID_STREAM);
                    }
                }
                // get all ref_idx_L0
                GetRefIdx4x4_CABAC(
                            m_pSliceHeader->num_ref_idx_l0_active<<curmb_fdf,
                            BlkOrder,
                            pRIxL0,
                            0);

                // get all ref_idx_L1
                GetRefIdx4x4_CABAC(
                            m_pSliceHeader->num_ref_idx_l1_active<<curmb_fdf,
                            BlkOrder,
                            pRIxL1,
                            1);

                // get all mvd_L0
                GetMVD4x4_CABAC(
                            BlkOrder,
                            pMVdL0,
                            0);

                // get all mvd_L1
                GetMVD4x4_CABAC(
                            BlkOrder,
                            pMVdL1,
                            1);
                break;
                }
            default:
                throw h264_exception(UMC_ERR_INVALID_STREAM);
        }    // switch

    }

    ReconstructMotionVectors();

} // void H264SegmentDecoderMultiThreaded::DecodeMotionVectors_CABAC(void)

#define RECONSTRUCT_MOTION_VECTORS(sub_block_num, vector_offset, position) \
    switch (pSBDir[sub_block_num]) \
    { \
    case D_DIR_FWD: \
        ReconstructMVs##position(0); \
        ResetMVs8x8(1, vector_offset); \
        break; \
    case D_DIR_BIDIR: \
        ReconstructMVs##position(0); \
        ReconstructMVs##position(1); \
        break; \
    case D_DIR_BWD: \
        ResetMVs8x8(0, vector_offset); \
        ReconstructMVs##position(1); \
        break; \
    case D_DIR_DIRECT_SPATIAL_FWD: \
        ResetMVs8x8(1, vector_offset); \
        break; \
    case D_DIR_DIRECT_SPATIAL_BWD: \
        ResetMVs8x8(0, vector_offset); \
        break; \
    default: \
        break; \
    }

void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors(void)
{
    /* DEBUG : temporary put off MBAFF */
    if (0 == m_pSliceHeader->MbaffFrameFlag)
    {
        switch (m_cur_mb.GlobalMacroblockInfo->mbtype)
        {
            // forward predicted macroblock
        case MBTYPE_FORWARD:
            if (m_cur_mb.LocalMacroblockInfo->sbdir[0] <= D_DIR_BIDIR)
            {
                // set forward vectors
                ReconstructMVs16x16(0);

                // set backward vectors
                ResetMVs16x16(1);
            }
            break;

            // backward predicted macroblock
        case MBTYPE_BACKWARD:
            if (m_cur_mb.LocalMacroblockInfo->sbdir[0] <= D_DIR_BIDIR)
            {
                // set forward vectors
                ResetMVs16x16(0);

                // set backward vectors
                ReconstructMVs16x16(1);
            }
            break;

            // bi-directional predicted macroblock
        case MBTYPE_BIDIR:
            if (m_cur_mb.LocalMacroblockInfo->sbdir[0] <= D_DIR_BIDIR)
            {
                // set forward vectors
                ReconstructMVs16x16(0);

                // set backward vectors
                ReconstructMVs16x16(1);
            }
            break;

        case MBTYPE_INTER_16x8:
            {
                // set forward vectors for the first sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD)
                    ResetMVs16x8(0, 0);
                else
                    ReconstructMVs16x8(0, 0);

                // set backward vectors for the first sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD)
                    ResetMVs16x8(1, 0);
                else
                    ReconstructMVs16x8(1, 0);

                // set forward vectors for the second sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD)
                    ResetMVs16x8(0, 8);
                else
                    ReconstructMVs16x8(0, 1);

                // set backward vectors for the second sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD)
                    ResetMVs16x8(1, 8);
                else
                    ReconstructMVs16x8(1, 1);
            }
            break;

        case MBTYPE_INTER_8x16:
            {
                // set forward vectors for the first sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD)
                    ResetMVs8x16(0, 0);
                else
                    ReconstructMVs8x16(0, 0);

                // set backward vectors for the first sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD)
                    ResetMVs8x16(1, 0);
                else
                    ReconstructMVs8x16(1, 0);

                // set forward vectors for the second sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD)
                    ResetMVs8x16(0, 2);
                else
                    ReconstructMVs8x16(0, 1);

                // set backward vectors for the second sub-block
                if (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD)
                    ResetMVs8x16(1, 2);
                else
                    ReconstructMVs8x16(1, 1);

                CopyMVs8x16(0);
                CopyMVs8x16(1);
            }
            break;

        case MBTYPE_INTER_8x8:
        case MBTYPE_INTER_8x8_REF0:
            {
                Ipp8s *pSBDir = m_cur_mb.LocalMacroblockInfo->sbdir;

                RECONSTRUCT_MOTION_VECTORS(0, 0, External);
                RECONSTRUCT_MOTION_VECTORS(1, 2, Top);
                RECONSTRUCT_MOTION_VECTORS(2, 8, Left);
                RECONSTRUCT_MOTION_VECTORS(3, 10, Internal);
            }
            break;

            // all other
        default:
            return;
            break;
        }

        return;
    }


    // initialize blocks coding pattern maps

    Ipp32s type = m_cur_mb.GlobalMacroblockInfo->mbtype - MBTYPE_FORWARD;
    if(type >= 0)
    {
        if (m_cur_mb.LocalMacroblockInfo->sbdir[0] > D_DIR_BIDIR)
            return;

        // get all mvd_L0
        ReconstructMotionVectors4x4(pCodFBD[type][2], 0);
        // get all mvd_L1
        ReconstructMotionVectors4x4(pCodFBD[type][3], 1);
    }
    else
    {
        Ipp32u i, j;
        const Ipp8u *pRIxL0, *pRIxL1, *pMVdL0, *pMVdL1;
#ifdef __ICL
        __declspec(align(16))Ipp8u pCodRIxL0[16];
        __declspec(align(16))Ipp8u pCodRIxL1[16];
        __declspec(align(16))Ipp8u pCodMVdL0[16];
        __declspec(align(16))Ipp8u pCodMVdL1[16];
#else
        Ipp8u pCodRIxL0[16];
        Ipp8u pCodRIxL1[16];
        Ipp8u pCodMVdL0[16];
        Ipp8u pCodMVdL1[16];
#endif
        pRIxL0 = pCodRIxL0;
        pRIxL1 = pCodRIxL1;
        pMVdL0 = pCodMVdL0;
        pMVdL1 = pCodMVdL1;

        Ipp8u cL0;
        Ipp8u cL1;
        switch (m_cur_mb.GlobalMacroblockInfo->mbtype)
        {
        case MBTYPE_INTER_16x8:
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[0] = cL0;
                pCodRIxL1[0] = cL1;
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[8] = cL0;
                pCodRIxL1[8] = cL1;

                // get all mvd_L0
                ReconstructMotionVectors16x8(pRIxL0, 0);

                // get all mvd_L1
                ReconstructMotionVectors16x8(pRIxL1, 1);
                break;
            case MBTYPE_INTER_8x16:
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[0] = cL0;
                pCodRIxL1[0] = cL1;
                cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD) ? CodNone : CodInBS;
                cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD) ? CodNone : CodInBS;
                pCodRIxL0[2] = cL0;
                pCodRIxL1[2] = cL1;

                // get all mvd_L0
                ReconstructMotionVectors8x16(pRIxL0, 0);

                // get all mvd_L1
                ReconstructMotionVectors8x16(pRIxL1, 1);
                break;
            case MBTYPE_INTER_8x8:
            case MBTYPE_INTER_8x8_REF0:
                memcpy(pCodRIxL0, pCodTemplate, sizeof(pCodTemplate[0])*16);
                memcpy(pCodRIxL1, pCodTemplate, sizeof(pCodTemplate[0])*16);
                memcpy(pCodMVdL0, pCodTemplate, sizeof(pCodTemplate[0])*16);
                memcpy(pCodMVdL1, pCodTemplate, sizeof(pCodTemplate[0])*16);
                {
                for (i = 0; i < 4; i ++)
                {
                    j = subblock_block_mapping[i];

                    Ipp32s sbtype = (m_cur_mb.LocalMacroblockInfo->sbdir[i] < D_DIR_DIRECT) ?
                        m_cur_mb.GlobalMacroblockInfo->sbtype[i] : SBTYPE_DIRECT;

                    switch (sbtype)
                    {
                    case SBTYPE_8x8:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodMVdL0[j] = cL0;
                        pCodMVdL1[j] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j + 4] = CodAbov;
                        pCodMVdL1[j + 4] = CodAbov;
                        break;
                    case SBTYPE_8x4:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodMVdL0[j] = cL0;
                        pCodMVdL1[j] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j + 4] = cL0;
                        pCodMVdL1[j + 4] = cL1;
                        break;
                    case SBTYPE_4x8:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodMVdL0[j] = cL0;
                        pCodMVdL1[j] = cL1;
                        pCodMVdL0[j + 1] = cL0;
                        pCodMVdL1[j + 1] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = CodAbov;
                        pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = CodAbov;
                        break;
                    case SBTYPE_4x4:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_BWD) ? CodNone : CodInBS;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_FWD) ? CodNone : CodInBS;
                        pCodRIxL0[j] = cL0;
                        pCodRIxL1[j] = cL1;
                        pCodRIxL0[j + 4] = CodAbov;
                        pCodRIxL1[j + 4] = CodAbov;
                        pCodMVdL0[j] = pCodMVdL0[j + 1] = pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = cL0;
                        pCodMVdL1[j] = pCodMVdL1[j + 1] = pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = cL1;
                        break;
                    case SBTYPE_DIRECT:
                        cL0 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_DIRECT_SPATIAL_BWD) ? CodNone : CodSkip;
                        cL1 = (m_cur_mb.LocalMacroblockInfo->sbdir[i] == D_DIR_DIRECT_SPATIAL_FWD) ? CodNone : CodSkip;
                        pCodRIxL0[j] = pCodRIxL0[j + 1] = pCodRIxL0[j + 4] = pCodRIxL0[j + 5] = cL0;
                        pCodRIxL1[j] = pCodRIxL1[j + 1] = pCodRIxL1[j + 4] = pCodRIxL1[j + 5] = cL1;
                        pCodMVdL0[j] = pCodMVdL0[j + 1] = pCodMVdL0[j + 4] = pCodMVdL0[j + 5] = cL0;
                        pCodMVdL1[j] = pCodMVdL1[j + 1] = pCodMVdL1[j + 4] = pCodMVdL1[j + 5] = cL1;
                        break;
                    default:
                        throw h264_exception(UMC_ERR_INVALID_STREAM);
                    }
                }
                // get all mvd_L0
                ReconstructMotionVectors4x4(BlkOrder,
                                            pMVdL0,
                                            0);

                // get all mvd_L1
                ReconstructMotionVectors4x4(BlkOrder,
                                            pMVdL1,
                                            1);
                break;
                }
            default:
                VM_ASSERT(false);
                throw h264_exception(UMC_ERR_INVALID_STREAM);
                break;
        }    // switch

    }
} // void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors(void)

void H264SegmentDecoderMultiThreaded::DecodeDirectMotionVectorsSpatial(void)
{
    
} // void H264SegmentDecoderMultiThreaded::DecodeDirectMotionVectorsSpatial(void)

void H264SegmentDecoderMultiThreaded::ReconstructDirectMotionVectorsSpatial()
{
    Ipp32u xpos, ypos;
    Ipp32s mvxL0, mvyL0;
    Ipp32s mvxL1, mvyL1;
    Ipp8s RefIndexL0, RefIndexL1;
    Ipp32u uSaveMBType = m_cur_mb.GlobalMacroblockInfo->mbtype;
    Ipp32u uPredDir;    // prediction direction of macroblock
    VM_ASSERT(m_pRefPicList[1][0]);

    Ipp32s field = m_pFields[1][0].field;
    bool bL1RefPicisShortTerm = m_pFields[1][0].isShortReference;

    // set up pointers to where MV and RefIndex will be stored
    H264DecoderMacroblockMVs *pFwdMV = m_cur_mb.MVs[0];
    H264DecoderMacroblockMVs *pBwdMV = m_cur_mb.MVs[1];
    Ipp32s bAll4x4AreSame;
    Ipp32s bAll8x8AreSame = 0;

    Ipp32s refIdxL0, refIdxL1;

    // find the reference indexes
    ComputeDirectSpatialRefIdx(&refIdxL0, &refIdxL1);
    RefIndexL0 = (Ipp8s)refIdxL0;
    RefIndexL1 = (Ipp8s)refIdxL1;

    // set up reference index array
    {
        Ipp8s *pFwdRefInd;
        Ipp8s *pBwdRefInd;

        pFwdRefInd = m_cur_mb.RefIdxs[0]->RefIdxs;
        pBwdRefInd = m_cur_mb.RefIdxs[1]->RefIdxs;

        if (0 <= (RefIndexL0 & RefIndexL1))
        {
            memset(pFwdRefInd, RefIndexL0, 16);
            memset(pBwdRefInd, RefIndexL1, 16);
        }
        else
        {
            memset(pFwdRefInd, 0, 16);
            memset(pBwdRefInd, 0, 16);
        }
    }

    // set direction for MB
    {
        //Ipp32u uPredDir;

        if ((0 <= RefIndexL0) && (0 > RefIndexL1))
            uPredDir = D_DIR_DIRECT_SPATIAL_FWD;
        else if ((0 > RefIndexL0) && (0 <= RefIndexL1))
            uPredDir = D_DIR_DIRECT_SPATIAL_BWD;
        else
            uPredDir = D_DIR_DIRECT_SPATIAL_BIDIR;

        //m_cur_mb.LocalMacroblockInfo->spatial_prediction_dir = (Ipp8u) uPredDir;
    }

    // Because predicted MV is computed using 16x16 block it is likely
    // that all 4x4 blocks will use the same MV and reference frame.
    // It is possible, however, for the MV for any 4x4 block to be set
    // to 0,0 instead of the computed MV. This possibility by default
    // forces motion compensation to be performed for each 4x4, the slowest
    // possible option. These booleans are used to detect when all of the
    // 4x4 blocks in an 8x8 can be combined for motion comp, and even better,
    // when all of the 8x8 blocks in the macroblock can be combined.

    // Change mbtype to any INTER 16x16 type, for computeMV function,
    // required for the 8x8 DIRECT case to force computeMV to get MV
    // using 16x16 type instead.
    m_cur_mb.GlobalMacroblockInfo->mbtype = MBTYPE_FORWARD;

    // Copy to local vars to avoid lots of pointer derefs
    //RefIndexL0 = m_cur_mb.LocalMacroblockInfo->spatial_ref_idx_l0;
    //RefIndexL1 = m_cur_mb.LocalMacroblockInfo->spatial_ref_idx_l1;
    // Forward MV (L0)
    if (RefIndexL0 != -1)
    {
        // L0 ref idx exists, use to obtain predicted L0 motion vector
        // for the macroblock
        ComputeMotionVectorPredictors(0,
            RefIndexL0,
            0,  // block
            &mvxL0, &mvyL0);
    }
    else
    {
        mvxL0 = mvyL0 = 0;
    }
    // Backward MV (L1)
    if (RefIndexL1 != -1)
    {
        // L0 ref idx exists, use to obtain predicted L0 motion vector
        // for the macroblock
        ComputeMotionVectorPredictors(1,
            RefIndexL1,
            0,  // block
            &mvxL1, &mvyL1);
    }
    else
    {
        mvxL1 = mvyL1 = 0;
    }

    if (mvyL0 > m_MVDistortion[0])
        m_MVDistortion[0] = mvyL0;

    if (mvyL1 > m_MVDistortion[1])
        m_MVDistortion[1] = mvyL1;

    // restore mbtype
    m_cur_mb.GlobalMacroblockInfo->mbtype = (Ipp8u)uSaveMBType;

    //uPredDir = m_cur_mb.LocalMacroblockInfo->spatial_prediction_dir;

    // In loops below, set MV and RefIdx for all subblocks. Conditionally
    // change MV to 0,0 and RefIndex to 0 (doing so called UseZeroPred here).
    // To select UseZeroPred for a part:
    //  (RefIndexLx < 0) ||
    //  (bL1RefPicisShortTerm && RefIndexLx==0 && ColocatedRefIndex==0 &&
    //    (colocated motion vectors in range -1..+1)
    // When both RefIndexLx are -1, ZeroPred is used and both RefIndexLx
    // are changed to zero.

    // It is desirable to avoid checking the colocated motion vectors and
    // colocated ref index, bools and orders of conditional testing are
    // set up to do so.

    // At the MB level, the colocated do not need to be checked if:
    //  - both RefIndexLx < 0
    //  - colocated is INTRA (know all colocated RefIndex are -1)
    //  - L1 Ref Pic is not short term
    // set bMaybeUseZeroPred to true if any of the above are false

    // Set MV for all DIRECT 4x4 subblocks
    Ipp32s sb, sbcolpartoffset;
    Ipp8s colocatedRefIndex;
    H264DecoderMotionVector *pRefMV; // will be colocated L0 or L1
    Ipp32s MBsCol[4];
    Ipp32s sbColPartOffset[4];

    if (m_IsUseDirect8x8Inference)
    {
        sbColPartOffset[0] = 0;
        sbColPartOffset[2] = 12;
        MBsCol[0] = GetColocatedLocation(m_pRefPicList[1][0], field, sbColPartOffset[0]);
        MBsCol[1] = MBsCol[0];
        sbColPartOffset[1] = sbColPartOffset[0]+3;
        MBsCol[2] = GetColocatedLocation(m_pRefPicList[1][0], field, sbColPartOffset[2]);
        MBsCol[3] = MBsCol[2];
        sbColPartOffset[3] = sbColPartOffset[2]+3;
    }
    else
    {
        sbColPartOffset[0] = 0;
        sbColPartOffset[2] = 8;
        MBsCol[0] = GetColocatedLocation(m_pRefPicList[1][0], field, sbColPartOffset[0]);
        MBsCol[1] = MBsCol[0];
        sbColPartOffset[1] = sbColPartOffset[0]+2;
        MBsCol[2] = GetColocatedLocation(m_pRefPicList[1][0], field, sbColPartOffset[2]);
        MBsCol[3] = MBsCol[2];
        sbColPartOffset[3] = sbColPartOffset[2]+2;
    }

    for (sb=0; sb<4; sb++)
    {
        if (m_cur_mb.GlobalMacroblockInfo->sbtype[sb] != SBTYPE_DIRECT)
        {
            bAll8x8AreSame = 17;
            continue;
        }

        // DIRECT 8x8 block
        bAll4x4AreSame = 0;

        Ipp32u MBCol=MBsCol[sb];
        H264DecoderMotionVector *pRefMVL0 = m_pRefPicList[1][0]->m_mbinfo.MV[0][MBCol].MotionVectors;
        H264DecoderMotionVector *pRefMVL1 = m_pRefPicList[1][0]->m_mbinfo.MV[1][MBCol].MotionVectors;
        Ipp8s *pColocatedRefIndexL0 = m_pRefPicList[1][0]->m_mbinfo.RefIdxs[0][MBCol].RefIdxs;
        Ipp8s *pColocatedRefIndexL1 = m_pRefPicList[1][0]->m_mbinfo.RefIdxs[1][MBCol].RefIdxs;

        bool isInter = IS_INTER_MBTYPE(m_pRefPicList[1][0]->m_mbinfo.mbs[MBCol].mbtype);
        sbcolpartoffset = sbColPartOffset[sb];

        colocatedRefIndex = pColocatedRefIndexL0[sbcolpartoffset];
        if (colocatedRefIndex >= 0)
        {
            // use L0 colocated
            pRefMV = pRefMVL0;
        }
        else
        {
            // use L1 colocated
            colocatedRefIndex = pColocatedRefIndexL1[sbcolpartoffset];
            pRefMV = pRefMVL1;
        }

        bool isNeedToCheckMVS = isInter && bL1RefPicisShortTerm && (colocatedRefIndex == 0) && ((RefIndexL0 != -1) || (RefIndexL1 != -1));

        if (isNeedToCheckMVS)
        {
            // 4 4x4 blocks
            for (ypos = 0; ypos < 2; ypos++)
            {
                for (xpos = 0; xpos < 2; xpos++)
                {
                    sbcolpartoffset = m_IsUseDirect8x8Inference ? sbColPartOffset[sb]:sbColPartOffset[sb]+ypos*4+xpos;
                    bool bUseZeroPredL0 = false;
                    bool bUseZeroPredL1 = false;
                    Ipp32s sbpartoffset = (ypos+(sb&2))*4+(sb&1)*2;

                    VM_ASSERT(pRefMV);
                    if (pRefMV[sbcolpartoffset].mvx >= -1 &&
                        pRefMV[sbcolpartoffset].mvx <= 1 &&
                        pRefMV[sbcolpartoffset].mvy >= -1 &&
                        pRefMV[sbcolpartoffset].mvy <= 1)
                    {
                        // All subpart conditions for forcing zero pred are met,
                        // use final RefIndexLx==0 condition for L0,L1.
                        bUseZeroPredL0 = (RefIndexL0 == 0);
                        bUseZeroPredL1 = (RefIndexL1 == 0);
                        bAll4x4AreSame ++;
                    }

                    if (!bUseZeroPredL0)
                    {
                        pFwdMV->MotionVectors[xpos+sbpartoffset].mvx = (Ipp16s) mvxL0;
                        pFwdMV->MotionVectors[xpos+sbpartoffset].mvy = (Ipp16s) mvyL0;
                    }
                    else
                    {
                        pFwdMV->MotionVectors[xpos+sbpartoffset].mvx = 0;
                        pFwdMV->MotionVectors[xpos+sbpartoffset].mvy = 0;
                    }

                    if (!bUseZeroPredL1)
                    {
                        pBwdMV->MotionVectors[xpos+sbpartoffset].mvx = (Ipp16s) mvxL1;
                        pBwdMV->MotionVectors[xpos+sbpartoffset].mvy = (Ipp16s) mvyL1;
                    }
                    else
                    {
                        pBwdMV->MotionVectors[xpos+sbpartoffset].mvx = 0;
                        pBwdMV->MotionVectors[xpos+sbpartoffset].mvy = 0;
                    }
                }   // xpos
            }   // ypos // next row of subblocks
        }
        else
        {
            H264DecoderMotionVector mv;
            mv.mvx = (Ipp16s)mvxL0;
            mv.mvy = (Ipp16s)mvyL0;
            storeStructInformationInto8x8<H264DecoderMotionVector>(&pFwdMV->MotionVectors[subblock_block_mapping[sb]], mv);

            mv.mvx = (Ipp16s)mvxL1;
            mv.mvy = (Ipp16s)mvyL1;
            storeStructInformationInto8x8<H264DecoderMotionVector>(&pBwdMV->MotionVectors[subblock_block_mapping[sb]], mv);
        }

        // set direction for 8x8 block
        m_cur_mb.LocalMacroblockInfo->sbdir[sb] = (Ipp8u)uPredDir;

        // set type for 8x8 block
        if (!bAll4x4AreSame || bAll4x4AreSame == 4)
            m_cur_mb.GlobalMacroblockInfo->sbtype[sb] = SBTYPE_8x8;
        else
            m_cur_mb.GlobalMacroblockInfo->sbtype[sb] = SBTYPE_4x4;

        bAll8x8AreSame += bAll4x4AreSame;
    }   // for sb

    // set mbtype to 8x8 if it was not; use larger type if possible
    if (!bAll8x8AreSame || bAll8x8AreSame == 16)
    {
        if (uPredDir == D_DIR_DIRECT_SPATIAL_FWD)
            m_cur_mb.GlobalMacroblockInfo->mbtype= MBTYPE_FORWARD;
        else if (uPredDir == D_DIR_DIRECT_SPATIAL_BWD)
            m_cur_mb.GlobalMacroblockInfo->mbtype = MBTYPE_BACKWARD;
        else
            m_cur_mb.GlobalMacroblockInfo->mbtype = MBTYPE_BIDIR;
    }
    else
    {
        m_cur_mb.GlobalMacroblockInfo->mbtype = MBTYPE_INTER_8x8;
    }
} // void H264SegmentDecoderMultiThreaded::ReconstructDirectMotionVectorsSpatial(H264DecoderFrame **

void H264SegmentDecoderMultiThreaded::GetMVD4x4_CABAC(const Ipp8u *pBlkIdx,
                                                        const Ipp8u *pCodMVd,
                                                        Ipp32u ListNum)
{
    Ipp32u i, j, m = 0;

    // new
    const H264DecoderMotionVector MV0 = {0, 0};
    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;

    for (i = 0; i < 16; i ++)
    {
        j = pBlkIdx[i];

        if ((m_cur_mb.GlobalMacroblockInfo->mbtype == MBTYPE_INTER_8x8 ||
             m_cur_mb.GlobalMacroblockInfo->mbtype == MBTYPE_INTER_8x8_REF0) &&
            !(i & 3))
            m = i;

        // new
        H264DecoderMotionVector mvd;

        switch (pCodMVd[j])
        {
        case CodNone:
            pMVd[j] = MV0;
            m++;
            break;

        case CodInBS:
            mvd = GetSE_MVD_CABAC(ListNum, j);
            pMVd[j] = mvd;
            break;

        case CodLeft:
            pMVd[j] = pMVd[j - 1];
            break;

        case CodAbov:
            pMVd[j]  = pMVd[j - 4];
            break;

        case CodSkip:
            pMVd[j] = MV0;
            break;
        }
    } // for i
} // void H264SegmentDecoderMultiThreaded::GetMVD4x4_CABAC(const Ipp8u *pBlkIdx,

void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors4x4(const Ipp8u *pBlkIdx,
                                                                    const Ipp8u *pCodMVd,
                                                                    Ipp32u ListNum)
{
    Ipp32u i, j, m = 0;

    // new
    const H264DecoderMotionVector MV0 = {0, 0};
    H264DecoderMotionVector *pMV = m_cur_mb.MVs[ListNum]->MotionVectors;
    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;
    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;
    // old

    for (i = 0; i < 16; i ++)
    {
        j = pBlkIdx[i];

        if ((m_cur_mb.GlobalMacroblockInfo->mbtype == MBTYPE_INTER_8x8 ||
             m_cur_mb.GlobalMacroblockInfo->mbtype == MBTYPE_INTER_8x8_REF0) &&
            !(i & 3))
            m = i;

        // new
        H264DecoderMotionVector mv;
        H264DecoderMotionVector mvd;
        Ipp32s mvpx, mvpy;

        switch (pCodMVd[j])
        {
        case CodNone:
            pMV[j] = MV0;
            m++;
            break;

        case CodInBS:
            // TBD optimization - modify to compute predictors here instead of calling this method
            ComputeMotionVectorPredictors((Ipp8u) ListNum,
                                          pRIx[j],
                                          m++,
                                          &mvpx,
                                          &mvpy);
            mvd = pMVd[j];
            // new & old
            mv.mvx = (Ipp16s) (mvpx + (Ipp32s) mvd.mvx);
            mv.mvy = (Ipp16s) (mvpy + (Ipp32s) mvd.mvy);

            if (mv.mvy > m_MVDistortion[ListNum])
                m_MVDistortion[ListNum] = mv.mvy;

            // new
            pMV[j] = mv;
            break;

        case CodLeft:
            pMV[j] = pMV[j - 1];
            break;

        case CodAbov:
            pMV[j]  = pMV[j - 4];
            break;

        case CodSkip:
            break;
        }
    } // for i
} // void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors4x4(const Ipp8u *pBlkIdx,

void H264SegmentDecoderMultiThreaded::GetMVD4x4_CABAC(const Ipp8u pCodMVd,
                                                        Ipp32u ListNum)
{
    Ipp32u k;

    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;

    H264DecoderMotionVector mvd;
#ifdef __ICL
    __assume_aligned(pMVd, 16);
#endif
    if(pCodMVd == CodNone)
    {
        memset(&pMVd[0],0,16*sizeof(H264DecoderMotionVector));
    }
    else
    {
        mvd = GetSE_MVD_CABAC(ListNum, 0);

        for (k = 0; k < 16; k ++)
        {
            pMVd[k].mvx = mvd.mvx;
            pMVd[k].mvy = mvd.mvy;

        } // for k
    }
} // void H264SegmentDecoderMultiThreaded::GetMVD4x4_CABAC(const Ipp8u pCodMVd,

void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors4x4(const Ipp8u pCodMVd,
                                                                    Ipp32u ListNum)
{
    Ipp32u k;

    H264DecoderMotionVector *pMV = m_cur_mb.MVs[ListNum]->MotionVectors;
    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;
    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

    H264DecoderMotionVector mv;
    H264DecoderMotionVector mvd;
    Ipp32s mvpx, mvpy;
#ifdef __ICL
    __assume_aligned(pMV, 16);
    __assume_aligned(pMVd, 16);
#endif
    if(pCodMVd == CodNone)
    {
        //pMV[0].mvx = pMV[0].mvy = pMVd[0].mvx = pMVd[0].mvy = 0;
        memset(&pMV[0],0,16*sizeof(H264DecoderMotionVector));
    }
    else
    {
        ComputeMotionVectorPredictors( (Ipp8u) ListNum,
                                        pRIx[0],
                                        0, &mvpx, &mvpy);

        mvd = pMVd[0];
        mv.mvx = (Ipp16s) (mvpx + (Ipp32s) mvd.mvx);
        mv.mvy = (Ipp16s) (mvpy + (Ipp32s) mvd.mvy);

        if (mv.mvy > m_MVDistortion[ListNum])
            m_MVDistortion[ListNum] = mv.mvy;

        for (k = 0; k < 16; k ++)
        {
            pMV[k].mvx  = mv.mvx;
            pMV[k].mvy  = mv.mvy;

        } // for k
    }
} // void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors4x4(const Ipp8u pCodMVd,

void H264SegmentDecoderMultiThreaded::GetMVD4x4_16x8_CABAC(const Ipp8u *pCodMVd,
                                                             Ipp32u ListNum)
{
    Ipp32u k;

    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;

    H264DecoderMotionVector mvd;
#ifdef __ICL
    __assume_aligned(pMVd, 16);
#endif
    if(pCodMVd[0] == CodNone)
    {
        memset(&pMVd[0],0,8*sizeof(H264DecoderMotionVector));
    }
    else
    {
        mvd = GetSE_MVD_CABAC(ListNum, 0);

        for (k = 0; k < 8; k ++)
        {
            pMVd[k].mvx = mvd.mvx;
            pMVd[k].mvy = mvd.mvy;

        } // for k
    }

    if(pCodMVd[8] == CodNone)
    {
        memset(&pMVd[8],0,8*sizeof(H264DecoderMotionVector));
    }
    else
    {
        mvd = GetSE_MVD_CABAC(ListNum, 8);

        for (k = 8; k < 16; k ++)
        {
            pMVd[k].mvx = mvd.mvx;
            pMVd[k].mvy = mvd.mvy;

        } // for k
    }
} // void H264SegmentDecoderMultiThreaded::GetMVD4x4_16x8_CABAC(const Ipp8u *pCodMVd,

void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors16x8(const Ipp8u *pCodMVd,
                                                                     Ipp32u ListNum)
{
    Ipp32u k;

    H264DecoderMotionVector *pMV = m_cur_mb.MVs[ListNum]->MotionVectors;
    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;
    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

    H264DecoderMotionVector mv;
    H264DecoderMotionVector mvd;
    Ipp32s mvpx, mvpy;
#ifdef __ICL
    __assume_aligned(pMV, 16);
    __assume_aligned(pMVd, 16);
#endif
    if(pCodMVd[0] == CodNone)
    {
        memset(&pMV[0],0,8*sizeof(H264DecoderMotionVector));
    }
    else
    {
        ComputeMotionVectorPredictors( (Ipp8u) ListNum,
                                        pRIx[0],
                                        0, &mvpx, &mvpy);

        mvd = pMVd[0];
        mv.mvx  = (Ipp16s) (mvpx + (Ipp32s) mvd.mvx);
        mv.mvy  = (Ipp16s) (mvpy + (Ipp32s) mvd.mvy);

        if (mv.mvy > m_MVDistortion[ListNum])
            m_MVDistortion[ListNum] = mv.mvy;

        for (k = 0; k < 8; k ++)
        {
            pMV[k].mvx  = mv.mvx;
            pMV[k].mvy  = mv.mvy;

        } // for k
    }

    if(pCodMVd[8] == CodNone)
    {
        memset(&pMV[8],0,8*sizeof(H264DecoderMotionVector));
    }
    else
    {
        ComputeMotionVectorPredictors( (Ipp8u) ListNum,
                                        pRIx[8],
                                        1, &mvpx, &mvpy);

        mvd = pMVd[8];
        mv.mvx  = (Ipp16s) (mvpx + (Ipp32s) mvd.mvx);
        mv.mvy  = (Ipp16s) (mvpy + (Ipp32s) mvd.mvy);

        if (mv.mvy > m_MVDistortion[ListNum])
            m_MVDistortion[ListNum] = mv.mvy;

        for (k = 8; k < 16; k ++)
        {
            pMV[k].mvx  = mv.mvx;
            pMV[k].mvy  = mv.mvy;

        } // for k
    }

} // void H264SegmentDecoderMultiThreaded::ReconstructMVs16x8(const Ipp8u *pCodMVd,

void H264SegmentDecoderMultiThreaded::GetMVD4x4_8x16_CABAC(const Ipp8u *pCodMVd,
                                                             Ipp32u ListNum)
{
    Ipp32u k;

    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;

    H264DecoderMotionVector mvd;
#ifdef __ICL
    __assume_aligned(pMVd, 16);
#endif
    if(pCodMVd[0] == CodNone)
    {
        pMVd[0].mvx = pMVd[0].mvy = 0;
        pMVd[1].mvx = pMVd[1].mvy = 0;
    }
    else
    {
        mvd = GetSE_MVD_CABAC(ListNum, 0);

        for (k = 0; k < 2; k ++)
        {
            pMVd[k].mvx = mvd.mvx;
            pMVd[k].mvy = mvd.mvy;

        } // for k
    }

    if(pCodMVd[2] == CodNone)
    {
        pMVd[2].mvx = pMVd[2].mvy = 0;
        pMVd[3].mvx = pMVd[3].mvy = 0;
    }
    else
    {
        mvd = GetSE_MVD_CABAC(ListNum, 2);

        for (k = 2; k < 4; k ++)
        {
            pMVd[k].mvx = mvd.mvx;
            pMVd[k].mvy = mvd.mvy;

        } // for k
    }
    memcpy(&pMVd[4], &pMVd[0], 4*sizeof(H264DecoderMotionVector));
    memcpy(&pMVd[8], &pMVd[0], 4*sizeof(H264DecoderMotionVector));
    memcpy(&pMVd[12], &pMVd[0], 4*sizeof(H264DecoderMotionVector));

} // void H264SegmentDecoderMultiThreaded::GetMVD4x4_8x16_CABAC(const Ipp8u *pCodMVd,

void H264SegmentDecoderMultiThreaded::ReconstructMotionVectors8x16(const Ipp8u *pCodMVd,
                                                                     Ipp32u ListNum)
{
    Ipp32u k;

    H264DecoderMotionVector *pMV = m_cur_mb.MVs[ListNum]->MotionVectors;
    H264DecoderMotionVector *pMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors;
    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

    H264DecoderMotionVector mv;
    H264DecoderMotionVector mvd;
    Ipp32s mvpx, mvpy;
#ifdef __ICL
    __assume_aligned(pMV, 16);
    __assume_aligned(pMVd, 16);
#endif
    if(pCodMVd[0] == CodNone)
    {
        pMV[0].mvx = pMV[0].mvy = 0;
        pMV[1].mvx = pMV[1].mvy = 0;
    }
    else
    {
        ComputeMotionVectorPredictors( (Ipp8u) ListNum,
                                        pRIx[0],
                                        0, &mvpx, &mvpy);

        mvd = pMVd[0];
        mv.mvx  = (Ipp16s) (mvpx + (Ipp32s) mvd.mvx);
        mv.mvy  = (Ipp16s) (mvpy + (Ipp32s) mvd.mvy);

        if (mv.mvy > m_MVDistortion[ListNum])
            m_MVDistortion[ListNum] = mv.mvy;

        for (k = 0; k < 2; k ++)
        {
            pMV[k].mvx  = mv.mvx;
            pMV[k].mvy  = mv.mvy;

        } // for k
    }

    if(pCodMVd[2] == CodNone)
    {
        pMV[2].mvx = pMV[2].mvy = 0;
        pMV[3].mvx = pMV[3].mvy = 0;
    }
    else
    {
        ComputeMotionVectorPredictors( (Ipp8u) ListNum,
                                        pRIx[2],
                                        1, &mvpx, &mvpy);

        mvd = pMVd[2];
        mv.mvx  = (Ipp16s) (mvpx + (Ipp32s) mvd.mvx);
        mv.mvy  = (Ipp16s) (mvpy + (Ipp32s) mvd.mvy);

        if (mv.mvy > m_MVDistortion[ListNum])
            m_MVDistortion[ListNum] = mv.mvy;

        for (k = 2; k < 4; k ++)
        {
            pMV[k].mvx  = mv.mvx;
            pMV[k].mvy  = mv.mvy;

        } // for k
    }
    memcpy(&pMV[4], &pMV[0], 4*sizeof(H264DecoderMotionVector));
    memcpy(&pMV[8], &pMV[0], 4*sizeof(H264DecoderMotionVector));
    memcpy(&pMV[12], &pMV[0], 4*sizeof(H264DecoderMotionVector));

} // void Status H264SegmentDecoderMultiThreaded::ReconstructMotionVectors8x16(const Ipp8u* pCodMVd,

bool H264SegmentDecoderMultiThreaded::DecodeSkipMotionVectors(void)
{
    Ipp8s *RefIndex = m_cur_mb.RefIdxs[0]->RefIdxs;

    memset(RefIndex, 0, sizeof(H264DecoderMacroblockRefIdxs));

    return true;

} // bool H264SegmentDecoderMultiThreaded::DecodeSkipMotionVectors(void)

void H264SegmentDecoderMultiThreaded::ReconstructSkipMotionVectors(void)
{
    // check "zero motion vectors" condition
    H264DecoderBlockLocation mbAddrA, mbAddrB;

    // select neighbours
    mbAddrA = m_cur_mb.CurrentBlockNeighbours.mbs_left[0];
    mbAddrB = m_cur_mb.CurrentBlockNeighbours.mb_above;

    if ((0 <= mbAddrA.mb_num) &&
        (0 <= mbAddrB.mb_num))
    {
        H264DecoderMotionVector mvA, mvB;
        Ipp32s refIdxA, refIdxB;

        // select motion vectors & reference indexes
        mvA = m_gmbinfo->MV[0][mbAddrA.mb_num].MotionVectors[mbAddrA.block_num];
        mvB = m_gmbinfo->MV[0][mbAddrB.mb_num].MotionVectors[mbAddrB.block_num];
        refIdxA = m_gmbinfo->RefIdxs[0][mbAddrA.mb_num].RefIdxs[mbAddrA.block_num];
        refIdxB = m_gmbinfo->RefIdxs[0][mbAddrB.mb_num].RefIdxs[mbAddrB.block_num];

        // adjust vectors & reference in the MBAFF case
        if (m_pSliceHeader->MbaffFrameFlag)
        {
            Ipp32s iCurStruct = pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
            Ipp32s iNeighbourStruct;

            iNeighbourStruct = GetMBFieldDecodingFlag(m_gmbinfo->mbs[mbAddrA.mb_num]);
            mvA.mvy <<= iNeighbourStruct;
            refIdxA <<= (1 - iNeighbourStruct);

            iNeighbourStruct = GetMBFieldDecodingFlag(m_gmbinfo->mbs[mbAddrB.mb_num]);
            mvB.mvy <<= iNeighbourStruct;
            refIdxB <<= (1 - iNeighbourStruct);

            if (iCurStruct)
            {
                mvA.mvy /= 2;
                mvB.mvy /= 2;
            }
            else
            {
                refIdxA >>= 1;
                refIdxB >>= 1;
            }
        }

        // check condition
        if ((mvA.mvx | mvA.mvy | refIdxA) &&
            (mvB.mvx | mvB.mvy | refIdxB))
        {
            H264DecoderMotionVector mvPred;
            H264DecoderBlockLocation mbAddrC;
            Ipp32s i;

            mbAddrC = m_cur_mb.CurrentBlockNeighbours.mb_above_right;
            if (0 == m_pSliceHeader->MbaffFrameFlag)
                ReconstructMVPredictorExternalBlock(0, mbAddrC, &mvPred);
            else
                ReconstructMVPredictorExternalBlockMBAFF(0, mbAddrC, &mvPred);

            if (mvPred.mvy > m_MVDistortion[0])
                m_MVDistortion[0] = mvPred.mvy;

            // fill motion vectors
            for (i = 0; i < 16; i += 1)
                m_cur_mb.MVs[0]->MotionVectors[i] = mvPred;

            return;
        }
    }

    // in oposite case we clean motion vectors
    memset((void *) m_cur_mb.MVs[0], 0, sizeof(H264DecoderMacroblockMVs));
} // void H264SegmentDecoderMultiThreaded::ReconstructSkipMotionVectors(void)

inline
Ipp32s CreateMVFromCode(Ipp32s code)
{
    Ipp32s val, sign;

    val = (code + 1) >> 1;
    sign = (code & 1) - 1;
    val ^= sign;
    val -= sign;

    return val;

} // Ipp32s CreateMVFromCode(Ipp32s code)

#define DecodeMVDelta_CAVLC(list_num, block_num) \
{ \
    H264DecoderMotionVector mvD; \
    mvD.mvx = (Ipp16s) CreateMVFromCode(m_pBitStream->GetVLCElement(false)); \
    mvD.mvy = (Ipp16s) CreateMVFromCode(m_pBitStream->GetVLCElement(false)); \
    m_cur_mb.MVs[list_num + MV_DELTAS_OFFSET]->MotionVectors[block_num] = mvD; \
}

void H264SegmentDecoderMultiThreaded::DecodeMotionVectorsPSlice_CAVLC(void)
{
    if ((m_cur_mb.LocalMacroblockInfo->sbdir[0] > D_DIR_BIDIR)
        && (m_cur_mb.GlobalMacroblockInfo->mbtype - MBTYPE_FORWARD >= 0))
    {
        return;
    }

    Ipp32s mbtype = m_cur_mb.GlobalMacroblockInfo->mbtype;

    switch (mbtype)
    {
    case MBTYPE_FORWARD:
        {
            // decode reference indexes
            {
                Ipp32s num_ref_idx_l0_active = m_pSliceHeader->num_ref_idx_l0_active <<
                                               pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
                Ipp32s refIdx = 0;

                if (2 == num_ref_idx_l0_active)

                    refIdx = m_pBitStream->Get1Bit() ^ 1;
                else if (2 < num_ref_idx_l0_active)
                    refIdx = m_pBitStream->GetVLCElement(false);
                memset(m_cur_mb.RefIdxs[0]->RefIdxs, refIdx, sizeof(Ipp8u) * 16);
            }

            // decode motion vector deltas
            DecodeMVDelta_CAVLC(0, 0);
        }
        break;

    case MBTYPE_INTER_16x8:
        {
            // decode reference indexes
            {
                Ipp32s num_ref_idx_l0_active = m_pSliceHeader->num_ref_idx_l0_active <<
                                               pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
                Ipp32s refIdx[2] = {0, 0};

                if (2 == num_ref_idx_l0_active)
                {
                    refIdx[0] = m_pBitStream->Get1Bit() ^ 1;
                    refIdx[1] = m_pBitStream->Get1Bit() ^ 1;
                }
                else if (2 < num_ref_idx_l0_active)
                {
                    refIdx[0] = m_pBitStream->GetVLCElement(false);
                    refIdx[1] = m_pBitStream->GetVLCElement(false);
                }
                memset(m_cur_mb.RefIdxs[0]->RefIdxs + 0, refIdx[0], sizeof(Ipp8s) * 8);
                memset(m_cur_mb.RefIdxs[0]->RefIdxs + 8, refIdx[1], sizeof(Ipp8s) * 8);
            }

            // decode motion vector deltas
            DecodeMVDelta_CAVLC(0, 0);
            DecodeMVDelta_CAVLC(0, 8);
        }
        break;

    case MBTYPE_INTER_8x16:
        {
            // decode reference indexes
            {
                Ipp32s num_ref_idx_l0_active = m_pSliceHeader->num_ref_idx_l0_active <<
                                               pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
                Ipp8s refIdx[4] = {0, 0, 0, 0};

                if (2 == num_ref_idx_l0_active)
                {
                    refIdx[0] =
                    refIdx[1] = (Ipp8s) (m_pBitStream->Get1Bit() ^ 1);
                    refIdx[2] =
                    refIdx[3] = (Ipp8s) (m_pBitStream->Get1Bit() ^ 1);
                }
                else if (2 < num_ref_idx_l0_active)
                {
                    refIdx[0] =
                    refIdx[1] = (Ipp8s) m_pBitStream->GetVLCElement(false);
                    refIdx[2] =
                    refIdx[3] = (Ipp8s) m_pBitStream->GetVLCElement(false);
                }
                memcpy(m_cur_mb.RefIdxs[0]->RefIdxs + 0, refIdx, sizeof(Ipp8s) * 4);
                memcpy(m_cur_mb.RefIdxs[0]->RefIdxs + 4, refIdx, sizeof(Ipp8s) * 4);
                memcpy(m_cur_mb.RefIdxs[0]->RefIdxs + 8, refIdx, sizeof(Ipp8s) * 4);
                memcpy(m_cur_mb.RefIdxs[0]->RefIdxs + 12, refIdx, sizeof(Ipp8s) * 4);
            }

            // decode motion vector deltas
            DecodeMVDelta_CAVLC(0, 0);
            DecodeMVDelta_CAVLC(0, 2);
        }
        break;

        // 8x8 devision and smaller
    default:
        {
            Ipp8s *pSubBlockType = m_cur_mb.GlobalMacroblockInfo->sbtype;
            Ipp8s *pSubDirType = m_cur_mb.LocalMacroblockInfo->sbdir;

            if ((SBTYPE_8x8 == pSubBlockType[0]) &&
                (SBTYPE_8x8 == pSubBlockType[1]) &&
                (SBTYPE_8x8 == pSubBlockType[2]) &&
                (SBTYPE_8x8 == pSubBlockType[3]) &&

                (pSubDirType[0] < D_DIR_DIRECT) &&
                (pSubDirType[1] < D_DIR_DIRECT) &&
                (pSubDirType[2] < D_DIR_DIRECT) &&
                (pSubDirType[3] < D_DIR_DIRECT) )
            {
                // decode reference indexes
                {
                    Ipp32s num_ref_idx_l0_active = m_pSliceHeader->num_ref_idx_l0_active <<
                                                   pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);

                    if ((MBTYPE_INTER_8x8 == mbtype) &&
                        (1 < num_ref_idx_l0_active))
                    {
                        Ipp32s refIdx[4];

                        if (2 == num_ref_idx_l0_active)
                        {
                            refIdx[0] = m_pBitStream->Get1Bit() ^ 1;
                            refIdx[1] = m_pBitStream->Get1Bit() ^ 1;
                            refIdx[2] = m_pBitStream->Get1Bit() ^ 1;
                            refIdx[3] = m_pBitStream->Get1Bit() ^ 1;
                        }
                        else
                        {
                            refIdx[0] = m_pBitStream->GetVLCElement(false);
                            refIdx[1] = m_pBitStream->GetVLCElement(false);
                            refIdx[2] = m_pBitStream->GetVLCElement(false);
                            refIdx[3] = m_pBitStream->GetVLCElement(false);
                        }

                        m_cur_mb.RefIdxs[0]->RefIdxs[0] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[1] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[4] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[5] = (Ipp8s) refIdx[0];
                        m_cur_mb.RefIdxs[0]->RefIdxs[2] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[3] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[6] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[7] = (Ipp8s) refIdx[1];
                        m_cur_mb.RefIdxs[0]->RefIdxs[8] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[9] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[12] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[13] = (Ipp8s) refIdx[2];
                        m_cur_mb.RefIdxs[0]->RefIdxs[10] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[11] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[14] =
                        m_cur_mb.RefIdxs[0]->RefIdxs[15] = (Ipp8s) refIdx[3];
                    }
                    else
                        memset(m_cur_mb.RefIdxs[0]->RefIdxs, 0, sizeof(Ipp8s) * 16);
                }

                // decode motion vector deltas
                DecodeMVDelta_CAVLC(0, 0);
                DecodeMVDelta_CAVLC(0, 2);
                DecodeMVDelta_CAVLC(0, 8);
                DecodeMVDelta_CAVLC(0, 10);

            }
            else
            {
                DecodeMotionVectors_CAVLC(false);
                return;
            }
        }
        break;
    };

    ReconstructMotionVectors();
} // void H264SegmentDecoderMultiThreaded::DecodeMotionVectorsPSlice_CAVLC(void)

void H264SegmentDecoderMultiThreaded::DecodeMotionVectors_CAVLC(bool bIsBSlice)
{
    if ((m_cur_mb.LocalMacroblockInfo->sbdir[0] > D_DIR_BIDIR)
        && (m_cur_mb.GlobalMacroblockInfo->mbtype - MBTYPE_FORWARD >= 0))
    {
        return;
    }

    Ipp32s num_vectorsL0, block, subblock, i, j;
    Ipp32s mvdx_l0, mvdy_l0, mvdx_l1 = 0, mvdy_l1 = 0;
    Ipp32s num_vectorsL1;
    Ipp32s dec_vectorsL0;
    Ipp32s dec_vectorsL1;
    Ipp32s num_refIxL0;
    Ipp32s num_refIxL1;
    Ipp32s dec_refIxL0;
    Ipp32s dec_refIxL1;
    Ipp32u uVLCCodes[64+MAX_NUM_REF_FRAMES*2];  // sized for max possible:
                                                //  16 MV * 2 codes per MV * 2 directions
                                                //  plus L0 and L1 ref indexes
    Ipp32u *pVLCCodes;        // pointer to pass to VLC function
    Ipp32u *pVLCCodesL0MV;
    Ipp32u *pVLCCodesL1MV;
    Ipp32u *pVLCCodesL0RefIndex;
    Ipp32u *pVLCCodesL1RefIndex;

    Ipp32u dirPart;    // prediction direction of current MB partition
    Ipp32s numParts;
    Ipp32s partCtr;
    Ipp8s RefIxL0 = 0;
    Ipp8s RefIxL1 = 0;
    Ipp8s *pRefIndexL0 = NULL;
    Ipp8s *pRefIndexL1 = NULL;

    H264DecoderMotionVector *pMVDeltaL0 = NULL;
    H264DecoderMotionVector *pMVDeltaL1 = NULL;

    Ipp32s uNumRefIdxL0Active;
    Ipp32s uNumRefIdxL1Active;
    Ipp32s uNumVLCCodes;

    switch (m_cur_mb.GlobalMacroblockInfo->mbtype)
    {
    case MBTYPE_FORWARD:
        num_vectorsL0 = 1;
        num_refIxL0 = 1;
        num_vectorsL1 = 0;
        num_refIxL1 = 0;
        dirPart = D_DIR_FWD;
        numParts = 1;
        break;
    case MBTYPE_BACKWARD:
        num_vectorsL0 = 0;
        num_refIxL0 = 0;
        num_vectorsL1 = 1;
        num_refIxL1 = 1;
        dirPart = D_DIR_BWD;
        numParts = 1;
        break;
    case MBTYPE_BIDIR:
        num_vectorsL0 = 1;
        num_refIxL0 = 1;
        num_vectorsL1 = 1;
        num_refIxL1 = 1;
        dirPart = D_DIR_BIDIR;
        numParts = 1;
        break;
    case MBTYPE_INTER_8x8:
    case MBTYPE_INTER_8x8_REF0:
        num_vectorsL0 = 0;
        num_refIxL0 = 0;
        num_vectorsL1 = 0;
        num_refIxL1 = 0;
        numParts = 0;
        for (block = 0; block<4; block++)
        {
            Ipp32s sbtype = (m_cur_mb.LocalMacroblockInfo->sbdir[block] < D_DIR_DIRECT) ?
                m_cur_mb.GlobalMacroblockInfo->sbtype[block] : SBTYPE_DIRECT;
            switch (sbtype)
            {
            case SBTYPE_8x8:
                if ((m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_FWD) ||
                    (m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BIDIR))
                {
                    num_vectorsL0++;
                    num_refIxL0++;
                }
                if ((m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BWD) ||
                    (m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BIDIR))
                {
                    num_vectorsL1++;
                    num_refIxL1++;
                }
                numParts++;
                break;
            case SBTYPE_8x4:
            case SBTYPE_4x8:
                if ((m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_FWD) ||
                    (m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BIDIR))
                {
                    num_vectorsL0 += 2;
                    num_refIxL0++;        // only one per refIx per 8x8
                }
                if ((m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BWD) ||
                    (m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BIDIR))
                {
                    num_vectorsL1 += 2;
                    num_refIxL1++;
                }
                numParts += 2;
                break;
            case SBTYPE_4x4:
                if ((m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_FWD) ||
                    (m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BIDIR))
                {
                    num_vectorsL0 += 4;
                    num_refIxL0++;
                }
                if ((m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BWD) ||
                    (m_cur_mb.LocalMacroblockInfo->sbdir[block] == D_DIR_BIDIR))
                {
                    num_vectorsL1 += 4;
                    num_refIxL1++;
                }
                numParts += 4;
                break;
            case SBTYPE_DIRECT:
                numParts++;
                break;
            default:
                throw h264_exception(UMC_ERR_INVALID_STREAM);
                break;
            }
        }
        dirPart = m_cur_mb.LocalMacroblockInfo->sbdir[0];
        break;
    case MBTYPE_INTER_16x8:
    case MBTYPE_INTER_8x16:
        num_vectorsL0 = 0;
        num_refIxL0 = 0;
        num_vectorsL1 = 0;
        num_refIxL1 = 0;
        if ((m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_FWD) || (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BIDIR))
        {
            num_vectorsL0++;
            num_refIxL0++;
        }
        if ((m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BWD) || (m_cur_mb.LocalMacroblockInfo->sbdir[0] == D_DIR_BIDIR))
        {
            num_vectorsL1++;
            num_refIxL1++;
        }
        if ((m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_FWD) || (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BIDIR))
        {
            num_vectorsL0++;
            num_refIxL0++;
        }
        if ((m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BWD) || (m_cur_mb.LocalMacroblockInfo->sbdir[1] == D_DIR_BIDIR))
        {
            num_vectorsL1++;
            num_refIxL1++;
        }
        numParts = 2;
        dirPart = m_cur_mb.LocalMacroblockInfo->sbdir[0];
        break;
    default:
        VM_ASSERT(false);
        return; // DEBUG: may be throw ???
    }

    // Get all of the reference index and MV VLC codes from the bitstream
    // The bitstream contains them in the following order, which is the
    // order they are returned in uVLCCodes:
    //   L0 reference index for all MB parts using L0 prediction
    //   L1 reference index for all MB parts using L1 prediction
    //   L0 MV delta for all MB parts using L0 prediction
    //   L1 MV delta for all MB parts using L1 prediction
    // Reference index data is present only when the number of active
    // reference frames is greater than one. Also, MBTYPE_INTER_8x8_REF0
    // type MB has no ref index info in the bitstream (use 0 for all).
    uNumRefIdxL0Active = m_pSliceHeader->num_ref_idx_l0_active<<pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
    uNumRefIdxL1Active = m_pSliceHeader->num_ref_idx_l1_active<<pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo);
    if (uNumRefIdxL0Active == 1 || MBTYPE_INTER_8x8_REF0 == m_cur_mb.GlobalMacroblockInfo->mbtype)
        num_refIxL0 = 0;
    if (uNumRefIdxL1Active == 1 || MBTYPE_INTER_8x8_REF0 == m_cur_mb.GlobalMacroblockInfo->mbtype)
        num_refIxL1 = 0;

    // set pointers into VLC codes array
    pVLCCodes = uVLCCodes;
    pVLCCodesL0RefIndex = uVLCCodes;
    pVLCCodesL1RefIndex = pVLCCodesL0RefIndex + num_refIxL0;
    pVLCCodesL0MV = pVLCCodesL1RefIndex + num_refIxL1;
    pVLCCodesL1MV = pVLCCodesL0MV + num_vectorsL0*2;

    uNumVLCCodes = (num_vectorsL0+num_vectorsL1)*2 + num_refIxL0 + num_refIxL1;

    // When possible ref index range is 0..1, the reference index is coded
    // as 1 bit. When that occurs, get the ref index codes separate from
    // the motion vectors. Otherwise get all of the codes at once.
    if (uNumRefIdxL0Active == 2 || uNumRefIdxL1Active == 2)
    {
        // 1 bit codes for at least one set of ref index codes
        if (uNumRefIdxL0Active == 2)
        {
            for (i=0; i<num_refIxL0; i++)
            {
                pVLCCodesL0RefIndex[i] = !m_pBitStream->Get1Bit();
            }
        }
        else if (uNumRefIdxL0Active > 2)
        {
            for (i=0;i<num_refIxL0;i++)
            {
                pVLCCodesL0RefIndex[i]=m_pBitStream->GetVLCElement(false);
            }
        }

        if (uNumRefIdxL1Active == 2)
        {
            for (i=0; i<num_refIxL1; i++)
            {
                pVLCCodesL1RefIndex[i] = !m_pBitStream->Get1Bit();
            }
        }
        else if (uNumRefIdxL1Active > 2)
        {
            for (i=0;i<num_refIxL1;i++)
            {
                pVLCCodesL1RefIndex[i]=m_pBitStream->GetVLCElement(false);
            }
        }

        // to get the MV for the MB
        uNumVLCCodes -= num_refIxL0 + num_refIxL1;
        pVLCCodes = pVLCCodesL0MV;
    }

    // get all MV and possibly Ref Index codes for the MB
    for (i=0;i<uNumVLCCodes;i++,pVLCCodes++)
    {
        *pVLCCodes = m_pBitStream->GetVLCElement(false);
    }

    block = 0;
    subblock = 0;
    dec_vectorsL0 = 0;
    dec_vectorsL1 = 0;
    dec_refIxL0 = 0;
    dec_refIxL1 = 0;
    Ipp32u sboffset;
    for (partCtr = 0,sboffset=0; partCtr < numParts; partCtr++)
    {
        pMVDeltaL0 = &m_cur_mb.MVs[0 + MV_DELTAS_OFFSET]->MotionVectors[sboffset];
        pRefIndexL0 = &m_cur_mb.RefIdxs[0]->RefIdxs[sboffset];

        if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
        {    // L0
            if (num_refIxL0)
            {
                RefIxL0 = (Ipp8s)pVLCCodesL0RefIndex[dec_refIxL0];
                // dec_refIxL0 is incremented in mbtype-specific code below
                // instead of here because there is only one refIx for each
                // 8x8 block, so number of refIx values is not the same as
                // numParts.
                if (RefIxL0 >= (Ipp8s)uNumRefIdxL0Active || RefIxL0 < 0)
                {
                    throw h264_exception(UMC_ERR_INVALID_STREAM);
                }
            }
            else
                RefIxL0 = 0;

            mvdx_l0 = (pVLCCodesL0MV[dec_vectorsL0*2]+1) >> 1;
            if (!(pVLCCodesL0MV[dec_vectorsL0*2]&1))
                mvdx_l0 = -mvdx_l0;

            mvdy_l0 = (pVLCCodesL0MV[dec_vectorsL0*2+1]+1) >> 1;
            if (!(pVLCCodesL0MV[dec_vectorsL0*2+1]&1))
                mvdy_l0 = -mvdy_l0;
            dec_vectorsL0++;
        }    // L0
        else
        {
            mvdx_l0 = mvdy_l0 = 0;
            RefIxL0 = -1;
        }

        if (bIsBSlice)
        {
            pMVDeltaL1 = &m_cur_mb.MVs[1 + MV_DELTAS_OFFSET]->MotionVectors[sboffset];
            pRefIndexL1 = &m_cur_mb.RefIdxs[1]->RefIdxs[sboffset];

            if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
            {
                if (num_refIxL1)
                {
                    RefIxL1 = (Ipp8s)pVLCCodesL1RefIndex[dec_refIxL1];
                    // dec_refIxL1 is incremented in mbtype-specific code below
                    // instead of here because there is only one refIx for each
                    // 8x8 block, so number of refIx values is not the same as
                    // numParts.
                    if (RefIxL1 >= (Ipp8s)uNumRefIdxL1Active || RefIxL1 < 0)
                    {
                        // something is wrong
                    }
                }
                else
                    RefIxL1 = 0;

                mvdx_l1 = (pVLCCodesL1MV[dec_vectorsL1*2]+1)>>1;
                if (!(pVLCCodesL1MV[dec_vectorsL1*2]&1))
                    mvdx_l1 = -mvdx_l1;

                mvdy_l1 = (pVLCCodesL1MV[dec_vectorsL1*2+1]+1)>>1;
                if (!(pVLCCodesL1MV[dec_vectorsL1*2+1]&1))
                    mvdy_l1 = -mvdy_l1;
                dec_vectorsL1++;
            }    // L1
            else
            {
                mvdx_l1 = mvdy_l1 = 0;
                RefIxL1 = -1;
            }
        }    // B slice

        // Store motion vectors and reference indexes into this frame's buffers
        switch (m_cur_mb.GlobalMacroblockInfo->mbtype)
        {
        case MBTYPE_FORWARD:
        case MBTYPE_BACKWARD:
        case MBTYPE_BIDIR:

            pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
            pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

            fill_n(pRefIndexL0, 16, RefIxL0);

            if (bIsBSlice)
            {
                pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                fill_n(pRefIndexL1, 16, RefIxL1);
            }
            break;
        case MBTYPE_INTER_16x8:
            pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
            pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

            // store in 8 top or bottom half blocks
            fill_n(pRefIndexL0, 8, RefIxL0);

            if (bIsBSlice)
            {
                pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                fill_n(pRefIndexL1, 8, RefIxL1);

                if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
                    dec_refIxL1++;
            }
            block++;
            sboffset=8;
            if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
                dec_refIxL0++;
            dirPart = m_cur_mb.LocalMacroblockInfo->sbdir[block];        // next partition
            break;
        case MBTYPE_INTER_8x16:
            pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
            pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

            // store in 8 left or right half blocks
            for (i = 0; i < 4; i++)
            {
                for (j = 0; j < 2; j++)
                {
                    pRefIndexL0[j] = RefIxL0;
                }
                pRefIndexL0 += 4;
            }

            if (bIsBSlice)
            {
                pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                // store in 8 left or right half blocks
                for (i = 0; i < 4; i++)
                {
                    for (j = 0; j < 2; j++)
                    {
                        pRefIndexL1[j] = RefIxL1;
                    }
                    pRefIndexL1 += 4;
                }
                if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
                    dec_refIxL1++;
            }
            block++;
            sboffset=2;
            if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
                dec_refIxL0++;
            dirPart = m_cur_mb.LocalMacroblockInfo->sbdir[block];        // next partition
            break;
        case MBTYPE_INTER_8x8:
        case MBTYPE_INTER_8x8_REF0:
            {
                Ipp32s sbtype = (m_cur_mb.LocalMacroblockInfo->sbdir[block>>2] < D_DIR_DIRECT) ?
                    m_cur_mb.GlobalMacroblockInfo->sbtype[block>>2] : SBTYPE_DIRECT;

            switch (sbtype)
            {
            case SBTYPE_8x8:
                pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
                pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

                pRefIndexL0[0] = RefIxL0;
                pRefIndexL0[1] = RefIxL0;
                pRefIndexL0[4] = RefIxL0;
                pRefIndexL0[4+1] = RefIxL0;


                if (bIsBSlice)
                {
                    pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                    pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                    pRefIndexL1[0] = RefIxL1;
                    pRefIndexL1[1] = RefIxL1;
                    pRefIndexL1[4] = RefIxL1;
                    pRefIndexL1[4+1] = RefIxL1;
                    if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL1++;
                }
                if (block == 4)
                {
                    sboffset += 8 - 2;
                }
                else
                {
                    sboffset += 2;
                }
                block += 4;
                if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
                    dec_refIxL0++;
                break;
            case SBTYPE_8x4:
                pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
                pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

                pRefIndexL0[0] = RefIxL0;
                pRefIndexL0[1] = RefIxL0;
                if (bIsBSlice)
                {
                    pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                    pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                    pRefIndexL1[0] = RefIxL1;
                    pRefIndexL1[1] = RefIxL1;
                }

                if (subblock == 1)
                {
                    if (block == 4)
                    {
                        sboffset+=2;
                    }
                    else
                    {
                        sboffset-=2;
                    }
                    block += 4;
                    subblock = 0;
                    if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL0++;
                    if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL1++;
                }
                else
                {
                    subblock++;
                    sboffset  += 4;
                }
                break;
            case SBTYPE_4x8:
                pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
                pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

                pRefIndexL0[0] = RefIxL0;
                pRefIndexL0[4] = RefIxL0;
                if (bIsBSlice)
                {
                    pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                    pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                    pRefIndexL1[0] = RefIxL1;
                    pRefIndexL1[4] = RefIxL1;
                }
                if (subblock == 1)
                {
                    if (block == 4)
                    {
                        sboffset += 8 - 3;
                    }
                    else
                    {
                        sboffset++;
                    }
                    block += 4;
                    subblock = 0;
                    if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL0++;
                    if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL1++;
                }
                else
                {
                    subblock++;
                    sboffset++;
                }
                break;
            case SBTYPE_4x4:
                pMVDeltaL0[0].mvx = (Ipp16s)mvdx_l0;
                pMVDeltaL0[0].mvy = (Ipp16s)mvdy_l0;

                pRefIndexL0[0] = RefIxL0;
                if (bIsBSlice)
                {
                    pMVDeltaL1[0].mvx = (Ipp16s)mvdx_l1;
                    pMVDeltaL1[0].mvy = (Ipp16s)mvdy_l1;

                    pRefIndexL1[0] = RefIxL1;
                }
                sboffset += (xyoff[block+subblock][0]>>2) +
                    ((xyoff[block+subblock][1])>>2)*4;
                if (subblock == 3)
                {
                    block += 4;
                    subblock = 0;
                    if (dirPart == D_DIR_FWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL0++;
                    if (dirPart == D_DIR_BWD || dirPart == D_DIR_BIDIR)
                        dec_refIxL1++;
                }
                else
                {
                    subblock++;
                }
                break;
            case SBTYPE_DIRECT:
                // nothing to do except advance to next 8x8 partition
                if (block == 4)
                {
                    sboffset += 8 - 2;
                }
                else
                {
                    sboffset += 2;
                }
                block += 4;
                break;
            }    // 8x8 switch sbtype
            }

            if (block<16)
                dirPart = m_cur_mb.LocalMacroblockInfo->sbdir[block>>2];        // next partition
            break;
        }    // switch mbtype
    }    // for partCtr

    ReconstructMotionVectors();
    return;
}  // void H264SegmentDecoderMultiThreaded::DecodeMotionVectors_CAVLC(bool bIsBSlice)

void H264SegmentDecoderMultiThreaded::DecodeDirectMotionVectors(bool isDirectMB)
{
    if (m_IsUseSpatialDirectMode)
    {
        //DecodeDirectMotionVectorsSpatial();
        ReconstructDirectMotionVectorsSpatial();
    }   // temporal DIRECT
    else
    {
        // temporal DIRECT prediction
        if (!m_IsUseDirect8x8Inference)
        {
            DecodeDirectMotionVectorsTemporal(isDirectMB);
        }
        else
        {
            DecodeDirectMotionVectorsTemporal_8x8Inference();
        }
    }
}

Status H264SegmentDecoderMultiThreaded::ProcessSlice(Ipp32s iCurMBNumber, Ipp32s &iMBToProcess)
{
    Status umcRes = UMC_OK;
    Ipp32s iFirstMB = iCurMBNumber;
    Ipp32s iMBRowSize = m_pSlice->GetMBRowWidth();
    Ipp32s iMaxMBNumber = iCurMBNumber + iMBToProcess;

    bool bDoDeblocking;
    Ipp32s iFirstMBToDeblock;
    Ipp32s iAvailableMBToDeblock = 0;

     // set deblocking condition
    bDoDeblocking = m_pSlice->GetDeblockingCondition();
    iFirstMBToDeblock = iCurMBNumber;

    m_psBuffer = align_pointer<UMC::CoeffsPtrCommon> (m_pCoefficientsBuffer, DEFAULT_ALIGN_VALUE);

    bit_depth_luma = m_pCurrentFrame->IsAuxiliaryFrame() ? m_pSlice->GetSeqParamEx()->bit_depth_aux :
                                              m_pSeqParamSet->bit_depth_luma;
    bit_depth_chroma = m_pCurrentFrame->IsAuxiliaryFrame() ? 8 : m_pSeqParamSet->bit_depth_chroma;


    // handle a slice group case
    if (m_pSlice->IsSliceGroups())
    {
        // perform decoding on current row(s)
        if (0 == m_pPicParamSet->entropy_coding_mode)
        {
            umcRes = m_SD->DecodeSegmentCAVLC_Single(iFirstMB, iMaxMBNumber, this);
        }
        else
        {
            umcRes = m_SD->DecodeSegmentCABAC_Single(iFirstMB, iMaxMBNumber, this);
        }

        if ((UMC_OK == umcRes) ||
            (UMC_ERR_END_OF_STREAM == umcRes))
            umcRes = UMC_ERR_END_OF_STREAM;

        iMBToProcess = m_CurMBAddr - iCurMBNumber;
        return umcRes;
    }

    // this is a cicle for rows of MBs
    for (; iCurMBNumber < iMaxMBNumber;)
    {
        Ipp32u nBorder;
        Ipp32s iPreCallMBNumber;

        // calculate the last MB in a row
        nBorder = IPP_MIN(iMaxMBNumber,
                      iCurMBNumber -
                      (iCurMBNumber % iMBRowSize) +
                      iMBRowSize);

        // perform the decoding on the current row
        iPreCallMBNumber = iCurMBNumber;

        try
        {
            if (0 == m_pPicParamSet->entropy_coding_mode)
            {
                umcRes = m_SD->DecodeSegmentCAVLC_Single(iCurMBNumber, nBorder, this);
            }
            else
            {
                umcRes = m_SD->DecodeSegmentCABAC_Single(iCurMBNumber, nBorder, this);
            }
        } catch(...)
        {
            iMBToProcess = m_CurMBAddr - iFirstMB;
            throw;
        }

        // sum count of MB to deblock
        iAvailableMBToDeblock += nBorder - iPreCallMBNumber;
        // check error(s)
        if ((UMC_OK != umcRes) ||
            (m_CurMBAddr >= iMaxMBNumber))
            break;

        // correct the MB number in a MBAFF case
        iCurMBNumber = iPreCallMBNumber -
                       (iPreCallMBNumber % iMBRowSize) +
                       iMBRowSize;

        // perform a deblocking on previous row(s)
        if (iCurMBNumber < iMaxMBNumber)
        {
            if ((bDoDeblocking) &&
                (iMBRowSize < iAvailableMBToDeblock))
            {
                Ipp32s iToDeblock = iAvailableMBToDeblock - iMBRowSize;

                DeblockSegmentTask(iFirstMBToDeblock, iToDeblock);
                iFirstMBToDeblock += iToDeblock;
                iAvailableMBToDeblock -= iToDeblock;
            }
        }
    }

    if ((UMC_OK == umcRes) ||
        (UMC_ERR_END_OF_STREAM == umcRes))
    {
        iMBToProcess = m_CurMBAddr - iFirstMB;

        // perform deblocking of remain MBs
        if (bDoDeblocking)
            DeblockSegmentTask(iFirstMBToDeblock, iAvailableMBToDeblock);

        // in any case it is end of slice
        umcRes = UMC_ERR_END_OF_STREAM;
    }

    return umcRes;
}


SegmentDecoderHPBase* H264SegmentDecoderMultiThreaded::CreateSegmentDecoder()
{
    return CreateSD(
        bit_depth_luma,
        bit_depth_chroma,
        m_pCurrentFrame->m_PictureStructureForDec < FRM_STRUCTURE,
        m_pCurrentFrame->m_chroma_format,
        100 <= m_pSeqParamSet->profile_idc);
}

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
