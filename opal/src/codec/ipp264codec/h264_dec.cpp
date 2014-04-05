/*
 * H.264 Plugin codec for Bone
 *
 * Copyright (C) 2008-2011 Dinsk, LLP, All Rights Reserved
 *
 * The Initial Developer of the Original Code is Dinsk, LLP
 *
 * Contributor(s): Sergey Bezruchkin, sergey@dinsk.net and Yuri Kiryanov, yuri@dinsk.net
 */

#include <opal.h>
#include <codec/opalplugin.hpp>

#include "rtpframe.h"

#include "h264.h"

#ifdef OSX32
#include "TargetConditionals.h"
#endif // OSX32

#include <codec/opalplugin.hpp>

//#define PLATFORM_DEP_DECODER
#define ENABLE_H264_DECODER 1

//#define TEST_IMAGE

#ifdef PLATFORM_DEP_DECODER
#if P_IOS && !TARGET_IPHONE_SIMULATOR
#define ENABLE_H264_DECODER 0
#else // all other cases
#define ENABLE_H264_DECODER 1
#endif // iPhone and !Simulator
#endif // PLATFORM_DEP_DECODER

// HACK !!!
#ifdef HACK

extern Ipp8u* g_Frame;
extern Ipp32u g_FrameSize;
bool g_Started = false;

#undef PTRACE
#define PTRACE(...) 
#include <ptlib/videoio.h>
extern PVideoOutputDevice * g_Display;

#endif // HACK !!!

extern int h264TraceLevel;
extern const char* UMCStatusToText(UMC::Status status);

H264Decoder::H264Decoder(const PluginCodec_Definition* defn)
//  :   OneThreadJob(true),
    : PluginCodec(defn)
    , _bInit(false)
    , _frameCount(0)
    , _status(UMC::UMC_OK)
    , _frameWidth(CIF_WIDTH)
    , _frameHeight(CIF_HEIGHT)
    , _frameSize(CIF_WIDTH*CIF_HEIGHT*3/2)
	, _pInBuffer(NULL)
	, _bGotGoodFrame(false)
	, _bSkipUntilEndOfFrame(false)
    , _nExpectedSequenceNumber(0)
	, _nSkippedFrameCount(0)
{ 
    PTRACE(h264TraceLevel, D264_LOG, "Decoder\tH264 decoder created"); 
    _pInBuffer = new Ipp8u[64 * 1024]; //_frameWidth*_frameHeight*2]; // YK
    _in.SetBufferPointer(_pInBuffer,_frameWidth*_frameHeight*2);
    _h264Frame._pEncodedFramePtr = _pInBuffer;
    _h264Frame._uEncodedFrameSize = _in.GetBufferSize();
}

H264Decoder::~H264Decoder()
{
    CloseCodec();
    delete [] _pInBuffer;
}


bool H264Decoder::OpenCodec()
{
	UMC::VideoDecoderParams params;

    _frameCount = 0;
    _nSkippedFrameCount = 0;
	_bGotGoodFrame = false;
	_bSkipUntilEndOfFrame = false;
    _nExpectedSequenceNumber = 0;
	_nSkippedFrameCount = 0;
//	_nErrorCount = 0;

	SetFrameSize();

    params.info.stream_type = UMC::H264_VIDEO;
    params.lFlags = 0;
    params.m_pData = &_in;
    params.numThreads = 1;                         // maximum number of threads to use
    params.info.clip_info.width  = _frameWidth;
    params.info.clip_info.height = _frameHeight;
  //params.lTrickModesFlag  = 7;
  //params.dPlaybackRate =  1.1;


#if ENABLE_H264_DECODER
    _status = _Decoder.Init(&params);
    if (_status != UMC::UMC_OK) {
        CloseCodec();
        return false;
    }
    
    _frameWidth = params.info.clip_info.width;
    _frameHeight = params.info.clip_info.height;
    
    _Decoder.SkipVideoFrame(7);
#endif
	
	PTRACE(h264TraceLevel, D264_LOG, "Decoder Init status: " << _status << ". " << UMCStatusToText(_status) << "." << std::endl);
    _bInit = true;
    return true;
}

bool H264Decoder::SetFrameSize()
{
    _frameSize = _frameWidth*_frameHeight;
    _frameSize += _frameSize>>1;
	
    unsigned nNewInBufferSize = 2*_frameWidth*_frameHeight;
    if (nNewInBufferSize > _in.GetBufferSize()) {
        unsigned nCurrentDataSize = _in.GetDataSize();
        Ipp8u* pNewBuffer = new Ipp8u[nNewInBufferSize];
        memcpy(pNewBuffer,_pInBuffer, nCurrentDataSize);
        _in.SetBufferPointer(pNewBuffer,nNewInBufferSize);
        _in.SetDataSize(nCurrentDataSize);
        delete [] _pInBuffer;
        _pInBuffer = pNewBuffer;
        _h264Frame._pEncodedFramePtr = _pInBuffer;
        _h264Frame._uEncodedFrameSize = nNewInBufferSize;
    }	
	_out.Init(_frameWidth, _frameHeight, UMC::YUV420, 8);	
	
	PTRACE(h264TraceLevel, D264_LOG, "Decoder SetFrameSize: width= " << _frameWidth << " height= " << _frameHeight << std::endl);		
    return true;
}

bool H264Decoder::UpdateFrameSize()
{
	UMC::VideoDecoderParams params;
	
#if ENABLE_H264_DECODER
    if (((_status = _Decoder.GetInfo(&params)) != UMC::UMC_OK)  ||
		(params.info.clip_info.width > CIF4_WIDTH)              ||
        (params.info.clip_info.height > CIF4_HEIGHT)            )
    {
        CloseCodec();
        return false;
    }
#endif	
	
	_frameWidth  = params.info.clip_info.width;
	_frameHeight = params.info.clip_info.height;
	return SetFrameSize();
}

void H264Decoder::CloseCodec()
{
    _bInit = false;
	_out.Close();
    _h264Frame.BeginNewFrame();
//	Close();
}

void MemChk(const char* pszFilename, int iLine)
{
}

int H264Decoder::DecodeFrames(const void* pSrc, unsigned& nSrcLen, void* pDst, unsigned& nDstLen, unsigned& nFlags)
{
    unsigned nFrameSize = _frameSize + 12 + sizeof(PluginCodec_Video_FrameHeader);
    if (nDstLen < nFrameSize) {
        nDstLen = 0;
        return 0;
    }

#if DUMP
    char buf[512];
    PTRACE(0, D264_LOG, "DecodeFrames nSrcLen=" << dec << nSrcLen);
    const unsigned char* pIn = (const unsigned char*) pSrc;
    for (unsigned n=0; n < nSrcLen; ) {
        char* p = buf;
        for (int jj=0; jj<16; jj++)
            p += sprintf(p," %2.2x", pIn[n++]);
        PTRACE(0, D264_LOG, buf);
   }
#endif    

#ifdef H264_PLUGIN_ACTIVATION    
    if (!_ActivationMonitor.CanUse())
        return false;
#endif

    RTPFrame srcRTP((const unsigned char*) pSrc, nSrcLen);
    RTPFrame dstRTP((unsigned char*) pDst, nDstLen, 0);
	uint nDstSize = nDstLen;
    nDstLen = 0;
    nFlags = 0;

#ifdef HACK
    // HACK !!!
    if(!g_Frame || !g_FrameSize)
        return 1;
    
    // HACK !!!
#else // !HACK

	if (_bSkipUntilEndOfFrame) {
        if (srcRTP.GetMarker())  {
            PTRACE(h264TraceLevel, D264_LOG, "_bSkipUntilEndOfFrame" );
            _bSkipUntilEndOfFrame = false;
            _nExpectedSequenceNumber = srcRTP.GetSequenceNumber() + 1;
			_h264Frame.BeginNewFrame();
        }
        return 1;
    }
        
    if ((_nExpectedSequenceNumber != 0) && 
        (_nExpectedSequenceNumber != srcRTP.GetSequenceNumber())) 
    {
        PTRACE(h264TraceLevel, D264_LOG, "_nExpectedSequenceNumber != srcRTP.GetSequenceNumber() " << _nExpectedSequenceNumber << " " << srcRTP.GetSequenceNumber());
		_bSkipUntilEndOfFrame = true;
		return RequestIFrame(nFlags);
    }
	
    _nExpectedSequenceNumber = srcRTP.GetSequenceNumber() + 1;

    if (!_h264Frame.SetFromRTPFrame(srcRTP, nFlags)) {
        _h264Frame.BeginNewFrame();
		_bSkipUntilEndOfFrame = true;
        return RequestIFrame(nFlags);
    }

    if (!srcRTP.GetMarker())
        return 1;

    if (_h264Frame.GetFrameSize()==0)
    {
        PTRACE(h264TraceLevel, D264_LOG, "Decoder\tGot an empty frame - skipping");
        _h264Frame.BeginNewFrame();
        _nSkippedFrameCount++;
        return RequestIFrame(nFlags);
    }

    PTRACE(h264TraceLevel, D264_LOG, "Decoder\tDecoding " << _h264Frame.GetFrameSize()  << " bytes");

#endif // !HACK
    
#ifdef HACK
    // HACK !!!!
    _in.Reset();
    memcpy(_pInBuffer, g_Frame, g_FrameSize);
    _in.SetDataSize(g_FrameSize);
    
    g_Frame = NULL;
    g_FrameSize = 0;
    
    if(!g_Started)
    {
        CloseCodec();
        g_Started = OpenCodec();
    }
 
    // HACK !!!!
#endif

    if (!_bInit && !OpenCodec())
        return 0; 

	PluginCodec_Video_FrameHeader* frameHeader = (PluginCodec_Video_FrameHeader*)  dstRTP.GetPayloadPtr();

#ifndef HACK
	frameHeader->x = frameHeader->y = 0;
	frameHeader->width = _frameWidth;
	frameHeader->height = _frameHeight;

    if (nDstSize < _frameSize + sizeof(PluginCodec_Video_FrameHeader) + 12) {
        PTRACE(h264TraceLevel, D264_LOG, "decode nDstSize < _frameSize + sizeof(PluginCodec_Video_FrameHeader");
        dstRTP.SetPayloadSize(sizeof(PluginCodec_Video_FrameHeader));
        nDstLen = dstRTP.GetFrameLen();
        _h264Frame.BeginNewFrame();
		nFlags = PluginCodec_ReturnCoderBufferTooSmall;
        return RequestIFrame(nFlags);
    }

    _in.Reset();
    _in.SetDataSize(_h264Frame.GetFrameSize());
#endif

    _out.SetBufferPointer((Ipp8u*)(frameHeader+1), _frameSize);
	

#if ENABLE_H264_DECODER	
	_status = _Decoder.GetFrame(&_in, &_out);

#else
	memset((Ipp8u*)(frameHeader+1),128,_frameSize);
	_status = UMC::UMC_OK;	
#endif

#if ENABLE_H264_DECODER
    if (_status != UMC::UMC_OK ) {
        if (_status == UMC::UMC_ERR_NOT_ENOUGH_DATA)
        {
			_h264Frame.BeginNewFrame();
           return 1;
        }
        else if (_status == UMC::UMC_ERR_NOT_ENOUGH_BUFFER) {
            if (!UpdateFrameSize())
				return false;
			if (nDstSize < _frameSize + sizeof(PluginCodec_Video_FrameHeader)) {
				nFlags = PluginCodec_ReturnCoderBufferTooSmall;
				return 1;
			}
			else {
				frameHeader->width = _frameWidth;
				frameHeader->height = _frameHeight;
				_out.SetBufferPointer((Ipp8u*)(frameHeader+1),_frameSize); 
				_status = _Decoder.GetFrame(&_in,&_out);									
			}
        }

        if (_status != UMC::UMC_OK) {
            PTRACE(h264TraceLevel, D264_LOG, "Decoded Error Decoded Frame " << UMCStatusToText(_status) );
            CloseCodec();
            _nSkippedFrameCount++;
            return RequestIFrame(nFlags);
        }
        
    }
#endif
	
#ifdef HACK
    // HACK !!!
    if(g_Started)
    {
        const PluginCodec_Video_FrameHeader * frame = (const PluginCodec_Video_FrameHeader *)_out.GetDataPointer();
        PBoolean ok = (frame->width >= 16 && frame->height >= 16 && frame->width < 65536 && frame->height < 65536);
        if(ok)
        {
            g_Display->SetFrameSize(frame->width, frame->height);
            g_Display->SetFrameData(frame->x, frame->y,
                                    frame->width, frame->height,
                                    OPAL_VIDEO_FRAME_DATA_PTR(frame));
        }
    }
    // HACK !!!
#endif // HACK
    
    _h264Frame.BeginNewFrame();

    if (_out.GetFrameType() == UMC::I_PICTURE)
        _bGotGoodFrame = true;

    dstRTP.SetPayloadSize(sizeof(PluginCodec_Video_FrameHeader) + _frameSize);
    dstRTP.SetMarker(true);
    dstRTP.SetPayloadType(0);//RTP_DYNAMIC_PAYLOAD);
    dstRTP.SetTimestamp(srcRTP.GetTimestamp());

    nFlags = _bGotGoodFrame 
		? PluginCodec_ReturnCoderLastFrame 
		: PluginCodec_ReturnCoderLastFrame | PluginCodec_ReturnCoderRequestIFrame;
	
    nDstLen = dstRTP.GetFrameLen();

#ifdef TEST_IMAGE
    u32 nWH = _frameWidth * _frameHeight;
    unsigned char* pY = ((unsigned char*) pDst) + 16+12;
    unsigned char* pU = pY + nWH;
    unsigned char* pV = pU + (nWH>>2);

    memset(pY, 128, _frameSize);

    static unsigned char iii = 120;
    memset(pU+(nWH>>5), iii, nWH>>4);

    if (++iii > 200)
        iii = 50;

    unsigned char* pLine = pY;
    for (int y=0;y<_frameHeight/4; y++, pLine += _frameWidth) {
        unsigned char* p = pLine;
        for (int x=0;x<_frameWidth/4; x++)
            p[x] = 0+x;
    }

	memset((void*) pY, rand() & 0xFF, nWH);
	memset((void*) pU, rand() & 0xFF, nWH>>2);
	memset((void*) pV, rand() & 0xFF, nWH>>2);

 #endif // TEST_IMAGE

    ++_frameCount;

	return 1;
}


/////////////////////////////////////////////////////////////////////////////
