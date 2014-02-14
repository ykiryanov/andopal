#include "stdafx.h"
#include "debug.h"
#include "g2d.h"
#include "VideoCapture.h"
#include "umc_h263_video_encoder.h"
#include "umc_h263_video_decoder.h"
#include "umc_video_data.h"

const char* g_pszDebugLogFile = "wceVP.txt";


XDisplay*           g_pDisplay      = NULL;
XView*              g_pView         = NULL;
IVideoInputDevice*  g_pVideoCapture = NULL;

using namespace UMC;

H263EncoderParams*  g_pEncoderParam = NULL;
H263VideoEncoder*   g_pEncoder      = NULL;
H263VideoDecoder*   g_pDecoder      = NULL;
VideoDecoderParams* g_pDecoderParam = NULL;
VideoData*          g_pCaptureFrame = NULL;

int                 g_nFramesEncoded    = 0;

extern void yuv420_to_rgb555(int width, int height,
    const  uchar* y, int yLine,
    const  uchar* u, int uLine,
    const  uchar* v, int vLine,
    uchar* rgb, int rgbLine);

extern void yuv420_to_rgb565(int width, int height,
    const  uchar* y, int yLine,
    const  uchar* u, int uLine,
    const  uchar* v, int vLine,
    uchar* rgb, int rgbLine);


void TestVideo();

bool AppInit(HWND hWnd, LPTSTR pszOpenUrl)
{
    Rect r;

    TestVideo();

//  int iWidth = 128, iHeight= 96;
//  int iWidth = 160, iHeight= 120;
    int iWidth = 176, iHeight= 144;
//  int iWidth = 240, iHeight= 176;
//  int iWidth = 320, iHeight= 240;
//  int iWidth = 352, iHeight= 288;
//  int iWidth = 640, iHeight= 480;
//  int iWidth = 240, iHeight= 176;
//  int iWidth = 160, iHeight= 120;

    g_pVideoCapture = GetVideoInputDevice();

#ifndef _WIN32_WCE
    if (g_pVideoCapture  && FAILED(g_pVideoCapture->SetFormat("I420",iWidth,iHeight,10))) {
        delete g_pVideoCapture;
        g_pVideoCapture = NULL;
    }
#endif

/*
#ifndef _WIN32_WCE
    if (g_pVideoCapture && FAILED(g_pVideoCapture->SetFormat("YUV420P",640,480,10))){
        delete g_pVideoCapture;
        g_pVideoCapture = NULL;
    }
#endif
*/

    GetWindowRect(hWnd, &r);

    r -= p2(r.left,r.top);

/*
    if (r.GetWidth() > g_pVideoPlayer->GetWidth()) {
        r.left = (r.GetWidth() - g_pVideoPlayer->GetWidth())/2;
        r.right = r.left + g_pVideoPlayer->GetWidth();
    }

    if (r.GetHeight() > g_pVideoPlayer->GetHeight()) {
        r.top = (r.GetHeight() - g_pVideoPlayer->GetHeight())/2;
        r.bottom = r.top + g_pVideoPlayer->GetHeight();
    }
*/

    g_pEncoderParam = new H263EncoderParams();
    g_pEncoder = new H263VideoEncoder();

/*
    UMC::Status res = g_pEncoderParam->ReadParamFile(L"h263.par");
    if (res < UMC_OK) {
        if (res == UMC_ERR_OPEN_FAILED) {
//            vm_string_fprintf(vm_stderr, VM_STRING("Error: Can't open par file %s\n"), ParFileName);
        } else {
//            vm_string_fprintf(vm_stderr, VM_STRING("Error: Can't parse par file %s\n"), ParFileName);
        }
        return false;
    }
*/

    if (g_pVideoCapture) {
        g_pVideoCapture->Start();
        g_pVideoCapture->GetSize(iWidth,iHeight);

        g_pCaptureFrame = new VideoData;
        if (!g_pCaptureFrame)
            return false;

        if (iWidth<0)
            iWidth = -iWidth;
        if (iHeight<0)
            iHeight = -iHeight;

        g_pCaptureFrame->Init(iWidth, iHeight, YUV420, 8);
        g_pCaptureFrame->Alloc();

        g_pEncoderParam->info.clip_info.width = (Ipp32s) iWidth;
        g_pEncoderParam->info.clip_info.height = (Ipp32s) iHeight;
        g_pEncoderParam->m_Param.Width  = iWidth;
        g_pEncoderParam->m_Param.Height = iHeight;
        g_pEncoderParam->info.framerate = 10;
    }

    g_pEncoderParam->numThreads = 1;

    if (g_pEncoder->Init(g_pEncoderParam) != UMC_OK)
        return false;
    
    if (g_pEncoder->GetInfo(g_pEncoderParam) != UMC_OK) {
//        vm_string_fprintf(vm_stderr, VM_STRING("Error: Video encoder GetInfo failed\n"));
        return false;
    }
    r = Rect(0,0,iWidth*2,iHeight*2);

    g_pDisplay = CreateXDisplay(hWnd,r);
    if (!g_pDisplay)
        return false;

//  Rect rView(0,0,140,180); //g_pVideoPlayer->GetWidth(),g_pVideoPlayer->GetHeight());
    r.Cross(Rect(0,0,g_pDisplay->GetWidth(),g_pDisplay->GetHeight()));

    g_pView = g_pDisplay->CreateView(r);  //,eRotated270);

    return true;
}



void AppClose(void)
{
//    delete g_pView;     g_pView = NULL;
    delete g_pDisplay;  g_pDisplay = NULL;
}


void Draw(VideoData& video, XSurface* pSurface,int Xoffset)
{
    video.GetWidth();
    video.GetHeight();

    assert(Xoffset >= 0);
    if (Xoffset < 0)
        return;

    int iWidth = pSurface->GetWidth() - Xoffset;
    if (iWidth <= 0)
        return;

    int iHeight = pSurface->GetHeight();

    if (video.GetWidth() < iWidth)
        iWidth = video.GetWidth();

    if (video.GetHeight() < iHeight)
        iHeight = video.GetHeight();

    if (pSurface->GetPixelFormat() == eRGB555)
        yuv420_to_rgb555(iWidth, iHeight,               
            (const uchar*) video.GetPlanePointer(0), video.GetPlanePitch(0), 
            (const uchar*) video.GetPlanePointer(1), video.GetPlanePitch(1), 
            (const uchar*) video.GetPlanePointer(2), video.GetPlanePitch(2),
            pSurface->GetImage()+ pSurface->GetXPitch()*Xoffset, 
            pSurface->GetYPitch());
    else if (pSurface->GetPixelFormat() == eRGB565)
        yuv420_to_rgb565(iWidth, iHeight,               
            (const uchar*) video.GetPlanePointer(0), video.GetPlanePitch(0), 
            (const uchar*) video.GetPlanePointer(1), video.GetPlanePitch(1), 
            (const uchar*) video.GetPlanePointer(2), video.GetPlanePitch(2),
            pSurface->GetImage()+ pSurface->GetXPitch()*Xoffset, 
            pSurface->GetYPitch());
}





bool AppIdle(void)
{
    XSurface* pSurface = g_pView->GetSurface();
    if (!pSurface)
        return true;

    static int rgb=0; 
    rgb += 0x050000;
    if (rgb & 0xff000000)
        rgb = 0;
    if (pSurface->GetXPitch() != 2)
        return false;

    if (!g_pVideoCapture) {
        uchar* pDstLine = pSurface->GetImage();
        for (uint i=0; i < pSurface->GetHeight(); ++i) {
            ushort* pDst = (ushort*) pDstLine;  pDstLine += pSurface->GetYPitch();
            ulong color = rgb | ((i*255/(pSurface->GetHeight()-1))<<8);
            for (uint j=0;j<pSurface->GetWidth();++j) {
                color = (color&0x00FFFF00) | (j*255/(pSurface->GetWidth()-1));
                *pDst ++ = (ushort) pSurface->RgbToPixel( color);
            }
        }
        g_pDisplay->Flush();
        return true;
    }

    int iFrameWidth, iFrameHeight;
    if (g_pVideoCapture->GetSize(iFrameWidth, iFrameHeight) != S_OK)
        return false;

    if (iFrameWidth < 0)
        iFrameWidth = - iFrameWidth;

    if (iFrameHeight < 0)
        iFrameHeight = - iFrameHeight;

    g_pVideoCapture->Run();

//    DWORD dwFrameSize = g_pVideoCapture->GetFrameSize();
//    PBYTE  pYUV420C = g_pVideoCapture->GetFrame();
//    if (!dwFrameSize || !pYUV420C) 
//        return true;

    MediaData outH263(4*iFrameWidth*iFrameHeight);
    
    if (!g_pCaptureFrame)
        return true;

    DWORD size = g_pCaptureFrame->GetBufferSize();

    if (size != g_pVideoCapture->GetFrame((PBYTE)g_pCaptureFrame->GetBufferPointer(), size))
        return true;

    Draw(*g_pCaptureFrame, pSurface, 0);
#if 0
    {
    __int64 avrg = 0;
    int size = iFrameWidth*iFrameHeight;   
    for (int j=0;j<iFrameHeight;++j) {
        ushort* pImage = (ushort*) (pSurface->GetImage() + pSurface->GetYPitch()*j);
        for (int i=0;i<iFrameWidth;++i) 
            avrg += __int64 (pImage[i]);
    }
    avrg /= size;
    __int64 d2 = 0;
    for (int j=0;j<iFrameHeight;++j) {
        ushort* pImage = (ushort*) (pSurface->GetImage() + pSurface->GetYPitch()*j);
        for (int i=0;i<iFrameWidth;++i)  {
            __int64 d = (avrg- __int64(pImage[i]));
            d2 += d*d;
        }
    }
    
    if (int(d2/size) > 2) 
        Draw(in, pSurface, iFrameWidth);
    WCHAR buff[5000];
    swprintf(buff,L"avrg=%d,d2=%d\n",int(avrg),int(d2/size));
    OutputDebugString(buff);
    }
#endif
//  g_pDisplay->Flush();
//  return true;

    g_pCaptureFrame->SetTime(++g_nFramesEncoded);

    UMC::Status ret = g_pEncoder->GetFrame(g_pCaptureFrame, &outH263);

    if (ret != UMC_OK && ret != UMC_ERR_NOT_ENOUGH_DATA && ret != UMC_ERR_END_OF_STREAM) {
//      vm_string_fprintf(vm_stderr, VM_STRING("Error: encoding failed at %d source frame (exit with %d)!\n"), mFramesEncoded, ret);
      return false;
    }


    if (!g_pDecoder && !g_pDecoderParam) {
        g_pDecoder = new H263VideoDecoder();
        g_pDecoderParam = new VideoDecoderParams();

//      g_pDecoderParam->pPostProcessing  = new VideoProcessing();
        g_pDecoderParam->info.stream_type = H263_VIDEO;
        g_pDecoderParam->numThreads = 1;
        g_pDecoderParam->lFlags = 0;
        g_pDecoderParam->m_pData = &outH263;
        g_pDecoderParam->info.clip_info.width  = iFrameWidth;
        g_pDecoderParam->info.clip_info.height = iFrameHeight;

        if (g_pDecoder->Init(g_pDecoderParam)!=0) {
            delete g_pDecoder;
            g_pDecoder = NULL;
        }
        else {
            BaseCodecParams params;
            if (g_pDecoder->GetInfo(&params) != UMC_OK) {
                delete g_pDecoder;
                g_pDecoder = NULL;
            }
        }
    }

    if (g_pDecoder) {
        VideoData out;
        out.SetAlignment(16);
//          out->Init(params.info.clip_info.width, params.info.clip_info.height, cf, bitDepth);
        out.Init(iFrameWidth, iFrameHeight, YUV420, 8);
        out.Alloc();
        g_pDecoder->GetFrame(&outH263, &out);
//#if 0
        Draw(out, pSurface, iFrameWidth);
#if 0
        int nDiff = 0;
        for (int i=0;i<iFrameHeight;++i) {
            ushort* p1 = (ushort*)(pSurface->GetImage() + pSurface->GetYPitch()*i);
            ushort* p2 = p1 + iFrameWidth;
            ushort* pout = (ushort*)((uchar*)p1 + pSurface->GetYPitch()*iFrameHeight);
            for (int k=0;k<iFrameWidth;++k) {
/*
#define R(a)  (((a)>>7)  & 0x0F8)
#define G(a)  (((a)>>2)  & 0x0F8)
#define B(a)  (((a)<<3)  & 0x0F8)
                ushort r = (R(p1[k]) - R(p2[k]) + 64) & 0xf8;
                ushort g = (G(p1[k]) - G(p2[k]) + 64) & 0xf8;
                ushort b = (B(p1[k]) - B(p2[k]) + 64) & 0xf8;
                pout[k] = (r << 7)| (g<<2) | (b>>3);
                
                ushort a1 = p1[k] | 0x04210;
                ushort a2 = p2[k] & ~0x04210;
                a1 -= a2;
                a1 &= ~0x04210;
//                a1 += 0x01ce7;
//                a1 += 0x03def;
                a1 += 0x02108;
                a1 &= ~0x04210;
                if (pout[k] != a1) {
                    ++ nDiff;
                    pout[k] = 0xffff;
                }
*/
                pout[k] = (((p1[k]|0x04210) - (p2[k]&~0x04210)) + 0x02108) & ~0x04210;
            }
        }
#endif
    }

    g_pDisplay->Flush();
    return true;
}


void TestVideo()
{
    int i;
    uchar im1[16*16];
    uchar im2[16*16];
    uchar im3[16*16];
    short im16[32*32];

    for (i=0;i<16*16;++i) {
        im1[i] = rand();
        im2[i] = rand();
        im3[i] = rand();
    }

    for (i=0;i<32*32;++i) 
        im16[i]= i%63;


    Ipp32s delta;
    XippiSAD8x8_8u32s_C1R(im1,16,im2,16,&delta,IPPVC_MC_APX_FF);
    XippiSAD8x8_8u32s_C1R(im1,16,im2,16,&delta,IPPVC_MC_APX_FH);
    XippiSAD8x8_8u32s_C1R(im1,16,im2,16,&delta,IPPVC_MC_APX_HF);
    XippiSAD8x8_8u32s_C1R(im1,16,im2,16,&delta,IPPVC_MC_APX_HH);
    XippiSAD16x16_8u32s(im1,16,im2,16,&delta,IPPVC_MC_APX_FF);
    XippiSAD16x16_8u32s(im1,16,im2,16,&delta,IPPVC_MC_APX_FH);
    XippiSAD16x16_8u32s(im1,16,im2,16,&delta,IPPVC_MC_APX_HF);
    XippiSAD16x16_8u32s(im1,16,im2,16,&delta,IPPVC_MC_APX_HH);

    for(i=0;i<8;++i)
        XippiCopy8x8HP_8u_C1R(im1,16,im3,16,i>>1,i&1);

    for(i=0;i<8;++i)
        XippiCopy16x16HP_8u_C1R(im1,16,im3,16,i>>1,i&1);

    for(i=0;i<8;++i)
        XippiAdd8x8HP_16s8u_C1RS(im16, 16, im1,16, im3, 16, i>>1, i&1);

}
