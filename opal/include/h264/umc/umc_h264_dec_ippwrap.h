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

#ifndef __UMC_H264_DEC_IPP_WRAP_H
#define __UMC_H264_DEC_IPP_WRAP_H

#include "ippi.h"
#include "vm_debug.h"
#include "umc_h264_dec_defs_dec.h"

namespace UMC
{
#pragma warning(disable: 4100)

    inline void SetPlane(Ipp8u val, Ipp8u* pDst, Ipp32s len)
    {
        XippsSet_8u(val, pDst, len);
    }

    inline void CopyPlane(const Ipp8u *pSrc, Ipp8u *pDst, Ipp32s len)
    {
        XippsCopy_8u(pSrc, pDst, len);
    }

    inline IppStatus CopyPlane(Ipp8u* pSrc, Ipp32s srcStep, Ipp8u* pDst, Ipp32s dstStep,
                              IppiSize roiSize )
    {
        return ippiCopy_8u_C1R(pSrc, srcStep, pDst, dstStep,
                              roiSize);
    }

    inline IppStatus DecodeCAVLCChromaDcCoeffs_H264(Ipp32u **ppBitStream,
                                                    Ipp32s *pOffset,
                                                    Ipp16s *pNumCoeff,
                                                    Ipp16s **ppDstCoeffs,
                                                    const Ipp32s *pTblCoeffToken,
                                                    const Ipp32s **ppTblTotalZerosCR,
                                                    const Ipp32s **ppTblRunBefore)
    {dbFun("DecodeCAVLCChromaDcCoeffs_H264")
        return ippiDecodeCAVLCChromaDcCoeffs_H264_1u16s(ppBitStream,
                                                        pOffset,
                                                        pNumCoeff,
                                                        ppDstCoeffs,
                                                        pTblCoeffToken,
                                                        ppTblTotalZerosCR,
                                                        ppTblRunBefore);
    }

    inline IppStatus DecodeCAVLCChromaDcCoeffs422_H264(Ipp32u **ppBitStream,
                                                       Ipp32s *pOffset,
                                                       Ipp16s *pNumCoeff,
                                                       Ipp16s **ppDstCoeffs,
                                                       const Ipp32s *pTblCoeffToken,
                                                       const Ipp32s **ppTblTotalZerosCR,
                                                       const Ipp32s **ppTblRunBefore)
    {dbFun("DecodeCAVLCChromaDcCoeffs422_H264")
        return ippiDecodeCAVLCChroma422DcCoeffs_H264_1u16s(ppBitStream,
                                                            pOffset,
                                                            pNumCoeff,
                                                            ppDstCoeffs,
                                                            pTblCoeffToken,
                                                            ppTblTotalZerosCR,
                                                            ppTblRunBefore);
    }

    inline IppStatus DecodeCAVLCCoeffs_H264(Ipp32u **ppBitStream,
                                            Ipp32s *pOffset,
                                            Ipp16s *pNumCoeff,
                                            Ipp16s **ppDstCoeffs,
                                            Ipp32u uVLCSelect,
                                            Ipp16s uMaxNumCoeff,
                                            const Ipp32s **ppTblCoeffToken,
                                            const Ipp32s **ppTblTotalZeros,
                                            const Ipp32s **ppTblRunBefore,
                                            const Ipp32s *pScanMatrix)
    {dbFun("DecodeCAVLCCoeffs_H264")
        return ippiDecodeCAVLCCoeffs_H264_1u16s(ppBitStream,
                                                pOffset,
                                                pNumCoeff,
                                                ppDstCoeffs,
                                                uVLCSelect,
                                                uMaxNumCoeff,
                                                ppTblCoeffToken,
                                                ppTblTotalZeros,
                                                ppTblRunBefore,
                                                pScanMatrix);
    }

    inline IppStatus SetPlane(Ipp8u value, Ipp8u* pDst, Ipp32s dstStep,
                              IppiSize roiSize )
    {
        return ippiSet_8u_C1R(value, pDst, dstStep,
                              roiSize);
    }

    inline IppStatus ExpandPlane(Ipp8u *StartPtr,
                                 Ipp32u uFrameWidth,
                                 Ipp32u uFrameHeight,
                                 Ipp32u uPitch,
                                 Ipp32u uPels,
                                 IppvcFrameFieldFlag uFrameFieldFlag)
    {
        return ippiExpandPlane_H264_8u_C1R(StartPtr,
                                           uFrameWidth,
                                           uFrameHeight,
                                           uPitch,
                                           uPels,
                                           uFrameFieldFlag);
    }

    inline IppStatus BiDirWeightBlock(const Ipp8u *pSrc1,
                                      const Ipp8u *pSrc2,
                                      Ipp8u *pDst,
                                      Ipp32u nSrcPitch1,
                                      Ipp32u nSrcPitch2,
                                      Ipp32u nDstPitch,
                                      Ipp32u ulog2wd,
                                      Ipp32s iWeight1,
                                      Ipp32s iOffset1,
                                      Ipp32s iWeight2,
                                      Ipp32s iOffset2,
                                      IppiSize roi,
                                      Ipp32s bit_depth = 8)
    {
        return ippiBiDirWeightBlock_H264_8u_P3P1R(pSrc1, pSrc2, pDst, nSrcPitch1, nSrcPitch2,
            nDstPitch, ulog2wd, iWeight1, iOffset1, iWeight2, iOffset2, roi);
    }

    inline IppStatus BiDirWeightBlockImplicit(const Ipp8u *pSrc1,
                                              const Ipp8u *pSrc2,
                                              Ipp8u *pDst,
                                              Ipp32u nSrcPitch1,
                                              Ipp32u nSrcPitch2,
                                              Ipp32u nDstPitch,
                                              Ipp32s iWeight1,
                                              Ipp32s iWeight2,
                                              IppiSize roi,
                                              Ipp32s bit_depth = 8)
    {
        return ippiBiDirWeightBlockImplicit_H264_8u_P3P1R(pSrc1,
                                                          pSrc2,
                                                          pDst,
                                                          nSrcPitch1,
                                                          nSrcPitch2,
                                                          nDstPitch,
                                                          iWeight1,
                                                          iWeight2,
                                                          roi);
    }

    inline IppStatus InterpolateBlock(Ipp8u *pSrc1,
                                      Ipp8u *pSrc2,
                                      Ipp8u *pDst,
                                      Ipp32u uWidth,
                                      Ipp32u uHeight,
                                      Ipp32s iPitchSrc1,
                                      Ipp32s iPitchSrc2,
                                      Ipp32s iPitchDst,
                                      Ipp32s bit_depth = 8)
    {
        return ippiInterpolateBlock_H264_8u_P3P1R(pSrc1,pSrc2,
                                                  pDst,
                                                  uWidth,
                                                  uHeight,
                                                  iPitchSrc1,
                                                  iPitchSrc2,
                                                  iPitchDst);
    }

    inline IppStatus UniDirWeightBlock(Ipp8u *pSrcDst,
                                       Ipp32u srcDstStep,
                                       Ipp32u ulog2wd,
                                       Ipp32s iWeight,
                                       Ipp32s iOffset,
                                       IppiSize roi,
                                       Ipp32s bit_depth = 8)
    {
        return ippiUniDirWeightBlock_H264_8u_C1R(pSrcDst, srcDstStep,
                                                 ulog2wd, iWeight,
                                                 iOffset, roi);
    }

    inline IppStatus ReconstructLumaIntraHalfMB(Ipp16s **ppSrcCoeff,
                                                Ipp8u *pSrcDstYPlane,
                                                Ipp32s srcdstYStep,
                                                IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                                Ipp32u cbp4x2,
                                                Ipp32s QP,
                                                Ipp8u edgeType,
                                                Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntraHalfMB")
        return ippiReconstructLumaIntraHalfMB_H264_16s8u_C1R(ppSrcCoeff,
                                                             pSrcDstYPlane,
                                                             srcdstYStep,
                                                             pMBIntraTypes,
                                                             cbp4x2,
                                                             QP,
                                                             edgeType);
    }

    inline IppStatus ReconstructLumaInter8x8MB(Ipp16s **ppSrcDstCoeff,
                                               Ipp8u *pSrcDstYPlane,
                                               Ipp32u srcdstYStep,
                                               Ipp32u cbp8x8,
                                               Ipp32s QP,
                                               Ipp16s *pQuantTable,
                                               Ipp8u bypass_flag,
                                               Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaInter8x8MB")
        return XippiReconstructLumaInter8x8MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                            pSrcDstYPlane,
                                                            srcdstYStep,
                                                            cbp8x8,
                                                            QP,
                                                            pQuantTable,
                                                            bypass_flag);
    }

    inline IppStatus ReconstructLumaInter4x4MB(Ipp16s **ppSrcDstCoeff,
                                               Ipp8u *pSrcDstYPlane,
                                               Ipp32u srcdstYStep,
                                               Ipp32u cbp4x4,
                                               Ipp32s QP,
                                               Ipp16s *pQuantTable,
                                               Ipp8u bypass_flag,
                                               Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaInter4x4MB")
        return XippiReconstructLumaInter4x4MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                            pSrcDstYPlane,
                                                            srcdstYStep,
                                                            cbp4x4,
                                                            QP,
                                                            pQuantTable,
															bypass_flag);
    }


    inline IppStatus ReconstructLumaIntra_16x16MB(Ipp16s **ppSrcDstCoeff,
                                                  Ipp8u *pSrcDstYPlane,
                                                  Ipp32u srcdstYStep,
                                                  IppIntra16x16PredMode_H264 intra_luma_mode,
                                                  Ipp32u cbp4x4,
                                                  Ipp32s QP,
                                                  Ipp8u edge_type,
                                                  Ipp16s *pQuantTable,
                                                  Ipp8u bypass_flag,
                                                  Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntra_16x16MB")
        return XippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                               pSrcDstYPlane,
                                                               srcdstYStep,
                                                               intra_luma_mode,
                                                               cbp4x4,
                                                               QP,
                                                               edge_type,
                                                               pQuantTable,
                                                               bypass_flag);
    }

    inline IppStatus ReconstructLumaIntraHalf8x8MB(Ipp16s **ppSrcDstCoeff,
                                                   Ipp8u *pSrcDstYPlane,
                                                   Ipp32s srcdstYStep,
                                                   IppIntra8x8PredMode_H264 *pMBIntraTypes,
                                                   Ipp32u cbp8x2,
                                                   Ipp32s QP,
                                                   Ipp8u edgeType,
                                                   Ipp16s *pQuantTable,
                                                   Ipp8u bypass_flag,
                                                   Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntraHalf8x8MB")
        return ippiReconstructLumaIntraHalf8x8MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                                pSrcDstYPlane,
                                                                srcdstYStep,
                                                                pMBIntraTypes,
                                                                cbp8x2,
                                                                QP,
                                                                edgeType,
                                                                pQuantTable,
                                                                bypass_flag);
    }


    inline IppStatus ReconstructLumaIntraHalf4x4MB(Ipp16s **ppSrcDstCoeff,
                                                   Ipp8u *pSrcDstYPlane,
                                                   Ipp32s srcdstYStep,
                                                   IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                                   Ipp32u cbp4x2,
                                                   Ipp32s QP,
                                                   Ipp8u edgeType,
                                                   Ipp16s *pQuantTable,
                                                   Ipp8u bypass_flag,
                                                   Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntraHalf4x4MB")
        return ippiReconstructLumaIntraHalf4x4MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                                pSrcDstYPlane,
                                                                srcdstYStep,
                                                                pMBIntraTypes,
                                                                cbp4x2,
                                                                QP,
                                                                edgeType,
                                                                pQuantTable,
                                                                bypass_flag);
    }

    inline IppStatus ReconstructLumaIntra8x8MB(Ipp16s **ppSrcDstCoeff,
                                               Ipp8u *pSrcDstYPlane,
                                               Ipp32s srcdstYStep,
                                               IppIntra8x8PredMode_H264 *pMBIntraTypes,
                                               Ipp32u cbp8x8,
                                               Ipp32s QP,
                                               Ipp8u edgeType,
                                               Ipp16s *pQuantTable,
                                               Ipp8u bypass_flag,
                                               Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntra8x8MB")
        return XippiReconstructLumaIntra8x8MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                            pSrcDstYPlane,
                                                            srcdstYStep,
                                                            pMBIntraTypes,
                                                            cbp8x8,
                                                            QP,
                                                            edgeType,
                                                            pQuantTable,
                                                            bypass_flag);
    }

    inline  IppStatus ReconstructLumaIntra4x4MB(Ipp16s **ppSrcDstCoeff,
                                                Ipp8u *pSrcDstYPlane,
                                                Ipp32s srcdstYStep,
                                                IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                                Ipp32u cbp4x4,
                                                Ipp32s QP,
                                                Ipp8u edgeType,
                                                Ipp16s *pQuantTable,
                                                Ipp8u bypass_flag,
                                                Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntra4x4MB")
        return XippiReconstructLumaIntra4x4MB_H264_16s8u_C1R(ppSrcDstCoeff,
                                                            pSrcDstYPlane,
                                                            srcdstYStep,
                                                            pMBIntraTypes,
                                                            cbp4x4,
                                                            QP,
                                                            edgeType,
                                                            pQuantTable,
                                                            bypass_flag);
    }

    inline IppStatus ReconstructLumaIntra16x16MB(Ipp16s **ppSrcCoeff,
                                                 Ipp8u *pSrcDstYPlane,
                                                 Ipp32u srcdstYStep,
                                                 const IppIntra16x16PredMode_H264 intra_luma_mode,
                                                 const Ipp32u cbp4x4,
                                                 const Ipp32s QP,
                                                 const Ipp8u edge_type,
                                                 Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntra16x16MB")
        return XippiReconstructLumaIntra16x16MB_H264_16s8u_C1R(ppSrcCoeff,
                                                              pSrcDstYPlane,
                                                              srcdstYStep,
                                                              intra_luma_mode,
                                                              cbp4x4,
                                                              QP,
                                                              edge_type);
    }

    inline IppStatus ReconstructLumaIntraMB(Ipp16s **ppSrcCoeff,
                                            Ipp8u *pSrcDstYPlane,
                                            Ipp32s srcdstYStep,
                                            const IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                            const Ipp32u cbp4x4,
                                            const Ipp32s QP,
                                            const Ipp8u edgeType,
                                            Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaIntraMB")
        return XippiReconstructLumaIntraMB_H264_16s8u_C1R(ppSrcCoeff,
                                                         pSrcDstYPlane,
                                                         srcdstYStep,
                                                         pMBIntraTypes,
                                                         cbp4x4,
                                                         QP,
                                                         edgeType);
    }

    inline IppStatus ReconstructLumaInterMB(Ipp16s **ppSrcCoeff,
                                            Ipp8u *pSrcDstYPlane,
                                            Ipp32u srcdstYStep,
                                            Ipp32u cbp4x4,
                                            Ipp32s QP,
                                            Ipp32s bit_depth = 8)
    {dbFun("ReconstructLumaInterMB")
        return XippiReconstructLumaInterMB_H264_16s8u_C1R(ppSrcCoeff,
                                                         pSrcDstYPlane,
                                                         srcdstYStep,
                                                         cbp4x4,
                                                         QP);
    }

    inline IppStatus ReconstructChromaInter4x4MB(Ipp16s **ppSrcDstCoeff,
                                                 Ipp8u *pSrcDstUPlane,
                                                 Ipp8u *pSrcDstVPlane,
                                                 Ipp32u srcdstUVStep,
                                                 Ipp32u cbpU,
                                                 Ipp32u cbpV,
                                                 Ipp32u chromaQPU,
                                                 Ipp32u chromaQPV,
                                                 Ipp16s *pQuantTableU,
                                                 Ipp16s *pQuantTableV,
                                                 Ipp8u bypass_flag,
                                                 Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaInter4x4MB")
        return ippiReconstructChromaInter4x4MB_H264_16s8u_P2R(ppSrcDstCoeff,
                                                              pSrcDstUPlane,
                                                              pSrcDstVPlane,
                                                              srcdstUVStep,
                                                              CreateIPPCBPMask420(cbpU, cbpV),
                                                              chromaQPU,
                                                              chromaQPV,
                                                              pQuantTableU,
                                                              pQuantTableV,
                                                              bypass_flag);
    }

    inline IppStatus ReconstructChromaInterMB(Ipp16s **ppSrcCoeff,
                                              Ipp8u *pSrcDstUPlane,
                                              Ipp8u *pSrcDstVPlane,
                                              const Ipp32u srcdstStep,
                                              Ipp32u cbpU,
                                              Ipp32u cbpV,
                                              const Ipp32u ChromaQP,
                                              Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaInterMB")
        return ippiReconstructChromaInterMB_H264_16s8u_P2R(ppSrcCoeff,
                                                           pSrcDstUPlane,
                                                           pSrcDstVPlane,
                                                           srcdstStep,
                                                           CreateIPPCBPMask420(cbpU, cbpV),
                                                           ChromaQP);
    }

    inline IppStatus ReconstructChromaIntra4x4MB(Ipp16s **ppSrcDstCoeff,
                                                 Ipp8u *pSrcDstUPlane,
                                                 Ipp8u *pSrcDstVPlane,
                                                 Ipp32u srcdstUVStep,
                                                 IppIntraChromaPredMode_H264 intra_chroma_mode,
                                                 Ipp32u cbpU,
                                                 Ipp32u cbpV,
                                                 Ipp32u chromaQPU,
                                                 Ipp32u chromaQPV,
                                                 Ipp8u edge_type,
                                                 Ipp16s *pQuantTableU,
                                                 Ipp16s *pQuantTableV,
                                                 Ipp8u bypass_flag,
                                                 Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaIntra4x4MB")
        return ippiReconstructChromaIntra4x4MB_H264_16s8u_P2R(ppSrcDstCoeff,
                                                              pSrcDstUPlane,
                                                              pSrcDstVPlane,
                                                              srcdstUVStep,
                                                              intra_chroma_mode,
                                                              CreateIPPCBPMask420(cbpU, cbpV),
                                                              chromaQPU,
                                                              chromaQPV,
                                                              edge_type,
                                                              pQuantTableU,
                                                              pQuantTableV,
                                                              bypass_flag);
    }

    inline IppStatus ReconstructChromaIntraMB(Ipp16s **ppSrcCoeff,
                                              Ipp8u *pSrcDstUPlane,
                                              Ipp8u *pSrcDstVPlane,
                                              const Ipp32u srcdstUVStep,
                                              const IppIntraChromaPredMode_H264 intra_chroma_mode,
                                              Ipp32u cbpU,
                                              Ipp32u cbpV,
                                              const Ipp32u ChromaQP,
                                              const Ipp8u edge_type,
                                              Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaIntraMB")
        return ippiReconstructChromaIntraMB_H264_16s8u_P2R(ppSrcCoeff,
                                                           pSrcDstUPlane,
                                                           pSrcDstVPlane,
                                                           srcdstUVStep,
                                                           intra_chroma_mode,
                                                           CreateIPPCBPMask420(cbpU, cbpV),
                                                           ChromaQP,
                                                           edge_type);
    }

    inline IppStatus ReconstructChromaIntraHalfs4x4MB(Ipp16s **ppSrcDstCoeff,
                                                      Ipp8u *pSrcDstUPlane,
                                                      Ipp8u *pSrcDstVPlane,
                                                      Ipp32u srcdstUVStep,
                                                      IppIntraChromaPredMode_H264 intra_chroma_mode,
                                                      Ipp32u cbpU,
                                                      Ipp32u cbpV,
                                                      Ipp32u chromaQPU,
                                                      Ipp32u chromaQPV,
                                                      Ipp8u edge_type_top,
                                                      Ipp8u edge_type_bottom,
                                                      Ipp16s *pQuantTableU,
                                                      Ipp16s *pQuantTableV,
                                                      Ipp8u bypass_flag,
                                                      Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaIntraHalfs4x4MB")
        return ippiReconstructChromaIntraHalfs4x4MB_H264_16s8u_P2R(ppSrcDstCoeff,
                                                                   pSrcDstUPlane,
                                                                   pSrcDstVPlane,
                                                                   srcdstUVStep,
                                                                   intra_chroma_mode,
                                                                   CreateIPPCBPMask420(cbpU, cbpV),
                                                                   chromaQPU,
                                                                   chromaQPV,
                                                                   edge_type_top,
                                                                   edge_type_bottom,
                                                                   pQuantTableU,
                                                                   pQuantTableV,
                                                                   bypass_flag);
    }

    inline IppStatus ReconstructChromaIntraHalfsMB(Ipp16s **ppSrcCoeff,
                                                   Ipp8u *pSrcDstUPlane,
                                                   Ipp8u *pSrcDstVPlane,
                                                   Ipp32u srcdstUVStep,
                                                   IppIntraChromaPredMode_H264 intra_chroma_mode,
                                                   Ipp32u cbpU,
                                                   Ipp32u cbpV,
                                                   Ipp32u ChromaQP,
                                                   Ipp8u edge_type_top,
                                                   Ipp8u edge_type_bottom,
                                                   Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaIntraHalfsMB")
        return ippiReconstructChromaIntraHalfsMB_H264_16s8u_P2R(ppSrcCoeff,
                                                                pSrcDstUPlane,
                                                                pSrcDstVPlane,
                                                                srcdstUVStep,
                                                                intra_chroma_mode,
                                                                CreateIPPCBPMask420(cbpU, cbpV),
                                                                ChromaQP,
                                                                edge_type_top,
                                                                edge_type_bottom);
    }

#define FILL_CHROMA_RECONSTRUCT_INFO_8U \
    IppiReconstructHighMB_16s8u info_temp[2];\
    const IppiReconstructHighMB_16s8u *info[2];\
    info[0] = &info_temp[0];\
    info[1] = &info_temp[1];\
    info_temp[0].ppSrcDstCoeff = ppSrcDstCoeff;   \
    info_temp[0].pSrcDstPlane = pSrcDstUPlane;  \
    info_temp[0].srcDstStep = srcdstUVStep;    \
    info_temp[0].cbp = (Ipp32u)cbpU;          \
    info_temp[0].qp = chromaQPU;               \
    info_temp[0].pQuantTable = pQuantTableU;  \
    info_temp[0].bypassFlag = bypass_flag;      \
    info_temp[1].ppSrcDstCoeff = ppSrcDstCoeff;   \
    info_temp[1].pSrcDstPlane = pSrcDstVPlane;  \
    info_temp[1].srcDstStep = srcdstUVStep;    \
    info_temp[1].cbp = (Ipp32u)cbpV;          \
    info_temp[1].qp = chromaQPV;\
    info_temp[1].pQuantTable = pQuantTableV;\
    info_temp[1].bypassFlag = bypass_flag;

    inline IppStatus ReconstructChromaIntraHalfs4x4MB422(Ipp16s **ppSrcDstCoeff,
                                                         Ipp8u *pSrcDstUPlane,
                                                         Ipp8u *pSrcDstVPlane,
                                                         Ipp32u srcdstUVStep,
                                                         IppIntraChromaPredMode_H264 intraChromaMode,
                                                         Ipp32u cbpU,
                                                         Ipp32u cbpV,
                                                         Ipp32u chromaQPU,
                                                         Ipp32u chromaQPV,
                                                         Ipp32u levelScaleDCU,
                                                         Ipp32u levelScaleDCV,
                                                         Ipp8u edgeTypeTop,
                                                         Ipp8u edgeTypeBottom,
                                                         Ipp16s *pQuantTableU,
                                                         Ipp16s *pQuantTableV,
                                                         Ipp8u bypass_flag,
                                                         Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaIntraHalfs4x4MB422")
        FILL_CHROMA_RECONSTRUCT_INFO_8U;
        return ippiReconstructChroma422IntraHalf4x4_H264High_16s8u_IP2R(info,
                                                                        intraChromaMode,
                                                                        edgeTypeTop,
                                                                        edgeTypeBottom,
                                                                        levelScaleDCU,
                                                                        levelScaleDCV);
    }

    inline IppStatus ReconstructChromaIntraHalfs4x4MB444(Ipp16s **ppSrcDstCoeff,
                                                         Ipp8u *pSrcDstUPlane,
                                                         Ipp8u *pSrcDstVPlane,
                                                         Ipp32u srcdstUVStep,
                                                         IppIntraChromaPredMode_H264 intraChromaMode,
                                                         Ipp32u cbpU,
                                                         Ipp32u cbpV,
                                                         Ipp32u chromaQPU,
                                                         Ipp32u chromaQPV,
                                                         Ipp8u edgeTypeTop,
                                                         Ipp8u edgeTypeBottom,
                                                         Ipp16s *pQuantTableU,
                                                         Ipp16s *pQuantTableV,
                                                         Ipp8u bypassFlag,
                                                         Ipp32s bit_depth = 8)
    {dbFun("ReconstructChromaIntraHalfs4x4MB444")
        VM_ASSERT(false);
        return ippStsNoErr;
    }

   inline IppStatus ReconstructChromaInter4x4MB422(Ipp16s **ppSrcDstCoeff,
                                                   Ipp8u *pSrcDstUPlane,
                                                   Ipp8u *pSrcDstVPlane,
                                                   Ipp32u srcdstUVStep,
                                                   Ipp32u cbpU,
                                                   Ipp32u cbpV,
                                                   Ipp32u chromaQPU,
                                                   Ipp32u chromaQPV,
                                                   Ipp32u levelScaleDCU,
                                                   Ipp32u levelScaleDCV,
                                                   Ipp16s *pQuantTableU,
                                                   Ipp16s *pQuantTableV,
                                                   Ipp8u bypass_flag,
                                                   Ipp32s bit_depth = 8)
   {dbFun("ReconstructChromaInter4x4MB422")
       FILL_CHROMA_RECONSTRUCT_INFO_8U;
       return ippiReconstructChroma422Inter4x4_H264High_16s8u_IP2R(info,
                                                                   levelScaleDCU,
                                                                   levelScaleDCV);
   }

    inline IppStatus ReconstructChromaInter4x4MB444(Ipp16s **ppSrcDstCoeff,
                                                    Ipp8u *pSrcDstUPlane,
                                                    Ipp8u *pSrcDstVPlane,
                                                    Ipp32u srcdstUVStep,
                                                    Ipp32u cbpU,
                                                    Ipp32u cbpV,
                                                    Ipp32u chromaQPU,
                                                    Ipp32u chromaQPV,
                                                    Ipp16s *pQuantTableU,
                                                    Ipp16s *pQuantTableV,
                                                    Ipp8u bypassFlag,
                                                    Ipp32s bit_depth = 8)
   {dbFun("ReconstructChromaInter4x4MB444")
       VM_ASSERT(false);
        return ippStsNoErr;
   }


    inline IppStatus ReconstructChromaIntra4x4MB422(Ipp16s **ppSrcDstCoeff,
                                                    Ipp8u *pSrcDstUPlane,
                                                    Ipp8u *pSrcDstVPlane,
                                                    Ipp32u srcdstUVStep,
                                                    IppIntraChromaPredMode_H264 intraChromaMode,
                                                    Ipp32u cbpU,
                                                    Ipp32u cbpV,
                                                    Ipp32u chromaQPU,
                                                    Ipp32u chromaQPV,
                                                    Ipp32u levelScaleDCU,
                                                    Ipp32u levelScaleDCV,
                                                    Ipp8u edgeType,
                                                    Ipp16s *pQuantTableU,
                                                    Ipp16s *pQuantTableV,
                                                    Ipp8u bypass_flag,
                                                    Ipp32s bit_depth = 8)
   {dbFun("ReconstructChromaIntra4x4MB422")
       FILL_CHROMA_RECONSTRUCT_INFO_8U;
       return ippiReconstructChroma422Intra4x4_H264High_16s8u_IP2R(info,
                                                                   intraChromaMode,
                                                                   edgeType,
                                                                   levelScaleDCU,
                                                                   levelScaleDCV);
   }


    inline IppStatus ReconstructChromaIntra4x4MB444(Ipp16s **ppSrcDstCoeff,
                                                    Ipp8u *pSrcDstUPlane,
                                                    Ipp8u *pSrcDstVPlane,
                                                    Ipp32u srcdstUVStep,
                                                    IppIntraChromaPredMode_H264 intraChromaMode,
                                                    Ipp32u cbpU,
                                                    Ipp32u cbpV,
                                                    Ipp32u chromaQPU,
                                                    Ipp32u chromaQPV,
                                                    Ipp8u edgeType,
                                                    Ipp16s *pQuantTableU,
                                                    Ipp16s *pQuantTableV,
                                                    Ipp8u bypassFlag,
                                                    Ipp32s bit_depth = 8)
   {dbFun("ReconstructChromaIntra4x4MB444")
       VM_ASSERT(false);
       return ippStsNoErr;
   }

    IppStatus FilterDeblockingLuma_HorEdge(Ipp8u* pSrcDst,
                                           Ipp32s srcdstStep,
                                           Ipp8u* pAlpha,
                                           Ipp8u* pBeta,
                                           Ipp8u* pThresholds,
                                           Ipp8u* pBS,
                                           Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingLuma_VerEdge_MBAFF(Ipp8u* pSrcDst,
                                                 Ipp32s srcdstStep,
                                                 Ipp8u* pAlpha,
                                                 Ipp8u* pBeta,
                                                 Ipp8u* pThresholds,
                                                 Ipp8u* pBs,
                                                 Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingLuma_VerEdge(Ipp8u* pSrcDst,
                                           Ipp32s srcdstStep,
                                           Ipp8u* pAlpha,
                                           Ipp8u* pBeta,
                                           Ipp8u* pThresholds,
                                           Ipp8u* pBs,
                                           Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma_VerEdge_MBAFF(Ipp8u* pSrcDst,
                                                   Ipp32s srcdstStep,
                                                   Ipp8u* pAlpha,
                                                   Ipp8u* pBeta,
                                                   Ipp8u* pThresholds,
                                                   Ipp8u* pBS,
                                                   Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma_VerEdge(Ipp8u* pSrcDst,
                                             Ipp32s srcdstStep,
                                             Ipp8u* pAlpha,
                                             Ipp8u* pBeta,
                                             Ipp8u* pThresholds,
                                             Ipp8u* pBS,
                                             Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma_HorEdge(Ipp8u* pSrcDst,
                                             Ipp32s srcdstStep,
                                             Ipp8u* pAlpha,
                                             Ipp8u* pBeta,
                                             Ipp8u* pThresholds,
                                             Ipp8u* pBS,
                                             Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma422_VerEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma422_HorEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma444_VerEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth = 8);

    IppStatus FilterDeblockingChroma444_HorEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth = 8);


    ///****************************************************************************************/
    // 16 bits functions
    ///****************************************************************************************/
    inline void SetPlane(Ipp16u val, Ipp16u* pDst, Ipp32s len)
    {
        ippsSet_16s(val, (Ipp16s *)pDst, len);
    }

    inline void CopyPlane(const Ipp16u *pSrc, Ipp16u *pDst, Ipp32s len)
    {
        XippsCopy_16s((const Ipp16s *)pSrc, (Ipp16s *)pDst, len);
    }

    inline IppStatus CopyPlane(const Ipp16u* pSrc, Ipp32s srcStep, Ipp16u* pDst, Ipp32s dstStep,
                              IppiSize roiSize)
    {
        if (!pSrc || !pDst)
            return ippStsNullPtrErr;

        return ippiCopy_16s_C1R((const Ipp16s*)pSrc, srcStep, (Ipp16s*)pDst, dstStep,
                        roiSize);
    }

    inline IppStatus SetPlane(Ipp16u value, Ipp16u* pDst, Ipp32s dstStep,
                              IppiSize roiSize )
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus ExpandPlane(Ipp16u *StartPtr,
                                 Ipp32u uFrameWidth,
                                 Ipp32u uFrameHeight,
                                 Ipp32u uPitch,
                                 Ipp32u uPels,
                                 IppvcFrameFieldFlag uFrameFieldFlag)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus UniDirWeightBlock(Ipp16u *pSrcDst,
                                       Ipp32u srcDstStep,
                                       Ipp32u ulog2wd,
                                       Ipp32s iWeight,
                                       Ipp32s iOffset,
                                       IppiSize roi,
                                       Ipp32s bit_depth = 10)
    {
        return ippiUnidirWeight_H264_16u_IP2P1R(pSrcDst, srcDstStep,
                                                ulog2wd, iWeight, iOffset,
                                                roi, bit_depth);
    }


#define FILL_RECONSTRUCT_INFO   \
    IppiReconstructHighMB_32s16u info;\
    info.ppSrcDstCoeff = ppSrcDstCoeff;\
    info.pSrcDstPlane = pSrcDstYPlane;\
    info.srcDstStep = srcDstStep;\
    info.cbp = cbp;\
    info.qp = QP;\
    info.pQuantTable = pQuantTable;\
    info.bypassFlag = bypass_flag;\
    info.bitDepth = bit_depth;

    inline IppStatus ReconstructLumaIntraHalfMB(Ipp32s **ppSrcCoeff,
                                                Ipp16u *pSrcDstYPlane,
                                                Ipp32s srcdstYStep,
                                                IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                                Ipp32u cbp4x2,
                                                Ipp32s QP,
                                                Ipp8u  edgeType,
                                                Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus ReconstructLumaInter8x8MB(Ipp32s **ppSrcDstCoeff,
                                               Ipp16u *pSrcDstYPlane,
                                               Ipp32u srcDstStep,
                                               Ipp32u cbp,
                                               Ipp32s QP,
                                               Ipp16s *pQuantTable,
                                               Ipp8u  bypass_flag,
                                               Ipp32s bit_depth)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaInter8x8_H264High_32s16u_IP1R(&info);
    }

    inline IppStatus ReconstructLumaInter4x4MB(Ipp32s **ppSrcDstCoeff,
                                               Ipp16u *pSrcDstYPlane,
                                               Ipp32u srcDstStep,
                                               Ipp32u cbp,
                                               Ipp32s QP,
                                               Ipp16s *pQuantTable,
                                               Ipp8u  bypass_flag,
                                               Ipp32s bit_depth)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaInter4x4_H264High_32s16u_IP1R(&info);
    }

    inline IppStatus ReconstructLumaIntra_16x16MB(Ipp32s **ppSrcDstCoeff,
                                                  Ipp16u *pSrcDstYPlane,
                                                  Ipp32u srcDstStep,
                                                  IppIntra16x16PredMode_H264 intra_luma_mode,
                                                  Ipp32u cbp,
                                                  Ipp32s QP,
                                                  Ipp8u  edge_type,
                                                  Ipp16s *pQuantTable,
                                                  Ipp8u  bypass_flag,
                                                  Ipp32s bit_depth)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaIntra16x16_H264High_32s16u_IP1R(&info,
                                                                  intra_luma_mode,
                                                                  edge_type);
    }

    inline IppStatus ReconstructLumaIntraHalf8x8MB(Ipp32s **ppSrcDstCoeff,
                                                   Ipp16u *pSrcDstYPlane,
                                                   Ipp32s srcDstStep,
                                                   IppIntra8x8PredMode_H264 *pMBIntraTypes,
                                                   Ipp32u cbp,
                                                   Ipp32s QP,
                                                   Ipp8u  edgeType,
                                                   Ipp16s *pQuantTable,
                                                   Ipp8u  bypass_flag,
                                                   Ipp32s bit_depth = 10)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaIntraHalf8x8_H264High_32s16u_IP1R(&info,
                                                                    pMBIntraTypes,
                                                                    edgeType);
    }

    inline IppStatus ReconstructLumaIntraHalf4x4MB(Ipp32s **ppSrcDstCoeff,
                                                   Ipp16u *pSrcDstYPlane,
                                                   Ipp32s srcDstStep,
                                                   IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                                   Ipp32u cbp,
                                                   Ipp32s QP,
                                                   Ipp8u  edgeType,
                                                   Ipp16s *pQuantTable,
                                                   Ipp8u  bypass_flag,
                                                   Ipp32s bit_depth = 10)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaIntraHalf4x4_H264High_32s16u_IP1R(&info,
                                                                    pMBIntraTypes,
                                                                    edgeType);
    }

    inline IppStatus ReconstructLumaIntra8x8MB(Ipp32s **ppSrcDstCoeff,
                                               Ipp16u *pSrcDstYPlane,
                                               Ipp32s srcDstStep,
                                               IppIntra8x8PredMode_H264 *pMBIntraTypes,
                                               Ipp32u cbp,
                                               Ipp32s QP,
                                               Ipp8u  edgeType,
                                               Ipp16s *pQuantTable,
                                               Ipp8u  bypass_flag,
                                               Ipp32s bit_depth)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaIntra8x8_H264High_32s16u_IP1R(&info,
                                                                pMBIntraTypes,
                                                                edgeType);
    }

    inline  IppStatus ReconstructLumaIntra4x4MB(Ipp32s **ppSrcDstCoeff,
                                                Ipp16u *pSrcDstYPlane,
                                                Ipp32s srcDstStep,
                                                IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                                Ipp32u cbp,
                                                Ipp32s QP,
                                                Ipp8u  edgeType,
                                                Ipp16s *pQuantTable,
                                                Ipp8u  bypass_flag,
                                                Ipp32s bit_depth)
    {
        FILL_RECONSTRUCT_INFO;
        return ippiReconstructLumaIntra4x4_H264High_32s16u_IP1R(&info,
                                                                pMBIntraTypes,
                                                                edgeType);
    }

    inline IppStatus ReconstructLumaIntra16x16MB(Ipp32s **ppSrcCoeff,
                                                 Ipp16u *pSrcDstYPlane,
                                                 Ipp32u srcdstYStep,
                                                 const IppIntra16x16PredMode_H264 intra_luma_mode,
                                                 const Ipp32u cbp4x4,
                                                 const Ipp32s QP,
                                                 const Ipp8u edge_type,
                                                 Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus ReconstructLumaIntraMB(Ipp32s **ppSrcCoeff,
                                            Ipp16u *pSrcDstYPlane,
                                            Ipp32s srcdstYStep,
                                            const IppIntra4x4PredMode_H264 *pMBIntraTypes,
                                            const Ipp32u cbp4x4,
                                            const Ipp32s QP,
                                            const Ipp8u edgeType,
                                            Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus ReconstructLumaInterMB(Ipp32s **ppSrcCoeff,
                                            Ipp16u *pSrcDstYPlane,
                                            Ipp32u srcdstYStep,
                                            Ipp32u cbp4x4,
                                            Ipp32s QP,
                                            Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

#define FILL_CHROMA_RECONSTRUCT_INFO    \
    IppiReconstructHighMB_32s16u info_temp[2];\
    const IppiReconstructHighMB_32s16u *info[2];\
    info[0] = &info_temp[0];\
    info[1] = &info_temp[1];\
    info_temp[0].ppSrcDstCoeff = ppSrcDstCoeff;   \
    info_temp[0].pSrcDstPlane = pSrcDstUPlane;  \
    info_temp[0].srcDstStep = srcdstUVStep;    \
    info_temp[0].cbp = (Ipp32u)cbpU;          \
    info_temp[0].qp = chromaQPU;               \
    info_temp[0].pQuantTable = pQuantTableU;  \
    info_temp[0].bypassFlag = bypass_flag;      \
    info_temp[0].bitDepth = bit_depth;            \
    info_temp[1].ppSrcDstCoeff = ppSrcDstCoeff;   \
    info_temp[1].pSrcDstPlane = pSrcDstVPlane;  \
    info_temp[1].srcDstStep = srcdstUVStep;    \
    info_temp[1].cbp = (Ipp32u)cbpV;          \
    info_temp[1].qp = chromaQPV;\
    info_temp[1].pQuantTable = pQuantTableV;\
    info_temp[1].bypassFlag = bypass_flag;\
    info_temp[1].bitDepth = bit_depth;

    inline IppStatus ReconstructChromaInter4x4MB(Ipp32s **ppSrcDstCoeff,
                                                 Ipp16u *pSrcDstUPlane,
                                                 Ipp16u *pSrcDstVPlane,
                                                 Ipp32u srcdstUVStep,
                                                 Ipp32u cbpU,
                                                 Ipp32u cbpV,
                                                 Ipp32u chromaQPU,
                                                 Ipp32u chromaQPV,
                                                 Ipp16s *pQuantTableU,
                                                 Ipp16s *pQuantTableV,
                                                 Ipp8u  bypass_flag,
                                                 Ipp32s bit_depth)
    {
        FILL_CHROMA_RECONSTRUCT_INFO;
        return ippiReconstructChromaInter4x4_H264High_32s16u_IP2R(info);
    }

    inline IppStatus ReconstructChromaIntra4x4MB(Ipp32s **ppSrcDstCoeff,
                                                 Ipp16u *pSrcDstUPlane,
                                                 Ipp16u *pSrcDstVPlane,
                                                 Ipp32u srcdstUVStep,
                                                 IppIntraChromaPredMode_H264 intra_chroma_mode,
                                                 Ipp32u cbpU,
                                                 Ipp32u cbpV,
                                                 Ipp32u chromaQPU,
                                                 Ipp32u chromaQPV,
                                                 Ipp8u  edge_type,
                                                 Ipp16s *pQuantTableU,
                                                 Ipp16s *pQuantTableV,
                                                 Ipp8u  bypass_flag,
                                                 Ipp32s bit_depth)
    {
        FILL_CHROMA_RECONSTRUCT_INFO;
        return ippiReconstructChromaIntra4x4_H264High_32s16u_IP2R(info,
            intra_chroma_mode,
            edge_type);
    }


    inline IppStatus ReconstructChromaIntraHalfs4x4MB(Ipp32s **ppSrcDstCoeff,
                                                      Ipp16u *pSrcDstUPlane,
                                                      Ipp16u *pSrcDstVPlane,
                                                      Ipp32u srcdstUVStep,
                                                      IppIntraChromaPredMode_H264 intra_chroma_mode,
                                                      Ipp32u cbpU,
                                                      Ipp32u cbpV,
                                                      Ipp32u chromaQPU,
                                                      Ipp32u chromaQPV,
                                                      Ipp8u  edge_type_top,
                                                      Ipp8u  edge_type_bottom,
                                                      Ipp16s *pQuantTableU,
                                                      Ipp16s *pQuantTableV,
                                                      Ipp8u  bypass_flag,
                                                      Ipp32s bit_depth = 10)
    {
        FILL_CHROMA_RECONSTRUCT_INFO;
        return ippiReconstructChromaIntraHalf4x4_H264High_32s16u_IP2R(info,
                                                                      intra_chroma_mode,
                                                                      edge_type_top,
                                                                      edge_type_bottom);
    }

    inline IppStatus ReconstructChromaIntraHalfs4x4MB422(Ipp32s **ppSrcDstCoeff,
                                                         Ipp16u *pSrcDstUPlane,
                                                         Ipp16u *pSrcDstVPlane,
                                                         Ipp32u srcdstUVStep,
                                                         IppIntraChromaPredMode_H264 intraChromaMode,
                                                         Ipp32u cbpU,
                                                         Ipp32u cbpV,
                                                         Ipp32u chromaQPU,
                                                         Ipp32u chromaQPV,
                                                         Ipp32u levelScaleDCU,
                                                         Ipp32u levelScaleDCV,
                                                         Ipp8u  edgeTypeTop,
                                                         Ipp8u  edgeTypeBottom,
                                                         Ipp16s *pQuantTableU,
                                                         Ipp16s *pQuantTableV,
                                                         Ipp8u  bypass_flag,
                                                         Ipp32s bit_depth = 10)
    {
        FILL_CHROMA_RECONSTRUCT_INFO;
        return ippiReconstructChroma422IntraHalf4x4_H264High_32s16u_IP2R(info,
            intraChromaMode,
            edgeTypeTop,
            edgeTypeBottom,
            levelScaleDCU,
            levelScaleDCV);
    }

    inline IppStatus ReconstructChromaIntraHalfs4x4MB444(Ipp32s **ppSrcDstCoeff,
                                                         Ipp16u *pSrcDstUPlane,
                                                         Ipp16u *pSrcDstVPlane,
                                                         Ipp32u srcdstUVStep,
                                                         IppIntraChromaPredMode_H264 intraChromaMode,
                                                         Ipp32u cbpU,
                                                         Ipp32u cbpV,
                                                         Ipp32u chromaQPU,
                                                         Ipp32u chromaQPV,
                                                         Ipp8u  edgeTypeTop,
                                                         Ipp8u  edgeTypeBottom,
                                                         Ipp16s *pQuantTableU,
                                                         Ipp16s *pQuantTableV,
                                                         Ipp8u  bypassFlag,
                                                         Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

   inline IppStatus ReconstructChromaInter4x4MB422(Ipp32s **ppSrcDstCoeff,
                                                   Ipp16u *pSrcDstUPlane,
                                                   Ipp16u *pSrcDstVPlane,
                                                   Ipp32u srcdstUVStep,
                                                   Ipp32u cbpU,
                                                   Ipp32u cbpV,
                                                   Ipp32u chromaQPU,
                                                   Ipp32u chromaQPV,
                                                   Ipp32u levelScaleDCU,
                                                   Ipp32u levelScaleDCV,
                                                   Ipp16s *pQuantTableU,
                                                   Ipp16s *pQuantTableV,
                                                   Ipp8u  bypass_flag,
                                                   Ipp32s bit_depth)
   {
       FILL_CHROMA_RECONSTRUCT_INFO;
       return ippiReconstructChroma422Inter4x4_H264High_32s16u_IP2R(info,
                                                                    levelScaleDCU,
                                                                    levelScaleDCV);
   }

    inline IppStatus ReconstructChromaInter4x4MB444(Ipp32s **ppSrcDstCoeff,
                                                    Ipp16u *pSrcDstUPlane,
                                                    Ipp16u *pSrcDstVPlane,
                                                    Ipp32u srcdstUVStep,
                                                    Ipp32u cbpU,
                                                    Ipp32u cbpV,
                                                    Ipp32u chromaQPU,
                                                    Ipp32u chromaQPV,
                                                    Ipp16s *pQuantTableU,
                                                    Ipp16s *pQuantTableV,
                                                    Ipp8u  bypassFlag,
                                                    Ipp32s bit_depth = 10)
   {
       VM_ASSERT(false);
       return ippStsNoErr;
   }


    inline IppStatus ReconstructChromaInterMB(Ipp32s **ppSrcCoeff,
                                              Ipp16u *pSrcDstUPlane,
                                              Ipp16u *pSrcDstVPlane,
                                              const Ipp32u srcdstStep,
                                              Ipp32u cbpU,
                                              Ipp32u cbpV,
                                              const Ipp32u ChromaQP,
                                              Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus ReconstructChromaIntraMB(Ipp32s **ppSrcCoeff,
                                              Ipp16u *pSrcDstUPlane,
                                              Ipp16u *pSrcDstVPlane,
                                              const Ipp32u srcdstUVStep,
                                              const IppIntraChromaPredMode_H264 intra_chroma_mode,
                                              Ipp32u cbpU,
                                              Ipp32u cbpV,
                                              const Ipp32u ChromaQP,
                                              const Ipp8u edge_type,
                                              Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }


    inline IppStatus ReconstructChromaIntraHalfsMB(Ipp32s **ppSrcCoeff,
                                                   Ipp16u *pSrcDstUPlane,
                                                   Ipp16u *pSrcDstVPlane,
                                                   Ipp32u srcdstUVStep,
                                                   IppIntraChromaPredMode_H264 intra_chroma_mode,
                                                   Ipp32u cbpU,
                                                   Ipp32u cbpV,
                                                   Ipp32u ChromaQP,
                                                   Ipp8u  edge_type_top,
                                                   Ipp8u  edge_type_bottom,
                                                   Ipp32s bit_depth = 10)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    inline IppStatus ReconstructChromaIntra4x4MB422(Ipp32s **ppSrcDstCoeff,
                                                    Ipp16u *pSrcDstUPlane,
                                                    Ipp16u *pSrcDstVPlane,
                                                    Ipp32u srcdstUVStep,
                                                    IppIntraChromaPredMode_H264 intraChromaMode,
                                                    Ipp32u cbpU,
                                                    Ipp32u cbpV,
                                                    Ipp32u chromaQPU,
                                                    Ipp32u chromaQPV,
                                                    Ipp32u levelScaleDCU,
                                                    Ipp32u levelScaleDCV,
                                                    Ipp8u  edgeType,
                                                    Ipp16s *pQuantTableU,
                                                    Ipp16s *pQuantTableV,
                                                    Ipp8u  bypass_flag,
                                                    Ipp32s bit_depth)
   {
       FILL_CHROMA_RECONSTRUCT_INFO;
       return ippiReconstructChroma422Intra4x4_H264High_32s16u_IP2R(info,
                                                                    intraChromaMode,
                                                                    edgeType,
                                                                    levelScaleDCU,
                                                                    levelScaleDCV);
   }

    inline IppStatus ReconstructChromaIntra4x4MB444(Ipp32s **ppSrcDstCoeff,
                                                    Ipp16u *pSrcDstUPlane,
                                                    Ipp16u *pSrcDstVPlane,
                                                    Ipp32u srcdstUVStep,
                                                    IppIntraChromaPredMode_H264 intraChromaMode,
                                                    Ipp32u cbpU,
                                                    Ipp32u cbpV,
                                                    Ipp32u chromaQPU,
                                                    Ipp32u chromaQPV,
                                                    Ipp8u  edgeType,
                                                    Ipp16s *pQuantTableU,
                                                    Ipp16s *pQuantTableV,
                                                    Ipp8u  bypassFlag,
                                                    Ipp32s bit_depth)
   {
       VM_ASSERT(false);
        return ippStsNoErr;
   }

    IppStatus FilterDeblockingLuma_HorEdge(Ipp16u* pSrcDst,
                                           Ipp32s  srcdstStep,
                                           Ipp8u*  pAlpha,
                                           Ipp8u*  pBeta,
                                           Ipp8u*  pThresholds,
                                           Ipp8u*  pBS,
                                           Ipp32s  bit_depth);

    IppStatus FilterDeblockingLuma_VerEdge_MBAFF(Ipp16u* pSrcDst,
                                                 Ipp32s  srcdstStep,
                                                 Ipp8u*  pAlpha,
                                                 Ipp8u*  pBeta,
                                                 Ipp8u*  pThresholds,
                                                 Ipp8u*  pBs,
                                                 Ipp32s  bit_depth);

    IppStatus FilterDeblockingLuma_VerEdge(Ipp16u* pSrcDst,
                                           Ipp32s  srcdstStep,
                                           Ipp8u*  pAlpha,
                                           Ipp8u*  pBeta,
                                           Ipp8u*  pThresholds,
                                           Ipp8u*  pBs,
                                           Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma_VerEdge_MBAFF(Ipp16u* pSrcDst,
                                                   Ipp32s  srcdstStep,
                                                   Ipp8u*  pAlpha,
                                                   Ipp8u*  pBeta,
                                                   Ipp8u*  pThresholds,
                                                   Ipp8u*  pBS,
                                                   Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma_VerEdge(Ipp16u* pSrcDst,
                                             Ipp32s  srcdstStep,
                                             Ipp8u*  pAlpha,
                                             Ipp8u*  pBeta,
                                             Ipp8u*  pThresholds,
                                             Ipp8u*  pBS,
                                             Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma_HorEdge(Ipp16u* pSrcDst,
                                             Ipp32s  srcdstStep,
                                             Ipp8u*  pAlpha,
                                             Ipp8u*  pBeta,
                                             Ipp8u*  pThresholds,
                                             Ipp8u*  pBS,
                                             Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma422_VerEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma422_HorEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma444_VerEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth);

    IppStatus FilterDeblockingChroma444_HorEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth);

#define FILL_VC_BIDIR_INFO  \
    IppVCBidir_16u info;\
    info.pSrc1 = pSrc1;\
    info.srcStep1 = nSrcPitch1;\
    info.pSrc2 = pSrc2;\
    info.srcStep2 = nSrcPitch2;\
    info.pDst = pDst;\
    info.dstStep = nDstPitch;\
    info.roiSize = roi;\
    info.bitDepth = bit_depth;

    inline IppStatus BiDirWeightBlock(Ipp16u *pSrc1,
                                      Ipp16u *pSrc2,
                                      Ipp16u *pDst,
                                      Ipp32u nSrcPitch1,
                                      Ipp32u nSrcPitch2,
                                      Ipp32u nDstPitch,
                                      Ipp32u ulog2wd,
                                      Ipp32s iWeight1,
                                      Ipp32s iOffset1,
                                      Ipp32s iWeight2,
                                      Ipp32s iOffset2,
                                      IppiSize roi,
                                      Ipp32s bit_depth)
    {
        FILL_VC_BIDIR_INFO;
        return ippiBidirWeight_H264_16u_P2P1R(&info, ulog2wd, iWeight1, iOffset1, iWeight2, iOffset2);
    }

    inline IppStatus BiDirWeightBlockImplicit(Ipp16u *pSrc1,
                                              Ipp16u *pSrc2,
                                              Ipp16u *pDst,
                                              Ipp32u nSrcPitch1,
                                              Ipp32u nSrcPitch2,
                                              Ipp32u nDstPitch,
                                              Ipp32s iWeight1,
                                              Ipp32s iWeight2,
                                              IppiSize roi,
                                              Ipp32s bit_depth = 10)
    {
        FILL_VC_BIDIR_INFO;
        return ippiBidirWeightImplicit_H264_16u_P2P1R(&info,
                                                      iWeight1,
                                                      iWeight2);
    }

    inline IppStatus InterpolateBlock(Ipp16u *pSrc1,
                                      Ipp16u *pSrc2,
                                      Ipp16u *pDst,
                                      Ipp32u uWidth,
                                      Ipp32u uHeight,
                                      Ipp32s nSrcPitch1,
                                      Ipp32s nSrcPitch2,
                                      Ipp32s nDstPitch,
                                      Ipp32s bit_depth)
    {
        IppiSize roi; // = {uWidth,uHeight};
        roi.width = uWidth;
        roi.height = uHeight;
        FILL_VC_BIDIR_INFO;
        return ippiBidir_H264_16u_P2P1R(&info);
    }

    inline IppStatus DecodeCAVLCChromaDcCoeffs422_H264(Ipp32u **ppBitStream,
                                                       Ipp32s *pOffset,
                                                       Ipp16s *pNumCoeff,
                                                       Ipp32s **ppDstCoeffs,
                                                       const Ipp32s *pTblCoeffToken,
                                                       const Ipp32s **ppTblTotalZerosCR,
                                                       const Ipp32s **ppTblRunBefore)
    {
        return ippiDecodeCAVLCChroma422DcCoeffs_H264_1u32s(ppBitStream,
                                                            pOffset,
                                                            pNumCoeff,
                                                            ppDstCoeffs,
                                                            pTblCoeffToken,
                                                            ppTblTotalZerosCR,
                                                            ppTblRunBefore);
    }

    inline IppStatus DecodeCAVLCCoeffs_H264(Ipp32u **ppBitStream,
                                            Ipp32s *pOffset,
                                            Ipp16s *pNumCoeff,
                                            Ipp32s **ppDstCoeffs,
                                            Ipp32u uVLCSelect,
                                            Ipp16s uMaxNumCoeff,
                                            const Ipp32s **ppTblCoeffToken,
                                            const Ipp32s **ppTblTotalZeros,
                                            const Ipp32s **ppTblRunBefore,
                                            const Ipp32s *pScanMatrix)
    {
        return ippiDecodeCAVLCCoeffs_H264_1u32s(ppBitStream,
                                                        pOffset,
                                                        pNumCoeff,
                                                        ppDstCoeffs,
                                                        uVLCSelect,
                                                        uMaxNumCoeff,
                                                        ppTblCoeffToken,
                                                        ppTblTotalZeros,
                                                        ppTblRunBefore,
                                                        pScanMatrix);
    }

    inline IppStatus DecodeCAVLCChromaDcCoeffs_H264(Ipp32u **ppBitStream,
                                                    Ipp32s *pOffset,
                                                    Ipp16s *pNumCoeff,
                                                    Ipp32s **ppDstCoeffs,
                                                    const Ipp32s *pTblCoeffToken,
                                                    const Ipp32s **ppTblTotalZerosCR,
                                                    const Ipp32s **ppTblRunBefore)
    {
        return ippiDecodeCAVLCChromaDcCoeffs_H264_1u32s(ppBitStream,
                                                                pOffset,
                                                                pNumCoeff,
                                                                ppDstCoeffs,
                                                                pTblCoeffToken,
                                                                ppTblTotalZerosCR,
                                                                ppTblRunBefore);
    }

#pragma warning(default: 4100)

} // namespace UMC

#endif // __UMC_H264_DEC_IPP_WRAP_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
