//
//  Mpeg2TS.h
//  BoneLib
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Dinsk. All rights reserved.
//

#ifndef __Player__Mpeg2TS__
#define __Player__Mpeg2TS__

#include "ippdefs.h"
#include "Audio.h"
#include "umc_h264_dec.h"
#include "umc_config.h"
#include "rtpframe.h"

#if defined(OLD_ENABLE_AAC_AUDIO_DECODER)
#include "../Codecs/Audio/aac/codec/fixpt/decoder/pub/aacdec.h"

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

#endif // OLD_ENABLE_AAC_AUDIO_DECODER

class H264TSVideoDecoder;
class UdpListener;

class Mpeg2TS
{
public:
    enum { MAX_DECODE_FRAME_SIZE = 70000, PACKET_SIZE = 188 };
    
    struct Stream
    {
        Mpeg2TS&    _ts;
        Ipp8u       _streamType;
        Ipp8u       _iPid;
        Ipp8u       _frame[MAX_DECODE_FRAME_SIZE];
        Ipp32u      _frameSize;
        Ipp32u      _inFrameSize;
        
        Stream(Mpeg2TS& ts, Ipp8u streamType, UdpListener* _opaque)
            :_ts(ts),
            _streamType(streamType),
            _iPid(0),
            _frameSize(0),
            _inFrameSize(0) {
        }
        
        int     parsePSE(const Ipp8u* data, int iPos);
        int     process(const Ipp8u* data, int iPos);
        void    flush();
        
        UdpListener* _opaque;
    };
    
    struct AudioStream : Stream
    {
        AudioStream(Mpeg2TS& ts, Ipp8u streamType, UdpListener* _opaque) :
            Stream(ts, streamType, _opaque) {
            AudioSession::Get().Init();
            AudioSession::Get().Start();
        }
#if defined(OLD_ENABLE_AAC_AUDIO_DECODER)
        AAC_Dec aacDecoder;
#endif // OLD_ENABLE_AAC_AUDIO_DECODER

    };
    
    AudioStream  _audioStream;
    Stream  _videoStream;
    
public:
    H264TSVideoDecoder*    _decoder;
    
    UdpListener* _opaque;
    void (*_yuv420PlaybackCallback)(void* opaque, Ipp8u* pYUV, int frameWidth, int frameHeight);
    void (*_pcmPlaybackCallback)(void* opaque, Ipp8u* pBuffer, unsigned nBufferSize);
    
    Mpeg2TS()
    : _audioStream(*this, 0x0C0, _opaque)
    , _videoStream(*this, 0x0E0, _opaque)
    , _decoder(NULL)
    , _opaque(NULL)
    , _yuv420PlaybackCallback(NULL)
    , _pcmPlaybackCallback(NULL)
    {
    }
    
    void audioFrame(Ipp8u* frame, Ipp32u frameSize);
    void videoFrame(Ipp8u* frame, Ipp32u frameSize);
    void dispatchPacket(const Ipp8u* pData);
    
    void processNetData(const Ipp8u* pData, uint nDataSize)
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
