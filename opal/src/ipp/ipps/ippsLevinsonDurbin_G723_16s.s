        .text
        .align  4
        .globl  _ippsLevinsonDurbin_G723_16s


_ippsLevinsonDurbin_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r6, r0
        cmp     r6, #0
        mov     r11, r1
        mov     r4, r2
        mov     r5, r3
        beq     LDSQ32
        cmp     r5, #0
        beq     LDSQ32
        cmp     r4, #0
        beq     LDSQ32
        cmp     r11, #0
        beq     LDSQ32
        ldrsh   r12, [r6, #2]
        ldrsh   r9, [r6]
        mov     r7, r12, lsl #16
        eor     r12, r7, r7, asr #31
        sub     r12, r12, r7, asr #31
        cmp     r12, r9, lsl #16
        blt     LDSQ0
        ldrsh   r12, [r11]
        mov     r0, #0
        mov     r1, #0
        mov     r12, r12, lsl #1
        add     r12, r12, #1
        strh    r12, [r11]
        strh    r9, [r4]
        strh    r1, [r5]
        strh    r1, [r5, #2]
        strh    r1, [r5, #4]
        strh    r1, [r5, #6]
        strh    r1, [r5, #8]
        strh    r1, [r5, #0xA]
        strh    r1, [r5, #0xC]
        strh    r1, [r5, #0xE]
        strh    r1, [r5, #0x10]
        strh    r1, [r5, #0x12]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDSQ0:
        mov     r0, r12, asr #1
        mov     r1, r9
        bl      __intel_idiv
        cmp     r7, #0
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        blt     LDSQ1
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDSQ1:
        bic     lr, r7, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        mul     r8, r12, lr
        mov     lr, r12, lsl #1
        mov     r7, r7, asr #16
        mul     lr, lr, r7
        rsb     r12, r12, #2
        mov     r8, r8, asr #15
        mov     r7, r12, asr #2
        mov     r10, r8, asr #31
        adds    r12, lr, r8
        adc     r10, r10, lr, asr #31
        mvn     r8, #2, 2
        subs    r0, r12, r8
        mov     lr, r7, lsl #16
        sbcs    r7, r10, #0
        movlt   r0, #0
        movlt   r7, #0
        orrs    r0, r0, r7
        mov     lr, lr, asr #16
        strh    lr, [r5]
        mvn     r7, #0
        movne   r12, r8
        bne     LDSQ2
        cmp     r12, #2, 2
        sbcs    r10, r10, r7
        movlt   r12, #2, 2
LDSQ2:
        add     r9, r12, r9, lsl #16
        ldrsh   r10, [r6, #4]
        ldrsh   r12, [r6, #2]
        add     r9, r9, #2, 18
        mov     r10, r10, lsl #13
        mov     r9, r9, asr #16
        rsb     r12, r12, #0
        mla     r10, r12, lr, r10
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mov     r10, r10, lsl #3
        eor     r12, r10, r10, asr #31
        sub     r12, r12, r10, asr #31
        cmp     r12, r9, lsl #16
        blt     LDSQ3
        ldrsh   r12, [r11]
        mov     r0, #0
        mov     r1, #0
        mov     r12, r12, lsl #1
        add     r12, r12, #1
        strh    r12, [r11]
        strh    r9, [r4]
        strh    r1, [r5, #2]
        strh    r1, [r5, #4]
        strh    r1, [r5, #6]
        strh    r1, [r5, #8]
        strh    r1, [r5, #0xA]
        strh    r1, [r5, #0xC]
        strh    r1, [r5, #0xE]
        strh    r1, [r5, #0x10]
        strh    r1, [r5, #0x12]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDSQ3:
        mov     r0, r12, asr #1
        mov     r1, r9
        bl      __intel_idiv
        cmp     r10, #0
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        blt     LDSQ4
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDSQ4:
        rsb     lr, r12, #2
        mov     r0, #0x9A
        mov     lr, lr, asr #2
        strh    lr, [r5, #2]
        ldrsh   lr, [r11]
        orr     r0, r0, #0x79, 24
        cmp     r0, r12
        mov     lr, lr, lsl #1
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strgeh  lr, [r11]
        addlt   lr, lr, #1
        strlth  lr, [r11]
        bic     lr, r10, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        mul     lr, r12, lr
        mov     r10, r10, asr #16
        mov     r0, r12, lsl #1
        mul     r10, r0, r10
        mov     lr, lr, asr #15
        mov     r0, lr, asr #31
        adds    lr, r10, lr
        adc     r10, r0, r10, asr #31
        subs    r1, lr, r8
        sbcs    r0, r10, #0
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        movne   lr, r8
        bne     LDSQ5
        cmp     lr, #2, 2
        sbcs    r10, r10, r7
        movlt   lr, #2, 2
LDSQ5:
        ldrsh   r7, [r5]
        add     r9, lr, r9, lsl #16
        ldrsh   lr, [r5, #2]
        mov     r10, r7, lsl #15
        mla     r12, r12, r7, r10
        add     r9, r9, #2, 18
        str     lr, [sp]
        mov     r9, r9, asr #16
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        mov     r7, r9, lsl #16
        mov     r12, r12, lsl #16
        mov     r7, r7, asr #16
        mov     r10, r12, asr #16
        strh    r10, [r5]
        ldrsh   r9, [r6, #6]
        ldrsh   r0, [r6, #4]
        ldrsh   r12, [r6, #2]
        mov     r9, r9, lsl #13
        rsb     r0, r0, #0
        mla     r9, r0, r10, r9
        mul     lr, r12, lr
        sub     r9, r9, lr
        mov     r9, r9, lsl #3
        eor     r12, r9, r9, asr #31
        sub     r12, r12, r9, asr #31
        cmp     r12, r7, lsl #16
        blt     LDSQ6
        ldrsh   r12, [r11]
        mov     r0, #0
        mov     r1, #0
        mov     r12, r12, lsl #1
        add     r12, r12, #1
        strh    r12, [r11]
        strh    r7, [r4]
        strh    r1, [r5, #4]
        strh    r1, [r5, #6]
        strh    r1, [r5, #8]
        strh    r1, [r5, #0xA]
        strh    r1, [r5, #0xC]
        strh    r1, [r5, #0xE]
        strh    r1, [r5, #0x10]
        strh    r1, [r5, #0x12]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDSQ6:
        mov     r0, r12, asr #1
        mov     r1, r7
        bl      __intel_idiv
        cmp     r9, #0
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        blt     LDSQ7
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDSQ7:
        bic     lr, r9, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        mul     lr, r12, lr
        mov     r9, r9, asr #16
        mov     r0, r12, lsl #1
        mul     r9, r0, r9
        mov     r1, lr, asr #15
        rsb     lr, r12, #2
        mov     lr, lr, asr #2
        mov     r0, lr, lsl #16
        adds    lr, r9, r1
        mov     r1, r1, asr #31
        adc     r9, r1, r9, asr #31
        mov     r0, r0, asr #16
        str     r0, [sp, #4]
        subs    r1, lr, r8
        strh    r0, [r5, #4]
        sbcs    r0, r9, #0
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        movne   lr, r8
        bne     LDSQ8
        cmp     lr, #2, 2
        mvn     r8, #0
        sbcs    r9, r9, r8
        movlt   lr, #2, 2
LDSQ8:
        ldr     r8, [sp]
        add     r7, lr, r7, lsl #16
        mov     lr, r10, lsl #15
        mla     lr, r12, r8, lr
        mov     r8, r8, lsl #15
        mla     r10, r12, r10, r8
        add     r7, r7, #2, 18
        add     r12, lr, #1, 18
        mov     lr, r7, asr #16
        mov     r12, r12, asr #15
        add     r10, r10, #1, 18
        mov     r7, lr, lsl #16
        mov     lr, r12, lsl #16
        mov     r12, r10, asr #15
        mov     r7, r7, asr #16
        mov     r10, lr, asr #16
        mov     r12, r12, lsl #16
        strh    r10, [r5]
        mov     r9, r12, asr #16
        strh    r9, [r5, #2]
        ldrsh   r0, [r6, #6]
        ldrsh   r12, [r6, #8]
        ldrsh   lr, [r6, #4]
        rsb     r0, r0, #0
        mov     r8, r12, lsl #13
        mla     r8, r0, r10, r8
        mul     lr, lr, r9
        ldr     r0, [sp, #4]
        ldrsh   r12, [r6, #2]
        sub     r8, r8, lr
        mul     r0, r12, r0
        mov     r12, #0
        sub     r8, r8, r0
        mov     r8, r8, lsl #3
        eor     lr, r8, r8, asr #31
        sub     lr, lr, r8, asr #31
        cmp     lr, r7, lsl #16
        blt     LDSQ9
        ldrsh   lr, [r11]
        mov     r0, #0
        mov     lr, lr, lsl #1
        add     lr, lr, #1
        strh    lr, [r11]
        strh    r7, [r4]
        strh    r12, [r5, #6]
        strh    r12, [r5, #8]
        strh    r12, [r5, #0xA]
        strh    r12, [r5, #0xC]
        strh    r12, [r5, #0xE]
        strh    r12, [r5, #0x10]
        strh    r12, [r5, #0x12]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDSQ9:
        mov     r0, lr, asr #1
        mov     r1, r7
        bl      __intel_idiv
        cmp     r8, #0
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        blt     LDSQ10
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDSQ10:
        bic     lr, r8, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        mul     lr, r12, lr
        mov     r8, r8, asr #16
        mov     r0, r12, lsl #1
        mul     r8, r0, r8
        mov     r0, lr, asr #15
        rsb     lr, r12, #2
        mov     lr, lr, asr #2
        strh    lr, [r5, #6]
        adds    lr, r8, r0
        mov     r0, r0, asr #31
        adc     r8, r0, r8, asr #31
        mvn     r0, #2, 2
        subs    r2, lr, r0
        sbcs    r1, r8, #0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        movne   lr, r0
        bne     LDSQ11
        cmp     lr, #2, 2
        mvn     r0, #0
        sbcs    r8, r8, r0
        movlt   lr, #2, 2
LDSQ11:
        ldr     r8, [sp, #4]
        add     r7, lr, r7, lsl #16
        mov     lr, r10, lsl #15
        mla     lr, r12, r8, lr
        mov     r8, r8, lsl #15
        mla     r10, r12, r10, r8
        mov     r8, r9, lsl #15
        mla     r9, r12, r9, r8
        add     r7, r7, #2, 18
        add     lr, lr, #1, 18
        add     r12, r10, #1, 18
        add     r9, r9, #1, 18
        mov     r7, r7, asr #16
        mov     lr, lr, asr #15
        mov     r12, r12, asr #15
        mov     r9, r9, asr #15
        strh    lr, [r5]
        strh    r12, [r5, #4]
        strh    r9, [r5, #2]
        mov     r7, r7, lsl #16
        mvn     r12, #0
        mov     r1, r7, asr #16
        mvn     lr, #2, 2
        str     r4, [sp, #0x10]
        mov     r7, #4
        add     r9, r6, #0xA
        add     r8, r5, #8
        mov     r10, #8
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r11, [sp, #0xC]
        mov     r4, r1
LDSQ12:
        ldrsh   r2, [r9], #2
        cmp     r7, #0
        mov     r2, r2, lsl #13
        mov     r12, r7, lsl #1
        ble     LDSQ16
        cmp     r7, #6
        addlt   r0, r6, r12
        movlt   r3, #0
        blt     LDSQ14
        add     r0, r6, r12
        mov     r3, #0
        sub     lr, r7, #6
        mov     r12, r5
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r7, [sp]
        str     r4, [sp, #4]
        str     r5, [sp, #0x14]
        str     r6, [sp, #8]
LDSQ13:
        ldrsh   r11, [r12]
        mvn     r1, #0
        rsb     r5, r3, #0
        rsb     r4, r3, r1
        ldrsh   r6, [r12, #2]
        ldrsh   r7, [r12, #4]
        ldrsh   r8, [r12, #6]
        ldrsh   r9, [r12, #8]
        mov     r5, r5, lsl #1
        ldrsh   r5, [r0, +r5]
        mvn     r1, #1
        rsb     r1, r3, r1
        mul     r5, r11, r5
        mov     r4, r4, lsl #1
        ldrsh   r4, [r0, +r4]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        mvn     r10, #2
        mul     r4, r6, r4
        mvn     r11, #3
        mul     r1, r7, r1
        rsb     r10, r3, r10
        rsb     r11, r3, r11
        sub     r2, r2, r5
        mov     r10, r10, lsl #1
        ldrsh   r6, [r0, +r10]
        mov     r11, r11, lsl #1
        ldrsh   r7, [r0, +r11]
        sub     r2, r2, r4
        mul     r6, r8, r6
        sub     r2, r2, r1
        mul     r7, r9, r7
        add     r3, r3, #5
        cmp     r3, lr
        sub     r2, r2, r6
        sub     r2, r2, r7
        add     r12, r12, #0xA
        ble     LDSQ13
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r7, [sp]
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #8]
LDSQ14:
        add     r12, r5, r3, lsl #1
LDSQ15:
        rsb     r11, r3, #0
        ldrsh   lr, [r12], #2
        mov     r11, r11, lsl #1
        ldrsh   r11, [r0, +r11]
        add     r3, r3, #1
        mul     r11, lr, r11
        cmp     r3, r7
        sub     r2, r2, r11
        blt     LDSQ15
LDSQ16:
        movs    r11, r2, lsl #3
        mov     r2, r11
        rsbmi   r2, r11, #0
        cmp     r2, r4, lsl #16
        bge     LDSQ27
        mov     r0, r2, asr #1
        mov     r1, r4
        bl      __intel_idiv
        cmp     r11, #0
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        blt     LDSQ17
        rsb     r0, r0, #0
        mov     r2, r0, lsl #16
        mov     r0, r2, asr #16
LDSQ17:
        bic     r2, r11, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        mul     r2, r0, r2
        mov     r11, r11, asr #16
        mov     r12, r0, lsl #1
        mul     lr, r12, r11
        mov     r2, r2, asr #15
        rsb     r12, r0, #2
        mov     r11, r2, asr #31
        mov     r12, r12, asr #2
        adds    r2, lr, r2
        adc     lr, r11, lr, asr #31
        ldr     r11, [sp, #0x1C]
        strh    r12, [r8], #2
        subs    r11, r2, r11
        sbcs    r1, lr, #0
        movlt   r11, #0
        movlt   r1, #0
        orrs    r1, r11, r1
        mvnne   r2, #2, 2
        bne     LDSQ18
        ldr     r12, [sp, #0x18]
        cmp     r2, #2, 2
        sbcs    lr, lr, r12
        movlt   r2, #2, 2
LDSQ18:
        add     r4, r2, r4, lsl #16
        add     r1, r4, #2, 18
        cmp     r7, #0
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r4, r1, asr #16
        ble     LDSQ22
        cmp     r7, #6
        movlt   r2, #0
        blt     LDSQ20
        mov     r11, #0
        mov     r2, r11
        sub     lr, r7, #6
        mov     r12, r5
        str     r10, [sp, #0x20]
        str     r7, [sp]
        str     r4, [sp, #4]
        str     r5, [sp, #0x14]
        str     r6, [sp, #8]
LDSQ19:
        ldrsh   r1, [r12]
        ldrsh   r4, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r6, [r12, #6]
        ldrsh   r7, [r12, #8]
        add     r3, sp, #0x2C
        add     r10, r3, r11
        add     r2, r2, #5
        strh    r1, [r3, +r11]
        cmp     r2, lr
        strh    r4, [r10, #2]
        strh    r5, [r10, #4]
        strh    r6, [r10, #6]
        strh    r7, [r10, #8]
        add     r11, r11, #0xA
        add     r12, r12, #0xA
        ble     LDSQ19
        ldr     r10, [sp, #0x20]
        ldr     r7, [sp]
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #8]
LDSQ20:
        add     r11, r5, r2, lsl #1
        mov     r1, r2, lsl #1
LDSQ21:
        ldrsh   r12, [r11], #2
        add     lr, sp, #0x2C
        add     r2, r2, #1
        strh    r12, [lr, +r1]
        cmp     r2, r7
        add     r1, r1, #2
        blt     LDSQ21
LDSQ22:
        cmp     r7, #0
        ble     LDSQ26
        cmp     r7, #5
        add     r2, sp, #0x2C
        addlt   r2, r2, r10
        movlt   r11, #0
        blt     LDSQ24
        add     r2, r2, r10
        mov     r11, #0
        sub     lr, r7, #5
        mov     r12, r5
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r7, [sp]
        str     r4, [sp, #4]
        str     r5, [sp, #0x14]
        str     r6, [sp, #8]
LDSQ23:
        ldrsh   r3, [r12]
        rsb     r1, r11, #0
        ldrsh   r4, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r6, [r12, #6]
        add     r1, r2, r1, lsl #1
        ldrsh   r7, [r1, #-4]
        ldrsh   r9, [r1, #-6]
        ldrsh   r10, [r1, #-2]
        ldrsh   r1, [r1, #-8]
        mov     r3, r3, lsl #15
        mov     r4, r4, lsl #15
        mla     r3, r0, r10, r3
        mla     r7, r0, r7, r4
        mov     r5, r5, lsl #15
        mla     r9, r0, r9, r5
        mov     r6, r6, lsl #15
        mla     r1, r0, r1, r6
        add     r3, r3, #1, 18
        add     r7, r7, #1, 18
        add     r9, r9, #1, 18
        add     r1, r1, #1, 18
        mov     r3, r3, asr #15
        mov     r7, r7, asr #15
        mov     r9, r9, asr #15
        mov     r1, r1, asr #15
        add     r11, r11, #4
        strh    r3, [r12]
        strh    r7, [r12, #2]
        strh    r9, [r12, #4]
        strh    r1, [r12, #6]
        cmp     r11, lr
        add     r12, r12, #8
        ble     LDSQ23
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r7, [sp]
        ldr     r4, [sp, #4]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #8]
LDSQ24:
        add     lr, r5, r11, lsl #1
LDSQ25:
        ldrsh   r12, [lr]
        rsb     r1, r11, #0
        add     r11, r11, #1
        mov     r12, r12, lsl #15
        add     r1, r2, r1, lsl #1
        ldrsh   r1, [r1, #-2]
        cmp     r11, r7
        mla     r12, r0, r1, r12
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [lr], #2
        blt     LDSQ25
LDSQ26:
        add     r7, r7, #1
        cmp     r7, #0xA
        add     r10, r10, #2
        blt     LDSQ12
        mov     r1, r4
        ldr     r4, [sp, #0x10]
        mov     r0, #0
        strh    r1, [r4]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDSQ27:
        mov     r1, r4
        ldr     r11, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        cmp     r7, #0xA
        ldrsh   r0, [r11]
        mov     r0, r0, lsl #1
        add     r0, r0, #1
        strh    r0, [r11]
        strh    r1, [r4]
        bge     LDSQ31
        rsb     r0, r7, #0xA
        cmp     r0, #6
        mov     r0, #0
        blt     LDSQ29
        add     r1, r5, r7, lsl #1
LDSQ28:
        add     r7, r7, #5
        strh    r0, [r1]
        strh    r0, [r1, #2]
        strh    r0, [r1, #4]
        strh    r0, [r1, #6]
        strh    r0, [r1, #8]
        cmp     r7, #4
        add     r1, r1, #0xA
        blt     LDSQ28
LDSQ29:
        add     r5, r5, r7, lsl #1
LDSQ30:
        add     r7, r7, #1
        strh    r0, [r5], #2
        cmp     r7, #0xA
        blt     LDSQ30
LDSQ31:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDSQ32:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


