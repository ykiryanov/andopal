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

#include "ippi.h"
#include "umc_h264_dec.h"
#include "umc_video_data.h"
#include "umc_media_data_ex.h"
#include "vm_debug.h"
#include "vm_sys_info.h"
#include "umc_h264_bitstream.h"


#include "umc_h264_frame_list.h"

#include "umc_h264_segment_decoder_mt.h"
#include "umc_memory_allocator.h"

#include "umc_h264_task_supplier.h"
#include "umc_h264_timing.h"

namespace UMC
{

#ifdef USE_DETAILED_H264_TIMING
    TimingInfo* clsTimingInfo;
#endif

// Create instance of H264 decoder
VideoDecoder *CreateH264Decoder() { return (new H264VideoDecoder()); }

//////////////////////////////////////////////////////////////////////////////
// H264Decoder constructor
//////////////////////////////////////////////////////////////////////////////
H264VideoDecoder::H264VideoDecoder ()
    : m_pDisplayFrame(0)
    , m_IsOwnPostProcessing(false)
    , m_IsInitialized(false)
{
    m_pTaskSupplier = 0;

    // allocator tools
    INIT_TIMING;
}

//////////////////////////////////////////////////////////////////////////////
// Start_Sequence: This method should be called if there are significant
//                 changes in the input format in the compressed bit stream.
//                 This method must be called between construction
//                 of the H264Decoder object and the first time a decompress
//                 is done.
//////////////////////////////////////////////////////////////////////////////
Status H264VideoDecoder::Init(BaseCodecParams *pInit)
{
    Status umcRes = UMC_OK;
    VideoDecoderParams *init = DynamicCast<VideoDecoderParams> (pInit);

    // check error(s)
    if (NULL == init)
        return UMC_ERR_NULL_PTR;

    // release object before initialization
    Close();

    // initialize memory control tools
    umcRes = VideoDecoder::Init(pInit);
    if (UMC_OK != umcRes)
        return umcRes;

#ifdef USE_SEI
    m_FrameProcessingStage = NORMAL_FRAME_PROCESSING;
#endif

    m_pDisplayFrame = 0;

    m_pTaskSupplier = new TaskSupplier(m_LastDecodedFrame, m_PostProcessing);
    m_pTaskSupplier->SetMemoryAllocator(m_pMemoryAllocator);

    m_PostProcessing = init->pPostProcessing;

    m_IsOwnPostProcessing = false;
    if (!m_PostProcessing)
    {
        m_PostProcessing = createVideoProcessing();
        m_IsOwnPostProcessing = true;
    }

    try
    {
        m_pTaskSupplier->Init(init);

        if (init->m_pData && init->m_pData->GetDataSize())
        {
            umcRes = ParseFrame(NULL, (MediaData *) init->m_pData);
        }
    }
    catch(...)
    {
        return UMC_ERR_FAILED;
    }

    if (UMC_ERR_NOT_ENOUGH_DATA == umcRes || UMC_ERR_NULL_PTR == umcRes)
        umcRes = UMC_OK;

    m_IsInitialized = (umcRes == UMC_OK);

    return umcRes;
}

Status  H264VideoDecoder::SetParams(BaseCodecParams* params)
{
    if (!m_IsInitialized)
        return UMC_ERR_NOT_INITIALIZED;

    VideoDecoderParams *pParams = DynamicCast<VideoDecoderParams>(params);

    if (NULL == pParams)
        return UMC_ERR_NULL_PTR;

    if (m_pTaskSupplier)
        m_pTaskSupplier->SetParams(pParams);

    return VideoDecoder::SetParams(params);
}

Status H264VideoDecoder::Close()
{
    // release memory control tools
    try
    {
        delete m_pTaskSupplier;
        m_pTaskSupplier = 0;

        if (m_IsOwnPostProcessing)
        {
            delete m_PostProcessing;
            m_PostProcessing = 0;
            m_IsOwnPostProcessing = false;
        }

        VideoDecoder::Close();
    }catch(...)
    {
    }

    m_IsInitialized = false;

    return UMC_OK;
}

//////////////////////////////////////////////////////////////////////////////
// H264Decoder Destructor
//////////////////////////////////////////////////////////////////////////////
H264VideoDecoder::~H264VideoDecoder(void)
{
    Close();
}

Status H264VideoDecoder::GetFrame(MediaData* src, MediaData* dst)
{
    Status umcRes = UMC_OK;

    try
    {

        if (!m_IsInitialized)
            return UMC_ERR_NOT_INITIALIZED;

        if (!dst)
            return UMC_ERR_NULL_PTR;

        if (!src && !dst)
            return UMC_ERR_NULL_PTR;

        dst->SetDataSize(0);

        // initialize bit stream data
        if (src && MINIMAL_DATA_SIZE > src->GetDataSize())
        {
            src->MoveDataPointer((Ipp32s) src->GetDataSize());
            return UMC_ERR_NOT_ENOUGH_DATA;
        }

        if (!src)
        {
            ParseFrame(dst, src);

            if (dst->GetDataSize() && dst->GetDataSize() > 1)
                return UMC_OK;
            else
            {
                while (m_pTaskSupplier->GetFrameToDisplay(dst, true))
                {
                    if (dst->GetDataSize() == 1)
                    {
                        dst->SetDataSize(0);
                        continue;
                    }

                    return UMC_OK;
                }

                return UMC_ERR_NOT_ENOUGH_DATA;
            }
        }

        umcRes = ParseFrame(dst, src);

        if (UMC_OK != umcRes && UMC_ERR_NOT_ENOUGH_DATA != umcRes)
        {
            if (UMC_WRN_INVALID_STREAM == umcRes)
            {
                umcRes = UMC_ERR_NOT_ENOUGH_DATA;
            }

            return umcRes;
        }

        if (dst->GetDataSize() == 1)
        {
            dst->SetDataSize(0);
            return UMC_ERR_NOT_ENOUGH_DATA;
        }

        if (dst->GetDataSize())
            return UMC_OK;

        if (m_pTaskSupplier->GetFrameToDisplay(dst, false))
        {
            if (dst->GetDataSize() == 1)
            {
                dst->SetDataSize(0);
                return UMC_ERR_NOT_ENOUGH_DATA;
            }

            return UMC_OK;
        }

    } catch(const h264_exception & ex)
    {
        m_pTaskSupplier->AfterErrorRestore();
        return ex.GetStatus();
    }
    catch(...)
    {
        m_pTaskSupplier->AfterErrorRestore();
        return UMC_ERR_INVALID_STREAM;
    }

    return UMC_ERR_NOT_ENOUGH_DATA;
} // Status H264VideoDecoder::GetFrame(MediaData* src, MediaData* dst)

Status H264VideoDecoder::ParseFrame(MediaData *pDestination, MediaData *pSource)
{
    Status umcRes = UMC_OK;

    do
    {
        umcRes = m_pTaskSupplier->AddSource(pSource, pDestination);

    } while ((UMC_ERR_NOT_ENOUGH_DATA == umcRes) &&
            (pSource && pDestination) &&
            (MINIMAL_DATA_SIZE < pSource->GetDataSize()));

    return umcRes;

} // Status H264VideoDecoder::ParseFrame(MediaData *pDestination, MediaData *pSource)

Status H264VideoDecoder::GetInfo(BaseCodecParams* params)
{
    Status umcRes = UMC_OK;
    VideoDecoderParams *lpInfo = DynamicCast<VideoDecoderParams> (params);

    if (!m_IsInitialized)
        return UMC_ERR_NOT_INITIALIZED;

    if (NULL == lpInfo)
        return UMC_ERR_NULL_PTR;

    umcRes = VideoDecoder::GetInfo(params);

    if (UMC_OK == umcRes)
    {
        return m_pTaskSupplier->GetInfo(lpInfo);
    }

    return umcRes;
}

/* temporal class definition */
class H264DwordPointer_
{
public:
    // Default constructor
    H264DwordPointer_(void)
    {
        m_pDest = NULL;
        m_nByteNum = 0;
    }

    H264DwordPointer_ operator = (void *pDest)
    {
        m_pDest = (Ipp32u *) pDest;
        m_nByteNum = 0;
        m_iCur = 0;

        return *this;
    }

    // Increment operator
    H264DwordPointer_ &operator ++ (void)
    {
        if (4 == ++m_nByteNum)
        {
            *m_pDest = m_iCur;
            m_pDest += 1;
            m_nByteNum = 0;
            m_iCur = 0;
        }
        else
            m_iCur <<= 8;

        return *this;
    }

    Ipp8u operator = (Ipp8u nByte)
    {
        m_iCur = (m_iCur & ~0x0ff) | ((Ipp32u) nByte);

        return nByte;
    }

protected:
    Ipp32u *m_pDest;                                            // (Ipp32u *) pointer to destination buffer
    Ipp32u m_nByteNum;                                          // (Ipp32u) number of current byte in dword
    Ipp32u m_iCur;                                              // (Ipp32u) current dword
};

class H264SourcePointer_
{
public:
    // Default constructor
    H264SourcePointer_(void)
    {
        m_pSource = NULL;
    }

    H264SourcePointer_ &operator = (void *pSource)
    {
        m_pSource = (Ipp8u *) pSource;

        m_nZeros = 0;
        m_nRemovedBytes = 0;

        return *this;
    }

    H264SourcePointer_ &operator ++ (void)
    {
        Ipp8u bCurByte = m_pSource[0];

        if (0 == bCurByte)
            m_nZeros += 1;
        else
        {
            if ((3 == bCurByte) && (2 <= m_nZeros))
                m_nRemovedBytes += 1;
            m_nZeros = 0;
        }

        m_pSource += 1;

        return *this;
    }

    bool IsPrevent(void)
    {
        if ((3 == m_pSource[0]) && (2 <= m_nZeros))
            return true;
        else
            return false;
    }

    operator Ipp8u (void)
    {
        return m_pSource[0];
    }

    Ipp32u GetRemovedBytes(void)
    {
        return m_nRemovedBytes;
    }

protected:
    Ipp8u *m_pSource;                                           // (Ipp8u *) pointer to destination buffer
    Ipp32u m_nZeros;                                            // (Ipp32u) number of preceding zeros
    Ipp32u m_nRemovedBytes;                                     // (Ipp32u) number of removed bytes
};

void SwapMemoryAndRemovePreventingBytes(void *pDestination, size_t &nDstSize, void *pSource, size_t nSrcSize)
{
    H264DwordPointer_ pDst;
    H264SourcePointer_ pSrc;
    size_t i;

    // DwordPointer object is swapping written bytes
    // H264SourcePointer_ removes preventing start-code bytes

    // reset pointer(s)
    pSrc = pSource;
    pDst = pDestination;

    // first two bytes
    i = 0;
    while (i < (Ipp32u) IPP_MIN(2, nSrcSize))
    {
        pDst = (Ipp8u) pSrc;
        ++pDst;
        ++pSrc;
        ++i;
    }

    // do swapping
    while (i < (Ipp32u) nSrcSize)
    {
        if (false == pSrc.IsPrevent())
        {
            pDst = (Ipp8u) pSrc;
            ++pDst;
        }
        ++pSrc;
        ++i;
    }

    // write padding bytes
    nDstSize = nSrcSize - pSrc.GetRemovedBytes();
    while (nDstSize & 3)
    {
        pDst = (Ipp8u) (0);
        ++nDstSize;
        ++pDst;
    }

} // void SwapMemoryAndRemovePreventingBytes(void *pDst, size_t &nDstSize, void *pSrc, size_t nSrcSize)

Status  H264VideoDecoder::Reset()
{
    Status umcRes = UMC_OK;

    if (!m_IsInitialized)
        return UMC_ERR_NOT_INITIALIZED;

#ifdef USE_SEI
    m_FrameProcessingStage = NORMAL_FRAME_PROCESSING;
#endif

    m_pTaskSupplier->Reset();

    return umcRes;
}

Status  H264VideoDecoder::ChangeVideoDecodingSpeed(Ipp32s& num)
{
    m_pTaskSupplier->ChangeVideoDecodingSpeed(num);
    return UMC_OK;
}

H264VideoDecoder::SkipInfo H264VideoDecoder::GetSkipInfo() const
{
    return m_pTaskSupplier->GetSkipInfo();
}

Status H264VideoDecoder::GetUserData(MediaData * pUD)
{
    if (!pUD)
        return UMC_ERR_NULL_PTR;

    return m_pTaskSupplier->GetUserData(pUD);
}

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
