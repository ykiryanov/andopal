        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_AMRWBE_16s


_ippsAdaptiveCodebookSearch_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r10, [sp, #0x48]
        ldr     r4, [sp, #0x4C]
        ldr     r9, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     lr, [sp, #0x5C]
        ldr     r11, [sp, #0x60]
        mov     r12, r0
        cmp     r12, #0
        mov     r5, r3
        beq     LDMB31
        cmp     r1, #0
        beq     LDMB31
        cmp     r2, #0
        beq     LDMB31
        cmp     r5, #0
        beq     LDMB31
        cmp     r10, #0
        beq     LDMB31
        cmp     r4, #0
        beq     LDMB31
        cmp     r9, #0
        beq     LDMB31
        cmp     r8, #0
        beq     LDMB31
        cmp     r7, #0
        blt     LDMB24
        cmp     r7, #3
        bgt     LDMB24
        cmn     r11, #0x11
        blt     LDMB0
        cmp     r11, #0x11
        bgt     LDMB0
        cmp     lr, #5
        beq     LDMB29
        cmp     lr, #9
        beq     LDMB29
        cmp     lr, #0xD
        beq     LDMB29
        cmp     lr, #0xF
        beq     LDMB29
        cmp     lr, #0x10
        beq     LDMB29
        cmp     lr, #0x12
        beq     LDMB29
        cmp     lr, #0x13
        beq     LDMB29
        cmp     lr, #0x14
        beq     LDMB29
        cmp     lr, #0x15
        beq     LDMB29
        cmp     lr, #0x19
        beq     LDMB29
        cmp     lr, #0x1A
        beq     LDMB1
        cmp     lr, #0x1B
        beq     LDMB1
        cmp     lr, #0x1C
        beq     LDMB1
        cmp     lr, #0x1D
        beq     LDMB1
        cmp     lr, #0x1E
        beq     LDMB1
        cmp     lr, #0x1F
        beq     LDMB1
        cmp     lr, #0x20
        beq     LDMB1
        cmp     lr, #0x16
        beq     LDMB1
LDMB0:
        mvn     r0, #6
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDMB1:
        add     r0, r11, #0x22
        add     r6, r11, r11, lsl #2
        mov     r0, r0, lsl #16
        add     r6, r11, r6
        mov     r0, r0, asr #16
        str     r0, [sp, #0x20]
        rsb     r0, r11, #0x80
        add     r6, r6, #0xE7
        mov     r0, r0, lsl #16
        mov     r6, r6, lsl #16
        mov     r0, r0, asr #16
        mov     r6, r6, asr #16
        mov     r11, #0xA0
        str     r0, [sp, #0x1C]
LDMB2:
        cmp     r7, #0
        bne     LDMB3
        ldrsh   r2, [r2]
        add     r0, r10, #2
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        sub     r2, r2, #8
        mov     r2, r2, lsl #16
        mov     r3, r2, asr #16
        cmp     r0, r3
        movgt   r3, r0
        add     r0, r3, #0xF
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r6
        strleh  r0, [r10, #2]
        strleh  r3, [r10]
        ble     LDMB4
        sub     r2, r6, #0xF
        mov     r0, r6
        mov     r2, r2, lsl #16
        strh    r6, [r10, #2]
        mov     r3, r2, asr #16
        strh    r3, [r10]
        b       LDMB4
LDMB3:
        cmp     r7, #2
        beq     LDMB26
        ldrsh   r3, [r10]
        ldrsh   r0, [r10, #2]
        add     r2, r10, #2
        str     r2, [sp, #0x18]
LDMB4:
        cmp     lr, #5
        beq     LDMB6
LDMB5:
        cmp     lr, #9
        beq     LDMB7
        cmp     lr, #0x19
        bne     LDMB13
LDMB6:
        cmp     r7, #2
        beq     LDMB25
LDMB7:
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        str     r7, [sp, #0x1C]
LDMB8:
        str     r11, [sp, #0x10]
        ldr     lr, [sp, #0x20]
        mov     r2, r1
        str     lr, [sp, #0xC]
        ldr     lr, [sp, #0x1C]
        str     r0, [sp]
        str     r9, [sp, #4]
        str     lr, [sp, #8]
        mov     r1, r12
        mov     r0, r4
        bl      LDMB_ownPitchRes4
        ldr     r1, [sp, #0x1C]
        strh    r0, [r5]
        cmp     r1, #0
        bne     LDMB12
LDMB9:
        cmp     r0, r11
        addge   r1, r11, r0
        bge     LDMB10
        ldrsh   r1, [r9]
        mov     r0, r0, lsl #1
        mov     r1, r1, lsl #16
        add     r1, r0, r1, asr #17
LDMB10:
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        ldr     r1, [sp, #0x20]
        sub     r2, r2, r1, lsl #1
        strh    r2, [r8]
        ldrsh   r2, [r5]
        sub     r2, r2, #8
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r1, r2
        movgt   r2, r1
        add     r1, r2, #0xF
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, r6
        ble     LDMB11
        sub     r1, r6, #0xF
        strh    r6, [r10, #2]
        strh    r1, [r10]
        b       LDMB20
LDMB11:
        ldr     r12, [sp, #0x18]
        strh    r2, [r10]
        strh    r1, [r12]
        b       LDMB20
LDMB12:
        ldr     r1, [sp, #0x1C]
        cmp     r1, #2
        beq     LDMB9
        ldrsh   r10, [r10]
        ldrsh   r1, [r9]
        sub     r0, r0, r10
        mov     r2, r0, lsl #1
        mov     r1, r1, lsl #16
        add     r1, r2, r1, asr #17
        strh    r1, [r8]
        b       LDMB20
LDMB13:
        str     r11, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        str     r9, [sp, #4]
        str     r0, [sp]
        str     lr, [sp, #0xC]
        mov     lr, r7, lsl #16
        mov     r2, r1
        mov     lr, lr, asr #16
        str     lr, [sp, #8]
        mov     r1, r12
        mov     r0, r4
        bl      LDMB_ownPitchRes4
        cmp     r7, #0
        strh    r0, [r5]
        bne     LDMB19
LDMB14:
        ldr     r1, [sp, #0x1C]
        cmp     r0, r1
        bge     LDMB15
        ldrsh   r1, [r9]
        add     r0, r1, r0, lsl #2
        mov     r1, r0, lsl #16
        mov     r2, r1, asr #16
        b       LDMB17
LDMB15:
        cmp     r0, r11
        bge     LDMB16
        ldrsh   r1, [r9]
        ldr     r2, [sp, #0x1C]
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #17
        add     r2, r1, r2, lsl #1
        add     r0, r2, r0, lsl #1
        mov     r1, r0, lsl #16
        mov     r2, r1, asr #16
        b       LDMB17
LDMB16:
        ldr     r1, [sp, #0x1C]
        add     r1, r11, r1, lsl #1
        add     r0, r1, r0
        mov     r1, r0, lsl #16
        mov     r2, r1, asr #16
LDMB17:
        ldr     r1, [sp, #0x20]
        sub     r2, r2, r1, lsl #2
        strh    r2, [r8]
        ldrsh   r2, [r5]
        sub     r2, r2, #8
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r1, r2
        movgt   r2, r1
        add     r1, r2, #0xF
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, r6
        ble     LDMB18
        sub     r1, r6, #0xF
        strh    r6, [r10, #2]
        strh    r1, [r10]
        b       LDMB20
LDMB18:
        ldr     r12, [sp, #0x18]
        strh    r2, [r10]
        strh    r1, [r12]
        b       LDMB20
LDMB19:
        cmp     r7, #2
        beq     LDMB14
        ldrsh   r10, [r10]
        ldrsh   r1, [r9]
        sub     r0, r0, r10
        add     r0, r1, r0, lsl #2
        strh    r0, [r8]
LDMB20:
        ldrsh   r9, [r9]
        ldrsh   r5, [r5]
        cmp     r9, #0
        sub     r1, r4, r5, lsl #1
        ble     LDMB21
        rsb     r9, r9, #4
        sub     r1, r1, #2
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDMB21:
        ldr     r5, [pc, #0xEE4]
        rsb     r3, r9, #3
        mov     r2, #0xFF
        sub     r1, r1, #0x1E
        mov     r3, r3, lsl #6
        orr     r2, r2, #0x7F, 24
        add     lr, r5, r3
        mov     r12, #0x41
LDMB22:
        ldrsh   r10, [r5, +r3]
        ldrsh   r6, [r1]
        ldrsh   r8, [r1, #2]
        ldrsh   r7, [r1, #4]
        ldrsh   r9, [lr, #2]
        mul     r11, r10, r6
        ldrsh   r10, [lr, #4]
        ldrsh   r6, [r1, #6]
        mla     r11, r9, r8, r11
        ldrsh   r9, [lr, #6]
        ldrsh   r8, [r1, #8]
        mla     r11, r10, r7, r11
        ldrsh   r10, [lr, #8]
        ldrsh   r7, [r1, #0xA]
        mla     r11, r9, r6, r11
        ldrsh   r9, [lr, #0xA]
        ldrsh   r6, [r1, #0xC]
        mla     r11, r10, r8, r11
        ldrsh   r10, [lr, #0xC]
        ldrsh   r8, [r1, #0xE]
        mla     r11, r9, r7, r11
        ldrsh   r9, [lr, #0xE]
        ldrsh   r7, [r1, #0x10]
        mla     r11, r10, r6, r11
        ldrsh   r6, [r1, #0x12]
        ldrsh   r10, [lr, #0x10]
        mla     r11, r9, r8, r11
        ldrsh   r8, [r1, #0x14]
        ldrsh   r9, [lr, #0x12]
        mla     r11, r10, r7, r11
        ldrsh   r10, [lr, #0x14]
        ldrsh   r7, [r1, #0x16]
        mla     r11, r9, r6, r11
        ldrsh   r9, [lr, #0x16]
        ldrsh   r6, [r1, #0x18]
        mla     r11, r10, r8, r11
        ldrsh   r10, [lr, #0x18]
        ldrsh   r8, [r1, #0x1A]
        mla     r11, r9, r7, r11
        ldrsh   r9, [lr, #0x1A]
        ldrsh   r7, [r1, #0x1C]
        mla     r11, r10, r6, r11
        ldrsh   r10, [lr, #0x1C]
        ldrsh   r6, [r1, #0x1E]
        mla     r11, r9, r8, r11
        ldrsh   r9, [lr, #0x1E]
        ldrsh   r8, [r1, #0x20]
        mla     r11, r10, r7, r11
        ldrsh   r10, [lr, #0x20]
        ldrsh   r7, [r1, #0x22]
        mla     r11, r9, r6, r11
        ldrsh   r9, [lr, #0x22]
        ldrsh   r6, [r1, #0x24]
        mla     r11, r10, r8, r11
        ldrsh   r10, [lr, #0x24]
        ldrsh   r8, [r1, #0x26]
        mla     r11, r9, r7, r11
        ldrsh   r9, [lr, #0x26]
        ldrsh   r7, [r1, #0x28]
        mla     r11, r10, r6, r11
        ldrsh   r10, [lr, #0x28]
        ldrsh   r6, [r1, #0x2A]
        mla     r11, r9, r8, r11
        ldrsh   r9, [lr, #0x2A]
        ldrsh   r8, [r1, #0x2C]
        mla     r11, r10, r7, r11
        ldrsh   r10, [lr, #0x2C]
        ldrsh   r7, [r1, #0x2E]
        mla     r11, r9, r6, r11
        ldrsh   r9, [lr, #0x2E]
        ldrsh   r6, [r1, #0x30]
        mla     r11, r10, r8, r11
        ldrsh   r10, [lr, #0x30]
        ldrsh   r8, [r1, #0x32]
        mla     r11, r9, r7, r11
        ldrsh   r9, [lr, #0x32]
        ldrsh   r7, [r1, #0x34]
        mla     r11, r10, r6, r11
        ldrsh   r10, [lr, #0x34]
        ldrsh   r6, [r1, #0x36]
        mla     r11, r9, r8, r11
        ldrsh   r9, [lr, #0x36]
        ldrsh   r8, [r1, #0x38]
        mla     r11, r10, r7, r11
        ldrsh   r10, [lr, #0x38]
        ldrsh   r7, [r1, #0x3A]
        mla     r11, r9, r6, r11
        ldrsh   r9, [lr, #0x3A]
        ldrsh   r6, [r1, #0x3C]
        mla     r11, r10, r8, r11
        ldrsh   r8, [lr, #0x3C]
        ldrsh   r10, [lr, #0x3E]
        mla     r11, r9, r7, r11
        ldrsh   r7, [r1, #0x3E]
        mla     r11, r8, r6, r11
        mla     r11, r10, r7, r11
        add     r6, r11, #2, 20
        mov     r6, r6, asr #14
        cmp     r2, r6
        movlt   r6, r2
        blt     LDMB23
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        mvnlt   r6, r2
LDMB23:
        strh    r6, [r4], #2
        subs    r12, r12, #1
        add     r1, r1, #2
        bne     LDMB22
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDMB24:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDMB25:
        mov     lr, #4
        str     lr, [sp, #0x1C]
        b       LDMB8
LDMB26:
        cmp     lr, #5
        beq     LDMB28
        cmp     lr, #0x19
        beq     LDMB27
        ldrsh   r2, [r2, #2]
        add     r0, r10, #2
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        sub     r2, r2, #8
        mov     r2, r2, lsl #16
        mov     r3, r2, asr #16
        cmp     r0, r3
        movgt   r3, r0
        add     r0, r3, #0xF
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r6
        strleh  r0, [r10, #2]
        strleh  r3, [r10]
        ble     LDMB5
        sub     r2, r6, #0xF
        mov     r0, r6
        mov     r2, r2, lsl #16
        strh    r6, [r10, #2]
        mov     r3, r2, asr #16
        strh    r3, [r10]
        b       LDMB5
LDMB27:
        ldrsh   r3, [r10]
        ldrsh   r0, [r10, #2]
        add     lr, r10, #2
        str     lr, [sp, #0x18]
        b       LDMB25
LDMB28:
        ldrsh   r3, [r10]
        ldrsh   r0, [r10, #2]
        add     lr, r10, #2
        str     lr, [sp, #0x18]
        b       LDMB25
LDMB29:
        mov     r6, #0x22
        cmp     lr, #5
        str     r6, [sp, #0x20]
        beq     LDMB30
        cmp     lr, #9
        beq     LDMB30
        cmp     lr, #0x19
        beq     LDMB30
        mov     r11, #0x80
        str     r11, [sp, #0x1C]
        mov     r6, #0xE7
        mov     r11, #0xA0
        b       LDMB2
LDMB30:
        mov     r11, #0x80
        str     r11, [sp, #0x1C]
        mov     r6, #0xE7
        mov     r11, #0x5C
        b       LDMB2
LDMB31:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDMB_ownPitchRes4:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x90
        add     r12, sp, #0x30
        ldr     r6, [sp, #0xB4]
        ldr     r7, [sp, #0xB8]
        ldr     r11, [sp, #0xBC]
        ldr     r8, [sp, #0xC0]
        ldr     r5, [sp, #0xC4]
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        and     r12, r12, #0xF
        add     lr, sp, #0x30
        mov     r4, r3
        add     r12, lr, r12
        mov     r10, r4
        sub     lr, r10, #4
        mov     lr, lr, lsl #16
        mov     r3, lr, asr #16
        sub     r9, r12, r3, lsl #1
        add     r12, r6, #4
        str     r9, [sp, #4]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp]
        bl      LDMB_ownNormCorr
        add     r1, r10, #1
        mov     r0, r10, lsl #1
        ldrsh   r0, [r9, +r0]
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, r6
        bgt     LDMB33
        add     r12, r9, r1, lsl #1
LDMB32:
        ldrsh   r2, [r12], #2
        cmp     r2, r0
        movge   r0, r2
        movge   r4, r1
        add     r1, r1, #1
        cmp     r1, r6
        ble     LDMB32
LDMB33:
        cmp     r11, #0
        mov     r0, #0
        beq     LDMB34
        cmp     r11, #2
        movne   r0, r4, lsl #16
        movne   r6, r0, asr #16
        bne     LDMB35
LDMB34:
        mov     r1, r4, lsl #16
        mov     r6, r1, asr #16
        cmp     r6, r5
        bge     LDMB47
LDMB35:
        cmp     r11, #0
        beq     LDMB36
        cmp     r11, #2
        bne     LDMB38
LDMB36:
        cmp     r6, r8
        blt     LDMB38
LDMB37:
        mov     r8, #2
        mvn     r5, #1
        b       LDMB39
LDMB38:
        cmp     r8, #0x22
        movne   r8, #1
        mvnne   r5, #2
        beq     LDMB37
LDMB39:
        cmp     r6, r10
        moveq   r5, #0
        add     r9, r9, r6, lsl #1
        mov     r0, r9
        mov     r1, r5
        bl      LDMB_ownInterpol4
        add     r2, r8, r5
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, #3
        bgt     LDMB45
        ldr     r12, [pc, #0xADC]
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        sub     lr, lr, #2, 2
        mvn     r10, #2, 2
        mvn     r11, #0
        str     r5, [sp, #0x18]
        str     lr, [sp, #0x14]
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x24]
        str     r0, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r4, [sp, #8]
LDMB40:
        ldr     r0, [sp, #0x28]
        cmp     r2, #0
        mov     r1, r2
        blt     LDMB49
LDMB41:
        rsb     r1, r1, #3
        ldrsh   r6, [r0, #-6]
        mov     r1, r1, lsl #4
        add     r11, r12, r1
        ldrsh   lr, [r11, #6]
        ldrsh   r5, [r11, #0xE]
        ldrsh   r3, [r0, #-4]
        ldrsh   r7, [r0, #8]
        ldrsh   r4, [r11, #0xA]
        ldrsh   r8, [r0, #4]
        ldrsh   r9, [r0]
        ldrsh   r10, [r11, #2]
        mul     r4, r8, r4
        mul     r5, r7, r5
        mul     lr, r9, lr
        mul     r3, r3, r10
        ldrsh   r8, [r0, #-2]
        ldrsh   r7, [r11, #4]
        ldrsh   r9, [r11, #8]
        ldrsh   r10, [r0, #2]
        ldrsh   r1, [r12, +r1]
        mla     lr, r8, r7, lr
        ldrsh   r11, [r11, #0xC]
        ldrsh   r0, [r0, #6]
        mla     r3, r6, r1, r3
        mla     r4, r10, r9, r4
        ldr     r1, [sp, #0x24]
        mla     r5, r0, r11, r5
        add     lr, r3, lr
        add     r5, r4, r5
        add     r3, lr, r5
        mov     r0, r3, lsl #2
        subs    r1, r0, r1
        mov     lr, r3, asr #31
        mov     r3, r3, lsr #30
        orr     r3, r3, lr, lsl #2
        sbcs    lr, r3, #0
        movlt   r1, #0
        movlt   lr, #0
        orrs    lr, r1, lr
        bne     LDMB43
        ldr     r1, [sp, #0x1C]
        cmp     r0, #2, 2
        sbcs    r3, r3, r1
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
        blt     LDMB44
        ldr     r1, [sp, #0x14]
        cmp     r1, r0
        ble     LDMB42
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDMB44
LDMB42:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LDMB44
LDMB43:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LDMB44:
        ldr     r1, [sp, #0x2C]
        cmp     r0, r1
        strgt   r0, [sp, #0x2C]
        strgt   r2, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        add     r0, r2, r0
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        cmp     r2, #3
        ble     LDMB40
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r4, [sp, #8]
LDMB45:
        cmp     r5, #0
        blt     LDMB48
LDMB46:
        mov     r4, r4, lsl #16
        strh    r5, [r7]
        mov     r0, r4, asr #16
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LDMB47:
        strh    r0, [r7]
        mov     r4, r4, lsl #16
        mov     r0, r4, asr #16
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LDMB48:
        add     r5, r5, #4
        sub     r6, r6, #1
        mov     r5, r5, lsl #16
        mov     r6, r6, lsl #16
        mov     r5, r5, asr #16
        mov     r4, r6, asr #16
        b       LDMB46
LDMB49:
        add     r0, r2, #4
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        ldr     r0, [sp, #0x28]
        sub     r0, r0, #2
        b       LDMB41
LDMB_ownNormCorr:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD4
        add     lr, sp, #0x3C
        ldr     r9, [sp, #0xF8]
        ldr     r8, [sp, #0xFC]
        and     r4, lr, #0xF
        rsb     r4, r4, #0
        mov     r7, r3
        and     r11, r4, #0xF
        add     r12, sp, #0x3C
        rsb     lr, r7, #0
        add     r4, r12, r11
        mov     r10, r0
        mov     lr, lr, lsl #16
        mov     r6, r2
        mov     r5, r1
        mov     r12, lr, asr #16
        str     r12, [sp, #0xC]
        mov     r3, #0x40
        add     r0, r10, r12, lsl #1
        mov     r2, r4
        mov     r1, r6
        bl      _ippsConvPartial_NR_16s
        mvn     r12, #0
        add     r3, sp, #0xD0
        str     r12, [sp]
        mov     r2, #0x40
        mov     r1, r5
        mov     r0, r5
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0xD0]
        mvn     lr, #2, 2
        adds    r0, r12, #1
        mov     r12, r12, asr #31
        adc     r12, r12, #0
        subs    r2, r0, lr
        sbcs    r1, r12, #0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        movne   r0, lr
        bne     LDMB50
        cmp     r0, #2, 2
        mvn     lr, #0
        sbcs    r12, r12, lr
        movlt   r0, #2, 2
LDMB50:
        cmp     r0, #0
        str     r0, [sp, #0xD0]
        moveq   r12, #0
        beq     LDMB53
        movs    r12, r0, lsr #16
        bne     LDMB51
        bic     r0, r0, #0xFF, 8
        bic     lr, r0, #0xFF, 16
        movs    r0, lr, asr #8
        ldrne   r12, [pc, #0x820]
        movne   lr, r0, lsl #1
        ldreq   r12, [pc, #0x81C]
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r12, +lr]
        add     r12, lr, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDMB53
LDMB51:
        movs    r0, r0, lsr #24
        bne     LDMB52
        ldr     lr, [pc, #0x7F8]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        b       LDMB53
LDMB52:
        ldr     r12, [pc, #0x7E4]
        mov     r0, r0, lsl #1
        ldrsh   r12, [r12, +r0]
LDMB53:
        rsb     r12, r12, #0x20
        cmp     r7, r9
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #17
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #0x24]
        bge     LDMB78
        mvn     r3, #0
        str     r3, [sp, #8]
        mvn     r12, #0xFF
        add     r3, r8, r7, lsl #1
        mov     r2, #2, 2
        bic     r12, r12, #0x7F, 24
        str     r8, [sp, #0x38]
        str     r9, [sp, #0x20]
        str     r5, [sp, #0x14]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #0xC]
        mov     r5, r6
        add     r1, r4, #2
        sub     lr, r4, #2
        mvn     r0, #2, 2
        sub     r2, r2, #2, 18
        mvn     r12, r12
        mov     r6, r7
        str     r3, [sp, #0x18]
        str     r12, [sp, #0x34]
        str     r2, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x10]
        mov     r7, r0
LDMB54:
        str     r8, [sp]
        ldr     r0, [sp, #0x14]
        add     r3, sp, #0xD0
        mov     r2, #0x40
        mov     r1, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0xD0]
        adds    r10, r12, #1
        mov     r12, r12, asr #31
        adc     r12, r12, #0
        subs    r11, r10, r7
        sbcs    lr, r12, #0
        movlt   r11, #0
        movlt   lr, #0
        orrs    lr, r11, lr
        mvnne   r10, #2, 2
        bne     LDMB55
        cmp     r10, #2, 2
        sbcs    r12, r12, r8
        movlt   r10, #2, 2
LDMB55:
        cmp     r10, #0
        mov     lr, r10
        moveq   r11, #0
        streq   r10, [sp, #0xD0]
        beq     LDMB61
        cmn     r10, #1
        beq     LDMB90
        cmp     r10, #0
        mvnlt   lr, r10
        cmp     lr, #0
        moveq   r11, #0
        beq     LDMB60
        movs    r12, lr, lsr #16
        bne     LDMB58
        bic     lr, lr, #0xFF, 8
        bic     r12, lr, #0xFF, 16
        movs    lr, r12, asr #8
        bne     LDMB56
        ldr     lr, [pc, #0x6B8]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        b       LDMB57
LDMB56:
        mov     r12, lr, lsl #1
        ldr     lr, [pc, #0x6A0]
        ldrsh   r12, [lr, +r12]
LDMB57:
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r11, r12, asr #16
        b       LDMB60
LDMB58:
        movs    lr, lr, lsr #24
        bne     LDMB59
        ldr     lr, [pc, #0x684]
        mov     r12, r12, lsl #1
        ldrsh   r11, [lr, +r12]
        b       LDMB60
LDMB59:
        mov     r12, lr, lsl #1
        ldr     lr, [pc, #0x66C]
        ldrsh   r11, [lr, +r12]
LDMB60:
        mov     r10, r10, lsl r11
        str     r10, [sp, #0xD0]
LDMB61:
        add     r3, sp, #0xD0
        str     r8, [sp]
        mov     r2, #0x40
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     lr, [sp, #0xD0]
        rsb     r11, r11, #0x1E
        mov     r10, r10, asr #16
        adds    r12, lr, #1
        mov     lr, lr, asr #31
        adc     lr, lr, #0
        subs    r1, r12, r7
        sbcs    r0, lr, #0
        movlt   r1, #0
        movlt   r0, #0
        mov     r10, r10, lsl #16
        orrs    r0, r1, r0
        mov     r11, r11, lsl #16
        mov     r10, r10, asr #16
        mvnne   r12, #2, 2
        bne     LDMB62
        cmp     r12, #2, 2
        sbcs    lr, lr, r8
        movlt   r12, #2, 2
LDMB62:
        cmp     r12, #0
        mov     r0, r12
        moveq   lr, #0
        streq   r12, [sp, #0xD0]
        beq     LDMB68
        cmn     r12, #1
        beq     LDMB91
        cmp     r12, #0
        mvnlt   r0, r12
        cmp     r0, #0
        moveq   lr, #0
        beq     LDMB67
        movs    lr, r0, lsr #16
        bne     LDMB65
        bic     r0, r0, #0xFF, 8
        bic     lr, r0, #0xFF, 16
        movs    r0, lr, asr #8
        bne     LDMB63
        ldr     r0, [pc, #0x5B4]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        b       LDMB64
LDMB63:
        mov     lr, r0, lsl #1
        ldr     r0, [pc, #0x59C]
        ldrsh   lr, [r0, +lr]
LDMB64:
        add     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDMB67
LDMB65:
        movs    r0, r0, lsr #24
        bne     LDMB66
        ldr     r0, [pc, #0x580]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        b       LDMB67
LDMB66:
        mov     lr, r0, lsl #1
        ldr     r0, [pc, #0x568]
        ldrsh   lr, [r0, +lr]
LDMB67:
        mov     r12, r12, lsl lr
        str     r12, [sp, #0xD0]
LDMB68:
        rsb     lr, lr, #0x1E
        add     r1, sp, #0xCC
        add     r0, sp, #0xD0
        strh    lr, [sp, #0xCC]
        bl      ownInvSqrt_32s16s_I
        ldr     lr, [sp, #0xD0]
        ldrsh   r12, [sp, #0xCC]
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     r10, r10, lr
        ldr     lr, [sp, #0x24]
        add     lr, r12, lr
        adds    r11, lr, r11, asr #16
        bmi     LDMB69
        add     r11, r11, #1
        bic     r12, r11, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r10, r7, asr r12
        mvngt   r12, #2, 2
        bgt     LDMB70
        mov     lr, #2, 2
        cmp     r10, lr, asr r12
        movge   r12, r10, lsl r12
        movlt   r12, #2, 2
        b       LDMB70
LDMB69:
        mvn     r12, #0
        rsb     r12, r11, r12
        mov     r12, r10, asr r12
LDMB70:
        ldr     r10, [sp, #0x28]
        str     r12, [sp, #0xD0]
        cmp     r10, r12
        ble     LDMB71
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDMB72
LDMB71:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDMB72:
        ldr     lr, [sp, #0x18]
        sub     r9, r9, #1
        strh    r12, [lr], #2
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x10]
        mov     r12, r9, lsl #16
        mov     r12, r12, asr #15
        ldrsh   lr, [lr, +r12]
        cmp     lr, #0
        bne     LDMB73
        ldr     r1, [sp, #0x30]
        mov     r2, #0x3F
        mov     r0, r4
        bl      _ippsMove_16s
        ldr     lr, [sp, #0x1C]
        mov     r10, #0
        add     r12, sp, #0x3C
        strh    r10, [lr, +r12]
        b       LDMB77
LDMB73:
        ldr     r12, [sp, #0x2C]
        ldr     r2, [sp, #0x34]
        mov     r0, #0x3F
        add     r10, r5, #0x7E
        add     r12, r12, #0x7E
        add     r11, r4, #0x7E
LDMB74:
        ldrsh   r3, [r10], #-2
        ldrsh   r1, [r12], #-2
        mul     r3, lr, r3
        mov     r3, r3, asr #15
        mov     r3, r3, lsl #16
        add     r3, r1, r3, asr #16
        cmp     r2, r3
        blt     LDMB75
        cmn     r3, #2, 18
        movge   r1, r3, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, #0xFF
        biclt   r1, r1, #0x7F, 24
        b       LDMB76
LDMB75:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDMB76:
        sub     r0, r0, #1
        strh    r1, [r11], #-2
        cmp     r0, #0
        bgt     LDMB74
        ldrsh   r12, [r5]
        ldr     r10, [sp, #0x1C]
        mul     r12, lr, r12
        add     lr, sp, #0x3C
        mov     r12, r12, asr #15
        strh    r12, [r10, +lr]
LDMB77:
        ldr     r12, [sp, #0x20]
        add     r6, r6, #1
        cmp     r6, r12
        blt     LDMB54
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x20]
        ldr     r5, [sp, #0x14]
LDMB78:
        add     r3, sp, #0xD0
        mvn     r11, #0
        str     r11, [sp]
        mov     r0, r5
        mov     r2, #0x40
        mov     r1, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r3, [sp, #0xD0]
        mvn     r10, #2, 2
        adds    r12, r3, #1
        mov     r3, r3, asr #31
        adc     r3, r3, #0
        subs    r5, r12, r10
        sbcs    lr, r3, #0
        movlt   r5, #0
        movlt   lr, #0
        orrs    lr, r5, lr
        movne   r12, r10
        bne     LDMB79
        cmp     r12, #2, 2
        sbcs    r3, r3, r11
        movlt   r12, #2, 2
LDMB79:
        ldr     r5, [pc, #0x374]
        cmp     r12, #0
        mov     lr, #0
        mov     r6, r12
        streq   r12, [sp, #0xD0]
        beq     LDMB82
        cmn     r12, #1
        beq     LDMB92
        cmp     r12, #0
        mvnlt   r6, r12
        cmp     r6, #0
        beq     LDMB81
        movs    r3, r6, lsr #16
        bne     LDMB80
        bic     r6, r6, #0xFF, 8
        bic     r3, r6, #0xFF, 16
        movs    lr, r3, asr #8
        movne   r3, lr, lsl #1
        ldrne   lr, [pc, #0x328]
        moveq   r3, r3, lsl #1
        moveq   lr, r5
        ldrsh   r3, [lr, +r3]
        add     r3, r3, #0x10
        mov     r3, r3, lsl #16
        mov     lr, r3, asr #16
        b       LDMB81
LDMB80:
        movs    r6, r6, lsr #24
        moveq   r3, r3, lsl #1
        ldreqsh lr, [r5, +r3]
        beq     LDMB81
        ldr     lr, [pc, #0x2F8]
        mov     r3, r6, lsl #1
        ldrsh   lr, [lr, +r3]
LDMB81:
        mov     r12, r12, lsl lr
        str     r12, [sp, #0xD0]
LDMB82:
        str     r11, [sp]
        add     r3, sp, #0xD0
        mov     r12, r12, asr #16
        rsb     lr, lr, #0x1E
        mov     r12, r12, lsl #16
        mov     r2, #0x40
        mov     r1, r4
        mov     r0, r4
        mov     r7, lr, lsl #16
        mov     r6, r12, asr #16
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r1, [sp, #0xD0]
        adds    r0, r1, #1
        mov     r1, r1, asr #31
        adc     r1, r1, #0
        subs    r3, r0, r10
        sbcs    r2, r1, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        movne   r0, r10
        bne     LDMB83
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, #2, 2
LDMB83:
        cmp     r0, #0
        mov     r2, #0
        mov     r3, r0
        streq   r0, [sp, #0xD0]
        beq     LDMB86
        cmn     r0, #1
        beq     LDMB93
        cmp     r0, #0
        mvnlt   r3, r0
        cmp     r3, #0
        beq     LDMB85
        movs    r1, r3, lsr #16
        bne     LDMB84
        bic     r3, r3, #0xFF, 8
        bic     r1, r3, #0xFF, 16
        movs    r2, r1, asr #8
        ldrne   r5, [pc, #0x240]
        movne   r1, r2, lsl #1
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r5, +r1]
        add     r1, r1, #0x10
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
        b       LDMB85
LDMB84:
        movs    r3, r3, lsr #24
        moveq   r1, r1, lsl #1
        ldreqsh r2, [r5, +r1]
        beq     LDMB85
        ldr     r1, [pc, #0x210]
        mov     r3, r3, lsl #1
        ldrsh   r2, [r1, +r3]
LDMB85:
        mov     r0, r0, lsl r2
        str     r0, [sp, #0xD0]
LDMB86:
        rsb     r2, r2, #0x1E
        add     r1, sp, #0xCC
        add     r0, sp, #0xD0
        strh    r2, [sp, #0xCC]
        bl      ownInvSqrt_32s16s_I
        ldr     r1, [sp, #0xD0]
        ldrsh   r2, [sp, #0xCC]
        ldr     r3, [sp, #0x24]
        mov     r1, r1, asr #16
        mov     r0, #2, 2
        add     r3, r2, r3
        mov     r1, r1, lsl #16
        adds    r7, r3, r7, asr #16
        mov     r1, r1, asr #16
        mul     r6, r6, r1
        rsbmi   r11, r7, r11
        movmi   r10, r6, asr r11
        bmi     LDMB87
        add     r7, r7, #1
        bic     r1, r7, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        cmp     r6, r10, asr r1
        bgt     LDMB87
        cmp     r6, r0, asr r1
        movge   r10, r6, lsl r1
        movlt   r10, #2, 2
LDMB87:
        ldr     r1, [pc, #0x19C]
        cmp     r1, r10
        ble     LDMB88
        add     r10, r10, #2, 18
        mov     r0, r10, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDMB89
LDMB88:
        sub     r0, r0, #2, 18
        sub     r0, r0, #2, 2
        mvn     r0, r0
LDMB89:
        mov     r9, r9, lsl #1
        strh    r0, [r8, +r9]
        add     sp, sp, #0xD4
        ldmia   sp!, {r4 - r11, pc}
LDMB90:
        mov     lr, #2, 2
        mov     r10, #2, 2
        mov     r11, #0x1F
        str     lr, [sp, #0xD0]
        b       LDMB61
LDMB91:
        mov     r0, #2, 2
        mov     lr, #0x1F
        str     r0, [sp, #0xD0]
        b       LDMB68
LDMB92:
        mov     r12, #2, 2
        str     r12, [sp, #0xD0]
        mov     lr, #0x1F
        b       LDMB82
LDMB93:
        mov     r1, #2, 2
        mov     r2, #0x1F
        str     r1, [sp, #0xD0]
        b       LDMB86
LDMB_ownInterpol4:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r1, #0
        blt     LDMB97
LDMB94:
        ldr     r2, [pc, #0x104]
        rsb     r1, r1, #3
        ldrsh   r3, [r0]
        ldrsh   r7, [r0, #-6]
        mov     r1, r1, lsl #4
        ldrsh   r5, [r2, +r1]
        add     r4, r2, r1
        ldrsh   r2, [r4, #2]
        ldrsh   r1, [r0, #-4]
        ldrsh   r6, [r4, #6]
        ldrsh   r12, [r4, #0xA]
        mul     lr, r1, r2
        ldrsh   r2, [r0, #4]
        mul     r3, r3, r6
        ldrsh   r1, [r4, #0xE]
        ldrsh   r6, [r0, #8]
        mul     r2, r2, r12
        ldrsh   r12, [r4, #4]
        mla     lr, r7, r5, lr
        mul     r1, r6, r1
        ldrsh   r6, [r0, #-2]
        ldrsh   r5, [r4, #8]
        ldrsh   r4, [r4, #0xC]
        mla     r12, r6, r12, r3
        ldrsh   r3, [r0, #6]
        ldrsh   r6, [r0, #2]
        mvn     r0, #0
        mla     r1, r3, r4, r1
        add     r12, lr, r12
        mla     r2, r6, r5, r2
        mvn     r3, #2, 2
        add     r1, r2, r1
        add     r12, r12, r1
        mov     r1, r12, lsl #2
        subs    r2, r1, r3
        mov     r3, r12, asr #31
        mov     r12, r12, lsr #30
        orr     r3, r12, r3, lsl #2
        sbcs    r12, r3, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        addne   r0, r0, #2, 18
        bne     LDMB96
        cmp     r1, #2, 2
        sbcs    r3, r3, r0
        bge     LDMB95
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        ldmia   sp!, {r4 - r7, pc}
LDMB95:
        mov     r2, r0, lsl #15
        sub     r2, r2, #2, 2
        cmp     r2, r1
        addle   r0, r0, #2, 18
        ldmleia sp!, {r4 - r7, pc}
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r0, r1, asr #16
        ldmia   sp!, {r4 - r7, pc}
LDMB96:
        ldmia   sp!, {r4 - r7, pc}
LDMB97:
        add     r1, r1, #4
        sub     r0, r0, #2
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDMB94
        .long   inter4_2Tbl
        .long   inter4_1Tbl
        .long   NormTable
        .long   NormTable2
        .long   0x7fff8000


