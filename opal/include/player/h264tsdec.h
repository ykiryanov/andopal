//
//  h264TSDec.h
//  Player
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//

#ifndef __Player__h264_dec__
#define __Player__h264_dec__

#include "TSVideoDecoder.h"

#include "umc_media_data.h"
#include "umc_video_data.h"
#include "umc_h264_dec.h"

TSVideoDecoder* NewH264TSDecoder();

class H264TSVideoDecoder: public TSVideoDecoder
{
    bool                    _bInit;
    uint                    _frameWidth;
    uint                    _frameHeight;
    uint                    _frameCount;
    uint                    _frameSize;
    uint                    _maxOutBufferSize;
    
    UMC::H264VideoDecoder   _Decoder;
    UMC::Status             _status;
    UMC::MediaData          _in;
    UMC::VideoData          _out;
    Ipp8u*                  _pOutBuffer;
    
public:
    H264TSVideoDecoder();
    ~H264TSVideoDecoder();
    
    bool init();
    
    virtual uint    getFrameWidth()     const   { return _frameWidth;}
    virtual uint    getFrameHeight()    const   { return _frameHeight;}
    virtual int     decode(const Ipp8u* pEncodedFrame, uint szEncodedFrame);//, u8* pUYV, uint szUYV);
    virtual Ipp8u*     getOutBuffer() const { return _pOutBuffer; };//, u8* pUYV, uint szUYV);
};

#endif /* defined(__Player__h264_dec__) */
