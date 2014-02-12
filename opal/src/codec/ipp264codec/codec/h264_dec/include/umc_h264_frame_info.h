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

#ifndef __UMC_H264_FRAME_INFO_H
#define __UMC_H264_FRAME_INFO_H

namespace UMC
{

class H264DecoderFrame;

class H264DecoderFrameInfo
{
public:
    enum FillnessStatus
    {
        STATUS_NONE,
        STATUS_NOT_FILLED,
        STATUS_FILLED,
        STATUS_COMPLETED,
        STATUS_STARTED
    };

    H264DecoderFrameInfo(H264DecoderFrame * pFrame)
        : m_pFrame(pFrame)
        , m_pHeap(0)
        , m_pSlicesHeap(0)
        , m_SliceCount(0)
        , m_SliceCountNonActual(0)
    {
        Reset();
    }

    void SetHeaps(H264_Heap * heap, H264_Heap_Objects<H264Slice> * sliceHeap)
    {
        m_pHeap = heap;
        m_pSlicesHeap = sliceHeap;
    }

    virtual ~H264DecoderFrameInfo()
    {
    }

    bool IsAuxiliary()
    {
        H264Slice * slice = GetAnySlice();
        return slice && slice->IsAuxiliary();
    }

    bool IsSliceGroups() const
    {
        return m_IsSliceGroups;
    }

    bool IsField() const
    {
        if (!m_SliceCount)
        {
            if (!m_SliceCountNonActual)
                return false;
            else
            {
                return m_pSliceQueueNonActual[0]->IsField();
            }
        }

        return m_pSliceQueue[0]->IsField();
    }

    H264Slice *GetAnySlice()
    {
        if (!m_SliceCount)
        {
            if (!m_SliceCountNonActual)
                return 0;
            else
            {
                return m_pSliceQueueNonActual[0];
            }
        }

        return m_pSliceQueue[0];
    }

    H264Slice *GetAnySlice(Ipp32s num)
    {
        if (num >= m_SliceCount)
        {
            if (num >= m_SliceCountNonActual + m_SliceCount)
                return 0;
            else
            {
                return m_pSliceQueueNonActual[num - m_SliceCount];
            }
        }

        return m_pSliceQueue[num];
    }

    void AddSlice(H264Slice * pSlice)
    {
        m_pSliceQueue[m_SliceCount] = pSlice;
        m_SliceCount++;

        if (m_pPreviousAddedSlice)
            m_pPreviousAddedSlice->m_pNext = pSlice;
        m_pPreviousAddedSlice = pSlice;

        m_IsReferenceAU = m_IsReferenceAU || (pSlice->GetSliceHeader()->nal_ref_idc != 0);
        m_IsIntraAU = m_IsIntraAU || (pSlice->GetSliceHeader()->slice_type == INTRASLICE);

        m_IsNeedDeblocking = m_IsNeedDeblocking ||
            (pSlice->GetSliceHeader()->disable_deblocking_filter_idc != DEBLOCK_FILTER_OFF);
        m_IsSliceGroups = pSlice->IsSliceGroups();
    }

    Ipp32s GetSliceCount() const
    {
        return m_SliceCount;
    }

    Ipp32s GetAllSliceCount() const
    {
        return m_SliceCount + m_SliceCountNonActual;
    }

    H264Slice* GetSlice(Ipp32s num)
    {
        if (num < 0 || num > m_SliceCount - 1)
            return 0;
        return m_pSliceQueue[num];
    }

    H264Slice* GetSliceByNumber(Ipp32s num)
    {
        for (Ipp32s i = 0; i < m_SliceCount; i++)
        {
            if (m_pSliceQueue[i]->GetSliceNum() == num)
                return m_pSliceQueue[i];
        }

        return 0;
    }

    Ipp32s GetPositionByNumber(Ipp32s num)
    {
        for (Ipp32s i = 0; i < m_SliceCount; i++)
        {
            if (m_pSliceQueue[i]->GetSliceNum() == num)
                return i;
        }

        return -1;
    }

    void Reset()
    {
        Free();

        m_SliceCount = 0;
        m_SliceCountNonActual = 0;
        m_pPreviousAddedSlice = 0;

        m_pSliceQueue.Reset();
        m_pSliceQueueNonActual.Reset();

        m_iDecMBReady = 0;
        m_iRecMBReady = 0;
        m_IsNeedDeblocking = false;

        m_IsReferenceAU = false;
        m_IsIntraAU = false;

        m_NextAU = 0;
        m_PrevAU = 0;
        m_RefAU = 0;
        m_IsSliceGroups = false;

        m_Status = STATUS_NONE;
    }

    void SetStatus(FillnessStatus status)
    {
        m_Status = status;
    }

    FillnessStatus GetStatus () const
    {
        return m_Status;
    }

    enum
    {
        FRAME                       = 0,
        TOP_FIELD                   = 0,
        BOTTOM_FIELD                = 1,
        AUXILIARY_FRAME             = 2,
        AUXILIARY_TOP_FIELD         = 2,
        AUXILIARY_BOTTOM_FIELD      = 3,
        REDUNDANT_SLICE             = 4
    };

    void Free()
    {
        for (Ipp32s i = 0; i < m_SliceCount; i ++)
        {
            H264Slice * pCurSlice = m_pSliceQueue[i];
            m_pHeap->Free(pCurSlice->m_pSource);
            m_pHeap->Free(pCurSlice->m_pSource_DXVA);
            pCurSlice->m_pSource = 0;
            pCurSlice->m_pSource_DXVA = 0;
            pCurSlice->Release();
            m_pSlicesHeap->Free(pCurSlice);
        }

        for (Ipp32s j = 0; j < m_SliceCountNonActual; j ++)
        {
            H264Slice * pCurSlice = m_pSliceQueueNonActual[j];
            m_pHeap->Free(pCurSlice->m_pSource);
            m_pHeap->Free(pCurSlice->m_pSource_DXVA);
            pCurSlice->m_pSource = 0;
            pCurSlice->m_pSource_DXVA = 0;
            pCurSlice->Release();
            m_pSlicesHeap->Free(pCurSlice);
        }
    }

    void RemoveSlice(Ipp32s num)
    {
        H264Slice * pCurSlice = GetSlice(num);
        m_pSliceQueueNonActual[m_SliceCountNonActual++] = pCurSlice;

        for (Ipp32s i = num; i < m_SliceCount; i++)
        {
            m_pSliceQueue[i] = m_pSliceQueue[i + 1];
        }

        m_SliceCount--;
    }

    void RemoveSliceByNumber(Ipp32s num)
    {
        Ipp32s pos = GetPositionByNumber(num);
        VM_ASSERT(pos >= 0);
        RemoveSlice(pos);
    }

    bool IsNeedDeblocking () const
    {
        return m_IsNeedDeblocking;
    }

    void SkipDeblocking()
    {
        m_IsNeedDeblocking = false;

        for (Ipp32s i = 0; i < m_SliceCount; i ++)
        {
            H264Slice *pSlice = m_pSliceQueue[i];

            pSlice->m_bDeblocked = true;
            pSlice->m_bDebVacant = 0;
            pSlice->m_iCurMBToDeb = pSlice->m_iMaxMB;
            pSlice->GetSliceHeader()->disable_deblocking_filter_idc = DEBLOCK_FILTER_OFF;
        }
    }

    bool IsCompleted() const
    {
        if (GetStatus() == H264DecoderFrameInfo::STATUS_COMPLETED)
            return true;

        for (Ipp32s i = 0; i < m_SliceCount; i ++)
        {
            const H264Slice *pSlice = m_pSliceQueue[i];

            if (!pSlice->m_bDecoded || !pSlice->m_bDeblocked)
                return false;
        }

        return true;
    }


    bool IsIntraAU() const
    {
        return m_IsIntraAU;
    }

    bool IsReference() const
    {
        return m_IsReferenceAU;
    }

    H264DecoderFrameInfo * GetNextAU() {return m_NextAU;}
    H264DecoderFrameInfo * GetPrevAU() {return m_PrevAU;}
    H264DecoderFrameInfo * GetRefAU() {return m_RefAU;}


    void SetNextAU(H264DecoderFrameInfo *au) {m_NextAU = au;}
    void SetPrevAU(H264DecoderFrameInfo *au) {m_PrevAU = au;}
    void SetRefAU(H264DecoderFrameInfo *au) {m_RefAU = au;}

    Ipp32s m_iDecMBReady;
    Ipp32s m_iRecMBReady;
    H264DecoderFrame * m_pFrame;

private:

    FillnessStatus m_Status;

    H264Slice* m_pPreviousAddedSlice;
    H264Array<H264Slice*> m_pSliceQueue;
    H264Array<H264Slice*> m_pSliceQueueNonActual;

    Ipp32s m_SliceCount;
    Ipp32s m_SliceCountNonActual;

    H264_Heap *m_pHeap;
    H264_Heap_Objects<H264Slice> * m_pSlicesHeap;
    bool m_IsNeedDeblocking;

    bool m_IsReferenceAU;
    bool m_IsIntraAU;

    bool m_IsSliceGroups;

    H264DecoderFrameInfo *m_NextAU;
    H264DecoderFrameInfo *m_RefAU;
    H264DecoderFrameInfo *m_PrevAU;
};

} // namespace UMC

#endif // __UMC_H264_FRAME_INFO_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
