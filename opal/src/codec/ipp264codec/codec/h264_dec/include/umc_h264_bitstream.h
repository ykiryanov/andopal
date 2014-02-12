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

#ifndef __UMC_H264_BITSTREAM_H_
#define __UMC_H264_BITSTREAM_H_

#include "ippvc.h"
#include "umc_structures.h"
#include "umc_dynamic_cast.h"
#include "umc_h264_dec_defs_dec.h"
#include "umc_h264_dec_tables.h"
#include "umc_h264_dec_internal_cabac.h"

#define h264Peek1Bit(current_data, offset) \
    ((current_data[0] >> (offset)) & 1)

#define h264Drop1Bit(current_data, offset) \
{ \
    offset -= 1; \
    if (offset < 0) \
    { \
        offset = 31; \
        current_data += 1; \
    } \
}

namespace UMC
{

// CABAC magic mode switcher.
// Just put it to 0 to switch fast CABAC decoding off.
#define CABAC_MAGIC_BITS 16

#ifdef STORE_CABAC_BITS
extern FILE *cabac_bits;
extern Ipp32s sym_cnt;
#endif

// NAL unit definitions
#define NAL_STORAGE_IDC_BITS   0x60
#define NAL_UNITTYPE_BITS      0x1f

#define NUM_BLOCK_TYPES        8
#define NUM_MB_TYPE_CTX       11
#define NUM_BLOCK_TYPE_CTX     9
#define NUM_MVD_CTX           10
#define NUM_REF_NO_CTX         6
#define NUM_DELTA_QAUNT_CTX    4
#define NUM_MB_AFF_CTX         4

#define NUM_INTRA_PRED_CTX             2
#define NUM_CR_INTRA_PRED_CTX          4
#define NUM_CBP_CTX                    4
#define NUM_BLOCK_CBP_CTX              4
#define NUM_SIGN_COEFF_FLAG_CTX       15
#define NUM_LAST_SIGN_COEFF_FLAG_CTX  15
#define NUM_COEF_ONE_LEVEL_CTX         5
#define NUM_COEF_ABS_LEVEL_CTX         5

// Declare CABAC context type
#pragma pack(1)
typedef struct CABAC_CONTEXT
{
    Ipp8u pStateIdxAndVal;                                      // (Ipp8u) probability state index and value of most probable symbol

} CABAC_CONTEXT;
#pragma pack()

class H264Bitstream
{
    DYNAMIC_CAST_DECL_BASE(H264Bitstream)

public:
    // Default constructor
    H264Bitstream(void);
    // Constructor
    H264Bitstream(Ipp8u * const pb, const Ipp32u maxsize);
    // Destructor
    ~H264Bitstream(void);

    // Initialize bitstream to decoding.
    // This method isn't required to headers parsing.
    bool Init(void);

    // Find next start code
    Status AdvanceToNextSCP(void);
    // Check amount of data
    bool More_RBSP_Data();

    // Align bitstream pointer to the right
    inline
    void AlignPointerRight();

    // Reset the bitstream with new data pointer
    void Reset(Ipp8u * const pb, const Ipp32u maxsize);
    void Reset(Ipp8u * const pb, Ipp32s offset, const Ipp32u maxsize);

    Ipp32s GetSCP();

    // Get type of current NAL
    Status GetNALUnitType(NAL_Unit_Type &uNALUnitType,
                          Ipp8u &uNALStorageIDC);

    // Decode sequence parameter set
    Status GetSequenceParamSet(H264SeqParamSet *sps);
    // Decode sequence parameter set extension
    Status GetSequenceParamSetExtension(H264SeqParamSetExtension *sps_ex);

    void GetScalingList4x4(H264ScalingList4x4 *scl, Ipp8u *def, Ipp8u *scl_type);
    void GetScalingList8x8(H264ScalingList8x8 *scl, Ipp8u *def, Ipp8u *scl_type);

    // Decoding picture's parameter set functions
    Status GetPictureParamSetPart1(H264PicParamSet *pps);
    Status GetPictureParamSetPart2(H264PicParamSet *pps, const H264SeqParamSet *sps);

    Status GetAccessUnitDelimiter(Ipp32u &PicCodType);

    Status ReadFillerData();
    void RollbackCurrentNALU();

    // Decoding slice header functions
    Status GetSliceHeaderPart1(H264SliceHeader *pSliceHeader);
    Status GetSliceHeaderPart2(H264SliceHeader *hdr, // slice header read goes here
                               const H264PicParamSet *pps,
                               bool bIsIDRSlice,
                               const H264SeqParamSet *sps,
                               Ipp8u NALRef_idc); // from slice header NAL unit

    Status GetSliceHeaderPart3(H264SliceHeader *hdr, // slice header read goes here
                               PredWeightTable *pPredWeight_L0, // L0 weight table goes here
                               PredWeightTable *pPredWeight_L1, // L1 weight table goes here
                               RefPicListReorderInfo *pReorderInfo_L0,
                               RefPicListReorderInfo *pReorderInfo_L1,
                               AdaptiveMarkingInfo *pAdaptiveMarkingInfo,
                               const H264PicParamSet *pps,
                               const H264SeqParamSet *sps,
                               Ipp8u NALRef_idc); // from slice header NAL unit

    // Parse SEI message
    Ipp32s ParseSEI(H264SeqParamSet **sps, Ipp32s current_sps, H264SEIPayLoad *spl);

    template <typename Coeffs> inline
    void GetCAVLCInfoLuma(Ipp32u uVLCSelect, // N, obtained from num coeffs of above/left blocks
                            Ipp32s uMaxNumCoeff,
                            Ipp16s &sNumCoeff,
                            Coeffs **ppPosCoefbuf, // buffer to return up to 16
                            Ipp32s field_flag)
    {
        // Calls CAVLC bitstream decoding functions to obtain nonzero coefficients
        // and related information, returning in passed buffers and passed-by-reference
        // parameters.
        // Bitstream pointer and offset are updated by called functions and are
        // updated on return.

        if (uVLCSelect < 2)
        {
            if (h264Peek1Bit(m_pbs, m_bitOffset))
            {
                h264Drop1Bit(m_pbs, m_bitOffset);
                sNumCoeff = 0;
                return;
            }
        }

        IppStatus ippRes;

        ippRes = DecodeCAVLCCoeffs_H264(&m_pbs,
                                        &m_bitOffset,
                                        &sNumCoeff,
                                        ppPosCoefbuf,
                                        uVLCSelect,
                                        (Ipp16s)uMaxNumCoeff,
                                        (const Ipp32s **) m_tblCoeffToken,
                                        (const Ipp32s **) m_tblTotalZeros,
                                        (const Ipp32s **) m_tblRunBefore,
                                        (Ipp32s*) mp_scan4x4[field_flag]);

        if (ippStsNoErr > ippRes)
            throw h264_exception(UMC_ERR_INVALID_STREAM);

    } // void GetCAVLCInfoLuma(Ipp32u uVLCSelect,

    template <typename Coeffs>
    void GetCAVLCInfoChroma0(Ipp16s &sNumCoeff, Coeffs **ppPosCoefbuf)
    {
        IppStatus ippRes = DecodeCAVLCChromaDcCoeffs_H264(&m_pbs,
                                                          &m_bitOffset,
                                                          &sNumCoeff,
                                                          ppPosCoefbuf,
                                                          m_tblCoeffToken[3],
                                                          (const Ipp32s **) m_tblTotalZerosCR,
                                                          (const Ipp32s **) m_tblRunBefore);

        if (ippStsNoErr > ippRes)
            throw h264_exception(UMC_ERR_INVALID_STREAM);

    } // void GetCAVLCInfoChroma0(Ipp16s &sNumCoeff,


    template <typename Coeffs>
    void GetCAVLCInfoChroma2(Ipp16s &sNumCoeff, Coeffs **ppPosCoefbuf)
    {
        IppStatus ippRes = DecodeCAVLCChromaDcCoeffs422_H264(&m_pbs,
                                                             &m_bitOffset,
                                                             &sNumCoeff,
                                                             ppPosCoefbuf,
                                                             m_tblCoeffToken[4],
                                                             (const Ipp32s **) m_tblTotalZerosCR422,
                                                             (const Ipp32s **) m_tblRunBefore);
        if (ippStsNoErr > ippRes)
            throw h264_exception(UMC_ERR_INVALID_STREAM);
    } // void GetCAVLCInfoChroma2(Ipp16s &sNumCoeff,


    template <typename Coeffs>
    void GetCAVLCInfoChroma4(Ipp16s &sNumCoeff, Coeffs **ppPosCoefbuf,
                           Ipp8u field_flag)
    {
        IppStatus ippRes = DecodeCAVLCCoeffs_H264(&m_pbs,
                                                  &m_bitOffset,
                                                  &sNumCoeff,
                                                  ppPosCoefbuf,
                                                  0,
                                                  16,
                                                  (const Ipp32s **) m_tblCoeffToken,
                                                  (const Ipp32s **) m_tblTotalZeros,
                                                  (const Ipp32s **) m_tblRunBefore,
                                                  (Ipp32s*)mp_scan4x4[field_flag]);

        if (ippStsNoErr > ippRes)
            throw h264_exception(UMC_ERR_INVALID_STREAM);
    } // void GetCAVLCInfoChroma4(Ipp16s &sNumCoeff,


    void GetOrg(Ipp32u **pbs, Ipp32u *size);
    void GetState(Ipp32u **pbs, Ipp32u *bitOffset);
    void SetState(Ipp32u *pbs, Ipp32u bitOffset);

    // Read one VLC Ipp32s or Ipp32u value from bitstream
    inline
    Ipp32s GetVLCElement(bool bIsSigned);

    // Reads bits from buffer.
    inline
    Ipp32u GetBits(const Ipp32u nbits);

    // Reads one bit from the buffer.
    inline
    Ipp32u Get1Bit();

    // Searches for a code with known number of bits.
    bool SearchBits(const Ipp32u nbits,
                    const Ipp32u code,
                    const Ipp32u lookahead);
    bool NextBit();

    // Set current decoding position
    void SetDecodedBytes(size_t);

    inline
    size_t BytesDecoded()
    {
        return static_cast<size_t>((Ipp8u*)m_pbs - (Ipp8u*)m_pbsBase) +
                ((31 - m_bitOffset) >> 3);
    }
    inline
    size_t BytesLeft()
    {
        return((Ipp32s)m_maxBsSize - (Ipp32s) BytesDecoded());
    }

    inline size_t GetAllBitsCount()
    {
        return m_maxBsSize;
    }

    inline
    size_t BytesDecodedRoundOff()
    {
        return static_cast<size_t>((Ipp8u*)m_pbs - (Ipp8u*)m_pbsBase);
    }

    //
    // CABAC decoding function(s)
    //

    // Initialize CABAC decoding engine
    void InitializeDecodingEngine_CABAC(void);
    // Terminate CABAC decoding engine, rollback prereaded bits
    void TerminateDecode_CABAC(void);

    // Initialize CABAC context(s) in intra slices
    void InitializeContextVariablesIntra_CABAC(Ipp32s SliceQPy);

    // Initialize CABAC context(s) in inter slices
    void InitializeContextVariablesInter_CABAC(Ipp32s SliceQPy,
                                               Ipp32s cabac_init_idc);

    // Decode order of single bins
    Ipp32u DecodeSingleBinOnes_CABAC(Ipp32u ctxIdx,
                                     Ipp32s &binIdx);

    // Decode Ipp32s coefficient value
    Ipp32s DecodeSignedLevel_CABAC(Ipp32u ctxIdxOffset,
                                   Ipp32u &numDecodAbsLevelEq1,
                                   Ipp32u &numDecodAbsLevelGt1,
                                   Ipp32u max_value);
    Ipp32s DecodeSingleSignedLevel_CABAC(Ipp32u ctxIdxOffset);

    // Decode single bin from stream
    inline
    Ipp32u DecodeSingleBin_CABAC(Ipp32u ctxIdx);

    // Decode single bin using bypass decoding
    inline
    Ipp32u DecodeBypass_CABAC();

    inline
    Ipp32s DecodeBypassSign_CABAC(Ipp32s val);

    // Decode multiple bins using bypass decoding until ==1
    inline
    Ipp32u DecodeBypassOnes_CABAC();

    // Decode end symbol
    inline
    Ipp32u DecodeSymbolEnd_CABAC();

    template <typename Coeffs>
    void ResidualBlock8x8_CABAC(bool field_decoding_flag,
                                const Ipp32s *single_scan,
                                Coeffs *pPosCoefbuf)
    {
        // See subclause 7.3.5.3.2 of H.264 standard
        Ipp32u ctxIdxOffset, ctxIdxInc, ctxIdxOffsetLast;
        Ipp32u numDecodAbsLevelEq1 = 0, numDecodAbsLevelGt1 = 0;
        const Ipp32u *ctxIdxBase;
        const Ipp32s* pHPFF = hp_CtxIdxInc_sig_coeff_flag[field_decoding_flag];

        Ipp32s maxNumCoeffminus1 = 63;
        Ipp32u ncoefs = 0;
        Ipp32s i = 0;
        Ipp16s coeffRuns[65];

    #ifdef __ICL
        __assume_aligned(pPosCoefbuf, 8);
    #endif
        memset(pPosCoefbuf, 0, sizeof(Coeffs) * 64);

        // See table 9-32 of H.264 standard
        if (field_decoding_flag)
            ctxIdxBase = ctxIdxOffset8x8FieldCoded;
        else
            ctxIdxBase = ctxIdxOffset8x8FrameCoded;

        ctxIdxOffset = ctxIdxBase[SIGNIFICANT_COEFF_FLAG] +
            ctxIdxBlockCatOffset[SIGNIFICANT_COEFF_FLAG][BLOCK_LUMA8X8_LEVELS];
        ctxIdxOffsetLast = ctxIdxBase[LAST_SIGNIFICANT_COEFF_FLAG] +
            ctxIdxBlockCatOffset[LAST_SIGNIFICANT_COEFF_FLAG][BLOCK_LUMA8X8_LEVELS];

        for (; i < maxNumCoeffminus1; i++)
        {
            ctxIdxInc = pHPFF[i];
            // get significant_coeff_flag
            if (DecodeSingleBin_CABAC(ctxIdxOffset+ctxIdxInc))
            {
                // store position of non-zero coeff
                coeffRuns[ncoefs] = (Ipp16s) i;
                // Intel compiler should use memory form of increment
                ncoefs ++;
                ctxIdxInc = hp_CtxIdxInc_last_sig_coeff_flag[i];
                // get last_significant_coeff_flag
                if (DecodeSingleBin_CABAC(ctxIdxOffsetLast+ctxIdxInc)) break;
            }
        }

        if (i == maxNumCoeffminus1)
        {
            coeffRuns[ncoefs] = (Ipp16s) i;
            ncoefs ++;
        }

        // calculate last coefficient in block
        ctxIdxOffset = ctxIdxBase[COEFF_ABS_LEVEL_MINUS1] +
            ctxIdxBlockCatOffset[COEFF_ABS_LEVEL_MINUS1][BLOCK_LUMA8X8_LEVELS];

        for (; ncoefs > 0; ncoefs--)
        {
            Ipp32s level = DecodeSignedLevel_CABAC(ctxIdxOffset,
                                                   numDecodAbsLevelEq1,
                                                   numDecodAbsLevelGt1,9);

            // store coeff position and level to coeff buffer
            Ipp32u pos = coeffRuns[ncoefs - 1];
            pos = single_scan[pos];

            pPosCoefbuf[pos] = (Ipp16s) level;
        }

    } // void ResidualBlock8x8_CABAC(bool field_decoding_flag,

    template <typename Coeffs>
    void ResidualBlock4x4_CABAC(Ipp32s ctxBlockCat,
                                const Ipp32u *ctxIdxBase,
                                const Ipp32s *pScan,
                                Coeffs *pPosCoefbuf,
                                Ipp32s maxNumCoeffminus1)
    {
        // See subclause 7.3.5.3.2 of H.264 standard
        Coeffs coeffRuns[18];
        Ipp32s iNumCoeffs;

        // See table 9-32 of H.264 standard
    #ifdef __ICL
        __assume_aligned(pPosCoefbuf, 8);
    #endif

        // reset destination block
        memset(pPosCoefbuf, 0, sizeof(Coeffs) * 16);

        // decode coefficient(s)
        {
            Ipp32u ctxIdxOffset, ctxIdxOffsetLast;
            Ipp32s i = 0;

            ctxIdxOffset = ctxIdxBase[SIGNIFICANT_COEFF_FLAG] +
                           ctxIdxBlockCatOffset[SIGNIFICANT_COEFF_FLAG][ctxBlockCat];
            ctxIdxOffsetLast = ctxIdxBase[LAST_SIGNIFICANT_COEFF_FLAG] +
                               ctxIdxBlockCatOffset[LAST_SIGNIFICANT_COEFF_FLAG][ctxBlockCat];

            iNumCoeffs = 0;
            do
            {
                // get significant_coeff_flag
                if (DecodeSingleBin_CABAC(ctxIdxOffset + i))
                {
                    // store position of non-zero coeff
                    coeffRuns[iNumCoeffs] = (Ipp16s) i;
                    // Intel compiler should use memory form of increment
                    iNumCoeffs += 1;
                    // get last_significant_coeff_flag
                    if (DecodeSingleBin_CABAC(ctxIdxOffsetLast + i))
                    {
                        // I know "label jumping" is bad programming style,
                        // but there is no another opportunity to avoid extra comparison.
                        goto no_more_coefficients_label;
                    }
                }

            } while (++i < maxNumCoeffminus1);

            // take into account last coefficient
            coeffRuns[iNumCoeffs] = (Ipp16s) maxNumCoeffminus1;
            iNumCoeffs += 1;
        }

no_more_coefficients_label:

        if (1 == iNumCoeffs)
        {
            Ipp32u ctxIdxOffset;

            // calculate last coefficient in block
            ctxIdxOffset = ctxIdxBase[COEFF_ABS_LEVEL_MINUS1] +
                           ctxIdxBlockCatOffset[COEFF_ABS_LEVEL_MINUS1][ctxBlockCat];

            Ipp32s level = DecodeSingleSignedLevel_CABAC(ctxIdxOffset);

            // store coeff to coeff buffer
            Ipp32s pos = pScan[coeffRuns[0] + 15 - maxNumCoeffminus1];
            pPosCoefbuf[pos] = (Coeffs) level;

        }
        // reorder coefficient(s)
        else
        {
            Ipp32u numDecodAbsLevelEq1 = 0, numDecodAbsLevelGt1 = 0;
            Ipp32u ctxIdxOffset;

            // calculate last coefficient in block
            ctxIdxOffset = ctxIdxBase[COEFF_ABS_LEVEL_MINUS1] +
                           ctxIdxBlockCatOffset[COEFF_ABS_LEVEL_MINUS1][ctxBlockCat];

            do
            {
                Ipp32s level = DecodeSignedLevel_CABAC(ctxIdxOffset,
                                                       numDecodAbsLevelEq1,
                                                       numDecodAbsLevelGt1,
                                                       9);

                // store coeff to coeff buffer
                Ipp32s pos = coeffRuns[iNumCoeffs - 1];

                pos = pScan[pos + 15 - maxNumCoeffminus1];

                pPosCoefbuf[pos] = (Coeffs) level;

            } while (0 < --iNumCoeffs);
        }

    } // void ResidualBlock4x4_CABAC(H264BitStream *pBitStream,

protected:
    Status GetVUIParam(H264SeqParamSet *sps);
    Status GetHRDParam(H264SeqParamSet *sps);
    // Initialize bitstream tables
    Status InitTables(void);
    // Release bitstream tables
    void ReleaseTables(void);

    Ipp32u *m_pbs;                                              // (Ipp32u *) pointer to the current position of the buffer.
    Ipp32s m_bitOffset;                                         // (Ipp32s) the bit position (0 to 31) in the dword pointed by m_pbs.
    Ipp32u *m_pbsBase;                                          // (Ipp32u *) pointer to the first byte of the buffer.
    Ipp32u m_maxBsSize;                                         // (Ipp32u) maximum buffer size in bytes.

    IppVCHuffmanSpec_32s *(m_tblCoeffToken[5]);
    IppVCHuffmanSpec_32s *(m_tblRunBefore [16]);
    IppVCHuffmanSpec_32s *(m_tblTotalZeros[16]);

    IppVCHuffmanSpec_32s *(m_tblTotalZerosCR[4]);
    IppVCHuffmanSpec_32s *(m_tblTotalZerosCR422[8]);
    bool m_bTablesInited;                                       // (bool) tables have been allocated

    CABAC_CONTEXT context_array[460];                           // (CABAC_CONTEXT []) array of cabac context(s)
    Ipp32u m_lcodIRange;                                        // (Ipp32u) arithmetic decoding engine variable
    Ipp32u m_lcodIOffset;                                       // (Ipp32u) arithmetic decoding engine variable
    Ipp32s m_iMagicBits;                                        // (Ipp32s) available extra CABAC bits
    Ipp16u *m_pMagicBits;                                       // (Ipp16u *) pointer to CABAC data

    // Decoding SEI message functions
    Ipp32s sei_message(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s sei_payload(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s buffering_period(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s pic_timing(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s pan_scan_rect(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s filler_payload(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s user_data_registered_itu_t_t35(H264SeqParamSet **sps, Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s user_data_unregistered(H264SeqParamSet **sps, Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s recovery_point(H264SeqParamSet **sps, Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s dec_ref_pic_marking_repetition(H264SeqParamSet **sps, Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s spare_pic(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s scene_info(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s sub_seq_info(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s sub_seq_layer_characteristics(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s sub_seq_characteristics(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s full_frame_freeze(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s full_frame_freeze_release(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s full_frame_snapshot(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s progressive_refinement_segment_start(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s progressive_refinement_segment_end(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s motion_constrained_slice_group_set(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s reserved_sei_message(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
    Ipp32s unparsed_sei_message(H264SeqParamSet **sps,Ipp32s current_sps,H264SEIPayLoad *spl);
};

// disable the "conditional expression is constant" warning
#pragma warning(disable: 4127)

template <typename Coeffs, Ipp32s color_format>
class BitStreamColorSpecific
{
public:
    typedef Coeffs * CoeffsPtr;

    static inline void ResidualChromaDCBlock_CABAC(const Ipp32u *ctxIdxBase, const Ipp32s *single_scan,
                                                   Coeffs *pPosCoefbuf, H264Bitstream * bs)
    {
        // See subclause 7.3.5.3.2 of H.264 standard
        Ipp32s coef_ctr=-1;
        Ipp32s maxNumCoeffminus1;
        Ipp32u ctxIdxOffset, ctxIdxOffsetLast;
        Ipp32u numDecodAbsLevelEq1 = 0, numDecodAbsLevelGt1 = 0;
        Ipp16s coeffRuns[18];

        Ipp32s numOfCoeffs = 0;
        switch (color_format)
        {
        case 1:
            numOfCoeffs = 4;
            break;
        case 2:
            numOfCoeffs = 8;
            break;
        case 3:
            numOfCoeffs = 16;
            break;
        };

        // See table 9-32 of H.264 standard
    #ifdef __ICL
        __assume_aligned(pPosCoefbuf, 8);
    #endif
        memset(pPosCoefbuf, 0, sizeof(Coeffs) * numOfCoeffs);
        maxNumCoeffminus1 = numOfCoeffs - 1;

        ctxIdxOffset = ctxIdxBase[SIGNIFICANT_COEFF_FLAG] +
            ctxIdxBlockCatOffset[SIGNIFICANT_COEFF_FLAG][BLOCK_CHROMA_DC_LEVELS + color_format];
        ctxIdxOffsetLast = ctxIdxBase[LAST_SIGNIFICANT_COEFF_FLAG] +
            ctxIdxBlockCatOffset[LAST_SIGNIFICANT_COEFF_FLAG][BLOCK_CHROMA_DC_LEVELS + color_format];

        Ipp32u ncoefs = 0;
        Ipp32s i = 0;
        for (; i < maxNumCoeffminus1; i++)
        {
            Ipp32s k;

            if (color_format == 1)
                k = i;
            else
                k = IPP_MIN(i >> (3 & (color_format - 1)), 2);

            // get significant_coeff_flag
            if (bs->DecodeSingleBin_CABAC(ctxIdxOffset+k))
            {
                // store position of non-zero coeff
                coeffRuns[ncoefs] = (Ipp16s) i;
                // Intel compiler should use memory form of increment
                ncoefs ++;
                // get last_significant_coeff_flag
                if (bs->DecodeSingleBin_CABAC(ctxIdxOffsetLast + k))
                    break;
            }
        }

        if (i == maxNumCoeffminus1)
        {
            coeffRuns[ncoefs] = (Ipp16s) i;
            ncoefs ++;
        }

        // calculate last coefficient in block
        ctxIdxOffset = ctxIdxBase[COEFF_ABS_LEVEL_MINUS1] +
            ctxIdxBlockCatOffset[COEFF_ABS_LEVEL_MINUS1][BLOCK_CHROMA_DC_LEVELS + color_format];

        for (; ncoefs > 0; ncoefs--)
        {
            Ipp32s level = bs->DecodeSignedLevel_CABAC(ctxIdxOffset,
                                                       numDecodAbsLevelEq1,
                                                       numDecodAbsLevelGt1,8);

            // store coeff position and level to coeff buffer
            Ipp32u pos = coeffRuns[ncoefs - 1] + coef_ctr + 1;

            if (color_format != 1)
                pos = single_scan[pos];

            pPosCoefbuf[pos] = (Coeffs) level;
        }

    } // void H264Bitstream::ResidualChromaDCBlock_CABAC(const Ipp32u *ctxIdxBase,
};
#pragma warning(default: 4127)


void SetDefaultScalingLists(H264SeqParamSet * sps);

inline
void FillFlatScalingList4x4(H264ScalingList4x4 *scl)
{
    for (Ipp32s i=0;i<16;i++)
        scl->ScalingListCoeffs[i] = 16;
}

inline
void FillFlatScalingList8x8(H264ScalingList8x8 *scl)
{
    for (Ipp32s i=0;i<64;i++)
        scl->ScalingListCoeffs[i] = 16;
}

inline
void FillScalingList4x4(H264ScalingList4x4 *scl_dst,Ipp8u *coefs_src)
{
    for (Ipp32s i=0;i<16;i++)
        scl_dst->ScalingListCoeffs[i] = coefs_src[i];
}

inline
void FillScalingList8x8(H264ScalingList8x8 *scl_dst,Ipp8u *coefs_src)
{
    for (Ipp32s i=0;i<64;i++)
        scl_dst->ScalingListCoeffs[i] = coefs_src[i];
}


} // namespace UMC

#include "umc_h264_bitstream_inlines.h"

#endif // __UMC_H264_BITSTREAM_H_

#endif // UMC_ENABLE_H264_VIDEO_DECODER
