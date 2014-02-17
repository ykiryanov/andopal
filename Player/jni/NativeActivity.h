/*
 * NativeActivity.h
 *
 *  Created on: Feb 15, 2014
 *      Author: ykiryanov
 */

#ifndef NATIVEACTIVITY_H_
#define NATIVEACTIVITY_H_

//#define NETPLAYER 1
#define PREVIEWER 1

#define TRACE_FILE "syslog"
//#define TRACE_FILE "/sdcard/data/opal.log"

#define  LOG_TAG    "libplayer"
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

#if !defined(NULL)
#define NULL ((void*)0)
#endif

#ifdef __cplusplus
extern "C" {
#endif
	extern 	int setupOptions();
	extern  int doCall();

	extern void opalInitialize();
	extern void opalShutdown();

	extern	void* createCodecTest(const char* szArguments, void* reserved);
	extern 	void deleteCodecTest(void* handle);
	extern 	int setupOptions();
	extern  int doCall();

	unsigned int Opal_StaticCodec_VIC_H261_GetAPIVersion();
	struct PluginCodec_Definition * Opal_StaticCodec_VIC_H261_GetCodecs(unsigned * count, unsigned /*version*/);
	unsigned int Opal_StaticCodec_DINSK_H263_GetAPIVersion();
	struct PluginCodec_Definition * Opal_StaticCodec_DINSK_H263_GetCodecs(unsigned * count, unsigned /*version*/);
#ifdef __cplusplus
};
#endif

#endif /* NATIVEACTIVITY_H_ */
