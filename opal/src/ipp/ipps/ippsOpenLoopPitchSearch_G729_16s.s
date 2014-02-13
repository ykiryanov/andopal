        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearch_G729_16s


_ippsOpenLoopPitchSearch_G729_16s:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x7F, 30
        cmp     r0, #0
        mov     r4, r1
        beq     LDQS4
        cmp     r4, #0
        beq     LDQS4
        mov     r2, #0x1E
        orr     r2, r2, #1, 24
        sub     r6, r0, r2
        mov     r2, #0
        str     r2, [sp]
        add     r3, sp, #0x7B, 30
        mov     r2, #0xDF
        mov     r1, r6
        mov     r0, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r2, [sp, #0x1EC]
        add     r12, sp, #0x4B, 30
        add     r3, sp, #8
        cmn     r2, #7, 2
        mov     r12, r12, asr #1
        and     r12, r12, #3
        rsb     r12, r12, #0
        bgt     LDQS1
        add     r5, r3, r12, lsl #1
        cmp     r2, #2, 14
        add     r1, r5, #6
        bge     LDQS0
        mov     r2, r1
        mov     r0, r6
        mov     r3, #0xDF
        mov     r1, #3
        bl      _ippsLShiftC_16s
        b       LDQS2
LDQS0:
        mov     r0, r6
        mov     r2, #0xDF
        bl      _ippsCopy_16s
        b       LDQS2
LDQS1:
        add     r5, r3, r12, lsl #1
        add     r2, r5, #6
        mov     r0, r6
        mov     r3, #0xDF
        mov     r1, #3
        bl      _ippsRShiftC_16s
LDQS2:
        add     r0, sp, #0x7E, 30
        add     r2, sp, #0x73, 30
        str     r0, [sp, #4]
        str     r2, [sp]
        add     r6, r5, #0x49, 30
        mov     r3, #0x8F
        mov     r2, #0x50
        mov     r1, #0x50
        mov     r0, r6
        bl      _ippsAutoCorrLagMax_Inv_16s
        add     r2, sp, #0x7A, 30
        add     r3, sp, #0x1D, 28
        str     r2, [sp, #4]
        str     r3, [sp]
        mov     r3, #0x4F
        mov     r2, #0x28
        mov     r1, #0x50
        mov     r0, r6
        bl      _ippsAutoCorrLagMax_Inv_16s
        add     r3, sp, #0x79, 30
        add     r2, sp, #0x75, 30
        str     r3, [sp, #4]
        str     r2, [sp]
        mov     r0, r6
        mov     r3, #0x27
        mov     r2, #0x14
        mov     r1, #0x50
        bl      _ippsAutoCorrLagMax_Inv_16s
        ldr     r0, [sp, #0x1F8]
        add     r3, sp, #0x76, 30
        mov     r0, r0, lsl #1
        rsb     r0, r0, #0x49, 30
        add     r0, r5, r0
        mov     r2, #0
        mov     r1, #0x50
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r2, sp, #0x76, 30
        ldr     r3, [r2]
        ldr     r0, [sp, #0x1E8]
        add     r2, sp, #0x76, 30
        mov     r3, r3, lsl #1
        str     r3, [r2]
        mov     r0, r0, lsl #1
        rsb     r0, r0, #0x49, 30
        add     r7, sp, #0x76, 30
        add     r0, r5, r0
        add     r3, r7, #4
        mov     r2, #0
        mov     r1, #0x50
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r0, [sp, #0x1E4]
        ldr     r2, [r7, #4]
        add     r6, sp, #0x76, 30
        mov     r0, r0, lsl #1
        rsb     r0, r0, #0x49, 30
        mov     r2, r2, lsl #1
        str     r2, [r7, #4]
        add     r0, r5, r0
        add     r3, r6, #8
        mov     r1, #0x50
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r2, [r6, #8]
        add     r0, sp, #0x76, 30
        mov     r1, #3
        mov     r2, r2, lsl #1
        str     r2, [r6, #8]
        bl      _ippsInvSqrt_32s_I
        add     r2, sp, #0x1F, 28
        add     r1, sp, #0x76, 30
        add     r0, sp, #0x73, 30
        mov     r3, #3
        bl      ownMul_32s16s
        add     r3, sp, #0x1F, 28
        ldrsh   r3, [r3]
        mov     r0, #0xCD
        orr     r0, r0, #0x1B, 22
        mul     r3, r3, r0
        add     r2, sp, #0x1F, 28
        ldrsh   r2, [r2, #2]
        mov     r3, r3, asr #15
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, r2
        ldrge   r0, [sp, #0x1F8]
        bge     LDQS3
        mul     r2, r2, r0
        ldr     r0, [sp, #0x1E8]
        mov     r2, r2, asr #15
        mov     r2, r2, lsl #16
        mov     r3, r2, asr #16
LDQS3:
        add     r2, sp, #0x1F, 28
        ldrsh   r2, [r2, #4]
        cmp     r3, r2
        ldrlt   r0, [sp, #0x1E4]
        strh    r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x7F, 30
        ldmia   sp!, {r4 - r7, pc}
LDQS4:
        mvn     r0, #7
        add     sp, sp, #0x7F, 30
        ldmia   sp!, {r4 - r7, pc}


