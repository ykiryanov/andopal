        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearch_AMRWB_16s


_ippsOpenLoopPitchSearch_AMRWB_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r12, [sp, #0x3C]
        cmp     r0, #0
        mov     r6, r2
        mov     r7, r3
        beq     LDHM3
        cmp     r1, #0
        beq     LDHM3
        cmp     r6, #0
        beq     LDHM3
        cmp     r7, #0
        beq     LDHM3
        cmp     r10, #0
        beq     LDHM3
        cmp     r9, #0
        beq     LDHM3
        cmp     r5, #0
        beq     LDHM3
        cmp     r4, #0
        beq     LDHM3
        cmp     r8, #0
        beq     LDHM3
        cmp     r12, #0
        ble     LDHM2
        ldrsh   lr, [r8]
        str     r1, [sp]
        mov     r12, r12, lsl #16
        str     lr, [sp, #4]
        ldrsh   r2, [r6]
        mov     r1, r12, asr #16
        mov     r3, r5
        bl      LDHM_ownPitchMedOL
        strh    r0, [r10]
        ldrsh   r12, [r5]
        mov     lr, #0xCD
        orr     lr, lr, #0x13, 22
        cmp     lr, r12
        bge     LDHM0
        mov     r1, r4
        bl      LDHM_ownMedOLag
        strh    r0, [r6]
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        strh    r0, [r7]
        b       LDHM1
LDHM0:
        ldrsh   r0, [r7]
        mov     r1, #0x33
        orr     r1, r1, #0x73, 24
        mul     r1, r0, r1
        mov     r0, r1, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        strh    r0, [r7]
LDHM1:
        mov     r1, #0x66
        orr     r1, r1, #0x66, 24
        cmp     r1, r0
        movle   r0, #1
        movgt   r0, #0
        strh    r0, [r8]
        ldrsh   r1, [r9]
        mov     r0, #0x32
        orr     r0, r0, #0x53, 24
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #17
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r9]
        ldrsh   r5, [r5]
        cmp     r0, r5
        orrlt   r1, r1, #1, 18
        strlth  r1, [r9]
        ldrsh   r1, [r10]
        mov     r0, #0
        mov     r1, r1, lsl #1
        strh    r1, [r10]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LDHM2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LDHM3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LDHM_ownPitchMedOL:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1B, 28
        add     lr, sp, #0x10
        ldr     r9, [sp, #0x1D4]
        ldr     r7, [sp, #0x1D8]
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        add     r12, sp, #0x10
        and     lr, lr, #0xF
        mov     r4, r1
        add     r5, r12, lr
        sub     r1, r0, #0xE6
        mov     r12, #0x62
        str     r12, [sp]
        mov     r8, r2
        mov     r6, r3
        mov     r3, r5
        mov     r2, r4
        bl      _ippsCrossCorr_Fwd_16s32s
        ldr     r10, [pc, #0x5C0]
        cmp     r8, #0
        mvn     r0, #0
        add     r8, r10, r8, lsl #1
        sub     r12, r8, #0x1E
        mov     r8, #0
        mov     lr, #2, 2
        ble     LDHM36
        cmp     r7, #0
        ble     LDHM36
        mov     r11, r8
        mov     r7, r11
        str     r6, [sp, #8]
        str     r4, [sp, #0xC]
LDHM4:
        ldr     r1, [r5], #4
        ldrsh   r2, [r10], #2
        add     r4, r0, #2, 18
        and     r6, r4, r1, asr #1
        mov     r1, r1, asr #16
        mul     r3, r2, r6
        ldrsh   r6, [r12], #2
        mov     r1, r1, lsl #16
        mov     r3, r3, asr #15
        mov     r1, r1, asr #16
        mla     r3, r1, r2, r3
        and     r4, r3, r4
        mul     r1, r4, r6
        mov     r3, r3, asr #15
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        mov     r1, r1, asr #15
        mla     r1, r2, r6, r1
        cmp     r1, lr
        movge   lr, r1
        movge   r11, r7
        add     r7, r7, #1
        cmp     r7, #0x62
        blt     LDHM4
        ldr     r6, [sp, #8]
        ldr     r4, [sp, #0xC]
LDHM5:
        mov     r12, #1
        cmp     r4, #0
        rsb     r5, r11, #0x73
        mov     lr, r12
        ble     LDHM13
        rsb     r7, r5, #0
        mvn     r10, #2, 2
        add     r7, r9, r7, lsl #1
        str     r6, [sp, #8]
LDHM6:
        ldrsh   r11, [r9], #2
        ldrsh   r6, [r7], #2
        mul     r3, r11, r6
        cmn     r3, #7, 2
        mvngt   r3, #2, 2
        bgt     LDHM7
        cmp     r3, #3, 2
        movge   r3, r3, lsl #1
        movlt   r3, #2, 2
LDHM7:
        mov     r1, r8, asr #31
        adds    r8, r8, r3
        adc     r3, r1, r3, asr #31
        subs    r2, r8, r10
        sbcs    r1, r3, #0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        mvnne   r8, #2, 2
        bne     LDHM8
        cmp     r8, #2, 2
        sbcs    r3, r3, r0
        movlt   r8, #2, 2
LDHM8:
        mul     r6, r6, r6
        cmn     r6, #7, 2
        mvngt   r3, #2, 2
        bgt     LDHM9
        cmp     r6, #3, 2
        movge   r3, r6, lsl #1
        movlt   r3, #2, 2
LDHM9:
        mov     r6, lr, asr #31
        adds    lr, lr, r3
        adc     r3, r6, r3, asr #31
        subs    r1, lr, r10
        sbcs    r6, r3, #0
        movlt   r1, #0
        movlt   r6, #0
        orrs    r6, r1, r6
        mvnne   lr, #2, 2
        bne     LDHM10
        cmp     lr, #2, 2
        sbcs    r3, r3, r0
        movlt   lr, #2, 2
LDHM10:
        mul     r11, r11, r11
        mvn     r3, #2, 2
        cmn     r11, #7, 2
        movgt   r6, r3
        bgt     LDHM11
        cmp     r11, #3, 2
        movge   r6, r11, lsl #1
        movlt   r6, #2, 2
LDHM11:
        mov     r11, r12, asr #31
        adds    r12, r12, r6
        adc     r6, r11, r6, asr #31
        subs    r1, r12, r10
        sbcs    r11, r6, #0
        movlt   r1, #0
        movlt   r11, #0
        orrs    r11, r1, r11
        movne   r12, r3
        bne     LDHM12
        cmp     r12, #2, 2
        sbcs    r6, r6, r0
        movlt   r12, #2, 2
LDHM12:
        subs    r4, r4, #1
        bne     LDHM6
        ldr     r6, [sp, #8]
LDHM13:
        ldr     r0, [pc, #0x3F8]
        ldr     r1, [pc, #0x3F8]
        cmp     r8, #0
        mov     r10, #0
        mov     r9, #0x1F
        mov     r4, r8
        moveq   r4, r10
        beq     LDHM16
        cmn     r8, #1
        moveq   r8, #2, 2
        moveq   r4, r9
        beq     LDHM16
        cmp     r8, #0
        mvnlt   r4, r8
        cmp     r4, #0
        moveq   r4, r10
        beq     LDHM15
        movs    r2, r4, lsr #16
        bne     LDHM14
        bic     r4, r4, #0xFF, 8
        bic     r2, r4, #0xFF, 16
        movs    r4, r2, asr #8
        movne   r2, r4, lsl #1
        movne   r4, r1
        moveq   r2, r2, lsl #1
        moveq   r4, r0
        ldrsh   r2, [r4, +r2]
        add     r2, r2, #0x10
        mov     r2, r2, lsl #16
        mov     r4, r2, asr #16
        b       LDHM15
LDHM14:
        movs    r4, r4, lsr #24
        movne   r4, r4, lsl #1
        ldrnesh r4, [r1, +r4]
        moveq   r2, r2, lsl #1
        ldreqsh r4, [r0, +r2]
LDHM15:
        mov     r8, r8, lsl r4
LDHM16:
        cmp     lr, #0
        mov     r7, lr
        moveq   r2, r10
        beq     LDHM19
        cmn     lr, #1
        moveq   lr, #2, 2
        moveq   r2, r9
        beq     LDHM19
        cmp     lr, #0
        mvnlt   r7, lr
        cmp     r7, #0
        moveq   r2, r10
        beq     LDHM18
        movs    r2, r7, lsr #16
        bne     LDHM17
        bic     r7, r7, #0xFF, 8
        bic     r2, r7, #0xFF, 16
        movs    r7, r2, asr #8
        movne   r2, r7, lsl #1
        movne   r7, r1
        moveq   r2, r2, lsl #1
        moveq   r7, r0
        ldrsh   r2, [r7, +r2]
        add     r2, r2, #0x10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDHM18
LDHM17:
        movs    r7, r7, lsr #24
        movne   r7, r7, lsl #1
        ldrnesh r2, [r1, +r7]
        moveq   r2, r2, lsl #1
        ldreqsh r2, [r0, +r2]
LDHM18:
        mov     lr, lr, lsl r2
LDHM19:
        cmp     r12, #0
        mov     r7, r12
        moveq   r9, r10
        beq     LDHM22
        cmn     r12, #1
        moveq   r12, #2, 2
        beq     LDHM22
        cmp     r12, #0
        mvnlt   r7, r12
        cmp     r7, #0
        moveq   r9, r10
        beq     LDHM21
        movs    r9, r7, lsr #16
        bne     LDHM20
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        movs    r9, r7, asr #8
        movne   r7, r9, lsl #1
        movne   r9, r1
        moveq   r7, r7, lsl #1
        moveq   r9, r0
        ldrsh   r7, [r9, +r7]
        add     r7, r7, #0x10
        mov     r7, r7, lsl #16
        mov     r9, r7, asr #16
        b       LDHM21
LDHM20:
        movs    r7, r7, lsr #24
        movne   r7, r7, lsl #1
        ldrnesh r9, [r1, +r7]
        moveq   r9, r9, lsl #1
        ldreqsh r9, [r0, +r9]
LDHM21:
        mov     r12, r12, lsl r9
LDHM22:
        mov     r7, #2, 2
        sub     r7, r7, #2, 18
        cmp     r7, lr
        mvn     r7, #0
        addle   lr, r7, #2, 18
        ble     LDHM23
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDHM23:
        mov     r11, #2, 2
        sub     r11, r11, #2, 18
        cmp     r11, r12
        addle   r12, r7, #2, 18
        ble     LDHM24
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDHM24:
        mul     r12, lr, r12
        movs    r12, r12, lsl #1
        mov     lr, r12
        streq   r12, [sp, #0x1A8]
        beq     LDHM27
        cmn     r12, #1
        beq     LDHM33
        cmp     r12, #0
        mvnlt   lr, r12
        cmp     lr, #0
        beq     LDHM26
        movs    r10, lr, lsr #16
        bne     LDHM25
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r10, lr, asr #8
        movne   lr, r10, lsl #1
        movne   r0, r1
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        add     r0, lr, #0x10
        mov     r0, r0, lsl #16
        mov     r10, r0, asr #16
        b       LDHM26
LDHM25:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r10, [r1, +lr]
        moveq   r10, r10, lsl #1
        ldreqsh r10, [r0, +r10]
LDHM26:
        mov     r12, r12, lsl r10
        str     r12, [sp, #0x1A8]
LDHM27:
        add     r9, r2, r9
        add     r10, r9, r10
        add     r2, sp, #1, 24
        add     r1, sp, #0x6B, 30
        add     r0, sp, #0x6A, 30
        rsb     r12, r10, #0x3E
        strh    r12, [r2, #0xAC]
        bl      ownInvSqrt_32s16s_I
        mov     r0, #2, 2
        sub     r1, r0, #2, 18
        cmp     r1, r8
        addle   r1, r7, #2, 18
        ble     LDHM28
        add     r8, r8, #2, 18
        mov     r8, r8, asr #16
        mov     r8, r8, lsl #16
        mov     r1, r8, asr #16
LDHM28:
        ldr     r12, [sp, #0x1A8]
        sub     r2, r0, #2, 18
        cmp     r2, r12
        addle   r12, r7, #2, 18
        ble     LDHM29
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDHM29:
        mul     r1, r1, r12
        add     r2, sp, #1, 24
        ldrsh   r2, [r2, #0xAC]
        rsb     r4, r4, #0x1F
        mov     r1, r1, lsl #1
        add     r4, r2, r4
        mov     r4, r4, lsl #16
        movs    r4, r4, asr #16
        bmi     LDHM34
        bic     r2, r4, #0xFF, 8
        bic     r12, r2, #0xFF, 16
        mvn     r2, #2, 2
        cmp     r1, r2, asr r12
        bgt     LDHM30
        cmp     r1, r0, asr r12
        movge   r2, r1, lsl r12
        movlt   r2, #2, 2
LDHM30:
        sub     r0, r0, #2, 18
        cmp     r0, r2
        addle   r2, r7, #2, 18
        ble     LDHM31
        add     r2, r2, #2, 18
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDHM31:
        strh    r2, [r6]
LDHM32:
        mov     r5, r5, lsl #16
        mov     r0, r5, asr #16
        add     sp, sp, #0x1B, 28
        ldmia   sp!, {r4 - r11, pc}
LDHM33:
        mov     r0, #2, 2
        str     r0, [sp, #0x1A8]
        mov     r10, #0x1F
        b       LDHM27
LDHM34:
        rsb     r4, r4, #0
        mov     r4, r1, asr r4
        sub     r0, r0, #2, 18
        cmp     r0, r4
        addle   r4, r7, #2, 18
        ble     LDHM35
        add     r4, r4, #2, 18
        mov     r4, r4, asr #16
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDHM35:
        strh    r4, [r6]
        b       LDHM32
LDHM36:
        mov     r11, r8
        mov     r1, r11
LDHM37:
        ldr     r7, [r5], #4
        ldrsh   r2, [r10], #2
        add     r12, r0, #2, 18
        and     r12, r12, r7, asr #1
        mov     r7, r7, asr #16
        mul     r12, r2, r12
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        mov     r12, r12, asr #15
        mla     r12, r7, r2, r12
        cmp     r12, lr
        movge   lr, r12
        movge   r11, r1
        add     r1, r1, #1
        cmp     r1, #0x62
        blt     LDHM37
        b       LDHM5
LDHM_ownMedOLag:
        ldrsh   r3, [r1, #6]
        ldrsh   r2, [r1, #4]
        strh    r3, [r1, #8]
        ldrsh   r3, [r1, #2]
        strh    r2, [r1, #6]
        ldrsh   r2, [r1]
        strh    r0, [r1]
        strh    r3, [r1, #4]
        strh    r2, [r1, #2]
        mov     r0, r1
        mov     r1, #5
        b       ownGmed_n
        .long   CorrWgtTbl
        .long   NormTable2
        .long   NormTable


