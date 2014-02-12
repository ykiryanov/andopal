/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#include "ippi.h"
#include "umc_h264_frame.h"
#include "umc_h264_task_supplier.h"

#include "umc_h264_log.h"

namespace UMC
{

H264DecoderFrame::H264DecoderFrame(MemoryAllocator *pMemoryAllocator)
    : H264DecYUVWorkSpace(pMemoryAllocator)
    , m_pPreviousFrame(0)
    , m_pFutureFrame(0)
    , m_wasOutputted(false)
    , m_isDisplayable(false)
    , m_dFrameTime(-1.0)
    , post_procces_complete(false)
    , m_index(-1)
    , m_UID(-1)
    , m_pSlicesInfo(0)
    , m_pSlicesInfoBottom(0)
    , m_TopSliceCount(0)
    , m_ErrorType(0)
{
    m_isShortTermRef[0] = m_isShortTermRef[1] = false;
    m_isLongTermRef[0] = m_isLongTermRef[1] = false;
    m_FrameNumWrap = m_FrameNum  = -1;
    m_LongTermFrameIdx = -1;
    m_RefPicListResetCount[0] = m_RefPicListResetCount[1] = 0;
    m_PicNum[0] = m_PicNum[1] = -1;
    m_LongTermPicNum[0] = m_PicNum[1] = -1;
    m_PicOrderCnt[0] = m_PicOrderCnt[1] = 0;
    m_bIDRFlag = false;

    // set memory managment tools
    m_pMemoryAllocator = pMemoryAllocator;
    m_midParsedFrameDataNew = 0;
    m_pParsedFrameDataNew = 0;
    m_paddedParsedFrameDataSize.width = 0;
    m_paddedParsedFrameDataSize.height = 0;

    SetBusyState(0);

    m_pSlicesInfo = new H264DecoderFrameInfo(this);
    m_pSlicesInfoBottom = new H264DecoderFrameInfo(this);
}

void H264DecoderFrame::Reset()
{
    m_TopSliceCount = 0;

    if (m_pSlicesInfo)
    {
        m_pSlicesInfo->Reset();
        m_pSlicesInfoBottom->Reset();
    }

    SetBusyState(0);
    m_isShortTermRef[0] = m_isShortTermRef[1] = false;
    m_isLongTermRef[0] = m_isLongTermRef[1] = false;

    post_procces_complete = false;
    m_bIDRFlag = false;

    m_RefPicListResetCount[0] = m_RefPicListResetCount[1] = 0;
    m_PicNum[0] = m_PicNum[1] = -1;
    m_LongTermPicNum[0] = m_LongTermPicNum[1] = -1;
    m_PicOrderCnt[0] = m_PicOrderCnt[1] = 0;

    m_bottom_field_flag[0] = m_bottom_field_flag[1] = -1;

    m_dFrameTime = -1;
    m_IsFrameExist = false;
    m_iNumberOfSlices = 0;

    m_NotifiersChain.Reset();
    m_UserData.Reset();

    m_ErrorType = 0;
    m_UID = -1;
}

void H264DecoderFrame::FreeResources()
{
    if (m_pSlicesInfo && (GetBusyState() < 2))
    {
        m_pSlicesInfo->Reset();
        m_pSlicesInfoBottom->Reset();
    }
}

void H264DecoderFrame::OnDecodingCompleted()
{
#ifdef ENABLE_LOGGING
    if (g_H264_Logging)
    {
        g_H264_Logging->LogFrame(this);
    }
#endif

    GetNotifiersChain()->Notify();
    SetisDisplayable();
}

void H264DecoderFrame::DecrementBusyState()
{
    m_BusyState--;
    VM_ASSERT(m_BusyState >= 0);
}

void H264DecoderFrame::DefaultFill(Ipp32s field, bool isChromaOnly)
{
    IppiSize roi;
    Ipp8u defaultValue = 128;

    if (field == 2)
    {
        if (!isChromaOnly)
        {
            roi = m_lumaSize;

            SetPlane(defaultValue, m_pYPlane,
                pitch_luma(), roi);
        }

        roi = m_chromaSize;

        SetPlane(defaultValue, m_pUPlane,
            pitch_chroma(), roi);
        SetPlane(defaultValue, m_pVPlane,
            pitch_chroma(), roi);
    }
    else
    {
        if (!isChromaOnly)
        {
            roi = m_lumaSize;
            roi.height >>= 1;

            SetPlane(defaultValue, m_pYPlane + field*pitch_luma(),
                2*pitch_luma(), roi);
        }

        roi = m_chromaSize;
        roi.height >>= 1;

        SetPlane(defaultValue, m_pUPlane + field*pitch_chroma(),
            2*pitch_chroma(), roi);
        SetPlane(defaultValue, m_pVPlane + field*pitch_chroma(),
            2*pitch_chroma(), roi);
    }
}

void H264DecoderFrame::deallocateParsedFrameData()
{
    m_pRefPicListTop.Reset();
    m_pRefPicListBottom.Reset();

    // new structure(s) hold pointer
    if (m_pParsedFrameDataNew)
    {
        // Free the old buffer.
        m_pMemoryAllocator->Unlock(m_midParsedFrameDataNew);
        m_pMemoryAllocator->Free(m_midParsedFrameDataNew);
        m_midParsedFrameDataNew = 0;
        m_pParsedFrameDataNew = 0;

        m_mbinfo.MV[0] = 0;
        m_mbinfo.MV[1] = 0;
        m_mbinfo.RefIdxs[0] = 0;
        m_mbinfo.RefIdxs[1] = 0;
        m_mbinfo.mbs = 0;
    }

    m_paddedParsedFrameDataSize.width = 0;
    m_paddedParsedFrameDataSize.height = 0;

}    // deallocateParsedFrameData

Status H264DecoderFrame::allocateParsedFrameData(const IppiSize &size, Ipp32s bpp)
{
    Status      umcRes = UMC_OK;
    IppiSize    desiredPaddedSize;

    m_pRefPicListTop.Init(1);
    m_pRefPicListBottom.Init(1);

    desiredPaddedSize.width  = (size.width  + 15) & ~15;
    desiredPaddedSize.height = (size.height + 15) & ~15;

    // If our buffer and internal pointers are already set up for this
    // image size, then there's nothing more to do.

    if (m_paddedParsedFrameDataSize.width != desiredPaddedSize.width ||
        m_paddedParsedFrameDataSize.height != desiredPaddedSize.height || m_bpp != bpp)
    {
        // deallocate the previously allocated data
        deallocateParsedFrameData();

        // allocate new MB structure(s)
        size_t nMBCount = (desiredPaddedSize.width>>4) * (desiredPaddedSize.height>>4);

        // allocate buffer
        size_t nMemSize = (sizeof(H264DecoderMacroblockMVs) +
                           sizeof(H264DecoderMacroblockMVs) +
                           sizeof(H264DecoderMacroblockRefIdxs) +
                           sizeof(H264DecoderMacroblockRefIdxs) +
                           sizeof(H264DecoderMacroblockGlobalInfo)) * nMBCount + 16 * 5;

        // allocate buffer
        if (UMC_OK != m_pMemoryAllocator->Alloc(&m_midParsedFrameDataNew,
                                                nMemSize,
                                                UMC_ALLOC_PERSISTENT))
            return UMC_ERR_ALLOC;
        m_pParsedFrameDataNew = (Ipp8u *) m_pMemoryAllocator->Lock(m_midParsedFrameDataNew);

        XippsZero_8u(m_pParsedFrameDataNew, (Ipp32s) nMemSize);

        // set pointer(s)
        m_mbinfo.MV[0] = align_pointer<H264DecoderMacroblockMVs *> (m_pParsedFrameDataNew, ALIGN_VALUE);
        m_mbinfo.MV[1] = align_pointer<H264DecoderMacroblockMVs *> (m_mbinfo.MV[0]+ nMBCount, ALIGN_VALUE);
        m_mbinfo.RefIdxs[0] = align_pointer<H264DecoderMacroblockRefIdxs *> (m_mbinfo.MV[1] + nMBCount, ALIGN_VALUE);
        m_mbinfo.RefIdxs[1] = align_pointer<H264DecoderMacroblockRefIdxs *> (m_mbinfo.RefIdxs[0] + nMBCount, ALIGN_VALUE);
        m_mbinfo.mbs = align_pointer<H264DecoderMacroblockGlobalInfo *> (m_mbinfo.RefIdxs[1] + nMBCount, ALIGN_VALUE);

        m_paddedParsedFrameDataSize.width = desiredPaddedSize.width;
        m_paddedParsedFrameDataSize.height = desiredPaddedSize.height;
    }

    return umcRes;

} // H264DecoderFrame::allocateParsedFrameData(const IppiSize &size)

H264DecoderFrame::~H264DecoderFrame()
{
    if (m_pSlicesInfo)
    {
        delete m_pSlicesInfo;
        delete m_pSlicesInfoBottom;
        m_pSlicesInfo = 0;
        m_pSlicesInfoBottom = 0;
    }

    // Just to be safe.
    m_pPreviousFrame = 0;
    m_pFutureFrame = 0;
    Reset();
    deallocateParsedFrameData();
}

Status H264DecoderFrame::allocate(const IppiSize &lumaSize,Ipp32s bpp,Ipp32s chroma_format)
{
    Status      umcRes = UMC_OK;

    // Clear our state, since allocate is called when we are about
    // to decode into this frame buffer.

    post_procces_complete = false;
    m_wasOutputted = false;
    m_isDisplayable = false;
    m_dimensions = lumaSize;

    // Don't reset m_activeReference as these are handled
    // depending on frame type or by the calling application, respectively

    umcRes = allocateParsedFrameData(lumaSize, bpp);
    if (umcRes == UMC_OK)
        umcRes = H264DecYUVWorkSpace::allocate(lumaSize, bpp,chroma_format);

    return umcRes;
}

H264DecoderFrame::H264H264DecoderRefPicListStruct* H264DecoderFrame::GetRefPicList(Ipp32s sliceNumber, Ipp32s list)
{
    H264DecoderFrame::H264H264DecoderRefPicListStruct *pList;

    if (sliceNumber > m_TopSliceCount)
    {
        pList = &(m_pRefPicListBottom[sliceNumber - m_TopSliceCount]->m_RefPicList[list]);
    }
    else
    {
        pList = &(m_pRefPicListTop[sliceNumber]->m_RefPicList[list]);
    }

    return pList;
}   // RefPicList. Returns pointer to start of specified ref pic list.

const H264DecoderFrame::H264H264DecoderRefPicListStruct* H264DecoderFrame::GetRefPicList(Ipp32s sliceNumber, Ipp32s list) const
{
    const H264DecoderFrame::H264H264DecoderRefPicListStruct *pList;

    if (sliceNumber > m_TopSliceCount)
    {
        pList = &(m_pRefPicListBottom[sliceNumber - m_TopSliceCount]->m_RefPicList[list]);
    }
    else
    {
        pList = &(m_pRefPicListTop[sliceNumber]->m_RefPicList[list]);
    }

    return pList;
}

void H264DecoderFrame::SetExternalPointers(
    const IppiSize &lumaSize,
    Ipp32s bpp,
    Ipp32s chroma_format,
    PlanePtrYCommon   pYPlane,
    Ipp32s      pitch_luma,
    PlanePtrUVCommon  pUPlane,
    PlanePtrUVCommon  pVPlane,
    Ipp32s      pitch_chroma)
{
    m_pYPlane       = pYPlane;
    m_pitch_luma    = pitch_luma;
    m_pUPlane       = pUPlane;
    m_pVPlane       = pVPlane;
    m_pitch_chroma  = pitch_chroma;

    // allocate
    IppiSize paddedSize;

    paddedSize.width  = (lumaSize.width  + 15) & ~15;
    paddedSize.height = (lumaSize.height + 15) & ~15;

    clearState();

    m_bpp = bpp;
    m_chroma_format = chroma_format;

    if (m_pAllocatedBuffer)
    {
        m_pMemoryAllocator->Unlock(m_midAllocatedBuffer);
        m_pMemoryAllocator->Free(m_midAllocatedBuffer);
        m_pAllocatedBuffer = 0;
        m_midAllocatedBuffer = 0;
    }

    m_pAllocatedBuffer = 0;
    m_allocatedSize = 0;

    m_lumaSize = lumaSize;
    m_chromaSize.width = lumaSize.width >> ((Ipp32s) (3 > chroma_format));
    m_chromaSize.height = lumaSize.height >> ((Ipp32s) (2 > chroma_format));

    m_macroBlockSize.width  = paddedSize.width  >> 4;
    m_macroBlockSize.height = paddedSize.height >> 4;

    m_is_external_memory = true;
}


//////////////////////////////////////////////////////////////////////////////
// updateFrameNumWrap
//  Updates m_FrameNumWrap and m_PicNum if the frame is a short-term
//  reference and a frame number wrap has occurred.
//////////////////////////////////////////////////////////////////////////////
void H264DecoderFrame::UpdateFrameNumWrap(Ipp32s  CurrFrameNum, Ipp32s  MaxFrameNum, Ipp32s CurrPicStruct)
{
    if (isShortTermRef())
    {
        m_FrameNumWrap = m_FrameNum;
        if (m_FrameNum > CurrFrameNum)
            m_FrameNumWrap -= MaxFrameNum;
        if (CurrPicStruct >= FRM_STRUCTURE)
        {
            setPicNum(m_FrameNumWrap, 0);
            setPicNum(m_FrameNumWrap, 1);
            m_PictureStructureForRef = FRM_STRUCTURE;
        }
        else
        {
            m_PictureStructureForRef = FLD_STRUCTURE;
            if (m_bottom_field_flag[0])
            {
                //1st - bottom, 2nd - top
                if (isShortTermRef(0)) setPicNum((2*m_FrameNumWrap) + (CurrPicStruct == BOTTOM_FLD_STRUCTURE), 0);
                if (isShortTermRef(1)) setPicNum((2*m_FrameNumWrap) + (CurrPicStruct == TOP_FLD_STRUCTURE), 1);
            }
            else
            {
                //1st - top , 2nd - bottom
                if (isShortTermRef(0)) setPicNum((2*m_FrameNumWrap) + (CurrPicStruct == TOP_FLD_STRUCTURE), 0);
                if (isShortTermRef(1)) setPicNum((2*m_FrameNumWrap) + (CurrPicStruct == BOTTOM_FLD_STRUCTURE), 1);
            }
        }
    }

}    // updateFrameNumWrap

//////////////////////////////////////////////////////////////////////////////
// updateLongTermPicNum
//  Updates m_LongTermPicNum for if long term reference, based upon
//  m_LongTermFrameIdx.
//////////////////////////////////////////////////////////////////////////////
void H264DecoderFrame::UpdateLongTermPicNum(Ipp32s CurrPicStruct)
{
    if (isLongTermRef())
    {
        if (CurrPicStruct >= FRM_STRUCTURE)
        {
            m_LongTermPicNum[0] = m_LongTermFrameIdx;
            m_LongTermPicNum[1] = m_LongTermFrameIdx;
            m_PictureStructureForRef = FRM_STRUCTURE;
        }
        else
        {
            m_PictureStructureForRef = FLD_STRUCTURE;
            if (m_bottom_field_flag[0])
            {
                //1st - bottom, 2nd - top
                m_LongTermPicNum[0] = 2*m_LongTermFrameIdx + (CurrPicStruct == BOTTOM_FLD_STRUCTURE);
                m_LongTermPicNum[1] = 2*m_LongTermFrameIdx + (CurrPicStruct == TOP_FLD_STRUCTURE);
            }
            else
            {
                //1st - top , 2nd - bottom
                m_LongTermPicNum[0] = 2*m_LongTermFrameIdx + (CurrPicStruct == TOP_FLD_STRUCTURE);
                m_LongTermPicNum[1] = 2*m_LongTermFrameIdx + (CurrPicStruct == BOTTOM_FLD_STRUCTURE);
            }
        }
    }
}    // updateLongTermPicNum



//////////////////////////////////////////////////////////////////////////////
//  H264DecoderFrameExtension class implementation
//////////////////////////////////////////////////////////////////////////////
H264DecoderFrameExtension::H264DecoderFrameExtension(MemoryAllocator *pMemoryAllocator)
    : H264DecoderFrame(pMemoryAllocator)
    , m_pAuxiliaryFrame(0)
{
    is_auxiliary_frame = false;
    primary_picture = 0;
}

H264DecoderFrameExtension::~H264DecoderFrameExtension()
{
    delete m_pAuxiliaryFrame;
}

H264DecoderFrame * H264DecoderFrameExtension::GetAuxiliaryFrame()
{
    return m_pAuxiliaryFrame;
}

void H264DecoderFrameExtension::AllocateAuxiliary()
{
    if (m_pAuxiliaryFrame)
        return;

    m_pAuxiliaryFrame = new H264DecoderFrame(m_pMemoryAllocator);

    if (!m_pAuxiliaryFrame)
    {
        VM_ASSERT(false);
    }

    m_pAuxiliaryFrame->primary_picture = this;
    m_pAuxiliaryFrame->is_auxiliary_frame = true;
}

void H264DecoderFrameExtension::FillInfoToAuxiliary()
{
    if (!m_pAuxiliaryFrame)
        return;

    m_pAuxiliaryFrame->m_bIDRFlag = m_bIDRFlag;
    m_pAuxiliaryFrame->m_PicNum[0] = m_PicNum[0];
    m_pAuxiliaryFrame->m_PicNum[1] = m_PicNum[1];
    m_pAuxiliaryFrame->m_LongTermPicNum[0] = m_LongTermPicNum[0];
    m_pAuxiliaryFrame->m_LongTermPicNum[1] = m_LongTermPicNum[1];
    m_pAuxiliaryFrame->m_FrameNum = m_FrameNum;
    m_pAuxiliaryFrame->m_FrameNumWrap = m_FrameNumWrap;
    m_pAuxiliaryFrame->m_LongTermFrameIdx = m_LongTermFrameIdx;
    m_pAuxiliaryFrame->m_RefPicListResetCount[0] = m_RefPicListResetCount[0];
    m_pAuxiliaryFrame->m_RefPicListResetCount[1] = m_RefPicListResetCount[1];
    m_pAuxiliaryFrame->m_PicOrderCnt[0] = m_PicOrderCnt[0];
    m_pAuxiliaryFrame->m_PicOrderCnt[1] = m_PicOrderCnt[1];
    m_pAuxiliaryFrame->m_isShortTermRef[0] = m_isShortTermRef[0];
    m_pAuxiliaryFrame->m_isShortTermRef[1] = m_isShortTermRef[1];
    m_pAuxiliaryFrame->m_isLongTermRef[0] = m_isLongTermRef[0];
    m_pAuxiliaryFrame->m_isLongTermRef[1] = m_isLongTermRef[1];
    m_pAuxiliaryFrame->m_dFrameTime = m_dFrameTime;

    m_pAuxiliaryFrame->setPrevious(UMC::GetAuxiliaryFrame(m_pPreviousFrame));
    m_pAuxiliaryFrame->setFuture(UMC::GetAuxiliaryFrame(m_pFutureFrame));
}

} // end namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
