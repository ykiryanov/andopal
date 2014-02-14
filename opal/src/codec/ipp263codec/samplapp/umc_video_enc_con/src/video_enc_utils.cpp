//
//               INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in accordance with the terms of that agreement.
//        Copyright (c) 2005-2007 Intel Corporation. All Rights Reserved.
//

#include "utils.h"
#include "umc_video_data.h"
#include "umc_mpeg2_video_encoder.h"

using namespace UMC;

Status ReadVideoPlane(VideoData *data, int plane, FILE *f)
{
  VideoData::PlaneInfo plInfo;
  Ipp8u* ptr;
  int w, h, i, count;

  if (data->GetColorFormat() == YV12) {
    // for YV12 change planes to Y,U,V order
    if (plane == 1) plane = 2;
    if (plane == 2) plane = 1;
  }

  ptr = (Ipp8u*)data->GetPlanePointer(plane);
  data->GetPlaneInfo(&plInfo, plane);
  h = plInfo.m_ippSize.height;
  w = plInfo.m_ippSize.width;

  for (i = 0; i < h; i ++) {
    count = (Ipp32s)fread(ptr, plInfo.m_iSampleSize, w, f);
    ptr += plInfo.m_nPitch;
    if (count != w) {
      return UMC_ERR_FAILED;
    }
  }

  return UMC_OK;
}

Status VideoEncodingSample::GetInputData(MediaData *in)
{
  Status ret = UMC_OK;
  VideoData *data = DynamicCast<VideoData>(in);
  int numPlanes = data->GetNumPlanes();
  int alphaFlag = 0;
  int k;

  if (mColorFormat == YUV420A || mColorFormat == YUV422A || mColorFormat == YUV444A) {
    numPlanes = 3;
    alphaFlag = 1;
  }
  for (k = 0; k < numPlanes; k++) {
    int kk = k;
    if (mSrcFileColorFormat == YV12 && data->GetColorFormat() == YUV420) {
      if (k == 1) kk = 2; else
      if (k == 2) kk = 1;
    }
    ret = ReadVideoPlane(data, kk, srcFile);
    if (UMC_OK != ret) {
      vm_string_fprintf(stderr, VM_STRING("Error: Can't read next %d source frame!\n"), mFramesEncoded);
      break;
    }
  }
  if (srcAlphaFile && alphaFlag && UMC_OK == ret) {
    ret = ReadVideoPlane(data, 3, srcAlphaFile);
    if (UMC_OK != ret) {
      vm_string_fprintf(stderr, VM_STRING("Error: Can't read next %d source ALPHA frame!\n"), mFramesEncoded);
    }
  }

  return ret;
}

Status VideoEncodingSample::PutOutputData(MediaData *out)
{
  size_t nBytes;
  nBytes = fwrite(out->GetDataPointer(), 1, out->GetDataSize(), dstFile);
  if (nBytes != out->GetDataSize()) {
    return UMC_ERR_FAILED;
  }
  return out->SetDataSize(0);
}

Status VideoEncodingSample::Run()
{
  Ipp32s mWidth = pEncoderParams->info.clip_info.width;
  Ipp32s mHeight = pEncoderParams->info.clip_info.height;
  VideoData in;
  MediaData out(4*mWidth*mHeight);
  VideoData *p_dataIn = &in;
  MediaData *p_dataOut = &out;
  Ipp32s    maxNumFrames = numFramesToEncode;
  MPEG2VideoEncoder *mpeg2Encoder = DynamicCast<MPEG2VideoEncoder>(pCodec);
  Status    ret = UMC_OK;
  Ipp32s    len;
  Ipp64f    t_start;

  p_dataIn->Init(mWidth, mHeight, mColorFormat, mBitDepth);
  if (mColorFormat == YUV420A || mColorFormat == YUV422A || mColorFormat == YUV444A) {
    p_dataIn->SetPlaneBitDepth(mBitDepthAlpha, 3);
  }
  mFrameSize = (Ipp32s)p_dataIn->GetMappingSize();

  if (!mpeg2Encoder) {
    p_dataIn->Alloc(); // if mpeg2 use internal buffer of encoder
  }

  encodingTime = 0;
  encodedSize = 0;

  mFramesEncoded = 0;
  for (;;) {
    if (mFramesEncoded >= maxNumFrames) {
      p_dataIn = NULL; // get frames buffered inside encoder
    }
    if (p_dataIn) {
      if (mpeg2Encoder) {
        mpeg2Encoder->GetNextYUVBuffer(p_dataIn);
      }

      if (UMC_OK == GetInputData(p_dataIn)) {
        p_dataIn->SetTime(mFramesEncoded);
      } else {
        p_dataIn = NULL;
      }
    }

    t_start = GetTick();
    ret = pCodec->GetFrame(p_dataIn, p_dataOut);
    encodingTime += GetTick() - t_start;

    if (ret != UMC_OK && ret != UMC_ERR_NOT_ENOUGH_DATA && ret != UMC_ERR_END_OF_STREAM) {
      vm_string_fprintf(stderr, VM_STRING("Error: encoding failed at %d source frame (exit with %d)!\n"), mFramesEncoded, ret);
      return UMC_ERR_FAILED;
    }

    len = (Ipp32s)p_dataOut->GetDataSize();
    encodedSize += len;

    if (UMC_OK != PutOutputData(p_dataOut)) {
      vm_string_fprintf(stderr, VM_STRING("Error: Couldn't write output\n"));
      return UMC_ERR_FAILED;
    }

    if (p_dataIn) {
      mFramesEncoded++;
    } else {
      if (!len || ret == UMC_ERR_END_OF_STREAM) break; // EOF
    }
  }

  PutOutputData(NULL); // means EOF

  return UMC_OK;
}
