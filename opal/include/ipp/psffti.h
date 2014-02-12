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
//  Purpose:    for FFT transform
//
*/

#ifndef __PSFFTI_H__
#define __PSFFTI_H__

//#include "owns.h"
#include "ipps.h"

typedef enum {
    idCtxUnknown = 0,
    idCtxFFT_C_32sc,
    idCtxFFT_R_32s,
    idCtxFFT_R_16s32s
} IppCtxId;

#ifndef NULL
#define NULL (0)
#endif

#define IPP_BADARG_RET(expr,ErrCode ) {if (expr) { return ErrCode; }}
#define IPP_BAD_PTR1_RET(ptr)         IPP_BADARG_RET((!ptr), ippStsNullPtrErr)
#define IPP_BAD_PTR2_RET(ptr1,ptr2)   IPP_BADARG_RET(((!ptr1)||(!ptr2)), ippStsNullPtrErr)
#define IPP_BAD_FFT_ORDER_RET(order)  IPP_BADARG_RET((order < 0 || order > 30), ippStsFftOrderErr)


typedef struct FFTSpec_C_32sc {
    IppCtxId            id;
    Ipp32f             *pSrc;
    Ipp32f             *pDst;
    int                 order;
    int                 length;
    IppsFFTSpec_C_32fc *pSpec;
} IppsFFTSpec_C_32sc;

typedef struct FFTSpec_R_32s {
    IppCtxId            id;
    Ipp32f             *pSrc;
    Ipp32f             *pDst;
    int                 order;
    int                 length;
    IppsFFTSpec_R_32f  *pSpec;
} IppsFFTSpec_R_32s;

typedef struct FFTSpec_R_16s32s {
    IppCtxId            id;
    Ipp32f             *pSrc;
    Ipp32f             *pDst;
    int                 order;
    int                 length;
    IppsFFTSpec_R_32f  *pSpec;
} IppsFFTSpec_R_16s32s;


#define IPPFUN(type,name,arg)                extern type __STDCALL name arg

IPPFUN(IppStatus, ippsFFTInitAlloc_C_32sc, (IppsFFTSpec_C_32sc **pFFTSpec, int order, int flag, IppHintAlgorithm hint));
IPPFUN(IppStatus, ippsFFTInitAlloc_R_32s, (IppsFFTSpec_R_32s **pFFTSpec, int order, int flag, IppHintAlgorithm hint));
IPPFUN(IppStatus, ippsFFTInitAlloc_R_16s32s, (IppsFFTSpec_R_16s32s **pFFTSpec, int order, int flag, IppHintAlgorithm hint));
IPPFUN(IppStatus, ippsFFTFree_C_32sc, (IppsFFTSpec_C_32sc* pFFTSpec));
IPPFUN(IppStatus, ippsFFTFree_R_32s, (IppsFFTSpec_R_32s* pFFTSpec));
IPPFUN(IppStatus, ippsFFTFree_R_16s32s, (IppsFFTSpec_R_16s32s* pFFTSpec));
IPPFUN(IppStatus, ippsFFTGetBufSize_R_16s32s, (const IppsFFTSpec_R_16s32s* pFFTSpec, int *pSize));
IPPFUN(IppStatus, ippsFFTGetBufSize_R_32s, (const IppsFFTSpec_R_32s* pFFTSpec, int *pSize));
IPPFUN(IppStatus, ippsFFTGetBufSize_C_32sc, (const IppsFFTSpec_C_32sc* pFFTSpec, int *pSize));
IPPFUN(IppStatus, ippsFFTFwd_CToC_32sc_Sfs, (const Ipp32sc *pSrc, Ipp32sc *pDst, IppsFFTSpec_C_32sc *pFFTSpec,
                                             int scaleFactor, Ipp8u* pBuffer));
IPPFUN(IppStatus, ippsFFTFwd_RToCCS_32s_Sfs, (const Ipp32s *pSrc, Ipp32s *pDst, IppsFFTSpec_R_32s *pFFTSpec,
                                              int scaleFactor, Ipp8u* pBuffer));
IPPFUN(IppStatus, ippsFFTFwd_RToCCS_16s32s_Sfs, (const Ipp16s* pSrc, Ipp32s* pDst, const IppsFFTSpec_R_16s32s* pFFTSpec,
                                                 int scaleFactor, Ipp8u* pBuffer));
IPPFUN(IppStatus, ippsFFTInv_CToC_32sc_Sfs, (const Ipp32sc *pSrc, Ipp32sc *pDst, IppsFFTSpec_C_32sc *pFFTSpec,
                                             int scaleFactor, Ipp8u* pBuffer));
IPPFUN(IppStatus, ippsFFTInv_CCSToR_32s_Sfs, (const Ipp32s *pSrc, Ipp32s *pDst, IppsFFTSpec_R_32s *pFFTSpec,
                                              int scaleFactor, Ipp8u* pBuffer));
IPPFUN(IppStatus, ippsFFTInv_CCSToR_32s16s_Sfs, (const Ipp32s* pSrc, Ipp16s* pDst, const IppsFFTSpec_R_16s32s* pFFTSpec,
                                                 int scaleFactor, Ipp8u* pBuffer));


#endif

