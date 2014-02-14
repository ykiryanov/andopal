#pragma hdrstop

#ifdef _WIN32
#include <windows.h>
#include <stdlib.h>
#endif

#include "ippdefs.h"
#include "vm_debug.h"
//SB!!! #include "TargetConditionals.h"

void dbgCheckMemory()  { }

struct MemData
{
    void*           ptr;
    unsigned int    size;
    unsigned        crc;
    unsigned        reserve;
};

#define MAX_MEM_INFO    200
static MemData          s_MemInfo[MAX_MEM_INFO] = {0};
static unsigned         s_MinFreeIndexMemInfo = 0;
static unsigned         s_CountMemInfo = 0;

void MemAdd(void* ptr, unsigned size)
{

    unsigned i;
    for (i = s_MinFreeIndexMemInfo; i < MAX_MEM_INFO; i++)
        if (s_MemInfo[i].ptr == NULL)
            break;

    if (i >= MAX_MEM_INFO) {
        // vm_debug_trace(VM_DEBUG_ERROR,  VM_STRING("MEM\tMemAlloc(OUT, size %ld)"), size);
        return;
    }

    s_MemInfo[i].ptr = ptr;
    s_MemInfo[i].size = size;
    s_MemInfo[i].crc = 0;
    s_MinFreeIndexMemInfo = i+1;
    s_CountMemInfo ++;

    // vm_debug_trace(VM_DEBUG_ERROR, VM_STRING("MEM\tMemAlloc(indx=%ld, size="), i, size);
}

void MemFree(void* ptr)
{
    unsigned n = 0;
    unsigned size = 0;
    unsigned i = 0;
    for (i=0; (i < MAX_MEM_INFO) && (n < s_CountMemInfo); i++) {
        if (s_MemInfo[i].ptr == NULL)
            continue;
        n++;
        if (s_MemInfo[i].ptr == ptr) {
            size = s_MemInfo[i].size;
            s_MemInfo[i].ptr = NULL;
            s_CountMemInfo --;
            if (i < s_MinFreeIndexMemInfo)
                s_MinFreeIndexMemInfo = i;
            break;
        }
    }
    // vm_debug_trace(VM_DEBUG_ERROR, VM_STRING("MEM\tMemFree(ptr=0x" << std::hex << ptr << std::dec << ", size=" << size << ")"));
}

unsigned MemCrc(void* ptr, unsigned sz)
{
    const unsigned char* p = (const unsigned char*) ptr;
    const unsigned char* pEnd = p+sz;
    unsigned sum = 0;
    for (;p < pEnd; p++)
        sum += *p;

    return sum;
}

void dbMemPrintCRC() 
{
    unsigned n = 0;
    unsigned i = 0;
    for (i=0; (i < MAX_MEM_INFO) && (n < s_CountMemInfo); i++) {
        if (s_MemInfo[i].ptr == NULL)
            continue;
        n++;
        if (s_MemInfo[i].size < 152064)
            continue;
        unsigned crc = MemCrc(s_MemInfo[i].ptr,s_MemInfo[i].size);
        if (crc != s_MemInfo[i].crc) {
            //vm_debug_trace(VM_DEBUG_ERROR, VM_STRING("MEM\tMemCRC(" << std::dec << i*0 << ", size=" << s_MemInfo[i].size << ")=0x" << std::hex << crc << std::dec));
            s_MemInfo[i].crc = crc;
        }
    }
}




//inline 
void* XAlloc(unsigned int size)
{ 
//    dbgCheckMemory();
    void* ptr = malloc(size);
    memset(ptr, 0, size);
//  MemAdd(ptr, size);
//  dbMemPrintCRC();
    return ptr;
}

void XFree(void* ptr)
{     
//    dbgCheckMemory();
    free(ptr);
//    MemFree(ptr);
}


extern "C" void     __STDCALL   XippFree        (void* ptr) { XFree(ptr); }
extern "C" void     __STDCALL   XippsFree       (void* ptr) { XFree(ptr); }
extern "C" void*    __STDCALL   XippMalloc      (int len)   { return (Ipp8u*)  XAlloc(len*sizeof(Ipp8u));}
extern "C" Ipp8u*   __STDCALL   XippsMalloc_8u  (int len)   { return (Ipp8u*)  XAlloc(len*sizeof(Ipp8u));}
extern "C" Ipp32u*  __STDCALL   XippsMalloc_32u (int len)   { return (Ipp32u*) XAlloc(len*sizeof(Ipp32u));}
extern "C" Ipp32s*  __STDCALL   XippsMalloc_32s (int len)   { return (Ipp32s*) XAlloc(len*sizeof(Ipp32s));}

#ifndef NO_XAPI
#if !TARGET_IPHONE_SIMULATOR
// No 'X' versions for codec
extern "C" Ipp8u*	__STDCALL ippsMalloc_8u    (int len)    { return (Ipp8u*) XAlloc(len*sizeof(Ipp8u));}
extern "C" 	void    __STDCALL ippsFree         (void* ptr)  { XFree(ptr); }
#endif
#endif
 


#ifdef _WIN32
static struct InitMem 
{
	InitMem() 
    { 
        // Get the current bits
        int flags = _CrtSetDbgFlag(_CRTDBG_REPORT_FLAG);
        // Set the new bits
        _CrtSetDbgFlag(flags | _CRTDBG_CHECK_ALWAYS_DF );
    }											
} s_InitMem;

#else
#if !TARGET_IPHONE_SIMULATOR
#if 0 // SB
extern "C" void IppSetAllocAndFree(void*,void*);

static struct InitIppAllocAndFree 
{
	InitIppAllocAndFree() { IppSetAllocAndFree((void*)&XippMalloc,(void*) &XippFree);}											
} s_IppInitAllocAndFree;
#endif //SB
#endif // !TARGET_IPHONE_SIMULATOR
#endif // _WIN32
