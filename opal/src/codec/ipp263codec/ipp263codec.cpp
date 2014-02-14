/*
 * H.263 Plugin codec for Bone
 *
 * Copyright (C) 2008 Dinsk, LLP, All Rights Reserved
 *
 * The Initial Developer of the Original Code is Dinsk, LLP
 *
 * Contributor(s): Yuri Kiryanov, developer@dinsk.net, Sergey Bezruchkin
*/

/*
  Notes
  -----

  This codec implements a H.263 encoder and decoder with RTP packaging as per 
  RFC 2190 "RTP Payload Format for H.263 Video Streams". As per this specification,
  The RTP payload code is always set to 34

 */

#include "stdafx.h"

#include <codec/opalplugin.hpp>

#define DINSK_CODEC_LOG "D263"

#define H263_THREAD_PRIORITY THREAD_PRIORITY_NORMAL

#undef H263_PLUGIN_ACTIVATION

#ifdef _WIN32_WCE
#include "string.h"
#include "ptlib/wm/stdlibx.h"
#define _strcmpi _stricmp
#define strdup _strdup
#define RECOMMENDED_FRAME_RATE 3            // recommended frame rate
#define MAXIMUM_FRAME_RATE 5                // maximum frame rate

#elif OSX32
#include <strings.h>
#define _stricmp strcasecmp
#define stricmp strcasecmp
#define RECOMMENDED_FRAME_RATE 3            // recommended frame rate
#define MAXIMUM_FRAME_RATE 5                // maximum frame rate

#else
#include <string.h>

#define _stricmp strcasecmp

#define RECOMMENDED_FRAME_RATE 30            // recommended frame rate
#define MAXIMUM_FRAME_RATE 60                // maximum frame rate

#endif

#include "ippdefs.h"
#include "umc_h263_video_decoder.h"
#include "umc_h263_video_encoder.h"
#include  "vm_time.h"

/// #define SB_DEBUG_OUT "c:\\H263.h"

#ifdef _WIN32_WCE
//#define ONE_THREAD_JOB
#endif

#ifndef __GNUC__
inline int      STRCMPI (const char* pStr1, const char* pStr2)  { return _strcmpi(pStr1,pStr2);}
inline char*    STRDUP  (const char* pStr)                      { return _strdup(pStr);}
#endif

#ifdef ONE_THREAD_JOB
#include "OneThreadJob.h"
#endif

#ifdef SB_DEBUG_OUT
static FILE* s_FileOut = NULL;
static bool  s_bTryOpenOutFile = false;
#endif

#ifndef dbLog
#define dbLog(a) 
#endif

const int h263TraceLevel = 6;

const char* UMCStatusToText(UMC::Status status);


/////////////////////////////////////////////////////////////////////////////
// Activation stuff
#ifdef H263_PLUGIN_ACTIVATION
#include "IActivation.h"
IActivation *gph263Activation = NULL;

class ActivationMonitor
{
    static long s_nCodecObjectId;
    static int GetNextCodecObjectId()
    {
#if defined(_WIN32_WCE) || defined(OSX32)
	    return ++s_nCodecObjectId;
#else
	    return InterlockedIncrement(&s_nCodecObjectId);
#endif 
    };

    int     _objID;
    bool    _bStarted;
    vm_tick _tkLast;
    vm_tick _tkFreq;

public:
    ActivationMonitor() {
        _bStarted = false;
        _objID = GetNextCodecObjectId();
        _tkLast = vm_time_get_tick();
        _tkFreq = vm_time_get_frequency();
    }

    bool    CanUse() {
#ifdef H263_PLUGIN_ACTIVATION_XX
	    if (gph263Activation == NULL)
		    return true;

        if (!_bStarted) {
            _bStarted = true;
            _tkLast = vm_time_get_tick();
	        return gph263Activation->CanUseObject(_objID);
        }
        else {
            unsigned nMSec = 0;
            vm_tick tkTimeCur = vm_time_get_tick();
            vm_tick ktDeltaTime = tkTimeCur - _tkLast;

            if (ktDeltaTime > _tkFreq) {
                if ((ktDeltaTime>>4) < _tkFreq) {
                    while (ktDeltaTime > _tkFreq) {
                        nMSec += 1000;
                        ktDeltaTime -= _tkFreq;
                        _tkLast += _tkFreq;
                    }
                }
            }
	        return gph263Activation->Use(_objID, nMSec);
        }
#else
        return true;
#endif
    return true;
    }
};

long ActivationMonitor::s_nCodecObjectId = 0L;

#endif // H263_PLUGIN_ACTIVATION

/////////////////////////////////////////////////////////////////////////////

#define RTP_MIN_HEADER_SIZE 12
#define RTP_MTU 1024

#define RTP_RFC2190_PAYLOAD  34
#define RTP_RFC2429_PAYLOAD  99
#define RTP_DYNAMIC_PAYLOAD  112


#ifndef _WIN32
#define H263P_BITRATE			327600
#define H263_BITRATE			128000

#define H263_CLOCKRATE			90000
#define H263P_CLOCKRATE        90000
#else
#define H263P_BITRATE			327600
#define H263_BITRATE			327600

#define H263_CLOCKRATE			90000
#define H263P_CLOCKRATE        90000
#endif

#define H263_PADDING_SIZE   32
#define H263P_FRAME_RATE          25
#define H263P_KEY_FRAME_INTERVAL 125
#define H263P_MIN_QUANT            2


#define CIF_WIDTH       352
#define CIF_HEIGHT      288

#define CIF4_WIDTH      (CIF_WIDTH*2)
#define CIF4_HEIGHT     (CIF_HEIGHT*2)

#define CIF16_WIDTH      (CIF_WIDTH*4)
#define CIF16_HEIGHT     (CIF_HEIGHT*4)

#define QCIF_WIDTH     (CIF_WIDTH/2)
#define QCIF_HEIGHT    (CIF_HEIGHT/2)

#define SQCIF_WIDTH     128
#define SQCIF_HEIGHT    96

#define MAX_H263_PACKET_SIZE     (((CIF4_WIDTH * CIF4_HEIGHT * 3 )/2) + RTP_MIN_HEADER_SIZE)
#define MAX_PAYLOAD_SIZE	     RTP_MTU /*350*/

#define MAX_YUV420P_PACKET_SIZE (((CIF4_WIDTH * CIF4_HEIGHT * 3) / 2) + FF_INPUT_BUFFER_PADDING_SIZE)

#define MIN(v1, v2) ((v1) < (v2) ? (v1) : (v2))
#define MAX(v1, v2) ((v1) > (v2) ? (v1) : (v2))

// H.323 only
#define H323CAP_TAG_PREFIX    "h323"
static const char * h323_temporalSpatialTradeOffCapability_tag = H323CAP_TAG_PREFIX "_temporalSpatialTradeOffCapability";

typedef unsigned char uchar;
typedef unsigned int  uint;

bool H263_CheckIPicture(const uchar* p, unsigned nSize);

// SIP
//
// sip fmtps for video
// Value Name  Long Name                                Usable with  Reference
// ----------  ---------------------------------------  -----------  ---------
// fir         Full Intra Request Command               ccm          [RFC5104]
// tmmbr       Temporary Maximum Media Stream Bit Rate  ccm          [RFC5104]
// tstr        Temporal-Spatial Trade-off               ccm          [RFC5104]

static struct StdSizes {
  enum { 
    SQCIF, 
    QCIF, 
    CIF, 
    CIF4, 
	CIF16,
    NumStdSizes,
    UnknownStdSize = NumStdSizes
  };

  int width;
  int height;
  const char * optionName;
} StandardVideoSizes[StdSizes::NumStdSizes] = {
  { SQCIF_WIDTH, SQCIF_HEIGHT, PLUGINCODEC_SQCIF_MPI },
  {  QCIF_WIDTH,  QCIF_HEIGHT, PLUGINCODEC_QCIF_MPI  },
  {   CIF_WIDTH,   CIF_HEIGHT, PLUGINCODEC_CIF_MPI   },
  {  CIF4_WIDTH,  CIF4_HEIGHT, PLUGINCODEC_CIF4_MPI  },
  {  CIF16_WIDTH, CIF16_HEIGHT,PLUGINCODEC_CIF16_MPI },
};

#define StdSizeCount 3

enum codecInFlags {
  silenceFrame      = 1,
  forceIFrame       = 2
};

enum codecOutFlags {
  isLastFrame     = 1,
  isIFrame        = 2,
  requestIFrame   = 4
};

static const char formats[8][64] = { "forbidden",
                                     "sub-QCIF",
                                     "QCIF",
                                     "CIF",
                                     "4CIF",
                                     "16CIF",
                                     "reserved",
                                     "extended PTYPE" };

static const char picTypeCodes[8][64] = { "I-Picture",
                                          "P-Picture",
                                          "improved PB-frame",
                                          "B-Picture",
                                          "EI-Picture",
                                          "EP-Picture",
                                          "reserved (110)",
                                          "reserved (111)" };

static const char plusFormats[8][64] = { "forbidden",
                                         "sub-QCIF",
                                         "QCIF",
                                         "CIF",
                                         "4CIF",
                                         "16CIF",
                                         "custom format",
                                         "reserved" };

static const char PARs[16][64]   = { "forbidden",
                                     "1:1 (Square)",
                                     "12:11 (CIF for 4:3 picture)",
                                     "10:11 (525-type for 4:3 picture)",
                                     "16:11 (CIF stretched for 16:9 picture)",
                                     "40:33 (525-type stretched for 16:9 picture)",
                                     "reserved (0110)",
                                     "reserved (0111)",
                                     "reserved (1000)",
                                     "reserved (1001)",
                                     "reserved (1010)",
                                     "reserved (1011)",
                                     "reserved (1100)",
                                     "reserved (1101)",
                                     "reserved (1110)",
                                     "Extended PAR" };

static void * create_encoder(const struct PluginCodec_Definition * /*codec*/);
static int encoder_get_output_data_size(const PluginCodec_Definition *, void *, const char *, void *, unsigned *);
static int encoder_set_options(const PluginCodec_Definition *, void * _context, const char * , void * parm, unsigned * parmLen);
static void destroy_encoder(const struct PluginCodec_Definition * /*codec*/, void * _context);
static int codec_encoder(const struct PluginCodec_Definition * , void * _context, const void * from, unsigned * fromLen,
                         void * to, unsigned * toLen, unsigned int * flag);
static void * create_decoder(const struct PluginCodec_Definition *);
static void destroy_decoder(const struct PluginCodec_Definition * /*codec*/, void * _context);
static int codec_decoder(const struct PluginCodec_Definition *, void * _context, const void * from, unsigned * fromLen, void * to,
                         unsigned * toLen, unsigned int * flag);
static int decoder_get_output_data_size(const PluginCodec_Definition * codec, void *, const char *, void *, unsigned *);
static int get_codec_options(const struct PluginCodec_Definition * codec, void *, const char *, void * parm, unsigned * parmLen);
static int to_normalised_options(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen);
static int to_customised_options(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen);
static int free_codec_options(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen);
static int valid_for_protocol(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen);

static struct PluginCodec_information licenseInfo = {
  0,                              // timestamp = 0 TODO
  "Dinsk, LLP",													// source code author
  PRODUCT_VERSION_REL,                                          // source code version
  "developer@dinsk.net",										// source code email
  "http://www.dinsk.net",										// source code URL
  "Copyright (C) 2008 by Dinsk, LLP, All Rights Reserved",		// source code copyright
  "Proprietary License",                                                   // source code license
   PluginCodec_License_RoyaltiesRequired,                       // source code license

  "Dinsk H.263",												// codec description
  "Dinsk, LLP",													// codec author
  PRODUCT_VERSION_REL,                                // codec version
  "developer@dinsk.net",                                        // codec email
  "http://www.dinsk.net",										// codec URL
  "Copyright (C) 2008 by Dinsk, LLP, All Rights Reserved",		// codec copyright information
  NULL,															// codec license
  PluginCodec_License_RoyaltiesRequired							// codec license code
};

static const char YUV420PDesc[]  = { "YUV420P" };
static const char h263PDesc[]    = { "H.263P-DINSK" };
static const char sdpH263P[]     = { "h263-1998" };

static const char sdpH263[]      = { "h263" };

static const char h263QCIFDesc[]  = { "H.263-DINSK-QCIF" };
static const char h263CIFDesc[]   = { "H.263-DINSK-CIF" };
static const char h263Desc[]      = { "H.263-DINSK" };

static PluginCodec_ControlDefn EncoderControls[] = {
  { PLUGINCODEC_CONTROL_VALID_FOR_PROTOCOL,    valid_for_protocol },
  { PLUGINCODEC_CONTROL_GET_CODEC_OPTIONS,     get_codec_options },
  { PLUGINCODEC_CONTROL_TO_NORMALISED_OPTIONS, to_normalised_options },
  { PLUGINCODEC_CONTROL_TO_CUSTOMISED_OPTIONS, to_customised_options },
  { PLUGINCODEC_CONTROL_FREE_CODEC_OPTIONS,    free_codec_options },
  { PLUGINCODEC_CONTROL_SET_CODEC_OPTIONS,     encoder_set_options },
  { PLUGINCODEC_CONTROL_GET_OUTPUT_DATA_SIZE,  encoder_get_output_data_size },
  { NULL }
};

static PluginCodec_ControlDefn DecoderControls[] = {
  { PLUGINCODEC_CONTROL_VALID_FOR_PROTOCOL,     valid_for_protocol },
  { PLUGINCODEC_CONTROL_GET_CODEC_OPTIONS,      get_codec_options },
  { PLUGINCODEC_CONTROL_TO_NORMALISED_OPTIONS,  to_normalised_options },
  { PLUGINCODEC_CONTROL_TO_CUSTOMISED_OPTIONS,  to_customised_options },
  { PLUGINCODEC_CONTROL_FREE_CODEC_OPTIONS,     free_codec_options },
  { PLUGINCODEC_CONTROL_GET_OUTPUT_DATA_SIZE,   decoder_get_output_data_size },
  { NULL }
};

static struct PluginCodec_Option const sqcifMPI =
{
  PluginCodec_IntegerOption,          // Option type
  PLUGINCODEC_SQCIF_MPI,              // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MaxMerge,               // Merge mode
  "1",                                // Initial value
  "SQCIF",                            // FMTP option name
  STRINGIZE(PLUGINCODEC_MPI_DISABLED),// FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  STRINGIZE(PLUGINCODEC_MPI_DISABLED) // Maximum value
};

static struct PluginCodec_Option const qcifMPI =
{
  PluginCodec_IntegerOption,          // Option type
  PLUGINCODEC_QCIF_MPI,               // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MaxMerge,               // Merge mode
  "1",                                // Initial value
  "QCIF",                             // FMTP option name
  STRINGIZE(PLUGINCODEC_MPI_DISABLED),// FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  STRINGIZE(PLUGINCODEC_MPI_DISABLED) // Maximum value
};

static struct PluginCodec_Option const cifMPI =
{
  PluginCodec_IntegerOption,          // Option type
  PLUGINCODEC_CIF_MPI,                // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MaxMerge,               // Merge mode
  "2",                                // Initial value
  "CIF",                              // FMTP option name
  STRINGIZE(PLUGINCODEC_MPI_DISABLED),// FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  STRINGIZE(PLUGINCODEC_MPI_DISABLED) // Maximum value
};

static struct PluginCodec_Option const cif4MPI =
{
  PluginCodec_IntegerOption,          // Option type
  PLUGINCODEC_CIF4_MPI,               // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MaxMerge,               // Merge mode
  STRINGIZE(PLUGINCODEC_MPI_DISABLED),// Initial value
  "CIF4",                             // FMTP option name
  STRINGIZE(PLUGINCODEC_MPI_DISABLED),// FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  STRINGIZE(PLUGINCODEC_MPI_DISABLED) // Maximum value
};

static struct PluginCodec_Option const maxBR =
{
  PluginCodec_IntegerOption,          // Option type
  "MaxBR",                            // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  "maxbr",                            // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "32767"                             // Maximum value
};

static struct PluginCodec_Option const videoQuality =
{
  PluginCodec_IntegerOption,          // Option type
  "Encoding Quality",                 // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "10",                               // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  "31"                                // Maximum value
};

static struct PluginCodec_Option const minVideoQuality =
{
  PluginCodec_IntegerOption,          // Option type
  "set_min_quality",                  // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "1",                                // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  "31"                                // Maximum value
};

static struct PluginCodec_Option const maxVideoQuality =
{
  PluginCodec_IntegerOption,          // Option type
  "set_max_quality",                  // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "31",                                // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  "31"                                // Maximum value
};

static struct PluginCodec_Option const mediaPacketization =
{
  PluginCodec_StringOption,           // Option type
  PLUGINCODEC_MEDIA_PACKETIZATION,    // User visible name
  true,                               // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  "RFC2190"                           // Initial value
};

static struct PluginCodec_Option const h323TSTO = 
{ 
	PluginCodec_BoolOption,   
	h323_temporalSpatialTradeOffCapability_tag, 
	true, 
	PluginCodec_NoMerge,  
	"1", "tstr", "1" 
};

static struct PluginCodec_Option const * const qcifOptionTable[] = {
  &mediaPacketization,
  &maxBR,
  &videoQuality,
  &minVideoQuality,
  &maxVideoQuality,
  &qcifMPI,
  &h323TSTO, // TODO - make codec descriptors separately for h.323 and sip. sip does not have TSTO
  NULL
};

static struct PluginCodec_Option const * const cifOptionTable[] = {
  &mediaPacketization,
  &maxBR,
  &videoQuality,
  &minVideoQuality,
  &maxVideoQuality,
  &cifMPI,
  &h323TSTO, // TODO - make codec descriptors separately for h.323 and sip. sip does not have TSTO
  NULL
};

static struct PluginCodec_Option const * const xcifOptionTable[] = {
  &mediaPacketization,
  &maxBR,
  &videoQuality,
  &minVideoQuality,
  &maxVideoQuality,
  &qcifMPI,
  &cifMPI,
  &sqcifMPI,
  &cif4MPI,
  NULL,
  &h323TSTO, // TODO - make codec descriptors separately for h.323 and sip. sip does not have TSTO
  NULL
};

static struct PluginCodec_Option const annexF =
{ PluginCodec_BoolOption,    "Annex F",   false,  PluginCodec_MinMerge, "1", "F", "0" };

static struct PluginCodec_Option const annexI =
{ PluginCodec_BoolOption,    "Annex I",   false,  PluginCodec_MinMerge, "1", "I", "0" };

static struct PluginCodec_Option const annexJ =
{ PluginCodec_BoolOption,    "Annex J",   true,  PluginCodec_MinMerge, "1", "J", "0" };

static struct PluginCodec_Option const annexK =
{ PluginCodec_IntegerOption, "Annex K",   true,  PluginCodec_EqualMerge, "0", "K", "0", 0, "0", "4" };

static struct PluginCodec_Option const annexN =
{ PluginCodec_BoolOption,    "Annex N",   true,  PluginCodec_AndMerge, "0", "N", "0" };

static struct PluginCodec_Option const annexP =
{ PluginCodec_BoolOption,    "Annex P",   true,  PluginCodec_AndMerge, "0", "P", "0" };

static struct PluginCodec_Option const annexT =
{ PluginCodec_BoolOption,    "Annex T",   true,  PluginCodec_AndMerge, "0", "T", "0" };

static struct PluginCodec_Option const annexD =
{ PluginCodec_BoolOption,    "Annex D",   true,  PluginCodec_MinMerge, "1", "D", "0" };

static struct PluginCodec_Option const * const h263POptionTable[] = {
	&qcifMPI,
	&cifMPI,
	&sqcifMPI,
	&cif4MPI,
	NULL,
	NULL,
	NULL,
	&annexF,
	&annexI,
	&annexJ,
	&annexK,
	&annexN,
	&annexP,
	&annexT,
	&annexD,
	NULL
};

static struct PluginCodec_Option const * const h263OptionTable[] = {
	&mediaPacketization,
	&maxBR,
	//&videoQuality,
	//&minVideoQuality,
	//&maxVideoQuality,
	&qcifMPI,
	&cifMPI,
	&sqcifMPI,
	&cif4MPI,
	NULL,
	&annexF,
	NULL
};

// PluginCodec_H323VideoCodec_h263,    // h323CapabilityType 

static struct PluginCodec_Definition h263CodecDefn[] = {
{ 
	// All frame sizes (dynamic) encoder
	PLUGIN_CODEC_VERSION_OPTIONS,       // codec API version
	&licenseInfo,                       // license information

	PluginCodec_MediaTypeVideo |        // audio codec
	PluginCodec_RTPTypeShared |         // specified RTP type
	PluginCodec_RTPTypeDynamic,         // specified RTP type

	h263PDesc,                          // text decription
	YUV420PDesc,                        // source format
	h263PDesc,                          // destination format

	h263POptionTable,                   // user data 

	H263P_CLOCKRATE,                    // samples per second
	H263P_BITRATE,                      // raw bits per second
	20000,                              // nanoseconds per frame

	CIF4_WIDTH,                         // frame width
	CIF4_HEIGHT,                        // frame height
	RECOMMENDED_FRAME_RATE ,            // recommended frame rate
	MAXIMUM_FRAME_RATE,                 // maximum frame rate
	0,                                  // IANA RTP payload code
	sdpH263P,                           // RTP payload name

	create_encoder,                     // create codec function
	destroy_encoder,                    // destroy codec
	codec_encoder,                      // encode/decode
	EncoderControls,                    // codec controls

	PluginCodec_H323VideoCodec_h263,    // h323CapabilityType 
	NULL                                // h323CapabilityData
},
{ 
	// All frame sizes (dynamic) decoder
	PLUGIN_CODEC_VERSION_OPTIONS,       // codec API version
	&licenseInfo,                       // license information

	PluginCodec_MediaTypeVideo |        // audio codec
	PluginCodec_RTPTypeShared |         // specified RTP type
	PluginCodec_RTPTypeDynamic,         // specified RTP type

	h263PDesc,                          // text decription
	h263PDesc,                          // source format
	YUV420PDesc,                        // destination format

	h263POptionTable,                   // user data 

	H263P_CLOCKRATE,                    // samples per second
	H263P_BITRATE,                      // raw bits per second
	20000,                              // nanoseconds per frame

	CIF4_WIDTH,                         // frame width
	CIF4_HEIGHT,                        // frame height
	RECOMMENDED_FRAME_RATE ,            // recommended frame rate
	MAXIMUM_FRAME_RATE,                 // maximum frame rate
	0,                                  // IANA RTP payload code
	sdpH263P,                           // RTP payload name

	create_decoder,                     // create codec function
	destroy_decoder,                    // destroy codec
	codec_decoder,                      // encode/decode
	DecoderControls,                    // codec controls

	PluginCodec_H323VideoCodec_h263,    // h323CapabilityType 
	NULL                                // h323CapabilityData
},

{ 
	// H.263 (RFC 2190) encoder
	PLUGIN_CODEC_VERSION_OPTIONS,       // codec API version
	&licenseInfo,                       // license information

	PluginCodec_MediaTypeVideo |        // video codec
	PluginCodec_MediaTypeExtVideo |     // Extended video codec
	PluginCodec_RTPTypeExplicit,        // specified RTP type

	h263Desc,                           // text decription
	YUV420PDesc,                        // source format
	h263Desc,                           // destination format

	h263OptionTable,                    // user data 

	H263_CLOCKRATE,                     // samples per second
	H263_BITRATE,                       // raw bits per second
	20000,                              // nanoseconds per frame

	{{
	CIF4_WIDTH,                        // frame width
	CIF4_HEIGHT,                       // frame height
	RECOMMENDED_FRAME_RATE ,            // recommended frame rate
	MAXIMUM_FRAME_RATE,                 // maximum frame rate
	}},

	RTP_RFC2190_PAYLOAD,                // IANA RTP payload code
	sdpH263,                            // RTP payload name

	create_encoder,                     // create codec function
	destroy_encoder,                    // destroy codec
	codec_encoder,                      // encode/decode
	EncoderControls,                    // codec controls

	PluginCodec_H323VideoCodec_h263,    // h323CapabilityType 
	NULL                                // h323CapabilityData
},
{ 
	// H.263 (RFC 2190) decoder
	PLUGIN_CODEC_VERSION_OPTIONS,       // codec API version
	&licenseInfo,                       // license information

	PluginCodec_MediaTypeVideo |        // video codec
	PluginCodec_MediaTypeExtVideo |     // Extended video codec
	PluginCodec_RTPTypeExplicit,        // specified RTP type

	h263Desc,                           // text decription
	h263Desc,                           // source format
	YUV420PDesc,                        // destination format

	h263OptionTable,                    // user data 

	H263_CLOCKRATE,                     // samples per second
	H263_BITRATE,                       // raw bits per second
	20000,                              // nanoseconds per frame

	{{
	CIF4_WIDTH,                        // frame width
	CIF4_HEIGHT,                       // frame height
	RECOMMENDED_FRAME_RATE ,            // recommended frame rate
	MAXIMUM_FRAME_RATE,                 // maximum frame rate
	}},
	RTP_RFC2190_PAYLOAD,                // IANA RTP payload code
	sdpH263,                            // RTP payload name

	create_decoder,                     // create codec function
	destroy_decoder,                    // destroy codec
	codec_decoder,                      // encode/decode
	DecoderControls,                    // codec controls

	PluginCodec_H323VideoCodec_h263,    // h323CapabilityType 
	NULL                                // h323CapabilityData
}

};


#ifdef ONE_THREAD_JOB
static OneThreadJobManager gOneThreadJonManager(H263_THREAD_PRIORITY);
#endif


struct H263_Parcer
{
    uchar   nImageSize;
    bool    bIFrame;
    bool    bAnnexD;
    bool    bAnnexE;
    bool    bAnnexF;
    bool    bAnnexG;

    
    bool Set(uchar* pData, uint nDataSize)
    {
        if (nDataSize < 7)
           return false;
        // ensure data starts with PSC
        if ((pData[0] != 0) && (pData[1] != 0) || ((pData[2] & 0xFC) != 0x80))
            return false;

        // get TR
        uint TR = ((pData[2] << 6) & 0xfc) | (pData[3] >> 2);
      
        // make sure mandatory part of PTYPE is present
        if ((pData[3] & 0x03) != 2)
            return false;

        // we don't do split screen, document indicator, full picture freeze
        if ((pData[4] & 0xe0) != 0)
            return false;

        // get image size
        nImageSize = (pData[4] >> 2) & 0x7;
        //SB macroblocksPerGOB = MacroblocksPerGOBTable[frameSize];
        //if (macroblocksPerGOB == -1)
        //  return -6;

        // get I-frame flag
        bIFrame = (pData[4] & 2) == 0;

        // get annex bits:
        //   Annex D - unrestricted motion vector mode
        //   Annex E - syntax-based arithmetic coding mode
        //   Annex F - advanced prediction mode
        //   Annex G - PB-frames mode

        bAnnexD = pData[4] & 0x01;
        bAnnexE = pData[5] & 0x80;
        bAnnexF = pData[5] & 0x40;
        bAnnexG = pData[5] & 0x20;

        // annex G not supported 
        if (bAnnexG)
            return false;

        //_pQuant = data[5] & 0x1f;
        //_cpm = (data[6] & 0x80) != 0;
        return true;
    }
};


class H263PEncoderContext 
#ifdef ONE_THREAD_JOB
	: public OneThreadJob
#endif
{
public:
	unsigned                _frameWidth;
	unsigned                _frameHeight;
    unsigned                _frameSize;
	unsigned                _frameCount;
    unsigned                _bInit;
    unsigned                _flags;
	UMC::Status             _status;
    UMC::H263VideoEncoder*  _pEncoder;
//	UMC::VideoEncoderParams _params;
    UMC::H263EncoderParams  _params;
	UMC::VideoData          _in;
	UMC::MediaData          _out;
    Ipp32u*                 _pGOBstartPos;
    Ipp32u*                 _pGOBstartPosEnd;
#ifdef H263_PLUGIN_ACTIVATION
    ActivationMonitor       _ActivationMonitor;
#endif // H263_PLUGIN_ACTIVATION
	
	bool                    _bNewParam;
    unsigned				_bitrate;
	unsigned				_tsto;
    bool                    _bH263_Plus;
    unsigned long           _TimeStamp;
    H263_Parcer             _H263Parcer;
    unsigned char           _nRtpPayload;


	bool    OpenCodec();
    void    CloseCodec();
    volatile bool       _bShutdown;

public:

	    H263PEncoderContext();
	    ~H263PEncoderContext();

    bool IsValid() { return true;} //_hNewFrame != NULL && _hFrameComplete != NULL && _hThread != NULL;}
	bool EncodeFrames(const unsigned char * src, unsigned & srcLen, unsigned char * dst, unsigned & dstLen, unsigned int & flags);

    void SetFrameWidth(unsigned newFrameWidth)      { if (_frameWidth != newFrameWidth)     { _frameWidth = newFrameWidth;   _bNewParam = true;} } 
    void SetFrameHeight(unsigned newFrameHeight)    { if (_frameHeight != newFrameHeight)   { _frameHeight = newFrameHeight; _bNewParam = true;} } 
    void SetBitRate(unsigned newBitRate) {
        if (newBitRate < 0)
            newBitRate = 1;
        if (_bitrate != newBitRate) {
            _bitrate = newBitRate;
            _bNewParam = true;
        } 
    } 

    void SetH263P_Codec(bool bTrue) {
        if (bTrue) {
            _bH263_Plus = true;
            _nRtpPayload = RTP_RFC2429_PAYLOAD;
        }
        else {
            _bH263_Plus = false;
            _nRtpPayload = RTP_RFC2190_PAYLOAD;
        }
    }



    void SetTSTO(unsigned newTSTO) {
        if (newTSTO < 1)
            newTSTO = 1;
        else if (newTSTO > 31)
            newTSTO = 31;
        if (_tsto != newTSTO) {
            _tsto = newTSTO;
            _bNewParam = true;
        } 
    } 

    virtual void Execute()                      { _status = _pEncoder->GetFrame(&_in, &_out);}
    void GetRTPFrameRFC2429(RTPFrame& frame, uint nCopy);      //H263+
    void GetRTPFrameRFC2190(RTPFrame& frame, uint nCopy);      //H263
};


H263PEncoderContext::H263PEncoderContext()
    :   
#ifdef ONE_THREAD_JOB
	OneThreadJob(true),
#endif
	_bInit(false),
	_frameCount(0),
	_frameWidth(CIF4_WIDTH),
	_frameHeight(CIF4_HEIGHT),
	_frameSize((3 * CIF4_WIDTH * CIF4_HEIGHT)/2),
	_status(UMC::UMC_OK),
	_pEncoder(NULL),
	_flags(0),
	_bitrate(200000),
	_tsto(7),
	_bNewParam(false),
	_pGOBstartPos(NULL),
	_bShutdown(false),
    _TimeStamp(0)
{
    SetH263P_Codec(true);
	PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Codec\tEncoder\tH263 encoder created");
}

H263PEncoderContext::~H263PEncoderContext()
{
    delete _pEncoder;
}


bool H263PEncoderContext::OpenCodec()
{
    CloseCodec();
    dbLog("H263PEncoderContext::OpenCodec\n");

    _bNewParam = false;
    _pEncoder = new UMC::H263VideoEncoder;
    if (!_pEncoder) {
        _status = UMC::UMC_ERR_ALLOC;
	    PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoder Allocate UMC::H263VideoEncoder");
        return false;
    }

	_params.numThreads = 1; // maximum number of threads to use
	_params.info.clip_info.width  = _frameWidth;
	_params.info.clip_info.height = _frameHeight;
    _params.info.bitrate          = _bitrate;
    _params.info.framerate        = 10;

    h263e_Param& h263_p = _params.m_Param;

    h263_p.Width  = _frameWidth;
    h263_p.Height = _frameHeight;


    h263_p.TimeIncrement  = 3003;          //3003      frame interval
    h263_p.TimeResolution = 30000;         //30000     frame scale
    h263_p.FrameSkip = 0;
    h263_p.quantPPic = 7;//_tsto;       //7         PVOP quant
    h263_p.quantIPic = 7;//_tsto;       //7         IVOP quant
    h263_p.quantBPic = 9;//_tsto;       //9         BVOP quant
    h263_p.IPicdist = 10;           //10        IVOP distance
    h263_p.PPicdist = 1;            //1         PVOP distance
    h263_p.PPicsearchWidth = 15;    //15        PVOP searchWidth in full pel
    h263_p.PPicsearchHeight = 15;   //15        PVOP searchHeight in full pel
    h263_p.MEalgorithm = 1;         //1         Motion Estimation algorithm: 0 - full search, 1 - fast search
    h263_p.MEaccuracy = 2;          //2         Motion Estimation accuracy: 1 - full pel, 2 - half pel
    h263_p.calcPSNR = 0;            //0         calculate PSNR
    h263_p.SceneChangeThreshold=50; //50        SceneChangeThreshold, %

    h263_p.UMV = 0;                 // 0        unrestricted motion vector: 
                                    //              0 - off; 
                                    //              1 - no PLUSPTYPE;
                                    //              2 - PLUSPTYPE, UUI==1; 
                                    //              3 - PLUSPTYPE, UUI==01

    h263_p.advPred = 0;             //0         advanced prediction: 0 - off (1MV),  1 - on (4MV, OBMC)
    h263_p.advIntra = 0;            //0         advanced Intra coding
    h263_p.GOBheaders = 2;          //0         insert GOB headers: 
                                    //              0 - off, 
                                    //              1 - GOB headers without stuffing,
                                    //              2 - GOB headers with stuffing (GSTUF)

	_status = _pEncoder->Init(&_params);

	PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoder Init status: " << _status << ". " <<  UMCStatusToText(_status) << "." << std::endl);

    if (_status != UMC::UMC_OK)
        return false;
    
    _frameSize = _frameWidth * _frameHeight;
    _frameSize += _frameSize>>1;

	_in.Init(_frameWidth, _frameHeight, UMC::YUV420, 8);
	_out.Alloc(2*_frameWidth*_frameHeight);
    _flags = 0;
    _bInit = 1;
    _frameCount = 0;

	return true;
}


void H263PEncoderContext::CloseCodec()
{
    dbLog("H263PEncoderContext::CloseCodec()\n");

    _bInit = false;
    delete _pEncoder;
    _pEncoder = NULL;
	_in.Close();
	_out.Close();
    _status = UMC::UMC_OK;

#ifdef SB_DEBUG_OUT
    if (s_FileOut) {
        fclose(s_FileOut);
        s_FileOut = NULL;
    }
#endif
}


bool H263PEncoderContext::EncodeFrames(const unsigned char* src, unsigned& srcLen, unsigned char * dst, unsigned & dstLen, unsigned int & flags)
{
#ifdef H263_PLUGIN_ACTIVATION    
	if (!_ActivationMonitor.CanUse())
        return false;
#endif // H263_PLUGIN_ACTIVATION	���
	
	// if this is the first frame, or the frame size has changed, deal with it

    RTPFrame srcRTP(src, srcLen);
    RTPFrame dstRTP(dst, dstLen, _nRtpPayload);

	if (_out.GetDataSize() <= 0 )
	{
        PluginCodec_Video_FrameHeader* pFrameHeader = (PluginCodec_Video_FrameHeader*) srcRTP.GetPayloadPtr();

        if ((_frameWidth != pFrameHeader->width) || (_frameHeight != pFrameHeader->height)) {
            _bInit = false;
	        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoded wrong FrameSize " 
                << "Set " << _frameWidth << "x" << _frameHeight << "   "
                << "In " << pFrameHeader->width << "x" << pFrameHeader->height);
            _frameWidth = pFrameHeader->width;
            _frameHeight = pFrameHeader->height;
        }

        if (_bNewParam)
            _bInit = false;

        if (!_bInit && !OpenCodec()) {
            dbLog("Error OpenCodec()\n");
            return false;
        }

        _TimeStamp = srcRTP.GetTimestamp();

        if (srcRTP.GetPayloadSize()-sizeof(PluginCodec_Video_FrameHeader) < _frameSize) {
            PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoded srcRTP.GetPayloadSize()-sizeof(PluginCodec_Video_FrameHeader) < _frameSize");
            _out.Reset();
            dstLen = 0;
            dbLog("Error GetPayloadSize()\n");
            return true;
        }

        if (flags & PluginCodec_CoderForceIFrame)
            _pEncoder->RequestIPicture();

        _in.SetBufferPointer((Ipp8u*)(pFrameHeader+1),_frameSize);

#ifdef DBLOG
        dbLog("{E\n");
        DWORD dwStart = GetTickCount();
#endif

#ifdef ONE_THREAD_JOB
        gOneThreadJonManager.AddJob(this);
        if (!WaitWhenExecute())
            return false;
#else 
        Execute();
#endif

#ifdef DBLOG
        dbLog("%dE\n}\n",GetTickCount()-dwStart);
#endif

        _pGOBstartPos = _pEncoder->GetFrameGOBstartPos();
        _pGOBstartPosEnd = _pGOBstartPos + _pEncoder->GetCountGOBstartPos();

        if (_status != UMC::UMC_OK ) {
            _out.Reset();
            dstLen = 0;
            if (_status == UMC::UMC_ERR_NOT_ENOUGH_DATA) {
                dbLog("SkipFrame\n");
                return true;
            }

            PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoded Error Encode Frame " << UMCStatusToText(_status));
            dbLog("Error \n");
            return true;
        }


        if (_pEncoder->IsIPicture())
            _flags = PluginCodec_ReturnCoderIFrame;
        else 
            _flags = 0;
    }

    flags = _flags;
    unsigned nPayloadSize = dstRTP.GetPayloadSize();
    unsigned nCopy = MAX_PAYLOAD_SIZE - 16;

    if (_pGOBstartPos) {
        unsigned nCurPos = ((char*) _out.GetDataPointer()) - ((char*) _out.GetBufferPointer());
        unsigned nNewPos = (nCurPos + MAX_PAYLOAD_SIZE) << 3;

        while ((_pGOBstartPos+1 < _pGOBstartPosEnd) && (_pGOBstartPos[1] < nNewPos))
            ++_pGOBstartPos;

        if (_pGOBstartPos >= _pGOBstartPosEnd)
            nCopy = _out.GetDataSize(); 
        else if ((nCurPos<<3) < _pGOBstartPos[0])
            nCopy = ((_pGOBstartPos[0]+7)>>3) - nCurPos;
        else if (_pGOBstartPos+1 < _pGOBstartPosEnd)
            nCopy = ((_pGOBstartPos[1]+7)>>3) - nCurPos;
        else
            nCopy = _out.GetDataSize(); 
    }
        
    if (nCopy > nPayloadSize)
        nCopy = nPayloadSize;

    if (_bH263_Plus)
        GetRTPFrameRFC2429(dstRTP, nCopy);
    else 
        GetRTPFrameRFC2190(dstRTP, nCopy);

    _out.MoveDataPointer(nCopy); 
    dstRTP.SetTimestamp(_TimeStamp);

    if (_out.GetDataSize() <= 0) {
        dstRTP.SetMarker(true);
        flags |= PluginCodec_ReturnCoderLastFrame;
        _out.Reset();
    }
    else 
        dstRTP.SetMarker(false);

#ifdef SB_DEBUG_OUT
    if (!s_FileOut && !s_bTryOpenOutFile) 
    {
        s_bTryOpenOutFile = true;
        s_FileOut = fopen(SB_DEBUG_OUT,"wb+");
    }
    if (s_FileOut) {
        unsigned short nLen = dstRTP.GetPayloadSize();
        unsigned char  bMarker = dstRTP.GetMarker() ? 1 : 0;
        unsigned char* ptr = dstRTP.GetPayloadPtr();
        fwrite(&nLen,2,1,s_FileOut);
        fwrite(&bMarker,1,1,s_FileOut);
        fwrite(ptr,nLen,1,s_FileOut);
        fflush(s_FileOut);
    }
#endif

    dstLen = dstRTP.GetFrameLen();

	_frameCount++;

	PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoded " << srcLen << 
		" bytes of YUV420P raw data into " <<
		dstLen <<
		" bytes. Status: " <<
		_status << ". " << UMCStatusToText(_status) << "." << std::endl);

	return true;
}




void H263PEncoderContext::GetRTPFrameRFC2429(RTPFrame& frame, uint nCopy)
{
    uchar* pDst = (uchar*) frame.GetPayloadPtr();
    uchar* pSrc = (uchar*) _out.GetDataPointer();

    pDst[0] = 0;
    pDst[1] = 0;

    if ((pSrc[0] == 0) && (pSrc[1] == 0)) {
        pDst[0] |= 0x04;
        nCopy -= 2;
        pSrc += 2;
    }

    memcpy(pDst+2, pSrc, nCopy);

    frame.SetPayloadSize(nCopy+2);
}



void H263PEncoderContext::GetRTPFrameRFC2190(RTPFrame& frame, uint nCopy)
{

    uchar* pDst = (uchar*) frame.GetPayloadPtr();
    uchar* pSrc = (uchar*) _out.GetDataPointer();


    bool bModeA = (nCopy > 3) && (pSrc[0] == 0) && (pSrc[1] == 0) && ((pSrc[2] & 0x80) == 0x80);

    frame.SetPayloadSize(nCopy + (bModeA ? 4 : 8));

    if (bModeA) {
        _H263Parcer.Set(pSrc,nCopy);
        pDst[0] = 0;
        pDst[1] = (unsigned char)((_H263Parcer.nImageSize << 5) 
            | (_H263Parcer.bIFrame ? 0 : 0x10) 
            | (_H263Parcer.bAnnexD ? 0x08 : 0) 
            | (_H263Parcer.bAnnexE ? 0x04 : 0) 
            | (_H263Parcer.bAnnexF ? 0x02 : 0));

      pDst[2] = pDst[3] = 0;
      pDst += 4;
    }
    else
    {
      // create the Mode B header
      int sBit = 0;
      int eBit = 0;
      uint gobn = (pSrc[2]>>2) & 0x1F;          //    frag.mbNum / macroblocksPerGOB;
      uint mba  = 0;                            // frag.mbNum % macroblocksPerGOB;
      pDst[0] = (0x80 | ((sBit & 7) << 3) | (eBit & 7));
      pDst[1] = (_H263Parcer.nImageSize << 5);
      pDst[2] = (((gobn << 3) & 0xf8) | ((mba >> 6) & 0x7));
      pDst[3] = ((mba << 2) & 0xfc);
      pDst[4] = (_H263Parcer.bIFrame ? 0 : 0x80) 
        | (_H263Parcer.bAnnexD ? 0x40 : 0) 
        | (_H263Parcer.bAnnexE ? 0x20 : 0) 
        | (_H263Parcer.bAnnexF ? 0x010: 0);
      pDst[5] = pDst[6] = pDst[7] = 0;
      pDst += 8;
    }

    memcpy(pDst, pSrc, nCopy);
}



class H263PDecoderContext: public UMC::H263VideoDecoder
#ifdef ONE_THREAD_JOB
	, public OneThreadJob
#endif
{
public:
    bool                    _bInit;
	unsigned                _frameWidth;
	unsigned                _frameHeight;
	unsigned                _frameCount;
    unsigned                _skippedFrameCount;
	unsigned                _frameSize;
    unsigned short          _expectedSequenceNumber;
    unsigned                _flagsIFrameRequest;
    unsigned                _nErrorInFrame;

	UMC::Status             _status;
	UMC::MediaData          _in;
	UMC::VideoData          _out;
    Ipp8u*                  _pInBuffer;
    bool                    _bH263_Plus;
    bool                    _bFirstFrame;
    bool                    _bSkipUntilEndOfFrame;
    bool                    _bGotPicture;
    uint                    _nLastEbit;

#ifdef H263_PLUGIN_ACTIVATION
    ActivationMonitor       _ActivationMonitor;
#endif // H263_PLUGIN_ACTIVATION
	
#ifdef _WIN32
	DWORD   DecodeThreadMain();
	static DWORD WINAPI DecodeThread(LPVOID lpParameter ) { return ((H263PDecoderContext*) lpParameter)->DecodeThreadMain();}
#endif

	bool OpenCodec();
	void CloseCodec();

public:

    H263PDecoderContext() :
#ifdef ONE_THREAD_JOB
	  OneThreadJob(true),
#endif
            _bInit(false),
            _frameCount(0),
            _skippedFrameCount(0),
            _status(UMC::UMC_OK),
            _expectedSequenceNumber(0),
            _nErrorInFrame(0),
            _flagsIFrameRequest(0), 
            _bH263_Plus(true),
            _bSkipUntilEndOfFrame(false),
            _bFirstFrame(true),
            _bGotPicture(false),
            _nLastEbit(0)
    { 
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Decoder\tH263 decoder created"); 
        SetDefaultFrameSize();
        _pInBuffer = new Ipp8u[_frameWidth*_frameHeight*2];
        _in.SetBufferPointer(_pInBuffer,_frameWidth*_frameHeight*2);
    }

    virtual ~H263PDecoderContext()
    { 
		CloseCodec();
        delete [] _pInBuffer;
    }

    bool IsValid() { return true; } //_hNewFrame != NULL && _hFrameComplete != NULL && _hThread != NULL;}
	bool DecodeFrames(const unsigned char* src, unsigned& srcLen, unsigned char* dst, unsigned& dstLen, unsigned& flags);
    bool UpdateFrameSize();
    void SetDefaultFrameSize() { 
#ifdef _WIN32_WCE
        _frameWidth = QCIF_WIDTH;
        _frameHeight = QCIF_HEIGHT;
#else
        _frameWidth = CIF_WIDTH;
        _frameHeight = CIF_HEIGHT;
#endif
        _frameSize = (_frameWidth*_frameHeight*3)/2;
    }


    virtual void Execute()      { _status = UMC::H263VideoDecoder::GetFrame(&_in,&_out); }

    bool AddRTPFrameRFC2429(RTPFrame& frame);      //H263+
    bool AddRTPFrameRFC2190(RTPFrame& frame);      //H263

    void BeginNewFrame(void)    { _in.Reset(); _nLastEbit = 0; }
    bool LostSync(void)         { _bSkipUntilEndOfFrame = true; _flagsIFrameRequest = PluginCodec_ReturnCoderRequestIFrame; return false;}
};


static void * create_encoder(const struct PluginCodec_Definition* codec)
{
    H263PEncoderContext* p = new H263PEncoderContext;


    if (p && !p->IsValid()) {
        delete p;
        p = NULL;
    }
    else 
        p->SetH263P_Codec(_stricmp(codec->destFormat, h263Desc) != 0);

    return p;
}

static int encoder_set_options(const PluginCodec_Definition*, void* _context, const char*, void* parm, unsigned* parmLen)
{
    if (parmLen == NULL || *parmLen != sizeof(const char **) || parm == NULL)
        return 0;

    H263PEncoderContext* context = (H263PEncoderContext*) _context;

    // get the "frame width" media format parameter to use as a hint for the encoder to start off
    for (const char* const* option = (const char* const*) parm; *option != NULL; option += 2) {
        if (_stricmp(option[0], PLUGINCODEC_OPTION_FRAME_WIDTH) == 0)
            context->SetFrameWidth( atoi(option[1]) );
        else if (_stricmp(option[0], PLUGINCODEC_OPTION_FRAME_HEIGHT) == 0)
            context->SetFrameHeight( atoi(option[1]));
        else if (_stricmp(option[0], PLUGINCODEC_OPTION_TARGET_BIT_RATE) == 0)
            context->SetBitRate( atoi(option[1]));
        else if (_stricmp(option[0], PLUGINCODEC_OPTION_TEMPORAL_SPATIAL_TRADE_OFF) == 0)
            context->SetTSTO( atoi(option[1]));
        else if (_stricmp(option[0], h323_temporalSpatialTradeOffCapability_tag) == 0)
            context->SetTSTO( atoi(option[1]));     
		
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Encoder\tOption " << option[0] << " = " << option[1]);
    }
    context->_bInit = false;
    return 1;
}

static void destroy_encoder(const struct PluginCodec_Definition * /*codec*/, void * _context)
{
  H263PEncoderContext * context = (H263PEncoderContext *)_context;
  delete context;
}

static int codec_encoder(const struct PluginCodec_Definition * , 
                                           void * _context,
                                     const void * from, 
                                       unsigned * fromLen,
                                           void * to,
                                       unsigned * toLen,
                                   unsigned int * flag)
{
    H263PEncoderContext* context = (H263PEncoderContext*) _context;
    return context->EncodeFrames((const unsigned char*) from, *fromLen, (unsigned char*)to, *toLen, *flag);
}

static int encoder_get_output_data_size(const PluginCodec_Definition *, void *, const char *, void *, unsigned *)
{
   return RTP_MIN_HEADER_SIZE + (MAX_PAYLOAD_SIZE * 2);
}

/////////////////////////////////////////////////////////////////////////////

bool H263PDecoderContext::OpenCodec()
{
	UMC::VideoDecoderParams params;
    _frameCount = 0;
    _skippedFrameCount = 0;
    _nErrorInFrame = 0;

    params.info.stream_type = UMC::H263_VIDEO;
    params.numThreads = 1;
    params.lFlags = 0;
    params.m_pData = &_in;
    params.numThreads = 1;                         // maximum number of threads to use
	params.info.clip_info.width  = 0;
	params.info.clip_info.height = 0;
    _frameCount = 0;

    if (_status = UMC::H263VideoDecoder::Init(&params) != UMC::UMC_OK) {
        CloseCodec();
        return false;
    }

    m_decInfo->stopOnErr = 0;
    return UpdateFrameSize();
}

bool H263PDecoderContext::UpdateFrameSize()
{
	UMC::VideoDecoderParams params;

    if (((_status = UMC::H263VideoDecoder::GetInfo(&params)) != UMC::UMC_OK)    ||
        (params.info.clip_info.width == 0)                                      ||
		(params.info.clip_info.width > CIF4_WIDTH)                             ||
        (params.info.clip_info.height > CIF4_HEIGHT)                           ||
        (params.info.clip_info.height == 0)                                     )
    {
        CloseCodec();
        return false;
    }

    _frameWidth  = params.info.clip_info.width;
    _frameHeight = params.info.clip_info.height;
    _frameSize = _frameWidth*_frameHeight;
    _frameSize += _frameSize>>1;

	PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Decoder Init status: " << _status << ". " << UMCStatusToText(_status) << "." << std::endl);

    unsigned nNewInBufferSize = 2*_frameWidth*_frameHeight;
    if (nNewInBufferSize > _in.GetBufferSize()) {
        unsigned nCurrentDataSize = _in.GetDataSize();
        Ipp8u* pNewBuffer = new Ipp8u[nNewInBufferSize];
        memcpy(pNewBuffer,_pInBuffer,nCurrentDataSize);
        _in.SetBufferPointer(pNewBuffer,nNewInBufferSize);
        _in.SetDataSize(nCurrentDataSize);
        delete [] _pInBuffer;
        _pInBuffer = pNewBuffer;
    }

	_out.Init(_frameWidth, _frameHeight, UMC::YUV420, 8);
	_bInit = true;
    _expectedSequenceNumber = 0;
    _flagsIFrameRequest =  PluginCodec_ReturnCoderRequestIFrame;
    return true;
}


void H263PDecoderContext::CloseCodec()
{
    _bInit = false;

	_out.Close();
	Close();
	SetDefaultFrameSize();
}



bool H263PDecoderContext::DecodeFrames(const unsigned char* src, unsigned& srcLenRef, unsigned char* dst, unsigned& dstLen, unsigned& flags)
{
#ifdef H263_PLUGIN_ACTIVATION
    if (!_ActivationMonitor.CanUse())
        return false;
#endif // H263_PLUGIN_ACTIVATION

    unsigned srcLen = srcLenRef;

    RTPFrame srcRTP(src, srcLen);
    RTPFrame dstRTP(dst, dstLen, 0);
    dstLen = 0;


    if (_bSkipUntilEndOfFrame) {
        if (srcRTP.GetMarker())  {
            PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "_bSkipUntilEndOfFrame" );
            _bSkipUntilEndOfFrame = false;
            _expectedSequenceNumber = srcRTP.GetSequenceNumber() + 1;
            _nErrorInFrame = 0;
            BeginNewFrame();
        }
        flags = _flagsIFrameRequest;
        return true;
    }
    
    
    if ((_expectedSequenceNumber != 0) && 
        (_expectedSequenceNumber != srcRTP.GetSequenceNumber())) 
    {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "_expectedSequenceNumber != srcRTP.GetSequenceNumber() " << _expectedSequenceNumber << " " << srcRTP.GetSequenceNumber());
        ++ _nErrorInFrame;
        flags = _flagsIFrameRequest = PluginCodec_ReturnCoderRequestIFrame;
    }   
    _expectedSequenceNumber = srcRTP.GetSequenceNumber() + 1;

    
    bool bAddRTPFrame = _bH263_Plus
        ? AddRTPFrameRFC2429(srcRTP)
        : AddRTPFrameRFC2190(srcRTP);


    if (!_bInit) {
        if (!bAddRTPFrame || !OpenCodec()) {
            BeginNewFrame();
            bAddRTPFrame = _bH263_Plus
                ? AddRTPFrameRFC2190(srcRTP)
                : AddRTPFrameRFC2429(srcRTP);
            if (bAddRTPFrame && OpenCodec())
                _bH263_Plus = !_bH263_Plus;
            else 
                bAddRTPFrame = false;
        }
    }
            
    flags = _flagsIFrameRequest;

    if (!bAddRTPFrame || _nErrorInFrame > 4)  {
        LostSync();
        _bGotPicture = false;
        flags = _flagsIFrameRequest = PluginCodec_ReturnCoderRequestIFrame;
        _bSkipUntilEndOfFrame = true;
        return true;
    }

    if (!srcRTP.GetMarker())
        return true;

    if (_in.GetDataSize() <= 3) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Got Empty Frame." );
        _skippedFrameCount ++;
        BeginNewFrame();
        return true;
    }

    uchar* pData = (uchar*) _in.GetBufferPointer();
    if (pData[0] != 0 || pData[1] != 0 || ((pData[2] & 0xFC) != 0x80)) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Received frame has no picture header - dropping");
        _skippedFrameCount ++;
        BeginNewFrame();
        return true;
    }

    bool bIPicture = H263_CheckIPicture((const uchar*)_in.GetDataPointer(),_in.GetDataSize());


    if (!_bGotPicture && !bIPicture) {
        BeginNewFrame();
        flags = _flagsIFrameRequest = PluginCodec_ReturnCoderRequestIFrame;
        return true;
    }
     
    if (!_bInit && !OpenCodec()) {
        BeginNewFrame();
        flags = _flagsIFrameRequest =  PluginCodec_ReturnCoderRequestIFrame;
        return true;
    }

    unsigned nDstSize = dstRTP.GetPayloadSize();
    if (nDstSize >= sizeof(PluginCodec_Video_FrameHeader)) {
        PluginCodec_Video_FrameHeader* frameHeader = (PluginCodec_Video_FrameHeader*)  dstRTP.GetPayloadPtr();
        frameHeader->x      = 0;
        frameHeader->y      = 0;
        frameHeader->width  = _frameWidth;
        frameHeader->height = _frameHeight;
     }

    if (nDstSize < _frameSize + sizeof(PluginCodec_Video_FrameHeader)) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "decode nDstSize < _frameSize + sizeof(PluginCodec_Video_FrameHeader");
        dstRTP.SetPayloadSize(sizeof(PluginCodec_Video_FrameHeader));
        dstLen = dstRTP.GetFrameLen();
        BeginNewFrame();
        flags = _flagsIFrameRequest =  PluginCodec_ReturnCoderRequestIFrame;
        return true;
    }

    dstRTP.SetPayloadSize(sizeof(PluginCodec_Video_FrameHeader) + _frameSize);
    dstRTP.SetPayloadType(RTP_DYNAMIC_PAYLOAD);
    dstRTP.SetTimestamp(srcRTP.GetTimestamp());
    dstRTP.SetMarker(true);

    PluginCodec_Video_FrameHeader* frameHeader = (PluginCodec_Video_FrameHeader*)  dstRTP.GetPayloadPtr();
    frameHeader->x = frameHeader->y = 0;
    frameHeader->width = _frameWidth;
    frameHeader->height = _frameHeight;

    _out.SetBufferPointer((Ipp8u*)(frameHeader+1),_frameSize);

#ifdef DBLOG
    dbLog("{D\n");
    DWORD dwStart = GetTickCount();
#endif

#ifdef ONE_THREAD_JOB
        gOneThreadJonManager.AddJob(this);
        if (!WaitWhenExecute())
            return false;
#else 
        Execute();
#endif

#ifdef DBLOG
    dbLog("%dD}\n",GetTickCount()-dwStart);
#endif
    
    if (_status != UMC::UMC_OK ) {
        if (_status == UMC::UMC_ERR_NOT_ENOUGH_BUFFER) {
            UpdateFrameSize();
            frameHeader->width = _frameWidth;
            frameHeader->height = _frameHeight;
            if (nDstSize < _frameSize + sizeof(PluginCodec_Video_FrameHeader))
                return true;
            else { 
                _out.SetBufferPointer((Ipp8u*)(frameHeader+1),_frameSize); 
                _status = UMC::H263VideoDecoder::GetFrame(&_in,&_out);
            }
        }
        if (_status != UMC::UMC_OK) {
            flags = _flagsIFrameRequest = PluginCodec_ReturnCoderRequestIFrame;
            CloseCodec();
            PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Decoded Error Decoded Frame " << UMCStatusToText(_status) );
            dbLog(" Error " << _status);
            return true;
        }
    }

    BeginNewFrame();

    if ((_out.GetFrameType() == UMC::I_PICTURE) && (_nErrorInFrame == 0))  {
        
        _bGotPicture = true;
        _flagsIFrameRequest = 0;
    }

    flags = _flagsIFrameRequest | PluginCodec_ReturnCoderLastFrame;
    dstLen = dstRTP.GetFrameLen();
    ++_frameCount;
	return true;
}

bool H263PDecoderContext::AddRTPFrameRFC2429(RTPFrame& frame)
{
    uchar* pData = frame.GetPayloadPtr();
    uchar* pDataEnd = pData + frame.GetPayloadSize();
    if (frame.GetPayloadSize() < 10) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\tFrame too short " << frame.GetPayloadSize());
        return false;
    }
    
    uchar bHeaderP = pData[0] & 0x04;
    uchar bHeaderV = pData[0] & 0x02;
    uint  nHeaderPLEN = ((pData[0] & 0x01) << 5) + ((pData[1] & 0xF8) >> 3);
    uint  nHeaderPEBITS = (pData[1] & 0x07);

    pData += 2;

//    PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\tDeencap\tRFC 2429 Header: P: "  << (headerP ? 1 : 0)
//                                           << " V: "     << (headerV ? 1 : 0)
//                                           << " PLEN: "  << (uint32_t) headerPLEN
//                                           << " PBITS: " << (uint32_t) headerPEBITS);

    if (bHeaderV)  {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\t We ignore the VRC");
        pData ++; // We ignore the VRC
    }
  
    if (nHeaderPLEN > 0) {
        if (pData + nHeaderPLEN > pDataEnd) {
            PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\tFrame too short (header)");
            return false;
        }
//      memcpy(_picHeader.ptr + 2, dataPtr, headerPLEN);
//      _picHeader.len = headerPLEN + 2;
//      _picHeader.pebits = headerPEBITS;
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\t nHeaderPLEN > 0 " << nHeaderPLEN);
        pData += nHeaderPLEN;
    }

    uint nRemBytes = pDataEnd - pData;

    if (_in.GetBufferSize() < _in.GetDataSize() + nRemBytes + 2 + H263_PADDING_SIZE) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\tFrame buffer small, buff size" << _in.GetBufferSize()
            << " bytes to frame at position " << _in.GetDataSize()
            << " bytes to write " << nRemBytes);
        return false;
    }

    uchar* pDst = (uchar*) _in.GetBufferPointer();
    uint nLen = _in.GetDataSize();

    if (bHeaderP) {
        memset(pDst+nLen,0,2);
        nLen += 2;
    }
    else {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\t not bHeaderP");
    }

    memcpy(pDst+nLen, pData, nRemBytes);
    _in.SetDataSize(nLen + nRemBytes);

    return true;
}

bool H263PDecoderContext::AddRTPFrameRFC2190(RTPFrame& frame)
{
    uint   nPayloadSize = frame.GetPayloadSize();
    if (nPayloadSize < 5) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "H263+\tFrame too short");
        return LostSync();
    }

    uchar* pData = frame.GetPayloadPtr();
    uchar* pDataEnd = pData + nPayloadSize;

    uchar sbit = (pData[0] >> 3) & 0x07;

    uchar mode = 0;
    uint nHeaderLen = 0;
    bool bIsIFrame = false;

  
    if ((pData[0] & 0x80) == 0) {                   // handle mode A frames
        bIsIFrame = (pData[1] & 0x10) == 0;
        nHeaderLen = 4;
        mode = 'A';

#if 0
        // sanity check data
        if (payloadLen < (hdrLen+3) ||
            (payload[hdrLen+0] != 0x00) ||
            (payload[hdrLen+1] != 0x00) ||
            ((payload[hdrLen+2] & 0x80) != 0x80)
        ) {
        return LostSync(requestIFrame, "Mode A packet not starting with GBSC");
        }
#endif
    }
    else if ((pData[0] & 0x40) == 0)                // handle mode B frames
    {
        if (nPayloadSize < 9)
            return LostSync();

        bIsIFrame = (pData[4] & 0x80) == 0;
        nHeaderLen = 8;
        mode = 'B';
    }
    else {                                          // handle mode C frames
        if (nPayloadSize < 13)
            return LostSync();
        bIsIFrame = (pData[4] & 0x80) == 0;
        nHeaderLen = 12;
        mode = 'C';
    }

//  if ebit and sbit do not add up, then we have lost sync

    if (((sbit + _nLastEbit) & 0x7) != 0)
        return LostSync();

    // keep ebit for next time
    _nLastEbit = pData[0] & 0x07;


    if (_in.GetBufferSize() < _in.GetDataSize() + nPayloadSize - nHeaderLen + 1 + H263_PADDING_SIZE) {
        PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Frame buffer small, buff size" << _in.GetBufferSize()
            << " bytes to frame at position " << _in.GetDataSize()
            << " bytes to write " << nPayloadSize - nHeaderLen + 1);
        return false;
    }

    pData +=  nHeaderLen;

    uchar* pDst = (uchar*) _in.GetBufferPointer();
    uint   nLen = _in.GetDataSize();

  // handle first partial byte
    if ((sbit != 0) && (nLen > 0)) {
        uchar mask = 0x0ff >> sbit;
        pDst[nLen-1] |= (*pData) & mask;
        ++ pData;
    }

    uint   nCopy = pDataEnd - pData;

    memcpy(pDst+nLen, pData, nCopy);
    _in.SetDataSize(nLen + nCopy);

    return true;
}


static void * create_decoder(const struct PluginCodec_Definition* codec)
{
    H263PDecoderContext* pDecoder = new H263PDecoderContext;
    if (pDecoder && pDecoder->IsValid())
        pDecoder->_bH263_Plus = _stricmp(codec->sourceFormat, h263Desc) != 0;
    else {
        delete pDecoder;
        pDecoder = NULL;
    }
    return pDecoder;
}

static void destroy_decoder(const struct PluginCodec_Definition * codec, void * _context)
{
  H263PDecoderContext * context = (H263PDecoderContext *)_context;

  delete context;
}

static int codec_decoder(const struct PluginCodec_Definition* , 
                                           void* _context,
                                     const void* from, 
                                       unsigned* fromLen,
                                           void* to, 
                                       unsigned* toLen,
                                   unsigned int* flag)
{
    H263PDecoderContext* context = (H263PDecoderContext*) _context;
    return context->DecodeFrames((const unsigned char*) from, *fromLen, (unsigned char*) to, *toLen, *flag);
}

static int decoder_get_output_data_size(const PluginCodec_Definition* codec, void* _context, const char *, void *, unsigned *)
{
	return RTP_MIN_HEADER_SIZE + sizeof(PluginCodec_Video_FrameHeader) + ((codec->parm.video.maxFrameWidth * codec->parm.video.maxFrameHeight * 3) / 2);
}

static int get_codec_options(const struct PluginCodec_Definition* codec, void*, const char*, void* parm, unsigned* parmLen)
{
  if (parmLen == NULL || parm == NULL || *parmLen != sizeof(struct PluginCodec_Option **))
    return 0;

  *(const void **)parm = codec->userData;
  *parmLen = 0;
  return 1;
}

static char* num2str(int num)
{
  char buf[20];
  sprintf(buf, "%i", num);
  return strdup(buf);
}

#define PMAX(a,b) ((a)>=(b)?(a):(b))
#define PMIN(a,b) ((a)<=(b)?(a):(b))

static void FindBoundingBox(const char * const * * parm, 
                                             int * mpi,
                                             int & minWidth,
                                             int & minHeight,
                                             int & maxWidth,
                                             int & maxHeight,
                                             int & frameTime,
                                             int & bitRate)
{ 
  // initialise the MPI values to disabled
  int i;
  for (i = 0; i < StdSizeCount; i++)
    mpi[i] = PLUGINCODEC_MPI_DISABLED;

  // following values will be set while scanning for options
  minWidth      = INT_MAX;
  minHeight     = INT_MAX;
  maxWidth      = 0;
  maxHeight     = 0;
  int rxMinWidth    = QCIF_WIDTH;
  int rxMinHeight   = QCIF_HEIGHT;
  int rxMaxWidth    = QCIF_WIDTH;
  int rxMaxHeight   = QCIF_HEIGHT;
  int frameRate     = 10;      // 10 fps
  int origFrameTime = 900;     // 10 fps in video RTP timestamps
  int maxBR = 0;
  int maxBitRate = 0;
  int targetBitRate = 0;

  // extract the MPI values set in the custom options, and find the min/max of them
  frameTime = 0;

  for (const char * const * option = *parm; *option != NULL; option += 2) {
    if (strcasecmp(option[0], "MaxBR") == 0)
      maxBR = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_MAX_BIT_RATE) == 0)
      maxBitRate = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_TARGET_BIT_RATE) == 0)
      targetBitRate = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_MIN_RX_FRAME_WIDTH) == 0)
      rxMinWidth  = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_MIN_RX_FRAME_HEIGHT) == 0)
      rxMinHeight = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_MAX_RX_FRAME_WIDTH) == 0)
      rxMaxWidth  = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_MAX_RX_FRAME_HEIGHT) == 0)
      rxMaxHeight = atoi(option[1]);
    else if (strcasecmp(option[0], PLUGINCODEC_OPTION_FRAME_TIME) == 0)
      origFrameTime = atoi(option[1]);
    else {
      for (i = 0; i < StdSizeCount; i++) {
        if (strcasecmp(option[0], StandardVideoSizes[i].optionName) == 0) {
          mpi[i] = atoi(option[1]);
          if (mpi[i] != PLUGINCODEC_MPI_DISABLED) {
            int thisTime = 3003*mpi[i];
            if (minWidth > StandardVideoSizes[i].width)
              minWidth = StandardVideoSizes[i].width;
            if (minHeight > StandardVideoSizes[i].height)
              minHeight = StandardVideoSizes[i].height;
            if (maxWidth < StandardVideoSizes[i].width)
              maxWidth = StandardVideoSizes[i].width;
            if (maxHeight < StandardVideoSizes[i].height)
              maxHeight = StandardVideoSizes[i].height;
            if (thisTime > frameTime)
              frameTime = thisTime;
          }
        }
      }
    }
  }

  // if no MPIs specified, then the spec says to use QCIF
  if (frameTime == 0) {
    int ft;
    if (frameRate != 0) 
      ft = 90000 / frameRate;
    else 
      ft = origFrameTime;
    mpi[1] = (ft + 1502) / 3003;
    minWidth  = maxWidth  = QCIF_WIDTH;
    minHeight = maxHeight = QCIF_HEIGHT;
  }

  // find the smallest MPI size that is larger than the min frame size
  for (i = 0; i < StdSizeCount; i++) {
    if (StandardVideoSizes[i].width >= rxMinWidth && StandardVideoSizes[i].height >= rxMinHeight) {
      rxMinWidth = StandardVideoSizes[i].width;
      rxMinHeight = StandardVideoSizes[i].height;
      break;
    }
  }

  // find the largest MPI size that is smaller than the max frame size
  for (i = StdSizeCount; i >= 0; i--) {
    if (StandardVideoSizes[i].width <= rxMaxWidth && StandardVideoSizes[i].height <= rxMaxHeight) {
      rxMaxWidth  = StandardVideoSizes[i].width;
      rxMaxHeight = StandardVideoSizes[i].height;
      break;
    }
  }

  // the final min/max is the smallest bounding box that will enclose both the MPI information and the min/max information
  minWidth  = PMAX(rxMinWidth, minWidth);
  maxWidth  = PMIN(rxMaxWidth, maxWidth);
  minHeight = PMAX(rxMinHeight, minHeight);
  maxHeight = PMIN(rxMaxHeight, maxHeight);

  // turn off any MPI that are outside the final bounding box
  for (i = 0; i < StdSizeCount; i++) {
    if (StandardVideoSizes[i].width < minWidth || 
        StandardVideoSizes[i].width > maxWidth ||
        StandardVideoSizes[i].height < minHeight || 
        StandardVideoSizes[i].height > maxHeight)
     mpi[i] = PLUGINCODEC_MPI_DISABLED;
  }

  // find an appropriate max bit rate
  bitRate = 0;
  if (maxBR == 0)
    bitRate = maxBitRate;
  else if (maxBitRate == 0)
    bitRate = maxBR * 100;
  else
    bitRate = PMIN(maxBR * 100, maxBitRate);
}

/* Convert the custom options for the codec to normalised options.
   For H.261 the custom options are "QCIF MPI" and "CIF MPI" which will
   restrict the min/max width/height and maximum frame rate.
 */
static int to_normalised_options(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen)
{
  if (parmLen == NULL || parm == NULL || *parmLen != sizeof(char ***))
    return 0;

  // find bounding box enclosing all MPI values
  int mpi[StdSizeCount];
  int minWidth, minHeight, maxHeight, maxWidth, frameTime, bitRate;
  FindBoundingBox((const char * const * *)parm, mpi, minWidth, minHeight, maxWidth, maxHeight, frameTime, bitRate);

  char ** options = (char **)calloc(16+(StdSizeCount*2)+2, sizeof(char *));
  *(char ***)parm = options;
  if (options == NULL)
    return 0;

  options[ 0] = strdup(PLUGINCODEC_OPTION_MIN_RX_FRAME_WIDTH);
  options[ 1] = num2str(minWidth);
  options[ 2] = strdup(PLUGINCODEC_OPTION_MIN_RX_FRAME_HEIGHT);
  options[ 3] = num2str(minHeight);
  options[ 4] = strdup(PLUGINCODEC_OPTION_MAX_RX_FRAME_WIDTH);
  options[ 5] = num2str(maxWidth);
  options[ 6] = strdup(PLUGINCODEC_OPTION_MAX_RX_FRAME_HEIGHT);
  options[ 7] = num2str(maxHeight);
  options[ 8] = strdup(PLUGINCODEC_OPTION_FRAME_TIME);
  options[ 9] = num2str(frameTime);
  options[10] = strdup(PLUGINCODEC_OPTION_MAX_BIT_RATE);
  options[11] = num2str(bitRate);
  options[12] = strdup(PLUGINCODEC_OPTION_TARGET_BIT_RATE);
  options[13] = num2str(bitRate);
  options[14] = strdup("MaxBR");
  options[15] = num2str((bitRate+50)/100);
  for (int i = 0; i < StdSizeCount; i++) {
    options[16+i*2] = strdup(StandardVideoSizes[i].optionName);
    options[16+i*2+1] = num2str(mpi[i]);
  }

  return 1;
}


/* Convert the normalised options to the codec custom options.
   For H.261 the custom options are "QCIF MPI" and "CIF MPI" which are
   set according to the min/max width/height and frame time.
 */
static int to_customised_options(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen)
{
  if (parmLen == NULL || parm == NULL || *parmLen != sizeof(char ***))
    return 0;

  // find bounding box enclosing all MPI values
  int mpi[5];
  int minWidth, minHeight, maxHeight, maxWidth, frameTime, bitRate;
  FindBoundingBox((const char * const * *)parm, mpi, minWidth, minHeight, maxWidth, maxHeight, frameTime, bitRate);

  char ** options = (char **)calloc(14+5*2+2, sizeof(char *));
  *(char ***)parm = options;
  if (options == NULL)
    return 0;

  options[ 0] = strdup(PLUGINCODEC_OPTION_MIN_RX_FRAME_WIDTH);
  options[ 1] = num2str(minWidth);
  options[ 2] = strdup(PLUGINCODEC_OPTION_MIN_RX_FRAME_HEIGHT);
  options[ 3] = num2str(minHeight);
  options[ 4] = strdup(PLUGINCODEC_OPTION_MAX_RX_FRAME_WIDTH);
  options[ 5] = num2str(maxWidth);
  options[ 6] = strdup(PLUGINCODEC_OPTION_MAX_RX_FRAME_HEIGHT);
  options[ 7] = num2str(maxHeight);
  options[ 8] = strdup(PLUGINCODEC_OPTION_MAX_BIT_RATE);
  options[ 9] = num2str(bitRate);
  options[10] = strdup(PLUGINCODEC_OPTION_TARGET_BIT_RATE);
  options[11] = num2str(bitRate);
  options[12] = strdup("MaxBR");
  options[13] = num2str((bitRate+50)/100);
  for (int i = 0; i < StdSizeCount; i++) {
    options[14+i*2] = strdup(StandardVideoSizes[i].optionName);
    options[14+i*2+1] = num2str(mpi[i]);
  }

  return 1;
}


static int free_codec_options(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen)
{
  if (parmLen == NULL || parm == NULL || *parmLen != sizeof(char ***))
    return 0;

  char ** strings = (char **) parm;
  for (char ** string = strings; *string != NULL; string++)
    free(*string);
  free(strings);
  return 1;
}


static int valid_for_protocol(const struct PluginCodec_Definition *, void *, const char *, void * parm, unsigned * parmLen)
{
  if (parmLen == NULL || parm == NULL || *parmLen != sizeof(char *))
    return 0;

  return (strcasecmp((const char *)parm, "h.323") == 0 ||
          strcasecmp((const char *)parm, "h323") == 0) ? 1 : \
		  (strcasecmp((const char *)parm, "sip") == 0) ? 1 : 0;
}

/////////////////////////////////////////////////////////////////////////////

const uchar* H263_FindStartCodePtr(const uchar* p, unsigned nLen)
{
    const uchar* pEnd = p + nLen;
    for (pEnd -= 3; p < pEnd; ++p)
        if (p[0] == 0 && p[1] == 0) {
			uchar pCode = p[2];
			if ((pCode & 0xFC) == 0x80)				
				return p;
			else if (pCode == 0x80)
				return p;
		}
    return NULL;
}

uint GetBits(const uchar* p, uint start, uint n)
{
    p += start >> 3;
    start &= 7;
    uint nRet = (p[0] << 24) | (p[1]<<16) | (p[2]<<8) | p[3];
    return (nRet << start) >> (32-n);
	
}

bool H263_CheckIPicture(const uchar* p, uint nLen)
{
    return true;
    const uchar* pEnd = p + nLen;
	
    if ((p = H263_FindStartCodePtr(p, nLen)) == NULL)
        return false;
	
    if (p+4 >= pEnd)
        return false;

//    return (p[4] & 2) == 0;
    if ((p[3] & 3) != 2)
        return false;
	
    uchar source_format = (p[4]>>2) & 7;
    if (source_format == 0 || source_format == 6) 
        return false;
	
    uint picture_coding_type;
    uint i = 38;
	
    if (source_format == 7) {
        uint ufep = GetBits(p,38,3);
        i += 3;
        if (ufep) 
            i += 18;
        uint code  = GetBits(p,i,9);
        picture_coding_type = code >> 6;
    }
    else {
        picture_coding_type = GetBits(p,i,1);
    }
	
    return picture_coding_type == 0;
}

/////////////////////////////////////////////////////////////////////////////

extern "C" {

#include "pluginActivation2.h"
	
// YK This macro returns plugin version 1, we need 5
// PLUGIN_CODEC_IMPLEMENT(DINSK_H263)
	
unsigned int Opal_StaticCodec_DINSK_H263_GetAPIVersion()
{ return PLUGIN_CODEC_VERSION_OPTIONS; }

#if SB_REMOVE_CODEC_DLL

PLUGIN_CODEC_DLL_API int PWLibPlugin_GetAPIVersion()
{ return PLUGIN_CODEC_VERSION_FIRST; } 
#endif

PLUGIN_CODEC_DLL_API struct PluginCodec_Definition * PLUGIN_CODEC_GET_CODEC_FN(unsigned * count, unsigned /*version*/);

struct PluginCodec_Definition * Opal_StaticCodec_DINSK_H263_GetCodecs(unsigned * p1, unsigned p2)
{ return PLUGIN_CODEC_GET_CODEC_FN(p1,p2); } 
	
PLUGIN_CODEC_DLL_API struct PluginCodec_Definition * PLUGIN_CODEC_GET_CODEC_FN(unsigned * count, unsigned version)
{
#if PTRACING && !(defined(_WIN32_WCE) && defined(NDEBUG))
    Trace::SetLevel(0);
#endif

   // check version numbers etc
    if (version < PLUGIN_CODEC_VERSION_OPTIONS) {
      *count = 0;
      return NULL;
    }

    *count = sizeof(h263CodecDefn) / sizeof(struct PluginCodec_Definition);
    PTRACE(h263TraceLevel, DINSK_CODEC_LOG, "Codec\tEnabled");
    return h263CodecDefn;
}

};

