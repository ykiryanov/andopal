/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#include <cstdarg>
#include "umc_h264_task_broker.h"
#include "umc_h264_segment_decoder_mt.h"
#include "umc_h264_heap.h"
#include "umc_h264_task_supplier.h"
#include "umc_h264_frame_list.h"

static Ipp32s lock_failed = 0;
static Ipp32s sleep_count = 0;

template<class T>
static void swap(T & t1, T & t2)
{
    T & temp = t1;
    t1 = t2;
    t2 = temp;
}

#define DEBUG_PRINT(x)
#define DEBUG_PRINT1(x)

namespace UMC
{

void PrintInfoStatus(H264DecoderFrameInfo * info)
{
    if (!info)
        return;

    printf("needtoCheck - %d. status - %d\n", info->GetRefAU() != 0, info->GetStatus());
}

void PrintAllInfos(H264DecoderFrame * frame)
{
    printf("all info\n");
    for (; frame; frame = frame->future())
    {
        H264DecoderFrameInfo *slicesInfo = frame->GetAU(0);

        if (slicesInfo->GetAllSliceCount())
        {
            printf("poc - %d\n", slicesInfo->m_pFrame->m_PicOrderCnt[0]);
            if (slicesInfo->IsField())
            {
                PrintInfoStatus(slicesInfo);
                PrintInfoStatus(frame->GetAU(1));
            }
            else
            {
                PrintInfoStatus(slicesInfo);
            }
        }
    }

    printf("all info end\n");
}

Ipp32s GetDecodingOffset(H264DecoderFrameInfo * curInfo, Ipp32s &readyCount)
{
    Ipp32s offset = 0;

    H264DecoderFrameInfo * refInfo = curInfo->GetRefAU();
    VM_ASSERT(refInfo);

    if (curInfo->m_pFrame != refInfo->m_pFrame)
    {
        switch(curInfo->m_pFrame->m_PictureStructureForDec)
        {
        case FRM_STRUCTURE:
            if (refInfo->m_pFrame->m_PictureStructureForDec == FLD_STRUCTURE)
            {
                readyCount *= 2;
                offset++;
            }
            else
            {
            }
            break;
        case AFRM_STRUCTURE:
            if (refInfo->m_pFrame->m_PictureStructureForDec == FLD_STRUCTURE)
            {
                readyCount *= 2;
                offset++;
            }
            else
            {
            }
            break;
        case FLD_STRUCTURE:
            switch(refInfo->m_pFrame->m_PictureStructureForDec)
            {
            case FLD_STRUCTURE:
                break;
            case AFRM_STRUCTURE:
            case FRM_STRUCTURE:
                readyCount /= 2;
                offset++;
                break;
            }
            break;
        }
    }

    return offset;
}

enum
{
    CURRENT_SLICE,
    OTHER_SLICES
};


TaskBroker::TaskBroker(TaskSupplier * pTaskSupplier)
    : m_iConsumerNumber(0)
    , m_pTaskSupplier(pTaskSupplier)
{
    Release();
}

TaskBroker::~TaskBroker()
{
    Release();
}

bool TaskBroker::Init(Ipp32s iConsumerNumber)
{
    Release();

    m_Completed.Init(0, 0);

    // we keep this variable due some optimizations purposes
    m_iConsumerNumber = iConsumerNumber;
    m_IsShouldQuit = false;
    return true;
}

void TaskBroker::Reset()
{
    AutomaticUMCMutex guard(m_mGuard);

    m_pCurrentFrame = 0;
    m_FirstAU = 0;
    is_completed = 0;
    m_IsShouldQuit = true;
}

void TaskBroker::Release()
{
    Reset();
}

void TaskBroker::Lock()
{
    m_mGuard.Lock();
}

void TaskBroker::Unlock()
{
    m_mGuard.Unlock();
}

void TaskBroker::SwitchCurrentAU()
{
    if (!m_FirstAU || !m_FirstAU->IsCompleted())
        return;

    DEBUG_PRINT((VM_STRING("Switch current AU - is_completed %d\n"), m_FirstAU->IsCompleted()));
    //m_FirstAU->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED);  //quuu

    while (m_FirstAU)
    {
        m_FirstAU = m_FirstAU->GetNextAU();

        if (m_FirstAU)
        {
            m_FirstAU->SetRefAU(0);

            if (m_FirstAU->IsCompleted())
            {
                //m_FirstAU->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED); // quuu
            }
            else
            {
                break;
            }
        }
    }

    if (!m_FirstAU)
    {
        m_FirstAU = FindAU(m_pTaskSupplier->m_pFirstUncompletedFrame);
        if (m_FirstAU)
        {
            m_FirstAU->SetStatus(H264DecoderFrameInfo::STATUS_STARTED);
            m_FirstAU->SetRefAU(0);
            DEBUG_PRINT1(("SwitchCurrentAU additional poc - %d, first - poc %d\n", m_FirstAU->m_pFrame->m_PicOrderCnt[0], m_pTaskSupplier->m_pFirstUncompletedFrame->m_PicOrderCnt[0]));
        }
    }

    if (m_FirstAU && m_FirstAU->IsSliceGroups())
        m_FirstAU = 0;
}

void TaskBroker::Start()
{
    Lock();
    m_pCurrentFrame = m_pTaskSupplier->m_pFirstUncompletedFrame;
    DEBUG_PRINT1(("start - Cuurentframe poc - %d\n", m_pCurrentFrame->m_PicOrderCnt[0]));

    H264DecoderFrame * frame = m_pCurrentFrame;
    for (; frame; frame = frame->future())
    {
        H264DecoderFrameInfo *slicesInfo = frame->GetAU(0);
        if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_STARTED)
            slicesInfo->SetStatus(H264DecoderFrameInfo::STATUS_FILLED);

        slicesInfo = frame->GetAU(1);
        if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_STARTED)
            slicesInfo->SetStatus(H264DecoderFrameInfo::STATUS_FILLED);

        H264DecoderFrame * temp = GetAuxiliaryFrame(frame);
        if (temp)
        {
            H264DecoderFrameInfo *slicesInfo = temp->GetAU(0);
            if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_STARTED)
                slicesInfo->SetStatus(H264DecoderFrameInfo::STATUS_FILLED);

            slicesInfo = temp->GetAU(1);
            if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_STARTED)
                slicesInfo->SetStatus(H264DecoderFrameInfo::STATUS_FILLED);
        }
    }

    InitAUs(m_pTaskSupplier->m_pFirstUncompletedFrame);
    Unlock();
}

H264DecoderFrameInfo * TaskBroker::FindAU(H264DecoderFrame * frame)
{
    H264DecoderFrame * temp = frame;

    frame = temp;
    for (; frame; frame = frame->future())
    {
        H264DecoderFrameInfo *slicesInfo = frame->GetAU(0);

        if (slicesInfo->GetAllSliceCount())
        {
            if (slicesInfo->IsField())
            {
                if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_FILLED)
                    return slicesInfo;

                if (frame->GetAU(1)->GetStatus() == H264DecoderFrameInfo::STATUS_FILLED)
                    return frame->GetAU(1);
            }
            else
            {
                if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_FILLED)
                    return slicesInfo;
            }
        }

        if (UMC::GetAuxiliaryFrame(frame))
        {
            temp = UMC::GetAuxiliaryFrame(frame);

            H264DecoderFrameInfo *slicesInfo = temp->GetAU(0);

            if (slicesInfo->GetAllSliceCount())
            {
                if (slicesInfo->IsField())
                {
                    if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_FILLED)
                        return slicesInfo;

                    if (temp->GetAU(1)->GetStatus() == H264DecoderFrameInfo::STATUS_FILLED)
                        return temp->GetAU(1);
                }
                else
                {
                    if (slicesInfo->GetStatus() == H264DecoderFrameInfo::STATUS_FILLED)
                        return slicesInfo;
                }
            }
        }
    }

    return 0;
}

void TaskBroker::InitAUs(H264DecoderFrame * pFrame)
{
    m_FirstAU = FindAU(pFrame);
    if (!m_FirstAU)
        return;

    m_pCurrentFrame = pFrame;
    m_FirstAU->SetStatus(H264DecoderFrameInfo::STATUS_STARTED);

    H264DecoderFrameInfo * pPrev = m_FirstAU;
    m_FirstAU->SetPrevAU(0);
    m_FirstAU->SetNextAU(0);

    H264DecoderFrameInfo * refAU = 0;
    H264DecoderFrameInfo * refAUAuxiliary = 0;
    m_FirstAU->SetRefAU(0);

    if (m_FirstAU->IsReference())
    {
        if (m_FirstAU->IsAuxiliary())
            refAUAuxiliary = m_FirstAU;
        else
            refAU = m_FirstAU;
    }

    H264DecoderFrameInfo * pTemp = FindAU(m_pCurrentFrame);
    for (; pTemp; pTemp = FindAU(m_pCurrentFrame))
    {
        pTemp->SetStatus(H264DecoderFrameInfo::STATUS_STARTED);
        pTemp->SetNextAU(0);
        pTemp->SetPrevAU(pPrev);

        if (pTemp->IsAuxiliary())
            pTemp->SetRefAU(refAUAuxiliary);
        else
            pTemp->SetRefAU(refAU);

        if (pTemp->IsReference())
        {
            if (pTemp->IsAuxiliary())
                refAUAuxiliary = pTemp;
            else
                refAU = pTemp;
        }

        pPrev->SetNextAU(pTemp);
        pPrev = pTemp;
    }
}

bool TaskBroker::IsFrameCompleted() const
{
    return IsFrameCompleted(m_pCurrentFrame);
}

bool TaskBroker::IsFrameCompleted(H264DecoderFrame * pFrame) const
{
    if (!pFrame)
        return true;

    if (!pFrame->GetAU(0)->IsCompleted())
        return false;

    //pFrame->GetAU(0)->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED); //quuu
    H264DecoderFrameInfo::FillnessStatus status1 = pFrame->GetAU(1)->GetStatus();

    bool ret;
    switch (status1)
    {
    case H264DecoderFrameInfo::STATUS_NONE:
        ret = true;
        break;
    case H264DecoderFrameInfo::STATUS_NOT_FILLED:
        ret = false;
        break;
    case H264DecoderFrameInfo::STATUS_COMPLETED:
        ret = true;
        break;
    default:
        ret = pFrame->GetAU(1)->IsCompleted();
        break;
    }

    if (ret && !pFrame->IsAuxiliaryFrame())
    {
        ret = IsFrameCompleted(UMC::GetAuxiliaryFrame(pFrame));
    }

    return ret;
}

Ipp32s TaskBroker::GetNumberOfSlicesToReconstruct(H264DecoderFrameInfo * info, bool bOnlyReadySlices)
{
    Ipp32s i, iCount = 0;

    Ipp32s sliceCount = info->GetSliceCount();

    for (i = 0; i < sliceCount; i ++)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if (pSlice->m_iMaxMB > pSlice->m_iCurMBToRec)
        {
            // we count up all decoding slices
            if ((false == bOnlyReadySlices) ||
            // or only ready to reconstruct
                ((pSlice->m_bRecVacant) && (pSlice->m_CoeffsBuffers.IsOutputAvailable())))
                iCount += 1;
        }
    }

    return iCount;

} // Ipp32s TaskBroker::GetNumberOfSlicesToReconstruct(void)

bool TaskBroker::IsFrameDeblocked(H264DecoderFrameInfo * info)
{
    // this is guarded function, safe to touch any variable

    Ipp32s i;

    // there is nothing to do
    Ipp32s sliceCount = info->GetSliceCount();
    if (0 == sliceCount)
        return true;

    for (i = 0; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if ((pSlice) &&
            (false == pSlice->m_bDeblocked))
            return false;
    }

    return true;

} // bool TaskBroker::IsFrameDeblocked(void)

Ipp32s TaskBroker::GetNumberOfSlicesToDecode(H264DecoderFrameInfo * info)
{
    Ipp32s i, iCount = 0;

    Ipp32s sliceCount = info->GetSliceCount();
    for (i = 0; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if (pSlice->m_iMaxMB > pSlice->m_iCurMBToDec)
            iCount += 1;
    }

    return iCount;

} // Ipp32s TaskBroker::GetNumberOfSlicesToDecode(void)

bool TaskBroker::GetNextTask(H264Task *pTask)
{
    AutomaticUMCMutex guard(m_mGuard);

    // check error(s)
    if (!m_FirstAU)
    {
        return false;
    }

    bool res = GetNextTaskInternal(pTask);
    return res;
} // bool TaskBroker::GetNextTask(H264Task *pTask)

bool TaskBroker::GetNextSlice(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable
    // check error(s)
    if (!info)
        return false;

    if (GetNextSliceToDecoding(info, pTask))
        return true;

    // try to get slice to deblock
    if (info->IsNeedDeblocking())
        return GetNextSliceToDeblocking(info, pTask);

    return false;
} // bool TaskBroker::GetNextSlice(H264Task *pTask)

void TaskBroker::InitTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice)
{
    pTask->m_bDone = false;
    pTask->m_bError = false;
    pTask->m_iMaxMB = pSlice->m_iMaxMB;
    pTask->m_pSlice = pSlice;
    pTask->m_pSlicesInfo = info;
}

bool TaskBroker::GetNextSliceToDecoding(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable

    Ipp32s i;
    bool bDoDeblocking;

    // skip some slices, more suitable for first thread
    // and first slice is always reserved for first slice decoder

    i = 0;
    bDoDeblocking = false;

    // find first uncompressed slice
    Ipp32s sliceCount = info->GetSliceCount();
    for (; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if ((false == pSlice->m_bInProcess) &&
            (false == pSlice->m_bDecoded))
        {
            InitTask(info, pTask, pSlice);
            pTask->m_iFirstMB = pSlice->m_iFirstMB;
            pTask->m_iMBToProcess = IPP_MIN(pSlice->m_iMaxMB - pSlice->m_iFirstMB, pSlice->m_iAvailableMB);
            pTask->m_iTaskID = TASK_PROCESS;
            pTask->m_pBuffer = NULL;
            pTask->pFunction = &H264SegmentDecoderMultiThreaded::ProcessSlice;
            // we can do deblocking only on independent slices or
            // when all previous slices are deblocked
            if (DEBLOCK_FILTER_ON != pSlice->m_SliceHeader.disable_deblocking_filter_idc)
                bDoDeblocking = true;
            pSlice->m_bPrevDeblocked = bDoDeblocking;
            pSlice->m_bInProcess = true;
            pSlice->m_bDecVacant = 0;
            pSlice->m_bRecVacant = 0;
            pSlice->m_bDebVacant = 0;

#ifdef ECHO
            DEBUG_PRINT((VM_STRING("(%d) slice dec - % 4d to % 4d\n"), pTask->m_iThreadNumber,
                    pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO

            return true;
        }
    }

    return false;

} // bool TaskBroker::GetNextSliceToDecoding(H264Task *pTask)

bool TaskBroker::GetNextSliceToDeblocking(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable

    Ipp32s sliceCount = info->GetSliceCount();
    bool bSliceGroups = info->GetSlice(0)->IsSliceGroups();

    // slice group deblocking
    if (bSliceGroups)
    {
        Ipp32s iFirstMB = info->GetSlice(0)->m_iFirstMB;
        bool bNothingToDo = true;
        Ipp32s i;

        for (i = 0; i < sliceCount; i += 1)
        {
            H264Slice *pSlice = info->GetSlice(i);

            VM_ASSERT(false == pSlice->m_bInProcess);

            pSlice->m_bInProcess = true;
            pSlice->m_bDebVacant = 0;
            iFirstMB = IPP_MIN(iFirstMB, pSlice->m_iFirstMB);
            if (false == pSlice->m_bDeblocked)
                bNothingToDo = false;
        }

        // we already deblocked
        if (bNothingToDo)
            return false;

        H264Slice *pSlice = info->GetSlice(0);
        InitTask(info, pTask, pSlice);
        pTask->m_iFirstMB = iFirstMB;
        Ipp32s iMBInFrame = (pSlice->m_iMBWidth * pSlice->m_iMBHeight) /
                            ((pSlice->m_SliceHeader.field_pic_flag) ? (2) : (1));
        pTask->m_iMaxMB = iFirstMB + iMBInFrame;
        pTask->m_iMBToProcess = iMBInFrame;

        pTask->m_iTaskID = TASK_DEB_FRAME;
        pTask->m_pBuffer = 0;
        pTask->pFunction = &H264SegmentDecoder::DeblockSlice;

#ifdef ECHO_DEB
        DEBUG_PRINT((VM_STRING("(%d) frame deb - % 4d to % 4d\n"), pTask->m_iThreadNumber,
                pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO_DEB

        return true;
    }
    else
    {
        Ipp32s i;
        bool bPrevDeblocked = true;

        for (i = 0; i < sliceCount; i += 1)
        {
            H264Slice *pSlice = info->GetSlice(i);

            // we can do deblocking only on vacant slices
            if ((false == pSlice->m_bInProcess) &&
                (true == pSlice->m_bDecoded) &&
                (false == pSlice->m_bDeblocked))
            {
                // we can do this only when previous slice was deblocked or
                // deblocking isn't going through slice boundaries
                if ((true == bPrevDeblocked) ||
                    (false == pSlice->DeblockThroughBoundaries()))
                {
                    InitTask(info, pTask, pSlice);
                    pTask->m_iFirstMB = pSlice->m_iFirstMB;
                    pTask->m_iMBToProcess = pSlice->m_iMaxMB - pSlice->m_iFirstMB;
                    pTask->m_iTaskID = TASK_DEB_SLICE;
                    pTask->m_pBuffer = NULL;
                    pTask->pFunction = &H264SegmentDecoder::DeblockSlice;

                    pSlice->m_bPrevDeblocked = true;
                    pSlice->m_bInProcess = true;
                    pSlice->m_bDebVacant = 0;

#ifdef ECHO_DEB
                    DEBUG_PRINT((VM_STRING("(%d) slice deb - % 4d to % 4d\n"), pTask->m_iThreadNumber,
                            pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO_DEB

                    return true;
                }
            }

            // save previous slices deblocking condition
            if (false == pSlice->m_bDeblocked)
                bPrevDeblocked = false;
        }
    }

    return false;

} // bool TaskBroker::GetNextSliceToDeblocking(H264Task *pTask)

void TaskBroker::AddPerformedTask(H264Task *pTask)
{
    H264Slice *pSlice = pTask->m_pSlice;
    H264DecoderFrameInfo * info = pTask->m_pSlicesInfo;

#if defined(ECHO)
        switch (pTask->m_iTaskID)
        {
        case TASK_PROCESS:
            DEBUG_PRINT((VM_STRING("(%d) (%d) slice dec done % 4d to % 4d - error - %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess, pTask->m_bError));
            break;
        case TASK_DEC:
            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) dec done % 4d to % 4d - error - %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()),  pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess, pTask->m_bError));
            break;
        case TASK_REC:
            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) rec done % 4d to % 4d - error - %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess, pTask->m_bError));
            break;
        case TASK_DEC_REC:
            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) dec_rec done % 4d to % 4d - error - %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess, pTask->m_bError));
            break;
        case TASK_DEB:
#if defined(ECHO_DEB)
            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) deb done % 4d to % 4d - error - %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess, pTask->m_bError));
#else
        case TASK_DEB_FRAME:
        case TASK_DEB_FRAME_THREADED:
        case TASK_DEB_SLICE:
        case TASK_DEB_THREADED:
#endif // defined(ECHO_DEB)
            break;
        default:
            DEBUG_PRINT((VM_STRING("(%d) default task done % 4d to % 4d - error - %d\n"), pTask->m_iThreadNumber, pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess, pTask->m_bError));
            break;
        }
#endif // defined(ECHO)

    // when whole slice was processed
    if (TASK_PROCESS == pTask->m_iTaskID)
    {
        // it is possible only in "slice group" mode
        if (pTask->m_pSlice->IsSliceGroups())
        {
            pSlice->m_iMaxMB = pTask->m_iMaxMB;
            pSlice->m_iAvailableMB -= pTask->m_iMBToProcess;

            // correct remain uncompressed macroblock count.
            // we can't relay on slice number cause of field pictures.
            /*if (pSlice->m_iAvailableMB)
            {
                Ipp32s pos = info->GetPositionByNumber(pSlice->GetSliceNum());
                VM_ASSERT(pos >= 0);
                H264Slice * pNextSlice = info->GetSlice(pos + 1);
                if (pNextSlice)
                {
                    pNextSlice->m_iAvailableMB = pSlice->m_iAvailableMB;
                }
            }*/
        }

        // slice is deblocked only when deblocking was available
        if (false == pSlice->IsSliceGroups())
        {
            // check condition for frame deblocking
            //if (DEBLOCK_FILTER_ON_NO_SLICE_EDGES == pSlice->m_SliceHeader.disable_deblocking_filter_idc)
                //m_bDoFrameDeblocking = false; // DEBUG : ADB

            if (false == pSlice->m_bDeblocked)
                pSlice->m_bDeblocked = pSlice->m_bPrevDeblocked;
        }
        // slice is decoded
        pSlice->m_bDecoded = true;
        pSlice->m_bDecVacant = 0;
        pSlice->m_bRecVacant = 0;
        pSlice->m_bDebVacant = 1;
        pSlice->m_bInProcess = false;
    }
    else if (TASK_DEB_SLICE == pTask->m_iTaskID)
    {
        pSlice->m_bDebVacant = 1;
        pSlice->m_bDeblocked = 1;
        pSlice->m_bInProcess = false;
    }
    else if (TASK_DEB_FRAME == pTask->m_iTaskID)
    {
        Ipp32s sliceCount = m_FirstAU->GetSliceCount();

        // frame is deblocked
        for (Ipp32s i = 0; i < sliceCount; i += 1)
        {
            H264Slice *pTemp = m_FirstAU->GetSlice(i);

            pTemp->m_bDebVacant = 1;
            pTemp->m_bDeblocked = true;
            pTemp->m_bInProcess = false;
        }
    }
    else
    {
        switch (pTask->m_iTaskID)
        {
        case TASK_DEC:
            {
            VM_ASSERT(pTask->m_iFirstMB == pSlice->m_iCurMBToDec);

            pSlice->m_iCurMBToDec += pTask->m_iMBToProcess;
            // move filled buffer to reconstruct queue
            pSlice->m_CoeffsBuffers.UnLockInputBuffer(pTask->m_WrittenSize);

            bool isReadyIncrease = (pTask->m_iFirstMB == info->m_iDecMBReady);
            if (isReadyIncrease)
            {
                info->m_iDecMBReady += pTask->m_iMBToProcess;
            }

            pSlice->m_iMaxMB = pTask->m_iMaxMB;

            // error handling
            if (pTask->m_bError)
            {
                if (isReadyIncrease)
                    info->m_iDecMBReady = pSlice->m_iMaxMB;
                pSlice->m_iMaxMB = pSlice->m_iCurMBToDec;
                pSlice->m_bError = true;
            }

            if (pSlice->m_iCurMBToDec >= pSlice->m_iMaxMB)
            {
                pSlice->m_bDecVacant = 0;
                if (isReadyIncrease)
                {
                    Ipp32s pos = info->GetPositionByNumber(pSlice->GetSliceNum());
                    VM_ASSERT(pos >= 0);
                    H264Slice * pNextSlice = info->GetSlice(pos + 1);
                    if (pNextSlice)
                    {
                       info->m_iDecMBReady = pNextSlice->m_iCurMBToDec;
                    }
                }
            }
            else
            {
                pSlice->m_bDecVacant = 1;
            }

            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) dec ready %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), info->m_iDecMBReady));
            }
            break;

        case TASK_REC:
            {
            VM_ASSERT(pTask->m_iFirstMB == pSlice->m_iCurMBToRec);

            pSlice->m_iCurMBToRec += pTask->m_iMBToProcess;

            bool isReadyIncrease = (pTask->m_iFirstMB == info->m_iRecMBReady) && pSlice->m_bDeblocked;
            if (isReadyIncrease)
            {
                info->m_iRecMBReady += pTask->m_iMBToProcess;
            }

            pSlice->m_CoeffsBuffers.UnLockOutputBuffer();

            if (pSlice->m_iMaxMB <= pSlice->m_iCurMBToRec)
            {
                pSlice->m_bRecVacant = 0;
                pSlice->m_bDecoded = true;

                if (isReadyIncrease)
                {
                    Ipp32s pos = info->GetPositionByNumber(pSlice->GetSliceNum());
                    VM_ASSERT(pos >= 0);
                    H264Slice * pNextSlice = info->GetSlice(pos + 1);
                    if (pNextSlice)
                    {
                        if (pNextSlice->m_bDeblocked)
                            info->m_iRecMBReady = pNextSlice->m_iCurMBToRec;
                        else
                            info->m_iRecMBReady = pNextSlice->m_iCurMBToDeb;

                        info->RemoveSlice(pos);
                    }
                }

                // check condition for frame deblocking
                //if (DEBLOCK_FILTER_ON_NO_SLICE_EDGES == pSlice->m_SliceHeader.disable_deblocking_filter_idc)
                //    m_bDoFrameDeblocking = false;  // DEBUG : ADB
            }
            else
            {
                pSlice->m_bRecVacant = 1;
            }
            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) rec ready %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), info->m_iRecMBReady));
            }
            break;

        case TASK_DEC_REC:
            {
            VM_ASSERT(pTask->m_iFirstMB == pSlice->m_iCurMBToDec);
            VM_ASSERT(pTask->m_iFirstMB == pSlice->m_iCurMBToRec);

            pSlice->m_iCurMBToDec += pTask->m_iMBToProcess;
            pSlice->m_iCurMBToRec += pTask->m_iMBToProcess;

            bool isReadyIncrease = (pTask->m_iFirstMB == info->m_iDecMBReady
                && pTask->m_iFirstMB == info->m_iRecMBReady);

            pSlice->m_iMaxMB = pTask->m_iMaxMB;

            if (isReadyIncrease)
            {
                info->m_iDecMBReady += pTask->m_iMBToProcess;
                if (pSlice->m_bDeblocked)
                    info->m_iRecMBReady += pTask->m_iMBToProcess;
            }

            // error handling
            if (pTask->m_bError)
            {
                if (isReadyIncrease)
                {
                    info->m_iDecMBReady = pSlice->m_iMaxMB;
                    if (pSlice->m_bDeblocked)
                        info->m_iRecMBReady = pSlice->m_iMaxMB;
                }

                pSlice->m_iMaxMB = pSlice->m_iCurMBToDec;
                pSlice->m_bError = true;
            }

            if (pSlice->m_iCurMBToDec >= pSlice->m_iMaxMB)
            {
                VM_ASSERT(pSlice->m_iCurMBToRec >= pSlice->m_iMaxMB);

                pSlice->m_bDecVacant = 0;
                pSlice->m_bRecVacant = 0;
                pSlice->m_bDecoded = true;

                if (isReadyIncrease)
                {
                    Ipp32s pos = info->GetPositionByNumber(pSlice->GetSliceNum());
                    VM_ASSERT(pos >= 0);
                    H264Slice * pNextSlice = info->GetSlice(pos + 1);
                    if (pNextSlice)
                    {
                        info->m_iDecMBReady = pNextSlice->m_iCurMBToDec;
                        if (pSlice->m_bDeblocked)
                        {
                            if (pNextSlice->m_bDeblocked)
                                info->m_iRecMBReady = pNextSlice->m_iCurMBToRec;
                            else
                                info->m_iRecMBReady = pNextSlice->m_iCurMBToDeb;

                            info->RemoveSlice(pos);
                        }
                    }
                }
            }
            else
            {
                pSlice->m_bDecVacant = 1;
                pSlice->m_bRecVacant = 1;
            }

            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) (%d) dec_rec ready %d %d\n"), pTask->m_iThreadNumber, (Ipp32s)(info != m_FirstAU), info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), info->m_iDecMBReady, info->m_iRecMBReady));
            }
            break;

        case TASK_DEB:
            {
            VM_ASSERT(pTask->m_iFirstMB == pSlice->m_iCurMBToDeb);

            pSlice->m_iCurMBToDeb += pTask->m_iMBToProcess;

            bool isReadyIncrease = (pTask->m_iFirstMB == info->m_iRecMBReady);
            if (isReadyIncrease)
            {
                info->m_iRecMBReady += pTask->m_iMBToProcess;
            }

            if (pSlice->m_iMaxMB <= pSlice->m_iCurMBToDeb)
            {
                pSlice->m_bDeblocked = true;
                pSlice->m_bInProcess = false;
                pSlice->m_bDecVacant = 0;
                pSlice->m_bRecVacant = 0;

                Ipp32s pos = info->GetPositionByNumber(pSlice->GetSliceNum());
                if (isReadyIncrease)
                {
                    VM_ASSERT(pos >= 0);
                    H264Slice * pNextSlice = info->GetSlice(pos + 1);
                    if (pNextSlice)
                    {
                        if (pNextSlice->m_bDeblocked)
                            info->m_iRecMBReady = pNextSlice->m_iCurMBToRec;
                        else
                            info->m_iRecMBReady = pNextSlice->m_iCurMBToDeb;
                    }
                }

                info->RemoveSlice(pos);
            }
            else
            {
                pSlice->m_bDebVacant = 1;
            }

            DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) after deb ready %d %d\n"), pTask->m_iThreadNumber, info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), info->m_iDecMBReady, info->m_iRecMBReady));
            }
            break;

        default:
            // illegal case
            VM_ASSERT(false);
            break;
        }
    }

} // void TaskBroker::AddPerformedTask(H264Task *pTask)

bool TaskBroker::IsEnoughForStartDecoding(H264DecoderFrame *& pFrame, bool force)
{
    Lock();
    H264DecoderFrame * frame = pFrame;

    Ipp32s au_count = 0;
    for (; frame; frame = frame->future())
    {
        H264DecoderFrame * temp = UMC::GetAuxiliaryFrame(frame);

        H264DecoderFrameInfo *slicesInfo = frame->GetAU(0);
        H264DecoderFrameInfo *slicesInfoAU = temp ? temp->GetAU(0) : slicesInfo;

        if (slicesInfo->GetAllSliceCount())
        {
            if (slicesInfo->IsField())
            {
                Ipp32s field_au = 0;
                if (slicesInfo->GetStatus() >= H264DecoderFrameInfo::STATUS_FILLED &&
                    slicesInfoAU->GetStatus() >= H264DecoderFrameInfo::STATUS_FILLED)
                    field_au++;

                H264DecoderFrameInfo *slicesInfoB = frame->GetAU(1);
                H264DecoderFrameInfo *slicesInfoAUB = temp ? temp->GetAU(1) : slicesInfoB;

                if ((slicesInfoB->GetStatus() >= H264DecoderFrameInfo::STATUS_FILLED &&
                    slicesInfoAUB->GetStatus() >= H264DecoderFrameInfo::STATUS_FILLED) ||
                    (slicesInfoB->GetStatus() == H264DecoderFrameInfo::STATUS_NONE &&
                    slicesInfoAUB->GetStatus() == H264DecoderFrameInfo::STATUS_NONE))
                {
                    field_au++;
                }

                if (field_au == 2 || (force && field_au))
                    au_count++;
            }
            else
            {
                if (slicesInfo->GetStatus() >= H264DecoderFrameInfo::STATUS_FILLED &&
                    slicesInfoAU->GetStatus() >= H264DecoderFrameInfo::STATUS_FILLED)
                {
                    au_count++;
                }
            }
        }
    }

    Unlock();
    if (au_count >= m_iConsumerNumber || (force && au_count))
        return true;

    return false;
}

TaskBrokerSingleThread::TaskBrokerSingleThread(TaskSupplier * pTaskSupplier)
    : TaskBroker(pTaskSupplier)
{
}

// Get next working task
bool TaskBrokerSingleThread::GetNextTaskInternal(H264Task *pTask)
{
    if (GetNextSlice(m_FirstAU, pTask))
        return true;
    else
    {
        // switch to second field
        if (m_FirstAU && m_FirstAU->IsField())
        {
            SwitchCurrentAU();
            if (!(m_FirstAU && m_FirstAU->m_pFrame != m_pCurrentFrame))
            {
                return GetNextSlice(m_FirstAU, pTask);
            }
        }

        H264DecoderFrame * pFrame = UMC::GetAuxiliaryFrame(m_pCurrentFrame);
        if (pFrame)
        {
            SwitchCurrentAU();
            if (m_FirstAU && m_FirstAU->m_pFrame != pFrame)
            {
                m_FirstAU = 0;
                return false;
            }

            return GetNextSlice(m_FirstAU, pTask);
        }
    }

    m_FirstAU = 0;
    return false;
}

TaskBrokerTwoThread::TaskBrokerTwoThread(TaskSupplier * pTaskSupplier)
    : TaskBrokerSingleThread(pTaskSupplier)
{
}

bool TaskBrokerTwoThread::Init(Ipp32s iConsumerNumber)
{
    if (!TaskBroker::Init(iConsumerNumber))
        return false;

    m_nWaitingThreads = 0;

    m_eWaiting.Init(m_iConsumerNumber);

    // initilaize event(s)
    for (Ipp32s i = 0; i < m_iConsumerNumber; i += 1)
    {
        if (UMC_OK != m_eWaiting[i]->Init(0, 0))
            return false;
    }

    return true;
}

void TaskBrokerTwoThread::Reset()
{
    Lock();
    TaskBrokerSingleThread::Reset();

    for (Ipp32s i = 0; i < m_iConsumerNumber; i += 1)
    {
        m_eWaiting[i]->Set();
    }

    Unlock();
}

void TaskBrokerTwoThread::Release()
{
    Lock();
    TaskBrokerSingleThread::Release();
    AwakeThreads();
    m_eWaiting.Reset();
    m_nWaitingThreads = 0;
    Unlock();
}

void TaskBrokerTwoThread::CompleteFrame()
{
    DEBUG_PRINT((VM_STRING("frame completed - poc - %d\n"), m_pCurrentFrame->m_PicOrderCnt[0]));
    m_pCurrentFrame = 0;
    SwitchCurrentAU();
}

bool TaskBrokerTwoThread::GetNextTaskInternal(H264Task *pTask)
{
    bool is_completed = m_FirstAU->IsCompleted();
    if (m_FirstAU && m_FirstAU->IsSliceGroups())
    {
        if (!pTask->m_iThreadNumber)
        {
            if (is_completed)
            {
                m_FirstAU->SetStatus(H264DecoderFrameInfo::STATUS_COMPLETED);
                m_pCurrentFrame = 0;
                return false;
            }
            else
            {
                return TaskBrokerSingleThread::GetNextTaskInternal(pTask);
            }
        }
        else
        {
            return false;
        }
    }

    if (m_FirstAU && is_completed)
    {
        SwitchCurrentAU();
    }

    while (false == m_IsShouldQuit)
    {
        if (IsFrameCompleted())
        {
            if (!pTask->m_iThreadNumber)
            {
                CompleteFrame();
                AwakeThreads();
                return false;
            }

            if (m_pCurrentFrame)
                AwakeThreads();
        }

        if (!m_FirstAU)
        {
            if (!pTask->m_iThreadNumber)
            {
                CompleteFrame();
                AwakeThreads();
                return false;
            }
        }
        else
        {
            for (H264DecoderFrameInfo *pTemp = m_FirstAU; pTemp; pTemp = pTemp->GetNextAU())
            {
                if (pTemp->IsSliceGroups())
                    break;

                if (GetNextTaskManySlices(pTemp, pTask))
                {
                    return true;
                }
            }
        }

        // it is time to sleep
        m_nWaitingThreads |= (1 << (pTask->m_iThreadNumber));

        DEBUG_PRINT((VM_STRING("(%d) sleep\n"), pTask->m_iThreadNumber));
        Unlock();

        sleep_count++;

        m_eWaiting[pTask->m_iThreadNumber]->Wait();

        Lock();

        pTask->m_WrittenSize = 0;
        m_nWaitingThreads ^= (1 << (pTask->m_iThreadNumber));
    };

    return false;
}

bool TaskBrokerTwoThread::WrapDecodingTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice)
{
    VM_ASSERT(pSlice);

    // this is guarded function, safe to touch any variable
    if ((1 == pSlice->m_bDecVacant) &&
        (pSlice->m_CoeffsBuffers.IsInputAvailable()))
    {
        pSlice->m_bInProcess = true;
        pSlice->m_bDecVacant = 0;

        Ipp32s iMBWidth = pSlice->GetMBRowWidth();

        InitTask(info, pTask, pSlice);
        pTask->m_iFirstMB = pSlice->m_iCurMBToDec;
        pTask->m_iMBToProcess = IPP_MIN(pSlice->m_iCurMBToDec -
                                    (pSlice->m_iCurMBToDec % iMBWidth) +
                                    iMBWidth,
                                    pSlice->m_iMaxMB) - pSlice->m_iCurMBToDec;

        pTask->m_iMBToProcess = IPP_MIN(pTask->m_iMBToProcess, pSlice->m_iAvailableMB);
        pTask->m_iTaskID = TASK_DEC;
        pTask->m_pBuffer = (UMC::CoeffsPtrCommon)pSlice->m_CoeffsBuffers.LockInputBuffer();
        pTask->pFunction = &H264SegmentDecoderMultiThreaded::DecodeSegment;

#ifdef ECHO
        DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) dec - % 4d to % 4d\n"), pTask->m_iThreadNumber,
            info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO

        return true;
    }

    return false;

} // bool TaskBrokerTwoThread::WrapDecodingTask(H264Task *pTask, H264Slice *pSlice)

bool TaskBrokerTwoThread::WrapReconstructTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice)
{
    VM_ASSERT(pSlice);
    // this is guarded function, safe to touch any variable

    if ((1 == pSlice->m_bRecVacant) &&
        (pSlice->m_CoeffsBuffers.IsOutputAvailable()))
    {
        pSlice->m_bRecVacant = 0;

        Ipp32s iMBWidth = pSlice->GetMBRowWidth();

        InitTask(info, pTask, pSlice);
        pTask->m_iFirstMB = pSlice->m_iCurMBToRec;
        pTask->m_iMBToProcess = IPP_MIN(pSlice->m_iCurMBToRec -
                                    (pSlice->m_iCurMBToRec % iMBWidth) +
                                    iMBWidth,
                                    pSlice->m_iMaxMB) - pSlice->m_iCurMBToRec;

        pTask->m_iTaskID = TASK_REC;
        Ipp8u* pointer;
        size_t size;
        pSlice->m_CoeffsBuffers.LockOutputBuffer(pointer, size);
        pTask->m_pBuffer = ((UMC::CoeffsPtrCommon) pointer);
        pTask->pFunction = &H264SegmentDecoderMultiThreaded::ReconstructSegment;

#ifdef ECHO
        DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) rec - % 4d to % 4d\n"), pTask->m_iThreadNumber,
            info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO

        return true;
    }

    return false;

} // bool TaskBrokerTwoThread::WrapReconstructTask(H264Task *pTaskm H264Slice *pSlice)

bool TaskBrokerTwoThread::WrapDecRecTask(H264DecoderFrameInfo * info, H264Task *pTask, H264Slice *pSlice)
{
    VM_ASSERT(pSlice);
    // this is guarded function, safe to touch any variable

    if ((1 == pSlice->m_bRecVacant) && (1 == pSlice->m_bDecVacant) &&
        (pSlice->m_iCurMBToDec == pSlice->m_iCurMBToRec) &&
        (pSlice->m_CoeffsBuffers.IsInputAvailable()))
    {
        pSlice->m_bRecVacant = 0;
        pSlice->m_bDecVacant = 0;

        Ipp32s iMBWidth = pSlice->GetMBRowWidth();

        InitTask(info, pTask, pSlice);
        pTask->m_iFirstMB = pSlice->m_iCurMBToDec;
        pTask->m_iMBToProcess = IPP_MIN(pSlice->m_iCurMBToDec -
                                    (pSlice->m_iCurMBToDec % iMBWidth) +
                                    iMBWidth,
                                    pSlice->m_iMaxMB) - pSlice->m_iCurMBToDec;

        pTask->m_iTaskID = TASK_DEC_REC;
        pTask->m_pBuffer = 0;
        pTask->pFunction = &H264SegmentDecoderMultiThreaded::DecRecSegment;

#ifdef ECHO
        DEBUG_PRINT((VM_STRING("(%d) (%d) (%d) dec_rec - % 4d to % 4d\n"), pTask->m_iThreadNumber,
            info->m_pFrame->m_PicOrderCnt[0], (Ipp32s)(pSlice->IsBottomField()), pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO

        return true;
    }

    return false;

} // bool TaskBrokerTwoThread::WrapDecRecTask(H264Task *pTaskm H264Slice *pSlice)

bool TaskBrokerTwoThread::GetDecodingTask(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable
    Ipp32s i;

    H264DecoderFrameInfo * refAU = info->GetRefAU();
    bool is_need_check = refAU != 0;
    Ipp32s readyCount = 0;
    Ipp32s additionalLines = 0;

    if (is_need_check)
    {
        readyCount = refAU->m_iDecMBReady;
        additionalLines = GetDecodingOffset(info, readyCount);
    }

    Ipp32s sliceCount = info->GetSliceCount();
    for (i = 0; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if (pSlice->m_bDecVacant != 1)
            continue;

        if (is_need_check)
        {
            if (pSlice->m_iCurMBToDec + (1 + additionalLines)*pSlice->GetMBRowWidth() >= readyCount)
                break;
        }

        if (WrapDecodingTask(info, pTask, pSlice))
            return true;
    }

    return false;

} // bool TaskBrokerTwoThread::GetDecodingTask(H264DecoderFrameInfo * info, H264Task *pTask)

bool TaskBrokerTwoThread::GetReconstructTask(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable

    H264DecoderFrameInfo * refAU = info->GetRefAU();
    bool is_need_check = refAU != 0;
    Ipp32s readyCount = 0;
    Ipp32s additionalLines = 0;

    if (is_need_check)
    {
        readyCount = refAU->m_iRecMBReady;
        additionalLines = GetDecodingOffset(info, readyCount);
    }

    Ipp32s i;
    Ipp32s sliceCount = info->GetSliceCount();
    for (i = 0; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if (pSlice->m_bRecVacant != 1 ||
            !pSlice->m_CoeffsBuffers.IsOutputAvailable())
        {
            continue;
        }

        if (is_need_check)
        {
            Ipp32s k = (( (pSlice->m_MVsDistortion + 15) / 16) + 1); // +2 - (1 - for padding, 2 - current line)
            k += refAU->IsNeedDeblocking() ? 1 : 0;
            if (pSlice->m_iCurMBToRec + (k + additionalLines)*pSlice->GetMBRowWidth() >= readyCount)
                break;
        }

        if (WrapReconstructTask(info, pTask, pSlice))
        {
            return true;
        }
    }

    return false;

} // bool TaskBrokerTwoThread::GetReconstructTask(H264Task *pTask)

bool TaskBrokerTwoThread::GetDecRecTask(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable

    Ipp32s i;
    Ipp32s sliceCount = info->GetSliceCount();
    for (i = 0; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        if (pSlice->m_bRecVacant != 1 || pSlice->m_bDecVacant != 1)
        {
            continue;
        }

        if (WrapDecRecTask(info, pTask, pSlice))
        {
            return true;
        }
    }

    return false;
}

bool TaskBrokerTwoThread::GetDeblockingTask(H264DecoderFrameInfo * info, H264Task *pTask)
{
    // this is guarded function, safe to touch any variable
    Ipp32s i;
    bool bPrevDeblocked = true;

    Ipp32s sliceCount = info->GetSliceCount();
    for (i = 0; i < sliceCount; i += 1)
    {
        H264Slice *pSlice = info->GetSlice(i);

        Ipp32s iMBWidth = pSlice->GetMBRowWidth(); // DEBUG : always deblock two lines !!!
        Ipp32s iAvailableToDeblock;
        Ipp32s iDebUnit = (pSlice->GetSliceHeader()->MbaffFrameFlag) ? (2) : (1);

        iAvailableToDeblock = pSlice->m_iCurMBToRec -
                              pSlice->m_iCurMBToDeb;

        if ((false == pSlice->m_bDeblocked) &&
            ((true == bPrevDeblocked) || (false == pSlice->DeblockThroughBoundaries())) &&
            (1 == pSlice->m_bDebVacant) &&
            ((iAvailableToDeblock > iMBWidth) || (pSlice->m_iCurMBToRec >= pSlice->m_iMaxMB)))
        {
            InitTask(info, pTask, pSlice);
            pTask->m_iFirstMB = pSlice->m_iCurMBToDeb;

            {
                pTask->m_iMBToProcess = IPP_MIN(iMBWidth - (pSlice->m_iCurMBToDeb % iMBWidth),
                                            iAvailableToDeblock);
                pTask->m_iMBToProcess = IPP_MAX(pTask->m_iMBToProcess,
                                            iDebUnit);
                pTask->m_iMBToProcess = align_value<Ipp32s> (pTask->m_iMBToProcess, iDebUnit);
            }

            pTask->m_iTaskID = TASK_DEB;
            pTask->pFunction = &H264SegmentDecoderMultiThreaded::DeblockSegmentTask;

            pSlice->m_bDebVacant = 0;

#ifdef ECHO_DEB
            DEBUG_PRINT((VM_STRING("(%d) deb - % 4d to % 4d\n"), pTask->m_iThreadNumber,
                pTask->m_iFirstMB, pTask->m_iFirstMB + pTask->m_iMBToProcess));
#endif // ECHO_DEB

            return true;
        }
        else
        {
            if ((0 >= iAvailableToDeblock) && (pSlice->m_iCurMBToRec >= pSlice->m_iMaxMB))
            {
                pSlice->m_bDeblocked = true;
                bPrevDeblocked = true;
            }
        }

        // save previous slices deblocking condition
        if (false == pSlice->m_bDeblocked || pSlice->m_iCurMBToRec < pSlice->m_iMaxMB)
        {
            bPrevDeblocked = false;
            break; // for mbaff deblocking could be performaed outside boundaries.
        }
    }

    return false;

} // bool TaskBrokerTwoThread::GetDeblockingTask(H264Task *pTask)

bool TaskBrokerTwoThread::GetNextTaskManySlices(H264DecoderFrameInfo * info, H264Task *pTask)
{
    if (!info)
        return false;

    //if (info == m_FirstAU && true == GetNextSlice(info, pTask))
      //  return true;

    if (info->IsNeedDeblocking())
    {
        if (true == GetDeblockingTask(info, pTask))
            return true;
    }

    // try to get reconstruct task from main queue
    if (true == GetReconstructTask(info, pTask))
    {
        return true;
    }

    if (!info->GetRefAU() && info->GetSliceCount() > 1)
    {
        if (true == GetDecRecTask(info, pTask))
        {
            return true;
        }
    }

    // try to get decoding task from main frame
    if (true == GetDecodingTask(info, pTask))
    {
        return true;
    }

    return false;
}

void TaskBrokerTwoThread::AddPerformedTask(H264Task *pTask)
{
    AutomaticUMCMutex guard(m_mGuard);

    TaskBrokerSingleThread::AddPerformedTask(pTask);

    AwakeThreads();

} // void TaskBrokerTwoThread::AddPerformedTask(H264Task *pTask)

void TaskBrokerTwoThread::AwakeThreads()
{
    DEBUG_PRINT((VM_STRING("awaken threads\n")));
    if (m_nWaitingThreads)
    {
        Ipp32s i;
        Ipp32s iMask = 1;

        for (i = 0; i < m_iConsumerNumber; i += 1)
        {
            if (m_nWaitingThreads & iMask)
                m_eWaiting[i]->Set();
            iMask <<= 1;
        }  // DEBUG : ADB
    }

    //m_nWaitingThreads = 0;
} // void TaskBrokerTwoThread::AwakeThreads()

bool TaskBrokerTwoThread::GetFrameDeblockingTaskThreaded(H264DecoderFrameInfo * , H264Task *)
{
    return false;
} // bool TaskBrokerTwoThread::GetFrameDeblockingTaskThreaded(H264Task *pTask)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
