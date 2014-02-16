#if defined __i386__
#else

.cpu cortex-a9

.macro gl arg0
		.globl \arg0
\arg0:				
.endm

.macro redirect arg0
		.globl \arg0
\arg0:				
		b $1:
.endm

		.data
        .align  4
MyAlloc:
		.long	0
MyFree:
		.long	0
		
	.text
	
		.globl  _IppSetAllocAndFree
        .globl  _ippsMalloc_8s
		.globl	_ippsMalloc_8u
		.globl  _ippMalloc
        .globl  _ippFree
        .globl  _ippsFree


_IppSetAllocAndFree:
		ldr		r2, allocPtr
		str		r0, [r2]
		ldr		r2, freePtr
		str		r1, [r2]
		bx		lr

_ippMalloc:
_ippsMalloc_8s:
_ippsMalloc_8u:
		ldr		r1, allocPtr
		ldr		r1, [r1]
		bx		r1
allocPtr:
		.long	MyAlloc

_ippsFree:
_ippFree:
		ldr		r1, freePtr
		ldr		r1, [r1]
		bx		r1
freePtr:		
		.long	MyFree

@//.include "ipps/ippsFree.s"
@//.include "ipps/ippsMalloc_8s.s"
 
.include "ipps/ashldi3.s"
.include "ipps/ashrdi3.s"
.include "ipps/int32_divide.s"
.include "ipps/int32_remainder.s"
.include "ipps/intel_memset.s"
.include "ipps/divmod0.s"
.include "ipps/ippsAbs_16s.s"
.include "ipps/ippsAdd_16s.s"
.include "ipps/ippsAbs_16s_I.s"
.include "ipps/ippsAutoCorr_NormE_16s32s.s"
.include "ipps/ippsAutoCorr_G729_16s32s_Sfs.s"
.include "ipps/intel_memcpy.s"
.include "ipps/memcpy.s"
.include "ipps/c_memset.s"
.include "ipps/ippsCopy_8u.s"
        
.include "ippGA/UpdCoefsa.s"
.include "ippGA/CntlrUpd.s"
.include "ippGA/FltNLMSa.s"
.include "ippGA/StpSzUpd.s"
.include "ippGA/Shared.s"
.include "ippGA/ippsAddWeightedQ31_32s.s"

        
@//gl ippsAutoCorr_NormE_16s32s
@//.include "ipps/ippsAutoCorr_G729_16s32s_Sfs.s"
@//fsAutoCorr_G729_16s32s_Sfs
.include "ipps/owncts_nosplit.s"
@//gl NormTable
@//gl NormTable2
@//gl _Fun1


.include "ipps/ippsCopy_16s.s"
.include "ipps/ippiCopy_8u_C1R.s"
.include "ipps/ippsDecodeAdaptiveVector_G729_16s_I.s"
.include "ipps/ippsDecodeGain_G729I_16s.s"
.include "ipps/ippsDecodeGain_G729_16s.s"
.include "ipps/ippsDotProd_16s32s_Sfs.s"
.include "ipps/ippsSub_16s.s"
.include "ipps/ippsSub_16s_I.s"
.include "ipps/ippsAddC_16s_I.s"
.include "ipps/ippsAdd_16s_ISfs.s"
.include "ipps/ippsLShiftC_16s.s"                
.include "ipps/ippsLShiftC_16s_I.s"
.include "ipps/ippsMax_16s.s"
.include "ipps/ippsMin_16s.s"
.include "ipps/ippsMulC_NR_16s_Sfs.s"
.include "ipps/ippsRShiftC_16s.s"
.include "ipps/ippsAdd_16s_I.s"
.include "ipps/ippsSynthesisFilterLow_NR_16s_ISfs.s"
.include "ipps/ippsSynthesisFilterZeroStateResponse_NR_16s.s"
.include "ipps/ippsSynthesisFilter_NR_16s_ISfs.s"
.include "ipps/ippsToeplizMatrix_G729_16s32s.s"
.include "ipps/ippsGainControl_G729A_16s_I.s"
.include "ipps/ippsGainControl_G729_16s_I.s"
.include "ipps/ippsHarmonicFilter_16s_I.s"
.include "ipps/ippsHighPassFilterInit_G729.s"
.include "ipps/ippsHighPassFilterSize_G729.s"
.include "ipps/ippsHighPassFilter_G729_16s_ISfs.s"
.include "ipps/ippsInterpolateC_G729_16s_Sfs.s"
.include "ipps/ippsInterpolateC_NR_G729_16s_Sfs.s"
.include "ipps/ippsInterpolate_G729_16s.s"
.include "ipps/ippsInvSqrt_32s_I.s"
.include "ipps/ippsLSFDecodeErased_G729_16s.s"
.include "ipps/ippsLSFDecode_G729B_16s.s"
.include "ipps/ippsLSFDecode_G729_16s.s"
.include "ipps/ippsLSFToLSP_G729_16s.s"
.include "ipps/ippsLevinsonDurbin_G729_32s16s.s"  
.include "ipps/ownps_DotProd_16s16s.s"            
.include "ipps/ownCalcG0_G729A_16s.s"            
.include "ipps/ownCalcGain_G729A_16s.s"    
.include "ipps/ownGainPredict.s"    
.include "ipps/ownGainUpdateErasure.s"    
.include "ipps/ownLSFToLSP_16s.s"    
.include "ipps/ownSynthesisFilterZeroStateResponse_NR_16s.s"    
.include "ipps/ownToeplizMatrix_G729_32s.s"    
.include "ipps/ownGainUpdate.s"    
.include "ipps/ownLog2.s"    
.include "ipps/ownPow2.s"    
.include "ipps/ownctsg729_nosplit.s"    
.include "ipps/ippsSumSquare_NS_16s32s_Sfs.s"    
.include "ipps/ippsLongTermPostFilter_G729A_16s.s"    
.include "ipps/ippsLSPToLPC_G729_16s.s"    
.include "ipps/ippsLongTermPostFilter_G729_16s.s"    
.include "ipps/ippsMulC_NR_16s_ISfs.s"    
.include "ipps/ippsMulPowerC_NR_16s_Sfs.s"    
.include "ipps/ippsMul_NR_16s_Sfs.s"   
.include "ipps/ippsPhaseDispersionGetStateSize_G729D_16s.s"    
.include "ipps/ippsPhaseDispersionInit_G729D_16s.s"    
.include "ipps/ippsPhaseDispersionUpdate_G729D_16s.s"    
.include "ipps/ippsPhaseDispersion_G729D_16s.s"    
.include "ipps/ippsRShiftC_16s_I.s"    
.include "ipps/ippsRandomNoiseExcitation_G729B_16s.s"
.include "ipps/ippsResidualFilter_G729E_16s.s"
.include "ipps/ippsResidualFilter_G729_16s.s"
.include "ipps/ippsShortTermPostFilter_G729A_16s.s"
.include "ipps/ippsShortTermPostFilter_G729_16s.s"
.include "ipps/ippsSum_16s32s_Sfs.s"
.include "ipps/ippsSynthesisFilter_G729E_16s.s"
.include "ipps/ippsSynthesisFilter_G729E_16s_I.s"
.include "ipps/ippsSynthesisFilter_NR_16s_Sfs.s"
.include "ipps/ippsTiltCompensation_G729A_16s.s"
.include "ipps/ippsTiltCompensation_G729E_16s.s"
.include "ipps/ippsTiltCompensation_G729_16s.s"
.include "ipps/ippsWinHybridGetStateSize_G729E_16s.s"
.include "ipps/ippsWinHybridInit_G729E_16s.s"
.include "ipps/ippsWinHybrid_G729E_16s32s.s"
.include "ipps/ippsZero_16s.s"
.include "ipps/ippsAdaptiveCodebookContribution_G729_16s.s"
.include "ipps/ippsAdaptiveCodebookGain_G729A_16s.s"
.include "ipps/ippsAdaptiveCodebookGain_G729_16s.s"
.include "ipps/ippsAdaptiveCodebookSearch_G729A_16s.s"
.include "ipps/ippsAdaptiveCodebookSearch_G729D_16s.s"
.include "ipps/ippsAdaptiveCodebookSearch_G729_16s.s"
.include "ipps/ippsAutoCorr_G729B.s"
.include "ipps/ippsAutoCorr_NormE_NR_16s.s"
.include "ipps/ippsCrossCorr_NormM_16s.s"
.include "ipps/ippsDotProdAutoScale_16s32s_Sfs.s"
.include "ipps/ippsFixedCodebookSearch_G729A_32s16s.s"
.include "ipps/ippsFixedCodebookSearch_G729D_16s.s"
.include "ipps/ippsFixedCodebookSearch_G729E_16s.s"
.include "ipps/ippsFixedCodebookSearch_G729_32s16s.s"
.include "ipps/ippsGainQuant_G729D_16s.s"
.include "ipps/ippsGainQuant_G729_16s.s"
.include "ipps/ippsLPCToLSP_G729A_16s.s"
.include "ipps/ippsLPCToLSP_G729_16s.s"
.include "ipps/ippsLSFQuant_G729B_16s.s"
.include "ipps/ippsLSPQuant_G729E_16s.s"
.include "ipps/ippsLSPQuant_G729_16s.s"
.include "ipps/ippsLSPToLSF_G729_16s.s"
.include "ipps/ippsLSPToLSF_Norm_G729_16s.s"
.include "ipps/ippsLagWindow_G729_32s_I.s"
.include "ipps/ippsLevinsonDurbin_G729B.s"
.include "ipps/ippsOpenLoopPitchSearch_G729A_16s.s"
.include "ipps/ippsOpenLoopPitchSearch_G729_16s.s"
.include "ipps/ippsPreemphasize_G729A_16s.s"
.include "ipps/ippsDecodeAdaptiveVector_G723_16s.s"
.include "ipps/ippsGainControl_G723_16s_I.s"
.include "ipps/ippsLSFDecode_G723_16s.s"
.include "ipps/ippsMulC_16s_I.s"
.include "ipps/ippsPitchPostFilter_G723_16s.s"
.include "ipps/ippsAdaptiveCodebookSearch_G723.s"
.include "ipps/ippsAutoCorr_G723_16s.s"
.include "ipps/ippsAutoScale_16s_I.s"
.include "ipps/ippsHarmonicFilter_NR_16s.s"
.include "ipps/ippsHarmonicNoiseSubtract_G723_16s_I.s"
.include "ipps/ippsHarmonicSearch_G723_16s.s"
.include "ipps/ippsHighPassFilter_G723_16s.s"
.include "ipps/ippsIIR16s_G723_16s_I.s"
.include "ipps/ippsIIR16s_G723_32s16s_Sfs.s"
.include "ipps/ippsLPCToLSF_G723_16s.s"
.include "ipps/ippsLSFQuant_G723_16s32s.s"
.include "ipps/ippsLevinsonDurbin_G723_16s.s"
.include "ipps/ippsOpenLoopPitchSearch_G723_16s.s"
.include "ipps/ippsSynthesisFilter_G723_16s32s.s"
.include "ipps/ippsACELPFixedCodebookSearch_G723_32s16s.s"
.include "ipps/ippsAutoCorrLagMax_Inv_16s.s"
.include "ipps/ippsAutoScale_16s.s"
.include "ipps/ippsConvPartial_16s32s.s"
.include "ipps/ippsIIR16s_G723_16s32s.s"
.include "ipps/ippsLSFToLPC_G723_16s.s"
.include "ipps/ippsMPMLQFixedCodebookSearch_G723.s"
.include "ipps/ippsMulC_16s_Sfs.s"
.include "ipps/ippsTiltCompensation_G723_32s16s.s"
.include "ipps/ippsToeplizMatrix_G723_16s32s.s"
.include "ipps/ippsCrossCorr_Inv_16s32s.s"
.include "ipps/ippsCrossCorr_NR_16s.s"
.include "ipps/ippsDotProd_16s32s.s"
.include "ipps/ippsHarmonicPostFilter_G729A_16s.s"
.include "ipps/ippsMul_NR_16s_ISfs.s"
.include "ipps/ippsRShiftC_32s_I.s"
.include "ipps/ippsAdaptiveCodebookDecode_G723_16s.s"
.include "ipps/ippsAutoCorrLagMax_Fwd_16s.s"
.include "ipps/ippsAutoCorr_Inv_16s32s.s"
.include "ipps/ippsAutoCorr_NormE_G723_16s.s"
.include "ipps/ippsClosedLoopPitchSearch_G729_16s.s"
.include "ipps/ippsComputeAdaptiveCodebookGain_16s.s"
.include "ipps/ippsConvPartial_16s_Sfs.s"
.include "ipps/ippsConvert_NR_32s16s_Sfs.s"
.include "ipps/ippsCrossCorrLagMax_Inv_16s.s"
.include "ipps/ippsDotProd_G729A_16s32s.s"
.include "ipps/ownctsg723_nosplit.s"
.include "ipps/ippsCrossCorr_16s32s_Sfs.s"
.include "ipps/ippsExcitationDelay_G723_16s.s"
.include "ipps/ippsGainQuant_G723_16s.s"
.include "ipps/ippsLPCToLSF_Norm_G723_16s.s"
.include "ipps/ippsAutoCorr_NormE_Step_NR_16s.s"
.include "ipps/ippsLSFQuant_G723_16s_I.s"
.include "ipps/ippsLSFQuant_G729_16s.s"
.include "ipps/ippsLSFToLPC_G723_16s_I.s"
.include "ipps/ippsLShiftC_16u.s"
.include "ipps/ippsLShiftC_16u_I.s"
.include "ipps/ippsMaxIndx_32s.s"
.include "ipps/ippsMeanSquareWeightedError_16s.s"
.include "ipps/ippsMinIndx_16s.s"
.include "ipps/ippsMulC_16s_ISfs.s"
.include "ipps/ippsMul_D2D1_16s32s.s"
.include "ipps/ippsPitchPredictor_G723_16s.s"
.include "ipps/ippsMul_D2D1Step_16s32s.s"
.include "ipps/ippsMul_D2_16s32s.s"
.include "ipps/ippsPreemphasize_G729A_16s_I.s"
.include "ipps/ippsSynthesisFilter_G729_16s.s"
.include "ipps/ippsSumSquare_D2_16s32s.s"
.include "ipps/ippsToeplizMatrix_G729D_16s32s.s"
.include "ipps/ippsZero_8u.s"
.include "ipps/ownACELP_10i40_35bits_16s.s"
.include "ipps/ownACELP_12i40_44bits_16s.s"
.include "ipps/ownAutoCorrLagMax_G729A_16s.s"
.include "ipps/ippsCrossCorr_Step_NR_Sfs_16s.s"
.include "ipps/ippsToeplizMatrix_G729E_16s.s"
.include "ipps/ownAutoCorr_G729_16s32s_Sfs.s"
.include "ipps/ownAutoCorr_Inv_16s32s.s"
.include "ipps/ownAutoCorr_NormE_NR_16s.s"
.include "ipps/ownAutoScale_NR_32s16s.s"
.include "ipps/ownComputeMaxAmplitude_G723.s"
.include "ipps/ownCrossCorr_Inv_16s32s.s"
.include "ipps/ownDotProd_16s32s_PX.s"
.include "ipps/ownEnergy_16s32s.s"
.include "ipps/ownFixedCodebookSearch_G729A_32s16s.s"
.include "ipps/ownFixedCodebookSearch_G729_32s16s.s"
.include "ipps/ownInterpol_3.s"
.include "ipps/ownLPCToLSP_G729_16s.s"
.include "ipps/ownNormCrossPos_NR_32s16s.s"
.include "ipps/ownMul_16s_NoS_Sfs.s"
.include "ipps/ownMul_32s16s.s"
.include "ipps/ownResidualFilter_G729_16s.s"
.include "ipps/ownSynthesisFilter_G723_16s32s.s"
.include "ipps/ownTakeSign_G729E_16s.s"
.include "ipps/ownTiltCompensateFilter_G729_16s.s"
.include "ipps/ownToeplizMatrix_G729D_32s.s"
.include "ipps/ownToeplizMatrix_G729E_32s.s"

.include "ipps/lshrdi3.s"           
@.include "ipps/floatsidf.s"
@.include "ipps/dbl_add.s"
.include "ipps/dbl_multiply.s"
.include "ipps/dbl_divide.s"
.include "ipps/fixdfsi.s"
.include "ipps/xsc_cos.s"
.include "ipps/xsc_sin.s"
.include "ipps/ippsZero_32s.s"
.include "ipps/ipps_BitRev1_8.s"
.include "ipps/ipps_BitRev1_16.s"
.include "ipps/ipps_cnvrt_16s64s.s"
.include "ipps/ipps_cnvrt_32s64s.s"
.include "ipps/ipps_cnvrt_64s16s.s"
.include "ipps/ippsConvert_32s64f_Sfs.s"
.include "ipps/ipps_cnvrt_64s32s.s"
.include "ipps/ipps_ibMpyBySqrt2_64s.s"
.include "ipps/ipps_initTabBitRev.s"
.include "ipps/ipps_initTabTwdBase_32s.s"
.include "ipps/ipps_initTabTwd_R4_32s.s"
.include "ipps/ipps_jCcsRecombine_32s.s"
.include "ipps/ipps_jFft_Core_32s.s"
.include "ipps/ipps_jRealRecombine_32s.s"

@// Controlling shoot

.include "ipps/ippsFFTFree_C_32sc.s"
.include "ipps/ippsFFTFree_R_16s32s.s"
.include "ipps/ippsFFTFree_R_32s.s"
.include "ipps/ippsFFTFwd_CToC_32sc_Sfs.s"
.include "ipps/ippsFFTFwd_RToCCS_16s32s_Sfs.s"
.include "ipps/ippsFFTGetBufSize_C_32sc.s"
.include "ipps/ippsFFTGetBufSize_R_16s32s.s"
.include "ipps/ippsFFTGetBufSize_R_32s.s"
.include "ipps/ippsFFTInitAlloc_C_32sc.s"
.include "ipps/ippsFFTInitAlloc_R_16s32s.s"
.include "ipps/ippsFFTInitAlloc_R_32s.s"
.include "ipps/ippsFFTInv_CCSToR_32s16s_Sfs.s"
.include "ipps/ippsFFTInv_CCSToR_32s_Sfs.s"
.include "ipps/ippsMagSquared_32sc32s_Sfs.s"


.include "vcsxl/ownAddBackPredPBFF_8u_C1R.s"
.include "vcsxl/ownAddBackPredPBFH_8u_C1R.s"
.include "vcsxl/ownAddBackPredPBHF_8u_C1R.s"
.include "vcsxl/ownAddBackPredPBHH_8u_C1R.s"
.include "vcsxl/ownDecodeCoeffs_H263.s"
.include "vcsxl/ownDecodeCoeffs_ModQ_H263.s"
.include "vcsxl/ownDownampleFour16x16_H263_16s_C1R.s"
.include "vcsxl/ownDownsampleFour_H263_8u_C1R.s"
.include "vcsxl/ownEncodeCoeffs_H263_16s1u.s"
.include "vcsxl/ownEncodeCoeffs_ModQ_H263_16s1u.s"
.include "vcsxl/ownFilterBB16x16_H263_H.s"
.include "vcsxl/ownFilterBB16x16_H263_V.s"
.include "vcsxl/ownFilterDeblocking16x16_H263_H.s"
.include "vcsxl/ownFilterDeblocking16x16_H263_V.s"
.include "vcsxl/ownFilterDeblocking8x8_H263_H.s"
.include "vcsxl/ownFilterDeblocking8x8_H263_V.s"
.include "vcsxl/ownph263_QuantAdvIntraNoClip_16s_I.s"
.include "vcsxl/ownph263_QuantAdvIntra_16s_I.s"
.include "vcsxl/ownph263_QuantInterNoClip_16s_I.s"
.include "vcsxl/ownph263_QuantInter_16s_I.s"
.include "vcsxl/ownph263_QuantIntraNoClip_16s_I.s"
.include "vcsxl/ownph263_QuantIntra_16s_I.s"
.include "vcsxl/ownph263_QuantInv_16s_I.s"
.include "vcsxl/ownph263_QuantInv_AdvIntra_16s_I.s"
.include "vcsxl/ownph263_QuantInv_ModQ_16s_I.s"
.include "vcsxl/ownReconCoeffs_AdvIntra_H263.s"
.include "vcsxl/ownReconCoeffs_AdvIntra_ModQ_H263.s"
.include "vcsxl/ownReconCoeffs_H263.s"
.include "vcsxl/ownReconCoeffs_ModQ_H263.s"
.include "vcsxl/ownResample_H263_8u_P3R.s"
.include "vcsxl/ownSpatialInterpolationHor_H263_8u_C1R.s"
.include "vcsxl/ownSpatialInterpolationVer_H263_8u_C1R.s"
.include "vcsxl/ownUpsampleFour8x8_H263_16s_C1R.s"
.include "vcsxl/ownUpsampleFour_H263_8u_C1R.s"
.include "vcsxl/ownvc_Add8x8_16s8u_C1IRS.s"
.include "vcsxl/ownvc_Copy4x8HP_FH0_8u_C1R.s"
.include "vcsxl/ownvc_Copy4x8HP_FH1_8u_C1R.s"
.include "vcsxl/ownvc_Copy4x8HP_HF0_8u_C1R.s"
.include "vcsxl/ownvc_Copy4x8HP_HF1_8u_C1R.s"
.include "vcsxl/ownvc_Copy4x8HP_HH0_8u_C1R.s"
.include "vcsxl/ownvc_Copy4x8HP_HH1_8u_C1R.s"
.include "vcsxl/ownvc_Copy4x8_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4HP_FH0_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4HP_FH1_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4HP_HF0_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4HP_HF1_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4HP_HH0_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4HP_HH1_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x4_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8HP_FH0_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8HP_FH1_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8HP_HF0_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8HP_HF1_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8HP_HH0_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8HP_HH1_8u_C1R.s"
.include "vcsxl/ownvc_Copy8x8_8u_C1R.s"
.include "vcsxl/ownvc_CopyQP_8u_C1R.s"
.include "vcsxl/ownvc_MeanAbsDev16x16_8u32s_C1R.s"
.include "vcsxl/ownvc_SSD8x8_8u32s_C1R.s"
.include "vcsxl/ownvc_SSD8x8_8u32s_C1R_FH.s"
.include "vcsxl/ownvc_SSD8x8_8u32s_C1R_HF.s"
.include "vcsxl/ownvc_SSD8x8_8u32s_C1R_HH.s"
.include "vcsxl/ownvc_SubSAD8x8_8u16s_C1R.s"
.include "vcsxl/ownvc_SumPredictOBMC8x8_8u_C1R.s"
.include "vcsxl/pvch263backpred_split_ippiAddBackPredPB_H263_8u_C1R.s"
.include "vcsxl/pvch263bbfilter_split_ippiFilterBlockBoundaryHorEdge_H263_8u_C1IR.s"
.include "vcsxl/pvch263bbfilter_split_ippiFilterBlockBoundaryVerEdge_H263_8u_C1IR.s"
.include "vcsxl/pvch263deblocking_split_ippiFilterDeblocking16x16HorEdge_H263_8u_C1IR.s"
.include "vcsxl/pvch263deblocking_split_ippiFilterDeblocking16x16VerEdge_H263_8u_C1IR.s"
.include "vcsxl/pvch263deblocking_split_ippiFilterDeblocking8x8HorEdge_H263_8u_C1IR.s"
.include "vcsxl/pvch263deblocking_split_ippiFilterDeblocking8x8VerEdge_H263_8u_C1IR.s"
.include "vcsxl/pvch263invqnt_split_ippiQuantInvInter_H263_16s_C1I.s"
.include "vcsxl/pvch263invqnt_split_ippiQuantInvIntra_H263_16s_C1I.s"
.include "vcsxl/pvch263qnt_split_ippiQuantInter_H263_16s_C1I.s"
.include "vcsxl/pvch263qnt_split_ippiQuantIntra_H263_16s_C1I.s"
.include "vcsxl/pvch263resample4_split_ippiDownsampleFour16x16_H263_16s_C1R.s"
.include "vcsxl/pvch263resample4_split_ippiDownsampleFour_H263_8u_C1R.s"
.include "vcsxl/pvch263resample4_split_ippiSpatialInterpolation_H263_8u_C1R.s"
.include "vcsxl/pvch263resample4_split_ippiUpsampleFour8x8_H263_16s_C1R.s"
.include "vcsxl/pvch263resample4_split_ippiUpsampleFour_H263_8u_C1R.s"
.include "vcsxl/pvch263resample_split_ippiResample_H263_8u_P3R.s"
.include "vcsxl/pvch263tables_nosplit.s"
.include "vcsxl/pvch263tcdec_split_ippiDecodeCoeffsInter_H263_1u16s.s"
.include "vcsxl/pvch263tcdec_split_ippiDecodeCoeffsIntra_H263_1u16s.s"
.include "vcsxl/pvch263tcdec_split_ippiDecodeDCIntra_H263_1u16s.s"
.include "vcsxl/pvch263tcenc_split_ippiEncodeCoeffsInter_H263_16s1u.s"
.include "vcsxl/pvch263tcenc_split_ippiEncodeCoeffsIntra_H263_16s1u.s"
.include "vcsxl/pvch263tcenc_split_ippiEncodeDCIntra_H263_16s1u.s"
.include "vcsxl/pvch263tcrec_split_ippiReconstructCoeffsInter_H263_1u16s.s"
.include "vcsxl/pvch263tcrec_split_ippiReconstructCoeffsIntra_H263_1u16s.s"
.include "vcsxl/pvcmc_split_ippiAdd8x8_16s8u_C1IRS.s"
.include "vcsxl/pvcmc_split_ippiCopy8x8QP_MPEG4_8u_C1R.s"
.include "vcsxl/pvcmc_split_ippiOBMC8x8HP_MPEG4_8u_C1R.s"
.include "vcsxl/pvcmc_split_ippiOBMC8x8QP_MPEG4_8u_C1R.s"
.include "vcsxl/pvcmeutils_split_ippiSqrDiff16x16B_8u32s.s"
.include "vcsxl/pvcmeutils_split_ippiSqrDiff16x16_8u32s.s"
.include "vcsxl/pvcmp4tables_nosplit.s"
.include "vcsxl/pvcscan_split_ippiScanInv_16s_C1.s"
.include "vcsxl/pvctables_nosplit.s"
.include "vcsxl/pvcutil_split_ippiMeanAbsDev16x16_8u32s_C1R.s"
.include "vcsxl/pvcutil_split_ippiSSD8x8_8u32s_C1R.s"
.include "vcsxl/pvcutil_split_ippiSubSAD8x8_8u16s_C1R.s"
        
        
.include "isxl/pidct88i_2_split_ippiDCT8x8Inv_16s_C1I.s"
.include "isxl/pidct88i_3_split_ippiDCT8x8Fwd_8u16s_C1R.s"
.include "isxl/pidct88i_3_split_ippiDCT8x8Inv_16s8u_C1R.s"
.include "isxl/pidct88i_3_split_ippiDCT8x8Inv_2x2_16s_C1I.s"
.include "isxl/pidct88i_3_split_ippiDCT8x8Inv_4x4_16s_C1I.s"
.include "isxl/pidct88i_split_ippiDCT8x8Fwd_16s_C1I.s"				


@//============================================================================


        gl ippiResizeYUV422_8u_C2R
		gl ippiResize_8u_C1R
		gl ippiResize_8u_C3R
		gl ippiResize_8u_C4R
		gl ippiResize_16u_C1R
		gl ippiResize_16u_C3R
		gl ippiResize_16u_C4R
        
		gl ippiYCbCr422ToBGR444_8u16u_C2C3R
		gl ippiYCbCr420ToBGR444_8u16u_P3C3R
		gl ippiYCrCb420ToYCbCr420_8u_P3P2R
		gl ippiYCbCr420ToBGR_8u_P3C3R
		gl ippiBGRToYCbCr422_8u_C3C2R
		gl ippiCbYCr422ToYCrCb420_8u_C2P3R
		gl ippiYCbCr420_8u_P2P3R
		gl ippiYCbCr420ToYCbCr422_8u_P2C2R
		gl ippiYCbCr420ToCbYCr422_8u_P2C2R
		gl ippiYCrCb420ToYCbCr422_8u_P3C2R
		gl ippiYCbCr420To411_8u_P3R
		gl ippiYCrCb420ToCbYCr422_8u_P3C2R
		gl ippiCbYCr422ToYCbCr422_8u_C2R
		gl ippiFilterDeblockinzChromaHorEdge_H264_16u_C1IR
		gl ippiBGRToYCrCb420_8u_AC4P3R
		gl ippiBGRToYCrCb420_8u_C3P3R
		gl ippiYCrCb420ToBGR_Filter_8u_P3C4R
		gl ippiCbYCr422ToYCbCr422_8u_C2P3R.
		gl ippiBGR565ToYCrCb420_16u8u_C3P3R
		gl ippiYCbCr422ToBGR_8u_C2C3R
		gl ippiYCbCr422ToBGR_8u_C2C4R
		gl ippiBGR555ToYCrCb420_16u8u_C3P3R
		gl ippiCbYCr422ToYCbCr420_8u_C2P2R
		gl ippiBGRToYCbCr422_8u_AC4C2R
		gl ippiYCrCb422ToYCbCr422_8u_C2P3R
		gl ippiYCbCr420ToBGR565_8u16u_P3C3R
		gl ippiYCbCr420ToBGR555_8u16u_P3C3R
		gl ippiBGR565ToYCbCr422_16u8u_C3C2R
		gl ippiYCbCr422ToBGR565_8u16u_C2C3R
		gl ippiYCbCr422ToCbYCr422_8u_C2R
		gl ippiCbYCr422ToBGR_8u_C2C4R
		gl ippiYCbCr422ToYCbCr420_8u_C2P2R
		gl ippiYCbCr420ToYCbCr422_8u_P3R
		gl ippiYCbCr422ToBGR555_8u16u_C2C3R
		gl ippiYCbCr422ToYCrCb420_8u_C2P3R
		gl ippiCbYCr422ToYCbCr422_8u_C2P3R
		gl ippiBGR555ToYCbCr422_16u8u_C3C2R
		gl ippiBGRToCbYCr422_8u_AC4C2R
		gl ippiYCbCr422ToYCbCr420_8u_P3R
		gl ippiYCbCr422_8u_P3C2R
		

@//=============================================================================
.include "h264/c_memcpy.s"
.include "h264/ippsSet_16s.s"
.include "h264/ippiCopy_16s_C1R.s"		
.include "h264/ippiSet_8u_C1R.s"
.include "h264/ippiDecodeExpGolombOne_H264_1u16s.s"

/*        
.include "h264/ippiResizeYUV422_8u_C2R.s"
.include "h264/ippiResize_8u_C1R.s"
.include "h264/ippiResize_8u_C3R.s"
.include "h264/ippiResize_8u_C4R.s"        
.include "h264/ippiResize_16u_C1R.s"
.include "h264/ippiResize_16u_C3R.s"
.include "h264/ippiResize_16u_C4R.s"
*/
.include "h264/ippiSAD16x16_16u32s_C1R.s"
.include "h264/ippiSAD16x8_8u32s_C1R.s"
.include "h264/ippiSAD4x4_16u32s_C1R.s"
.include "h264/ippiSAD4x4_8u32s.s"
.include "h264/ippiSAD8x8_16u32s_C1R.s"
.include "h264/ippiSSD4x4_8u32s_C1R.s"
.include "h264/ippiSub4x4_16u16s_C1R.s"
.include "h264/ippiSub4x4_8u16s_C1R.s"
.include "h264/ippiSub8x8_16u16s_C1R.s"
.include "h264/ippiSub8x8_8u16s_C1R.s"
.include "h264/ippiSumsDiff16x16Blocks4x4_16u32s_C1R.s"
.include "h264/ippiSumsDiff16x16Blocks4x4_8u16s_C1.s"
.include "h264/ippiSumsDiff8x8Blocks4x4_16u32s_C1R.s"		
.include "h264/ippiSumsDiff8x8Blocks4x4_8u16s_C1.s"

.include "h264/ippiBiDirWeightBlockImplicit_H264_8u_P3P1R.s"
.include "h264/ippiBiDirWeightBlock_H264_8u_P3P1R.s"
.include "h264/ippiBidirWeightImplicit_H264_16u_P2P1R.s"
.include "h264/ippiBidirWeight_H264_16u_P2P1R.s"
.include "h264/ippiBidir_H264_16u_P2P1R.s"
.include "h264/ippiDecodeCAVLCChroma422DcCoeffs_H264_1u16s.s"
.include "h264/ippiDecodeCAVLCChroma422DcCoeffs_H264_1u32s.s"
.include "h264/ippiDecodeCAVLCChromaDcCoeffs_H264_1u16s.s"
.include "h264/ippiDecodeCAVLCChromaDcCoeffs_H264_1u32s.s"
.include "h264/ippiDecodeCAVLCCoeffs_H264_1u16s.s"
.include "h264/ippiDecodeCAVLCCoeffs_H264_1u32s.s"        
.include "h264/ippiDeinterlaceFilterTriangle_8u_C1R.s"
.include "h264/ippiEdgesDetect16x16_16u_C1R.s"
.include "h264/ippiEdgesDetect16x16_8u_C1R.s"
.include "h264/ippiEncodeChromaDcCoeffsCAVLC_H264_16s.s"
.include "h264/ippiEncodeCoeffsCAVLCChromaDC2x2_H264_32s.s"
.include "h264/ippiEncodeCoeffsCAVLCChromaDC2x4_H264_16s.s"
.include "h264/ippiEncodeCoeffsCAVLCChromaDC2x4_H264_32s.s"
.include "h264/ippiEncodeCoeffsCAVLC_H264_16s.s"
.include "h264/ippiEncodeCoeffsCAVLC_H264_32s.s"
.include "h264/ippiFilterDeblockingChroma422HorEdge_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingChroma422HorEdge_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingChroma422VerEdge_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingChroma422VerEdge_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingChromaHorEdge_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingChromaVerEdgeMBAFF_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingChromaVerEdge_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingChroma_HorEdge_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingChroma_VerEdge_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingChroma_VerEdge_MBAFF_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingLumaHorEdge_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingLumaVerEdgeMBAFF_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingLumaVerEdge_H264_16u_C1IR.s"
.include "h264/ippiFilterDeblockingLuma_HorEdge_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingLuma_VerEdge_H264_8u_C1IR.s"
.include "h264/ippiFilterDeblockingLuma_VerEdge_MBAFF_H264_8u_C1IR.s"
.include "h264/ippiGenScaleLevel8x8_H264_8u16s_D2.s"
.include "h264/ippiHuffmanRunLevelTableInitAlloc_32s.s"
.include "h264/ippiHuffmanTableFree_32s.s"
.include "h264/ippiHuffmanTableInitAlloc_32s.s"
.include "h264/ippiInterpolateBlock_H264_8u_P2P1R.s"
.include "h264/ippiInterpolateBlock_H264_8u_P3P1R.s"
.include "h264/ippiInterpolateBoundaryChromaBlock_H264_16u.s"
.include "h264/ippiInterpolateBoundaryChromaBlock_H264_8u.s"
.include "h264/ippiInterpolateBoundaryLumaBlock_H264_16u.s"
.include "h264/ippiInterpolateBoundaryLumaBlock_H264_8u.s"
.include "h264/ippiInterpolateChromaBlock_H264_16u_P2R.s"
.include "h264/ippiInterpolateChromaBlock_H264_8u_P2R.s"
.include "h264/ippiInterpolateChroma_H264_16u_C1R.s"
.include "h264/ippiInterpolateChroma_H264_8u_C1R.s"
.include "h264/ippiInterpolateLumaBlock_H264_16u_P1R.s"
.include "h264/ippiInterpolateLumaBlock_H264_8u_P1R.s"
.include "h264/ippiInterpolateLuma_H264_16u_C1R.s"
.include "h264/ippiInterpolateLuma_H264_8u_C1R.s"
.include "h264/ippiQuantInvLuma8x8_H264_32s_C1I.s"
.include "h264/ippiQuantLuma8x8Inv_H264_16s_C1I.s"
.include "h264/ippiQuantLuma8x8_H264_16s_C1.s"
.include "h264/ippiQuantLuma8x8_H264_32s_C1.s"
.include "h264/ippiRangeMapping_VC1_8u_C1R.s"
.include "h264/ippiReadDataBlockThroughBoundary_8u.s"
.include "h264/ippiReadDataBlockThroughBoundary_16u.s"
		
		
.include "h264/ippiReconstructChroma422Inter4x4_H264High_16s8u_IP2R.s"
.include "h264/ippiReconstructChroma422Inter4x4_H264High_32s16u_IP2R.s"
.include "h264/ippiReconstructChroma422Intra4x4_H264High_16s8u_IP2R.s"
.include "h264/ippiReconstructChroma422Intra4x4_H264High_32s16u_IP2R.s"
.include "h264/ippiReconstructChromaInter4x4MB_H264_16s8u_P2R.s"
.include "h264/ippiReconstructChromaInter4x4_H264High_32s16u_IP2R.s"
.include "h264/ippiReconstructChromaInterMB_H264_16s8u_P2R.s"
.include "h264/ippiReconstructChromaIntra4x4MB_H264_16s8u_P2R.s"
.include "h264/ippiReconstructChromaIntra4x4_H264High_32s16u_IP2R.s"
.include "h264/ippiReconstructChromaIntraHalf4x4_H264High_32s16u_IP2R.s"
.include "h264/ippiReconstructChromaIntraHalfs4x4MB_H264_16s8u_P2R.s"
.include "h264/ippiReconstructChromaIntraHalfsMB_H264_16s8u_P2R.s"
.include "h264/ippiReconstructChromaIntraMB_H264_16s8u_P2R.s"
@//.include "h264/ippiReconstructLumaInter4x4MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaInter4x4_H264High_32s16u_IP1R.s"
@//.include "h264/ippiReconstructLumaInter8x8MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaInter8x8_H264High_32s16u_IP1R.s"
.include "h264/ippiReconstructLumaInterMB_H264_16s8u_C1R.s"
@//.include "h264/ippiReconstructLumaIntra16x16MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaIntra16x16_H264High_32s16u_IP1R.s"
@//.include "h264/ippiReconstructLumaIntra4x4MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaIntra4x4_H264High_32s16u_IP1R.s"
@//.include "h264/ippiReconstructLumaIntra8x8MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaIntra8x8_H264High_32s16u_IP1R.s"
.include "h264/ippiReconstructLumaIntraHalf4x4MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaIntraHalf4x4_H264High_32s16u_IP1R.s"
.include "h264/ippiReconstructLumaIntraHalf8x8MB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaIntraHalf8x8_H264High_32s16u_IP1R.s"
.include "h264/ippiReconstructLumaIntraHalfMB_H264_16s8u_C1R.s"
.include "h264/ippiReconstructLumaIntraMB_H264_16s8u_C1R.s"
@//.include "h264/ippiReconstructLumaIntra_16x16MB_H264_16s8u_C1R.s"
                
.include "h264/ippiTransformFwdLuma8x8_H264_16s32s_C1.s"
.include "h264/ippiTransformFwdLuma8x8_H264_16s_C1.s"
.include "h264/ippiTransformInvAddPredLuma8x8_H264_32s16u_C1R.s"
.include "h264/ippiTransformLuma8x8InvAddPred_H264_16s8u_C1R.s"
.include "h264/ippiTransformQuantFwd4x4_H264_16s32s_C1.s"
.include "h264/ippiTransformQuantFwd4x4_H264_16s_C1.s"
.include "h264/ippiTransformQuantFwdChromaDC2x2_H264_16s_C1I.s"
.include "h264/ippiTransformQuantFwdChromaDC2x2_H264_32s_C1I.s"
.include "h264/ippiTransformQuantFwdChromaDC2x4_H264_16s_C1I.s"
.include "h264/ippiTransformQuantFwdChromaDC2x4_H264_32s_C1I.s"
.include "h264/ippiTransformQuantFwdLumaDC4x4_H264_16s_C1I.s"
.include "h264/ippiTransformQuantFwdLumaDC4x4_H264_32s_C1I.s"
.include "h264/ippiTransformQuantInvAddPred4x4_H264_16s_C1IR.s"
.include "h264/ippiTransformQuantInvAddPred4x4_H264_32s_C1IR.s"
.include "h264/ippiTransformQuantInvChromaDC2x2_H264_16s_C1I.s"
.include "h264/ippiTransformQuantInvChromaDC2x2_H264_32s_C1I.s"
.include "h264/ippiTransformQuantInvChromaDC2x4_H264_16s_C1I.s"
.include "h264/ippiTransformQuantInvChromaDC2x4_H264_32s_C1I.s"
.include "h264/ippiTransformQuantInvLumaDC4x4_H264_16s_C1I.s"
.include "h264/ippiTransformQuantInvLumaDC4x4_H264_32s_C1I.s"
.include "h264/ippiUniDirWeightBlock_H264_8u_C1R.s"
.include "h264/ippiUnidirWeight_H264_16u_IP2P1R.s"

.include "h264/ownvc_SAD16x16_16u32s_C1R.s"
.include "h264/ownvc_SAD16x16_16u32s_C1R_FH.s"
.include "h264/ownvc_SAD16x16_16u32s_C1R_HF.s"
.include "h264/ownvc_SAD16x16_16u32s_C1R_HH.s"
.include "h264/ownvc_SAD16x8_8u32s_C1R.s"
.include "h264/ownvc_SAD16x8_8u32s_C1R_FH.s"
.include "h264/ownvc_SAD16x8_8u32s_C1R_HF.s"
.include "h264/ownvc_SAD16x8_8u32s_C1R_HH.s"
.include "h264/ownvc_SAD4x4_16u32s_C1R.s"
.include "h264/ownvc_SAD4x4_16u32s_C1R_FH.s"
.include "h264/ownvc_SAD4x4_16u32s_C1R_HF.s"
.include "h264/ownvc_SAD4x4_16u32s_C1R_HH.s"
.include "h264/ownvc_SAD8x8_16u32s_C1R.s"
.include "h264/ownvc_SAD8x8_16u32s_C1R_FH.s"
.include "h264/ownvc_SAD8x8_16u32s_C1R_HF.s"
.include "h264/ownvc_SAD8x8_16u32s_C1R_HH.s"
.include "h264/ownvc_SSD4x4_8u32s_C1R.s"
.include "h264/ownvc_SSD4x4_8u32s_C1R_FH.s"
.include "h264/ownvc_SSD4x4_8u32s_C1R_HF.s"
.include "h264/ownvc_SSD4x4_8u32s_C1R_HH.s"
.include "h264/ownvc_Sub8x8_8u16s_C1R.s"
.include "h264/own_InterpolateChroma_H264_16u.s"
.include "h264/own_InterpolateLuma_H264_16u.s"
        
.include "h264/read_data_through_boundary_bottom_16u_px.s"
.include "h264/read_data_through_boundary_bottom_8u_px.s"
.include "h264/read_data_through_boundary_bottom_left_16u_px.s"
.include "h264/read_data_through_boundary_bottom_left_8u_px.s"
.include "h264/read_data_through_boundary_bottom_left_right_16u_px.s"
.include "h264/read_data_through_boundary_bottom_left_right_8u_px.s"
.include "h264/read_data_through_boundary_bottom_right_16u_px.s"
.include "h264/read_data_through_boundary_bottom_right_8u_px.s"
.include "h264/read_data_through_boundary_left_16u_px.s"
.include "h264/read_data_through_boundary_left_8u_px.s"
.include "h264/read_data_through_boundary_left_right_16u_px.s"
.include "h264/read_data_through_boundary_left_right_8u_px.s"
.include "h264/read_data_through_boundary_none_16u.s"
.include "h264/read_data_through_boundary_none_8u.s"
.include "h264/read_data_through_boundary_right_16u_px.s"
.include "h264/read_data_through_boundary_right_8u_px.s"
.include "h264/read_data_through_boundary_top_16u_px.s"
.include "h264/read_data_through_boundary_top_8u_px.s"
.include "h264/read_data_through_boundary_top_bottom_16u_px.s"
.include "h264/read_data_through_boundary_top_bottom_8u_px.s"
.include "h264/read_data_through_boundary_top_bottom_left_16u_px.s"
.include "h264/read_data_through_boundary_top_bottom_left_8u_px.s"
.include "h264/read_data_through_boundary_top_bottom_left_right_16u_px.s"
.include "h264/read_data_through_boundary_top_bottom_left_right_8u_px.s"
.include "h264/read_data_through_boundary_top_bottom_right_16u_px.s"
.include "h264/read_data_through_boundary_top_bottom_right_8u_px.s"
.include "h264/read_data_through_boundary_top_left_16u_px.s"
.include "h264/read_data_through_boundary_top_left_8u_px.s"
.include "h264/read_data_through_boundary_top_left_right_16u_px.s"
.include "h264/read_data_through_boundary_top_left_right_8u_px.s"
.include "h264/read_data_through_boundary_top_right_16u_px.s"
.include "h264/read_data_through_boundary_top_right_8u_px.s"

.include "h264/pvch264interpolatechroma_px_table_nosplit.s"
.include "h264/pvcreadoverlappingdata_px_table_nosplit.s"        
.include "h264/h264interpolatelumatable_nosplit.s"
.include "h264/h264interpolateluma_px_table_nosplit.s"
.include "h264/h264tables_nosplit.s"
        
.include "h264/h264_interpolate_chroma_type_00_8u_px.s"
.include "h264/h264_interpolate_chroma_type_0x_8u_px.s"
.include "h264/h264_interpolate_chroma_type_y0_8u_px.s"
.include "h264/h264_interpolate_chroma_type_yx_8u_px.s"
.include "h264/h264_interpolate_luma_get_average_8u_px.s"
.include "h264/h264_interpolate_luma_type_0_8u_px.s"
.include "h264/h264_interpolate_luma_type_a_8u_px.s"
.include "h264/h264_interpolate_luma_type_b_8u_px.s"
.include "h264/h264_interpolate_luma_type_c_8u_px.s"
.include "h264/h264_interpolate_luma_type_d_8u_px.s"
.include "h264/h264_interpolate_luma_type_e_8u_px.s"
.include "h264/h264_interpolate_luma_type_f_8u_px.s"
.include "h264/h264_interpolate_luma_type_g_8u_px.s"
.include "h264/h264_interpolate_luma_type_h_8u_px.s"
.include "h264/h264_interpolate_luma_type_i_8u_px.s"
.include "h264/h264_interpolate_luma_type_j_8u_px.s"
.include "h264/h264_interpolate_luma_type_k_8u_px.s"
.include "h264/h264_interpolate_luma_type_n_8u_px.s"
.include "h264/h264_interpolate_luma_type_q_8u_px.s"
.include "h264/h264_interpolate_luma_type_p_8u_px.s"
.include "h264/h264_interpolate_luma_type_r_8u_px.s"

.include "h264/h264_interpolate_chroma_type_00_16u_px.s"
.include "h264/h264_interpolate_chroma_type_0x_16u_px.s"
.include "h264/h264_interpolate_chroma_type_y0_16u_px.s"
.include "h264/h264_interpolate_chroma_type_yx_16u_px.s"
.include "h264/h264_interpolate_luma_get_average_16u_px.s"
.include "h264/h264_interpolate_luma_type_0_16u_px.s"
.include "h264/h264_interpolate_luma_type_a_16u_px.s"
.include "h264/h264_interpolate_luma_type_b_16u_px.s"
.include "h264/h264_interpolate_luma_type_c_16u_px.s"
.include "h264/h264_interpolate_luma_type_d_16u_px.s"
.include "h264/h264_interpolate_luma_type_e_16u_px.s"
.include "h264/h264_interpolate_luma_type_f_16u_px.s"
.include "h264/h264_interpolate_luma_type_g_16u_px.s"
.include "h264/h264_interpolate_luma_type_h_16u_px.s"
.include "h264/h264_interpolate_luma_type_i_16u_px.s"
.include "h264/h264_interpolate_luma_type_j_16u_px.s"
.include "h264/h264_interpolate_luma_type_k_16u_px.s"
.include "h264/h264_interpolate_luma_type_n_16u_px.s"
.include "h264/h264_interpolate_luma_type_p_16u_px.s"
.include "h264/h264_interpolate_luma_type_q_16u_px.s"
.include "h264/h264_interpolate_luma_type_r_16u_px.s"
 		
.include "h264/h264_ippInterpolate_H00V00_16u.s"
.include "h264/h264_ippInterpolate_H00V01_16u.s"
.include "h264/h264_ippInterpolate_H00V02_16u.s"
.include "h264/h264_ippInterpolate_H00V03_16u.s"
.include "h264/h264_ippInterpolate_H01V00_16u.s"
.include "h264/h264_ippInterpolate_H01V01_16u.s"
.include "h264/h264_ippInterpolate_H01V02_16u.s"
.include "h264/h264_ippInterpolate_H01V03_16u.s"
.include "h264/h264_ippInterpolate_H02V00_16u.s"
.include "h264/h264_ippInterpolate_H02V01_16u.s"
.include "h264/h264_ippInterpolate_H02V02_16u.s"
.include "h264/h264_ippInterpolate_H02V03_16u.s"
.include "h264/h264_ippInterpolate_H03V00_16u.s"
.include "h264/h264_ippInterpolate_H03V01_16u.s"
.include "h264/h264_ippInterpolate_H03V02_16u.s"
.include "h264/h264_ippInterpolate_H03V03_16u.s"


@//-----------------------------------------------------------------------------        
	.data
	.align  4
__imp___rt_sdiv:		.long	___rt_sdiv		
__imp___rt_sdiv64by64:	.long	___rt_sdiv64by64
__imp___rt_srsh:		.long   ___rt_srsh	

	.text
	.align  4

___rt_srsh:
___rt_sdiv:
		ands        r3, r0, #2, 2 
		rsbmi       r0, r0, #0 
		eors        r12, r3, r1, asr #32 
		rsbcs       r1, r1, #0 		
		movs        r2, r0 
		beq         L_001 
L_002:
		cmp         r2, r1, lsr #8 
		movls       r2, r2, lsl #8 
		bcc         L_002 
		cmp         r2, r1, lsr #1 
		bhi         L_003 
		cmp         r2, r1, lsr #2 
		bhi         L_004 
		cmp         r2, r1, lsr #3 
		bhi         L_005 
		cmp         r2, r1, lsr #4 
		bhi         L_006 
		cmp         r2, r1, lsr #5 
		bhi         L_007 
		cmp         r2, r1, lsr #6 
		bhi         L_008 
		cmp         r2, r1, lsr #7 
		bhi         L_009 
L_010:
		movhi       r2, r2, lsr #8 
		cmp         r1, r2, lsl #7 
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #7 
		cmp         r1, r2, lsl #6 
L_009:
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #6 
		cmp         r1, r2, lsl #5
L_008:
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #5 
		cmp         r1, r2, lsl #4 
L_007:
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #4 
		cmp         r1, r2, lsl #3 
L_006:
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #3 
		cmp         r1, r2, lsl #2 
L_005:
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #2 
		cmp         r1, r2, lsl #1 
L_004:	
		adc         r3, r3, r3 
		subcs       r1, r1, r2, lsl #1 
L_003:
		cmp         r1, r2 
		adc         r3, r3, r3 
		subcs       r1, r1, r2 
		cmp         r2, r0 
		bne         L_010 
		mov         r0, r3 
		movs        r12, r12, lsl #1 
		rsbcs       r0, r0, #0 
		rsbmi       r1, r1, #0 
		bx          lr
L_001:
@//		ldr		12, [pc, #0x10]		@///0x03fad158
@//		ldr		r0, [pc, #0x10]		@// 0xc0000094			
		mov		r0, #0				@//SB
		mov		r1, #0 
		mov     r2, #0 
		mov     r3, #0 
		bx          lr
@//SB	mov     pc, r12 
		.long	0x03fad158
		.long	0xc0000094			@// Error divide by 0



L03F91704:
		stmdb       sp!, {r4 - r6, r10, r11} 
		orrs        r11, r2, r3 
		bne         L_0200 
@//		bl          03FAD158  //Error
		mvn         r0, #0 
		mvn         r1, #0 
		mvn         r2, #0 
		mvn         r3, #0 
		b           L_0202 
L_0200:  
		mov         r5, #0 
		mov         r6, #0 
		cmp         r3, r1 
		bhi         L_0202 
		bcc         L_0203 
		cmp         r2, r0 
		bhi         L_0202 
L_0203:
		ands        r11, r3, #2, 2 
		bpl         L_0204 
		mov         r5, #1 
	    subs        r0, r0, r2 
		sbc         r1, r1, r3 
		b           L_0202 
L_0204:
		mov         r10, #1 
		mov         r4, #0 
L_0206:
		mov         r3, r3, lsl #1 
		mov         r11, r4, lsl #1 
		orr         r3, r3, r2, lsr #31 
		orr         r4, r11, r10, lsr #31 
		mov         r10, r10, lsl #1 
		mov         r2, r2, lsl #1 
		movs        r11, r3, lsr #31 
		bne         L_0205 
		cmp         r3, r1 
		bcc         L_0206 
		bhi         L_0207 
		cmp         r2, r0 
		bls         L_0206 
		b           L_0207 
L_0208:
		adds        r5, r10, r5 
		adc         r6, r4, r6 
		subs        r0, r0, r2 
		sbc         r1, r1, r3 
L_0207:
		mov         r11, r3, lsl #31 
		orr         r2, r11, r2, lsr #1 
		mov         r11, r4, lsl #31 
		orr         r10, r11, r10, lsr #1 
		mov         r4, r4, lsr #1 
		mov         r3, r3, lsr #1 
L_0205:
		orrs        r11, r10, r4 
		beq         L_0202 
		cmp         r3, r1 
		bcc         L_0208 
		bhi         L_0207 
		cmp         r2, r0 
		bls         L_0208 
		b           L_0207 
L_0202:	
		mov         r2, r0 
		mov         r3, r1 
		mov         r0, r5 
		mov         r1, r6 
		ldmia       sp!, {r4 - r6, r10, r11} 
		bx          lr

L03F917FC:
		stmdb       sp!, {r10, r11, lr} 
		ands        r10, r1, #2, 2 
		bpl         L_0100 
		rsbs        r0, r0, #0 
		rsc         r1, r1, #0 
L_0100:
		ands        r11, r3, #2, 2 
		bpl         L_0101 
		rsbs        r2, r2, #0 
		rsc         r3, r3, #0 
L_0101:
		bl          L03F91704 
		cmp         r10, #0 
		beq         L_0102 
		rsbs        r2, r2, #0 
		rsc         r3, r3, #0 
L_0102:
		cmp         r10, r11 
		beq         L_0103 
		rsbs        r0, r0, #0 
		rsc         r1, r1, #0 
L_0103:
		ldmia       sp!, {r10, r11, lr} 
		bx          lr   


___rt_sdiv64by64:
		stmdb       sp!, {lr} 
		bl          L03F917FC 
		ldmia       sp!, {lr} 
		bx          lr   
#endif 
