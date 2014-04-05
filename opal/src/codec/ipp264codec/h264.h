/*
 * H.264 Plugin codec for Bone
 *
 * Copyright (C) 2008-2011 Dinsk, LLP, All Rights Reserved
 *
 * The Initial Developer of the Original Code is Dinsk, LLP
 *
 * Contributor(s): Sergey Bezruchkin, sergey@dinsk.net and Yuri Kiryanov, yuri@dinsk.net
 */

#pragma once
#ifndef __h264_h
#define __h264_h

// #define H264_PLUGIN_ACTIVATION

#define D264   D264                                  // Name of codec (use C variable characters)
#define D264_LOG "D264"

class D264 { };

typedef unsigned char       uchar;
typedef unsigned int        uint;
typedef unsigned long       ulong;
typedef unsigned long       u32;
typedef unsigned short		ushort;
//typedef unsigned __int64    u64;
//typedef unsigned long long    u64;
//static void logCallbackFFMPEG (void* v, int level, const char* fmt , va_list arg);

#ifdef __GNUC__
inline int      STRCMPI (const char* pStr1, const char* pStr2)  { return strcasecmp(pStr1,pStr2);}
inline char*    STRDUP  (const char* pStr)                      { return strdup(pStr);}
#else
inline int      STRCMPI (const char* pStr1, const char* pStr2)  { return _strcmpi(pStr1,pStr2);}
inline char*    STRDUP  (const char* pStr)                      { return _strdup(pStr);}
#endif



#ifdef _WIN32_WCE
#include "string.h"
#include "ptlib/wm/stdlibx.h"
#define _strcmpi _stricmp
#define STRDUP _strdup
#elif OSX32
#include <strings.h>
#define _stricmp strcasecmp
#define stricmp strcasecmp
#endif // _WIN32_WCE

#include "umc_h264_video_encoder.h"
#include "umc_h264_dec.h"
#include "rtpframe.h"

// This breaks compatibility with Flash #define SEND_STAP_PACKETS 

/* #define H264_CLOCKRATE        90000*/
#define H264_BITRATE            64000
#define H264_PAYLOAD_SIZE       1000
#define H264_FRAME_RATE         15
/* #define H264_KEY_FRAME_INTERVAL  75*/
#define H264_TSTO				31
#define H264_MAX_TSTO		    31
#define H264_MAX_BITRATE        128000
#define RTP_DYNAMIC_PAYLOAD     104 // 113
#define MAX_FRAME_SIZE          10000
/* #define MAX_PAYLOAD_SIZE        1024

#define SQCIF_WIDTH     128
#define SQCIF_HEIGHT    96
*/
#define QCIF_WIDTH      176
#define QCIF_HEIGHT     144

#define CIF_WIDTH       352
#define CIF_HEIGHT      288

#define CIF4_WIDTH      704
#define CIF4_HEIGHT     576
/*
#define P720_WIDTH      720
#define P720_HEIGHT     480

#define IT_QCIF 0
#define IT_CIF 1
*/

#define H264_DEFAULT_PROFILE_INT        66
#define H264_DEFAULT_LEVEL_INT          30

const unsigned   BoneClockRate = 90000;                      // RTP dictates 90000
const unsigned   BoneMaxFrameRate = 60;                      // Maximum frame rate (per second)
const unsigned   BoneMaxWidth = 2816;                        // Maximum width of frame
const unsigned   BoneMaxHeight = 2304;                       // Maximum height of frame

//#define RECOMMENDED_TSTO	31

#ifdef _WIN32_WCE
#define RECOMMENDED_FRAME_RATE 3            // recommended frame rate
#define MAXIMUM_FRAME_RATE 5                // maximum frame rate
#elif OSX32
#define RECOMMENDED_FRAME_RATE 15            // recommended frame rate
#define MAXIMUM_FRAME_RATE 30                // maximum frame rate
#else //lif // Win32
#define RECOMMENDED_FRAME_RATE 30            // recommended frame rate
#define MAXIMUM_FRAME_RATE 60                // maximum frame rate
#endif // _WIN32_WCE


#define H264_NAL_TYPE_NON_IDR_SLICE     1
#define H264_NAL_TYPE_DP_A_SLICE        2
#define H264_NAL_TYPE_DP_B_SLICE        3
#define H264_NAL_TYPE_DP_C_SLICE        4
#define H264_NAL_TYPE_IDR_SLICE         5
#define H264_NAL_TYPE_SEI               6
#define H264_NAL_TYPE_SEQ_PARAM         7
#define H264_NAL_TYPE_PIC_PARAM         8
#define H264_NAL_TYPE_ACCESS_UNIT       9
#define H264_NAL_TYPE_END_OF_SEQ        10
#define H264_NAL_TYPE_END_OF_STREAM     11
#define H264_NAL_TYPE_FILLER_DATA       12
#define H264_NAL_TYPE_SEQ_EXTENSION     13


//#define DBG_H264_FRAME
#ifdef DBG_H264_FRAME
struct CSec
{
    CRITICAL_SECTION _cs;
    CSec()         { InitializeCriticalSection(&_cs);}
    ~CSec()        { DeleteCriticalSection(&_cs); }
    void Lock()      { EnterCriticalSection(&_cs); }
    void Unlock()    { LeaveCriticalSection(&_cs); }
};

struct H264_DbgFrame
{
    static CSec             s_CS;
    static H264_DbgFrame*   s_pFirst;
    H264_DbgFrame*          _pNext;
    void*                   _pData;
    unsigned                _nDataSize;
    long                    _TimeStamp;



    H264_DbgFrame(const void* pData, unsigned nDataSize, long ts)
    {
        _pData = new char[nDataSize];
        _nDataSize = nDataSize;
        memcpy(_pData, pData, _nDataSize);
        _TimeStamp = ts;
    }

    ~H264_DbgFrame() { delete [] (char*) _pData;}

    static void PushBack(H264_DbgFrame* pFrame)
    {
        s_CS.Lock();
        if (s_pFirst == NULL) 
            s_pFirst = pFrame->_pNext = pFrame;
        else {
            pFrame->_pNext = s_pFirst->_pNext;
            s_pFirst->_pNext = pFrame;
            s_pFirst = pFrame;
        }
        s_CS.Unlock();
    }

    static H264_DbgFrame* PopFront()
    {
        H264_DbgFrame* pRet = NULL;
        s_CS.Lock();
        if (s_pFirst != NULL) {
            if (s_pFirst == s_pFirst->_pNext) {
                pRet = s_pFirst;
                s_pFirst = NULL;
            }
            else {
                pRet = s_pFirst->_pNext;
                s_pFirst->_pNext = pRet->_pNext;
            }
            pRet->_pNext = NULL;
        }
        s_CS.Unlock();
        return pRet;
    }
};
#endif

/////////////////////////////////////////////////////////////////////////////
//  PluginCodec_ReturnCoderLastFrame      = 1,    // indicates when video codec returns last data for frame
//  PluginCodec_ReturnCoderIFrame         = 2,    // indicates when video returns I frame
//  PluginCodec_ReturnCoderRequestIFrame  = 4,    // indicates when video decoder request I frame for resync
//  PluginCodec_ReturnCoderBufferTooSmall = 8     // indicates when output buffer is not large enough to receive

class H264Frame
{
public:
    enum CodecOutFlags { kIsLastFrame=1, kIsIFrame=2, kRequestIFrame=4 };

    struct NALs
    {
        uchar* pFramePtr;
        uint   x_offset;
        uint   length;
        uchar  type;
    };

    uchar*  _pEncodedFramePtr;
    uint    _uEncodedFrameLen;
    uint    _uEncodedFrameSize;

    ulong   _timestamp;
    uint    _nMaxPayloadSize;
    uint    _bIsSync;

    NALs*   _pNALs;
    uint    _numberOfNALsInFrame;
    uint    _nCurrentNAL; 
    uint    _numberOfNALsReserved;
  
    uint    _nCurrentNALFURemainingLen;
    uchar*  _nCurrentNALFURemainingDataPtr;
    uchar   _nCurrentNALFUHeader0;
    uchar   _nCurrentNALFUHeader1;
    uint    _nCurrentFU;
public:

    H264Frame();
    ~H264Frame();

    void SetNewFrame            (void* pEncodedFramePtr, uint uEncodedFrameLen);
    void BeginNewFrame          (void);
    void SetMaxPayloadSize      (uint nMaxPayloadSize)  { _nMaxPayloadSize = nMaxPayloadSize;}
    void SetTimestamp           (ulong timestamp)         { _timestamp = timestamp; }
    bool GetRTPFrame            (RTPFrame& frame, unsigned& flags);
    bool HasRTPFrames           (void)                  { return _nCurrentNAL < _numberOfNALsInFrame;}
    bool SetFromRTPFrame        (RTPFrame& frame, unsigned& flags);

//    uchar*  GetFramePtr         (void)                  { return _pEncodedFramePtr; }
    uint    GetFrameSize        (void)                  { return _uEncodedFrameLen;}
    bool    IsSync              (void);
  
private:
    bool    EncapsulateSTAP     (RTPFrame& frame, unsigned& flags);
    bool    EncapsulateFU       (RTPFrame& frame, unsigned& flags);

    bool    DeencapsulateFU     (RTPFrame& frame, unsigned& flags);
    bool    DeencapsulateSTAP   (RTPFrame& frame, unsigned& flags);
    bool    AddDataToEncodedFrame (uchar* pData, uint nDataLen, uchar header, bool addHeader);
    bool    IsStartCode         (const uchar* pPositionInFrame);

    void    CheckAndReallocNAT  (uint maxReserved)  
    {
        if (maxReserved >= _numberOfNALsReserved) 
        {
            _numberOfNALsReserved += 4;
            if (maxReserved > _numberOfNALsReserved)
                _numberOfNALsReserved = maxReserved;

            NALs* pNewNALs = new NALs[_numberOfNALsReserved];
            memcpy(pNewNALs, _pNALs, _numberOfNALsInFrame*sizeof(NALs));
            delete [] _pNALs;
            _pNALs = pNewNALs;
        }
    }

};

/////////////////////////////////////////////////////////////////////////////

using namespace UMC;
#include "ActivationMonitor.h"

class H264Encoder : public PluginCodec<D264>
{
protected:
  protected:
    uint    _frameWidth;
    uint    _frameHeight;
    uint    _frameRate;
    uint    _bitRate;
    uint    _profile;
    uint    _level;
    uint    _constraints;
    uint    _packetisationMode;
    uint    _maxRTPSize;
    uint    _maxNALUSize;
    uint    _tsto;
    uint    _keyFramePeriod;

    uint                    _frameSize;
    uint                    _frameCount;
    uint                    _bInit;
    uint                    _flags;
    UMC::Status             _status;


    UMC::H264VideoEncoder   _Encoder;
    UMC::H264EncoderParams  _params;
    UMC::VideoData          _in;
    UMC::MediaData          _out;
    H264Frame               _h264Frame;
    unsigned long           _TimeStamp;

    bool                    _bNewParam;
    unsigned char           _nRtpPayload;

    bool    OpenCodec();
    void    CloseCodec();
    volatile bool       _bShutdown;

#ifdef H264_PLUGIN_ACTIVATION
    ActivationMonitor       _ActivationMonitor;
#endif
    
public:
    H264Encoder(const PluginCodec_Definition* defn);

    virtual ~H264Encoder();
    virtual bool Construct()                                                        { return true; }
    virtual bool SetOption(const char* optionName, const char* optionValue);
    virtual bool OnChangedOptions()                                                 { _bNewParam = true; return true; }
    virtual size_t GetOutputDataSize()                                              { return 2000;  /*FIXME */ }
    virtual bool Transcode(const void* fromPtr, unsigned& fromLen, void* toPtr, unsigned& toLen, unsigned& flags)
    {
#ifdef H264_PLUGIN_ACTIVATION
        if (!_ActivationMonitor.CanUse())
            return false;
#endif // H264_PLUGIN_ACTIVATION
        
        return EncodeFrames((const uchar*) fromPtr, fromLen, (uchar*) toPtr, toLen, flags) != 0;
    }

    bool    SetPacketisationMode(unsigned mode);

    int     EncodeFrames (const uchar* src, unsigned& srcLen, uchar* dst, unsigned& dstLen, unsigned& flags);

    void    Lock                    (void)          { }
    void    Unlock                  (void)          { }

    virtual void Execute()                      { _status = _Encoder.GetFrame(&_in, &_out);}

protected:
//    CriticalSection _mutex;
};

/////////////////////////////////////////////////////////////////////////////

class H264Decoder : public PluginCodec<D264>
{
protected:
//    UMC::H264AnnexBSplitter _Splitter;


    bool                    _bInit;
    uint                    _frameWidth;
    uint                    _frameHeight;
    uint                    _frameCount;
    uint                    _frameSize;

    UMC::H264VideoDecoder   _Decoder;
    UMC::Status             _status;
    UMC::MediaData          _in;
    UMC::VideoData          _out;
    H264Frame               _h264Frame;

    Ipp8u*                  _pInBuffer;
    
	bool                    _bGotGoodFrame;
	bool                    _bSkipUntilEndOfFrame;
	ushort                  _nExpectedSequenceNumber;
	uint                    _nSkippedFrameCount;
	//  bool                    _bFirstFrame;
	//  uint                    _nLastEbit;
	//  uint                    _flagsIFrameRequest;
	//  uint                    _nErrorInFrame;
	
	
    bool    OpenCodec();
    void    CloseCodec();
	bool	SetFrameSize();
	bool	UpdateFrameSize();

#ifdef H264_PLUGIN_ACTIVATION
    ActivationMonitor       _ActivationMonitor;
#endif
    
public:
    H264Decoder(const PluginCodec_Definition* defn);

    virtual ~H264Decoder();
    virtual bool Construct()                                                        { return true; }
//  virtual bool SetOption(const char* optionName, const char* optionValue);
    virtual bool OnChangedOptions()                                                 { return true; }
    virtual size_t GetOutputDataSize()          { return _frameSize + 12 + 16;}
    virtual bool Transcode(const void* fromPtr, unsigned& fromLen, void* toPtr, unsigned& toLen, unsigned& flags)
    {
#ifdef H264_PLUGIN_ACTIVATION
        if (!_ActivationMonitor.CanUse())
            return false;
#endif // H264_PLUGIN_ACTIVATION
        
        return DecodeFrames((const uchar*) fromPtr, fromLen, (uchar*) toPtr, toLen, flags) != 0;
    }

    int         DecodeFrames    (const void* pSrc, unsigned& nSrcLen, void* pDst, unsigned& nDstLen, unsigned& nFlags);
    int         RequestIFrame   (uint& flags) {
        flags = PluginCodec_ReturnCoderRequestIFrame;
        _bGotGoodFrame = false;
        return 1;
    }

    void        Execute         (void)          { _status = _Decoder.GetFrame(&_in, &_out);}
};
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// SIP definitions
/*
Still to consider
       sprop-parameter-sets: this may be a NAL
       max-mbps, max-fs, max-cpb, max-dpb, and max-br
       parameter-add
       max-rcmd-nalu-size:
*/

/////////////////////////////////////////////////////////////////////////////



#if 0
///////////////////////////////////////////////////////////////////////////////
static int      valid_for_protocol      (const PluginCodec_Definition*, void*, const char*, void* parm, unsigned* parmLen);
static int      get_codec_options       (const PluginCodec_Definition* codec, void*, const char*, void* parm, unsigned* parmLen);
static int      free_codec_options      (const PluginCodec_Definition*, void*, const char*, void* parm, unsigned* parmLen);
static void*    create_encoder          (const PluginCodec_Definition*);
static void     destroy_encoder         (const PluginCodec_Definition*, void* _context);
static int      codec_encoder           (const PluginCodec_Definition*, void* _context, const void* from, unsigned* fromLen, void* to, unsigned* toLen, unsigned int* flag);
static int      to_normalised_options   (const PluginCodec_Definition*, void*, const char*, void* parm, unsigned* parmLen);
static int      to_customised_options   (const PluginCodec_Definition*, void*, const char*, void* parm, unsigned* parmLen);
static int      encoder_set_options     (const PluginCodec_Definition*, void* _context, const char*, void* parm, unsigned* parmLen);
static int      encoder_get_output_data_size (const PluginCodec_Definition *, void*, const char*, void*, unsigned*);
static void*    create_decoder          (const PluginCodec_Definition*);
static void     destroy_decoder         (const PluginCodec_Definition*, void* _context);
static int      codec_decoder           (const PluginCodec_Definition*, void* _context, const void* from, unsigned* fromLen, void* to, unsigned* toLen, unsigned int* flag);
static int      decoder_get_output_data_size (const PluginCodec_Definition * codec, void*, const char*, void*, unsigned*);

///////////////////////////////////////////////////////////////////////////////
static int      merge_profile_level_h264(char** result, const char* dest, const char* src);
static int      merge_packetization_mode(char** result, const char* dest, const char* src);
static void     free_string             (char* str);
///////////////////////////////////////////////////////////////////////////////

#endif

#endif //__h264_h
