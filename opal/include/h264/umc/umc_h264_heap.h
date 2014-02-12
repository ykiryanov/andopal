/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//        Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#ifndef __UMC_H264_HEAP_H
#define __UMC_H264_HEAP_H

#include "umc_mutex.h"

namespace UMC
{

//*********************************************************************************************/
//
//*********************************************************************************************/
class H264MemoryPiece
{
    friend class H264_Heap;

public:
    // Default constructor
    H264MemoryPiece(void)
    {
        m_pSourceBuffer = 0;
        m_nSourceSize = 0;
    }

    // Destructor
    ~H264MemoryPiece(void)
    {
        Release();
    }

    // Allocate memory piece
    bool Allocate(size_t nSize)
    {
        if ((m_pSourceBuffer) &&
            (m_nSourceSize >= nSize))
            return true;

        // release before allocation
        Release();

        // DEBUG : ADB : need to use ExternalMemoryAllocator
        // allocate little more
        m_pSourceBuffer = XippsMalloc_8u((Ipp32s) nSize * 2);
        if (0 == m_pSourceBuffer)
            return false;
        m_nSourceSize = nSize;

        return true;
    }

    // Get next element
    H264MemoryPiece *GetNext(){return m_pNext;}
    // Obtain data pointer
    Ipp8u *GetPointer(){return m_pSourceBuffer;}

    size_t GetSize() const {return m_nSourceSize;}

    size_t GetDataSize() const {return m_nDataSize;}
    void SetDataSize(size_t dataSize) {m_nDataSize = dataSize;}


protected:
    Ipp8u *m_pSourceBuffer;                                     // (Ipp8u *) pointer to source memory
    size_t m_nSourceSize;                                       // (size_t) allocated memory size
    size_t m_nDataSize;                                         // (size_t) data memory size
    H264MemoryPiece *m_pNext;                                   // (H264MemoryPiece *) pointer to next memory piece

    // Release object
    void Release()
    {
        if (m_pSourceBuffer)
            XippsFree(m_pSourceBuffer);
        m_pSourceBuffer = 0;
        m_nSourceSize = 0;
    }
};

//*********************************************************************************************/
//
//*********************************************************************************************/
class H264_Heap
{
public:

    H264_Heap()
        : m_pFilledMemory(0)
        , m_pFreeMemory(0)
    {
    }

    virtual ~H264_Heap()
    {
        while (m_pFreeMemory)
        {
            H264MemoryPiece *pMem = m_pFreeMemory->m_pNext;
            delete m_pFreeMemory;
            m_pFreeMemory = pMem;
        }

        while (m_pFilledMemory)
        {
            H264MemoryPiece *pMem = m_pFilledMemory->m_pNext;
            delete m_pFilledMemory;
            m_pFilledMemory = pMem;
        }
    }

    const H264MemoryPiece * GetLastAllocated() const
    {
        return m_pFilledMemory;
    }

    H264MemoryPiece * Allocate(size_t nSize)
    {
        H264MemoryPiece *pMem = GetFreeMemoryPiece(nSize);
        AddFilledMemoryPiece(pMem);
        return pMem;
    }

    void Free(H264MemoryPiece *pMem)
    {
        if (!pMem)
            return;

        H264MemoryPiece* pTemp = m_pFilledMemory;
        if (!pTemp)
            return;


        if (pTemp == pMem)
        {
            m_pFilledMemory = pTemp->m_pNext;
            pMem->m_pNext = m_pFreeMemory;
            m_pFreeMemory = pMem;
        }
        else
        {
            while (pTemp->m_pNext)
            {
                 if (pTemp->m_pNext == pMem)
                 {
                     pTemp->m_pNext = pMem->m_pNext;
                     pMem->m_pNext = m_pFreeMemory;
                     m_pFreeMemory = pMem;
                     return;
                 }
                 pTemp = pTemp->m_pNext;
            }
        }
    }

    void Reset()
    {
        while (m_pFilledMemory)
        {
            H264MemoryPiece *pMem = m_pFilledMemory;
            m_pFilledMemory = pMem->GetNext();
            pMem->m_pNext = m_pFreeMemory;
            m_pFreeMemory = pMem;
        }
    }

protected:

    // Get free piece of memory
    H264MemoryPiece *GetFreeMemoryPiece(size_t nSize)
    {
        // try to find suitable already allocated memory
        H264MemoryPiece *pTemp = m_pFreeMemory;
        H264MemoryPiece *pPrev = 0;

        while ((pTemp) &&
            (pTemp->m_nSourceSize < nSize))
        {
            pPrev = pTemp;
            pTemp = pTemp->m_pNext;
        }

        if (pTemp)
        {
            if (pPrev)
                pPrev->m_pNext = pTemp->m_pNext;
            else
                m_pFreeMemory = pTemp->m_pNext;

            return pTemp;
        }

        // we found nothing, try to allocate new
        {
            pTemp = new H264MemoryPiece();

            if (0 == pTemp)
                return 0;
            // bind to list to avoid memory leak
            pTemp->m_pNext = m_pFreeMemory;
            m_pFreeMemory = pTemp;
            if (false == pTemp->Allocate(nSize))
                return 0;

            // unbind from list
            m_pFreeMemory = m_pFreeMemory->m_pNext;

            return pTemp;
        }
    }

    // Add filled piece of memory
    void AddFilledMemoryPiece(H264MemoryPiece *pMem)
    {
        if (m_pFilledMemory)
        {
            H264MemoryPiece *pTemp = m_pFilledMemory;

            // find end of list
            while (pTemp->m_pNext)
                pTemp = pTemp->m_pNext;
            pTemp->m_pNext = pMem;
        }
        else
            m_pFilledMemory = pMem;

        pMem->m_pNext = 0;

    }

protected:
    H264MemoryPiece * m_pFilledMemory;
    H264MemoryPiece * m_pFreeMemory;
};

//*********************************************************************************************/
//
//*********************************************************************************************/
template <typename T>
class H264_List
{
public:
    class Item
    {
    public:
        Item(T *item, Ipp32s pid)
            : m_pNext(0)
            , m_Item(item)
            , m_pid(pid)
        {
        }

        Item * m_pNext;
        T *m_Item;
        Ipp32s m_pid;
    };

    H264_List()
        : m_pHead(0)
    {
    }

    ~H264_List()
    {
        Reset();
    }

    void RemoveHead()
    {
        Item * tmp = m_pHead;
        m_pHead = m_pHead->m_pNext;
        delete tmp;
    }

    void RemoveItem(T * item)
    {
        if (!m_pHead)
        {
            VM_ASSERT(false);
            return;
        }

        Item *tmp = m_pHead;

        if (tmp->m_Item == item)
        {
            m_pHead = m_pHead->m_pNext;
            delete tmp;
            return;
        }

        while (tmp->m_pNext)
        {
            if (tmp->m_pNext->m_Item == item)
            {
                Item * list_item = tmp->m_pNext;
                tmp->m_pNext = tmp->m_pNext->m_pNext;
                delete list_item;
                return;
            }

            tmp = tmp->m_pNext;
        }

        VM_ASSERT(false);
    }

    T * DetachItemByPid(Ipp32s pid)
    {
        if (!m_pHead)
        {
            return 0;
        }

        T * item = 0;
        Item *tmp = m_pHead;
        for (; tmp; tmp = tmp->m_pNext)
        {
            if (tmp->m_pid == pid)
            {
                item = tmp->m_Item;
                break;
            }
        }

        if (!tmp)
            return 0;

        tmp = m_pHead;

        if (tmp->m_Item == item)
        {
            m_pHead = m_pHead->m_pNext;
            delete tmp;
            return item;
        }

        while (tmp->m_pNext)
        {
            if (tmp->m_pNext->m_Item == item)
            {
                Item * list_item = tmp->m_pNext;
                tmp->m_pNext = tmp->m_pNext->m_pNext;
                delete list_item;
                return item;
            }

            tmp = tmp->m_pNext;
        }

        VM_ASSERT(false);
        return 0;
    }

    T* FindByPid(Ipp32s pid)
    {
        for (Item *tmp = m_pHead; tmp; tmp = tmp->m_pNext)
        {
            if (tmp->m_pid == pid)
                return tmp->m_Item;
        }

        return 0;
    }

    T* FindLastByPid(Ipp32s pid)
    {
        T *last = 0;
        for (Item *tmp = m_pHead; tmp; tmp = tmp->m_pNext)
        {
            if (tmp->m_pid == pid)
                last = tmp->m_Item;
        }

        return last;
    }

    void AddItem(T *item, Ipp32s pid)
    {
        Item *newItem = new Item(item, pid);

        Item *tmp = m_pHead;
        if (m_pHead)
        {
            while (tmp->m_pNext)
            {
                tmp = tmp->m_pNext;
            }

            tmp->m_pNext = newItem;
        }
        else
        {
            m_pHead = newItem;
        }
    }

    T * GetHead()
    {
        return m_pHead->m_Item;
    }

    const T * GetHead() const
    {
        return m_pHead->m_Item;
    }

    void Reset()
    {
        for (Item *tmp = m_pHead; tmp; )
        {
            Item *tmp1 = tmp;
            tmp = tmp->m_pNext;
            delete tmp1;
        }

        m_pHead = 0;
    }

private:
    Item * m_pHead;
};

template <typename T>
class H264_Heap_Objects
{
public:

    class T_ : public T
    {
    public:
        T_()
            : m_pNext(0)
        {
        }

        T_* m_pNext;
    };

    H264_Heap_Objects()
        : m_pFirstFree(0)
    {
    }

    virtual ~H264_Heap_Objects()
    {
        Release();
    }

    T* Allocate()
    {
        if (!m_pFirstFree)
        {
            m_pFirstFree = new T_();
            m_pFirstFree->m_pNext = 0;
        }

        T * temp = m_pFirstFree;
        m_pFirstFree = m_pFirstFree->m_pNext;
        return temp;
    }

    void Free(T * obj)
    {
        ((T_*)obj)->m_pNext = m_pFirstFree;
        m_pFirstFree = (T_*)(obj);
    }

    void Release()
    {
        while (m_pFirstFree)
        {
            T_ *pTemp = m_pFirstFree->m_pNext;
            delete m_pFirstFree;
            m_pFirstFree = pTemp;
        }
    }

private:

    T_ * m_pFirstFree;
};

//*********************************************************************************************/
//
//*********************************************************************************************/
class H264CoeffsBuffer
{
public:
    // Default constructor
    H264CoeffsBuffer(void);
    // Destructor
    virtual ~H264CoeffsBuffer(void);

    // Initialize buffer
    Status Init(Ipp32s numberOfItems, Ipp32s sizeOfItem);

    bool IsInputAvailable() const;
    // Lock input buffer
    Ipp8u* LockInputBuffer();
    // Unlock input buffer
    bool UnLockInputBuffer(size_t size);

    bool IsOutputAvailable() const;
    // Lock output buffer
    bool LockOutputBuffer(Ipp8u *& pointer, size_t &size);
    // Unlock output buffer
    bool UnLockOutputBuffer();
    // Release object
    void Close(void);
    // Reset object
    void Reset(void);

protected:
    Mutex mutex;

    Ipp8u *m_pbAllocatedBuffer;       // (Ipp8u *) pointer to allocated unaligned buffer
    size_t m_lAllocatedBufferSize;    // (Ipp32s) size of allocated buffer

    Ipp8u *m_pbBuffer;                // (Ipp8u *) pointer to allocated buffer
    size_t m_lBufferSize;             // (Ipp32s) size of using buffer

    Ipp8u *m_pbFree;                  // (Ipp8u *) pointer to free space
    size_t m_lFreeSize;               // (Ipp32s) size of free space

    size_t m_lItemSize;               // (Ipp32s) size of output data portion

    struct BufferInfo
    {
        Ipp8u * m_pPointer;
        size_t  m_Size;
        BufferInfo *m_pNext;
    };

    BufferInfo *m_pBuffers;           // (Buffer *) queue of filled sample info

    void Lock();
    void Unlock();
};

} // namespace UMC

#endif // __UMC_H264_HEAP_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
