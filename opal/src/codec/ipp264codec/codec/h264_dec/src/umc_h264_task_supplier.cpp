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

#include "umc_h264_task_supplier.h"
#include "umc_h264_frame_list.h"
#include "umc_automatic_mutex.h"
#include "umc_h264_nal_spl.h"
#include "umc_h264_bitstream.h"

#include "umc_h264_dec_defs_dec.h"
#include "vm_sys_info.h"
#include "umc_h264_segment_decoder_mt.h"


#include "umc_h264_task_broker.h"
#include "umc_video_processing.h"
#include "umc_structures.h"

#include <cstdarg>
inline
void Trace(vm_char * format, ...)
{
    va_list(arglist);
    va_start(arglist, format);

    vm_char cStr[256];
    vm_string_vsprintf(cStr, format, arglist);

    //OutputDebugString(cStr);
    vm_string_printf(VM_STRING("%s"), cStr);
    //fflush(stdout);
}

#define DEBUG_PRINT(x)
Ipp32s frame_count = 0;

namespace UMC
{

inline ColorFormat GetColorFormat(Ipp32s color_format)
{
    ColorFormat format;
    switch(color_format)
    {
    case 0:
        format = GRAY;
        break;
    case 2:
        format = YUV422;
        break;
    case 3:
        format = YUV444;
        break;
    case 1:
    default:
        format = YUV420;
        break;
    }

    return format;
}

void OnSlideWindow(H264DecoderFrame *pRefFrame, H264DecoderFrame *pCurrentFrame, NotifiersChain * defaultChain, bool force)
{
    if (!pRefFrame)
        return;

    if (!pRefFrame->IsFrameExist())
    {
        pRefFrame->setWasOutputted();
        return;
    }

    if (force || (!pRefFrame->isShortTermRef() && !pRefFrame->isLongTermRef()))
    {
        NotifiersChain *notif = defaultChain;

        if (pCurrentFrame && pCurrentFrame->GetBusyState() >= 2)
        {
            VM_ASSERT(pCurrentFrame);
            notif = pCurrentFrame->GetNotifiersChain();
        }

        if (notif)
        {
            pRefFrame->IncrementBusyState();
            notif->AddNotifier(new notifier0<H264DecoderFrame>
                (pRefFrame, &H264DecoderFrame::DecrementBusyState));
        }
    }
}

bool CutPlanes(H264DecoderFrame * , H264SeqParamSet * );

/****************************************************************************************************/
// Skipping class routine
/****************************************************************************************************/
Skipping::Skipping()
    : m_VideoDecodingSpeed(0)
    , m_SkipCycle(1)
    , m_ModSkipCycle(1)
    , m_SkipFlag(0)
    , m_PermanentTurnOffDeblocking(0)
    , m_NumberOfSkippedFrames(0)
{
}

void Skipping::Reset()
{
    m_VideoDecodingSpeed = 0;
    m_SkipCycle = 0;
    m_ModSkipCycle = 0;
    m_PermanentTurnOffDeblocking = 0;
    m_NumberOfSkippedFrames = 0;
}

bool Skipping::IsShouldSkipDeblocking(H264DecoderFrame * pFrame, Ipp32s field)
{
    return (IS_SKIP_DEBLOCKING_MODE_PERMANENT ||
        (IS_SKIP_DEBLOCKING_MODE_NON_REF && !pFrame->GetAU(field)->IsReference()));
}

bool Skipping::IsShouldSkipFrame(H264DecoderFrame * pFrame, Ipp32s /*field*/)
{
    bool isShouldSkip = false;

    bool isReference0 = pFrame->GetAU(0)->IsReference();
    bool isReference1 = pFrame->GetAU(1)->IsReference();

    bool isReference = isReference0 || isReference1;

    if ((m_VideoDecodingSpeed > 0) && !isReference)
    {
        if ((m_SkipFlag % m_ModSkipCycle) == 0)
        {
            isShouldSkip = true;
        }

        m_SkipFlag++;

        if (m_SkipFlag >= m_SkipCycle)
            m_SkipFlag = 0;
    }

    if (isShouldSkip)
        m_NumberOfSkippedFrames++;

    return isShouldSkip;
}

void Skipping::ChangeVideoDecodingSpeed(Ipp32s & num)
{
    m_VideoDecodingSpeed += num;

    if (m_VideoDecodingSpeed < 0)
        m_VideoDecodingSpeed = 0;
    if (m_VideoDecodingSpeed > 7)
        m_VideoDecodingSpeed = 7;

    num = m_VideoDecodingSpeed;

    if (m_VideoDecodingSpeed > 6)
    {
        m_SkipCycle = 1;
        m_ModSkipCycle = 1;
        m_PermanentTurnOffDeblocking = 2;
    }
    else if (m_VideoDecodingSpeed > 5)
    {
        m_SkipCycle = 1;
        m_ModSkipCycle = 1;
        m_PermanentTurnOffDeblocking = 0;
    }
    else if (m_VideoDecodingSpeed > 4)
    {
        m_SkipCycle = 3;
        m_ModSkipCycle = 2;
        m_PermanentTurnOffDeblocking = 1;
    }
    else if (m_VideoDecodingSpeed > 3)
    {
        m_SkipCycle = 3;
        m_ModSkipCycle = 2;
        m_PermanentTurnOffDeblocking = 0;
    }
    else if (m_VideoDecodingSpeed > 2)
    {
        m_SkipCycle = 2;
        m_ModSkipCycle = 2;
        m_PermanentTurnOffDeblocking = 0;
    }
    else if (m_VideoDecodingSpeed > 1)
    {
        m_SkipCycle = 3;
        m_ModSkipCycle = 3;
        m_PermanentTurnOffDeblocking = 0;
    }
    else if (m_VideoDecodingSpeed == 1)
    {
        m_SkipCycle = 4;
        m_ModSkipCycle = 4;
        m_PermanentTurnOffDeblocking = 0;
    }
    else
    {
        m_PermanentTurnOffDeblocking = 0;
    }
}

H264VideoDecoder::SkipInfo Skipping::GetSkipInfo() const
{
    H264VideoDecoder::SkipInfo info;
    info.isDeblockingTurnedOff = (m_VideoDecodingSpeed == 5) || (m_VideoDecodingSpeed == 7);
    info.numberOfSkippedFrames = m_NumberOfSkippedFrames;
    return info;
}

struct H264IntraTypesProp
{
    Ipp32s m_nSize;                                             // (Ipp32s) size of allocated intra type array
    MemID m_mid;                                                // (MemID) mem id of allocated buffer for intra types

    void Reset(void)
    {
        m_nSize = 0;
        m_mid = 0;
    }
};

/****************************************************************************************************/
// TaskSupplier
/****************************************************************************************************/
TaskSupplier::TaskSupplier(VideoData &lastDecodedFrame, BaseCodec *&postProcessing)
    : m_pDecodedFramesList(0)
    , m_MaxLongTermFrameIdx(0)
    , m_pNALSplitter(0)
    , m_pFirstUncompletedFrame(0)
    , m_pTaskBroker(0)

    , m_midParsedData(0)
    , m_pParsedData(0)
    , m_parsedDataLength(0)
    , m_PostProcessing(postProcessing)
    , m_LastDecodedFrame(lastDecodedFrame)
    , m_iThreadNum(0)
    , m_maxDecFrameBuffering(1)
    , m_dpbSize(1)
    , m_DPBSizeEx(0)
    , m_TrickModeSpeed(1)
    , m_UIDFrameCounter(0)
    , m_pSegmentDecoder(0)
    , m_ppMBIntraTypes(0)
    , m_piMBIntraProp(0)
    , m_pMBInfo(0)
    , m_pLastDisplayed(0)
{
}

TaskSupplier::~TaskSupplier()
{
    Close();
}

Status TaskSupplier::Init(BaseCodecParams *pInit)
{
    VideoDecoderParams *init = DynamicCast<VideoDecoderParams> (pInit);

    if (NULL == init)
        return UMC_ERR_NULL_PTR;

    Close();

    m_dpbSize = 0;
    m_DPBSizeEx = 0;
    m_pCurrentFrame = 0;
    m_iCurrentResource = 0;

    if (ABSOWN(init->dPlaybackRate - 1) > 0.0001)
    {
        m_TrickModeSpeed = 2;
    }
    else
    {
        m_TrickModeSpeed = 1;
    }

    Ipp32s nAllowedThreadNumber = init->numThreads;
    if(nAllowedThreadNumber < 0) nAllowedThreadNumber = 0;
    if(nAllowedThreadNumber > 8) nAllowedThreadNumber = 8;
#ifdef _DEBUG
    if (!nAllowedThreadNumber)
        nAllowedThreadNumber = 1;
#endif // _DEBUG

    // calculate number of slice decoders.
    // It should be equal to CPU number
    m_iThreadNum = (0 == nAllowedThreadNumber) ? (vm_sys_info_get_cpu_num()) : (nAllowedThreadNumber);

    m_pFirstUncompletedFrame = 0;
    m_pDecodedFramesList = new H264DBPList();
    if (!m_pDecodedFramesList)
        return UMC_ERR_ALLOC;

    if (init->info.stream_subtype == AVC1_VIDEO)
    {
        m_pNALSplitter = new NALUnitSplitterMP4(&m_Heap);
    }
    else
    {
        m_pNALSplitter = new NALUnitSplitter(&m_Heap);
    }

    m_pNALSplitter->Init();



    switch(m_iThreadNum)
    {
    case 1:
        m_pTaskBroker = new TaskBrokerSingleThread(this);
        break;
    case 4:
    case 3:
    case 2:
        m_pTaskBroker = new TaskBrokerTwoThread(this);
        break;
    default:
        m_pTaskBroker = new TaskBrokerTwoThread(this);
        break;
    };

    m_pTaskBroker->Init(m_iThreadNum);


    // create slice decoder(s)
    m_pSegmentDecoder = new H264SegmentDecoderMultiThreaded *[m_iThreadNum];
    if (NULL == m_pSegmentDecoder)
        return UMC_ERR_ALLOC;
    memset(m_pSegmentDecoder, 0, sizeof(H264SegmentDecoderMultiThreaded *) * m_iThreadNum);

    Ipp32s i;
    for (i = 0; i < m_iThreadNum; i += 1)
    {
            m_pSegmentDecoder[i] = new H264SegmentDecoderMultiThreaded(m_pTaskBroker);

        if (NULL == m_pSegmentDecoder[i])
            return UMC_ERR_ALLOC;
    }

    for (i = 0; i < m_iThreadNum; i += 1)
    {
        if (UMC_OK != m_pSegmentDecoder[i]->Init(i))
            return UMC_ERR_INIT;
    }

    Ipp32s numberOfBuffers = 2*(m_iThreadNum);
    m_pMBInfo = new H264DecoderLocalMacroblockDescriptor[numberOfBuffers];
    if (NULL == m_pMBInfo)
        return UMC_ERR_ALLOC;

    m_ppMBIntraTypes = (Ipp32u **) XippsMalloc_8u((Ipp32s) (sizeof(Ipp32u *) * numberOfBuffers));
    if (NULL == m_ppMBIntraTypes)
        return UMC_ERR_ALLOC;
    memset(m_ppMBIntraTypes, 0, sizeof(Ipp32u *) * numberOfBuffers);

    // allocate intra MB types array's sizes
    m_piMBIntraProp = (H264IntraTypesProp *) XippsMalloc_8u((Ipp32s) (sizeof(H264IntraTypesProp) * numberOfBuffers));
    if (NULL == m_piMBIntraProp)
        return UMC_ERR_ALLOC;
    memset(m_piMBIntraProp, 0, sizeof(H264IntraTypesProp) * numberOfBuffers);

    m_local_delta_frame_time = 1.0/30;
    m_local_frame_time       = 0;

    if (0 < init->info.framerate)
    {
        m_local_delta_frame_time = 1 / init->info.framerate;
    }

    m_DPBSizeEx = m_iThreadNum + 1;


    return UMC_OK;
}

Status  TaskSupplier::SetParams(BaseCodecParams* params)
{
    VideoDecoderParams *pParams = DynamicCast<VideoDecoderParams>(params);

    if (NULL == pParams)
        return UMC_ERR_NULL_PTR;

    if (pParams->lTrickModesFlag == 7)
    {
        if (ABSOWN(pParams->dPlaybackRate - 1) > 0.0001)
            m_TrickModeSpeed = 2;
        else
            m_TrickModeSpeed = 1;
    }

    return UMC_OK;
}

void TaskSupplier::Close()
{
    if (m_pTaskBroker)
    {
        m_pTaskBroker->Release();
    }

    if (m_pSegmentDecoder)
    {
        for (Ipp32s i = 1; i < m_iThreadNum; i += 1)
        {
            m_pSegmentDecoder[i]->Reset();
        }

        for (Ipp32s i = 0; i < m_iThreadNum; i += 1)
        {
            delete m_pSegmentDecoder[i];
            m_pSegmentDecoder[i] = 0;
        }
    }

    if (m_pDecodedFramesList)
    {
        for (H264DecoderFrame *pFrame = m_pDecodedFramesList->head(); pFrame; pFrame = pFrame->future())
        {
            pFrame->Reset();
        }

        m_pDecodedFramesList->removeAllRef();
        m_pDecodedFramesList->removeAllDisplayable();
    }

    Ipp32s numberOfBuffers = 2*(m_iThreadNum);

    if (m_ppMBIntraTypes)
    {
        XippsFree(m_ppMBIntraTypes);
        m_ppMBIntraTypes = 0;
    }

    if (m_piMBIntraProp)
    {
        for (Ipp32s i = 0; i < numberOfBuffers; i++)
        {
            if (m_piMBIntraProp[i].m_nSize == 0)
                continue;
            m_pMemoryAllocator->Unlock(m_piMBIntraProp[i].m_mid);
            m_pMemoryAllocator->Free(m_piMBIntraProp[i].m_mid);
        }

        XippsFree(m_piMBIntraProp);
        m_piMBIntraProp = 0;
    }

    delete[] m_pMBInfo;
    m_pMBInfo = 0;

    delete[] m_pSegmentDecoder;
    m_pSegmentDecoder = 0;

    delete m_pTaskBroker;
    m_pTaskBroker = 0;

    DeallocateBuffers();
    m_Headers.Reset();

    delete m_pNALSplitter;
    m_pNALSplitter = 0;

    delete m_pDecodedFramesList;
    m_pDecodedFramesList = 0;
    m_iThreadNum = 0;

    m_bSeqParamSetRead  = false;
    m_bPicParamSetRead  = false;
    m_dpbSize = 1;
    m_DPBSizeEx = 1;
    m_maxDecFrameBuffering = 1;
    m_CurrentSeqParamSet = -1;
    m_CurrentPicParamSet = -1;
}

void TaskSupplier::Reset()
{
    if (m_pTaskBroker)
        m_pTaskBroker->Reset();

    // DEBUG : need to stop threads before and Reset taskBroker
    if (m_pSegmentDecoder)
    {
        for (Ipp32s i = 1; i < m_iThreadNum; i += 1)
        {
            m_pSegmentDecoder[i]->Reset();
        }
    }

    if (m_pDecodedFramesList)
    {
        for (H264DecoderFrame *pFrame = m_pDecodedFramesList->head(); pFrame; pFrame = pFrame->future())
        {
            pFrame->Reset();
        }

        m_pDecodedFramesList->removeAllRef();
        m_pDecodedFramesList->removeAllDisplayable();
    }

    if (m_pNALSplitter)
        m_pNALSplitter->Reset();

    m_Headers.Reset(true);
    Skipping::Reset();
    m_SlicesHeap.Release();
    m_Heap.Reset();

    m_local_frame_time         = 0;

    m_field_index       = 0;
    m_WaitForIDR        = true;

    m_pLastDisplayed = 0;
    m_pCurrentFrame = 0;
    m_pFirstUncompletedFrame = 0;
    m_iCurrentResource = 0;

    m_PicOrderCnt = 0;
    m_PicOrderCntMsb = 0;
    m_PicOrderCntLsb = 0;
    m_FrameNum = 0;
    m_PrevFrameRefNum = 0;
    m_FrameNumOffset = 0;
    m_TopFieldPOC = 0;
    m_BottomFieldPOC = 0;

    if (m_pTaskBroker)
        m_pTaskBroker->Init(m_iThreadNum);
}

void TaskSupplier::AfterErrorRestore()
{
    if (m_pTaskBroker)
        m_pTaskBroker->Reset();

    // DEBUG : need to stop threads before and Reset taskBroker
    for (Ipp32s i = 1; i < m_iThreadNum; i += 1)
    {
        m_pSegmentDecoder[i]->Reset();
    }

    if (m_pDecodedFramesList)
    {
        for (H264DecoderFrame *pFrame = m_pDecodedFramesList->head(); pFrame; pFrame = pFrame->future())
        {
            pFrame->Reset();
        }

        m_pDecodedFramesList->removeAllRef();
        m_pDecodedFramesList->removeAllDisplayable();
    }

    if (m_pNALSplitter)
        m_pNALSplitter->Reset();

    m_Headers.Reset(true);
    Skipping::Reset();
    m_SlicesHeap.Release();
    m_Heap.Reset();

    m_field_index       = 0;

    m_pLastDisplayed = 0;
    m_pCurrentFrame = 0;
    m_pFirstUncompletedFrame = 0;
    m_iCurrentResource = 0;

    if (m_pTaskBroker)
        m_pTaskBroker->Init(m_iThreadNum);
}

Status TaskSupplier::GetInfo(VideoDecoderParams *lpInfo)
{
    Ipp32s seq_index = 0, pic_index = 0;

    lpInfo->pPostProcessing = m_PostProcessing;

    if (m_CurrentSeqParamSet == -1 && !m_bSeqParamSetRead)
    {
        return UMC_ERR_NOT_INITIALIZED;
    }
    else if (m_CurrentSeqParamSet != -1)
    {
        seq_index = m_CurrentSeqParamSet;
    }

    if (m_CurrentPicParamSet == -1 && !m_bPicParamSetRead)
    {
        return UMC_ERR_NOT_INITIALIZED;
    }
    else if(m_CurrentPicParamSet != -1)
    {
        pic_index = m_CurrentPicParamSet;
    }

    H264SeqParamSet *sps = m_Headers.GetSeqParamSet(seq_index);
    H264PicParamSet *pps = m_Headers.GetPicParamSet(pic_index);

    lpInfo->info.clip_info.height = sps->frame_height_in_mbs * 16 -
        SubHeightC[sps->chroma_format_idc]*(2 - sps->frame_mbs_only_flag) *
        (sps->frame_cropping_rect_top_offset + sps->frame_cropping_rect_bottom_offset);

    lpInfo->info.clip_info.width = sps->frame_width_in_mbs * 16 - SubWidthC[sps->chroma_format_idc] *
        (sps->frame_cropping_rect_left_offset + sps->frame_cropping_rect_right_offset);

    if (0.0 < m_local_delta_frame_time)
        lpInfo->info.framerate = 1.0 / m_local_delta_frame_time;
    else
        lpInfo->info.framerate = 0.0;

    lpInfo->info.stream_type     = H264_VIDEO;

    lpInfo->profile = sps->profile_idc;
    lpInfo->level = sps->level_idc;

    lpInfo->numThreads = m_iThreadNum;
    lpInfo->info.color_format = GetColorFormat(sps->chroma_format_idc);

    if (sps->aspect_ratio_idc == 255)
    {
        lpInfo->info.aspect_ratio_width  = sps->sar_width;
        lpInfo->info.aspect_ratio_height = sps->sar_height;
    }
    else
    {
        lpInfo->info.aspect_ratio_width  = SAspectRatio[sps->aspect_ratio_idc][0];
        lpInfo->info.aspect_ratio_height = SAspectRatio[sps->aspect_ratio_idc][1];
    }

    Ipp32u multiplier = 1 << (6 + sps->bit_rate_scale);
    lpInfo->info.bitrate = sps->bit_rate_value[0] * multiplier;

    if (sps->frame_mbs_only_flag)
        lpInfo->info.interlace_type = PROGRESSIVE;
    else
    {
        if (0 <= sps->offset_for_top_to_bottom_field)
            lpInfo->info.interlace_type = INTERLEAVED_TOP_FIELD_FIRST;
        else
            lpInfo->info.interlace_type = INTERLEAVED_BOTTOM_FIELD_FIRST;
    }

    H264VideoDecoderParams *lpH264Info = DynamicCast<H264VideoDecoderParams> (lpInfo);
    if (lpH264Info)
    {
        m_CurrentSeqParamSet = seq_index;
        SetDPBSize();
        lpH264Info->m_DPBSize = m_dpbSize + m_DPBSizeEx;

        IppiSize sz;
        sz.width    = sps->frame_width_in_mbs * 16;
        sz.height   = sps->frame_height_in_mbs * 16;
        lpH264Info->m_fullSize = sz;

        lpH264Info->m_entropy_coding_type = pps->entropy_coding_mode;
    }

    return UMC_OK;
}

Status TaskSupplier::AllocateBuffers(bool exactSizeRequested)
{
    Status      umcRes = UMC_OK;
    IppiSize desiredPaddedSize;

    H264SeqParamSet* sps = m_Headers.GetSeqParamSet(m_CurrentSeqParamSet);

    IppiSize  size;
    size.width = sps->frame_width_in_mbs * 16;
    size.height = sps->frame_height_in_mbs * 16;

    desiredPaddedSize.width  = (size.width  + 15) & ~15;
    desiredPaddedSize.height = (size.height + 15) & ~15;

    // If our buffer and internal pointers are already set up for this
    // image size, then there's nothing more to do.
    // But if exactSizeRequested, we need to see if our existing
    // buffer is oversized, and perhaps reallocate it.

    if (m_paddedParsedDataSize.width == desiredPaddedSize.width &&
        m_paddedParsedDataSize.height == desiredPaddedSize.height &&
        !exactSizeRequested)
        return umcRes;

    // Determine how much space we need
    Ipp32s     MB_Frame_Width   = desiredPaddedSize.width >> 4;
    Ipp32s     MB_Frame_Height  = desiredPaddedSize.height >> 4;

    Ipp32s     uMBMapSize   = MB_Frame_Width * MB_Frame_Height;
    Ipp32s     next_mb_size = (Ipp32s)(MB_Frame_Width*MB_Frame_Height*sizeof(H264DecoderMBAddr));

    Ipp32s     totalSize = 2*next_mb_size + uMBMapSize + YUV_ALIGNMENT;

    // Reallocate our buffer if its size is not appropriate.
    if (m_parsedDataLength < totalSize ||
        (exactSizeRequested && (m_parsedDataLength != totalSize)))
    {
        DeallocateBuffers();

        if (m_pMemoryAllocator->Alloc(&m_midParsedData,
                                      totalSize,
                                      UMC_ALLOC_PERSISTENT))
            return UMC_ERR_ALLOC;

        m_pParsedData = (Ipp8u *) m_pMemoryAllocator->Lock(m_midParsedData);
        XippsZero_8u(m_pParsedData, totalSize);

        m_parsedDataLength = totalSize;
    }

    // Reassign our internal pointers if need be
    if (m_paddedParsedDataSize.width != desiredPaddedSize.width ||
        m_paddedParsedDataSize.height != desiredPaddedSize.height)
    {
        m_paddedParsedDataSize = desiredPaddedSize;

        size_t     offset = 0;

        m_pMBMap = align_pointer<Ipp8u *> (m_pParsedData);
        offset += uMBMapSize;

        if (offset & 0x7)
            offset = (offset + 7) & ~7;
        next_mb_tables[0] = align_pointer<H264DecoderMBAddr *> (m_pParsedData + offset);

        offset += next_mb_size;

        if (offset & 0x7)
            offset = (offset + 7) & ~7;

        next_mb_tables[1] = align_pointer<H264DecoderMBAddr *> (m_pParsedData + offset);

        offset += next_mb_size;

        //initialize first table

        Ipp32s i;

        for (i = 0; i < uMBMapSize; i++)
            next_mb_tables[0][i] = i + 1; // simple linear scan

        // Note that most of the slice data buffer will be usually unused,
        // as it is allocated for worst case. Only the first few entriies
        // (and frequently only the first) are typically used.
    }

    return umcRes;
}

void TaskSupplier::DeallocateBuffers()
{
    if (m_pParsedData)
    {
        // Free the old buffer.
        m_pMemoryAllocator->Unlock(m_midParsedData);
        m_pMemoryAllocator->Free(m_midParsedData);
        m_pParsedData = 0;
        m_midParsedData = 0;
    }

    m_parsedDataLength = 0;
    m_paddedParsedDataSize.width = 0;
    m_paddedParsedDataSize.height = 0;
}

H264DecoderFrame *TaskSupplier::GetFreeFrame(void)
{
    H264DecoderFrame *pFrame = 0;

    // Traverse list for next disposable frame
    pFrame = m_pDecodedFramesList->GetOldestDisposable();

    VM_ASSERT(!pFrame || pFrame->GetBusyState() == 0);

    // Did we find one?
    if (NULL == pFrame)
    {
        if (m_pDecodedFramesList->countAllFrames() > m_dpbSize + m_DPBSizeEx)
        {
            return 0;
        }

        // Didn't find one. Let's try to insert a new one
        pFrame = new H264DecoderFrameExtension(m_pMemoryAllocator);
        if (NULL == pFrame)
            return 0;

        m_pDecodedFramesList->append(pFrame);
    }

    pFrame->GetAU(0)->SetHeaps(&m_Heap, &m_SlicesHeap);
    pFrame->GetAU(1)->SetHeaps(&m_Heap, &m_SlicesHeap);

    pFrame->Reset();

    if (GetAuxiliaryFrame(pFrame))
    {
        GetAuxiliaryFrame(pFrame)->Reset();
    }

    if (m_pCurrentFrame == pFrame)
    {
        m_pCurrentFrame = 0;
    }

    return pFrame;
}

Status TaskSupplier::DecodeSEI(MediaDataEx::_MediaDataEx * pSource, H264MemoryPiece * pMem)
{
    if (m_CurrentSeqParamSet == -1)
        return UMC_OK;

    H264Bitstream bitStream;

    try
    {
        bitStream.Reset((Ipp8u*)pMem->GetPointer() + pSource->offsets[0],
            pSource->offsets[1] - pSource->offsets[0]);

        Status umcRes = UMC_OK;
        while ((UMC_OK == umcRes) &&
               (0 == bitStream.GetSCP()))
        {
            umcRes = bitStream.AdvanceToNextSCP();
        }

        NAL_Unit_Type uNALUnitType;
        Ipp8u uNALStorageIDC;

        bitStream.GetNALUnitType(uNALUnitType, uNALStorageIDC);

        do
        {
            H264SEIPayLoad    m_SEIPayLoads;

            bitStream.ParseSEI(&(m_Headers.m_SeqParamSet[0]),
                               m_CurrentSeqParamSet, &m_SEIPayLoads);

            if (m_SEIPayLoads.payLoadType == SEI_USER_DATA_REGISTERED_TYPE)
            {
                m_UserData.Reset();
                m_UserData = m_SEIPayLoads;
                m_SEIPayLoads.user_data = 0;
            }
            else
            {
                H264SEIPayLoad * spl = m_Headers.GetSEISet(m_SEIPayLoads.payLoadType);
                if (m_Headers.AddSEISet(&m_SEIPayLoads, (!m_pCurrentFrame || m_pCurrentFrame->GetBusyState() < 2) ))
                {
                    NotifiersChain *notif = m_pCurrentFrame->GetNotifiersChain();
                    notif->AddNotifier(new notifier2<Headers, Ipp32s, void*>(&m_Headers, &Headers::Signal, 3, spl));
                }
            }

        } while (bitStream.More_RBSP_Data());

    } catch(...)
    {
        // nothing to do just catch it
    }

    return UMC_OK;
}

Status TaskSupplier::DecodeHeaders(MediaDataEx::_MediaDataEx *pSource, H264MemoryPiece * pMem)
{
    Status umcRes = UMC_OK;

    H264Bitstream bitStream;
    try
    {
        Ipp32s nalIndex = pSource->index;

        bitStream.Reset((Ipp8u*)pMem->GetPointer() + pSource->offsets[nalIndex],
            pSource->offsets[nalIndex + 1] - pSource->offsets[nalIndex]);

        while ((UMC_OK == umcRes) &&
               (0 == bitStream.GetSCP()))
        {
            umcRes = bitStream.AdvanceToNextSCP();
        }

        if (UMC_OK != umcRes)
            return UMC_ERR_INVALID_STREAM;

        NAL_Unit_Type uNALUnitType;
        Ipp8u uNALStorageIDC;

        bitStream.GetNALUnitType(uNALUnitType, uNALStorageIDC);

        switch(uNALUnitType)
        {
            // sequence parameter set
        case NAL_UT_SPS:
            {
                H264SeqParamSet sps;
                umcRes = bitStream.GetSequenceParamSet(&sps);
                if (umcRes == UMC_OK)
                {
                    DEBUG_PRINT((VM_STRING("debug headers SPS - %d \n"), sps.seq_parameter_set_id));
                    H264SeqParamSet * temp = m_Headers.GetSeqParamSet(sps.seq_parameter_set_id);
                    if (m_Headers.AddSeqParamSet(&sps, (!m_pCurrentFrame || m_pCurrentFrame->GetBusyState() < 2)))
                    {
                        NotifiersChain *notif = m_pCurrentFrame->GetNotifiersChain();
                        notif->AddNotifier(new notifier2<Headers, Ipp32s, void*>(&m_Headers, &Headers::Signal, 0, temp));
                    }

                    sps.poffset_for_ref_frame = 0; // avoid twice deleting
                    // DEBUG : (todo - implement copy constructor and assigment operator)

                    m_bSeqParamSetRead = true;

                    // Validate the incoming bitstream's image dimensions.
                    m_CurrentSeqParamSet = sps.seq_parameter_set_id;
                    umcRes = SetDPBSize();
                    m_maxDecFrameBuffering = sps.max_dec_frame_buffering ?
                        sps.max_dec_frame_buffering : m_dpbSize;

                    if (m_TrickModeSpeed != 1)
                    {
                        m_maxDecFrameBuffering = 0;
                    }

                    AllocateBuffers(false);
                    if (umcRes != UMC_OK)
                        return umcRes;
                }
                else
                    return UMC_ERR_INVALID_STREAM;
            }
            break;

        case NAL_UT_SPS_EX:
            {
                H264SeqParamSetExtension sps_ex;
                umcRes = bitStream.GetSequenceParamSetExtension(&sps_ex);

                if (umcRes == UMC_OK)
                {
                    H264SeqParamSetExtension * temp = m_Headers.GetSeqParamSetEx(sps_ex.seq_parameter_set_id);
                    if (m_Headers.AddSeqParamSetEx(&sps_ex, (!m_pCurrentFrame || m_pCurrentFrame->GetBusyState() < 2)))
                    {
                        NotifiersChain *notif = m_pCurrentFrame->GetNotifiersChain();
                        notif->AddNotifier(new notifier2<Headers, Ipp32s, void*>(&m_Headers, &Headers::Signal, 1, temp));
                    }
                }
                else
                    return UMC_ERR_INVALID_STREAM;
            }
            break;

            // picture parameter set
        case NAL_UT_PPS:
            {
                H264PicParamSet pps;
                // set illegal id
                pps.pic_parameter_set_id = MAX_NUM_PIC_PARAM_SETS;

                // Get id
                umcRes = bitStream.GetPictureParamSetPart1(&pps);
                if (UMC_OK == umcRes)
                {
                    H264SeqParamSet *pRefsps = m_Headers.GetSeqParamSet(pps.seq_parameter_set_id);

                    if (!pRefsps || pRefsps ->seq_parameter_set_id >= MAX_NUM_SEQ_PARAM_SETS)
                        return UMC_ERR_INVALID_STREAM;

                    // Get rest of pic param set
                    umcRes = bitStream.GetPictureParamSetPart2(&pps, pRefsps);
                    if (UMC_OK == umcRes)
                    {
                        DEBUG_PRINT((VM_STRING("debug headers PPS - %d - SPS - %d\n"), pps.pic_parameter_set_id, pps.seq_parameter_set_id));
                        H264PicParamSet * temp = m_Headers.GetPicParamSet(pps.pic_parameter_set_id);
                        if (m_Headers.AddPicParamSet(&pps, (!m_pCurrentFrame || m_pCurrentFrame->GetBusyState() < 2)))
                        {
                            NotifiersChain *notif = m_pCurrentFrame->GetNotifiersChain();
                            notif->AddNotifier(new notifier2<Headers, Ipp32s, void*>(&m_Headers, &Headers::Signal, 2, temp));
                        }

                        pps.SliceGroupInfo.t3.pSliceGroupIDMap = 0; // avoid twice deleting
                        // DEBUG : (todo - implement copy constructor and assigment operator)

                        m_bPicParamSetRead = true;

                        m_CurrentPicParamSet = pps.pic_parameter_set_id;

                        // reset current picture parameter set number
                        if (0 > m_CurrentPicParamSet)
                        {
                            m_CurrentPicParamSet = pps.pic_parameter_set_id;
                            m_CurrentSeqParamSet = pps.seq_parameter_set_id;
                        }
                    }
                }
            }
            break;

        default:
            break;
        }
    }
    catch(const h264_exception & ex)
    {
        return ex.GetStatus();
    }
    catch(...)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    return UMC_OK;

} // Status TaskSupplier::DecodeHeaders(MediaDataEx::_MediaDataEx *pSource, H264MemoryPiece * pMem)

//////////////////////////////////////////////////////////////////////////////
// ProcessFrameNumGap
//
// A non-sequential frame_num has been detected. If the sequence parameter
// set field gaps_in_frame_num_value_allowed_flag is non-zero then the gap
// is OK and "non-existing" frames will be created to correctly fill the
// gap. Otherwise the gap is an indication of lost frames and the need to
// handle in a reasonable way.
//////////////////////////////////////////////////////////////////////////////
Status TaskSupplier::ProcessFrameNumGap(H264Slice *slice, Ipp32s field)
{
    Status umcRes = UMC_OK;

    H264SliceHeader *sliceHeader = slice->GetSliceHeader();
    H264SeqParamSet* sps = slice->GetSeqParam();

    Ipp32s uMaxFrameNum = (1<<sps->log2_max_frame_num);
    Ipp32s frameNumGap;

    if (sliceHeader->idr_flag)
        return UMC_OK;

    // Capture any frame_num gap
    if (sliceHeader->frame_num != m_PrevFrameRefNum &&
        sliceHeader->frame_num != (m_PrevFrameRefNum + 1) % uMaxFrameNum)
    {
        // note this could be negative if frame num wrapped

        if (sliceHeader->frame_num > m_PrevFrameRefNum - 1)
        {
            frameNumGap = (sliceHeader->frame_num - m_PrevFrameRefNum - 1) % uMaxFrameNum;
        }
        else
        {
            frameNumGap = (uMaxFrameNum - (m_PrevFrameRefNum + 1 - sliceHeader->frame_num)) % uMaxFrameNum;
        }

        if (frameNumGap > m_dpbSize)
        {
            frameNumGap = m_dpbSize;
        }
    }
    else
    {
        frameNumGap = 0;
        return UMC_OK;
    }

    if (sps->gaps_in_frame_num_value_allowed_flag != 1)
        return UMC_OK;

    if (m_pCurrentFrame)
    {
        m_pCurrentFrame = 0;
        return UMC_ERR_ALLOC;
    }

    DEBUG_PRINT((VM_STRING("frame gap - %d\n"), frameNumGap));

    // Fill the frame_num gap with non-existing frames. For each missing
    // frame:
    //  - allocate a frame
    //  - set frame num and pic num
    //  - update FrameNumWrap for all reference frames
    //  - use sliding window frame marking to free oldest reference
    //  - mark the frame as short-term reference
    // The picture part of the generated frames is unimportant -- it will
    // not be used for reference.

    // set to first missing frame. Note that if frame number wrapped during
    // the gap, the first missing frame_num could be larger than the
    // current frame_num. If that happened, FrameNumGap will be negative.
    //VM_ASSERT((Ipp32s)sliceHeader->frame_num > frameNumGap);
    Ipp32s frame_num = sliceHeader->frame_num - frameNumGap;

    while ((frame_num != sliceHeader->frame_num) &&
        (umcRes == UMC_OK))
    {
        // allocate a frame
        // Traverse list for next disposable frame
        H264DecoderFrame *pFrame = GetFreeFrame();

        // Did we find one?
        if (!pFrame)
        {
            return UMC_ERR_ALLOC;
        }

        Status umcRes = InitFreeFrame(pFrame, slice);

        m_pDecodedFramesList->MoveToTail(pFrame);

        if (umcRes != UMC_OK)
        {
            return UMC_ERR_ALLOC;
        }

        pFrame->DefaultFill(2, false);

        frameNumGap--;

        if (sps->pic_order_cnt_type != 0)
        {
            Ipp32s tmp1 = sliceHeader->delta_pic_order_cnt[0];
            Ipp32s tmp2 = sliceHeader->delta_pic_order_cnt[1];
            sliceHeader->delta_pic_order_cnt[0] = sliceHeader->delta_pic_order_cnt[1] = 0;

            DecodePictureOrderCount(slice, frame_num);

            sliceHeader->delta_pic_order_cnt[0] = tmp1;
            sliceHeader->delta_pic_order_cnt[1] = tmp2;
        }

        // Set frame num and pic num for the missing frame
        pFrame->setFrameNum(frame_num);
        m_PrevFrameRefNum = frame_num;
        m_FrameNum = frame_num;

        if (sliceHeader->field_pic_flag)
        {
            pFrame->setPicOrderCnt(m_PicOrderCnt,0);
            pFrame->setPicOrderCnt(m_PicOrderCnt,1);
        }
        else
        {
            pFrame->setPicOrderCnt(m_TopFieldPOC, 0);
            pFrame->setPicOrderCnt(m_BottomFieldPOC, 1);
        }

        DEBUG_PRINT((VM_STRING("frame gap - with poc %d %d added\n"), pFrame->m_PicOrderCnt[0], pFrame->m_PicOrderCnt[1]));

        if (sliceHeader->field_pic_flag == 0)
        {
            pFrame->setPicNum(frame_num, 0);
        }
        else
        {
            pFrame->setPicNum(frame_num*2+1, 0);
            pFrame->setPicNum(frame_num*2+1, 1);
        }

        // Update frameNumWrap and picNum for all decoded frames

        H264DecoderFrame *pFrm;
        H264DecoderFrame * pHead = m_pDecodedFramesList->head();
        for (pFrm = pHead; pFrm; pFrm = pFrm->future())
        {
            // TBD: modify for fields
            pFrm->UpdateFrameNumWrap(frame_num,
                uMaxFrameNum,
                pFrame->m_PictureStructureForRef+
                pFrame->m_bottom_field_flag[field]);
        }

        // sliding window ref pic marking
        SlideWindow(slice, 0, true);

        pFrame->SetisShortTermRef(0);
        pFrame->SetisShortTermRef(1);

        {
            // reset frame global data
            H264DecoderMacroblockGlobalInfo *pMBInfo = pFrame->m_mbinfo.mbs;
            memset(pMBInfo, 0, pFrame->totalMBs*sizeof(H264DecoderMacroblockGlobalInfo));            
        }

        // next missing frame
        frame_num++;
        if (frame_num >= uMaxFrameNum)
            frame_num = 0;

        // Set current as displayable and was outputted.
        pFrame->SetBusyState(2);
        pFrame->SetisDisplayable();
        pFrame->SetSkipped(true);
        pFrame->SetFrameExistFlag(false);

    }   // while

    return m_pDecodedFramesList->IsDisposableExist() ? UMC_OK : UMC_ERR_ALLOC;
}   // ProcessFrameNumGap

Status TaskSupplier::SetDPBSize()
{
    Status umcRes = UMC_OK;
    Ipp32u MaxDPBx2;
    Ipp32u dpbLevel;
    Ipp32u dpbSize;

    H264SeqParamSet* sps = m_Headers.GetSeqParamSet(m_CurrentSeqParamSet);

    // MaxDPB, per Table A-1, Level Limits
    switch (sps->level_idc)
    {
    case 10:
        MaxDPBx2 = 297;
        break;
    case 11:
        MaxDPBx2 = 675;
        break;
    case 12:
    case 13:
    case 20:
        MaxDPBx2 = 891*2;
        break;
    case 21:
        MaxDPBx2 = 1782*2;
        break;
    case 22:
    case 30:
        MaxDPBx2 = 6075;
        break;
    case 31:
        MaxDPBx2 = 6750*2;
        break;
    case 32:
        MaxDPBx2 = 7680*2;
        break;
    case 40:
    case 41:
    case 42:
        MaxDPBx2 = 12288*2;
        break;
    case 50:
        MaxDPBx2 = 41400*2;
        break;
    case 51:
        MaxDPBx2 = 69120*2;
        break;
    default:
        MaxDPBx2 = 69120*2; //get as much as we may
        //umcRes = UMC_ERR_INVALID_STREAM;
    }

    if (umcRes == UMC_OK)
    {
        Ipp32u width, height;

        width = sps->frame_width_in_mbs*16;
        height = sps->frame_height_in_mbs*16;

        dpbLevel = (MaxDPBx2 * 512) / ((width * height) + ((width * height)>>1));
        dpbSize = IPP_MIN(16, dpbLevel);

        // we must have enough additional frames to do good frame parallelization
        m_dpbSize = dpbSize;
    }

    return umcRes;

}    // setDPBSize

bool TaskSupplier::GetFrameToDisplay(MediaData *dst, bool force)
{
    // Perform output color conversion and video effects, if we didn't
    // already write our output to the application's buffer.
    VideoData *pVData = DynamicCast<VideoData> (dst);
    if (!pVData)
        return false;


    m_pLastDisplayed = 0;

    H264DecoderFrame * pFrame = GetFrameToDisplayInternal(dst, force);
    if (!pFrame)
    {
        return false;
    }

    m_pLastDisplayed = pFrame;
    pVData->SetInvalid(pFrame->GetError());

    if (m_pLastDisplayed->IsSkipped())
    {
        pVData->SetDataSize(1);
        pFrame->setWasOutputted();
        return true;
    }

    InitColorConverter(pFrame, 0);
    m_LastDecodedFrame.SetTime(dst->GetTime());

    {
        if (m_PostProcessing->GetFrame(&m_LastDecodedFrame, pVData) != UMC_OK)
        {
            pVData->SetDataSize(0);
            pFrame->setWasOutputted();
            return false;
        }
    }

    pVData->SetDataSize(pVData->GetMappingSize());
    pFrame->setWasOutputted();

    return true;
}

bool TaskSupplier::IsWantToShowFrame(bool force)
{
    if (m_pDecodedFramesList->countNumDisplayable() > m_maxDecFrameBuffering ||
        force)
    {
        H264DecoderFrame * pTmp = m_pDecodedFramesList->findOldestDisplayable(m_dpbSize);
        return !!pTmp;
    }

    return false;
}

H264DecoderFrame *TaskSupplier::GetFrameToDisplayInternal(MediaData *dst, bool force)
{
    H264DecoderFrame *pTmp;

    if (!dst)
        return 0;

    for (;;)
    {
        // show oldest frame
        if (m_pDecodedFramesList->countNumDisplayable() >= m_maxDecFrameBuffering ||
            force)
        {
            if (m_maxDecFrameBuffering)
            {
                pTmp = m_pDecodedFramesList->findOldestDisplayable(m_dpbSize);
            }
            else
            {
                pTmp = m_pDecodedFramesList->findFirstDisplayable();
            }

            if (pTmp && pTmp->GetBusyState() < 2)
            {
                Ipp64f time;

                if (!pTmp->IsFrameExist())
                {
                    pTmp->setWasOutputted();
                    continue;
                }

                // set time
                if (pTmp->m_dFrameTime > -1.0)
                {
                    time = pTmp->m_dFrameTime;
                    dst->SetTime(time);
                    //m_LastDecodedFrame.SetTime(time);
                    m_local_frame_time = time;
                }
                else
                {
                    //m_LastDecodedFrame.SetTime(m_local_frame_time);
                    pTmp->m_dFrameTime = m_local_frame_time;
                    dst->SetTime(m_local_frame_time);
                }

                if (!pTmp->post_procces_complete)
                {
                    //static Ipp32s count = 0;
                    m_local_frame_time += m_local_delta_frame_time;
                    pTmp->post_procces_complete = true;
                    DEBUG_PRINT((VM_STRING("Outputted POC - %d, busyState - %d\n"), pTmp->m_PicOrderCnt[0], pTmp->GetBusyState()));
                }

                if (pTmp->IsSkipped())
                {
                    return pTmp;
                }
            }
            else
            {
                return 0;
            }

            return pTmp;
        }
        else // there are no frames to show
            return NULL;
    }
}

void TaskSupplier::SetMBMap(H264DecoderFrame *frame)
{
    Ipp32u mbnum, i;
    Ipp32s prevMB;
    Ipp32u uNumMBCols;
    Ipp32u uNumMBRows;
    Ipp32u uNumSliceGroups;
    Ipp32u uNumMapUnits;
    H264Slice * slice = frame->GetAU(0)->GetAnySlice();
    H264PicParamSet *pps = slice->GetPicParam();
    H264SliceHeader * sliceHeader = slice->GetSliceHeader();
    Ipp32s PrevMapUnit[MAX_NUM_SLICE_GROUPS];
    Ipp32s SliceGroup, FirstMB;
    Ipp8u *pMap = NULL;
    bool bSetFromMap = false;

    uNumMBCols = frame->macroBlockSize().width;
    uNumMBRows = frame->macroBlockSize().height;
    FirstMB = 0;
    // TBD: update for fields:
    uNumMapUnits = uNumMBCols*uNumMBRows;
    uNumSliceGroups = pps->num_slice_groups;

    if (uNumSliceGroups == 1)
    {
        m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[0];
    }
    else
    {
        Ipp32s times = frame->m_PictureStructureForDec < FRM_STRUCTURE ? 2 : 1;
        for (Ipp32s j = 0; j < times; j++)
        {

            if (frame->m_PictureStructureForDec < FRM_STRUCTURE)
            {
                if (j)
                {
                    FirstMB = frame->totalMBs;
                    uNumMapUnits <<= 1;
                }
                else
                {
                    uNumMapUnits >>= 1;
                    uNumMBRows >>= 1;
                }
            }

            //since main profile doesn't allow slice groups to be >1 and in baseline no fields (or mbaffs) allowed
            //the following memset is ok.
            // > 1 slice group
            switch (pps->SliceGroupInfo.slice_group_map_type)
            {
            case 0:
                {
                    // interleaved slice groups: run_length for each slice group,
                    // repeated until all MB's are assigned to a slice group
                    Ipp32u NumThisGroup;

                    // Init PrevMapUnit to -1 (none), for first unit of each slice group
                    for (i=0; i<uNumSliceGroups; i++)
                        PrevMapUnit[i] = -1;

                    SliceGroup = 0;
                    NumThisGroup = 0;
                    prevMB = -1;
                    for (mbnum = FirstMB; mbnum < uNumMapUnits; mbnum++)
                    {
                        if (NumThisGroup == pps->SliceGroupInfo.run_length[SliceGroup])
                        {
                            // new slice group
                            PrevMapUnit[SliceGroup] = prevMB;
                            SliceGroup++;
                            if (SliceGroup == (Ipp32s)uNumSliceGroups)
                                SliceGroup = 0;
                            prevMB = PrevMapUnit[SliceGroup];
                            NumThisGroup = 0;
                        }
                        if (prevMB >= 0)
                        {
                            // new
                            next_mb_tables[1][prevMB] = mbnum;
                        }
                        prevMB = mbnum;
                        NumThisGroup++;
                    }
                }
                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[1];
                break;

            case 1:
                // dispersed
                {
                    Ipp32u row, col;

                    // Init PrevMapUnit to -1 (none), for first unit of each slice group
                    for (i=0; i<uNumSliceGroups; i++)
                        PrevMapUnit[i] = -1;

                    mbnum = FirstMB;
                    for (row = 0; row < uNumMBRows; row++)
                    {
                        SliceGroup = ((row * uNumSliceGroups)/2) % uNumSliceGroups;
                        for (col=0; col<uNumMBCols; col++)
                        {
                            prevMB = PrevMapUnit[SliceGroup];
                            if (prevMB != -1)
                            {
                                next_mb_tables[1][prevMB]  = mbnum;
                            }
                            PrevMapUnit[SliceGroup] = mbnum;
                            mbnum++;
                            SliceGroup++;
                            if (SliceGroup == (Ipp32s)uNumSliceGroups)
                                SliceGroup = 0;
                        }    // col
                    }    // row
                }

                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[1];
                break;

            case 2:
                {
                    // foreground + leftover: Slice groups are rectangles, any MB not
                    // in a defined rectangle is in the leftover slice group, a MB within
                    // more than one rectangle is in the lower-numbered slice group.

                    // Two steps:
                    // 1. Set m_pMBMap with slice group for all MBs.
                    // 2. Set nextMB fields of MBInfo from m_pMBMap.

                    Ipp32u RectUpper, RectLeft, RectRight, RectLower;
                    Ipp32u RectRows, RectCols;
                    Ipp32u row, col;

                    // First init all as leftover
                    for (mbnum=FirstMB; mbnum<uNumMapUnits; mbnum++)
                        m_pMBMap[mbnum] = (Ipp8u)(uNumSliceGroups - 1);

                    // Next set those in slice group rectangles, from back to front
                    for (SliceGroup = (Ipp32s)(uNumSliceGroups - 2); SliceGroup >= 0; SliceGroup--)
                    {
                        mbnum = pps->SliceGroupInfo.t1.top_left[SliceGroup];
                        RectUpper = pps->SliceGroupInfo.t1.top_left[SliceGroup] / uNumMBCols;
                        RectLeft = pps->SliceGroupInfo.t1.top_left[SliceGroup] % uNumMBCols;
                        RectLower = pps->SliceGroupInfo.t1.bottom_right[SliceGroup] / uNumMBCols;
                        RectRight = pps->SliceGroupInfo.t1.bottom_right[SliceGroup] % uNumMBCols;
                        RectRows = RectLower - RectUpper + 1;
                        RectCols = RectRight - RectLeft + 1;

                        for (row = 0; row < RectRows; row++)
                        {
                            for (col=0; col < RectCols; col++)
                            {
                                m_pMBMap[mbnum+col] = (Ipp8u)SliceGroup;
                            }    // col
                            mbnum += uNumMBCols;
                        }    // row
                    }    // SliceGroup
                }
                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[1];

                pMap = m_pMBMap;
                bSetFromMap = true;        // to cause step 2 to occur below
                break;
            case 3:
                {
                    // Box-out, clockwise or counterclockwise. Result is two slice groups,
                    // group 0 included by the box, group 1 excluded.

                    // Two steps:
                    // 1. Set m_pMBMap with slice group for all MBs.
                    // 2. Set nextMB fields of MBInfo from m_pMBMap.

                    Ipp32u x, y, leftBound, topBound, rightBound, bottomBound;
                    Ipp32s xDir, yDir;
                    Ipp32u mba;
                    Ipp32u dir_flag = pps->SliceGroupInfo.t2.slice_group_change_direction_flag;
                    Ipp32u uNumInGroup0;
                    Ipp32u uGroup0Count = 0;

                    SliceGroup = 1;        // excluded group

                    uNumInGroup0 = IPP_MIN(pps->SliceGroupInfo.t2.slice_group_change_rate *
                                    sliceHeader->slice_group_change_cycle, uNumMapUnits - FirstMB);
                    if (uNumInGroup0 >= uNumMapUnits)
                    {
                        // all units in group 0
                        uNumInGroup0 = uNumMapUnits;
                        SliceGroup = 0;
                        uGroup0Count = uNumInGroup0;    // to skip box out
                    }

                    // First init all
                    for (mbnum = FirstMB; mbnum < uNumMapUnits; mbnum++)
                        m_pMBMap[mbnum] = (Ipp8u)SliceGroup;

                    // Next the box-out algorithm to change included MBs to group 0

                    // start at center
                    x = (uNumMBCols - dir_flag)>>1;
                    y = (uNumMBRows - dir_flag)>>1;
                    leftBound = rightBound = x;
                    topBound = bottomBound = y;
                    xDir = dir_flag - 1;
                    yDir = dir_flag;

                    // expand out from center until group 0 includes the required number
                    // of units
                    while (uGroup0Count < uNumInGroup0)
                    {
                        mba = x + y*uNumMBCols;
                        if (m_pMBMap[mba + FirstMB] == 1)
                        {
                            // add MB to group 0
                            m_pMBMap[mba + FirstMB] = 0;
                            uGroup0Count++;
                        }
                        if (x == leftBound && xDir == -1)
                        {
                            if (leftBound > 0)
                            {
                                leftBound--;
                                x--;
                            }
                            xDir = 0;
                            yDir = dir_flag*2 - 1;
                        }
                        else if (x == rightBound && xDir == 1)
                        {
                            if (rightBound < uNumMBCols - 1)
                            {
                                rightBound++;
                                x++;
                            }
                            xDir = 0;
                            yDir = 1 - dir_flag*2;
                        }
                        else if (y == topBound && yDir == -1)
                        {
                            if (topBound > 0)
                            {
                                topBound--;
                                y--;
                            }
                            xDir = 1 - dir_flag*2;
                            yDir = 0;
                        }
                        else if (y == bottomBound && yDir == 1)
                        {
                            if (bottomBound < uNumMBRows - 1)
                            {
                                bottomBound++;
                                y++;
                            }
                            xDir = dir_flag*2 - 1;
                            yDir = 0;
                        }
                        else
                        {
                            x += xDir;
                            y += yDir;
                        }
                    }    // while
                }

                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[1];

                pMap = m_pMBMap;
                bSetFromMap = true;        // to cause step 2 to occur below
                break;
            case 4:
                // raster-scan: 2 slice groups. Both groups contain units ordered
                // by raster-scan, so initializing nextMB for simple raster-scan
                // ordering is all that is required.
                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[0];
                break;
            case 5:
                // wipe: 2 slice groups, the vertical version of case 4. Init
                // nextMB by processing the 2 groups as two rectangles (left
                // and right); to allow for the break between groups occurring
                // not at a column boundary, the rectangles also have an upper
                // and lower half (same heights both rectangles) that may vary
                // in width from one another by one macroblock, for example:
                //  L L L L R R R R R
                //  L L L L R R R R R
                //  L L L R R R R R R
                //  L L L R R R R R R
                {
                    Ipp32u uNumInGroup0;
                    Ipp32u uNumInLGroup;
                    Ipp32s SGWidth;
                    Ipp32s NumUpperRows;
                    Ipp32s NumRows;
                    Ipp32s row, col;
                    Ipp32s iMBNum;

                    uNumInGroup0 = IPP_MIN(pps->SliceGroupInfo.t2.slice_group_change_rate *
                                    sliceHeader->slice_group_change_cycle, uNumMapUnits - FirstMB);
                    if (uNumInGroup0 >= uNumMapUnits)
                    {
                        // all units in group 0
                        uNumInGroup0 = uNumMapUnits;
                    }
                    if (pps->SliceGroupInfo.t2.slice_group_change_direction_flag == 0)
                        uNumInLGroup = uNumInGroup0;
                    else
                        uNumInLGroup = uNumMapUnits - uNumInGroup0;

                    if (uNumInLGroup > 0)
                    {
                        // left group
                        NumUpperRows = uNumInLGroup % uNumMBRows;
                        NumRows = uNumMBRows;
                        SGWidth = uNumInLGroup / uNumMBRows;        // lower width, left
                        if (NumUpperRows)
                        {
                            SGWidth++;            // upper width, left

                            // zero-width lower case
                            if (SGWidth == 1)
                                NumRows = NumUpperRows;
                        }
                        iMBNum = FirstMB;

                        for (row = 0; row < NumRows; row++)
                        {
                            col = 0;
                            while (col < SGWidth-1)
                            {
                                next_mb_tables[1][iMBNum + col] = (iMBNum + col + 1);
                                col++;
                            }    // col

                            // next for last MB on row
                            next_mb_tables[1][iMBNum + col] = (iMBNum + uNumMBCols);
                            iMBNum += uNumMBCols;

                            // time to switch to lower?
                            NumUpperRows--;
                            if (NumUpperRows == 0)
                                SGWidth--;
                        }    // row
                    }    // left group

                    if (uNumInLGroup < uNumMapUnits)
                    {
                        // right group
                        NumUpperRows = uNumInLGroup % uNumMBRows;
                        NumRows = uNumMBRows;
                        // lower width, right:
                        SGWidth = uNumMBCols - uNumInLGroup / uNumMBRows;
                        if (NumUpperRows)
                            SGWidth--;            // upper width, right
                        if (SGWidth > 0)
                        {
                            // first MB is on first row
                            iMBNum = uNumMBCols - SGWidth;
                        }
                        else
                        {
                            // zero-width upper case
                            SGWidth = 1;
                            iMBNum = (NumUpperRows + 1)*uNumMBCols - 1;
                            NumRows = uNumMBRows - NumUpperRows;
                            NumUpperRows = 0;
                        }

                        for (row = 0; row < NumRows; row++)
                        {
                            col = 0;
                            while (col < SGWidth-1)
                            {
                                next_mb_tables[1][iMBNum + col] = (iMBNum + col + 1);
                                col++;
                            }    // col

                            // next for last MB on row
                            next_mb_tables[1][iMBNum + col] = (iMBNum + uNumMBCols);

                            // time to switch to lower?
                            NumUpperRows--;
                            if (NumUpperRows == 0)
                            {
                                SGWidth++;
                                // fix next for last MB on row
                                next_mb_tables[1][iMBNum + col]= (iMBNum+uNumMBCols - 1);
                                iMBNum--;
                            }

                            iMBNum += uNumMBCols;

                        }    // row
                    }    // right group
                }

                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[1];
                break;
            case 6:
                // explicit map read from bitstream, contains slice group id for
                // each map unit
                m_pMBInfo[frame->m_iResourceNumber].active_next_mb_table = next_mb_tables[1];
                pMap = pps->SliceGroupInfo.t3.pSliceGroupIDMap;
                bSetFromMap = true;
                break;
            default:
                // can't happen
                VM_ASSERT(0);

            }    // switch map type

            if (bSetFromMap)
            {
                // Set the nextMB MBInfo field of a set of macroblocks depending upon
                // the slice group information in the map, to create an ordered
                // (raster-scan) linked list of MBs for each slice group. The first MB
                // of each group will be identified by the first slice header for each
                // group.

                // For each map unit get assigned slice group from the map
                // For all except the first unit in each
                // slice group, set the next field of the previous MB in that
                // slice group.

                // Init PrevMapUnit to -1 (none), for first unit of each slice group
                for (i=0; i<uNumSliceGroups; i++)
                    PrevMapUnit[i] = -1;

                for (mbnum=FirstMB; mbnum<uNumMapUnits; mbnum++)
                {
                    SliceGroup = pMap[mbnum];
                    prevMB = PrevMapUnit[SliceGroup];
                    if (prevMB != -1)
                    {
                        next_mb_tables[1][prevMB] = mbnum;
                    }
                    PrevMapUnit[SliceGroup] = mbnum;
                }
            }
        }    // >1 slice group
    }
}    // setMBMap

void TaskSupplier::SlideWindow(H264Slice * pSlice, Ipp32s field_index, bool force)
{
    Ipp32u NumShortTermRefs, NumLongTermRefs;
    H264SeqParamSet* sps = pSlice->GetSeqParam();

    // find out how many active reference frames currently in decoded
    // frames buffer
    m_pDecodedFramesList->countActiveRefs(NumShortTermRefs, NumLongTermRefs);
    while (NumShortTermRefs > 0 &&
        (NumShortTermRefs + NumLongTermRefs >= (Ipp32s)sps->num_ref_frames) &&
        !field_index)
    {
        // mark oldest short-term reference as unused
        VM_ASSERT(NumShortTermRefs > 0);

        H264DecoderFrame * pFrame = m_pDecodedFramesList->freeOldestShortTermRef();

        if (!pFrame)
            break;

        NumShortTermRefs--;

        if (!force)
            OnSlideWindow(pFrame, m_pCurrentFrame, &m_DefaultNotifyChain, false);
        else
            OnSlideWindow(pFrame, 0, &m_DefaultNotifyChain, false);
    }
}

//////////////////////////////////////////////////////////////////////////////
// updateRefPicMarking
//  Called at the completion of decoding a frame to update the marking of the
//  reference pictures in the decoded frames buffer.
//////////////////////////////////////////////////////////////////////////////
Status TaskSupplier::UpdateRefPicMarking(H264DecoderFrame * pFrame, H264Slice * pSlice, Ipp32s field_index)
{
    Status umcRes = UMC_OK;
    Ipp32u arpmmf_idx;
    Ipp32s picNum;
    Ipp32s LongTermFrameIdx;
    bool bCurrentisST = true;

    H264SliceHeader const * sliceHeader = pSlice->GetSliceHeader();

    if (pFrame->m_bIDRFlag)
    {
        // mark all reference pictures as unused
        m_pDecodedFramesList->removeAllRef(pFrame);

        if (sliceHeader->long_term_reference_flag)
        {
            pFrame->SetisLongTermRef(field_index);
            pFrame->setLongTermFrameIdx(0);
            m_MaxLongTermFrameIdx = 0;
            bCurrentisST = false;
        }
        else
        {
            pFrame->SetisShortTermRef(field_index);
            m_MaxLongTermFrameIdx = -1;        // no long term frame indices
        }
    }
    else
    {
        AdaptiveMarkingInfo* pAdaptiveMarkingInfo = pSlice->GetAdaptiveMarkingInfo();
        // adaptive ref pic marking
        if (pAdaptiveMarkingInfo && pAdaptiveMarkingInfo->num_entries > 0)
        {
            for (arpmmf_idx=0; arpmmf_idx<pAdaptiveMarkingInfo->num_entries;
                 arpmmf_idx++)
            {
                H264DecoderFrame * pRefFrame = 0;

                switch (pAdaptiveMarkingInfo->mmco[arpmmf_idx])
                {
                case 1:
                    // mark a short-term picture as unused for reference
                    // Value is difference_of_pic_nums_minus1
                    picNum = pFrame->PicNum(field_index) -
                        (pAdaptiveMarkingInfo->value[arpmmf_idx*2] + 1);
                    pRefFrame = m_pDecodedFramesList->freeShortTermRef(picNum);
                    break;
                case 2:
                    // mark a long-term picture as unused for reference
                    // value is long_term_pic_num
                    picNum = pAdaptiveMarkingInfo->value[arpmmf_idx*2];
                    pRefFrame = m_pDecodedFramesList->freeLongTermRef(picNum);
                    break;
                case 3:
                    // Assign a long-term frame idx to a short-term picture
                    // Value is difference_of_pic_nums_minus1 followed by
                    // long_term_frame_idx. Only this case uses 2 value entries.
                    picNum = pFrame->PicNum(field_index) -
                        (pAdaptiveMarkingInfo->value[arpmmf_idx*2] + 1);
                    LongTermFrameIdx = pAdaptiveMarkingInfo->value[arpmmf_idx*2+1];

                    pRefFrame = m_pDecodedFramesList->findShortTermPic(picNum, 0);

                    // First free any existing LT reference with the LT idx
                    pRefFrame = m_pDecodedFramesList->freeLongTermRefIdx(LongTermFrameIdx, pRefFrame);

                    m_pDecodedFramesList->changeSTtoLTRef(picNum, LongTermFrameIdx);
                    break;
                case 4:
                    // Specify max long term frame idx
                    // Value is max_long_term_frame_idx_plus1
                    // Set to "no long-term frame indices" (-1) when value == 0.
                    m_MaxLongTermFrameIdx = pAdaptiveMarkingInfo->value[arpmmf_idx*2] - 1;

                    // Mark any long-term reference frames with a larger LT idx
                    // as unused for reference.
                    m_pDecodedFramesList->freeOldLongTermRef(m_MaxLongTermFrameIdx, pFrame);
                    break;
                case 5:
                    // Mark all as unused for reference
                    // no value
                    m_WaitForIDR = false;
                    m_pDecodedFramesList->removeAllRef(pFrame);
                    m_pDecodedFramesList->IncreaseRefPicListResetCount(pFrame);
                    m_MaxLongTermFrameIdx = -1;        // no long term frame indices
                    // set "previous" picture order count vars for future

                    if (pFrame->m_PictureStructureForDec < 0)
                    {
                        pFrame->setPicOrderCnt(0, field_index);
                        pFrame->setPicNum(0, field_index);
                    }
                    else
                    {
                        Ipp32s poc = pFrame->PicOrderCnt(0, 3);
                        pFrame->setPicOrderCnt(pFrame->PicOrderCnt(0, 1) - poc, 0);
                        pFrame->setPicOrderCnt(pFrame->PicOrderCnt(1, 1) - poc, 1);
                        pFrame->setPicNum(0, 0);
                        pFrame->setPicNum(0, 1);
                    }

                    m_FrameNumOffset = 0;
                    m_FrameNum = 0;
                    m_PrevFrameRefNum = 0;
                    // set frame_num to zero for this picture, for correct
                    // FrameNumWrap
                    pFrame->setFrameNum(0);
                    break;
                case 6:
                    // Assign long term frame idx to current picture
                    // Value is long_term_frame_idx
                    LongTermFrameIdx = pAdaptiveMarkingInfo->value[arpmmf_idx*2];

                    // First free any existing LT reference with the LT idx
                    pRefFrame = m_pDecodedFramesList->freeLongTermRefIdx(LongTermFrameIdx, pFrame);

                    // Mark current
                    pFrame->SetisLongTermRef(field_index);
                    pFrame->setLongTermFrameIdx(LongTermFrameIdx);
                    bCurrentisST = false;
                    break;
                case 0:
                default:
                    // invalid mmco command in bitstream
                    VM_ASSERT(0);
                    umcRes = UMC_ERR_INVALID_STREAM;
                }    // switch

                OnSlideWindow(pRefFrame, pFrame, &m_DefaultNotifyChain, false);
            }    // for arpmmf_idx
        }
    }    // not IDR picture

    if (bCurrentisST)
    { // set current as
        if (sliceHeader->field_pic_flag && field_index)
        {
        }
        else
        {
            SlideWindow(pSlice, field_index);
        }

        pFrame->SetisShortTermRef(field_index);
    }

    return umcRes;
}    // updateRefPicMarking

void TaskSupplier::DecodePictureOrderCount(H264Slice *slice, Ipp32s frame_num)
{
    H264SliceHeader *sliceHeader = slice->GetSliceHeader();
    H264SeqParamSet* sps = slice->GetSeqParam();

    Ipp32s uMaxFrameNum = (1<<sps->log2_max_frame_num);

    if (sps->pic_order_cnt_type == 0)
    {
        // pic_order_cnt type 0
        Ipp32s CurrPicOrderCntMsb;
        Ipp32s MaxPicOrderCntLsb = sps->MaxPicOrderCntLsb;

        if ((sliceHeader->pic_order_cnt_lsb < m_PicOrderCntLsb) &&
             ((m_PicOrderCntLsb - sliceHeader->pic_order_cnt_lsb) >= (MaxPicOrderCntLsb >> 1)))
            CurrPicOrderCntMsb = m_PicOrderCntMsb + MaxPicOrderCntLsb;
        else if ((sliceHeader->pic_order_cnt_lsb > m_PicOrderCntLsb) &&
                ((sliceHeader->pic_order_cnt_lsb - m_PicOrderCntLsb) > (MaxPicOrderCntLsb >> 1)))
            CurrPicOrderCntMsb = m_PicOrderCntMsb - MaxPicOrderCntLsb;
        else
            CurrPicOrderCntMsb = m_PicOrderCntMsb;

        if (sliceHeader->nal_ref_idc)
        {
            // reference picture
            m_PicOrderCntMsb = CurrPicOrderCntMsb & (~(MaxPicOrderCntLsb - 1));
            m_PicOrderCntLsb = sliceHeader->pic_order_cnt_lsb;
        }
        m_PicOrderCnt = CurrPicOrderCntMsb + sliceHeader->pic_order_cnt_lsb;
        if (sliceHeader->field_pic_flag == 0)
        {
             m_TopFieldPOC = CurrPicOrderCntMsb + sliceHeader->pic_order_cnt_lsb;
             m_BottomFieldPOC = m_TopFieldPOC + sliceHeader->delta_pic_order_cnt_bottom;
        }

    }    // pic_order_cnt type 0
    else if (sps->pic_order_cnt_type == 1)
    {
        // pic_order_cnt type 1
        Ipp32u i;
        Ipp32u uAbsFrameNum;    // frame # relative to last IDR pic
        Ipp32u uPicOrderCycleCnt = 0;
        Ipp32u uFrameNuminPicOrderCntCycle = 0;
        Ipp32s ExpectedPicOrderCnt = 0;
        Ipp32s ExpectedDeltaPerPicOrderCntCycle;
        Ipp32u uNumRefFramesinPicOrderCntCycle = sps->num_ref_frames_in_pic_order_cnt_cycle;

        if (frame_num < m_FrameNum)
            m_FrameNumOffset += uMaxFrameNum;

        if (uNumRefFramesinPicOrderCntCycle != 0)
            uAbsFrameNum = m_FrameNumOffset + frame_num;
        else
            uAbsFrameNum = 0;

        if ((sliceHeader->nal_ref_idc == false)  && (uAbsFrameNum > 0))
            uAbsFrameNum--;

        if (uAbsFrameNum)
        {
            uPicOrderCycleCnt = (uAbsFrameNum - 1) /
                    uNumRefFramesinPicOrderCntCycle;
            uFrameNuminPicOrderCntCycle = (uAbsFrameNum - 1) %
                    uNumRefFramesinPicOrderCntCycle;
        }

        ExpectedDeltaPerPicOrderCntCycle = 0;
        for (i=0; i < uNumRefFramesinPicOrderCntCycle; i++)
        {
            ExpectedDeltaPerPicOrderCntCycle +=
                sps->poffset_for_ref_frame[i];
        }

        if (uAbsFrameNum)
        {
            ExpectedPicOrderCnt = uPicOrderCycleCnt * ExpectedDeltaPerPicOrderCntCycle;
            for (i=0; i<=uFrameNuminPicOrderCntCycle; i++)
            {
                ExpectedPicOrderCnt +=
                    sps->poffset_for_ref_frame[i];
            }
        }
        else
            ExpectedPicOrderCnt = 0;

        if (sliceHeader->nal_ref_idc == false)
            ExpectedPicOrderCnt += sps->offset_for_non_ref_pic;
        m_PicOrderCnt = ExpectedPicOrderCnt + sliceHeader->delta_pic_order_cnt[0];
        if( sliceHeader->field_pic_flag==0)
        {
            m_TopFieldPOC = ExpectedPicOrderCnt + sliceHeader->delta_pic_order_cnt[ 0 ];
            m_BottomFieldPOC = m_TopFieldPOC +
                sps->offset_for_top_to_bottom_field + sliceHeader->delta_pic_order_cnt[ 1 ];
        }
        else if( ! sliceHeader->bottom_field_flag)
            m_PicOrderCnt = ExpectedPicOrderCnt + sliceHeader->delta_pic_order_cnt[ 0 ];
        else
            m_PicOrderCnt  = ExpectedPicOrderCnt + sps->offset_for_top_to_bottom_field + sliceHeader->delta_pic_order_cnt[ 0 ];
    }    // pic_order_cnt type 1
    else if (sps->pic_order_cnt_type == 2)
    {
        // pic_order_cnt type 2
        Ipp32s iMaxFrameNum = (1<<sps->log2_max_frame_num);
        Ipp32u uAbsFrameNum;    // frame # relative to last IDR pic

        if (frame_num < m_FrameNum)
            m_FrameNumOffset += iMaxFrameNum;
        uAbsFrameNum = frame_num + m_FrameNumOffset;
        m_PicOrderCnt = uAbsFrameNum*2;
        if (sliceHeader->nal_ref_idc == false)
            m_PicOrderCnt--;
            m_TopFieldPOC = m_PicOrderCnt;
            m_BottomFieldPOC = m_PicOrderCnt;

    }    // pic_order_cnt type 2

    if (sliceHeader->nal_ref_idc)
    {
        m_PrevFrameRefNum = frame_num;
    }

    m_FrameNum = frame_num;
}    // decodePictureOrderCount

Status TaskSupplier::AddSource(MediaData * &pSource, MediaData *dst)
{
    Status umsRes = UMC_OK;

    bool isDPBFull = false;

    if (!m_pDecodedFramesList->IsDisposableExist())
    {
        if (m_pDecodedFramesList->countAllFrames() > m_dpbSize + m_DPBSizeEx)
        {
            if (GetFrameToDisplay(dst, false))
            {
                return UMC_OK;
            }
            else
            {
                isDPBFull = true;
            }
        }
    }

    MediaDataEx *out;

    bool is_header_readed;
    bool force = false;

    do
    {
        is_header_readed = false;

        if (!dst)
        {
            Ipp32s iCode = m_pNALSplitter->CheckNalUnitType(pSource);
            switch (iCode)
            {
            case NAL_UT_IDR_SLICE:
            case NAL_UT_SLICE:
            case NAL_UT_AUXILIARY:
            case NAL_UT_DPA: //ignore it
            case NAL_UT_DPB:
            case NAL_UT_DPC:
                return UMC_ERR_NOT_ENOUGH_DATA;
            }
        }

        H264MemoryPiece * pMemCopy = 0;
        H264MemoryPiece * pMem = m_pNALSplitter->GetNalUnits(pSource, out, &pMemCopy);

        if (!pMem && pSource)
            return UMC_ERR_SYNC;

        MediaDataEx::_MediaDataEx* pMediaDataEx = out->GetExData();
        pMediaDataEx->index = 0;

        bool isShouldCommit = true;

        for (Ipp32s i = 0; i < (Ipp32s)pMediaDataEx->count; i++, pMediaDataEx->index ++)
        {
            switch ((NAL_Unit_Type)pMediaDataEx->values[i])
            {
            case NAL_UT_IDR_SLICE:
            case NAL_UT_SLICE:
            case NAL_UT_AUXILIARY:
                if (!dst)
                    return UMC_OK;

                if (!AddSlice(pMem, pSource))
                {
                    isShouldCommit = false;
                    force = true;

                    if (isDPBFull && m_pNALSplitter->GetCurrent() && !m_pDecodedFramesList->IsDisposableExist())
                    {
                        if (!m_pTaskBroker->IsEnoughForStartDecoding(m_pFirstUncompletedFrame, true))
                        {
                            if (!m_DefaultNotifyChain.IsEmpty())
                            {
                                m_DefaultNotifyChain.Notify();
                            }
                        }

                        break;
                    }
                }
                break;

            case NAL_UT_SPS:
            case NAL_UT_PPS:
            case NAL_UT_SPS_EX:
                umsRes = DecodeHeaders(pMediaDataEx, pMem);
                if (umsRes != UMC_OK)
                {
                    m_pNALSplitter->Commit();
                    return umsRes;
                }
                is_header_readed = true;
                break;

            case NAL_UT_SEI:
                DecodeSEI(pMediaDataEx, pMem);
                is_header_readed = true;
                break;
            case NAL_UT_AUD:
                is_header_readed = true;
                if (dst)
                {
                    AddSlice(0, pSource);
                }
                break;

            case NAL_UT_DPA: //ignore it
            case NAL_UT_DPB:
            case NAL_UT_DPC:
            case NAL_UT_FD:
            case NAL_UT_UNSPECIFIED:
                break;

            case NAL_END_OF_STREAM:
            case NAL_END_OF_SEQ:
                if (dst)
                {
                    //AddSlice(0, pSource); // DEBUG: need to rewrite AddSlice
                }
                m_WaitForIDR = true;
                break;

            default:
                is_header_readed = true;
                break;
            };
        }

        if (isShouldCommit)
        {
            m_pNALSplitter->Commit();
        }
        else
        {
            break;
        }

    } while (is_header_readed &&
            (pSource) &&
            (MINIMAL_DATA_SIZE < pSource->GetDataSize()));

    if (!pSource)
    {
        AddSlice(0, 0);

        if (m_pCurrentFrame)
        {
            if (!m_pFirstUncompletedFrame)
            {
                if (m_pCurrentFrame && m_pCurrentFrame->GetBusyState() >= 2)
                    m_pFirstUncompletedFrame = m_pCurrentFrame;
            }
        }

        m_pCurrentFrame = 0;

        while (umsRes == UMC_OK && m_pFirstUncompletedFrame)
        {
            umsRes = RunDecoding(0, 0, true);
        }

        return umsRes;
    }
    else
    {
        // decoding
        return RunDecoding(dst, pSource, force);
    }

} // AddSource(MediaData * (&pSource))

bool IsFieldOfOneFrame(H264DecoderFrame *pFrame, H264Slice * pSlice1, H264Slice *pSlice2)
{
    if (!pFrame)
        return false;

    if (pFrame && pFrame->GetAU(0)->GetStatus() > H264DecoderFrameInfo::STATUS_NOT_FILLED
        && pFrame->GetAU(1)->GetStatus() > H264DecoderFrameInfo::STATUS_NOT_FILLED)
        return false;

    if ((pSlice1->GetSliceHeader()->nal_ref_idc && !pSlice2->GetSliceHeader()->nal_ref_idc) ||
        (!pSlice1->GetSliceHeader()->nal_ref_idc && pSlice2->GetSliceHeader()->nal_ref_idc))
        return false;

    if (pSlice1->GetSliceHeader()->field_pic_flag != pSlice2->GetSliceHeader()->field_pic_flag)
        return false;

//    if (pSlice1->GetSliceHeader()->frame_num != pSlice2->GetSliceHeader()->frame_num)
  //      return false;

    if (pSlice1->GetSliceHeader()->bottom_field_flag == pSlice2->GetSliceHeader()->bottom_field_flag)
        return false;

    return true;
}

bool TaskSupplier::AddSlice(H264MemoryPiece * pMem, MediaData * pSource)
{
    H264Slice * pSlice;

    if (!m_bSeqParamSetRead || !m_bPicParamSetRead)
    {
        m_pNALSplitter->Commit();
        return false;
    }

    if (pMem)
    {
        pSlice = m_SlicesHeap.Allocate();

        Ipp32s pps_pid = pSlice->RetrievePicParamSetNumber(pMem->GetPointer(), pMem->GetSize());
        if (pps_pid == -1)
        {
            m_SlicesHeap.Free(pSlice);
            m_pNALSplitter->Commit();
            return false;
        }

        H264SEIPayLoad * spl = m_Headers.GetSEISet(SEI_RECOVERY_POINT_TYPE);

        if (m_WaitForIDR)
        {
            if (pSlice->GetSliceHeader()->slice_type != INTRASLICE && !spl)
            {
                m_pNALSplitter->Commit();
                m_SlicesHeap.Free(pSlice);
                return false;
            }
        }

        pSlice->m_pPicParamSet = m_Headers.GetPicParamSet(pps_pid);
        if (!pSlice->m_pPicParamSet)
        {
            m_SlicesHeap.Free(pSlice);
            m_pNALSplitter->Commit();
            return false;
        }

        pSlice->m_pSeqParamSet = m_Headers.GetSeqParamSet(pSlice->m_pPicParamSet->seq_parameter_set_id);
        if (!pSlice->m_pSeqParamSet)
        {
            m_SlicesHeap.Free(pSlice);
            m_pNALSplitter->Commit();
            return false;
        }

        pSlice->m_pSeqParamSetEx = m_Headers.GetSeqParamSetEx(pSlice->m_pPicParamSet->seq_parameter_set_id);
        pSlice->m_pCurrentFrame = m_pCurrentFrame;

        m_CurrentSeqParamSet = pSlice->m_pPicParamSet->seq_parameter_set_id;
        m_CurrentPicParamSet = pSlice->m_pPicParamSet->pic_parameter_set_id;

        pSlice->m_pSource = pMem;
        pSlice->m_pSource_DXVA = 0;
        pSlice->m_dTime = pSource ? pSource->GetTime() : -1;
        if (!pSlice->Reset(pMem->GetPointer(), pMem->GetDataSize(), m_iThreadNum))
        {
            // should ignored slice
            m_SlicesHeap.Free(pSlice);
            m_pNALSplitter->Commit();
            return false;
        }

        pSlice->m_pSource_DXVA = m_pNALSplitter->GetCurrentCopyVersion();

        if (pSlice->m_pSource_DXVA)
        {
            Ipp32u* pbs;
            Ipp32u bitOffset;
            pSlice->m_BitStream.GetState(&pbs, &bitOffset);

            pSlice->m_BitStream_DXVA.Reset(pSlice->m_pSource_DXVA->GetPointer(), bitOffset,
                pSlice->m_pSource_DXVA->GetDataSize());
        }

        if (spl && (pSlice->GetSliceHeader()->slice_type != INTRASLICE))
        {
            m_Headers.Signal(3, spl);
        }

        m_WaitForIDR = false;
    }
    else
    {
        if (!m_pCurrentFrame)
            return true;

        CompleteFrame(m_pCurrentFrame, m_field_index);

        if (!pSource && m_pCurrentFrame && m_pCurrentFrame->m_PictureStructureForDec < FRM_STRUCTURE)
        {
            ProcessNonPairedField(m_pCurrentFrame);
        }

        return true;
    }

    H264DecoderFrame * pFrame = m_pCurrentFrame;

    if (pSlice->IsAuxiliary())
    {
        pFrame = UMC::GetAuxiliaryFrame(pFrame);
        pSlice->m_pCurrentFrame = pFrame;

        if (pFrame && pFrame->GetAU(0)->GetSliceCount() == 0)
        {
            pFrame = 0;
        }
    }

    if (pFrame)
    {
        m_field_index = (pFrame->GetAU(1)->GetStatus() != H264DecoderFrameInfo::STATUS_NONE
            && pFrame->GetAU(1)->GetSliceCount() != 0);
        H264Slice * pFirstFrameSlice = pFrame->GetAU(m_field_index)->GetAnySlice();
        VM_ASSERT(pFirstFrameSlice);

        if ((false == IsPictureTheSame(pFirstFrameSlice, pSlice)))
        {
            bool isField = pFirstFrameSlice->IsField();

            CompleteFrame(m_pCurrentFrame, m_field_index);

            if (pSlice->IsField())
            {
                if (IsFieldOfOneFrame(pFrame, pFirstFrameSlice, pSlice))
                {
                    m_field_index = 1;
                    InitFrame(pFrame, pSlice);
                    if (!m_pFirstUncompletedFrame)
                        m_pFirstUncompletedFrame = pFrame;
                }
                else
                {
                    ProcessNonPairedField(pFrame);
                    m_field_index = 0;

                    if (ProcessFrameNumGap(pSlice, m_field_index) != UMC_OK)
                    {
                        m_SlicesHeap.Free(pSlice);
                        return false;
                    }

                    pFrame = AddFrame(pSlice);
                    if (!pFrame)
                    {
                        m_pCurrentFrame = 0;
                        m_SlicesHeap.Free(pSlice);
                        return false;
                    }

                    m_pCurrentFrame = pFrame;
                }
            }
            else
            {
                if (isField) // only one field
                {
                    ProcessNonPairedField(m_pCurrentFrame);
                }

                m_field_index = 0;

                if (ProcessFrameNumGap(pSlice, m_field_index) != UMC_OK)
                {
                    m_SlicesHeap.Free(pSlice);
                    return false;
                }

                pFrame = AddFrame(pSlice);
                if (!pFrame)
                {
                    m_pCurrentFrame = 0;
                    m_SlicesHeap.Free(pSlice);
                    return false;
                }

                m_pCurrentFrame = pFrame;
            }
        }
    }
    else
    {
        if (ProcessFrameNumGap(pSlice, m_field_index) != UMC_OK)
        {
            m_SlicesHeap.Free(pSlice);
            return false;
        }

        pFrame = AddFrame(pSlice);
        if (!pFrame)
        {
            m_pCurrentFrame = 0;
            m_SlicesHeap.Free(pSlice);
            return false;
        }

        m_pCurrentFrame = pFrame;
    }

    // set IDR for auxiliary
    //

    if (m_pCurrentFrame && m_pCurrentFrame->IsAuxiliaryFrame())
    {
        m_pCurrentFrame = m_pCurrentFrame->primary_picture;
    }

    // Init refPicList
    AddSliceToFrame(pFrame, pSlice);

    if (pSlice->GetSliceHeader()->slice_type != INTRASLICE)
    {
        Ipp32u NumShortTermRefs, NumLongTermRefs;
        m_pDecodedFramesList->countActiveRefs(NumShortTermRefs, NumLongTermRefs);
        if (NumShortTermRefs + NumLongTermRefs == 0)
        {
            H264DecoderFrame *pFrame = GetFreeFrame();
            if (!pFrame)
                return false;

            m_pDecodedFramesList->MoveToTail(pFrame);
            Status umsRes = InitFreeFrame(pFrame, pSlice);
            if (umsRes == UMC_OK)
            {
                Ipp32s frame_num = pSlice->GetSliceHeader()->frame_num;
                if (pSlice->GetSliceHeader()->field_pic_flag == 0)
                {
                    pFrame->setPicNum(frame_num, 0);
                }
                else
                {
                    pFrame->setPicNum(frame_num*2+1, 0);
                    pFrame->setPicNum(frame_num*2+1, 1);
                }

                pFrame->SetisShortTermRef(0);
                pFrame->SetisShortTermRef(1);

                pFrame->SetSkipped(true);
                pFrame->SetFrameExistFlag(false);
                pFrame->SetBusyState(2);
                pFrame->SetisDisplayable();

                pFrame->DefaultFill(2, false);

                H264SliceHeader* sliceHeader = pSlice->GetSliceHeader();
                if (pSlice->GetSeqParam()->pic_order_cnt_type != 0)
                {
                    Ipp32s tmp1 = sliceHeader->delta_pic_order_cnt[0];
                    Ipp32s tmp2 = sliceHeader->delta_pic_order_cnt[1];
                    sliceHeader->delta_pic_order_cnt[0] = sliceHeader->delta_pic_order_cnt[1] = 0;

                    DecodePictureOrderCount(pSlice, frame_num);

                    sliceHeader->delta_pic_order_cnt[0] = tmp1;
                    sliceHeader->delta_pic_order_cnt[1] = tmp2;
                }

                if (sliceHeader->field_pic_flag)
                {
                    pFrame->setPicOrderCnt(m_PicOrderCnt,0);
                    pFrame->setPicOrderCnt(m_PicOrderCnt,1);
                }
                else
                {
                    pFrame->setPicOrderCnt(m_TopFieldPOC, 0);
                    pFrame->setPicOrderCnt(m_BottomFieldPOC, 1);
                }

                // mark generated frame as short-term reference
                {
                    // reset frame global data
                    H264DecoderMacroblockGlobalInfo *pMBInfo = pFrame->m_mbinfo.mbs;
                    memset(pMBInfo, 0, pFrame->totalMBs*sizeof(H264DecoderMacroblockGlobalInfo));
                }
            }
        }
    }

    pSlice->UpdateReferenceList(m_pDecodedFramesList);
    m_pNALSplitter->DropMemory();
    return true;
}

void TaskSupplier::ProcessNonPairedField(H264DecoderFrame * pFrame)
{
    if (pFrame && pFrame->GetAU(1)->GetStatus() == H264DecoderFrameInfo::STATUS_NOT_FILLED)
    {
        pFrame->setPicOrderCnt(pFrame->PicOrderCnt(0, 1), 1);
        pFrame->GetAU(1)->SetStatus(H264DecoderFrameInfo::STATUS_NONE);
        pFrame->m_bottom_field_flag[1] = !pFrame->m_bottom_field_flag[0];

        pFrame->m_isShortTermRef[1] = pFrame->m_isShortTermRef[0];
        pFrame->m_isLongTermRef[1] = pFrame->m_isLongTermRef[0];

        H264Slice * pSlice = pFrame->GetAU(0)->GetAnySlice();
        pFrame->setPicNum(pSlice->GetSliceHeader()->frame_num*2 + 1, 1);

        Ipp32s isBottom = pSlice->IsBottomField() ? 0 : 1;
        pFrame->DefaultFill(isBottom, false);
    }
}

void TaskSupplier::CompleteFrame(H264DecoderFrame * pFrame, Ipp32s field)
{
    if (!pFrame)
        return;

    CompleteFrame(UMC::GetAuxiliaryFrame(pFrame), field);

    H264DecoderFrameInfo * slicesInfo = pFrame->GetAU(field);

    DEBUG_PRINT((VM_STRING("Complete frame POC - (%d,%d) type - %d, field - %d, count - %d, m_uid - %d, IDR - %d\n"), pFrame->m_PicOrderCnt[0], pFrame->m_PicOrderCnt[1], pFrame->m_FrameType, m_field_index, pFrame->GetAU(m_field_index)->GetSliceCount(), pFrame->m_UID, pFrame->m_bIDRFlag));
    if (slicesInfo->GetStatus() > H264DecoderFrameInfo::STATUS_NOT_FILLED)
        return;

    bool is_auxiliary_exist = slicesInfo->GetAnySlice()->GetSeqParamEx() &&
        (slicesInfo->GetAnySlice()->GetSeqParamEx()->aux_format_idc != 0);

    if (is_auxiliary_exist)
    {
        if (!pFrame->IsAuxiliaryFrame())
            DBPUpdate(pFrame, field);
    }
    else
        DBPUpdate(pFrame, field);

    if (!field)
    {
        Ipp32s index = m_iCurrentResource % (m_iThreadNum);

        if (!pFrame->IsAuxiliaryFrame())
            m_iCurrentResource++;

        m_iCurrentResource = m_iCurrentResource % (m_iThreadNum);

        index += (Ipp32s)pFrame->IsAuxiliaryFrame()*(m_iThreadNum);

        // allocate decoding data
        pFrame->m_iResourceNumber = index;
    }

    // skipping algorithm
    {
        if ((slicesInfo->IsField() && field || !slicesInfo->IsField()) &&
            IsShouldSkipFrame(pFrame, field))
        {
            if (slicesInfo->IsField())
            {
                pFrame->GetAU(0)->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED);
                pFrame->GetAU(1)->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED);
            }
            else
            {
                pFrame->GetAU(0)->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED);
            }

            pFrame->OnDecodingCompleted();

            pFrame->unSetisShortTermRef(0);
            pFrame->unSetisShortTermRef(1);
            pFrame->unSetisLongTermRef(0);
            pFrame->unSetisLongTermRef(1);
            pFrame->SetBusyState(0);
            pFrame->SetSkipped(true);
            return;
        }
        else
        {
            if (IsShouldSkipDeblocking(pFrame, field))
            {
                pFrame->GetAU(field)->SkipDeblocking();
            }
        }
    }

    if (!slicesInfo->GetSlice(0)->IsSliceGroups())
    {
        Ipp32s count = slicesInfo->GetSliceCount();

        H264Slice * pFirstSlice = 0;
        for (Ipp32s j = 0; j < count; j ++)
        {
            H264Slice * pSlice = slicesInfo->GetSlice(j);
            if (!pFirstSlice || pSlice->m_iFirstMB < pFirstSlice->m_iFirstMB)
            {
                pFirstSlice = pSlice;
            }
        }

        if (pFirstSlice->m_iFirstMB)
        {
            m_pSegmentDecoder[0]->RestoreErrorRect(0, pFirstSlice->m_iFirstMB, pFirstSlice);
        }

        for (Ipp32s i = 0; i < count; i ++)
        {
            H264Slice * pCurSlice = slicesInfo->GetSlice(i);

    #define MAX_MB_NUMBER 0x7fffffff

            Ipp32s minFirst = MAX_MB_NUMBER;
            for (Ipp32s j = 0; j < count; j ++)
            {
                H264Slice * pSlice = slicesInfo->GetSlice(j);
                if (pSlice->m_iFirstMB > pCurSlice->m_iFirstMB && minFirst > pSlice->m_iFirstMB)
                {
                    minFirst = pSlice->m_iFirstMB;
                }
            }

            if (minFirst != MAX_MB_NUMBER)
            {
                pCurSlice->m_iMaxMB = minFirst;
            }
        }
    }

    if (!field)
    {
        // allocate and initialize resources
        H264SeqParamSet *pSeqParam = slicesInfo->GetSlice(0)->GetSeqParam();

        Ipp32s iMBCount = pSeqParam->frame_width_in_mbs * pSeqParam->frame_height_in_mbs;
        // allocate decoding data
        m_pMBInfo[pFrame->m_iResourceNumber].Allocate(iMBCount, m_pMemoryAllocator);

        // allocate macroblock intra types
        AllocateMBIntraTypes(pFrame->m_iResourceNumber, iMBCount);

        pFrame->totalMBs = iMBCount;
        if (pFrame->m_PictureStructureForDec < FRM_STRUCTURE)
            pFrame->totalMBs /= 2;

        // reset frame global data
        H264DecoderMacroblockGlobalInfo *pMBInfo = pFrame->m_mbinfo.mbs;

        memset(pMBInfo, 0, iMBCount*sizeof(H264DecoderMacroblockGlobalInfo));

        memset(pFrame->m_mbinfo.MV[0], 0, iMBCount*sizeof(H264DecoderMacroblockMVs));
        memset(pFrame->m_mbinfo.MV[1], 0, iMBCount*sizeof(H264DecoderMacroblockMVs));
    }

    Ipp32s sliceCount = slicesInfo->GetSliceCount();
    for (Ipp32s i = 0; i < sliceCount; i++)
    {
        H264Slice * pSlice = slicesInfo->GetSlice(i);
        pSlice->m_mbinfo = &m_pMBInfo[pFrame->m_iResourceNumber];
        pSlice->m_pMBIntraTypes = m_ppMBIntraTypes[pFrame->m_iResourceNumber];
    }

    slicesInfo->SetStatus(H264DecoderFrameInfo::STATUS_FILLED);
}

Status TaskSupplier::InitFreeFrame(H264DecoderFrame * pFrame, H264Slice *pSlice)
{
    pFrame->GetAU(0)->SetHeaps(&m_Heap, &m_SlicesHeap);
    pFrame->GetAU(1)->SetHeaps(&m_Heap, &m_SlicesHeap);

    pFrame->Reset();

    // Set current as not displayable (yet) and not outputted. Will be
    // updated to displayable after successful decode.
    pFrame->unsetWasOutputted();
    pFrame->unSetisDisplayable();
    pFrame->SetBusyState(2);
    pFrame->SetSkipped(false);
    pFrame->SetFrameExistFlag(true);

    m_UIDFrameCounter++;
    pFrame->m_UID = m_UIDFrameCounter;

    Status umcRes = UMC_OK;
    H264SeqParamSet *pSeqParam = pSlice->GetSeqParam();
    IppiSize dimensions;
    Ipp32s iMBWidth = pSeqParam->frame_width_in_mbs;
    Ipp32s iMBHeight = pSeqParam->frame_height_in_mbs;

    dimensions.width = iMBWidth * 16;
    dimensions.height = iMBHeight * 16;

    Ipp32s iMBCount = pSeqParam->frame_width_in_mbs * pSeqParam->frame_height_in_mbs;
    pFrame->totalMBs = iMBCount;

    Ipp32s chroma_format_idc = pFrame->IsAuxiliaryFrame() ? 0 : pSeqParam->chroma_format_idc;

    Ipp8u bit_depth_luma, bit_depth_chroma;
    if (pFrame->IsAuxiliaryFrame())
    {
        bit_depth_luma = pSlice->GetSeqParamEx()->bit_depth_aux;
        bit_depth_chroma = 8;
    } else {
        bit_depth_luma = pSeqParam->bit_depth_luma;
        bit_depth_chroma = pSeqParam->bit_depth_chroma;
    }

    pFrame->m_FrameType = SliceTypeToFrameType(pSlice->GetSliceHeader()->slice_type);
    pFrame->m_dFrameTime = pSlice->m_dTime;
    pFrame->m_crop_left = SubWidthC[pSeqParam->chroma_format_idc] * pSeqParam->frame_cropping_rect_left_offset;
    pFrame->m_crop_right = SubWidthC[pSeqParam->chroma_format_idc] * pSeqParam->frame_cropping_rect_right_offset;
    pFrame->m_crop_top = SubHeightC[pSeqParam->chroma_format_idc] * pSeqParam->frame_cropping_rect_top_offset * (2 - pSeqParam->frame_mbs_only_flag);
    pFrame->m_crop_bottom = SubHeightC[pSeqParam->chroma_format_idc] * pSeqParam->frame_cropping_rect_bottom_offset * (2 - pSeqParam->frame_mbs_only_flag);
    pFrame->m_crop_flag = pSeqParam->frame_cropping_flag;

    pFrame->setFrameNum(pSlice->GetSliceHeader()->frame_num);

    if (pSeqParam->aspect_ratio_idc == 255)
    {
        pFrame->m_aspect_width  = pSeqParam->sar_width;
        pFrame->m_aspect_height = pSeqParam->sar_height;
    }
    else
    {
        pFrame->m_aspect_width  = SAspectRatio[pSeqParam->aspect_ratio_idc][0];
        pFrame->m_aspect_height = SAspectRatio[pSeqParam->aspect_ratio_idc][1];
    }

    if (pSlice->GetSliceHeader()->field_pic_flag)
    {
        pFrame->m_bottom_field_flag[0] = pSlice->GetSliceHeader()->bottom_field_flag;
        pFrame->m_bottom_field_flag[1] = !pSlice->GetSliceHeader()->bottom_field_flag;

        pFrame->m_PictureStructureForRef =
        pFrame->m_PictureStructureForDec = FLD_STRUCTURE;
    }
    else
    {
        pFrame->m_bottom_field_flag[0] = 0;
        pFrame->m_bottom_field_flag[1] = 1;

        if (pSlice->m_SliceHeader.MbaffFrameFlag)
        {
            pFrame->m_PictureStructureForRef =
            pFrame->m_PictureStructureForDec = AFRM_STRUCTURE;
        }
        else
        {
            pFrame->m_PictureStructureForRef =
            pFrame->m_PictureStructureForDec = FRM_STRUCTURE;
        }
    }

    {
        pFrame->m_is_external_memory = false;
    }

    {
        // Allocate the frame data
        umcRes = pFrame->allocate(dimensions,
                                IPP_MAX(bit_depth_luma, bit_depth_chroma),
                                chroma_format_idc);
        if (umcRes != UMC_OK)
        {
            return umcRes;
        }
    }

    return umcRes;
}

H264DecoderFrame * TaskSupplier::AddFrame(H264Slice *pSlice)
{
    if (!pSlice)
        return 0;

    H264DecoderFrame *pFrame = 0;

    if (pSlice->IsAuxiliary())
    {
        VM_ASSERT(!m_pCurrentFrame->IsAuxiliaryFrame());
        ((H264DecoderFrameExtension *)m_pCurrentFrame)->AllocateAuxiliary();
        ((H264DecoderFrameExtension *)m_pCurrentFrame)->FillInfoToAuxiliary();
        pFrame = UMC::GetAuxiliaryFrame(m_pCurrentFrame);
    }
    else
    {
        pFrame = GetFreeFrame();
    }

    if (!pFrame)
    {
        return 0;
    }

    Status umcRes = InitFreeFrame(pFrame, pSlice);
    if (umcRes != UMC_OK)
    {
        return 0;
    }

    if (m_UserData.user_data != 0)
    {
        pFrame->m_UserData = m_UserData;
        m_UserData.user_data = 0;
    }

    pFrame->SetNotifiersChain(m_DefaultNotifyChain);
    m_DefaultNotifyChain.Abort();

    pFrame->SetBusyState(2);

    if (!pSlice->IsAuxiliary())
    {
        m_pDecodedFramesList->MoveToTail(pFrame);
    }
    else
    {
        for (H264DecoderFrame *pTmp = m_pDecodedFramesList->head(); pTmp; pTmp = pTmp->future())
        {
            H264DecoderFrameExtension * frame = DynamicCast<H264DecoderFrameExtension>(pTmp);
            VM_ASSERT(frame);
            frame->FillInfoToAuxiliary();
        }
    }

    m_field_index = 0;

    if (pSlice->IsField())
    {
        pFrame->GetAU(1)->SetStatus(H264DecoderFrameInfo::STATUS_NOT_FILLED);
    }

    if (!pSlice->IsAuxiliary())
    {
        if (!m_pFirstUncompletedFrame)
            m_pFirstUncompletedFrame = pFrame;
    }

    //fill chroma planes in case of 4:0:0
    if (pFrame->m_chroma_format == 0)
    {
        pFrame->DefaultFill(2, true);
    }

    InitFrame(pFrame, pSlice);

    //if (m_pCurrentFrame && m_pCurrentFrame != pFrame)
      //  m_pCurrentFrame->FreeResources();

    // frame gaps analysis
    return pFrame;
} // H264DecoderFrame * TaskSupplier::AddFrame(H264Slice *pSlice)

void TaskSupplier::InitFrame(H264DecoderFrame * pFrame, H264Slice *pSlice)
{
    H264SliceHeader *sliceHeader = pSlice->GetSliceHeader();
    if (sliceHeader->idr_flag)
    {
        m_PicOrderCnt = 0;
        m_PicOrderCntMsb = 0;
        m_PicOrderCntLsb = 0;
        m_FrameNum = sliceHeader->frame_num;
        m_PrevFrameRefNum = sliceHeader->frame_num;
        m_FrameNumOffset = 0;
        m_TopFieldPOC = 0;
        m_BottomFieldPOC = 0;
    }

    DecodePictureOrderCount(pSlice, sliceHeader->frame_num);

    pFrame->m_bIDRFlag = sliceHeader->idr_flag != 0;

    if (pFrame->m_bIDRFlag)
    {
        m_pDecodedFramesList->IncreaseRefPicListResetCount(pFrame);
    }

    pFrame->setFrameNum(sliceHeader->frame_num);

    if (sliceHeader->field_pic_flag == 0)
        pFrame->setPicNum(sliceHeader->frame_num, 0);
    else
        pFrame->setPicNum(sliceHeader->frame_num*2+1, m_field_index);

    //transfer previosly calculated PicOrdeCnts into current Frame
    if (pFrame->m_PictureStructureForRef < FRM_STRUCTURE)
    {
        pFrame->setPicOrderCnt(m_PicOrderCnt, m_field_index);
        if (!m_field_index) // temporally set same POC for second field
            pFrame->setPicOrderCnt(m_PicOrderCnt, 1);
    }
    else
    {
        pFrame->setPicOrderCnt(m_TopFieldPOC, 0);
        pFrame->setPicOrderCnt(m_BottomFieldPOC, 1);
    }

    DEBUG_PRINT((VM_STRING("Init frame POC - %d, %d, field - %d, uid - %d, frame_num - %d\n"), pFrame->m_PicOrderCnt[0], pFrame->m_PicOrderCnt[1], m_field_index, pFrame->m_UID, pFrame->m_FrameNum));

    pFrame->InitRefPicListResetCount(m_field_index);
} // void TaskSupplier::InitFrame(H264DecoderFrame * pFrame, H264Slice *pSlice)

bool TaskSupplier::AllocateMBIntraTypes(Ipp32s iIndex, Ipp32s iMBNumber)
{
    if ((NULL == m_ppMBIntraTypes[iIndex]) ||
        (m_piMBIntraProp[iIndex].m_nSize < iMBNumber))
    {
        size_t nSize;
        // delete previously allocated array
        if (m_ppMBIntraTypes[iIndex])
        {
            m_pMemoryAllocator->Unlock(m_piMBIntraProp[iIndex].m_mid);
            m_pMemoryAllocator->Free(m_piMBIntraProp[iIndex].m_mid);
        }
        m_ppMBIntraTypes[iIndex] = NULL;
        m_piMBIntraProp[iIndex].Reset();

        nSize = iMBNumber * NUM_INTRA_TYPE_ELEMENTS * sizeof(IntraType);
        if (UMC_OK != m_pMemoryAllocator->Alloc(&(m_piMBIntraProp[iIndex].m_mid),
                                                nSize,
                                                UMC_ALLOC_PERSISTENT))
            return false;
        m_piMBIntraProp[iIndex].m_nSize = (Ipp32s) iMBNumber;
        m_ppMBIntraTypes[iIndex] = (Ipp32u *) m_pMemoryAllocator->Lock(m_piMBIntraProp[iIndex].m_mid);
    }

    return true;
} // bool TaskSupplier::AllocateMBIntraTypes(Ipp32s iIndex, Ipp32s iMBNumber)

void TaskSupplier::AddSliceToFrame(H264DecoderFrame *pFrame, H264Slice *pSlice)
{
    H264DecoderFrameInfo * au_info = pFrame->GetAU(m_field_index);
    Ipp32s iSliceNumber = au_info->GetSliceCount() + 1;

    if (m_field_index)
    {
        iSliceNumber += pFrame->m_TopSliceCount;
    }
    else
    {
        pFrame->m_TopSliceCount++;
    }

    pSlice->SetSliceNumber(iSliceNumber);
    pSlice->m_pCurrentFrame = pFrame;
    au_info->AddSlice(pSlice);
}

void TaskSupplier::DBPUpdate(H264DecoderFrame * pFrame, Ipp32s field)
{
    H264Slice * pSlice = pFrame->GetAU(field)->GetSlice(0);
    if (!pSlice->GetSliceHeader()->nal_ref_idc)
        return;

    UpdateRefPicMarking(pFrame, pSlice, field);

    if (GetAuxiliaryFrame(pFrame))
    {
        // store marking results to auxiliary frames
        H264DecoderFrame *pHead = m_pDecodedFramesList->head();

        for (H264DecoderFrame *pTmp = pHead; pTmp; pTmp = pTmp->future())
        {
            H264DecoderFrameExtension * frame = DynamicCast<H264DecoderFrameExtension>(pTmp);
            VM_ASSERT(frame);
            frame->FillInfoToAuxiliary();
        }
    }
}

Status TaskSupplier::RunDecoding(MediaData *dst, MediaData *src, bool force)
{
    Status umcRes = UMC_OK;

    //if (!dst)
      //  return UMC_ERR_NOT_ENOUGH_DATA;

    {
        m_pTaskBroker->Lock();
        for (; m_pFirstUncompletedFrame; m_pFirstUncompletedFrame = m_pFirstUncompletedFrame->future())
        {
            if (!m_pTaskBroker->IsFrameCompleted(m_pFirstUncompletedFrame))
            {
                //DEBUG_PRINT(("Not completed POC - %d, busy - %d, umcRes - %d \n", m_pFirstUncompletedFrame->m_PicOrderCnt[0], m_pFirstUncompletedFrame->GetBusyState(), umcRes));
                break;
            }

            DEBUG_PRINT((VM_STRING("Decode POC - %d completed - %d\n"), m_pFirstUncompletedFrame->m_PicOrderCnt[0], frame_count++));
            if (m_pFirstUncompletedFrame->GetBusyState() >= 2)
            {
                m_pFirstUncompletedFrame->OnDecodingCompleted();
            }
        }
        m_pTaskBroker->Unlock();
    }

    if (!m_pTaskBroker->IsEnoughForStartDecoding(m_pFirstUncompletedFrame, !src || force))
    {
        if (!src)
            m_pFirstUncompletedFrame = 0;
        return UMC_ERR_NOT_ENOUGH_DATA;
    }

    DEBUG_PRINT((VM_STRING("Decode POC - %d\n"), m_pFirstUncompletedFrame->m_PicOrderCnt[0]));

    SetMBMap(m_pFirstUncompletedFrame);
    m_pTaskBroker->Start();

    for (Ipp32s i = 1; i < m_iThreadNum; i++)
        m_pSegmentDecoder[i]->StartProcessing();

    bool is_converted = true;

    if (src)
        is_converted = GetFrameToDisplay(dst, false);

    umcRes = m_pSegmentDecoder[0]->ProcessSegment();

    if (umcRes != UMC_OK)
        return umcRes;


    umcRes = is_converted ? UMC_OK : UMC_ERR_NOT_ENOUGH_DATA;

    {
        m_pTaskBroker->Lock();
        for (; m_pFirstUncompletedFrame; m_pFirstUncompletedFrame = m_pFirstUncompletedFrame->future())
        {
            if (!m_pTaskBroker->IsFrameCompleted(m_pFirstUncompletedFrame))
            {
                //DEBUG_PRINT(("Not completed POC - %d, busy - %d, umcRes - %d \n", m_pFirstUncompletedFrame->m_PicOrderCnt[0], m_pFirstUncompletedFrame->GetBusyState(), umcRes));
                break;
            }

            DEBUG_PRINT((VM_STRING("Decode POC - %d completed - %d\n"), m_pFirstUncompletedFrame->m_PicOrderCnt[0], frame_count++));
            if (m_pFirstUncompletedFrame->GetBusyState() >= 2)
            {
                m_pFirstUncompletedFrame->OnDecodingCompleted();
            }
        }
        m_pTaskBroker->Unlock();
    }

    return umcRes;
}

void TaskSupplier::InitColorConverter(H264DecoderFrame *source, Ipp8u force_field)
{
    static ColorFormat color_formats[2][4] =
    {
        {YUV420,
        YUV420,
        YUV422,
        YUV444},

        {YUV420A,
        YUV420A,
        YUV422A,
        YUV444A},
    };

    // set correct size in color converter
    Ipp32s crop_left   = source->m_crop_left;
    Ipp32s crop_right  = source->m_crop_right;
    Ipp32s crop_top    = source->m_crop_top;
    Ipp32s crop_bottom = source->m_crop_bottom;
    Ipp32s width  = source->lumaSize().width;
    Ipp32s height = source->lumaSize().height;

    if (force_field)
    {
        height >>= 1;
        crop_top >>= 1;
        crop_bottom >>= 1;
    }

    H264DecoderFrame * auxiliary = GetAuxiliaryFrame(source);

    if (m_LastDecodedFrame.GetColorFormat() != color_formats[auxiliary ? 1 : 0][source->m_chroma_format] ||
        m_LastDecodedFrame.GetWidth() != width ||
        m_LastDecodedFrame.GetHeight() != height)
    {
        m_LastDecodedFrame.Init(width,
                                height,
                                color_formats[auxiliary ? 1 : 0][source->m_chroma_format],
                                source->m_bpp);
    }

    Ipp32s pixel_sz = source->m_bpp > 8 ? 2 : 1;

    m_LastDecodedFrame.SetBufferPointer(source->m_pYPlane, m_LastDecodedFrame.GetMappingSize());

    m_LastDecodedFrame.SetPlanePointer((void*)source->m_pYPlane, 0);
    m_LastDecodedFrame.SetPlanePointer((void*)source->m_pUPlane, 1);
    m_LastDecodedFrame.SetPlanePointer((void*)source->m_pVPlane, 2);

    Ipp32s pitch = source->pitch_luma()*pixel_sz;
    m_LastDecodedFrame.SetPlanePitch(pitch, 0);
    pitch = source->pitch_chroma()*pixel_sz;
    m_LastDecodedFrame.SetPlanePitch(pitch, 1);
    m_LastDecodedFrame.SetPlanePitch(pitch, 2);

    if (auxiliary)
    {
        Ipp32s pixel_sz = auxiliary->m_bpp > 8 ? 2 : 1;
        Ipp32s pitch = auxiliary->pitch_luma()*pixel_sz;
        m_LastDecodedFrame.SetPlanePointer((void*)auxiliary->m_pYPlane, 3);
        m_LastDecodedFrame.SetPlanePitch(pitch, 3);
    }

    if (source->m_PictureStructureForDec == FRM_STRUCTURE)
    {
        m_LastDecodedFrame.SetPictureStructure(PS_FRAME);
    }
    else
    {
        m_LastDecodedFrame.SetPictureStructure(PS_TOP_FIELD_FIRST);
    }

    m_LastDecodedFrame.SetDataSize(m_LastDecodedFrame.GetMappingSize());
    m_LastDecodedFrame.SetFrameType(source->m_FrameType);
    m_LastDecodedFrame.SetAspectRatio(source->m_aspect_width, source->m_aspect_height);

    // cropping
    VideoDataCrop temp;
    temp = m_LastDecodedFrame;

    if (crop_left | crop_right | crop_top | crop_bottom)
    {
        UMC::RECT SrcCropArea;
        SrcCropArea.left = (Ipp16s) (crop_left);
        SrcCropArea.top  = (Ipp16s) (crop_top);
        SrcCropArea.right = (Ipp16s) (width - crop_right);
        SrcCropArea.bottom = (Ipp16s) (height - crop_bottom);

        temp.Crop(SrcCropArea);
    }

    m_LastDecodedFrame = temp;

} // void InitColorConverter(H264DecoderFrame *source, Ipp8u force_field)

Status TaskSupplier::GetUserData(MediaData * pUD)
{
    if(!pUD)
        return UMC_ERR_NULL_PTR;

    if (!m_pLastDisplayed)
        return UMC_ERR_NOT_ENOUGH_DATA;

    if (m_pLastDisplayed->m_UserData.user_data && m_pLastDisplayed->m_UserData.payLoadSize &&
        m_pLastDisplayed->m_UserData.payLoadType == SEI_USER_DATA_REGISTERED_TYPE)
    {
        pUD->SetTime(m_pLastDisplayed->m_dFrameTime);
        pUD->SetBufferPointer(m_pLastDisplayed->m_UserData.user_data,
            m_pLastDisplayed->m_UserData.payLoadSize);
        pUD->SetDataSize(m_pLastDisplayed->m_UserData.payLoadSize);
        //m_pLastDisplayed->m_UserData.Reset();
        return UMC_OK;
    }

    return UMC_ERR_NOT_ENOUGH_DATA;
}

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
