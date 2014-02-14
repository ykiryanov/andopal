#pragma once 

#include "stdafx.h"
#include "pluginActivation.h"
#include "IActivation.h" 

static struct PluginCodec_Description gPluginDescr = 
{ 
  PLUGIN_CODEC_VERSION,               // same as plugin version
  &licenseInfo,                       //
#ifdef H263_PLUGIN_ACTIVATION
  (int)ACTIVATION_UNREGISTERED
#else
  (int)ACTIVATION_REGISTERED
#endif	
};

extern "C" {

#ifndef BONELIB
	PLUGIN_CODEC_DLL_API struct PluginCodec_Description * PLUGIN_CODEC_GET_INFORMATION_FN()
#else
	struct PluginCodec_Description * GetH263PluginInformation()
#endif	
	{
	  //gPluginDescr.flags = GetPluginActivationState();
	  return &gPluginDescr;
    }

#ifndef BONELIB
	PLUGIN_CODEC_DLL_API int PLUGIN_CODEC_ACTIVATE_FN(IActivation *pActivation)
#else
	int ActivateH263Plugin(IActivation *pActivation)
#endif	
	{
#ifdef H263_PLUGIN_ACTIVATION
		gph263Activation = pActivation;
#endif
		return 1;
	}
};
