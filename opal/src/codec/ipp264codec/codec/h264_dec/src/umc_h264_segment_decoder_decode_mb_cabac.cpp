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

#include "umc_h264_segment_decoder.h"
#include "umc_h264_dec.h"
#include "umc_h264_bitstream_templates.h"
#include "umc_h264_bitstream_inlines.h"
#include "umc_h264_dec_internal_cabac.h"
#include "vm_debug.h"

namespace UMC
{

const
Ipp8u pCodFBD[5][4] =
{
//fwd
{CodInBS, CodNone, CodInBS, CodNone},
//bwd
{CodNone, CodInBS, CodNone, CodInBS},
//nothing
{CodNone, CodInBS, CodNone, CodInBS},
//nothing
{CodNone, CodInBS, CodNone, CodInBS},
//both
{CodInBS, CodInBS, CodInBS, CodInBS},
};

const
Ipp8u pCodTemplate[16] =
{
    CodNone, CodLeft, CodLeft, CodLeft,    CodAbov, CodLeft, CodLeft, CodLeft,
    CodAbov, CodLeft, CodLeft, CodLeft,    CodAbov, CodLeft, CodLeft, CodLeft
};

const
Ipp32u sb_x[4][16] =
{
    {
        0, 1, 0, 1,
        0, 1, 0, 1,
        0, 1, 0, 1,
        0, 1, 0, 1,
    },
    {
        0, 1, 0, 1,
        0, 1, 0, 1,
        0, 1, 0, 1,
        0, 1, 0, 1,
    },
    {
        0, 1, 0, 1,
        0, 1, 0, 1,
        0, 1, 0, 1,
        0, 1, 0, 1,
    },
    {
        0, 1, 0, 1,
        2, 3, 2, 3,
        0, 1, 0, 1,
        2, 3, 2, 3
    }
};

const
Ipp32u sb_y[4][16] =
{
    {
        0, 0, 1, 1,
        0, 0, 1, 1,
        0, 0, 1, 1,
        0, 0, 1, 1,
    },
    {
        0, 0, 1, 1,
        0, 0, 1, 1,
        0, 0, 1, 1,
        0, 0, 1, 1,
    },
    {
        0, 0, 1, 1,
        2, 2, 3, 3,
        0, 0, 1, 1,
        2, 2, 3, 3
    },
    {
        0, 0, 1, 1,
        0, 0, 1, 1,
        2, 2, 3, 3,
        2, 2, 3, 3
    }
};

const
Ipp32s sign_mask[2] =
{
    0, -1
};

// ---------------------------------------------------------------------------
//  H264SegmentDecoder::GetRefIdx4x4_CABAC()
//    get ref_idx and update info for all 4x4 blocks
// ---------------------------------------------------------------------------

void H264SegmentDecoder::GetRefIdx4x4_CABAC(const Ipp32u nActive,
                                              const Ipp8u* pBlkIdx,
                                              const Ipp8u* pCodRIx,
                                              Ipp32u ListNum)
{
    Ipp32u i, j, k;

    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

    if (nActive > 1)
    {
        for (i = 0; i < 16; i ++)
        {
            j = pBlkIdx[i];
            k = (j >> 2) * 4+ (j & 3);

            switch (pCodRIx[j])
            {
            case CodNone:
                pRIx[k] = -1;
                break;

            case CodInBS:
                Ipp32s refIdx;
                refIdx = (Ipp32s) GetSE_RefIdx_CABAC(ListNum,k);
                if (refIdx >= (Ipp8s) nActive || refIdx < 0)
                {
                    throw h264_exception(UMC_ERR_INVALID_STREAM);
                }
                pRIx[k] = (Ipp8s) refIdx;
                break;

            case CodLeft:
                pRIx[k] = pRIx[k - 1];
                break;

            case CodAbov:
                pRIx[k] = pRIx[k - 4];
                break;

            case CodSkip:
                break;
            }
        }    // for i
    }
    else
    {
        for (i = 0; i < 16; i ++)
        {
            j = pBlkIdx[i];
            k = (j >> 2) * 4+ (j & 3);

            switch (pCodRIx[j])
            {
            case CodNone:
                pRIx[k] = -1;
                break;

            case CodInBS:
                pRIx[k] = 0;
                break;

            case CodLeft:
                pRIx[k] = pRIx[k - 1];
                break;

            case CodAbov:
                pRIx[k] = pRIx[k - 4];
                break;

            case CodSkip:
                break;
            }
        }    // for i
    }
} // void H264SegmentDecoder::GetRefIdx4x4_CABAC(const Ipp32u nActive,


// ---------------------------------------------------------------------------
//  H264SegmentDecoder::GetRefIdx4x4_CABAC()
//    get ref_idx and update info for all 4x4 blocks
// ---------------------------------------------------------------------------

void H264SegmentDecoder::GetRefIdx4x4_CABAC(const Ipp32u nActive,
                                              const Ipp8u pCodRIx,
                                              Ipp32u ListNum)
{
    Ipp32u k;

    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

#ifdef __ICL
    __assume_aligned(pRIx, 16);
#endif
    if(pCodRIx == CodNone)
    {
        for (k = 0; k < 16; k ++)
            pRIx[k] = -1;
    }
    else if (nActive > 1)
    {
        Ipp32s refIdx;
        refIdx = (Ipp32s) GetSE_RefIdx_CABAC(ListNum,0);
        if (refIdx >= (Ipp8s) nActive || refIdx < 0)
        {
            throw h264_exception(UMC_ERR_INVALID_STREAM);
        }
        memset(pRIx, refIdx, 16);
    }
    else
    {
        memset(pRIx, 0, 16);
    }

} // void H264SegmentDecoder::GetRefIdx4x4_CABAC(const Ipp32u nActive,

void H264SegmentDecoder::GetRefIdx4x4_16x8_CABAC(const Ipp32u nActive,
                                                   const Ipp8u* pCodRIx,
                                                   Ipp32u ListNum)
{
    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

#ifdef __ICL
    __assume_aligned(pRIx, 8);
#endif
    if(pCodRIx[0] == CodNone)
    {
        memset(pRIx, -1, 8);
    }
    else if (nActive > 1)
    {
        Ipp32s refIdx;
        refIdx = (Ipp32s) GetSE_RefIdx_CABAC(ListNum,0);
        if (refIdx >= (Ipp8s) nActive || refIdx < 0)
        {
            throw h264_exception(UMC_ERR_INVALID_STREAM);
        }
        memset(pRIx, refIdx, 8);
   }
    else
    {
        memset(pRIx, 0, 8);
    }

    if(pCodRIx[8] == CodNone)
    {
        memset(&pRIx[8], -1, 8);
    }
    else if (nActive > 1)
    {
        Ipp32s refIdx;
        refIdx = (Ipp32s) GetSE_RefIdx_CABAC(ListNum,8);
        if (refIdx >= (Ipp8s) nActive || refIdx < 0)
        {
            throw h264_exception(UMC_ERR_INVALID_STREAM);
        }
        memset(&pRIx[8], refIdx, 8);
   }
    else
    {
        memset(&pRIx[8], 0, 8);
    }
} // void H264SegmentDecoder::GetRefIdx4x4_CABAC(const Ipp32u nActive,

void H264SegmentDecoder::GetRefIdx4x4_8x16_CABAC(const Ipp32u nActive,
                                                   const Ipp8u* pCodRIx,
                                                   Ipp32u ListNum)
{
    Ipp8s *pRIx = m_cur_mb.RefIdxs[ListNum]->RefIdxs;

#ifdef __ICL
    __assume_aligned(pRIx, 16);
#endif
    if(pCodRIx[0] == CodNone)
    {
        pRIx[0] = pRIx[1] = -1;
    }
    else if (nActive > 1)
    {
        Ipp32s refIdx;
        refIdx = (Ipp32s) GetSE_RefIdx_CABAC(ListNum,0);
        if (refIdx >= (Ipp8s) nActive || refIdx < 0)
        {
            throw h264_exception(UMC_ERR_INVALID_STREAM);
        }
        pRIx[0] = pRIx[1] = (Ipp8s) refIdx;
   }
    else
    {
        pRIx[0] = pRIx[1] = 0;
    }

    if(pCodRIx[2] == CodNone)
    {
        pRIx[2] = pRIx[3] = -1;
    }
    else if (nActive > 1)
    {
        Ipp32s refIdx;
        refIdx = (Ipp32s) GetSE_RefIdx_CABAC(ListNum,2);
        if (refIdx >= (Ipp8s) nActive || refIdx < 0)
        {
            throw h264_exception(UMC_ERR_INVALID_STREAM);
        }
        pRIx[2] = pRIx[3] = (Ipp8s) refIdx;
   }
    else
    {
        pRIx[2] = pRIx[3] = 0;
    }
#ifdef __ICL
    memcpy(&pRIx[4], &pRIx[0], 4);
    memcpy(&pRIx[8], &pRIx[0], 4);
    memcpy(&pRIx[12],&pRIx[0], 4);
#else
    *(Ipp32s*)&pRIx[4] = *(Ipp32s*)&pRIx[0];
    *(Ipp32s*)&pRIx[8] = *(Ipp32s*)&pRIx[0];
    *(Ipp32s*)&pRIx[12]= *(Ipp32s*)&pRIx[0];
#endif
} // void H264SegmentDecoder::GetRefIdx4x4_CABAC(const Ipp32u nActive,

Ipp32s H264SegmentDecoder::GetSE_RefIdx_CABAC(Ipp32u ListNum,
                                              Ipp32u BlockNum)
{
    Ipp32u ctxIdxInc = 0;
    Ipp32s ref_idx = 0;
    bool isLeftAvail=true, isTopAvail=true;

    // new
    Ipp8s *LeftRefIdx = m_cur_mb.RefIdxs[ListNum]->RefIdxs + BlockNum - 1;
    Ipp8s *TopRefIdx = m_cur_mb.RefIdxs[ListNum]->RefIdxs + BlockNum - 4;

    Ipp32s iTopMB = m_CurMBAddr, iLeftMB = m_CurMBAddr;

    Ipp32s leftFlag = 0;
    Ipp32s topFlag = 0;

    if (BLOCK_IS_ON_LEFT_EDGE(BlockNum))
    {
        iLeftMB = m_cur_mb.CurrentBlockNeighbours.mbs_left[BlockNum / 4].mb_num;

        isLeftAvail = (0 <= iLeftMB);

        if (isLeftAvail)
        {
            Ipp32s iNum;

            iNum = m_cur_mb.CurrentBlockNeighbours.mbs_left[BlockNum / 4].block_num;

            LeftRefIdx = m_gmbinfo->RefIdxs[ListNum][iLeftMB].RefIdxs + iNum;

            Ipp32s block_8x8 = block_subblock_mapping[iNum] / 4;
            bool is_skip = (IS_INTRA_MBTYPE(m_gmbinfo->mbs[iLeftMB].mbtype)) ||
                !(m_mbinfo.mbs[iLeftMB].sbdir[block_8x8] < D_DIR_DIRECT) ||
                GetMBDirectSkipFlag(m_gmbinfo->mbs[iLeftMB]);

            leftFlag = is_skip ? 0 : 1;
        }
    } else {
        Ipp32s block_8x8 = block_subblock_mapping[BlockNum - 1] / 4;
        bool is_skip = !(m_cur_mb.LocalMacroblockInfo->sbdir[block_8x8] < D_DIR_DIRECT);
        leftFlag = is_skip ? 0 : 1;
    }

    if (BLOCK_IS_ON_TOP_EDGE(BlockNum))
    {
        iTopMB = m_cur_mb.CurrentBlockNeighbours.mb_above.mb_num;

        isTopAvail = (0 <= iTopMB);

        if (isTopAvail)
        {
            Ipp32s iNum;

            iNum = m_cur_mb.CurrentBlockNeighbours.mb_above.block_num;

            TopRefIdx = m_gmbinfo->RefIdxs[ListNum][iTopMB].RefIdxs + iNum + BlockNum;

            Ipp32s block_8x8 = block_subblock_mapping[iNum + BlockNum] / 4;
            bool is_skip = IS_INTRA_MBTYPE(m_gmbinfo->mbs[iTopMB].mbtype) ||
                !(m_mbinfo.mbs[iTopMB].sbdir[block_8x8] < D_DIR_DIRECT) ||
                GetMBDirectSkipFlag(m_gmbinfo->mbs[iTopMB]);

            topFlag = is_skip ? 0 : 1;
        }
    } else {
        Ipp32s block_8x8 = block_subblock_mapping[BlockNum - 4] / 4;
        bool is_skip = !(m_cur_mb.LocalMacroblockInfo->sbdir[block_8x8] < D_DIR_DIRECT);
        topFlag = is_skip ? 0 : 1;
    }

    Ipp8u lval = (Ipp8u) (pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo) <
                          GetMBFieldDecodingFlag(m_gmbinfo->mbs[iLeftMB]));
    Ipp8u tval = (Ipp8u) (pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo) <
                          GetMBFieldDecodingFlag(m_gmbinfo->mbs[iTopMB]));

    if (isLeftAvail && (*LeftRefIdx > lval) && leftFlag)
        ctxIdxInc ++;

    if (isTopAvail && (*TopRefIdx > tval) && topFlag)
        ctxIdxInc += 2;

    if (m_pBitStream->DecodeSingleBin_CABAC(ctxIdxOffset[REF_IDX_L0] + ctxIdxInc)) // binIdx 0
    {
        ref_idx ++;

        if (m_pBitStream->DecodeSingleBin_CABAC(ctxIdxOffset[REF_IDX_L0] + 4)) // binIdx 1
        {
            ref_idx ++;

            while (m_pBitStream->DecodeSingleBin_CABAC(ctxIdxOffset[REF_IDX_L0] + 5)) // binIdx 2+
                ref_idx ++;
        }
    }

    return ref_idx;

} // Ipp32s H264SegmentDecoder::GetSE_RefIdx_CABAC(Ipp32u ListNum, Ipp32u BlockNum)

H264DecoderMotionVector H264SegmentDecoder::GetSE_MVD_CABAC(Ipp32u ListNum, Ipp32u BlockNum)
{
    Ipp32u ctxIdxIncx = 0;
    Ipp32u ctxIdxIncy = 0;
    Ipp32s mvdx = 0,mvdy = 0;
    Ipp32u lcode,k;
    Ipp32u mv_y;
    Ipp32s code;
    Ipp32s iBlock;
    H264DecoderMotionVector *LeftMVd = 0;
    H264DecoderMotionVector *TopMVd = 0;
    Ipp32s iTopMB = m_CurMBAddr, iLeftMB = m_CurMBAddr;
    bool isLeftAvail=true,isTopAvail=true;

    if (BLOCK_IS_ON_LEFT_EDGE(BlockNum))
    {
        iLeftMB = m_cur_mb.CurrentBlockNeighbours.mbs_left[BlockNum / 4].mb_num;
        iBlock = m_cur_mb.CurrentBlockNeighbours.mbs_left[BlockNum / 4].block_num;

        isLeftAvail = (0 <= iLeftMB);
        if (isLeftAvail)
        {
            LeftMVd = m_mbinfo.MVDeltas[ListNum][iLeftMB].MotionVectors + iBlock;
        }
    }
    else
    {
        LeftMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors + BlockNum - 1;
    }

    if (BLOCK_IS_ON_TOP_EDGE(BlockNum))
    {
        iTopMB = m_cur_mb.CurrentBlockNeighbours.mb_above.mb_num;
        iBlock = m_cur_mb.CurrentBlockNeighbours.mb_above.block_num + BlockNum;

        isTopAvail = (0 <= iTopMB);
        if (isTopAvail)
        {
            TopMVd = m_mbinfo.MVDeltas[ListNum][iTopMB].MotionVectors + iBlock;
        }
    }
    else
    {
        TopMVd = m_cur_mb.MVs[ListNum + 2]->MotionVectors + BlockNum - 4;
    }

    if (isLeftAvail)
    {
        Ipp32s sign = sign_mask[LeftMVd->mvx<0];
        ctxIdxIncx += ((((Ipp32s)LeftMVd->mvx) ^ sign) - sign);

        sign = sign_mask[LeftMVd->mvy<0];
        mv_y = ((((Ipp32s)LeftMVd->mvy) ^ sign) - sign);

        if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[iLeftMB]) >
            pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo))
            mv_y <<= 1;
        else if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[iLeftMB]) <
                 pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo))
            mv_y >>= 1;

        ctxIdxIncy += mv_y;
    }
    if (isTopAvail)
    {
        Ipp32s sign = sign_mask[TopMVd->mvx<0];
        ctxIdxIncx += ((((Ipp32s)TopMVd->mvx) ^ sign) - sign);

        sign = sign_mask[TopMVd->mvy<0];
        mv_y = ((((Ipp32s)TopMVd->mvy) ^ sign) - sign);

        if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[iTopMB]) >
            pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo))
            mv_y <<= 1;
        else if (GetMBFieldDecodingFlag(m_gmbinfo->mbs[iTopMB]) <
                 pGetMBFieldDecodingFlag(m_cur_mb.GlobalMacroblockInfo))
            mv_y >>= 1;

        ctxIdxIncy += mv_y;
    }

    ctxIdxIncx = ctxIdxIncx < 3? 0: ctxIdxIncx <= 32? 1: 2;
    ctxIdxIncy = ctxIdxIncy < 3? 0: ctxIdxIncy <= 32? 1: 2;

    if(m_pBitStream->DecodeSingleBin_CABAC(
                    ctxIdxOffset[MVD_L0_0] + ctxIdxIncx))
    {
        code = m_pBitStream->DecodeSingleBin_CABAC(
                        ctxIdxOffset[MVD_L0_0] + 3);

        if (code)
        {
            code = 0;
            ctxIdxIncx = 4;
            do
            {
                lcode = m_pBitStream->DecodeSingleBin_CABAC(
                                    ctxIdxOffset[MVD_L0_0] + ctxIdxIncx);
                if (6 > ctxIdxIncx) ctxIdxIncx ++;
                code++;
            }
            while(code < 7 && lcode);

            if (lcode)
            {
                k = 1 << 3;
                while(m_pBitStream->DecodeBypass_CABAC())
                {
                    code += k;
                    k <<= 1;
                }
                Ipp32u symb = 0;
                while(k >>=1)
                {
                    if (m_pBitStream->DecodeBypass_CABAC())
                      symb |= k;
                }
                code += symb + 1;
            }

        }
        code++;

        mvdx = m_pBitStream->DecodeBypassSign_CABAC(code);
    }

    if(m_pBitStream->DecodeSingleBin_CABAC(
                ctxIdxOffset[MVD_L0_1] + ctxIdxIncy))
    {
        code = m_pBitStream->DecodeSingleBin_CABAC(
                        ctxIdxOffset[MVD_L0_1] + 3);

        if (code)
        {
            code = 0;
            ctxIdxIncy = 4;
            do
            {
                lcode = m_pBitStream->DecodeSingleBin_CABAC(
                                    ctxIdxOffset[MVD_L0_1] + ctxIdxIncy);
                if (6 > ctxIdxIncy) ctxIdxIncy ++;
                code++;
            }
            while(code < 7 && lcode);

            if (lcode)
            {
                k = 1 << 3;
                while(m_pBitStream->DecodeBypass_CABAC())
                {
                    code += k;
                    k <<= 1;
                }
                Ipp32u symb = 0;
                while(k >>=1)
                {
                    if (m_pBitStream->DecodeBypass_CABAC())
                      symb |= k;
                }
                code += symb + 1;
            }
        }
        code++;

        mvdy = m_pBitStream->DecodeBypassSign_CABAC(code);
    }

    H264DecoderMotionVector mvd;
    mvd.mvx = (Ipp16s) mvdx;
    mvd.mvy = (Ipp16s) mvdy;

    return mvd;

} // H264DecoderMotionVector H264SegmentDecoder::GetSE_MVD_CABAC(Ipp32s ListNum, Ipp32s BlockNum)

void H264SegmentDecoder::DecodeMBQPDelta_CABAC(void)
{
    Ipp32u code;

    // decode QP delta
    {
        Ipp32u ctxIdxInc;

        // check for usual case of zero QP delta
        ctxIdxInc = (m_prev_dquant) ? (1) : (0);
        code = m_pBitStream->DecodeSingleBin_CABAC(ctxIdxOffset[MB_QP_DELTA] +
                                                ctxIdxInc);
        if (code)
        {
            code = m_pBitStream->DecodeSingleBin_CABAC(ctxIdxOffset[MB_QP_DELTA] +
                                                    2);
            if (code)
            {
                while (m_pBitStream->DecodeSingleBin_CABAC(ctxIdxOffset[MB_QP_DELTA] + 3))
                {
                    code += 1;
                }
            }

            code += 1;
        }
    }

    // calculate new QP
    {
        Ipp32s qpdelta;
        Ipp32s bitdepth_luma_qp_scale;

        qpdelta = (Ipp32s) ((code + 1) / 2);
        // least significant bit is Ipp32s bit
        if (0 == (code & 0x01))
            qpdelta = -qpdelta;

        m_cur_mb.LocalMacroblockInfo->QP = (Ipp8s) (m_cur_mb.LocalMacroblockInfo->QP + qpdelta);

        bitdepth_luma_qp_scale = 6 * (bit_depth_luma - 8);
        m_cur_mb.LocalMacroblockInfo->QP  = (Ipp8s) (((m_cur_mb.LocalMacroblockInfo->QP +
                                                       52 +
                                                       2 * bitdepth_luma_qp_scale) %
                                                      (bitdepth_luma_qp_scale + 52)) -
                                                     bitdepth_luma_qp_scale);
        m_prev_dquant = qpdelta;
    }

} // void H264SegmentDecoder::DecodeMBQPDelta_CABAC(void)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
