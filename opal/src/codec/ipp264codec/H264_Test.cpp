/*
 *  H264_Test.cpp
 *  BoneLib.4.2
 *
 *  Created by Sergey Bezruchkin on 7/14/11.
 *  Copyright 2011 Dinsk. All rights reserved.
 *
 */

#include "umc_defs.h"

#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_types.h"
#include <ippi.h>
#include "h264_util.h"

#define MAX_LOOP_TRY 1

#ifdef H264_TEST


#define LENGTHOF(a)     (sizeof(a)/sizeof(a[0]))

void H264_Test_ReconstructLumaIntra_16x16MB();


static int g_H264_iTrace = 0;

bool H264_Check(const Ipp16s* pCoeff0, const Ipp16s* pCoeff1, uint nCoeffSize,
                const u8* pImg0, uint nStep0, const u8* pImg1, uint nStep1)
{
    bool bOK = true;

    if (memcmp(pCoeff0, pCoeff1, nCoeffSize) != 0) {
        bOK = false;
        if (g_H264_iTrace)
            PTRACE(0, DINSK_CODEC_LOG, "Error wrong Coeff.");
    }
        
    if (cmp16x16(pImg0, 16, pImg1, 16) > 32) {
        bOK = false;
        if (g_H264_iTrace) {
            DumpDiff16x16(pImg0, 16, pImg1, 16);
            if (g_H264_iTrace >= 2) {
                Dump16x16("Good Good Good Good", pImg0, 16);
                Dump16x16("Bad Bad Bad Bad Bad", pImg1, 16);
            }
        }
    }
    return bOK;       
}


extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R)
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32u                      nStep,
    IppIntra16x16PredMode_H264  intra_luma_mode,
    Ipp32u                      cbp4x4,
    Ipp32u                      QP,
    Ipp8u                       edge_type,
    const Ipp16s*               pQuantTable,
    Ipp8u                       nBypassFlag
)
{
    IppStatus hr;
    
    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    uint    nCoeffSize = 0;
    Ipp16s  Coeff[16*17];
    Ipp16s  Coeff0[16*17];
    Ipp16s  Coeff1[16*17];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (uint nFlags = cbp4x4 & 0x1FFFF; nFlags != 0; nFlags >>= 1)
        if (nFlags & 1)
            nCoeffSize ++;
    
    nCoeffSize *= 16*sizeof(Ipp16s);
    
    memcpy(Coeff, pSrcDstCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);
    
    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
            
        bUseArmCode = false;
        hr = H264_ORIG_FUN(ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,   
            pSrcDstYPlane,
            nStep,     
            intra_luma_mode, 
            cbp4x4,          
            QP,              
            edge_type,       
            pQuantTable,     
            nBypassFlag);
                
        copy16x16(Img0, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff0, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
        
        bUseArmCode = true;
        hr =  H264_IMPL_FUN(ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,
            pSrcDstYPlane,  
            nStep,
            intra_luma_mode,
            cbp4x4,
            QP,
            edge_type,
            pQuantTable,
            nBypassFlag);

        copy16x16(Img1, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff1, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------
    }
    return hr;
}


extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R)
(
    Ipp16s**                            ppSrcCoeff,
    Ipp8u*                              pSrcDstYPlane,
    Ipp32u                              nSrcDstYStep,
    const IppIntra16x16PredMode_H264    intra_luma_mode,
    const Ipp32u                        cbp4x4,
    const Ipp32u                        QP,
    const Ipp8u                         edge_type
)
{
    IppStatus hr;
    
    Ipp16s* pSrcCoeff = *ppSrcCoeff;
    uint    nCoeffSize = 0;
    uint    nStep = nSrcDstYStep;
    Ipp16s  Coeff[16*17];
    Ipp16s  Coeff0[16*17];
    Ipp16s  Coeff1[16*17];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (uint nFlags = cbp4x4 & 0x1FFFF; nFlags != 0; nFlags >>= 1)
        if (nFlags & 1)
            nCoeffSize ++;
    
    nCoeffSize *= 16*sizeof(Ipp16s);
    
    memcpy(Coeff, pSrcCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);
    
    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        *ppSrcCoeff = pSrcCoeff;
        memcpy(pSrcCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
            
        bUseArmCode = false;
        hr = H264_ORIG_FUN(ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R)(
            ppSrcCoeff,   
            pSrcDstYPlane,
            nStep,     
            intra_luma_mode, 
            cbp4x4,          
            QP,              
            edge_type);
                
        copy16x16(Img0, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff0, pSrcCoeff, nCoeffSize);
//-------------------------------------------------------------------------------        
        *ppSrcCoeff = pSrcCoeff;
        memcpy(pSrcCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
        
        bUseArmCode = true;
        hr = H264_IMPL_FUN(ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R)(
            ppSrcCoeff,
            pSrcDstYPlane,  
            nStep,
            intra_luma_mode,
            cbp4x4,
            QP,
            edge_type);

        copy16x16(Img1, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff1, pSrcCoeff, nCoeffSize);
//-------------------------------------------------------------------------------
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------
    }
    return hr;
}


#define H264_STEP   (16*4)

static const Ipp16s s_QuantTable[16] = 
{
    0x0100, 0x0100, 0x0100, 0x0100,
    0x0100, 0x0100, 0x0100, 0x0100,
    0x0100, 0x0100, 0x0100, 0x0100,
    0x0100, 0x0100, 0x0100, 0x0100
};

void H264_Test_ReconstructLumaIntra_16x16MB()
{
    Ipp32u cbp4x4 = 3;
    Ipp8u  edge_type = 0;
    
    Ipp16s  Coeff[16*17];
    u8      Img[16*16*4*3];
    u8*     pPlane = Img + 16*(H264_STEP) + 16;
    
    for (uint QP=1; QP < 0x34; QP += 2)         
    for (int iPredMode = 0; iPredMode  < 4 ; iPredMode++)
    {
        
        for (int iCoeff=0; iCoeff < 32; iCoeff++)
        {
            memset(Img,0,sizeof(Img));
            memset(Coeff, 0, sizeof(Coeff));
            Coeff[iCoeff] = 0x2;
            
            Ipp16s* pSrcDstCoeff = Coeff;
            XippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R(
                &pSrcDstCoeff, 
                pPlane, 
                H264_STEP,
                IppIntra16x16PredMode_H264(iPredMode),
                cbp4x4,
                QP,
                edge_type,
                s_QuantTable,
                0);                                             
        }
    }
}

void H264_Test_ReconstructLumaIntra16x16MB()
{
    Ipp32u cbp4x4 = 3;
    Ipp8u  edge_type = 0;
    
    Ipp16s  Coeff[16*17];
    u8      Img[16*16*4*3];
    u8*     pPlane = Img + 16*(H264_STEP) + 16;

    memset(Coeff, 0, sizeof(Coeff));

    for (int i=0;i<sizeof(Img);i++)
        Img[i] = u8(i);
    
    for (uint QP=0x18; QP <= 0x20; QP += 1)         
    for (int iPredMode = 0; iPredMode  < 4 ; iPredMode++)
    {        
        for (int iCoeff=0; iCoeff < 32; iCoeff++)
        {
            memset(Img,0,sizeof(Img));
            memset(Coeff, 0, sizeof(Coeff));
            for (int iSet=0;iSet<iCoeff;iSet++)
                Coeff[iSet] = 0x05;
            
            Ipp16s* pSrcDstCoeff = Coeff;
            XippiReconstructLumaIntra16x16MB_H264_16s8u_C1R(
                &pSrcDstCoeff, 
                pPlane, 
                H264_STEP,
                IppIntra16x16PredMode_H264(iPredMode),
                cbp4x4,
                QP,
                edge_type);                                             
        }
    }
}

static void H264_Test_ReconstructLumaIntra8x8MB()
{
    
    Ipp16s  Coeff[64*4];
    u8      Img[16*16*4*3];
    Ipp16s  quantTable[16];
    uint    nStep = 16*4,i;
    u8*     pPlane = Img + nStep*16 + 16;
    u8*     pPredPel[33];

    memset(Coeff, 0, sizeof(Coeff));

    for (int i=0;i<sizeof(Img);i++)
        Img[i] = u8(i);

    u8**    pp = pPredPel;
    u8*     p = pPlane - nStep;

    for (i=0;i<16;i++)
        *pp ++ = &p[i];

    p -= 1;

    for (i=0;i<17;i++, p += nStep )
        *pp ++ = p;

    for (int i=0;i<16;i++)
        quantTable[i] = 0x100;

    IppIntra8x8PredMode_H264 mb[16];

    Ipp32u cbp8x8 = 0;
    Ipp32u nEdgeType = 0;
//    for (uint edgeType=0; edgeType < 0x40; edgeType++)
    for (uint m=IPP_8x8_VERT; m <= IPP_8x8_HU; m++) 
    {
        mb[0] = IppIntra8x8PredMode_H264(m);
        mb[1] = IppIntra8x8PredMode_H264(m);
        mb[2] = IppIntra8x8PredMode_H264(m);
        mb[3] = IppIntra8x8PredMode_H264(m);
        for (i=0;i<33;i++) {
         //   TRACE(0," PredPel= " << i);
            for (u8 pel=0x80; pel <= 0x80; pel++) {
                Ipp16s*  pCoeff = Coeff;
                memset(Coeff,0,sizeof(Coeff));
                memset(Img,0,sizeof(Img));
                *pPredPel[i] = pel;
                XippiReconstructLumaIntra8x8MB_H264_16s8u_C1R(&pCoeff, pPlane, nStep, mb, cbp8x8, 0x1c, nEdgeType, quantTable, 0);
            }
        }
    }
}


extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R)
(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      nSrcDstYStep,
    IppIntra8x8PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp8x8,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       bypass_flag
)
{

    IppStatus hr;
    
    Ipp16s* pSrcCoeff = *ppSrcDstCoeff;
    uint    nCoeffSize = 0;
    uint    nStep = nSrcDstYStep;
    Ipp16s* pCoeff = *ppSrcDstCoeff;
    Ipp16s  Coeff[64*4];
    Ipp16s  Coeff0[64*4];
    Ipp16s  Coeff1[64*4];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (int i=0; i<4; i++) 
        if (cbp8x8 & (1<<i))
            nCoeffSize ++;
    
    nCoeffSize *= 8*8*sizeof(Ipp16s);
    
    memset(Coeff, 0, sizeof(Coeff));
    memcpy(Coeff, pSrcCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);

    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        copy16x16(pSrcDstYPlane, nSrcDstYStep, Img0, 16);
        *ppSrcDstCoeff = pCoeff;
        memcpy(pCoeff, Coeff, nCoeffSize);

        hr = H264_ORIG_FUN(ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,
            pSrcDstYPlane,
            nSrcDstYStep,
            pMBIntraTypes,
            cbp8x8,
            QP,
            edgeType,
            pQuantTable,
            bypass_flag);

        memcpy(Coeff0, pCoeff, nCoeffSize);
        copy16x16(Img0, 16, pSrcDstYPlane, nSrcDstYStep );
//-------------------------------------------------------------------------------        
        copy16x16(pSrcDstYPlane, nSrcDstYStep, Img0, 16);
        *ppSrcDstCoeff = pCoeff;
        memcpy(pCoeff, Coeff, nCoeffSize);

        hr = H264_IMPL_FUN(ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R)(
                ppSrcDstCoeff,
                pSrcDstYPlane,
                nSrcDstYStep,
                pMBIntraTypes,
                cbp8x8,
                QP,
                edgeType,
                pQuantTable,
                bypass_flag);

        memcpy(Coeff1, pCoeff, nCoeffSize);
        copy16x16(Img1, 16, pSrcDstYPlane, nSrcDstYStep );
//-------------------------------------------------------------------------------        
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------        
    }
    return hr;
}
//=============================================================================
//=============================================================================
//=============================================================================
extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R)
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
)
{
    IppStatus hr;
    
    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    uint    nStep = srcdstYStep;
    uint    nCoeffSize = 0;
    Ipp16s  Coeff[16*17];
    Ipp16s  Coeff0[16*17];
    Ipp16s  Coeff1[16*17];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (uint nFlags = cbp4x4 & 0x1FFFF; nFlags != 0; nFlags >>= 1)
        if (nFlags & 1)
            nCoeffSize ++;
    
    nCoeffSize *= 16*sizeof(Ipp16s);
    
    memcpy(Coeff, pSrcDstCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);
    
    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
            
        bUseArmCode = false;
        hr = H264_ORIG_FUN(ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,   
            pSrcDstYPlane,
            nStep,     
            pMBIntraTypes, 
            cbp4x4,          
            QP,              
            edgeType,       
            pQuantTable,     
            nBypassFlag);
                

        copy16x16(Img0, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff0, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
        
        bUseArmCode = true;
        hr =  H264_IMPL_FUN(ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,   
            pSrcDstYPlane,
            nStep,     
            pMBIntraTypes, 
            cbp4x4,          
            QP,              
            edgeType,       
            pQuantTable,     
            nBypassFlag);

        copy16x16(Img1, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff1, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------
    }
    return hr;
}

//=============================================================================
//=============================================================================
//=============================================================================
extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaInter4x4MB_H264_16s8u_C1R)
(
    Ipp16s**        ppSrcDstCoeff,
    Ipp8u*          pSrcDstYPlane,
    Ipp32u          srcdstYStep,
    Ipp32u          cbp4x4,
    Ipp32s          QP,
    const Ipp16s*   pQuantTable,
    Ipp8u           nBypassFlag
)
{
    IppStatus hr;
    
    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    uint    nStep = srcdstYStep;
    uint    nCoeffSize = 0;
    Ipp16s  Coeff[16*17];
    Ipp16s  Coeff0[16*17];
    Ipp16s  Coeff1[16*17];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (uint nFlags = cbp4x4 & 0x1FFFF; nFlags != 0; nFlags >>= 1)
        if (nFlags & 1)
            nCoeffSize ++;
    
    nCoeffSize *= 16*sizeof(Ipp16s);
    
    memcpy(Coeff, pSrcDstCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);
    
    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
            
        bUseArmCode = false;
        hr = H264_ORIG_FUN(ippiReconstructLumaInter4x4MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,   
            pSrcDstYPlane,
            nStep,     
            cbp4x4,          
            QP,              
            pQuantTable,     
            nBypassFlag);
                

        copy16x16(Img0, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff0, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
        
        bUseArmCode = true;
        hr =  H264_IMPL_FUN(ippiReconstructLumaInter4x4MB_H264_16s8u_C1R)(
            ppSrcDstCoeff,   
            pSrcDstYPlane,
            nStep,     
            cbp4x4,          
            QP,              
            pQuantTable,     
            nBypassFlag);

        copy16x16(Img1, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff1, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------
    }
    return hr;
}
//=============================================================================
//=============================================================================
//=============================================================================
extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaIntraMB_H264_16s8u_C1R)
(
    Ipp16s**                        ppSrcDstCoeff,
    Ipp8u*                          pSrcDstYPlane,
    Ipp32s                          srcdstYStep,
    const IppIntra4x4PredMode_H264* pMBIntraTypes,
    const Ipp32u                    cbp4x4,
    const Ipp32u                    QP,
    const Ipp8u                     edgeType
)
{
    IppStatus hr;
    
    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    uint    nStep = srcdstYStep;
    uint    nCoeffSize = 0;
    Ipp16s  Coeff[16*17];
    Ipp16s  Coeff0[16*17];
    Ipp16s  Coeff1[16*17];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (uint nFlags = (cbp4x4 & 0x1FFFF)>>1; nFlags != 0; nFlags >>= 1)
        if (nFlags & 1)
            nCoeffSize ++;
    
    nCoeffSize *= 16*sizeof(Ipp16s);
    
    memcpy(Coeff, pSrcDstCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);
    
    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
            
        bUseArmCode = false;
        hr = H264_ORIG_FUN(ippiReconstructLumaIntraMB_H264_16s8u_C1R)(
            ppSrcDstCoeff,
            pSrcDstYPlane,
            srcdstYStep,
            pMBIntraTypes,
            cbp4x4,
            QP,
            edgeType);

        copy16x16(Img0, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff0, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------        
        *ppSrcDstCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
        
        bUseArmCode = true;
        hr =  H264_IMPL_FUN(ippiReconstructLumaIntraMB_H264_16s8u_C1R)(
            ppSrcDstCoeff,
            pSrcDstYPlane,
            srcdstYStep,
            pMBIntraTypes,
            cbp4x4,
            QP,
            edgeType);

        copy16x16(Img1, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff1, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------
    }
    return hr;
}


//=============================================================================
//=============================================================================
//=============================================================================
extern "C" IppStatus __STDCALL H264_TEST_FUN(ippiReconstructLumaInterMB_H264_16s8u_C1R)
(
    Ipp16s**    ppSrcCoeff,
    Ipp8u*      pSrcDstYPlane,
    Ipp32u      srcdstYStep,
    Ipp32u      cbp4x4,
    Ipp32s      QP
)
{
    IppStatus hr;
    
    Ipp16s* pSrcDstCoeff = *ppSrcCoeff;
    uint    nStep = srcdstYStep;
    uint    nCoeffSize = 0;
    Ipp16s  Coeff[16*17];
    Ipp16s  Coeff0[16*17];
    Ipp16s  Coeff1[16*17];
    u8      ImgOrig[16*16];
    u8      Img0[16*16];
    u8      Img1[16*16];
    
    for (uint nFlags = cbp4x4 & 0x1FFFF; nFlags != 0; nFlags >>= 1)
        if (nFlags & 1)
            nCoeffSize ++;
    
    nCoeffSize *= 16*sizeof(Ipp16s);
    
    memcpy(Coeff, pSrcDstCoeff, nCoeffSize);
    copy16x16(ImgOrig, 16, pSrcDstYPlane, nStep);
    
    for (int nLoopTry=0; nLoopTry < MAX_LOOP_TRY; nLoopTry++) 
    {
//-------------------------------------------------------------------------------        
        *ppSrcCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
            
        bUseArmCode = false;
        hr = H264_ORIG_FUN(ippiReconstructLumaInterMB_H264_16s8u_C1R)(
            ppSrcCoeff,   
            pSrcDstYPlane,
            nStep,     
            cbp4x4,          
            QP);

        copy16x16(Img0, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff0, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------        
        *ppSrcCoeff = pSrcDstCoeff;
        memcpy(pSrcDstCoeff, Coeff, nCoeffSize);
        copy16x16( pSrcDstYPlane, nStep, ImgOrig, 16);
        
        bUseArmCode = true;
        hr =  H264_IMPL_FUN(ippiReconstructLumaInterMB_H264_16s8u_C1R)(
            ppSrcCoeff,   
            pSrcDstYPlane,
            nStep,     
            cbp4x4,          
            QP);

        copy16x16(Img1, 16, pSrcDstYPlane, nStep);
        memcpy(Coeff1, pSrcDstCoeff, nCoeffSize);
//-------------------------------------------------------------------------------
        if (H264_Check(Coeff0, Coeff1, nCoeffSize, Img0, 16, Img1, 16 ))
            break;
//-------------------------------------------------------------------------------
    }
    return hr;
}
//=============================================================================
//=============================================================================
//=============================================================================

void H264_Test_ReconstructLumaInterMB()
{
    Ipp32u cbp4x4 = 3;
    Ipp8u  edge_type = 0;
    
    Ipp16s  Coeff[16*17];
    u8      Img[16*16*4*3];
    u8*     pPlane = Img + 16*(H264_STEP) + 16;

    memset(Coeff, 0, sizeof(Coeff));

    
    for (uint QP=0x18; QP <= 0x20; QP += 1)         
    {        
        for (int iCoeff=0; iCoeff < 32; iCoeff++)
        {
            for (int i=0;i<sizeof(Img);i++)
                Img[i] = u8(i);
//            memset(Img,0,sizeof(Img));
            memset(Coeff, 0, sizeof(Coeff));
            for (int iSet=0;iSet<iCoeff;iSet++)
                Coeff[iSet] = 0x05;
            
            Ipp16s* pSrcDstCoeff = Coeff;
            XippiReconstructLumaInterMB_H264_16s8u_C1R(
                &pSrcDstCoeff, 
                pPlane, 
                H264_STEP,
                cbp4x4,
                QP);                                             
        }
    }
}

static Ipp16s* s_pQTab = NULL;

void H264_TestInit()
{
/*
    H264_Test_ReconstructLumaInterMB();
    H264_Test_ReconstructLumaIntra16x16MB();
    H264_Test_ReconstructLumaIntra_16x16MB();
    H264_Test_ReconstructLumaIntra8x8MB();
    if (s_pQTab != NULL)
    {
        FILE* fout = fopen("c:\\tmp\\QuantTab.dat", "w");
        if (fout) {
            for (uint ii=0;ii<52*16;) {
                for (uint jj=0;jj<16;jj++) 
                    fprintf(fout,"0x%4.4x,", s_pQTab[ii++]);
                fprintf(fout,"\n");
            }
            fclose(fout);
        }
        s_pQTab = NULL;
    }
*/
    g_H264_iTrace = 1;
}


class AAA{
public:  
    AAA() { H264_TestInit();}
} aa;
#endif H264_TEST