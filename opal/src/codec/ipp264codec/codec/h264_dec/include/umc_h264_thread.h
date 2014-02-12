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

#ifndef __UMC_H264_THREAD_H
#define __UMC_H264_THREAD_H

#include "umc_event.h"
#include "umc_thread.h"
#include "umc_mutex.h"

namespace UMC
{

class H264Thread : public Thread
{
public:
    // Default constructor
    H264Thread();
    // Destructor
    virtual ~H264Thread();

    void Reset();

    // Initialize slice decoder
    Status Init(Ipp32s iNumber);

    virtual Status ProcessSegment() = 0;

    // Start decoding asynchronously
    Status StartProcessing();
    // Wait for end of asynchronous decoding
    Status WaitForEndOfProcessing();

protected:
    // Release slice decoder
    void Release(void);

    Ipp32s m_iNumber;                                           // ordinal number of decoder
    volatile Ipp32s m_isStartWait;
    volatile Ipp32s m_isDoneWait;
    Mutex m_mGuard;

    //
    // Threading routines
    //

    // Starting routine for decoding thread
    static Ipp32u VM_THREAD_CALLCONVENTION DecodingThreadRoutine(void *p);

    Event m_startProcessing;                                   // event to start asynchronous processing
    Event m_doneProcessing;                                    // event to show end of processing

    volatile bool m_bQuit;                                     // quit flag for additional thread(s)
    Status m_Status;                                           // async return value

private:
    // we lock assignment operator to avoid any
    // accasionaly assignments
    H264Thread & operator = (H264Thread &)
    {
        return *this;
    } // H264SliceDecoder & operator = (H264SliceDecoder &)

};

} // namespace UMC

#endif // __UMC_H264_THREAD_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
