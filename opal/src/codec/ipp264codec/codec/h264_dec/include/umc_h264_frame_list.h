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

#ifndef __UMC_H264_FRAME_LIST_H__
#define __UMC_H264_FRAME_LIST_H__

#include "umc_h264_frame.h"

namespace UMC
{

class H264DecoderFrameList
{
public:
    // Default constructor
    H264DecoderFrameList(void);
    // Destructor
    virtual
    ~H264DecoderFrameList(void);

    H264DecoderFrame   *head() { return m_pHead; }
    H264DecoderFrame   *tail() { return m_pTail; }

    const H264DecoderFrame   *head() const { return m_pHead; }
    const H264DecoderFrame   *tail() const { return m_pTail; }

    bool isEmpty() { return !m_pHead; }

    H264DecoderFrame *detachHead(); // Detach the first frame and return a pointer to it,
                                    // or return NULL if the list is empty.

    void append(H264DecoderFrame *pFrame);
    // Append the given frame to our tail

    void moveToHead(H264DecoderFrame *pFrame);
    // Append the given frame to our tail

    void insertList(H264DecoderFrameList &src);
    // Move the given list to the beginning of our list.

    void destroy(){Release();};

protected:
    // Release object
    void Release(void);

    Ipp32s GetFreeIndex()
    {
        for(Ipp32s i = 0; i < 32; i++)
        {
            H264DecoderFrame *pFrm;

            for (pFrm = head(); pFrm && pFrm->m_index != i; pFrm = pFrm->future())
            {}

            if(pFrm == NULL)
            {
                return i;
            }
        }

        VM_ASSERT(false);
        return -1;
    };

    H264DecoderFrame *m_pHead;                          // (H264DecoderFrame *) pointer to first frame in list
    H264DecoderFrame *m_pTail;                          // (H264DecoderFrame *) pointer to last frame in list
};

class H264DBPList : public H264DecoderFrameList
{
public:

    H264DBPList();

    H264DecoderFrame * GetOldestDisposable();

    bool IsDisposableExist();

    H264DecoderFrame *GetDisposable(void);
    // Search through the list for the disposable frame to decode into
    // Move disposable frame to tail

    void removeAllRef(H264DecoderFrame * pFrame = 0);
    // Mark all frames as not used as reference frames.

    void IncreaseRefPicListResetCount(H264DecoderFrame *excludeFrame);
    // Mark all frames as not used as reference frames.

    H264DecoderFrame * freeOldestShortTermRef();
    // Mark the oldest short-term reference frame as not used.

    H264DecoderFrame *  freeShortTermRef(Ipp32s picNum);
    // Mark the short-term reference frame with specified picNum
    // as not used

    H264DecoderFrame *  freeLongTermRef(Ipp32s longTermPicNum);
    // Mark the long-term reference frame with specified LongTermPicNum
    // as not used

    H264DecoderFrame *  freeLongTermRefIdx(Ipp32s longTermFrameIdx, H264DecoderFrame *pCurrentFrame);
    // Mark the long-term reference frame with specified LongTermFrameIdx
    // as not used

    H264DecoderFrame *  freeOldLongTermRef(Ipp32s maxLongTermFrameIdx, H264DecoderFrame * pFrame);
    // Mark any long-term reference frame with LongTermFrameIdx greater
    // than MaxLongTermFrameIdx as not used.

    void changeSTtoLTRef(Ipp32s picNum, Ipp32s longTermFrameIdx);
    // Mark the short-term reference frame with
    // specified picNum as long-term with specified long term idx.

    H264DecoderFrame * findOldestShortTermRef();

    H264DecoderFrame *findShortTermPic(Ipp32s  picNum, Ipp32s * field);

    H264DecoderFrame *findLongTermPic(Ipp32s  picNum, Ipp32s * field);

    Ipp32s countAllFrames();

    void countActiveRefs(Ipp32u &numShortTerm, Ipp32u &numLongTerm);
    // Return number of active Ipp16s and long term reference frames.

    H264DecoderFrame * findFirstDisplayable();

    H264DecoderFrame *findOldestDisplayable(Ipp32s dbpSize);
    // Search through the list for the oldest displayable frame.

    Ipp32s countNumDisplayable();
    // Return number of displayable frames.

    void removeAllDisplayable();
    // Mark all frames as not displayable.

    H264DecoderFrame* FrameBufIndexToPtr(Ipp32s idx) const
    {
        for(H264DecoderFrame *pFrm = m_pHead; pFrm!=NULL; pFrm = pFrm->future())
            if(pFrm->m_index == idx)
                return pFrm;
        VM_ASSERT(false);
        return NULL;
    }

    void MoveAllSkippedToTail(void);
    void MoveToTail(H264DecoderFrame * pFrame);

    H264DecoderFrame * GetFirstBusy(void);

    H264DecoderFrame * FindClosest(H264DecoderFrame * pFrame);

    void DebugPrint();

protected:
};

} // end namespace UMC

#endif // __UMC_H264_FRAME_LIST_H__
#endif // UMC_ENABLE_H264_VIDEO_DECODER
