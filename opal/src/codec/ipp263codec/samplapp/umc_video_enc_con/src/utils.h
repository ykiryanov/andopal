/* ////////////////////////////////////////////////////////////////////////////// */
/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2005-2007 Intel Corporation. All Rights Reserved.
//
//
*/

#ifndef __VIDEO_ENC_UTILS_H
#define __VIDEO_ENC_UTILS_H

#include "ipps.h"

#include "umc_defs.h"
//#undef UMC_ENABLE_DV_VIDEO_ENCODER
//#undef UMC_ENABLE_DV50_VIDEO_ENCODER
//#undef UMC_ENABLE_DVHD_VIDEO_ENCODER
//#undef UMC_ENABLE_H261_VIDEO_ENCODER
//#undef UMC_ENABLE_H263_VIDEO_ENCODER
//#undef UMC_ENABLE_H264_VIDEO_ENCODER
//#undef UMC_ENABLE_MPEG2_VIDEO_ENCODER
//#undef UMC_ENABLE_MPEG4_VIDEO_ENCODER
#undef UMC_ENABLE_MJPEG_VIDEO_ENCODER
#undef UMC_ENABLE_VC1_VIDEO_ENCODER
#include "umc_video_encoders.h"

/*
#define DVEncoderParams    VideoEncoderParams
#define DV50EncoderParams  VideoEncoderParams
#define DV100EncoderParams VideoEncoderParams
*/

namespace UMC
{

class VideoEncodingSample //: public BaseFileTransform
{
public:
  virtual Status GetInputData(MediaData *out);
  virtual Status PutOutputData(MediaData *out);
  virtual Status Run();

  VideoEncodingSample()
  {
    pCodec = NULL;
    srcFile = NULL;
    dstFile = NULL;
    pEncoderParams = NULL;
    srcAlphaFile = NULL;
    mColorFormat = YUV420;
    mBitDepth = 8; // Can be overwritten according to H.264 parameters.
    mBitDepthAlpha = 16;
    mSrcFileColorFormat = NONE;
    numFramesToEncode = 0x7fffffff;

    mFramesEncoded = 0;
    mFrameSize = 0;
    encodedSize = 0;
    encodingTime = -1;
  }

  virtual Ipp64f GetTick() { return 0; }

  // BaseFileTransform
  BaseCodec *pCodec;
  FILE  *srcFile;
  FILE  *dstFile;

  // Params
  VideoEncoderParams *pEncoderParams;
  FILE        *srcAlphaFile;
  ColorFormat mColorFormat;
  Ipp32s      mBitDepth;
  Ipp32s      mBitDepthAlpha;
  ColorFormat mSrcFileColorFormat;
  Ipp32s      numFramesToEncode;

  // Info
  Ipp32s mFramesEncoded;
  Ipp32s mFrameSize;
  Ipp32s encodedSize;
  Ipp64f encodingTime;
};

} // namespace UMC

#endif /*__VIDEO_ENC_UTILS_H */
