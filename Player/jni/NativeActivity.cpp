#include <ptlib.h>
#include <ptlib_config.h>
#include <opal.h>
#include <player/codectest.h>
#include <android/log.h>

#include <jni.h>
#include "NativeActivity.h"

#if !defined(NULL)
#define NULL ((void*)0)
#endif

static OpalHandle hOPAL = NULL;
static bool initialized = false;

extern "C" {

    void opalInitialize() {

		unsigned version = OPAL_C_API_VERSION;
        if(hOPAL == NULL)
			hOPAL = OpalInitialise(&version, NULL);

		if(hOPAL == NULL) {
			LOGE("Could not initialise OPAL\n");
		}
		else
			LOGI("OPAL version %d\n", version);
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
};
