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

#ifndef __UMC_H264_DEC_H__
#define __UMC_H264_DEC_H__

#include "umc_video_decoder.h"
#include "umc_media_buffer.h"

namespace UMC
{

// forward declaration of internal types
class TaskSupplier;
class H264DecoderFrame;

class H264VideoDecoderParams : public VideoDecoderParams
{
public:
    DYNAMIC_CAST_DECL(H264VideoDecoderParams, VideoDecoderParams);

    enum
    {
        ENTROPY_CODING_CAVLC = 0,
        ENTROPY_CODING_CABAC = 1
    };

    enum
    {
        H264_PROFILE_BASELINE           = 66,
        H264_PROFILE_MAIN               = 77,
        H264_PROFILE_EXTENDED           = 88,
        H264_PROFILE_HIGH               = 100,
        H264_PROFILE_HIGH10             = 110,
        H264_PROFILE_HIGH422            = 122,
        H264_PROFILE_HIGH444            = 144,
        H264_PROFILE_ADVANCED444_INTRA  = 166,
        H264_PROFILE_ADVANCED444        = 188
    };

    enum
    {
        H264_LEVEL_1    = 10,
        H264_LEVEL_11   = 11,
        H264_LEVEL_1b   = 11,
        H264_LEVEL_12   = 12,
        H264_LEVEL_13   = 13,

        H264_LEVEL_2    = 20,
        H264_LEVEL_21   = 21,
        H264_LEVEL_22   = 22,

        H264_LEVEL_3    = 30,
        H264_LEVEL_31   = 31,
        H264_LEVEL_32   = 32,

        H264_LEVEL_4    = 40,
        H264_LEVEL_41   = 41,
        H264_LEVEL_42   = 42,

        H264_LEVEL_5    = 50,
        H264_LEVEL_51   = 51
    };

    H264VideoDecoderParams()
        : m_DPBSize(16)
        , m_entropy_coding_type(ENTROPY_CODING_CAVLC)
    {
        m_fullSize.width = 0;
        m_fullSize.height = 0;
    }

    Ipp32s m_entropy_coding_type;
    Ipp32s m_DPBSize;
    IppiSize m_fullSize;
};

class H264VideoDecoder : public VideoDecoder
{
    DYNAMIC_CAST_DECL(H264VideoDecoder, VideoDecoder);

public:

        H264VideoDecoder();

       ~H264VideoDecoder();

//////////////////////
// interface methods
/////////////////////
        Status Init(BaseCodecParams *params);

        // Decode & get decoded frame
        Status GetFrame(MediaData* in, MediaData* out);

        Status  SetParams(BaseCodecParams* params);

        Status Close();

        Status Reset();

        Status GetInfo(BaseCodecParams* params);

        // reset skip frame counter
        Status ResetSkipCount()
        {
            // DEBUG : ADB m_SkipFlag = 0;
            return UMC_OK;
        };

        virtual Status ChangeVideoDecodingSpeed(Ipp32s& num);

        struct SkipInfo
        {
            bool isDeblockingTurnedOff;
            Ipp32s numberOfSkippedFrames;
        };

        virtual SkipInfo GetSkipInfo() const;

        virtual Status SkipVideoFrame(Ipp32s /*num*/)
        {
            return UMC_ERR_NOT_IMPLEMENTED;
        };

        // get skip frame counter statistic
        Ipp32u GetNumOfSkippedFrames()
        {
            return 0; // DEBUG : ADB m_ReallySkipped;
        };

        Status GetUserData(MediaData * pUD);

protected:

        H264DecoderFrame *m_pDisplayFrame;

private:

    TaskSupplier    *m_pTaskSupplier;

    // Parse frame
    Status ParseFrame(MediaData *pDestination, MediaData *pSource);

    void ConvertAlpha(H264DecoderFrame *alphaFrame, Ipp8u * lpDest, Ipp32s pitch,
                        IppiSize szDest, Ipp32s iBitsPerSample);

    // Memory control tools
    MemID m_midParsedData;            // (MemID) mem id for allocated parsed data
    MemID m_midParsedDataNew;         // (MemID) mem id for allocated parsed data

    bool m_IsOwnPostProcessing;

    bool m_IsInitialized;
}; // H264VideoDecoder

// Declare function to swapping memory
void SwapMemoryAndRemovePreventingBytes(void *pDst, size_t &nDstSize, void *pSrc, size_t nSrcSize);

} // namespace UMC

#endif // __UMC_H264_DEC_H__
#endif // UMC_ENABLE_H264_VIDEO_DECODER
