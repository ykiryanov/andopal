#include "umc_defs.h"

#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_types.h"
#include <ippi.h>
#include "h264_util.h"




/* ///////////////////////////////////////////////////////////////////////////
//  Name:
//      ippiReconstructLumaInterMB_H264_16s8u_C1R
//
//  Purpose:
//      Reconstruct Inter Luma macroblock
//
//  Parameters:
//      ppSrcCoeff          - pointer to 4x4 block of coefficients, if it's non zero(will be update by function)
//      pSrcDstYPlane       - pointer to current Y plane which will be reconstructed
//      srcdsYStep          - plane step
//      cbp4x4              - coded block pattern
//      QP                  - quantizer
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

IppStatus __STDCALL H264_CODE_FUN(ippiReconstructLumaInterMB_H264_16s8u_C1R)
(
    Ipp16s **ppSrcCoeff,
    Ipp8u *pSrcDstYPlane,
    Ipp32u srcdstYStep,
    Ipp32u cbp4x4,
    Ipp32s QP
)
{
    if ( !ppSrcCoeff || !pSrcDstYPlane || !*ppSrcCoeff )
        return ippStsNullPtrErr;

    if (QP > 51 )
        return ippStsOutOfRangeErr; 

    uint nStep = srcdstYStep;

    Ipp16s* pSrcCoeff = *ppSrcCoeff;

    Ipp8s* pTabOff = h264Tab4x4offset;
    u8* pYPlane = pSrcDstYPlane;
    const Ipp16s* pQuantTable = g_QuantTable + QP*16;

    for (uint i=(cbp4x4 & 0x1FFFF) >> 1; i != 0; i >>= 1) 
    {            
        if (i & 1) 
        {
            H264_Trans4x4(pSrcCoeff, pQuantTable, pYPlane, nStep, NULL);
            pSrcCoeff += 16;
        }
        pYPlane += pTabOff[0] + pTabOff[1]*nStep;
        pTabOff += 2;
    }

    
    *ppSrcCoeff =  pSrcCoeff;
    return ippStsNoErr;
}
