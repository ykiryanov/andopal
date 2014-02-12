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

#ifndef __UMC_H264_SEGMENT_DECODER_H
#define __UMC_H264_SEGMENT_DECODER_H

#include "umc_h264_dec.h"
#include "umc_h264_slice_decoding.h"
#include "umc_h264_dec_tables.h"

#include "umc_h264_thread.h"
#include "umc_h264_frame.h"

using namespace UMC_H264_DECODER;

namespace UMC
{

struct DeblockingParameters;
struct DeblockingParametersMBAFF;
struct H264SliceHeader;
class TaskBroker;


//
// Class to incapsulate functions, implementing common decoding functional.
//

STRUCT_DECLSPEC_ALIGN class H264SegmentDecoder : public H264Thread
{
public:
    ReferenceFlags *(m_pFields[2]);
    H264DecoderFrame **(m_pRefPicList[2]);

    bool m_IsUseConstrainedIntra;
    bool m_IsUseDirect8x8Inference;
    bool m_IsBSlice;

    bool m_isMBAFF;
    Ipp32u m_uPitchLuma;
    Ipp32u m_uPitchChroma;

    Ipp8u *m_pYPlane;
    Ipp8u *m_pUPlane;
    Ipp8u *m_pVPlane;

    Ipp32s m_MBSkipCount;
    Ipp32s m_QuantPrev;

    bool m_IsUseSpatialDirectMode;
    Ipp32s m_MVDistortion[2];
    Ipp32s original_mb_type;

public:
    // Default constructor
    H264SegmentDecoder(TaskBroker * pTaskBroker);
    // Destructor
    virtual
    ~H264SegmentDecoder(void);

    // Initialize object
    virtual
    Status Init(Ipp32s iNumber);

    // Decode slice's segment
    virtual
    Status ProcessSegment(void) = 0;

    virtual Status ProcessSlice(Ipp32s nCurMBNumber, Ipp32s &nMBToProcess) = 0;
    Status DeblockSlice(Ipp32s nCurMBNumber, Ipp32s &nMBToDeblock);

//protected:
    // Release object
    void Release(void);

    // Update info about current MB
    void UpdateCurrentMBInfo();
    void AdjustIndex(Ipp32s ref_mb_is_bottom, Ipp32s ref_mb_is_field, Ipp8s &RefIdx);
    // Update neighbour's addresses
    inline void UpdateNeighbouringAddresses(Ipp32s IgnoreSliceEdges = 0);

    inline
    void UpdateNeighbouringAddressesField(void);

    inline void UpdateNeighbouringBlocksBMEH(Ipp32s DeblockCalls = 0);
    inline void UpdateNeighbouringBlocksH2(Ipp32s DeblockCalls = 0);
    inline void UpdateNeighbouringBlocksH4(Ipp32s DeblockCalls = 0);

    void DecodeEdgeType();
    void ReconstructEdgeType(Ipp8u &edge_type_2t, Ipp8u &edge_type_2b, Ipp32s &special_MBAFF_case);

    // Get context functions
    inline
    Ipp32u GetDCBlocksLumaContext();

    // an universal function for an every case of the live
    inline
    Ipp32u GetBlocksLumaContext(Ipp32s x,Ipp32s y);

    // a function for the first luma block in a macroblock
    inline
    Ipp32s GetBlocksLumaContextExternal(void);

    // a function for a block on the upper edge of a macroblock,
    // but not for the first block
    inline
    Ipp32s GetBlocksLumaContextTop(Ipp32s x, Ipp32s left_coeffs);

    // a function for a block on the left edge of a macroblock,
    // but not for the first block
    inline
    Ipp32u GetBlocksLumaContextLeft(Ipp32s y, Ipp32s above_coeffs);

    // a function for any internal block of a macroblock
    inline
    Ipp32u GetBlocksLumaContextInternal(Ipp32s x, Ipp32s y, Ipp8u *pNumCoeffsArray);

    // an universal function for an every case of the live
    inline
    Ipp32u GetBlocksChromaContextBMEH(Ipp32s x,Ipp32s y,Ipp32s component);

    // a function for the first block in a macroblock
    inline
    Ipp32s GetBlocksChromaContextBMEHExternal(Ipp32s iComponent);

    // a function for a block on the upper edge of a macroblock,
    // but not for the first block
    inline
    Ipp32s GetBlocksChromaContextBMEHTop(Ipp32s x, Ipp32s left_coeffs, Ipp32s iComponent);

    // a function for a block on the left edge of a macroblock,
    // but not for the first block
    inline
    Ipp32s GetBlocksChromaContextBMEHLeft(Ipp32s y, Ipp32s above_coeffs, Ipp32s iComponent);

    // a function for any internal block of a macroblock
    inline
    Ipp32s GetBlocksChromaContextBMEHInternal(Ipp32s x, Ipp32s y, Ipp8u *pNumCoeffsArray);

    inline
    Ipp32u GetBlocksChromaContextH2(Ipp32s x,Ipp32s y,Ipp32s component);

    inline
    Ipp32u GetBlocksChromaContextH4(Ipp32s x,Ipp32s y,Ipp32s component);

    // Decode macroblock type
    void DecodeMacroBlockType(IntraType *pMBIntraTypes, Ipp32s *MBSkipCount, Ipp32s *PassFDFDecode);
    void DecodeMBTypeISlice_CABAC(void);
    void DecodeMBTypeISlice_CAVLC(void);
    void DecodeMBTypePSlice_CABAC(void);
    void DecodeMBTypePSlice_CAVLC(void);
    void DecodeMBTypeBSlice_CABAC(void);
    void DecodeMBTypeBSlice_CAVLC(void);
    void DecodeMBFieldDecodingFlag_CABAC(void);
    void DecodeMBFieldDecodingFlag_CAVLC(void);
    void DecodeMBFieldDecodingFlag(void);

    // Decode intra block types
    void DecodeIntraTypes4x4_CAVLC(IntraType *pMBIntraTypes, bool bUseConstrainedIntra);
    void DecodeIntraTypes8x8_CAVLC(IntraType *pMBIntraTypes, bool bUseConstrainedIntra);
    void DecodeIntraTypes4x4_CABAC(IntraType *pMBIntraTypes, bool bUseConstrainedIntra);
    void DecodeIntraTypes8x8_CABAC(IntraType *pMBIntraTypes, bool bUseConstrainedIntra);
    void DecodeIntraPredChromaMode_CABAC(void);

    void DecodeMBQPDelta_CABAC(void);
    void DecodeMBQPDelta_CAVLC(void);

    // Get colocated location
    Ipp32s GetColocatedLocation(H264DecoderFrame *pRefFrame, Ipp32s Field, Ipp32s &block, Ipp32s *scale = NULL);
    // Decode motion vectors
    void DecodeDirectMotionVectorsTemporal(bool is_direct_mb);

    // Decode motion vectors
    void DecodeDirectMotionVectorsTemporal_8x8Inference();
    // Compute  direct spatial reference indexes
    void ComputeDirectSpatialRefIdx(Ipp32s *pRefIndexL0, Ipp32s *pRefIndexL1);
    void GetRefIdx4x4_CABAC(const Ipp32u nActive,
                              const Ipp8u* pBlkIdx,
                              const Ipp8u*  pCodRIx,
                              Ipp32u ListNum);
    void GetRefIdx4x4_CABAC(const Ipp32u nActive,
                              const Ipp8u  pCodRIx,
                              Ipp32u ListNum);
    void GetRefIdx4x4_16x8_CABAC(const Ipp32u nActive,
                                const Ipp8u*  pCodRIx,
                                Ipp32u ListNum);
    void GetRefIdx4x4_8x16_CABAC(const Ipp32u nActive,
                                const Ipp8u*  pCodRIx,
                                Ipp32u ListNum);

    Ipp32s GetSE_RefIdx_CABAC(Ipp32u ListNum, Ipp32u BlockNum);

    H264DecoderMotionVector GetSE_MVD_CABAC(Ipp32u ListNum, Ipp32u BlockNum);

    // Get direct motion vectors
    void GetDirectTemporalMV(Ipp32s MBCol,
                             Ipp32u ipos,
                             H264DecoderMotionVector *& MVL0, // return colocated MV here
                             Ipp8s &RefIndexL0); // return ref index here
    void GetDirectTemporalMVFLD(Ipp32s MBCol,
                                Ipp32u ipos,
                                H264DecoderMotionVector *& MVL0, // return colocated MV here
                                Ipp8s &RefIndexL0); // return ref index here
    void GetDirectTemporalMVMBAFF(Ipp32s MBCol,
                                  Ipp32u ipos,
                                  H264DecoderMotionVector *& MVL0, // return colocated MV here
                                  Ipp8s &RefIndexL0); // return ref index here
    // Decode and return the coded block pattern.
    // Return 255 is there is an error in the CBP.
    Ipp32u DecodeCBP_CAVLC(Ipp32u color_format);
    Ipp32u DecodeCBP_CABAC(Ipp32u color_format);

    // Decode motion vector predictors
    void ComputeMotionVectorPredictors(Ipp8u ListNum,
                                       Ipp8s RefIndex, // reference index for this part
                                       Ipp32s block, // block or subblock number, depending on mbtype
                                       Ipp32s *pMVx, // resulting MV predictors
                                       Ipp32s *pMVy);
    // Decode slipped MB
    Ipp32u DecodeMBSkipFlag_CABAC(Ipp32s ctxIdx);
    Ipp32u DecodeMBSkipRun_CAVLC(void);

    // Get location functions
    void GetLeftLocationForCurrentMBLumaMBAFF(H264DecoderBlockLocation *Block,Ipp32s AdditionalDecrement=0);
    void GetTopLocationForCurrentMBLumaMBAFF(H264DecoderBlockLocation *Block,Ipp32s DeblockCalls);
    void GetTopLeftLocationForCurrentMBLumaMBAFF(H264DecoderBlockLocation *Block);
    void GetTopRightLocationForCurrentMBLumaMBAFF(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBLumaNonMBAFF(H264DecoderBlockLocation *Block);
    void GetTopLocationForCurrentMBLumaNonMBAFF(H264DecoderBlockLocation *Block);
    void GetTopLeftLocationForCurrentMBLumaNonMBAFF(H264DecoderBlockLocation *Block);
    void GetTopRightLocationForCurrentMBLumaNonMBAFF(H264DecoderBlockLocation *Block);

    void GetTopLocationForCurrentMBChromaMBAFFBMEH(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBChromaMBAFFBMEH(H264DecoderBlockLocation *Block);
    void GetTopLocationForCurrentMBChromaNonMBAFFBMEH(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBChromaNonMBAFFBMEH(H264DecoderBlockLocation *Block);

    void GetTopLocationForCurrentMBChromaMBAFFH2(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBChromaMBAFFH2(H264DecoderBlockLocation *Block);
    void GetTopLocationForCurrentMBChromaNonMBAFFH2(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBChromaNonMBAFFH2(H264DecoderBlockLocation *Block);

    void GetTopLocationForCurrentMBChromaMBAFFH4(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBChromaMBAFFH4(H264DecoderBlockLocation *Block);
    void GetTopLocationForCurrentMBChromaNonMBAFFH4(H264DecoderBlockLocation *Block);
    void GetLeftLocationForCurrentMBChromaNonMBAFFH4(H264DecoderBlockLocation *Block);

    CoeffsPtrCommon GetCoefficientsBuffer(Ipp32u nNum = 0);
    CoeffsPtrCommon m_pCoefficientsBuffer;
    Ipp32u m_nAllocatedCoefficientsBuffer;
    Ipp32s *m_pCoefficientsBufferExt;

    H264Bitstream *m_pBitStream;                                // (H264Bitstream *) pointer to bit stream object

    Ipp32s mb_width;                                            // (Ipp32s) width in MB
    Ipp32s mb_height;                                           // (Ipp32s) height in MB
    H264DecoderGlobalMacroblocksDescriptor *m_gmbinfo;
    H264DecoderLocalMacroblockDescriptor m_mbinfo;              // (H264DecoderLocalMacroblockDescriptor) local MB data
    Ipp32s m_CurMBAddr;                                         // (Ipp32s) current macroblock address
    Ipp32s m_PairMBAddr;                                        // (Ipp32s) pair macroblock address (MBAFF only)
    CoeffsPtrCommon m_pCoeffBlocksWrite;                        // (Ipp16s *) pointer to write buffer
    CoeffsPtrCommon m_pCoeffBlocksRead;                         // (Ipp16s *) pointer to read buffer

    Ipp32s bit_depth_luma;
    Ipp32s bit_depth_chroma;
    Ipp32s m_CurMB_X;                                           // (Ipp32s) horizontal position of MB
    Ipp32s m_CurMB_Y;                                           // (Ipp32s) vertical position of MB
    H264DecoderCurrentMacroblockDescriptor m_cur_mb;            // (H264DecoderCurrentMacroblockDescriptor) current MB info
    Ipp32s m_prev_dquant;
    bool m_bNeedToCheckMBSliceEdges;                            // (bool) flag to ...
    Ipp32s m_field_index;                                       // (Ipp32s) ordinal number of current field
    Ipp32s m_iSkipNextMacroblock;                               // (bool) the next macroblock shall be skipped

    // external data
    H264PicParamSet *m_pPicParamSet;                            // (H264PicParamSet *) pointer to current picture parameters sets
    H264SeqParamSet *m_pSeqParamSet;                            // (H264SeqParamSet *) pointer to current sequence parameters sets
    H264DecoderFrame *m_pCurrentFrame;        // (H264DecoderFrame *) pointer to frame being decoded
    IntraType *m_pMBIntraTypes;                                    // (Ipp32u *) pointer to array of intra types
    const PredWeightTable *m_pPredWeight[2];                          // (PredWeightTable *) pointer to forward/backward (0/1) prediction table
    //TaskSupplier * m_pTaskSupplier;

    //
    // Deblocking tools
    //

    // forward declaration of internal types
    typedef void (H264SegmentDecoder::*DeblockingFunction)(Ipp32s nMBAddr);
    typedef void (H264SegmentDecoder::*ChromaDeblockingFunction)(Ipp32u dir, DeblockingParameters *pParams);
    typedef void (H264SegmentDecoder::*ChromaDeblockingFunctionMBAFF)(DeblockingParametersMBAFF *pParams);

    static
    ChromaDeblockingFunction DeblockChroma[4];                      // (ChromaDeblockingFunction []) array of chroma deblocking functions
    static
    ChromaDeblockingFunctionMBAFF DeblockChromaVerticalMBAFF[4];    // (ChromaDeblockingFunctionMBAFF []) array of chroma deblocking functions
    static
    ChromaDeblockingFunctionMBAFF DeblockChromaHorizontalMBAFF[4];  // (ChromaDeblockingFunctionMBAFF []) array of chroma deblocking functions

    void DeblockInitialize();
    // Perform deblocking on whole frame.
    // It is possible only for Baseline profile.
    void DeblockFrame(Ipp32s nCurMBNumber, Ipp32s nMacroBlocksToDeblock);
    // Function to de-block partition of macro block row
    virtual void DeblockSegment(Ipp32s nCurMBNumber, Ipp32s nMacroBlocksToDeblock);

    //
    // Optimized deblocking functions
    //

    // Reset deblocking variables
    void ResetDeblockingVariables(DeblockingParameters *pParams);
    void ResetDeblockingVariablesMBAFF(DeblockingParametersMBAFF *pParams);
    // Function to do luma deblocking
    void DeblockLuma(Ipp32u dir, DeblockingParameters *pParams);
    void DeblockLumaVerticalMBAFF(DeblockingParametersMBAFF *pParams);
    void DeblockLumaHorizontalMBAFF(DeblockingParametersMBAFF *pParams);
    // Function to do chroma deblocking
    void DeblockChroma400(Ipp32u dir, DeblockingParameters *pParams);
    void DeblockChroma420(Ipp32u dir, DeblockingParameters *pParams);
    void DeblockChroma422(Ipp32u dir, DeblockingParameters *pParams);
    void DeblockChroma444(Ipp32u dir, DeblockingParameters *pParams);
    void DeblockChromaVerticalMBAFF400(DeblockingParametersMBAFF *pParams);
    void DeblockChromaVerticalMBAFF420(DeblockingParametersMBAFF *pParams);
    void DeblockChromaVerticalMBAFF422(DeblockingParametersMBAFF *pParams);
    void DeblockChromaVerticalMBAFF444(DeblockingParametersMBAFF *pParams);
    void DeblockChromaHorizontalMBAFF400(DeblockingParametersMBAFF *pParams);
    void DeblockChromaHorizontalMBAFF420(DeblockingParametersMBAFF *pParams);
    void DeblockChromaHorizontalMBAFF422(DeblockingParametersMBAFF *pParams);
    void DeblockChromaHorizontalMBAFF444(DeblockingParametersMBAFF *pParams);
    // Function to prepare deblocking parameters for mixed MB types
    void DeblockMacroblockMSlice(Ipp32s MBAddr);

    //
    // Function to do deblocking on I slices
    //

    void DeblockMacroblockISlice(Ipp32s MBAddr);
    void PrepareDeblockingParametersISlice(DeblockingParameters *pParams);
    void DeblockMacroblockISliceMBAFF(Ipp32s MBAddr);
    void PrepareDeblockingParametersISliceMBAFF(DeblockingParametersMBAFF *pParams);

    // obtain reference number for block
    Ipp32s GetReferencePSlice(Ipp32s iMBNum, Ipp32s iBlockNum);
    Ipp32s GetReferencesBSlice(Ipp32s iMBNum, Ipp32s iBlockNum, Ipp32s *pReferences);
    void PrepareDeblockingParametersIntern16x16Vert(DeblockingParameters *pParams);
    void PrepareDeblockingParametersIntern16x16Horz(DeblockingParameters *pParams);

    //
    // Function to do deblocking on P slices
    //

    void DeblockMacroblockPSlice(Ipp32s MBAddr);
    void DeblockMacroblockPSliceMBAFF(Ipp32s MBAddr);
    void PrepareDeblockingParametersPSlice(DeblockingParameters *pParams);
    void PrepareDeblockingParametersPSliceMBAFF(DeblockingParametersMBAFF *pParams);
    // Prepare deblocking parameters for macroblocks from P slice
    // MbPart is 16, MbPart of opposite direction is 16
    void PrepareDeblockingParametersPSlice16x16Vert(DeblockingParameters *pParams);
    void PrepareDeblockingParametersPSlice16x16Horz(DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblocks from P slice
    // MbPart is 8, MbPart of opposite direction is 16
    void PrepareDeblockingParametersPSlice8x16(Ipp32u dir, DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblocks from P slice
    // MbPart is 16, MbPart of opposite direction is 8
    void PrepareDeblockingParametersPSlice16x8(Ipp32u dir, DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblocks from P slice
    // MbParts of both directions are 4
    void PrepareDeblockingParametersPSlice4(Ipp32u dir, DeblockingParameters *pParams);
    void PrepareDeblockingParametersPSlice4MBAFFField(Ipp32u dir, DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblock from P slice,
    // which coded in frame mode, but above macroblock is coded in field mode
    void PrepareDeblockingParametersPSlice4MBAFFMixedExternalEdge(DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblock from P slice,
    // which coded in frame mode, but left macroblock is coded in field mode
    void PrepareDeblockingParametersPSlice4MBAFFComplexFrameExternalEdge(DeblockingParametersMBAFF *pParams);
    // Prepare deblocking parameters for macroblock from P slice,
    // which coded in field mode, but left macroblock is coded in frame mode
    void PrepareDeblockingParametersPSlice4MBAFFComplexFieldExternalEdge(DeblockingParametersMBAFF *pParams);

    //
    // Function to do deblocking on B slices
    //

    void DeblockMacroblockBSlice(Ipp32s MBAddr);
    void DeblockMacroblockBSliceMBAFF(Ipp32s MBAddr);
    void PrepareDeblockingParametersBSlice(DeblockingParameters *pParams);
    void PrepareDeblockingParametersBSliceMBAFF(DeblockingParametersMBAFF *pParams);
    // Prepare deblocking parameters for macroblocks from B slice
    // MbPart is 16, MbPart of opposite direction is 16
    void PrepareDeblockingParametersBSlice16x16Vert(DeblockingParameters *pParams);
    void PrepareDeblockingParametersBSlice16x16Horz(DeblockingParameters *pParams);
    void PrepareDeblockingParametersBSlice16(Ipp32u dir, DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblocks from B slice
    // MbPart is 8, MbPart of opposite direction is 16
    void PrepareDeblockingParametersBSlice8x16(Ipp32u dir, DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblocks from B slice
    // MbPart is 16, MbPart of opposite direction is 8
    void PrepareDeblockingParametersBSlice16x8(Ipp32u dir, DeblockingParameters *pParams);
    // Prepare deblocking parameters for macroblocks from B slice
    // MbParts of both directions are 4
    void PrepareDeblockingParametersBSlice4(Ipp32u dir, DeblockingParameters *pParams);
    void PrepareDeblockingParametersBSlice4MBAFFField(Ipp32u dir, DeblockingParameters *pParams);

    volatile
    bool m_bFrameDeblocking;                                    // (bool) frame deblocking flag

    Ipp32s m_iNumber;                                           // (Ipp32s) ordinal number of decoder
    H264Slice *m_pSlice;                                        // (H264Slice *) current slice pointer
    const H264SliceHeader *m_pSliceHeader;                      // (H264SliceHeader *) current slice header

    Ipp16u m_BufferForBackwardPrediction[16 * 16 * 3 + DEFAULT_ALIGN_VALUE]; // allocated buffer for backward prediction
    Ipp8u  *m_pPredictionBuffer;                                // pointer to aligned buffer for backward prediction

    TaskBroker * m_pTaskBroker;

    void DecodeDirectMotionVectorsTemporal8x8(Ipp32s mbCol, Ipp32s sboffset,
                                                              Ipp32s sb, bool &isAll4x4Same,
                                                              H264DecoderMotionVector * directMVs,
                                                              FactorArrayValue *pDistScaleFactorMV,
                                                              Ipp8s RefIndexL0, Ipp32s scale, Ipp32s scale_idx);


private:

    // we lock the assignment operator to avoid any
    // accasional assignments
    H264SegmentDecoder & operator = (H264SegmentDecoder &)
    {
        return *this;

    } // H264SegmentDecoder & operator = (H264SegmentDecoder &)
};

// codes used to indicate the coding state of each block
const Ipp8u CodNone = 0;    // no code
const Ipp8u CodInBS = 1;    // read code from bitstream
const Ipp8u CodLeft = 2;    // code same as left 4x4 subblock
const Ipp8u CodAbov = 3;    // code same as above 4x4 subblock
const Ipp8u CodSkip = 4;    // skip for direct mode

// declaration of const table(s)
extern const
Ipp8u CodeToMBTypeB[];
extern const
Ipp8u CodeToBDir[][2];
extern const
Ipp32s NIT2LIN[16];
extern const
Ipp32s SBTYPESIZE[5][4];
extern const
Ipp8u pCodFBD[5][4];
extern const
Ipp8u pCodTemplate[16];
extern const
Ipp32u sb_x[4][16];
extern const
Ipp32u sb_y[4][16];
extern const
Ipp32s sign_mask[2];

} // namespace UMC

#include "umc_h264_sd_inlines.h"

#endif /* __UMC_H264_SEGMENT_DECODER_H */
#endif // UMC_ENABLE_H264_VIDEO_DECODER
