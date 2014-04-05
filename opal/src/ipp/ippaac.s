//
//  ippaac.s
//  Player
//
//  Created by Sergey Bezruchkin on 10/27/13.
//  Copyright (c) 2013 Sergey Bezruchkin. All rights reserved.
//
#if defined __i386__
#else
.macro gl
.globl $0
$0:
.endmacro

.macro redirect
.globl $0
$0:
b $1:
.endmacro

.data
.align  4


.text
.align  4

gl ippsVLCDecodeInit_32s
gl ippsVLCDecodeBlock_1u16s

#include "ipps/ippsMove_32f.s"
#include "ipps/ippsAdd_32f.s"
#include "ipps/ippsAdd_32s_Sfs.s"
#include "ipps/ippsAdd_32f_I.s"
#include "ipps/ippsAdd_32fc_I.s"
#include "ipps/ippsMul_32f.s"
#include "ipps/ippsZero_32f.s"
#include "ipps/ippsZero_32fc.s"
#include "ipps/ippsMin_32s.s"
#include "ipps/ippsMax_32s.s"
#include "ipps/ippsMulC_32f.s"
#include "ipps/ippsMulC_32f_I.s"
#include "ipps/ippsCopy_32fc.s"
#include "ipps/ippsCopy_32f.s"
#include "ipps/ippsCopy_32s.s"
#include "ipps/ippsSet_32s.s"
#include "ipps/ippsSub_32f.s"
#include "ipps/ippsSub_32fc.s"
#include "ipps/ippsSub_32s_Sfs.s"
#include "ipps/ippsLShiftC_32s_I.s"
//#include "ipps/ippsScale_32f_I.s"
#include "ipps/ippsAddProductC_32f.s"
#include "ipps/ippsJoin_32f16s_D2L.s"
#include "ipps/ownsCopy_8u.s"
//#include "ipps/ippsZero_8u.s"
#include "ipps/ippsMul_32f_I.s"
#include "ipps/truncdfsf2.s"
#include "ipps/sgl_lt.s"
#include "ipps/sgl_add.s"
#include "ipps/sgl_eq.s"
#include "ipps/sgl_gt.s"
#include "ipps/sglmul.s"
#include "ipps/floatsisf.s"
//#include "ipps/dbl_sqrt.s"
#include "ipps/ippsSortAscend_32s_I.s"
#include "ipps/fixsfsi.s"

#include "ippdc/ippsVLCDecodeInit_32s.s"
#include "ippdc/ippsVLCDecodeBlock_1u16s.s"
#include "ippdc/ippsVLCDecodeEscBlock_AAC_1u16s.s"
#include "ippdc/ippsVLCDecodeUTupleEscBlock_AAC_1u16s.s"
#include "ippdc/ippsVLCDecodeOne_1u16s.s"

//#include "ippdc/ippsPredictCoef_SBR_C_32fc_D2L.s"
//#include "ippdc/ippsAnalysisFilterInit_SBR_RToR_32f.s"
//#include "ippdc/ippsSynthesisFilterInit_SBR_RToR_32f.s"
//#include "ippdc/ippsSynthesisFilterGetSize_SBR_CToR_32fc32f.s"
//#include "ippdc/ippsSynthesisDownFilterInit_SBR_RToR_32f.s"
//#include "ippdc/ippsSynthesisDownFilterGetSize_SBR_RToR_32f.s"
//#include "ippdc/ippsSynthesisFilterInit_SBR_CToR_32fc32f.s"
//#include "ippdc/ippsSynthesisDownFilter_SBR_CToR_32fc32f_D2L.s"
//#include "ippdc/ippsSynthesisDownFilterInit_SBR_CToR_32fc32f.s"
//#include "ippdc/ippsAnalysisFilter_SBR_RToC_32f32fc_D2L.s"
//#include "ippdc/ippsAnalysisFilterGetSize_SBR_RToC_32f32fc.s"
#include "ippdc/ippsMDCTInv_32f.s"
#include "ippdc/ippsMDCTFwd_32f.s"
#include "ippdc/ippsMDCTFwdGetSize_32f.s"
#include "ippdc/ippsMDCTInvInit_32f.s"
#include "ippdc/ippsPow43_16s32f.s"
#include "ippdc/ippsFDPResetGroup_32f.s"
#include "ippdc/ippsCalcSF_16s32f.s"
#include "ippdc/ippsFDPReset_32f.s"
#include "ippdc/ippsMDCTInvGetSize_32f.s"
#include "ippdc/ippsFDPInv_32f_I.s"
#include "ippdc/ippsFDPInit_32f.s"
#include "ippdc/ippsFDPGetSize_32f.s"
#include "ippdc/ippsMDCTFwdInit_32f.s"
#include "ippdc/ippsScale_32f_I.s"
#include "ippdc/_ownsZero_8u.s"
#include "ippdc/ippsDecodeMsStereo_AAC_32s_I.s"
#include "ippdc/ownsDecodeMsMatrix_AAC.s"
#include "ippdc/ippsDecodeIsStereo_AAC_32s.s"
#include "ippdc/ippsUnpackADIFHeader_AAC.s"
#include "ippdc/ippsNoiselessDecoder_LC_AAC.s"
#include "ippdc/ippsMDCTInv_AAC_32s16s.s"
#include "ippdc/ippsUnpackADTSFrameHeader_AAC.s"
#include "ippdc/ownsPcmAudioOutput_32s16s.s"
#include "ippdc/ownsOverlapAdd_LongStart_32s.s"
#include "ippdc/ownsOverlapAdd_Short_32s.s"
#include "ippdc/ownsDecodeSectData_AAC.s"
#include "ippdc/ownsDecodePulseData_AAC.s"
#include "ippdc/ownsMDCTInv_Radix2_32s.s"
#include "ippdc/ownsUnpackIcsInfo_AAC.s"
#include "ippdc/ownsDecodeTnsData_AAC.s"
#include "ippdc/ownsDecodeSpectralData_AAC_1u32s.s"
#include "ippdc/ownsAddPulseData_AAC.s"
#include "ippdc/ownsGetBits_AAC.s"
//#include "ippdc/ippsDecodePrgCfgElt_AAC.s"
#include "ippdc/ownsDecodeScalefactor_AAC_1u16s.s"
#include "ippdc/ownsOverlapAdd_LongStop_32s.s"
#include "ippdc/ownsOverlapAdd_Long_32s.s"
#include "ippdc/ownsDecodeIsCore_AAC.s"
#include "ippdc/ippsDecodePrgCfgElt_AAC.s"
#include "ippdc/ownsDecodeSpecHuf_AAC.s"
#include "ippdc/ownsByteAlign_AAC.s"
#include "ippdc/ownsIMDCT_FFT_32sc_I.s"
#include "ippdc/ippsDecodeChanPairElt_AAC.s"
#include "ippdc/ippsDecodeFillElt_AAC.s"
#include "ippdc/ippsDecodeDatStrElt_AAC.s"
#include "ippdc/ippsDeinterleaveSpectrum_AAC_32s.s"
#include "ippdc/ippsQuantInv_AAC_32s_I.s"
#include "ippdc/ownsReqCore_AAC_I.s"
#include "ippdc/ippsDecodeTNS_AAC_32s_I.s"
#include "ippdc/ownsTnsArFilter.s"
#include "ippdc/ownsTnsDecodeCoef.s"
#include "ippdc/ownsTnsMaFilter.s"

//  "_ippsSynthesisDownFilterGetSize_SBR_CToR_32fc32f", referenced from:
//      _sbrdecGetFilterSize in libBoneKitPlayer.a(sbr_dec_filter_qmf_fp.o)
//  "_ippsAnalysisFilterInit_SBR_RToC_32f32fc", referenced from:
//      _sbrdecInitFilter in libBoneKitPlayer.a(sbr_dec_filter_qmf_fp.o)
//  "_ippsAnalysisFilter_SBR_RToR_32f_D2L", referenced from:
//      _sbrGetFrame in libBoneKitPlayer.a(aac_dec_sbr_fp.o)
//  "_ippsAnalysisFilterGetSize_SBR_RToR_32f", referenced from:
//      _sbrdecGetFilterSize in libBoneKitPlayer.a(sbr_dec_filter_qmf_fp.o)
//  "_ippsSynthesisFilterGetSize_SBR_RToR_32f", referenced from:
//      _sbrdecGetFilterSize in libBoneKitPlayer.a(sbr_dec_filter_qmf_fp.o)
//  "_ippsSynthesisFilter_SBR_CToR_32fc32f_D2L", referenced from:
//      _sbrGetFrame in libBoneKitPlayer.a(aac_dec_sbr_fp.o)
//  "_ippsSynthesisDownFilter_SBR_RToR_32f_D2L", referenced from:
//      _sbrGetFrame in libBoneKitPlayer.a(aac_dec_sbr_fp.o)
//  "_ippsSynthesisFilter_SBR_RToR_32f_D2L", referenced from:
//      _sbrGetFrame in libBoneKitPlayer.a(aac_dec_sbr_fp.o)

#endif
