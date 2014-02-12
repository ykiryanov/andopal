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

#ifndef __UMC_H264_TASK_BROKER_H
#define __UMC_H264_TASK_BROKER_H

#include "umc_h264_dec_defs_dec.h"
#include "umc_h264_slice_decoding.h"

namespace UMC
{
class H264DecoderFrameList;

class TaskBroker
{
public:
    TaskBroker(TaskSupplier * pTaskSupplier);

    void Lock();
    void Unlock();
    virtual ~TaskBroker();

    virtual bool IsEnoughForStartDecoding(H264DecoderFrame *& frames, bool force);

    // Get next working task
    virtual bool GetNextTask(H264Task *pTask);

    virtual void Reset();
    virtual void Release();

    virtual bool Init(Ipp32s iConsumerNumber);

    // Task was performed
    virtual void AddPerformedTask(H264Task *pTask);

    void Start();

    bool IsFrameCompleted(H264DecoderFrame * pFrame) const;

    Mutex m_mGuard;
    Event m_Completed;

    Ipp32s is_completed;
    TaskSupplier * m_pTaskSupplier;

protected:

    virtual bool GetNextTaskInternal(H264Task *pTask) = 0;

    bool GetNextSlice(H264DecoderFrameInfo * info, H264Task *pTask);
    bool GetNextSliceToDecoding(H264DecoderFrameInfo * info, H264Task *pTask);

    // Get number of slices to reconstruct
    Ipp32s GetNumberOfSlicesToReconstruct(H264DecoderFrameInfo * info, bool bOnlyReadySlices = false);

    // Get next available slice to deblocking
    bool GetNextSliceToDeblocking(H264DecoderFrameInfo * info, H264Task *pTask);

    // Get number of slices to decode
    Ipp32s GetNumberOfSlicesToDecode(H264DecoderFrameInfo * info);

    // Check current frame condition
    bool IsFrameDeblocked(H264DecoderFrameInfo * info);

    void InitTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice);

    void InitAUs(H264DecoderFrame * pFrame);
    H264DecoderFrameInfo * FindAU(H264DecoderFrame * frame);
    void SwitchCurrentAU();

    bool IsFrameCompleted() const;

    Ipp32s m_iConsumerNumber;

    H264DecoderFrame * m_pCurrentFrame;
    H264DecoderFrameInfo * m_FirstAU;
    H264DecoderFrameInfo * m_AdditionalInfo;

    H264StructArray<Event> m_eWaiting;                          // (H264ItemArray<Event>) waiting threads events
    Ipp32u m_nWaitingThreads;                                   // (Ipp32u) mask of waiting threads

    bool m_IsShouldQuit;

};

class TaskBrokerSingleThread : public TaskBroker
{
public:
    TaskBrokerSingleThread(TaskSupplier * pTaskSupplier);

    // Get next working task
    virtual bool GetNextTaskInternal(H264Task *pTask);
};

class TaskBrokerTwoThread : public TaskBrokerSingleThread
{
public:

    TaskBrokerTwoThread(TaskSupplier * pTaskSupplier);

    virtual bool GetNextTaskManySlices(H264DecoderFrameInfo * info, H264Task *pTask);

    // Get next working task
    virtual bool GetNextTaskInternal(H264Task *pTask);

    virtual void Release();
    virtual void Reset();

    virtual bool Init(Ipp32s iConsumerNumber);

    virtual void AddPerformedTask(H264Task *pTask);

private:

    bool WrapDecodingTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice);
    bool WrapReconstructTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice);
    bool WrapDecRecTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice);

    bool GetDecRecTask(H264DecoderFrameInfo * info, H264Task *pTask);
    bool GetDecodingTask(H264DecoderFrameInfo * info, H264Task *pTask);
    bool GetReconstructTask(H264DecoderFrameInfo * info, H264Task *pTask);
    bool GetDeblockingTask(H264DecoderFrameInfo * info, H264Task *pTask);
    bool GetFrameDeblockingTaskThreaded(H264DecoderFrameInfo * info, H264Task *pTask);

    void CompleteFrame();
    void AwakeThreads();
};

} // namespace UMC

#endif // __UMC_H264_TASK_BROKER_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
