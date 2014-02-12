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

#include "umc_h264_thread.h"
#include "umc_h264_dec_defs_dec.h"

namespace UMC
{

H264Thread::H264Thread()
    : m_bQuit(false)
    , m_isStartWait(0)
    , m_isDoneWait(0)
{
} // H264Thread() :

H264Thread::~H264Thread()
{
    Release();
} // ~H264Thread(void)

void H264Thread::Reset()
{
    // threading tools
    if (IsValid())
    {
        WaitForEndOfProcessing();
    }
} // void Reset(void)

void H264Thread::Release()
{
    Reset();

    if (IsValid())
    {
        m_bQuit = true;
        StartProcessing();
        Wait();
    }

    Close();
} // void Release(void)

Status H264Thread::Init(Ipp32s iNumber)
{
    // release object before initialization
    Release();

    // save thread number(s)
    m_iNumber = iNumber;

    // threading tools
    m_bQuit = false;
    if (iNumber)
    {
        // initialize working events
        if (UMC_OK != m_startProcessing.Init(0, 0))
            return UMC_ERR_INIT;
        if (UMC_OK != m_doneProcessing.Init(0, 0))
            return UMC_ERR_INIT;

        m_isStartWait = 0;
        m_isDoneWait = 0;

        // start decoding thread
        if (UMC_OK != Create(DecodingThreadRoutine, this))
            return UMC_ERR_INIT;
    }

    return UMC_OK;
} // Status Init(Ipp32u nNumber)

Status H264Thread::StartProcessing(void)
{
    AutomaticUMCMutex guard(m_mGuard);

    if (m_isStartWait)
    {
        m_startProcessing.Set();
        m_isStartWait = 0;
    }
    return UMC_OK;
} // Status StartProc(void)

Status H264Thread::WaitForEndOfProcessing(void)
{
    {
        AutomaticUMCMutex guard(m_mGuard);
        if (m_isStartWait)
            return m_Status;

        m_isDoneWait = 1;
    }

    m_doneProcessing.Wait();
    return m_Status;
} // Status WaitForEndDecoding(void)

Ipp32u VM_THREAD_CALLCONVENTION H264Thread::DecodingThreadRoutine(void *p)
{
    H264Thread *pObj = (H264Thread *) p;

    // check error(s)
    if (NULL == p)
        return 0x0baad;

    {
        while (false == pObj->m_bQuit) // do segment decoding
        {
            try
            {
                pObj->m_Status = pObj->ProcessSegment();
            }
            catch(...)
            {
                // do nothing
            }

            pObj->m_mGuard.Lock();
            pObj->m_isStartWait = 1;

            if (pObj->m_isDoneWait)
            {
                pObj->m_doneProcessing.Set();
                pObj->m_isDoneWait = 0;
            }

            pObj->m_mGuard.Unlock();
            pObj->m_startProcessing.Wait(); // wait for begin decoding
        }
    }

    return 0x0264dec0 + pObj->m_iNumber;

} // Ipp32u DecodingThreadRoutine(void *p)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
