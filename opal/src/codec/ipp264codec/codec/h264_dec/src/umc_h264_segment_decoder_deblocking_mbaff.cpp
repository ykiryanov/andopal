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

namespace UMC
{

void H264SegmentDecoder::DeblockMacroblockISliceMBAFF(Ipp32s MBAddr)
{
    __align(16)
    DeblockingParametersMBAFF params;

    // prepare deblocking parameters
    params.nMBAddr = MBAddr;
    ResetDeblockingVariablesMBAFF(&params);
    PrepareDeblockingParametersISliceMBAFF(&params);

    // perform chroma deblocking
    {
        Ipp32u color_format = m_pCurrentFrame->m_chroma_format;

        if (0 == params.UseComplexVerticalDeblocking)
            (this->*DeblockChroma[color_format])(VERTICAL_DEBLOCKING, &params);
        else
            (this->*DeblockChromaVerticalMBAFF[color_format])(&params);
        if (0 == params.ExtraHorizontalEdge)
            (this->*DeblockChroma[color_format])(HORIZONTAL_DEBLOCKING, &params);
        else
            (this->*DeblockChromaHorizontalMBAFF[color_format])(&params);
    }

    // perform luma deblocking
    if (0 == params.UseComplexVerticalDeblocking)
        DeblockLuma(VERTICAL_DEBLOCKING, &params);
    else
        DeblockLumaVerticalMBAFF(&params);
    if (0 == params.ExtraHorizontalEdge)
        DeblockLuma(HORIZONTAL_DEBLOCKING, &params);
    else
        DeblockLumaHorizontalMBAFF(&params);

} // void H264SegmentDecoder::DeblockMacroblockISliceMBAFF(Ipp32s MBAddr)

void H264SegmentDecoder::DeblockMacroblockPSliceMBAFF(Ipp32s MBAddr)
{
    DeblockMacroblockBSliceMBAFF(MBAddr);
    return;

#if 0
    __align(16)
    DeblockingParametersMBAFF params;

    // prepare deblocking parameters
    params.nMBAddr = MBAddr;
    ResetDeblockingVariablesMBAFF(&params);
    PrepareDeblockingParametersPSliceMBAFF(&params);

    // perform chroma deblocking
    {
        Ipp32u color_format = m_pCurrentFrame->m_chroma_format;

        if (0 == params.UseComplexVerticalDeblocking)
            (this->*DeblockChroma[color_format])(VERTICAL_DEBLOCKING, &params);
        else
            (this->*DeblockChromaVerticalMBAFF[color_format])(&params);
        if (0 == params.ExtraHorizontalEdge)
            (this->*DeblockChroma[color_format])(HORIZONTAL_DEBLOCKING, &params);
        else
            (this->*DeblockChromaHorizontalMBAFF[color_format])(&params);
    }

    // perform luma deblocking
    if (0 == params.UseComplexVerticalDeblocking)
        DeblockLuma(VERTICAL_DEBLOCKING, &params);
    else
        DeblockLumaVerticalMBAFF(&params);
    if (0 == params.ExtraHorizontalEdge)
        DeblockLuma(HORIZONTAL_DEBLOCKING, &params);
    else
        DeblockLumaHorizontalMBAFF(&params);

#endif
} // void H264SegmentDecoder::DeblockMacroblockPSliceMBAFF(Ipp32s MBAddr)

void H264SegmentDecoder::DeblockMacroblockBSliceMBAFF(Ipp32s MBAddr)
{
    __align(16)
    DeblockingParametersMBAFF params;

    // prepare deblocking parameters
    params.nMBAddr = MBAddr;
    ResetDeblockingVariablesMBAFF(&params);
    PrepareDeblockingParametersBSliceMBAFF(&params);

    // perform chroma deblocking
    {
        Ipp32u color_format = m_pCurrentFrame->m_chroma_format;

        if (0 == params.UseComplexVerticalDeblocking)
            (this->*DeblockChroma[color_format])(VERTICAL_DEBLOCKING, &params);
        else
            (this->*DeblockChromaVerticalMBAFF[color_format])(&params);
        if (0 == params.ExtraHorizontalEdge)
            (this->*DeblockChroma[color_format])(HORIZONTAL_DEBLOCKING, &params);
        else
            (this->*DeblockChromaHorizontalMBAFF[color_format])(&params);
    }

    // perform luma deblocking
    if (0 == params.UseComplexVerticalDeblocking)
        DeblockLuma(VERTICAL_DEBLOCKING, &params);
    else
        DeblockLumaVerticalMBAFF(&params);
    if (0 == params.ExtraHorizontalEdge)
        DeblockLuma(HORIZONTAL_DEBLOCKING, &params);
    else
        DeblockLumaHorizontalMBAFF(&params);

} // void H264SegmentDecoder::DeblockMacroblockBSliceMBAFF(Ipp32s MBAddr)

void H264SegmentDecoder::ResetDeblockingVariablesMBAFF(DeblockingParametersMBAFF *pParams)
{
    PlanePtrYCommon   pY;
    PlanePtrUVCommon  pU;
    PlanePtrUVCommon  pV;
    Ipp32s offset;
    Ipp32s mbXOffset, mbYOffset;
    Ipp32s pitch_luma = m_pCurrentFrame->pitch_luma();
    Ipp32s pitch_chroma = m_pCurrentFrame->pitch_chroma();
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32s nCurrMB_X, nCurrMB_Y;
    const H264SliceHeader *pHeader;
    Ipp32s nFieldMacroblockMode;

    // load slice header
    pHeader = m_pSliceHeader;

    pParams->bitDepthLuma   = (Ipp8u)bit_depth_luma;
    pParams->bitDepthChroma = (Ipp8u)bit_depth_chroma;

    // load planes
    pY = m_pCurrentFrame->m_pYPlane;
    pU = m_pCurrentFrame->m_pUPlane;
    pV = m_pCurrentFrame->m_pVPlane;

    Ipp32s pixel_luma_sz    = pParams->bitDepthLuma > 8 ? 2 : 1;
    Ipp32s pixel_chroma_sz  = pParams->bitDepthChroma > 8 ? 2 : 1;

    // prepare macroblock variables
    nCurrMB_X = ((MBAddr>>1) % mb_width);
    nCurrMB_Y = ((MBAddr>>1) / mb_width)*2 + (MBAddr&1);
    mbXOffset = nCurrMB_X * 16;
    mbYOffset = nCurrMB_Y * 16;

    // calc plane's offsets
    offset = mbXOffset + (mbYOffset * pitch_luma);
    pY += offset*pixel_luma_sz;

    switch (m_pCurrentFrame->m_chroma_format)
    {
    case CHROMA_FORMAT_420:
        offset = (mbXOffset + (mbYOffset * pitch_chroma)) >> 1;
        break;

    case CHROMA_FORMAT_422:
        offset = (mbXOffset >> 1) + (mbYOffset * pitch_chroma);
        break;

    case CHROMA_FORMAT_400:
        offset = 0;
    case CHROMA_FORMAT_444:
        break;

    default:
        VM_ASSERT(false);
        break;
    }

    pU += offset*pixel_chroma_sz;
    pV += offset*pixel_chroma_sz;

    // obtain macroblock mode
    nFieldMacroblockMode = GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr]);
    // correct y, u & v offset
    if (nFieldMacroblockMode)
    {
        if (MBAddr & 1)
        {
            pY -= 15 * pitch_luma * pixel_luma_sz;

            Ipp32s ff_offset = (m_pCurrentFrame->m_chroma_format != 1) ? 15 : 7;
            pU -= ff_offset * pitch_chroma * pixel_chroma_sz;
            pV -= ff_offset * pitch_chroma * pixel_chroma_sz;
        }

        pitch_luma *= 2;
        pitch_chroma *= 2;
    }

    // set external edge variables
    // there are only two values:
    // zero - do not deblocking
    // nonzero - do deblocking
    pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING] = nCurrMB_X;
    pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = (nFieldMacroblockMode) ? (1 < nCurrMB_Y) : (nCurrMB_Y);

    if (DEBLOCK_FILTER_ON_NO_SLICE_EDGES == pHeader->disable_deblocking_filter_idc)
    {
        // don't filter at slice boundaries
        if (pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING])
        {
            if (m_gmbinfo->mbs[MBAddr].slice_id !=
                m_gmbinfo->mbs[MBAddr - 2].slice_id)
                pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING] = 0;
        }

        if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
        {
            if (m_gmbinfo->mbs[MBAddr].slice_id !=
                m_gmbinfo->mbs[MBAddr - mb_width * 2].slice_id
                && !(!nFieldMacroblockMode && (MBAddr & 1)))
                pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
        }
    }

    // set left MB couple adresses
    {
        pParams->nLeft[0] = pParams->nMBAddr - 2 - (MBAddr&1);
        pParams->nLeft[1] = pParams->nLeft[0] + 1;
    }

    // set "complex deblocking" flag
    // when left & current macroblock are coded in different modes
    pParams->UseComplexVerticalDeblocking = 0;
    if (pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING])
    {
        if (nFieldMacroblockMode !=
            GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr - 2]))
        {
            // when left macroblocks aren't intra blocks
            // or have different QP
            //if (IS_INTER_MBTYPE((m_gmbinfo->mbs + pParams->nLeft[0])->mbtype) ||
            //    IS_INTER_MBTYPE((m_gmbinfo->mbs + pParams->nLeft[1])->mbtype) ||
            //    (m_mbinfo.mbs[pParams->nLeft[0]].QP != m_mbinfo.mbs[pParams->nLeft[1]].QP))
            //{
                pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING] = 0;
                pParams->UseComplexVerticalDeblocking = 1;
            //}
        }
    }

    // obtain extra horizontal edge condition
    // when above macroblock is field coded and
    // current macroblock is frame coded
    pParams->ExtraHorizontalEdge = 0;
    if ((0 == (pParams->nMBAddr & 1)) &&
        (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING]))
    {
        if ((0 == nFieldMacroblockMode) &&
            (0 != GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr - mb_width * 2])))
            pParams->ExtraHorizontalEdge = 1;
    }

    // reset external edges strength
    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING], 0);
    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING], 0);

    // set neighbour addreses
    pParams->nNeighbour[VERTICAL_DEBLOCKING] = MBAddr - 2;
    if (0 == nFieldMacroblockMode)
    {
        if ((MBAddr&1)==0)
        {
            if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr - mb_width * 2]))
                pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width * 2;
            else
                pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width * 2 + 1;
        }
        else
        {
            pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - 1;
        }
    }
    else
    {
        if ((MBAddr&1)==0)
        {
            if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr - mb_width * 2]))
                pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width * 2;
            else
                pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width * 2 + 1;
        }
        else
        {
            if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr - mb_width * 2]))
                pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width * 2;
            else
                pParams->nNeighbour[HORIZONTAL_DEBLOCKING] = MBAddr - mb_width * 2;
        }
    }

    // set deblocking flag(s)
    pParams->DeblockingFlag[VERTICAL_DEBLOCKING] = 0;
    pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] = 0;

    // save variables
    pParams->pLuma = pY;
    pParams->pChroma[0] = pU;
    pParams->pChroma[1] = pV;
    pParams->pitch_luma = pitch_luma;
    pParams->pitch_chroma = pitch_chroma;
    pParams->nMBAddr = MBAddr;
    pParams->nMaxMVector = (nFieldMacroblockMode) ? (2) : (4);
    pParams->MBFieldCoded = nFieldMacroblockMode;

    // set slice's variables
    pParams->nAlphaC0Offset = pHeader->slice_alpha_c0_offset;
    pParams->nBetaOffset = pHeader->slice_beta_offset;

} // void H264SegmentDecoder::ResetDeblockingVariablesMBAFF(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockLumaVerticalMBAFF(DeblockingParametersMBAFF *pParams)
{
    //
    // step 1. Perform complex deblocking on external edge
    //
    {
        Ipp32s MBAddr = pParams->nMBAddr;
        Ipp8u Clipping[16];
        Ipp8u Alpha[2];
        Ipp8u Beta[2];
        Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
        Ipp32s BetaOffset = pParams->nBetaOffset;
        Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;
        Ipp32s pmp_QP;
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->StrengthComplex;
        Ipp32s i;

        // prepare variables
        for (i = 0;i < 2;i += 1)
        {
            // get upper neighbour block QP
            pmp_QP = m_mbinfo.mbs[pParams->nLeft[i]].QP;

            // luma variables
            QP = (pmp_QP + pmq_QP + 1) >> 1 ;

            // external edge variables
            index = IClip(0, 51, QP + BetaOffset);
            Beta[i] = (Ipp8u)(BETA_TABLE[index]);

            index = IClip(0, 51, QP + AlphaC0Offset);
            Alpha[i] = (Ipp8u)(ALPHA_TABLE[index]);
            pClipTab = CLIP_TAB[index];

            // create clipping values
            Clipping[i * 4 + 0] = (Ipp8u)(pClipTab[pStrength[i * 4 + 0]]);
            Clipping[i * 4 + 1] = (Ipp8u)(pClipTab[pStrength[i * 4 + 1]]);
            Clipping[i * 4 + 2] = (Ipp8u)(pClipTab[pStrength[i * 4 + 2]]);
            Clipping[i * 4 + 3] = (Ipp8u)(pClipTab[pStrength[i * 4 + 3]]);
        }

        // perform deblocking
        if (0 == GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr]))
        {
            if (pParams->bitDepthLuma > 8)
            {
                IppDeblocking16u[8]((Ipp16u*)pParams->pLuma,
                                    pParams->pitch_luma * 2,
                                    &Alpha[0],
                                    &Beta[0],
                                    Clipping,
                                    pStrength,
                                    pParams->bitDepthLuma);
                IppDeblocking16u[8]((Ipp16u*)pParams->pLuma + pParams->pitch_luma,
                                    pParams->pitch_luma * 2,
                                    &Alpha[1],
                                    &Beta[1],
                                    Clipping + 4,
                                    pStrength + 4,
                                    pParams->bitDepthLuma);
            }
            else
            {
                IppDeblocking[8](pParams->pLuma,
                                 pParams->pitch_luma * 2,
                                 &Alpha[0],
                                 &Beta[0],
                                 Clipping,
                                 pStrength,
                                 pParams->bitDepthLuma);
                IppDeblocking[8](pParams->pLuma + pParams->pitch_luma,
                                 pParams->pitch_luma * 2,
                                 &Alpha[1],
                                 &Beta[1],
                                 Clipping + 4,
                                 pStrength + 4,
                                 pParams->bitDepthLuma);
            }
        }
        else
        {
            if (pParams->bitDepthLuma > 8)
            {
                IppDeblocking16u[8]((Ipp16u*)pParams->pLuma,
                                    pParams->pitch_luma,
                                    &Alpha[0],
                                    &Beta[0],
                                    Clipping,
                                    pStrength,
                                    pParams->bitDepthLuma);
                IppDeblocking16u[8]((Ipp16u*)pParams->pLuma + pParams->pitch_luma * 8,
                                    pParams->pitch_luma,
                                    &Alpha[1],
                                    &Beta[1],
                                    Clipping + 4,
                                    pStrength + 4,
                                    pParams->bitDepthLuma);
            }
            else
            {
                IppDeblocking[8](pParams->pLuma,
                                 pParams->pitch_luma,
                                 &Alpha[0],
                                 &Beta[0],
                                 Clipping,
                                 pStrength,
                                 pParams->bitDepthLuma);
                IppDeblocking[8](pParams->pLuma + pParams->pitch_luma * 8,
                                 pParams->pitch_luma,
                                 &Alpha[1],
                                 &Beta[1],
                                 Clipping + 4,
                                 pStrength + 4,
                                 pParams->bitDepthLuma);
            }
        }
    }

    //
    // step 2. Perform complex deblocking on internal edges
    //
    DeblockLuma(VERTICAL_DEBLOCKING, pParams);

} // void H264SegmentDecoder::DeblockLumaVerticalMBAFF(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockChromaVerticalMBAFF400(DeblockingParametersMBAFF *)
{
    // there is nothing to do

} // void H264SegmentDecoder::DeblockChromaVerticalMBAFF400(DeblockingParametersMBAFF *)

void H264SegmentDecoder::DeblockChromaVerticalMBAFF420(DeblockingParametersMBAFF *pParams)
{
    //
    // step 1. Perform complex deblocking on external edge
    //
    {
        Ipp32s MBAddr = pParams->nMBAddr;
        Ipp8u Clipping[16];
        Ipp8u Alpha[2];
        Ipp8u Beta[2];
        Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
        Ipp32s BetaOffset = pParams->nBetaOffset;
        Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;
        Ipp32s pmp_QP;
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->StrengthComplex;
        Ipp32s nPlane;
        Ipp32s chroma_qp_offset = ~(m_pPicParamSet->chroma_qp_index_offset[0]);

        for (nPlane = 0; nPlane < 2; nPlane += 1)
        {
            // prepare variables
            if (chroma_qp_offset != m_pPicParamSet->chroma_qp_index_offset[nPlane])
            {
                Ipp32s i;

                chroma_qp_offset = m_pPicParamSet->chroma_qp_index_offset[nPlane];

                // prepare variables
                for (i = 0;i < 2;i += 1)
                {
                    // get upper neighbour block QP
                    pmp_QP = m_mbinfo.mbs[pParams->nLeft[i]].QP;

                    // external edge variables
                    QP = (QP_SCALE_CR[IClip(0, 51, pmp_QP + chroma_qp_offset)] +
                            QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)] + 1) >> 1;

                    // external edge variables
                    index = IClip(0, 51, QP + BetaOffset);
                    Beta[i] = (Ipp8u)(BETA_TABLE[index]);

                    index = IClip(0, 51, QP + AlphaC0Offset);
                    Alpha[i] = (Ipp8u)(ALPHA_TABLE[index]);
                    pClipTab = CLIP_TAB[index];

                    // create clipping values
                    Clipping[i * 4 + 0] = (Ipp8u)(pClipTab[pStrength[i * 4 + 0]]);
                    Clipping[i * 4 + 1] = (Ipp8u)(pClipTab[pStrength[i * 4 + 1]]);
                    Clipping[i * 4 + 2] = (Ipp8u)(pClipTab[pStrength[i * 4 + 2]]);
                    Clipping[i * 4 + 3] = (Ipp8u)(pClipTab[pStrength[i * 4 + 3]]);
                }
            }

            // perform deblocking
            if (0 == GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr]))
            {
                if (pParams->bitDepthChroma > 8)
                {
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane],
                                        pParams->pitch_chroma * 2,
                                        &Alpha[0],
                                        &Beta[0],
                                        Clipping,
                                        pStrength,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma,
                                        pParams->pitch_chroma * 2,
                                        &Alpha[1],
                                        &Beta[1],
                                        Clipping + 4,
                                        pStrength + 4,
                                        pParams->bitDepthChroma);
                }
                else
                {
                    IppDeblocking[9](pParams->pChroma[nPlane],
                                     pParams->pitch_chroma * 2,
                                     &Alpha[0],
                                     &Beta[0],
                                     Clipping,
                                     pStrength,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma,
                                     pParams->pitch_chroma * 2,
                                     &Alpha[1],
                                     &Beta[1],
                                     Clipping + 4,
                                     pStrength + 4,
                                     pParams->bitDepthChroma);
                }
            }
            else
            {
                if (pParams->bitDepthChroma > 8)
                {
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane],
                                        pParams->pitch_chroma,
                                        &Alpha[0],
                                        &Beta[0],
                                        Clipping,
                                        pStrength,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma * 4,
                                        pParams->pitch_chroma,
                                        &Alpha[1],
                                        &Beta[1],
                                        Clipping + 4,
                                        pStrength + 4,
                                        pParams->bitDepthChroma);
                }
                else
                {
                    IppDeblocking[9](pParams->pChroma[nPlane],
                                     pParams->pitch_chroma,
                                     &Alpha[0],
                                     &Beta[0],
                                     Clipping,
                                     pStrength,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma * 4,
                                     pParams->pitch_chroma,
                                     &Alpha[1],
                                     &Beta[1],
                                     Clipping + 4,
                                     pStrength + 4,
                                     pParams->bitDepthChroma);
                }
            }
        }
    }

    //
    // step 2. Perform complex deblocking on internal edges
    //
    (this->*DeblockChroma[CHROMA_FORMAT_420])(VERTICAL_DEBLOCKING, pParams);

} // void H264SegmentDecoder::DeblockChromaVerticalMBAFF420(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockChromaVerticalMBAFF422(DeblockingParametersMBAFF *pParams)
{
    //
    // step 1. Perform complex deblocking on external edge
    //
    {
        Ipp32s MBAddr = pParams->nMBAddr;
        Ipp8u Clipping[16];
        Ipp8u Alpha[2];
        Ipp8u Beta[2];
        Ipp32s AlphaC0Offset = pParams->nAlphaC0Offset;
        Ipp32s BetaOffset = pParams->nBetaOffset;
        Ipp32s pmq_QP = m_mbinfo.mbs[MBAddr].QP;
        Ipp32s pmp_QP;
        Ipp8u *pClipTab;
        Ipp32s QP;
        Ipp32s index;
        Ipp8u *pStrength = pParams->StrengthComplex;
        Ipp32s nPlane;
        Ipp32s chroma_qp_offset = ~(m_pPicParamSet->chroma_qp_index_offset[0]);

        for (nPlane = 0; nPlane < 2; nPlane += 1)
        {
            // prepare variables
            if (chroma_qp_offset != m_pPicParamSet->chroma_qp_index_offset[nPlane])
            {
                Ipp32s i;

                chroma_qp_offset = m_pPicParamSet->chroma_qp_index_offset[nPlane];

                // prepare variables
                for (i = 0;i < 2;i += 1)
                {
                    // get upper neighbour block QP
                    pmp_QP = m_mbinfo.mbs[pParams->nLeft[i]].QP;

                    // external edge variables
                    QP = (QP_SCALE_CR[IClip(0, 51, pmp_QP + chroma_qp_offset)] +
                          QP_SCALE_CR[IClip(0, 51, pmq_QP + chroma_qp_offset)] + 1) >> 1;

                    // external edge variables
                    index = IClip(0, 51, QP + BetaOffset);
                    Beta[i] = (Ipp8u)(BETA_TABLE[index]);

                    index = IClip(0, 51, QP + AlphaC0Offset);
                    Alpha[i] = (Ipp8u)(ALPHA_TABLE[index]);
                    pClipTab = CLIP_TAB[index];

                    // create clipping values
                    Clipping[i * 4 + 0] = (Ipp8u)(pClipTab[pStrength[i * 4 + 0]]);
                    Clipping[i * 4 + 1] = (Ipp8u)(pClipTab[pStrength[i * 4 + 1]]);
                    Clipping[i * 4 + 2] = (Ipp8u)(pClipTab[pStrength[i * 4 + 2]]);
                    Clipping[i * 4 + 3] = (Ipp8u)(pClipTab[pStrength[i * 4 + 3]]);
                }
            }

            // perform deblocking
            if (0 == GetMBFieldDecodingFlag(m_gmbinfo->mbs[MBAddr]))
            {
                if (pParams->bitDepthChroma > 8)
                {
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane],
                                        pParams->pitch_chroma * 4,
                                        &Alpha[0],
                                        &Beta[0],
                                        Clipping,
                                        pStrength,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma,
                                        pParams->pitch_chroma * 4,
                                        &Alpha[1],
                                        &Beta[1],
                                        Clipping + 4,
                                        pStrength + 4,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma * 2,
                                        pParams->pitch_chroma * 4,
                                        &Alpha[0],
                                        &Beta[0],
                                        Clipping,
                                        pStrength,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma * 3,
                                        pParams->pitch_chroma * 4,
                                        &Alpha[1],
                                        &Beta[1],
                                        Clipping + 4,
                                        pStrength + 4,
                                        pParams->bitDepthChroma);
                }
                else
                {
                    IppDeblocking[9](pParams->pChroma[nPlane],
                                     pParams->pitch_chroma * 4,
                                     &Alpha[0],
                                     &Beta[0],
                                     Clipping,
                                     pStrength,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma,
                                     pParams->pitch_chroma * 4,
                                     &Alpha[1],
                                     &Beta[1],
                                     Clipping + 4,
                                     pStrength + 4,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma * 2,
                                     pParams->pitch_chroma * 4,
                                     &Alpha[0],
                                     &Beta[0],
                                     Clipping,
                                     pStrength,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma * 3,
                                     pParams->pitch_chroma * 4,
                                     &Alpha[1],
                                     &Beta[1],
                                     Clipping + 4,
                                     pStrength + 4,
                                     pParams->bitDepthChroma);
                }
            }
            else
            {
                if (pParams->bitDepthChroma > 8)
                {
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane],
                                        pParams->pitch_chroma,
                                        &Alpha[0],
                                        &Beta[0],
                                        Clipping,
                                        pStrength,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma * 4,
                                        pParams->pitch_chroma,
                                        &Alpha[0],
                                        &Beta[0],
                                        Clipping,
                                        pStrength,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma * 8,
                                        pParams->pitch_chroma,
                                        &Alpha[1],
                                        &Beta[1],
                                        Clipping + 4,
                                        pStrength + 4,
                                        pParams->bitDepthChroma);
                    IppDeblocking16u[9]((Ipp16u*)pParams->pChroma[nPlane] + pParams->pitch_chroma * 12,
                                        pParams->pitch_chroma,
                                        &Alpha[1],
                                        &Beta[1],
                                        Clipping + 4,
                                        pStrength + 4,
                                        pParams->bitDepthChroma);
                }
                else
                {
                    IppDeblocking[9](pParams->pChroma[nPlane],
                                     pParams->pitch_chroma,
                                     &Alpha[0],
                                     &Beta[0],
                                     Clipping,
                                     pStrength,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma * 4,
                                     pParams->pitch_chroma,
                                     &Alpha[0],
                                     &Beta[0],
                                     Clipping,
                                     pStrength,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma * 8,
                                     pParams->pitch_chroma,
                                     &Alpha[1],
                                     &Beta[1],
                                     Clipping + 4,
                                     pStrength + 4,
                                     pParams->bitDepthChroma);
                    IppDeblocking[9](pParams->pChroma[nPlane] + pParams->pitch_chroma * 12,
                                     pParams->pitch_chroma,
                                     &Alpha[1],
                                     &Beta[1],
                                     Clipping + 4,
                                     pStrength + 4,
                                     pParams->bitDepthChroma);
                }
            }
        }
    }

    //
    // step 2. Perform complex deblocking on internal edges
    //
    (this->*DeblockChroma[CHROMA_FORMAT_422])(VERTICAL_DEBLOCKING, pParams);

} // void H264SegmentDecoder::DeblockChromaVerticalMBAFF422(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockChromaVerticalMBAFF444(DeblockingParametersMBAFF * /*pParams*/)
{
    /* this function is under development */

} // void H264SegmentDecoder::DeblockChromaVerticalMBAFF444(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockLumaHorizontalMBAFF(DeblockingParametersMBAFF *pParams)
{
    Ipp8u bTmp[16];
    Ipp32s pitch = pParams->pitch_luma;

    Ipp32s luma_pixel_sz = pParams->bitDepthLuma > 8 ? 2 : 1;

    //
    // luma deblocking
    //

    //
    // step 1. Deblock origin external edge
    //
    {
        // save internal edges strength
        CopyEdgeStrength(bTmp + 0, pParams->Strength[HORIZONTAL_DEBLOCKING] + 0);
        CopyEdgeStrength(bTmp + 4, pParams->Strength[HORIZONTAL_DEBLOCKING] + 4);
        CopyEdgeStrength(bTmp + 8, pParams->Strength[HORIZONTAL_DEBLOCKING] + 8);
        CopyEdgeStrength(bTmp + 12, pParams->Strength[HORIZONTAL_DEBLOCKING] + 12);
        // skip all internal edges
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, 0);
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, 0);
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, 0);
        // set pitch
        pParams->pitch_luma *= 2;
        // perform deblocking
        DeblockLuma(HORIZONTAL_DEBLOCKING, pParams);
    }

    //
    // step 2. Deblock extra external edge
    //
    {
        // set extra edge strength
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING], pParams->StrengthExtra);
        // correct neighbour MB info
        pParams->nNeighbour[HORIZONTAL_DEBLOCKING] += 1;
        // correct Y pointer
        pParams->pLuma += pitch*luma_pixel_sz;
        // perform deblocking
        DeblockLuma(HORIZONTAL_DEBLOCKING, pParams);
        // restore values
        pParams->nNeighbour[HORIZONTAL_DEBLOCKING] -= 1;
        pParams->pLuma -= pitch*luma_pixel_sz;
        pParams->pitch_luma = pitch;
    }

    //
    // step 3. Deblock internal edges
    //
    {
        pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
        // set internal edge strength
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 0);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, bTmp + 4);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, bTmp + 8);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, bTmp + 12);
        // perform deblocking
        DeblockLuma(HORIZONTAL_DEBLOCKING, pParams);
        // restore strength
        pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, bTmp + 0);
    }

} // void H264SegmentDecoder::DeblockLumaHorizontalMBAFF(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockChromaHorizontalMBAFF400(DeblockingParametersMBAFF *)
{
    // there is nothing to do

} // void H264SegmentDecoder::DeblockChromaHorizontalMBAFF400(DeblockingParametersMBAFF *)

void H264SegmentDecoder::DeblockChromaHorizontalMBAFF420(DeblockingParametersMBAFF *pParams)
{
    Ipp8u bTmp[16];
    Ipp32s pitch = pParams->pitch_chroma;
    Ipp32s chroma_pixel_sz = pParams->bitDepthChroma > 8 ? 2 : 1;
    ChromaDeblockingFunction pFunc = DeblockChroma[m_pCurrentFrame->m_chroma_format];

    //
    // chroma deblocking
    //

    //
    // step 1. Deblock origin external edge
    //
    {
        // save internal edges strength
        CopyEdgeStrength(bTmp + 0, pParams->Strength[HORIZONTAL_DEBLOCKING] + 0);
        CopyEdgeStrength(bTmp + 4, pParams->Strength[HORIZONTAL_DEBLOCKING] + 4);
        CopyEdgeStrength(bTmp + 8, pParams->Strength[HORIZONTAL_DEBLOCKING] + 8);
        CopyEdgeStrength(bTmp + 12, pParams->Strength[HORIZONTAL_DEBLOCKING] + 12);
        // skip all internal edges
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, 0);
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, 0);
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, 0);
        // set pitch
        pParams->pitch_chroma *= 2;
        // perform deblocking
        (this->*pFunc)(HORIZONTAL_DEBLOCKING, pParams);
    }

    //
    // step 2. Deblock extra external edge
    //
    {
        // set extra edge strength
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING], pParams->StrengthExtra);
        // correct neighbour MB info
        pParams->nNeighbour[HORIZONTAL_DEBLOCKING] += 1;
        // correct U & V pointer
        pParams->pChroma[0] += pitch*chroma_pixel_sz;
        pParams->pChroma[1] += pitch*chroma_pixel_sz;
        // perform deblocking
        (this->*pFunc)(HORIZONTAL_DEBLOCKING, pParams);
        // restore values
        pParams->nNeighbour[HORIZONTAL_DEBLOCKING] -= 1;
        pParams->pChroma[0] -= pitch*chroma_pixel_sz;
        pParams->pChroma[1] -= pitch*chroma_pixel_sz;
        pParams->pitch_chroma = pitch;
    }

    //
    // step 3. Deblock internal edges
    //
    {
        pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
        // set internal edge strength
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 0);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, bTmp + 4);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, bTmp + 8);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, bTmp + 12);
        // perform deblocking
        (this->*pFunc)(HORIZONTAL_DEBLOCKING, pParams);
        // restore strength
        pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, bTmp + 0);
    }

} // void H264SegmentDecoder::DeblockChromaHorizontalMBAFF420(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockChromaHorizontalMBAFF422(DeblockingParametersMBAFF *pParams)
{
    Ipp8u bTmp[16];
    Ipp32s pitch = pParams->pitch_chroma;
    Ipp32s chroma_pixel_sz = pParams->bitDepthChroma > 8 ? 2 : 1;
    ChromaDeblockingFunction pFunc = DeblockChroma[m_pCurrentFrame->m_chroma_format];

    //
    // chroma deblocking
    //

    //
    // step 1. Deblock origin external edge
    //
    {
        // save internal edges strength
        CopyEdgeStrength(bTmp + 0, pParams->Strength[HORIZONTAL_DEBLOCKING] + 0);
        CopyEdgeStrength(bTmp + 4, pParams->Strength[HORIZONTAL_DEBLOCKING] + 4);
        CopyEdgeStrength(bTmp + 8, pParams->Strength[HORIZONTAL_DEBLOCKING] + 8);
        CopyEdgeStrength(bTmp + 12, pParams->Strength[HORIZONTAL_DEBLOCKING] + 12);
        // skip all internal edges
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, 0);
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, 0);
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, 0);
        // set pitch
        pParams->pitch_chroma *= 2;
        // perform deblocking
        (this->*pFunc)(HORIZONTAL_DEBLOCKING, pParams);
    }

    //
    // step 2. Deblock extra external edge
    //
    {
        // set extra edge strength
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING], pParams->StrengthExtra);
        // correct neighbour MB info
        pParams->nNeighbour[HORIZONTAL_DEBLOCKING] += 1;
        // correct U & V pointer
        pParams->pChroma[0] += pitch*chroma_pixel_sz;
        pParams->pChroma[1] += pitch*chroma_pixel_sz;
        // perform deblocking
        (this->*pFunc)(HORIZONTAL_DEBLOCKING, pParams);
        // restore values
        pParams->nNeighbour[HORIZONTAL_DEBLOCKING] -= 1;
        pParams->pChroma[0] -= pitch*chroma_pixel_sz;
        pParams->pChroma[1] -= pitch*chroma_pixel_sz;
        pParams->pitch_chroma = pitch;
    }

    //
    // step 3. Deblock internal edges
    //
    {
        pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
        // set internal edge strength
        SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 0);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, bTmp + 4);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, bTmp + 8);
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, bTmp + 12);
        // perform deblocking
        (this->*pFunc)(HORIZONTAL_DEBLOCKING, pParams);
        // restore strength
        pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        CopyEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, bTmp + 0);
    }

} // void H264SegmentDecoder::DeblockChromaHorizontalMBAFF422(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::DeblockChromaHorizontalMBAFF444(DeblockingParametersMBAFF * /*pParams*/)
{
    /* the function is under development */

} // void H264SegmentDecoder::DeblockChromaHorizontalMBAFF444(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersISliceMBAFF(DeblockingParametersMBAFF *pParams)
{
    // set deblocking flag(s)
    pParams->DeblockingFlag[VERTICAL_DEBLOCKING] = 1;
    pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] = 1;

    // fill "complex deblocking" strength
    if (pParams->UseComplexVerticalDeblocking)
    {
        SetEdgeStrength(pParams->StrengthComplex + 0, 4);
        SetEdgeStrength(pParams->StrengthComplex + 4, 4);
    }

    // calculate strengths
    if (pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING])
    {
        // deblocking with strong deblocking of external edge
        SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 0, 4);
    }

    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 4, 3);
    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 8, 3);
    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 12, 3);

    if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
    {
        if ((GetMBFieldDecodingFlag(m_gmbinfo->mbs[pParams->nMBAddr])) ||
            (pParams->ExtraHorizontalEdge))
        {
            // deblocking field macroblock with external edge
            SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 3);
        }
        else
        {
            // deblocking with strong deblocking of external edge
            SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 4);
        }
    }

    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, 3);
    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, 3);
    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, 3);

    if (pParams->ExtraHorizontalEdge)
    {
        // set extra edge strength
        SetEdgeStrength(pParams->StrengthExtra + 0, 3);
        SetEdgeStrength(pParams->StrengthExtra + 4, 0);
        SetEdgeStrength(pParams->StrengthExtra + 8, 0);
        SetEdgeStrength(pParams->StrengthExtra + 12, 0);
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersISliceMBAFF(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSliceMBAFF(DeblockingParametersMBAFF *pParams)
{
    Ipp32s mbtype = (m_gmbinfo->mbs + pParams->nMBAddr)->mbtype;
    Ipp32s nAboveMBFieldCoded = 0;

    // when this macroblock is intra coded
    if (IS_INTRA_MBTYPE(mbtype))
    {
        PrepareDeblockingParametersISliceMBAFF(pParams);
        return;
    }

    if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
        nAboveMBFieldCoded = GetMBFieldDecodingFlag(m_gmbinfo->mbs[pParams->nNeighbour[HORIZONTAL_DEBLOCKING]]);
    // when there are no special cases
    if ((0 == nAboveMBFieldCoded) &&
        (0 == pParams->MBFieldCoded) &&
        (0 == pParams->UseComplexVerticalDeblocking))
    {
        // prepare whole macroblock parameters
        PrepareDeblockingParametersPSlice(pParams);
        return;
    }

    // when current macroblock is frame coded
    if (0 == pParams->MBFieldCoded)
    {
        // prepare "complex vertical deblocking" parameters
        if (pParams->UseComplexVerticalDeblocking)
            PrepareDeblockingParametersPSlice4MBAFFComplexFrameExternalEdge(pParams);

        // fill vertical edges parameters
        PrepareDeblockingParametersPSlice4(VERTICAL_DEBLOCKING, pParams);

        // fill extra edge parameters
        if (pParams->ExtraHorizontalEdge)
        {
            // set correct above neighbour
            pParams->nNeighbour[HORIZONTAL_DEBLOCKING] += 1;
            // obtain parameters
            PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(pParams);
            // restore above neighbour
            pParams->nNeighbour[HORIZONTAL_DEBLOCKING] -= 1;
            // copy parameters to right place
            CopyEdgeStrength(pParams->StrengthExtra, pParams->Strength[HORIZONTAL_DEBLOCKING]);

            // fill horizontal edges parameters
            PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
            PrepareDeblockingParametersPSlice4(HORIZONTAL_DEBLOCKING, pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        }
        else
            PrepareDeblockingParametersPSlice4(HORIZONTAL_DEBLOCKING, pParams);

    }
    // when current macroblock is field coded
    else
    {
        // prepare "complex vertical deblocking" parameters
        if (pParams->UseComplexVerticalDeblocking)
            PrepareDeblockingParametersPSlice4MBAFFComplexFieldExternalEdge(pParams);

        // fill vertical edges parameters
        PrepareDeblockingParametersPSlice4MBAFFField(VERTICAL_DEBLOCKING, pParams);

        // when above macroblock is frame coded
        if ((nAboveMBFieldCoded != pParams->MBFieldCoded) &&
            (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING]))
        {
            PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
            PrepareDeblockingParametersPSlice4MBAFFField(HORIZONTAL_DEBLOCKING, pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        }
        else
            PrepareDeblockingParametersPSlice4MBAFFField(HORIZONTAL_DEBLOCKING, pParams);
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersPSliceMBAFF(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSliceMBAFF(DeblockingParametersMBAFF *pParams)
{
    Ipp32s mbtype = (m_gmbinfo->mbs + pParams->nMBAddr)->mbtype;
    Ipp32s nAboveMBFieldCoded = 0;

    // when this macroblock is intra coded
    if (IS_INTRA_MBTYPE(mbtype))
    {
        PrepareDeblockingParametersISliceMBAFF(pParams);
        return;
    }

    if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
        nAboveMBFieldCoded = GetMBFieldDecodingFlag(m_gmbinfo->mbs[pParams->nNeighbour[HORIZONTAL_DEBLOCKING]]);
    // when there are no special cases
    if ((0 == nAboveMBFieldCoded) &&
        (0 == pParams->MBFieldCoded) &&
        (0 == pParams->UseComplexVerticalDeblocking))
    {
        // prepare whole macroblock parameters
        PrepareDeblockingParametersBSlice(pParams);
        return;
    }

    // when current macroblock is frame coded
    if (0 == pParams->MBFieldCoded)
    {
        // prepare "complex vertical deblocking" parameters
        if (pParams->UseComplexVerticalDeblocking)
            PrepareDeblockingParametersPSlice4MBAFFComplexFrameExternalEdge(pParams);

        // fill vertical edges parameters
        PrepareDeblockingParametersBSlice4(VERTICAL_DEBLOCKING, pParams);

        // fill extra edge parameters
        if (pParams->ExtraHorizontalEdge)
        {
            // set correct above neighbour
            pParams->nNeighbour[HORIZONTAL_DEBLOCKING] += 1;
            // obtain parameters
            PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(pParams);
            // restore above neighbour
            pParams->nNeighbour[HORIZONTAL_DEBLOCKING] -= 1;
            // copy parameters to right place
            CopyEdgeStrength(pParams->StrengthExtra, pParams->Strength[HORIZONTAL_DEBLOCKING]);

            // fill horizontal edges parameters
            PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
            PrepareDeblockingParametersBSlice4(HORIZONTAL_DEBLOCKING, pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        }
        else
            PrepareDeblockingParametersBSlice4(HORIZONTAL_DEBLOCKING, pParams);
    }
    // when current macroblock is field coded
    else
    {
        // prepare "complex vertical deblocking" parameters
        if (pParams->UseComplexVerticalDeblocking)
            PrepareDeblockingParametersPSlice4MBAFFComplexFieldExternalEdge(pParams);

        // fill vertical edges parameters
        PrepareDeblockingParametersBSlice4MBAFFField(VERTICAL_DEBLOCKING, pParams);

        // when above macroblock is frame coded
        if ((nAboveMBFieldCoded != pParams->MBFieldCoded) &&
            (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING]))
        {
            PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 0;
            PrepareDeblockingParametersBSlice4MBAFFField(HORIZONTAL_DEBLOCKING, pParams);
            pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING] = 1;
        }
        else
            PrepareDeblockingParametersBSlice4MBAFFField(HORIZONTAL_DEBLOCKING, pParams);
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSliceMBAFF(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[HORIZONTAL_DEBLOCKING];
    Ipp32s nNeighbour;

    //
    // external edge
    //

    // mixed edge is always deblocked
    {
        Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING]);
        *pDeblockingFlag = 1;
    }

    // select neighbour addres
    nNeighbour = pParams->nNeighbour[HORIZONTAL_DEBLOCKING];

    // when neighbour macroblock isn't intra
    if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
    {
        H264DecoderMacroblockLocalInfo *pNeighbour;
        Ipp32s idx;

        // select neighbour
        pNeighbour = m_mbinfo.mbs + nNeighbour;

        // cicle on blocks
        for (idx = 0;idx < 4;idx += 1)
        {
            Ipp32s blkQ, blkP;

            blkQ = EXTERNAL_BLOCK_MASK[HORIZONTAL_DEBLOCKING][CURRENT_BLOCK][idx];
            blkP = EXTERNAL_BLOCK_MASK[HORIZONTAL_DEBLOCKING][NEIGHBOUR_BLOCK][idx];

            // when one of couple of blocks has coeffs
            if ((cbp4x4_luma & blkQ) ||
                (pNeighbour->cbp4x4_luma & blkP))
                pStrength[idx] = 2;
            // when blocks nave no coeffs
            // we set strength is 1 in mixed mode
            else
                pStrength[idx] = 1;
        }
    }
    // external edge required in strong filtering
    else
        SetEdgeStrength(pStrength + 0, 3);

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFComplexFrameExternalEdge(DeblockingParametersMBAFF *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->StrengthComplex;
    Ipp32s i, nNeighbourBlockInc;

    // mixed edge is always deblocked
    {
        Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[VERTICAL_DEBLOCKING]);
        *pDeblockingFlag = 1;
    }

    // calculate neighbour block addition
    nNeighbourBlockInc = (pParams->nMBAddr & 1) ? 2 : 0;

    // we fill parameters using 2 passes
    for (i = 0;i < 2;i += 1)
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nLeft[i];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[VERTICAL_DEBLOCKING][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[VERTICAL_DEBLOCKING][NEIGHBOUR_BLOCK][idx / 2 + nNeighbourBlockInc];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                    pStrength[idx] = 2;
                // when blocks have no coeffs
                // set strength is 1
                else
                    pStrength[idx] = 1;
            }
        }
        // external edge required in strong filtering
        else
            SetEdgeStrength(pStrength + 0, 4);

        pStrength += 4;
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFComplexFrameExternalEdge(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFComplexFieldExternalEdge(DeblockingParametersMBAFF *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->StrengthComplex;
    Ipp32s i;

    // mixed edge is always deblocked
    {
        Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[VERTICAL_DEBLOCKING]);
        *pDeblockingFlag = 1;
    }

    // we fill parameters using 2 passes
    for (i = 0;i < 2;i += 1)
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nLeft[i];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[VERTICAL_DEBLOCKING][CURRENT_BLOCK][idx / 2 + i * 2];
                blkP = EXTERNAL_BLOCK_MASK[VERTICAL_DEBLOCKING][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                    pStrength[idx] = 2;
                // when blocks have no coeffs
                // set strength is 1
                else
                    pStrength[idx] = 1;
            }
        }
        // external edge required in strong filtering
        else
            SetEdgeStrength(pStrength + 0, 4);

        pStrength += 4;
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFComplexFieldExternalEdge(DeblockingParametersMBAFF *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFField(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);

    //
    // external edge
    //

    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nBlock, nNeighbourBlock;
                    Ipp32s iRefQ, iRefP;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                    {
                        nBlock = idx * 4;
                        nNeighbourBlock = idx * 4 + 3;
                    }
                    else
                    {
                        nBlock = idx;
                        nNeighbourBlock = idx + 12;
                    }

                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for current block
                        index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                            iRefQ = pRefPicList[index >> 1]->DeblockPicID(index & 1);
                        }
                        else
                            iRefQ = -1;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefP = pRefPicList[index >> 1]->DeblockPicID(index & 1);
                        }
                        else
                            iRefP = -1;
                    }

                    VM_ASSERT((iRefP != -1) || (iRefQ != -1));

                    // when reference indexes are equal
                    if (iRefQ == iRefP)
                    {
                        H264DecoderMotionVector *pVectorQ, *pVectorP;

                        pVectorQ = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                        pVectorP = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;

                        // compare motion vectors
                        if ((4 <= abs(pVectorQ->mvx - pVectorP->mvx)) ||
                            (2 <= abs(pVectorQ->mvy - pVectorP->mvy)))
                        {
                            pStrength[idx] = 1;
                            *pDeblockingFlag = 1;
                        }
                        else
                            pStrength[idx] = 0;
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if (HORIZONTAL_DEBLOCKING == dir)
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // cicle of edge(s)
        // we do all edges in one cicle
        for (idx = 4;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
            {
                pStrength[idx] = 2;
                *pDeblockingFlag = 1;
            }
            // compare motion vectors & reference indexes
            else
            {
                Ipp32s nBlock, nNeighbourBlock;
                Ipp32s iRefQ, iRefP;

                // calc block and neighbour block number
                if (VERTICAL_DEBLOCKING == dir)
                {
                    nBlock = (idx & 3) * 4 + (idx >> 2);
                    nNeighbourBlock = nBlock - 1;
                }
                else
                {
                    nBlock = idx;
                    nNeighbourBlock = idx - 4;
                }

                VM_ASSERT(-1 == m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock]);
                VM_ASSERT(-1 == m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nNeighbourBlock]);

                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;

                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;

                    // select reference index for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                    iRefQ = (index < 0) ?
                            (-1) :
                            (pRefPicList[index >> 1]->DeblockPicID(index & 1));

                    // select reference index for previous block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefP = (index < 0) ?
                            (-1) :
                            pRefPicList[index >> 1]->DeblockPicID(index & 1);
                }

                VM_ASSERT((iRefP != -1) || (iRefQ != -1));

                // when reference indexes are equal
                if (iRefQ == iRefP)
                {
                    H264DecoderMotionVector *pVectorQ, *pVectorP;

                    pVectorQ = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                    pVectorP = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;

                    // compare motion vectors
                    if ((4 <= abs(pVectorQ->mvx - pVectorP->mvx)) ||
                        (2 <= abs(pVectorQ->mvy - pVectorP->mvy)))
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                    else
                        pStrength[idx] = 0;
                }
                // when reference indexes are different
                else
                {
                    pStrength[idx] = 1;
                    *pDeblockingFlag = 1;
                }
            }
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice4MBAFFField(Ipp32u dir, DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice4MBAFFField(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nBlock, nNeighbourBlock;
                    Ipp32s iRefQFrw, iRefPFrw, iRefQBck, iRefPBck;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                    {
                        nBlock = idx * 4;
                        nNeighbourBlock = nBlock + 3;
                    }
                    else
                    {
                        nBlock = idx;
                        nNeighbourBlock = idx + 12;
                    }

                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for current block
                        index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                            iRefQFrw = pRefPicList[index >> 1]->DeblockPicID(index & 1);
                        }
                        else
                            iRefQFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                            iRefQBck = pRefPicList[index >> 1]->DeblockPicID(index & 1);
                        }
                        else
                            iRefQBck = -1;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefPFrw = pRefPicList[index >> 1]->DeblockPicID(index & 1);
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            iRefPBck = pRefPicList[index >> 1]->DeblockPicID(index & 1);
                        }
                        else
                            iRefPBck = -1;
                    }

                    // when reference indexes are equal
                    if (((iRefQFrw == iRefPFrw) && (iRefQBck == iRefPBck)) ||
                        ((iRefQFrw == iRefPBck) && (iRefQBck == iRefPFrw)))
                    {
                        // set initial value of strength
                        pStrength[idx] = 0;

                        // when forward and backward reference pictures of previous block are different
                        if (iRefPFrw != iRefPBck)
                        {
                            H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select current block motion vectors
                            pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                            pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                            // select previous block motion vectors
                            if (iRefQFrw == iRefPFrw)
                            {
                                pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                            }
                            else
                            {
                                pVectorPFrw = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            }

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (2 <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (2 <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                        // when forward and backward reference pictures of previous block are equal
                        else
                        {
                            H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select current block motion vectors
                            pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                            pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                            // select previous block motion vectors
                            pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (2 <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (2 <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                if ((4 <= abs(pVectorQFrw->mvx - pVectorPBck->mvx)) ||
                                    (2 <= abs(pVectorQFrw->mvy - pVectorPBck->mvy)) ||
                                    (4 <= abs(pVectorQBck->mvx - pVectorPFrw->mvx)) ||
                                    (2 <= abs(pVectorQBck->mvy - pVectorPFrw->mvy)))
                                {
                                    pStrength[idx] = 1;
                                    *pDeblockingFlag = 1;
                                }
                            }
                        }
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if (HORIZONTAL_DEBLOCKING == dir)
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // cicle of edge(s)
        // we do all edges in one cicle
        for (idx = 4;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
            {
                pStrength[idx] = 2;
                *pDeblockingFlag = 1;
            }
            // compare motion vectors & reference indexes
            else
            {
                Ipp32s nBlock, nNeighbourBlock;
                Ipp32s iRefQFrw, iRefQBck, iRefPFrw, iRefPBck;

                // calc block and neighbour block number
                if (VERTICAL_DEBLOCKING == dir)
                {
                    nBlock = (idx & 3) * 4 + (idx >> 2);
                    nNeighbourBlock = nBlock - 1;
                }
                else
                {
                    nBlock = idx;
                    nNeighbourBlock = idx - 4;
                }

                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;

                    // select forward reference pictures list
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                    // select forward reference index for block(s)
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                    iRefQFrw = (index < 0) ?
                            (-1) :
                            (pRefPicList[index >> 1]->DeblockPicID(index & 1));
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefPFrw = (index < 0) ?
                            (-1) :
                            pRefPicList[index >> 1]->DeblockPicID(index & 1);

                    // select backward reference pictures list
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                    // select backward reference index for block(s)
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock];
                    iRefQBck = (index < 0) ?
                            (-1) :
                            (pRefPicList[index >> 1]->DeblockPicID(index & 1));
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefPBck = (index < 0) ?
                            (-1) :
                            pRefPicList[index >> 1]->DeblockPicID(index & 1);
                }

                // when reference indexes are equal
                if (((iRefQFrw == iRefPFrw) && (iRefQBck == iRefPBck)) ||
                    ((iRefQFrw == iRefPBck) && (iRefQBck == iRefPFrw)))
                {
                    // set initial value of strength
                    pStrength[idx] = 0;

                    // when forward and backward reference pictures of previous block are different
                    if (iRefPFrw != iRefPBck)
                    {
                        H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                        H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                        // select current block motion vectors
                        pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                        pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                        // select previous block motion vectors
                        if (iRefQFrw == iRefPFrw)
                        {
                            pVectorPFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nNeighbourBlock;
                        }
                        else
                        {
                            pVectorPFrw = m_gmbinfo->MV[1][MBAddr].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;
                        }

                        // compare motion vectors
                        if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                            (2 <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                            (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                            (2 <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                        {
                            pStrength[idx] = 1;
                            *pDeblockingFlag = 1;
                        }
                    }
                    // when forward and backward reference pictures of previous block are equal
                    else
                    {
                        H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                        H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                        // select current block motion vectors
                        pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                        pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                        // select previous block motion vectors
                        pVectorPFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;
                        pVectorPBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nNeighbourBlock;

                        // compare motion vectors
                        if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                            (2 <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                            (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                            (2 <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                        {
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPBck->mvx)) ||
                                (2 <= abs(pVectorQFrw->mvy - pVectorPBck->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPFrw->mvx)) ||
                                (2 <= abs(pVectorQBck->mvy - pVectorPFrw->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                    }
                }
                // when reference indexes are different
                else
                {
                    pStrength[idx] = 1;
                    *pDeblockingFlag = 1;
                }
            }
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice4MBAFFField(Ipp32u dir, DeblockingParameters *pParams)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
