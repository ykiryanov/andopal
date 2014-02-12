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

#include "umc_structures.h"
#include "umc_h264_nal_spl.h"
#include "umc_automatic_mutex.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_slice_decoding.h"
#include "umc_h264_task_supplier.h"

namespace UMC
{

inline
bool IsItAllowedCode(Ipp32s iCode)
{
    if ((NAL_UT_SLICE <= (iCode & NAL_UNITTYPE_BITS)) &&
        (NAL_UT_PPS >= (iCode & NAL_UNITTYPE_BITS)) &&
        (NAL_UT_SEI != (iCode & NAL_UNITTYPE_BITS)) ||
        (NAL_UT_SPS_EX == (iCode & NAL_UNITTYPE_BITS)) ||
        (NAL_UT_AUXILIARY == (iCode & NAL_UNITTYPE_BITS)) )
        return true;

    return false;

} // bool IsItAllowedCode(Ipp32s iCode)

inline
bool IsHeaderCode(Ipp32s iCode)
{
    return (NAL_UT_SPS == (iCode & NAL_UNITTYPE_BITS)) ||
           (NAL_UT_SPS_EX == (iCode & NAL_UNITTYPE_BITS)) ||
           (NAL_UT_PPS == (iCode & NAL_UNITTYPE_BITS));
}

inline
bool IsVLCCode(Ipp32s iCode)
{
    return (NAL_UT_SLICE <= (iCode & NAL_UNITTYPE_BITS)) &&
           (NAL_UT_IDR_SLICE >= (iCode & NAL_UNITTYPE_BITS)) ||
           (NAL_UT_AUXILIARY == (iCode & NAL_UNITTYPE_BITS));
}

static
Ipp32s FindStartCode(Ipp8u * (&pb), size_t &nSize)
{
    // there is no data
    if ((Ipp32s) nSize < 4)
        return 0;

    // find start code
    while ((4 <= nSize) && ((0 != pb[0]) ||
                            (0 != pb[1]) ||
                            (1 != pb[2])))
    {
        pb += 1;
        nSize -= 1;
    }

    if (4 <= nSize)
        return ((pb[0] << 24) | (pb[1] << 16) | (pb[2] << 8) | (pb[3]));

    return 0;

} // Ipp32s FindStartCode(Ipp8u * (&pb), size_t &nSize)

class StartCodeIterator : public StartCodeIteratorBase
{
public:

    virtual Ipp32s Init(MediaData * pSource)
    {
        StartCodeIteratorBase::Init(pSource);
        Ipp32s iCode = FindStartCode(m_pSource, m_nSourceSize);
        return iCode;
    }

    virtual Ipp32s GetNext()
    {
        m_pSource += 3;
        m_nSourceSize -= 3;
        Ipp32s iCode = FindStartCode(m_pSource, m_nSourceSize);

        return iCode;
    }
};

class SwapperBase
{
public:
    virtual ~SwapperBase() {}

    virtual
    void SwapMemory(Ipp8u *pDestination, size_t &nDstSize, Ipp8u *pSource, size_t nSrcSize) = 0;

    virtual void CopyBitStream(Ipp8u *pDestination, Ipp8u *pSource, size_t nSrcSize) = 0;
};

class Swapper : public SwapperBase
{
public:

    virtual void SwapMemory(Ipp8u *pDestination, size_t &nDstSize, Ipp8u *pSource, size_t nSrcSize)
    {
        extern void SwapMemoryAndRemovePreventingBytes(void *pDst, size_t &nDstSize, void *pSrc, size_t nSrcSize);
        SwapMemoryAndRemovePreventingBytes(pDestination, nDstSize, pSource, nSrcSize);
    }

    virtual void CopyBitStream(Ipp8u *pDestination, Ipp8u *pSource, size_t nSrcSize)
    {
        memcpy(pDestination, pSource, nSrcSize);
    }
};

/*************************************************************************************/
// MP4 stuff
/*************************************************************************************/

static
inline Ipp32s GetValue16(Ipp8u * buf)
{
    return ((*buf) << 8) | *(buf + 1);
}

static
inline Ipp32s GetValue24(Ipp8u * buf)
{
    return ((*buf) << 16) | (*(buf + 1) << 8) | *(buf + 2);
}

static
inline Ipp32s GetValue32(Ipp8u * buf)
{
    return ((*buf) << 24) | (*(buf + 1) << 16) | (*(buf + 2) << 8) | *(buf + 3);
}

static inline Ipp32s GetLenght(Ipp32s len_bytes_count, Ipp8u * buf)
{
    Ipp32s lenght = 0;

    switch (len_bytes_count)
    {
    case 1: // 1 byte
        lenght = *buf;
        break;
    case 2: // 2 bytes
        lenght = GetValue16(buf);
        break;
    case 3: // 3 bytes
        lenght = GetValue24(buf);
        break;
    case 4:  // 4 bytes
        lenght = GetValue32(buf);
        break;
    }

    return lenght;

} // Ipp32s GetLenght(Ipp32s len_bytes_count, Ipp8u * buf)

class StartCodeIteratorMP4 : public StartCodeIteratorBase
{
public:

    void SetLenInBytes(Ipp32s lenInBytes)
    {
        m_lenInBytes = lenInBytes;
    }

    virtual Ipp32s Init(MediaData * pSource)
    {
        StartCodeIteratorBase::Init(pSource);

        m_nSourceBaseSize = pSource->GetDataSize();
        m_pSourceBase = m_pSource = (Ipp8u *) pSource->GetDataPointer();
        m_fullSize = pSource->GetDataSize();
        m_nSourceSize = 0;

        Ipp32s iCode = *(m_pSource + m_lenInBytes);
        return iCode;
    }

    virtual Ipp32s GetNext()
    {
        Ipp32s lenght = GetLenght(m_lenInBytes, m_pSource);
        m_pSource += lenght + m_lenInBytes;
        m_nSourceSize += lenght + m_lenInBytes;

        if (m_nSourceSize >= m_fullSize)
            return 0;

        Ipp32s iCode = *(m_pSource + m_lenInBytes);
        return iCode;
    }

private:
    size_t  m_fullSize;
    Ipp32s m_lenInBytes;
};

class SwapperForMP4 : public SwapperBase
{
public:
    SwapperForMP4(Ipp32s lengthSize = 0)
        : m_lengthSize(lengthSize)
    {
    }

    void SetTrackLenghtSize(Ipp32s lengthSize)
    {
        m_lengthSize = lengthSize;
    }

    virtual
    void SwapMemory(Ipp8u *pDestination, size_t &nDstSize, Ipp8u *pSource, size_t nSrcSize)
    {
        BuildNALUnit(pDestination, nDstSize, pSource, nSrcSize, m_lengthSize);
    }

    virtual void CopyBitStream(Ipp8u *pDestination, Ipp8u *pSource, size_t nSrcSize)
    {
        static Ipp8u start_code_prefix[] = {0, 0, 0, 1};

        memcpy(pDestination, start_code_prefix, 4);
        memcpy(pDestination + 4, pSource + m_lengthSize, nSrcSize - m_lengthSize);
    }

private:
    Ipp32s m_lengthSize;
};

NALUnitSplitter::NALUnitSplitter(H264_Heap * heap)
    : m_pHeap(heap)
    , m_pSupplier(0)
    , m_bWaitForIDR(true)
    , m_pSwapper(0)
    , m_pMem(0)
    , m_pMemCopy(0)
    , m_pStartCodeIter(0)
    , m_IsSaveCopy(false)
{
    m_MediaData.SetExData(&m_MediaDataEx);
}

NALUnitSplitter::~NALUnitSplitter()
{
    Release();
}

void NALUnitSplitter::Init()
{
    Release();

    m_bWaitForIDR = true;

    m_pSwapper = new Swapper();
    m_pStartCodeIter = new StartCodeIterator();
}

void NALUnitSplitter::Reset()
{
    Commit();
    m_bWaitForIDR = true;
}

void NALUnitSplitter::Release()
{
    delete m_pSwapper;
    m_pSwapper = 0;
    delete m_pStartCodeIter;
    m_pStartCodeIter = 0;
}

void NALUnitSplitter::Commit()
{
    m_pHeap->Free(m_pMem);
    m_pHeap->Free(m_pMemCopy);
    m_pMem = 0;
    m_pMemCopy = 0;
    m_MediaDataEx.count = 0;
}

void NALUnitSplitter::DropMemory()
{
    m_pMem = 0;
    m_pMemCopy = 0;
    m_MediaDataEx.count = 0;
}

Ipp32s NALUnitSplitter::CheckNalUnitType(MediaData * pSource)
{
    if (!pSource)
        return 0;

    return m_pStartCodeIter->Init(pSource) & NAL_UNITTYPE_BITS; // find first start code
}

H264MemoryPiece * NALUnitSplitter::GetNalUnits(MediaData * pSource, MediaDataEx *&out, H264MemoryPiece ** pMemCopy)
{
    out = &m_MediaData;
    MediaDataEx::_MediaDataEx* pMediaDataEx = &m_MediaDataEx;

    if (m_pMemCopy)
        *pMemCopy = m_pMemCopy;

    if (!pSource)
        return m_pMem;
    if (m_pMem)
        return m_pMem;

    #define MAX_TEMPORAL_SWAP_BUFFER_SIZE 32
    static Ipp8u temporalSwapBuf[2*MAX_TEMPORAL_SWAP_BUFFER_SIZE];

    Ipp8u * const pOriginal = (Ipp8u *) pSource->GetDataPointer();
    size_t nOriginalSize = pSource->GetDataSize();

    Ipp32s iCode = m_pStartCodeIter->Init(pSource); // find first start code
    if (iCode == 0)
    {
        pMediaDataEx->count = 0;
        pSource->MoveDataPointer(nOriginalSize);
        return 0;
    }

    pMediaDataEx->values[0] = iCode & NAL_UNITTYPE_BITS;
    size_t firstOffset = m_pStartCodeIter->GetCurrentOffset();
    iCode = m_pStartCodeIter->GetNext();
    if (iCode)
        nOriginalSize = m_pStartCodeIter->GetCurrentOffset() - firstOffset;
    else
        nOriginalSize -= firstOffset;

    pSource->MoveDataPointer(nOriginalSize + firstOffset);

    size_t nDstSize = nOriginalSize;

    if (m_IsSaveCopy && pMemCopy)
    {
        *pMemCopy = m_pHeap->Allocate(nDstSize + 8);
        memset((*pMemCopy)->GetPointer() + nDstSize, 0, 8);
        m_pSwapper->CopyBitStream((*pMemCopy)->GetPointer(), pOriginal + firstOffset,
                nOriginalSize);
        (*pMemCopy)->SetDataSize(nOriginalSize);

        m_pMemCopy = *pMemCopy;
    }

    H264MemoryPiece *pMem = m_pHeap->Allocate(nDstSize + 8);
    memset(pMem->GetPointer() + nDstSize, 0, 8);
    m_pSwapper->SwapMemory(pMem->GetPointer(),
                nDstSize,
                pOriginal + firstOffset,
                nOriginalSize);

    pMediaDataEx->offsets[0] = 0;
    pMediaDataEx->offsets[1] = nDstSize;
    pMediaDataEx->count = 1;
    pMem->SetDataSize(nDstSize);
    m_pMem = pMem;

    return pMem;
}

size_t BuildNALUnit(Ipp8u * write_buf, size_t &nDstSize, Ipp8u * buf, size_t lenght, Ipp32s lengthSize)
{
    static Ipp8u start_code_prefix[] = {0, 0, 0, 1};

    size_t len = NALUnitSplitterMP4::D_START_CODE_LENGHT;
    SwapMemoryAndRemovePreventingBytes(write_buf, len, &start_code_prefix, len);

    len = GetLenght(lengthSize, buf);
    buf += lengthSize;

    if (lenght)
    {
        lenght = IPP_MIN(lenght, len);

        write_buf += NALUnitSplitterMP4::D_START_CODE_LENGHT;
        SwapMemoryAndRemovePreventingBytes(write_buf, len, buf, lenght);

        nDstSize = (len + NALUnitSplitterMP4::D_START_CODE_LENGHT);
        return lenght;
    }
    else
    {
        lenght = (len + lengthSize);

        write_buf += NALUnitSplitterMP4::D_START_CODE_LENGHT;
        SwapMemoryAndRemovePreventingBytes(write_buf, len, buf, len);

        nDstSize = (len + NALUnitSplitterMP4::D_START_CODE_LENGHT);

        return lenght;
    }
} // Ipp32s BuildNALUnit

NALUnitSplitterMP4::NALUnitSplitterMP4(H264_Heap * heap)
    : NALUnitSplitter(heap)
    , m_isHeaderReaded(false)
{
}

void NALUnitSplitterMP4::Init()
{
    Release();

    m_bWaitForIDR = true;

    m_pSwapper = new SwapperForMP4();
    m_pStartCodeIter = new StartCodeIteratorMP4();
    m_isHeaderReaded = false;
}

void NALUnitSplitterMP4::Reset()
{
    NALUnitSplitter::Reset();
}

Ipp32s NALUnitSplitterMP4::CheckNalUnitType(MediaData * pSource)
{
    if (!pSource)
        return 0;

    if (m_isHeaderReaded)
    {
        return *((Ipp8u*)pSource->GetDataPointer() + (avcRecord.lengthSizeMinusOne + 1)) & NAL_UNITTYPE_BITS;
    }

    return NAL_UT_SPS;
}

void NALUnitSplitterMP4::ReadHeader(MediaData * pSource)
{
    MediaDataEx::_MediaDataEx* pMediaEx = &m_MediaDataEx;
    Ipp8u *p = (Ipp8u *) pSource->GetDataPointer();
    avcRecord.configurationVersion = *p;

    //VM_ASSERT(avc_record.configurationVersion != 1);

    p++;
    avcRecord.AVCProfileIndication = *p;
    p++;
    avcRecord.profile_compatibility = *p;
    p++;
    avcRecord.AVCLevelIndication = *p;
    p++;
    avcRecord.lengthSizeMinusOne = *p;
    avcRecord.lengthSizeMinusOne <<= 6;
    avcRecord.lengthSizeMinusOne >>= 6; // remove reserved bits
    p++;

    avcRecord.numOfSequenceParameterSets = *p;
    avcRecord.numOfSequenceParameterSets <<= 3;
    avcRecord.numOfSequenceParameterSets >>= 3;// remove reserved bits
    p++;

    // calculate lenght of memory
    // read sequence par sets
    Ipp8u * temp = p;
    Ipp32s i;
    size_t result_lenght = 0;
    Ipp32s nNALUnitsCount = 0;

    for (i = 0; i < avcRecord.numOfSequenceParameterSets; i++)
    {
        Ipp32s lenght = GetValue16(temp);

        Ipp32s iCode = *(temp + D_BYTES_FOR_HEADER_LENGHT);
        pMediaEx->offsets[nNALUnitsCount] = (Ipp32u) result_lenght;
        pMediaEx->values[nNALUnitsCount] = iCode & NAL_UNITTYPE_BITS;
        nNALUnitsCount++;

        temp += lenght + D_BYTES_FOR_HEADER_LENGHT;
        result_lenght += lenght + D_START_CODE_LENGHT;
    }

    if (result_lenght > pSource->GetDataSize() + avcRecord.numOfSequenceParameterSets*2 + 3)
    {
        pSource->SetDataSize(0);
        throw h264_exception(UMC_ERR_INVALID_STREAM);
    }

    avcRecord.numOfPictureParameterSets = *temp;
    temp++;

    for (i = 0; i < avcRecord.numOfPictureParameterSets; i++)
    {
        Ipp32s lenght = GetValue16(temp);

        Ipp32s iCode = *(temp + D_BYTES_FOR_HEADER_LENGHT);
        pMediaEx->offsets[nNALUnitsCount] = (Ipp32u) result_lenght;
        pMediaEx->values[nNALUnitsCount] = iCode & NAL_UNITTYPE_BITS;
        nNALUnitsCount++;

        temp += lenght + D_BYTES_FOR_HEADER_LENGHT;
        result_lenght += lenght + D_START_CODE_LENGHT;
    }

    result_lenght += 3; // for swap mode

    if (!result_lenght && (result_lenght > pSource->GetDataSize() +
        (avcRecord.numOfSequenceParameterSets + avcRecord.numOfPictureParameterSets + 3)*2))
    {
        pSource->SetDataSize(0);
        throw h264_exception(UMC_ERR_INVALID_STREAM);
    }

    m_pMem = m_pHeap->Allocate(result_lenght);

    Ipp8u * write_buf = m_pMem->GetPointer();
    nNALUnitsCount = 0;

    // read sequence par sets
    for (i = 0; i < avcRecord.numOfSequenceParameterSets; i++)
    {
        size_t nal_unit_lenght;
        size_t lenght = BuildNALUnit(write_buf, nal_unit_lenght, p, 0, D_BYTES_FOR_HEADER_LENGHT);
        pMediaEx->offsets[nNALUnitsCount++] = (Ipp32u)(write_buf - m_pMem->GetPointer());
        write_buf += nal_unit_lenght;
        p += lenght;
    }

    avcRecord.numOfPictureParameterSets = *p;
    p++;

    // read picture par sets
    for (i = 0; i < avcRecord.numOfPictureParameterSets; i++)
    {
        size_t nal_unit_lenght;
        size_t lenght = BuildNALUnit(write_buf, nal_unit_lenght, p, 0, D_BYTES_FOR_HEADER_LENGHT);
        pMediaEx->offsets[nNALUnitsCount++] = (Ipp32u)(write_buf - m_pMem->GetPointer());
        write_buf += nal_unit_lenght;
        p += lenght;
    }

    result_lenght = write_buf - m_pMem->GetPointer();
    pMediaEx->count = nNALUnitsCount;
    pMediaEx->offsets[nNALUnitsCount] = (Ipp32u)result_lenght;
    pSource->SetDataSize(0);

    m_isHeaderReaded = true;
}

H264MemoryPiece * NALUnitSplitterMP4::GetNalUnits(MediaData * pSource, MediaDataEx *&out, H264MemoryPiece ** pMemCopy)
{
    out = &m_MediaData;

    if (pMemCopy)
        *pMemCopy = m_pMemCopy;

    if (!pSource)
        return m_pMem;

    if (m_pMem)
        return m_pMem;

    if (!m_isHeaderReaded)
    {
        ReadHeader(pSource);
        ((SwapperForMP4*)m_pSwapper)->SetTrackLenghtSize(avcRecord.lengthSizeMinusOne + 1);
        return m_pMem;
    }

    ((StartCodeIteratorMP4*)m_pStartCodeIter)->SetLenInBytes(avcRecord.lengthSizeMinusOne + 1);
    return NALUnitSplitter::GetNalUnits(pSource, out, pMemCopy);
}

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
