/*
//
//                  INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in accordance with the terms of that agreement.
//        Copyright(c) 2002-2003 Intel Corporation. All Rights Reserved.
//
//  Intel® Integrated Performance Primitives Audio Processing
//  Sample for Windows*
//
//  By downloading and installing this sample, you hereby agree that the
//  accompanying Materials are being provided to you under the terms and
//  conditions of the End User License Agreement for the Intel® Integrated
//  Performance Primitives product previously accepted by you. Please refer
//  to the file ipplic.htm located in the root directory of your Intel® IPP
//  product installation for more information.
//
//  Contents:   FFT context functions (initialization):
//                ippsFFTInitAlloc_Ñ_32sñ
//                ippsFFTInitAlloc_R_32s
//                ippsFFTInitAlloc_R_16s32s
//              FFT context functions (deleting):
//                ippsFFTFree_C_32sc
//                ippsFFTFree_R_32s
//                ippsFFTFree_R_16s32s
//              FFT buffer size functions:
//                ippsFFTGetBufSize_C_32sc
//                ippsFFTGetBufSize_R_32s
//                ippsFFTGetBufSize_R_16s32s
//              FFT transformation functions:
//                ippsFFTFwd_CToC_32sc_Sfs
//                ippsFFTInv_CToC_32sc_Sfs
//                ippsFFTFwd_RToCCS_32s_Sfs
//                ippsFFTInv_CCSToR_32s_Sfs
//                ippsFFTFwd_RToCCS_16s32s_Sfs
//                ippsFFTInv_CCSToR_32s16s_Sfs
//
*/

#include "../../include/psffti.h"

/* Initialization context functions */

IPPFUN(IppStatus, ippsFFTInitAlloc_C_32sc, (IppsFFTSpec_C_32sc **pFFTSpec, int order, int flag, IppHintAlgorithm hint))
{
    IppStatus result;

    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BAD_FFT_ORDER_RET(order);

    *pFFTSpec = (IppsFFTSpec_C_32sc*)ippsMalloc_8u(sizeof(IppsFFTSpec_C_32sc));
    if (pFFTSpec == NULL) return ippStsMemAllocErr;
    (*pFFTSpec)->id = idCtxFFT_C_32sc;
    (*pFFTSpec)->order = order;
    (*pFFTSpec)->length = (1 << (order + 1));
    (*pFFTSpec)->pSrc = ippsMalloc_32f((*pFFTSpec)->length);
    (*pFFTSpec)->pDst = ippsMalloc_32f((*pFFTSpec)->length);
    result = ippsFFTInitAlloc_C_32fc(&((*pFFTSpec)->pSpec), order, flag, hint);

    return result;
}

IPPFUN(IppStatus, ippsFFTInitAlloc_R_32s, (IppsFFTSpec_R_32s **pFFTSpec, int order, int flag, IppHintAlgorithm hint))
{
    IppStatus result;

    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BAD_FFT_ORDER_RET(order);

    *pFFTSpec = (IppsFFTSpec_R_32s*)(ippsMalloc_8u(sizeof(IppsFFTSpec_R_32s)));
    if (pFFTSpec == NULL) return ippStsMemAllocErr;
    (*pFFTSpec)->id = idCtxFFT_R_32s;
    (*pFFTSpec)->order = order;
    (*pFFTSpec)->length = (1 << order);
    (*pFFTSpec)->pSrc = ippsMalloc_32f((*pFFTSpec)->length+2);
    (*pFFTSpec)->pDst = ippsMalloc_32f((*pFFTSpec)->length+2);
    result = ippsFFTInitAlloc_R_32f(&((*pFFTSpec)->pSpec), order, flag, hint);

    return result;
}

IPPFUN(IppStatus, ippsFFTInitAlloc_R_16s32s, (IppsFFTSpec_R_16s32s **pFFTSpec, int order, int flag, IppHintAlgorithm hint))
{
    IppStatus result;

    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BAD_FFT_ORDER_RET(order);

    *pFFTSpec = (IppsFFTSpec_R_16s32s*)(ippsMalloc_8u(sizeof(IppsFFTSpec_R_16s32s)));
    if (pFFTSpec == NULL) return ippStsMemAllocErr;
    (*pFFTSpec)->id = idCtxFFT_R_16s32s;
    (*pFFTSpec)->order = order;
    (*pFFTSpec)->length = (1 << order);
    (*pFFTSpec)->pSrc = ippsMalloc_32f((*pFFTSpec)->length+2);
    (*pFFTSpec)->pDst = ippsMalloc_32f((*pFFTSpec)->length+2);
    result = ippsFFTInitAlloc_R_32f(&((*pFFTSpec)->pSpec), order, flag, hint);

    return result;
}

/* Deleting context functions */

IPPFUN(IppStatus, ippsFFTFree_C_32sc, (IppsFFTSpec_C_32sc* pFFTSpec))
{
    IppStatus result;

    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_C_32sc, ippStsContextMatchErr);

    ippsFree(pFFTSpec->pSrc);
    ippsFree(pFFTSpec->pDst);
    result = ippsFFTFree_C_32fc(pFFTSpec->pSpec);

    return result;
}

IPPFUN(IppStatus, ippsFFTFree_R_32s, (IppsFFTSpec_R_32s* pFFTSpec))
{
    IppStatus result;

    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_R_32s, ippStsContextMatchErr);

    ippsFree(pFFTSpec->pSrc);
    ippsFree(pFFTSpec->pDst);
    result = ippsFFTFree_R_32f(pFFTSpec->pSpec);

    return result;
}

IPPFUN(IppStatus, ippsFFTFree_R_16s32s, (IppsFFTSpec_R_16s32s* pFFTSpec))
{
    IppStatus result;

    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_R_16s32s, ippStsContextMatchErr);

    ippsFree(pFFTSpec->pSrc);
    ippsFree(pFFTSpec->pDst);
    result = ippsFFTFree_R_32f(pFFTSpec->pSpec);

    return result;
}

/* Getting working buffer size functions */

IPPFUN(IppStatus, ippsFFTGetBufSize_C_32sc, (const IppsFFTSpec_C_32sc* pFFTSpec, int *pSize))
{
    return ippsFFTGetBufSize_C_32fc(pFFTSpec->pSpec, pSize);
}

IPPFUN(IppStatus, ippsFFTGetBufSize_R_32s, (const IppsFFTSpec_R_32s* pFFTSpec, int *pSize))
{
    return ippsFFTGetBufSize_R_32f(pFFTSpec->pSpec, pSize);
}

IPPFUN(IppStatus, ippsFFTGetBufSize_R_16s32s, (const IppsFFTSpec_R_16s32s* pFFTSpec, int *pSize))
{
    return ippsFFTGetBufSize_R_32f(pFFTSpec->pSpec, pSize);
}

/* Forward FFT functions */

IPPFUN(IppStatus, ippsFFTFwd_CToC_32sc_Sfs, (const Ipp32sc *pSrc, Ipp32sc *pDst, IppsFFTSpec_C_32sc *pFFTSpec,
                                             int scaleFactor, Ipp8u* pBuffer))
{
    IppStatus result;

    IPP_BAD_PTR2_RET(pSrc, pDst);
    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_C_32sc, ippStsContextMatchErr);

    ippsConvert_32s32f((Ipp32s*)pSrc, pFFTSpec->pSrc, pFFTSpec->length);
    result = ippsFFTFwd_CToC_32fc((Ipp32fc*)pFFTSpec->pSrc, (Ipp32fc*)pFFTSpec->pDst, pFFTSpec->pSpec, pBuffer);
    ippsConvert_32f32s_Sfs(pFFTSpec->pDst, (Ipp32s*)pDst, pFFTSpec->length, ippRndNear, scaleFactor);

    return result;
}

IPPFUN(IppStatus, ippsFFTFwd_RToCCS_32s_Sfs, (const Ipp32s *pSrc, Ipp32s *pDst, IppsFFTSpec_R_32s *pFFTSpec,
                                              int scaleFactor, Ipp8u* pBuffer))
{
    IppStatus result;

    IPP_BAD_PTR2_RET(pSrc, pDst);
    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_R_32s, ippStsContextMatchErr);

    ippsConvert_32s32f(pSrc, pFFTSpec->pSrc, pFFTSpec->length);
    result = ippsFFTFwd_RToCCS_32f(pFFTSpec->pSrc, pFFTSpec->pDst, pFFTSpec->pSpec, pBuffer);
    ippsConvert_32f32s_Sfs(pFFTSpec->pDst, pDst, pFFTSpec->length+2, ippRndNear, scaleFactor);

    return result;
}

IPPFUN(IppStatus, ippsFFTFwd_RToCCS_16s32s_Sfs, (const Ipp16s* pSrc, Ipp32s* pDst, const IppsFFTSpec_R_16s32s* pFFTSpec,
                                                 int scaleFactor, Ipp8u* pBuffer))
{
    IppStatus result;

    IPP_BAD_PTR2_RET(pSrc, pDst);
    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_R_16s32s, ippStsContextMatchErr);

    ippsConvert_16s32f(pSrc, pFFTSpec->pSrc, pFFTSpec->length);
    result = ippsFFTFwd_RToCCS_32f(pFFTSpec->pSrc, pFFTSpec->pDst, pFFTSpec->pSpec, pBuffer);
    ippsConvert_32f32s_Sfs(pFFTSpec->pDst, pDst, pFFTSpec->length+2, ippRndNear, scaleFactor);

    return result;
}

/* Inverse FFT functions */

IPPFUN(IppStatus, ippsFFTInv_CToC_32sc_Sfs, (const Ipp32sc *pSrc, Ipp32sc *pDst, IppsFFTSpec_C_32sc *pFFTSpec,
                                             int scaleFactor, Ipp8u* pBuffer))
{
    IppStatus result;

    IPP_BAD_PTR2_RET(pSrc, pDst);
    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_C_32sc, ippStsContextMatchErr);

    ippsConvert_32s32f((Ipp32s*)pSrc, pFFTSpec->pSrc, pFFTSpec->length);
    result = ippsFFTInv_CToC_32fc((Ipp32fc*)pFFTSpec->pSrc, (Ipp32fc*)pFFTSpec->pDst, pFFTSpec->pSpec, pBuffer);
    ippsConvert_32f32s_Sfs(pFFTSpec->pDst, (Ipp32s*)pDst, pFFTSpec->length, ippRndNear, scaleFactor);

    return result;
}

IPPFUN(IppStatus, ippsFFTInv_CCSToR_32s_Sfs, (const Ipp32s *pSrc, Ipp32s *pDst, IppsFFTSpec_R_32s *pFFTSpec,
                                              int scaleFactor, Ipp8u* pBuffer))
{
    IppStatus result;

    IPP_BAD_PTR2_RET(pSrc, pDst);
    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_R_32s, ippStsContextMatchErr);

    ippsConvert_32s32f(pSrc, pFFTSpec->pSrc, pFFTSpec->length+2);
    result = ippsFFTInv_CCSToR_32f(pFFTSpec->pSrc, pFFTSpec->pDst, pFFTSpec->pSpec, pBuffer);
    ippsConvert_32f32s_Sfs(pFFTSpec->pDst, pDst, pFFTSpec->length, ippRndNear, scaleFactor);

    return result;
}

IPPFUN(IppStatus, ippsFFTInv_CCSToR_32s16s_Sfs, (const Ipp32s* pSrc, Ipp16s* pDst, const IppsFFTSpec_R_16s32s* pFFTSpec,
                                                 int scaleFactor, Ipp8u* pBuffer))
{
    IppStatus result;

    IPP_BAD_PTR2_RET(pSrc, pDst);
    IPP_BAD_PTR1_RET(pFFTSpec);
    IPP_BADARG_RET(pFFTSpec->id != idCtxFFT_R_16s32s, ippStsContextMatchErr);

    ippsConvert_32s32f(pSrc, pFFTSpec->pSrc, pFFTSpec->length+2);
    result = ippsFFTInv_CCSToR_32f(pFFTSpec->pSrc, pFFTSpec->pDst, pFFTSpec->pSpec, pBuffer);
    ippsConvert_32f16s_Sfs(pFFTSpec->pDst, pDst, pFFTSpec->length, ippRndNear, scaleFactor);

    return result;
}

