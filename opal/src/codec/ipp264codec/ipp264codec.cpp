/*
 * H.264 Plugin codec for Bone
 *
 * Copyright (C) 2008-2012 Dinsk, LLP, All Rights Reserved
 *
 * The Initial Developer of the Original Code is Dinsk, LLP
 *
 * Contributor(s): Sergey Bezruchkin, sergey@dinsk.net and Yuri Kiryanov, yuri@dinsk.net
 */

#ifndef PLUGIN_CODEC_DLL_EXPORTS
#include <plugin_config.h>
#endif

#include <codec/opalplugin.h>
#include "h264mf_inc.cxx"

#include "h264.h"

#ifndef PLUGINCODEC_CONTROL_LOG_FUNCTION_DEF
PLUGINCODEC_CONTROL_LOG_FUNCTION_DEF
#endif

///////////////////////////////////////////////////////////////////////////////

static const char D264Description[] = "H.264-DINSK";     // Human readable description of codec
static const char FormatNameH323[] = "H.264";               // OpalMediaFormat name string to generate
static const char FormatNameSIP0[] = "H.264-0";             // OpalMediaFormat name string to generate
static const char FormatNameSIP1[] = "H.264-1";             // OpalMediaFormat name string to generate
static const char D264PayloadName[] = "h264";                 // RTP payload name (IANA approved)

static const char YUV420PFormatName[] = "YUV420P";          // Raw media format

static const char NamePacketizationMode[] = "Packetization Mode";

long ActivationMonitor::s_nCodecObjectId = 0L;
IActivation*    ActivationMonitor::s_pActivation = NULL;

int h264TraceLevel = -1;

PLUGINCODEC_LICENSE(
  "Sergey Bezruchkin\n"
  "Yuri Kiryanov, Dinsk LLP.",                                  // source code author
  "1.0",                                                        // source code version
  "developer@dinsk.net",                                        // source code email
  "http://www.dinsk.net",                                       // source code URL
  "Copyright (C) 2009-2013 by Dinsk, LLP, All Rights Reserved", // source code copyright
  "Proprietary License",                                        // source code license
  PluginCodec_License_RoyaltiesRequired,                        // source code license
  
  D264Description,                                              // codec description
  "Dinsk, LLP",                                                 // codec author
  "1.0",                                                        // codec version
  "developer@dinsk.net",                                        // codec email
  "http://www.dinsk.net",                                       // codec URL
  "Copyright (C) 2009-2012 by Dinsk, LLP, All Rights Reserved", // codec copyright information
  "Royalities Required",                                        //
  PluginCodec_License_RoyaltiesRequired                         // codec license code
);

///////////////////////////////////////////////////////////////////////////////

static struct PluginCodec_Option const Profile =
{
  PluginCodec_EnumOption,             // Option type
  ProfileName,                        // User visible name
  false,                              // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  DefaultProfileStr,                  // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  // Enum values, single string of value separated by colons
  H264_PROFILE_STR_BASELINE ":"
  H264_PROFILE_STR_MAIN     ":"
  H264_PROFILE_STR_EXTENDED ":"
  H264_PROFILE_STR_HIGH
};                                  

static struct PluginCodec_Option const HiProfile =
{
  PluginCodec_EnumOption,             // Option type
  ProfileName,                        // User visible name
  false,                              // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  H264_PROFILE_STR_HIGH,              // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  // Enum values, single string of value separated by colons
  H264_PROFILE_STR_HIGH
};                                  

static struct PluginCodec_Option const Level =
{
  PluginCodec_EnumOption,             // Option type
  LevelName,                          // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  DefaultLevelStr,                    // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  // Enum values, single string of value separated by colons
  H264_LEVEL_STR_1   ":"
  H264_LEVEL_STR_1_b ":" 
  H264_LEVEL_STR_1_1 ":"
  H264_LEVEL_STR_1_2 ":"
  H264_LEVEL_STR_1_3 ":"
  H264_LEVEL_STR_2   ":"
  H264_LEVEL_STR_2_1 ":"
  H264_LEVEL_STR_2_2 ":"
  H264_LEVEL_STR_3   ":"
  H264_LEVEL_STR_3_1 ":"
  H264_LEVEL_STR_3_2 ":"
  H264_LEVEL_STR_4   ":"
  H264_LEVEL_STR_4_1 ":"
  H264_LEVEL_STR_4_2 ":"
  H264_LEVEL_STR_5   ":"
  H264_LEVEL_STR_5_1
};

static struct PluginCodec_Option const HiH241Profiles =
{
  PluginCodec_IntegerOption,          // Option type
  H241ProfilesName,                   // User visible name
  true,                               // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  STRINGIZE(8),                       // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_PROFILES,                      // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  "127"                               // Maximum value
};

static struct PluginCodec_Option const H241Profiles =
{
  PluginCodec_IntegerOption,          // Option type
  H241ProfilesName,                   // User visible name
  true,                               // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  STRINGIZE(DefaultProfileH241),      // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_PROFILES,                      // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  "127"                               // Maximum value
};

static struct PluginCodec_Option const H241Level =
{
  PluginCodec_IntegerOption,          // Option type
  H241LevelName,                      // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  STRINGIZE(DefaultLevelH241),        // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_LEVEL,                         // H.245 generic capability code and bit mask
  "15",                               // Minimum value
  "113"                               // Maximum value
};

static struct PluginCodec_Option const SDPProfileAndLevel =
{
  PluginCodec_OctetsOption,           // Option type
  SDPProfileAndLevelName,             // User visible name
  true,                               // User Read/Only flag
  PluginCodec_NoMerge,                // Merge mode
  DefaultSDPProfileAndLevel,          // Initial value
  SDPProfileAndLevelFMTPName,         // FMTP option name
  SDPProfileAndLevelFMTPDflt          // FMTP default value (as per RFC)
};

static struct PluginCodec_Option const MaxMBPS_SDP =
{
  PluginCodec_IntegerOption,          // Option type
  MaxMBPS_SDP_Name,                   // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  MaxMBPS_FMTPName,                   // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "983040"                            // Maximum value
};

static struct PluginCodec_Option const MaxMBPS_H241 =
{
  PluginCodec_IntegerOption,          // Option type
  MaxMBPS_H241_Name,                  // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_CustomMaxMBPS,                 // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "1966"                              // Maximum value
#ifdef PLUGIN_CODEC_VERSION_H245_DEF_GEN_PARAM
  ,
  NULL,
  NULL,
  "0"                                 // H.245 default value
#endif
};

static struct PluginCodec_Option const MaxSMBPS_SDP =
{
  PluginCodec_IntegerOption,          // Option type
  MaxSMBPS_SDP_Name,                  // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  MaxSMBPS_FMTPName,                  // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "983040"                            // Maximum value
};

static struct PluginCodec_Option const MaxSMBPS_H241 =
{
  PluginCodec_IntegerOption,          // Option type
  MaxSMBPS_H241_Name,                 // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_CustomMaxSMBPS,                // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "1966"                              // Maximum value
#ifdef PLUGIN_CODEC_VERSION_H245_DEF_GEN_PARAM
  ,
  NULL,
  NULL,
  "0"                                 // H.245 default value
#endif
};

static struct PluginCodec_Option const MaxFS_SDP =
{
  PluginCodec_IntegerOption,          // Option type
  MaxFS_SDP_Name,                     // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  MaxFS_FMTPName,                     // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "36864"                             // Maximum value
};

static struct PluginCodec_Option const MaxFS_H241 =
{
  PluginCodec_IntegerOption,          // Option type
  MaxFS_H241_Name,                    // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_CustomMaxFS,                   // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "144"                               // Maximum value
#ifdef PLUGIN_CODEC_VERSION_H245_DEF_GEN_PARAM
  ,
  NULL,
  NULL,
  "0"                                 // H.245 default value
#endif
};

static struct PluginCodec_Option const MaxBR_SDP =
{
  PluginCodec_IntegerOption,          // Option type
  MaxBR_SDP_Name,                     // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  MaxBR_FMTPName,                     // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "240000"                            // Maximum value
};

static struct PluginCodec_Option const MaxBR_H241 =
{
  PluginCodec_IntegerOption,          // Option type
  MaxBR_H241_Name,                    // User visible name
  true,                               // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  "0",                                // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  H241_CustomMaxBRandCPB,             // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "9600"                              // Maximum value
#ifdef PLUGIN_CODEC_VERSION_H245_DEF_GEN_PARAM
  ,
  NULL,
  NULL,
  "0"                                 // H.245 default value
#endif
};

static struct PluginCodec_Option const MaxNaluSize =
{
  PluginCodec_IntegerOption,          // Option type
  MaxNALUSizeName,                    // User visible name
  false,                              // User Read/Only flag
  PluginCodec_MinMerge,               // Merge mode
  STRINGIZE(H241_MAX_NALU_SIZE),      // Initial value
  MaxNALUSizeFMTPName,                // FMTP option name
  STRINGIZE(H241_MAX_NALU_SIZE),      // FMTP default value
  H241_Max_NAL_unit_size,             // H.245 generic capability code and bit mask
  "396",                              // Minimum value - uncompressed macro block size 16*16*3+12
  "65535"                             // Maximum value
#ifdef PLUGIN_CODEC_VERSION_H245_DEF_GEN_PARAM
  ,
  NULL,
  NULL,
  STRINGIZE(H241_MAX_NALU_SIZE)       // H.245 default value
#endif
};

static struct PluginCodec_Option const MediaPacketizationsH323_0 =
{
  PluginCodec_StringOption,           // Option type
  PLUGINCODEC_MEDIA_PACKETIZATIONS,   // User visible name
  false,                              // User Read/Only flag
  PluginCodec_IntersectionMerge,      // Merge mode
  OpalPluginCodec_Identifer_H264_Aligned // Initial value
};

static struct PluginCodec_Option const MediaPacketizationsH323_1 =
{
  PluginCodec_StringOption,           // Option type
  PLUGINCODEC_MEDIA_PACKETIZATIONS,   // User visible name
  false,                              // User Read/Only flag
  PluginCodec_IntersectionMerge,      // Merge mode
  OpalPluginCodec_Identifer_H264_Aligned "," // Initial value
  OpalPluginCodec_Identifer_H264_NonInterleaved
};

static struct PluginCodec_Option const PacketizationModeSDP_0 =
{
  PluginCodec_IntegerOption,          // Option type
  PacketizationModeName,              // User visible name
  true,                               // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  "0",                                // Initial value
  PacketizationFMTPName,              // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "2"                                 // Maximum value
};

static struct PluginCodec_Option const PacketizationModeSDP_1 =
{
  PluginCodec_IntegerOption,          // Option type
  PacketizationModeName,              // User visible name
  true,                               // User Read/Only flag
  PluginCodec_EqualMerge,             // Merge mode
  "1",                                // Initial value
  PacketizationFMTPName,              // FMTP option name
  "0",                                // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "0",                                // Minimum value
  "2"                                 // Maximum value
};

static struct PluginCodec_Option const TemporalSpatialTradeOff =
{
  PluginCodec_IntegerOption,          // Option type
  PLUGINCODEC_OPTION_TEMPORAL_SPATIAL_TRADE_OFF, // User visible name
  false,                              // User Read/Only flag
  PluginCodec_AlwaysMerge,            // Merge mode
  "31",                               // Initial value
  NULL,                               // FMTP option name
  NULL,                               // FMTP default value
  0,                                  // H.245 generic capability code and bit mask
  "1",                                // Minimum value
  "31"                                // Maximum value
};

static struct PluginCodec_Option const SendAccessUnitDelimiters =
{
  PluginCodec_BoolOption,                         // Option type
  "Send Access Unit Delimiters",                  // User visible name
  false,                                          // User Read/Only flag
  PluginCodec_AndMerge,                           // Merge mode
  STRINGIZE(DefaultSendAccessUnitDelimiters)      // Initial value
};

static struct PluginCodec_Option const * const MyOptionTable_High[] = {
  &HiProfile,
  &Level,
  &HiH241Profiles,
  &H241Level,
  &SDPProfileAndLevel,
  &MaxMBPS_H241,
  &MaxMBPS_SDP,
  &MaxSMBPS_H241,
  &MaxSMBPS_SDP,
  &MaxFS_H241,
  &MaxFS_SDP,
  &MaxBR_H241,
  &MaxBR_SDP,
  &MaxNaluSize,
  &TemporalSpatialTradeOff,
  &SendAccessUnitDelimiters,
  &PacketizationModeSDP_1,
  &MediaPacketizationsH323_1,  // Note: must be last entry
  NULL
};

static struct PluginCodec_Option const * const MyOptionTable_0[] = {
  &Profile,
  &Level,
  &H241Profiles,
  &H241Level,
  &SDPProfileAndLevel,
  &MaxMBPS_H241,
  &MaxMBPS_SDP,
  &MaxSMBPS_H241,
  &MaxSMBPS_SDP,
  &MaxFS_H241,
  &MaxFS_SDP,
  &MaxBR_H241,
  &MaxBR_SDP,
  &MaxNaluSize,
  &TemporalSpatialTradeOff,
  &SendAccessUnitDelimiters,
  &PacketizationModeSDP_0,
  &MediaPacketizationsH323_0,  // Note: must be last entry
  NULL
};

static struct PluginCodec_Option const * const MyOptionTable_1[] = {
  &Profile,
  &Level,
  &H241Profiles,
  &H241Level,
  &SDPProfileAndLevel,
  &MaxMBPS_H241,
  &MaxMBPS_SDP,
  &MaxSMBPS_H241,
  &MaxSMBPS_SDP,
  &MaxFS_H241,
  &MaxFS_SDP,
  &MaxBR_H241,
  &MaxBR_SDP,
  &MaxNaluSize,
  &TemporalSpatialTradeOff,
  &SendAccessUnitDelimiters,
  &PacketizationModeSDP_1,
  &MediaPacketizationsH323_1,  // Note: must be last entry
  NULL
};


static struct PluginCodec_H323GenericCodecData MyH323GenericData = {
  OpalPluginCodec_Identifer_H264_Generic
};

#ifndef BONEPLAYER
///////////////////////////////////////////////////////////////////////////////

bool H264Encoder::SetOption(const char * optionName, const char * optionValue)
{
    if (strcasecmp(optionName, PLUGINCODEC_OPTION_FRAME_WIDTH) == 0)
        return SetOptionUnsigned(_frameWidth, optionValue, 16, BoneMaxWidth);
    
    if (strcasecmp(optionName, PLUGINCODEC_OPTION_FRAME_HEIGHT) == 0)
        return SetOptionUnsigned(_frameHeight, optionValue, 16, BoneMaxHeight);
    
    if (strcasecmp(optionName, PLUGINCODEC_OPTION_FRAME_TIME) == 0) {
        unsigned frameTime = BoneClockRate/_frameRate;
        if (!SetOptionUnsigned(frameTime, optionValue, BoneClockRate/BoneMaxFrameRate, BoneClockRate))
            return false;
        _frameRate = BoneClockRate/frameTime;
        return true;
    }
    
    if (strcasecmp(optionName, PLUGINCODEC_OPTION_TARGET_BIT_RATE) == 0)
        return SetOptionUnsigned(_bitRate, optionValue, 1000);
    /*
     if (strcasecmp(optionName, PLUGINCODEC_OPTION_MAX_TX_PACKET_SIZE) == 0)
     return SetOptionUnsigned(_maxRTPSize, optionValue, 256, 8192);
     
     if (strcasecmp(optionName, MaxNaluSize.m_name) == 0)
     return SetOptionUnsigned(_maxNALUSize, optionValue, 256, 8192);
     */
    if (STRCMPI(optionName, PLUGINCODEC_OPTION_TEMPORAL_SPATIAL_TRADE_OFF) == 0)
        return SetOptionUnsigned(_tsto, optionValue, 1, H264_MAX_TSTO);
    
    if (strcasecmp(optionName, PLUGINCODEC_OPTION_TX_KEY_FRAME_PERIOD) == 0)
        return SetOptionUnsigned(_keyFramePeriod, optionValue, 0);
    
    if (strcasecmp(optionName, H241Level.m_name) == 0) {
        size_t i;
        for (i = 0; i < sizeof(LevelInfo)/sizeof(LevelInfo[0])-1; i++) {
            if ((unsigned)_level <= LevelInfo[i].m_H264)
                break;
        }
        unsigned h241level = LevelInfo[i].m_H241;
        
        if (!SetOptionUnsigned(h241level, optionValue, 15, 133))
            return false;
        
        for (i = 0; i < sizeof(LevelInfo)/sizeof(LevelInfo[0])-1; i++) {
            if (h241level <= LevelInfo[i].m_H241)
                break;
        }
        _level = LevelInfo[i].m_H264;
        return true;
    }
    
    if (
#ifdef PLUGIN_CODEC_VERSION_INTERSECT
        strcasecmp(optionName, PLUGINCODEC_MEDIA_PACKETIZATIONS) == 0 ||
#endif
        strcasecmp(optionName, PLUGINCODEC_MEDIA_PACKETIZATION) == 0)
    {
        if (strstr(optionValue, OpalPluginCodec_Identifer_H264_Interleaved) != NULL)
            return SetPacketisationMode(2);
        if (strstr(optionValue, OpalPluginCodec_Identifer_H264_NonInterleaved) != NULL)
            return SetPacketisationMode(1);
        if (strstr(optionValue, OpalPluginCodec_Identifer_H264_Aligned) != NULL ||
            strstr(optionValue, OpalPluginCodec_Identifer_H264_Generic) != NULL)
            return SetPacketisationMode(0);
        PTRACE(2, D264_LOG, "Unknown packetisation mode: \"" << optionValue << '"');
        return false; // Unknown/unsupported media packetization
    }
    
    if (strcasecmp(optionName, NamePacketizationMode) == 0)
        return SetPacketisationMode(atoi(optionValue));
    
    // Base class sets bit rate and frame time
    return PluginCodec::SetOption(optionName, optionValue);
}

bool H264Encoder::SetPacketisationMode(unsigned mode)
{
    PTRACE(4, D264_LOG, "Setting NALU " << (mode == 0 ? "aligned" : "fragmentation") << " mode.");
    
    if (mode > 2) // Or 3 if support interleaved mode
        return false; // Unknown/unsupported packetization mode
    
    if (_packetisationMode != mode) {
        _packetisationMode = mode;
        m_optionsSame = false;
    }
    
    return true;
}

///////////////////////////////////////////////////////////////////////////////

#endif // !BONEPLAYER

///////////////////////////////////////////////////////////////////////////////

class H264_PluginMediaFormat : public PluginCodec_VideoFormat<D264>
{
public:
  typedef PluginCodec_VideoFormat<D264> BaseClass;

  H264_PluginMediaFormat(const char * formatName, OptionsTable options)
    : BaseClass(formatName, H264EncodingName, D264Description, LevelInfo[sizeof(LevelInfo)/sizeof(LevelInfo[0])-1].m_MaxBitRate, options)
  {
    m_h323CapabilityType = PluginCodec_H323Codec_generic;
    m_h323CapabilityData = &MyH323GenericData;
  }


  virtual bool ToNormalised(OptionMap & original, OptionMap & changed)
  {
    return MyToNormalised(original, changed);
  }


  virtual bool ToCustomised(OptionMap & original, OptionMap & changed)
  {
    return MyToCustomised(original, changed);
  }
}; 

/* SIP requires two completely independent media formats for packetisation
   modes zero and one. */
static H264_PluginMediaFormat MyMediaFormatInfo_Mode0(H264_Mode0_FormatName, MyOptionTable_0);
static H264_PluginMediaFormat MyMediaFormatInfo_Mode1(H264_Mode1_FormatName, MyOptionTable_1);
static H264_PluginMediaFormat MyMediaFormatInfo_High (H264_High_FormatName,  MyOptionTable_High);

///////////////////////////////////////////////////////////////////////////////

#ifndef BONEPLAYER

///////////////////////////////////////////////////////////////////////////////

static struct PluginCodec_Definition CodecDefinition[] =
{
  PLUGINCODEC_VIDEO_CODEC_CXX(MyMediaFormatInfo_Mode0, H264Encoder, H264Decoder),
  PLUGINCODEC_VIDEO_CODEC_CXX(MyMediaFormatInfo_Mode1, H264Encoder, H264Decoder),
  PLUGINCODEC_VIDEO_CODEC_CXX(MyMediaFormatInfo_High,  H264Encoder, H264Decoder)
};

///////////////////////////////////////////////////////////////////////////////

#else

static struct PluginCodec_Definition CodecDefinition[] =
{
    PLUGINCODEC_VIDEO_CODEC_CXX(MyMediaFormatInfo_Mode0, H264Decoder, H264Decoder),
    PLUGINCODEC_VIDEO_CODEC_CXX(MyMediaFormatInfo_Mode1, H264Decoder, H264Decoder),
    PLUGINCODEC_VIDEO_CODEC_CXX(MyMediaFormatInfo_High,  H264Decoder, H264Decoder)
};

#endif // !BONEPLAYER

///////////////////////////////////////////////////////////////////////////////

// PLUGIN_CODEC_IMPLEMENT_CXX(D264, CodecDefinition);


/////////////////////////////////////////////////////////////////////////////

static struct PluginCodec_Description gPluginDescr =
{
    1,     // same as plugin version
    &MyLicenseInfo,                       //
    (int) ACTIVATION_UNREGISTERED
};


extern "C"
{
    // PLUGIN_CODEC_IMPLEMENT(D264)
    unsigned int Opal_StaticCodec_D264_GetAPIVersion()
    { return PLUGIN_CODEC_VERSION_OPTIONS; }
    
    const struct PluginCodec_Definition * Opal_StaticCodec_D264_GetCodecs(unsigned * count, unsigned version)
    {
        if (version < PLUGIN_CODEC_VERSION_OPTIONS) {
            *count = 0;
            PTRACE(1, D264_LOG, "Codec\tDisabled - plugin version mismatch");
            return NULL;
        }

        PluginCodec_LogFunctionInstance = NULL;
        
        *count = sizeof(CodecDefinition)/sizeof(struct PluginCodec_Definition);
        return CodecDefinition;
    }
    
    /////////////////////////////////////////////////////////////////////////////
    
#ifndef BONELIB
	PLUGIN_CODEC_DLL_API struct PluginCodec_Description* BoneD264Plugin_GetInformation()
#else
	struct PluginCodec_Description* GetH264PluginInformation()
#endif
	{
	    return &gPluginDescr;
    }
    
#ifndef BONELIB
	PLUGIN_CODEC_DLL_API int BoneD264Plugin_Activate(IActivation* pActivation)
#else
	int ActivateH264Plugin(IActivation* pActivation)
#endif
	{
        ActivationMonitor::SetActivationInterface(pActivation);
		return 1;
	}
};
