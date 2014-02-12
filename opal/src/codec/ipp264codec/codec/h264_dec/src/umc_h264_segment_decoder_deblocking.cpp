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

#include "umc_h264_segment_decoder.h"
#include "umc_h264_dec_deblocking.h"


#include "umc_h264_frame_info.h"


namespace UMC
{
// initialize const array
H264SegmentDecoder::ChromaDeblockingFunction H264SegmentDecoder::DeblockChroma[4];
H264SegmentDecoder::ChromaDeblockingFunctionMBAFF H264SegmentDecoder::DeblockChromaVerticalMBAFF[4];
H264SegmentDecoder::ChromaDeblockingFunctionMBAFF H264SegmentDecoder::DeblockChromaHorizontalMBAFF[4];

void H264SegmentDecoder::DeblockInitialize()
{
    // fill static table (sometimes it isn't initialized)
    DeblockChroma[0] = &H264SegmentDecoder::DeblockChroma400;
    DeblockChroma[1] = &H264SegmentDecoder::DeblockChroma420;
    DeblockChroma[2] = &H264SegmentDecoder::DeblockChroma422;
    DeblockChroma[3] = &H264SegmentDecoder::DeblockChroma444;

    DeblockChromaVerticalMBAFF[0] = &H264SegmentDecoder::DeblockChromaVerticalMBAFF400;
    DeblockChromaVerticalMBAFF[1] = &H264SegmentDecoder::DeblockChromaVerticalMBAFF420;
    DeblockChromaVerticalMBAFF[2] = &H264SegmentDecoder::DeblockChromaVerticalMBAFF422;
    DeblockChromaVerticalMBAFF[3] = &H264SegmentDecoder::DeblockChromaVerticalMBAFF444;

    DeblockChromaHorizontalMBAFF[0] = &H264SegmentDecoder::DeblockChromaHorizontalMBAFF400;
    DeblockChromaHorizontalMBAFF[1] = &H264SegmentDecoder::DeblockChromaHorizontalMBAFF420;
    DeblockChromaHorizontalMBAFF[2] = &H264SegmentDecoder::DeblockChromaHorizontalMBAFF422;
    DeblockChromaHorizontalMBAFF[3] = &H264SegmentDecoder::DeblockChromaHorizontalMBAFF444;

    IppDeblocking[0] = &(FilterDeblockingLuma_VerEdge);
    IppDeblocking[1] = &(FilterDeblockingLuma_HorEdge);
    IppDeblocking[2] = &(FilterDeblockingChroma_VerEdge);
    IppDeblocking[3] = &(FilterDeblockingChroma_HorEdge);
    IppDeblocking[4] = &(FilterDeblockingChroma422_VerEdge);
    IppDeblocking[5] = &(FilterDeblockingChroma422_HorEdge);
    IppDeblocking[6] = &(FilterDeblockingChroma444_VerEdge);
    IppDeblocking[7] = &(FilterDeblockingChroma444_HorEdge);

    IppDeblocking16u[0] = &(FilterDeblockingLuma_VerEdge);
    IppDeblocking16u[1] = &(FilterDeblockingLuma_HorEdge);
    IppDeblocking16u[2] = &(FilterDeblockingChroma_VerEdge);
    IppDeblocking16u[3] = &(FilterDeblockingChroma_HorEdge);
    IppDeblocking16u[4] = &(FilterDeblockingChroma422_VerEdge);
    IppDeblocking16u[5] = &(FilterDeblockingChroma422_HorEdge);
    IppDeblocking16u[6] = &(FilterDeblockingChroma444_VerEdge);
    IppDeblocking16u[7] = &(FilterDeblockingChroma444_HorEdge);
}

void H264SegmentDecoder::DeblockFrame(Ipp32s iFirstMB, Ipp32s iNumMBs)
{
    Ipp32s i;

    m_bFrameDeblocking = true;

    for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
        DeblockMacroblockMSlice(i);

} // void H264SegmentDecoder::DeblockFrame(Ipp32s uFirstMB, Ipp32s uNumMBs)

void H264SegmentDecoder::DeblockSegment(Ipp32s iFirstMB, Ipp32s iNumMBs)
{
    Ipp32s i;

    // no filtering edges of this slice
    if (DEBLOCK_FILTER_OFF == m_pSliceHeader->disable_deblocking_filter_idc)
        return;

    // set frame deblocking flag
    m_bFrameDeblocking = false;

    // MBAFF case
    if (m_pSliceHeader->MbaffFrameFlag)
    {
        // select optimized deblocking function
        switch (m_pSliceHeader->slice_type)
        {
        case INTRASLICE:
            for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
                DeblockMacroblockISliceMBAFF(i);
            break;

        case PREDSLICE:
            for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
                DeblockMacroblockPSliceMBAFF(i);
            break;

        case BPREDSLICE:
            for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
                DeblockMacroblockBSliceMBAFF(i);
            break;

        default:
            VM_ASSERT(false);
            break;
        }
    }
    // non-MBAFF case
    else
    {
        // select optimized deblocking function
        switch (m_pSliceHeader->slice_type)
        {
        case INTRASLICE:
            for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
                DeblockMacroblockISlice(i);
            break;

        case PREDSLICE:
            for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
                DeblockMacroblockPSlice(i);
            break;

        case BPREDSLICE:
            for (i = iFirstMB; i < iFirstMB + iNumMBs; i++)
                DeblockMacroblockBSlice(i);
            break;

        default:
            VM_ASSERT(false);
            break;
        }
    }
} // void H264SegmentDecoder::DeblockSegment(Ipp32s iFirstMB, Ipp32s iNumMBs)

void H264SegmentDecoder::DeblockMacroblockMSlice(Ipp32s MBAddr)
{
    H264Slice* pSlice = m_pCurrentFrame->GetAU(m_field_index)->GetSliceByNumber(m_gmbinfo->mbs[MBAddr].slice_id);

    // when deblocking isn't required
    if ((NULL == pSlice) ||
        (DEBLOCK_FILTER_OFF == pSlice->GetSliceHeader()->disable_deblocking_filter_idc))
        return;

    // select optimized deblocking function
    switch (pSlice->GetSliceHeader()->slice_type)
    {
    case INTRASLICE:
        DeblockMacroblockISlice(MBAddr);
        break;

    case PREDSLICE:
        DeblockMacroblockPSlice(MBAddr);
        break;

    case BPREDSLICE:
        DeblockMacroblockBSlice(MBAddr);
        break;

    default:
        // illegal case. it should never hapen.
        VM_ASSERT(false);
        break;
    }

} // void H264SegmentDecoder::DeblockMacroblockMSlice(Ipp32s MBAddr)

void H264SegmentDecoder::DeblockMacroblockISlice(Ipp32s MBAddr)
{
    __align(16)
    DeblockingParameters params;

    // prepare deblocking parameters
    params.nMBAddr = MBAddr;
    ResetDeblockingVariables(&params);
    PrepareDeblockingParametersISlice(&params);

    {
        Ipp32u color_format = m_pCurrentFrame->m_chroma_format;

        (this->*DeblockChroma[color_format])(VERTICAL_DEBLOCKING, &params);
        (this->*DeblockChroma[color_format])(HORIZONTAL_DEBLOCKING, &params);
    }

    // perform deblocking
    DeblockLuma(VERTICAL_DEBLOCKING, &params);
    DeblockLuma(HORIZONTAL_DEBLOCKING, &params);

} // void H264SegmentDecoder::DeblockMacroblockISlice(Ipp32s MBAddr)

void H264SegmentDecoder::DeblockMacroblockPSlice(Ipp32s MBAddr)
{
    DeblockMacroblockBSlice(MBAddr);
    return;

#if 0
    __align(16)
    DeblockingParameters params;

    // prepare deblocking parameters
    params.nMBAddr = MBAddr;
    ResetDeblockingVariables(&params);
    PrepareDeblockingParametersPSlice(&params);

    {
        Ipp32u color_format = m_pCurrentFrame->m_chroma_format;

        (this->*DeblockChroma[color_format])(VERTICAL_DEBLOCKING, &params);
        (this->*DeblockChroma[color_format])(HORIZONTAL_DEBLOCKING, &params);
    }

    // perform deblocking
    DeblockLuma(VERTICAL_DEBLOCKING, &params);
    DeblockLuma(HORIZONTAL_DEBLOCKING, &params);
#endif
} // void H264SegmentDecoder::DeblockMacroblockPSlice(Ipp32u MBAddr)

void H264SegmentDecoder::DeblockMacroblockBSlice(Ipp32s MBAddr)
{
    __align(16)
    DeblockingParameters params;

    // prepare deblocking parameters
    params.nMBAddr = MBAddr;
    ResetDeblockingVariables(&params);
    PrepareDeblockingParametersBSlice(&params);

    {
        Ipp32u color_format = m_pCurrentFrame->m_chroma_format;

        (this->*DeblockChroma[color_format])(VERTICAL_DEBLOCKING, &params);
        (this->*DeblockChroma[color_format])(HORIZONTAL_DEBLOCKING, &params);
    }

    // perform deblocking
    DeblockLuma(VERTICAL_DEBLOCKING, &params);
    DeblockLuma(HORIZONTAL_DEBLOCKING, &params);

} // void H264SegmentDecoder::DeblockMacroblockBSlice(Ipp32s MBAddr)

void H264SegmentDecoder::DeblockLuma(Ipp32u dir, DeblockingParameters *pParams)
{
    PlanePtrYCommon   pY = pParams->pLuma;
    Ipp32s pic_pitch = pParams->pitch_luma;
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp8u Clipping[16];
    Ipp8u Alpha[2];
    Ipp8u Beta[2];
    Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
    Ipp32s BetaOffset = pParams->nBetaOffset;
    Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;

    //
    // luma deblocking
    //

    if (pParams->DeblockingFlag[dir])
    {
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->Strength[dir];
        //
        // correct strengths for high profile
        //
        if (GetMB8x8TSFlag(m_gmbinfo->mbs[MBAddr]))
        {
            SetEdgeStrength(pStrength + 4, 0);
            SetEdgeStrength(pStrength + 12, 0);
        }

        if (pParams->ExternalEdgeFlag[dir])
        {
            Ipp32s pmp_QP;

            // get neighbour block QP
            pmp_QP = m_mbinfo.mbs[pParams->nNeighbour[dir]].QP;

            // luma variables
            QP = (pmp_QP + pmq_QP + 1) >> 1 ;

            // external edge variables
            index = IClip(0, 51, QP + BetaOffset);
            Beta[0] = (Ipp8u) (BETA_TABLE[index]);

            index = IClip(0, 51, QP + AlphaC0Offset);
            Alpha[0] = (Ipp8u) (ALPHA_TABLE[index]);
            pClipTab = CLIP_TAB[index];

            // create clipping values
            Clipping[0] = (Ipp8u) (pClipTab[pStrength[0]]);
            Clipping[1] = (Ipp8u) (pClipTab[pStrength[1]]);
            Clipping[2] = (Ipp8u) (pClipTab[pStrength[2]]);
            Clipping[3] = (Ipp8u) (pClipTab[pStrength[3]]);

        }

        // internal edge variables
        QP = pmq_QP;

        index = IClip(0, 51, QP + BetaOffset);
        Beta[1] = (Ipp8u) (BETA_TABLE[index]);

        index = IClip(0, 51, QP + AlphaC0Offset);
        Alpha[1] = (Ipp8u) (ALPHA_TABLE[index]);
        pClipTab = CLIP_TAB[index];

        // create clipping values
        {
            Ipp32s edge;

            for (edge = 1;edge < 4;edge += 1)
            {
                if (*((Ipp32u *) (pStrength + edge * 4)))
                {
                    // create clipping values
                    Clipping[edge * 4 + 0] = (Ipp8u) (pClipTab[pStrength[edge * 4 + 0]]);
                    Clipping[edge * 4 + 1] = (Ipp8u) (pClipTab[pStrength[edge * 4 + 1]]);
                    Clipping[edge * 4 + 2] = (Ipp8u) (pClipTab[pStrength[edge * 4 + 2]]);
                    Clipping[edge * 4 + 3] = (Ipp8u) (pClipTab[pStrength[edge * 4 + 3]]);
                }
            }
        }

        if (pParams->bitDepthLuma > 8)
        {
            IppDeblocking16u[dir]((Ipp16u*)pY,
                                  pic_pitch,
                                  Alpha,
                                  Beta,
                                  Clipping,
                                  pStrength,
                                  pParams->bitDepthLuma);
        }
        else
        {
            IppDeblocking[dir](pY,
                               pic_pitch,
                               Alpha,
                               Beta,
                               Clipping,
                               pStrength,
                               pParams->bitDepthLuma);
        }
    }

} // void H264SegmentDecoder::DeblockLuma(Ipp32u dir, DeblockingParameters *pParams)

void H264SegmentDecoder::DeblockChroma400(Ipp32u, DeblockingParameters *)
{
    // there is nothing to deblock

} // void H264SegmentDecoder::DeblockChroma400(Ipp32u, DeblockingParameters *)

void H264SegmentDecoder::DeblockChroma420(Ipp32u dir, DeblockingParameters *pParams)
{
    if (pParams->DeblockingFlag[dir])
    {
        Ipp32s pic_pitch = pParams->pitch_chroma;
        Ipp32s MBAddr = pParams->nMBAddr;
        Ipp8u Clipping[16];
        Ipp8u Alpha[2];
        Ipp8u Beta[2];
        Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
        Ipp32s BetaOffset = pParams->nBetaOffset;
        Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->Strength[dir];
        Ipp32s nPlane;
        Ipp32s chroma_qp_offset = ~(m_pPicParamSet->chroma_qp_index_offset[0]);

        for (nPlane = 0; nPlane < 2; nPlane += 1)
        {
            if (chroma_qp_offset != m_pPicParamSet->chroma_qp_index_offset[nPlane])
            {
                chroma_qp_offset = m_pPicParamSet->chroma_qp_index_offset[nPlane];

                if (pParams->ExternalEdgeFlag[dir])
                {
                    Ipp32s pmp_QP;

                    // get left block QP
                    pmp_QP = m_mbinfo.mbs[pParams->nNeighbour[dir]].QP;

                    // external edge variables
                    QP = (QP_SCALE_CR[IClip(0, 51, pmp_QP + chroma_qp_offset)] +
                          QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)] + 1) >> 1;

                    index = IClip(0, 51, QP + BetaOffset);
                    Beta[0] = (Ipp8u) (BETA_TABLE[index]);

                    index = IClip(0, 51, QP + AlphaC0Offset);
                    Alpha[0] = (Ipp8u) (ALPHA_TABLE[index]);
                    pClipTab = CLIP_TAB[index];

                    // create clipping values
                    Clipping[0] = (Ipp8u) (pClipTab[pStrength[0]]);
                    Clipping[1] = (Ipp8u) (pClipTab[pStrength[1]]);
                    Clipping[2] = (Ipp8u) (pClipTab[pStrength[2]]);
                    Clipping[3] = (Ipp8u) (pClipTab[pStrength[3]]);

                }

                // internal edge variables
                QP = QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)];

                index = IClip(0, 51, QP + BetaOffset);
                Beta[1] = (Ipp8u) (BETA_TABLE[index]);

                index = IClip(0, 51, QP + AlphaC0Offset);
                Alpha[1] = (Ipp8u) (ALPHA_TABLE[index]);
                pClipTab = CLIP_TAB[index];

                // create clipping values
                Clipping[4] = (Ipp8u) (pClipTab[pStrength[8]]);
                Clipping[5] = (Ipp8u) (pClipTab[pStrength[9]]);
                Clipping[6] = (Ipp8u) (pClipTab[pStrength[10]]);
                Clipping[7] = (Ipp8u) (pClipTab[pStrength[11]]);
            }

            if (pParams->bitDepthChroma > 8)
            {
                IppDeblocking16u[2 + dir]((Ipp16u*)pParams->pChroma[nPlane],
                                          pic_pitch,
                                          Alpha,
                                          Beta,
                                          Clipping,
                                          pStrength,
                                          pParams->bitDepthChroma);
            }
            else
            {
                IppDeblocking[2 + dir](pParams->pChroma[nPlane],
                                       pic_pitch,
                                       Alpha,
                                       Beta,
                                       Clipping,
                                       pStrength,
                                       pParams->bitDepthChroma);
            }
        }
    }

} // void H264SegmentDecoder::DeblockChroma420(Ipp32u dir, DeblockingParameters *pParams)

void H264SegmentDecoder::DeblockChroma422(Ipp32u dir, DeblockingParameters *pParams)
{
    if (pParams->DeblockingFlag[dir])
    {
        Ipp32s pic_pitch = pParams->pitch_chroma;
        Ipp32s MBAddr = pParams->nMBAddr;
        Ipp8u Clipping[16];
        Ipp8u Alpha[2];
        Ipp8u Beta[2];
        Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
        Ipp32s BetaOffset = pParams->nBetaOffset;
        Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->Strength[dir];
        Ipp32s nPlane;
        Ipp32s chroma_qp_offset = ~(m_pPicParamSet->chroma_qp_index_offset[0]);

        for (nPlane = 0; nPlane < 2; nPlane += 1)
        {
            if (chroma_qp_offset != m_pPicParamSet->chroma_qp_index_offset[nPlane])
            {
                chroma_qp_offset = m_pPicParamSet->chroma_qp_index_offset[nPlane];

                if (pParams->ExternalEdgeFlag[dir])
                {
                    Ipp32s pmp_QP;

                    // get left block QP
                    pmp_QP = m_mbinfo.mbs[pParams->nNeighbour[dir]].QP;

                    // external edge variables
                    QP = (QP_SCALE_CR[IClip(0, 51, pmp_QP + chroma_qp_offset)] +
                          QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)] + 1) >> 1;

                    index = IClip(0, 51, QP + BetaOffset);
                    Beta[0] = (Ipp8u) (BETA_TABLE[index]);

                    index = IClip(0, 51, QP + AlphaC0Offset);
                    Alpha[0] = (Ipp8u) (ALPHA_TABLE[index]);
                    pClipTab = CLIP_TAB[index];

                    // create clipping values
                    Clipping[0] = (Ipp8u) (pClipTab[pStrength[0]]);
                    Clipping[1] = (Ipp8u) (pClipTab[pStrength[1]]);
                    Clipping[2] = (Ipp8u) (pClipTab[pStrength[2]]);
                    Clipping[3] = (Ipp8u) (pClipTab[pStrength[3]]);

                }

                // internal edge variables
                QP = QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)];

                index = IClip(0, 51, QP + BetaOffset);
                Beta[1] = (Ipp8u) (BETA_TABLE[index]);

                index = IClip(0, 51, QP + AlphaC0Offset);
                Alpha[1] = (Ipp8u) (ALPHA_TABLE[index]);
                pClipTab = CLIP_TAB[index];

                if (HORIZONTAL_DEBLOCKING == dir)
                {
                    // create clipping values
                    Clipping[4] = (Ipp8u) (pClipTab[pStrength[4]]);
                    Clipping[5] = (Ipp8u) (pClipTab[pStrength[5]]);
                    Clipping[6] = (Ipp8u) (pClipTab[pStrength[6]]);
                    Clipping[7] = (Ipp8u) (pClipTab[pStrength[7]]);
                    Clipping[8] = (Ipp8u) (pClipTab[pStrength[8]]);
                    Clipping[9] = (Ipp8u) (pClipTab[pStrength[9]]);
                    Clipping[10] = (Ipp8u) (pClipTab[pStrength[10]]);
                    Clipping[11] = (Ipp8u) (pClipTab[pStrength[11]]);
                    Clipping[12] = (Ipp8u) (pClipTab[pStrength[12]]);
                    Clipping[13] = (Ipp8u) (pClipTab[pStrength[13]]);
                    Clipping[14] = (Ipp8u) (pClipTab[pStrength[14]]);
                    Clipping[15] = (Ipp8u) (pClipTab[pStrength[15]]);
                }
                else
                {
                    // create clipping values
                    Clipping[4] = (Ipp8u) (pClipTab[pStrength[8]]);
                    Clipping[5] = (Ipp8u) (pClipTab[pStrength[9]]);
                    Clipping[6] = (Ipp8u) (pClipTab[pStrength[10]]);
                    Clipping[7] = (Ipp8u) (pClipTab[pStrength[11]]);
                }
            }

            if (pParams->bitDepthChroma > 8)
            {
                IppDeblocking16u[4 + dir]((Ipp16u*)pParams->pChroma[nPlane],
                                          pic_pitch,
                                          Alpha,
                                          Beta,
                                          Clipping,
                                          pStrength,
                                          pParams->bitDepthChroma);
            }
            else
            {
                IppDeblocking[4 + dir](pParams->pChroma[nPlane],
                                       pic_pitch,
                                       Alpha,
                                       Beta,
                                       Clipping,
                                       pStrength,
                                       pParams->bitDepthChroma);
            }

        }
    }

} // void H264SegmentDecoder::DeblockChroma422(Ipp32u dir, DeblockingParameters *pParams)

void H264SegmentDecoder::DeblockChroma444(Ipp32u dir, DeblockingParameters *pParams)
{
    if (pParams->DeblockingFlag[dir])
    {
        Ipp32s pic_pitch = pParams->pitch_chroma;
        Ipp32s MBAddr = pParams->nMBAddr;
        Ipp8u Clipping[16];
        Ipp8u Alpha[2];
        Ipp8u Beta[2];
        Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
        Ipp32s BetaOffset = pParams->nBetaOffset;
        Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->Strength[dir];
        Ipp32s nPlane;
        Ipp32s chroma_qp_offset = ~(m_pPicParamSet->chroma_qp_index_offset[0]);

        for (nPlane = 0; nPlane < 2; nPlane += 1)
        {
            if (chroma_qp_offset != m_pPicParamSet->chroma_qp_index_offset[nPlane])
            {
                chroma_qp_offset = m_pPicParamSet->chroma_qp_index_offset[nPlane];

                if (pParams->ExternalEdgeFlag[dir])
                {
                    Ipp32s pmp_QP;

                    // get left block QP
                    pmp_QP = m_mbinfo.mbs[pParams->nNeighbour[dir]].QP;

                    // external edge variables
                    QP = (QP_SCALE_CR[IClip(0, 51, pmp_QP + chroma_qp_offset)] +
                          QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)] + 1) >> 1;

                    index = IClip(0, 51, QP + BetaOffset);
                    Beta[0] = (Ipp8u) (BETA_TABLE[index]);

                    index = IClip(0, 51, QP + AlphaC0Offset);
                    Alpha[0] = (Ipp8u) (ALPHA_TABLE[index]);
                    pClipTab = CLIP_TAB[index];

                    // create clipping values
                    Clipping[0] = (Ipp8u) (pClipTab[pStrength[0]]);
                    Clipping[1] = (Ipp8u) (pClipTab[pStrength[1]]);
                    Clipping[2] = (Ipp8u) (pClipTab[pStrength[2]]);
                    Clipping[3] = (Ipp8u) (pClipTab[pStrength[3]]);

                }

                // internal edge variables
                QP = QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)];

                index = IClip(0, 51, QP + BetaOffset);
                Beta[1] = (Ipp8u) (BETA_TABLE[index]);

                index = IClip(0, 51, QP + AlphaC0Offset);
                Alpha[1] = (Ipp8u) (ALPHA_TABLE[index]);
                pClipTab = CLIP_TAB[index];

                // create clipping values
                Clipping[4] = (Ipp8u) (pClipTab[pStrength[4]]);
                Clipping[5] = (Ipp8u) (pClipTab[pStrength[5]]);
                Clipping[6] = (Ipp8u) (pClipTab[pStrength[6]]);
                Clipping[7] = (Ipp8u) (pClipTab[pStrength[7]]);
                Clipping[8] = (Ipp8u) (pClipTab[pStrength[8]]);
                Clipping[9] = (Ipp8u) (pClipTab[pStrength[9]]);
                Clipping[10] = (Ipp8u) (pClipTab[pStrength[10]]);
                Clipping[11] = (Ipp8u) (pClipTab[pStrength[11]]);
                Clipping[12] = (Ipp8u) (pClipTab[pStrength[12]]);
                Clipping[13] = (Ipp8u) (pClipTab[pStrength[13]]);
                Clipping[14] = (Ipp8u) (pClipTab[pStrength[14]]);
                Clipping[15] = (Ipp8u) (pClipTab[pStrength[15]]);
            }

            if (pParams->bitDepthChroma > 8)
            {
                IppDeblocking16u[6 + dir]((Ipp16u*)pParams->pChroma[nPlane],
                                          pic_pitch,
                                          Alpha,
                                          Beta,
                                          Clipping,
                                          pStrength,
                                          pParams->bitDepthChroma);
            }
            else
            {

                IppDeblocking[6 + dir](pParams->pChroma[nPlane],
                                       pic_pitch,
                                       Alpha,
                                       Beta,
                                       Clipping,
                                       pStrength,
                                       pParams->bitDepthChroma);
            }
        }
    }

} // void H264SegmentDecoder::DeblockChroma444(Ipp32u dir, DeblockingParameters *pParams)

void H264SegmentDecoder::ResetDeblockingVariables(DeblockingParameters *pParams)
{
    PlanePtrYCommon pY;
    PlaneUVCommon *pU, *pV;
    Ipp32s offset;
    Ipp32s MBYAdjust = 0;
    Ipp32s mbXOffset, mbYOffset;
    Ipp32s pitch_luma = m_pCurrentFrame->pitch_luma();
    Ipp32s pitch_chroma = m_pCurrentFrame->pitch_chroma();
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32s nCurrMB_X, nCurrMB_Y;
    const H264SliceHeader *pHeader;

    // load slice header
    pHeader = (m_bFrameDeblocking) ?
              (m_pCurrentFrame->GetAU(m_field_index)->GetSliceByNumber(m_gmbinfo->mbs[MBAddr].slice_id)->GetSliceHeader()) :
              (m_pSliceHeader);

    pParams->bitDepthLuma   = (Ipp8u)bit_depth_luma;
    pParams->bitDepthChroma = (Ipp8u)bit_depth_chroma;

    // load planes
    pY = m_pCurrentFrame->m_pYPlane;
    pU = m_pCurrentFrame->m_pUPlane;
    pV = m_pCurrentFrame->m_pVPlane;

    Ipp32s pixel_luma_sz    = pParams->bitDepthLuma > 8 ? 2 : 1;
    Ipp32s pixel_chroma_sz  = pParams->bitDepthChroma > 8 ? 2 : 1;

    if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
    {
        if (m_field_index)
        {
            pY += pitch_luma*pixel_luma_sz;
            pU += pitch_chroma*pixel_chroma_sz;
            pV += pitch_chroma*pixel_chroma_sz;
        }

        if (m_field_index)
            MBYAdjust = mb_height / 2;

        pitch_luma *= 2;
        pitch_chroma *= 2;
    }

    // prepare macroblock variables
    nCurrMB_X = (MBAddr % mb_width);
    nCurrMB_Y = (MBAddr / mb_width)- MBYAdjust;
    mbXOffset = nCurrMB_X * 16;
    mbYOffset = nCurrMB_Y * 16;

    // calc plane's offsets
    offset = mbXOffset + (mbYOffset * pitch_luma);
    pY += offset*pixel_luma_sz;

    switch (m_pCurrentFrame->m_chroma_format)
    {
    case CHROMA_FORMAT_420: // YUV420
        offset = (mbXOffset + (mbYOffset * pitch_chroma)) >> 1;
        break;
    case CHROMA_FORMAT_422: // YUV422
        offset = (mbXOffset >> 1) + (mbYOffset * pitch_chroma);
        break;
    case CHROMA_FORMAT_400: // YUV400
        offset = 0;
    case CHROMA_FORMAT_444: // YUV444
        break;
    default:
        VM_ASSERT(false);
        break;
    }

    pU += offset*pixel_chroma_sz;
    pV += offset*pixel_chroma_sz;

    // set external edge variables
    pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING] = (nCurrMB_X != 0);
    pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = (nCurrMB_Y != 0);

    if (DEBLOCK_FILTER_ON_NO_SLICE_EDGES == pHeader->disable_deblocking_filter_idc)
    {
        // don't filter at slice boundaries
        if (nCurrMB_X)
        {
            if (m_gmbinfo->mbs[MBAddr].slice_id !=
                m_gmbinfo->mbs[MBAddr - 1].slice_id)
                pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING] = 0;
        }

        if (nCurrMB_Y)
        {
            if (m_gmbinfo->mbs[MBAddr].slice_id !=
                m_gmbinfo->mbs[MBAddr - mb_width].slice_id)
                pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
        }
    }

    // reset external edges strength
    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING], 0);
    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING], 0);

    // set neighbour addreses
    pParams->nNeighbour[VERTICAL_DEBLOCKING] = MBAddr - 1;
    pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width;

    // set deblocking flag(s)
    pParams->DeblockingFlag[VERTICAL_DEBLOCKING] = 0;
    pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] = 0;

    // save variables
    pParams->pLuma = pY;
    pParams->pChroma[0] = pU;
    pParams->pChroma[1] = pV;
    pParams->pitch_luma = pitch_luma;
    pParams->pitch_chroma = pitch_chroma;
    pParams->nMaxMVector = (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec) ? (2) : (4);
    pParams->MBFieldCoded = (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec);

    // set slice's variables
    pParams->nAlphaC0Offset = pHeader->slice_alpha_c0_offset;
    pParams->nBetaOffset = pHeader->slice_beta_offset;

} // void H264SegmentDecoder::ResetDeblockingVariables(DeblockingParameters *pParams)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
