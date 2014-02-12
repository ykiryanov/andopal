#pragma once
#ifndef __h264_util_h
#define __h264_util_h

// #define H264_TEST
// #define H264_ARM_CODE

#ifdef WIN32
#define H264_C_CODE
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED
#include "TargetConditionals.h"

#if !TARGET_IPHONE_SIMULATOR
#define H264_ARM_CODE
#else
#define H264_C_CODE
#endif

#endif // P_IOS

#include "CodecUtil.h"


typedef unsigned int uint;
typedef unsigned char u8;
typedef unsigned long u32;

extern signed char h264Tab4x4offset[32];
extern const Ipp16s g_QuantTable[52*16];


extern  IppStatus __STDCALL XippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32u                      nStep,
    IppIntra16x16PredMode_H264  intra_luma_mode,
    Ipp32u                      cbp4x4,
    Ipp32u                      QP,
    Ipp8u                       edge_type,
    const Ipp16s*               pQuantTable,
    Ipp8u                       nBypassFlag
);

extern "C" IppStatus __STDCALL XippiReconstructLumaIntra16x16MB_H264_16s8u_C1R
(
    Ipp16s**                            ppSrcCoeff,
    Ipp8u*                              pSrcDstYPlane,
    Ipp32u                              nSrcDstYStep,
    const IppIntra16x16PredMode_H264    intra_luma_mode,
    const Ipp32u                        cbp4x4,
    const Ipp32u                        QP,
    const Ipp8u                         edge_type
);

extern "C" IppStatus __STDCALL XippiReconstructLumaIntra8x8MB_H264_16s8u_C1R
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      srcdstYStep,
    IppIntra8x8PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp8x8,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       bypass_flag
);

extern "C" IppStatus __STDCALL XippiReconstructLumaInter8x8MB_H264_16s8u_C1R
(
    Ipp16s**        ppSrcDstCoeff,
    Ipp8u*          pSrcDstYPlane,
    Ipp32u          srcdstYStep,
    Ipp32u          cbp8x8,
    Ipp32s          QP,
    const Ipp16s*   pQuantTable,
    Ipp8u           bypass_flag
);


extern "C" IppStatus __STDCALL XippiReconstructLumaIntra4x4MB_H264_16s8u_C1R
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      srcdstYStep,
    IppIntra4x4PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp4x4,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       nBypassFlag
);

extern "C" IppStatus __STDCALL XippiReconstructLumaInter4x4MB_H264_16s8u_C1R
(
    Ipp16s**        ppSrcDstCoeff,
    Ipp8u*          pSrcDstYPlane,
    Ipp32u          srcdstYStep,
    Ipp32u          cbp4x4,
    Ipp32s          QP,
    const Ipp16s*   pQuantTable,
    Ipp8u           nBypassFlag
);

extern "C" IppStatus __STDCALL XippiReconstructLumaInterMB_H264_16s8u_C1R
(
    Ipp16s**    ppSrcCoeff,
    Ipp8u*      pSrcDstYPlane,
    Ipp32u      srcdstYStep,
    Ipp32u      cbp4x4,
    Ipp32s      QP
);


extern "C" IppStatus __STDCALL XippiReconstructLumaIntraMB_H264_16s8u_C1R
(
    Ipp16s**                        ppSrcCoeff,
    Ipp8u*                          pSrcDstYPlane,
    Ipp32s                          srcdstYStep,
    const IppIntra4x4PredMode_H264* pMBIntraTypes,
    const Ipp32u                    cbp4x4,
    const Ipp32u                    QP,
    const Ipp8u                     edgeType
);


#ifndef H264_TEST

#define H264_TEST_FUN(funName)      A##funName
#define H264_CODE_FUN(funName)      X##funName 

#else //H264_TEST

#ifdef H264_ARM_CODE
#define H264_TEST_FUN(funName)      X##funName
#define H264_CODE_FUN(funName)      C##funName 
#define H264_ORIG_FUN(funName)      C##funName
#define H264_IMPL_FUN(funName)      C##funName
#else
#define H264_C_CODE
#define H264_TEST_FUN(funName)      X##funName
#define H264_CODE_FUN(funName)      C##funName 
#define H264_ORIG_FUN(funName)      funName
#define H264_IMPL_FUN(funName)      C##funName
#endif

extern IppStatus __STDCALL CippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32u                      nStep,
    IppIntra16x16PredMode_H264  intra_luma_mode,
    Ipp32u                      cbp4x4,
    Ipp32u                      QP,
    Ipp8u                       edge_type,
    const Ipp16s*               pQuantTable,
    Ipp8u                       nBypassFlag);


extern "C" IppStatus __STDCALL CippiReconstructLumaIntra16x16MB_H264_16s8u_C1R
(
    Ipp16s**                            ppSrcCoeff,
    Ipp8u*                              pSrcDstYPlane,
    Ipp32u                              nSrcDstYStep,
    const IppIntra16x16PredMode_H264    intra_luma_mode,
    const Ipp32u                        cbp4x4,
    const Ipp32u                        QP,
    const Ipp8u                         edge_type
);

extern "C" IppStatus __STDCALL ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R
(
    Ipp16s**                            ppSrcCoeff,
    Ipp8u*                              pSrcDstYPlane,
    Ipp32u                              nSrcDstYStep,
    const IppIntra16x16PredMode_H264    intra_luma_mode,
    const Ipp32u                        cbp4x4,
    const Ipp32u                        QP,
    const Ipp8u                         edge_type
);


extern "C" IppStatus __STDCALL ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      srcdstYStep,
    IppIntra8x8PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp8x8,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       bypass_flag
);

extern "C" IppStatus __STDCALL ippiReconstructLumaIntraMB_H264_16s8u_C1R
(
    Ipp16s**                        ppSrcCoeff,
    Ipp8u*                          pSrcDstYPlane,
    Ipp32s                          srcdstYStep,
    const IppIntra4x4PredMode_H264* pMBIntraTypes,
    const Ipp32u                    cbp4x4,
    const Ipp32u                    QP,
    const Ipp8u                     edgeType
);

extern "C" IppStatus __STDCALL CippiReconstructLumaIntraMB_H264_16s8u_C1R
(
    Ipp16s**                        ppSrcCoeff,
    Ipp8u*                          pSrcDstYPlane,
    Ipp32s                          srcdstYStep,
    const IppIntra4x4PredMode_H264* pMBIntraTypes,
    const Ipp32u                    cbp4x4,
    const Ipp32u                    QP,
    const Ipp8u                     edgeType
);

extern "C" IppStatus __STDCALL CippiReconstructLumaIntra8x8MB_H264_16s8u_C1R
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      srcdstYStep,
    IppIntra8x8PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp8x8,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       bypass_flag
);

extern "C" IppStatus __STDCALL CippiReconstructLumaIntra4x4MB_H264_16s8u_C1R
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      srcdstYStep,
    IppIntra4x4PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp4x4,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       nBypassFlag
);

extern "C" IppStatus __STDCALL CippiReconstructLumaInter4x4MB_H264_16s8u_C1R
(
    Ipp16s**        ppSrcDstCoeff,
    Ipp8u*          pSrcDstYPlane,
    Ipp32u          srcdstYStep,
    Ipp32u          cbp4x4,
    Ipp32s          QP,
    const Ipp16s*   pQuantTable,
    Ipp8u           nBypassFlag
);

extern "C" IppStatus __STDCALL CippiReconstructLumaInterMB_H264_16s8u_C1R
(
    Ipp16s**    ppSrcCoeff,
    Ipp8u*      pSrcDstYPlane,
    Ipp32u      srcdstYStep,
    Ipp32u      cbp4x4,
    Ipp32s      QP
);

extern "C" IppStatus __STDCALL ippiReconstructLumaInter4x4MB_H264_16s8u_C1R
(
 Ipp16s**        ppSrcDstCoeff,
 Ipp8u*          pSrcDstYPlane,
 Ipp32u          srcdstYStep,
 Ipp32u          cbp4x4,
 Ipp32s          QP,
 const Ipp16s*   pQuantTable,
 Ipp8u           nBypassFlag
 );

extern "C" IppStatus __STDCALL ippiReconstructLumaInterMB_H264_16s8u_C1R
(
    Ipp16s**    ppSrcCoeff,
    Ipp8u*      pSrcDstYPlane,
    Ipp32u      srcdstYStep,
    Ipp32u      cbp4x4,
    Ipp32s      QP
);


#endif //H264_TEST



#ifdef H264_C_CODE
void c_H264_Add_4x4(u8* pPlane, u32 nStep, int iVal);
void c_H264_Trans4x4(Ipp8u* pYPlane, Ipp16s* pCoeff, const Ipp16s* pQuantTable, const Ipp16s* pGlobalCoeff, uint nYStep, uint qAdd, uint qShiftRight, uint qShiftLeft);
void c_H264_Trans4x4(const Ipp16s* pCoeff, const Ipp16s* pQuantTable, Ipp8u* pYPlane, uint nStep, const Ipp16s* pGCoeff);
#endif //H264_C_CODE


#ifdef H264_ARM_CODE
extern "C" void arm_H264_Add_4x4(u8* pPlane, u32 nStep, int iVal);
extern "C" void arm_H264_Trans4x4(Ipp8u* pYPlane, Ipp16s* pCoeff, const Ipp16s* pQuantTable, const Ipp16s* pGlobalCoeff, uint nYStep, uint qAdd, uint qShiftRight, uint qShiftLeft);
extern "C" void arm_H264_Trans4x4_1(const Ipp16s* pCoeff, const Ipp16s* pQuantTable, Ipp8u* pYPlane, uint nStep, const Ipp16s* pGCoeff);
#endif //H264_C_CODE


extern bool bUseArmCode;

#if defined(H264_C_CODE) && defined(H264_ARM_CODE)

inline void H264_Add_4x4(u8* pPlane, u32 nStep, int iVal)
{
    if (bUseArmCode)
        arm_H264_Add_4x4(pPlane, nStep, iVal);/
    else
        c_H264_Add_4x4(pPlane, nStep, iVal);
}

inline void H264_Trans4x4(Ipp8u* pYPlane, Ipp16s* pCoeff, const Ipp16s* pQuantTable, const Ipp16s* pGlobalCoeff, uint nYStep, uint qAdd, uint qShiftRight, uint qShiftLeft)
{
    if (bUseArmCode)
        arm_H264_Trans4x4(pYPlane, pCoeff, pQuantTable, pGlobalCoeff, nYStep, qAdd, qShiftRight, qShiftLeft);
    else 
        c_H264_Trans4x4(pYPlane, pCoeff, pQuantTable, pGlobalCoeff, nYStep, qAdd, qShiftRight, qShiftLeft);
}

inline void H264_Trans4x4(const Ipp16s* pCoeff, const Ipp16s* pQuantTable, Ipp8u* pYPlane, uint nStep, const Ipp16s* pGCoeff)
{
    if (bUseArmCode)
        arm_H264_Trans4x4_1(pCoeff, pQuantTable, pYPlane, nStep, pGCoeff);
    else 
        c_H264_Trans4x4(pCoeff, pQuantTable, pYPlane, nStep, pGCoeff);
}

#elif defined(H264_ARM_CODE)

inline void H264_Add_4x4(u8* pPlane, u32 nStep, int iVal)
{
    arm_H264_Add_4x4(pPlane, nStep, iVal);
}

inline void H264_Trans4x4(Ipp8u* pYPlane, Ipp16s* pCoeff, const Ipp16s* pQuantTable, const Ipp16s* pGlobalCoeff, uint nYStep, uint qAdd, uint qShiftRight, uint qShiftLeft)
{
    arm_H264_Trans4x4(pYPlane, pCoeff, pQuantTable, pGlobalCoeff, nYStep, qAdd, qShiftRight, qShiftLeft);
}

inline void H264_Trans4x4(const Ipp16s* pCoeff, const Ipp16s* pQuantTable, Ipp8u* pYPlane, uint nStep, const Ipp16s* pGCoeff)
{
    arm_H264_Trans4x4_1(pCoeff, pQuantTable, pYPlane, nStep, pGCoeff);
}

#elif defined(H264_C_CODE)

// NOTE: Next three functions crash if compiler supports THUMB
// Remove THUMB support by adding -mno-thumb option to "Other C Flags" in compiler

inline void H264_Add_4x4(u8* pPlane, u32 nStep, int iVal)
{
    c_H264_Add_4x4(pPlane, nStep, iVal);
}

inline void H264_Trans4x4(Ipp8u* pYPlane, Ipp16s* pCoeff, const Ipp16s* pQuantTable, const Ipp16s* pGlobalCoeff, uint nYStep, uint qAdd, uint qShiftRight, uint qShiftLeft)
{
    c_H264_Trans4x4(pYPlane, pCoeff, pQuantTable, pGlobalCoeff ,nYStep, qAdd, qShiftRight, qShiftLeft);
}

inline void H264_Trans4x4(const Ipp16s* pCoeff, const Ipp16s* pQuantTable, Ipp8u* pYPlane, uint nStep, const Ipp16s* pGCoeff)
{
    c_H264_Trans4x4(pCoeff, pQuantTable, pYPlane, nStep, pGCoeff);
}

#endif //defined(H264_C_CODE) 
#endif //__h264_util_h
