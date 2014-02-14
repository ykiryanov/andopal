#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>


#include "h264Stream.h"


#define MAX_RTP_FRAME   2048

#define  SB_DEBUG_OUT_FILE  "c:\\tmp\\h264.out"
#define  SB_DEBUG_IN_FILE   "c:\\tmp\\h264.in"

static bool   s_bOut = false;
static bool   s_bTryOpenOutput = false;
static FILE*  s_FileOut = NULL;

static bool   s_bIn = false;
static bool   s_bTryOpenInput = false;
static FILE*  s_FileIn = NULL;
static char   s_InBuf[MAX_RTP_FRAME];


bool OpenOutFile()
{
    s_bTryOpenOutput = true;
    if (s_FileOut)
        return true;
    s_FileOut = fopen(SB_DEBUG_OUT_FILE,"wbn");
    if (s_FileOut == NULL)
        s_FileOut = fopen(SB_DEBUG_OUT_FILE,"wbn");
    return s_FileOut != NULL ? true : false;
}

bool OpenInFile()
{
    s_bTryOpenInput = true;
    if (s_FileIn)
        return true;
    s_FileIn = fopen(SB_DEBUG_IN_FILE,"rb");
    return s_FileIn != NULL ? true : false;
}


void dbgOutRtpFrame(const void*& pSrc, unsigned& nSrcLen, void*& pDst, unsigned& nDstLen, unsigned& flags)
{
    if (!s_FileOut && (s_bTryOpenOutput || !OpenOutFile()))
        return;
    unsigned short uRecLen = nSrcLen;
    fwrite(&uRecLen, sizeof(uRecLen), 1, s_FileOut);
    fwrite(pSrc, nSrcLen, 1, s_FileOut);
    fflush(s_FileOut);
}

void dbgInRtpFrame(const void*& pSrc, unsigned& nSrcLen, void*& pDst, unsigned& nDstLen, unsigned& flags)
{
    nSrcLen = 0;
    if (!s_FileIn && (s_bTryOpenInput || !OpenInFile()))
        return;
    unsigned short uRecLen;

    fread(&uRecLen, sizeof(uRecLen), 1, s_FileIn);
    if (uRecLen > MAX_RTP_FRAME) {
        fclose(s_FileIn);
        s_FileIn = NULL;
        return;
    }
    
    fread(s_InBuf, uRecLen, 1, s_FileIn);
    pSrc = s_InBuf;
    nSrcLen = uRecLen;
}

void dbgInRtpFrameStatic(const void*& pSrc, unsigned& nSrcLen, void*& pDst, unsigned& nDstLen, unsigned& flags)
{
    static unsigned uCurPos = 0;
    
    if (uCurPos > sizeof(H264_DATA))
        uCurPos = 0;

    unsigned uRecLen = *(unsigned short*) (H264_DATA + uCurPos); 
    uCurPos += sizeof(unsigned short);

    if (uCurPos + uRecLen > sizeof(H264_DATA)) {
        uCurPos = 0;
        return;
    }

    if (uRecLen > MAX_RTP_FRAME) {
        uCurPos = 0;
        return;
    }

    memcpy(s_InBuf, H264_DATA + uCurPos, uRecLen);
    uCurPos += uRecLen;
    pSrc = s_InBuf;
    nSrcLen = uRecLen;
}



void dbgOnCloseDecode()
{
    if (s_FileOut)
        fclose(s_FileOut);

    if (s_FileIn)
        fclose(s_FileIn);

    s_FileOut = NULL;
    s_FileIn  = NULL;
    s_bTryOpenOutput = false;
    s_bTryOpenInput = false;
}

void dbgBeforeDecode(const void*& pSrc, unsigned& nSrcLen, void*& pDst, unsigned& nDstLen, unsigned& flags)
{
    if (s_bOut) 
        dbgOutRtpFrame( pSrc, nSrcLen, pDst, nDstLen, flags);

    if (s_bIn)
        dbgInRtpFrame( pSrc, nSrcLen, pDst, nDstLen, flags);
    else
        dbgInRtpFrameStatic( pSrc, nSrcLen, pDst, nDstLen, flags);
}


/////////////////////////////////////////////////////////////////////////////
#if 0
bool H264Decoder::DecodeFrames(const BYTE* src, unsigned& srcLenRef, BYTE* dst, unsigned& dstLen, unsigned& flags)
{//
    unsigned srcLen = srcLenRef;

#ifdef SB_DEBUG_IN_FILE
    BYTE buf[2000];
    static bool bTryOpenInput = false;
    if (!bTryOpenInput && !s_FileIn) {
        bTryOpenInput = true;
        s_FileIn = fopen(SB_DEBUG_IN_FILE,"rb");
    }

    if (s_FileIn) {
        RecDescr hdr;
        if ((fread(&hdr, sizeof(hdr), 1, s_FileIn) != 1) ||
            (hdr.dwSrcSize > sizeof(buf)) ||
            (fread(&buf, hdr.dwSrcSize, 1, s_FileIn) != 1))
        {
            fclose(s_FileIn);
            s_FileIn  = NULL;
        }
        else {
            src = buf;
            srcLen = hdr.dwSrcSize;
        }
    }
#endif
#endif

