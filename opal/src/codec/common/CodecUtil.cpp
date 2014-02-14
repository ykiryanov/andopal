#include "umc_defs.h"

#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_types.h"
#include <ippi.h>

#include "CodecUtil.h"

static int s_nAssert = 0;
void dbAssert(int i)
{    
    if (i==0)
        s_nAssert++;
}

#if PTRACING_X
void Dump16x16(const char* pszMsg, const u8* pPlane, uint nStep)
{
    ostream& out = Trace::Start( __FILE__, __LINE__);
    out << pszMsg << std::endl;

    char buf[128];
    for (uint i=0;i<16;i++) {
        char* pStr = buf;
        for (uint i=0;i<16;i++)
            pStr += sprintf(pStr,"%2.2x" , pPlane[i]);
        pPlane += nStep;
        out << buf << std::endl;
    }
}

void Dump4x4(const char* pszMsg, const u8* pPlane, uint nStep)
{
    ostream& out = Trace::Start( __FILE__, __LINE__);
    out << pszMsg << std::endl;

    char buf[128];
    for (uint i=0;i<4;i++) {
        char* pStr = buf;
        for (uint i=0;i<4;i++)
            pStr += sprintf(pStr,"%2.2x" , pPlane[i]);
        pPlane += nStep;
        out << buf << std::endl;
    }
}

void Dump8x8(const char* pszMsg, const u8* pPlane, uint nStep)
{
    ostream& out = Trace::Start( __FILE__, __LINE__);
    out << pszMsg << std::endl;

    char buf[128];
    for (uint i=0;i<8;i++) {
        char* pStr = buf;
        for (uint i=0;i<8;i++)
            pStr += sprintf(pStr," %x" , pPlane[i]);
        pPlane += nStep;
        out << buf << std::endl;
    }
}

void DumpMem(const char* pszMsg, const u8* pMem, uint nSize)
{
    ostream& out = Trace::Start( __FILE__, __LINE__);
    out << pszMsg << std::endl;

    char buf[512];
    uint offset = 0;
    while (offset < nSize) {
        char* pStr = buf;
        uint n = nSize - nSize;
        if (n > 64)
            n = 64;

        pStr += sprintf(pStr," %8.8x:  " , offset);            
        for (uint i=0;i<16;i++)
            pStr += sprintf(pStr," %2.2x" , pMem[offset++]);            
        out << buf << std::endl;
    }
}

void DumpBuf(const char* pszMsg, const void* ptr, int len)
{
    if (!ptr)
        return;

    const unsigned char* p = (const unsigned char*) ptr;
    printf("%s[%d] = {", pszMsg, len);    
    if (len > 257)
        len = 257;
    if (len++ < 10) {
        while (--len > 0)
            printf("0x%2.2x, ",*p++);
    }
    else {
        do {
            for (int i=0; (i<16) && (--len > 0); i++) 
                printf(i?" %2.2X":"\n  %2.2X",*p++);
        } while (len);
    }
    printf("}\n");
}
#else
#define Dump16x16
#define Dump4x4
#define DumpMem
#define DumpBuf
#endif


void copy16x16(u8* pDst, uint nDstStep, const u8* pSrc, uint nSrcStep)
{
    for (int i=0;i<16;i++) {
        memcpy(pDst,pSrc,16);
        pDst += nDstStep;
        pSrc += nSrcStep;
    }
}

/*
bool cmp16x16(const u8* pSrc1, uint nSrc1Step, const u8* pSrc2, uint nSrc2Step)
{
    for (int i=0;i<16;i++) {
        if (memcmp(pSrc1,pSrc2,16) != 0)
            return false;
        pSrc1 += nSrc1Step;
        pSrc2 += nSrc2Step;
    }
    return true;
}
*/


uint cmp16x16(const u8* pSrc1, uint nSrc1Step, const u8* pSrc2, uint nSrc2Step)
{
    uint nSum = 0;
    for (int i=0;i<16;i++) {
        for (int j=0;j<16;j++) {
            if (pSrc1[j] != pSrc2[j]) {
                if (pSrc1[j] > pSrc2[j]) 
                    nSum += pSrc1[j] - pSrc2[j];
                else 
                    nSum += pSrc2[j] - pSrc1[j];
            }
        }
        pSrc1 += nSrc1Step;
        pSrc2 += nSrc2Step;
    }
    return nSum;
}


char toHex(uint n)
{
    if (n < 10)
        return n + '0';
    if (n == 10) 
        return 'a';
    else if (n == 11) 
        return 'b';
    else if (n == 12) 
        return 'c';
    else if (n == 13) 
        return 'd';
    else if (n == 14) 
        return 'e';
    else
        return 'f';
}

void DumpDiff16x16(const u8* pSrc1, uint nSrc1Step, const u8* pSrc2, uint nSrc2Step)
{
#if 0    
    ostream& out = Trace::Start( __FILE__, __LINE__);
    out << "--------------------" << std::endl;
    char buf[128];
    uint nSum = 0;
    for (int i=0;i<16;i++) {
        char* p =buf;
        for (int j=0;j<16;j++) {
            if (pSrc1[j] != pSrc2[j]) {
                if (pSrc1[j] > pSrc2[j]) {
                    *p ++ = '+';
                    *p ++ = toHex(pSrc1[j] - pSrc2[j]);
                } else {
                    *p ++ = '+';
                    *p ++ = toHex(pSrc2[j] - pSrc1[j]);
                }
            }
            else {
                *p ++ = '.';
                *p ++ = '.';
            }

        }
        *p = '\0';
        out << buf << std::endl;
        pSrc1 += nSrc1Step;
        pSrc2 += nSrc2Step;
    }
#endif    
}



bool cmp4x4(const Ipp8u* pSrc1, uint nSrc1Step, const Ipp8u* pSrc2, uint nSrc2Step)
{
    for (int i=0;i<4;i++) {
        if (memcmp(pSrc1,pSrc2,4) != 0)
            return false;
        pSrc1 += nSrc1Step;
        pSrc2 += nSrc2Step;
    }
    return true;
}
