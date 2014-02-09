/*
 *  RingBuffer.h
 *  BoneLib
 *
 *  Created by Sergey Bezruchkin on 9/24/10.
 *  Copyright 2010 Dinsk. All rights reserved.
 *
 */



typedef unsigned int  uint;
typedef unsigned char uchar;


struct RingBuffItem
{
    unsigned  nOffset;
    unsigned  nSize;
    unsigned  nMaxSize;
    unsigned char buf[1];
};


#define RING_BUF_COUNT      (16)
#define RING_BUF_MASK       (RING_BUF_COUNT - 1)
#define RING_BUF_MIN_SIZE   (512)
#define RING_BUF_START_TO_PLAY (7)


class RingBuffer
{	
	uint	volatile	_nFirst;
	uint	volatile	_nLast;
    bool                _bStarted;
    RingBuffItem*       _arr[RING_BUF_COUNT];
public:
	
	RingBuffer() : _bStarted(false), _nFirst(0), _nLast(0)
    {
        for (int i=0;i<RING_BUF_COUNT; ++i)
        {
            _arr[i] = (RingBuffItem*) new char[sizeof(RingBuffItem) + RING_BUF_MIN_SIZE];
            _arr[i]->nSize = 0;
            _arr[i]->nOffset = 0;
            _arr[i]->nMaxSize = RING_BUF_MIN_SIZE;
        }
    }
	
	~RingBuffer() {
        for (int i=0; i < RING_BUF_COUNT; ++i)
            delete (char*)  _arr[i];
    }
	
	bool write(const void* pBuf, uint nLen)
    {
        if (IsFull())
            return false;
        
        RingBuffItem* pItem = _arr[_nLast & RING_BUF_MASK];
        if (pItem->nMaxSize < nLen) {
            delete (char*) pItem;
            pItem = (RingBuffItem*) new char[sizeof(RingBuffItem) + nLen];
            pItem->nMaxSize = nLen;
            _arr[_nLast & RING_BUF_MASK] = pItem;
        }
        
        memcpy(pItem->buf, pBuf, nLen);
        pItem->nOffset = 0;
        pItem->nSize = nLen;
        ++ _nLast;
        return true;
    }

	RingBuffItem* get() {
        if (_bStarted && GetFill() < RING_BUF_START_TO_PLAY) {
            return NULL;
        }
        if (IsEmpty())
        {
            _bStarted = false;
            return NULL;
        }
        _bStarted = true;
        return _arr[_nFirst & RING_BUF_MASK];
    }
    
    void firstReaded() {
        ++ _nFirst;
    }

	bool IsEmpty()								{ return _nFirst == _nLast; }
	bool IsFull()								{ return ((_nLast + 1 - _nFirst) & RING_BUF_MASK) == 0; }

	int GetFill()								{ return (_nLast- _nFirst) & RING_BUF_MASK; }
};



