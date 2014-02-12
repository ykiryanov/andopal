/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#include "umc_h264_dec_defs_yuv.h"
#include "ippvc.h"

inline void Set_Temp(Ipp8u val, Ipp8u* pDst, Ipp32s len)
{
    XippsSet_8u(val, pDst, len);
}

inline void Set_Temp(Ipp16u val, Ipp16u* pDst, Ipp32s len)
{
    ippsSet_16s(val, (Ipp16s *)pDst, len);
}


template<typename T>
inline IppStatus ippiExpandPlane_H264(T StartPtr,
                               Ipp32u uFrameWidth,
                               Ipp32u uFrameHeight,
                               Ipp32u uPitch,
                               Ipp32u uPels,
                               IppvcFrameFieldFlag uFrameFieldFlag)
{
    Ipp32u i;
    T pSrcDst;

    /* check error(s) */
    if ((uFrameHeight & 1) || (2 > uFrameHeight))
        return ippStsSizeErr;

    if (0 == uFrameWidth)
        return ippStsSizeErr;
    if (0 == uPels)
        return ippStsNoErr;

    switch (uFrameFieldFlag)
    {
    case IPPVC_FRAME:
        /* Area (2) - sides */
        pSrcDst = StartPtr;

        for (i = 0; i < uFrameHeight; i += 1)
        {
            /* set left site */
            Set_Temp(pSrcDst[0], pSrcDst - uPels, uPels);
            /* set right site */
            Set_Temp(pSrcDst[uFrameWidth - 1], pSrcDst + uFrameWidth, uPels);
            pSrcDst  += uPitch;
        }
        break;

    case IPPVC_TOP_FIELD:

        /* Area (2) - sides */
        pSrcDst = StartPtr;

        for (i = 0; i < (uFrameHeight>>1); i++)
        {
            /* set left site */
            Set_Temp(pSrcDst[0], pSrcDst - uPels, uPels);
            /* set right site */
            Set_Temp(pSrcDst[uFrameWidth - 1], pSrcDst + uFrameWidth, uPels);
            pSrcDst  += uPitch * 2;
        }
        break;

    case IPPVC_BOTTOM_FIELD:

        /* Area (2) - sides */
        pSrcDst = StartPtr + uPitch;

        for (i = 0; i < (uFrameHeight>>1); i++)
        {
            /* set left site */
            Set_Temp(pSrcDst[0], pSrcDst - uPels, uPels);
            /* set right site */
            Set_Temp(pSrcDst[uFrameWidth - 1], pSrcDst + uFrameWidth, uPels);
            pSrcDst  += uPitch * 2;
        }
        break;

    default:
        return ippStsBadArgErr;
    }

    return ippStsNoErr;

} /* IPPFUN(IppStatus, ExpandPlane, (Ipp8u *StartPtr, */

namespace UMC
{

H264DecYUVBufferPadded::H264DecYUVBufferPadded(MemoryAllocator *pMemoryAllocator)
    : m_pAllocatedBuffer(0)
    , m_allocatedSize(0)
    , m_pBuffer(0)
    , m_pitch_luma(0)
    , m_pitch_chroma(0)
    , m_bpp(8)
    , m_chroma_format(0)
    , m_pYPlane(0)
    , m_pUPlane(0)
    , m_pVPlane(0)
    , m_is_external_memory(false)
{
    m_lumaSize.width = 0;
    m_lumaSize.height = 0;

    m_chromaSize.width = 0;
    m_chromaSize.height = 0;

    m_pMemoryAllocator = pMemoryAllocator;
    m_midAllocatedBuffer = 0;
}

H264DecYUVBufferPadded::~H264DecYUVBufferPadded()
{
    deallocate();
}

void H264DecYUVBufferPadded::deallocate()
{
    m_allocatedSize = 0;
    m_pBuffer = 0;
    clear();

    m_lumaSize.width = 0;
    m_lumaSize.height = 0;
    m_pitch_luma = 0;
    m_pitch_chroma = 0;

    if (m_pAllocatedBuffer)
    {
        m_pMemoryAllocator->Unlock(m_midAllocatedBuffer);
        m_pMemoryAllocator->Free(m_midAllocatedBuffer);
        m_pAllocatedBuffer = 0;
        m_midAllocatedBuffer = 0;
    }
}

void H264DecYUVBufferPadded::conditionalDeallocate(const IppiSize &dim, Ipp32s bpp, Ipp32s chroma_format)
{
    if (dim.width != lumaSize().width ||
        dim.height != lumaSize().height ||
        m_bpp != bpp || m_chroma_format!=chroma_format)
        deallocate();
}

#define SEPARATE_CHROMA
enum
{
    DATA_ALIGN                  = 64,
#ifdef SEPARATE_CHROMA
    LUMA_PADDING                = 0, //YUV_Y_PADDING,
    CHROMA_PADDING              = 0//YUV_UV_PADDING
#else
    LUMA_PADDING                = YUV_Y_PADDING,
    CHROMA_PADDING              = YUV_UV_PADDING
#endif
};

Status H264DecYUVBufferPadded::allocate(const IppiSize &lumaSize, Ipp32s bpp, Ipp32s chroma_format)
{
    Ipp32u newSize;
    Ipp32s nPitchLuma, nPitchChroma;

    if (bpp < 8 || bpp > 16)
        return UMC_ERR_UNSUPPORTED;

    if (chroma_format > 3)
        return UMC_ERR_INVALID_STREAM;

    static Ipp32s chroma_height_mult[] =   {1,1,2,4};
    static Ipp32s chroma_width_mult[]  =   {1,1,1,2};

    Ipp32s pixel_sz = (bpp > 8) + 1;

    // Y plane dimensions better be even, so width/2 correctly gives U,V size
    // YUV_ALIGNMENT must be a power of 2.  Since this is unlikely to change,
    // and since checking for a power of 2 is painful, let's just put a simple
    // VM_ASSERT here, that can be updated as needed for other powers of 2.

    nPitchLuma = align_value<Ipp32u> (lumaSize.width + LUMA_PADDING * 2, DATA_ALIGN);
    //nPitchLuma |= 0x040;

#ifdef SEPARATE_CHROMA
    switch (chroma_format)
    {
    case 0:
        //nPitchChroma = 0;
        nPitchChroma = nPitchLuma >> 1;
        break;
    case 1:
    case 2:
        nPitchChroma = nPitchLuma >> 1;
        break;
    case 3:
        nPitchChroma = nPitchLuma;
        break;
    default:
        VM_ASSERT(false);
        nPitchChroma = 0;
    }

    //nPitchChroma |= 0x040;

    newSize = nPitchLuma * lumaSize.height +
        nPitchChroma * (lumaSize.height*chroma_height_mult[chroma_format]);
        //nPitchChroma * (lumaSize.height*chroma_height_mult[chroma_format] / 2);
#else
    nPitchChroma = nPitchLuma;

    newSize = nPitchLuma * lumaSize.height +
        nPitchChroma * (lumaSize.height*chroma_height_mult[chroma_format] / 2) + nPitchLuma;
#endif

    Ipp32u sz = IPP_MAX(1, newSize + DATA_ALIGN * 2)*pixel_sz;

    if (sz == m_allocatedSize &&
        m_pitch_luma == nPitchLuma &&
        m_pitch_chroma == nPitchChroma &&
        m_bpp == bpp &&
        m_chroma_format == chroma_format
        || m_is_external_memory)
        return UMC_OK;

    if (m_pAllocatedBuffer)
    {
        m_pMemoryAllocator->Unlock(m_midAllocatedBuffer);
        m_pMemoryAllocator->Free(m_midAllocatedBuffer);
        m_pAllocatedBuffer = 0;
        m_midAllocatedBuffer = 0;
    }

    if (UMC_OK != m_pMemoryAllocator->Alloc(&m_midAllocatedBuffer,
                                            sz,
                                            UMC_ALLOC_PERSISTENT))
    {
        // Reset all our state variables
        deallocate();
        return UMC_ERR_ALLOC;
    }
    m_pAllocatedBuffer = (Ipp8u *) m_pMemoryAllocator->Lock(m_midAllocatedBuffer);

    m_allocatedSize = sz;
    m_bpp = bpp;
    m_chroma_format = chroma_format;
    m_lumaSize = lumaSize;
    m_chromaSize.width = lumaSize.width >> ((Ipp32s) (3 > chroma_format));
    m_chromaSize.height = lumaSize.height >> ((Ipp32s) (2 > chroma_format));
    m_pitch_luma = nPitchLuma;
    m_pitch_chroma = nPitchChroma;

    if (pixel_sz == 1)
    {
        //update typical pointers as well
        m_pYPlane = align_pointer<UMC::PlanePtrYCommon> ((UMC::PlanePtrYCommon)m_pAllocatedBuffer + LUMA_PADDING, DATA_ALIGN);
        m_pUPlane = align_pointer<UMC::PlanePtrUVCommon> ((UMC::PlanePtrUVCommon)m_pYPlane + CHROMA_PADDING * chroma_width_mult[chroma_format] +
                nPitchLuma * lumaSize.height, DATA_ALIGN);

#ifdef SEPARATE_CHROMA
        m_pVPlane = align_pointer<UMC::PlanePtrUVCommon> ((UMC::PlanePtrUVCommon)m_pUPlane + (nPitchChroma * (m_chromaSize.height)), DATA_ALIGN);
#else
        if (chroma_format==3)
            m_pVPlane = align_pointer<UMC::PlanePtrUVCommon> ((UMC::PlanePtrUVCommon)m_pUPlane + (nPitchChroma * (m_lumaSize.height)), DATA_ALIGN);
        else
            m_pVPlane = (UMC::PlanePtrUVCommon)m_pUPlane + nPitchChroma / 2;
#endif
    }
    else
    {
        //update typical pointers as well
        m_pYPlane = (Ipp8u*)align_pointer<Ipp16u*> ((Ipp16u*)m_pAllocatedBuffer + LUMA_PADDING, DATA_ALIGN);
        m_pUPlane = (Ipp8u*)align_pointer<Ipp16u*> ((Ipp16u*)m_pYPlane + CHROMA_PADDING * chroma_width_mult[chroma_format] +
                nPitchLuma * lumaSize.height, DATA_ALIGN);

#ifdef SEPARATE_CHROMA
        m_pVPlane = (Ipp8u*)align_pointer<Ipp16u*> ((Ipp16u*)m_pUPlane + (nPitchChroma * (m_chromaSize.height)), DATA_ALIGN);
#else
        if (chroma_format==3)
            m_pVPlane = (Ipp8u*)align_pointer<Ipp16u*> ((Ipp16u*)m_pUPlane + (nPitchChroma * (m_lumaSize.height)), DATA_ALIGN);
        else
            m_pVPlane = (Ipp8u*)((Ipp16u*)m_pUPlane + nPitchChroma / 2);
#endif
    }

    return UMC_OK;
}


Status
H264DecYUVWorkSpace::allocate(const IppiSize &lumaSize, Ipp32s bpp, Ipp32s chroma_format)
{
    IppiSize paddedSize;

    // rounded up to an integral number of macroblocks
    paddedSize.width  = (lumaSize.width  + 15) & ~15;
    paddedSize.height = (lumaSize.height + 15) & ~15;

    clearState();

    Status ps = H264DecYUVBufferPadded::allocate(paddedSize,bpp,chroma_format);

    if (ps == UMC_OK)
    {
        m_macroBlockSize.width  = paddedSize.width  >> 4;
        m_macroBlockSize.height = paddedSize.height >> 4;

        //m_subBlockSize.width    = m_macroBlockSize.width  << 2;
        //m_subBlockSize.height   = m_macroBlockSize.height << 2;
    }

    return ps;
}

void H264DecYUVWorkSpace::conditionalDeallocate(const IppiSize &dim, Ipp32s bpp, Ipp32s chroma_format)
{
    IppiSize paddedSize;
        // rounded up to an integral number of macroblocks

    paddedSize.width  = (dim.width  + 15) & ~15;
    paddedSize.height = (dim.height + 15) & ~15;

    H264DecYUVBufferPadded::conditionalDeallocate(paddedSize,bpp,chroma_format);
}

void H264DecYUVWorkSpace::expand(bool is_field_flag, Ipp8u is_bottom_field)
{
    IppvcFrameFieldFlag flag;

    if(!is_field_flag)
    {
        flag = IPPVC_FRAME;
    }
    else
    {
        if(!is_bottom_field)
        {
            flag = IPPVC_TOP_FIELD;
        }
        else
        {
            flag = IPPVC_BOTTOM_FIELD;
        }
    }

    if (!isExpanded())
    {
        Ipp32s iWidth = lumaSize().width;
        Ipp32s iHeight = lumaSize().height;

        // expand luma plane
        if (m_bpp > 8)
        {
            ippiExpandPlane_H264<Ipp16u*>((Ipp16u*)m_pYPlane,
                                iWidth,
                                iHeight,
                                pitch_luma(),
                                YUV_Y_PADDING,
                                flag);
        } else {
            ippiExpandPlane_H264<Ipp8u*>((Ipp8u*)m_pYPlane,
                                iWidth,
                                iHeight,
                                pitch_luma(),
                                YUV_Y_PADDING,
                                flag);
        }

        // expand chroma plane(s)
        if (0 < m_chroma_format)
        {
            Ipp32s iChromaWidth = ((m_chroma_format < 3) ? (iWidth >> 1) : (iWidth));
            Ipp32s iChromaHeight = ((m_chroma_format == 1) ? (iHeight >> 1) : (iHeight));
            Ipp32s iYUVPadding = ((m_chroma_format == 3) ? (YUV_UV_PADDING << 1) : (YUV_UV_PADDING));

            if (m_bpp > 8)
            {

                ippiExpandPlane_H264<Ipp16u*>((Ipp16u*)m_pUPlane,
                                    iChromaWidth,
                                    iChromaHeight,
                                    pitch_chroma(),
                                    iYUVPadding,
                                    flag);

                ippiExpandPlane_H264<Ipp16u*>((Ipp16u*)m_pVPlane,
                                    iChromaWidth,
                                    iChromaHeight,
                                    pitch_chroma(),
                                    iYUVPadding,
                                    flag);
            }
            else
            {
                ippiExpandPlane_H264<Ipp8u*>((Ipp8u*)m_pUPlane,
                                    iChromaWidth,
                                    iChromaHeight,
                                    pitch_chroma(),
                                    iYUVPadding,
                                    flag);

                ippiExpandPlane_H264<Ipp8u*>((Ipp8u*)m_pVPlane,
                                    iChromaWidth,
                                    iChromaHeight,
                                    pitch_chroma(),
                                    iYUVPadding,
                                    flag);
            }
        }
    }

} // void H264DecYUVWorkSpace::expand(bool is_field_flag, Ipp8u is_bottom_field)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
