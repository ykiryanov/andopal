#include <ptlib.h>
#include <ptlib_config.h>
#include <opal.h>
#include <player/codectest.h>

#include <jni.h>

extern "C" {

	void* createCodecTest(const char* szArguments, void* reserved) {

		return (void*) new BoneCodecTest(szArguments, reserved);
	}

	void deleteCodecTest(void* handle) {

		delete (BoneCodecTest*) handle;
	}

};
