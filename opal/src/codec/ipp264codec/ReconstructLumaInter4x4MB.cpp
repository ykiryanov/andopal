#include "umc_defs.h"

#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_types.h"
#include <ippi.h>
#include "h264_util.h"


void  sub_1009D030(Ipp8u* pPlane, Ipp16s* pSrcDstCoeff, Ipp32s nStep);
void sub_1009C4F0(Ipp8u* pPlane, Ipp16s* pSrcDstCoeff, const Ipp16s* pQuantTable,Ipp32s nStep, uint qAdd, uint qShiftRight, uint qShiftLeft);

/* ///////////////////////////////////////////////////////////////////////////
//  Name:
//      ippiReconstructLumaInter4x4MB_H264_16s8u_C1R
//
//  Purpose:
//      Reconstruct Inter 4x4 Luma macroblock for high profile
//
//  Parameters:
//      ppSrcCoeff          - pointer to 4x4 block of coefficients, if it's non zero(will be update by function)
//      pSrcDstYPlane       - pointer to current Y plane which will be reconstructed
//      srcdstYStep         - plane step
//      cbp4x4              - coded block pattern
//      QP                  - quantizer
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
*/

extern "C" IppStatus __STDCALL H264_CODE_FUN(ippiReconstructLumaInter4x4MB_H264_16s8u_C1R)(
    Ipp16s**        ppSrcDstCoeff,
    Ipp8u*          pSrcDstYPlane,
    Ipp32u          srcdstYStep,
    Ipp32u          cbp4x4,
    Ipp32s          QP,
    const Ipp16s*   pQuantTable,
    Ipp8u           nBypassFlag)
{
    if ((ppSrcDstCoeff == NULL) || (pSrcDstYPlane == NULL) || (pQuantTable == NULL) || (*ppSrcDstCoeff == NULL))
        return ippStsNullPtrErr;

    if (QP > 0x033)
        return ippStsOutOfRangeErr;

    if (nBypassFlag != 0) {
        dbAssert(0);
        return ippStsNullPtrErr;
    }

    bool bByPass = nBypassFlag && !QP;
    uint calcQP = (0x02AAB*QP)>>16;
    uint qAdd;
    uint qShiftRight;
    uint qShiftLeft;

    if (QP < 0x18) {
        qAdd = 1<<(3 - calcQP);
        qShiftRight = 4 - calcQP;
        qShiftLeft = 0;
    } else {
        qAdd = 0;
        qShiftRight = 0;
        qShiftLeft = calcQP - 4;
    }

    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    Ipp8u*  pPlane = pSrcDstYPlane;
    Ipp32u  nStep = srcdstYStep;
    signed char* pTabOff = h264Tab4x4offset;

    for (uint n=(cbp4x4 >> 1) & 0x0FFFF; n != 0; n>>=1)
    {
        if (n & 1) {

            if (bByPass)
                ; //__noop; // sub_1009C470(v7, a3, (unsigned int *)v7, a3, v16);
            else
                H264_Trans4x4(pPlane, pSrcDstCoeff, pQuantTable, NULL,  nStep, qAdd, qShiftRight, qShiftLeft);

            pSrcDstCoeff += 16;
        }
        pPlane += pTabOff[0] + nStep*pTabOff[1];
        pTabOff += 2;
    }

    *ppSrcDstCoeff = pSrcDstCoeff;
    return ippStsNoErr; 
}
