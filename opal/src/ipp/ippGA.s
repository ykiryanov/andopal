.macro gl arg1
		.global \arg1
		\arg1:
.endm
 

#include "ippGA/UpdCoefsa.s"
#include "ippGA/CntlrUpd.s"
#include "ippGA/FltNLMSa.s"
#include "ippGA/StpSzUpd.s"
#include "ippGA/Shared.s"
#include "ippGA/ippsAddWeightedQ31_32s.s"

#include "ipps/lshrdi3.s"
#include "ipps/floatsidf.s"
#include "ipps/dbl_add.s"
#include "ipps/dbl_multiply.s"
#include "ipps/dbl_divide.s"
#include "ipps/fixdfsi.s"
#include "ipps/xsc_cos.s"
#include "ipps/xsc_sin.s"
#include "ipps/ippsZero_32s.s"
#include "ipps/ipps_BitRev1_8.s"
#include "ipps/ipps_BitRev1_16.s"
#include "ipps/ipps_cnvrt_16s64s.s"
#include "ipps/ipps_cnvrt_32s64s.s"
#include "ipps/ipps_cnvrt_64s16s.s"
#include "ipps/ippsConvert_32s64f_Sfs.s"
#include "ipps/ipps_cnvrt_64s32s.s"
#include "ipps/ipps_ibMpyBySqrt2_64s.s"
#include "ipps/ipps_initTabBitRev.s"
#include "ipps/ipps_initTabTwdBase_32s.s"
#include "ipps/ipps_initTabTwd_R4_32s.s"
#include "ipps/ipps_jCcsRecombine_32s.s"
#include "ipps/ipps_jFft_Core_32s.s"
#include "ipps/ipps_jRealRecombine_32s.s"

#include "ipps/ippsFFTFree_C_32sc.s"
#include "ipps/ippsFFTFree_R_16s32s.s"
#include "ipps/ippsFFTFree_R_32s.s"
#include "ipps/ippsFFTFwd_CToC_32sc_Sfs.s"
#include "ipps/ippsFFTFwd_RToCCS_16s32s_Sfs.s"
#include "ipps/ippsFFTGetBufSize_C_32sc.s"
#include "ipps/ippsFFTGetBufSize_R_16s32s.s"
#include "ipps/ippsFFTGetBufSize_R_32s.s"
#include "ipps/ippsFFTInitAlloc_C_32sc.s"
#include "ipps/ippsFFTInitAlloc_R_16s32s.s"
#include "ipps/ippsFFTInitAlloc_R_32s.s"
#include "ipps/ippsFFTInv_CCSToR_32s16s_Sfs.s"
#include "ipps/ippsFFTInv_CCSToR_32s_Sfs.s"
#include "ipps/ippsMagSquared_32sc32s_Sfs.s"


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
//		ldr		12, [pc, #0x10]	///0x03fad158
//		ldr		r0, [pc, #0x10] // 0xc0000094			
		mov		r0, #0			//SB
		mov		r1, #0 
		mov     r2, #0 
		mov     r3, #0 
		bx          lr
//SB	mov     pc, r12 
		.long	0x03fad158
		.long	0xc0000094		// Error divide by 0



L03F91704:
		stmdb       sp!, {r4 - r6, r10, r11} 
		orrs        r11, r2, r3 
		bne         L_0200 
//		bl          03FAD158  //Error
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
