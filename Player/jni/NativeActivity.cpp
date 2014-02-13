#include <ptlib.h>
#include <ptlib_config.h>
#include <opal.h>
#include <player/codectest.h>

#include <jni.h>

OpalHandle hOPAL = NULL;
char * CurrentCallToken = NULL;
char * HeldCallToken = NULL;

#define TRACE_FILE "stderr"

extern "C" {

    void opalInitialize() {

       unsigned   version;

       version = OPAL_C_API_VERSION;
       if ((hOPAL = OpalInitialise(&version,
                                    OPAL_PREFIX_H323  " "
                                    OPAL_PREFIX_SIP   " "
                                    OPAL_PREFIX_PCSS
                                    " TraceLevel=4"
                                    TRACE_FILE " TraceAppend")) == NULL) {
        	printf("Could not initialise OPAL\n");
        }
        else
        	printf("OPAL version %d\n", version);
    }

    void opalShutdown() {

        OpalShutDown(hOPAL);

    }

	void* createCodecTest(const char* szArguments, void* reserved) {

		return (void*) new BoneCodecTest(szArguments, reserved);
	}

	void deleteCodecTest(void* handle) {

		delete (BoneCodecTest*) handle;
	}


	OpalMessage * OpalSendCommand(OpalHandle hOPAL, OpalMessage * command, const char * errorMessage)
	{
	  OpalMessage * response;
	  if ((response = OpalSendMessage(hOPAL, command)) == NULL)
	    return NULL;
	  if (response->m_type != OpalIndCommandError)
	    return response;

	  if (response->m_param.m_commandError == NULL || *response->m_param.m_commandError == '\0')
	    printf("%s.\n", errorMessage);
	  else
	    printf("%s: %s\n", errorMessage, response->m_param.m_commandError);

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

		  if ((response = OpalSendCommand(hOPAL, &command, "Could not set general options")) == NULL)
		    return 0;

		  OpalFreeMessage(response);

		  // Options across all protocols
		  memset(&command, 0, sizeof(command));
		  command.m_type = OpalCmdSetProtocolParameters;

		  command.m_param.m_protocol.m_userName = "robertj";
		  command.m_param.m_protocol.m_displayName = "Robert Jongbloed";
		  command.m_param.m_protocol.m_interfaceAddresses = "*";

		  if ((response = OpalSendCommand(hOPAL, &command, "Could not set protocol options")) == NULL)
		    return 0;

		  OpalFreeMessage(response);

		  memset(&command, 0, sizeof(command));
		  command.m_type = OpalCmdSetProtocolParameters;

		  command.m_param.m_protocol.m_prefix = "sip";
		  command.m_param.m_protocol.m_defaultOptions = "PRACK-Mode=0\nInitial-Offer=false";

		  if ((response = OpalSendCommand(hOPAL, &command, "Could not set SIP options")) == NULL)
		    return 0;

		  OpalFreeMessage(response);
	}

	int doCall(OpalHandle hOPAL, const char * from, const char * to)
	{
	  // Example cmd line: call 612@ekiga.net
	  OpalMessage command;
	  OpalMessage * response;

	  printf("Calling %s\n", to);

	  memset(&command, 0, sizeof(command));
	  command.m_type = OpalCmdSetUpCall;
	  command.m_param.m_callSetUp.m_partyA = from;
	  command.m_param.m_callSetUp.m_partyB = to;
	  command.m_param.m_callSetUp.m_overrides.m_displayName = "CrowdOptic";
	  if ((response = OpalSendCommand(hOPAL, &command, "Could not make call")) == NULL)
	    return 0;

	  CurrentCallToken = strdup(response->m_param.m_callSetUp.m_callToken);
	  OpalFreeMessage(response);
	  return 1;
	}

};
