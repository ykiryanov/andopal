/*
//
//              INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license  agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in  accordance  with the terms of that agreement.
//    Copyright (c) 2003-2010 Intel Corporation. All Rights Reserved.
//
//
*/
#include "umc_defs.h"
#if defined (UMC_ENABLE_H264_VIDEO_DECODER)

#include "umc_h264_segment_decoder.h"
#include "umc_h264_dec_deblocking.h"

namespace UMC
{

void H264SegmentDecoder::PrepareDeblockingParametersISlice(DeblockingParameters *pParams)
{
    // set deblocking flag(s)
    pParams->DeblockingFlag[VERTICAL_DEBLOCKING] = 1;
    pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] = 1;

    // calculate strengths
    if (pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING])
    {
        // deblocking with strong deblocking of external edge
        SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 0, 4);
    }

    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 4, 3);
    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 8, 3);
    SetEdgeStrength(pParams->Strength[VERTICAL_DEBLOCKING] + 12, 3);

    if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
    {
        if (pParams->MBFieldCoded)
        {
            // deblocking field macroblock with external edge
            SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 3);
        }
        else
        {
            // deblocking with strong deblocking of external edge
            SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 0, 4);
        }
    }

    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 4, 3);
    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 8, 3);
    SetEdgeStrength(pParams->Strength[HORIZONTAL_DEBLOCKING] + 12, 3);

} // void H264SegmentDecoder::PrepareDeblockingParametersISlice(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32s mbtype = (m_gmbinfo->mbs + MBAddr)->mbtype;

    // when this macroblock is intra coded
    if (IS_INTRA_MBTYPE(mbtype))
    {
        PrepareDeblockingParametersISlice(pParams);
        return;
    }

    // try simplest function to prepare deblocking parameters
    switch (mbtype)
    {
        // when macroblock has type inter 16 on 16
    case MBTYPE_INTER:
    case MBTYPE_FORWARD:
    case MBTYPE_BACKWARD:
    case MBTYPE_BIDIR:
        PrepareDeblockingParametersPSlice16x16Vert(pParams);
        PrepareDeblockingParametersPSlice16x16Horz(pParams);
        break;

    default:
        PrepareDeblockingParametersPSlice4(VERTICAL_DEBLOCKING, pParams);
        PrepareDeblockingParametersPSlice4(HORIZONTAL_DEBLOCKING, pParams);
        break;
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32s mbtype = (m_gmbinfo->mbs + MBAddr)->mbtype;

    // when this macroblock is intra coded
    if (IS_INTRA_MBTYPE(mbtype))
    {
        PrepareDeblockingParametersISlice(pParams);
        return;
    }

    // try simplest function to prepare deblocking parameters
    switch (mbtype)
    {
        // when macroblock has type inter 16 on 16
    case MBTYPE_INTER:
    case MBTYPE_FORWARD:
    case MBTYPE_BACKWARD:
    case MBTYPE_BIDIR:
        PrepareDeblockingParametersBSlice16x16Vert(pParams);
        PrepareDeblockingParametersBSlice16x16Horz(pParams);
        break;

        // when macroblock has type inter 16 on 8
    case MBTYPE_INTER_16x8:
        PrepareDeblockingParametersBSlice8x16(VERTICAL_DEBLOCKING, pParams);
        PrepareDeblockingParametersBSlice16x8(HORIZONTAL_DEBLOCKING, pParams);
        return;

        // when macroblock has type inter 8 on 16
    case MBTYPE_INTER_8x16:
        PrepareDeblockingParametersBSlice16x8(VERTICAL_DEBLOCKING, pParams);
        PrepareDeblockingParametersBSlice8x16(HORIZONTAL_DEBLOCKING, pParams);
        return;

    default:
        PrepareDeblockingParametersBSlice4(VERTICAL_DEBLOCKING, pParams);
        PrepareDeblockingParametersBSlice4(HORIZONTAL_DEBLOCKING, pParams);
        break;
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice(DeblockingParameters *pParams)

enum
{
    VERTICAL_OUTER_EDGE_MASK    = 0x00a0a,

    VERTICAL_OUTER_EDGE_BLOCK_0 = 0x00002,
    VERTICAL_OUTER_EDGE_BLOCK_1 = 0x00008,
    VERTICAL_OUTER_EDGE_BLOCK_2 = 0x00200,
    VERTICAL_OUTER_EDGE_BLOCK_3 = 0x00800,

    HORIZONTAL_OUTER_EDGE_MASK  = 0x00066,

    HORIZONTAL_OUTER_EDGE_BLOCK_0 = 0x00002,
    HORIZONTAL_OUTER_EDGE_BLOCK_1 = 0x00004,
    HORIZONTAL_OUTER_EDGE_BLOCK_2 = 0x00020,
    HORIZONTAL_OUTER_EDGE_BLOCK_3 = 0x00040
};

static
Ipp8u InternalBlockDeblockingTable[2][16][4] =
{
    // strength arrays for vertical deblocking
    {
        {0, 0, 0, 0},
        {2, 0, 0, 0},
        {0, 0, 2, 0},
        {2, 0, 2, 0},
        {0, 2, 0, 0},
        {2, 2, 0, 0},
        {0, 2, 2, 0},
        {2, 2, 2, 0},
        {0, 0, 0, 2},
        {2, 0, 0, 2},
        {0, 0, 2, 2},
        {2, 0, 2, 2},
        {0, 2, 0, 2},
        {2, 2, 0, 2},
        {0, 2, 2, 2},
        {2, 2, 2, 2}
    },

    // strength arrays for horizontal deblocking
    {
        {0, 0, 0, 0},
        {2, 0, 0, 0},
        {0, 2, 0, 0},
        {2, 2, 0, 0},
        {0, 0, 2, 0},
        {2, 0, 2, 0},
        {0, 2, 2, 0},
        {2, 2, 2, 0},
        {0, 0, 0, 2},
        {2, 0, 0, 2},
        {0, 2, 0, 2},
        {2, 2, 0, 2},
        {0, 0, 2, 2},
        {2, 0, 2, 2},
        {0, 2, 2, 2},
        {2, 2, 2, 2}
    }
};

void H264SegmentDecoder::PrepareDeblockingParametersIntern16x16Vert(DeblockingParameters *pParams)
{
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + pParams->nMBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[VERTICAL_DEBLOCKING];

    //
    // internal edge(s)
    //
    if (cbp4x4_luma & 0x1fffe)
    {
        Ipp32s a, b, res;

        // set deblocking flag
        pParams->DeblockingFlag[VERTICAL_DEBLOCKING] |= 1;

        // deblocking strength depends on CBP only
        // we use fast CBP comparison
        a = cbp4x4_luma >> 1;
        b = cbp4x4_luma >> 2;
        res = (a | b) & 0x505;
        res = (res & 0x05) | (res >> 7);
        CopyEdgeStrength(pStrength + 4, InternalBlockDeblockingTable[VERTICAL_DEBLOCKING][res]);

        a = cbp4x4_luma >> 5;
        res = (a | b) & 0x505;
        res = (res & 0x05) | (res >> 7);
        CopyEdgeStrength(pStrength + 8, InternalBlockDeblockingTable[VERTICAL_DEBLOCKING][res]);

        b = cbp4x4_luma >> 6;
        res = (a | b) & 0x505;
        res = (res & 0x05) | (res >> 7);
        CopyEdgeStrength(pStrength + 12, InternalBlockDeblockingTable[VERTICAL_DEBLOCKING][res]);
    }
    else
    {
        // reset all strengths
        SetEdgeStrength(pStrength + 4, 0);
        SetEdgeStrength(pStrength + 8, 0);
        SetEdgeStrength(pStrength + 12, 0);
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersIntern16x16Vert(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersIntern16x16Horz(DeblockingParameters *pParams)
{
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + pParams->nMBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[HORIZONTAL_DEBLOCKING];

    //
    // internal edge(s)
    //
    if (cbp4x4_luma & 0x1fffe)
    {
        Ipp32s a, b, res;

        // set deblocking flag
        pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] |= 1;

        // deblocking strength depends on CBP only
        // we use fast CBP comparison
        a = cbp4x4_luma >> 1;
        b = cbp4x4_luma >> 3;
        res = (a | b) & 0x33;
        res = (res & 0x03) | (res >> 2);
        CopyEdgeStrength(pStrength + 4, InternalBlockDeblockingTable[HORIZONTAL_DEBLOCKING][res]);

        a = cbp4x4_luma >> 9;
        res = (a | b) & 0x33;
        res = (res & 0x03) | (res >> 2);
        CopyEdgeStrength(pStrength + 8, InternalBlockDeblockingTable[HORIZONTAL_DEBLOCKING][res]);

        b = cbp4x4_luma >> 11;
        res = (a | b) & 0x33;
        res = (res & 0x03) | (res >> 2);
        CopyEdgeStrength(pStrength + 12, InternalBlockDeblockingTable[HORIZONTAL_DEBLOCKING][res]);
    }
    else
    {
        // reset all strengths
        SetEdgeStrength(pStrength + 4, 0);
        SetEdgeStrength(pStrength + 8, 0);
        SetEdgeStrength(pStrength + 12, 0);
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersIntern16x16Horz(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice4(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);

    //
    // external edge
    //

    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nBlock, nNeighbourBlock;
                    Ipp32s iRefQ, iRefP;
                    Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                    {
                        nBlock = idx * 4;
                        nNeighbourBlock = idx * 4 + 3;
                    }
                    else
                    {
                        nBlock = idx;
                        nNeighbourBlock = idx + 12;
                    }

                    // field coded image
                    if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;
                        ReferenceFlags *pFields;

                        // select reference index for current block
                        index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;
                            iRefQ = pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                        }
                        else
                            iRefQ = -1;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_Flags;
                            iRefP = pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                        }
                        else
                            iRefP = -1;
                    }
                    // frame coded image
                    else
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for current block
                        index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                            iRefQ = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefQ = -1;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefP = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefP = -1;
                    }

                    VM_ASSERT((iRefP != -1) || (iRefQ != -1));

                    // when reference indexes are equal
                    if (iRefQ == iRefP)
                    {
                        H264DecoderMotionVector *pVectorQ, *pVectorP;

                        pVectorQ = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                        pVectorP = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;

                        // compare motion vectors
                        if ((4 <= abs(pVectorQ->mvx - pVectorP->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQ->mvy - pVectorP->mvy)))
                        {
                            pStrength[idx] = 1;
                            *pDeblockingFlag = 1;
                        }
                        else
                            pStrength[idx] = 0;
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if ((HORIZONTAL_DEBLOCKING == dir) &&
                (pParams->MBFieldCoded))
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // cicle of edge(s)
        // we do all edges in one cicle
        for (idx = 4;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
            {
                pStrength[idx] = 2;
                *pDeblockingFlag = 1;
            }
            // compare motion vectors & reference indexes
            else
            {
                Ipp32s nBlock, nNeighbourBlock;
                Ipp32s iRefQ, iRefP;
                Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                // calc block and neighbour block number
                if (VERTICAL_DEBLOCKING == dir)
                {
                    nBlock = (idx & 3) * 4 + (idx >> 2);
                    nNeighbourBlock = nBlock - 1;
                }
                else
                {
                    nBlock = idx;
                    nNeighbourBlock = idx - 4;
                }

                VM_ASSERT(-1 == m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock]);
                VM_ASSERT(-1 == m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nNeighbourBlock]);

                // field coded image
                if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;
                    ReferenceFlags *pFields;

                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;

                    // select reference fields number array
                    pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;

                    // select reference field for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                    iRefQ = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));

                    // select reference field for previous block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefP = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                }
                // frame coded image
                else
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;

                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;

                    // select reference index for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                    iRefQ = (index < 0) ?
                            (-1) :
                            (pRefPicList[index]->DeblockPicID(0));

                    // select reference index for previous block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefP = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(0);
                }

                VM_ASSERT((iRefP != -1) || (iRefQ != -1));

                // when reference indexes are equal
                if (iRefQ == iRefP)
                {
                    H264DecoderMotionVector *pVectorQ, *pVectorP;

                    pVectorQ = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                    pVectorP = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;

                    // compare motion vectors
                    if ((4 <= abs(pVectorQ->mvx - pVectorP->mvx)) ||
                        (nVectorDiffLimit <= abs(pVectorQ->mvy - pVectorP->mvy)))
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                    else
                        pStrength[idx] = 0;
                }
                // when reference indexes are different
                else
                {
                    pStrength[idx] = 1;
                    *pDeblockingFlag = 1;
                }
            }
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice4(Ipp32u dir, DeblockingParameters *pParams)

#define SET_DEBLOCKING_STRENGTH_P_SLICE_VERTICAL(block_num0, block_num1) \
{ \
    Ipp32s refPrev = GetReferencePSlice(nNeighbour, block_num0 * 4 + 3); \
    if (refCur == refPrev) \
    { \
        if (0 == (VERTICAL_OUTER_EDGE_BLOCK_##block_num0 & uMask)) \
        { \
            if (IsVectorDifferenceBig(mvCur, pMVPrev[block_num0 * 4 + 3], pParams->nMaxMVector)) \
            { \
                pStrength[block_num0] = 1; \
                iDeblockingFlag = 1; \
            } \
            else \
                pStrength[block_num0] = 0; \
        } \
        else \
        { \
            pStrength[block_num0] = 2; \
            iDeblockingFlag = 1; \
        } \
        if (0 == (VERTICAL_OUTER_EDGE_BLOCK_##block_num1 & uMask)) \
        { \
            if (IsVectorDifferenceBig(mvCur, pMVPrev[block_num1 * 4 + 3], pParams->nMaxMVector)) \
            { \
                pStrength[block_num1] = 1; \
                iDeblockingFlag = 1; \
            } \
            else \
                pStrength[block_num1] = 0; \
        } \
        else \
        { \
            pStrength[block_num1] = 2; \
            iDeblockingFlag = 1; \
        } \
    } \
    else \
    { \
        pStrength[block_num0] = (Ipp8u) (1 + ((VERTICAL_OUTER_EDGE_BLOCK_##block_num0 & uMask) ? (1) : (0))); \
        pStrength[block_num1] = (Ipp8u) (1 + ((VERTICAL_OUTER_EDGE_BLOCK_##block_num1 & uMask) ? (1) : (0))); \
        iDeblockingFlag = 1; \
    } \
}

#define SET_DEBLOCKING_STRENGTH_P_SLICE_HORIZONTAL(block_num0, block_num1) \
{ \
    Ipp32s refPrev = GetReferencePSlice(nNeighbour, block_num0 + 12); \
    if (refCur == refPrev) \
    { \
        if (0 == (HORIZONTAL_OUTER_EDGE_BLOCK_##block_num0 & uMask)) \
        { \
            if (IsVectorDifferenceBig(mvCur, pMVPrev[block_num0 + 12], pParams->nMaxMVector)) \
            { \
                pStrength[block_num0] = 1; \
                iDeblockingFlag = 1; \
            } \
            else \
                pStrength[block_num0] = 0; \
        } \
        else \
        { \
            pStrength[block_num0] = 2; \
            iDeblockingFlag = 1; \
        } \
        if (0 == (HORIZONTAL_OUTER_EDGE_BLOCK_##block_num1 & uMask)) \
        { \
            if (IsVectorDifferenceBig(mvCur, pMVPrev[block_num1 + 12], pParams->nMaxMVector)) \
            { \
                pStrength[block_num1] = 1; \
                iDeblockingFlag = 1; \
            } \
            else \
                pStrength[block_num1] = 0; \
        } \
        else \
        { \
            pStrength[block_num1] = 2; \
            iDeblockingFlag = 1; \
        } \
    } \
    else \
    { \
        pStrength[block_num0] = (Ipp8u) (1 + ((HORIZONTAL_OUTER_EDGE_BLOCK_##block_num0 & uMask) ? (1) : (0))); \
        pStrength[block_num1] = (Ipp8u) (1 + ((HORIZONTAL_OUTER_EDGE_BLOCK_##block_num1 & uMask) ? (1) : (0))); \
        iDeblockingFlag = 1; \
    } \
}

#define IsVectorDifferenceBig(one, two, iMaxDiff) \
    /* the original code is \
    ((4 <= abs(one.mvx - two.mvx)) || \
     (iMaxDiff <= abs(one.mvy - two.mvy))); \
    but the current code is equal and uses less comparisons */ \
    ((7 <= (Ipp32u)(one.mvx - two.mvx + 3)) || \
     ((Ipp32u)(iMaxDiff * 2 - 1) <= (Ipp32u)(one.mvy - two.mvy + iMaxDiff - 1)))

inline
Ipp32s H264SegmentDecoder::GetReferencePSlice(Ipp32s iMBNum, Ipp32s iBlockNum)
{
    Ipp32s index, ref;

    // select reference index for current block
    index = m_gmbinfo->RefIdxs[0][iMBNum].RefIdxs[iBlockNum];
    if (0 <= index)
    {
        H264DecoderFrame **pRefPicList;
        H264DecoderMacroblockGlobalInfo *pMBInfo;
        Ipp32s iNum = 0;

        // obtain reference list
        pMBInfo = m_gmbinfo->mbs + iMBNum;
        pRefPicList = m_pCurrentFrame->GetRefPicList(pMBInfo->slice_id, 0)->m_RefPicList;
        if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
        {
            ReferenceFlags *pFields;

            pFields = m_pCurrentFrame->GetRefPicList(pMBInfo->slice_id, 0)->m_Flags;
            iNum = GetReferenceField(pFields, index);
        }
        ref = pRefPicList[index]->DeblockPicID(iNum);
    }
    else
        ref = -1;

    return ref;

} // Ipp32s H264SegmentDecoder::GetReferencePSlice(Ipp32s iMBNum, Ipp32s iBlockNum)

inline
Ipp32s H264SegmentDecoder::GetReferencesBSlice(Ipp32s iMBNum, Ipp32s iBlockNum, Ipp32s *pReferences)
{
    Ipp32s index, ref, num = 0;

    // select forward reference index
    index = m_gmbinfo->RefIdxs[0][iMBNum].RefIdxs[iBlockNum];
    if (0 <= index)
    {
        H264DecoderFrame **pRefPicList;
        H264DecoderMacroblockGlobalInfo *pMBInfo;
        Ipp32s iNum = 0;

        // obtain reference list
        pMBInfo = m_gmbinfo->mbs + iMBNum;
        pRefPicList = m_pCurrentFrame->GetRefPicList(pMBInfo->slice_id, 0)->m_RefPicList;
        if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
        {
            ReferenceFlags *pFields;

            pFields = m_pCurrentFrame->GetRefPicList(pMBInfo->slice_id, 0)->m_Flags;
            iNum = GetReferenceField(pFields, index);
        }
        ref = pRefPicList[index]->DeblockPicID(iNum);

        // increment number of valid references
        num += 1;
    }
    else
        ref = -1;
    pReferences[0] = ref;

    // select backward reference index
    index = m_gmbinfo->RefIdxs[1][iMBNum].RefIdxs[iBlockNum];
    if (0 <= index)
    {
        H264DecoderFrame **pRefPicList;
        H264DecoderMacroblockGlobalInfo *pMBInfo;
        Ipp32s iNum = 0;

        // obtain reference list
        pMBInfo = m_gmbinfo->mbs + iMBNum;
        pRefPicList = m_pCurrentFrame->GetRefPicList(pMBInfo->slice_id, 1)->m_RefPicList;
        if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
        {
            ReferenceFlags *pFields;

            pFields = m_pCurrentFrame->GetRefPicList(pMBInfo->slice_id, 1)->m_Flags;
            iNum = GetReferenceField(pFields, index);
        }
        ref = pRefPicList[index]->DeblockPicID(iNum);

        // increment number of valid references
        num += 1;
    }
    else
        ref = -1;
    pReferences[1] = ref;

    return num;

} // Ipp32s H264SegmentDecoder::GetReferencesBSlice(Ipp32s iMBNum, Ipp32s iBlockNum, Ipp32s *pReferences)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice16x16Vert(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[VERTICAL_DEBLOCKING];
    Ipp32s iDeblockingFlag = 0;

    //
    // precalculating of reference numbers of current macroblock.
    // it is more likely we have to compare reference numbers.
    // we will use it also in horizontal deblocking
    //
    pParams->iReferences[0][0] = GetReferencePSlice(MBAddr, 0);

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[VERTICAL_DEBLOCKING];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32u uMask;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // create special mask
            uMask = cbp4x4_luma | (pNeighbour->cbp4x4_luma >> 5);

            // when at least one from a couple of blocks has coeffs
            if (VERTICAL_OUTER_EDGE_MASK != (uMask & VERTICAL_OUTER_EDGE_MASK))
            {
                Ipp32s refCur;
                H264DecoderMotionVector mvCur;
                H264DecoderMotionVector *pMVPrev;

                // obtain current block parameters
                refCur = pParams->iReferences[0][0];
                mvCur = m_gmbinfo->MV[0][MBAddr].MotionVectors[0];

                // obtain previous block parameters
                pMVPrev = m_gmbinfo->MV[0][nNeighbour].MotionVectors;

                SET_DEBLOCKING_STRENGTH_P_SLICE_VERTICAL(0, 1)

                SET_DEBLOCKING_STRENGTH_P_SLICE_VERTICAL(2, 3)
            }
            else
            {
                SetEdgeStrength(pStrength + 0, 2);
                iDeblockingFlag = 1;
            }
        }
        else
        {
            SetEdgeStrength(pStrength + 0, 4);
            iDeblockingFlag = 1;
        }
    }

    pParams->DeblockingFlag[VERTICAL_DEBLOCKING] = iDeblockingFlag;

    //
    // internal edge(s)
    //
    PrepareDeblockingParametersIntern16x16Vert(pParams);

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice16x16Vert(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersPSlice16x16Horz(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[HORIZONTAL_DEBLOCKING];
    Ipp32s iDeblockingFlag = 0;

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[HORIZONTAL_DEBLOCKING];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32u uMask;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // create special mask
            uMask = cbp4x4_luma | (pNeighbour->cbp4x4_luma >> 10);

            // when at least one from a couple of blocks has coeffs
            if (HORIZONTAL_OUTER_EDGE_MASK != (uMask & HORIZONTAL_OUTER_EDGE_MASK))
            {
                Ipp32s refCur;
                H264DecoderMotionVector mvCur;
                H264DecoderMotionVector *pMVPrev;

                // obtain current block parameters
                refCur = pParams->iReferences[0][0];
                mvCur = m_gmbinfo->MV[0][MBAddr].MotionVectors[0];

                // obtain neighbour block parameters
                pMVPrev = m_gmbinfo->MV[0][nNeighbour].MotionVectors;

                SET_DEBLOCKING_STRENGTH_P_SLICE_HORIZONTAL(0, 1)

                SET_DEBLOCKING_STRENGTH_P_SLICE_HORIZONTAL(2, 3)
            }
            // when at least one from a couple of blocks has coeffs
            else
            {
                SetEdgeStrength(pStrength + 0, 2);
                iDeblockingFlag = 1;
            }
        }
        else
        {
            if (pParams->MBFieldCoded)
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            iDeblockingFlag = 1;
        }
    }

    pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] = iDeblockingFlag;

    //
    // internal edge(s)
    //
    PrepareDeblockingParametersIntern16x16Horz(pParams);

} // void H264SegmentDecoder::PrepareDeblockingParametersPSlice16x16Horz(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice4(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nBlock, nNeighbourBlock;
                    Ipp32s iRefQFrw, iRefPFrw, iRefQBck, iRefPBck;
                    Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                    {
                        nBlock = idx * 4;
                        nNeighbourBlock = nBlock + 3;
                    }
                    else
                    {
                        nBlock = idx;
                        nNeighbourBlock = idx + 12;
                    }

                    // field coded image
                    if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;
                        ReferenceFlags *pFields;

                        // select reference index for current block
                        index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;
                            iRefQFrw = pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                        }
                        else
                            iRefQFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_Flags;
                            iRefQBck = pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                        }
                        else
                            iRefQBck = -1;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_Flags;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_Flags;
                            iRefPBck = pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                        }
                        else
                            iRefPBck = -1;
                    }
                    // frame coded image
                    else
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for current block
                        index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                            iRefQFrw = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefQFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                            iRefQBck = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefQBck = -1;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            iRefPBck = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPBck = -1;
                    }

                    // when reference indexes are equal
                    if (((iRefQFrw == iRefPFrw) && (iRefQBck == iRefPBck)) ||
                        ((iRefQFrw == iRefPBck) && (iRefQBck == iRefPFrw)))
                    {
                        // set initial value of strength
                        pStrength[idx] = 0;

                        // when forward and backward reference pictures of previous block are different
                        if (iRefPFrw != iRefPBck)
                        {
                            H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select current block motion vectors
                            pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                            pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                            // select previous block motion vectors
                            if (iRefQFrw == iRefPFrw)
                            {
                                pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                            }
                            else
                            {
                                pVectorPFrw = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            }

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                        // when forward and backward reference pictures of previous block are equal
                        else
                        {
                            H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select current block motion vectors
                            pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                            pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                            // select previous block motion vectors
                            pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                if ((4 <= abs(pVectorQFrw->mvx - pVectorPBck->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPBck->mvy)) ||
                                    (4 <= abs(pVectorQBck->mvx - pVectorPFrw->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPFrw->mvy)))
                                {
                                    pStrength[idx] = 1;
                                    *pDeblockingFlag = 1;
                                }
                            }
                        }
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if ((HORIZONTAL_DEBLOCKING == dir) &&
                (pParams->MBFieldCoded))
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // cicle of edge(s)
        // we do all edges in one cicle
        for (idx = 4;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
            {
                pStrength[idx] = 2;
                *pDeblockingFlag = 1;
            }
            // compare motion vectors & reference indexes
            else
            {
                Ipp32s nBlock, nNeighbourBlock;
                Ipp32s iRefQFrw, iRefQBck, iRefPFrw, iRefPBck;
                Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                // calc block and neighbour block number
                if (VERTICAL_DEBLOCKING == dir)
                {
                    nBlock = (idx & 3) * 4 + (idx >> 2);
                    nNeighbourBlock = nBlock - 1;
                }
                else
                {
                    nBlock = idx;
                    nNeighbourBlock = idx - 4;
                }

                // field coded image
                if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;
                    ReferenceFlags *pFields;

                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                    // select reference fields number array
                    pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;

                    // select forward reference index for blocks
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                    iRefQFrw = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefPFrw = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));

                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                    // select reference fields number array
                    pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_Flags;

                    // select backward reference index for blocks
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock];
                    iRefQBck = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefPBck = (index < 0) ?
                            (-1) :
                    pRefPicList[index]->DeblockPicID(pRefPicList[index]->GetNumberByParity(GetReferenceField(pFields, index)));

                }
                // frame coded image
                else
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;

                    // select forward reference pictures list
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                    // select forward reference index for block(s)
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nBlock];
                    iRefQFrw = (index < 0) ?
                            (-1) :
                            (pRefPicList[index]->DeblockPicID(0));
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefPFrw = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(0);

                    // select backward reference pictures list
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                    // select backward reference index for block(s)
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nBlock];
                    iRefQBck = (index < 0) ?
                            (-1) :
                            (pRefPicList[index]->DeblockPicID(0));
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[nNeighbourBlock];
                    iRefPBck = (index < 0) ?
                            (-1) :
                            pRefPicList[index]->DeblockPicID(0);
                }

                // when reference indexes are equal
                if (((iRefQFrw == iRefPFrw) && (iRefQBck == iRefPBck)) ||
                    ((iRefQFrw == iRefPBck) && (iRefQBck == iRefPFrw)))
                {
                    // set initial value of strength
                    pStrength[idx] = 0;

                    // when forward and backward reference pictures of previous block are different
                    if (iRefPFrw != iRefPBck)
                    {
                        H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                        H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                        // select current block motion vectors
                        pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                        pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                        // select previous block motion vectors
                        if (iRefQFrw == iRefPFrw)
                        {
                            pVectorPFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nNeighbourBlock;
                        }
                        else
                        {
                            pVectorPFrw = m_gmbinfo->MV[1][MBAddr].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;
                        }

                        // compare motion vectors
                        if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                            (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                        {
                            pStrength[idx] = 1;
                            *pDeblockingFlag = 1;
                        }
                    }
                    // when forward and backward reference pictures of previous block are equal
                    else
                    {
                        H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;
                        H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                        // select current block motion vectors
                        pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nBlock;
                        pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nBlock;

                        // select previous block motion vectors
                        pVectorPFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors + nNeighbourBlock;
                        pVectorPBck = m_gmbinfo->MV[1][MBAddr].MotionVectors + nNeighbourBlock;

                        // compare motion vectors
                        if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                            (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                        {
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPBck->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPFrw->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                    }
                }
                // when reference indexes are different
                else
                {
                    pStrength[idx] = 1;
                    *pDeblockingFlag = 1;
                }
            }
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice4(Ipp32u dir, DeblockingParameters *pParams)

#define SET_DEBLOCKING_STRENGTH_B_SLICE_VERTICAL(block_num0, block_num1) \
{ \
    Ipp32s refPrev[2]; \
    Ipp32s iRefPrevNum; \
    iRefPrevNum = GetReferencesBSlice(nNeighbour, block_num0 * 4 + 3, refPrev); \
    if ((iRefPrevNum == pParams->iReferenceNum[0]) && \
        (0 == (refPrev[0] ^ refPrev[1] ^ refCurFwd ^ refCurBwd)) && \
        ((refPrev[0] == refCurFwd) || (refPrev[0] == refCurBwd))) \
    { \
        if (0 == (VERTICAL_OUTER_EDGE_BLOCK_##block_num0 & uMask)) \
        { \
            if (refCurFwd != refCurBwd) \
            { \
                /* exchange reference for direct equality */ \
                if (refCurFwd != refPrev[0]) \
                { \
                    H264DecoderMotionVector mvTmp = mvCurFwd; \
                    mvCurFwd = mvCurBwd; \
                    mvCurBwd = mvTmp; \
                    refCurFwd ^= refCurBwd; \
                    refCurBwd ^= refCurFwd; \
                    refCurFwd ^= refCurBwd; \
                } \
                /* compare motion vectors */ \
                if (IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num0 * 4 + 3], pParams->nMaxMVector) || \
                    IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num0 * 4 + 3], pParams->nMaxMVector)) \
                { \
                    pStrength[block_num0] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num0] = 0; \
            } \
            else \
            { \
                /* compare motion vectors */ \
                if ((IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num0 * 4 + 3], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num0 * 4 + 3], pParams->nMaxMVector)) && \
                    (IsVectorDifferenceBig(mvCurFwd, pMVPrevBwd[block_num0 * 4 + 3], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevFwd[block_num0 * 4 + 3], pParams->nMaxMVector))) \
                { \
                    pStrength[block_num0] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num0] = 0; \
            } \
        } \
        else \
        { \
            pStrength[block_num0] = 2; \
            iDeblockingFlag = 1; \
        } \
        if (0 == (VERTICAL_OUTER_EDGE_BLOCK_##block_num1 & uMask)) \
        { \
            if (refCurFwd != refCurBwd) \
            { \
                /* exchange reference for direct equality */ \
                if (refCurFwd != refPrev[0]) \
                { \
                    H264DecoderMotionVector mvTmp = mvCurFwd; \
                    mvCurFwd = mvCurBwd; \
                    mvCurBwd = mvTmp; \
                    refCurFwd ^= refCurBwd; \
                    refCurBwd ^= refCurFwd; \
                    refCurFwd ^= refCurBwd; \
                } \
                /* compare motion vectors */ \
                if (IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num1 * 4 + 3], pParams->nMaxMVector) || \
                    IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num1 * 4 + 3], pParams->nMaxMVector)) \
                { \
                    pStrength[block_num1] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num1] = 0; \
            } \
            else \
            { \
                /* compare motion vectors */ \
                if ((IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num1 * 4 + 3], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num1 * 4 + 3], pParams->nMaxMVector)) && \
                    (IsVectorDifferenceBig(mvCurFwd, pMVPrevBwd[block_num1 * 4 + 3], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevFwd[block_num1 * 4 + 3], pParams->nMaxMVector))) \
                { \
                    pStrength[block_num1] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num1] = 0; \
            } \
        } \
        else \
        { \
            pStrength[block_num1] = 2; \
            iDeblockingFlag = 1; \
        } \
    } \
    else \
    { \
        pStrength[block_num0] = (Ipp8u) (1 + ((VERTICAL_OUTER_EDGE_BLOCK_##block_num0 & uMask) ? (1) : (0))); \
        pStrength[block_num1] = (Ipp8u) (1 + ((VERTICAL_OUTER_EDGE_BLOCK_##block_num1 & uMask) ? (1) : (0))); \
        iDeblockingFlag = 1; \
    } \
}

#define SET_DEBLOCKING_STRENGTH_B_SLICE_HORIZONTAL(block_num0, block_num1) \
{ \
    Ipp32s refPrev[2]; \
    Ipp32s iRefPrevNum; \
    iRefPrevNum = GetReferencesBSlice(nNeighbour, block_num0 + 12, refPrev); \
    if ((iRefPrevNum == pParams->iReferenceNum[0]) && \
        (0 == (refPrev[0] ^ refPrev[1] ^ refCurFwd ^ refCurBwd)) && \
        ((refPrev[0] == refCurFwd) || (refPrev[0] == refCurBwd))) \
    { \
        if (0 == (HORIZONTAL_OUTER_EDGE_BLOCK_##block_num0 & uMask)) \
        { \
            if (refCurFwd != refCurBwd) \
            { \
                /* exchange reference for direct equality */ \
                if (refCurFwd != refPrev[0]) \
                { \
                    H264DecoderMotionVector mvTmp = mvCurFwd; \
                    mvCurFwd = mvCurBwd; \
                    mvCurBwd = mvTmp; \
                    refCurFwd ^= refCurBwd; \
                    refCurBwd ^= refCurFwd; \
                    refCurFwd ^= refCurBwd; \
                } \
                /* compare motion vectors */ \
                if (IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num0 + 12], pParams->nMaxMVector) || \
                    IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num0 + 12], pParams->nMaxMVector)) \
                { \
                    pStrength[block_num0] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num0] = 0; \
            } \
            else \
            { \
                /* compare motion vectors */ \
                if ((IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num0 + 12], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num0 + 12], pParams->nMaxMVector)) && \
                    (IsVectorDifferenceBig(mvCurFwd, pMVPrevBwd[block_num0 + 12], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevFwd[block_num0 + 12], pParams->nMaxMVector))) \
                { \
                    pStrength[block_num0] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num0] = 0; \
            } \
        } \
        else \
        { \
            pStrength[block_num0] = 2; \
            iDeblockingFlag = 1; \
        } \
        if (0 == (HORIZONTAL_OUTER_EDGE_BLOCK_##block_num1 & uMask)) \
        { \
            if (refCurFwd != refCurBwd) \
            { \
                /* exchange reference for direct equality */ \
                if (refCurFwd != refPrev[0]) \
                { \
                    H264DecoderMotionVector mvTmp = mvCurFwd; \
                    mvCurFwd = mvCurBwd; \
                    mvCurBwd = mvTmp; \
                    refCurFwd ^= refCurBwd; \
                    refCurBwd ^= refCurFwd; \
                    refCurFwd ^= refCurBwd; \
                } \
                /* compare motion vectors */ \
                if (IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num1 + 12], pParams->nMaxMVector) || \
                    IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num1 + 12], pParams->nMaxMVector)) \
                { \
                    pStrength[block_num1] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num1] = 0; \
            } \
            else \
            { \
                /* compare motion vectors */ \
                if ((IsVectorDifferenceBig(mvCurFwd, pMVPrevFwd[block_num1 + 12], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevBwd[block_num1 + 12], pParams->nMaxMVector)) && \
                    (IsVectorDifferenceBig(mvCurFwd, pMVPrevBwd[block_num1 + 12], pParams->nMaxMVector) || \
                     IsVectorDifferenceBig(mvCurBwd, pMVPrevFwd[block_num1 + 12], pParams->nMaxMVector))) \
                { \
                    pStrength[block_num1] = 1; \
                    iDeblockingFlag = 1; \
                } \
                else \
                    pStrength[block_num1] = 0; \
            } \
        } \
        else \
        { \
            pStrength[block_num1] = 2; \
            iDeblockingFlag = 1; \
        } \
    } \
    else \
    { \
        pStrength[block_num0] = (Ipp8u) (1 + ((HORIZONTAL_OUTER_EDGE_BLOCK_##block_num0 & uMask) ? (1) : (0))); \
        pStrength[block_num1] = (Ipp8u) (1 + ((HORIZONTAL_OUTER_EDGE_BLOCK_##block_num1 & uMask) ? (1) : (0))); \
        iDeblockingFlag = 1; \
    } \
}

void H264SegmentDecoder::PrepareDeblockingParametersBSlice16x16Vert(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[VERTICAL_DEBLOCKING];
    Ipp32s iDeblockingFlag = 0;

    //
    // precalculating of reference numbers of current macroblock.
    // it is more likely we have to compare reference numbers.
    // we will use it also in horizontal deblocking
    //
    pParams->iReferenceNum[0] = GetReferencesBSlice(MBAddr, 0, pParams->iReferences[0]);

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[VERTICAL_DEBLOCKING])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[VERTICAL_DEBLOCKING];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32u uMask;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // create special mask
            uMask = cbp4x4_luma | (pNeighbour->cbp4x4_luma >> 5);

            // when at least one from a couple of blocks has coeffs
            if (VERTICAL_OUTER_EDGE_MASK != (uMask & VERTICAL_OUTER_EDGE_MASK))
            {
                Ipp32s refCurFwd, refCurBwd;
                H264DecoderMotionVector mvCurFwd, mvCurBwd;
                H264DecoderMotionVector *pMVPrevFwd, *pMVPrevBwd;

                // obtain current block parameters
                refCurFwd = pParams->iReferences[0][0];
                refCurBwd = pParams->iReferences[0][1];
                mvCurFwd = m_gmbinfo->MV[0][MBAddr].MotionVectors[0];
                mvCurBwd = m_gmbinfo->MV[1][MBAddr].MotionVectors[0];

                // obtain neighbour block parameters
                pMVPrevFwd = m_gmbinfo->MV[0][nNeighbour].MotionVectors;
                pMVPrevBwd = m_gmbinfo->MV[1][nNeighbour].MotionVectors;

                SET_DEBLOCKING_STRENGTH_B_SLICE_VERTICAL(0, 1)

                SET_DEBLOCKING_STRENGTH_B_SLICE_VERTICAL(2, 3)
            }
            else
            {
                SetEdgeStrength(pStrength + 0, 2);
                iDeblockingFlag = 1;
            }
        }
        else
        {
            SetEdgeStrength(pStrength + 0, 4);
            iDeblockingFlag = 1;
        }
    }

    pParams->DeblockingFlag[VERTICAL_DEBLOCKING] = iDeblockingFlag;

    //
    // internal edge(s)
    //
    PrepareDeblockingParametersIntern16x16Vert(pParams);

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice16x16Vert(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice16x16Horz(DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[HORIZONTAL_DEBLOCKING];
    Ipp32s iDeblockingFlag = 0;

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[HORIZONTAL_DEBLOCKING])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[HORIZONTAL_DEBLOCKING];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32u uMask;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // create special mask
            uMask = cbp4x4_luma | (pNeighbour->cbp4x4_luma >> 10);

            // when at least one from a couple of blocks has coeffs
            if (HORIZONTAL_OUTER_EDGE_MASK != (uMask & HORIZONTAL_OUTER_EDGE_MASK))
            {
                Ipp32s refCurFwd, refCurBwd;
                H264DecoderMotionVector mvCurFwd, mvCurBwd;
                H264DecoderMotionVector *pMVPrevFwd, *pMVPrevBwd;

                // obtain current block parameters
                refCurFwd = pParams->iReferences[0][0];
                refCurBwd = pParams->iReferences[0][1];
                mvCurFwd = m_gmbinfo->MV[0][MBAddr].MotionVectors[0];
                mvCurBwd = m_gmbinfo->MV[1][MBAddr].MotionVectors[0];

                // obtain neighbour block parameters
                pMVPrevFwd = m_gmbinfo->MV[0][nNeighbour].MotionVectors;
                pMVPrevBwd = m_gmbinfo->MV[1][nNeighbour].MotionVectors;

                SET_DEBLOCKING_STRENGTH_B_SLICE_HORIZONTAL(0, 1)

                SET_DEBLOCKING_STRENGTH_B_SLICE_HORIZONTAL(2, 3)
            }
            // when at least one from a couple of blocks has coeffs
            else
            {
                SetEdgeStrength(pStrength + 0, 2);
                iDeblockingFlag = 1;
            }
        }
        else
        {
            if (pParams->MBFieldCoded)
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            iDeblockingFlag = 1;
        }
    }

    pParams->DeblockingFlag[HORIZONTAL_DEBLOCKING] = iDeblockingFlag;

    //
    // internal edge(s)
    //
    PrepareDeblockingParametersIntern16x16Horz(pParams);

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice16x16Horz(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice16(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;
            Ipp32s iRefQFrw, iRefQBck;
            H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;

            // load reference indexes for current block
            {
                // field coded image
                if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;
                    ReferenceFlags *pFields;

                    // select reference index for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[0];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                        // select reference fields number array
                        pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;
                        iRefQFrw = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                    }
                    else
                        iRefQFrw = -1;
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[0];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                        // select reference fields number array
                        pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_Flags;
                        iRefQBck = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                    }
                    else
                        iRefQBck = -1;
                }
                // frame coded image
                else
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;

                    // select reference index for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[0];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                        iRefQFrw = pRefPicList[index]->DeblockPicID(0);
                    }
                    else
                        iRefQFrw = -1;
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[0];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                        iRefQBck = pRefPicList[index]->DeblockPicID(0);
                    }
                    else
                        iRefQBck = -1;
                }

                // select current block motion vectors
                pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors;
                pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors;
            }

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nNeighbourBlock;
                    Ipp32s iRefPFrw, iRefPBck;
                    Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                        nNeighbourBlock = idx * 4 + 3;
                    else
                        nNeighbourBlock = idx + 12;

                    // field coded image
                    if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;
                        ReferenceFlags *pFields;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_Flags;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_Flags;
                            iRefPBck = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                        }
                        else
                            iRefPBck = -1;
                    }
                    // frame coded image
                    else
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            iRefPBck = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPBck = -1;
                    }

                    // when reference indexes are equal
                    if (((iRefQFrw == iRefPFrw) && (iRefQBck == iRefPBck)) ||
                        ((iRefQFrw == iRefPBck) && (iRefQBck == iRefPFrw)))
                    {
                        // set initial value of strength
                        pStrength[idx] = 0;

                        // when forward and backward reference pictures of previous block are different
                        if (iRefPFrw != iRefPBck)
                        {
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select previous block motion vectors
                            if (iRefQFrw == iRefPFrw)
                            {
                                pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                            }
                            else
                            {
                                pVectorPFrw = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            }

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                        // when forward and backward reference pictures of previous block are equal
                        else
                        {
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select previous block motion vectors
                            pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                if ((4 <= abs(pVectorQFrw->mvx - pVectorPBck->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPBck->mvy)) ||
                                    (4 <= abs(pVectorQBck->mvx - pVectorPFrw->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPFrw->mvy)))
                                {
                                    pStrength[idx] = 1;
                                    *pDeblockingFlag = 1;
                                }
                            }
                        }
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if ((HORIZONTAL_DEBLOCKING == dir) &&
                (pParams->MBFieldCoded))
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // reset all strengths
        SetEdgeStrength(pStrength + 4, 0);
        SetEdgeStrength(pStrength + 8, 0);
        SetEdgeStrength(pStrength + 12, 0);

        // set deblocking flag
        if (cbp4x4_luma & 0x1fffe)
            *pDeblockingFlag = 1;

        // cicle of edge(s)
        // we do all edges in one cicle
        for (idx = 4;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
                pStrength[idx] = 2;
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice16(DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice16x8(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);
    Ipp32s iRefQFrw, iRefQBck;
    H264DecoderMotionVector *pVectorQFrw, *pVectorQBck;

    //
    // external edge
    //

    // load reference indexes & motion vector for first half of current block
    {
        // field coded image
        if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
        {
            H264DecoderFrame **pRefPicList;
            Ipp32s index;
            ReferenceFlags *pFields;

            // select reference index for current block
            index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[0];
            if (0 <= index)
            {
                pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                // select reference fields number array
                pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;
                iRefQFrw = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
            }
            else
                iRefQFrw = -1;
            index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[0];
            if (0 <= index)
            {
                pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                // select reference fields number array
                pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_Flags;
                iRefQBck = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
            }
            else
                iRefQBck = -1;
        }
        // frame coded image
        else
        {
            H264DecoderFrame **pRefPicList;
            Ipp32s index;

            // select reference index for current block
            index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[0];
            if (0 <= index)
            {
                pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                iRefQFrw = pRefPicList[index]->DeblockPicID(0);
            }
            else
                iRefQFrw = -1;
            index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[0];
            if (0 <= index)
            {
                pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                iRefQBck = pRefPicList[index]->DeblockPicID(0);
            }
            else
                iRefQBck = -1;
        }

        // select current block motion vectors
        pVectorQFrw = m_gmbinfo->MV[0][MBAddr].MotionVectors;
        pVectorQBck = m_gmbinfo->MV[1][MBAddr].MotionVectors;
    }

    // prepare deblocking parameter for external edge
    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nNeighbourBlock;
                    Ipp32s iRefPFrw, iRefPBck;
                    Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                        nNeighbourBlock = idx * 4 + 3;
                    else
                        nNeighbourBlock = idx + 12;

                    // field coded image
                    if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;
                        ReferenceFlags *pFields;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_Flags;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_Flags;
                            iRefPBck = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                        }
                        else
                            iRefPBck = -1;
                    }
                    // frame coded image
                    else
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            iRefPBck = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPBck = -1;
                    }

                    // when reference indexes are equal
                    if (((iRefQFrw == iRefPFrw) && (iRefQBck == iRefPBck)) ||
                        ((iRefQFrw == iRefPBck) && (iRefQBck == iRefPFrw)))
                    {
                        // set initial value of strength
                        pStrength[idx] = 0;

                        // when forward and backward reference pictures of previous block are different
                        if (iRefPFrw != iRefPBck)
                        {
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select previous block motion vectors
                            if (iRefQFrw == iRefPFrw)
                            {
                                pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                            }
                            else
                            {
                                pVectorPFrw = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            }

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                        // when forward and backward reference pictures of previous block are equal
                        else
                        {
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select previous block motion vectors
                            pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPBck->mvy)))
                            {
                                if ((4 <= abs(pVectorQFrw->mvx - pVectorPBck->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorPBck->mvy)) ||
                                    (4 <= abs(pVectorQBck->mvx - pVectorPFrw->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorPFrw->mvy)))
                                {
                                    pStrength[idx] = 1;
                                    *pDeblockingFlag = 1;
                                }
                            }
                        }
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if ((HORIZONTAL_DEBLOCKING == dir) &&
                (pParams->MBFieldCoded))
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // cicle of edge(s)
        for (idx = 4;idx < 8;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
            {
                pStrength[idx] = 2;
                *pDeblockingFlag = 1;
            }
            // we haven't to compare motion vectors  - they are equal
            else
                pStrength[idx] = 0;
        }

        // load reference indexes & motion vector for second half of current block
        {
            Ipp32s iRefQFrw2, iRefQBck2;
            Ipp32u nStrength;
            Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

            // load reference indexes for current block

            // field coded image
            if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
            {
                H264DecoderFrame **pRefPicList;
                Ipp32s index;
                ReferenceFlags *pFields;

                // select reference index for current block
                index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[15];
                if (0 <= index)
                {
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                    // select reference fields number array
                    pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;
                    iRefQFrw2 = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                }
                else
                    iRefQFrw2 = -1;
                index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[15];
                if (0 <= index)
                {
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                    // select reference fields number array
                    pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_Flags;
                    iRefQBck2 = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                }
                else
                    iRefQBck2 = -1;
            }
            // frame coded image
            else
            {
                H264DecoderFrame **pRefPicList;
                Ipp32s index;

                // select reference index for current block
                index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[15];
                if (0 <= index)
                {
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                    iRefQFrw2 = pRefPicList[index]->DeblockPicID(0);
                }
                else
                    iRefQFrw2 = -1;
                index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[15];
                if (0 <= index)
                {
                    pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                    iRefQBck2 = pRefPicList[index]->DeblockPicID(0);
                }
                else
                    iRefQBck2 = -1;
            }

            // when reference indexes are equal
            if (((iRefQFrw == iRefQFrw2) && (iRefQBck == iRefQBck2)) ||
                ((iRefQFrw == iRefQBck2) && (iRefQBck == iRefQFrw2)))
            {
                // set initial value of strength
                nStrength = 0;

                // when forward and backward reference pictures of previous block are different
                if (iRefQFrw2 != iRefQBck2)
                {
                    H264DecoderMotionVector *pVectorQFrw2, *pVectorQBck2;

                    // select previous block motion vectors
                    if (iRefQFrw == iRefQFrw2)
                    {
                        pVectorQFrw2 = m_gmbinfo->MV[0][MBAddr].MotionVectors + 15;
                        pVectorQBck2 = m_gmbinfo->MV[1][MBAddr].MotionVectors + 15;
                    }
                    else
                    {
                        pVectorQFrw2 = m_gmbinfo->MV[1][MBAddr].MotionVectors + 15;
                        pVectorQBck2 = m_gmbinfo->MV[0][MBAddr].MotionVectors + 15;
                    }

                    // compare motion vectors
                    if ((4 <= abs(pVectorQFrw->mvx - pVectorQFrw2->mvx)) ||
                        (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorQFrw2->mvy)) ||
                        (4 <= abs(pVectorQBck->mvx - pVectorQBck2->mvx)) ||
                        (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorQBck2->mvy)))
                    {
                        nStrength = 1;
                        *pDeblockingFlag = 1;
                    }
                }
                // when forward and backward reference pictures of previous block are equal
                else
                {
                    H264DecoderMotionVector *pVectorQFrw2, *pVectorQBck2;

                    // select block second motion vectors
                    pVectorQFrw2 = m_gmbinfo->MV[0][MBAddr].MotionVectors + 15;
                    pVectorQBck2 = m_gmbinfo->MV[1][MBAddr].MotionVectors + 15;

                    // compare motion vectors
                    if ((4 <= abs(pVectorQFrw->mvx - pVectorQFrw2->mvx)) ||
                        (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorQFrw2->mvy)) ||
                        (4 <= abs(pVectorQBck->mvx - pVectorQBck2->mvx)) ||
                        (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorQBck2->mvy)))
                    {
                        if ((4 <= abs(pVectorQFrw->mvx - pVectorQBck2->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQFrw->mvy - pVectorQBck2->mvy)) ||
                            (4 <= abs(pVectorQBck->mvx - pVectorQFrw2->mvx)) ||
                            (nVectorDiffLimit <= abs(pVectorQBck->mvy - pVectorQFrw2->mvy)))
                        {
                            nStrength = 1;
                            *pDeblockingFlag = 1;
                        }
                    }
                }
            }
            // when reference indexes are different
            else
            {
                nStrength = 1;
                *pDeblockingFlag = 1;
            }

            // cicle of edge(s)
            for (idx = 8;idx < 12;idx += 1)
            {
                Ipp32s blkQ;

                blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

                if (cbp4x4_luma & blkQ)
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // we have compared motion vectors
                else
                    pStrength[idx] = (Ipp8u) nStrength;
            }
        }

        // cicle of edge(s)
        for (idx = 12;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
            {
                pStrength[idx] = 2;
                *pDeblockingFlag = 1;
            }
            // we haven't to compare motion vectors  - they are equal
            else
                pStrength[idx] = 0;
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice16x8(Ipp32u dir, DeblockingParameters *pParams)

void H264SegmentDecoder::PrepareDeblockingParametersBSlice8x16(Ipp32u dir, DeblockingParameters *pParams)
{
    Ipp32s MBAddr = pParams->nMBAddr;
    Ipp32u cbp4x4_luma = (m_mbinfo.mbs + MBAddr)->cbp4x4_luma;
    Ipp8u *pStrength = pParams->Strength[dir];
    Ipp32s *pDeblockingFlag = &(pParams->DeblockingFlag[dir]);

    //
    // external edge
    //
    if (pParams->ExternalEdgeFlag[dir])
    {
        Ipp32s nNeighbour;

        // select neighbour addres
        nNeighbour = pParams->nNeighbour[dir];

        // when neighbour macroblock isn't intra
        if (!IS_INTRA_MBTYPE((m_gmbinfo->mbs + nNeighbour)->mbtype))
        {
            H264DecoderMacroblockLocalInfo *pNeighbour;
            Ipp32s idx;
            Ipp32s iRefQFrw[2], iRefQBck[2];
            H264DecoderMotionVector *(pVectorQFrw[2]), *(pVectorQBck[2]);

            // in following calculations we avoided multiplication on 15
            // by using formulae a * 15 = a * 16 - a

            // load reference indexes for current block
            for (idx = 0;idx < 2;idx += 1)
            {
                // field coded image
                if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;
                    ReferenceFlags *pFields;

                    // select reference index for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[idx * 16 - idx];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                        // select reference fields number array
                        pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_Flags;
                        iRefQFrw[idx] = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                    }
                    else
                        iRefQFrw[idx] = -1;
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[idx * 16 - idx];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                        // select reference fields number array
                        pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_Flags;
                        iRefQBck[idx] = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                    }
                    else
                        iRefQBck[idx] = -1;
                }
                // frame coded image
                else
                {
                    H264DecoderFrame **pRefPicList;
                    Ipp32s index;

                    // select reference index for current block
                    index = m_gmbinfo->RefIdxs[0][MBAddr].RefIdxs[idx * 16 - idx];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 0)->m_RefPicList;
                        iRefQFrw[idx] = pRefPicList[index]->DeblockPicID(0);
                    }
                    else
                        iRefQFrw[idx] = -1;
                    index = m_gmbinfo->RefIdxs[1][MBAddr].RefIdxs[idx * 16 - idx];
                    if (0 <= index)
                    {
                        pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + MBAddr)->slice_id, 1)->m_RefPicList;
                        iRefQBck[idx] = pRefPicList[index]->DeblockPicID(0);
                    }
                    else
                        iRefQBck[idx] = -1;
                }

                // select current block motion vectors
                pVectorQFrw[idx] = m_gmbinfo->MV[0][MBAddr].MotionVectors + (idx * 16 - idx);
                pVectorQBck[idx] = m_gmbinfo->MV[1][MBAddr].MotionVectors + (idx * 16 - idx);
            }

            // select neighbour
            pNeighbour = m_mbinfo.mbs + nNeighbour;

            // cicle on blocks
            for (idx = 0;idx < 4;idx += 1)
            {
                Ipp32s blkQ, blkP;

                blkQ = EXTERNAL_BLOCK_MASK[dir][CURRENT_BLOCK][idx];
                blkP = EXTERNAL_BLOCK_MASK[dir][NEIGHBOUR_BLOCK][idx];

                // when one of couple of blocks has coeffs
                if ((cbp4x4_luma & blkQ) ||
                    (pNeighbour->cbp4x4_luma & blkP))
                {
                    pStrength[idx] = 2;
                    *pDeblockingFlag = 1;
                }
                // compare motion vectors & reference indexes
                else
                {
                    Ipp32s nNeighbourBlock;
                    Ipp32s iRefPFrw, iRefPBck;
                    Ipp32s nVectorDiffLimit = pParams->nMaxMVector;

                    // calc block and neighbour block number
                    if (VERTICAL_DEBLOCKING == dir)
                        nNeighbourBlock = idx * 4 + 3;
                    else
                        nNeighbourBlock = idx + 12;

                    // field coded image
                    if (FRM_STRUCTURE > m_pCurrentFrame->m_PictureStructureForDec)
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;
                        ReferenceFlags *pFields;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_Flags;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            // select reference fields number array
                            pFields = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_Flags;
                            iRefPBck = pRefPicList[index]->DeblockPicID(GetReferenceField(pFields, index));
                        }
                        else
                            iRefPBck = -1;
                    }
                    // frame coded image
                    else
                    {
                        H264DecoderFrame **pRefPicList;
                        Ipp32s index;

                        // select reference index for previous block
                        index = m_gmbinfo->RefIdxs[0][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 0)->m_RefPicList;
                            iRefPFrw = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPFrw = -1;
                        index = m_gmbinfo->RefIdxs[1][nNeighbour].RefIdxs[nNeighbourBlock];
                        if (0 <= index)
                        {
                            pRefPicList = m_pCurrentFrame->GetRefPicList((m_gmbinfo->mbs + nNeighbour)->slice_id, 1)->m_RefPicList;
                            iRefPBck = pRefPicList[index]->DeblockPicID(0);
                        }
                        else
                            iRefPBck = -1;
                    }

                    // when reference indexes are equal
                    if (((iRefQFrw[idx / 2] == iRefPFrw) && (iRefQBck[idx / 2] == iRefPBck)) ||
                        ((iRefQFrw[idx / 2] == iRefPBck) && (iRefQBck[idx / 2] == iRefPFrw)))
                    {
                        // set initial value of strength
                        pStrength[idx] = 0;

                        // when forward and backward reference pictures of previous block are different
                        if (iRefPFrw != iRefPBck)
                        {
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select previous block motion vectors
                            if (iRefQFrw[idx / 2] == iRefPFrw)
                            {
                                pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                            }
                            else
                            {
                                pVectorPFrw = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;
                                pVectorPBck = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            }

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw[idx / 2]->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw[idx / 2]->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck[idx / 2]->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck[idx / 2]->mvy - pVectorPBck->mvy)))
                            {
                                pStrength[idx] = 1;
                                *pDeblockingFlag = 1;
                            }
                        }
                        // when forward and backward reference pictures of previous block are equal
                        else
                        {
                            H264DecoderMotionVector *pVectorPFrw, *pVectorPBck;

                            // select previous block motion vectors
                            pVectorPFrw = m_gmbinfo->MV[0][nNeighbour].MotionVectors + nNeighbourBlock;
                            pVectorPBck = m_gmbinfo->MV[1][nNeighbour].MotionVectors + nNeighbourBlock;

                            // compare motion vectors
                            if ((4 <= abs(pVectorQFrw[idx / 2]->mvx - pVectorPFrw->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQFrw[idx / 2]->mvy - pVectorPFrw->mvy)) ||
                                (4 <= abs(pVectorQBck[idx / 2]->mvx - pVectorPBck->mvx)) ||
                                (nVectorDiffLimit <= abs(pVectorQBck[idx / 2]->mvy - pVectorPBck->mvy)))
                            {
                                if ((4 <= abs(pVectorQFrw[idx / 2]->mvx - pVectorPBck->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQFrw[idx / 2]->mvy - pVectorPBck->mvy)) ||
                                    (4 <= abs(pVectorQBck[idx / 2]->mvx - pVectorPFrw->mvx)) ||
                                    (nVectorDiffLimit <= abs(pVectorQBck[idx / 2]->mvy - pVectorPFrw->mvy)))
                                {
                                    pStrength[idx] = 1;
                                    *pDeblockingFlag = 1;
                                }
                            }
                        }
                    }
                    // when reference indexes are different
                    else
                    {
                        pStrength[idx] = 1;
                        *pDeblockingFlag = 1;
                    }
                }
            }
        }
        // external edge required in strong filtering
        else
        {
            if ((HORIZONTAL_DEBLOCKING == dir) &&
                (pParams->MBFieldCoded))
                SetEdgeStrength(pStrength + 0, 3);
            else
                SetEdgeStrength(pStrength + 0, 4);
            *pDeblockingFlag = 1;
        }
    }

    //
    // internal edge(s)
    //
    {
        Ipp32s idx;

        // reset all strengths
        SetEdgeStrength(pStrength + 4, 0);
        SetEdgeStrength(pStrength + 8, 0);
        SetEdgeStrength(pStrength + 12, 0);

        // set deblocking flag
        if (cbp4x4_luma & 0x1fffe)
            *pDeblockingFlag = 1;

        // cicle of edge(s)
        // we do all edges in one cicle
        for (idx = 4;idx < 16;idx += 1)
        {
            Ipp32s blkQ;

            blkQ = INTERNAL_BLOCKS_MASK[dir][idx - 4];

            if (cbp4x4_luma & blkQ)
                pStrength[idx] = 2;
        }
    }

} // void H264SegmentDecoder::PrepareDeblockingParametersBSlice8x16(Ipp32u dir, DeblockingParameters *pParams)

} // namespace UMC
#endif // UMC_ENABLE_H264_VIDEO_DECODER
