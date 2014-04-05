//
//  TSVideoDecoder.h
//  Player
//
//  Created by Sergey Bezruchkin on 9/21/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//

#ifndef Player_VideoCodec_h
#define Player_VideoCodec_h

#ifdef DINSK_CODEC
#include "ippdefs.h"
#endif

class TSVideoDecoder
{
public:
    virtual unsigned    getFrameWidth()         const = 0;
    virtual unsigned    getFrameHeight()        const = 0;
    virtual int         decode(const unsigned char* pEncodedFrame, unsigned szEncodedFrame) = 0;
    virtual Ipp8u*      getOutBuffer() const = 0;
};

#endif
