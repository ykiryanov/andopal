//
//  Mpeg2TS.h
//  BoneLib
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Dinsk. All rights reserved.
//

#ifndef __Player__Mpeg2TS__
#define __Player__Mpeg2TS__

#include <player/udplistener.h>
#include <player/audio.h>

class UdpListener;
#ifdef DINSK_CODEC
	#include "h264TSDec.h"
	#include <h264/umc/umc_h264_dec.h>
	class H264TSVideoDecoder;
#else
	#include <codec_api.h>
#endif

#include <../src/codec/aac/codec/fixpt/decoder/pub/aacdec.h>

class AAC_Dec
{
public:
    enum { TAIL_ZERO = 32 };
    HAACDecoder     _decoder;
    unsigned char   _inBuf[AAC_MAINBUF_SIZE + TAIL_ZERO];
    unsigned char*  _pInEnd;
    short           _outPcm[AAC_MAX_NSAMPS * AAC_MAX_NCHANS];
    
    AAC_Dec() {
        _decoder = AACInitDecoder();
        _pInEnd = _inBuf;
    }
    
    void decode(const void* frame, unsigned frameSize);
    
    ~AAC_Dec() {
        if (_decoder != NULL)
            AACFreeDecoder(_decoder);
    }
};

class Mpeg2TS
{
public:
    enum { MAX_DECODE_FRAME_SIZE = 70000, PACKET_SIZE = 188 };
    
    struct Stream
    {
        Mpeg2TS&    _ts;
        u8       _streamType;
        u8       _iPid;
        u8       _frame[MAX_DECODE_FRAME_SIZE];
        u32      _frameSize;
        u32      _inFrameSize;
        
        Stream(Mpeg2TS& ts, u8 streamType, UdpListener* _opaque)
            :_ts(ts),
            _streamType(streamType),
            _iPid(0),
            _frameSize(0),
            _inFrameSize(0) {
        }
        
        int     parsePSE(const u8* data, int iPos);
        int     process(const u8* data, int iPos);
        void    flush();
        
        UdpListener* _opaque;
    };
    
    struct AudioStream : Stream
    {
        AudioStream(Mpeg2TS& ts, u8 streamType, UdpListener* _opaque) :
            Stream(ts, streamType, _opaque) {
            AudioSession::Get().Init();
            AudioSession::Get().Start();
        }
        AAC_Dec aacDecoder;
    };
    
    AudioStream  _audioStream;
    Stream  _videoStream;
    
public:
#ifdef DINSK_CODEC
    H264TSVideoDecoder*    _decoder;
#else
    ISVCDecoder* 	   _decoder;
#endif
    
    UdpListener* _opaque;
    void (*_yuv420PlaybackCallback)(void* opaque, u8* pYUV, int frameWidth, int frameHeight);
    void (*_pcmPlaybackCallback)(void* opaque, u8* pBuffer, unsigned nBufferSize);
    
    Mpeg2TS()
    : _audioStream(*this, 0x0C0, _opaque)
    , _videoStream(*this, 0x0E0, _opaque)
    , _decoder(NULL)
    , _opaque(NULL)
    , _yuv420PlaybackCallback(NULL)
    , _pcmPlaybackCallback(NULL)
    {
    }
    
    void audioFrame(u8* frame, u32 frameSize);
    void videoFrame(u8* frame, u32 frameSize);
    void dispatchPacket(const u8* pData);
    
    void processNetData(const u8* pData, uint nDataSize)
    {
        while (nDataSize >= PACKET_SIZE)
        {
            dispatchPacket(pData);
            pData += PACKET_SIZE;
            nDataSize -= PACKET_SIZE;
        }
    }
    
};

#endif /* defined(__Player__Mpeg2TS__) */
