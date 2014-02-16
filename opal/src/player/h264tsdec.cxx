//
//  h264TSdec.cpp
//  Player
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//

#include "h264TSDec.h"

#pragma mark Video surface view helper

H264TSVideoDecoder::H264TSVideoDecoder()
    : _bInit(false)
    , _frameCount(0)
    , _status(UMC::UMC_OK)
    , _frameWidth(0)
    , _frameHeight(0)
    , _frameSize(0)
    , _maxOutBufferSize(0)
    , _pOutBuffer(NULL)
{
   // "Create Decoder\n");
        
}

bool H264TSVideoDecoder::init()
{
    // ("Init Decoder\n");
    UMC::VideoDecoderParams params;
    _bInit = false;
    _frameCount = 0;
    
    params.info.stream_type = UMC::H264_VIDEO;
    params.lFlags = 0;
    params.m_pData = &_in;
    params.numThreads = 1;                         // maximum number of threads to use
    params.info.clip_info.width  = _frameWidth;
    params.info.clip_info.height = _frameHeight;
    
    _Decoder.SkipVideoFrame(7);
    _status = _Decoder.Init(&params);
    _Decoder.SkipVideoFrame(7);
    
    if (_status != UMC::UMC_OK)
    {
        // "_Decoder.Init =>%d\n", _status);
        return false;
    }
    
    _status =  _Decoder.GetInfo(&params);
    if (_status != UMC::UMC_OK) {
        // "_Decoder.GetInfo =>%d\n", _status);
        return false;
    }
    
    // printf("info.clip_info.width =%d info.clip_info.heigh=%d\n", params.info.clip_info.width, params.info.clip_info.height);
    
    if ((params.info.clip_info.width == 0) || (params.info.clip_info.height == 0))
        return false;
    
    _frameWidth = params.info.clip_info.width;
    _frameHeight = params.info.clip_info.height;
    _frameSize = _frameWidth*_frameHeight*3/2;
    
    if (_maxOutBufferSize < _frameSize) {
        delete _pOutBuffer;
        _maxOutBufferSize = _frameSize;
        _pOutBuffer = new Ipp8u[_maxOutBufferSize];
    }
    
    _out.Init(_frameWidth, _frameHeight, UMC::YUV420, 8);
    _out.SetBufferPointer(_pOutBuffer,_frameSize);
    
    _bInit = true;
    
    return _bInit;
}

int H264TSVideoDecoder::decode(const Ipp8u* pEncodedFrame, uint szEncodedFrame)
{
    _in.Reset();
    
    _in.SetBufferPointer((Ipp8u*) pEncodedFrame, szEncodedFrame);
    _in.SetDataSize(szEncodedFrame);
    
    if (!_bInit && !init())
        return -1;
    
    _out.SetBufferPointer(_pOutBuffer,_frameSize);
    
    _status = _Decoder.GetFrame(&_in, &_out);
    
    switch(_status) {
        case UMC::UMC_OK:
            // "!!!!!!!!! WE GOT FRAME !!!!!!!!!!\n", _status);
            break;
        case UMC::UMC_ERR_NOT_ENOUGH_DATA:
            // "_Decoder.GetFrame = UMC::UMC_ERR_NOT_ENOUGH_DATA\n", _status);
            break;
        default:
            // "_Decoder.GetFrame() => %d\n", _status);
            break;
    }
    return 1;
}
