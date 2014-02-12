/*
 *  video.h
 *  Android Native Window Output Device
 *
 *  Created by Yuri Kiryanov on 2/6/14.
 *  Copyright 2014 Dinsk, LLP. All rights reserved.
 *
 */

#ifndef ANDROID_NATIVEWINDOW_H
#define ANDROID_NATIVEWINDOW_H

#ifdef P_USE_PRAGMA
#pragma interface
#endif
#include <ptlib.h>

#if P_VIDEO

#include <android/native_window.h>

//
// Video Output Device
// via Core Surface
//

#define PVideoOutputDeviceBase PVideoOutputDevice

class PVideoOutputDevice_NativeWindow : public PVideoOutputDeviceBase
{
	PCLASSINFO(PVideoOutputDevice_NativeWindow, PVideoOutputDeviceBase);
		
	public:
	typedef PVideoOutputDeviceBase BaseClass;
		/** Create a new video output device.
	 */
	PVideoOutputDevice_NativeWindow();
	
	/** Destroy a video output device.
	 */
	~PVideoOutputDevice_NativeWindow();
	
    /**Open the device given the device name.
      */
    virtual PBoolean Open(
      const PString & deviceName,   /// Device name (filename base) to open
      PBoolean startImmediate = PTrue    /// Immediately start device
    );

    /**Determine if the device is currently open.
      */
    virtual PBoolean IsOpen();

    /**Close the device.
      */
    virtual PBoolean Close();

    /**Start the video device I/O display.
      */
    virtual PBoolean Start();

    /**Stop the video device I/O display.
      */
    virtual PBoolean Stop();

    /**Get a list of all of the devices available.
      */
    static PStringArray GetOutputDeviceNames();

    /**Get a list of all of the devices available.
      */
    virtual PStringArray GetDeviceNames() const
    { return GetOutputDeviceNames(); }

    /**Set the colour format to be used.
       Note that this function does not do any conversion. If it returns PTrue
       then the video device does the colour format in native mode.

       To utilise an internal converter use the SetColourFormatConverter()
       function.

       Default behaviour sets the value of the colourFormat variable and then
       returns PTrue.
    */
    virtual PBoolean SetColourFormat(
      const PString & colourFormat // New colour format for device.
    );

    /**Get the video conversion vertical flip state.
       Default action is to return PFalse.
     */
    virtual PBoolean GetVFlipState()	{ return _bFlipped; }

    /**Set the video conversion vertical flip state.
       Default action is to return PFalse.
     */
    virtual PBoolean SetVFlipState(
      PBoolean newVFlipState    /// New vertical flip state
    )
	{ _bFlipped = newVFlipState; return PTrue; }
	
	/**Get the maximum frame size in bytes.
	 
	 Note a particular device may be able to provide variable length
	 frames (eg motion JPEG) so will be the maximum size of all frames.
	 */
    virtual PINDEX GetMaxFrameBytes()	{ return _nMaxFrameSizeBytes;}

	
    /**Set the frame size to be used.

       Note that devices may not be able to produce the requested size, and
       this function will fail.  See SetFrameSizeConverter().

       Default behaviour sets the frameWidth and frameHeight variables and
       returns PTrue.
    */
    virtual PBoolean SetFrameSize(
      unsigned width,   /// New width of frame
      unsigned height   /// New height of frame
    );


	/**Set a section of the output frame buffer.
      */
    virtual PBoolean SetFrameData(
      unsigned x,
      unsigned y,
      unsigned width,
      unsigned height,
      const BYTE * data,
      PBoolean endFrame = PTrue
    );


    virtual PBoolean GetPosition(
      int & x,  // X position of device surface
      int & y   // Y position of device surface
	) const { x=y=0; return PTrue; }

	/**Set a section of the output frame buffer.
	 */
    virtual PBoolean FrameComplete();
	
    /**Get the position of the output device, where relevant. For devices such as
	 files, this always returns zeros. For devices such as Windows, this is the
	 position of the window on the screen.
	 */
	
protected:
	PString                 m_token;
    ANativeWindow*          _window;
    PMutex		            _mutex;

    const BYTE*             _pYUV420_Image;
	unsigned	            _nMaxFrameSizeBytes;
    bool                    _bFlipped;
    uint8_t*        		_surface;

};

#endif // P_VIDEO

#endif // ANDROID_NATIVEWINDOW_H
