/*
 * h264decode.s
 * BoneLib.4.2
 *
 * Created by Sergey Bezruchkin on 7/9/11.
 * Copyright 2011 Dinsk. All rights reserved.
 */

#include "TargetConditionals.h"
#if !TARGET_IPHONE_SIMULATOR
@.cpu arm1136j-s
.cpu cortex-a9

.data
.align  4

DataII:
		.long	0
		
	.text
	.align 4

    .globl  arm_H264_Add_4x4
    .globl  arm_H264_Trans4x4
    .globl  arm_H264_Trans4x4_1

arm_H264_Add_4x4:
/*
    r0 - pPlane
    r1 - nStep
    r2 - value
*/
    add     r2, r2, #32
	ssat    r2, #9, r2, asr #6
/* !!!!!!!!    
    rsbs    r3, r2, #0
    bgt     _m1
    
    orr     r2, r2, r2, lsl #8
    orr     r2, r2, r2, lsl #16
    ldr     r3,[r0]
    uqadd8  r3, r3, r2
    str     r3, [r0], +r1

    ldr     r3,[r0]
    uqadd8  r3, r3, r2
    str     r3, [r0], +r1

    ldr     r3,[r0]
    uqadd8  r3, r3, r2
    str     r3, [r0], +r1
    
    ldr     r3,[r0]
    uqadd8  r3, r3, r2
    str     r3, [r0]
    
    bx      lr

_m1:    
    orr     r2, r3, r3, lsl #8
    orr     r2, r2, r2, lsl #16

    ldr     r3,[r0]
    uqsub8  r3, r3, r2
    str     r3, [r0], +r1

    ldr     r3,[r0]
    uqsub8  r3, r3, r2
    str     r3, [r0], +r1

    ldr     r3,[r0]
    uqsub8  r3, r3, r2
    str     r3, [r0], +r1
    
    ldr     r3,[r0]
    uqsub8  r3, r3, r2
    str     r3, [r0]
*/    
    bx      lr
    
	.text
    	


/*
.macro asr16
    swp16   $2, $0
    mov     $1, $0, asr $3
    pckb    $1, $1, asr $3
.endmacro



//      Ipp32s v0 = mIn[0] + mIn[2];
//      Ipp32s v1 = mIn[0] - mIn[2];
//      Ipp32s v2 = (mIn[1] >> 1) - mIn[3];
//      Ipp32s v3 = mIn[1] + (mIn[3] >> 1);
//
//      mOut[0]  = (v0 + v3);
//      mOut[4]  = (v1 + v2);
//      mOut[8]  = (v1 - v2);
//      mOut[12] = (v0 - v3);


.macro MulT4x4_0
        ldr         lr, [r10], #4              // 
        smulbb      $0, $2, lr                 // $0 = m0
        smultt      $1, $2, lr                 // $1 = m1
                
        ldr         lr, [r10], #4              
        smulbb      $2, $3, lr                 // $2 = m2
        pkhbt       $0, $2, $0, lsl #16        // $0 = [m0, m2]
        
        smultt      $3, $3, lr                  // $3 = i3
        mov         $2, $3, asr #1              // $2 = m1/2
        pkhbt       $3, $3, $1, lsl #16         // $3 = [m1, m3] 
        pkhbt       $2, $2, $1, lsl #15         // $2 = [m1/2, m3/2]     
.endmacro

.macro AddGlobalCoeff        
        cmp         lr, #0
        ldrne       lr, [lr]
        pkhbtne     r0, r0, lr, lsl #16        
        trans_1     r0, r1, r2, r3
.endmacro        
  

.macro trans_1
        qsubaddx    $2, $2, $3					@// [m1/2 - m3, m1 + m3/2] = [v2, v3]                          
        qsubaddx    $3, $0, $0                  @// [m0-m2, m0+m2] = [v1, v0]     
        qsub16      $1, $3, $2                  @// [v1-v2, v0-v3] = [m2, m3]
        qadd16      $0, $3, $2                  @// [v1+v2, v0+v3] = [m1, m0] 
        rev16       $1, $1  
        rev         $1, $1                      @// [m3, m2]
.endmacro
        

.macro trans2
@//      Ipp32s v0 = mIn[0] + mIn[2];
@//      Ipp32s v1 = mIn[0] - mIn[2];
@//      Ipp32s v2 = (mIn[1] >> 1) - mIn[3];
@//      Ipp32s v3 = mIn[1] + (mIn[3] >> 1);
        
        qsub16  r10, $0, $2						@// r10 = m0-m2 = v1
        qadd16  $0, $0, $2						@// $0  = m0+m2 = v0
        
        mov     r11, $1, asr #1
        sxth    r9, $1 
        pkhtb   r11, r11, r9, asr #1
        qsub16  r11, r11, $3					@// r11 = m1/2 - m3 = v2
        
        mov     r12, $3, asr #1
        sxth    r9, $3
        pkhtb   r12, r12, r9, asr #1 
        qadd16  r12, r12, $1                     @// r12 = m3/2 + m1 = v3
        
@//     p[0]  = Ipp16s((v0 + v3 + 0x20)>>6);
@//     p[4]  = Ipp16s((v1 + v2 + 0x20)>>6);
@//     p[8]  = Ipp16s((v1 - v2 + 0x20)>>6);
@//     p[12] = Ipp16s((v0 - v3 + 0x20)>>6);

        qadd16  $0, $0, r8
        qadd16  r10, r10, r8					@// v1 + 0x020

        qsub16  r9, $0, r12						@// (v0 - v3 + 0x20)>>6
        mov     $3, r9, asr #6
        sxth    r9, r9 
        pkhtb   $3, $3, r9, asr #6
        
        qsub16  r9, r10, r11					@// (v1 - v2 + 0x20)>>6
        mov     $2, r9, asr #6
        sxth    r9, r9 
        pkhtb   $2, $2, r9, asr #6
        
        qadd16  r9, r10, r11					@// (v1 + v2 + 0x20)>>6)
        mov     $1, r9, asr #6
        sxth    r9, r9 
        pkhtb   $1, $1, r9, asr #6
        
        qadd16  r9, $0, r12						@// (v0 + v3 + 0x20)>>6);
        mov     $0, r9, asr #6
        sxth    r9, r9 
        pkhtb   $0, $0, r9, asr #6
.endmacro

.macro WordsdToBytes
        pkhbt    $3, $1, $2, lsl #16
        pkhtb    $4, $2, $1, asr #16
        and      $4, $4, $5
        mov      $4, $4, lsl #8
        uxtab16  $0, $4, $3
.endmacro

.macro ResortToCoeff
        pkhbt    $2, $0, $1, lsl #16
        pkhtb    $3, $1, $0, asr #16
.endmacro

.macro  t4x4_add4w
        ldr     $4, [$2]
        uxtab16 $0, $0, $4
        uxtab16 $1, $1, $4, ror #8
        usat16  $0, #8, $0
        usat16  $1, #8, $1
        orr     $0, $1, lsl #8
        str     $0, [$2], $3
.endmacro

.macro  t4x4_add4
        ssub8   r5, r4, $2
        ldr     r8, [$0]
        sel     r7, r5, r4
        sel     r6, r4, $2 
        uqsub8  r8, r8, r7
        uqadd8  r8, r8, r6
        str     r8, [$0], $1
.endmacro

.macro MulAddShftRight_0
        ldr         lr, [r10], #4 
        smlabb      $0, $2, lr, r11				@// $0 = m0
        smlatt      $1, $2, lr, r11				@// $1 = m1
        mov         $0, $0, asr r12
        mov         $1, $1, asr r12
                
        ldr         lr, [r10], #4              
        smlabb      $2, $3, lr, r11				@// $2 = m2
        mov         $2, $2, asr r12
        pkhbt       $0, $2, $0, lsl #16			@// $0 = [m0, m2]
        
        smlatt      $3, $3, lr, r11				@// $3 = i3
        mov         $3, $3, asr r12
        mov         $2, $3, asr #1				@// $2 = m1/2
        pkhbt       $3, $3, $1, lsl #16			@// $3 = [m1, m3] 
        pkhbt       $2, $2, $1, lsl #15			@// $2 = [m1/2, m3/2]     
.endmacro


.macro MulShftLeft_0
        ldr         lr, [r10], #4              
        smulbb      $0, $2, lr					@// $0 = m0
        smultt      $1, $2, lr					@// $1 = m1
        mov         $0, $0, lsl r12
        mov         $1, $1, lsl r12
                
        ldr         lr, [r10], #4              
        smulbb      $2, $3, lr					@// $2 = m2
        mov         $2, $2, lsl r12
        pkhbt       $0, $2, $0, lsl #16			@// $0 = [m0, m2]
        
        smultt      $3, $3, lr					@// $3 = i3
        mov         $3, $3, lsl r12
        mov         $2, $3, asr #1              @// $2 = m1/2
        pkhbt       $3, $3, $1, lsl #16         @// $3 = [m1, m3] 
        pkhbt       $2, $2, $1, lsl #15         @// $2 = [m1/2, m3/2]     
.endmacro


.macro MulT4x4
        MulT4x4_0   $0, $1, $2, $3
        trans_1     $0, $1, $2, $3
.endmacro

.macro MulAddShftRight
        MulAddShftRight_0   $0, $1, $2, $3
        trans_1             $0, $1, $2, $3
.endmacro            

.macro MulShftLeft
        MulShftLeft_0   $0, $1, $2, $3
        trans_1         $0, $1, $2, $3
.endmacro            
*/

.macro asr16		arg0 arg1 arg2
    swp16   \arg2, \arg0
    mov     \arg1, \arg0, asr $3
    pckb    \arg1, \arg1, asr $3
.endm

.macro MulT4x4_0	arg0 arg1 arg2 arg3
        ldr         lr, [r10], #4 
        smulbb      \arg0, \arg2, lr				@// \arg0 = m0
        smultt      \arg1, \arg2, lr				@// \arg1 = m1
                
        ldr         lr, [r10], #4              
        smulbb      \arg2, \arg3, lr				@// \arg2 = m2
        pkhbt       \arg0, \arg2, \arg0, lsl #16	@// \arg0 = [m0, m2]
        
        smultt      \arg3, \arg3, lr				@// \arg3 = i3
        mov         \arg2, \arg3, asr #1			@// \arg2 = m1/2
        pkhbt       \arg3, \arg3, \arg1, lsl #16	@// \arg3 = [m1, m3] 
        pkhbt       \arg2, \arg2, \arg1, lsl #15	@// \arg2 = [m1/2, m3/2]     
.endm

.macro AddGlobalCoeff        
        cmp         lr, #0
        ldrne       lr, [lr]
        pkhbtne     r0, r0, lr, lsl #16        
        trans_1     r0, r1, r2, r3
.endm 
  

.macro trans_1		arg0 arg1 arg2 arg3
        qsubaddx    \arg2, \arg2, \arg3				@// [m1/2 - m3, m1 + m3/2] = [v2, v3]                              
        qsubaddx    \arg3, \arg0, \arg0				@// [m0-m2, m0+m2] = [v1, v0]     
        qsub16      \arg1, \arg3, \arg2				@// [v1-v2, v0-v3] = [m2, m3]
        qadd16      \arg0, \arg3, \arg2				@// [v1+v2, v0+v3] = [m1, m0] 
        rev16       \arg1, \arg1  
        rev         \arg1, \arg1					@// [m3, m2]
.endm
        

.macro trans2		arg0 arg1 arg2 arg3
@//     Ipp32s v0 = mIn[0] + mIn[2];
@//     Ipp32s v1 = mIn[0] - mIn[2];
@//     Ipp32s v2 = (mIn[1] >> 1) - mIn[3];
@//     Ipp32s v3 = mIn[1] + (mIn[3] >> 1);
        
        qsub16  r10, \arg0, \arg2					@// r10 = m0-m2 = v1
        qadd16  \arg0, \arg0, \arg2                 @// \arg0  = m0+m2 = v0
        
        mov     r11, \arg1, asr #1
        sxth    r9, \arg1 
        pkhtb   r11, r11, r9, asr #1
        qsub16  r11, r11, \arg3						@// r11 = m1/2 - m3 = v2
        
        mov     r12, \arg3, asr #1
        sxth    r9, \arg3
        pkhtb   r12, r12, r9, asr #1 
        qadd16  r12, r12, \arg1                     @// r12 = m3/2 + m1 = v3
        
@//     p[0]  = Ipp16s((v0 + v3 + 0x20)>>6);
@//     p[4]  = Ipp16s((v1 + v2 + 0x20)>>6);
@//     p[8]  = Ipp16s((v1 - v2 + 0x20)>>6);
@//     p[12] = Ipp16s((v0 - v3 + 0x20)>>6);

        qadd16  \arg0, \arg0, r8
        qadd16  r10, r10, r8						@// v1 + 0x020

        qsub16  r9, \arg0, r12						@// (v0 - v3 + 0x20)>>6
        mov     \arg3, r9, asr #6
        sxth    r9, r9 
        pkhtb   \arg3, \arg3, r9, asr #6
        
        qsub16  r9, r10, r11						@// (v1 - v2 + 0x20)>>6
        mov     \arg2, r9, asr #6
        sxth    r9, r9 
        pkhtb   \arg2, \arg2, r9, asr #6
        
        qadd16  r9, r10, r11						@// (v1 + v2 + 0x20)>>6)
        mov     \arg1, r9, asr #6
        sxth    r9, r9 
        pkhtb   \arg1, \arg1, r9, asr #6
        
        qadd16  r9, \arg0, r12						@// (v0 + v3 + 0x20)>>6);
        mov     \arg0, r9, asr #6
        sxth    r9, r9 
        pkhtb   \arg0, \arg0, r9, asr #6
.endm

.macro WordsdToBytes	arg0 arg1 arg2 arg3 arg4 arg5
        pkhbt    \arg3, \arg1, \arg2, lsl #16
        pkhtb    \arg4, \arg2, \arg1, asr #16
        and      \arg4, \arg4, \arg5
        mov      \arg4, \arg4, lsl #8
        uxtab16  \arg0, \arg4, \arg3
.endm

.macro ResortToCoeff	arg0 arg1 arg2 arg3
        pkhbt    \arg2, \arg0, \arg1, lsl #16
        pkhtb    \arg3, \arg1, \arg0, asr #16
.endm

.macro  t4x4_add4w	arg0 arg1 arg2 arg3 arg4
        ldr     \arg4, [\arg2]
        uxtab16 \arg0, \arg0, \arg4
        uxtab16 \arg1, \arg1, \arg4, ror #8
        usat16  \arg0, #8, \arg0
        usat16  \arg1, #8, \arg1
        orr     \arg0, \arg1, lsl #8
        str     \arg0, [\arg2], \arg3
.endm

.macro  t4x4_add4	arg0 arg1 arg2 arg3
        ssub8   r5, r4, \arg2
        ldr     r8, [\arg0]
        sel     r7, r5, r4
        sel     r6, r4, \arg2 
        uqsub8  r8, r8, r7
        uqadd8  r8, r8, r6
        str     r8, [\arg0], \arg1
.endm

.macro MulAddShftRight_0	arg0 arg1 arg2 arg3
        ldr         lr, [r10], #4						 
        smlabb      \arg0, \arg2, lr, r11			@// \arg0 = m0
        smlatt      \arg1, \arg2, lr, r11			@// \arg1 = m1
        mov         \arg0, \arg0, asr r12
        mov         \arg1, \arg1, asr r12
                
        ldr         lr, [r10], #4              
        smlabb      \arg2, \arg3, lr, r11			@// \arg2 = m2
        mov         \arg2, \arg2, asr r12
        pkhbt       \arg0, \arg2, \arg0, lsl #16	@// \arg0 = [m0, m2]
        
        smlatt      \arg3, \arg3, lr, r11			@// \arg3 = i3
        mov         \arg3, \arg3, asr r12
        mov         \arg2, \arg3, asr #1			@// \arg2 = m1/2
        pkhbt       \arg3, \arg3, \arg1, lsl #16	@// \arg3 = [m1, m3] 
        pkhbt       \arg2, \arg2, \arg1, lsl #15	@// \arg2 = [m1/2, m3/2]     
.endm


.macro MulShftLeft_0	arg0 arg1 arg2 arg3
        ldr         lr, [r10], #4
        smulbb      \arg0, \arg2, lr				@// \arg0 = m0
        smultt      \arg1, \arg2, lr                @// \arg1 = m1
        mov         \arg0, \arg0, lsl r12
        mov         \arg1, \arg1, lsl r12
                
        ldr         lr, [r10], #4              
        smulbb      \arg2, \arg3, lr				@// \arg2 = m2
        mov         \arg2, \arg2, lsl r12
        pkhbt       \arg0, \arg2, \arg0, lsl #16	@// \arg0 = [m0, m2]
        
        smultt      \arg3, \arg3, lr				@// \arg3 = i3
        mov         \arg3, \arg3, lsl r12
        mov         \arg2, \arg3, asr #1			@// \arg2 = m1/2
        pkhbt       \arg3, \arg3, \arg1, lsl #16	@// \arg3 = [m1, m3] 
        pkhbt       \arg2, \arg2, \arg1, lsl #15	@// \arg2 = [m1/2, m3/2]     
.endm


.macro MulT4x4		arg0 arg1 arg2 arg3
        MulT4x4_0   \arg0, \arg1, \arg2, \arg3
        trans_1     \arg0, \arg1, \arg2, \arg3
.endm

.macro MulAddShftRight	arg0 arg1 arg2 arg3
        MulAddShftRight_0   \arg0, \arg1, \arg2, \arg3
        trans_1             \arg0, \arg1, \arg2, \arg3
.endm       

.macro MulShftLeft		arg0 arg1 arg2 arg3
        MulShftLeft_0   \arg0, \arg1, \arg2, \arg3
        trans_1         \arg0, \arg1, \arg2, \arg3
.endm     


.equ	pYPlane,				0x00
.equ	pCoeff,					0x04
@//#define pQuantTable             [sp, #0x08]
.equ	pGlobalCoeff,			0x0C
.equ	nStep,					0x38
.equ	qAdd,					0x3C
.equ	qShiftRight,			0x40
.equ	qShiftLeft,				0x44


        
arm_H264_Trans4x4:
/*
//      Ipp8u*          pYPlane,                  0x00
//      Ipp16s*         pCoeff,                   0x04
//      const Ipp16s*   pQuantTable,              0x08
//      const Ipp16s*   pGlobalCoeff,             0x0C
//      uint            nStep,                    0x38
//      uint            qAdd,                     0x3C
//      uint            qShiftRight,              0x40
//      uint            qShiftLeft,               0x44
*/

        stmdb       sp!, {r0-r12,lr}
        mov         r10, r2									@// pQuantTable
        ldmia       r1!, {r2-r9}           
@//-----------------------------------------------------------------------------
		ldr			r11, [sp, #qAdd]

        cmp         r11, #0
        beq         mMultShiftLeft
        ldr         r12, [sp, #0x40]						@// qShiftRight    

        MulAddShftRight_0   r0, r1, r2, r3
        ldr                 lr, [sp, #pGlobalCoeff]
        AddGlobalCoeff
        MulAddShftRight     r2, r3, r4, r5 
        MulAddShftRight     r4, r5, r6, r7 
        MulAddShftRight     r6, r7, r8, r9
        b   mTrans2
@//-----------------------------------------------------------------------------
mMultShiftLeft:
        ldr     r12, [sp, #0x44]							@// qShiftLeft
        cmp     r12, #0
        beq     mMult
        
        MulShftLeft_0   r0, r1, r2, r3 
        ldr             lr, [sp, #pGlobalCoeff]
        AddGlobalCoeff
        MulShftLeft     r2, r3, r4, r5
        MulShftLeft     r4, r5, r6, r7 
        MulShftLeft     r6, r7, r8, r9        
        b   mTrans2
        
@//-----------------------------------------------------------------------------
mMult:
        MulT4x4_0       r0, r1, r2, r3 
        ldr             lr, [sp, #pGlobalCoeff]
        AddGlobalCoeff
        MulT4x4         r2, r3, r4, r5 
        MulT4x4         r4, r5, r6, r7
        MulT4x4         r6, r7, r8, r9    
        
@//-----------------------------------------------------------------------------
mTrans2:
        mov     r8, #0x020
        orr     r8, r8, r8, lsl #16
        
        trans2  r0, r2, r4, r6
        trans2  r1, r3, r5, r7
        
        ldr     r8, [sp, #pCoeff]
        stmia   r8!, {r0-r7}      
        
@//-----------------------------------------------------------------------------
#if 0
        mov     r9, #0x0FF
        orr     r9, r9, r9, lsl #16
        
        WordsdToBytes r0, r0, r1, r10, r11, r9
        WordsdToBytes r1, r2, r3, r10, r11, r9
        WordsdToBytes r2, r4, r5, r10, r11, r9
        WordsdToBytes r3, r6, r7, r10, r11, r9
                
        ldr     r10, [sp, #pYPlane]
        ldr     r11, [sp, #nStep]        
        mov     r4, #0        

        t4x4_add4   r10, r11, r0
        t4x4_add4   r10, r11, r1
        t4x4_add4   r10, r11, r2
        t4x4_add4   r10, r11, r3

        ldmia       sp!, {r0-r12, pc}    
#endif
        
        ResortToCoeff  r6, r7, r8, r9
        ResortToCoeff  r4, r5, r6, r7
        ResortToCoeff  r2, r3, r4, r5
        ResortToCoeff  r0, r1, r2, r3        
        
        ldr     r0, [sp, #pYPlane]
        ldr     r1, [sp, #nStep]        

        t4x4_add4w  r2, r3, r0, r1, r10
        t4x4_add4w  r4, r5, r0, r1, r10
        t4x4_add4w  r6, r7, r0, r1, r10
        t4x4_add4w  r8, r9, r0, r1, r10
        
        ldmia       sp!, {r0-r12, pc}    


.equ	pYPlane_1,				0x00
.equ	nStep_1,				0x04
.equ	pGlobalCoeff_1,			0x30


arm_H264_Trans4x4_1:
@//      Ipp16s*         pCoeff,                   r0
@//      const Ipp16s*   pQuantTable,              r1
@//      Ipp8u*          pYPlane,                  r2. [sp, #0x00]
@//      uint            nStep,                    r3, [sp, #0x04]
@//      const Ipp16s*   pGlobalCoeff,             [sp, 0x30]

        stmdb       sp!, {r2-r12,lr}
        mov         r10, r1							@// pQuantTable
        ldmia       r0!, {r2-r9}
              
@//-----------------------------------------------------------------------------
        MulT4x4_0       r0, r1, r2, r3
        ldr             lr, [sp, #pGlobalCoeff_1]
        AddGlobalCoeff  
        MulT4x4         r2, r3, r4, r5 
        MulT4x4         r4, r5, r6, r7 
        MulT4x4         r6, r7, r8, r9    
        
@//-----------------------------------------------------------------------------
        mov     r8, #0x020
        orr     r8, r8, r8, lsl #16        
        trans2  r0, r2, r4, r6
        trans2  r1, r3, r5, r7                
@//-----------------------------------------------------------------------------
        ResortToCoeff  r6, r7, r8, r9
        ResortToCoeff  r4, r5, r6, r7
        ResortToCoeff  r2, r3, r4, r5
        ResortToCoeff  r0, r1, r2, r3        
        
        ldr     r0, [sp, #pYPlane_1]
        ldr     r1, [sp, #nStep_1]        

        t4x4_add4w  r2, r3, r0, r1, r10
        t4x4_add4w  r4, r5, r0, r1, r10
        t4x4_add4w  r6, r7, r0, r1, r10
        t4x4_add4w  r8, r9, r0, r1, r10
        
        ldmia       sp!, {r2-r12, pc}    
#endif 


/*


        b0 = a0 + a6;
        b2 = a4 + a2;
        b4 = a4 - a2;
        b6 = a0 - a6;

        a1 = -mIn[3] + mIn[5] - mIn[7] - (mIn[7]>>1);
        a3 =  mIn[1] + mIn[7] - mIn[3] - (mIn[3]>>1);
        a5 = -mIn[1] + mIn[7] + mIn[5] + (mIn[5]>>1);
        a7 =  mIn[3] + mIn[5] + mIn[1] + (mIn[1]>>1);

        b1 =   a1 + (a7>>2);
        b7 = -(a1>>2) + a7;
        b3 =   a3 + (a5>>2);
        b5 =  (a3>>2) - a5;

=====================================
rb0 = [ a3 + a5/4, a0 + a6]
rb1 = [ a1/4 - a7, a4 - a2]
rb2 = [ a1 + a7/4, a4 + a2]
rb3 = [ a5 - a3/4, a0 - a6]
----------------
rb0 = [ b3, b0]
rb1 = [-b7, b4]
rb2 = [ b1, b2]
rb3 = [-b5, b6]
====================================
r0 = addsub(rb0, rb1)
r1 = addsub(rb2, rb3)
r2 = addsub(rb3, rb2)
r3 = addsub(rb1, rb0)

r0 = [x2,x0]
r1 = [x3,x1]
r0 = [x6,x4]
r0 = [x7,x5]

*/
