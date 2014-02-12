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

#include "vm_debug.h"
#include "umc_h264_dec.h"
#include "umc_h264_bitstream.h"
#include "umc_h264_dec_coeff_token_map.h"
#include "umc_h264_dec_total_zero.h"
#include "umc_h264_dec_run_before.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"

//#define H264_DUMP_TABLE
#define H264_STATIC_DATA

#ifdef H264_STATIC_DATA
#include "h264_huffman_tab.h"
#endif

namespace UMC
{

#ifdef H264_STATIC_DATA

#define INIT_HUFFMAN_START()
#define INIT_HUFFMAN_RUN_LEVEL_TABLE(a,tab,indx)    tab[indx] = tab##_##indx;
#define INIT_HUFFMAN_TABLE(a,tab,indx)              tab[indx] = tab##_##indx;
#define INIT_HUFFMAN_STOP()


#elif defined(H264_DUMP_TABLE)
static FILE* s_fout=NULL;

void dumpStart()
{
    if (!s_fout)
        s_fout = fopen("c:\\tmp\\h264_huffman_tab.h", "w");
}

void dumpStop()
{
    if (s_fout) {
        fclose(s_fout);
        s_fout = NULL;
    }
}

void dumpArr(const char* arrName, Ipp32s** tab, int indx) 
{
    int i,nElem=0;
    if (!s_fout)
        return;

    const Ipp32s* p = tab[indx];
    while (p[nElem] != 0xbaadf00d)
        nElem ++;

    fprintf(s_fout, "\nIpp32s %s_%d[%d] = {\n", arrName, indx, nElem);
    for (i=0; i<nElem;) {
        fprintf(s_fout, " ");
        for (int j=0; (j<8) && (i<nElem);j++) {
            fprintf(s_fout, " 0x%8.8x", p[i]);
            if (++i<nElem) 
                fprintf(s_fout, ",");
            else {            
                fprintf(s_fout, "};");
                break;
            }
        }
        fprintf(s_fout, "\n");
    }
}

#define INIT_HUFFMAN_START()                        dumpStart()

#define INIT_HUFFMAN_RUN_LEVEL_TABLE(a,tab,indx)                                    \
    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(a, &tab[indx]);                  \
    if (ippStsNoErr != ippSts)                                                      \
        return UMC_ERR_ALLOC;                                                       \
    dumpArr(#tab, tab, indx)

#define INIT_HUFFMAN_TABLE(a,tab,indx)                                              \
    ippSts = ippiHuffmanTableInitAlloc_32s(a, &tab[indx]);                          \
    if (ippStsNoErr != ippSts)                                                      \
        return UMC_ERR_ALLOC;                                                       \
    dumpArr(#tab, tab, indx)

#define INIT_HUFFMAN_STOP()                        dumpStop()

#else
    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(coeff_token_map_02, &m_tblCoeffToken[0]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

#endif

static
const Ipp32u GetBitsMask[25] =
{
    0x00000000, 0x00000001, 0x00000003, 0x00000007,
    0x0000000f, 0x0000001f, 0x0000003f, 0x0000007f,
    0x000000ff, 0x000001ff, 0x000003ff, 0x000007ff,
    0x00000fff, 0x00001fff, 0x00003fff, 0x00007fff,
    0x0000ffff, 0x0001ffff, 0x0003ffff, 0x0007ffff,
    0x000fffff, 0x001fffff, 0x003fffff, 0x007fffff,
    0x00ffffff
};

void H264Bitstream::GetOrg(Ipp32u **pbs, Ipp32u *size)
{
    *pbs       = m_pbsBase;
    *size      = m_maxBsSize;
}

void H264Bitstream::GetState(Ipp32u** pbs,Ipp32u* bitOffset)
{
    *pbs       = m_pbs;
    *bitOffset = m_bitOffset;

} // H264Bitstream::GetState()

void H264Bitstream::SetState(Ipp32u* pbs,Ipp32u bitOffset)
{
    m_pbs = pbs;
    m_bitOffset = bitOffset;

} // H264Bitstream::GetState()

H264Bitstream::H264Bitstream(Ipp8u * const pb,
                             const Ipp32u maxsize)
{
    m_pbsBase = (Ipp32u *) pb;
    m_pbs = (Ipp32u *) pb;
    m_bitOffset = 31;
    m_maxBsSize = maxsize;

    memset(m_tblCoeffToken, 0, sizeof(m_tblCoeffToken));
    memset(m_tblTotalZerosCR, 0, sizeof(m_tblTotalZerosCR));
    memset(m_tblTotalZerosCR422, 0, sizeof(m_tblTotalZerosCR422));
    memset(m_tblTotalZeros, 0, sizeof(m_tblTotalZeros));
    memset(m_tblRunBefore, 0, sizeof(m_tblRunBefore));

    m_bTablesInited = false;

} // H264Bitstream::H264Bitstream(Ipp8u * const pb,

H264Bitstream::H264Bitstream(void)
{
    m_pbs = 0;
    m_pbsBase = 0;
    m_bitOffset = 0;
    m_maxBsSize    = 0;

    memset(m_tblCoeffToken, 0, sizeof(m_tblCoeffToken));
    memset(m_tblTotalZerosCR, 0, sizeof(m_tblTotalZerosCR));
    memset(m_tblTotalZerosCR422, 0, sizeof(m_tblTotalZerosCR422));
    memset(m_tblTotalZeros, 0, sizeof(m_tblTotalZeros));
    memset(m_tblRunBefore, 0, sizeof(m_tblRunBefore));

    m_bTablesInited = false;

} // H264Bitstream::H264Bitstream(void)

H264Bitstream::~H264Bitstream()
{
    ReleaseTables();

} // H264Bitstream::~H264Bitstream()

void H264Bitstream::ReleaseTables(void)
{

    if (!m_bTablesInited)
        return;

#ifndef H264_STATIC_DATA
    Ipp32s i;
    for (i = 0; i <= 4; i++ )
    {
        if (m_tblCoeffToken[i])
        {
            ippiHuffmanTableFree_32s(m_tblCoeffToken[i]);
            m_tblCoeffToken[i] = NULL;
        }
    }

    for (i = 1; i <= 15; i++)
    {
        if (m_tblTotalZeros[i])
        {
            ippiHuffmanTableFree_32s(m_tblTotalZeros[i]);
            m_tblTotalZeros[i] = NULL;
        }
    }

    for(i = 1; i <= 3; i++)
    {
        if(m_tblTotalZerosCR[i])
        {
            ippiHuffmanTableFree_32s(m_tblTotalZerosCR[i]);
            m_tblTotalZerosCR[i] = NULL;
        }
    }

    for(i = 1; i <= 7; i++)
    {
        if(m_tblTotalZerosCR422[i])
        {
            ippiHuffmanTableFree_32s(m_tblTotalZerosCR422[i]);
            m_tblTotalZerosCR422[i] = NULL;
        }
    }

    for(i = 1; i <= 7; i++)
    {
        if(m_tblRunBefore[i])
        {
            ippiHuffmanTableFree_32s(m_tblRunBefore[i]);
            m_tblRunBefore[i] = NULL;
        }
    }
    for(; i <= 15; i++)
    {
        m_tblRunBefore[i] = NULL;
    }
#endif
    m_bTablesInited = false;

} // void H264Bitstream::ReleaseTable(void)



Status H264Bitstream::InitTables(void)
{
    // check tables allocation status
    if (m_bTablesInited)
        return UMC_OK;
#if defined(H264_DUMP_TABLE) || defined(H264_STATIC_DATA)
    INIT_HUFFMAN_START()
	
	m_tblCoeffToken[0] = m_tblCoeffToken_0;

    INIT_HUFFMAN_RUN_LEVEL_TABLE(coeff_token_map_02, m_tblCoeffToken, 0)
    INIT_HUFFMAN_RUN_LEVEL_TABLE(coeff_token_map_24, m_tblCoeffToken, 1);
    INIT_HUFFMAN_RUN_LEVEL_TABLE(coeff_token_map_48, m_tblCoeffToken, 2);
    INIT_HUFFMAN_RUN_LEVEL_TABLE(coeff_token_map_cr, m_tblCoeffToken, 3);
    INIT_HUFFMAN_RUN_LEVEL_TABLE(coeff_token_map_cr2, m_tblCoeffToken, 4);

    INIT_HUFFMAN_TABLE(total_zeros_map_cr1, m_tblTotalZerosCR, 1);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr2, m_tblTotalZerosCR, 2);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr3, m_tblTotalZerosCR, 3);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_1, m_tblTotalZerosCR422, 1);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_2, m_tblTotalZerosCR422, 2);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_3, m_tblTotalZerosCR422, 3);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_4, m_tblTotalZerosCR422, 4);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_5, m_tblTotalZerosCR422, 5);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_6, m_tblTotalZerosCR422, 6);
    INIT_HUFFMAN_TABLE(total_zeros_map_cr422_7, m_tblTotalZerosCR422, 7);
    INIT_HUFFMAN_TABLE(total_zeros_map_1, m_tblTotalZeros, 1);
    INIT_HUFFMAN_TABLE(total_zeros_map_2, m_tblTotalZeros, 2);
    INIT_HUFFMAN_TABLE(total_zeros_map_3, m_tblTotalZeros, 3);
    INIT_HUFFMAN_TABLE(total_zeros_map_4, m_tblTotalZeros, 4);
    INIT_HUFFMAN_TABLE(total_zeros_map_5, m_tblTotalZeros, 5);
    INIT_HUFFMAN_TABLE(total_zeros_map_6, m_tblTotalZeros, 6);
    INIT_HUFFMAN_TABLE(total_zeros_map_7, m_tblTotalZeros, 7);
    INIT_HUFFMAN_TABLE(total_zeros_map_8, m_tblTotalZeros, 8);
    INIT_HUFFMAN_TABLE(total_zeros_map_9, m_tblTotalZeros, 9);
    INIT_HUFFMAN_TABLE(total_zeros_map_10, m_tblTotalZeros, 10);
    INIT_HUFFMAN_TABLE(total_zeros_map_11, m_tblTotalZeros, 11);
    INIT_HUFFMAN_TABLE(total_zeros_map_12, m_tblTotalZeros, 12);
    INIT_HUFFMAN_TABLE(total_zeros_map_13, m_tblTotalZeros, 13);
    INIT_HUFFMAN_TABLE(total_zeros_map_14, m_tblTotalZeros, 14);
    INIT_HUFFMAN_TABLE(total_zeros_map_15, m_tblTotalZeros, 15);
    INIT_HUFFMAN_TABLE(run_before_map_1, m_tblRunBefore, 1);
    INIT_HUFFMAN_TABLE(run_before_map_2, m_tblRunBefore, 2);
    INIT_HUFFMAN_TABLE(run_before_map_3, m_tblRunBefore, 3);
    INIT_HUFFMAN_TABLE(run_before_map_4, m_tblRunBefore, 4);
    INIT_HUFFMAN_TABLE(run_before_map_5, m_tblRunBefore, 5);
    INIT_HUFFMAN_TABLE(run_before_map_6, m_tblRunBefore, 6);
    INIT_HUFFMAN_TABLE(run_before_map_6p, m_tblRunBefore, 7);

    INIT_HUFFMAN_STOP();
#else
    IppStatus ippSts;
    // release tables before initialization
    ReleaseTables();

    //
    // number Coeffs and Trailing Ones map tables allocation
    //

    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(coeff_token_map_02, &m_tblCoeffToken[0]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(coeff_token_map_24, &m_tblCoeffToken[1]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(coeff_token_map_48, &m_tblCoeffToken[2]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(coeff_token_map_cr, &m_tblCoeffToken[3]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanRunLevelTableInitAlloc_32s(coeff_token_map_cr2, &m_tblCoeffToken[4]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    //
    // TotalZeros tables allocation
    //

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr1, &m_tblTotalZerosCR[1]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr2, &m_tblTotalZerosCR[2]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr3, &m_tblTotalZerosCR[3]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_1, &m_tblTotalZerosCR422[1]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_2, &m_tblTotalZerosCR422[2]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_3, &m_tblTotalZerosCR422[3]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_4, &m_tblTotalZerosCR422[4]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_5, &m_tblTotalZerosCR422[5]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_6, &m_tblTotalZerosCR422[6]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_cr422_7, &m_tblTotalZerosCR422[7]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_1, &m_tblTotalZeros[1]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_2, &m_tblTotalZeros[2]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_3, &m_tblTotalZeros[3]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_4, &m_tblTotalZeros[4]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_5, &m_tblTotalZeros[5]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_6, &m_tblTotalZeros[6]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_7, &m_tblTotalZeros[7]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_8, &m_tblTotalZeros[8]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_9, &m_tblTotalZeros[9]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_10, &m_tblTotalZeros[10]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_11, &m_tblTotalZeros[11]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_12, &m_tblTotalZeros[12]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_13, &m_tblTotalZeros[13]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_14, &m_tblTotalZeros[14]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(total_zeros_map_15, &m_tblTotalZeros[15]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    //
    // Run Befores tables allocation
    //

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_1, &m_tblRunBefore[1]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_2, &m_tblRunBefore[2]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_3, &m_tblRunBefore[3]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_4, &m_tblRunBefore[4]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_5, &m_tblRunBefore[5]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_6, &m_tblRunBefore[6]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;

    ippSts = ippiHuffmanTableInitAlloc_32s(run_before_map_6p, &m_tblRunBefore[7]);
    if (ippStsNoErr != ippSts)
        return UMC_ERR_ALLOC;
#endif

    m_tblRunBefore[8]  = m_tblRunBefore[7];
    m_tblRunBefore[9]  = m_tblRunBefore[7];
    m_tblRunBefore[10] = m_tblRunBefore[7];
    m_tblRunBefore[11] = m_tblRunBefore[7];
    m_tblRunBefore[12] = m_tblRunBefore[7];
    m_tblRunBefore[13] = m_tblRunBefore[7];
    m_tblRunBefore[14] = m_tblRunBefore[7];
    m_tblRunBefore[15] = m_tblRunBefore[7];

    m_bTablesInited = true;

    return UMC_OK;

} // Status H264Bitstream::InitTables(void)

bool H264Bitstream::Init(void)
{
    // check decoding tables status
    if (UMC_OK != InitTables())
        return false;

    return true;

} // bool H264Bitstream::Init(void)

void H264Bitstream::Reset(Ipp8u * const pb, const Ipp32u maxsize)
{
    m_pbs       = (Ipp32u*)pb;
    m_pbsBase   = (Ipp32u*)pb;
    m_bitOffset = 31;
    m_maxBsSize    = maxsize;

} // void H264Bitstream::Reset(Ipp8u * const pb, const Ipp32u maxsize)

void H264Bitstream::Reset(Ipp8u * const pb, Ipp32s offset, const Ipp32u maxsize)
{
    m_pbs       = (Ipp32u*)pb;
    m_pbsBase   = (Ipp32u*)pb;
    m_bitOffset = offset;
    m_maxBsSize = maxsize;

} // void H264Bitstream::Reset(Ipp8u * const pb, Ipp32s offset, const Ipp32u maxsize)

void H264Bitstream::RollbackCurrentNALU()
{
    ippiUngetBits32(m_pbs,m_bitOffset);
}
// ---------------------------------------------------------------------------
//  H264Bitstream::GetSCP()
//  Determine if next bistream symbol is a start code. If not,
//  do not change bitstream position and return false. If yes, advance
//  bitstream position to first symbol following SCP and return true.
//
//  A start code is:
//  * next 2 bytes are zero
//  * next non-zero byte is '01'
//  * may include extra stuffing zero bytes
// ---------------------------------------------------------------------------
Ipp32s H264Bitstream::GetSCP()
{
    Ipp32s code, code1,tmp;
    Ipp32u* ptr_state = m_pbs;
    Ipp32s  bit_state = m_bitOffset;
    VM_ASSERT(m_bitOffset >= 0 && m_bitOffset <= 31);
    tmp = (m_bitOffset+1)%8;
    if(tmp)
    {
        ippiGetNBits(m_pbs, m_bitOffset, tmp ,code);
        if ((code << (8 - tmp)) & 0x7f)    // most sig bit could be rbsp stop bit
        {
            m_pbs = ptr_state;
            m_bitOffset = bit_state;
            return 0;    // not rbsp if following non-zero bits
        }
    }
    else
    {
        Ipp32s remaining_bytes = (Ipp32s)m_maxBsSize - (Ipp32s) BytesDecoded();
        if (remaining_bytes<1)
            return -1; //signilizes end of buffer
        ippiNextBits(m_pbs, m_bitOffset,8, code);
        if (code == 0x80)
        {
            // skip past trailing RBSP stop bit
            ippiGetBits8(m_pbs, m_bitOffset, code);
        }
    }
    Ipp32s remaining_bytes = (Ipp32s)BytesLeft();
    if (remaining_bytes<1)
        return -1; //signilizes end of buffer
    //ippiNextBits(m_pbs, m_bitOffset,8, code);

    ippiGetBits8(m_pbs, m_bitOffset, code);
    if(code != 0) {
        m_pbs = ptr_state;
        m_bitOffset = bit_state;
        return 0;
    }
    if(remaining_bytes<2) {
        return(-1);
    }
    ippiGetBits8(m_pbs, m_bitOffset, code1);
    if (code1 != 0)
    {
        m_pbs = ptr_state;
        m_bitOffset = bit_state;
        return 0;
    }
    ippiGetBits8(m_pbs, m_bitOffset, code);
    Ipp32s max_search_length = (Ipp32s)BytesLeft();

    while (code == 0 && max_search_length-->0)
    {
        ippiGetBits8(m_pbs, m_bitOffset, code);

    }
    if (max_search_length<1)
        return -1;
    if (code != 1)
    {
        m_pbs = ptr_state;
        m_bitOffset = bit_state;
        return 0;
    }

    return 1;

} // H264Bitstream::GetSCP()

Status H264Bitstream::AdvanceToNextSCP()
{
    // Search bitstream for next start code:
    // 3 bytes:  0 0 1

    Ipp32s max_search_length = (Ipp32s)(m_maxBsSize - (Ipp32u)(((Ipp8u *) m_pbs) - ((Ipp8u *) m_pbsBase)));
    Ipp32u t1,t2,t3;
    Ipp32s p;

    if((m_bitOffset+1) % 8)
        AlignPointerRight();

    ippiGetBits8(m_pbs, m_bitOffset, t1);
    ippiGetBits8(m_pbs, m_bitOffset, t2);
    ippiGetBits8(m_pbs, m_bitOffset, t3);

    for (p = 0; p < max_search_length - 2; p++)
    {
        if (t1==0 && t2==0 && t3==1)
        {
            ippiUngetNBits(m_pbs,m_bitOffset,24);
            return UMC_OK;
        }
        t1=t2;
        t2=t3;
        ippiGetBits8(m_pbs, m_bitOffset, t3);

    }

    return  UMC_ERR_INVALID_STREAM;

} // Status H264Bitstream::AdvanceToNextSCP()

bool H264Bitstream::More_RBSP_Data()
{
    Ipp32s code, tmp;
    Ipp32u* ptr_state = m_pbs;
    Ipp32s  bit_state = m_bitOffset;

    VM_ASSERT(m_bitOffset >= 0 && m_bitOffset <= 31);

    Ipp32s remaining_bytes = (Ipp32s)BytesLeft();

    if (remaining_bytes <= 0)
        return false;

    // get top bit, it can be "rbsp stop" bit
    ippiGetNBits(m_pbs, m_bitOffset, 1, code);

    // get remain bits, which is less then byte
    tmp = (m_bitOffset + 1) % 8;

    if(tmp)
    {
        ippiGetNBits(m_pbs, m_bitOffset, tmp, code);
        if ((code << (8 - tmp)) & 0x7f)    // most sig bit could be rbsp stop bit
        {
            m_pbs = ptr_state;
            m_bitOffset = bit_state;
            // there are more data
            return true;
        }
    }

    remaining_bytes = (Ipp32s)BytesLeft();

    // run through remain bytes
    while (0 < remaining_bytes)
    {
        ippiGetBits8(m_pbs, m_bitOffset, code);

        if (code)
        {
            m_pbs = ptr_state;
            m_bitOffset = bit_state;
            // there are more data
            return true;
        }

        remaining_bytes -= 1;
    }

    return false;
}

// ---------------------------------------------------------------------------
//  H264Bitstream::GetNALUnitType()
//    Bitstream position is expected to be at the start of a NAL unit.
//    Read and return NAL unit type and NAL storage idc.
// ---------------------------------------------------------------------------
Status H264Bitstream::GetNALUnitType( NAL_Unit_Type &uNALUnitType,Ipp8u &uNALStorageIDC)
{
    Ipp32u code;
    ippiGetBits8(m_pbs, m_bitOffset, code);

    uNALStorageIDC = (Ipp8u)((code & NAL_STORAGE_IDC_BITS)>>5);
    uNALUnitType = (NAL_Unit_Type)(code & NAL_UNITTYPE_BITS);
    return UMC_OK;
}    // GetNALUnitType

void H264Bitstream::GetScalingList4x4(H264ScalingList4x4 *scl, Ipp8u *def, Ipp8u *scl_type)
{
    Ipp32u lastScale = 8;
    Ipp32u nextScale = 8;
    bool DefaultMatrix = false;
    Ipp32s j;

    for (j = 0; j < 16; j++ )
    {
        if (nextScale != 0)
        {
            Ipp32s delta_scale  = GetVLCElement(true);
            if (delta_scale < -128 || delta_scale > 127)
                throw h264_exception(UMC_ERR_INVALID_STREAM);
            nextScale = ( lastScale + delta_scale + 256 ) & 0xff;
            DefaultMatrix = ( j == 0 && nextScale == 0 );
        }
        scl->ScalingListCoeffs[ mp_scan4x4[0][j] ] = ( nextScale == 0 ) ? (Ipp8u)lastScale : (Ipp8u)nextScale;
        lastScale = scl->ScalingListCoeffs[ mp_scan4x4[0][j] ];
    }
    if (!DefaultMatrix)
    {
        *scl_type=SCLREDEFINED;
        return;
    }
    *scl_type= SCLDEFAULT;
    FillScalingList4x4(scl,def);
    return;
}

void H264Bitstream::GetScalingList8x8(H264ScalingList8x8 *scl, Ipp8u *def, Ipp8u *scl_type)
{
    Ipp32u lastScale = 8;
    Ipp32u nextScale = 8;
    bool DefaultMatrix=false;
    Ipp32s j;

    for (j = 0; j < 64; j++ )
    {
        if (nextScale != 0)
        {
            Ipp32s delta_scale  = GetVLCElement(true);
            if (delta_scale < -128 || delta_scale > 127)
                throw h264_exception(UMC_ERR_INVALID_STREAM);
            nextScale = ( lastScale + delta_scale + 256 ) & 0xff;
            DefaultMatrix = ( j == 0 && nextScale == 0 );
        }
        scl->ScalingListCoeffs[ hp_scan8x8[0][j] ] = ( nextScale == 0 ) ? (Ipp8u)lastScale : (Ipp8u)nextScale;
        lastScale = scl->ScalingListCoeffs[ hp_scan8x8[0][j] ];
    }
    if (!DefaultMatrix)
    {
        *scl_type=SCLREDEFINED;
        return;
    }
    *scl_type= SCLDEFAULT;
    FillScalingList8x8(scl,def);
    return;

}
// ---------------------------------------------------------------------------
//  H264Bitstream::GetSequenceParamSet()
//    Read sequence parameter set data from bitstream.
// ---------------------------------------------------------------------------
Status H264Bitstream::GetSequenceParamSet(H264SeqParamSet *sps)
{
    // Not all members of the seq param set structure are contained in all
    // seq param sets. So start by init all to zero.
    Status ps = UMC_OK;
    XippsZero_8u((Ipp8u*)sps, sizeof (H264SeqParamSet));

    // profile
    // TBD: add rejection of unsupported profile
    sps->profile_idc = (Ipp8u)GetBits(8);

    switch (sps->profile_idc)
    {
    case H264VideoDecoderParams::H264_PROFILE_BASELINE:
    case H264VideoDecoderParams::H264_PROFILE_MAIN:
    case H264VideoDecoderParams::H264_PROFILE_EXTENDED:
    case H264VideoDecoderParams::H264_PROFILE_HIGH:
    case H264VideoDecoderParams::H264_PROFILE_HIGH10:
    case H264VideoDecoderParams::H264_PROFILE_HIGH422:
    case H264VideoDecoderParams::H264_PROFILE_HIGH444:
    case H264VideoDecoderParams::H264_PROFILE_ADVANCED444_INTRA:
    case H264VideoDecoderParams::H264_PROFILE_ADVANCED444:

        break;
    default:
        return UMC_ERR_INVALID_STREAM;
    }

    sps->constrained_set0_flag = (Ipp8u)Get1Bit();

    sps->constrained_set1_flag = (Ipp8u)Get1Bit();

    sps->constrained_set2_flag = (Ipp8u)Get1Bit();

    sps->constrained_set3_flag = (Ipp8u)Get1Bit();

    // skip 4 zero bits
    GetBits(4);

    sps->level_idc = (Ipp8u)GetBits(8);

    switch(sps->level_idc)
    {
    case H264VideoDecoderParams::H264_LEVEL_1:
    case H264VideoDecoderParams::H264_LEVEL_11:
    case H264VideoDecoderParams::H264_LEVEL_12:
    case H264VideoDecoderParams::H264_LEVEL_13:

    case H264VideoDecoderParams::H264_LEVEL_2:
    case H264VideoDecoderParams::H264_LEVEL_21:
    case H264VideoDecoderParams::H264_LEVEL_22:

    case H264VideoDecoderParams::H264_LEVEL_3:
    case H264VideoDecoderParams::H264_LEVEL_31:
    case H264VideoDecoderParams::H264_LEVEL_32:

    case H264VideoDecoderParams::H264_LEVEL_4:
    case H264VideoDecoderParams::H264_LEVEL_41:
    case H264VideoDecoderParams::H264_LEVEL_42:

    case H264VideoDecoderParams::H264_LEVEL_5:
    case H264VideoDecoderParams::H264_LEVEL_51:
        break;
    default:
        return UMC_ERR_INVALID_STREAM;
    }

    // id
    Ipp32s sps_id = GetVLCElement(false);
    if (sps_id > MAX_NUM_SEQ_PARAM_SETS - 1)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    sps->seq_parameter_set_id = (Ipp8u)sps_id;

    if((sps->profile_idc==100) || (sps->profile_idc==110) ||(sps->profile_idc==122) ||(sps->profile_idc==144))
    {
        Ipp32u chroma_format_idc = (Ipp32u)GetVLCElement(false);

        if (chroma_format_idc > 3)
            return UMC_ERR_INVALID_STREAM;

        sps->chroma_format_idc = (Ipp8u)chroma_format_idc;
        if (sps->chroma_format_idc==3)
        {
            sps->residual_colour_transform_flag = (Ipp8u) Get1Bit();
        }

        Ipp32u bit_depth_luma = GetVLCElement(false) + 8;
        Ipp32u bit_depth_chroma = GetVLCElement(false) + 8;

        if (bit_depth_luma > 16 || bit_depth_chroma > 16)
            return UMC_ERR_INVALID_STREAM;

        sps->bit_depth_luma = (Ipp8u)bit_depth_luma;
        sps->bit_depth_chroma = (Ipp8u)bit_depth_chroma;

        VM_ASSERT(!sps->residual_colour_transform_flag);
        if (sps->residual_colour_transform_flag == 1)
        {
            return UMC_ERR_INVALID_STREAM;
        }

        sps->qpprime_y_zero_transform_bypass_flag = (Ipp8u)Get1Bit();
        sps->seq_scaling_matrix_present_flag = (Ipp8u)Get1Bit();
        if(sps->seq_scaling_matrix_present_flag)
        {
            // 0
            if(Get1Bit())
            {
                GetScalingList4x4(&sps->ScalingLists4x4[0],(Ipp8u*)default_intra_scaling_list4x4,&sps->type_of_scaling_list_used[0]);
            }
            else
            {
                FillScalingList4x4(&sps->ScalingLists4x4[0],(Ipp8u*) default_intra_scaling_list4x4);
                sps->type_of_scaling_list_used[0] = SCLDEFAULT;
            }
            // 1
            if(Get1Bit())
            {
                GetScalingList4x4(&sps->ScalingLists4x4[1],(Ipp8u*) default_intra_scaling_list4x4,&sps->type_of_scaling_list_used[1]);
            }
            else
            {
                FillScalingList4x4(&sps->ScalingLists4x4[1],(Ipp8u*) sps->ScalingLists4x4[0].ScalingListCoeffs);
                sps->type_of_scaling_list_used[1] = SCLDEFAULT;
            }
            // 2
            if(Get1Bit())
            {
                GetScalingList4x4(&sps->ScalingLists4x4[2],(Ipp8u*) default_intra_scaling_list4x4,&sps->type_of_scaling_list_used[2]);
            }
            else
            {
                FillScalingList4x4(&sps->ScalingLists4x4[2],(Ipp8u*) sps->ScalingLists4x4[1].ScalingListCoeffs);
                sps->type_of_scaling_list_used[2] = SCLDEFAULT;
            }
            // 3
            if(Get1Bit())
            {
                GetScalingList4x4(&sps->ScalingLists4x4[3],(Ipp8u*)default_inter_scaling_list4x4,&sps->type_of_scaling_list_used[3]);
            }
            else
            {
                FillScalingList4x4(&sps->ScalingLists4x4[3],(Ipp8u*) default_inter_scaling_list4x4);
                sps->type_of_scaling_list_used[3] = SCLDEFAULT;
            }
            // 4
            if(Get1Bit())
            {
                GetScalingList4x4(&sps->ScalingLists4x4[4],(Ipp8u*) default_inter_scaling_list4x4,&sps->type_of_scaling_list_used[4]);
            }
            else
            {
                FillScalingList4x4(&sps->ScalingLists4x4[4],(Ipp8u*) sps->ScalingLists4x4[3].ScalingListCoeffs);
                sps->type_of_scaling_list_used[4] = SCLDEFAULT;
            }
            // 5
            if(Get1Bit())
            {
                GetScalingList4x4(&sps->ScalingLists4x4[5],(Ipp8u*) default_inter_scaling_list4x4,&sps->type_of_scaling_list_used[5]);
            }
            else
            {
                FillScalingList4x4(&sps->ScalingLists4x4[5],(Ipp8u*) sps->ScalingLists4x4[4].ScalingListCoeffs);
                sps->type_of_scaling_list_used[5] = SCLDEFAULT;
            }

            // 0
            if(Get1Bit())
            {
                GetScalingList8x8(&sps->ScalingLists8x8[0],(Ipp8u*)default_intra_scaling_list8x8,&sps->type_of_scaling_list_used[6]);
            }
            else
            {
                FillScalingList8x8(&sps->ScalingLists8x8[0],(Ipp8u*) default_intra_scaling_list8x8);
                sps->type_of_scaling_list_used[6] = SCLDEFAULT;
            }
            // 1
            if(Get1Bit())
            {
                GetScalingList8x8(&sps->ScalingLists8x8[1],(Ipp8u*) default_inter_scaling_list8x8,&sps->type_of_scaling_list_used[7]);
            }
            else
            {
                FillScalingList8x8(&sps->ScalingLists8x8[1],(Ipp8u*) default_inter_scaling_list8x8);
                sps->type_of_scaling_list_used[7] = SCLDEFAULT;
            }

        }
        else
        {
            Ipp32s i;

            for (i = 0; i < 6; i += 1)
            {
                FillFlatScalingList4x4(&sps->ScalingLists4x4[i]);
            }
            for (i = 0; i < 2; i += 1)
            {
                FillFlatScalingList8x8(&sps->ScalingLists8x8[i]);
            }

        }
    }
    else
    {
        sps->chroma_format_idc = 1;
        sps->bit_depth_luma = 8;
        sps->bit_depth_chroma = 8;

        SetDefaultScalingLists(sps);
    }

    // log2 max frame num (bitstream contains value - 4)
    Ipp32u log2_max_frame_num = GetVLCElement(false) + 4;
    sps->log2_max_frame_num = (Ipp8u)log2_max_frame_num;

    if (log2_max_frame_num > 16 || log2_max_frame_num < 4)
        return UMC_ERR_INVALID_STREAM;

    // pic order cnt type (0..2)
    Ipp32u pic_order_cnt_type = GetVLCElement(false);
    sps->pic_order_cnt_type = (Ipp8u)pic_order_cnt_type;
    if (pic_order_cnt_type > 2)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    if (sps->pic_order_cnt_type == 0)
    {
        // log2 max pic order count lsb (bitstream contains value - 4)
        Ipp32u log2_max_pic_order_cnt_lsb = GetVLCElement(false) + 4;
        sps->log2_max_pic_order_cnt_lsb = (Ipp8u)log2_max_pic_order_cnt_lsb;

        if (sps->log2_max_pic_order_cnt_lsb > 16 || sps->log2_max_pic_order_cnt_lsb < 4)
            return UMC_ERR_INVALID_STREAM;

        sps->MaxPicOrderCntLsb = (1 << sps->log2_max_pic_order_cnt_lsb);
    }
    else if (sps->pic_order_cnt_type == 1)
    {
        sps->delta_pic_order_always_zero_flag = (Ipp8u)Get1Bit();
        sps->offset_for_non_ref_pic = GetVLCElement(true);
        sps->offset_for_top_to_bottom_field = GetVLCElement(true);
        sps->num_ref_frames_in_pic_order_cnt_cycle = GetVLCElement(false);

        if (sps->num_ref_frames_in_pic_order_cnt_cycle > 255)
            return UMC_ERR_INVALID_STREAM;

        // alloc memory for stored frame offsets
        Ipp32s len = IPP_MAX(1, sps->num_ref_frames_in_pic_order_cnt_cycle);

        sps->poffset_for_ref_frame = (Ipp32s *)XippsMalloc_8u((Ipp32s) len * sizeof(Ipp32s));

        if (sps->poffset_for_ref_frame == NULL)
            return UMC_ERR_ALLOC;

        // get offsets
        for (Ipp32u i = 0; i < sps->num_ref_frames_in_pic_order_cnt_cycle; i++)
        {
            sps->poffset_for_ref_frame[i] = GetVLCElement(true);
        }
    }    // pic order count type 1

    // num ref frames
    sps->num_ref_frames = GetVLCElement(false);
    if (sps->num_ref_frames > 16)
        return UMC_ERR_INVALID_STREAM;

    sps->gaps_in_frame_num_value_allowed_flag = (Ipp8u)Get1Bit();

    // picture width in MBs (bitstream contains value - 1)
    sps->frame_width_in_mbs = GetVLCElement(false) + 1;

    // picture height in MBs (bitstream contains value - 1)
    sps->frame_height_in_mbs = GetVLCElement(false) + 1;

    sps->frame_mbs_only_flag = (Ipp8u)Get1Bit();
    sps->frame_height_in_mbs  = (2-sps->frame_mbs_only_flag)*sps->frame_height_in_mbs;
    if (sps->frame_mbs_only_flag == 0)
    {
        sps->mb_adaptive_frame_field_flag = (Ipp8u)Get1Bit();
    }
    sps->direct_8x8_inference_flag = (Ipp8u)Get1Bit();
    if (sps->frame_mbs_only_flag==0)
    {
        sps->direct_8x8_inference_flag = 1;
    }
    sps->frame_cropping_flag = (Ipp8u)Get1Bit();

    if (sps->frame_cropping_flag)
    {
        sps->frame_cropping_rect_left_offset      = GetVLCElement(false);
        sps->frame_cropping_rect_right_offset     = GetVLCElement(false);
        sps->frame_cropping_rect_top_offset       = GetVLCElement(false);
        sps->frame_cropping_rect_bottom_offset    = GetVLCElement(false);
    }

    sps->vui_parameters_present_flag = (Ipp8u)Get1Bit();
    if (sps->vui_parameters_present_flag)
    {
        if (ps == UMC_OK)
            ps = GetVUIParam(sps);
    }

    return ps;
}    // GetSequenceParamSet

// ---------------------------------------------------------------------------
//  H264Bitstream::GetSequenceParamSetExtension()
//    Read sequence parameter set extension data from bitstream.
// ---------------------------------------------------------------------------
Status H264Bitstream::GetSequenceParamSetExtension(H264SeqParamSetExtension *sps_ex)
{
    // Not all members of the seq param set structure are contained in all
    // seq param sets. So start by init all to zero.
    Status ps = UMC_OK;
    XippsZero_8u((Ipp8u*)sps_ex, sizeof (H264SeqParamSetExtension));

    Ipp32u seq_parameter_set_id = GetVLCElement(false);
    sps_ex->seq_parameter_set_id = (Ipp8u)seq_parameter_set_id;
    if (seq_parameter_set_id > MAX_NUM_SEQ_PARAM_SETS-1)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    Ipp32u aux_format_idc = GetVLCElement(false);
    sps_ex->aux_format_idc = (Ipp8u)aux_format_idc;
    if (aux_format_idc > 3)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    if (sps_ex->aux_format_idc != 1 && sps_ex->aux_format_idc != 2)
        sps_ex->aux_format_idc = 0;

    if (sps_ex->aux_format_idc)
    {
        Ipp32u bit_depth_aux = GetVLCElement(false) + 8;
        sps_ex->bit_depth_aux = (Ipp8u)bit_depth_aux;
        if (bit_depth_aux > 12)
        {
            return UMC_ERR_INVALID_STREAM;
        }

        sps_ex->alpha_incr_flag = (Ipp8u)Get1Bit();
        sps_ex->alpha_opaque_value = (Ipp8u)GetBits(sps_ex->bit_depth_aux + 1);
        sps_ex->alpha_transparent_value = (Ipp8u)GetBits(sps_ex->bit_depth_aux + 1);
    }

    sps_ex->additional_extension_flag = (Ipp8u)Get1Bit();

    return ps;
}    // GetSequenceParamSetExtension

Status H264Bitstream::GetPictureParamSetPart1(H264PicParamSet *pps)
{
    // Not all members of the pic param set structure are contained in all
    // pic param sets. So start by init all to zero.
    memset(pps, 0, sizeof (H264PicParamSet));

    // id
    Ipp32u pic_parameter_set_id = GetVLCElement(false);
    pps->pic_parameter_set_id = (Ipp16u)pic_parameter_set_id;
    if (pic_parameter_set_id > MAX_NUM_PIC_PARAM_SETS-1)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    // seq param set referred to by this pic param set
    Ipp32u seq_parameter_set_id = GetVLCElement(false);
    pps->seq_parameter_set_id = (Ipp8u)seq_parameter_set_id;
    if (seq_parameter_set_id > MAX_NUM_SEQ_PARAM_SETS-1)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    return UMC_OK;
}    // GetPictureParamSetPart1

// Number of bits required to code slice group ID, index is num_slice_groups - 2
static const Ipp8u SGIdBits[7] = {1,2,2,3,3,3,3};

// ---------------------------------------------------------------------------
//  CH263pBs::GetPictureParamSet()
//    Read picture parameter set data from bitstream.
// ---------------------------------------------------------------------------
Status H264Bitstream::GetPictureParamSetPart2(H264PicParamSet  *pps,
                                              const H264SeqParamSet *sps)
{
    pps->entropy_coding_mode = (Ipp8u)Get1Bit();


    pps->pic_order_present_flag = (Ipp8u)Get1Bit();

    // number of slice groups, bitstream has value - 1
    pps->num_slice_groups = GetVLCElement(false) + 1;
    if (pps->num_slice_groups != 1)
    {
        Ipp32u slice_group;
        Ipp32u PicSizeInMapUnits;    // for range checks

        PicSizeInMapUnits = sps->frame_width_in_mbs * sps->frame_height_in_mbs;
            // TBD: needs adjust for fields

        if (pps->num_slice_groups > MAX_NUM_SLICE_GROUPS)
        {
            return UMC_ERR_INVALID_STREAM;
        }

        Ipp32u slice_group_map_type = GetVLCElement(false);
        pps->SliceGroupInfo.slice_group_map_type = (Ipp8u)slice_group_map_type;

        if (slice_group_map_type > 6)
            return UMC_ERR_INVALID_STREAM;

        // Get additional, map type dependent slice group data
        switch (pps->SliceGroupInfo.slice_group_map_type)
        {
        case 0:
            for (slice_group=0; slice_group<pps->num_slice_groups; slice_group++)
            {
                // run length, bitstream has value - 1
                pps->SliceGroupInfo.run_length[slice_group] = GetVLCElement(false) + 1;

                if (pps->SliceGroupInfo.run_length[slice_group] > PicSizeInMapUnits)
                {
                    return UMC_ERR_INVALID_STREAM;
                }
            }
            break;
        case 1:
            // no additional info
            break;
        case 2:
            for (slice_group=0; slice_group<(Ipp32u)(pps->num_slice_groups-1); slice_group++)
            {
                pps->SliceGroupInfo.t1.top_left[slice_group] = GetVLCElement(false);
                pps->SliceGroupInfo.t1.bottom_right[slice_group] = GetVLCElement(false);

                // check for legal values
                if (pps->SliceGroupInfo.t1.top_left[slice_group] >
                    pps->SliceGroupInfo.t1.bottom_right[slice_group])
                {
                    return UMC_ERR_INVALID_STREAM;
                }
                if (pps->SliceGroupInfo.t1.bottom_right[slice_group] >= PicSizeInMapUnits)
                {
                    return UMC_ERR_INVALID_STREAM;
                }
                if ((pps->SliceGroupInfo.t1.top_left[slice_group] %
                    sps->frame_width_in_mbs) >
                    (pps->SliceGroupInfo.t1.bottom_right[slice_group] %
                    sps->frame_width_in_mbs))
                {
                    return UMC_ERR_INVALID_STREAM;
                }
            }
            break;
        case 3:
        case 4:
        case 5:
            // For map types 3..5, number of slice groups must be 2
            if (pps->num_slice_groups != 2)
            {
                return UMC_ERR_INVALID_STREAM;
            }
            pps->SliceGroupInfo.t2.slice_group_change_direction_flag = (Ipp8u)Get1Bit();
            pps->SliceGroupInfo.t2.slice_group_change_rate = GetVLCElement(false) + 1;
            if (pps->SliceGroupInfo.t2.slice_group_change_rate > PicSizeInMapUnits)
            {
                return UMC_ERR_INVALID_STREAM;
            }
            break;
        case 6:
            // mapping of slice group to map unit (macroblock if not fields) is
            // per map unit, read from bitstream
            {
                Ipp32u map_unit;
                Ipp32u num_bits;    // number of bits used to code each slice group id

                // number of map units, bitstream has value - 1
                pps->SliceGroupInfo.t3.pic_size_in_map_units = GetVLCElement(false) + 1;
                if (pps->SliceGroupInfo.t3.pic_size_in_map_units != PicSizeInMapUnits)
                {
                    return UMC_ERR_INVALID_STREAM;
                }

                Ipp32s len = IPP_MAX(1, pps->SliceGroupInfo.t3.pic_size_in_map_units);

                pps->SliceGroupInfo.t3.pSliceGroupIDMap = XippsMalloc_8u(len);

                if (pps->SliceGroupInfo.t3.pSliceGroupIDMap == NULL)
                    return UMC_ERR_ALLOC;

                // num_bits is Ceil(log2(num_groups))
                num_bits = SGIdBits[pps->num_slice_groups - 2];

                for (map_unit = 0;
                     map_unit < pps->SliceGroupInfo.t3.pic_size_in_map_units;
                     map_unit++)
                {
                    pps->SliceGroupInfo.t3.pSliceGroupIDMap[map_unit] = (Ipp8u)GetBits(num_bits);
                    if (pps->SliceGroupInfo.t3.pSliceGroupIDMap[map_unit] >
                        pps->num_slice_groups - 1)
                    {
                        return UMC_ERR_INVALID_STREAM;
                    }
                }
            }
            break;
        default:
            return UMC_ERR_INVALID_STREAM;

        }    // switch
    }    // slice group info

    // number of list 0 ref pics used to decode picture, bitstream has value - 1
    pps->num_ref_idx_l0_active = GetVLCElement(false) + 1;

    // number of list 1 ref pics used to decode picture, bitstream has value - 1
    pps->num_ref_idx_l1_active = GetVLCElement(false) + 1;

    if (pps->num_ref_idx_l1_active > MAX_NUM_REF_FRAMES || pps->num_ref_idx_l0_active > MAX_NUM_REF_FRAMES)
        return UMC_ERR_INVALID_STREAM;

    // weighted pediction
    pps->weighted_pred_flag = (Ipp8u)Get1Bit();
    pps->weighted_bipred_idc = (Ipp8u)GetBits(2);

    // default slice QP, bitstream has value - 26
    Ipp32s pic_init_qp = GetVLCElement(true) + 26;
    pps->pic_init_qp = (Ipp8s)pic_init_qp;
    if (pps->pic_init_qp > QP_MAX)
    {
        //return UMC_ERR_INVALID_STREAM;
    }

    // default SP/SI slice QP, bitstream has value - 26
    pps->pic_init_qs = (Ipp8u)(GetVLCElement(true) + 26);
    if (pps->pic_init_qs > QP_MAX)
    {
        //return UMC_ERR_INVALID_STREAM;
    }

    pps->chroma_qp_index_offset[0] = (Ipp8s)GetVLCElement(true);
    if ((pps->chroma_qp_index_offset[0] < -12) || (pps->chroma_qp_index_offset[0] > 12))
    {
        //return UMC_ERR_INVALID_STREAM;
    }

    pps->deblocking_filter_variables_present_flag = (Ipp8u)Get1Bit();
    pps->constrained_intra_pred_flag = (Ipp8u)Get1Bit();
    pps->redundant_pic_cnt_present_flag = (Ipp8u)Get1Bit();
    if (More_RBSP_Data())
    {
        pps->transform_8x8_mode_flag = (Ipp8u) Get1Bit();
        if(sps->seq_scaling_matrix_present_flag)
        {
            //fall-back set rule B
            if(Get1Bit())
            {
                // 0
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[0],(Ipp8u*)default_intra_scaling_list4x4,&pps->type_of_scaling_list_used[0]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[0],(Ipp8u*) sps->ScalingLists4x4[0].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[0] = SCLDEFAULT;
                }
                // 1
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[1],(Ipp8u*) default_intra_scaling_list4x4,&pps->type_of_scaling_list_used[1]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[1],(Ipp8u*) pps->ScalingLists4x4[0].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[1] = SCLDEFAULT;
                }
                // 2
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[2],(Ipp8u*) default_intra_scaling_list4x4,&pps->type_of_scaling_list_used[2]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[2],(Ipp8u*) pps->ScalingLists4x4[1].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[2] = SCLDEFAULT;
                }
                // 3
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[3],(Ipp8u*) default_inter_scaling_list4x4,&pps->type_of_scaling_list_used[3]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[3],(Ipp8u*) sps->ScalingLists4x4[3].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[3] = SCLDEFAULT;
                }
                // 4
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[4],(Ipp8u*) default_inter_scaling_list4x4,&pps->type_of_scaling_list_used[4]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[4],(Ipp8u*) pps->ScalingLists4x4[3].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[4] = SCLDEFAULT;
                }
                // 5
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[5],(Ipp8u*) default_inter_scaling_list4x4,&pps->type_of_scaling_list_used[5]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[5],(Ipp8u*) pps->ScalingLists4x4[4].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[5] = SCLDEFAULT;
                }

                if (pps->transform_8x8_mode_flag)
                {
                    // 0
                    if(Get1Bit())
                    {
                        GetScalingList8x8(&pps->ScalingLists8x8[0],(Ipp8u*)default_intra_scaling_list8x8,&pps->type_of_scaling_list_used[6]);
                    }
                    else
                    {
                        FillScalingList8x8(&pps->ScalingLists8x8[0],(Ipp8u*) sps->ScalingLists8x8[0].ScalingListCoeffs);
                        pps->type_of_scaling_list_used[6] = SCLDEFAULT;
                    }
                    // 1
                    if(Get1Bit())
                    {
                        GetScalingList8x8(&pps->ScalingLists8x8[1],(Ipp8u*) default_inter_scaling_list8x8,&pps->type_of_scaling_list_used[7]);
                    }
                    else
                    {
                        FillScalingList8x8(&pps->ScalingLists8x8[1],(Ipp8u*) sps->ScalingLists8x8[1].ScalingListCoeffs);
                        pps->type_of_scaling_list_used[7] = SCLDEFAULT;
                    }
                }
            }
            else
            {
                Ipp32s i;
                for(i=0; i<6; i++)
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[i],(Ipp8u *)sps->ScalingLists4x4[i].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[i] = sps->type_of_scaling_list_used[i];
                }

                if (pps->transform_8x8_mode_flag)
                {
                    for(i=0; i<2; i++)
                    {
                        FillScalingList8x8(&pps->ScalingLists8x8[i],(Ipp8u *)sps->ScalingLists8x8[i].ScalingListCoeffs);
                        pps->type_of_scaling_list_used[i] = sps->type_of_scaling_list_used[i];
                    }
                }
            }
        }
        else
        {
            //fall-back set rule A
            if(Get1Bit())
            {
                // 0
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[0],(Ipp8u*)default_intra_scaling_list4x4,&pps->type_of_scaling_list_used[0]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[0],(Ipp8u*) default_intra_scaling_list4x4);
                    pps->type_of_scaling_list_used[0] = SCLDEFAULT;
                }
                // 1
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[1],(Ipp8u*) default_intra_scaling_list4x4,&pps->type_of_scaling_list_used[1]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[1],(Ipp8u*) pps->ScalingLists4x4[0].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[1] = SCLDEFAULT;
                }
                // 2
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[2],(Ipp8u*) default_intra_scaling_list4x4,&pps->type_of_scaling_list_used[2]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[2],(Ipp8u*) pps->ScalingLists4x4[1].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[2] = SCLDEFAULT;
                }
                // 3
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[3],(Ipp8u*)default_inter_scaling_list4x4,&pps->type_of_scaling_list_used[3]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[3],(Ipp8u*) default_inter_scaling_list4x4);
                    pps->type_of_scaling_list_used[3] = SCLDEFAULT;
                }
                // 4
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[4],(Ipp8u*) default_inter_scaling_list4x4,&pps->type_of_scaling_list_used[4]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[4],(Ipp8u*) pps->ScalingLists4x4[3].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[4] = SCLDEFAULT;
                }
                // 5
                if(Get1Bit())
                {
                    GetScalingList4x4(&pps->ScalingLists4x4[5],(Ipp8u*) default_inter_scaling_list4x4,&pps->type_of_scaling_list_used[5]);
                }
                else
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[5],(Ipp8u*) pps->ScalingLists4x4[4].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[5] = SCLDEFAULT;
                }

                if (pps->transform_8x8_mode_flag)
                {
                    // 0
                    if(Get1Bit())
                    {
                        GetScalingList8x8(&pps->ScalingLists8x8[0],(Ipp8u*)default_intra_scaling_list8x8,&pps->type_of_scaling_list_used[6]);
                    }
                    else
                    {
                        FillScalingList8x8(&pps->ScalingLists8x8[0],(Ipp8u*) default_intra_scaling_list8x8);
                        pps->type_of_scaling_list_used[6] = SCLDEFAULT;
                    }
                    // 1
                    if(Get1Bit())
                    {
                        GetScalingList8x8(&pps->ScalingLists8x8[1],(Ipp8u*) default_inter_scaling_list8x8,&pps->type_of_scaling_list_used[7]);
                    }
                    else
                    {
                        FillScalingList8x8(&pps->ScalingLists8x8[1],(Ipp8u*) default_inter_scaling_list8x8);
                        pps->type_of_scaling_list_used[7] = SCLDEFAULT;
                    }
                }
            }
            else
            {
                Ipp32s i;
                for(i=0; i<6; i++)
                {
                    FillScalingList4x4(&pps->ScalingLists4x4[i],(Ipp8u *)sps->ScalingLists4x4[i].ScalingListCoeffs);
                    pps->type_of_scaling_list_used[i] = sps->type_of_scaling_list_used[i];
                }

                if (pps->transform_8x8_mode_flag)
                {
                    for(i=0; i<2; i++)
                    {
                        FillScalingList8x8(&pps->ScalingLists8x8[i],(Ipp8u *)sps->ScalingLists8x8[i].ScalingListCoeffs);
                        pps->type_of_scaling_list_used[i] = sps->type_of_scaling_list_used[i];
                    }
                }
            }
        }
        pps->chroma_qp_index_offset[1] = (Ipp8s)GetVLCElement(true);
    }
    else
    {
        pps->chroma_qp_index_offset[1] = pps->chroma_qp_index_offset[0];
        Ipp32s i;
        for(i=0; i<6; i++)
        {
            FillScalingList4x4(&pps->ScalingLists4x4[i],(Ipp8u *)sps->ScalingLists4x4[i].ScalingListCoeffs);
            pps->type_of_scaling_list_used[i] = sps->type_of_scaling_list_used[i];
        }

        if (pps->transform_8x8_mode_flag)
        {
            for(i=0; i<2; i++)
            {
                FillScalingList8x8(&pps->ScalingLists8x8[i],(Ipp8u *)sps->ScalingLists8x8[i].ScalingListCoeffs);
                pps->type_of_scaling_list_used[i] = sps->type_of_scaling_list_used[i];
            }
        }
    }
    // calculate level scale matrices

    //start DC first
    //to do: reduce th anumber of matrices (in fact 1 is enough)
    Ipp32s i;
    // now process other 4x4 matrices
    for (i = 0; i < 6; i++)
    {
        for (Ipp32s j = 0; j < 88; j++)
            for (Ipp32s k = 0; k < 16; k++)
            {
                Ipp32u level_scale = pps->ScalingLists4x4[i].ScalingListCoeffs[k]*pre_norm_adjust4x4[j%6][pre_norm_adjust_index4x4[k]];
                pps->m_LevelScale4x4[i].LevelScaleCoeffs[j][k] = (Ipp16s) level_scale;
            }
    }

    // process remaining 8x8  matrices
    for (i = 0; i < 2; i++)
    {
        for (Ipp32s j = 0; j < 88; j++)
            for (Ipp32s k = 0; k < 64; k++)
            {

                Ipp32u level_scale = pps->ScalingLists8x8[i].ScalingListCoeffs[k]*pre_norm_adjust8x8[j%6][pre_norm_adjust_index8x8[k]];
                    pps->m_LevelScale8x8[i].LevelScaleCoeffs[j][k] = (Ipp16s) level_scale;

            }
    }

    return UMC_OK;
}    // GetPictureParamSet
// ---------------------------------------------------------------------------
//  H264Bitstream::GetAccessUnitDelimiter()
//    Read optional access unit delimiter from bitstream.
// ---------------------------------------------------------------------------
Status H264Bitstream::GetAccessUnitDelimiter(Ipp32u &PicCodType)
{
    PicCodType = GetBits(3);
    return UMC_OK;
}    // GetAccessUnitDelimiter

// ---------------------------------------------------------------------------
//  H264Bitstream::ReadFillerData()
//    Filler data RBSP, read and discard all bytes == 0xff
// ---------------------------------------------------------------------------
Status H264Bitstream::ReadFillerData()
{
    while (SearchBits(8, 0xff, 0));
    return UMC_OK;
}    // SkipFillerData


// ---------------------------------------------------------------------------
//  H264Bitstream::GetSliceHeaderPart1()
//    Read H.264 first part of slice header
//
//  Reading the rest of the header requires info in the picture and sequence
//  parameter sets referred to by this slice header.
//
//    Do not print debug messages when IsSearch is true. In that case the function
//    is being used to find the next compressed frame, errors may occur and should
//    not be reported.
//
// ---------------------------------------------------------------------------
Status H264Bitstream::GetSliceHeaderPart1(H264SliceHeader *hdr)
{
    Ipp32u val;

    hdr->first_mb_in_slice = GetVLCElement(false);
    if (0 > hdr->first_mb_in_slice)
        return UMC_ERR_INVALID_STREAM;

    // slice type
    val = GetVLCElement(false);
    if (val > S_INTRASLICE)
    {
        if (val > S_INTRASLICE + S_INTRASLICE + 1)
        {
            return UMC_ERR_INVALID_STREAM;
        }
        else
        {
            // Slice type is specifying type of not only this but all remaining
            // slices in the picture. Since slice type is always present, this bit
            // of info is not used in our implementation. Adjust (just shift range)
            // and return type without this extra info.
            val -= (S_INTRASLICE + 1);
        }
    }

    if (val > INTRASLICE) // all other doesn't support
        return UMC_ERR_INVALID_STREAM;

    hdr->slice_type = (EnumSliceCodType)val;

    Ipp32u pic_parameter_set_id = GetVLCElement(false);
    hdr->pic_parameter_set_id = (Ipp16u)pic_parameter_set_id;
    if (pic_parameter_set_id > MAX_NUM_PIC_PARAM_SETS - 1)
    {
        return UMC_ERR_INVALID_STREAM;
    }

    return UMC_OK;
} // Status H264Bitstream::GetSliceHeaderPart1(H264SliceHeader *pSliceHeader)

Status H264Bitstream::GetSliceHeaderPart2(
    H264SliceHeader *hdr,        // slice header read goes here
    const H264PicParamSet *pps,
    bool bIsIDRSlice,
    const H264SeqParamSet *sps,
    Ipp8u NALRef_idc)            // from slice header NAL unit
{
    hdr->frame_num = GetBits(sps->log2_max_frame_num);
    hdr->idr_flag = (Ipp8u) bIsIDRSlice;
    hdr->nal_ref_idc = NALRef_idc;

    hdr->bottom_field_flag = 0;
    if (sps->frame_mbs_only_flag == 0)
    {
        hdr->field_pic_flag = (Ipp8u)Get1Bit();
        hdr->MbaffFrameFlag = !hdr->field_pic_flag && sps->mb_adaptive_frame_field_flag;
        if (hdr->field_pic_flag != 0)
        {
            hdr->bottom_field_flag = (Ipp8u)Get1Bit();
        }
    }

    // correct frst_mb_in_slice in order to handle MBAFF
    if (hdr->MbaffFrameFlag && hdr->first_mb_in_slice)
        hdr->first_mb_in_slice <<= 1;

    if (hdr->idr_flag)
    {
        hdr->idr_pic_id = GetVLCElement(false);
        if (hdr->idr_pic_id < 0 || hdr->idr_pic_id > 65535)
            return UMC_ERR_INVALID_STREAM;
    }

    if (sps->pic_order_cnt_type == 0)
    {
        hdr->pic_order_cnt_lsb = GetBits(sps->log2_max_pic_order_cnt_lsb);
        if (pps->pic_order_present_flag && (!hdr->field_pic_flag))
            hdr->delta_pic_order_cnt_bottom = GetVLCElement(true);
    }

    if ((sps->pic_order_cnt_type == 1) && (sps->delta_pic_order_always_zero_flag == 0))
    {
        hdr->delta_pic_order_cnt[0] = GetVLCElement(true);
        if (pps->pic_order_present_flag && (!hdr->field_pic_flag))
            hdr->delta_pic_order_cnt[1] = GetVLCElement(true);
    }

    if (pps->redundant_pic_cnt_present_flag)
    {
        // redundant pic count
        hdr->redundant_pic_cnt = GetVLCElement(false);
        if (hdr->redundant_pic_cnt > 127)
            return UMC_ERR_INVALID_STREAM;
    }

    return UMC_OK;
}

// ---------------------------------------------------------------------------
//    Read H.264 second part of slice header
//
//    Do not print debug messages when IsSearch is true. In that case the function
//    is being used to find the next compressed frame, errors may occur and should
//    not be reported.
// ---------------------------------------------------------------------------

Status H264Bitstream::GetSliceHeaderPart3(
    H264SliceHeader *hdr,        // slice header read goes here
    PredWeightTable *pPredWeight_L0, // L0 weight table goes here
    PredWeightTable *pPredWeight_L1, // L1 weight table goes here
    RefPicListReorderInfo *pReorderInfo_L0,
    RefPicListReorderInfo *pReorderInfo_L1,
    AdaptiveMarkingInfo *pAdaptiveMarkingInfo,
    const H264PicParamSet *pps,
    const H264SeqParamSet *sps,
    Ipp8u NALRef_idc)            // from slice header NAL unit
{
    Ipp8u ref_pic_list_reordering_flag_l0 = 0;
    Ipp8u ref_pic_list_reordering_flag_l1 = 0;

    if (BPREDSLICE == hdr->slice_type)
    {
        // direct mode prediction method
        hdr->direct_spatial_mv_pred_flag = (Ipp8u)Get1Bit();
    }

    if (PREDSLICE == hdr->slice_type ||
        S_PREDSLICE == hdr->slice_type ||
        BPREDSLICE == hdr->slice_type)
    {
        hdr->num_ref_idx_active_override_flag = (Ipp8u)Get1Bit();
        if (hdr->num_ref_idx_active_override_flag != 0)
        // ref idx active l0 and l1
        {
            hdr->num_ref_idx_l0_active = GetVLCElement(false) + 1;
            if (BPREDSLICE == hdr->slice_type)
                hdr->num_ref_idx_l1_active = GetVLCElement(false) + 1;
        }
        else
        {
            // no overide, use num active from pic param set
            hdr->num_ref_idx_l0_active = pps->num_ref_idx_l0_active;
            if (BPREDSLICE == hdr->slice_type)
                hdr->num_ref_idx_l1_active = pps->num_ref_idx_l1_active;
            else
                hdr->num_ref_idx_l1_active = 0;
        }
    }    // ref idx override

    if (hdr->num_ref_idx_l1_active > MAX_NUM_REF_FRAMES || hdr->num_ref_idx_l0_active > MAX_NUM_REF_FRAMES)
        return UMC_ERR_INVALID_STREAM;

    if (hdr->slice_type != INTRASLICE && hdr->slice_type != S_INTRASLICE)
    {
        Ipp32u reordering_of_pic_nums_idc;
        Ipp32u reorder_idx;

        // Reference picture list reordering
        ref_pic_list_reordering_flag_l0 = (Ipp8u)Get1Bit();
        if (ref_pic_list_reordering_flag_l0)
        {
            bool bOk = true;

            reorder_idx = 0;
            reordering_of_pic_nums_idc = 0;

            // Get reorder idc,pic_num pairs until idc==3
            while (bOk)
            {
                reordering_of_pic_nums_idc = GetVLCElement(false);
                if (reordering_of_pic_nums_idc > 3)
                    return UMC_ERR_INVALID_STREAM;

                if (reordering_of_pic_nums_idc == 3)
                    break;

                if (reorder_idx >= MAX_NUM_REF_FRAMES)
                {
                    return UMC_ERR_INVALID_STREAM;
                }

                pReorderInfo_L0->reordering_of_pic_nums_idc[reorder_idx] =
                                            (Ipp8u)reordering_of_pic_nums_idc;
                pReorderInfo_L0->reorder_value[reorder_idx]  =
                                                    GetVLCElement(false);
                if (reordering_of_pic_nums_idc < 2)
                    // abs_diff_pic_num is coded minus 1
                    pReorderInfo_L0->reorder_value[reorder_idx]++;
                reorder_idx++;
            }    // while

            pReorderInfo_L0->num_entries = reorder_idx;
        }    // L0 reordering info
        else
            pReorderInfo_L0->num_entries = 0;
        if (BPREDSLICE == hdr->slice_type)
        {
            ref_pic_list_reordering_flag_l1 = (Ipp8u)Get1Bit();
            if (ref_pic_list_reordering_flag_l1)
            {
                bool bOk = true;

                // Get reorder idc,pic_num pairs until idc==3
                reorder_idx = 0;
                reordering_of_pic_nums_idc = 0;
                while (bOk)
                {
                    reordering_of_pic_nums_idc = GetVLCElement(false);
                    if (reordering_of_pic_nums_idc > 3)
                        return UMC_ERR_INVALID_STREAM;

                    if (reordering_of_pic_nums_idc == 3)
                        break;

                    if (reorder_idx >= MAX_NUM_REF_FRAMES)
                    {
                        return UMC_ERR_INVALID_STREAM;
                    }

                    pReorderInfo_L1->reordering_of_pic_nums_idc[reorder_idx] =
                                                (Ipp8u)reordering_of_pic_nums_idc;
                    pReorderInfo_L1->reorder_value[reorder_idx]  =
                                                        GetVLCElement(false);
                    if (reordering_of_pic_nums_idc < 2)
                        // abs_diff_pic_num is coded minus 1
                        pReorderInfo_L1->reorder_value[reorder_idx]++;
                    reorder_idx++;
                }    // while
                pReorderInfo_L1->num_entries = reorder_idx;
            }    // L1 reordering info
            else
                pReorderInfo_L1->num_entries = 0;

        }    // B slice
    }    // reordering info

    // prediction weight table
    if ( (pps->weighted_pred_flag &&
          ((PREDSLICE == hdr->slice_type) || (S_PREDSLICE == hdr->slice_type))) ||
         ((pps->weighted_bipred_idc == 1) && (BPREDSLICE == hdr->slice_type)))
    {
                Ipp32u luma_log2_weight_denom = GetVLCElement(false);
                hdr->luma_log2_weight_denom = (Ipp8u)luma_log2_weight_denom;
                if (luma_log2_weight_denom > 7)
                    return UMC_ERR_INVALID_STREAM;
                    
                if (sps->chroma_format_idc != 0)
                {
                    Ipp32u chroma_log2_weight_denom = GetVLCElement(false);
                    hdr->chroma_log2_weight_denom = (Ipp8u)chroma_log2_weight_denom;
                    if (chroma_log2_weight_denom > 7)
                        return UMC_ERR_INVALID_STREAM;
                }

        for (Ipp32s refindex = 0; refindex < hdr->num_ref_idx_l0_active; refindex++)
        {
            pPredWeight_L0[refindex].luma_weight_flag = (Ipp8u)Get1Bit();
            if (pPredWeight_L0[refindex].luma_weight_flag)
            {
                pPredWeight_L0[refindex].luma_weight = (Ipp8s)GetVLCElement(true);
                pPredWeight_L0[refindex].luma_offset = (Ipp8s)GetVLCElement(true);
            }
            else
            {
                pPredWeight_L0[refindex].luma_weight = (Ipp8s)(1 << hdr->luma_log2_weight_denom);
                pPredWeight_L0[refindex].luma_offset = 0;
            }

            if (sps->chroma_format_idc != 0)
            {
                pPredWeight_L0[refindex].chroma_weight_flag = (Ipp8u)Get1Bit();
                if (pPredWeight_L0[refindex].chroma_weight_flag)
                {
                    pPredWeight_L0[refindex].chroma_weight[0] = (Ipp8s)GetVLCElement(true);
                    pPredWeight_L0[refindex].chroma_offset[0] = (Ipp8s)GetVLCElement(true);
                    pPredWeight_L0[refindex].chroma_weight[1] = (Ipp8s)GetVLCElement(true);
                    pPredWeight_L0[refindex].chroma_offset[1] = (Ipp8s)GetVLCElement(true);
                }
                else
                {
                    pPredWeight_L0[refindex].chroma_weight[0] = (Ipp8s)(1 << hdr->chroma_log2_weight_denom);
                    pPredWeight_L0[refindex].chroma_weight[1] = (Ipp8s)(1 << hdr->chroma_log2_weight_denom);
                    pPredWeight_L0[refindex].chroma_offset[0] = 0;
                    pPredWeight_L0[refindex].chroma_offset[1] = 0;
                }
            }
        }

        if (BPREDSLICE == hdr->slice_type)
        {
            for (Ipp32s refindex = 0; refindex < hdr->num_ref_idx_l1_active; refindex++)
            {
                pPredWeight_L1[refindex].luma_weight_flag = (Ipp8u)Get1Bit();
                if (pPredWeight_L1[refindex].luma_weight_flag)
                {
                    pPredWeight_L1[refindex].luma_weight = (Ipp8s)GetVLCElement(true);
                    pPredWeight_L1[refindex].luma_offset = (Ipp8s)GetVLCElement(true);
                }
                else
                {
                    pPredWeight_L1[refindex].luma_weight = (Ipp8s)(1 << hdr->luma_log2_weight_denom);
                    pPredWeight_L1[refindex].luma_offset = 0;
                }

                if (sps->chroma_format_idc != 0)
                {
                    pPredWeight_L1[refindex].chroma_weight_flag = (Ipp8u)Get1Bit();
                    if (pPredWeight_L1[refindex].chroma_weight_flag)
                    {
                        pPredWeight_L1[refindex].chroma_weight[0] = (Ipp8s)GetVLCElement(true);
                        pPredWeight_L1[refindex].chroma_offset[0] = (Ipp8s)GetVLCElement(true);
                        pPredWeight_L1[refindex].chroma_weight[1] = (Ipp8s)GetVLCElement(true);
                        pPredWeight_L1[refindex].chroma_offset[1] = (Ipp8s)GetVLCElement(true);
                    }
                    else
                    {
                        pPredWeight_L1[refindex].chroma_weight[0] = (Ipp8s)(1 << hdr->chroma_log2_weight_denom);
                        pPredWeight_L1[refindex].chroma_weight[1] = (Ipp8s)(1 << hdr->chroma_log2_weight_denom);
                        pPredWeight_L1[refindex].chroma_offset[0] = 0;
                        pPredWeight_L1[refindex].chroma_offset[1] = 0;
                    }
                }
            }
        }    // B slice
    }    // prediction weight table
    else
    {
        hdr->luma_log2_weight_denom = 0;
        hdr->chroma_log2_weight_denom = 0;
    }

    // dec_ref_pic_marking
    pAdaptiveMarkingInfo->num_entries = 0;

    if (NALRef_idc)
    {
        if (hdr->idr_flag)
        {
            hdr->no_output_of_prior_pics_flag = (Ipp8u)Get1Bit();
            hdr->long_term_reference_flag = (Ipp8u)Get1Bit();
        }
        else
        {
            Ipp32u memory_management_control_operation;
            Ipp32u num_entries = 0;

            hdr->adaptive_ref_pic_marking_mode_flag = (Ipp8u)Get1Bit();
            while (hdr->adaptive_ref_pic_marking_mode_flag != 0)
            {
                memory_management_control_operation = (Ipp8u)GetVLCElement(false);
                if (memory_management_control_operation == 0)
                    break;

                if (memory_management_control_operation > 6)
                    return UMC_ERR_INVALID_STREAM;

                pAdaptiveMarkingInfo->mmco[num_entries] =
                    (Ipp8u)memory_management_control_operation;
                if (memory_management_control_operation != 5)
                     pAdaptiveMarkingInfo->value[num_entries*2] =
                        GetVLCElement(false);
                // Only mmco 3 requires 2 values
                if (memory_management_control_operation == 3)
                     pAdaptiveMarkingInfo->value[num_entries*2+1] =
                        GetVLCElement(false);
                num_entries++;
                if (num_entries >= MAX_NUM_REF_FRAMES)
                {
                    return UMC_ERR_INVALID_STREAM;
                }
            }    // while
            pAdaptiveMarkingInfo->num_entries = num_entries;
        }
    }    // def_ref_pic_marking

    if (pps->entropy_coding_mode == 1  &&    // CABAC
        (hdr->slice_type != INTRASLICE && hdr->slice_type != S_INTRASLICE))
        hdr->cabac_init_idc = GetVLCElement(false);
    else
        hdr->cabac_init_idc = 0;

    if (hdr->cabac_init_idc > 2)
        return UMC_ERR_INVALID_STREAM;

    hdr->slice_qp_delta = GetVLCElement(true);

    if (S_PREDSLICE == hdr->slice_type ||
        S_INTRASLICE == hdr->slice_type)
    {
        if (S_PREDSLICE == hdr->slice_type)
            hdr->sp_for_switch_flag = (Ipp8u)Get1Bit();
        hdr->slice_qs_delta = GetVLCElement(true);
    }

    if (pps->deblocking_filter_variables_present_flag != 0)
    {
        // deblock filter flag and offsets
        hdr->disable_deblocking_filter_idc = GetVLCElement(false);
        if (hdr->disable_deblocking_filter_idc > 2)
            return UMC_ERR_INVALID_STREAM;

        if (hdr->disable_deblocking_filter_idc != 1)
        {
            hdr->slice_alpha_c0_offset = GetVLCElement(true)<<1;
            hdr->slice_beta_offset = GetVLCElement(true)<<1;

            if (hdr->slice_alpha_c0_offset < -12 || hdr->slice_alpha_c0_offset > 12)
            {
                return UMC_ERR_INVALID_STREAM;
            }

            if (hdr->slice_beta_offset < -12 || hdr->slice_beta_offset > 12)
            {
                return UMC_ERR_INVALID_STREAM;
            }
        }
        else
        {
            // set filter offsets to max values to disable filter
            hdr->slice_alpha_c0_offset = (Ipp8s)(0 - QP_MAX);
            hdr->slice_beta_offset = (Ipp8s)(0 - QP_MAX);
        }
    }

    //hdr->disable_deblocking_filter_idc = 1;

    if ((pps->num_slice_groups > 1) &&
        (pps->SliceGroupInfo.slice_group_map_type >= 3) &&
        (pps->SliceGroupInfo.slice_group_map_type <= 5))
    {
        Ipp32u num_bits;    // number of bits used to code slice_group_change_cycle
        Ipp32u val;
        Ipp32u pic_size_in_map_units;
        Ipp32u max_slice_group_change_cycle=0;

        // num_bits is Ceil(log2(picsizeinmapunits/slicegroupchangerate + 1))
        pic_size_in_map_units = sps->frame_width_in_mbs * sps->frame_height_in_mbs;
            // TBD: change above to support fields

        max_slice_group_change_cycle = pic_size_in_map_units /
                        pps->SliceGroupInfo.t2.slice_group_change_rate;
        if (pic_size_in_map_units %
                        pps->SliceGroupInfo.t2.slice_group_change_rate)
            max_slice_group_change_cycle++;

        val = max_slice_group_change_cycle;// + 1;
        num_bits = 0;
        while (val)
        {
            num_bits++;
            val >>= 1;
        }
        hdr->slice_group_change_cycle = GetBits(num_bits);
        if (hdr->slice_group_change_cycle > max_slice_group_change_cycle)
        {
            //return UMC_ERR_INVALID_STREAM; don't see any reasons for that
        }
    }

    return UMC_OK;
} // GetSliceHeaderPart3()


// ---------------------------------------------------------------------------
//        H264Bitstream::SearchBits()
//        Searches for a code with known number of bits.  Bitstream state,
//        pointer and bit offset, will be updated if code found.
//        nbits        : number of bits in the code
//        code        : code to search for
//        lookahead    : maximum number of bits to parse for the code
// ---------------------------------------------------------------------------

bool H264Bitstream::SearchBits(const Ipp32u nbits, const Ipp32u code, const Ipp32u lookahead)
{
    Ipp32u w;
    Ipp32u n = nbits;
    Ipp32u* pbs;
    Ipp32s offset;

    pbs    = m_pbs;
    offset = m_bitOffset;

    ippiGetNBits(m_pbs, m_bitOffset, n, w)

    for (n = 0; w != code && n < lookahead; n ++)
    {
        w = (w << 1) & GetBitsMask[nbits] | Get1Bit();
    }

    if (w == code)
        return(true);
    else
    {
        m_pbs        = pbs;
        m_bitOffset = offset;
        return(false);
    }

} // H264Bitstream::SearchBits()


inline
Ipp32u H264Bitstream::DecodeSingleBinOnes_CABAC(Ipp32u ctxIdx,
                                                Ipp32s &binIdx)
{
    // See subclause 9.3.3.2.1 of H.264 standard

    Ipp32u pStateIdx = context_array[ctxIdx].pStateIdxAndVal;
    Ipp32u codIOffset = m_lcodIOffset;
    Ipp32u codIRange = m_lcodIRange;
    Ipp32u codIRangeLPS;
    Ipp32u binVal;

#ifdef STORE_CABAC_BITS
    Ipp8u preState = context_array[ctxIdx].pStateIdxAndVal;
#endif

    do
    {
        binIdx += 1;
        codIRangeLPS = rangeTabLPS[pStateIdx][(codIRange >> (6 + CABAC_MAGIC_BITS)) - 4];
        codIRange -= codIRangeLPS << CABAC_MAGIC_BITS;

        // most probably state.
        // it is more likely to decode most probably value.
        if (codIOffset < codIRange)
        {
            binVal = pStateIdx & 1;
            pStateIdx = transIdxMPS[pStateIdx];
        }
        else
        {
            codIOffset -= codIRange;
            codIRange = codIRangeLPS << CABAC_MAGIC_BITS;

            binVal = (pStateIdx & 1) ^ 1;
            pStateIdx = transIdxLPS[pStateIdx];
        }

        // Renormalization process
        // See subclause 9.3.3.2.2 of H.264
        {
            Ipp32u numBits = NumBitsToGetTbl[codIRange >> CABAC_MAGIC_BITS];

            codIRange <<= numBits;
            codIOffset <<= numBits;

#if (CABAC_MAGIC_BITS > 0)
            m_iMagicBits -= numBits;
            if (0 >= m_iMagicBits)
                RefreshCABACBits(codIOffset, m_pMagicBits, m_iMagicBits);
#else // !(CABAC_MAGIC_BITS > 0)
            codIOffset |= GetBits(numBits);
#endif // (CABAC_MAGIC_BITS > 0)
        }

#ifdef STORE_CABAC_BITS
        sym_cnt++;
        if(cabac_bits==NULL) cabac_bits=fopen(__CABAC_FILE__,"w+t");
        if(cabac_bits)
#ifdef CABAC_DECORER_COMP
            fprintf(cabac_bits,"sb %d %d %d %d %d\n",ctxIdx,
            codIRange>>CABAC_MAGIC_BITS,
            codIOffset>>CABAC_MAGIC_BITS,
            binVal,sym_cnt);
#else
            fprintf(cabac_bits,"sb %d %d %d %d %d %d %d\n",ctxIdx,preStateIdx,prevalMPS,pStateIdx,valMPS,binVal,sym_cnt);
            preStateIdx = pStateIdx;
            prevalMPS = valMPS;
#endif
#endif

    } while (binVal && (binIdx < 14));

    context_array[ctxIdx].pStateIdxAndVal = (Ipp8u) pStateIdx;
    m_lcodIOffset = codIOffset;
    m_lcodIRange = codIRange;

    return binVal;

} // Ipp32u H264Bitstream::DecodeSingleBinOnes_CABAC(Ipp32u ctxIdx,

inline
Ipp32u H264Bitstream::DecodeBypassOnes_CABAC(void)
{
    // See subclause 9.3.3.2.3 of H.264 standard
    Ipp32u binVal;// = 0;
    Ipp32u binCount = 0;
    Ipp32u codIOffset = m_lcodIOffset;
    Ipp32u codIRange = m_lcodIRange;

    do
    {
#if (CABAC_MAGIC_BITS > 0)
        codIOffset = (codIOffset << 1);

        m_iMagicBits -= 1;
        if (0 >= m_iMagicBits)
            RefreshCABACBits(codIOffset, m_pMagicBits, m_iMagicBits);
#else // !(CABAC_MAGIC_BITS > 0)
        codIOffset = (codIOffset << 1) | Get1Bit();
#endif // (CABAC_MAGIC_BITS > 0)

        Ipp32s mask = ((Ipp32s)(codIRange)-1-(Ipp32s)(codIOffset))>>31;
        // conditionally negate level
        binVal = mask & 1;
        binCount += binVal;
        // conditionally subtract range from offset
        codIOffset -= codIRange & mask;

#ifdef STORE_CABAC_BITS
        sym_cnt++;
        if(cabac_bits==NULL) cabac_bits=fopen(__CABAC_FILE__,"w+t");
        if(cabac_bits)
#ifdef CABAC_DECORER_COMP
            fprintf(cabac_bits,"bp %d %d %d %d\n",
            codIRange>>CABAC_MAGIC_BITS,
            codIOffset>>CABAC_MAGIC_BITS,
            binVal,sym_cnt);
#else
        fprintf(cabac_bits,"bp %d %d\n",binVal,sym_cnt);
#endif
#endif
    } while(binVal);

    m_lcodIOffset = codIOffset;
    m_lcodIRange = codIRange;

    return binCount;

} // Ipp32u H264Bitstream::DecodeBypassOnes_CABAC(void)

static
Ipp8u iCtxIdxIncTable[64][2] =
{
    {1, 0},
    {2, 0},
    {3, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0},
    {4, 0}
};

Ipp32s H264Bitstream::DecodeSignedLevel_CABAC(Ipp32u ctxIdxOffset,
                                              Ipp32u &numDecodAbsLevelEq1,
                                              Ipp32u &numDecodAbsLevelGt1,
                                              Ipp32u max_value)
{
    // See subclause 9.3.2.3 of H.264
    Ipp32u ctxIdxInc;
    Ipp32s binIdx;

    // PREFIX BIN(S) STRING DECODING
    // decoding first bin of prefix bin string

    if (5 + numDecodAbsLevelGt1 < max_value)
    {
        ctxIdxInc = iCtxIdxIncTable[numDecodAbsLevelEq1][((Ipp32u) -((Ipp32s) numDecodAbsLevelGt1)) >> 31];

        if (0 == DecodeSingleBin_CABAC(ctxIdxOffset + ctxIdxInc))
        {
            numDecodAbsLevelEq1 += 1;
            binIdx = 1;
        }
        else
        {
            Ipp32s binVal;

            // decoding next bin(s) of prefix bin string
            // we use Truncated Unary binarization with cMax = uCoff;
            ctxIdxInc = 5 + numDecodAbsLevelGt1;
            binIdx = 1;

            binVal = DecodeSingleBinOnes_CABAC(ctxIdxOffset + ctxIdxInc, binIdx);

            // SUFFIX BIN(S) STRING DECODING

            // See subclause 9.1 of H.264 standard
            // we use Exp-Golomb code of 0-th order
            if (binVal)
            {
                Ipp32s leadingZeroBits;
                Ipp32s codeNum;

                // counting leading 1' before 0
                leadingZeroBits = DecodeBypassOnes_CABAC();

                // create codeNum
                codeNum = 1;
                while (leadingZeroBits--)
                    codeNum = (codeNum << 1) | DecodeBypass_CABAC();

                // update syntax element
                binIdx += codeNum;

            }

            numDecodAbsLevelGt1 += 1;
        }
    }
    else
    {
        if (0 == DecodeSingleBin_CABAC(ctxIdxOffset + 0))
        {
            numDecodAbsLevelEq1 += 1;
            binIdx = 1;
        }
        else
        {
            Ipp32s binVal;

            // decoding next bin(s) of prefix bin string
            // we use Truncated Unary binarization with cMax = uCoff;
            binIdx = 1;

            binVal = DecodeSingleBinOnes_CABAC(ctxIdxOffset + max_value, binIdx);

            // SUFFIX BIN(S) STRING DECODING

            // See subclause 9.1 of H.264 standard
            // we use Exp-Golomb code of 0-th order
            if (binVal)
            {
                Ipp32s leadingZeroBits;
                Ipp32s codeNum;

                // counting leading 1' before 0
                leadingZeroBits = DecodeBypassOnes_CABAC();

                // create codeNum
                codeNum = 1;
                while (leadingZeroBits--)
                    codeNum = (codeNum << 1) | DecodeBypass_CABAC();

                // update syntax element
                binIdx += codeNum;

            }

            numDecodAbsLevelGt1 += 1;
        }
    }

    {
        Ipp32s lcodIOffset = m_lcodIOffset;
        Ipp32s lcodIRange = m_lcodIRange;

        // See subclause 9.3.3.2.3 of H.264 standard
#if (CABAC_MAGIC_BITS > 0)
        // do shift on 1 bit
        lcodIOffset += lcodIOffset;

        {
            Ipp32s iMagicBits = m_iMagicBits;

            iMagicBits -= 1;
            if (0 >= iMagicBits)
                RefreshCABACBits(lcodIOffset, m_pMagicBits, iMagicBits);
            m_iMagicBits = iMagicBits;
        }
#else // !(CABAC_MAGIC_BITS > 0)
        lcodIOffset = (lcodIOffset << 1) | Get1Bit();
#endif // (CABAC_MAGIC_BITS > 0)

        Ipp32s mask = ((Ipp32s)(lcodIRange) - 1 - (Ipp32s)(lcodIOffset)) >> 31;
        // conditionally negate level
        binIdx = (binIdx ^ mask) - mask;
        // conditionally subtract range from offset
        lcodIOffset -= lcodIRange & mask;

        m_lcodIOffset = lcodIOffset;

#ifdef STORE_CABAC_BITS
        sym_cnt++;
        if(cabac_bits==NULL) cabac_bits=fopen(__CABAC_FILE__,"w+t");
        if(cabac_bits)
#ifdef CABAC_DECORER_COMP
            fprintf(cabac_bits,"bp %d %d %d %d\n",
            m_lcodIRange>>CABAC_MAGIC_BITS,
            m_lcodIOffset>>CABAC_MAGIC_BITS,
            -mask,sym_cnt);
#else
        fprintf(cabac_bits,"bp %d %d\n",-mask,sym_cnt);
#endif
#endif
    }

    return binIdx;

} //Ipp32s H264Bitstream::DecodeSignedLevel_CABAC(Ipp32s ctxIdxOffset, Ipp32s &numDecodAbsLevelEq1, Ipp32s &numDecodAbsLevelGt1)

//
// this is a limited version of the DecodeSignedLevel_CABAC function.
// it decodes single value per block.
//
Ipp32s H264Bitstream::DecodeSingleSignedLevel_CABAC(Ipp32u ctxIdxOffset)
{
    // See subclause 9.3.2.3 of H.264
    Ipp32u ctxIdxInc;
    Ipp32s binIdx;

    // PREFIX BIN(S) STRING DECODING
    // decoding first bin of prefix bin string

    {
        ctxIdxInc = iCtxIdxIncTable[0][0];

        if (0 == DecodeSingleBin_CABAC(ctxIdxOffset + ctxIdxInc))
        {
            binIdx = 1;
        }
        else
        {
            Ipp32s binVal;

            // decoding next bin(s) of prefix bin string
            // we use Truncated Unary binarization with cMax = uCoff;
            ctxIdxInc = 5;
            binIdx = 1;

            binVal = DecodeSingleBinOnes_CABAC(ctxIdxOffset + ctxIdxInc, binIdx);

            // SUFFIX BIN(S) STRING DECODING

            // See subclause 9.1 of H.264 standard
            // we use Exp-Golomb code of 0-th order
            if (binVal)
            {
                Ipp32s leadingZeroBits;
                Ipp32s codeNum;

                // counting leading 1' before 0
                leadingZeroBits = DecodeBypassOnes_CABAC();

                // create codeNum
                codeNum = 1;
                while (leadingZeroBits--)
                    codeNum = (codeNum << 1) | DecodeBypass_CABAC();

                // update syntax element
                binIdx += codeNum;

            }
        }
    }

    {
        Ipp32s lcodIOffset = m_lcodIOffset;
        Ipp32s lcodIRange = m_lcodIRange;

        // See subclause 9.3.3.2.3 of H.264 standard
#if (CABAC_MAGIC_BITS > 0)
        // do shift on 1 bit
        lcodIOffset += lcodIOffset;

        {
            Ipp32s iMagicBits = m_iMagicBits;

            iMagicBits -= 1;
            if (0 >= iMagicBits)
                RefreshCABACBits(lcodIOffset, m_pMagicBits, iMagicBits);
            m_iMagicBits = iMagicBits;
        }
#else // !(CABAC_MAGIC_BITS > 0)
        lcodIOffset = (lcodIOffset << 1) | Get1Bit();
#endif // (CABAC_MAGIC_BITS > 0)

        Ipp32s mask = ((Ipp32s)(lcodIRange) - 1 - (Ipp32s)(lcodIOffset)) >> 31;
        // conditionally negate level
        binIdx = (binIdx ^ mask) - mask;
        // conditionally subtract range from offset
        lcodIOffset -= lcodIRange & mask;

        m_lcodIOffset = lcodIOffset;

#ifdef STORE_CABAC_BITS
        sym_cnt++;
        if(cabac_bits==NULL) cabac_bits=fopen(__CABAC_FILE__,"w+t");
        if(cabac_bits)
#ifdef CABAC_DECORER_COMP
            fprintf(cabac_bits,"bp %d %d %d %d\n",
            m_lcodIRange>>CABAC_MAGIC_BITS,
            m_lcodIOffset>>CABAC_MAGIC_BITS,
            -mask,sym_cnt);
#else
        fprintf(cabac_bits,"bp %d %d\n",-mask,sym_cnt);
#endif
#endif
    }

    return binIdx;

} //Ipp32s H264Bitstream::DecodeSingleSignedLevel_CABAC(Ipp32s ctxIdxOffset)

Status H264Bitstream::GetVUIParam(H264SeqParamSet *sps)
{
    Status ps=UMC_OK;
    sps->aspect_ratio_info_present_flag = (Ipp8u) Get1Bit();
    if( sps->aspect_ratio_info_present_flag ) {
        sps->aspect_ratio_idc = (Ipp8u) GetBits(8);
        if( sps->aspect_ratio_idc  ==  255) {
            sps->sar_width = (Ipp16u) GetBits(16);
            sps->sar_height = (Ipp16u) GetBits(16);
        }
    }
    sps->overscan_info_present_flag = (Ipp8u) Get1Bit();
    if( sps->overscan_info_present_flag )
        sps->overscan_appropriate_flag = (Ipp8u) Get1Bit();
    sps->video_signal_type_present_flag = (Ipp8u) Get1Bit();
    if( sps->video_signal_type_present_flag ) {
        sps->video_format = (Ipp8u) GetBits(3);
        sps->video_full_range_flag = (Ipp8u) Get1Bit();
        sps->colour_description_present_flag = (Ipp8u) Get1Bit();
        if( sps->colour_description_present_flag ) {
            sps->colour_primaries = (Ipp8u) GetBits(8);
            sps->transfer_characteristics = (Ipp8u) GetBits(8);
            sps->matrix_coefficients = (Ipp8u) GetBits(8);
        }
    }
    sps->chroma_loc_info_present_flag = (Ipp8u) Get1Bit();
    if( sps->chroma_loc_info_present_flag ) {
        sps->chroma_sample_loc_type_top_field = (Ipp8u) GetVLCElement(false);
        sps->chroma_sample_loc_type_bottom_field = (Ipp8u) GetVLCElement(false);
    }
    sps->timing_info_present_flag = (Ipp8u) Get1Bit();
    if( sps->timing_info_present_flag ) {
        sps->num_units_in_tick = GetBits(32);
        sps->time_scale = GetBits(32);
        sps->fixed_frame_rate_flag = (Ipp8u) Get1Bit();
    }
    sps->nal_hrd_parameters_present_flag = (Ipp8u) Get1Bit();
    if( sps->nal_hrd_parameters_present_flag )
        ps=GetHRDParam(sps);
    sps->vcl_hrd_parameters_present_flag = (Ipp8u) Get1Bit();
    if( sps->vcl_hrd_parameters_present_flag )
        ps=GetHRDParam(sps);
    if( sps->nal_hrd_parameters_present_flag  ||  sps->vcl_hrd_parameters_present_flag )
        sps->low_delay_hrd_flag = (Ipp8u) Get1Bit();
    sps->pic_struct_present_flag  = (Ipp8u) Get1Bit();
    sps->bitstream_restriction_flag = (Ipp8u) Get1Bit();
    if( sps->bitstream_restriction_flag ) {
        sps->motion_vectors_over_pic_boundaries_flag = (Ipp8u) Get1Bit();
        sps->max_bytes_per_pic_denom = (Ipp8u) GetVLCElement(false);
        sps->max_bits_per_mb_denom = (Ipp8u) GetVLCElement(false);
        sps->log2_max_mv_length_horizontal = (Ipp8u) GetVLCElement(false);
        sps->log2_max_mv_length_vertical = (Ipp8u) GetVLCElement(false);
        sps->num_reorder_frames = (Ipp8u) GetVLCElement(false);
        sps->max_dec_frame_buffering = (Ipp8u) GetVLCElement(false);
    }
    return ps;
}
Status H264Bitstream::GetHRDParam(H264SeqParamSet *sps)
{
    Status ps=UMC_OK;
    sps->cpb_cnt = (Ipp8u)(GetVLCElement(false)+1);
    sps->bit_rate_scale = (Ipp8u) GetBits(4);
    sps->cpb_size_scale = (Ipp8u) GetBits(4);
    for( Ipp32s idx= 0; idx < sps->cpb_cnt; idx++ ) {
        sps->bit_rate_value[ idx ] = (Ipp32u)GetVLCElement(false) + 1;
        sps->cpb_size_value[ idx ] = (Ipp32u)GetVLCElement(false) + 1;
        sps->cbr_flag[ idx ] = (Ipp8u) Get1Bit();
    }
    sps->initial_cpb_removal_delay_length = (Ipp8u)(GetBits(5)+1);
    sps->cpb_removal_delay_length = (Ipp8u)(GetBits(5)+1);
    sps->dpb_output_delay_length = (Ipp8u) (GetBits(5)+1);
    sps->time_offset_length = (Ipp8u) GetBits(5);
    return ps;

}

void H264Bitstream::SetDecodedBytes(size_t nBytes)
{
    m_pbs = m_pbsBase + (nBytes / 4);
    m_bitOffset = 31 - ((Ipp32s) ((nBytes % sizeof(Ipp32u)) * 8));
} // void H264Bitstream::SetDecodedBytes(size_t nBytes)

void SetDefaultScalingLists(H264SeqParamSet * sps)
{
    Ipp32s i;

    for (i = 0; i < 6; i += 1)
    {
        FillFlatScalingList4x4(&sps->ScalingLists4x4[i]);
    }
    for (i = 0; i < 2; i += 1)
    {
        FillFlatScalingList8x8(&sps->ScalingLists8x8[i]);
    }
}

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
