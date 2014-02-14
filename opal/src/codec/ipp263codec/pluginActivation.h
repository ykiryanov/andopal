#pragma once 

#include <codec/opalplugin.h>
#include "IActivation.h"

#define PLUGIN_CODEC_GET_INFORMATION_FN     BonePlugin_GetInformation
#define OpalCodecPlugin_GetInformation_STR "BonePlugin_GetInformation"

#define PLUGIN_CODEC_ACTIVATE_FN     BonePlugin_Activate
#define PLUGIN_CODEC_ACTIVATE_FN_STR "BonePlugin_Activate"

/////////////////////////////////////////////////////////////////////////////
struct H263PluginCodec_Description {
  unsigned int version;                     // codec structure version

  // start of version 1 fields
  struct H263PluginCodec_information * info;   // license information

  unsigned int flags;					// activation state
  const char * lastActivationError;           // source code author
};

extern "C" {
	
ActivationState GetH263PluginActivationState();
int StartH263Activation(int dwSize, char * szKey);

////////////////////////////////////////////////////////////////////////////
// internal functionality

ActivationState RestoreH263ActivationState();
void SaveH263ActivationState();

};