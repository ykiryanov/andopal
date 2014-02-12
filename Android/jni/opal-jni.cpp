/*
 * opal-jni.h
 *
 * Copyright (c) 2013 Vox Lucida Pty. Ltd.
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is Open Phone Abstraction Library.
 *
 * The Initial Developer of the Original Code is Vox Lucida (Robert Jongbloed)
 *
 * Contributor(s): ______________________________________.
 *
 * $Revision: 29943 $
 * $Author: rjongbloed $
 * $Date: 2013-06-13 08:44:40 +0000 (Thu, 13 Jun 2013) $
 */

#include <jni.h>
#include <ptlib.h>
#include <ptlib/sound.h>
#include <ptclib/dtmf.h>
#include <opal.h>
#include <player/codectest.h>

// Include symbol hook so links in all the SWIG interface.
extern int opal_java_swig_wrapper_link;
static int const * const force_java_swig_wrapper_link = &opal_java_swig_wrapper_link;

const unsigned FrameTime = 20; // Milliseconds
extern "C" { jint JNI_OnLoad(JavaVM* vm, void* reserved); };
extern "C" { void SDL_Android_Init(JNIEnv* mEnv, jclass cls); };

extern "C" {

  jstring Java_org_opalvoip_opal_andsample_AndOPAL_TestPlayer(JNIEnv* env, jclass clazz, jint bufferTime)
  {
    PSoundChannel::Params playerParams(PSoundChannel::Player, "voice");
    playerParams.m_bufferSize = FrameTime*2*8; // 20ms
    playerParams.m_bufferCount = (bufferTime+FrameTime-1)/FrameTime;
    PString result = PSoundChannel::TestPlayer(playerParams);
    return env->NewStringUTF(result);
  }

  jstring Java_org_opalvoip_opal_andsample_AndOPAL_TestRecorder(JNIEnv* env, jclass clazz, jint bufferTime)
  {
    PSoundChannel::Params recorderParams(PSoundChannel::Recorder, "*");
    PSoundChannel::Params playerParams(PSoundChannel::Player, "voice");
    playerParams.m_bufferSize = recorderParams.m_bufferSize = FrameTime*2*8; // 20ms
    playerParams.m_bufferCount = recorderParams.m_bufferCount = (bufferTime+FrameTime-1)/FrameTime;
    PString result = PSoundChannel::TestRecorder(recorderParams, playerParams);
    return env->NewStringUTF(result);
  }

  jstring Java_org_opalvoip_opal_andsample_AndOPAL_CodecTest(JNIEnv* env, jclass clazz, jclass window)
  {
	JavaVM* jvm = NULL;
	int gotVM = env->GetJavaVM(&jvm);

	JNI_OnLoad(jvm, (void*) env);
//	SDL_Android_Init(env, clazz);

//	BoneCodecTest* codecTest = new BoneCodecTest(env
//     "--listen-address * --listen-port 5004 G.711-uLaw-64k YUV420P", 0L);
	BoneCodecTest* codecTest = new BoneCodecTest(
	 "--grab-device Fake/BouncingBoxes --frame-size cif --frame-rate 30 --display-device NativeWindow G.711-uLaw-64k H.261", 0L);
    return env->NewStringUTF("OK");
  }

};

// End of file
