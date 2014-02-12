//
//  Audio.h
//  Player
//
//  Created by Sergey Bezruchkin on 10/23/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//

#ifndef __Audio_h
#define __Audio_h

#include "udplistener.h"
#include "ringbuffer.h"
#include <assert.h>

// for native audio
#include <SLES/OpenSLES.h>
#include <SLES/OpenSLES_Android.h>
#include <SLES/OpenSLES_AndroidConfiguration.h>

#define PLAYBACK_FRAME_SIZE_IN_SAMPLES		(4096)
#define PLAYBACK_FRAME_SIZE_IN_BYTES	  	(8192)

#define CHK(a) if (SL_RESULT_SUCCESS != (result=(a))) { ErrLog(("Native ERROR %d", result)); } else
#define CHKR(a) if (SL_RESULT_SUCCESS != (result=(a))) { ErrLog(("Native ERROR %d", result)); return result;} else
#define CHKERR(a) if (SL_RESULT_SUCCESS != (result=(a))) { ErrLog(("Native ERROR %d", result)); goto err;} else

#define DLogFunction(a)
#define DLog(a)
#define ErrLog(a)

class AudioSession
{
public:
	enum { MaxPlaybackBuffers = 2};
	enum { MaxRingBuffers = 4};
    
    
	SLObjectItf						_bqOutputMixObject;
	SLObjectItf 					_bqPlayerObject;
	SLPlayItf						_bqPlayerPlay;
	SLAndroidSimpleBufferQueueItf	_bqPlayerBufferQueue;
	SLEffectSendItf 				_bqPlayerEffectSend;
    //	SLMuteSoloItf 					_bqPlayerMuteSolo;
	SLVolumeItf						_bqPlayerVolume;
    
	SLint32 						_streamType;
    
	bool volatile					_isOpen;
    
    
    
	int								_playbackBufSizeInSamples;
	int								_hardwareFrameSizeInSamples;
    
	int								_frameBufSizeInSamples;
	short*							_frameBuf;
	short*							_frameBufCur;
    
	int								_indxPlaybackBuf;
	short*  						_playbackBuffers[MaxPlaybackBuffers];
    
	int								_indxRingBufWrite;
	int								_indxRingBufRead;
	short 							_ringBuffers[MaxRingBuffers][PLAYBACK_FRAME_SIZE_IN_SAMPLES];
    
    
	bool	isOpen()        const	{ return _isOpen;}
    
    void onCallback(SLAndroidSimpleBufferQueueItf bq);
    
    static AudioSession g_AudioSession;
    
public:
    static AudioSession& Get() { return g_AudioSession; }
    
    
	static void Callback(SLAndroidSimpleBufferQueueItf bq, void *context)
	{
	    assert(NULL != context);
	    ((AudioSession*) context)->onCallback(bq);
	}
    
	AudioSession();
    
	bool Init();
	bool Start();
    int close();
    virtual bool Play(const void* inPcm16buff, unsigned inArrSize);
    
	int checkRing(int ringHandle)
	{
		if (_isOpen < 0) {
			ErrLog(("NativePlayback ring closed"));
			return -1;
		}
        
		if (_isOpen != ringHandle) {
			ErrLog(("_isOpen != ringHandle"));
			return -1;
		}
		return 0;
	}
    
    
	short* getRingBuffer()
	{
		if (_isOpen < 0)
			return NULL;
        
		int nextIndx = _indxRingBufWrite + 1;
		if (nextIndx >= MaxRingBuffers)
			nextIndx = 0;
        
        
		if (_indxRingBufRead == nextIndx) {
			int i=3;
			do  {
				usleep(10000);
			} while ((_indxRingBufRead == nextIndx) && (--i > 0));
		}
        
		if (_indxRingBufRead == nextIndx)
			return NULL;
        
		return _ringBuffers[nextIndx];
	}
    
	void enqueueRingBuffer(short* outPcm16Frame, int sizeInBytes)
	{
		int nextIndx = _indxRingBufWrite + 1;
		if (nextIndx >= MaxRingBuffers)
			nextIndx = 0;
        
		//assert(playbackBuff == _ringBuffers[nextIndx]);
        
		if (sizeInBytes <  PLAYBACK_FRAME_SIZE_IN_BYTES)
			memset(((unsigned char*) outPcm16Frame) + sizeInBytes, 0, PLAYBACK_FRAME_SIZE_IN_BYTES-sizeInBytes);
		_indxRingBufWrite = nextIndx;
	}
};

#endif /* defined(__Player__Audio__) */
