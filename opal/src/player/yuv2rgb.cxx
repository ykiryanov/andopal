//
//  yuv2rgb.cpp
//  Android
//
//  Created by Sergey Bezruchkin
//
//

#include <stdio.h>
#include <string.h>
#include <memory.h>

typedef unsigned char   uint8_t;
typedef unsigned char   uchar;
typedef unsigned int    uint;
typedef unsigned long   ulong;

#define SCALEBITS 10
#define ONE_HALF  (1 << (SCALEBITS - 1))
#define FIX(x)    ((int) ((x*0.5) * (1<<SCALEBITS) + 0.5))

#define YUV_TO_RGB1(u,v)  pixelUV = (pYUV2RGB[u+256] + pYUV2RGB[v+512]) & mask
#define YUV_TO_RGB2(r, g, b, y) pixel = (pixelUV + pYUV2RGB[y]) & mask
#define RGB_OUT_555(p, r, g, b) *((ulong*)(p)) = pixel

static  ulong* s_YUV2RGB = NULL;

struct BoneRect { long left, top, right, bottom;};

struct BoneSurfaceInfo
{
    uchar*      pImage;
    unsigned    nWidth;
    unsigned    nHeight;
    unsigned    nImageSize;
    int         iPitchX;
    int         iPitchY;
	unsigned	nPixelFormatType;
    unsigned    mViewX;
    unsigned    mViewY;
    unsigned    mViewWidth;
    unsigned    mViewHeight;
};

/*
 inline ulong RGB2PIXEL(ulong r,ulong g,ulong b)
 {
 return ulong (((r & 0x0fe) << 16) | ((g & 0x0fe) << 8) | (b & 0x0fe));
 }*/

inline ulong RGB2PIXEL(ulong r,ulong g,ulong b)
{
    return ulong (((b & 0x0fe) << 16) | ((g & 0x0fe) << 8) | (r & 0x0fe));
}

#define FSCALE(a,b)        ((int(a*5800.0)*(b))/8192)

static ulong* GetYUV2RGB()
{
    if (s_YUV2RGB)
        return s_YUV2RGB;
    
    s_YUV2RGB = new ulong[256*3];
    
    long r,g,b;
    ulong pixel;
    
    r = g = b = 0;
    pixel = RGB2PIXEL(r,g,b);
    int i=0;
    for (i=0;i<256;++i)  {
        if (i<16)
            s_YUV2RGB[i] =  RGB2PIXEL(16,16,16);
        else if (i>250)
            s_YUV2RGB[i] =  RGB2PIXEL(250,250,250);
        else
            s_YUV2RGB[i] =  RGB2PIXEL(i,i,i);
        s_YUV2RGB[i] |= 0xFF000000;
    }
    
    
    r = 0;
    g = FSCALE(-0.344,16-128);
    b = FSCALE(1.7720,16-128);
    pixel = RGB2PIXEL(r,g,b);
    
    for (i=0;i<16;++i)
        s_YUV2RGB[i+256] = pixel;
    
    for (;i<=240;++i) {
        r = 0;
        g = FSCALE(-0.344,i-128);
        b = FSCALE(1.7720,i-128);
        s_YUV2RGB[i+256] = pixel = RGB2PIXEL(r,g,b);
    }
    
    for (;i<256;++i)
        s_YUV2RGB[i+256] = pixel;
    
    
    r = FSCALE(1.402,i-128);
    g = FSCALE(-0.714,i-128);
    b = 0;
    pixel = RGB2PIXEL(r,g,b);
    
    for (i=0;i<16;++i)
        s_YUV2RGB[i+512] = pixel;
    
    for (;i<240;++i) {
        r = FSCALE(1.402,i-128);
        g = FSCALE(-0.714,i-128);
        b = 0;
        s_YUV2RGB[i+512] = pixel = RGB2PIXEL(r,g,b);
    }
    
    for (;i<256;++i)
        s_YUV2RGB[i+512] = pixel;
    
    return s_YUV2RGB;
}

void yuv420_to_argb32_clip(
                           const uint8_t* pY, const uint8_t* pU, const uint8_t* pV, int iPitch, int sWidth, int sHeight,
                           uint8_t* pDst, int iPitchX, int iPitchY,
                           const BoneRect& rOut, const BoneRect& rClip)
{
    if (rOut.left >= rClip.right)
        return;
    if (rOut.top >= rClip.bottom)
        return;
    if (rOut.right <= rClip.left)
        return;
    if (rOut.bottom <= rClip.top)
        return;
    
    int dWidth  = rOut.right - rOut.left;
    int dHeight = rOut.bottom - rOut.top;
    
    int aX = (sWidth > dWidth) ? sWidth/dWidth : 1;
    int aSumX = aX*dWidth;
    
    int aY = (sHeight > dHeight) ? sHeight/dHeight : 1;
    int aSumY = aY*dHeight;
    int aPitchY = aY*iPitch;
    
    int x0 = rOut.left;
    int iY0 = 0;
    int iSumX0 = dWidth;
    if (rClip.left > rOut.left) {
        x0 = rClip.left;
        iSumX0 -= (rClip.left-rOut.left)*sWidth;
        if (iSumX0 <= 0) {
            iY0 = -iSumX0/dWidth + 1;
            iSumX0 += iY0*dWidth;
        }
    }
    int dOutWidth = (rClip.right < rOut.right ? rClip.right : rOut.right)- x0;
    
    int y0 = rOut.top;
    int iLine = 0;
    int iSumY = dHeight;
    if (rClip.top > rOut.top) {
        y0 = rClip.top;
        iSumY -= (rClip.top-rOut.top)*sHeight;
        if (iSumY <= 0) {
            iLine = -iSumY/dHeight+1;
            iSumY += iLine*dHeight;
            pY += iLine*iPitch;
            int uvShift = (iLine>>1)*(iPitch>>1);
            pU += uvShift;
            
			if(pV != NULL)
				pV += uvShift;
            
			iLine &= 1;
        }
    }
    int dOutHeight = (rClip.bottom < rOut.bottom ? rClip.bottom : rOut.bottom) - y0;
    
    const ulong* pYUV2RGB = s_YUV2RGB;
    if (!pYUV2RGB) {
        pYUV2RGB = GetYUV2RGB();
    }
    
    pDst += x0*iPitchX + y0*iPitchY;
    ulong mask = 0xfffefefe;
    
    for (;;) {
        register uint8_t* po = pDst;
        register int iY = iY0;
        register int iSumX = iSumX0;
        register int x = dOutWidth;
        for (;;) { // Fill one line
            int iUV = iY>>1;
            ulong pixel = pYUV2RGB[pU[iUV]+256];
			if(pV != NULL)
				pixel += pYUV2RGB[pV[iUV]+512];
            
			pixel &= mask;
			pixel += pYUV2RGB[pY[iY]];
			pixel &= mask;
			pixel |= 0x0ff000000;
			
			*((ulong*) po) = pixel;
            
            po += iPitchX;
            if (--x <= 0)
                break;
            iSumX -= sWidth;
            if (iSumX <= 0) {
                iY +=  aX;
                iSumX += aSumX;
                if (iSumX <= 0) {
                    iSumX += dWidth;
                    ++iY;
                }
            }
        }
        
        if (--dOutHeight<=0)
            return;
        pDst += iPitchY;
        iSumY -= sHeight;
        if (iSumY > 0) {
            uint8_t* pPrevLine = pDst - iPitchY;
            do {
                if (iPitchX != 2) {
                    po = pDst;
                    register uint8_t* pi = pPrevLine;
                    int x = dOutWidth;
                    do {
                        *((ulong*)po) = *((ulong*)pi);
                        po += iPitchX;
                        pi += iPitchX;
                    } while (--x>0);
                } else {
                    memcpy(pDst,pPrevLine,dOutWidth<<1);
                }
                if (--dOutHeight <= 0)
                    return;
                pDst += iPitchY;
                iSumY -= sHeight;
            } while (iSumY > 0);
        }
        
        iLine += aY;
        pY += aPitchY;
        iSumY += aSumY;
        if (iSumY <= 0) {
            iLine++;
            pY += iPitch;
            iSumY += dHeight;
        }
        int iN = iLine >> 1;
        if (iN) {
            if (iN > 1)
                iN *= (iPitch>>1);
            else
                iN = iPitch>>1;
            pU += iN;
            
			if(pV != NULL)
				pV += iN;
        }
        iLine &= 1;
    }
}

