/*
 *  video.cxx
 *  Android Native Window Output Device
 *
 *  Created by Yuri Kiryanov on 2/6/14.
 *  Copyright 2014 Dinsk, LLP. All rights reserved.
 *
 */

#include <ptlib.h>

#if P_VIDEO

#include <ptlib/pluginmgr.h>
#include <ptlib/videoio.h>
#include <ptlib/vconvert.h>

#include <player/video.h>
#include <player/g2dUtil.h>

#include <android_native_app_glue.h>

#define FORCE_STATIC_PLUGIN 1

PCREATE_VIDOUTPUT_PLUGIN(NativeWindow)

///////////////////////////////////////////////////////////////////////////////
// PVideoOutputDevice_NativeWindow
static const char* const NativeWindowDeviceNames[] = {
	"NativeWindow"
};

void yuv420_to_rgb32_clip(
                          const uchar* pY, const uchar* pU, const uchar* pV, int iPitch, int sWidth, int sHeight, 
                          uchar* pDst, int iPitchX, int iPitchY,
                          const BoneRect& rOut, const BoneRect& rClip);

void yuv420_to_rgb32(const uchar* pYUV, uint width, uint height, uchar* pDst, int iPitchX, int iPitchY);

extern "C" {
    void android_main(struct android_app* state) {
        while(1)
        {
            int ident;
            int fdesc;
            int events;
            struct android_poll_source* source;
            
            while((ident = ALooper_pollAll(0, &fdesc, &events, (void**)&source)) >= 0)
            {
                // process this event
                if (source)
                    source->process(state, source);
            }
        }
    }
};

PVideoOutputDevice_NativeWindow::PVideoOutputDevice_NativeWindow()
    : _pYUV420_Image(NULL)
    , _nMaxFrameSizeBytes(0)
    , _bFlipped(false)
    , _window(NULL)
{
	// INIT HERE
    PVideoOutputDevice::SetFrameSize(352, 288);
}


PVideoOutputDevice_NativeWindow::~PVideoOutputDevice_NativeWindow()
{
	Close();
}


PStringArray PVideoOutputDevice_NativeWindow::GetOutputDeviceNames()
{
	return PStringArray(PARRAYSIZE(NativeWindowDeviceNames), NativeWindowDeviceNames);
}

PBoolean PVideoOutputDevice_NativeWindow::Open(const PString & name, PBoolean startImmediate)
{
	PTRACE(3, "ANWin\tPVideoOutputDevice_NativeWindow " << name << ", start immediate " << startImmediate);
	
	Close();

    {
        PWaitAndSignal m(_mutex);
        // Find call token, if any
        PINDEX colon = name.Find(':'); 
        if(colon != P_MAX_INDEX)
            m_token = name.Mid(colon + 1);
	
        deviceName = name;
    }
        
	return startImmediate ? Start() : IsOpen();
}


PBoolean PVideoOutputDevice_NativeWindow::IsOpen()
{
	// RETURN VALID WINDOW HERE
	return _window != NULL;
}


PBoolean PVideoOutputDevice_NativeWindow::Close()
{
    if(_window)
        ANativeWindow_release(_window);
        
	return PTrue;
}


PBoolean PVideoOutputDevice_NativeWindow::Start()
{
	PWaitAndSignal m(_mutex);
    
    return _window != NULL;
}


PBoolean PVideoOutputDevice_NativeWindow::Stop()
{
	
	// HIDE WINDOW HERE
    return PTrue;
}


PBoolean PVideoOutputDevice_NativeWindow::SetColourFormat(const PString & colourFormat)
{
	PWaitAndSignal m(_mutex);
    if (colourFormat *= "YUV420P")
		return PTrue;
	return PFalse;
}


PBoolean PVideoOutputDevice_NativeWindow::SetFrameSize(unsigned width, unsigned height)
{
    PWaitAndSignal m(_mutex);
    
    if (width == frameWidth && height == frameHeight)
        return PTrue;
    
    if (!PVideoOutputDevice::SetFrameSize(width, height))
        return PFalse;
    
    //	_wndVideoOutput.SetFrameSize(frameWidth, frameHeight);  
    _nMaxFrameSizeBytes = (frameWidth*frameHeight*3)>>1;

	return PTrue;
}

PBoolean PVideoOutputDevice_NativeWindow::FrameComplete()
{
	PWaitAndSignal m(_mutex);

    BoneSurfaceInfo si;
    if (!_pYUV420_Image)
        return PTrue;
    
	unsigned nWH = frameWidth*frameHeight;
	const uchar* pY = _pYUV420_Image;
	const uchar* pU = pY + nWH;
	const uchar* pV = pU + (nWH>>2);
    
    BoneRect rOut;
    rOut.left = 0;
    rOut.top = 0;
    rOut.right = frameWidth;
    rOut.bottom = frameHeight;
    
    yuv420_to_argb32_clip(pY, pU, pV, frameWidth, frameWidth, frameHeight,
                          si.pImage, si.iPitchX, si.iPitchY, rOut, rOut);
	
    ANativeWindow_Buffer buffer;
    if (ANativeWindow_lock(_window, &buffer, NULL) == 0) {
        memcpy(buffer.bits, si.pImage,  frameWidth * frameHeight * 2);
        ANativeWindow_unlockAndPost(_window);
    }
    
	return PTrue;
}

PBoolean PVideoOutputDevice_NativeWindow::SetFrameData(unsigned x, unsigned y,
                                                     unsigned width, unsigned height, const BYTE* data, PBoolean endFrame)
{ 
    PBoolean bRet = PFalse;
    if ( x != 0 || y != 0 || width != frameWidth || height != frameHeight)
        return bRet;
    
    if ( endFrame ) {
        _pYUV420_Image = data;
		bRet = FrameComplete();
        _pYUV420_Image = NULL;
        
    }
	return bRet;
}

#endif // P_VIDEO
