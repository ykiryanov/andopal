#include <ptlib.h>
#include <ptlib_config.h>
#include <opal.h>
#include <player/codectest.h>
#include <android/log.h>

#include <jni.h>

#if !defined(NULL)
#define NULL ((void*)0)
#endif

static OpalHandle hOPAL = NULL;
static char * CurrentCallToken = NULL;
static char * HeldCallToken = NULL;
static bool initialized = false;

#define TRACE_FILE "syslog"

#define  LOG_TAG    "libplasma"
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

extern "C" {
	extern 	int setupOptions();
	extern  int doCall();

    void opalInitialize() {

		unsigned version = OPAL_C_API_VERSION;
        if(hOPAL == NULL)
			hOPAL = OpalInitialise(&version, NULL);

		if(hOPAL == NULL) {
			LOGE("Could not initialise OPAL\n");
		}
		else
			LOGI("OPAL version %d\n", version);

	  PFile::OpenOptions options = PFile::Create;
	  PFileInfo::Permissions permissions = PFileInfo::DefaultPerms;

	  PFile * traceOutput = new PTextFile();
	  if (traceOutput->Open("/sdcard/opal.log", PFile::WriteOnly, options, permissions))
		  PTrace::SetStream(traceOutput);

		PTrace::SetLevel(5);
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


	OpalMessage * OpalSendCommand(OpalMessage * command, const char * errorMessage)
	{
	  OpalMessage * response;
	  if ((response = OpalSendMessage(hOPAL, command)) == NULL)
	    return NULL;
	  if (response->m_type != OpalIndCommandError)
	    return response;

	  if (response->m_param.m_commandError == NULL || *response->m_param.m_commandError == '\0')
	    LOGI("%s.\n", errorMessage);
	  else
		  LOGI("%s: %s\n", errorMessage, response->m_param.m_commandError);

	  OpalFreeMessage(response);

	  return NULL;
	}

	int setupOptions() {

		  OpalMessage   command;
		  OpalMessage * response;

		  // General options
		  memset(&command, 0, sizeof(command));
		  command.m_type = OpalCmdSetGeneralParameters;
		  //command.m_param.m_general.m_audioRecordDevice = "Camera Microphone (2- Logitech";
		  command.m_param.m_general.m_autoRxMedia = command.m_param.m_general.m_autoTxMedia = "audio";

		#ifdef STUN_SERVER
		  command.m_param.m_general.m_natMethod = "H46019\nSTUN";
		  command.m_param.m_general.m_natServer = "\n"STUN_SERVER;
		#endif
		  command.m_param.m_general.m_mediaMask = "RFC4175*";

		#if LOCAL_MEDIA
		  command.m_param.m_general.m_mediaReadData = MyReadMediaData;
		  command.m_param.m_general.m_mediaWriteData = MyWriteMediaData;
		  command.m_param.m_general.m_mediaDataHeader = OpalMediaDataPayloadOnly;
		#endif

//		  if ((response = OpalSendCommand(&command, "Could not set general options")) == NULL)
//		    return 0;

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

//		  if ((response = OpalSendCommand(&command, "Could not set protocol options")) == NULL)
//		    return 0;
//
//		  OpalFreeMessage(response);

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

//		  if ((response = OpalSendCommand(&command, "Could not set SIP options")) == 0)
//		    return 0;
//
//		  OpalFreeMessage(response);

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
	  command.m_param.m_callSetUp.m_partyA = "sip:crowdoptic@192.168.1.131";
	  command.m_param.m_callSetUp.m_partyB = "sip:ykiryanov@192.168.1.125";
	  command.m_param.m_callSetUp.m_overrides.m_displayName = "CrowdOptic";
	  LOGI("Calling %s\n", command.m_param.m_callSetUp.m_partyB);

//	  if ((response = OpalSendCommand(&command, "Could not make call")) == ((void*)0))
//	    return 0;

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

//	  CurrentCallToken = strdup(response->m_param.m_callSetUp.m_callToken);
//	  OpalFreeMessage(response);
	  return 1;
	}

};
