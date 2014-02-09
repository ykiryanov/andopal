/*
 *  g2dUtil.h
 *  iDinsk
 *
 *  Copyright 2009-2012 Dinsk, LLP. All rights reserved.
 *
 */

#pragma once

typedef  unsigned char uchar;

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

struct CropTable {
    enum { MAX_BOUNDARY = 1024};
    uchar _Table[256 + 2*MAX_BOUNDARY];

    static const uchar* Get() { return s_CropTable._Table + MAX_BOUNDARY;}
    static const CropTable s_CropTable;
    CropTable();
};

typedef void (*YUV420_CLIP) (
    const uchar* pY, const uchar* pU, const uchar* pV, int iPitch, int sWidth, int sHeight, 
    uchar* pDst, int iPitchX, int iPitchY,
    const BoneRect& rOut, const BoneRect& rClip);



void yuv420_to_RGB555(const uchar* psY, const uchar* psU, const uchar* psV, int iPitch, int sWidth, int sHeight, 
    uchar* pDst, int iPitchX, int iPitchY, int dWidth, int dHeight);

void yuv420_to_RGB565(const uchar* psY, const uchar* psU, const uchar* psV, int iPitch, int sWidth, int sHeight, 
    uchar* pDst, int iPitchX, int iPitchY, int dWidth, int dHeight);

void yuv420_to_RGB(const uchar* psY, const uchar* psU, const uchar* psV, int iPitch, int sWidth, int sHeight, 
    uchar* pDst, int iPitchX, int iPitchY, int dWidth, int dHeight);

void yuv420_to_rgb565_clip(
    const uchar* pY, const uchar* pU, const uchar* pV, int iPitch, int sWidth, int sHeight, 
    uchar* pDst, int iPitchX, int iPitchY,
    const BoneRect& rOut, const BoneRect& rClip);

void yuv420_to_rgb555_clip(
    const uchar* pY, const uchar* pU, const uchar* pV, int iPitch, int sWidth, int sHeight, 
    uchar* pDst, int iPitchX, int iPitchY,
    const BoneRect& rOut, const BoneRect& rClip);

void yuv420_to_argb32_clip(
	const uchar* pY, const uchar* pU, const uchar* pV, int iPitch, int sWidth, int sHeight, 
	uchar* pDst, int iPitchX, int iPitchY,
	const BoneRect& rOut, const BoneRect& rClip);

#ifdef __cplusplus
extern "C" {
#endif

void yuv420_to_argb32(const uchar* pYUV, unsigned width, unsigned height, uchar* pDst, int iPitchY);

#ifdef __cplusplus
}
#endif
        
void argb32_to_yuv420(
    uint width, uint height,  uchar* rgb, int rgbPitch,
    uchar* y, int yPitch, uchar* u, int uPitch, uchar* v, int vPitch);

#ifdef SB_DBG
void YUV420_cleaar_UV(uchar* pYUV, unsigned width, unsigned height);

void YUV420_cleaar_U(uchar* pYUV, unsigned width, unsigned height);

void YUV420_cleaar_V(uchar* pYUV, unsigned width, unsigned height);

void YUV420_copy_U_plane_on_Y(uchar* pYUV, unsigned width, unsigned height);

#endif // SB_DBG
