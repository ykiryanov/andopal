#include "umc_defs.h"

#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_types.h"
#include <ippi.h>
#include "h264_util.h"



///////////////////////////////////////////////////////////////////////////
//  Name:
//      ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R
//
//  Purpose:
//      Reconstruct Intra 16x16 Luma macroblock for high profile
//
//  Parameters:
//      ppSrcCoeff          - pointer to 4x4 block of coefficients, if it's non zero(will be update by function)
//      pSrcDstYPlane       - pointer to current Y plane which will be reconstructed
//      nStep         - plane step
//      intra_luma_mode     - intra mode
//      cbp4x4              - coded block pattern
//      QP                  - quantizer
//      edge_type           - edge type
//      pQuantTable         - pointer to quantization table
//      bypass_flag         - enable lossless coding when qpprime_y is zero
//
//  Returns:
//      ippStsNoErr         No error
//      ippStsNullPtrErr    pSrcDst is NULL
//      ippStsOutOfRangeErr QP is less than 0 or greater than 51
//
//  Notes:
//


void call_1009e340(Ipp16s* pDstCoeff, Ipp16s quantValue, uint qAdd, uint qShiftRight, uint qShiftLeft)
{
    int i;
    Ipp32s mat[16];    
    Ipp16s* p = pDstCoeff;
    Ipp32s* m = mat;
    
    for (i=0;i<4;i++,p+=4, m ++)
    {
        Ipp32s v0 = p[0] + p[1];      
        Ipp32s v1 = p[0] - p[1];   
        Ipp32s v2 = p[2] + p[3];
        Ipp32s v3 = p[2] - p[3];
        
        m[0]  = v0 + v2;
        m[4]  = v0 - v2;
        m[8]  = v1 - v3;
        m[12] = v1 + v3;
    }
    
    
    p = pDstCoeff;
    m = mat;
    
    for (i=0;i<4;i++,p++,m+=4)
    {
        Ipp32s v0 = m[0] + m[1];
        Ipp32s v1 = m[0] - m[1];
        Ipp32s v2 = m[2] + m[3];
        Ipp32s v3 = m[2] - m[3];
        
        p[0]  = (((((v0 + v2)* quantValue) + qAdd)>>qShiftRight)<<qShiftLeft);
        p[4]  = (((((v0 - v2)* quantValue) + qAdd)>>qShiftRight)<<qShiftLeft);
        p[8]  = (((((v1 - v3)* quantValue) + qAdd)>>qShiftRight)<<qShiftLeft);
        p[12] = (((((v1 + v3)* quantValue) + qAdd)>>qShiftRight)<<qShiftLeft);
    }
}




static Ipp16s data_0x10144AC0[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
static unsigned char TabRect4x4OffsetId[16] = {0x00, 0x01, 0x04, 0x05, 0x02, 0x03, 0x06, 0x07, 0x08, 0x09, 0x0c, 0x0d, 0x0a, 0x0b, 0x0e, 0x0f};
/*
static signed   char data_1011EDD8[32] = { 
    4,  0,  -4,  4, 
    4,  0,   4, -4,
    4,  0,  -4,  4,
    4,  0, -12,  4,
    4,  0,  -4,  4,
    4,  0,   4, -4, 
    4,  0,  -4,  4,
    4,  0, -12,  4    
};
*/


IppStatus __STDCALL H264_CODE_FUN(ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R)
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
    Ipp8u*  pYPlane = pSrcDstYPlane;
    Ipp32u  yStep = nStep;

//  nECX = edge_type;                       //  10053FF7:   movzx       ecx,byte ptr [esp+3Ch]
//  nEAX = bypass_flag;                     //              movzx       eax,byte ptr [esp+44h]           eax = bypass_flag;

                                            //  10054001:   mov         edi,ecx
    uint nEDI =  edge_type & 4;                  //  10054003:   and         edi,4

                                            //  10054006:   mov         esi,ecx
    uint nESI = edge_type & 1;                   //  10054008:   and         esi,1
    uint nECX = edge_type & 0x10;                //  1005400B:   and         ecx,10h
  
    bool bByPass = nBypassFlag && !QP;    

    if ((ppSrcDstCoeff == NULL)  ||
        (pSrcDstYPlane == NULL)  ||
        (*ppSrcDstCoeff == NULL) ||                              
        (pQuantTable == NULL) )
    {
        return ippStsNullPtrErr; //0xFFFFFFF8;        //  100542BF:   mov         eax,0FFFFFFF8h
    }
    
    Ipp16s* pGlobalDstCoeff;
    Ipp16s* pDstCoeff = *ppSrcDstCoeff;

    //10054051:   mov         eax,dword ptr [esp+38h]
    //10054055:   cmp         eax,33h
    if (QP > 0x33) 
    {                               
        return ippStsOutOfRangeErr; //0xFFFFFFF5;                 // 10054058:   ja      //  10054294
    }

    uint calcQP = (0x02AAB*QP)>>16;
    uint qAdd, qShiftRight, qShiftLeft;
    
    if (QP < 0x24) {
        qAdd = 1<<(5 - calcQP);
        qShiftRight = 6-calcQP;
        qShiftLeft = 0;
    } else {
        qAdd = 0;
        qShiftRight = 0;
        qShiftLeft = calcQP - 6;
    }
    
    switch (intra_luma_mode)
    {
    case IPP_16X16_VERT: {
        if (edge_type & IPPVC_TOP_EDGE)
            return ippStsLPCCalcErr;

        u32* p = (u32*) (pSrcDstYPlane - nStep);
        register Ipp32s dy = nStep >> 2;
        u32 p0 = p[0];
        u32 p1 = p[1];
        u32 p2 = p[2];
        u32 p3 = p[3];

        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        }
        break;
    case IPP_16X16_HOR: {
        if (edge_type & IPPVC_LEFT_EDGE)
            return ippStsLPCCalcErr;

        Ipp8u* p = pSrcDstYPlane;
        for (int i=0;i<16;i++)  {
            Ipp32u nFillValue = p[-1];
            nFillValue = nFillValue | (nFillValue<<8);
            nFillValue = nFillValue | (nFillValue<<16);
            Ipp32u* pPlane = (Ipp32u*) p;
            pPlane[0] = pPlane[1] = pPlane[2] = pPlane[3] = nFillValue;
            p += nStep;
        }}
        break;
    case IPP_16X16_DC: {
        register Ipp32u  nFillValue = 0;
        register Ipp8u*  p;
        register uint i;

        if  (!(edge_type & IPPVC_TOP_EDGE)) {
            if (!(edge_type & IPPVC_LEFT_EDGE)) {
                p = pSrcDstYPlane-nStep;
                for (i=0;i<16;i++) 
                    nFillValue += p[i];

                p = pSrcDstYPlane-1;
                for (i=0;i<16;i++) {
                    nFillValue += p[0];
                    p += nStep;
                }
                nFillValue = ((nFillValue+16) >> 5);
            } else {
                p = pSrcDstYPlane-nStep;
                for (i=0;i<16;i++) 
                    nFillValue += p[i];

                nFillValue = (nFillValue+8) >> 4;
            }
        } else if (!(edge_type & IPPVC_LEFT_EDGE)) {       
            p = pSrcDstYPlane - 1;
            for (i=0;i<16;i++) {
                nFillValue += p[0];
                p += nStep;
            }
            nFillValue = ((nFillValue+8) >> 4);
        } else
            nFillValue = 0x80;


        if (nFillValue > 255)
            nFillValue = 255;
        nFillValue |= nFillValue << 8;
        nFillValue |= nFillValue << 16;

        register Ipp32u* pYPlane = (Ipp32u*) pSrcDstYPlane;
        register Ipp32s dy = nStep >> 2;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue; 
        } 
        break;
    case IPP_16X16_PLANE: {
        if (edge_type & (IPPVC_LEFT_EDGE | IPPVC_TOP_EDGE | IPPVC_TOP_LEFT_EDGE))
            return ippStsLPCCalcErr;          

        int ih = 0;
        int iv = 0;
        u8* p = pSrcDstYPlane - nStep - 1;
        u8* pLeftUp  = p + nStep*8 - nStep;
        u8* pLeftDown = pLeftUp + nStep*2 ;

        for (int i=1;i<=8;i++)
        {
            ih += i*(p[8+i] - p[8-i]);
            iv += i*(*pLeftDown -*pLeftUp);
            pLeftUp -= nStep;
            pLeftDown += nStep;
        }

        int ib = ((ih<<2) + ih + 32)>>6;
        int ic = ((iv<<2) + iv + 32)>>6;

        int iaa= 16*( p[16]+ pLeftDown[-nStep]);
        p = pSrcDstYPlane;

        for (int j=0;j<16;j++, p += nStep)
        {
            for (int i=0;i<16;i++)
            {
                int pel = (iaa+(i-7)*ib +(j-7)*ic + 16)>>5;
                if (pel > 255)
                    pel = 255;
                else if (pel < 0)
                    pel = 0;
                p[i] = pel;
            }
        }
        } break;
    default:
        return ippStsOutOfRangeErr;
    }

    if ((cbp4x4 & 0x1FFFF) == 0)
        return ippStsNoErr;
    
    if (cbp4x4 & 1)                     //  1005410C:   je      //  1005416C
    {
        pGlobalDstCoeff = pDstCoeff;        
        if (!bByPass) 
        {
            if (QP < 0x24) 
            {
                qAdd = 1 << (5 - calcQP); // 1<<1 => 2
                qShiftRight = 6-calcQP;    // 6-4 => 2                                  
                qShiftLeft = 0;
            } else {
                qAdd = 0;
                qShiftRight = 0;
                qShiftLeft = calcQP - 6;
            }
            call_1009e340(pGlobalDstCoeff, *pQuantTable, qAdd, qShiftRight, qShiftLeft);   
        }
        
        pDstCoeff += 16;
    } 
    else 
        pGlobalDstCoeff = data_0x10144AC0;        
                                                
    if (QP < 0x18) 
    {
        qAdd = 1 << (3-calcQP);
        qShiftRight = 4 - calcQP;
        qShiftLeft = 0;
    } 
    else 
    {                            
        qShiftLeft = calcQP-4;
        qShiftRight = 0;
        qAdd = 0;
    }

    if (bByPass) 
    {
        dbAssert(0);
#if 0        
//        eax = QP;       
        //  10054179:   cmp         eax,18h
        //  1005417C:   jae     //  10054195
        
        if (cbp4x4 & 2)
        {
            pDstCoeff = *ppSrcDstCoeff;             //  100541AF:   mov         edi,dword ptr [esp+24h]
            *ppSrcDstCoeff = pDstCoeff + 16;        //  100541B3:   mov         edx,dword ptr [edi]         
        } 
        else 
            pDstCoeff = NULL;            //  100541BC:   xor         edx,edx

        //  100541BE:   movzx       edi,byte ptr [ebp+1011EDC8h]
        nECX = uint(pGlobalDstCoeff); //  100541C5:   mov         ecx,dword ptr [esp+0Ch]
        //  100541C9:   lea         ecx,[ecx+edi*2]
        //  100541CC:   push        eax
        //  100541CD:   mov         eax,dword ptr [esp+30h]
        //  100541D1:   push        eax
        //  100541D2:   push        eax
        //  100541D3:   push        ebx
        //  100541D4:   push        ecx
        //  100541D5:   push        edx
        //  100541D6:   push        ebx
        //  100541D7:   call    //  1009A6C0
        //  100541DC:   add         esp,1Ch
        //  100541DF:   movsx       eax,byte ptr [ebp*2+1011EDD8h]            
        //  100541E7:   movsx       edx,byte ptr [ebp*2+1011EDD9h]            
        //  100541EF:   imul        edx,dword ptr [esp+2Ch]
        //  100541F4:   add         ebx,eax
        //  100541F6:   add         esi,esi
        //  100541F8:   add         ebx,edx
        //  100541FA:   add         ebp,1
        //  100541FD:   cmp         ebp,10h
        //  10054200:   jb      //  100541A7
        //  10054202:   jmp     //  10054288
        Ipp8s* pTabOff = h264Tab4x4offset;
        for (uint i=0;i<16;i++)
        {            
            Ipp16s* pGCoeff = pGlobalDstCoeff + data_1011EDC8[i];
            if (cbp4x4 & (2<<i)) 
            {
                H264_Trans4x4(pYPlane, pDstCoeff, pQuantTable, pGCoeff, yStep, qAdd, qShiftRight, qShiftLeft);
                pDstCoeff += 16;
            } else 
                H264_Add_4x4(pYPlane, yStep, *pGCoeff);

            pYPlane += pTabOff[0] + pTabOff[1]*yStep;
            pTabOff += 2;
        }
#endif        
    } 
    else 
    {
        Ipp8s* pTabOff = h264Tab4x4offset;
        for (uint i=0;i<16;i++)
        {            
            Ipp16s* pGCoeff = pGlobalDstCoeff + TabRect4x4OffsetId[i];
            if (cbp4x4 & (2<<i)) 
            {
                H264_Trans4x4(pYPlane, pDstCoeff, pQuantTable, pGCoeff, yStep, qAdd, qShiftRight, qShiftLeft);
                pDstCoeff += 16;
            } else 
                H264_Add_4x4(pYPlane, yStep, *pGCoeff);
                            
            pYPlane += pTabOff[0] + pTabOff[1]*yStep;
            pTabOff += 2;
        }
    }
    
    *ppSrcDstCoeff =  pDstCoeff;
    return ippStsNoErr;
}



/* ///////////////////////////////////////////////////////////////////////////
//  Name:
//      ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R
//
//  Purpose:
//      Reconstruct Intra 16x16 Luma macroblock
//
//  Parameters:
//      ppSrcCoeff          - pointer to 4x4 block of coefficients, if it's non zero(will be update by function)
//      pSrcDstYPlane       - pointer to current Y plane which will be reconstructed
//      srcdstYStep         - plane step
//      intra_luma_mode     - intra mode
//      cbp4x4              - coded block pattern
//      QP                  - quantizer
//      edge_type           - edge type
//
//  Returns:
//      ippStsNoErr         No error
//      ippStsNullPtrErr    pSrcDst is NULL
//      ippStsOutOfRangeErr QP is less than 0 or greater than 51
//
//  Notes:
//      H.264 standard: JVT-G050. ITU-T Recommendation and
//      Final Draft International Standard of Joint Video Specification
//      (ITU-T Rec. H.264 | ISO/IEC 14496-10 AVC) March, 2003.
*/

Ipp16s g_GlobalCoeff0[16] = {0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0};

Ipp16s g_TabQP[] = {
 0x000a, 0x0000, 0x000b, 0x0000, 0x000d, 0x0000, 0x000e, 0x0000,  
 0x0010, 0x0000, 0x0012, 0x0000, 0x000a, 0x0000, 0x000b, 0x0000,  
 0x000d, 0x0000, 0x000e, 0x0000, 0x0010, 0x0000, 0x0012, 0x0000,  
 0x000a, 0x0000, 0x000b, 0x0000, 0x000d, 0x0000, 0x000e, 0x0000,  
 0x0010, 0x0000, 0x0012, 0x0000, 0x0014, 0x0000, 0x0016, 0x0000,  
 0x001a, 0x0000, 0x001c, 0x0000, 0x0020, 0x0000, 0x0024, 0x0000,  
 0x0028, 0x0000, 0x002c, 0x0000, 0x0034, 0x0000, 0x0038, 0x0000,  
 0x0040, 0x0000, 0x0048, 0x0000, 0x0050, 0x0000, 0x0058, 0x0000,  
 0x0068, 0x0000, 0x0070, 0x0000, 0x0080, 0x0000, 0x0090, 0x0000,  
 0x00a0, 0x0000, 0x00b0, 0x0000, 0x00d0, 0x0000, 0x00e0, 0x0000,  
 0x0100, 0x0000, 0x0120, 0x0000, 0x0140, 0x0000, 0x0160, 0x0000,  
 0x01a0, 0x0000, 0x01c0, 0x0000, 0x0200, 0x0000, 0x0240, 0x0000,  
 0x0280, 0x0000, 0x02c0, 0x0000, 0x0340, 0x0000, 0x0380, 0x0000,  
 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,  
 0x0001, 0x000d, 0x000a, 0x000d, 0x000d, 0x0010, 0x000d, 0x0010,  
 0x000a, 0x000d, 0x000a, 0x000d, 0x000d, 0x0010, 0x000d, 0x0010,  
 0x0001, 0x000e, 0x000b, 0x000e, 0x000e, 0x0012, 0x000e, 0x0012,  
 0x000b, 0x000e, 0x000b, 0x000e, 0x000e, 0x0012, 0x000e, 0x0012,  
 0x0001, 0x0010, 0x000d, 0x0010, 0x0010, 0x0014, 0x0010, 0x0014,  
 0x000d, 0x0010, 0x000d, 0x0010, 0x0010, 0x0014, 0x0010, 0x0014,  
 0x0001, 0x0012, 0x000e, 0x0012, 0x0012, 0x0017, 0x0012, 0x0017,  
 0x000e, 0x0012, 0x000e, 0x0012, 0x0012, 0x0017, 0x0012, 0x0017,  
 0x0001, 0x0014, 0x0010, 0x0014, 0x0014, 0x0019, 0x0014, 0x0019,  
 0x0010, 0x0014, 0x0010, 0x0014, 0x0014, 0x0019, 0x0014, 0x0019,  
 0x0001, 0x0017, 0x0012, 0x0017, 0x0017, 0x001d, 0x0017, 0x001d,  
 0x0012, 0x0017, 0x0012, 0x0017, 0x0017, 0x001d, 0x0017, 0x001d,  
 0x0001, 0x001a, 0x0014, 0x001a, 0x001a, 0x0020, 0x001a, 0x0020,  
 0x0014, 0x001a, 0x0014, 0x001a, 0x001a, 0x0020, 0x001a, 0x0020,  
 0x0001, 0x001c, 0x0016, 0x001c, 0x001c, 0x0024, 0x001c, 0x0024,  
 0x0016, 0x001c, 0x0016, 0x001c, 0x001c, 0x0024, 0x001c, 0x0024,  
 0x0001, 0x0020, 0x001a, 0x0020, 0x0020, 0x0028, 0x0020, 0x0028,  
 0x001a, 0x0020, 0x001a, 0x0020, 0x0020, 0x0028, 0x0020, 0x0028,  
 0x0001, 0x0024, 0x001c, 0x0024, 0x0024, 0x002e, 0x0024, 0x002e,  
 0x001c, 0x0024, 0x001c, 0x0024, 0x0024, 0x002e, 0x0024, 0x002e,  
 0x0001, 0x0028, 0x0020, 0x0028, 0x0028, 0x0032, 0x0028, 0x0032,  
 0x0020, 0x0028, 0x0020, 0x0028, 0x0028, 0x0032, 0x0028, 0x0032,  
 0x0001, 0x002e, 0x0024, 0x002e, 0x002e, 0x003a, 0x002e, 0x003a,  
 0x0024, 0x002e, 0x0024, 0x002e, 0x002e, 0x003a, 0x002e, 0x003a,  };

void sub_1009D490(Ipp16s* pDstCoeff, uint quantValue, uint qShiftRight)
{
    int i;
    Ipp16s mat[16];    
    Ipp16s* p = pDstCoeff;
    Ipp16s* m = mat;
    
    for (i=0;i<4;i++,p+=4, m ++)
    {
        Ipp32s v0 = p[0] + p[1];      
        Ipp32s v1 = p[0] - p[1];   
        Ipp32s v2 = p[2] + p[3];
        Ipp32s v3 = p[2] - p[3];
        
        m[0]  = v0 + v2;
        m[4]  = v0 - v2;
        m[8]  = v1 - v3;
        m[12] = v1 + v3;
    }
    
    
    p = pDstCoeff;
    m = mat;
    
    for (i=0;i<4;i++,p++,m+=4)
    {
        Ipp32s v0 = m[0] + m[1];
        Ipp32s v1 = m[0] - m[1];
        Ipp32s v2 = m[2] + m[3];
        Ipp32s v3 = m[2] - m[3];
        
        p[0]  = ((((v0 + v2)* quantValue) + qShiftRight)>>qShiftRight);
        p[4]  = ((((v0 - v2)* quantValue) + qShiftRight)>>qShiftRight);
        p[8]  = ((((v1 - v3)* quantValue) + qShiftRight)>>qShiftRight);
        p[12] = ((((v1 + v3)* quantValue) + qShiftRight)>>qShiftRight);
    }
}



IppStatus __STDCALL H264_CODE_FUN(ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R)
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
    if ( !ppSrcCoeff || !pSrcDstYPlane || !*ppSrcCoeff )
        return ippStsNullPtrErr;

    if (QP > 51 )
        return ippStsOutOfRangeErr; 

    uint nStep = nSrcDstYStep;

    switch (intra_luma_mode) {
    case IPP_16X16_VERT: {
        if (edge_type & IPPVC_TOP_EDGE)
            return ippStsLPCCalcErr;

        u32* p = (u32*) (pSrcDstYPlane - nStep);
        register Ipp32s dy = nStep >> 2;
        u32 p0 = p[0];
        u32 p1 = p[1];
        u32 p2 = p[2];
        u32 p3 = p[3];

        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        p += dy;  p[0] = p0; p[1] = p1; p[2] = p2; p[3] = p3;
        }
        break;
    case IPP_16X16_HOR: {
        if (edge_type & IPPVC_LEFT_EDGE)
            return ippStsLPCCalcErr;

        Ipp8u* p = pSrcDstYPlane;
        for (int i=0;i<16;i++)  {
            Ipp32u nFillValue = p[-1];
            nFillValue = nFillValue | (nFillValue<<8);
            nFillValue = nFillValue | (nFillValue<<16);
            Ipp32u* pPlane = (Ipp32u*) p;
            pPlane[0] = pPlane[1] = pPlane[2] = pPlane[3] = nFillValue;
            p += nStep;
        }}
        break;
    case IPP_16X16_DC: {
        register Ipp32u  nFillValue = 0;
        register Ipp8u*  p;
        register uint i;

        if  (!(edge_type & IPPVC_TOP_EDGE)) {
            if (!(edge_type & IPPVC_LEFT_EDGE)) {
                p = pSrcDstYPlane-nStep;
                for (i=0;i<16;i++) 
                    nFillValue += p[i];

                p = pSrcDstYPlane-1;
                for (i=0;i<16;i++) {
                    nFillValue += p[0];
                    p += nStep;
                }
                nFillValue = ((nFillValue+16) >> 5);
            } else {
                p = pSrcDstYPlane-nStep;
                for (i=0;i<16;i++) 
                    nFillValue += p[i];

                nFillValue = (nFillValue+8) >> 4;
            }
        } else if (!(edge_type & IPPVC_LEFT_EDGE)) {       
            p = pSrcDstYPlane - 1;
            for (i=0;i<16;i++) {
                nFillValue += p[0];
                p += nStep;
            }
            nFillValue = ((nFillValue+8) >> 4);
        } else
            nFillValue = 0x80;


        if (nFillValue > 255)
            nFillValue = 255;
        nFillValue |= nFillValue << 8;
        nFillValue |= nFillValue << 16;

        register Ipp32u* pYPlane = (Ipp32u*) pSrcDstYPlane;
        register Ipp32s dy = nStep >> 2;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue;     pYPlane += dy;
        pYPlane[0] = pYPlane[1] = pYPlane[2] = pYPlane[3] = nFillValue; 
        } 
        break;
    case IPP_16X16_PLANE: {
        if (edge_type & (IPPVC_LEFT_EDGE | IPPVC_TOP_EDGE | IPPVC_TOP_LEFT_EDGE))
            return ippStsLPCCalcErr;          

        int ih = 0;
        int iv = 0;
        u8* p = pSrcDstYPlane - nStep - 1;
        u8* pLeftUp  = p + nStep*8 - nStep;
        u8* pLeftDown = pLeftUp + nStep*2 ;

        for (int i=1;i<=8;i++)
        {
            ih += i*(p[8+i] - p[8-i]);
            iv += i*(*pLeftDown -*pLeftUp);
            pLeftUp -= nStep;
            pLeftDown += nStep;
        }

        int ib = ((ih<<2) + ih + 32)>>6;
        int ic = ((iv<<2) + iv + 32)>>6;

        int iaa= 16*( p[16]+ pLeftDown[-nStep]);
        p = pSrcDstYPlane;

        for (int j=0;j<16;j++, p += nStep)
        {
            for (int i=0;i<16;i++)
            {
                int pel = (iaa+(i-7)*ib +(j-7)*ic + 16)>>5;
                if (pel > 255)
                    pel = 255;
                else if (pel < 0)
                    pel = 0;
                p[i] = pel;
            }
        }
        } break;
    default:
        return ippStsOutOfRangeErr;
    }

    if ((cbp4x4 &0x1FFFF )==0)
        return ippStsNoErr;

    Ipp16s* pSrcCoeff = *ppSrcCoeff;
    Ipp16s* pGlobalCoeff;

    if (cbp4x4 & 1 )
    {
        pGlobalCoeff = pSrcCoeff;        
        uint  quantValue = g_TabQP[2 * QP];
        uint  qShiftRight;
        if (QP >= 6)
            qShiftRight = QP < 0xC;
        else
            qShiftRight = 2;

        sub_1009D490(pSrcCoeff, quantValue, qShiftRight);
        pSrcCoeff += 16;
    }
    else 
        pGlobalCoeff   = g_GlobalCoeff0;        

    Ipp8s* pTabOff = h264Tab4x4offset;
    u8* pYPlane = pSrcDstYPlane;
    const Ipp16s* pQuantTable = g_QuantTable + QP*16;

 
    for (uint i=0;i<16;i++) 
    {            
        Ipp16s* pGCoeff = pGlobalCoeff + TabRect4x4OffsetId[i];
        if (cbp4x4 & (2<<i)) 
        {
            H264_Trans4x4(pSrcCoeff, pQuantTable, pYPlane, nStep, pGCoeff);
            pSrcCoeff += 16;
        } else 
            H264_Add_4x4(pYPlane, nStep, *pGCoeff);
                        
        pYPlane += pTabOff[0] + pTabOff[1]*nStep;
        pTabOff += 2;
        pGCoeff ++;
    }

    
    *ppSrcCoeff =  pSrcCoeff;
    return ippStsNoErr;
}

