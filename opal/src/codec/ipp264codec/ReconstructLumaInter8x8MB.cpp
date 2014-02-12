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
//      ippiReconstructLumaInter8x8MB_H264_16s8u_C1R
//
//  Purpose:
//      Reconstruct Inter 8x8 Luma macroblock for high profile
//
//  Parameters:
//      ppSrcCoeff          - pointer to 8x8 block of coefficients, if it's non zero(will be update by function)
//      pSrcDstYPlane       - pointer to current Y plane which will be reconstructed
//      srcdstYStep         - plane step
//      cbp8x8              - coded block pattern
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

extern "C" IppStatus __STDCALL XippiReconstructLumaInter8x8MB_H264_16s8u_C1R
(
    Ipp16s**        ppSrcDstCoeff,
    Ipp8u*          pSrcDstYPlane,
    Ipp32u          srcdstYStep,
    Ipp32u          cbp8x8,
    Ipp32s          QP,
    const Ipp16s*   pQuantTable,
    Ipp8u           bypass_flag)
{
    if ((ppSrcDstCoeff == NULL) || (pSrcDstYPlane == NULL) || (pQuantTable == NULL) || (*ppSrcDstCoeff == NULL))
        return ippStsNullPtrErr;

    if (QP > 0x033)
        return ippStsOutOfRangeErr;

    if (bypass_flag != 0) {
        dbAssert(0);
        return ippStsNullPtrErr;
    }

    bool bByPass = bypass_flag && !QP;
    uint calcQP = (0x02AAB*QP)>>16;  // 
    uint qAdd;
    uint qShiftRight;
    uint qShiftLeft;

    if (QP < 0x24) {
        qAdd = 1<<(5 - calcQP);
        qShiftRight = 6-calcQP;
        qShiftLeft = 0;
    } else {
        qAdd = 0;
        qShiftRight = 0;
        qShiftLeft = calcQP - 6;
    }

    Ipp16s* pSrcDstCoeff = *ppSrcDstCoeff;
    Ipp8u*  pPlane = pSrcDstYPlane;
    Ipp32u  nStep = srcdstYStep;

    if (cbp8x8 & 0x01)
    {
        if (bByPass)
            sub_1009D030(pPlane, pSrcDstCoeff, nStep);
        else
            sub_1009C4F0(pPlane, pSrcDstCoeff, pQuantTable, nStep, qAdd, qShiftRight, qShiftLeft);
        pSrcDstCoeff += 64;
    }
    pPlane += 8;

    if (cbp8x8 & 0x02)
    {
        if (bByPass)
            sub_1009D030(pPlane, pSrcDstCoeff, nStep);
        else
            sub_1009C4F0(pPlane, pSrcDstCoeff, pQuantTable, nStep, qAdd, qShiftRight, qShiftLeft);
        pSrcDstCoeff += 64;
    }
    pPlane += (nStep*8) - 8;
    if (cbp8x8 & 0x04)
    {
        if (bByPass)
            sub_1009D030(pPlane, pSrcDstCoeff, nStep);
        else
            sub_1009C4F0(pPlane, pSrcDstCoeff, pQuantTable, nStep, qAdd, qShiftRight, qShiftLeft);
        pSrcDstCoeff += 64;
    }
    pPlane += 8;
    if (cbp8x8 & 0x08)
    {
        if (bByPass)
            sub_1009D030(pPlane, pSrcDstCoeff, nStep);
        else
            sub_1009C4F0(pPlane, pSrcDstCoeff, pQuantTable, nStep, qAdd, qShiftRight, qShiftLeft);
        pSrcDstCoeff += 64;
    }
    *ppSrcDstCoeff = pSrcDstCoeff;
    return ippStsNoErr; 
}