

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

#define P_A (PredPel[0])
#define P_B (PredPel[1])
#define P_C (PredPel[2])
#define P_D (PredPel[3])

#define P_E (PredPel[4])
#define P_F (PredPel[5])
#define P_G (PredPel[6])
#define P_H (PredPel[7])

#define P_I (PredPel[8])
#define P_J (PredPel[9])
#define P_K (PredPel[10])
#define P_L (PredPel[11])

#define P_M (PredPel[12])
#define P_N (PredPel[13])
#define P_O (PredPel[14])
#define P_P (PredPel[15])

#define P_Q (PredPel[16])
#define P_R (PredPel[17])
#define P_S (PredPel[18])
#define P_T (PredPel[19])

#define P_U (PredPel[20])
#define P_V (PredPel[21])
#define P_W (PredPel[22])
#define P_X (PredPel[23])

#define P_Z (PredPel[27])

//  ABCD EFGH    IJKL MNOP    QRST UVWX   Z


#define Row0  ((u32*) pPlane)
#define Row1  ((u32*) (pPlane + nStep))
#define Row2  ((u32*) (pPlane + nStep*2))
#define Row3  ((u32*) (pPlane + nStep3))
#define Row4  ((u32*) (pPlane + nStep4))
#define Row5  ((u32*) (pPlane + nStep5))
#define Row6  ((u32*) (pPlane + nStep6))
#define Row7  ((u32*) (pPlane + nStep7))



void  sub_1009D030(Ipp8u* pPlane, Ipp16s* pSrcDstCoeff, Ipp32s nStep)
{
    dbAssert(0);
}

void sub_1009C4F0(Ipp8u* pPlane, Ipp16s* pSrcDstCoeff, const Ipp16s* pQuantTable,Ipp32s nStep, uint qAdd, uint qShiftRight, uint qShiftLeft)
{
    int     i;
    int     mat[64], mat2[64];

    for (i=0;i<64;i++) 
        mat[i] = ((int(pSrcDstCoeff[i])* int(pQuantTable[i]) + int(qAdd))>>qShiftRight) << qShiftLeft;
        
    int* mIn  = mat;
    Ipp32s a0,a2,a4,a6;
    Ipp32s b0,b1,b2,b3,b4,b5,b6,b7;

#define a1 a0
#define a3 a2
#define a5 a4
#define a7 a6

    int* mOut = mat2;
    for (i=0;i<8; i++, mIn+=8, mOut ++)
    {
        a0 = mIn[0] + mIn[4];      
        a4 = mIn[0] - mIn[4];   
        a2 = (mIn[2] >> 1) - mIn[6];
        a6 = mIn[2] + (mIn[6] >> 1);

        b0 = a0 + a6;
        b2 = a4 + a2;
        b4 = a4 - a2;
        b6 = a0 - a6;

        a1 = -mIn[3] + mIn[5] - mIn[7] - (mIn[7]>>1);
        a3 =  mIn[1] + mIn[7] - mIn[3] - (mIn[3]>>1);
        a5 = -mIn[1] + mIn[7] + mIn[5] + (mIn[5]>>1);
        a7 =  mIn[3] + mIn[5] + mIn[1] + (mIn[1]>>1);

        b1 =   a1 + (a7>>2);
        b7 = -(a1>>2) + a7;
        b3 =   a3 + (a5>>2);
        b5 =  (a3>>2) - a5;

        mOut[0*8] = b0 + b7;
        mOut[1*8] = b2 + b5;
        mOut[2*8] = b4 + b3;
        mOut[3*8] = b6 + b1;
        mOut[4*8] = b6 - b1;
        mOut[5*8] = b4 - b3;
        mOut[6*8] = b2 - b5;
        mOut[7*8] = b0 - b7;
    }




    mIn  = mat2;
    mOut = mat;

    for (i=0;i<8; i++, mIn+=8, mOut ++)
    {
        a0 = mIn[0] + mIn[4];      
        a4 = mIn[0] - mIn[4];   
        a2 = (mIn[2] >> 1) - mIn[6];
        a6 = mIn[2] + (mIn[6] >> 1);

        b0 = a0 + a6;
        b2 = a4 + a2;
        b4 = a4 - a2;
        b6 = a0 - a6;

        a1 = -mIn[3] + mIn[5] - mIn[7] - (mIn[7]>>1);
        a3 =  mIn[1] + mIn[7] - mIn[3] - (mIn[3]>>1);
        a5 = -mIn[1] + mIn[7] + mIn[5] + (mIn[5]>>1);
        a7 =  mIn[3] + mIn[5] + mIn[1] + (mIn[1]>>1);

        b1 =   a1 + (a7>>2);
        b7 = -(a1>>2) + a7;
        b3 =   a3 + (a5>>2);
        b5 =  (a3>>2) - a5;

        mOut[0*8] = b0 + b7;
        mOut[1*8] = b2 + b5;
        mOut[2*8] = b4 + b3;
        mOut[3*8] = b6 + b1;
        mOut[4*8] = b6 - b1;
        mOut[5*8] = b4 - b3;
        mOut[6*8] = b2 - b5;
        mOut[7*8] = b0 - b7;
    }

    u8* pImg = pPlane;
    nStep -= 8;
    mIn  = mat;

    for (uint j=0;j<8;j++) {
        for (uint i=0;i<8;i++) {
            int c = *pImg;
            c += (mIn[0] + 0x20)>>6; mIn ++;
            if (c > 255)
                c = 255;
            else if (c<0)
                c = 0;
            *pImg ++ = c;
        }
        pImg += nStep;
    }
}



extern "C" IppStatus __STDCALL H264_CODE_FUN(ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R)(
    Ipp16s**                    ppSrcDstCoeff,
    Ipp8u*                      pSrcDstYPlane,
    Ipp32s                      srcdstYStep,
    IppIntra8x8PredMode_H264*   pMBIntraTypes,
    Ipp32u                      cbp8x8,
    Ipp32u                      QP,
    Ipp8u                       edgeType,
    const Ipp16s*               pQuantTable,
    Ipp8u                       bypass_flag)
{
    if (bypass_flag != 0) {
        dbAssert(0);
        return ippStsNullPtrErr;
    }

    if ((ppSrcDstCoeff == NULL) || (pSrcDstYPlane == NULL) || (pMBIntraTypes == NULL) || (*ppSrcDstCoeff == NULL)) 
        return ippStsNullPtrErr;

    if (QP > 0x033)
        return ippStsOutOfRangeErr;

    bool bByPass = bypass_flag && !QP;
    uint calcQP = (0x02AAB*QP)>>16;
    uint qAdd;
    uint qShiftRight;
    uint qShiftLeft;

    if (QP < 0x24) {
        qAdd = 1<<(5 - calcQP);     // 1<<1 => 2
        qShiftRight = 6-calcQP;     // 6-4 => 2                                  
        qShiftLeft = 0;
    } else {
        qAdd = 0;
        qShiftRight = 0;
        qShiftLeft = calcQP - 6;
    }

    u8 nFlagTop       = ((edgeType & IPPVC_TOP_EDGE)  == 0) ? (BLOCK_UP| BLOCK_UP_LEFT | BLOCK_UP_RIGHT) : 0;   // 0x61
    u8 nFlagLeft      = ((edgeType & IPPVC_LEFT_EDGE) == 0) ? (BLOCK_LEFT | BLOCK_UP_LEFT) : 0;              // 0x22

    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    u8      nFlags;
    u8*     pPlane = pSrcDstYPlane;
    uint    nStep = srcdstYStep;
    uint    nStep2 = nStep<<1;
    uint    nStep3 = nStep + nStep2;
    uint    nStep4 = nStep<<2;
    uint    nStep5 = nStep4 + nStep;
    uint    nStep6 = nStep3<<1;
    uint    nStep8 = nStep<<3;
    uint    nStep7 = nStep8 - nStep;


    for (uint i=0;;i++) {
        switch (i) {
        case 0:
            nFlags = nFlagLeft | nFlagTop;
            if (edgeType & IPPVC_TOP_LEFT_EDGE)
                nFlags &= ~ BLOCK_UP_LEFT;
            
            nFlagLeft |= BLOCK_UP | BLOCK_UP_RIGHT;     // (0x22) | 0x41   BLOCK_UP | BLOCK_UP_RIGHT
            nFlagTop  |= BLOCK_LEFT;                    // (0x61) | 0x02   BLOCK_LEFT
            break;
        case 1:     
            pPlane += 8;
            nFlags = nFlagTop;
            if (edgeType & IPPVC_TOP_RIGHT_EDGE)
                nFlags &= ~ BLOCK_UP_RIGHT;
            break;
        case 2:     
            pPlane = pSrcDstYPlane + nStep8;
            nFlags = nFlagLeft;    
            break;
        case 3:     
            pPlane += 8;                            
            nFlags = BLOCK_UP | BLOCK_LEFT | BLOCK_UP_LEFT;
            break;
        default:
            *ppSrcDstCoeff = pSrcDstCoeff;
            return ippStsNoErr; 
        }


        u8  PredPel[28];
             
        pPlane -= nStep;
        nFlagLeft |= BLOCK_UP | BLOCK_UP_RIGHT;     // (0x22) | 0x41   BLOCK_UP | BLOCK_UP_RIGHT
        nFlagTop  |= BLOCK_LEFT;                    // (0x61) | 0x02   BLOCK_LEFT
        u32 pel4L,pel4R;

        if (nFlags & BLOCK_UP) {
            *((u32*)(PredPel+0x00)) = *((u32*) (pPlane+0x00));
            *((u32*)(PredPel+0x04)) = *((u32*) (pPlane+0x04));
        } else {
            *((u32*)(PredPel+0x00)) = 
            *((u32*)(PredPel+0x04)) = 0x80808080;
        }

        if (nFlags & BLOCK_UP_RIGHT) {
            *((u32*)(PredPel+0x08)) = *((u32*) (pPlane+0x08));
            *((u32*)(PredPel+0x0C)) = *((u32*) (pPlane+0x0C));
        } else {
            pel4L = PredPel[7];
            pel4L |= pel4L<<8;
            pel4L |= pel4L<<16;
            *((u32*)(PredPel+0x08)) = 
            *((u32*)(PredPel+0x0C)) = pel4L;
        }

        
        pPlane += nStep - 1;

        if (nFlags & BLOCK_LEFT) {
            *((u32*)(PredPel+0x10)) = pPlane[0] | (pPlane[nStep] << 8) | (pPlane[nStep2] << 16) | (pPlane[nStep3] << 24);
            *((u32*)(PredPel+0x14)) = pPlane[nStep4] | (pPlane[nStep5] << 8) | (pPlane[nStep6] << 16) | (pPlane[nStep7] << 24);
        } else {
            *((u32*)(PredPel+0x10)) = 0x80808080;
            *((u32*)(PredPel+0x14)) = 0x80808080;
        }

        if (nFlags & BLOCK_UP_LEFT)
            P_Z =  *(pPlane - nStep);
        else 
            P_Z  = (P_A + P_Q + 1)>>1;

        pPlane ++;


        switch (pMBIntraTypes[i]) {
        case IPP_8x8_VERT:
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4L =
                (((P_Z + 2*P_A + P_B +2)>>2)<<0)    |
                (((P_A + 2*P_B + P_C +2)>>2)<<8)    |
                (((P_B + 2*P_C + P_D +2)>>2)<<16)   |
                (((P_C + 2*P_D + P_E +2)>>2)<<24)   ;

            pel4R =
                (((P_D + 2*P_E + P_F +2)>>2)<<0)    |
                (((P_E + 2*P_F + P_G +2)>>2)<<8)    |
                (((P_F + 2*P_G + P_H +2)>>2)<<16)   |
                (((P_G + 2*P_H + P_I +2)>>2)<<24)   ;

            Row0[0] = pel4L;  Row0[1] = pel4R;
            Row1[0] = pel4L;  Row1[1] = pel4R;
            Row2[0] = pel4L;  Row2[1] = pel4R;
            Row3[0] = pel4L;  Row3[1] = pel4R;
            Row4[0] = pel4L;  Row4[1] = pel4R;
            Row5[0] = pel4L;  Row5[1] = pel4R;
            Row6[0] = pel4L;  Row6[1] = pel4R;
            Row7[0] = pel4L;  Row7[1] = pel4R;

            break;
        case IPP_8x8_HOR:
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4L = ((P_Z + 2*P_Q + P_R + 2)>>2);
            pel4L |= pel4L<<8;  pel4L |= pel4L<<16;
            Row0[0] = Row0[1] = pel4L;   

            pel4L = ((P_Q + 2*P_R + P_S + 2)>>2);
            pel4L |= pel4L<<8;  pel4L |= pel4L<<16;
            Row1[0] = Row1[1] = pel4L;   

            pel4L = ((P_R + 2*P_S + P_T + 2)>>2);
            pel4L |= pel4L<<8;   pel4L |= pel4L<<16;
            Row2[0] = Row2[1] = pel4L;   

            pel4L = ((P_S + 2*P_T + P_U + 2)>>2);
            pel4L |= pel4L<<8;   pel4L |= pel4L<<16;
            Row3[0] = Row3[1] = pel4L;   

            pel4L = ((P_T + 2*P_U + P_V + 2)>>2);
            pel4L |= pel4L<<8;   pel4L |= pel4L<<16;
            Row4[0] = Row4[1] = pel4L;   

            pel4L = ((P_U + 2*P_V + P_W + 2)>>2);
            pel4L |= pel4L<<8;   pel4L |= pel4L<<16;
            Row5[0] = Row5[1] = pel4L;   

            pel4L = ((P_V + 2*P_W + P_X + 2)>>2);
            pel4L |= pel4L<<8;   pel4L |= pel4L<<16;
            Row6[0] = Row6[1] = pel4L;   

            pel4L = ((P_W + 2*P_X + P_X + 2)>>2);
            pel4L |= pel4L<<8;   pel4L |= pel4L<<16;
            Row7[0] = Row7[1] = pel4L;   

            break;
        case IPP_8x8_DC:
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            if ((nFlags & (BLOCK_UP | BLOCK_LEFT)) == (BLOCK_UP | BLOCK_LEFT)) {
                pel4L =(
                    3*P_A + 
                    4*P_B + 
                    4*P_C + 
                    4*P_D + 
                    4*P_E + 
                    4*P_F + 
                    4*P_G + 
                    3*P_H + 
                    1*P_I +
                    2*P_Z +
                    3*P_Q + 
                    4*P_R + 
                    4*P_S + 
                    4*P_T + 
                    4*P_U + 
                    4*P_V + 
                    4*P_W + 
                    4*P_X + 
                    32) >> 6;
            }
            else {
                if (nFlags & BLOCK_UP)
                    pel4L = (P_A + P_B + P_C + P_D + P_E + P_F + P_G + P_H + 4) >> 3;
                else if (nFlags & BLOCK_LEFT)
                    pel4L = (P_Q + P_R + P_S + P_T + P_U + P_V + P_W + P_X + 4) >> 3;
                else
                    pel4L = 0x80;
            }
            pel4L |= pel4L << 8; 
            pel4L |= pel4L << 16;
            Row0[0] = pel4L;  Row0[1] = pel4L;
            Row1[0] = pel4L;  Row1[1] = pel4L;
            Row2[0] = pel4L;  Row2[1] = pel4L;
            Row3[0] = pel4L;  Row3[1] = pel4L;
            Row4[0] = pel4L;  Row4[1] = pel4L;
            Row5[0] = pel4L;  Row5[1] = pel4L;
            Row6[0] = pel4L;  Row6[1] = pel4L;
            Row7[0] = pel4L;  Row7[1] = pel4L;
            break;
        case IPP_8x8_DIAG_DL:
            pel4L = 
                (((P_Z + 4*P_A + 4*P_B + 2*P_B + 4*P_C + P_D + 8)>>4)<<0)  |
                (((P_A + 4*P_B + 4*P_C + 2*P_C + 4*P_D + P_E + 8)>>4)<<8)  |
                (((P_B + 4*P_C + 4*P_D + 2*P_D + 4*P_E + P_F + 8)>>4)<<16) |
                (((P_C + 4*P_D + 4*P_E + 2*P_E + 4*P_F + P_G + 8)>>4)<<24) ;
            Row0[0] = pel4L;   

            pel4R = 
                (((P_D + 4*P_E + 4*P_F + 2*P_F + 4*P_G + P_H + 8)>>4)<<0)  |
                (((P_E + 4*P_F + 4*P_G + 2*P_G + 4*P_H + P_I + 8)>>4)<<8)  |
                (((P_F + 4*P_G + 4*P_H + 2*P_H + 4*P_I + P_J + 8)>>4)<<16) |
                (((P_G + 4*P_H + 4*P_I + 2*P_I + 4*P_J + P_K + 8)>>4)<<24) ;
            Row0[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row1[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_H + 4*P_I + 4*P_J + 2*P_J + 4*P_K + P_L + 8)>>4)<<24) ;
            Row1[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row2[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_I + 4*P_J + 4*P_K + 2*P_K + 4*P_L + P_M + 8)>>4)<<24) ;
            Row2[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row3[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_J + 4*P_K + 4*P_L + 2*P_L + 4*P_M + P_N + 8)>>4)<<24) ;
            Row3[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row4[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_K + 4*P_L + 4*P_M + 2*P_M + 4*P_N + P_O + 8)>>4)<<24) ;
            Row4[1] = pel4R;
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row5[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_L + 4*P_M + 4*P_N + 2*P_N + 4*P_O + P_P + 8)>>4)<<24) ;
            Row5[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row6[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_M + 4*P_N + 4*P_O + 2*P_O + 4*P_P + P_P + 8)>>4)<<24) ;
            Row6[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            Row7[0] = pel4L;
            pel4R >>= 8;
            pel4R |= (((P_N + 4*P_O + 8*P_P + 2*P_P + P_O/*+  4*P_N + P_O*/ + 8)>>4)<<24) ;
            Row7[1] = pel4R;
        //----------------------------------------------------------------------------
            break;
        case IPP_8x8_DIAG_DR:
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4L = 
                (((P_R + 4*P_Q + 4*P_Z + 2*P_Z + 4*P_A + P_B + 8)>>4)<<0)  |
                (((P_Q + 4*P_Z + 4*P_A + 2*P_A + 4*P_B + P_C + 8)>>4)<<8)  |
                (((P_Z + 4*P_A + 4*P_B + 2*P_B + 4*P_C + P_D + 8)>>4)<<16) |
                (((P_A + 4*P_B + 4*P_C + 2*P_C + 4*P_D + P_E + 8)>>4)<<24) ;
            Row0[0] = pel4L;   

            pel4R = 
                (((P_B + 4*P_C + 4*P_D + 2*P_D + 4*P_E + P_F + 8)>>4)<<0)  |
                (((P_C + 4*P_D + 4*P_E + 2*P_E + 4*P_F + P_G + 8)>>4)<<8)  |
                (((P_D + 4*P_E + 4*P_F + 2*P_F + 4*P_G + P_H + 8)>>4)<<16) |
                (((P_E + 4*P_F + 4*P_G + 2*P_G + 4*P_H + P_I + 8)>>4)<<24) ;
            Row0[1] = pel4R;
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row1[1] = pel4R;
            pel4L |= ((P_S + 4*P_R + 4*P_Q + 2*P_Q + 4*P_Z + P_A + 8)>>4) ;
            Row1[0] = pel4L;
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row2[1] = pel4R;
            pel4L |= ((P_T + 4*P_S + 4*P_R + 2*P_R + 4*P_Q + P_Z + 8)>>4) ;
            Row2[0] = pel4L;
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row3[1] = pel4R;
            pel4L |= ((P_U + 4*P_T + 4*P_S + 2*P_S + 4*P_R + P_Q + 8)>>4) ;
            Row3[0] = pel4L;
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row4[1] = pel4R;
            pel4L |= ((P_V + 4*P_U + 4*P_T + 2*P_T + 4*P_S + P_R + 8)>>4) ;
            Row4[0] = pel4L;
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row5[1] = pel4R;
            pel4L |= ((P_W + 4*P_V + 4*P_U + 2*P_U + 4*P_T + P_S + 8)>>4) ;
            Row5[0] = pel4L;
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row6[1] = pel4R;
            pel4L |= ((P_X + 4*P_W + 4*P_V + 2*P_V + 4*P_U + P_T + 8)>>4) ;
            Row6[0] = pel4L;
        //----------------------------------------------------------------------------
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row7[1] = pel4R;
            pel4L |= ((P_X + 4*P_X + 4*P_W + 2*P_W + 4*P_V + P_U + 8)>>4) ;
            Row7[0] = pel4L;
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
        //----------------------------------------------------------------------------
            break;
        case IPP_8x8_VR:
             //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L = 
                (((2*P_Q + 6*P_Z + 6*P_A + 2*P_B + 8)>>4)<<0)  |
                (((2*P_Z + 6*P_A + 6*P_B + 2*P_C + 8)>>4)<<8)  |
                (((2*P_A + 6*P_B + 6*P_C + 2*P_D + 8)>>4)<<16) |
                (((2*P_B + 6*P_C + 6*P_D + 2*P_E + 8)>>4)<<24) ;
            Row0[0] = pel4L;   
 
            pel4R = 
                (((2*P_C + 6*P_D + 6*P_E + 2*P_F + 8)>>4)<<0)  |
                (((2*P_D + 6*P_E + 6*P_F + 2*P_G + 8)>>4)<<8)  |
                (((2*P_E + 6*P_F + 6*P_G + 2*P_H + 8)>>4)<<16) |
                (((2*P_F + 6*P_G + 6*P_H + 2*P_I + 8)>>4)<<24) ;
            Row0[1] = pel4R;
       //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row2[1] = pel4R;
            pel4L |= ((P_S + 4*P_R + 4*P_Q + 2*P_Q + 4*P_Z + P_A + 8)>>4) ;
            Row2[0] = pel4L;
        //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row4[1] = pel4R;
            pel4L |= ((P_U + 4*P_T + 6*P_S + 4*P_R + P_Q + 8)>>4) ;
            Row4[0] = pel4L;
        //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row6[1] = pel4R;
            pel4L |= ((P_W + 4*P_V + 6*P_U + 4*P_T + P_S  + 8)>>4) ;
            Row6[0] = pel4L;
        //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4L = 
                (((P_R + 4*P_Q + 6*P_Z + 4*P_A + P_B + 8)>>4)<<0)  |
                (((P_Q + 4*P_Z + 6*P_A + 4*P_B + P_C + 8)>>4)<<8)  |
                (((P_Z + 4*P_A + 6*P_B + 4*P_C + P_D + 8)>>4)<<16) |
                (((P_A + 4*P_B + 6*P_C + 4*P_D + P_E + 8)>>4)<<24) ;
            Row1[0] = pel4L;   

            pel4R = 
                (((P_B + 4*P_C + 6*P_D + 4*P_E + P_F + 8)>>4)<<0)  |
                (((P_C + 4*P_D + 6*P_E + 4*P_F + P_G + 8)>>4)<<8)  |
                (((P_D + 4*P_E + 6*P_F + 4*P_G + P_H + 8)>>4)<<16) |
                (((P_E + 4*P_F + 6*P_G + 4*P_H + P_I + 8)>>4)<<24) ;
            Row1[1] = pel4R;
        //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row3[1] = pel4R;
            pel4L |= ((P_T + 4*P_S + 6*P_R + 4*P_Q + P_Z + 8)>>4);
            Row3[0] = pel4L;
        //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row5[1] = pel4R;
            pel4L |= ((P_V + 4*P_U + 6*P_T + 4*P_S + P_R + 8)>>4);
            Row5[0] = pel4L;
        //----------------------------------------------------------------------------
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            pel4R <<= 8;
            pel4R |= pel4L >> 24;
            pel4L <<= 8;
            Row7[1] = pel4R;
            pel4L |= ((P_X + 4*P_W + 6*P_V + 4*P_U + P_T + 8)>>4);
            Row7[0] = pel4L;
        //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
        //----------------------------------------------------------------------------
            break;
        case IPP_8x8_HD:
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L = 
                (((2*P_R + 6*P_Q + 6*P_Z + 2*P_A +               + 8)>>4)<<0)  |
                (((1*P_R + 4*P_Q + 6*P_Z + 4*P_A + 1*P_B         + 8)>>4)<<8)  |
                (((        1*P_Q + 4*P_Z + 6*P_A + 4*P_B + 1*P_C + 8)>>4)<<16) |
                (((                1*P_Z + 4*P_A + 6*P_B + 4*P_C + 1*P_D + 8)>>4)<<24) ;
            Row0[0] = pel4L;   
 
            pel4R = 
                (((                1*P_A + 4*P_B + 6*P_C + 4*P_D + 1*P_E                            + 8)>>4)<<0)  |
                (((                        1*P_B + 4*P_C + 6*P_D + 4*P_E + 1*P_F                    + 8)>>4)<<8)  |
                (((                                1*P_C + 4*P_D + 6*P_E + 4*P_F + 1*P_G            + 8)>>4)<<16) |
                (((                                        1*P_D + 4*P_E + 6*P_F + 4*P_G + 1*P_H    + 8)>>4)<<24) ;
            Row0[1] = pel4R;
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            //1----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row1[1] = pel4R;   
            pel4L |= 
                (((2*P_S + 6*P_R + 6*P_Q + 2*P_Z         + 8)>>4)<<0)  |
                (((1*P_S + 4*P_R + 6*P_Q + 4*P_Z + 1*P_A + 8)>>4)<<8)  ;
            Row1[0] = pel4L;
            //2----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row2[1] = pel4R;
            pel4L |= 
                (((2*P_T + 6*P_S + 6*P_R + 2*P_Q       + 8)>>4)<<0)  |
                (((1*P_T + 4*P_S + 6*P_R + 4*P_Q + P_Z + 8)>>4)<<8)  ;
            Row2[0] = pel4L;
            //3----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row3[1] = pel4R;
            pel4L |= 
                (((2*P_U + 6*P_T + 6*P_S + 2*P_R        + 8)>>4)<<0)  |
                (((1*P_U + 4*P_T + 6*P_S + 4*P_R + P_Q  + 8)>>4)<<8)  ;
            Row3[0] = pel4L;
            //4----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row4[1] = pel4R;
            pel4L |= 
                (((2*P_V + 6*P_U + 6*P_T + 2*P_S       + 8)>>4)<<0)  |
                (((1*P_V + 4*P_U + 6*P_T + 4*P_S + P_R + 8)>>4)<<8)  ;
            Row4[0] = pel4L;
            //5----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row5[1] = pel4R;
            pel4L |= 
                (((2*P_W + 6*P_V + 6*P_U + 2*P_T       + 8)>>4)<<0)  |
                (((1*P_W + 4*P_V + 6*P_U + 4*P_T + P_S + 8)>>4)<<8)  ;
            Row5[0] = pel4L;
            //6----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row6[1] = pel4R;
            pel4L |= 
                (((2*P_X + 6*P_W + 6*P_V + 2*P_U       + 8)>>4)<<0)  |
                (((1*P_X + 4*P_W + 6*P_V + 4*P_U + P_T + 8)>>4)<<8)  ;
            Row6[0] = pel4L;
            //7----------------------------------------------------------------------------
            pel4R <<= 16;
            pel4R |= pel4L >> 16;
            pel4L <<= 16;
            Row7[1] = pel4R;
            pel4L |= 
                (((8*P_X + 6*P_W + 2*P_V + 8)>>4)<<0)  |
                (((5*P_X + 6*P_W + 4*P_V + 1*P_U + 8)>>4)<<8)  ;
            Row7[0] = pel4L;
            break;
        case IPP_8x8_VL:
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L = 
                (((2*P_Z + 6*P_A + 6*P_B + 2*P_C                         + 8)>>4)<<0)  |
                (((        2*P_A + 6*P_B + 6*P_C + 2*P_D                 + 8)>>4)<<8)  |
                (((                2*P_B + 6*P_C + 6*P_D + 2*P_E         + 8)>>4)<<16) |
                (((                        2*P_C + 6*P_D + 6*P_E + 2*P_F + 8)>>4)<<24) ;
            Row0[0] = pel4L;   
 
            pel4R = 
                (((2*P_D + 6*P_E + 6*P_F + 2*P_G                         + 8)>>4)<<0)  |
                (((        2*P_E + 6*P_F + 6*P_G + 2*P_H                 + 8)>>4)<<8)  |
                (((                2*P_F + 6*P_G + 6*P_H + 2*P_I         + 8)>>4)<<16) |
                (((                        2*P_G + 6*P_H + 6*P_I + 2*P_J + 8)>>4)<<24) ;
            Row0[1] = pel4R;
            //2----------------------------------------------------------------------------
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            pel4R >>= 8;
            Row2[0] = pel4L;   
            pel4R |=                    (((2*P_H + 6*P_I + 6*P_J + 2*P_K + 8)>>4)<<24)  ;
            Row2[1] = pel4R;

            //4----------------------------------------------------------------------------
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            pel4R >>= 8;
            Row4[0] = pel4L;   
            pel4R |=                    (((2*P_I + 6*P_J + 6*P_K + 2*P_L + 8)>>4)<<24)  ;
            Row4[1] = pel4R;

            //6----------------------------------------------------------------------------
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            pel4R >>= 8;
            Row6[0] = pel4L;   
            pel4R |=                    (((2*P_J + 6*P_K + 6*P_L + 2*P_M + 8)>>4)<<24)  ;
            Row6[1] = pel4R;

            //1----------------------------------------------------------------------------
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L = 
                (((1*P_Z + 4*P_A + 6*P_B + 4*P_C + 1*P_D                            + 8)>>4)<<0)  |
                (((        1*P_A + 4*P_B + 6*P_C + 4*P_D + 1*P_E                    + 8)>>4)<<8)  |
                (((                1*P_B + 4*P_C + 6*P_D + 4*P_E + 1*P_F            + 8)>>4)<<16) |
                (((                        1*P_C + 4*P_D + 6*P_E + 4*P_F + 1*P_G    + 8)>>4)<<24) ;
            Row1[0] = pel4L;   
 
            pel4R = 
                (((1*P_D +  4*P_E + 6*P_F + 4*P_G + 1*P_H                           + 8)>>4)<<0)  |
                (((         1*P_E + 4*P_F + 6*P_G + 4*P_H + 1*P_I                   + 8)>>4)<<8)  |
                (((         1*P_F + 4*P_G + 6*P_H + 4*P_I + 1*P_J                   + 8)>>4)<<16) |
                (((                 1*P_G + 4*P_H + 6*P_I + 4*P_J + 1*P_K           + 8)>>4)<<24) ;
            Row1[1] = pel4R;
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            //3----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            pel4R >>= 8;
            Row3[0] = pel4L;   
            pel4R |=                    (((1*P_H + 4*P_I + 6*P_J + 4*P_K + 1*P_L + 8)>>4)<<24) ;
            Row3[1] = pel4R;
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z
            //5----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            pel4R >>= 8;
            Row5[0] = pel4L;   
            pel4R |=                    (((1*P_I + 4*P_J + 6*P_K + 4*P_L + 1*P_M + 8)>>4)<<24) ;
            Row5[1] = pel4R;
            //7----------------------------------------------------------------------------
            pel4L >>= 8;
            pel4L |= pel4R << 24;
            pel4R >>= 8;
            Row7[0] = pel4L;   
            pel4R |=                    (((1*P_J + 4*P_K + 6*P_L + 4*P_M + 1*P_N + 8)>>4)<<24) ;
            Row7[1] = pel4R;
            break;
        case IPP_8x8_HU:
            //  0123 4567    8901 2345    7890 1234   6
            //  ABCD EFGH    IJKL MNOP    QRST UVWX   Z 
            pel4L = 
                (((                2*P_S + 6*P_R + 6*P_Q + 2*P_Z    + 8)>>4)<<0)  |
                (((        1*P_T + 4*P_S + 6*P_R + 4*P_Q + 1*P_Z    + 8)>>4)<<8)  |
                (((        2*P_T + 6*P_S + 6*P_R + 2*P_Q            + 8)>>4)<<16) |
                (((1*P_U + 4*P_T + 6*P_S + 4*P_R + 1*P_Q            + 8)>>4)<<24) ;
            Row0[0] = pel4L;   
 
            pel4R =
                (((                2*P_U + 6*P_T + 6*P_S + 2*P_R + 0*P_Q    + 8)>>4)<<0)  |
                (((        1*P_V + 4*P_U + 6*P_T + 4*P_S + 1*P_R + 0*P_Q    + 8)>>4)<<8)  |
                (((        2*P_V + 6*P_U + 6*P_T + 2*P_S + 0*P_R + 0*P_Q    + 8)>>4)<<16) |
                (((1*P_W + 4*P_V + 6*P_U + 4*P_T + 1*P_S + 0*P_R + 0*P_Q    + 8)>>4)<<24) ;
            Row0[1] = pel4R;
            //1----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row1[0] = pel4L;   
            pel4R |=                    
                (((        2*P_W + 6*P_V + 6*P_U + 2*P_T + 8)>>4)<<16) |
                (((1*P_X + 4*P_W + 6*P_V + 4*P_U + 1*P_T + 8)>>4)<<24) ;
            Row1[1] = pel4R;
            //2----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row2[0] = pel4L;   
            pel4R |=                    
                (((2*P_X + 6*P_W + 6*P_V + 2*P_U + 8)>>4)<<16) |
                (((5*P_X + 6*P_W + 4*P_V + 1*P_U + 8)>>4)<<24) ;
            Row2[1] = pel4R;
            //3----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row3[0] = pel4L;   
            pel4R |=                    
                (((8*P_X + 6*P_W + 2*P_V + 8)>>4)<<16) |
                (((10*P_X + 5*P_W + 1*P_V + 8)>>4)<<24) ;
            Row3[1] = pel4R;
            //4----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row4[0] = pel4L;   
            pel4R |=                    
                (((12*P_X + 4*P_W + 8)>>4)<<16) |
                (((12*P_X + 4*P_W + 8)>>4)<<24) ;
            Row4[1] = pel4R;
            //5----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row5[0] = pel4L;   
            pel4R |=                    
                (((12*P_X + 4*P_W + 8)>>4)<<16) |
                (((12*P_X + 4*P_W + 8)>>4)<<24) ;
            Row5[1] = pel4R;
            //6----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row6[0] = pel4L;   
            pel4R |=                    
                (((12*P_X + 4*P_W + 8)>>4)<<16) |
                (((12*P_X + 4*P_W + 8)>>4)<<24) ;
            Row6[1] = pel4R;
            //7----------------------------------------------------------------------------
            pel4L >>= 16;
            pel4L |= pel4R << 16;
            pel4R >>= 16;
            Row7[0] = pel4L;   
            pel4R |=                    
                (((12*P_X + 4*P_W + 8)>>4)<<16) |
                (((12*P_X + 4*P_W + 8)>>4)<<24) ;
            Row7[1] = pel4R;

            break;
        default:
            return ippStsOutOfRangeErr;
        }
        if (cbp8x8 & (1<<i)) {
            if (bByPass)
                sub_1009D030(pPlane, pSrcDstCoeff, nStep);
            else
                sub_1009C4F0(pPlane, pSrcDstCoeff, pQuantTable, nStep, qAdd, qShiftRight, qShiftLeft);
            pSrcDstCoeff += 64;
        }
    }
    *ppSrcDstCoeff = pSrcDstCoeff;
    return ippStsNoErr; 
}