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

#ifndef __UMC_H264_RECONSTRUCT_TEMPLATES_H
#define __UMC_H264_RECONSTRUCT_TEMPLATES_H

namespace UMC
{

#define NO_PADDING

// turn off the "conditional expression is constant" warning
#pragma warning(disable: 4127)

enum
{
    BI_DIR                      = 0,
    UNI_DIR                     = 1
};

template <typename PlaneY,
          typename PlaneUV,
          Ipp32s color_format,
          Ipp32s is_field,
          Ipp32s is_weight>
class ReconstructMB
{
public:
    typedef PlaneY * PlanePtrY;
    typedef PlaneUV * PlanePtrUV;

    STRUCT_DECLSPEC_ALIGN class ReconstructParams
    {
    public:
        PlanePtrY m_pDstY;                                      // (PlanePtrY) pointer to an Y plane
        PlanePtrUV m_pDstU;                                     // (PlanePtrUV) pointer to an U plane
        PlanePtrUV m_pDstV;                                     // (PlanePtrUV) pointer to an V plane
        Ipp32s m_iDstPitchLuma;                                     // (Ipp32s) pitch of planes
        Ipp32s m_iDstPitchChroma;                                     // (Ipp32s) pitch of planes
        // these variables used for optimized prediction
        PlanePtrY m_pSrcY[2];                                   // (PlanePtrY) pointer to an Y plane
        PlanePtrUV m_pSrcU[2];                                  // (PlanePtrUV) pointer to an U plane
        PlanePtrUV m_pSrcV[2];                                  // (PlanePtrUV) pointer to an V plane
        Ipp32s m_iSrcPitchLuma[2];                              // (Ipp32s) pitch of luminance planes
        Ipp32s m_iSrcPitchChroma[2];                            // (Ipp32s) pitch of chrominance planes

        // prediction pointers
        H264DecoderMotionVector *(m_pMV[2]);                    // (H264DecoderMotionVector * []) array of pointers to motion vectors
        Ipp32s m_iRefIndex[2];                                  // (Ipp32s) current reference index
        Ipp8s *(m_pRefIndex[2]);                                // (Ipp8s * []) pointer to array of reference indexes

        // current macroblock parameters
        Ipp32s m_iOffsetLuma;                                   // (Ipp32s) luminance offset
        Ipp32s m_iOffsetChroma;                                 // (Ipp32s) chrominance offset
        Ipp32s m_iLumaXPos;                                     // (Ipp32s) horizontal luminance position (for MV checking)
        Ipp32s m_iLumaYPos;                                     // (Ipp32s) vertical luminance position (for MV checking)
        Ipp32s m_iChromaXPos;                                   // (Ipp32s) horizontal chrominance position (for MV checking)
        Ipp32s m_iChromaYPos;                                   // (Ipp32s) vertical chrominance position (for MV checking)
        Ipp32s m_iIntraMBLumaOffset;
        Ipp32s m_iIntraMBChromaOffset;
        Ipp32s m_iIntraMBLumaOffsetTmp;
        Ipp32s m_iIntraMBChromaOffsetTmp;
        IppiSize roi;                                           // (Ipp32s) size of processed block
        IppiSize roi_chroma;                                    // (Ipp32s) size of processed block

        // weighting parameters
        Ipp32s luma_log2_weight_denom;                          // (Ipp32s)
        Ipp32s chroma_log2_weight_denom;                        // (Ipp32s)
        Ipp32s weighted_bipred_idc;                             // (Ipp32s)
        bool m_bBidirWeightMB;                                  // (bool) flag of bidirectional weighting
        bool m_bUnidirWeightMB;                                 // (bool) flag of unidirectional weighting
        Ipp32s bit_depth_luma;                                  // (Ipp32s) bits per pixel for luma plane
        Ipp32s bit_depth_chroma;                                // (Ipp32s) bits per pixel for chroma planes
        H264SegmentDecoder *m_pSegDec;                          // (H264SegmentDecoder *) pointer to segment decoder

        // current frame parameters
        IppiSize m_lumaSize;                                 // (sDimensions) size of luminance
        IppiSize m_chromaSize;                               // (sDimensions) size of chrominance

        bool is_mbaff;
        bool is_bottom_mb;
    };

    inline
    Ipp32s ChromaOffset(Ipp32s x, Ipp32s y, Ipp32s pitch)
    {
        return (x >> (Ipp32s)(color_format < 3)) + (y >> (Ipp32s)(color_format < 2)) * pitch;

    } // Ipp32s ChromaOffset(Ipp32s x, Ipp32s y, Ipp32s pitch)

    // we can't use template instead implicit parameter's passing
    // couse we use slightly different types
    void CompensateMotionLumaBlock(ReconstructParams *pParams,
                                   Ipp32s iDir,
                                   Ipp32s iBlockNumber,
                                   Ipp32s iUniDir,
                                   Ipp8u *)
    {
        IppVCInterpolateBlock_8u interpolateInfo;
        Ipp32s iRefIndex;
        Ipp32s iRefFieldTop;

        // get reference index
        iRefIndex =
        (pParams->m_iRefIndex[iDir] = pParams->m_pRefIndex[iDir][iBlockNumber]);
        if (is_field && pParams->is_mbaff)
            iRefIndex >>= 1;
        VM_ASSERT(iRefIndex >= 0);

        // get reference frame & pitch
        interpolateInfo.pSrc[0] = (Ipp8u *) pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->m_pYPlane;
        VM_ASSERT(interpolateInfo.pSrc[0]);
        interpolateInfo.srcStep = pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->pitch_luma();

        if (is_field)
        {
            if (pParams->is_mbaff)
            {
                iRefFieldTop = pParams->is_bottom_mb ^ (pParams->m_iRefIndex[iDir] & 1);
                pParams->m_iRefIndex[iDir] = iRefIndex;
            }
            else
                iRefFieldTop = GetReferenceField(pParams->m_pSegDec->m_pFields[iDir], iRefIndex);

            if (iRefFieldTop)
                interpolateInfo.pSrc[0] += interpolateInfo.srcStep;

            interpolateInfo.srcStep *= 2;
        }

        // create vectors & factors
        interpolateInfo.pointVector.x = pParams->m_pMV[iDir][iBlockNumber].mvx;
        interpolateInfo.pointVector.y = pParams->m_pMV[iDir][iBlockNumber].mvy;

        // we should do interpolation if vertical or horizontal vector isn't zero
        if (interpolateInfo.pointVector.x | interpolateInfo.pointVector.y)
        {
            // fill parameters
            interpolateInfo.pDst[0] = pParams->m_pDstY;
            interpolateInfo.dstStep = pParams->m_iDstPitchLuma;
            interpolateInfo.sizeFrame = pParams->m_lumaSize;
            interpolateInfo.sizeBlock = pParams->roi;
            interpolateInfo.pointBlockPos.x = pParams->m_iLumaXPos;
            interpolateInfo.pointBlockPos.y = pParams->m_iLumaYPos;

            ippiInterpolateLumaBlock_H264_8u_P1R(&interpolateInfo);

            // save pointers for optimized interpolation
            pParams->m_pSrcY[iDir] = pParams->m_pDstY;
            pParams->m_iSrcPitchLuma[iDir] = pParams->m_iDstPitchLuma;
        }
        else
        {
            Ipp32s iOffset = pParams->m_iOffsetLuma +
                             pParams->m_iIntraMBLumaOffset;

            // save pointers for optimized interpolation
            if (0 == iUniDir)
            {
                pParams->m_pSrcY[iDir] = (PlanePtrY) interpolateInfo.pSrc[0] + iOffset;
                pParams->m_iSrcPitchLuma[iDir] = interpolateInfo.srcStep;
            }
            // we have to do interpolation for uni-direction motion
            else
            {
                ippiInterpolateLuma_H264_8u_C1R((PlanePtrY) (interpolateInfo.pSrc[0] + iOffset),
                                                interpolateInfo.srcStep,
                                                pParams->m_pDstY,
                                                pParams->m_iDstPitchLuma,
                                                0,
                                                0,
                                                pParams->roi);

                // save pointers for optimized interpolation
                pParams->m_pSrcY[iDir] = pParams->m_pDstY;
                pParams->m_iSrcPitchLuma[iDir] = pParams->m_iDstPitchLuma;
            }
        }

    } // void CompensateMotionLumaBlock(ReconstructParams *pParams,

    void CompensateMotionLumaBlock(ReconstructParams *pParams,
                                   Ipp32s iDir,
                                   Ipp32s iBlockNumber,
                                   Ipp32s iUniDir,
                                   Ipp16u *)
    {
        IppVCInterpolateBlock_16u interpolateInfo;
        Ipp32s iRefIndex;
        Ipp32s iRefFieldTop;

        // get reference index
        iRefIndex =
        (pParams->m_iRefIndex[iDir] = pParams->m_pRefIndex[iDir][iBlockNumber]);
        if (is_field && pParams->is_mbaff)
            iRefIndex >>= 1;
        VM_ASSERT(iRefIndex >= 0);

        // get reference frame & pitch
        interpolateInfo.pSrc[0] = (Ipp16u *) pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->m_pYPlane;
        VM_ASSERT(interpolateInfo.pSrc[0]);
        interpolateInfo.srcStep = pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->pitch_luma();

        if (is_field)
        {
            if (pParams->is_mbaff)
            {
                iRefFieldTop = pParams->is_bottom_mb ^ (pParams->m_iRefIndex[iDir] & 1);
                pParams->m_iRefIndex[iDir] = iRefIndex;
            }
            else
                iRefFieldTop = GetReferenceField(pParams->m_pSegDec->m_pFields[iDir], iRefIndex);

            if (iRefFieldTop)
                interpolateInfo.pSrc[0] += interpolateInfo.srcStep;

            interpolateInfo.srcStep *= 2;
        }

        // save vector
        interpolateInfo.pointVector.x = pParams->m_pMV[iDir][iBlockNumber].mvx;
        interpolateInfo.pointVector.y = pParams->m_pMV[iDir][iBlockNumber].mvy;

        // we should do interpolation if vertical or horizontal vector isn't zero
        if (interpolateInfo.pointVector.x | interpolateInfo.pointVector.y)
        {
            // fill parameters
            interpolateInfo.pDst[0] = pParams->m_pDstY;
            interpolateInfo.dstStep = pParams->m_iDstPitchLuma;
            interpolateInfo.sizeFrame = pParams->m_lumaSize;
            interpolateInfo.sizeBlock = pParams->roi;
            interpolateInfo.pointBlockPos.x = pParams->m_iLumaXPos;
            interpolateInfo.pointBlockPos.y = pParams->m_iLumaYPos;
            interpolateInfo.bitDepth = pParams->bit_depth_luma;

            ippiInterpolateLumaBlock_H264_16u_P1R(&interpolateInfo);

            // save pointers for optimized interpolation
            pParams->m_pSrcY[iDir] = pParams->m_pDstY;
            pParams->m_iSrcPitchLuma[iDir] = pParams->m_iDstPitchLuma;
        }
        else
        {
            Ipp32s iOffset = pParams->m_iOffsetLuma +
                             pParams->m_iIntraMBLumaOffset;

            // save pointers for optimized interpolation
            if (0 == iUniDir)
            {
                pParams->m_pSrcY[iDir] = (PlanePtrY) interpolateInfo.pSrc[0] + iOffset;
                pParams->m_iSrcPitchLuma[iDir] = interpolateInfo.srcStep;
            }
            // we have to do interpolation for uni-direction motion
            else
            {
                IppVCInterpolate_16u info;

                info.pSrc = (PlanePtrY) (interpolateInfo.pSrc[0] + iOffset);
                info.srcStep = interpolateInfo.srcStep;
                info.pDst = pParams->m_pDstY;
                info.dstStep = pParams->m_iDstPitchLuma;
                info.dx = 0;
                info.dy = 0;
                info.roiSize = pParams->roi;
                info.bitDepth = pParams->bit_depth_luma;

                ippiInterpolateLuma_H264_16u_C1R(&info);

                // save pointers for optimized interpolation
                pParams->m_pSrcY[iDir] = pParams->m_pDstY;
                pParams->m_iSrcPitchLuma[iDir] = pParams->m_iDstPitchLuma;
            }
        }

    } // void CompensateMotionLumaBlock(ReconstructParams *pParams,

    void CompensateMotionChromaBlock(ReconstructParams *pParams,
                                     Ipp32s iDir,
                                     Ipp32s iBlockNumber,
                                     Ipp32s iUniDir,
                                     Ipp8u *)
    {
        IppVCInterpolateBlock_8u interpolateInfo;
        Ipp32s iRefIndex;
        Ipp32s iRefFieldTop;

        // get reference index
        iRefIndex = pParams->m_pRefIndex[iDir][iBlockNumber];
        if (is_field && pParams->is_mbaff)
            iRefIndex >>= 1;
        VM_ASSERT(iRefIndex >= 0);

        // get reference frame & pitch
        interpolateInfo.pSrc[0] = (PlanePtrUV) pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->m_pUPlane;
        interpolateInfo.pSrc[1] = (PlanePtrUV) pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->m_pVPlane;
        VM_ASSERT(interpolateInfo.pSrc[0]);
        VM_ASSERT(interpolateInfo.pSrc[1]);
        interpolateInfo.srcStep = pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->pitch_chroma();

        if (is_field)
        {
            if (pParams->is_mbaff)
            {
                iRefFieldTop = pParams->is_bottom_mb ^ (pParams->m_pRefIndex[iDir][iBlockNumber] & 1);
                pParams->m_iRefIndex[iDir] = iRefIndex;
            }
            else
                iRefFieldTop = GetReferenceField(pParams->m_pSegDec->m_pFields[iDir], iRefIndex);

            if (iRefFieldTop)
            {
                interpolateInfo.pSrc[0] += interpolateInfo.srcStep;
                interpolateInfo.pSrc[1] += interpolateInfo.srcStep;
            }

            interpolateInfo.srcStep *= 2;
        }

        // save vector
        interpolateInfo.pointVector.x = pParams->m_pMV[iDir][iBlockNumber].mvx;
        interpolateInfo.pointVector.y = pParams->m_pMV[iDir][iBlockNumber].mvy;

        // adjust vectors when we decode a field
        if ((is_field) && (1 == color_format))
        {
            if (pParams->is_mbaff)
            {
                interpolateInfo.pointVector.y += (pParams->is_bottom_mb - iRefFieldTop) * 2;
            }
            else
            {
                if (!pParams->m_pSegDec->m_field_index && iRefFieldTop)
                    interpolateInfo.pointVector.y -= 2;
                else if(pParams->m_pSegDec->m_field_index && !iRefFieldTop)
                    interpolateInfo.pointVector.y += 2;
            }
        }

        // we should do interpolation if vertical or horizontal vector isn't zero
        if ((interpolateInfo.pointVector.x | interpolateInfo.pointVector.y) ||
            (iUniDir))
        {
            // scale motion vector
            interpolateInfo.pointVector.x <<= ((Ipp32s) (3 <= color_format));
            interpolateInfo.pointVector.y <<= ((Ipp32s) (2 <= color_format));

            // fill parameters
            interpolateInfo.pDst[0] = pParams->m_pDstU;
            interpolateInfo.pDst[1] = pParams->m_pDstV;
            interpolateInfo.dstStep = pParams->m_iDstPitchChroma;
            interpolateInfo.sizeFrame = pParams->m_chromaSize;
            interpolateInfo.sizeBlock = pParams->roi_chroma;
            interpolateInfo.pointBlockPos.x = pParams->m_iChromaXPos;
            interpolateInfo.pointBlockPos.y = pParams->m_iChromaYPos;

            ippiInterpolateChromaBlock_H264_8u_P2R(&interpolateInfo);

            // save pointers for optimized interpolation
            pParams->m_pSrcU[iDir] = pParams->m_pDstU;
            pParams->m_pSrcV[iDir] = pParams->m_pDstV;
            pParams->m_iSrcPitchChroma[iDir] = pParams->m_iDstPitchChroma;
        }
        else
        {
            Ipp32s iOffset = pParams->m_iOffsetChroma +
                             pParams->m_iIntraMBChromaOffset;

            // save pointers for optimized interpolation
            pParams->m_pSrcU[iDir] = (PlanePtrUV) interpolateInfo.pSrc[0] + iOffset;
            pParams->m_pSrcV[iDir] = (PlanePtrUV) interpolateInfo.pSrc[1] + iOffset;
            pParams->m_iSrcPitchChroma[iDir] = interpolateInfo.srcStep;
        }

    } // void CompensateMotionChromaBlock(ReconstructParams *pParams,

    void CompensateMotionChromaBlock(ReconstructParams *pParams,
                                     Ipp32s iDir,
                                     Ipp32s iBlockNumber,
                                     Ipp32s iUniDir,
                                     Ipp16u *)
    {
        IppVCInterpolateBlock_16u interpolateInfo;
        Ipp32s iRefIndex;
        Ipp32s iRefFieldTop;

        // get reference index
        iRefIndex = pParams->m_pRefIndex[iDir][iBlockNumber];
        if (is_field && pParams->is_mbaff)
            iRefIndex >>= 1;
        VM_ASSERT(iRefIndex >= 0);

        // get reference frame & pitch
        interpolateInfo.pSrc[0] = (PlanePtrUV) pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->m_pUPlane;
        interpolateInfo.pSrc[1] = (PlanePtrUV) pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->m_pVPlane;
        VM_ASSERT(interpolateInfo.pSrc[0]);
        VM_ASSERT(interpolateInfo.pSrc[1]);
        interpolateInfo.srcStep = pParams->m_pSegDec->m_pRefPicList[iDir][iRefIndex]->pitch_chroma();

        if (is_field)
        {
            if (pParams->is_mbaff)
            {
                iRefFieldTop = pParams->is_bottom_mb ^ (pParams->m_pRefIndex[iDir][iBlockNumber] & 1);
                pParams->m_iRefIndex[iDir] = iRefIndex;
            }
            else
                iRefFieldTop = GetReferenceField(pParams->m_pSegDec->m_pFields[iDir], iRefIndex);

            if (iRefFieldTop)
            {
                interpolateInfo.pSrc[0] += interpolateInfo.srcStep;
                interpolateInfo.pSrc[1] += interpolateInfo.srcStep;
            }

            interpolateInfo.srcStep *= 2;
        }

        // save vector
        interpolateInfo.pointVector.x = pParams->m_pMV[iDir][iBlockNumber].mvx;
        interpolateInfo.pointVector.y = pParams->m_pMV[iDir][iBlockNumber].mvy;

        // adjust vectors when we decode a field
        if ((is_field) && (1 == color_format))
        {
            if (pParams->is_mbaff)
            {
                interpolateInfo.pointVector.y += (pParams->is_bottom_mb - iRefFieldTop) * 2;
            }
            else
            {
                if (!pParams->m_pSegDec->m_field_index && iRefFieldTop)
                    interpolateInfo.pointVector.y -= 2;
                else if(pParams->m_pSegDec->m_field_index && !iRefFieldTop)
                    interpolateInfo.pointVector.y += 2;
            }
        }

        // we should do interpolation if vertical or horizontal vector isn't zero
        if ((interpolateInfo.pointVector.x | interpolateInfo.pointVector.y) ||
            (iUniDir))
        {
            // scale motion vector
            interpolateInfo.pointVector.x <<= ((Ipp32s) (3 <= color_format));
            interpolateInfo.pointVector.y <<= ((Ipp32s) (2 <= color_format));

            // fill parameters
            interpolateInfo.pDst[0] = pParams->m_pDstU;
            interpolateInfo.pDst[1] = pParams->m_pDstV;
            interpolateInfo.dstStep = pParams->m_iDstPitchChroma;
            interpolateInfo.sizeFrame = pParams->m_chromaSize;
            interpolateInfo.sizeBlock = pParams->roi_chroma;
            interpolateInfo.pointBlockPos.x = pParams->m_iChromaXPos;
            interpolateInfo.pointBlockPos.y = pParams->m_iChromaYPos;
            interpolateInfo.bitDepth = pParams->bit_depth_chroma;

            ippiInterpolateChromaBlock_H264_16u_P2R(&interpolateInfo);

            // save pointers for optimized interpolation
            pParams->m_pSrcU[iDir] = pParams->m_pDstU;
            pParams->m_pSrcV[iDir] = pParams->m_pDstV;
            pParams->m_iSrcPitchChroma[iDir] = pParams->m_iDstPitchChroma;
        }
        else
        {
            Ipp32s iOffset = pParams->m_iOffsetChroma +
                             pParams->m_iIntraMBChromaOffset;

            // save pointers for optimized interpolation
            pParams->m_pSrcU[iDir] = (PlanePtrUV) interpolateInfo.pSrc[0] + iOffset;
            pParams->m_pSrcV[iDir] = (PlanePtrUV) interpolateInfo.pSrc[1] + iOffset;
            pParams->m_iSrcPitchChroma[iDir] = interpolateInfo.srcStep;
        }

    } // void CompensateMotionChromaBlock(ReconstructParams *pParams,

    inline
    void InterpolateMacroblock(ReconstructParams *pParams)
    {
        // combine bidir predictions into one,
        // no weighting

        InterpolateBlock(pParams->m_pSrcY[0],
                         pParams->m_pSrcY[1],
                         pParams->m_pDstY,
                         pParams->roi.width,
                         pParams->roi.height,
                         pParams->m_iSrcPitchLuma[0],
                         pParams->m_iSrcPitchLuma[1],
                         pParams->m_iDstPitchLuma,
                         pParams->bit_depth_luma);

        if (color_format)
        {
            InterpolateBlock(pParams->m_pSrcV[0],
                             pParams->m_pSrcV[1],
                             pParams->m_pDstV,
                             pParams->roi_chroma.width,
                             pParams->roi_chroma.height,
                             pParams->m_iSrcPitchChroma[0],
                             pParams->m_iSrcPitchChroma[1],
                             pParams->m_iDstPitchChroma,
                             pParams->bit_depth_chroma);
            InterpolateBlock(pParams->m_pSrcU[0],
                             pParams->m_pSrcU[1],
                             pParams->m_pDstU,
                             pParams->roi_chroma.width,
                             pParams->roi_chroma.height,
                             pParams->m_iSrcPitchChroma[0],
                             pParams->m_iSrcPitchChroma[1],
                             pParams->m_iDstPitchChroma,
                             pParams->bit_depth_chroma);
        }

    } // void InterpolateMacroblock(ReconstructParams *pParams)

    inline
    void BiDirWeightMacroblock(ReconstructParams *pParams)
    {
        // combine bidir predictions into one,
        // explicit weighting
        BiDirWeightBlock(pParams->m_pSrcY[0],
                         pParams->m_pSrcY[1],
                         pParams->m_pDstY,
                         pParams->m_iSrcPitchLuma[0],
                         pParams->m_iSrcPitchLuma[1],
                         pParams->m_iDstPitchLuma,
                         pParams->luma_log2_weight_denom,
                         pParams->m_pSegDec->m_pPredWeight[D_DIR_FWD][pParams->m_iRefIndex[D_DIR_FWD]].luma_weight,
                         pParams->m_pSegDec->m_pPredWeight[D_DIR_FWD][pParams->m_iRefIndex[D_DIR_FWD]].luma_offset,
                         pParams->m_pSegDec->m_pPredWeight[D_DIR_BWD][pParams->m_iRefIndex[D_DIR_BWD]].luma_weight,
                         pParams->m_pSegDec->m_pPredWeight[D_DIR_BWD][pParams->m_iRefIndex[D_DIR_BWD]].luma_offset,
                         pParams->roi,
                         pParams->bit_depth_luma);

        if (color_format)
        {
            BiDirWeightBlock(pParams->m_pSrcV[0],
                             pParams->m_pSrcV[1],
                             pParams->m_pDstV,
                             pParams->m_iSrcPitchChroma[0],
                             pParams->m_iSrcPitchChroma[1],
                             pParams->m_iDstPitchChroma,
                             pParams->chroma_log2_weight_denom,
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_FWD][pParams->m_iRefIndex[D_DIR_FWD]].chroma_weight[1],
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_FWD][pParams->m_iRefIndex[D_DIR_FWD]].chroma_offset[1],
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_BWD][pParams->m_iRefIndex[D_DIR_BWD]].chroma_weight[1],
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_BWD][pParams->m_iRefIndex[D_DIR_BWD]].chroma_offset[1],
                             pParams->roi_chroma,
                             pParams->bit_depth_chroma);

            BiDirWeightBlock(pParams->m_pSrcU[0],
                             pParams->m_pSrcU[1],
                             pParams->m_pDstU,
                             pParams->m_iSrcPitchChroma[0],
                             pParams->m_iSrcPitchChroma[1],
                             pParams->m_iDstPitchChroma,
                             pParams->chroma_log2_weight_denom,
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_FWD][pParams->m_iRefIndex[D_DIR_FWD]].chroma_weight[0],
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_FWD][pParams->m_iRefIndex[D_DIR_FWD]].chroma_offset[0],
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_BWD][pParams->m_iRefIndex[D_DIR_BWD]].chroma_weight[0],
                             pParams->m_pSegDec->m_pPredWeight[D_DIR_BWD][pParams->m_iRefIndex[D_DIR_BWD]].chroma_offset[0],
                             pParams->roi_chroma,
                             pParams->bit_depth_chroma);
        }

    } // void BiDirWeightMacroblock(ReconstructParams *pParams)

    inline
    void BiDirWeightMacroblockImplicit(ReconstructParams *pParams, Ipp32s iBlockNumber)
    {
        FactorArrayValue iDistScaleFactor;

        if (is_field && pParams->is_mbaff)
        {
            Ipp32s curfield = pParams->is_bottom_mb;
            Ipp32s ref0field = curfield ^ ((pParams->m_pRefIndex[D_DIR_FWD][iBlockNumber]) & 1);
            Ipp32s ref1field = curfield ^ ((pParams->m_pRefIndex[D_DIR_BWD][iBlockNumber]) & 1);

            const FactorArrayValue *pDistScaleFactors = pParams->m_pSegDec->m_pSlice->GetDistScaleFactorAFF()->values[pParams->m_iRefIndex[D_DIR_BWD]][curfield][ref0field][ref1field];
            iDistScaleFactor = pDistScaleFactors[pParams->m_iRefIndex[D_DIR_FWD]] >> 2;
        }
        else
        {
            iDistScaleFactor = pParams->m_pSegDec->m_pSlice->GetDistScaleFactor()->values[pParams->m_iRefIndex[D_DIR_BWD]][pParams->m_iRefIndex[D_DIR_FWD]] >> 2;
        }

        // combine bidir predictions into one,
        // implicit weighting

        BiDirWeightBlockImplicit(pParams->m_pSrcY[0],
                                 pParams->m_pSrcY[1],
                                 pParams->m_pDstY,
                                 pParams->m_iSrcPitchLuma[0],
                                 pParams->m_iSrcPitchLuma[1],
                                 pParams->m_iDstPitchLuma,
                                 64 - iDistScaleFactor,
                                 iDistScaleFactor,
                                 pParams->roi,
                                 pParams->bit_depth_luma);

        if (color_format)
        {
            BiDirWeightBlockImplicit(pParams->m_pSrcV[0],
                                     pParams->m_pSrcV[1],
                                     pParams->m_pDstV,
                                     pParams->m_iSrcPitchChroma[0],
                                     pParams->m_iSrcPitchChroma[1],
                                     pParams->m_iDstPitchChroma,
                                     64 - iDistScaleFactor,
                                     iDistScaleFactor,
                                     pParams->roi_chroma,
                                     pParams->bit_depth_chroma);

            BiDirWeightBlockImplicit(pParams->m_pSrcU[0],
                                     pParams->m_pSrcU[1],
                                     pParams->m_pDstU,
                                     pParams->m_iSrcPitchChroma[0],
                                     pParams->m_iSrcPitchChroma[1],
                                     pParams->m_iDstPitchChroma,
                                     64 - iDistScaleFactor,
                                     iDistScaleFactor,
                                     pParams->roi_chroma,
                                     pParams->bit_depth_chroma);

        }

    } // void BiDirWeightMacroblockImplicit(ReconstructParams *pParams)

    inline
    void UniDirWeightLuma(ReconstructParams *pParams, Ipp32s iDir)
    {
        UniDirWeightBlock(pParams->m_pDstY,
                          pParams->m_iDstPitchLuma,
                          pParams->luma_log2_weight_denom,
                          pParams->m_pSegDec->m_pPredWeight[iDir][pParams->m_iRefIndex[iDir]].luma_weight,
                          pParams->m_pSegDec->m_pPredWeight[iDir][pParams->m_iRefIndex[iDir]].luma_offset,
                          pParams->roi,
                          pParams->bit_depth_luma);

    } // void UniDirWeightLuma(ReconstructParams *params, Ipp32s iDir)

    inline
    void UniDirWeightChroma(ReconstructParams *pParams, Ipp32s iDir)
    {
        UniDirWeightBlock(pParams->m_pDstV,
                          pParams->m_iDstPitchChroma,
                          pParams->chroma_log2_weight_denom,
                          pParams->m_pSegDec->m_pPredWeight[iDir][pParams->m_iRefIndex[iDir]].chroma_weight[1],
                          pParams->m_pSegDec->m_pPredWeight[iDir][pParams->m_iRefIndex[iDir]].chroma_offset[1],
                          pParams->roi_chroma,
                          pParams->bit_depth_chroma);

        UniDirWeightBlock(pParams->m_pDstU,
                          pParams->m_iDstPitchChroma,
                          pParams->chroma_log2_weight_denom,
                          pParams->m_pSegDec->m_pPredWeight[iDir][pParams->m_iRefIndex[iDir]].chroma_weight[0],
                          pParams->m_pSegDec->m_pPredWeight[iDir][pParams->m_iRefIndex[iDir]].chroma_offset[0],
                          pParams->roi_chroma,
                          pParams->bit_depth_chroma);

    } // void UniDirWeightLuma(ReconstructParams *params, Ipp32s iDir)

    void CompensateBiDirBlock(ReconstructParams &params,
                              PlanePtrY pDstY,
                              PlanePtrUV pDstU,
                              PlanePtrUV pDstV,
                              Ipp32s iPitchLuma,
                              Ipp32s iPitchChroma,
                              Ipp32s iBlockNumber)
    {
        // set the destination
        params.m_pDstY = ((PlanePtrY) params.m_pSegDec->m_pPredictionBuffer) +
                         params.m_iIntraMBLumaOffsetTmp;
        params.m_iDstPitchLuma = 16;
        // do forward prediction
        CompensateMotionLumaBlock(&params, D_DIR_FWD, iBlockNumber, BI_DIR, params.m_pDstY);

        if (color_format)
        {
            params.m_pDstU = (PlanePtrUV) ((((PlanePtrY) params.m_pSegDec->m_pPredictionBuffer) + 16 * 16) +
                                          params.m_iIntraMBChromaOffsetTmp);
            params.m_pDstV = (PlanePtrUV) params.m_pSegDec->m_pPredictionBuffer + 2*16 * 16 +
                                          params.m_iIntraMBChromaOffsetTmp;
            params.m_iDstPitchChroma = 16;
            // do forward prediction
            CompensateMotionChromaBlock(&params, D_DIR_FWD, iBlockNumber, BI_DIR, params.m_pDstU);
        }

        // set the destination
        params.m_pDstY = pDstY + params.m_iIntraMBLumaOffset;
        params.m_iDstPitchLuma = iPitchLuma;
        // do backward prediction
        CompensateMotionLumaBlock(&params, D_DIR_BWD, iBlockNumber, BI_DIR, params.m_pDstY);

        if (color_format)
        {
            params.m_pDstU = pDstU + params.m_iIntraMBChromaOffset;
            params.m_pDstV = pDstV + params.m_iIntraMBChromaOffset;
            params.m_iDstPitchChroma = iPitchChroma;
            // do backward prediction
            CompensateMotionChromaBlock(&params, D_DIR_BWD, iBlockNumber, BI_DIR, params.m_pDstU);
        }

        // do waighting
        if ((is_weight) &&
            (params.m_bBidirWeightMB))
        {
            if (1 == params.weighted_bipred_idc)
                BiDirWeightMacroblock(&params);
            else if (2 == params.weighted_bipred_idc)
                BiDirWeightMacroblockImplicit(&params, iBlockNumber);
            else
                VM_ASSERT(0);
        }
        else
        {
            InterpolateMacroblock(&params);
        }

    } // void CompensateBiDirBlock(ReconstructParams &params,

    void CompensateUniDirBlock(ReconstructParams &params,
                               PlanePtrY pDstY,
                               PlanePtrUV pDstU,
                               PlanePtrUV pDstV,
                               Ipp32s iPitchLuma,
                               Ipp32s iPitchChroma,
                               Ipp32s iDir,
                               Ipp32s iBlockNumber)
    {
        // set the destination
        params.m_pDstY = pDstY + params.m_iIntraMBLumaOffset;
        params.m_iDstPitchLuma = iPitchLuma;
        // do forward prediction
        CompensateMotionLumaBlock(&params, iDir, iBlockNumber, UNI_DIR, params.m_pDstY);

        if (color_format)
        {
            params.m_pDstU = pDstU + params.m_iIntraMBChromaOffset;
            params.m_pDstV = pDstV + params.m_iIntraMBChromaOffset;
            params.m_iDstPitchChroma = iPitchChroma;
            // do forward prediction
            CompensateMotionChromaBlock(&params, iDir, iBlockNumber, UNI_DIR, params.m_pDstU);
        }

        // optional prediction weighting
        if ((is_weight) &&
            (params.m_bUnidirWeightMB))
        {
            const PredWeightTable *pTab = params.m_pSegDec->m_pPredWeight[iDir] + params.m_iRefIndex[iDir];

            if (pTab->luma_weight_flag)
                UniDirWeightLuma(&params, iDir);

            if ((color_format) &&
                (pTab->chroma_weight_flag))
                UniDirWeightChroma(&params, iDir);
        }

    } // void CompensateUniDirBlock(ReconstructParams &params,

    void CompensateBlock8x8(PlanePtrY pDstY,
                            PlanePtrUV pDstU,
                            PlanePtrUV pDstV,
                            Ipp32s iPitchLuma,
                            Ipp32s iPitchChroma,
                            ReconstructParams &params,
                            Ipp32s iSubBlockType,
                            Ipp32s iSubBlockDir,
                            Ipp32s iSubBlockNumber)
    {
        switch (iSubBlockType)
        {
        case SBTYPE_8x8:
            {
                params.roi.width = 8;
                params.roi.height = 8;
                params.roi_chroma.width = 8 >> ((Ipp32s) (3 > color_format));
                params.roi_chroma.height = 8 >> ((Ipp32s) (2 > color_format));
                params.m_iIntraMBLumaOffset = 0;
                params.m_iIntraMBChromaOffset = 0;

                if ((D_DIR_BIDIR == iSubBlockDir) ||
                    (D_DIR_DIRECT == iSubBlockDir) ||
                    (D_DIR_DIRECT_SPATIAL_BIDIR == iSubBlockDir))
                {
                    params.m_iIntraMBLumaOffsetTmp = 0;
                    params.m_iIntraMBChromaOffsetTmp = 0;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber);
                }
                else
                {
                    Ipp32s iDir = ((D_DIR_BWD == iSubBlockDir) || (D_DIR_DIRECT_SPATIAL_BWD == iSubBlockDir)) ?
                                   (D_DIR_BWD) :
                                   (D_DIR_FWD);

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber);
                }
            }
            break;

        case SBTYPE_8x4:
            {
                params.roi.width = 8;
                params.roi.height = 4;
                params.roi_chroma.width = 8 >> ((Ipp32s) (3 > color_format));
                params.roi_chroma.height = 4 >> ((Ipp32s) (2 > color_format));
                params.m_iIntraMBLumaOffset = 0;
                params.m_iIntraMBChromaOffset = 0;

                if ((D_DIR_BIDIR == iSubBlockDir) ||
                    (D_DIR_DIRECT == iSubBlockDir) ||
                    (D_DIR_DIRECT_SPATIAL_BIDIR == iSubBlockDir))
                {
                    params.m_iIntraMBLumaOffsetTmp = 0;
                    params.m_iIntraMBChromaOffsetTmp = 0;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber);

                    // set sub-block offset for second half of MB
                    params.m_iLumaYPos += 4;
                    params.m_iChromaYPos += 4 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 4 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    params.m_iIntraMBLumaOffsetTmp = 4 * 16;
                    params.m_iIntraMBChromaOffsetTmp = (4 >> ((Ipp32s) (2 > color_format))) * 16;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber + 4);
                }
                else
                {
                    Ipp32s iDir = ((D_DIR_BWD == iSubBlockDir) || (D_DIR_DIRECT_SPATIAL_BWD == iSubBlockDir)) ?
                                   (D_DIR_BWD) :
                                   (D_DIR_FWD);

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber);

                    // set sub-block offset for second half of MB
                    params.m_iLumaYPos += 4;
                    params.m_iChromaYPos += 4 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 4 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber + 4);
                }
            }
            break;

        case SBTYPE_4x8:
            {
                params.roi.width = 4;
                params.roi.height = 8;
                params.roi_chroma.width = 4 >> ((Ipp32s) (3 > color_format));
                params.roi_chroma.height = 8 >> ((Ipp32s) (2 > color_format));
                params.m_iIntraMBLumaOffset = 0;
                params.m_iIntraMBChromaOffset = 0;

                if ((D_DIR_BIDIR == iSubBlockDir) ||
                    (D_DIR_DIRECT == iSubBlockDir) ||
                    (D_DIR_DIRECT_SPATIAL_BIDIR == iSubBlockDir))
                {
                    params.m_iIntraMBLumaOffsetTmp = 0;
                    params.m_iIntraMBChromaOffsetTmp = 0;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber);

                    // set sub-block offset for second half of MB
                    params.m_iLumaXPos += 4;
                    params.m_iChromaXPos += 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 4;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (3 > color_format)));

                    params.m_iIntraMBLumaOffsetTmp = 4;
                    params.m_iIntraMBChromaOffsetTmp = (4 >> ((Ipp32s) (3 > color_format)));

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber + 1);
                }
                else
                {
                    Ipp32s iDir = ((D_DIR_BWD == iSubBlockDir) || (D_DIR_DIRECT_SPATIAL_BWD == iSubBlockDir)) ?
                                   (D_DIR_BWD) :
                                   (D_DIR_FWD);

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber);

                    // set sub-block offset for second half of MB
                    params.m_iLumaXPos += 4;
                    params.m_iChromaXPos += 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 4;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (3 > color_format)));

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber + 1);
                }
            }
            break;

        default:
            // 4x4 sub division
            {
                params.roi.width = 4;
                params.roi.height = 4;
                params.roi_chroma.width = 4 >> ((Ipp32s) (3 > color_format));
                params.roi_chroma.height = 4 >> ((Ipp32s) (2 > color_format));
                params.m_iIntraMBLumaOffset = 0;
                params.m_iIntraMBChromaOffset = 0;

                if ((D_DIR_BIDIR == iSubBlockDir) ||
                    (D_DIR_DIRECT == iSubBlockDir) ||
                    (D_DIR_DIRECT_SPATIAL_BIDIR == iSubBlockDir))
                {
                    params.m_iIntraMBLumaOffsetTmp = 0;
                    params.m_iIntraMBChromaOffsetTmp = 0;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber);

                    // set sub-block offset for second quarter of MB
                    params.m_iLumaXPos += 4;
                    params.m_iChromaXPos += 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 4;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (3 > color_format)));

                    params.m_iIntraMBLumaOffsetTmp = 4;
                    params.m_iIntraMBChromaOffsetTmp = (4 >> ((Ipp32s) (3 > color_format)));

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber + 1);

                    // set sub-block offset for third quarter of MB
                    params.m_iLumaXPos -= 4;
                    params.m_iLumaYPos += 4;
                    params.m_iChromaXPos -= 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iChromaYPos += 4 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 4 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    params.m_iIntraMBLumaOffsetTmp = 4 * 16;
                    params.m_iIntraMBChromaOffsetTmp = (4 >> ((Ipp32s) (2 > color_format))) * 16;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber + 4);

                    // set sub-block offset for fourth quarter of MB
                    params.m_iLumaXPos += 4;
                    params.m_iChromaXPos += 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 4 + 4 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (3 > color_format))) +
                                                    (4 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    params.m_iIntraMBLumaOffsetTmp = 4 + 4 * 16;
                    params.m_iIntraMBChromaOffsetTmp = (4 >> ((Ipp32s) (3 > color_format))) +
                                                       (4 >> ((Ipp32s) (2 > color_format))) * 16;

                    CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                         iSubBlockNumber + 5);
                }
                else
                {
                    Ipp32s iDir = ((D_DIR_BWD == iSubBlockDir) || (D_DIR_DIRECT_SPATIAL_BWD == iSubBlockDir)) ?
                                   (D_DIR_BWD) :
                                   (D_DIR_FWD);

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber);

                    // set sub-block offset for second quarter of MB
                    params.m_iLumaXPos += 4;
                    params.m_iChromaXPos += 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 4;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (3 > color_format)));

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber + 1);

                    // set sub-block offset for third quarter of MB
                    params.m_iLumaXPos -= 4;
                    params.m_iLumaYPos += 4;
                    params.m_iChromaXPos -= 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iChromaYPos += 4 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 4 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber + 4);

                    // set sub-block offset for fourth quarter of MB
                    params.m_iLumaXPos += 4;
                    params.m_iChromaXPos += 4 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 4 + 4 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (4 >> ((Ipp32s) (3 > color_format))) +
                                                    (4 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                          iSubBlockNumber + 5);
                }
            }
            break;
        }

    } // void CompensateBlock8x8(PlanePtrY pDstY,

    void CompensateMotionMacroBlock(PlanePtrY pDstY,
                                    PlanePtrUV pDstV,
                                    PlanePtrUV pDstU,
                                    Ipp32u mbXOffset, // for edge clipping
                                    Ipp32u mbYOffset,
                                    Ipp32s offsetY,
                                    Ipp32s offsetC,
                                    Ipp32s pitch_luma,
                                    Ipp32s pitch_chroma,
                                    H264SegmentDecoder *sd)
    {
        Ipp32s mbtype = sd->m_cur_mb.GlobalMacroblockInfo->mbtype;

        Ipp8s *psbdir = sd->m_cur_mb.LocalMacroblockInfo->sbdir;

        bool bBidirWeightMB = false;    // is bidir weighting in effect for the MB?
        bool bUnidirWeightMB = false;    // is explicit L0 weighting in effect for the MB?

        // Optional weighting vars
        Ipp32u weighted_bipred_idc = 0;
        Ipp32u luma_log2_weight_denom = 0;
        Ipp32u chroma_log2_weight_denom = 0;

        Ipp8s *pRefIndexL0 = NULL;
        Ipp8s *pRefIndexL1 = NULL;

        Ipp32s bit_depth_luma = sd->bit_depth_luma;
        Ipp32s bit_depth_cr = sd->bit_depth_chroma;

        VM_ASSERT(IS_INTER_MBTYPE(sd->m_cur_mb.GlobalMacroblockInfo->mbtype));

        ReconstructParams params;
        params.is_mbaff = (sd->m_pSliceHeader->MbaffFrameFlag != 0);
        params.is_bottom_mb = (params.is_mbaff && (sd->m_CurMBAddr & 1)) ? 1 : 0;

        pRefIndexL0 = sd->m_cur_mb.RefIdxs[0]->RefIdxs;

        if (((PREDSLICE == sd->m_pSliceHeader->slice_type) ||
            (S_PREDSLICE == sd->m_pSliceHeader->slice_type)) &&
            (sd->m_pPicParamSet->weighted_pred_flag != 0))
        {
            // L0 weighting specified in pic param set. Get weighting params
            // for the slice.
            luma_log2_weight_denom = sd->m_pSliceHeader->luma_log2_weight_denom;
            chroma_log2_weight_denom = sd->m_pSliceHeader->chroma_log2_weight_denom;
            bUnidirWeightMB = true;
        }

        // get luma interp func pointer table in cache
        if (sd->m_pSliceHeader->slice_type == BPREDSLICE)
        {
            VM_ASSERT(sd->m_pRefPicList[1][0]);

            pRefIndexL1 = sd->m_cur_mb.RefIdxs[1]->RefIdxs;
            // DIRECT MB have the same subblock partition structure as the
            // colocated MB. Take advantage of that to perform motion comp
            // for the direct MB using the largest partitions possible.
            if (mbtype == MBTYPE_DIRECT || mbtype == MBTYPE_SKIPPED)
            {
                mbtype = MBTYPE_INTER_8x8;
            }

            // Bi-dir weighting?
            weighted_bipred_idc = sd->m_pPicParamSet->weighted_bipred_idc;
            if (weighted_bipred_idc == 1)
            {
                // explicit bidir weighting
                luma_log2_weight_denom = sd->m_pSliceHeader->luma_log2_weight_denom;
                chroma_log2_weight_denom = sd->m_pSliceHeader->chroma_log2_weight_denom;
                bUnidirWeightMB = true;
                bBidirWeightMB = true;
            }
            if (weighted_bipred_idc == 2)
            {
                bBidirWeightMB = true;
            }
        }

        Ipp32s iPitchLuma = pitch_luma;
        Ipp32s iPitchChroma = pitch_chroma;

        if (mbtype != MBTYPE_INTER_8x8 && mbtype != MBTYPE_INTER_8x8_REF0)
        {
            // fill the reconstruct parameters
            params.m_pMV[0] = sd->m_cur_mb.MVs[0]->MotionVectors;
            params.m_pMV[1] = (BPREDSLICE == sd->m_pSliceHeader->slice_type) ? (sd->m_cur_mb.MVs[1]->MotionVectors) : (NULL);
            params.m_pRefIndex[0] = pRefIndexL0;
            params.m_pRefIndex[1] = pRefIndexL1;
            params.m_iOffsetLuma = offsetY;
            params.m_iOffsetChroma = offsetC;
            params.m_iLumaXPos = mbXOffset;
            params.m_iLumaYPos = mbYOffset;
            params.m_iChromaXPos = mbXOffset >> ((Ipp32s) (3 > color_format));
            params.m_iChromaYPos = mbYOffset >> ((Ipp32s) (2 > color_format));
            if (is_weight)
            {
                params.luma_log2_weight_denom = luma_log2_weight_denom;
                params.chroma_log2_weight_denom = chroma_log2_weight_denom;
                params.weighted_bipred_idc = weighted_bipred_idc;
                params.m_bBidirWeightMB = bBidirWeightMB;
                params.m_bUnidirWeightMB = bUnidirWeightMB;
            }
            params.bit_depth_luma = bit_depth_luma;
            params.bit_depth_chroma = bit_depth_cr;
            params.m_pSegDec = sd;
            params.m_lumaSize = sd->m_pCurrentFrame->lumaSize();
            params.m_chromaSize = sd->m_pCurrentFrame->chromaSize();
            params.m_lumaSize.height >>= is_field;
            params.m_chromaSize.height >>= is_field;

            // reconstruct macro block
            switch (mbtype)
            {
            case MBTYPE_INTER_16x8:
                {
                    params.roi.width = 16;
                    params.roi.height = 8;
                    params.roi_chroma.width = 16 >> ((Ipp32s) (3 > color_format));
                    params.roi_chroma.height = 8 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 0;
                    params.m_iIntraMBChromaOffset = 0;

                    if (D_DIR_BIDIR == psbdir[0])
                    {
                        params.m_iIntraMBLumaOffsetTmp = 0;
                        params.m_iIntraMBChromaOffsetTmp = 0;

                        CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                             0);
                    }
                    else
                    {
                        Ipp32s iDir = (D_DIR_BWD == psbdir[0]) ? (D_DIR_BWD) : (D_DIR_FWD);

                        CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                              0);
                    }

                    // set sub-block offset for second half of MB
                    params.m_iLumaYPos += 8;
                    params.m_iChromaYPos += 8 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 8 * iPitchLuma;
                    params.m_iIntraMBChromaOffset = (8 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;

                    if (D_DIR_BIDIR == psbdir[1])
                    {
                        params.m_iIntraMBLumaOffsetTmp = 8 * 16;
                        params.m_iIntraMBChromaOffsetTmp = (8 >> ((Ipp32s) (2 > color_format))) * 16;

                        CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                             8);
                    }
                    else
                    {
                        Ipp32s iDir = (D_DIR_BWD == psbdir[1]) ? (D_DIR_BWD) : (D_DIR_FWD);

                        CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                              8);
                    }
                }
                break;

            case MBTYPE_INTER_8x16:
                {
                    params.roi.width = 8;
                    params.roi.height = 16;
                    params.roi_chroma.width = 8 >> ((Ipp32s) (3 > color_format));
                    params.roi_chroma.height = 16 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 0;
                    params.m_iIntraMBChromaOffset = 0;

                    if (D_DIR_BIDIR == psbdir[0])
                    {
                        params.m_iIntraMBLumaOffsetTmp = 0;
                        params.m_iIntraMBChromaOffsetTmp = 0;

                        CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                             0);
                    }
                    else
                    {
                        Ipp32s iDir = (D_DIR_BWD == psbdir[0]) ? (D_DIR_BWD) : (D_DIR_FWD);

                        CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                              0);
                    }

                    // set sub-block offset for second half of MB
                    params.m_iLumaXPos += 8;
                    params.m_iChromaXPos += 8 >> ((Ipp32s) (3 > color_format));
                    params.m_iIntraMBLumaOffset = 8;
                    params.m_iIntraMBChromaOffset = 8 >> ((Ipp32s) (3 > color_format));

                    if (D_DIR_BIDIR == psbdir[1])
                    {
                        params.m_iIntraMBLumaOffsetTmp = 8;
                        params.m_iIntraMBChromaOffsetTmp = 8 >> ((Ipp32s) (3 > color_format));

                        CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                             2);
                    }
                    else
                    {
                        Ipp32s iDir = (D_DIR_BWD == psbdir[1]) ? (D_DIR_BWD) : (D_DIR_FWD);

                        CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                              2);
                    }
                }
                break;

            default:
                {
                    params.roi.width = 16;
                    params.roi.height = 16;
                    params.roi_chroma.width = 16 >> ((Ipp32s) (3 > color_format));
                    params.roi_chroma.height = 16 >> ((Ipp32s) (2 > color_format));
                    params.m_iIntraMBLumaOffset = 0;
                    params.m_iIntraMBChromaOffset = 0;

                    if (MBTYPE_BIDIR == mbtype)
                    {
                        params.m_iIntraMBLumaOffsetTmp = 0;
                        params.m_iIntraMBChromaOffsetTmp = 0;

                        CompensateBiDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                                             0);
                    }
                    else
                    {
                        Ipp32s iDir = (MBTYPE_BACKWARD == mbtype) ? (D_DIR_BWD) : (D_DIR_FWD);

                        CompensateUniDirBlock(params, pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma, iDir,
                                              0);
                    }
                }
                break;
            }
        }
        else
        {
            Ipp8s *pSubBlockType = sd->m_cur_mb.GlobalMacroblockInfo->sbtype;
            Ipp8s *pSubBlockDir = sd->m_cur_mb.LocalMacroblockInfo->sbdir;

            // fill the reconstruct parameters
            params.m_pMV[0] = sd->m_cur_mb.MVs[0]->MotionVectors;
            params.m_pMV[1] = (BPREDSLICE == sd->m_pSliceHeader->slice_type) ? (sd->m_cur_mb.MVs[1]->MotionVectors) : (NULL);
            params.m_pRefIndex[0] = pRefIndexL0;
            params.m_pRefIndex[1] = pRefIndexL1;
            params.m_iOffsetLuma = offsetY;
            params.m_iOffsetChroma = offsetC;
            params.m_iLumaXPos = mbXOffset;
            params.m_iLumaYPos = mbYOffset;
            params.m_iChromaXPos = mbXOffset >> ((Ipp32s) (3 > color_format));
            params.m_iChromaYPos = mbYOffset >> ((Ipp32s) (2 > color_format));
            if (is_weight)
            {
                params.luma_log2_weight_denom = luma_log2_weight_denom;
                params.chroma_log2_weight_denom = chroma_log2_weight_denom;
                params.weighted_bipred_idc = weighted_bipred_idc;
                params.m_bBidirWeightMB = bBidirWeightMB;
                params.m_bUnidirWeightMB = bUnidirWeightMB;
            }
            params.bit_depth_luma = bit_depth_luma;
            params.bit_depth_chroma = bit_depth_cr;
            params.m_pSegDec = sd;
            params.m_lumaSize = sd->m_pCurrentFrame->lumaSize();
            params.m_chromaSize = sd->m_pCurrentFrame->chromaSize();
            params.m_lumaSize.height >>= is_field;
            params.m_chromaSize.height >>= is_field;

            // sub block 0
            CompensateBlock8x8(pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                params, pSubBlockType[0], pSubBlockDir[0], 0);

            // sub block 1
            pDstY += 8;
            pDstU += (8 >> ((Ipp32s) (3 > color_format)));
            pDstV += (8 >> ((Ipp32s) (3 > color_format)));
            params.m_iOffsetLuma = offsetY + 8;
            params.m_iOffsetChroma = offsetC + (8 >> ((Ipp32s) (3 > color_format)));
            params.m_iLumaXPos = mbXOffset + 8;
            params.m_iLumaYPos = mbYOffset;
            params.m_iChromaXPos = (mbXOffset + 8) >> ((Ipp32s) (3 > color_format));
            params.m_iChromaYPos = mbYOffset >> ((Ipp32s) (2 > color_format));
            CompensateBlock8x8(pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                params, pSubBlockType[1], pSubBlockDir[1], 2);

            // sub block 2
            pDstY += - 8 + 8 * iPitchLuma;
            pDstU += - (8 >> ((Ipp32s) (3 > color_format))) +
                     (8 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;
            pDstV += - (8 >> ((Ipp32s) (3 > color_format))) +
                     (8 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;
            params.m_iOffsetLuma = offsetY + 8 * iPitchLuma;
            params.m_iOffsetChroma = offsetC + (8 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;
            params.m_iLumaXPos = mbXOffset;
            params.m_iLumaYPos = mbYOffset + 8;
            params.m_iChromaXPos = mbXOffset >> ((Ipp32s) (3 > color_format));
            params.m_iChromaYPos = (mbYOffset + 8) >> ((Ipp32s) (2 > color_format));
            CompensateBlock8x8(pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                params, pSubBlockType[2], pSubBlockDir[2], 8);

            // sub block 3
            pDstY += 8;
            pDstU += (8 >> ((Ipp32s) (3 > color_format)));
            pDstV += (8 >> ((Ipp32s) (3 > color_format)));
            params.m_iOffsetLuma = offsetY + 8 + 8 * iPitchLuma;
            params.m_iOffsetChroma = offsetC + (8 >> ((Ipp32s) (3 > color_format))) +
                                     (8 >> ((Ipp32s) (2 > color_format))) * iPitchChroma;
            params.m_iLumaXPos = mbXOffset + 8;
            params.m_iLumaYPos = mbYOffset + 8;
            params.m_iChromaXPos = (mbXOffset + 8) >> ((Ipp32s) (3 > color_format));
            params.m_iChromaYPos = (mbYOffset + 8) >> ((Ipp32s) (2 > color_format));
            CompensateBlock8x8(pDstY, pDstU, pDstV, iPitchLuma, iPitchChroma,
                params, pSubBlockType[3], pSubBlockDir[3], 10);
        }

    } // void CompensateMotionMacroBlock(PlanePtrY pDstY,

    ////////////////////////////////////////////////////////////////////////////////
    // Copy raw pixel values from the bitstream to the reconstructed frame for
    // all luma and chroma blocks of one macroblock.
    ////////////////////////////////////////////////////////////////////////////////
    void ReconstructPCMMB(Ipp32u offsetY, Ipp32u offsetC, Ipp32s pitch_luma, Ipp32s pitch_chroma,
                          H264SegmentDecoder * sd)
    {
        PlanePtrY  pDstY;
        PlanePtrUV pDstU;
        PlanePtrUV pDstV;
        Ipp32s i;

        // to retrieve non-aligned pointer from m_pCoeffBlocksRead
        pDstY = (PlanePtrY)sd->m_pYPlane + offsetY;
        pDstU = (PlanePtrUV)sd->m_pUPlane + offsetC;
        pDstV = (PlanePtrUV)sd->m_pVPlane + offsetC;

        PlanePtrY pCoeffBlocksRead_Y = reinterpret_cast<PlanePtrY> (sd->m_pCoeffBlocksRead);
        // get pointer to raw bytes from m_pCoeffBlocksRead
        for (i = 0; i<16; i++)
            memcpy(pDstY + i * pitch_luma, pCoeffBlocksRead_Y + i * 16, 16*sizeof(PlaneY));

        sd->m_pCoeffBlocksRead = (UMC::CoeffsPtrCommon)((Ipp8u*)sd->m_pCoeffBlocksRead +
                                 256*sizeof(PlaneY));

        if (color_format)
        {
            Ipp32s iWidth = (color_format == 3) ? 16 : 8;
            Ipp32s iHeight = 8 + 8 * (color_format >> 1);

            PlanePtrUV pCoeffBlocksRead_UV = (PlanePtrUV) (sd->m_pCoeffBlocksRead);
            for (i = 0; i < iHeight; i += 1)
                memcpy(pDstU + i * pitch_chroma, pCoeffBlocksRead_UV + i * iWidth, iWidth*sizeof(PlaneUV));

            pCoeffBlocksRead_UV += iWidth * iHeight * sizeof(PlaneUV);

            for (i = 0; i < iHeight; i += 1)
                memcpy(pDstV + i * pitch_chroma, pCoeffBlocksRead_UV + i * iWidth, iWidth*sizeof(PlaneUV));

            sd->m_pCoeffBlocksRead = (UMC::CoeffsPtrCommon)((Ipp8u*)sd->m_pCoeffBlocksRead +
                2* iWidth * iHeight * sizeof(PlaneUV));
        }
    } // void ReconstructPCMMB(
};

#pragma warning(default: 4127)

} // namespace UMC

#endif // __UMC_H264_RECONSTRUCT_TEMPLATES_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
