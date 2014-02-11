/*
 * vsdl.cxx
 *
 * Classes to support video output via SDL
 *
 * Portable Windows Library
 *
 * Copyright (c) 1993-2000 Equivalence Pty. Ltd.
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
 * The Original Code is Portable Windows Library.
 *
 * The Initial Developer of the Original Code is Equivalence Pty. Ltd.
 *
 * Contributor(s): ______________________________________.
 *
 * $Revision: 30779 $
 * $Author: rjongbloed $
 * $Date: 2013-10-29 07:10:28 +0000 (Tue, 29 Oct 2013) $
 */

#ifdef __GNUC__
#pragma implementation "vsdl.h"
#endif

#include <ptlib.h>

#define P_SDL 1
#if P_SDL

#pragma message("SDL video support enabled")

#define P_FORCE_STATIC_PLUGIN 1

#include <ptclib/vsdl.h>
#include <ptlib/vconvert.h>

#include "SDL.h"
#include "SDL_render.h"

#define new PNEW
#define PTraceModule() "SDL"

#ifdef _MSC_VER
  #pragma comment(lib, P_SDL_LIBRARY)
#endif


PCREATE_VIDOUTPUT_PLUGIN_EX(SDL,

  virtual const char * GetFriendlyName() const
  {
    return "Simple DirectMedia Layer Video Output";
  }

  virtual bool ValidateDeviceName(const PString & deviceName, P_INT_PTR /*userData*/) const
  {
    return deviceName.NumCompare(GetServiceName()) == PObject::EqualTo;
  }
);

void AdjustTextures();

///////////////////////////////////////////////////////////////////////

class PSDL_Window : public PMutex
{
  public:
    static PSDL_Window & GetInstance()
    {
      static PSDL_Window instance;
      return instance;
    }


    enum UserEvents {
      e_AddDevice,
      e_RemoveDevice,
      e_SizeChanged,
      e_ContentChanged
    };


    void Run()
    {
      if (m_thread == NULL) {
        m_thread = new PThreadObj<PSDL_Window>(*this, &PSDL_Window::MainLoop, true, "SDL");
        m_started.Wait();
      }
    }


  private:
    SDL_Window * m_screen;
    SDL_Renderer * m_renderer;
    PThread     * m_thread;
    PSyncPoint    m_started;

    typedef std::list<PVideoOutputDevice_SDL *> DeviceList;
    DeviceList m_devices;

    PSDL_Window()
      : m_screen(NULL)
      , m_thread(NULL)
    {
    }


    virtual void MainLoop()
    {
#if defined(PTRACING)
      PTRACE(4, "Start of event thread");

      SDL_version v2;
      SDL_GetVersion(&v2);
      PTRACE(3, "  Run-Time version: "
             << (unsigned)v2.major << '.' << (unsigned)v2.minor << '.' << (unsigned)v2.patch);
#endif
      // initialise the SDL library
      if (::SDL_Init(SDL_INIT_VIDEO|SDL_INIT_NOPARACHUTE) < 0) {
        PTRACE(1, "Couldn't initialize SDL: " << ::SDL_GetError());
        return;
      }

        
#ifdef _WIN32
      SDL_SetModuleHandle(GetModuleHandle(NULL));
#endif

      m_started.Signal();

      while (HandleEvent())
        ;

      ::SDL_Quit();
      m_screen = NULL;
      m_thread = NULL;

      PTRACE(4, "End of event thread");
    }


    bool HandleEvent()
    {
      SDL_Event sdlEvent;
      if (!::SDL_WaitEvent(&sdlEvent)) {
        PTRACE(1, "Error getting event: " << ::SDL_GetError());
        return false;
      }

      PWaitAndSignal mutex(*this);

      switch (sdlEvent.type) {
        case SDL_USEREVENT :
          switch (sdlEvent.user.code) {
            case e_AddDevice :
              AddDevice((PVideoOutputDevice_SDL *)sdlEvent.user.data1);
              break;

            case e_RemoveDevice :
              RemoveDevice((PVideoOutputDevice_SDL *)sdlEvent.user.data1);
              return !m_devices.empty();

            case e_SizeChanged :
              AdjustTextures();
              ((PVideoOutputDevice_SDL *)sdlEvent.user.data1)->m_operationComplete.Signal();
              break;

            case e_ContentChanged :
              ((PVideoOutputDevice_SDL *)sdlEvent.user.data1)->UpdateContent();
              break;

            default :
              PTRACE(5, "Unhandled user event " << sdlEvent.user.code);
          }
          break;

        case SDL_QUIT :
          PTRACE(3, "User closed window");
          for (DeviceList::iterator it = m_devices.begin(); it != m_devices.end(); ++it)
            (*it)->FreeTexture();

          m_devices.clear();
          return false;

#if !defined(ANDROID)
        case SDL_VIDEORESIZE :
          PTRACE(4, "Resize window to " << sdlEvent.resize.w << " x " << sdlEvent.resize.h);
          AdjustTextures();
          break;
        case SDL_ACTIVEEVENT :
          PTRACE(4, "Window became active");
          break;
#endif

        default :
          PTRACE(5, "Unhandled event " << (unsigned)sdlEvent.type);
      }

      return true;
    }


    void AddDevice(PVideoOutputDevice_SDL * device)
    {
      m_devices.push_back(device);

      if (m_screen == NULL) {
        PString deviceName = device->GetDeviceName();

        PINDEX x_pos = deviceName.Find("X=");
        PINDEX y_pos = deviceName.Find("Y=");
        if (x_pos != P_MAX_INDEX && y_pos != P_MAX_INDEX) {
          PString str(PString::Printf, "SDL_VIDEO_WINDOW_POS=%i,%i",
                      atoi(&deviceName[x_pos+2]), atoi(&deviceName[y_pos+2]));
#if !defined(ANDROID)
          ::SDL_putenv((char *)(const char *)str);
#endif
        }

          m_screen = SDL_CreateWindow(device->GetTitle(),
                                      SDL_WINDOWPOS_UNDEFINED,
                                      SDL_WINDOWPOS_UNDEFINED,
                                      device->GetFrameWidth(), device->GetFrameHeight(),
                                      SDL_WINDOW_FULLSCREEN | SDL_WINDOW_OPENGL);
          
          PTRACE_IF(1, m_screen == NULL, "Couldn't create SDL surface: " << ::SDL_GetError());
      }

      m_renderer = SDL_CreateRenderer(m_screen, -1, 0);
        
      if(m_renderer)
      {
          SDL_SetRenderDrawColor(m_renderer, 0, 0, 0, 255);
          SDL_RenderClear(m_renderer);
          SDL_RenderPresent(m_renderer);
          SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "linear");
            // make the scaled rendering look smoother.
          SDL_RenderSetLogicalSize(m_renderer,
                device->GetFrameWidth(), device->GetFrameHeight());
      }
        
      AdjustTextures();

      device->m_operationComplete.Signal();
    }


    void RemoveDevice(PVideoOutputDevice_SDL * device)
    {
      m_devices.remove(device);

      if (PAssertNULL(m_screen) != NULL) {
        device->FreeTexture();
        AdjustTextures();
      }

      device->m_operationComplete.Signal();
    }


    void AdjustTextures()
    {
      if (m_screen == NULL || m_devices.empty())
        return;

      PString title;
      unsigned x = 0;
      unsigned y = 0;
      unsigned fullWidth = 0;
      unsigned fullHeight = 0;

      for (DeviceList::iterator it = m_devices.begin(); it != m_devices.end(); ++it) {
        PVideoOutputDevice_SDL & device = **it;

        if (!title.IsEmpty())
          title += " / ";
        title += device.GetTitle();

        device.m_x = x;
        device.m_y = y;
        if (device.m_texture == NULL)
          device.CreateTexture(m_screen);
        else  {
          device.FreeTexture();
          device.CreateTexture(m_screen);
        }

        if (fullWidth < x+device.GetFrameWidth())
          fullWidth = x+device.GetFrameWidth();
        if (fullHeight < y+device.GetFrameHeight())
          fullHeight = y+device.GetFrameHeight();

        x += device.GetFrameWidth();
        if (x > 2*(y+fullHeight)) {
          x = 0;
          y += fullHeight;
        }
      }

        //      ::SDL_WM_SetCaption(title, NULL);
        //
        //      if (::SDL_SetVideoMode(fullWidth, fullHeight, 0, SDL_SWSURFACE /* | SDL_RESIZABLE */) != m_surface) {
        //        PTRACE(1, "Couldn't resize surface: " << ::SDL_GetError());
        //      }

      for (DeviceList::iterator it = m_devices.begin(); it != m_devices.end(); ++it)
        (*it)->UpdateContent();
    }
};


///////////////////////////////////////////////////////////////////////

PVideoOutputDevice_SDL::PVideoOutputDevice_SDL()
  : m_texture(NULL)
  , m_renderer(NULL)
  , m_x(0)
  , m_y(0)
{
  colourFormat = "YUV420P";
  PTRACE(5, "Constructed.");
}


PVideoOutputDevice_SDL::~PVideoOutputDevice_SDL()
{ 
  Close();
  PTRACE(5, "Destroyed.");
}


PStringArray PVideoOutputDevice_SDL::GetOutputDeviceNames()
{
  return PPlugin_PVideoOutputDevice_SDL::ServiceName();
}


PStringArray PVideoOutputDevice_SDL::GetDeviceNames() const
{
  return GetOutputDeviceNames();
}


PBoolean PVideoOutputDevice_SDL::Open(const PString & name, PBoolean /*startImmediate*/)
{
  Close();

  deviceName = name;

  PSDL_Window::GetInstance().Run();
  PostEvent(PSDL_Window::e_AddDevice, true);
  return IsOpen();
}


PBoolean PVideoOutputDevice_SDL::IsOpen()
{
  return m_texture != NULL;
}


PBoolean PVideoOutputDevice_SDL::Close()
{
  if (!IsOpen())
    return false;
  
  PostEvent(PSDL_Window::e_RemoveDevice, true);
  return true;
}


PBoolean PVideoOutputDevice_SDL::SetColourFormat(const PString & colourFormat)
{
  if (colourFormat *= "YUV420P")
    return PVideoOutputDevice::SetColourFormat(colourFormat);

  return false;
}


PBoolean PVideoOutputDevice_SDL::SetFrameSize(unsigned width, unsigned height)
{
  if (width == frameWidth && height == frameHeight)
    return true;

  if (!PVideoOutputDevice::SetFrameSize(width, height))
    return false;

  if (IsOpen())
    PostEvent(PSDL_Window::e_SizeChanged, true);

  return true;
}


PINDEX PVideoOutputDevice_SDL::GetMaxFrameBytes()
{
  return GetMaxFrameBytesConverted(CalculateFrameBytes(frameWidth, frameHeight, colourFormat));
}


PBoolean PVideoOutputDevice_SDL::SetFrameData(unsigned x, unsigned y,
                                          unsigned width, unsigned height,
                                          const BYTE * data,
                                          PBoolean endFrame) 
{
  if (!IsOpen())
    return false;

  if (x != 0 || y != 0 || width != frameWidth || height != frameHeight || data == NULL || !endFrame)
    return false;

  PWaitAndSignal mutex(PSDL_Window::GetInstance());

  // ::SDL_LockYUVOverlay(m_overlay);

//  PAssert(frameWidth == (unsigned)m_overlay->w && frameHeight == (unsigned)m_overlay->h, PLogicError);
  PINDEX pixelsFrame = frameWidth * frameHeight;
  PINDEX pixelsQuartFrame = pixelsFrame >> 2;

  const BYTE * dataPtr = data;

  PBYTEArray tempStore;
  if (converter != NULL) {
    converter->Convert(data, tempStore.GetPointer(pixelsFrame+2*pixelsQuartFrame));
    dataPtr = tempStore;
  }

//  memcpy(m_overlay->pixels[0], dataPtr,                                  pixelsFrame);
//  memcpy(m_overlay->pixels[1], dataPtr + pixelsFrame,                    pixelsQuartFrame);
//  memcpy(m_overlay->pixels[2], dataPtr + pixelsFrame + pixelsQuartFrame, pixelsQuartFrame);

  SDL_UpdateTexture(m_texture, NULL, dataPtr, frameWidth * sizeof (Uint32));
  
  SDL_RenderClear(m_renderer);
  SDL_RenderCopy(m_renderer, m_texture, NULL, NULL);
  SDL_RenderPresent(m_renderer);
    
  //::SDL_UnlockYUVOverlay(m_overlay);

  PostEvent(PSDL_Window::e_ContentChanged, false);
  return true;
}


PString PVideoOutputDevice_SDL::GetTitle() const
{
  PINDEX pos = deviceName.Find("TITLE=\"");
  if (pos != P_MAX_INDEX) {
    pos += 6;
    PINDEX quote = deviceName.FindLast('"');
    return PString(PString::Literal, deviceName(pos, quote > pos ? quote : P_MAX_INDEX));
  }

  return "Video Output";
}


void PVideoOutputDevice_SDL::UpdateContent()
{
  if (m_texture == NULL)
    return;

  SDL_Rect rect;
  rect.x = (Uint16)m_x;
  rect.y = (Uint16)m_y;
  rect.w = (Uint16)frameWidth;
  rect.h = (Uint16)frameHeight;
  SDL_RenderPresent(m_renderer);
  
  //::SDL_DisplayYUVOverlay(m_overlay, &rect);
}


void PVideoOutputDevice_SDL::CreateTexture(struct SDL_Window * window)
{
  if (m_texture != NULL)
    return;

  m_texture = SDL_CreateTexture(m_renderer,
                      SDL_PIXELFORMAT_IYUV,
                      SDL_TEXTUREACCESS_STREAMING,
                      frameWidth,
                      frameHeight);
    
  if (m_texture == NULL) {
    PTRACE(1, "Couldn't create SDL texture: " << ::SDL_GetError());
    return;
  }

//  PINDEX sz = frameWidth*frameHeight;
//  memset(m_overlay->pixels[0], 0, sz);
//  sz /= 4;
//  memset(m_overlay->pixels[1], 0x80, sz);
//  memset(m_overlay->pixels[2], 0x80, sz);
}


void PVideoOutputDevice_SDL::FreeTexture()
{
  if (m_texture == NULL)
    return;

  //::SDL_FreeYUVOverlay(m_overlay);
  SDL_DestroyTexture(m_texture);
  m_texture = NULL;
}


void PVideoOutputDevice_SDL::PostEvent(unsigned code, bool wait)
{
  SDL_Event sdlEvent;
  sdlEvent.type = SDL_USEREVENT;
  sdlEvent.user.code = code;
  sdlEvent.user.data1 = this;
  sdlEvent.user.data2 = NULL;
  if (::SDL_PushEvent(&sdlEvent) < 0) {
    PTRACE(1, "Couldn't post user event " << (unsigned)sdlEvent.user.code << ": " << ::SDL_GetError());
    return;
  }

  PTRACE(5, "Posted user event " << (unsigned)sdlEvent.user.code);
  if (wait)
    PAssert(m_operationComplete.Wait(10000),
            PSTRSTRM("Couldn't process user event " << (unsigned)sdlEvent.user.code));
}


#else
  #pragma message("SDL video support DISABLED")
#endif // P_SDL


// End of file ////////////////////////////////////////////////////////////////
