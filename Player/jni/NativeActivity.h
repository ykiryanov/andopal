/*
 * NativeActivity.h
 *
 *  Created on: Feb 15, 2014
 *      Author: ykiryanov
 */

#ifndef NATIVEACTIVITY_H_
#define NATIVEACTIVITY_H_

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
	void* createCodecTest(const char* szArguments, void* reserved);
	void deleteCodecTest(void* handle);
	void opalInitialize();
	void opalShutdown();

#ifdef __cplusplus
};
#endif

#endif /* NATIVEACTIVITY_H_ */
