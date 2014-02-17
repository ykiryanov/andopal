//
//  Mpeg2TS.cpp
//  BoneLib
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Dinsk. All rights reserved.
//

#include <player/mpeg2ts.h>
#include <player/h264tsdec.h>
#include <player/audio.h>

void dump(void* ptr, unsigned sz);

void dump(void* ptr, unsigned sz)
{
    u8* p = (u8*) ptr;
    printf("packet size =%d \n",sz);
    for (unsigned i=0;i<sz;) {
        for (unsigned k=0;k<32 && i< sz;++k)
            printf("0x%2.2x ", p[i++]);
        printf("\n");
    }
}

inline u16 GET_16U(const u8* p) { return (((u16)p[0])<<8) | p[1];}

#define ID_TS_SYNC  0x47
#define ID_TS_PAT   0x00
#define ID_TS_CAT   0x01
#define ID_TS_DT    0x02
#define ID_TS_NULL  0x1FFF

#define PES_STREAM_ID_VIDEO 0xE0
#define PES_STREAM_ID_AUDIO 0xC0

#define UMC_ERR_INVALID_STREAM -1111

int Mpeg2TS::Stream::process(const u8* data, int iPos)
{
    if (_inFrameSize == 0) {
        printf("Broken packet \n");
        return 0;
    }

    int sz = PACKET_SIZE - iPos;
    if (_frameSize + sz > _inFrameSize) {
        _inFrameSize = _frameSize = 0;
        printf("frameSize + sz > _inFrameSize");
        return 0;
    }
    
    memcpy(_frame+_frameSize, data + iPos, sz);
    _frameSize += sz;
        
    if (_frameSize >= _inFrameSize)
        flush();

    return 0;
}

void Mpeg2TS::Stream::flush()
{
    if (_frameSize == 0)
        return;
    
    if (_streamType == 0x0E0)
        _ts.videoFrame(_frame, _frameSize);
    else
        _ts.audioFrame(_frame, _frameSize);
    _frameSize = 0;
    _inFrameSize = 0;
}

int Mpeg2TS::Stream::parsePSE(const u8* data, int iPos)
{
    _inFrameSize = _frameSize = 0;

    // we save 9 bytes for start_code, pes_len, flags and pes_header_len
    // 256 bytes are maximum for pes_packet_len and 1 is for first byte of private_1
    
    const u8* pesPacket = data + iPos;
    
    if (pesPacket[0] != 0 || pesPacket[1] != 0 || pesPacket[2] != 1)
        return UMC_ERR_INVALID_STREAM;
    
    if ((pesPacket[3] & (~(31))) != _streamType) //!IS_PES_PACKET(pesPacket[3]))
        return UMC_ERR_INVALID_STREAM;
    
    
    u16 PES_packet_len = GET_16U(&pesPacket[4]);
    
    //    u32 PTS_DTS_flag = (pesPacket[iInnerPos + 7] >> 6) & 0x03;
    uint PES_header_data_length = pesPacket[8];
    
    if (PES_packet_len > 0) {
        _inFrameSize = PES_packet_len - (PES_header_data_length + 3);
        if (_inFrameSize > MAX_DECODE_FRAME_SIZE)
            return UMC_ERR_INVALID_STREAM;
    }
    
    if (PES_packet_len > 0 && PES_packet_len < PES_header_data_length + 3)
        return UMC_ERR_INVALID_STREAM;
    
    iPos += 9 + PES_header_data_length;
    
    _frameSize = PACKET_SIZE - iPos;
    memcpy(_frame, data + iPos, _frameSize);
    
    return 0;
}


void Mpeg2TS::dispatchPacket(const u8* data)
{
    int iPos = 0;
    
    u8 sync_byte = data[0];
    u8 bPreStart = ((data[1]>>6) & 0x01);
    u16 iPid = ((data[1] & 0x1f) << 8) + data[2];
    u8 scrambling_ctrl = (data[3] >> 6) & 0x03;
    u8 adapt_field_ctrl = (data[3] >> 4) & 0x03;
    u8 adapt_field_len = data[4];
    
    if (ID_TS_SYNC != sync_byte || scrambling_ctrl > 1 || ID_TS_NULL == iPid || ID_TS_PAT == iPid ||
        ID_TS_CAT == iPid || ID_TS_DT == iPid || 0 == adapt_field_ctrl)
    {
        return;
    }
    
    iPos += 4;
    
    // skip adaptation field if present
    if (adapt_field_ctrl & 2)
    {
        iPos += 1 + adapt_field_len;
    }
    
    //printf("iPid=0x%4.4x bPreStart=%d, adapt_field_ctrl=%d adapt_field_len=%d iPos=%d\n", iPid, bPreStart, adapt_field_ctrl, adapt_field_len, iPos);
    
    if(!bPreStart)
    {
        if (iPid == _videoStream._iPid)
            _videoStream.process(data, iPos);
        else if (iPid == _audioStream._iPid)
            _audioStream.process(data, iPos);
        else
        {
            _videoStream._iPid = _audioStream._iPid = 0;
            bPreStart = true;
        }
    }

    if (bPreStart) {
        if (iPid == _videoStream._iPid)
            _videoStream.parsePSE(data, iPos);
        else if (iPid == _audioStream._iPid)
            _audioStream.parsePSE(data, iPos);
        else if (_videoStream._iPid == 0 && _videoStream.parsePSE(data, iPos) == 0)
            _videoStream._iPid = iPid;
        else if (_audioStream._iPid == 0 && _audioStream.parsePSE(data, iPos) == 0)
            _audioStream._iPid = iPid;
    }
    
}


void Mpeg2TS::videoFrame(u8* frame, u32 frameSize)
{
    if (_decoder)
    {
        _decoder->decode(frame, frameSize);
        
        if(_decoder && _decoder->getOutBuffer())
        {
            if(_opaque && _yuv420PlaybackCallback)
                _yuv420PlaybackCallback(_opaque, _decoder->getOutBuffer(), _decoder->getFrameWidth(), _decoder->getFrameHeight());
        }
    }
}


void Mpeg2TS::audioFrame(u8* frame, u32 frameSize)
{
    _audioStream.aacDecoder.decode(frame, frameSize);
}

void AAC_Dec::decode(const void* frame, unsigned frameSize)
{
    int szToFill = AAC_MAINBUF_SIZE - (_pInEnd - _inBuf);
    
    if (frameSize < szToFill)
        szToFill = frameSize;
    
    memcpy(_pInEnd, frame, szToFill);
    _pInEnd += szToFill;
    
    int bytesLeft = _pInEnd - _inBuf;
    unsigned char* pInBuf = _inBuf;
    
    memset(_pInEnd, 0, TAIL_ZERO);
    
    int result = AACDecode(_decoder, &pInBuf, &bytesLeft, _outPcm);
    
    if (result < 0)
    {
        switch(result) {
            case ERR_AAC_INDATA_UNDERFLOW:
                printf("AAC_Dec error ERR_AAC_INDATA_UNDERFLOW\n");
                _pInEnd = _inBuf;
                break;
            default:
                printf("AAC_Dec error %d\n", result);
                _pInEnd = _inBuf;
                break;
        }
    } else {
        if ((bytesLeft > 0) && (bytesLeft < _pInEnd- _inBuf)) {
            memmove(_inBuf, _pInEnd-bytesLeft, bytesLeft);
            _pInEnd = _inBuf + bytesLeft;
            
        } else
            _pInEnd = _inBuf;
        
        AACFrameInfo frameInfo;
        AACGetLastFrameInfo(_decoder, &frameInfo);
        AudioSession::Get().Play(_outPcm, frameInfo.outputSamps*sizeof(short));
    }
}

