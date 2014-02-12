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
#include "ippvc.h"
#include "umc_h264_dec_ippwrap.h"

namespace UMC
{
#pragma warning(disable: 4100)

    IppStatus FilterDeblockingLuma_HorEdge(Ipp8u* pSrcDst,
                                           Ipp32s srcdstStep,
                                           Ipp8u* pAlpha,
                                           Ipp8u* pBeta,
                                           Ipp8u* pThresholds,
                                           Ipp8u* pBS,
                                           Ipp32s bit_depth)
    {
        return ippiFilterDeblockingLuma_HorEdge_H264_8u_C1IR(pSrcDst,
                                                             srcdstStep,
                                                             pAlpha,
                                                             pBeta,
                                                             pThresholds,
                                                             pBS);
    }

    IppStatus FilterDeblockingLuma_VerEdge_MBAFF(Ipp8u* pSrcDst,
                                                 Ipp32s srcdstStep,
                                                 Ipp8u* pAlpha,
                                                 Ipp8u* pBeta,
                                                 Ipp8u* pThresholds,
                                                 Ipp8u* pBS,
                                                 Ipp32s bit_depth)
    {
        return ippiFilterDeblockingLuma_VerEdge_MBAFF_H264_8u_C1IR(pSrcDst,
                                                                   srcdstStep,
                                                                   pAlpha[0],
                                                                   pBeta[0],
                                                                   pThresholds,
                                                                   pBS);
    }

    IppStatus FilterDeblockingLuma_VerEdge(Ipp8u* pSrcDst,
                                           Ipp32s srcdstStep,
                                           Ipp8u* pAlpha,
                                           Ipp8u* pBeta,
                                           Ipp8u* pThresholds,
                                           Ipp8u* pBS,
                                           Ipp32s bit_depth)
    {
        return ippiFilterDeblockingLuma_VerEdge_H264_8u_C1IR(pSrcDst,
                                                             srcdstStep,
                                                             pAlpha,
                                                             pBeta,
                                                             pThresholds,
                                                             pBS);
    }

    IppStatus FilterDeblockingChroma_VerEdge_MBAFF(Ipp8u* pSrcDst,
                                                   Ipp32s srcdstStep,
                                                   Ipp8u* pAlpha,
                                                   Ipp8u* pBeta,
                                                   Ipp8u* pThresholds,
                                                   Ipp8u* pBS,
                                                   Ipp32s bit_depth)
    {
        return ippiFilterDeblockingChroma_VerEdge_MBAFF_H264_8u_C1IR(pSrcDst,
                                                                     srcdstStep,
                                                                     pAlpha[0],
                                                                     pBeta[0],
                                                                     pThresholds,
                                                                     pBS);
    }

    IppStatus FilterDeblockingChroma_VerEdge(Ipp8u* pSrcDst,
                                             Ipp32s srcdstStep,
                                             Ipp8u* pAlpha,
                                             Ipp8u* pBeta,
                                             Ipp8u* pThresholds,
                                             Ipp8u* pBS,
                                             Ipp32s bit_depth)
    {
        return ippiFilterDeblockingChroma_VerEdge_H264_8u_C1IR(pSrcDst,
                                                               srcdstStep,
                                                               pAlpha,
                                                               pBeta,
                                                               pThresholds,
                                                               pBS);
    }

    IppStatus FilterDeblockingChroma_HorEdge(Ipp8u* pSrcDst,
                                             Ipp32s srcdstStep,
                                             Ipp8u* pAlpha,
                                             Ipp8u* pBeta,
                                             Ipp8u* pThresholds,
                                             Ipp8u* pBS,
                                             Ipp32s bit_depth)
    {
        return ippiFilterDeblockingChroma_HorEdge_H264_8u_C1IR(pSrcDst,
                                                               srcdstStep,
                                                               pAlpha,
                                                               pBeta,
                                                               pThresholds,
                                                               pBS);
    }

#define FILL_FILTER_INFO \
    IppiFilterDeblock_8u info;\
    info.pSrcDstPlane = pSrcDst;\
    info.srcDstStep = srcdstStep;\
    info.pAlpha = pAlpha;\
    info.pBeta = pBeta;\
    info.pThresholds = pThresholds;\
    info.pBs = pBS;

    IppStatus FilterDeblockingChroma422_VerEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth)
    {
        FILL_FILTER_INFO;
        return ippiFilterDeblockingChroma422VerEdge_H264_8u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma422_HorEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth)
    {
        FILL_FILTER_INFO;
        return ippiFilterDeblockingChroma422HorEdge_H264_8u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma444_VerEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    IppStatus FilterDeblockingChroma444_HorEdge(Ipp8u* pSrcDst,
                                                Ipp32s srcdstStep,
                                                Ipp8u* pAlpha,
                                                Ipp8u* pBeta,
                                                Ipp8u* pThresholds,
                                                Ipp8u* pBS,
                                                Ipp32s bit_depth)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }


    ///****************************************************************************************/
    // 16 bits functions
    ///****************************************************************************************/
#define CONVERT_TO_16U(size_alpha, size_clipping)   \
        Ipp32s i;\
        Ipp32s bitDepthScale = 1 << (bit_depth - 8);\
        \
        Ipp16u pAlpha_16u[size_alpha];\
        Ipp16u pBeta_16u[size_alpha];\
        Ipp16u pThresholds_16u[size_clipping];\
        IppiFilterDeblock_16u info;\
        info.pSrcDstPlane = pSrcDst;\
        info.srcDstStep = srcdstStep;\
        info.pAlpha = pAlpha_16u;\
        info.pBeta = pBeta_16u;\
        info.pThresholds = pThresholds_16u;\
        info.pBs = pBS;\
        info.bitDepth = bit_depth;\
\
        for (i = 0; i < sizeof(pAlpha_16u)/sizeof(pAlpha_16u[0]); i++)\
        {\
            pAlpha_16u[i]   = (Ipp16u)(pAlpha[i]*bitDepthScale);\
            pBeta_16u[i]    = (Ipp16u)(pBeta[i]*bitDepthScale);\
        }\
\
        for (i = 0; i < sizeof(pThresholds_16u)/sizeof(pThresholds_16u[0]); i++)\
        {\
            pThresholds_16u[i] = (Ipp16u)(pThresholds[i]*bitDepthScale);\
        }

    IppStatus FilterDeblockingLuma_HorEdge(Ipp16u* pSrcDst,
                                           Ipp32s  srcdstStep,
                                           Ipp8u*  pAlpha,
                                           Ipp8u*  pBeta,
                                           Ipp8u*  pThresholds,
                                           Ipp8u*  pBS,
                                           Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(2, 16);
        return ippiFilterDeblockingLumaHorEdge_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingLuma_VerEdge_MBAFF(Ipp16u* pSrcDst,
                                                 Ipp32s  srcdstStep,
                                                 Ipp8u*  pAlpha,
                                                 Ipp8u*  pBeta,
                                                 Ipp8u*  pThresholds,
                                                 Ipp8u*  pBS,
                                                 Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(1, 4);
        return ippiFilterDeblockingLumaVerEdgeMBAFF_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingLuma_VerEdge(Ipp16u* pSrcDst,
                                           Ipp32s  srcdstStep,
                                           Ipp8u*  pAlpha,
                                           Ipp8u*  pBeta,
                                           Ipp8u*  pThresholds,
                                           Ipp8u*  pBS,
                                           Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(2, 16);
        return ippiFilterDeblockingLumaVerEdge_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma_VerEdge_MBAFF(Ipp16u* pSrcDst,
                                                   Ipp32s  srcdstStep,
                                                   Ipp8u*  pAlpha,
                                                   Ipp8u*  pBeta,
                                                   Ipp8u*  pThresholds,
                                                   Ipp8u*  pBS,
                                                   Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(1, 4);
        return ippiFilterDeblockingChromaVerEdgeMBAFF_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma_VerEdge(Ipp16u* pSrcDst,
                                             Ipp32s  srcdstStep,
                                             Ipp8u*  pAlpha,
                                             Ipp8u*  pBeta,
                                             Ipp8u*  pThresholds,
                                             Ipp8u*  pBS,
                                             Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(2, 8);
        return ippiFilterDeblockingChromaVerEdge_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma_HorEdge(Ipp16u* pSrcDst,
                                             Ipp32s  srcdstStep,
                                             Ipp8u*  pAlpha,
                                             Ipp8u*  pBeta,
                                             Ipp8u*  pThresholds,
                                             Ipp8u*  pBS,
                                             Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(2, 8);
        return ippiFilterDeblockingChromaHorEdge_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma422_VerEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(2, 8);
        return ippiFilterDeblockingChroma422VerEdge_H264_16u_C1IR(&info);
    }

    IppStatus FilterDeblockingChroma422_HorEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth)
    {
        CONVERT_TO_16U(2, 16);
        return ippiFilterDeblockingChroma422HorEdge_H264_16u_C1IR(&info);
    }


    IppStatus FilterDeblockingChroma444_VerEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

    IppStatus FilterDeblockingChroma444_HorEdge(Ipp16u* pSrcDst,
                                                Ipp32s  srcdstStep,
                                                Ipp8u*  pAlpha,
                                                Ipp8u*  pBeta,
                                                Ipp8u*  pThresholds,
                                                Ipp8u*  pBS,
                                                Ipp32s  bit_depth)
    {
        VM_ASSERT(false);
        return ippStsNoErr;
    }

#pragma warning(default: 4100)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
