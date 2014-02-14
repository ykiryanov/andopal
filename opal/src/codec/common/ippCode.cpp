#pragma hdrstop

#ifdef _WIN32
#include <windows.h>
#include <stdlib.h>
#include <malloc.h>
#endif

#include "ippdefs.h"
#include "ippcore.h"
#include "ipps.h"
#include "ippvc.h"
#include "psffti.h"

#include "umc_base_codec.h"
#include "umc_video_data.h"
//SB!!!  #include "TargetConditionals.h"

#define DBG_ASSERT(a) __noop


#ifndef _WIN32_WCE
//#define DEBUG_IPP
#endif

#ifdef _WIN32_WCE
extern "C" {
	int __cdecl __intel_idiv(int a, int b) {
		return a/b;
	};

	void * __cdecl __intel_memcpy(void *p1, const void *p2, size_t size)
	{	
		return memcpy(p1, p2, size);
	};
};
#endif

#if TARGET_IPHONE_SIMULATOR
//IppStatus __STDCALL ippsSet_16s( Ipp16s val, Ipp16s* pDst, int len )
//{
//    if (len > 0) {
//        Ipp32u toSet = val; toSet |= toSet<<8; toSet |= toSet<<16;
//        memset(pDst,toSet,len);
//    }
//    return ippStsNoErr;
//}
#else
IppStatus __STDCALL ippGetCpuFreqMhz( int* pMhz )
{ if(pMhz) *pMhz = 1300; return ippStsNoErr; } // 1.3 GHZ FOR IPHONE 5.
#endif

using namespace UMC;

IPPAPI ( IppStatus, XippsSet_32s,( Ipp32s val, Ipp32s* pDst, int len ));

IppStatus __STDCALL  XippsCopy_8u(const Ipp8u* pSrc, Ipp8u* pDst, int len )
{ if (len >0) memcpy(pDst, pSrc, sizeof(Ipp8u)*len); return ippStsNoErr; }

IppStatus  __STDCALL XippsCopy_16s( const Ipp16s* pSrc, Ipp16s* pDst, int len )
{ if (len>0) memcpy(pDst, pSrc, sizeof(Ipp16s)*len); return ippStsNoErr; }

IppStatus  __STDCALL XippsMove_16s( const Ipp16s* pSrc, Ipp16s* pDst, int len )
{ if (len>0) memmove(pDst, pSrc, sizeof(Ipp16s)*len); return ippStsNoErr; }


IppStatus __STDCALL XippsSet_8u( Ipp8u val, Ipp8u* pDst, int len )
{
    if (len > 0) {
        Ipp32u toSet = val; toSet |= toSet<<8; toSet |= toSet<<16;
        memset(pDst,toSet,len);
    }
    return ippStsNoErr;
}

IppStatus __STDCALL XippsZero_8u( Ipp8u* pDst, int len )
{
    if (len > 0) {
        memset(pDst,0,len);
    }
    return ippStsNoErr;
}

extern "C" IppStatus __STDCALL XippsZero_16s( Ipp16s* pDst, int len )
{
    if (len > 0) {
		while (len--) 
			*pDst++ = 0; 
    }
    return ippStsNoErr;
}

extern "C" IppStatus __STDCALL XippiCopy8x8_8u_C1R(const Ipp8u* pSrc, int srcStep, Ipp8u* pDst, int dstStep)
{
    if (( (Ipp32u) (pSrc) & 0x3) | ( (Ipp32u) (pDst) & 0x3)) 
        return ippStsCpuNotSupportedErr;

    const unsigned long* pIn  = (const unsigned long*) pSrc;
    unsigned long* pOut = (unsigned long*) pDst;

    int inStep  = (srcStep>>2)-1;
    int outStep = (dstStep>>2)-1;

    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut = *pIn;  pIn += inStep;  pOut += outStep;

    return ippStsNoErr;
}


extern "C"  IppStatus __STDCALL XippiCopy16x16_8u_C1R( const Ipp8u* pSrc, int srcStep, Ipp8u* pDst, int dstStep)
{
    const unsigned long* pIn  = (const unsigned long*) pSrc;
    unsigned long* pOut = (unsigned long*) pDst;

    int inStep  = (srcStep>>2)-4;
    int outStep = (dstStep>>2)-4;

    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;
    *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++; *pOut ++ = *pIn ++;  pIn += inStep;  pOut += outStep;

    return ippStsNoErr;

}

extern "C"  IppStatus __STDCALL XippsSwapBytes_16u_I( Ipp16u* pSrcDst, int len )
{
    if (len > 0) {
        Ipp8u* p = (Ipp8u*) pSrcDst;
        while (--len >= 0) {
            Ipp8u v = p[0];
            p[0] = p[1];
            p[1] = v;
            p += 2;
        }
    }
    return ippStsNoErr;
}

extern "C"  IppStatus __STDCALL XippsSwapBytes_16u( const Ipp16u* pSrc, Ipp16u* pDst, int len )
{
    if (len > 0) {
        const Ipp8u* pi = (const Ipp8u*) pSrc;
        Ipp8u* po = (Ipp8u*) pDst;
        while (--len >= 0) {
            po[0] = pi[1];
            po[1] = pi[0];
            po += 2;
            pi += 2;
        }
    }
    return ippStsNoErr;
}

//
// MP3 support
//

//extern "C"  IppStatus __STDCALL  XownsCopy_8u(const Ipp8u* pSrc, Ipp8u* pDst, int len );
//extern "C"  IppStatus __STDCALL XownsSet_8u( Ipp8u val, Ipp8u* pDst, int len );
//extern "C"  IppStatus __STDCALL XownsZero_8u( Ipp8u* pDst, int len );
//extern "C"  IppStatus __STDCALL XownsSet_32s( Ipp32s val, Ipp32s* pDst, int len );
//
//extern "C"  IppStatus __STDCALL  XownsCopy_8u(const Ipp8u* pSrc, Ipp8u* pDst, int len )
//{
//    if (len >0)
//        memcpy(pDst, pSrc, sizeof(Ipp8u)*len);
//    return ippStsNoErr;
//}
//
//extern "C"  IppStatus __STDCALL XownsSet_8u( Ipp8u val, Ipp8u* pDst, int len )
//{
//    if (len > 0) {
//        Ipp32u toSet = val; toSet |= toSet<<8; toSet |= toSet<<16;
//        memset(pDst,toSet,len);
//    }
//    return ippStsNoErr;
//}
//
//extern "C"  IppStatus __STDCALL XownsZero_8u( Ipp8u* pDst, int len )
//{
//    if (len > 0) {
//        memset(pDst,0,len);
//    }
//    return ippStsNoErr;
//}
//
//extern "C"  IppStatus __STDCALL XownsSet_32s( Ipp32s val, Ipp32s* pDst, int len )
//{
//    if (len > 0) {
//		while (len--)
//			*pDst++ = val;
//    }
//    return ippStsNoErr;
//}

//
// AAC support
//
#include "ippdc.h"

//  Name:               ippsCRC32
//  Purpose:            Computes the CRC32(ITUT V.42) checksum for the source vector.
//
//  Parameters:
//   pSrc               Pointer to the source vector.
//   srcLen             Length of the source vector.
//   pCRC32             Pointer to the checksum value.
//  Return:
//   ippStsNoErr        Indicates no error.
//   ippStsNullPtrErr   Indicates an error when the pSrc pointer is NULL.
//   ippStsSizeErr      Indicates an error when the length of the source vector is less
//                      than or equal to zero.
//

extern "C"  IppStatus XippsCRC32_8u(const Ipp8u* pSrc, int srcLen, Ipp32u* pCRC32)
{
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCCountBits_16s32s
 //  Purpose:    ippsVLCCountBits_16s32s calculates number of bits necessary for encoding
 //              source data in pSrc  using variable Length Codes specified by pInputTable
 //              in the function ippsVLCEncodeInitAlloc_32s or in ippsVLCEncodeInit_32s.
 //
 //  Arguments:
 //     pVLCSpec                     pointer to pointer to VLCEncoder specification structure.
 //
 //  Return:
 //     ippStsNoErr                  Indicates no error.
 //     ippStsNullPtrErr             Indicates an error when one or more pointers
 //                                  passed to the function is NULL.
 //     ippStsVLCInputDataErr        Indicates an error when incorrect input is used.
 //
 */
extern "C"  IppStatus XippsVLCCountBits_16s32s(const Ipp16s* pSrc, int srcLen, Ipp32s* pCountBits, const IppsVLCEncodeSpec_32s* pVLCSpec)
{
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCDecodeUTupleBlock_1u16s
 //  Purpose:    decodes a dstLen element encoded by VLC code from the source data
 //              *ppSrc with *pSrcBitsOffset bits offset and stores the result in
 //              the destination *pDst
 //
 //  Arguments:
 //     ppSrc            pointer to pointer to source input bitstream
 //     pSrcBitsOffset   pointer to in/out source stream bit offset position
 //     pDst             decoded values array
 //     dstLen           number of values to decode into array pDst
 //     pVLCSpec         pointer to VLCDecoder specification structure
 //
 //  Return:
 //     ippStsNoErr            Indicates no error.
 //     ippStsNullPtrErr       Indicates an error when one or more pointers passed to
 //                            the function is NULL.
 //     ippStsVLCInputDataErr  Indicates an error when incorrect input is used.
 //                            It can indicate that bitstream contain code that is not
 //                            specified inside the used table.
 //     ippStsBitOffsetErr     Indicate an error when offset less then 0 or more then 7.
 //     ippStsContextMatchErr  Indicate an error when pVLCSpec struct was not created by
 //                            ippsVLCDecodeInit_32s or ippsVLCDecodeInitAlloc_32s functions.
 //
 */

extern "C"  IppStatus XippsVLCDecodeUTupleBlock_1u16s(Ipp8u                       **ppSrc,
                                                     int                         *pSrcBitsOffset,
                                                     Ipp16s                      *pDst,
                                                     int                         dstLen,
                                                     const IppsVLCDecodeUTupleSpec_32s *pVLCSpec)
{
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCDecodeOne_1u16s
 //  Purpose:    decodes a single element encoded by VLC code from the source data
 //              *ppSrc with *pSrcBitsOffset bits offset and stores the result in
 //              the destination *pDst
 //
 //  Arguments:
 //     ppSrc            pointer to pointer to source input bitstream
 //     pSrcBitsOffset   pointer to in/out source stream bit offset position
 //     pDst             decoded value
 //     pVLCSpec         pointer to VLCDecoder specification structure
 //
 //  Return:
 //     ippStsNoErr            Indicates no error.
 //     ippStsNullPtrErr       Indicates an error when one or more pointers passed to
 //                            the function is NULL.
 //     ippStsVLCInputDataErr  Indicates an error when incorrect input is used.
 //                            It can indicate that bitstream contain code that is not
 //                            specified inside the used table.
 //     ippStsBitOffsetErr     Indicate an error when offset less then 0 or more then 7.
 //     ippStsContextMatchErr  Indicate an error when pVLCSpec struct was not created by
 //                            ippsVLCDecodeInit_32s or ippsVLCDecodeInitAlloc_32s functions.
 //
 */
extern "C"  IppStatus XippsVLCDecodeOne_1u16s(Ipp8u **ppSrc,
                                              int *pSrcBitsOffset,
                                              Ipp16s *pDst,
                                              const IppsVLCDecodeSpec_32s *pVLCSpec)
{
    if(pDst)
        *pDst = 60;
    
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCDecodeGetSize_32s
 //  Purpose:    calculates the size for internal VLCDecode structure on
 //              the base of input parameters
 //
 //  Arguments:
 //     pInputTable                   pointer to input table.
 //     inputTableSize                size of this table
 //     pSubTablesSizes               sizes of subTables
 //     numSubTables                  num of Subtabtes.
 //     pSize                         pointer to size of VLCDecoder specification
 //                                   structure
 //
 //  Return:
 //     ippStsNoErr                   Indicates no error.
 //     ippStsNullPtrErr              Indicates an error when one or more pointers
 //                                   passed to the function is NULL.
 //     ippStsVLCUsrTblCodeLengthErr  Indicates an error when 1) the maximal length
 //                                   of codec in the input table exceeds 32;
 //                                   2) when any size in of subtables in
 //                                   pSubTablesSizes is less than one;
 //                                   3)when sum of this values is less than the
 //                                   maximal length of codes in the input table.
 //
 */
extern "C"  IppStatus XippsVLCDecodeGetSize_32s(int mode, int i, const IppsVLCTable_32s *pInputTable,
                                            int inputTableSize,
                                            Ipp32s *pSubTablesSizes,
                                            int numSubTables,
                                            Ipp32s *pSize)
{
    if(pSize && mode >= 0 && mode <= 2)
    {
        Ipp32s mode0[12] = { 2304, 1216, 800, 12672, 25888, 2304, 1952, 5536, 4128, 26752, 16000, 43968 };
        Ipp32s mode1[10] = { 1536, 1088, 480, 608, 1152, 704, 608, 608, 864, 192 };
        Ipp32s mode2[10] = { 896, 832, 608, 352, 608, 608, 128, 128, 128, 128 };

        switch(mode) {
            case 0: *pSize = mode0[i]; break;
            case 1: *pSize = mode1[i]; break;
            case 2: *pSize = mode2[i]; break;
            default:
                break;
        }
    }
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCEncodeGetSize_32s
 //  Purpose:    ippsVLCEncodeGetSize_32s calculates the size for internal VLCEncode
 //              structure on the base of Variable Length Code table.
 //
 //  Arguments:
 //     pInputTable                  pointer to input table.
 //     inputTableSize               size of this table.
 //     pSize                        pointer to size of VLCEncoder specification structure.
 //
 //  Return:
 //     ippStsNoErr                  Indicates no error.
 //     ippStsNullPtrErr             Indicates an error when one or more pointers
 //                                  passed to the function is NULL.
 //     ippStsVLCInputDataErr        Indicates an error when incorrect input is used.
 //
 */
extern "C"  IppStatus XippsVLCEncodeGetSize_32s(const IppsVLCTable_32s* pInputTable, int inputTableSize, Ipp32s* pSize)
{
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCEncodeInit_32s
 //  Purpose:    ippsVLCEncodeInit_32s initializes the size for internal VLCEncode
 //              structure on the base of Variable Length Code table.
 //
 //  Arguments:
 //     pInputTable                  pointer to input table.
 //     inputTableSize               size of this table.
 //     pVLCSpec                     pointer to VLCEncoder specification structure.
 //
 //  Return:
 //     ippStsNoErr                  Indicates no error.
 //     ippStsNullPtrErr             Indicates an error when one or more pointers
 //                                  passed to the function is NULL.
 //     ippStsVLCInputDataErr        Indicates an error when incorrect input is used.
 //
 */
extern "C"  IppStatus XippsVLCEncodeInit_32s(const IppsVLCTable_32s* pInputTable, int inputTableSize, IppsVLCEncodeSpec_32s* pVLCSpec)
{
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCDecodeInit_32s
 //  Purpose:    initializes internal VLCDecode structure
 //              based on the input parameters
 //
 //  Arguments:
 //     pInputTable                   pointer to input table.
 //     inputTableSize                size of this table
 //     pSubTablesSizes               sizes of subTables
 //     numSubTables                  num of Subtabtes.
 //     pVLCSpec                      pointer to VLCDecoder specification structure
 //
 //  Return:
 //     ippStsNoErr                   Indicates no error.
 //     ippStsNullPtrErr              Indicates an error when one or more pointers
 //                                   passed to the function is NULL.
 //     ippStsVLCUsrTblCodeLengthErr  Indicates an error when 1) the maximal length
 //                                   of codec in the input table exceeds 32;
 //                                   2) when any size in of subtables in
 //                                   pSubTablesSizes is less than one;
 //                                   3)when sum of this values is less than the
 //                                   maximal length of codes in the input table.
 //
 */
extern "C"  IppStatus XippsVLCDecodeInit_32s(const IppsVLCTable_32s *pInputTable,
                                             int inputTableSize,
                                             Ipp32s *pSubTablesSizes,
                                             int numSubTables,
                                             IppsVLCDecodeSpec_32s *pVLCSpec)
{
    return ippStsNoErr;
}

/* /////////////////////////////////////////////////////////////////////////////
 //  Name:       ippsVLCDecodeBlock_1u16s
 //  Purpose:    decodes a dstLen element encoded by VLC code from the source data
 //              *ppSrc with *pSrcBitsOffset bits offset and stores the result in
 //              the destination *pDst
 //
 //  Arguments:
 //     ppSrc            pointer to pointer to source input bitstream
 //     pSrcBitsOffset   pointer to in/out source stream bit offset position
 //     pDst             decoded values array
 //     dstLen           number of values to decode into array pDst
 //     pVLCSpec         pointer to VLCDecoder specification structure
 //
 //  Return:
 //     ippStsNoErr            Indicates no error.
 //     ippStsNullPtrErr       Indicates an error when one or more pointers passed to
 //                            the function is NULL.
 //     ippStsVLCInputDataErr  Indicates an error when incorrect input is used.
 //                            It can indicate that bitstream contain code that is not
 //                            specified inside the used table.
 //     ippStsBitOffsetErr     Indicate an error when offset less then 0 or more then 7.
 //     ippStsContextMatchErr  Indicate an error when pVLCSpec struct was not created by
 //                            ippsVLCDecodeInit_32s or ippsVLCDecodeInitAlloc_32s functions.
 //
 */
extern "C"  IppStatus XippsVLCDecodeBlock_1u16s(Ipp8u **ppSrc,
                                                int *pSrcBitsOffset,
                                                Ipp16s *pDst,
                                                int dstLen,
                                                const IppsVLCDecodeSpec_32s *pVLCSpec)
{
    return ippStsNoErr;
}

#if !defined __i386__

extern "C" {
    int ippsFFTFwdCtoC_32fc;
    int ippsPredictCoef_SBR_C_32fc_D2L;
    
    IppStatus ippsFFTGetSize_C_32fc
            ( int order, int flag, IppHintAlgorithm hint,
             int* pSpecSize, int* pSpecBufferSize, int* pBufferSize )
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsFFTInit_C_32fc
            ( IppsFFTSpec_C_32fc** ppFFTSpec,
             int order, int flag, IppHintAlgorithm hint,
             Ipp8u* pSpec, Ipp8u* pSpecBuffer )
    {
        return ippStsNoErr;
    }
    
    
    IppStatus ippsFFTFree_C_32fc   ( IppsFFTSpec_C_32fc* pFFTSpec )
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsFFTGetBufSize_C_32fc
            ( const IppsFFTSpec_C_32fc* pFFTSpec, int* pBufferSize )
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsFFTFwd_CToC_32fc
            ( const Ipp32fc* pSrc, Ipp32fc* pDst,
             const IppsFFTSpec_C_32fc* pFFTSpec, Ipp8u* pBuffer )
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisDownFilterInit_SBR_RToR_32f
           ( struct IppsFilterSpec_SBR_R_32f** ppFilterSpec, Ipp8u* pMemSpec, Ipp8u* pInitBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisFilter_SBR_CToR_32f_D2L
           (const Ipp32f* pSrcRe[], const Ipp32f* pSrcIm[], Ipp32f* pDst, const Ipp32f* pSbrTableWindow,
            int NumLoop, const struct IppsFilterSpec_SBR_C_32f* pFilterSpec, Ipp8u* pWorkBuf)
    {
       return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisFilter_SBR_CToR_32fc32f_D2L
           (const Ipp32fc* pSrc[], Ipp32f* pDst, const Ipp32f* pSbrTableWindow, int NumLoop,
            const struct IppsFilterSpec_SBR_C_32fc* pFilterSpec, Ipp8u* pWorkBuf )
    {
       return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisFilter_SBR_RToR_32f_D2L
           (const Ipp32f* pSrc[], Ipp32f* pDst, const Ipp32f* pSbrTableWindow, int NumLoop,
            const IppsFilterSpec_SBR_R_32f* pFilterSpec, Ipp8u* pWorkBuf )
    {
       return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisDownFilterInit_SBR_CToR_32fc32f
           ( struct IppsFilterSpec_SBR_C_32fc** ppFilterSpec, Ipp8u* pMemSpec, Ipp8u* pInitBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisFilterInit_SBR_CToR_32fc32f
           ( IppsFilterSpec_SBR_C_32fc** ppFilterSpec, Ipp8u* pMemSpec, Ipp8u* pInitBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsAnalysisFilterInit_SBR_RToR_32f
           ( IppsFilterSpec_SBR_R_32f** ppFilterSpec, Ipp8u* pMemSpec, Ipp8u* pInitBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisFilterInit_SBR_RToR_32f
           ( IppsFilterSpec_SBR_R_32f** ppFilterSpec, Ipp8u* pMemSpec, Ipp8u* pInitBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsAnalysisFilter_SBR_RToC_32f32fc_D2L
           (const Ipp32f* pSrc, Ipp32fc* pDst[], const Ipp32f* pSbrTableWinDown,
            int NumLoop, int offset, int kx,
            const IppsFilterSpec_SBR_C_32fc* pFilterSpec, Ipp8u* pWorkBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisDownFilter_SBR_RToR_32f_D2L
           (const Ipp32f* pSrc[], Ipp32f* pDst, const Ipp32f* pSbrTableWindowDown, int NumLoop,
            const IppsFilterSpec_SBR_R_32f* pFilterSpec, Ipp8u* pWorkBuf )
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsSynthesisDownFilter_SBR_CToR_32fc32f_D2L
           (const Ipp32fc* pSrc[], Ipp32f* pDst, const Ipp32f* pSbrTableWindowDown, int NumLoop,
            const struct IppsFilterSpec_SBR_C_32fc* pFilterSpec, Ipp8u* pWorkBuf )
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsAnalysisFilterInit_SBR_RToC_32f32fc
           ( IppsFilterSpec_SBR_C_32fc** ppFilterSpec, Ipp8u* pMemSpec, Ipp8u* pInitBuf)
    {
        return ippStsNoErr;
    }
    
    IppStatus ippsAnalysisFilter_SBR_RToR_32f_D2L
           (const Ipp32f* pSrc, Ipp32f* pDst[], const Ipp32f* pSbrTableWinDown,
            int NumLoop, int offset, int kx,
            const struct IppsFilterSpec_SBR_R_32f* pFilterSpec, Ipp8u* pWorkBuf)
    {
        return ippStsNoErr;
    }

    IppStatus ippsAnalysisFilterGetSize_SBR_RToC_32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        return ippStsNoErr;
    }

    IppStatus ippsAnalysisFilterGetSize_SBR_RToC_32f32fc( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        *pSizeSpec = 1455; *pSizeInitBuf = 4; *pSizeWorkBuf = 4;
        return ippStsNoErr;
    }
    IppStatus ippsAnalysisFilterGetSize_SBR_RToR_32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        *pSizeSpec = 1583; *pSizeInitBuf = 5; *pSizeWorkBuf = 9;
        return ippStsNoErr;
    }
    IppStatus ippsSynthesisFilterGetSize_SBR_CToR_32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        return ippStsNoErr;
    }
    IppStatus ippsSynthesisFilterGetSize_SBR_CToR_32fc32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        *pSizeSpec = 5395; *pSizeInitBuf = 4; *pSizeWorkBuf = 4;
        return ippStsNoErr;
    }
    IppStatus ippsSynthesisFilterGetSize_SBR_RToR_32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        *pSizeSpec = 5567; *pSizeInitBuf = 4; *pSizeWorkBuf = 292;
        return ippStsNoErr;
    }
    IppStatus ippsSynthesisDownFilterGetSize_SBR_CToR_32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        return ippStsNoErr;
    }
    IppStatus ippsSynthesisDownFilterGetSize_SBR_CToR_32fc32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        *pSizeSpec = 3375; *pSizeInitBuf = 4; *pSizeWorkBuf = 4;
        return ippStsNoErr;
    }
    IppStatus ippsSynthesisDownFilterGetSize_SBR_RToR_32f( int* pSizeSpec, int* pSizeInitBuf, int* pSizeWorkBuf )
    {
        *pSizeSpec = 2863; *pSizeInitBuf = 4; *pSizeWorkBuf = 164;
        return ippStsNoErr;
    }

};
#endif // !__i386__

//
// End of AAC support
//

class MyVideoProcessing : public BaseCodec
{
    DYNAMIC_CAST_DECL(MyVideoProcessing, BaseCodec)
public:
            MyVideoProcessing()          {}
    virtual ~MyVideoProcessing()   { }

    virtual Status Init(BaseCodecParams *init)                        { return UMC_OK;}
    virtual Status AddFilter(BaseCodec *filter, int atEnd)            { return UMC_ERR_NOT_IMPLEMENTED; }
    virtual Status GetInfo(BaseCodecParams *info)                     { return UMC_ERR_NOT_IMPLEMENTED; }
    virtual Status Close(void)                                        { return UMC_ERR_NOT_IMPLEMENTED; }
    virtual Status Reset(void)                                        { return UMC_ERR_NOT_IMPLEMENTED; }
    virtual Status SetParams(BaseCodecParams *params)                 { return UMC_ERR_NOT_IMPLEMENTED; }
    virtual Status GetFrame(MediaData* input, MediaData* output);
};

Status MyVideoProcessing::GetFrame(MediaData* input, MediaData* output)
{
    VideoData* pSrc  = (VideoData*) input;
    VideoData* pDst = (VideoData*) output;

    if (pSrc->GetColorFormat() != pDst->GetColorFormat())
        return UMC_ERR_NOT_IMPLEMENTED;

    output->SetFrameType(input->GetFrameType());

    for (int i=0;i<pSrc->GetNumPlanes();++i)
    {
        VideoData::PlaneInfo src;
        VideoData::PlaneInfo dst;

        if (pSrc->GetPlaneInfo(&src, i) || pDst->GetPlaneInfo(&dst,i))
            return UMC_ERR_NOT_IMPLEMENTED;

        if (src.m_ippSize.width != dst.m_ippSize.width)
            return UMC_ERR_NOT_ENOUGH_BUFFER;
        if (src.m_ippSize.height != dst.m_ippSize.height)
            return UMC_ERR_NOT_ENOUGH_BUFFER;
        if (src.m_iSampleSize != dst.m_iSampleSize)
            return UMC_ERR_NOT_ENOUGH_BUFFER;
        if (src.m_iSamples != dst.m_iSamples)
            return UMC_ERR_NOT_ENOUGH_BUFFER;

        Ipp8u* pSrcPlane = src.m_pPlane;
        Ipp8u* pDstPlane = dst.m_pPlane;

        int size = src.m_ippSize.width * src.m_iSamples;
        for (int i=src.m_ippSize.height;--i>=0;) {
            memcpy(pDstPlane,pSrcPlane,size);
            pSrcPlane += src.m_nPitch;
            pDstPlane += dst.m_nPitch;
        }
    }
    return UMC_OK;
}

namespace UMC
{
BaseCodec* createVideoProcessing()
{
    return new MyVideoProcessing();
}
};


/**********************************************************************
ippiCopy_8u_C1R
ippiCopy8x8HP_8u_C1R
ippiSpatialInterpolation_H263_8u_C1R
ippiUpsampleFour_H263_8u_C1R
ippiDownsampleFour_H263_8u_C1R
ippiResample_H263_8u_P3R
ippiFilterDeblocking8x8HorEdge_H263_8u_C1IR
ippiAdd8x8HP_16s8u_C1RS
ippiDCT8x8Inv_16s_C1I
ippiDCT8x8Inv_4x4_16s_C1I
ippiDCT8x8Inv_2x2_16s_C1I
ippiScanInv_16s_C1
ippiQuantInvInter_H263_16s_C1I
ippiDecodeCoeffsIntra_H263_1u16s
ippiDecodeCoeffsInter_H263_1u16s
ippiReconstructCoeffsInter_H263_1u16s
ippiAddBackPredPB_H263_8u_C1R
ippiCopy16x16HP_8u_C1R
ippiDCT8x8Inv_16s8u_C1R
ippiReconstructCoeffsIntra_H263_1u16s
ippiAdd8x8_16s8u_C1IRS
ippiOBMC8x8HP_MPEG4_8u_C1R
ippiFilterDeblocking8x8VerEdge_H263_8u_C1IR
ippiSqrDiff16x16_8u32s
ippiSSD8x8_8u32s_C1R
ippiDCT8x8Fwd_8u16s_C1R
ippiQuantIntra_H263_16s_C1I
ippiDCT8x8Fwd_16s_C1I
ippiSubSAD8x8_8u16s_C1R
ippiEncodeDCIntra_H263_16s1u
ippiEncodeCoeffsIntra_H263_16s1u
ippiEncodeCoeffsInter_H263_16s1u
ippiQuantInvIntra_H263_16s_C1I
ippiSAD16x16_8u32s
ippiSAD8x8_8u32s_C1R
ippiMeanAbsDev16x16_8u32s_C1R
*/
#if 0
extern "C" IppStatus __STDCALL ippiSAD8x8_8u32s_C1R(
    const Ipp8u* pSrcCur, int srcCurStep, 
    const Ipp8u* pSrcRef, int srcRefStep,
    Ipp32s* pDst, Ipp32s  mcType);
#endif

#define avg2(a,b)   ((a+b+RND)>>1)
#define avg4(a,b,c,d) ((a+b+c+d+RND)>>2)
//#define avg4x(a,b,c,d) ((a+b+c+d+1)>>2)

inline Ipp8u mb(Ipp16s v) 
{
    if (v<0) return 0;
    else if (v > 255) return 255;
    else return Ipp8u(v);
}

extern "C" IppStatus __STDCALL XippiSAD8x8_8u32s_C1R(const Ipp8u* pSrcCur, int srcCurStep, const Ipp8u* pSrcRef, int srcRefStep, Ipp32s* pDst, Ipp32s  mcType)
{
    if (!pSrcCur || !pSrcRef || !pDst) 
        return ippStsBadArgErr;

    int s =0;
    int i;
    const Ipp8u* p1 = (const Ipp8u*) pSrcCur;
    const Ipp8u* p2 = (const Ipp8u*) pSrcRef;
    const Ipp8u* p3;
    int d1 = srcCurStep;
    int d2 = srcRefStep;
    int RND = 1;
    
    switch (mcType) {
    case IPPVC_MC_APX_FF:
        for (i=0;i<8;++i) {
            s += abs(p1[0]-p2[0]);
            s += abs(p1[1]-p2[1]);
            s += abs(p1[2]-p2[2]);
            s += abs(p1[3]-p2[3]);
            s += abs(p1[4]-p2[4]);
            s += abs(p1[5]-p2[5]);
            s += abs(p1[6]-p2[6]);
            s += abs(p1[7]-p2[7]);
            p1 += d1;
            p2 += d2;
        }
        break;
    case IPPVC_MC_APX_FH:
        p3 = p2 + d2;
        for(i=0;i<8;i++) {
            s += abs(p1[0] - avg2(p2[0], p3[0]));
            s += abs(p1[1] - avg2(p2[1], p3[1]));
            s += abs(p1[2] - avg2(p2[2], p3[2]));
            s += abs(p1[3] - avg2(p2[3], p3[3]));
            s += abs(p1[4] - avg2(p2[4], p3[4]));
            s += abs(p1[5] - avg2(p2[5], p3[5]));
            s += abs(p1[6] - avg2(p2[6], p3[6]));
            s += abs(p1[7] - avg2(p2[7], p3[7]));
            p1 += d1;
            p2 += d2;
            p3 += d2;
        }
        break;
    case  IPPVC_MC_APX_HF:
        for(i=0;i<8;i++) {
            s += abs(p1[0] - avg2(p2[0], p2[1]));
            s += abs(p1[1] - avg2(p2[1], p2[2]));
            s += abs(p1[2] - avg2(p2[2], p2[3])); 
            s += abs(p1[3] - avg2(p2[3], p2[4])); 
            s += abs(p1[4] - avg2(p2[4], p2[5]));
            s += abs(p1[5] - avg2(p2[5], p2[6])); 
            s += abs(p1[6] - avg2(p2[6], p2[7]));
            s += abs(p1[7] - avg2(p2[7], p2[8]));
            p1 += d1;
            p2 += d2;
        }
        break;
    case IPPVC_MC_APX_HH:
        p3 = p2 + d2;
        for(i=0;i<8;i++) {
            s += abs(p1[0] - avg4(p2[0], p2[1], p3[0], p3[1]));
            s += abs(p1[1] - avg4(p2[1], p2[2], p3[1], p3[2]));
            s += abs(p1[2] - avg4(p2[2], p2[3], p3[2], p3[3]));
            s += abs(p1[3] - avg4(p2[3], p2[4], p3[3], p3[4]));
            s += abs(p1[4] - avg4(p2[4], p2[5], p3[4], p3[5]));
            s += abs(p1[5] - avg4(p2[5], p2[6], p3[5], p3[6]));
            s += abs(p1[6] - avg4(p2[6], p2[7], p3[6], p3[7]));
            s += abs(p1[7] - avg4(p2[7], p2[8], p3[7], p3[8]));
            p1 += d1;
            p2 += d2;
            p3 += d2;
        }

        break;
    }


#ifdef DEBUG_IPP
    ippiSAD8x8_8u32s_C1R(pSrcCur, srcCurStep, pSrcRef, srcRefStep, pDst, mcType);
    if (*pDst != s)
        s = *pDst;
#endif

    *pDst = s;
    return ippStsNoErr;
}

extern "C" IppStatus __STDCALL ippiSAD16x16_8u32s(
    const Ipp8u* pSrcCur, int srcCurStep, 
    const Ipp8u* pSrcRef, int srcRefStep,
    Ipp32s* pDst, Ipp32s  mcType);

extern "C" IppStatus __STDCALL XippiSAD16x16_8u32s(
        const Ipp8u* pSrcCur, int srcCurStep, 
        const Ipp8u* pSrcRef, int srcRefStep,
        Ipp32s* pDst, Ipp32s  mcType)
{
    if (!pSrcCur || !pSrcRef || !pDst) 
        return ippStsBadArgErr;

    int s =0;
    int i;
    const Ipp8u* p1 = (const Ipp8u*) pSrcCur;
    const Ipp8u* p2 = (const Ipp8u*) pSrcRef;
    const Ipp8u* p3;
    int d1 = srcCurStep;
    int d2 = srcRefStep;
    int RND=1;
   
    switch (mcType) {
    case IPPVC_MC_APX_FF:
        for (i=0;i<16;++i) {
            s += abs(p1[0]-p2[0]);
            s += abs(p1[1]-p2[1]);
            s += abs(p1[2]-p2[2]);
            s += abs(p1[3]-p2[3]);
            s += abs(p1[4]-p2[4]);
            s += abs(p1[5]-p2[5]);
            s += abs(p1[6]-p2[6]);
            s += abs(p1[7]-p2[7]);
            s += abs(p1[8]-p2[8]);
            s += abs(p1[9]-p2[9]);
            s += abs(p1[10]-p2[10]);
            s += abs(p1[11]-p2[11]);
            s += abs(p1[12]-p2[12]);
            s += abs(p1[13]-p2[13]);
            s += abs(p1[14]-p2[14]);
            s += abs(p1[15]-p2[15]);
            p1 += d1;
            p2 += d2;
        }
        break;
    case IPPVC_MC_APX_FH:
        p3 = p2 + d2;
        for(i=0;i<16;i++) {
            s += abs(p1[0] - avg2(p2[0], p3[0]));
            s += abs(p1[1] - avg2(p2[1], p3[1]));
            s += abs(p1[2] - avg2(p2[2], p3[2]));
            s += abs(p1[3] - avg2(p2[3], p3[3]));
            s += abs(p1[4] - avg2(p2[4], p3[4]));
            s += abs(p1[5] - avg2(p2[5], p3[5]));
            s += abs(p1[6] - avg2(p2[6], p3[6]));
            s += abs(p1[7] - avg2(p2[7], p3[7]));
            s += abs(p1[8] - avg2(p2[8], p3[8]));
            s += abs(p1[9] - avg2(p2[9], p3[9]));
            s += abs(p1[10] - avg2(p2[10], p3[10]));
            s += abs(p1[11] - avg2(p2[11], p3[11]));
            s += abs(p1[12] - avg2(p2[12], p3[12]));
            s += abs(p1[13] - avg2(p2[13], p3[13]));
            s += abs(p1[14] - avg2(p2[14], p3[14]));
            s += abs(p1[15] - avg2(p2[15], p3[15]));
            p1 += d1;
            p2 += d2;
            p3 += d2;
        }
        break;
    case  IPPVC_MC_APX_HF:
        for(i=0;i<16;i++) {
            s += abs(p1[0] - avg2(p2[0], p2[1]));
            s += abs(p1[1] - avg2(p2[1], p2[2]));
            s += abs(p1[2] - avg2(p2[2], p2[3])); 
            s += abs(p1[3] - avg2(p2[3], p2[4])); 
            s += abs(p1[4] - avg2(p2[4], p2[5]));
            s += abs(p1[5] - avg2(p2[5], p2[6])); 
            s += abs(p1[6] - avg2(p2[6], p2[7]));
            s += abs(p1[7] - avg2(p2[7], p2[8]));
            s += abs(p1[8] - avg2(p2[8], p2[9]));
            s += abs(p1[9] - avg2(p2[9], p2[10]));
            s += abs(p1[10] - avg2(p2[10], p2[11])); 
            s += abs(p1[11] - avg2(p2[11], p2[12])); 
            s += abs(p1[12] - avg2(p2[12], p2[13]));
            s += abs(p1[13] - avg2(p2[13], p2[14])); 
            s += abs(p1[14] - avg2(p2[14], p2[15]));
            s += abs(p1[15] - avg2(p2[15], p2[16]));
            p1 += d1;
            p2 += d2;
        }
        break;
    case IPPVC_MC_APX_HH:
        p3 = p2 + d2;
        for(i=0;i<16;i++) {
            RND=2;
            s += abs(p1[0] - avg4(p2[0], p2[1], p3[0], p3[1]));
            s += abs(p1[1] - avg4(p2[1], p2[2], p3[1], p3[2]));
            s += abs(p1[2] - avg4(p2[2], p2[3], p3[2], p3[3]));
            s += abs(p1[3] - avg4(p2[3], p2[4], p3[3], p3[4]));
            s += abs(p1[4] - avg4(p2[4], p2[5], p3[4], p3[5]));
            s += abs(p1[5] - avg4(p2[5], p2[6], p3[5], p3[6]));
            s += abs(p1[6] - avg4(p2[6], p2[7], p3[6], p3[7]));
            s += abs(p1[7] - avg4(p2[7], p2[8], p3[7], p3[8]));
            s += abs(p1[8] - avg4(p2[8], p2[9], p3[8], p3[9]));
            s += abs(p1[9] - avg4(p2[9], p2[10], p3[9], p3[10]));
            s += abs(p1[10] - avg4(p2[10], p2[11], p3[10], p3[11]));
            s += abs(p1[11] - avg4(p2[11], p2[12], p3[11], p3[12]));
            s += abs(p1[12] - avg4(p2[12], p2[13], p3[12], p3[13]));
            s += abs(p1[13] - avg4(p2[13], p2[14], p3[13], p3[14]));
            s += abs(p1[14] - avg4(p2[14], p2[15], p3[14], p3[15]));
            s += abs(p1[15] - avg4(p2[15], p2[16], p3[15], p3[16]));
            p1 += d1;
            p2 += d2;
            p3 += d2;
        }

        break;
    }


#ifdef DEBUG_IPP
    ippiSAD16x16_8u32s(pSrcCur, srcCurStep, pSrcRef, srcRefStep, pDst, mcType);
    if (*pDst != s)
        s = *pDst;
#endif

    *pDst = s;
    return ippStsNoErr;
}

extern "C" IppStatus __STDCALL ippiCopy8x8HP_8u_C1R(const Ipp8u* pSrc, int srcStep, Ipp8u* pDst, int dstStep, int acc, int rounding);

extern "C" IppStatus __STDCALL XippiCopy8x8HP_8u_C1R(const Ipp8u* pSrc, int srcStep, Ipp8u* pDst, int dstStep, int acc, int rounding)
{
    register int i;
    const Ipp8u* pi = pSrc;
    const Ipp8u* p3;
    Ipp8u* po = pDst;
    int RND = (rounding&1)^1;

    switch (acc&3) {
    case 0:
        for (i=0;i<8;++i) {
            po[ 0] = pi[ 0];
            po[ 1] = pi[ 1];
            po[ 2] = pi[ 2];
            po[ 3] = pi[ 3];
            po[ 4] = pi[ 4];
            po[ 5] = pi[ 5];
            po[ 6] = pi[ 6];
            po[ 7] = pi[ 7];
            pi += srcStep;
            po += dstStep;
        }
        break;
    case 1:
        for(i=0;i<8;i++) {
            po[ 0] = avg2(pi[ 0], pi[ 1]);
            po[ 1] = avg2(pi[ 1], pi[ 2]);
            po[ 2] = avg2(pi[ 2], pi[ 3]);
            po[ 3] = avg2(pi[ 3], pi[ 4]);
            po[ 4] = avg2(pi[ 4], pi[ 5]);
            po[ 5] = avg2(pi[ 5], pi[ 6]);
            po[ 6] = avg2(pi[ 6], pi[ 7]);
            po[ 7] = avg2(pi[ 7], pi[ 8]);
            pi += srcStep;
            po += dstStep;
        }
        break;
    case 2:
        p3 = pi + srcStep;
        for(i=0;i<8;i++) {
            po[ 0] = avg2(pi[ 0], p3[ 0]);
            po[ 1] = avg2(pi[ 1], p3[ 1]);
            po[ 2] = avg2(pi[ 2], p3[ 2]);
            po[ 3] = avg2(pi[ 3], p3[ 3]);
            po[ 4] = avg2(pi[ 4], p3[ 4]);
            po[ 5] = avg2(pi[ 5], p3[ 5]);
            po[ 6] = avg2(pi[ 6], p3[ 6]);
            po[ 7] = avg2(pi[ 7], p3[ 7]);
            po += dstStep;
            pi += srcStep;
            p3 += srcStep;
        }
        break;
    case 3:
        RND += 1;
        p3 = pi + srcStep;
        for(i=0;i<8;i++) {
            po[ 0] = avg4(pi[ 0], pi[ 1], p3[ 0], p3[ 1]);
            po[ 1] = avg4(pi[ 1], pi[ 2], p3[ 1], p3[ 2]);
            po[ 2] = avg4(pi[ 2], pi[ 3], p3[ 2], p3[ 3]);
            po[ 3] = avg4(pi[ 3], pi[ 4], p3[ 3], p3[ 4]);
            po[ 4] = avg4(pi[ 4], pi[ 5], p3[ 4], p3[ 5]);
            po[ 5] = avg4(pi[ 5], pi[ 6], p3[ 5], p3[ 6]);
            po[ 6] = avg4(pi[ 6], pi[ 7], p3[ 6], p3[ 7]);
            po[ 7] = avg4(pi[ 7], pi[ 8], p3[ 7], p3[ 8]);
            po += dstStep;
            pi += srcStep;
            p3 += srcStep;
        }
        break;
    }

#ifdef DEBUG_IPP
    Ipp8u  oTest[8*8];
    ippiCopy8x8HP_8u_C1R(pSrc, srcStep, oTest, 8, acc, rounding);

    Ipp8u* pt = oTest;
    int iErr=0;
    for (int j=0;j<8;++j) {
        po = pDst + j*dstStep;
        for (int i=0;i<8;++i,++pt,++po) {
            if (*pt != *po)
                ++iErr;
        }
    }
    assert( iErr == 0);
    if (iErr)
        return ippiCopy8x8HP_8u_C1R(pSrc, srcStep, pDst, dstStep, acc, rounding);
#endif

    return ippStsNoErr;
}


extern "C" IppStatus __STDCALL ippiCopy16x16HP_8u_C1R(
    const Ipp8u* pSrc, int srcStep,
    Ipp8u* pDst,  int dstStep,
    int acc, int rounding);

extern "C" IppStatus __STDCALL XippiCopy16x16HP_8u_C1R(
    const Ipp8u* pSrc, int srcStep,
    Ipp8u* pDst,  int dstStep,
    int acc, int rounding)
{
    register int i;
    const Ipp8u* pi = pSrc;
    const Ipp8u* p3;
    Ipp8u* po = pDst;
    int RND = (rounding&1)^1;

    switch (acc&3) {
    case 0:
        for (i=0;i<16;++i) {
            po[ 0] = pi[ 0];
            po[ 1] = pi[ 1];
            po[ 2] = pi[ 2];
            po[ 3] = pi[ 3];
            po[ 4] = pi[ 4];
            po[ 5] = pi[ 5];
            po[ 6] = pi[ 6];
            po[ 7] = pi[ 7];
            po[ 8] = pi[ 8];
            po[ 9] = pi[ 9];
            po[10] = pi[10];
            po[11] = pi[11];
            po[12] = pi[12];
            po[13] = pi[13];
            po[14] = pi[14];
            po[15] = pi[15];
            pi += srcStep;
            po += dstStep;
        }
        break;
    case 1:
        for(i=0;i<16;i++) {
            po[ 0] = avg2(pi[ 0], pi[ 1]);
            po[ 1] = avg2(pi[ 1], pi[ 2]);
            po[ 2] = avg2(pi[ 2], pi[ 3]);
            po[ 3] = avg2(pi[ 3], pi[ 4]);
            po[ 4] = avg2(pi[ 4], pi[ 5]);
            po[ 5] = avg2(pi[ 5], pi[ 6]);
            po[ 6] = avg2(pi[ 6], pi[ 7]);
            po[ 7] = avg2(pi[ 7], pi[ 8]);
            po[ 8] = avg2(pi[ 8], pi[ 9]);
            po[ 9] = avg2(pi[ 9], pi[10]);
            po[10] = avg2(pi[10], pi[11]);
            po[11] = avg2(pi[11], pi[12]);
            po[12] = avg2(pi[12], pi[13]);
            po[13] = avg2(pi[13], pi[14]);
            po[14] = avg2(pi[14], pi[15]);
            po[15] = avg2(pi[15], pi[16]);
            pi += srcStep;
            po += dstStep;
        }
        break;
    case 2:
        p3 = pi + srcStep;
        for(i=0;i<16;i++) {
            po[ 0] = avg2(pi[ 0], p3[ 0]);
            po[ 1] = avg2(pi[ 1], p3[ 1]);
            po[ 2] = avg2(pi[ 2], p3[ 2]);
            po[ 3] = avg2(pi[ 3], p3[ 3]);
            po[ 4] = avg2(pi[ 4], p3[ 4]);
            po[ 5] = avg2(pi[ 5], p3[ 5]);
            po[ 6] = avg2(pi[ 6], p3[ 6]);
            po[ 7] = avg2(pi[ 7], p3[ 7]);
            po[ 8] = avg2(pi[ 8], p3[ 8]);
            po[ 9] = avg2(pi[ 9], p3[ 9]);
            po[10] = avg2(pi[10], p3[10]);
            po[11] = avg2(pi[11], p3[11]);
            po[12] = avg2(pi[12], p3[12]);
            po[13] = avg2(pi[13], p3[13]);
            po[14] = avg2(pi[14], p3[14]);
            po[15] = avg2(pi[15], p3[15]);
            po += dstStep;
            pi += srcStep;
            p3 += srcStep;
        }
        break;
    case 3:
        RND += 1;
        p3 = pi + srcStep;
        for(i=0;i<16;i++) {
            po[ 0] = avg4(pi[ 0], pi[ 1], p3[ 0], p3[ 1]);
            po[ 1] = avg4(pi[ 1], pi[ 2], p3[ 1], p3[ 2]);
            po[ 2] = avg4(pi[ 2], pi[ 3], p3[ 2], p3[ 3]);
            po[ 3] = avg4(pi[ 3], pi[ 4], p3[ 3], p3[ 4]);
            po[ 4] = avg4(pi[ 4], pi[ 5], p3[ 4], p3[ 5]);
            po[ 5] = avg4(pi[ 5], pi[ 6], p3[ 5], p3[ 6]);
            po[ 6] = avg4(pi[ 6], pi[ 7], p3[ 6], p3[ 7]);
            po[ 7] = avg4(pi[ 7], pi[ 8], p3[ 7], p3[ 8]);
            po[ 8] = avg4(pi[ 8], pi[ 9], p3[ 8], p3[ 9]);
            po[ 9] = avg4(pi[ 9], pi[10], p3[ 9], p3[10]);
            po[10] = avg4(pi[10], pi[11], p3[10], p3[11]);
            po[11] = avg4(pi[11], pi[12], p3[11], p3[12]);
            po[12] = avg4(pi[12], pi[13], p3[12], p3[13]);
            po[13] = avg4(pi[13], pi[14], p3[13], p3[14]);
            po[14] = avg4(pi[14], pi[15], p3[14], p3[15]);
            po[15] = avg4(pi[15], pi[16], p3[15], p3[16]);
            po += dstStep;
            pi += srcStep;
            p3 += srcStep;
        }
        break;
    }

#ifdef DEBUG_IPP
    Ipp8u  oTest[16*16];
    ippiCopy16x16HP_8u_C1R(pSrc, srcStep, oTest, 16, acc, rounding);

    Ipp8u* pt = oTest;
    int iErr=0;

    for (int j=0;j<16;++j) {
        po = pDst + j*dstStep;
        for (int i=0;i<16;++i,++pt,++po) {
            if (*pt != *po)
                ++iErr;
        }
    }

    if (iErr)
        return ippiCopy16x16HP_8u_C1R(pSrc, srcStep, pDst, dstStep, acc, rounding);
#endif

    return ippStsNoErr;
}


extern "C" IppStatus __STDCALL ippiAdd8x8HP_16s8u_C1RS(const Ipp16s* pSrc1, int src1Step, Ipp8u* pSrc2, int src2Step, Ipp8u* pDst, int dstStep, int acc, int rounding);


static int sTestCode = 2;
extern "C" IppStatus __STDCALL XippiAdd8x8HP_16s8u_C1RS(const Ipp16s* pSrc1, int src1Step, Ipp8u* pSrc2, int src2Step, Ipp8u* pDst, int dstStep, int acc, int rounding)
{

    register int i;
    Ipp8u* p0 = pDst;          int d0 = dstStep;
    const Ipp16s* p1 = pSrc1;  int d1 = src1Step/2;
    const Ipp8u*  p2 = pSrc2;  int d2 = src2Step;
    const Ipp8u*  p3;

    int RND = (rounding&1)^1;


    switch (acc) {
    case 0:
        for (i=0;i<8;++i) {
            p0[ 0] = mb( p1[ 0] + p2[ 0]);
            p0[ 1] = mb( p1[ 1] + p2[ 1]);
            p0[ 2] = mb( p1[ 2] + p2[ 2]);
            p0[ 3] = mb( p1[ 3] + p2[ 3]);
            p0[ 4] = mb( p1[ 4] + p2[ 4]);
            p0[ 5] = mb( p1[ 5] + p2[ 5]);
            p0[ 6] = mb( p1[ 6] + p2[ 6]);
            p0[ 7] = mb( p1[ 7] + p2[ 7]);
            p0 += d0;
            p1 += d1;
            p2 += d2;
        }
        break;
    case 1:
        for(i=0;i<8;i++) {
            p0[ 0] = mb( p1[ 0] + avg2(p2[ 0], p2[ 1]));
            p0[ 1] = mb( p1[ 1] + avg2(p2[ 1], p2[ 2]));
            p0[ 2] = mb( p1[ 2] + avg2(p2[ 2], p2[ 3]));
            p0[ 3] = mb( p1[ 3] + avg2(p2[ 3], p2[ 4]));
            p0[ 4] = mb( p1[ 4] + avg2(p2[ 4], p2[ 5]));
            p0[ 5] = mb( p1[ 5] + avg2(p2[ 5], p2[ 6]));
            p0[ 6] = mb( p1[ 6] + avg2(p2[ 6], p2[ 7]));
            p0[ 7] = mb( p1[ 7] + avg2(p2[ 7], p2[ 8]));
            p0 += d0;
            p1 += d1;
            p2 += d2;
        }
        break;
    case 2:
        p3 = p2 + d2;
        for(i=0;i<8;i++) {
            p0[ 0] = mb( p1[ 0] + avg2(p2[ 0], p3[ 0]));
            p0[ 1] = mb( p1[ 1] + avg2(p2[ 1], p3[ 1]));
            p0[ 2] = mb( p1[ 2] + avg2(p2[ 2], p3[ 2]));
            p0[ 3] = mb( p1[ 3] + avg2(p2[ 3], p3[ 3]));
            p0[ 4] = mb( p1[ 4] + avg2(p2[ 4], p3[ 4]));
            p0[ 5] = mb( p1[ 5] + avg2(p2[ 5], p3[ 5]));
            p0[ 6] = mb( p1[ 6] + avg2(p2[ 6], p3[ 6]));
            p0[ 7] = mb( p1[ 7] + avg2(p2[ 7], p3[ 7]));
            p0 += d0;
            p1 += d1;
            p2 += d2;
            p3 += d2;
        }
        break;
    case 3:
        RND += 1;
        p3 = p2 + d2;
        for(i=0;i<8;i++) {
            p0[ 0] = mb( p1[ 0] + avg4(p2[ 0], p2[ 1], p3[ 0], p3[ 1]));
            p0[ 1] = mb( p1[ 1] + avg4(p2[ 1], p2[ 2], p3[ 1], p3[ 2]));
            p0[ 2] = mb( p1[ 2] + avg4(p2[ 2], p2[ 3], p3[ 2], p3[ 3]));
            p0[ 3] = mb( p1[ 3] + avg4(p2[ 3], p2[ 4], p3[ 3], p3[ 4]));
            p0[ 4] = mb( p1[ 4] + avg4(p2[ 4], p2[ 5], p3[ 4], p3[ 5]));
            p0[ 5] = mb( p1[ 5] + avg4(p2[ 5], p2[ 6], p3[ 5], p3[ 6]));
            p0[ 6] = mb( p1[ 6] + avg4(p2[ 6], p2[ 7], p3[ 6], p3[ 7]));
            p0[ 7] = mb( p1[ 7] + avg4(p2[ 7], p2[ 8], p3[ 7], p3[ 8]));
            p0 += d0;
            p1 += d1;
            p2 += d2;
            p3 += d2;
        }
        break;
    }

#ifdef DEBUG_IPP
    Ipp8u oTest[8*8];
    ippiAdd8x8HP_16s8u_C1RS(pSrc1, src1Step, pSrc2, src2Step, oTest, 8, acc, rounding);

    Ipp8u* pt = oTest;
    int iErr=0;
    for (int j=0;j<8;++j) {
        p0 = pDst + j*dstStep;
        for (int i=0;i<8;++i,++pt,++p0) {
            if (*pt != *p0)
                ++iErr;
        }
    }
#endif

    return ippStsNoErr;
}

