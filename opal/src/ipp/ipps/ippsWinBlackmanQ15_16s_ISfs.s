        .text
        .align  4
        .globl  _ippsWinBlackmanQ15_16s_ISfs


_ippsWinBlackmanQ15_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        mov     r7, r3
        mov     r4, r0
        rsb     r0, r7, #0
        mov     r5, r1
        mov     r11, r2
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r4, #0
        str     r0, [sp]
        mov     r8, r1
        beq     LAMM16
        cmp     r5, #3
        blt     LAMM11
        sub     r0, r5, #1
        str     r0, [sp, #0xC]
        bl      __floatsidf
        mov     r3, r1
        mov     r12, #1, 2
        mov     r2, r0
        sub     r1, r12, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x650]
        ldr     r3, [pc, #0x650]
        bl      __muldf3
        bl      cos
        add     r10, r4, r5, lsl #1
        sub     r12, r10, #2
        cmp     r5, #3
        mov     r9, r0
        mov     r6, r1
        str     r4, [sp, #8]
        str     r12, [sp, #4]
        beq     LAMM12
        mov     r0, r11
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        mov     r11, r0
        mov     r12, #1, 2
        sub     r3, r12, #1, 12
        str     r3, [sp, #0x24]
        mov     r2, #0
        bl      __adddf3
        mov     r12, #1, 2
        sub     r3, r12, #2, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, #0
        mov     r12, #1, 2
        add     r10, r12, #0x1D, 12
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x1C]
        mov     r0, r11
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #0x20]
        mov     r1, r6
        mov     r2, #0
        mov     r3, r10
        mov     r0, r9
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #0x10]
        mov     r1, r6
        mov     r3, r6
        mov     r0, r9
        mov     r2, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [sp, #0x24]
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        mov     r6, r0
        ldr     r0, [sp]
        mov     r2, #0xE, 12
        orr     r3, r2, #1, 2
        mov     r1, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        cmp     r7, #0xF
        ble     LAMM3
        cmp     r5, #6
        mov     r3, #0
        movlt   r2, #0
        blt     LAMM1
        mov     r2, #0
        sub     r6, r5, #6
        mov     lr, r2
        mov     r12, r4
LAMM0:
        add     r2, r2, #5
        strh    lr, [r12]
        strh    lr, [r12, #2]
        strh    lr, [r12, #4]
        strh    lr, [r12, #6]
        strh    lr, [r12, #8]
        cmp     r2, r6
        add     r12, r12, #0xA
        ble     LAMM0
LAMM1:
        add     r4, r4, r2, lsl #1
LAMM2:
        add     r2, r2, #1
        strh    r3, [r4], #2
        cmp     r2, r5
        blt     LAMM2
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LAMM3:
        cmn     r7, #0xF
        mov     r2, #0
        bge     LAMM6
        cmp     r5, #0
        ble     LAMM10
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     lr, #0
        mvn     r6, r3
LAMM4:
        ldrsh   r12, [r4]
        cmp     r12, #0
        streqh  r2, [r4]
        beq     LAMM5
        cmp     r12, #0
        strleh  r3, [r4]
        strgth  r6, [r4]
LAMM5:
        add     lr, lr, #1
        cmp     lr, r5
        add     r4, r4, #2
        blt     LAMM4
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LAMM6:
        ldr     r3, [sp, #0xC]
        cmp     r3, #0
        mov     r3, #1
        movlt   r2, r3
        add     r2, r5, r2
        sub     r2, r2, #1
        bic     r3, r5, #1
        movs    r2, r2, asr #1
        str     r3, [sp, #0xC]
        sub     r8, r2, #1
        moveq   r12, #1, 2
        beq     LAMM8
        ldr     r1, [sp, #0x10]
        mvn     r2, #0xFF
        mov     lr, r6, asr #31
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x14]
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #8]
        rsbs    r7, r6, #0
        bic     r2, r2, #0x7F, 24
        rsc     r9, lr, #0
        mov     r3, #0
        mvn     r2, r2
        mov     r12, #1, 2
        sub     lr, r3, #2, 18
        str     r9, [sp, #0x28]
        str     r0, [sp]
        str     r6, [sp, #0x24]
LAMM7:
        smull   r9, r10, r1, r12
        smull   r6, r0, r12, r12
        ldr     r11, [sp]
        str     r10, [sp, #0x30]
        str     r9, [sp, #0x2C]
        umull   r10, r9, r3, r7
        mov     r0, r0, lsl #2
        orr     r6, r0, r6, lsr #30
        sub     r0, r6, #2, 4
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x28]
        ldr     r6, [sp, #0x20]
        sub     r8, r8, #1
        mla     r9, r3, r10, r9
        str     r9, [sp, #0x38]
        ldr     r9, [sp, #0x24]
        smull   r9, r10, r12, r9
        str     r10, [sp, #0x40]
        str     r9, [sp, #0x3C]
        smull   r10, r9, r1, r3
        str     r9, [sp, #0x44]
        smull   r9, r6, r6, r0
        mov     r6, r6, lsl #2
        str     r10, [sp, #0x48]
        ldrsh   r0, [r4]
        ldrsh   r10, [r5]
        mov     r3, r3, asr #31
        orr     r9, r6, r9, lsr #30
        smull   r0, r11, r11, r0
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x1C]
        sub     r11, r11, r12, asr #1
        ldr     r12, [sp]
        sub     r11, r11, r9
        ldr     r9, [sp, #0x38]
        add     r6, r11, #1, 18
        smull   r12, r10, r12, r10
        str     r10, [sp, #0x50]
        mla     r9, r3, r7, r9
        mov     r3, r6, asr #15
        umull   r6, r10, r0, r3
        str     r9, [sp, #0x38]
        umull   r9, r11, r12, r3
        str     r11, [sp, #0x58]
        adds    r6, r6, #2, 4
        str     r9, [sp, #0x54]
        mov     r9, r3, asr #31
        mla     r0, r0, r9, r10
        ldr     r10, [sp, #0x58]
        mla     r9, r12, r9, r10
        ldr     r12, [sp, #0x4C]
        ldr     r10, [sp, #0x48]
        mla     r0, r12, r3, r0
        ldr     r12, [sp, #0x50]
        mla     r9, r12, r3, r9
        adc     r3, r0, #0
        ldr     r0, [sp, #0x54]
        mov     r3, r3, lsl #2
        orr     r6, r3, r6, lsr #30
        mov     r3, r2
        adds    r0, r0, #2, 4
        adc     r9, r9, #0
        cmn     r6, #2, 18
        movlt   r6, lr
        cmp     r6, r2
        mov     r12, r9, lsl #2
        movlt   r3, r6
        orr     r0, r12, r0, lsr #30
        cmn     r0, #2, 18
        movlt   r0, lr
        cmp     r0, r2
        mov     r6, r2
        movlt   r6, r0
        ldr     r12, [sp, #0x34]
        ldr     r0, [sp, #0x2C]
        ldr     r9, [sp, #0x38]
        adds    r12, r0, r12
        ldr     r0, [sp, #0x30]
        adc     r9, r0, r9
        ldr     r0, [sp, #0x3C]
        strh    r3, [r4], #2
        mov     r3, r9, lsl #2
        adds    r0, r0, r10
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        strh    r6, [r5], #-2
        orr     r12, r3, r12, lsr #30
        adc     r9, r9, r10
        cmn     r8, #1
        mov     r9, r9, lsl #2
        orr     r3, r9, r0, lsr #30
        bne     LAMM7
        str     r5, [sp, #4]
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x18]
        ldr     r0, [sp]
        ldr     r5, [sp, #0x14]
LAMM8:
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        cmp     r3, r2
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        beq     LAMM9
        smull   r3, lr, r12, r12
        mov     lr, lr, lsl #2
        ldr     r6, [sp, #0x1C]
        mov     r8, #0
        orr     r3, lr, r3, lsr #30
        ldr     lr, [sp, #0x20]
        sub     r3, r3, #2, 4
        sub     r12, r6, r12, asr #1
        sub     r8, r8, #2, 18
        smull   r3, lr, lr, r3
        mov     lr, lr, lsl #2
        orr     r3, lr, r3, lsr #30
        sub     r12, r12, r3
        ldr     r3, [sp, #8]
        ldr     lr, [sp, #4]
        add     r6, r12, #1, 18
        ldrsh   r7, [r3]
        mov     r6, r6, asr #15
        ldrsh   r12, [lr]
        str     r8, [sp, #0x58]
        smull   r9, r7, r0, r7
        str     r7, [sp, #0x54]
        smull   r8, r7, r0, r12
        mov     r12, r6, asr #31
        str     r12, [sp, #0x50]
        umull   r11, r10, r9, r6
        mvn     r12, r2
        str     r11, [sp, #0x4C]
        umull   r1, r11, r8, r6
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x50]
        mla     r10, r9, r11, r10
        ldr     r9, [sp, #0x44]
        ldr     r11, [sp, #0x54]
        str     r1, [sp, #0x48]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x50]
        mla     r9, r8, r10, r9
        ldr     r10, [sp, #0x40]
        ldr     r8, [sp, #0x4C]
        mla     r10, r11, r6, r10
        mla     r9, r7, r6, r9
        ldr     r6, [sp, #0x48]
        adds    r8, r8, #2, 4
        adc     r10, r10, #0
        ldr     r7, [sp, #0x58]
        adds    r6, r6, #2, 4
        mov     r10, r10, lsl #2
        orr     r8, r10, r8, lsr #30
        adc     r9, r9, #0
        cmn     r8, #2, 18
        movlt   r8, r7
        cmp     r8, r12
        mov     r7, r12
        movlt   r7, r8
        strh    r7, [r3]
        ldr     r3, [sp, #0x58]
        mov     r9, r9, lsl #2
        orr     r6, r9, r6, lsr #30
        cmn     r6, #2, 18
        movlt   r6, r3
        cmp     r6, r12
        movlt   r12, r6
        strh    r12, [lr]
LAMM9:
        tst     r5, #1
        beq     LAMM10
        ldr     r1, [sp, #0xC]
        mov     r3, #0
        sub     r3, r3, #2, 18
        ldrsh   r12, [r4, +r1]
        mvn     r2, r2
        smull   r12, lr, r0, r12
        adds    r12, r12, #1, 18
        adc     lr, lr, #0
        mov     lr, lr, lsl #17
        orr     r12, lr, r12, lsr #15
        cmn     r12, #2, 18
        movlt   r12, r3
        cmp     r12, r2
        movlt   r2, r12
        strh    r2, [r4, +r1]
LAMM10:
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LAMM11:
        mvn     r0, #5
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LAMM12:
        ldrsh   r0, [r4, #2]
        mov     r5, #0
        strh    r5, [r4]
        bl      __floatsidf
        ldr     r2, [sp]
        mov     r3, r8
        bl      __muldf3
        mov     r12, #1, 2
        add     r12, r12, #0xE, 12
        sub     r3, r12, #0x40
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LAMM13
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LAMM15
LAMM13:
        mov     r0, r7
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7F, 8
        mov     r1, r6
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        sublt   r1, r5, #2, 18
        blt     LAMM15
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LAMM14
        mov     r0, r7
        mov     r1, r6
        mov     r12, #1, 2
        sub     r3, r12, #2, 12
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        b       LAMM15
LAMM14:
        mov     r12, #1, 2
        sub     r1, r12, #2, 12
        mov     r0, #0
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
LAMM15:
        strh    r1, [r4, #2]
        mov     r0, #0
        strh    r5, [r10, #-2]
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LAMM16:
        mvn     r0, #7
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


