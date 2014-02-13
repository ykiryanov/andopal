        .text
        .align  4
        .globl  _ippsFIRGenMidBand_AMRWBE_16s


_ippsFIRGenMidBand_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r2
        beq     LDGI1
        cmp     r1, #0
        beq     LDGI1
        cmp     r4, #0
        beq     LDGI1
        add     r2, sp, #0xAC
        add     r3, sp, #0xD4
        mov     r0, r5
        bl      LDGI_ownComputeCrossCorrVector_WBE
        add     r2, sp, #0xC0
        add     r1, sp, #8
        mov     r0, r5
        bl      LDGI_ownComputeAutoCorrMatrix_WBE
        add     lr, sp, #0xC0
        add     r0, sp, #0xC0
        ldrsh   r12, [r0]
        ldrsh   r10, [lr, #2]
        ldrsh   r5, [sp, #0xD4]
        ldrsh   r0, [lr, #4]
        ldrsh   r11, [lr, #6]
        ldrsh   r1, [lr, #8]
        ldrsh   r7, [lr, #0xA]
        ldrsh   r8, [lr, #0xC]
        ldrsh   r9, [lr, #0xE]
        sub     r10, r10, r12
        strh    r10, [lr, #2]
        ldrsh   r10, [lr, #0x10]
        sub     r0, r0, r12
        sub     r1, r1, r12
        sub     r5, r5, r12
        sub     r11, r11, r12
        sub     r7, r7, r12
        sub     r8, r8, r12
        sub     r9, r9, r12
        sub     r10, r10, r12
        strh    r0, [lr, #4]
        strh    r1, [lr, #8]
        add     r6, sp, #0xC0
        mov     r12, #0
        mov     r5, r5, lsl #16
        strh    r11, [lr, #6]
        strh    r7, [lr, #0xA]
        strh    r8, [lr, #0xC]
        strh    r9, [lr, #0xE]
        strh    r10, [lr, #0x10]
        strh    r12, [r6]
        add     r0, sp, #8
        add     r2, sp, #0xAC
        add     r1, sp, #0xC0
        mov     r5, r5, asr #16
        str     r5, [sp]
        mov     r3, r4
        bl      LDGI_ownCholsolc_WBE
        cmp     r0, #0
        beq     LDGI0
        add     r1, sp, #0xAC
        add     r0, sp, #8
        ldrsh   r1, [r1]
        ldrsh   r0, [r0]
        mov     r3, r5
        mov     r2, r4
        bl      LDGI_ownCholsolcRepair_WBE
LDGI0:
        mov     r0, #0
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LDGI1:
        mvn     r0, #7
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LDGI_ownComputeCrossCorrVector_WBE:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x57, 28
        add     r10, sp, #0xAD, 30
        and     r10, r10, #0xF
        rsb     r10, r10, #0
        add     r6, sp, #0x14
        add     r7, sp, #0xAD, 30
        and     r10, r10, #0xF
        and     r6, r6, #0xF
        add     r7, r7, r10
        mov     r10, #0
        rsb     r6, r6, #0
        add     lr, sp, #5, 24
        mov     r11, r0
        add     r12, sp, #5, 24
        strh    r10, [lr, #0x6C]
        add     r5, sp, #1, 22
        add     r0, sp, #0x14
        strh    r10, [r12, #0x68]
        and     r6, r6, #0xF
        add     r5, r5, #0x5B, 30
        mov     r4, r1
        mov     r8, r2
        sub     r10, r11, #0x10
        add     r6, r0, r6
        mov     r2, r5
        mov     r1, #0x52, 30
        mov     r0, r10
        mov     r9, r3
        bl      _ippsMaxAbs_16s
        add     r12, sp, #5, 24
        ldrsh   r12, [r12, #0x6C]
        cmn     r12, #1
        moveq   r12, #0xF
        beq     LDGI4
        cmp     r12, #0
        moveq   r12, #0
        beq     LDGI4
        cmp     r12, #0
        blt     LDGI26
LDGI2:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        bne     LDGI3
        ldr     lr, [pc, #0xFD4]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        b       LDGI4
LDGI3:
        ldr     r12, [pc, #0xFC8]
        mov     lr, lr, lsl #1
        ldrsh   r12, [r12, +lr]
LDGI4:
        rsb     r12, r12, #4
        mov     r12, r12, asr #1
        mov     r12, r12, lsl #16
        movs    r5, r12, asr #16
        bmi     LDGI5
        mov     r0, r10
        mov     r2, r6
        mov     r1, r5
        mov     r3, #0x52, 30
        bl      _ippsRShiftC_16s
        b       LDGI9
LDGI5:
        rsb     r12, r5, #0
        bic     r12, r12, #0xFF, 8
        mvn     lr, #0xFF
        bic     r10, r12, #0xFF, 16
        bic     lr, lr, #0x7F, 24
        mov     r12, #0
        mvn     lr, lr
        sub     r12, r12, #2, 18
        sub     r11, r11, #0x10
        mov     r1, r6
        mov     r0, #0x52, 30
LDGI6:
        ldrsh   r2, [r11], #2
        cmp     r2, lr, asr r10
        bgt     LDGI7
        cmp     r2, r12, asr r10
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LDGI8
        mov     r2, r2, lsl r10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDGI8
LDGI7:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDGI8:
        strh    r2, [r1], #2
        subs    r0, r0, #1
        bne     LDGI6
LDGI9:
        add     r2, sp, #1, 22
        add     r2, r2, #0x5A, 30
        mov     r1, #5, 26
        mov     r0, r4
        bl      _ippsMaxAbs_16s
        add     r12, sp, #5, 24
        ldrsh   r12, [r12, #0x68]
        mov     r11, #0
        cmn     r12, #1
        moveq   r12, #0xF
        beq     LDGI12
        cmp     r12, #0
        moveq   r12, #0
        beq     LDGI12
        cmp     r12, #0
        blt     LDGI27
LDGI10:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        bne     LDGI11
        ldr     lr, [pc, #0xECC]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        b       LDGI12
LDGI11:
        ldr     r12, [pc, #0xEC0]
        mov     lr, lr, lsl #1
        ldrsh   r12, [r12, +lr]
LDGI12:
        rsb     r12, r12, #4
        mov     r12, r12, asr #1
        mov     r12, r12, lsl #16
        movs    r10, r12, asr #16
        bmi     LDGI13
        mov     r0, r4
        mov     r2, r7
        mov     r1, r10
        mov     r3, #5, 26
        bl      _ippsRShiftC_16s
        b       LDGI17
LDGI13:
        rsb     r12, r10, #0
        mvn     lr, #0xFF
        bic     r0, lr, #0x7F, 24
        bic     r12, r12, #0xFF, 8
        bic     lr, r12, #0xFF, 16
        mvn     r12, r0
        sub     r11, r11, #2, 18
        mov     r1, r7
        mov     r0, #5, 26
LDGI14:
        ldrsh   r2, [r4], #2
        cmp     r2, r12, asr lr
        bgt     LDGI15
        cmp     r2, r11, asr lr
        mvnlt   r2, #0xFF
        biclt   r2, r2, #0x7F, 24
        blt     LDGI16
        mov     r2, r2, lsl lr
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDGI16
LDGI15:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDGI16:
        strh    r2, [r1], #2
        subs    r0, r0, #1
        bne     LDGI14
LDGI17:
        mov     r0, #0
        mov     r12, r0
        str     r10, [sp, #0xC]
        str     r5, [sp, #8]
        str     r9, [sp, #4]
        str     r8, [sp]
LDGI18:
        rsb     r1, r12, #0
        mov     r3, #0
        add     r1, r6, r1, lsl #1
        add     r1, r1, #0x10
        mov     r4, r3
        mov     lr, r7
        str     r7, [sp, #0x10]
LDGI19:
        ldrsh   r7, [r1]
        ldrsh   r5, [lr]
        ldrsh   r2, [r1, #2]
        ldrsh   r10, [r1, #4]
        ldrsh   r11, [lr, #4]
        mul     r7, r5, r7
        ldrsh   r5, [lr, #2]
        ldrsh   r8, [r1, #6]
        ldrsh   r9, [lr, #6]
        mul     r5, r5, r2
        mul     r10, r11, r10
        add     r7, r3, r7, lsl #1
        mul     r8, r9, r8
        add     r4, r4, #4
        add     r5, r7, r5, lsl #1
        add     r10, r5, r10, lsl #1
        cmp     r4, #5, 26
        add     r1, r1, #8
        add     lr, lr, #8
        add     r3, r10, r8, lsl #1
        blt     LDGI19
        ldr     r7, [sp, #0x10]
        eor     r1, r3, r3, asr #31
        add     lr, sp, #1, 22
        add     lr, lr, #0x51, 30
        sub     r1, r1, r3, asr #31
        cmp     r1, r0
        str     r3, [lr, +r12, lsl #2]
        movgt   r0, r1
        add     r12, r12, #1
        cmp     r12, #9
        blt     LDGI18
        ldr     r10, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r8, [sp]
        cmp     r0, #0
        mov     r12, #0
        moveq   r7, r12
        beq     LDGI21
        cmn     r0, #1
        moveq   r7, #0x1F
        beq     LDGI21
        cmp     r0, #0
        mvnlt   r0, r0
        cmp     r0, #0
        moveq   r7, r12
        beq     LDGI21
        ldr     r4, [pc, #0xD28]
        ldr     lr, [pc, #0xD28]
        movs    r6, r0, lsr #16
        bne     LDGI20
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r6, r0, asr #8
        movne   r0, r6, lsl #1
        movne   r4, lr
        moveq   r0, r0, lsl #1
        ldrsh   r0, [r4, +r0]
        add     r0, r0, #0x10
        mov     r0, r0, lsl #16
        mov     r7, r0, asr #16
        b       LDGI21
LDGI20:
        movs    r0, r0, lsr #24
        movne   r0, r0, lsl #1
        ldrnesh r7, [lr, +r0]
        moveq   r6, r6, lsl #1
        ldreqsh r7, [r4, +r6]
LDGI21:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        bic     lr, r7, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        sub     r0, r0, #2, 2
        mvn     r6, #2, 2
        mov     r4, #2, 2
LDGI22:
        add     r11, sp, #1, 22
        add     r11, r11, #0x51, 30
        ldr     r11, [r11, +r12, lsl #2]
        cmp     r11, r6, asr lr
        movgt   r11, r6
        bgt     LDGI23
        cmp     r11, r4, asr lr
        movge   r11, r11, lsl lr
        movlt   r11, #2, 2
LDGI23:
        cmp     r0, r11
        ble     LDGI24
        add     r11, r11, #2, 18
        mov     r11, r11, asr #16
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        b       LDGI25
LDGI24:
        mov     r11, #0
        sub     r11, r11, #2, 18
        mvn     r11, r11
LDGI25:
        add     r12, r12, #1
        strh    r11, [r8], #2
        cmp     r12, #9
        blt     LDGI22
        add     r10, r5, r10
        sub     r7, r7, r10
        strh    r7, [r9]
        add     sp, sp, #0x57, 28
        ldmia   sp!, {r4 - r11, pc}
LDGI26:
        mvn     r12, r12
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDGI2
LDGI27:
        mvn     r12, r12
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDGI10
LDGI_ownComputeAutoCorrMatrix_WBE:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xBA, 30
        add     r3, sp, #0xB, 26
        mov     r10, r0
        mov     r5, r2
        mov     r6, r1
        sub     r9, r10, #0x10
        mov     r2, r3
        mov     r1, #0x52, 30
        mov     r0, r9
        add     r7, sp, #0x20
        add     r4, sp, #0x20
        bl      _ippsMaxAbs_16s
        and     r7, r7, #0xF
        add     r3, sp, #2, 24
        ldrsh   r3, [r3, #0xC0]
        rsb     r12, r7, #0
        and     r12, r12, #0xF
        add     r2, r4, r12
        cmn     r3, #1
        mov     r12, #0
        add     r7, r2, #0x10
        moveq   r3, #0xF
        beq     LDGI30
        cmp     r3, #0
        moveq   r3, #0
        beq     LDGI30
        cmp     r3, #0
        blt     LDGI48
LDGI28:
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    lr, r3, asr #8
        bne     LDGI29
        ldr     lr, [pc, #0xBA8]
        mov     r3, r3, lsl #1
        ldrsh   r3, [lr, +r3]
        b       LDGI30
LDGI29:
        ldr     r3, [pc, #0xB9C]
        mov     lr, lr, lsl #1
        ldrsh   r3, [r3, +lr]
LDGI30:
        rsb     r3, r3, #4
        mvn     lr, #0xFF
        mov     r3, r3, asr #1
        bic     r8, lr, #0x7F, 24
        mov     r3, r3, lsl #16
        movs    r4, r3, asr #16
        bmi     LDGI31
        mov     r0, r9
        mov     r1, r4
        mov     r3, #0x52, 30
        bl      _ippsRShiftC_16s
        b       LDGI34
LDGI31:
        rsb     r3, r4, #0
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        sub     r12, r12, #2, 18
        sub     r10, r10, #0x10
        mvn     lr, r8
        mov     r0, #0x52, 30
LDGI32:
        ldrsh   r9, [r10], #2
        cmp     r9, lr, asr r3
        mvngt   r9, r8
        bgt     LDGI33
        cmp     r9, r12, asr r3
        movlt   r9, r8
        blt     LDGI33
        mov     r9, r9, lsl r3
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDGI33:
        strh    r9, [r2], #2
        subs    r0, r0, #1
        bne     LDGI32
LDGI34:
        ldr     r3, [pc, #0xB0C]
        ldr     r0, [pc, #0xB0C]
        mvn     lr, #2, 2
        sub     r8, r8, #2, 2
        mov     r12, #0
        mov     r9, #2, 2
        str     lr, [sp]
        str     r7, [sp, #4]
LDGI35:
        rsb     r10, r12, #9
        cmp     r10, #0
        mov     r9, r12
        movle   lr, #0
        ble     LDGI40
        str     r12, [sp, #8]
        ldr     r12, [sp, #4]
        mov     r7, #0
        mov     lr, r7
        str     r5, [sp, #0x18]
        str     r8, [sp, #0x1C]
        str     r4, [sp, #0xC]
        str     r6, [sp, #0x10]
LDGI36:
        rsb     r1, r9, #0
        rsb     r0, r7, #0
        mov     r3, #0
        mov     r2, r3
        add     r1, r12, r1, lsl #1
        add     r0, r12, r0, lsl #1
        str     r9, [sp, #0x14]
LDGI37:
        ldrsh   r12, [r0]
        ldrsh   r5, [r1]
        ldrsh   r9, [r0, #2]
        ldrsh   r11, [r1, #2]
        ldrsh   r4, [r0, #4]
        mul     r12, r5, r12
        ldrsh   r5, [r1, #4]
        ldrsh   r6, [r0, #6]
        mul     r9, r11, r9
        ldrsh   r8, [r1, #6]
        mul     r4, r5, r4
        add     r12, r2, r12, lsl #1
        add     r3, r3, #4
        mul     r6, r8, r6
        add     r9, r12, r9, lsl #1
        add     r4, r9, r4, lsl #1
        cmp     r3, #5, 26
        add     r0, r0, #8
        add     r2, r4, r6, lsl #1
        add     r1, r1, #8
        blt     LDGI37
        ldr     r9, [sp, #0x14]
        ldr     r12, [sp, #4]
        add     r0, sp, #0xB1, 30
        cmp     r2, #0
        mov     r1, r2
        str     r2, [r0, +r7, lsl #2]
        bge     LDGI38
        cmp     r2, #2, 2
        mvneq   r1, #2, 2
        rsbne   r1, r2, #0
LDGI38:
        cmp     r1, lr
        ble     LDGI39
        cmp     r2, #0
        mov     lr, r2
        bge     LDGI39
        cmp     r2, #2, 2
        mvneq   lr, #2, 2
        rsbne   lr, r2, #0
LDGI39:
        add     r7, r7, #1
        cmp     r7, r10
        add     r9, r9, #1
        blt     LDGI36
        ldr     r5, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        ldr     r0, [pc, #0x9EC]
        ldr     r3, [pc, #0x9E4]
        ldr     r12, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
LDGI40:
        cmp     lr, #0
        moveq   lr, #0
        beq     LDGI42
        cmn     lr, #1
        moveq   lr, #0x1F
        beq     LDGI42
        cmp     lr, #0
        mvnlt   lr, lr
        cmp     lr, #0
        moveq   lr, #0
        beq     LDGI42
        movs    r7, lr, lsr #16
        bne     LDGI41
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r7, lr, asr #8
        movne   r7, r7, lsl #1
        ldrnesh lr, [r0, +r7]
        moveq   lr, lr, lsl #1
        ldreqsh lr, [r3, +lr]
        add     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDGI42
LDGI41:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh lr, [r0, +lr]
        moveq   r7, r7, lsl #1
        ldreqsh lr, [r3, +r7]
LDGI42:
        sub     r7, lr, r4, lsl #1
        strh    r7, [r5], #2
        cmp     r10, #0
        ble     LDGI47
        bic     lr, lr, #0xFF, 8
        bic     r7, lr, #0xFF, 16
        add     lr, r12, r12, lsl #4
        add     lr, r12, lr
        add     r11, r6, r12, lsl #1
        str     r12, [sp, #8]
        ldr     r12, [sp]
        mov     r2, #0
        mov     r1, r2
        str     r4, [sp, #0xC]
        add     lr, lr, r6
        mov     r9, r1
        str     r6, [sp, #0x10]
        mov     r4, #2, 2
LDGI43:
        add     r6, sp, #0xB1, 30
        ldr     r6, [r6, +r1, lsl #2]
        cmp     r6, r12, asr r7
        mvngt   r6, #2, 2
        bgt     LDGI44
        cmp     r6, r4, asr r7
        movge   r6, r6, lsl r7
        movlt   r6, #2, 2
LDGI44:
        cmp     r8, r6
        ble     LDGI45
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        b       LDGI46
LDGI45:
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r6, r6
LDGI46:
        strh    r6, [lr, +r9]
        add     r1, r1, #1
        strh    r6, [r11, +r2]
        cmp     r1, r10
        add     lr, lr, #0x12
        add     r11, r11, #2
        add     r9, r9, #2
        add     r2, r2, #0x12
        blt     LDGI43
        ldr     r12, [sp, #8]
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
LDGI47:
        add     r12, r12, #1
        cmp     r12, #9
        blt     LDGI35
        add     sp, sp, #0xBA, 30
        ldmia   sp!, {r4 - r11, pc}
LDGI48:
        mvn     r3, r3
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDGI28
LDGI_ownCholsolc_WBE:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
        ldr     lr, [sp, #0xA4]
        mvn     r12, #0xFF
        bic     r6, r12, #0x7F, 24
        mov     r4, r1
        mov     r5, r2
        mov     r12, #0
        mov     r7, r0
        sub     r6, r6, #2, 2
        mvn     r11, #0
        mov     r10, r12
        mov     r9, #2, 2
        mvn     r8, #2, 2
        mov     r2, r7
        str     r5, [sp, #4]
        str     r6, [sp, #0x30]
        str     r11, [sp, #0x3C]
        str     lr, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
LDGI49:
        cmp     r10, #9
        mov     r11, r10
        bge     LDGI70
        sub     r0, r10, #1
        rsb     lr, r10, #0
        mov     r0, r0, lsl #16
        mov     r3, r10
        add     r6, r4, lr, lsl #1
        mov     r5, r0, asr #16
        str     r1, [sp, #0x40]
        str     r2, [sp]
        str     r12, [sp, #0x38]
LDGI50:
        mov     r2, r3, lsl #1
        ldrsh   r0, [r6, +r2]
        str     r0, [sp, #0x28]
        rsb     r0, r0, #4
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #0
        ble     LDGI51
        mov     r12, r3, lsl #1
        ldrsh   r12, [r7, +r12]
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        cmp     r12, r8, asr r0
        mvngt   r0, #2, 2
        bgt     LDGI52
        cmp     r12, r9, asr r0
        movge   r0, r12, lsl r0
        movlt   r0, #2, 2
        b       LDGI52
LDGI51:
        mov     r12, r3, lsl #1
        ldrsh   r12, [r7, +r12]
        rsb     r0, r0, #0
        mov     r0, r12, asr r0
LDGI52:
        cmp     r5, #0
        mov     lr, r5
        blt     LDGI56
        ldr     lr, [sp, #0x20]
        add     r12, r3, r3, lsl #4
        add     r12, r3, r12
        add     r1, lr, r12
        mov     lr, r5
        add     r2, r4, r2
        str     r5, [sp, #0x24]
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x3C]
        str     r6, [sp, #0x10]
        add     r12, r7, lr, lsl #1
        add     r1, r1, lr, lsl #1
        str     r3, [sp, #0xC]
        str     r11, [sp, #8]
        str     r7, [sp, #0x2C]
        str     r10, [sp, #0x34]
        mov     r6, #0x1F
LDGI53:
        rsb     r3, lr, #0
        mov     r7, r3, lsl #1
        ldrsh   r3, [r4, +r7]
        ldrsh   r7, [r2, +r7]
        add     r7, r3, r7
        sub     r3, r7, #3
        mov     r3, r3, lsl #16
        movs    r3, r3, asr #16
        bmi     LDGI153
        ldrsh   r11, [r12]
        ldrsh   r10, [r1]
        cmp     r3, #0x1F
        mov     r7, r6
        movlt   r7, r3
        mul     r10, r11, r10
        cmp     r10, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r10, lsl #1
        mov     r7, r3, asr r7
LDGI54:
        mov     r3, r0, asr #31
        subs    r0, r0, r7
        sbc     r3, r3, r7, asr #31
        subs    r10, r0, r8
        sbcs    r7, r3, #0
        movlt   r10, #0
        movlt   r7, #0
        orrs    r7, r10, r7
        mvnne   r0, #2, 2
        bne     LDGI55
        cmp     r0, #2, 2
        sbcs    r3, r3, r5
        movlt   r0, #2, 2
LDGI55:
        subs    lr, lr, #1
        sub     r12, r12, #2
        sub     r1, r1, #2
        bpl     LDGI53
        ldr     r5, [sp, #0x24]
        ldr     r6, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r7, [sp, #0x2C]
        ldr     r10, [sp, #0x34]
        ldr     r4, [sp, #0x1C]
LDGI56:
        cmp     r10, r3
        bne     LDGI65
        cmp     r0, #0xA
        blt     LDGI154
        bl      _ownIsqrt
        cmp     r0, #0
        mov     r3, r0
        moveq   r12, #0
        beq     LDGI62
        cmn     r0, #1
        moveq   r0, #2, 2
        moveq   r12, #0x1F
        beq     LDGI62
        cmp     r0, #0
        mvnlt   r3, r0
        cmp     r3, #0
        moveq   r12, #0
        beq     LDGI61
        movs    r2, r3, lsr #16
        bne     LDGI59
        bic     r3, r3, #0xFF, 8
        bic     r2, r3, #0xFF, 16
        movs    r3, r2, asr #8
        bne     LDGI57
        ldr     r3, [pc, #0x63C]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r3, +r2]
        b       LDGI58
LDGI57:
        mov     r2, r3, lsl #1
        ldr     r3, [pc, #0x62C]
        ldrsh   r2, [r3, +r2]
LDGI58:
        add     r2, r2, #0x10
        mov     r2, r2, lsl #16
        mov     r12, r2, asr #16
        b       LDGI61
LDGI59:
        movs    r3, r3, lsr #24
        bne     LDGI60
        ldr     r3, [pc, #0x608]
        mov     r2, r2, lsl #1
        ldrsh   r12, [r3, +r2]
        b       LDGI61
LDGI60:
        ldr     r2, [pc, #0x5FC]
        mov     r3, r3, lsl #1
        ldrsh   r12, [r2, +r3]
LDGI61:
        mov     r0, r0, lsl r12
LDGI62:
        ldr     lr, [sp, #0x30]
        add     r2, sp, #0x58
        mov     r3, r10, lsl #1
        add     r12, r12, #1
        cmp     lr, r0
        strh    r12, [r2, +r3]
        ble     LDGI63
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGI64
LDGI63:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI64:
        ldr     r3, [sp, #0x38]
        add     r2, sp, #0x6C
        strh    r0, [r2, +r3]
        b       LDGI69
LDGI65:
        add     r2, sp, #0x58
        mov     r12, r10, lsl #1
        ldrsh   lr, [r2, +r12]
        ldr     r1, [sp, #0x28]
        mvn     r2, #0xFF
        mov     r12, r0, asr #16
        bic     r2, r2, #0x7F, 24
        sub     lr, lr, r1
        sub     lr, lr, #0xF
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #16
        mvn     r2, r2
        movs    lr, lr, asr #16
        mov     r12, r12, asr #16
        and     r0, r2, r0, asr #1
        bmi     LDGI152
        ldr     r1, [sp, #0x38]
        add     r2, sp, #0x6C
        ldrsh   r2, [r2, +r1]
        mul     r0, r2, r0
        mov     r0, r0, asr #15
        mla     r0, r2, r12, r0
        mov     r0, r0, lsl #1
        mov     lr, r0, asr lr
LDGI66:
        ldr     r0, [sp, #0x30]
        cmp     r0, lr
        ble     LDGI67
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     r0, lr, asr #16
        b       LDGI68
LDGI67:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI68:
        add     r2, r3, r3, lsl #4
        add     r3, r3, r2
        ldr     r2, [sp]
        strh    r0, [r2, +r3]
LDGI69:
        add     r11, r11, #1
        mov     r0, r11, lsl #16
        mov     r3, r0, asr #16
        cmp     r3, #9
        blt     LDGI50
        ldr     r1, [sp, #0x40]
        ldr     r2, [sp]
        ldr     r12, [sp, #0x38]
LDGI70:
        add     r10, r10, #1
        cmp     r10, #9
        add     r7, r7, #0x12
        add     r12, r12, #2
        add     r2, r2, #2
        add     r1, r1, #2
        blt     LDGI49
        ldr     lr, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        ldr     r5, [sp, #4]
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mov     r10, #0
        mvn     r1, #2, 2
        sub     r12, r12, #2, 2
        mov     r9, r10
        mov     r11, #2, 2
        mov     r8, r0
        mov     r7, r4
        mov     r6, r3
        str     r1, [sp]
        str     lr, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r4, [sp, #0x1C]
        str     r0, [sp, #0x20]
LDGI71:
        ldrsh   r1, [r5], #2
        sub     r0, r9, #1
        mov     r3, r1, lsl #2
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        cmp     r1, #0
        blt     LDGI151
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        add     lr, r0, #0x3E, 18
        ldr     r0, [sp, #0x18]
        str     r10, [sp, #0x10]
        ldr     r10, [sp]
        add     r0, r0, r1, lsl #1
        str     r5, [sp, #4]
        str     r12, [sp, #8]
        str     r9, [sp, #0xC]
        mov     r11, #2, 2
LDGI72:
        rsb     r2, r1, #0
        mov     r2, r2, lsl #1
        ldrsh   r4, [r7, +r2]
        cmn     r4, #3
        blt     LDGI73
        ldrsh   r12, [r0]
        mov     r9, r1, lsl #1
        ldrsh   r5, [r8, +r9]
        add     r2, r4, #3
        mul     r12, r5, r12
        mov     r12, r12, lsl #1
        sub     r3, r3, r12, asr r2
        b       LDGI75
LDGI73:
        ldrsh   r12, [r0]
        mov     r9, r1, lsl #1
        ldrsh   r5, [r8, +r9]
        mvn     r2, #2
        rsb     r2, r4, r2
        bic     r2, r2, #0xFF, 8
        mul     r12, r5, r12
        bic     r2, r2, #0xFF, 16
        mov     r12, r12, lsl #1
        cmp     r12, r10, asr r2
        mvngt   r2, #2, 2
        bgt     LDGI74
        cmp     r12, r11, asr r2
        movge   r2, r12, lsl r2
        movlt   r2, #2, 2
LDGI74:
        sub     r3, r3, r2
LDGI75:
        subs    r2, r4, #2
        add     r12, sp, #0x44
        bmi     LDGI149
        ldrsh   r12, [r9, +r12]
        mul     r12, r5, r12
        mov     r12, r12, lsl #1
        sub     lr, lr, r12, asr r2
LDGI76:
        subs    r1, r1, #1
        sub     r0, r0, #2
        bpl     LDGI72
        ldr     r5, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
LDGI77:
        mvn     r0, #0xFF
        add     r1, sp, #0x58
        ldrsh   r1, [r1, +r10]
        mov     r11, r3, asr #16
        bic     r4, r0, #0x7F, 24
        cmp     r1, #0x15
        mov     r0, r11, lsl #16
        mvn     r11, r4
        and     r3, r11, r3, asr #1
        mov     r0, r0, asr #16
        blt     LDGI80
        add     r11, sp, #0x6C
        ldrsh   r11, [r11, +r10]
        sub     r2, r1, #0x15
        str     r2, [sp, #0x40]
        mul     r3, r11, r3
        mov     r3, r3, asr #15
        mla     r3, r11, r0, r3
        mov     r0, r3, lsl #1
        ldr     r3, [sp, #0x40]
        mov     r3, r0, asr r3
        cmp     r12, r3
        ble     LDGI78
        add     r0, r3, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGI79
LDGI78:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI79:
        strh    r0, [r6]
        b       LDGI84
LDGI80:
        add     r11, sp, #0x6C
        ldrsh   r11, [r11, +r10]
        rsb     r2, r1, #0x15
        bic     r2, r2, #0xFF, 8
        str     r2, [sp, #0x40]
        mul     r2, r11, r3
        ldr     r3, [sp, #0x40]
        mov     r2, r2, asr #15
        mla     r2, r11, r0, r2
        bic     r3, r3, #0xFF, 16
        mov     r0, r2, lsl #1
        ldr     r2, [sp]
        cmp     r0, r2, asr r3
        mvngt   r3, #2, 2
        bgt     LDGI81
        mov     r2, #2, 2
        cmp     r0, r2, asr r3
        movge   r3, r0, lsl r3
        movlt   r3, #2, 2
LDGI81:
        cmp     r12, r3
        ble     LDGI82
        add     r0, r3, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGI83
LDGI82:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI83:
        strh    r0, [r6]
LDGI84:
        mov     r0, lr, asr #16
        mvn     r4, r4
        mov     r0, r0, lsl #16
        cmp     r1, #0x10
        mov     r0, r0, asr #16
        and     lr, r4, lr, asr #1
        blt     LDGI87
        mul     r3, r11, lr
        sub     r1, r1, #0x10
        mov     r3, r3, asr #15
        mla     r3, r11, r0, r3
        mov     r0, r3, lsl #1
        mov     r1, r0, asr r1
        cmp     r12, r1
        ble     LDGI85
        add     r0, r1, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGI86
LDGI85:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI86:
        add     r1, sp, #0x44
        strh    r0, [r1, +r10]
        b       LDGI91
LDGI87:
        mul     r3, r11, lr
        rsb     r1, r1, #0x10
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        mov     r3, r3, asr #15
        mla     r3, r11, r0, r3
        mov     r0, r3, lsl #1
        ldr     r3, [sp]
        cmp     r0, r3, asr r1
        mvngt   r1, #2, 2
        bgt     LDGI88
        mov     r3, #2, 2
        cmp     r0, r3, asr r1
        movge   r1, r0, lsl r1
        movlt   r1, #2, 2
LDGI88:
        cmp     r12, r1
        ble     LDGI89
        add     r0, r1, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGI90
LDGI89:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI90:
        add     r1, sp, #0x44
        strh    r0, [r1, +r10]
LDGI91:
        add     r9, r9, #1
        cmp     r9, #9
        add     r10, r10, #2
        add     r8, r8, #0x12
        add     r7, r7, #2
        add     r6, r6, #2
        blt     LDGI71
        ldr     lr, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mov     r12, #0
        mvn     r11, #0
        sub     r2, r2, #2, 2
        add     r0, r0, #0x10
        mov     r5, r12
        mov     r9, #8
        mov     r10, #2, 2
        mvn     r8, #2, 2
        mov     r7, #0x10
        add     r6, r3, #0x10
        str     r11, [sp]
        str     lr, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r4, [sp, #0x1C]
LDGI92:
        ldrsh   r3, [r6]
        mov     r1, r3, lsl #10
        cmp     r1, #1, 2
        mvneq   r11, #2, 2
        movne   r11, r3, lsl #11
        add     r1, sp, #0x44
        ldrsh   r1, [r1, +r7]
        mov     r3, r1, lsl #9
        cmp     r3, #1, 2
        mvneq   r10, #2, 2
        movne   r10, r1, lsl #10
        add     r1, r9, #1
        mov     r1, r1, lsl #16
        mov     r4, r1, asr #16
        cmp     r4, #9
        bge     LDGI96
        ldr     r3, [sp, #0x1C]
        rsb     lr, r9, #0
        add     r1, r4, r4, lsl #4
        add     r1, r4, r1
        add     r3, r3, lr, lsl #1
        mov     lr, r4, lsl #1
        str     lr, [sp, #0x20]
        add     lr, r3, r4, lsl #1
        ldr     r3, [sp, #0x18]
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x20]
        str     r6, [sp, #8]
        add     r1, r1, r0
        add     r3, r3, r4, lsl #1
        str     r0, [sp, #0xC]
        str     r7, [sp, #4]
        str     r2, [sp, #0x24]
        str     r9, [sp, #0x28]
        mov     r6, #2, 2
LDGI93:
        ldrsh   r0, [lr], #2
        subs    r7, r0, #3
        bmi     LDGI147
        ldrsh   r9, [r3]
        ldrsh   r2, [r1]
        mul     r9, r2, r9
        mov     r9, r9, lsl #1
        sub     r11, r11, r9, asr r7
LDGI94:
        subs    r7, r0, #6
        add     r9, sp, #0x44
        bmi     LDGI145
        ldrsh   r9, [r9, +r12]
        mul     r2, r9, r2
        mov     r0, r2, lsl #1
        sub     r10, r10, r0, asr r7
LDGI95:
        add     r4, r4, #1
        cmp     r4, #9
        add     r12, r12, #2
        add     r1, r1, #0x12
        add     r3, r3, #2
        blt     LDGI93
        ldr     r12, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r2, [sp, #0x24]
        ldr     r9, [sp, #0x28]
LDGI96:
        add     r1, sp, #0x58
        ldrsh   r1, [r1, +r7]
        mvn     r3, #0xFF
        mov     lr, r11, asr #16
        bic     r3, r3, #0x7F, 24
        mvn     r4, r3
        mov     lr, lr, lsl #16
        cmp     r1, #0xF
        and     r11, r4, r11, asr #1
        mov     r3, lr, asr #16
        blt     LDGI97
        add     lr, sp, #0x6C
        ldrsh   lr, [lr, +r7]
        sub     r4, r1, #0xF
        str     r4, [sp, #0x40]
        mul     r11, lr, r11
        ldr     r4, [sp, #0x40]
        mov     r11, r11, asr #15
        mla     r11, lr, r3, r11
        mov     r3, r11, lsl #1
        mov     r11, r3, asr r4
        b       LDGI98
        .long   NormTable2
        .long   NormTable
LDGI97:
        add     lr, sp, #0x6C
        ldrsh   lr, [lr, +r7]
        rsb     r4, r1, #0xF
        bic     r4, r4, #0xFF, 8
        str     r4, [sp, #0x40]
        mul     r4, lr, r11
        ldr     r11, [sp, #0x40]
        mov     r4, r4, asr #15
        mla     r4, lr, r3, r4
        bic     r11, r11, #0xFF, 16
        mov     r3, r4, lsl #1
        cmp     r3, r8, asr r11
        mvngt   r11, #2, 2
        bgt     LDGI98
        mov     r4, #2, 2
        cmp     r3, r4, asr r11
        movge   r11, r3, lsl r11
        movlt   r11, #2, 2
LDGI98:
        cmp     r2, r11
        ble     LDGI99
        add     r3, r11, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDGI100
LDGI99:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDGI100:
        mov     r11, r11, asr #3
        mov     r4, r12, asr #31
        adds    r12, r12, r11
        adc     r11, r4, r11, asr #31
        str     r11, [sp, #0x20]
        subs    r4, r12, r8
        sbcs    r11, r11, #0
        movlt   r4, #0
        movlt   r11, #0
        strh    r3, [r6], #-2
        orrs    r11, r4, r11
        mvnne   r12, #2, 2
        bne     LDGI101
        ldr     r3, [sp]
        ldr     r4, [sp, #0x20]
        cmp     r12, #2, 2
        sbcs    r4, r4, r3
        movlt   r12, #2, 2
LDGI101:
        mvn     r3, #0xFF
        mov     r4, r10, asr #16
        bic     r3, r3, #0x7F, 24
        mvn     r11, r3
        mov     r4, r4, lsl #16
        cmp     r1, #0xC
        mov     r3, r4, asr #16
        and     r10, r11, r10, asr #1
        blt     LDGI102
        mul     r4, lr, r10
        sub     r1, r1, #0xC
        mov     r4, r4, asr #15
        mla     r4, lr, r3, r4
        mov     r3, r4, lsl #1
        mov     r3, r3, asr r1
        b       LDGI103
LDGI102:
        mul     r4, lr, r10
        rsb     r1, r1, #0xC
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        mov     r4, r4, asr #15
        mla     r4, lr, r3, r4
        mov     r3, r4, lsl #1
        cmp     r3, r8, asr r1
        mvngt   r3, #2, 2
        bgt     LDGI103
        mov     lr, #2, 2
        cmp     r3, lr, asr r1
        movge   r3, r3, lsl r1
        movlt   r3, #2, 2
LDGI103:
        cmp     r2, r3
        ble     LDGI104
        add     r1, r3, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDGI105
LDGI104:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDGI105:
        mov     r3, r3, asr #3
        mov     lr, r5, asr #31
        adds    r5, r5, r3
        adc     r3, lr, r3, asr #31
        subs    lr, r5, r8
        sbcs    r4, r3, #0
        movlt   lr, #0
        movlt   r4, #0
        orrs    lr, lr, r4
        add     r4, sp, #0x44
        strh    r1, [r4, +r7]
        mvnne   r5, #2, 2
        bne     LDGI106
        ldr     r1, [sp]
        cmp     r5, #2, 2
        sbcs    r3, r3, r1
        movlt   r5, #2, 2
LDGI106:
        subs    r9, r9, #1
        sub     r7, r7, #2
        sub     r0, r0, #2
        bpl     LDGI92
        ldr     lr, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     r4, [pc, #-0x1C4]
        ldr     r7, [pc, #-0x1C4]
        cmp     r12, #0
        mov     r0, #0
        mov     r1, #0x1F
        mov     r6, r12
        moveq   r2, r0
        beq     LDGI108
        cmn     r12, #1
        moveq   r2, r1
        beq     LDGI108
        cmp     r12, #0
        mvnlt   r6, r12
        cmp     r6, #0
        moveq   r2, r0
        beq     LDGI108
        movs    r2, r6, lsr #16
        bne     LDGI107
        bic     r6, r6, #0xFF, 8
        bic     r2, r6, #0xFF, 16
        movs    r6, r2, asr #8
        movne   r2, r6, lsl #1
        movne   r6, r7
        moveq   r2, r2, lsl #1
        moveq   r6, r4
        ldrsh   r2, [r6, +r2]
        add     r2, r2, #0x10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDGI108
LDGI107:
        movs    r6, r6, lsr #24
        movne   r6, r6, lsl #1
        ldrnesh r2, [r7, +r6]
        moveq   r2, r2, lsl #1
        ldreqsh r2, [r4, +r2]
LDGI108:
        mvn     r6, #0xFF
        mov     r12, r12, lsl r2
        bic     r6, r6, #0x7F, 24
        mov     r12, r12, asr #1
        sub     r8, r6, #2, 2
        cmp     r8, r12
        mvnle   r12, r6
        ble     LDGI109
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDGI109:
        sub     r2, r2, #1
        cmp     r5, #0
        mov     r2, r2, lsl #16
        mov     r8, r5
        moveq   r1, r0
        beq     LDGI111
        cmn     r5, #1
        beq     LDGI111
        cmp     r5, #0
        mvnlt   r8, r5
        cmp     r8, #0
        moveq   r1, r0
        beq     LDGI111
        movs    r1, r8, lsr #16
        bne     LDGI110
        bic     r8, r8, #0xFF, 8
        bic     r1, r8, #0xFF, 16
        movs    r8, r1, asr #8
        movne   r1, r8, lsl #1
        movne   r4, r7
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r4, +r1]
        add     r1, r1, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDGI111
LDGI110:
        movs    r8, r8, lsr #24
        movne   r8, r8, lsl #1
        ldrnesh r1, [r7, +r8]
        moveq   r1, r1, lsl #1
        ldreqsh r1, [r4, +r1]
LDGI111:
        mov     r5, r5, lsl r1
        sub     r4, r6, #2, 2
        cmp     r4, r5
        mvnle   r5, r6
        ble     LDGI112
        add     r5, r5, #2, 18
        mov     r4, r5, asr #16
        mov     r4, r4, lsl #16
        mov     r5, r4, asr #16
LDGI112:
        mul     r4, r12, r5
        cmp     r12, #0
        mov     r4, r4, asr #15
        mov     r4, r4, lsl #16
        bge     LDGI113
        cmn     r12, #2, 18
        mvneq   r12, r6
        beq     LDGI113
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDGI113:
        cmp     r5, #0
        bge     LDGI114
        cmn     r5, #2, 18
        mvneq   r5, r6
        beq     LDGI114
        rsb     r5, r5, #0
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDGI114:
        cmp     r12, r5
        bgt     LDGI119
        cmp     r12, #0
        blt     LDGI119
        cmp     r5, #0
        blt     LDGI119
        cmp     r5, #0
        beq     LDGI119
        cmp     r12, #0
        beq     LDGI119
        cmp     r12, r5
        mvneq   r0, r6
        beq     LDGI119
        mvn     r6, r6
        mvn     r9, #2, 2
        mvn     r8, #0
        mov     r7, #0xF
        str     r3, [sp, #0x18]
LDGI115:
        mov     r0, r0, lsl #1
        mov     r12, r12, lsl #1
        mov     r0, r0, lsl #16
        cmp     r12, r5
        mov     r0, r0, asr #16
        blt     LDGI118
        mov     r3, r12, asr #31
        subs    r12, r12, r5
        sbc     r3, r3, r5, asr #31
        subs    r11, r12, r9
        sbcs    r10, r3, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r12, #2, 2
        bne     LDGI116
        cmp     r12, #2, 2
        sbcs    r3, r3, r8
        movlt   r12, #2, 2
LDGI116:
        add     r0, r0, #1
        cmp     r6, r0
        blt     LDGI117
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDGI118
LDGI117:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDGI118:
        subs    r7, r7, #1
        bne     LDGI115
        ldr     r3, [sp, #0x18]
LDGI119:
        cmp     r4, #0
        mvn     r12, #0xFF
        bic     r4, r12, #0x7F, 24
        ble     LDGI120
        cmn     r0, #2, 18
        mvneq   r0, r4
        beq     LDGI120
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDGI120:
        mov     r8, #0
        mov     r12, r8
        mov     r7, r12
        sub     r9, r8, #2, 18
        mvn     r4, r4
        sub     r6, lr, #2
        sub     r5, r1, r2, asr #16
        mov     r10, r7
        mov     r11, #1
        str     r9, [sp, #0x28]
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x24]
LDGI121:
        cmp     lr, #0xF
        movgt   r1, r7, lsl #1
        ldrgtsh r2, [r3, +r1]
        bgt     LDGI123
        cmp     lr, #0
        blt     LDGI142
        mov     r1, r7, lsl #1
        ldrsh   r2, [r3, +r1]
        bic     r9, lr, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        sub     r10, r9, #1
        mov     r11, #1
        add     r10, r2, r11, lsl r10
        mov     r9, r10, asr r9
        mov     r9, r9, lsl #16
        add     r9, r12, r9, asr #16
        cmp     r4, r9
        blt     LDGI122
        cmn     r9, #2, 18
        movge   r12, r9, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDGI123
LDGI122:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDGI123:
        add     r9, sp, #0x44
        ldrsh   r9, [r9, +r8]
        cmp     r5, #0
        mul     r9, r0, r9
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        ble     LDGI125
        bic     r10, r5, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        cmp     r9, r4, asr r10
        bgt     LDGI124
        ldr     r11, [sp, #0x28]
        cmp     r9, r11, asr r10
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        blt     LDGI126
        mov     r10, r9, lsl r10
        mov     r9, r10, lsl #16
        mov     r9, r9, asr #16
        b       LDGI126
LDGI124:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
        b       LDGI126
LDGI125:
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x20]
        rsb     r10, r11, r10, asr #16
        mov     r10, r9, asr r10
        mov     r9, r10, lsl #16
        mov     r9, r9, asr #16
LDGI126:
        cmp     r6, #0xF
        movgt   r2, #0
        strgth  r2, [r1, +r3]
        bgt     LDGI129
        cmp     r6, #0
        blt     LDGI137
        add     r9, r2, r9
        cmp     r4, r9
        blt     LDGI127
        cmn     r9, #2, 18
        movge   r2, r9, lsl #16
        movge   r9, r2, asr #16
        movlt   r2, #0
        sublt   r9, r2, #2, 18
        b       LDGI128
LDGI127:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r9, r2
LDGI128:
        bic     r2, r6, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        sub     r10, r2, #1
        mov     r11, #1
        add     r10, r9, r11, lsl r10
        mov     r2, r10, asr r2
        strh    r2, [r1, +r3]
LDGI129:
        add     r7, r7, #1
        cmp     r7, #9
        add     r8, r8, #2
        blt     LDGI121
        mvn     r0, #0xFF
        cmp     r12, #0
        bic     r0, r0, #0x7F, 24
        bge     LDGI130
        cmn     r12, #2, 18
        mvneq   r12, r0
        beq     LDGI130
        rsb     r12, r12, #0
        mov     r1, r12, lsl #16
        mov     r12, r1, asr #16
LDGI130:
        cmp     r12, #2, 22
        ble     LDGI136
        cmp     r12, #2, 22
        mov     r7, #0
        blt     LDGI134
        cmp     r12, #0
        blt     LDGI134
        cmp     r12, #0
        moveq   r4, #0
        beq     LDGI135
        cmp     r12, #2, 22
        mvneq   r4, r0
        beq     LDGI135
        mov     r4, #0
        mov     r1, #2, 22
        mvn     r6, #2, 2
        mvn     r5, #0
        mvn     lr, r0
        mov     r2, #0xF
LDGI131:
        mov     r4, r4, lsl #1
        mov     r1, r1, lsl #1
        mov     r4, r4, lsl #16
        cmp     r1, r12
        mov     r4, r4, asr #16
        blt     LDGI133
        mov     r8, r1, asr #31
        subs    r1, r1, r12
        sbc     r8, r8, r12, asr #31
        subs    r9, r1, r6
        sbcs    r10, r8, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        movne   r1, r6
        bne     LDGI132
        cmp     r1, #2, 2
        sbcs    r8, r8, r5
        movlt   r1, #2, 2
LDGI132:
        add     r4, r4, #1
        cmp     lr, r4
        mvnlt   r4, r0
        blt     LDGI133
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        sublt   r4, r7, #2, 18
LDGI133:
        subs    r2, r2, #1
        bne     LDGI131
        b       LDGI135
LDGI134:
        mov     r4, #0
LDGI135:
        ldrsh   r0, [r3]
        ldrsh   r2, [r3, #2]
        ldrsh   r1, [r3, #4]
        mul     r12, r0, r4
        ldrsh   r6, [r3, #8]
        ldrsh   r0, [r3, #6]
        mul     r5, r1, r4
        mul     r7, r6, r4
        mul     r2, r2, r4
        mul     r8, r0, r4
        ldrsh   lr, [r3, #0xA]
        ldrsh   r0, [r3, #0xC]
        ldrsh   r1, [r3, #0xE]
        ldrsh   r6, [r3, #0x10]
        mul     lr, lr, r4
        mul     r0, r0, r4
        mul     r1, r1, r4
        mul     r6, r6, r4
        add     r12, r12, #1, 18
        add     r2, r2, #1, 18
        add     r5, r5, #1, 18
        add     r4, r8, #1, 18
        add     r7, r7, #1, 18
        add     lr, lr, #1, 18
        add     r0, r0, #1, 18
        add     r1, r1, #1, 18
        add     r6, r6, #1, 18
        mov     r12, r12, asr #15
        mov     r2, r2, asr #15
        mov     r5, r5, asr #15
        mov     r4, r4, asr #15
        mov     r7, r7, asr #15
        mov     lr, lr, asr #15
        mov     r0, r0, asr #15
        mov     r1, r1, asr #15
        mov     r6, r6, asr #15
        strh    r12, [r3]
        strh    r2, [r3, #2]
        strh    r5, [r3, #4]
        strh    r4, [r3, #6]
        strh    r7, [r3, #8]
        strh    lr, [r3, #0xA]
        strh    r0, [r3, #0xC]
        strh    r1, [r3, #0xE]
        strh    r6, [r3, #0x10]
LDGI136:
        mov     r0, #0
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LDGI137:
        add     r9, r2, r9
        cmp     r4, r9
        blt     LDGI138
        cmn     r9, #2, 18
        movge   r2, r9, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        b       LDGI139
LDGI138:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDGI139:
        rsb     r9, lr, #2
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        cmp     r2, r4, asr r9
        bgt     LDGI140
        ldr     r10, [sp, #0x28]
        cmp     r2, r10, asr r9
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LDGI141
        mov     r9, r2, lsl r9
        mov     r2, r9, lsl #16
        mov     r2, r2, asr #16
        b       LDGI141
LDGI140:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDGI141:
        strh    r2, [r1, +r3]
        b       LDGI129
LDGI142:
        mov     r1, r7, lsl #1
        ldrsh   r2, [r3, +r1]
        rsb     r9, lr, #0
        bic     r9, r9, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        cmp     r2, r4, asr r9
        bgt     LDGI143
        ldr     r10, [sp, #0x28]
        cmp     r2, r10, asr r9
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        blt     LDGI144
        mov     r9, r2, lsl r9
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        b       LDGI144
LDGI143:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LDGI144:
        add     r9, r12, r9
        cmp     r4, r9
        movlt   r12, #0xFF
        orrlt   r12, r12, #0x7F, 24
        blt     LDGI123
        cmn     r9, #2, 18
        movge   r12, r9, lsl #16
        movge   r12, r12, asr #16
        mvnlt   r12, #0xFF
        biclt   r12, r12, #0x7F, 24
        b       LDGI123
LDGI145:
        ldrsh   r7, [r9, +r12]
        rsb     r0, r0, #6
        bic     r0, r0, #0xFF, 8
        mul     r2, r7, r2
        bic     r0, r0, #0xFF, 16
        mov     r2, r2, lsl #1
        cmp     r2, r8, asr r0
        mvngt   r0, #2, 2
        bgt     LDGI146
        cmp     r2, r6, asr r0
        movge   r0, r2, lsl r0
        movlt   r0, #2, 2
LDGI146:
        sub     r10, r10, r0
        b       LDGI95
LDGI147:
        ldrsh   r9, [r3]
        ldrsh   r2, [r1]
        rsb     r7, r0, #3
        bic     r7, r7, #0xFF, 8
        bic     r7, r7, #0xFF, 16
        mul     r9, r2, r9
        mov     r9, r9, lsl #1
        cmp     r9, r8, asr r7
        mvngt   r7, #2, 2
        bgt     LDGI148
        cmp     r9, r6, asr r7
        movge   r7, r9, lsl r7
        movlt   r7, #2, 2
LDGI148:
        sub     r11, r11, r7
        b       LDGI94
LDGI149:
        ldrsh   r9, [r9, +r12]
        rsb     r4, r4, #2
        bic     r2, r4, #0xFF, 8
        mul     r9, r5, r9
        bic     r2, r2, #0xFF, 16
        mov     r9, r9, lsl #1
        cmp     r9, r10, asr r2
        mvngt   r2, #2, 2
        bgt     LDGI150
        cmp     r9, r11, asr r2
        movge   r2, r9, lsl r2
        movlt   r2, #2, 2
LDGI150:
        sub     lr, lr, r2
        b       LDGI76
LDGI151:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
        add     lr, r0, #0x3E, 18
        b       LDGI77
LDGI152:
        ldr     r1, [sp, #0x38]
        add     r2, sp, #0x6C
        rsb     lr, lr, #0
        ldrsh   r2, [r2, +r1]
        bic     lr, lr, #0xFF, 8
        mul     r1, r2, r0
        bic     r0, lr, #0xFF, 16
        mov     r1, r1, asr #15
        mla     r1, r2, r12, r1
        mov     r2, r1, lsl #1
        cmp     r2, r8, asr r0
        mvngt   lr, #2, 2
        bgt     LDGI66
        cmp     r2, r9, asr r0
        movge   lr, r2, lsl r0
        movlt   lr, #2, 2
        b       LDGI66
LDGI153:
        ldrsh   r7, [r1]
        ldrsh   r10, [r12]
        mul     r7, r10, r7
        cmp     r7, #1, 2
        mvneq   r7, #2, 2
        movne   r7, r7, lsl #1
        rsb     r3, r3, #0
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r7, r8, asr r3
        mvngt   r7, #2, 2
        bgt     LDGI54
        cmp     r7, r9, asr r3
        movge   r7, r7, lsl r3
        movlt   r7, #2, 2
        b       LDGI54
LDGI154:
        mov     r0, #1
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}
LDGI_ownCholsolcRepair_WBE:
        stmdb   sp!, {r0, r4 - r11, lr}
        mov     lr, #0
        mov     r12, r0
        cmp     r12, #0
        strh    lr, [r2, #2]
        strh    lr, [r2, #4]
        strh    lr, [r2, #6]
        strh    lr, [r2, #8]
        strh    lr, [r2, #0xA]
        strh    lr, [r2, #0xC]
        strh    lr, [r2, #0xE]
        strh    lr, [r2, #0x10]
        moveq   r12, #1
        moveq   r0, r12
        mov     r6, r1
        mvn     r4, #0xFF
        cmp     r6, #0
        bic     r7, r4, #0x7F, 24
        bge     LDGI155
        cmn     r6, #2, 18
        mvneq   r1, r7
        beq     LDGI155
        rsb     r1, r6, #0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDGI155:
        ldr     r8, [pc, #-0xA44]
        ldr     r4, [pc, #-0xA4C]
        mov     r9, r1
        cmp     r9, #0
        moveq   r5, lr
        beq     LDGI157
        cmp     r9, #0
        blt     LDGI170
LDGI156:
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    r5, r1, asr #8
        movne   r1, r5, lsl #1
        movne   r5, r8
        moveq   r1, r1, lsl #1
        moveq   r5, r4
        ldrsh   r5, [r5, +r1]
        mov     r9, r9, lsl r5
        mov     r9, r9, lsl #16
        mov     r1, r9, asr #16
LDGI157:
        mov     r9, r1, lsl #16
        sub     r1, r5, #1
        mov     r9, r9, asr #17
        mov     r9, r9, lsl #16
        mov     r5, r9, asr #16
        cmp     r5, #0
        bge     LDGI158
        cmn     r5, #2, 18
        mvneq   r5, r7
        beq     LDGI158
        rsb     r5, r5, #0
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDGI158:
        cmp     r12, #0
        moveq   r4, lr
        beq     LDGI160
        cmp     r12, #0
        blt     LDGI171
LDGI159:
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r9, r0, asr #8
        movne   r0, r9, lsl #1
        movne   r4, r8
        moveq   r0, r0, lsl #1
        ldrsh   r4, [r4, +r0]
        mov     r12, r12, lsl r4
        mov     r12, r12, lsl #16
        mov     r0, r12, asr #16
        mov     r12, r0
LDGI160:
        cmp     r12, #0
        bge     LDGI161
        cmn     r12, #2, 18
        mvneq   r0, r7
        beq     LDGI161
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r0, r12, asr #16
LDGI161:
        cmp     r5, r0
        bgt     LDGI166
        cmp     r5, #0
        blt     LDGI166
        cmp     r0, #0
        blt     LDGI166
        cmp     r0, #0
        beq     LDGI166
        cmp     r5, #0
        beq     LDGI166
        cmp     r5, r0
        mvneq   lr, r7
        beq     LDGI166
        mvn     r7, r7
        mvn     r9, #2, 2
        mvn     r8, #0
        mov     r12, #0xF
        str     r2, [sp]
LDGI162:
        mov     lr, lr, lsl #1
        mov     r5, r5, lsl #1
        mov     r2, lr, lsl #16
        cmp     r5, r0
        mov     lr, r2, asr #16
        blt     LDGI165
        mov     r2, r5, asr #31
        subs    r5, r5, r0
        sbc     r2, r2, r0, asr #31
        subs    r11, r5, r9
        sbcs    r10, r2, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r5, #2, 2
        bne     LDGI163
        cmp     r5, #2, 2
        sbcs    r2, r2, r8
        movlt   r5, #2, 2
LDGI163:
        add     lr, lr, #1
        cmp     r7, lr
        blt     LDGI164
        cmn     lr, #2, 18
        movge   r2, lr, lsl #16
        movge   lr, r2, asr #16
        movlt   r2, #0
        sublt   lr, r2, #2, 18
        b       LDGI165
LDGI164:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     lr, r2
LDGI165:
        subs    r12, r12, #1
        bne     LDGI162
        ldr     r2, [sp]
LDGI166:
        cmp     r6, #0
        mov     r0, #0
        blt     LDGI172
LDGI167:
        add     r1, r3, r1
        sub     r4, r4, r1
        sub     r1, r4, #2
        mov     r1, r1, lsl #16
        mov     r3, r1, asr #16
        cmp     r3, #0
        ble     LDGI169
        mvn     r1, #0xFF
        bic     r3, r3, #0xFF, 8
        bic     r1, r1, #0x7F, 24
        bic     r3, r3, #0xFF, 16
        mvn     r12, r1
        cmp     lr, r12, asr r3
        sub     r0, r0, #2, 18
        mvngt   r1, r1
        bgt     LDGI168
        cmp     lr, r0, asr r3
        blt     LDGI168
        mov     r3, lr, lsl r3
        mov     r0, r3, lsl #16
        mov     r1, r0, asr #16
LDGI168:
        strh    r1, [r2]
        ldmia   sp!, {r0, r4 - r11, pc}
LDGI169:
        rsb     r3, r3, #0
        mov     r3, lr, asr r3
        strh    r3, [r2]
        ldmia   sp!, {r0, r4 - r11, pc}
LDGI170:
        mvn     r1, r9
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDGI156
LDGI171:
        mvn     r0, r12
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGI159
LDGI172:
        cmn     lr, #2, 18
        subeq   r12, r0, #2, 18
        mvneq   lr, r12
        beq     LDGI167
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDGI167


