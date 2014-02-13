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

#include <codec/opalplugin.hpp>

extern int h264TraceLevel;
extern const char* UMCStatusToText(UMC::Status status);

H264Encoder::H264Encoder(const PluginCodec_Definition* defn)
//  :   OneThreadJob(true),
    : PluginCodec(defn)
    , _frameWidth(QCIF_WIDTH)
    , _frameHeight(QCIF_HEIGHT)
    , _frameRate(H264_FRAME_RATE)
    , _bitRate(H264_BITRATE)
    , _profile(H264_DEFAULT_PROFILE_INT)
    , _level(H264_DEFAULT_LEVEL_INT)
    , _constraints(0)
    , _packetisationMode(1)
    , _maxRTPSize(H264_PAYLOAD_SIZE)
    , _maxNALUSize(H264_PAYLOAD_SIZE)
    , _tsto(H264_TSTO)
    , _keyFramePeriod(0)

    , _bInit(false)
    , _frameCount(0)
    , _frameSize(3*QCIF_WIDTH*QCIF_HEIGHT/2)
    , _status(UMC::UMC_OK)
    , _flags(0)
    , _bNewParam(false)
//  , _bShutdown(false)
    , _nRtpPayload(RTP_DYNAMIC_PAYLOAD)
{


#if 0 // SB - not debugged yet
	// set some reasonable values for quality as default
	_videoQuality = 10; 
	_videoQMin = 4;
	_videoQMax = 24;
#endif
	PTRACE(h264TraceLevel, D264_LOG, "Encoder encoder created");

    memset(&_params, 0, sizeof(_params));
	_params.numThreads              = 1;         // maximum number of threads to use
	_params.info.clip_info.width    = _frameWidth;
	_params.info.clip_info.height   = _frameHeight;
    _params.info.bitrate            = H264_BITRATE;
    _params.info.framerate          = H264_FRAME_RATE; //_nFrameRate;

	// SB TODO check if those are used
	// next param will initialize from  _params.info.bitrate
	//  h264_p.RateControl = _bitrate > 0 ? 1 : 0;      //0         RateControl  0 - no, 1 - FrameLayer(VBR)
	//  h264_p.BitRate = _bitrate;                      //400000    BitRate, Kbps  

    _params.key_frame_controls.method           = 1;    //  1   (reserved) 
    _params.key_frame_controls.interval         = 10;   //200   N (# of frames in between I frames
    _params.key_frame_controls.idr_interval     = 1;    //  1   IDR interval
    _params.B_frame_rate                        = 0;    //  3   Number of B frames between I (or P) and next P
    _params.treat_B_as_reference                = 1;    //  1   treat B as a reference (only 0 is supported!)
    _params.num_ref_frames                      = 4;    //  4   num_ref_frames (2-16)
    _params.num_ref_to_start_code_B_slice       = 1;    //  1   minimum length of list1 for backward prediction (only 1 is supported!)
    _params.num_slices                          = 0;    //  0   number of slices.
    _params.profile_idc                         = H264_BASE_PROFILE;  //H264_HIGH_PROFILE   profile_idc (77-main, 100-high);
    _params.level_idc                           = 51;    //  0   level_idc (set 0 for automatic selection) (check that num_ref_frames and frame size are in accordance with the level)


    _params.chroma_format_idc                   = 1;    //  1   High profile:  chroma_format_idc (0 - monochrom, 1 - 420, 2 - 422)
    _params.bit_depth_luma                      = 8;    //  8   bit_depth_luma [8,12]
    _params.bit_depth_chroma                    = 8;    //  8   bit_depth_chroma [8,12]

    _params.aux_format_idc                      = 0;    //  0   High profile: aux_format_idc: [0,3]
    _params.bit_depth_aux                       = 8;    //  8   bit_depth_aux: [8,12]
    _params.alpha_incr_flag                     = 0;    //  0   alpha_incr_flag: 0, 1
    _params.alpha_opaque_value                  = 0;    //  0   alpha_opaque_value: [0, 2^(bit_depth_aux + 9) -1]
    _params.alpha_transparent_value             = 0;    //  0   alpha_transparent_value: [0, 2^(bit_depth_aux + 9) - 1]  */

    _params.rate_controls.method                = H264_RCM_VBR;    //  2   RC method(0 - quant_codes, 1 - CBR MBwise, 2 - CBR framewise, 3 - Debug)
    _params.rate_controls.quantI                = _tsto;    //  0   start qp values for I, P, B slices; 
    _params.rate_controls.quantP                = _tsto;    //  0   
    _params.rate_controls.quantB                = _tsto;    //  0   

    _params.mv_search_method                    = 2;    //  2   ME method (1-6), subblock split, 
    _params.me_split_mode                       = 1;    //  1   subblock split
    _params.me_search_x                         = 8;    //  8   search_x
    _params.me_search_y                         = 8;    //  8   search_y 

    _params.use_weighted_pred                   = 0;    //  0   weighted prediction, weighted biprediction implicit weighted biprediction (not supported!)
    _params.use_weighted_bipred                 = 0;    //  0
    _params.use_implicit_weighted_bipred        = 0;    //  0

    _params.direct_pred_mode                    = 1;    //  1   direct type (0 - temporal 1 - spatial 2 - auto)
    _params.use_direct_inference                = 0;    //  0   direct_inference_flag


    _params.deblocking_filter_idc               = 0;    //  0   disable_deblocking_idc: 1-- off, 0 - on, 2 -- on(without crossing slice boundaries)
    _params.deblocking_filter_alpha             = 0;    //  0   deblocking_filter_alpha
    _params.deblocking_filter_beta              = 0;    //  0   deblocking_filter_beta
    _params.deblocking_filter_alpha             = _params.deblocking_filter_alpha & ~1; // must be even, since a value div2 is coded.
    _params.deblocking_filter_beta              = _params.deblocking_filter_beta & ~1;

    _params.transform_8x8_mode_flag             = 0;    //  1   High profile: transform_8x8_mode: 0 -- off, 1 - on
    _params.use_default_scaling_matrix          = 1;    //  0   0 -- use standard, 1 -- use default scaling matrices for 8x8 quantization
    _params.qpprime_y_zero_transform_bypass_flag= 0;    //  0   qpprime_y_zero_transform_bypass_flag: (0, 1)

    _params.entropy_coding_mode                 = 0;    //  1   entropy coding mode (0-cavlc,1-cabac)
    _params.cabac_init_idc                      = 2;    //  2   cabac_init_idc (0,1,2)

    _params.coding_type                         = 0;    //  0   picture coding type (0 - only FRM, 1 - only FLD , 2 - only AFRM, 3  - pure PicAFF(no MBAFF) 4 PicAFF + MBAFF). Only 0 (FRM) is supported!

    _params.m_QualitySpeed                      = 0;    //  1   speed/quality grade [0,3] (0-maximum speed, 3-maximum quality)
//    _params.m_OptimalQuantization               = 0;    //  0   OptimalQuantization (0, 1)


}

H264Encoder::~H264Encoder()
{
}


bool H264Encoder::OpenCodec()
{
    CloseCodec();

    PTRACE(h264TraceLevel, D264_LOG, "Encoder OpenCodec");

    _Encoder.Reset();
    _bNewParam = false;

//    const H264PicParamSet* paramSet = _Encoder.GetPicParamSet();
//    int aa = paramSet->pic_init_qp;
    if (_bitRate < 500)
        _bitRate = 500;
    else if (_bitRate > H264_MAX_BITRATE)
        _bitRate = H264_MAX_BITRATE;

    _params.info.clip_info.width    = _frameWidth;
	_params.info.clip_info.height   = _frameHeight;
    _params.info.bitrate            = _bitRate;
    _params.info.framerate          = _frameRate;
    _params.rate_controls.quantI    = _tsto;    //  0   start qp values for I, P, B slices; 
    _params.rate_controls.quantP    = _tsto;    //  0   
    _params.rate_controls.quantB    = _tsto;    //  0   

	_status = _Encoder.Init(&_params);

	PTRACE(h264TraceLevel, D264_LOG, "Encoder Init status: " << _status << ". " <<  UMCStatusToText(_status) << "." << std::endl);

    if (_status != UMC::UMC_OK)
        return false;
    
    _frameSize = _frameWidth * _frameHeight;
    _frameSize += _frameSize>>1;

	_in.Init(_frameWidth, _frameHeight, UMC::YUV420, 8);
	_out.Alloc(2*_frameWidth*_frameHeight);
    _bInit = 1;

	return true;
}


void H264Encoder::CloseCodec()
{
    PTRACE(h264TraceLevel, D264_LOG, "Encoder H264Encoder::CloseCodec()");
/*
    _bInit = false;
	_in.Close();
	_out.Close();
 */
    _status = UMC::UMC_OK;

#ifdef SB_DEBUG_OUT
    if (s_FileOut) {
        fclose(s_FileOut);
        s_FileOut = NULL;
    }
#endif
}


#ifdef DBG_H264_FRAME
CSec H264_DbgFrame::s_CS;
H264_DbgFrame* H264_DbgFrame::s_pFirst = NULL;
#endif


int H264Encoder::EncodeFrames (const uchar* src, unsigned& srcLen, uchar* dst, unsigned& dstLen, unsigned& flags)
{
#ifdef H264_PLUGIN_ACTIVATION    
    if (!_ActivationMonitor.CanUse())
        return false;
#endif
    
    RTPFrame srcRTP(src, srcLen);
    RTPFrame dstRTP(dst, dstLen, _nRtpPayload);


    if  (_h264Frame.HasRTPFrames())
    {
        _h264Frame.GetRTPFrame(dstRTP, flags);
        dstLen = dstRTP.GetFrameLen();
        return 1;
    }

    if (srcRTP.GetPayloadSize() < sizeof(PluginCodec_Video_FrameHeader))
    {
        PTRACE(1, D264_LOG, "Encoder\tVideo grab too small, Close down video transmission thread");
        return 0;
    }

    PluginCodec_Video_FrameHeader* pFrameHeader = (PluginCodec_Video_FrameHeader*) srcRTP.GetPayloadPtr();
    if (pFrameHeader->x != 0 || pFrameHeader->y != 0)
    {
        PTRACE(1, D264_LOG, "Encoder\tVideo grab of partial frame unsupported, Close down video transmission thread");
        return 0;
    }


    // do a validation of size
    // if the incoming data has changed size, tell the encoder
    if ((_frameWidth != pFrameHeader->width) || (_frameHeight != pFrameHeader->height))
    {
        _bInit = false;
	    PTRACE(h264TraceLevel, D264_LOG, "Encoded wrong FrameSize " 
            << "Set " << _frameWidth << "x" << _frameHeight << "   "
            << "In " << pFrameHeader->width << "x" << pFrameHeader->height);
        _frameWidth = pFrameHeader->width;
        _frameHeight = pFrameHeader->height;
    } 

    if (_bNewParam)
        _bInit = false;

    if (!_bInit && !OpenCodec()) {
        PTRACE(h264TraceLevel, D264_LOG, "Encoder Error OpenCodec()");
        return false;
    }

    if (srcRTP.GetPayloadSize()-sizeof(PluginCodec_Video_FrameHeader) < _frameSize) {
        PTRACE(0, D264_LOG, "Encoded srcRTP.GetPayloadSize()-sizeof(PluginCodec_Video_FrameHeader) < _frameSize");
        _out.Reset();
        dstLen = 0;
        return 1;
    }

//  if (flags & PluginCodec_CoderForceIFrame)
//  _Encoder.RequestIPicture();

    _in.SetBufferPointer((Ipp8u*)(pFrameHeader+1),_frameSize);
    _out.SetDataSize(0);

    Execute();


    if (_status != UMC::UMC_OK ) {
        _out.Reset();
        dstLen = 0;
        if (_status == UMC::UMC_ERR_NOT_ENOUGH_DATA) {
            PTRACE(h264TraceLevel, D264_LOG, "Encoder SkipFrame");
            return true;
        }
        PTRACE(0, D264_LOG, "Encoded Error Encode Frame " << UMCStatusToText(_status));
        return true;
    }

    // Debug only: copying frame to an area dbSetEncodeFrame(_out.GetBufferPointer(), _out.GetDataSize());

#ifdef DBG_H264_FRAME
    H264_DbgFrame::PushBack(new H264_DbgFrame(_out.GetDataPointer(), _out.GetDataSize(), srcRTP.GetTimestamp()));
#endif

    _h264Frame.SetNewFrame(_out.GetDataPointer(), _out.GetDataSize());
    _h264Frame.SetTimestamp(srcRTP.GetTimestamp());

    _frameCount++;

    if (_h264Frame.HasRTPFrames())
    {
        _h264Frame.GetRTPFrame(dstRTP, flags);
        dstLen = dstRTP.GetFrameLen();
        _flags = _out.GetFrameType() == I_PICTURE ? PluginCodec_ReturnCoderIFrame : 0;
    }
    else
        dstLen = 0;

    return 1;
}
