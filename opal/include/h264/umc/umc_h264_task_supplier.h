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

#ifndef __UMC_H264_TASK_SUPPLIER_H
#define __UMC_H264_TASK_SUPPLIER_H

#include "umc_h264_dec_defs_dec.h"
#include "umc_media_data_ex.h"
#include "umc_h264_heap.h"
#include "umc_h264_slice_decoding.h"
#include "umc_h264_frame_info.h"


#include "umc_h264_segment_decoder_mt.h"
#include "umc_h264_headers.h"

namespace UMC
{
class H264Task;
class TaskBroker;

class H264DBPList;
class H264DecoderFrame;
struct H264SliceHeader;
class MediaData;
class NALUnitSplitter;
class H264Slice;

class BaseCodecParams;
class H264SegmentDecoderMultiThreaded;
class H264_DXVA_Driver_SegmentDecoder;

class MemoryAllocator;
struct H264IntraTypesProp;

/****************************************************************************************************/
// Skipping class routine
/****************************************************************************************************/
class Skipping
{
public:
    Skipping();

    bool IsShouldSkipDeblocking(H264DecoderFrame * pFrame, Ipp32s field);
    bool IsShouldSkipFrame(H264DecoderFrame * pFrame, Ipp32s field);
    void ChangeVideoDecodingSpeed(Ipp32s& num);
    void Reset();

    H264VideoDecoder::SkipInfo GetSkipInfo() const;

private:

    Ipp32s m_VideoDecodingSpeed;
    Ipp32s m_SkipCycle;
    Ipp32s m_ModSkipCycle;
    Ipp32s m_PermanentTurnOffDeblocking;
    Ipp32s m_SkipFlag;

    Ipp32s m_NumberOfSkippedFrames;
};

/****************************************************************************************************/
// VideoData cropping
/****************************************************************************************************/
// auxiliary class
class VideoDataCrop : public VideoData
{
    DYNAMIC_CAST_DECL(VideoDataCrop, VideoData)
public:
    void operator=(VideoData &par)
    {
        VideoData::operator =(par);
    }

    Status Crop(UMC::RECT SrcCropArea)
    {
      int left = SrcCropArea.left;
      int top = SrcCropArea.top;
      int right = SrcCropArea.right;
      int bottom = SrcCropArea.bottom;
      if (!right) right = m_ippSize.width;
      if (!bottom) bottom = m_ippSize.height;
      int w = right - left;
      int h = bottom - top;
      int k;
      if (w <= 0 || h <= 0) return UMC_ERR_INVALID_PARAMS;
      if (left < 0 || top < 0) return UMC_ERR_INVALID_PARAMS;
      if (right > m_ippSize.width || bottom > m_ippSize.height) return UMC_ERR_INVALID_PARAMS;
      for (k = 0; k < m_iPlanes; k++) {
        int wDiv = (m_pPlaneData[k].m_ippSize.width) ? m_ippSize.width/m_pPlaneData[k].m_ippSize.width : 1;
        int hDiv = (m_pPlaneData[k].m_ippSize.height) ? m_ippSize.height/m_pPlaneData[k].m_ippSize.height : 1;
        m_pPlaneData[k].m_pPlane += (top / hDiv) * m_pPlaneData[k].m_nPitch +
          (left / wDiv) * m_pPlaneData[k].m_iSamples * m_pPlaneData[k].m_iSampleSize;
        m_pPlaneData[k].m_ippSize.width = w / wDiv;
        m_pPlaneData[k].m_ippSize.height = h / hDiv;
      }
      m_ippSize.width = w;
      m_ippSize.height = h;
      return UMC_OK;
    }
};

/****************************************************************************************************/
// TaskSupplier
/****************************************************************************************************/
class TaskSupplier :
          public Skipping
{
    friend class TaskBroker;

public:

    TaskSupplier(VideoData &m_LastDecodedFrame, BaseCodec *&m_PostProcessing);
    virtual ~TaskSupplier();

    Status Init(BaseCodecParams *pInit);

    void Reset();
    void Close();

    Status GetInfo(VideoDecoderParams *lpInfo);
    Status AddSource(MediaData * &pSource, MediaData *dst);

    void SetMemoryAllocator(MemoryAllocator *pMemoryAllocator)
    {
        m_pMemoryAllocator = pMemoryAllocator;
    }

    H264DecoderFrame *GetFrameToDisplayInternal(MediaData *dst, bool force);
    bool GetFrameToDisplay(MediaData *dst, bool force);
    Status  SetParams(BaseCodecParams* params);

    Status GetUserData(MediaData * pUD);

    bool IsWantToShowFrame(bool force = false);

    H264DBPList  * GetDPBList()
    {
        return m_pDecodedFramesList;
    }

    TaskBroker * GetTaskBroker()
    {
        return m_pTaskBroker;
    }

    void AfterErrorRestore();

protected:
    friend class NALUnitSplitter;

    void InitColorConverter(H264DecoderFrame *source, Ipp8u force_field);

    void SlideWindow(H264Slice * pSlice, Ipp32s field_index, bool force = false);
    void AddSliceToFrame(H264DecoderFrame *pFrame, H264Slice *pSlice);
    H264DecoderFrame * AddFrame(H264Slice *pSlice);
    bool AddSlice(H264MemoryPiece * pMem, MediaData * pSource);
    void InitFrame(H264DecoderFrame * pFrame, H264Slice *pSlice);
    void CompleteFrame(H264DecoderFrame * pFrame, Ipp32s m_field_index);
    void ProcessNonPairedField(H264DecoderFrame * pFrame);
    Status InitFreeFrame(H264DecoderFrame * pFrame, H264Slice *pSlice);

    void DBPUpdate(H264DecoderFrame * pFrame, Ipp32s field);
    Status UpdateRefPicMarking(H264DecoderFrame * pFrame, H264Slice * pSlice, Ipp32s field_index);

    Status RunDecoding(MediaData *dst, MediaData *src, bool force);

    Status DecodeHeaders(MediaDataEx::_MediaDataEx *pSource, H264MemoryPiece * pMem);
    Status DecodeSEI(MediaDataEx::_MediaDataEx *pSource, H264MemoryPiece * pMem);

    Status ProcessFrameNumGap(H264Slice *slice, Ipp32s field);

    // Obtain free frame from queue
    H264DecoderFrame *GetFreeFrame(void);

    void   DecodePictureOrderCount(H264Slice *slice, Ipp32s frame_num);

    Status SetDPBSize();

    bool AllocateMBIntraTypes(Ipp32s iIndex, Ipp32s iMBNumber);

    Status AllocateBuffers(bool exactSizeRequested);
    void DeallocateBuffers();

    // Initialize MB ordering for the picture using slice groups as
    // defined in the picture parameter set.
    void SetMBMap(H264DecoderFrame *frame);

    H264_Heap_Objects<H264Slice> m_SlicesHeap;

    H264SegmentDecoderMultiThreaded **m_pSegmentDecoder;
    Ipp32s m_iThreadNum;

    Mutex m_mGuard;
    NALUnitSplitter * m_pNALSplitter;
    H264_Heap      m_Heap;
    Ipp8u         *m_pMBMap;

    H264DecoderMBAddr *next_mb_tables[2];//0 linear scan, 1 - bitstream defined scan (slice groups)

    Ipp32s          m_parsedDataLength;
    IppiSize        m_paddedParsedDataSize;
    Ipp8u          *m_pParsedData;
    MemID           m_midParsedData;       // (MemID) mem id for allocated parsed data

    // This is the value at which the TR Wraps around for this
    // particular sequence.
    Ipp32s      m_MaxLongTermFrameIdx;

    Ipp32s      m_field_index;

    Headers     m_Headers;

    Ipp64f                     m_local_frame_time;
    Ipp64f                     m_local_delta_frame_time;

    H264DecoderFrame * m_pFirstUncompletedFrame;
    H264DBPList  *m_pDecodedFramesList;

    H264DecoderFrame *m_pCurrentFrame;
    H264DecoderFrame *m_pLastDisplayed;

    H264DecoderLocalMacroblockDescriptor *m_pMBInfo;            // (H264DecoderLocalMacroblockDescriptor *) pointer to array of decoding info
    MemoryAllocator *m_pMemoryAllocator;                        // (MemoryAllocator *) pointer to memory allocation tool
    IntraType *(*m_ppMBIntraTypes);                             // (IntraType *(*)) pointer to array of pointers to macroblocks intra types
    H264IntraTypesProp *m_piMBIntraProp;                        // pointer to array of sizes of allocated arrays of macroblock intra types

    Ipp32s                     m_iCurrentResource;

    Ipp32s                     m_PrevFrameRefNum;
    Ipp32s                     m_FrameNum;
    Ipp32s                     m_PicOrderCnt;
    Ipp32s                     m_PicOrderCntMsb;
    Ipp32s                     m_PicOrderCntLsb;
    Ipp32s                     m_FrameNumOffset;
    Ipp32u                     m_TopFieldPOC;
    Ipp32u                     m_BottomFieldPOC;

    // At least one sequence parameter set and one picture parameter
    // set must have been read before a picture can be decoded.
    bool              m_bSeqParamSetRead;
    bool              m_bPicParamSetRead;

    // Keep track of which parameter set is in use.
    Ipp32s            m_CurrentSeqParamSet;
    Ipp32s            m_CurrentPicParamSet;
    bool              m_WaitForIDR;

    Ipp32s            m_dpbSize;
    Ipp32s            m_maxDecFrameBuffering;
    Ipp32s            m_DPBSizeEx;
    Ipp32s            m_TrickModeSpeed;

    TaskBroker * m_pTaskBroker;

    VideoData              &m_LastDecodedFrame;                // (VideoData) last decoded frame
    BaseCodec              *&m_PostProcessing;                  // (BaseCodec*) pointer to post processing

    NotifiersChain          m_DefaultNotifyChain;

private:
    TaskSupplier & operator = (TaskSupplier &)
    {
        return *this;

    } // TaskSupplier & operator = (TaskSupplier &)

    Ipp32s m_UIDFrameCounter;

    H264SEIPayLoad m_UserData;
};

} // namespace UMC

#endif // __UMC_H264_TASK_SUPPLIER_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
