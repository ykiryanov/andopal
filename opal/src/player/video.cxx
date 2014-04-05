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

#include <android/native_activity.h>
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

ANativeWindow* _native_window = NULL;
static PVideoOutputDevice_NativeWindow* _native_window_thisclass = NULL;

PVideoOutputDevice_NativeWindow::PVideoOutputDevice_NativeWindow()
    : _pYUV420_Image(NULL)
    , _nMaxFrameSizeBytes(0)
    , _bFlipped(false)
    , _window(_native_window)
    , _surface(NULL)
{
    frameWidth = 640;
    frameHeight = 360;

	// INIT HERE
    PVideoOutputDevice::SetFrameSize(frameWidth, frameHeight);

    if(_surface)
    	delete _surface;
    _surface = new uint8_t[frameWidth * frameHeight * 4];
    memset(_surface, 0, frameWidth * frameHeight * 4);

    _native_window_thisclass = this;
}


PVideoOutputDevice_NativeWindow::~PVideoOutputDevice_NativeWindow()
{
	delete _surface;
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
        

    if(_window)
    {
    	ANativeWindow_setBuffersGeometry(_window, frameWidth, frameHeight, 1);
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
    _nMaxFrameSizeBytes = (frameWidth * frameHeight * 3)>>1;

    if(_surface)
    	delete _surface;
    _surface = new uint8_t[frameWidth * frameHeight * 4];
    memset(_surface, 0, frameWidth * frameHeight * 4);

	return PTrue;
}

void hexdump(void* ptr, unsigned sz)
{
    BYTE* p = (BYTE*) ptr;
    PString s = PString();
    s += psprintf("packet size =%d \n",sz);
    for (unsigned i=0;i<sz;) {
        for (unsigned k=0;k<32 && i< sz;++k)
            s += psprintf("0x%2.2x ", p[i++]);
        s += psprintf("\n");
    }

    PTRACE(3, s);
}

PBoolean PVideoOutputDevice_NativeWindow::FrameComplete()
{
	PWaitAndSignal m(_mutex);

    BoneSurfaceInfo si = BoneSurfaceInfo();
    if (!_pYUV420_Image)
        return PTrue;
    
	unsigned nWH = frameWidth*frameHeight;
	const uchar* pY = _pYUV420_Image;
	const uchar* pU = pY + nWH;
	const uchar* pV = pU + (nWH>>2);
    
    BoneRect rOut = BoneRect();
    rOut.left = 0;
    rOut.top = 0;
    rOut.right = frameWidth;
    rOut.bottom = frameHeight;
    
	si.pImage = _surface;	// + (view->nHeight-1)*view->nWidth*4;
	si.nWidth = frameWidth;
	si.nHeight = frameHeight;
	si.nImageSize = frameWidth * frameHeight * 4;
	si.iPitchX = 4;
	si.iPitchY = frameWidth * 4;	// -int(view->nWidth*4);

    si.mViewX = 0;
    si.mViewY = 0;

    si.mViewWidth = frameWidth;
    si.mViewHeight = frameHeight;

 	PTRACE(3, "ANWin\tPVideoOutputDevice_NativeWindow yuv420_to_argb32_clip, frameWidth " << frameWidth << ", height " << frameHeight);
    yuv420_to_argb32_clip(pY, pU, pV, frameWidth, frameWidth, frameHeight,
                          si.pImage, si.iPitchX, si.iPitchY, rOut, rOut);
    //hexdump(si.pImage, 64);
	
    ANativeWindow_Buffer buffer = ANativeWindow_Buffer();
    if (ANativeWindow_lock(_window, &buffer, NULL) == 0) {
        memcpy(buffer.bits, si.pImage, frameWidth * frameHeight * 4);
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
    
	//PTRACE(3, "PVideoOutputDevice_NativeWindow::SetFrameData, end frame? " << endFrame);
    if ( endFrame ) {
        _pYUV420_Image = data;
		bRet = FrameComplete();
        _pYUV420_Image = NULL;
        
    }
	return bRet;
}

#endif // P_VIDEO
