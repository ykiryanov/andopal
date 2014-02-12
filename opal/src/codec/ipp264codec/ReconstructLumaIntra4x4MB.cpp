#include "umc_defs.h"

#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_types.h"
#include <ippi.h>

#include "h264_util.h"

#define BLOCK_UP        (0x01)
#define BLOCK_LEFT      (0x02)
#define BLOCK_UP_LEFT   (0x20)
#define BLOCK_UP_RIGHT  (0x40)


extern "C" IppStatus __STDCALL H264_CODE_FUN(ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R)
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
    IppIntra4x4PredMode_H264*   pMBTypes = pMBIntraTypes; 

    static int info[16] = { 0 };

    bool bByPass = nBypassFlag && !QP;
    

    uint nStep  = srcdstYStep;
    uint nStep4 = nStep << 2;
    uint nStep3 = nStep4 - nStep;
    uint nStep11 = nStep4 - 4;

    if ((ppSrcDstCoeff==0) || (pSrcDstYPlane==NULL) || (*ppSrcDstCoeff==NULL) || (pQuantTable==NULL))
        return ippStsNullPtrErr;  

    if (QP > 0x33) 
        return ippStsOutOfRangeErr; //0xFFFFFFF5;

    uint calcQP = (0x02AAB*QP)>>16;
    uint qAdd;
    uint qShiftRight;
    uint qShiftLeft;
    
    if (QP < 0x18) {
        qAdd = 1<<(3 - calcQP);
        qShiftRight = 4-calcQP;
        qShiftLeft = 0;
    } else {
        qAdd = 0;
        qShiftRight = 0;
        qShiftLeft = calcQP - 4;
    }
    
    u8 nFlagTop       = ((edgeType & IPPVC_TOP_EDGE)  == 0) ? (BLOCK_UP| BLOCK_UP_LEFT | BLOCK_UP_RIGHT) : 0;   // 0x61
    u8 nFlagLeft      = ((edgeType & IPPVC_LEFT_EDGE) == 0) ? (BLOCK_LEFT | BLOCK_UP_LEFT) : 0;              // 0x22

    Ipp16s*  pSrcDstCoeff = *ppSrcDstCoeff;
    u8       nFlags;
    u8*      pPlane;

    for (uint i=0; i<16; i++) {
        switch (i) {
        case 0:     pPlane = pSrcDstYPlane;
            nFlags = nFlagLeft | nFlagTop;
            if (edgeType & IPPVC_TOP_LEFT_EDGE)
                nFlags &= ~ BLOCK_UP_LEFT;
            
            nFlagLeft |= BLOCK_UP | BLOCK_UP_RIGHT;     // (0x22) | 0x41   BLOCK_UP | BLOCK_UP_RIGHT
            nFlagTop  |= BLOCK_LEFT;                    // (0x61) | 0x02   BLOCK_LEFT

            break;
        case 1:     pPlane += 4;                            nFlags = nFlagTop;     break;
        case 2:     pPlane += nStep11;                      nFlags = nFlagLeft;    break;
        case 3:     pPlane += 4;                            nFlags = 0x23;         break;
        case 4:     pPlane -= nStep11;                      nFlags = nFlagTop;     break;
        case 5:     pPlane += 4;
            nFlags = nFlagTop;
            if (edgeType & IPPVC_TOP_RIGHT_EDGE)
                nFlags &= ~ BLOCK_UP_RIGHT;
            break;
        case 6:     pPlane += nStep11;                      nFlags = 0x63;          break;
        case 7:     pPlane += 4;                            nFlags = 0x23;          break;
        case 8:     pPlane = pSrcDstYPlane + (nStep<<3);    nFlags = nFlagLeft;     break;
        case 9:     pPlane += 4;                            nFlags = 0x63;          break;
        case 10:    pPlane += nStep11;                      nFlags = nFlagLeft;     break;
        case 11:    pPlane += 4;                            nFlags = 0x23;          break;
        case 12:    pPlane -= nStep11;                      nFlags = 0x63;          break;
        case 13:    pPlane += 4;                            nFlags = 0x23;          break;
        case 14:    pPlane += nStep11;                      nFlags = 0x63;          break;
        case 15:    pPlane += 4;                            nFlags = 0x23;          break;
        default:
            return ippStsNoErr; 
        }

#define Row0  (*((u32*) pPlane))
#define Row1  (*((u32*) (pPlane + nStep)))
#define Row2  (*((u32*) (pPlane + nStep*2)))
#define Row3  (*((u32*) (pPlane + nStep3)))

        u32 nFourPix;

#define BLOCK_UP        (0x01)
#define BLOCK_LEFT      (0x02)
#define BLOCK_UP_LEFT   (0x20)
#define BLOCK_UP_RIGHT  (0x40)
        
        u8  pixel[16];  

 
// Predictor array index definitions

#define P_A (pixel[0])
#define P_B (pixel[1])
#define P_C (pixel[2])
#define P_D (pixel[3])

#define P_E (pixel[4])
#define P_F (pixel[5])
#define P_G (pixel[6])
#define P_H (pixel[7])

#define P_I (pixel[8])
#define P_J (pixel[9])
#define P_K (pixel[10])
#define P_L (pixel[11])

#define P_X (pixel[15])


        *((u32*)(pixel+0x0)) = (nFlags & BLOCK_UP) ? *((u32*) (pPlane-nStep)) : 0x80808080;
        *((u32*)(pixel+0x4)) = (nFlags & BLOCK_UP_RIGHT) ? *((u32*) (pPlane-nStep+4)) : (P_D | (P_D<<8) | (P_D<<16) | (P_D<<24));
        if (nFlags & BLOCK_LEFT) {
            pPlane --;
            P_I = pPlane[0];
            P_J = pPlane[nStep];
            P_K = pPlane[nStep*2];
            P_L = pPlane[nStep3];
            pPlane++;
        }
        else 
            *((u32*)(pixel+0x8)) = 0x80808080;

        if (nFlags & BLOCK_UP_LEFT) 
            *((u32*)(pixel+0xC)) = *((u32*) (pPlane-nStep-4));
        else
            *((u32*)(pixel+0xC)) = 0x80808080;


        info[pMBTypes[i]&15]++;

        switch (pMBTypes[i]) {
        case IPP_4x4_VERT:
//          if (!block_available_up)
//              printf ("warning: Intra_4x4_Vertical prediction mode not allowed at mb %d\n", (int) img->current_mb_nr);
            nFourPix = *((u32*) (pPlane - nStep));
            Row0 = Row1 = Row2 = Row3 = nFourPix;  
            break;
        case IPP_4x4_HOR:
            nFourPix = *(pPlane-1);         nFourPix |= nFourPix << 8; nFourPix |= nFourPix << 16;  Row0 = nFourPix; 
            nFourPix = *(pPlane+nStep-1);   nFourPix |= nFourPix << 8; nFourPix |= nFourPix << 16;  Row1 = nFourPix; 
            nFourPix = *(pPlane+nStep*2-1); nFourPix |= nFourPix << 8; nFourPix |= nFourPix << 16;  Row2  = nFourPix; 
            nFourPix = *(pPlane+nStep3-1);  nFourPix |= nFourPix << 8; nFourPix |= nFourPix << 16;  Row3  = nFourPix; 
            break;
        case IPP_4x4_DC:
            nFourPix = 0;
            nFlags &= BLOCK_UP | BLOCK_LEFT;
            if (nFlags) 
            {                
                if (nFlags == BLOCK_UP) { 
                    u8* p = pPlane - nStep;
                    nFourPix = p[0];  nFourPix += p[1];  nFourPix += p[2];  nFourPix += p[3];
                    nFourPix = (nFourPix+2)>>2;
                } else if (nFlags == BLOCK_LEFT) {
                    u8* p = pPlane - 1;
                    nFourPix = p[0]; nFourPix += p[nStep]; nFourPix += p[nStep*2]; nFourPix += p[nStep3];
                    nFourPix = (nFourPix+2)>>2;
                } else {
                    u8* p = pPlane - nStep;
                    nFourPix = p[0];  nFourPix += p[1];  nFourPix += p[2];  nFourPix += p[3];
                    p = pPlane - 1;
                    nFourPix += p[0]; nFourPix += p[nStep]; nFourPix += p[nStep*2]; nFourPix += p[nStep3];
                    nFourPix = (nFourPix+4)>>3;
                }
            }
            else
                nFourPix = 0x80;

            nFourPix |= nFourPix << 8; nFourPix |= nFourPix << 16;
            Row0 = Row1 = Row2 = Row3 = nFourPix; 
//            if (nFlags & BLOCK_UP_LEFT)
//                nFourPix += pPlane[-nStep-1]>>2;
//            Row0  = nFourPix;
            break;
        case IPP_4x4_DIAG_DL:
//            if ((nFlags & (BLOCK_UP | BLOCK_UP_RIGHT)) != (BLOCK_UP | BLOCK_UP_RIGHT))
//                dbAssert(1);

            nFourPix  =  (P_A + 2*P_B + P_C + 2) >> 2;
            nFourPix |= ((P_B + 2*P_C + P_D + 2) >> 2) << 8;
            nFourPix |= ((P_C + 2*P_D + P_E + 2) >> 2) << 16;
            nFourPix |= ((P_D + 2*P_E + P_F + 2) >> 2) << 24;
            Row0 = nFourPix;
            nFourPix >>= 8;
            nFourPix |= ((P_E + 2*P_F + P_G + 2) >> 2) << 24;
            Row1 = nFourPix;
            nFourPix >>= 8;
            nFourPix |= ((P_F + 2*P_G + P_H + 2) >> 2) << 24;
            Row2 = nFourPix;
            nFourPix >>= 8;
            nFourPix |= ((P_G + P_H + P_H + P_H + 2) >> 2) << 24;
            Row3 = nFourPix;

            break;
        case IPP_4x4_DIAG_DR:
            if ((nFlags & (BLOCK_UP | BLOCK_LEFT| BLOCK_UP_LEFT)) != (BLOCK_UP | BLOCK_LEFT| BLOCK_UP_LEFT))
                dbAssert(1);

            nFourPix  =  (P_I + 2*P_X + P_A + 2) >> 2;
            nFourPix |= ((P_X + 2*P_A + P_B + 2) >> 2) << 8;
            nFourPix |= ((P_A + 2*P_B + P_C + 2) >> 2) << 16;
            nFourPix |= ((P_B + 2*P_C + P_D + 2) >> 2) << 24;
            Row0 = nFourPix;
            nFourPix <<= 8;
            nFourPix |= ((P_J + 2*P_I + P_X + 2) >> 2);
            Row1 = nFourPix;
            nFourPix <<= 8;
            nFourPix |= ((P_K + 2*P_J + P_I + 2) >> 2);
            Row2 = nFourPix;
            nFourPix <<= 8;
            nFourPix |= ((P_L + 2*P_K + P_J + 2) >> 2);
            Row3 = nFourPix;

            break;
        case IPP_4x4_VR:
            nFourPix  = ((P_X + P_A + 1) >> 1);
            nFourPix |= ((P_A + P_B + 1) >> 1) << 8;
            nFourPix |= ((P_B + P_C + 1) >> 1) << 16;
            nFourPix |= ((P_C + P_D + 1) >> 1) << 24;
            Row0 = nFourPix;
            nFourPix <<= 8;
            nFourPix |= ((P_J + 2*P_I + P_X + 2) >> 2);
            Row2 = nFourPix;

            nFourPix  = ((P_I + 2*P_X + P_A + 2) >> 2);
            nFourPix |= ((P_X + 2*P_A + P_B + 2) >> 2) << 8;
            nFourPix |= ((P_A + 2*P_B + P_C + 2) >> 2) << 16;
            nFourPix |= ((P_B + 2*P_C + P_D + 2) >> 2) << 24;
            Row1 = nFourPix;
            nFourPix <<= 8;
            nFourPix |= ((P_I + 2*P_J + P_K + 2) >> 2);
            Row3 = nFourPix;
            break;

        case IPP_4x4_HD:
            nFourPix  = ((P_X + P_I + 1) >> 1);
            nFourPix |= ((P_I + 2*P_X + P_A + 2) >> 2) << 8;
            nFourPix |= ((P_X + 2*P_A + P_B + 2) >> 2) << 16;
            nFourPix |= ((P_A + 2*P_B + P_C + 2) >> 2) << 24;
            Row0 = nFourPix;
            nFourPix <<= 16;
            nFourPix |= ((P_J + P_I + 1) >> 1);
            nFourPix |= ((P_J + 2*P_I + P_X + 2) >> 2)  << 8;
            Row1 = nFourPix;

            nFourPix <<= 16;

            nFourPix |= ((P_K + P_J + 1) >> 1);
            nFourPix |= ((P_K + 2*P_J + P_I + 2) >> 2)  << 8;
            Row2 = nFourPix;
            nFourPix <<= 16;

            nFourPix |= ((P_L + P_K + 1) >> 1);
            nFourPix |= ((P_L + 2*P_K + P_J + 2) >> 2)  << 8;
            Row3 = nFourPix;

            break;
        case IPP_4x4_VL:
            nFourPix  = ((P_A + P_B + 1) >> 1);
            nFourPix |= ((P_B + P_C + 1) >> 1) << 8;
            nFourPix |= ((P_C + P_D + 1) >> 1) << 16;
            nFourPix |= ((P_D + P_E + 1) >> 1) << 24;
            Row0 = nFourPix;

            nFourPix >>= 8;
            nFourPix |= ((P_E + P_F + 1) >> 1) << 24;
            Row2 = nFourPix;

            nFourPix  = ((P_A + 2*P_B + P_C + 2) >> 2);
            nFourPix |= ((P_B + 2*P_C + P_D + 2) >> 2)  << 8;
            nFourPix |= ((P_C + 2*P_D + P_E + 2) >> 2)  << 16;
            nFourPix |= ((P_D + 2*P_E + P_F + 2) >> 2)  << 24;
            Row1 = nFourPix;

            nFourPix >>= 8;
            nFourPix |= ((P_E + 2*P_F + P_G + 2) >> 2)  << 24;
            Row3 = nFourPix;
            break;
        case IPP_4x4_HU:
            nFourPix  = ((P_J + P_I + 1) >> 1);
            nFourPix |= ((P_K + 2*P_J + P_I + 2) >> 2)  << 8;
            nFourPix |= ((P_K + P_J + 1) >> 1)          << 16;
            nFourPix |= ((P_L + 2*P_K + P_J + 2) >> 2)  << 24;
            Row0 = nFourPix;

            nFourPix >>= 16;
            nFourPix |= ((P_K + P_L + 1) >> 1) << 16;
            nFourPix |= ((P_K + 2*P_L + P_L + 2) >> 2) << 24;
            Row1 = nFourPix;

            nFourPix >>= 16;
            nFourPix |= (P_L << 16) | (P_L << 24);
            Row2 = nFourPix;

            nFourPix >>= 16;
            nFourPix |= (nFourPix << 16);
            Row3 = nFourPix;
            break;
        }

                       
        if (cbp4x4 & (2<<i)) {            
            if (!bByPass)
                H264_Trans4x4(pPlane, pSrcDstCoeff, pQuantTable, NULL, nStep,  qAdd, qShiftRight, qShiftLeft);
            else {
                dbAssert(0);
                //  1003E297:          push        1
                //  1003E299:          push        esi
                //  1003E29A:          push        esi
                //  1003E29B:          mov         eax,dword ptr [esp+50h]
                //  1003E29F:          push        eax
                //  1003E2A0:          push        edi
                //  1003E2A1:          push        edi
                //  1003E2A2:          push        eax
                //  1003E2A3:          call        1009A6C0
    //!!            call_1009A6C0(pSrcDstYPlane, pSrcDstCoeff, pSrcDstCoeff, pSrcDstYPlane, nStep, nStep);
                //  1003E2A8:          add         esp,1Ch
            }
            pSrcDstCoeff += 16;
        }
    }
    
    *ppSrcDstCoeff = pSrcDstCoeff;
    return ippStsNoErr; 
}