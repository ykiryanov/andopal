        .text
        .align  4
        .globl  _ippsAdaptiveCodebookGainCoeff_AMRWB_16s


_ippsAdaptiveCodebookGainCoeff_AMRWB_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r5, [sp, #0x30]
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r8, r2
        mov     r7, r3
        beq     LDHO13
        cmp     r4, #0
        beq     LDHO13
        cmp     r8, #0
        beq     LDHO13
        cmp     r7, #0
        beq     LDHO13
        cmp     r5, #0
        ble     LDHO11
        add     r3, sp, #8
        mvn     r9, #0
        str     r9, [sp]
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r10, [sp, #8]
        mov     lr, #2, 2
        mvn     r11, #2, 2
        adds    r12, r10, #1
        mov     r10, r10, asr #31
        adc     r10, r10, #0
        subs    r0, r12, r11
        sbcs    r1, r10, #0
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        movne   r12, r11
        bne     LDHO0
        cmp     r12, #2, 2
        sbcs    r10, r10, r9
        movlt   r12, #2, 2
LDHO0:
        ldr     r10, [pc, #0x25C]
        ldr     r9, [pc, #0x25C]
        cmp     r12, #0
        mov     r0, r12
        moveq   lr, #0
        streq   r12, [sp, #8]
        beq     LDHO3
        cmn     r12, #1
        beq     LDHO12
        cmp     r12, #0
        mvnlt   r0, r12
        cmp     r0, #0
        moveq   lr, #0
        beq     LDHO2
        movs    lr, r0, lsr #16
        bne     LDHO1
        bic     r0, r0, #0xFF, 8
        bic     lr, r0, #0xFF, 16
        movs    r0, lr, asr #8
        movne   lr, r0, lsl #1
        movne   r0, r10
        moveq   lr, lr, lsl #1
        moveq   r0, r9
        ldrsh   lr, [r0, +lr]
        add     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDHO2
LDHO1:
        movs    r0, r0, lsr #24
        movne   r0, r0, lsl #1
        ldrnesh lr, [r10, +r0]
        moveq   lr, lr, lsl #1
        ldreqsh lr, [r9, +lr]
LDHO2:
        mov     r12, r12, lsl lr
        str     r12, [sp, #8]
LDHO3:
        rsb     lr, lr, #0x1E
        strh    lr, [r8, #2]
        mov     r1, r4
        add     r3, sp, #8
        mvn     r4, #0
        str     r4, [sp]
        mov     r2, r5
        mov     r0, r6
        mov     r5, r12, asr #16
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r1, [sp, #8]
        mov     r5, r5, lsl #16
        adds    r0, r1, #1
        mov     r1, r1, asr #31
        adc     r12, r1, #0
        subs    lr, r0, r11
        mov     r1, r5, asr #16
        sbcs    r5, r12, #0
        movlt   lr, #0
        movlt   r5, #0
        orrs    r5, lr, r5
        movne   r0, r11
        bne     LDHO4
        cmp     r0, #2, 2
        sbcs    r12, r12, r4
        movlt   r0, #2, 2
LDHO4:
        cmp     r0, #0
        mov     r4, #0
        mov     lr, r0
        moveq   r12, r4
        beq     LDHO7
        cmn     r0, #1
        moveq   r0, #2, 2
        moveq   r12, #0x1F
        beq     LDHO7
        cmp     r0, #0
        mvnlt   lr, r0
        cmp     lr, #0
        moveq   r12, r4
        beq     LDHO6
        movs    r12, lr, lsr #16
        bne     LDHO5
        bic     lr, lr, #0xFF, 8
        bic     r12, lr, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        movne   r9, r10
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r9, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDHO6
LDHO5:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r12, [r10, +lr]
        moveq   r12, r12, lsl #1
        ldreqsh r12, [r9, +r12]
LDHO6:
        mov     r0, r0, lsl r12
LDHO7:
        mov     r0, r0, asr #16
        rsb     r12, r12, #0x1E
        mov     r0, r0, lsl #16
        mov     r12, r12, lsl #16
        movs    r0, r0, asr #16
        mov     r5, r12, asr #16
        strh    r5, [r8, #6]
        strh    r1, [r8]
        strh    r0, [r8, #4]
        bmi     LDHO10
        mov     r0, r0, asr #1
        ldrsh   r8, [r8, #2]
        mov     r0, r0, lsl #15
        bl      __intel_idiv
        sub     r5, r5, r8
        mov     r0, r0, lsl #16
        mov     r1, r5, lsl #16
        mov     r0, r0, asr #16
        movs    r1, r1, asr #16
        bpl     LDHO8
        rsb     r1, r1, #0
        mov     r1, r0, asr r1
        mov     r0, r1, lsl #16
        mov     r1, r0, asr #16
        b       LDHO9
LDHO8:
        bic     r2, r1, #0xFF, 8
        mvn     r12, #0xFF
        bic     r1, r12, #0x7F, 24
        mvn     r12, r1
        bic     r2, r2, #0xFF, 16
        cmp     r0, r12, asr r2
        sub     r12, r4, #2, 18
        subgt   r4, r4, #2, 18
        mvngt   r1, r4
        bgt     LDHO9
        cmp     r0, r12, asr r2
        blt     LDHO9
        mov     r2, r0, lsl r2
        mov     r0, r2, lsl #16
        mov     r1, r0, asr #16
LDHO9:
        mov     r0, #0xCD
        orr     r0, r0, #0x13, 22
        cmp     r0, r1
        mov     r4, r1
        movlt   r4, r0
LDHO10:
        mov     r0, #0
        strh    r4, [r7]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDHO11:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDHO12:
        str     lr, [sp, #8]
        mov     r12, #2, 2
        mov     lr, #0x1F
        b       LDHO3
LDHO13:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


