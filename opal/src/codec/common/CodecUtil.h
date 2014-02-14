#pragma once 
#ifndef __CodecUtil_h
#define __CodecUtil_h

#ifdef WIN32
typedef unsigned __int64 u64;
#else
typedef unsigned long long u64;
#endif

typedef unsigned char u8;
typedef unsigned int uint;
typedef unsigned long ulong;
typedef unsigned long u32;


void dbAssert(int i);
void Dump16x16(const char* pszMsg, const u8* pPlane, uint nStep);
void Dump8x8(const char* pszMsg, const u8* pPlane, uint nStep);
void Dump4x4(const char* pszMsg, const u8* pPlane, uint nStep);
void DumpMem(const char* pszMsg, const u8* pMem, uint nSize);
void DumpBuf(const char* pszMsg, const void* ptr, int len);

void copy16x16(u8* pDst, uint nDstStep, const u8* pSrc, uint nSrcStep);
uint cmp16x16(const u8* pSrc1, uint nSrc1Step, const u8* pSrc2, uint nSrc2Step);
void DumpDiff16x16(const u8* pSrc1, uint nSrc1Step, const u8* pSrc2, uint nSrc2Step);

bool cmp4x4(const u8* pSrc1, uint nSrc1Step, const u8* pSrc2, uint nSrc2Step);

#endif //__CodecUtil_h
