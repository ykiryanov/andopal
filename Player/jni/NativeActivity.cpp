#include <ptlib.h>
#include <ptlib_config.h>
#include <opal.h>
#include <player/codectest.h>
#include <android/log.h>

#include <jni.h>

#include "NativeActivity.h"

static OpalHandle hOPAL = NULL;
static char * CurrentCallToken = NULL;
static char * HeldCallToken = NULL;
static bool initialized = false;

extern "C" {
void opalInitialize() {

	static const char OPALOptions[] = OPAL_PREFIX_ALL; // " TraceLevel=4 TraceFile=" TRACE_FILE " TraceAppend";

	unsigned version = OPAL_C_API_VERSION;
	if(hOPAL == NULL)
		hOPAL = OpalInitialise(&version, OPALOptions);

	if(hOPAL == NULL) {
		LOGE("Could not initialise OPAL\n");
	}
	else
		LOGI("OPAL version %d\n", version);

//	// Register codecs
//	PFactory<PPluginModuleManager>::Worker<OpalPluginCodecManager>* pluginFactory =
//	new PFactory<PPluginModuleManager>::Worker<OpalPluginCodecManager>("PluginCodecManager", true);
//	OpalPluginCodecManager* pluginManager = PFactory<PPluginModuleManager>::CreateInstanceAs<OpalPluginCodecManager>("PluginCodecManager");
//
//	LOGI("H.261 version: %d", Opal_StaticCodec_VIC_H261_GetAPIVersion());
//	pluginManager->RegisterStaticCodec("H.261",
//			Opal_StaticCodec_VIC_H261_GetAPIVersion,
//						(PluginCodec_GetCodecFunction) Opal_StaticCodec_VIC_H261_GetCodecs);
//
//	LOGI("H.263 version: %d", Opal_StaticCodec_DINSK_H263_GetAPIVersion());
//	pluginManager->RegisterStaticCodec("H.263-DINSK",
//			Opal_StaticCodec_DINSK_H263_GetAPIVersion,
//						(PluginCodec_GetCodecFunction) Opal_StaticCodec_DINSK_H263_GetCodecs);

}

 void opalShutdown() {

	 if(initialized)
		 OpalShutDown(hOPAL);

}

void* createCodecTest(const char* szArguments, void* reserved) {

	return (void*) new BoneCodecTest(szArguments, reserved);
}

void deleteCodecTest(void* handle) {

	delete (BoneCodecTest*) handle;
}


int setupOptions() {

	  OpalMessage   command;
	  OpalMessage * response;

	  // General options
	  memset(&command, 0, sizeof(command));
	  command.m_type = OpalCmdSetGeneralParameters;
	  command.m_param.m_general.m_autoRxMedia = "";
	  command.m_param.m_general.m_autoTxMedia = "video";
	  command.m_param.m_general.m_mediaOrder = "H.263-DINSK\nH.263P-DINSK";
	  command.m_param.m_general.m_videoInputDevice = "Fake/NTSCTest";

	  if ((response = OpalSendMessage(hOPAL, &command)) != NULL)
	  {
		  if (response->m_param.m_commandError == NULL || *response->m_param.m_commandError == '\0')
			LOGI("%s.\n", "Set general options");
		  else
			  LOGI("%s: %s\n", "Could not set general options", response->m_param.m_commandError);

		  OpalFreeMessage(response);
		  response = NULL;
	  }

	  // Options across all protocols
	  memset(&command, 0, sizeof(command));
	  command.m_type = OpalCmdSetProtocolParameters;

	  command.m_param.m_protocol.m_userName = "crowdoptic";
	  command.m_param.m_protocol.m_displayName = "CrowdOptic";
	  command.m_param.m_protocol.m_interfaceAddresses = "*";

	  if ((response = OpalSendMessage(hOPAL, &command)) != NULL)
	  {
		  if (response->m_param.m_commandError == NULL || *response->m_param.m_commandError == '\0')
			LOGI("%s.\n", "Set protocol options");
		  else
			  LOGI("%s: %s\n", "Could not set protocol options", response->m_param.m_commandError);

		  OpalFreeMessage(response);
		  response = NULL;
	  }

	  memset(&command, 0, sizeof(command));
	  command.m_type = OpalCmdSetProtocolParameters;

	  command.m_param.m_protocol.m_prefix = "sip";
	  command.m_param.m_protocol.m_defaultOptions = "PRACK-Mode=0\nInitial-Offer=false";

	  if ((response = OpalSendMessage(hOPAL, &command)) != NULL)
	  {
		  if (response->m_param.m_commandError == NULL || *response->m_param.m_commandError == '\0')
			LOGI("%s.\n", "Set SIP options");
		  else
			  LOGI("%s: %s\n", "Could not set SIP options", response->m_param.m_commandError);

		  OpalFreeMessage(response);
		  response = NULL;
	  }

}

int doCall()
{
  // Example cmd line: call 612@ekiga.net
  OpalMessage command;
  OpalMessage * response;

  memset(&command, 0, sizeof(command));
  command.m_type = OpalCmdSetUpCall;
  command.m_param.m_callSetUp.m_partyA = "";
  command.m_param.m_callSetUp.m_partyB = "192.168.1.126";
  command.m_param.m_callSetUp.m_overrides.m_displayName = "CrowdOptic";
  LOGI("Calling %s\n", command.m_param.m_callSetUp.m_partyB);

  if ((response = OpalSendMessage(hOPAL, &command)) != NULL)
  {
	  if (response->m_param.m_commandError == NULL || *response->m_param.m_commandError == '\0')
		LOGI("%s.\n", "Calling");
	  else
		  LOGI("%s: %s\n", "Could not make call", response->m_param.m_commandError);

	  PString token = response->m_param.m_callSetUp.m_callToken;

	  if(CurrentCallToken != NULL)
		free(CurrentCallToken);

	  CurrentCallToken = strdup((const char*) token);

	  OpalFreeMessage(response);
	  response = NULL;
  }

  return 1;
}
};
