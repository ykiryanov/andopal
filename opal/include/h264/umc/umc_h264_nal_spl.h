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

#ifndef __UMC_H264_NAL_SPL_H
#define __UMC_H264_NAL_SPL_H

#include "umc_h264_dec_defs_dec.h"
#include "umc_media_data_ex.h"
#include "umc_h264_heap.h"

namespace UMC
{

class MediaData;
class SwapperBase;
class TaskSupplier;

class StartCodeIteratorBase
{
public:

    StartCodeIteratorBase()
        : m_pSourceBase(0)
        , m_pSource(0)
        , m_nSourceBaseSize(0)
        , m_nSourceSize(0)
    {
    }

    virtual Ipp32s Init(MediaData * pSource)
    {
        m_pSourceBase = m_pSource = (Ipp8u *) pSource->GetDataPointer();
        m_nSourceBaseSize = m_nSourceSize = pSource->GetDataSize();
        return 0;
    }

    size_t GetCurrentOffset()
    {
        return m_pSource - m_pSourceBase;
    }

    virtual Ipp32s GetNext() = 0;

protected:
    Ipp8u * m_pSource;
    size_t  m_nSourceSize;

    Ipp8u * m_pSourceBase;
    size_t  m_nSourceBaseSize;
};

class NALUnitSplitter
{
public:

    NALUnitSplitter(H264_Heap * heap);

    virtual ~NALUnitSplitter();

    virtual void Init();
    virtual void Release();

    virtual Ipp32s CheckNalUnitType(MediaData * pSource);
    virtual H264MemoryPiece * GetNalUnits(MediaData * in, MediaDataEx *&out, H264MemoryPiece ** pMemCopy = 0);
    void Commit();
    void DropMemory();
    virtual void Reset();

    void SetSwapMode(bool isSaveCopy)
    {
        m_IsSaveCopy = isSaveCopy;
    }

    H264MemoryPiece * GetCurrentCopyVersion()
    {
        return m_pMemCopy;
    }

    H264MemoryPiece * GetCurrent()
    {
        return m_pMem;
    }

protected:

    TaskSupplier *  m_pSupplier;
    bool m_bWaitForIDR;
    H264_Heap   *   m_pHeap;
    SwapperBase *   m_pSwapper;
    StartCodeIteratorBase * m_pStartCodeIter;

    H264MemoryPiece * m_pMem;
    H264MemoryPiece * m_pMemCopy;

    MediaDataEx m_MediaData;
    MediaDataEx::_MediaDataEx m_MediaDataEx;
    bool m_IsSaveCopy;
};

size_t BuildNALUnit(Ipp8u * , size_t &, Ipp8u * , size_t lenght, Ipp32s lengthSize);

class NALUnitSplitterMP4 : public NALUnitSplitter
{
public:
    NALUnitSplitterMP4(H264_Heap * heap);

    virtual void Init();

    virtual void Reset();

    virtual H264MemoryPiece * GetNalUnits(MediaData * in, MediaDataEx *&out, H264MemoryPiece ** pMemCopy = 0);
    virtual Ipp32s CheckNalUnitType(MediaData * pSource);

private:
    void ReadHeader(MediaData * pSource);

    typedef struct AVCRecord
    {
        AVCRecord()
        {
            configurationVersion = 1;
            lengthSizeMinusOne = 1;
            numOfSequenceParameterSets = 0;
            numOfPictureParameterSets = 0;
        }

        Ipp8u configurationVersion;
        Ipp8u AVCProfileIndication;
        Ipp8u profile_compatibility;
        Ipp8u AVCLevelIndication;
        Ipp8u lengthSizeMinusOne;
        Ipp8u numOfSequenceParameterSets;
        Ipp8u numOfPictureParameterSets;

    } AVCRecord;

    enum
    {
        D_START_CODE_LENGHT = 4,
        D_BYTES_FOR_HEADER_LENGHT = 2
    };

    AVCRecord avcRecord;
    bool m_isHeaderReaded;

    friend class StartCodeIteratorMP4;
    friend size_t UMC::BuildNALUnit(Ipp8u *, size_t &, Ipp8u *, size_t , Ipp32s );
};

} // namespace UMC

#endif // __UMC_H264_NAL_SPL_H
#endif // UMC_ENABLE_H264_VIDEO_DECODER
