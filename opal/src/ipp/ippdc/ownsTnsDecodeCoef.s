        .text
        .align  4
        .globl  ownsTnsDecodeCoef


ownsTnsDecodeCoef:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        ldr     r12, [pc, #0x9B4]
        ldr     r11, [sp, #0xFC]
        mov     r4, r2
        sub     r3, r3, #3
        cmp     r4, #0
        add     r3, r12, r3, lsl #6
        ble     LGGZ1
        mov     r12, #0
LGGZ0:
        ldrsb   lr, [r0], #1
        cmn     lr, #8
        blt     LGGZ29
        cmp     lr, #7
        bgt     LGGZ28
        mov     lr, lr, lsl #2
        add     lr, lr, #0x20
        ldr     lr, [r3, +lr]
        add     r5, r1, #4
        str     lr, [r5, +r12, lsl #2]
        add     r12, r12, #1
        cmp     r12, r4
        blt     LGGZ0
LGGZ1:
        cmp     r4, #0xC
        mov     lr, #8
        bgt     LGGZ8
        cmp     r4, #1
        blt     LGGZ7
        mov     r7, #1
        add     r6, r1, #4
        str     r11, [sp, #8]
        str     r1, [sp]
LGGZ2:
        ldr     r12, [r6], #4
        add     r0, sp, #0x30
        str     r12, [r0, +r7, lsl #3]
        mov     r8, r7, asr #1
        add     r0, r0, lr
        mov     r3, r12, asr #31
        cmp     r8, #1
        str     r3, [r0, #4]
        blt     LGGZ6
        sub     r1, r8, #1
        cmp     r1, #4
        movlt   r1, #1
        blt     LGGZ4
        sub     r9, r8, #4
        mov     r5, #8
        mov     r1, #1
        str     r5, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     lr, [sp, #0xC]
        str     r4, [sp, #4]
LGGZ3:
        add     r2, sp, #0x30
        ldr     r4, [r2, +r1, lsl #3]
        ldr     r9, [sp, #0x10]
        rsb     r6, r1, #0
        ldr     r8, [r0, +r6, lsl #3]
        add     r5, r0, r6, lsl #3
        ldr     r7, [r5, #4]
        add     r2, r2, r9
        ldr     lr, [r2, #4]
        adds    r10, r8, #2, 24
        adc     r11, r7, #0
        add     r9, r9, #0x18
        str     r9, [sp, #0x10]
        mov     r9, r11, lsl #22
        orr     r10, r9, r10, lsr #10
        str     r10, [sp, #0x24]
        umull   r9, r10, r12, r10
        str     r10, [sp, #0x2C]
        mov     r11, r11, asr #10
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        mla     r11, r12, r11, r9
        ldr     r9, [sp, #0x24]
        mla     r9, r3, r9, r11
        ldr     r11, [sp, #0x28]
        mov     r10, r9, lsl #11
        orr     r11, r10, r11, lsr #21
        adds    r10, r4, r11
        add     r11, sp, #0x30
        str     r10, [r11, +r1, lsl #3]
        adc     r9, lr, r9, asr #21
        str     r9, [r2, #4]
        adds    r4, r4, #2, 24
        adc     lr, lr, #0
        add     r1, r1, #3
        mov     r9, lr, lsl #22
        orr     r10, r9, r4, lsr #10
        umull   r9, r4, r12, r10
        mov     lr, lr, asr #10
        mla     r11, r12, lr, r4
        ldr     lr, [r5, #-8]
        ldr     r4, [r5, #-4]
        mla     r10, r3, r10, r11
        mov     r11, r10, lsl #11
        orr     r9, r11, r9, lsr #21
        adds    r8, r9, r8
        str     r8, [r0, +r6, lsl #3]
        adc     r7, r7, r10, asr #21
        adds    r6, lr, #2, 24
        str     r7, [r5, #4]
        ldr     r7, [r2, #0xC]
        ldr     r8, [r2, #8]
        adc     r10, r4, #0
        mov     r9, r10, lsl #22
        orr     r9, r9, r6, lsr #10
        umull   r6, r11, r12, r9
        mov     r10, r10, asr #10
        mla     r11, r12, r10, r11
        mla     r9, r3, r9, r11
        mov     r10, r9, lsl #11
        orr     r6, r10, r6, lsr #21
        adds    r6, r8, r6
        str     r6, [r2, #8]
        adc     r9, r7, r9, asr #21
        adds    r8, r8, #2, 24
        adc     r7, r7, #0
        str     r9, [r2, #0xC]
        mov     r6, r7, lsl #22
        orr     r9, r6, r8, lsr #10
        umull   r8, r6, r12, r9
        mov     r7, r7, asr #10
        mla     r10, r12, r7, r6
        ldr     r6, [r5, #-0x10]
        ldr     r7, [r5, #-0xC]
        mla     r9, r3, r9, r10
        mov     r10, r9, lsl #11
        orr     r8, r10, r8, lsr #21
        adds    lr, r8, lr
        str     lr, [r5, #-8]
        adc     r9, r4, r9, asr #21
        adds    lr, r6, #2, 24
        adc     r10, r7, #0
        str     r9, [r5, #-4]
        ldr     r8, [r2, #0x10]
        ldr     r4, [r2, #0x14]
        mov     r9, r10, lsl #22
        orr     r9, r9, lr, lsr #10
        umull   lr, r11, r12, r9
        mov     r10, r10, asr #10
        mla     r11, r12, r10, r11
        mla     r9, r3, r9, r11
        mov     r10, r9, lsl #11
        orr     lr, r10, lr, lsr #21
        adds    lr, r8, lr
        str     lr, [r2, #0x10]
        adc     r9, r4, r9, asr #21
        adds    r8, r8, #2, 24
        adc     r4, r4, #0
        str     r9, [r2, #0x14]
        mov     r2, r4, lsl #22
        orr     r8, r2, r8, lsr #10
        umull   r2, lr, r12, r8
        mov     r4, r4, asr #10
        mla     lr, r12, r4, lr
        mla     r8, r3, r8, lr
        mov     lr, r8, lsl #11
        orr     r2, lr, r2, lsr #21
        adds    r6, r2, r6
        ldr     r2, [sp, #0x14]
        adc     r8, r7, r8, asr #21
        str     r6, [r5, #-0x10]
        str     r8, [r5, #-0xC]
        cmp     r1, r2
        ble     LGGZ3
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #4]
LGGZ4:
        mov     r5, r1, lsl #3
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     lr, [sp, #0xC]
        str     r4, [sp, #4]
LGGZ5:
        rsb     r6, r1, #0
        add     r2, sp, #0x30
        ldr     r4, [r0, +r6, lsl #3]
        ldr     lr, [r2, +r1, lsl #3]
        add     r8, r0, r6, lsl #3
        ldr     r7, [r8, #4]
        adds    r9, r4, #2, 24
        add     r2, r2, r5
        str     r2, [sp, #0x2C]
        ldr     r2, [r2, #4]
        adc     r10, r7, #0
        add     r5, r5, #8
        mov     r11, r10, lsl #22
        orr     r9, r11, r9, lsr #10
        str     r9, [sp, #0x28]
        umull   r9, r11, r12, r9
        str     r11, [sp, #0x14]
        mov     r10, r10, asr #10
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x14]
        ldr     r11, [sp, #0x24]
        mla     r10, r12, r10, r9
        ldr     r9, [sp, #0x28]
        mla     r9, r3, r9, r10
        mov     r10, r9, lsl #11
        orr     r11, r10, r11, lsr #21
        adds    r10, lr, r11
        add     r11, sp, #0x30
        str     r10, [r11, +r1, lsl #3]
        ldr     r10, [sp, #0x2C]
        adc     r9, r2, r9, asr #21
        adds    lr, lr, #2, 24
        str     r9, [r10, #4]
        adc     r2, r2, #0
        add     r1, r1, #1
        mov     r9, r2, lsl #22
        orr     lr, r9, lr, lsr #10
        umull   r9, r10, r12, lr
        mov     r2, r2, asr #10
        mla     r10, r12, r2, r10
        mla     lr, r3, lr, r10
        mov     r2, lr, lsl #11
        orr     r9, r2, r9, lsr #21
        adds    r4, r9, r4
        str     r4, [r0, +r6, lsl #3]
        adc     lr, r7, lr, asr #21
        str     lr, [r8, #4]
        ldr     r2, [sp, #0x18]
        cmp     r1, r2
        ble     LGGZ5
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #4]
LGGZ6:
        add     r7, r7, #1
        cmp     r7, r4
        add     lr, lr, #8
        ble     LGGZ2
        ldr     r11, [sp, #8]
        ldr     r1, [sp]
LGGZ7:
        mov     r8, #0x1F
        mov     r3, r8
        b       LGGZ14
LGGZ8:
        mov     r7, #1
        add     r6, r1, #4
        str     r11, [sp, #8]
        str     r1, [sp]
LGGZ9:
        ldr     r12, [r6], #4
        add     r0, sp, #0x30
        mov     r5, r12, lsl #8
        mov     r1, r12, lsr #24
        str     r5, [r0, +r7, lsl #3]
        mov     r3, r12, asr #31
        mov     r8, r7, asr #1
        add     r0, r0, lr
        orr     r1, r1, r3, lsl #8
        cmp     r8, #1
        str     r1, [r0, #4]
        blt     LGGZ13
        sub     r1, r8, #1
        cmp     r1, #4
        movlt   r1, #1
        blt     LGGZ11
        sub     r9, r8, #4
        mov     r5, #8
        mov     r1, #1
        str     r5, [sp, #0x20]
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r4, [sp, #4]
LGGZ10:
        add     r2, sp, #0x30
        ldr     r4, [r2, +r1, lsl #3]
        ldr     r9, [sp, #0x20]
        rsb     r6, r1, #0
        ldr     r8, [r0, +r6, lsl #3]
        add     r5, r0, r6, lsl #3
        ldr     r7, [r5, #4]
        add     r2, r2, r9
        ldr     lr, [r2, #4]
        adds    r10, r8, #1, 10
        adc     r11, r7, #0
        add     r9, r9, #0x18
        str     r9, [sp, #0x20]
        mov     r9, r11, lsl #9
        orr     r10, r9, r10, lsr #23
        str     r10, [sp, #0x2C]
        umull   r9, r10, r12, r10
        str     r10, [sp, #0x24]
        mov     r11, r11, asr #23
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        mla     r11, r12, r11, r9
        ldr     r9, [sp, #0x2C]
        mla     r9, r3, r9, r11
        ldr     r11, [sp, #0x28]
        mov     r10, r9, lsl #24
        orr     r11, r10, r11, lsr #8
        adds    r10, r4, r11
        add     r11, sp, #0x30
        str     r10, [r11, +r1, lsl #3]
        adc     r9, lr, r9, asr #8
        str     r9, [r2, #4]
        adds    r4, r4, #1, 10
        adc     lr, lr, #0
        add     r1, r1, #3
        mov     r9, lr, lsl #9
        orr     r10, r9, r4, lsr #23
        umull   r9, r4, r12, r10
        mov     lr, lr, asr #23
        mla     r11, r12, lr, r4
        ldr     lr, [r5, #-8]
        ldr     r4, [r5, #-4]
        mla     r10, r3, r10, r11
        mov     r11, r10, lsl #24
        orr     r9, r11, r9, lsr #8
        adds    r8, r9, r8
        str     r8, [r0, +r6, lsl #3]
        adc     r7, r7, r10, asr #8
        adds    r6, lr, #1, 10
        str     r7, [r5, #4]
        ldr     r7, [r2, #0xC]
        ldr     r8, [r2, #8]
        adc     r10, r4, #0
        mov     r9, r10, lsl #9
        orr     r9, r9, r6, lsr #23
        umull   r6, r11, r12, r9
        mov     r10, r10, asr #23
        mla     r11, r12, r10, r11
        mla     r9, r3, r9, r11
        mov     r10, r9, lsl #24
        orr     r6, r10, r6, lsr #8
        adds    r6, r8, r6
        str     r6, [r2, #8]
        adc     r9, r7, r9, asr #8
        adds    r8, r8, #1, 10
        adc     r7, r7, #0
        str     r9, [r2, #0xC]
        mov     r6, r7, lsl #9
        orr     r9, r6, r8, lsr #23
        umull   r8, r6, r12, r9
        mov     r7, r7, asr #23
        mla     r10, r12, r7, r6
        ldr     r6, [r5, #-0x10]
        ldr     r7, [r5, #-0xC]
        mla     r9, r3, r9, r10
        mov     r10, r9, lsl #24
        orr     r8, r10, r8, lsr #8
        adds    lr, r8, lr
        str     lr, [r5, #-8]
        adc     r9, r4, r9, asr #8
        adds    lr, r6, #1, 10
        adc     r10, r7, #0
        str     r9, [r5, #-4]
        ldr     r8, [r2, #0x10]
        ldr     r4, [r2, #0x14]
        mov     r9, r10, lsl #9
        orr     r9, r9, lr, lsr #23
        umull   lr, r11, r12, r9
        mov     r10, r10, asr #23
        mla     r11, r12, r10, r11
        mla     r9, r3, r9, r11
        mov     r10, r9, lsl #24
        orr     lr, r10, lr, lsr #8
        adds    lr, r8, lr
        str     lr, [r2, #0x10]
        adc     r9, r4, r9, asr #8
        adds    r8, r8, #1, 10
        adc     r4, r4, #0
        str     r9, [r2, #0x14]
        mov     r2, r4, lsl #9
        orr     r8, r2, r8, lsr #23
        umull   r2, lr, r12, r8
        mov     r4, r4, asr #23
        mla     lr, r12, r4, lr
        mla     r8, r3, r8, lr
        mov     lr, r8, lsl #24
        orr     r2, lr, r2, lsr #8
        adds    r6, r2, r6
        ldr     r2, [sp, #0x1C]
        adc     r8, r7, r8, asr #8
        str     r6, [r5, #-0x10]
        str     r8, [r5, #-0xC]
        cmp     r1, r2
        ble     LGGZ10
        ldr     r8, [sp, #0x18]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #4]
LGGZ11:
        mov     r5, r1, lsl #3
        str     r8, [sp, #0x18]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r4, [sp, #4]
LGGZ12:
        rsb     r6, r1, #0
        add     r2, sp, #0x30
        ldr     r4, [r0, +r6, lsl #3]
        ldr     lr, [r2, +r1, lsl #3]
        add     r8, r0, r6, lsl #3
        ldr     r7, [r8, #4]
        adds    r9, r4, #1, 10
        add     r2, r2, r5
        str     r2, [sp, #0x2C]
        ldr     r2, [r2, #4]
        adc     r10, r7, #0
        add     r5, r5, #8
        mov     r11, r10, lsl #9
        orr     r9, r11, r9, lsr #23
        str     r9, [sp, #0x28]
        umull   r9, r11, r12, r9
        str     r11, [sp, #0x20]
        mov     r10, r10, asr #23
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        mla     r10, r12, r10, r9
        ldr     r9, [sp, #0x28]
        mla     r9, r3, r9, r10
        mov     r10, r9, lsl #24
        orr     r11, r10, r11, lsr #8
        adds    r10, lr, r11
        add     r11, sp, #0x30
        str     r10, [r11, +r1, lsl #3]
        ldr     r10, [sp, #0x2C]
        adc     r9, r2, r9, asr #8
        adds    lr, lr, #1, 10
        str     r9, [r10, #4]
        adc     r2, r2, #0
        add     r1, r1, #1
        mov     r9, r2, lsl #9
        orr     lr, r9, lr, lsr #23
        umull   r9, r10, r12, lr
        mov     r2, r2, asr #23
        mla     r10, r12, r2, r10
        mla     lr, r3, lr, r10
        mov     r2, lr, lsl #24
        orr     r9, r2, r9, lsr #8
        adds    r4, r9, r4
        str     r4, [r0, +r6, lsl #3]
        adc     lr, r7, lr, asr #8
        str     lr, [r8, #4]
        ldr     r2, [sp, #0x18]
        cmp     r1, r2
        ble     LGGZ12
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #4]
LGGZ13:
        add     r7, r7, #1
        cmp     r7, r4
        add     lr, lr, #8
        ble     LGGZ9
        ldr     r11, [sp, #8]
        ldr     r1, [sp]
        mov     r8, #0x27
        mov     r3, r8
LGGZ14:
        cmp     r4, #1
        mov     r12, #0
        movlt   lr, r12
        blt     LGGZ17
        mov     lr, r12
        mov     r6, #1
        mov     r5, #8
LGGZ15:
        add     r7, sp, #0x30
        add     r0, r7, r5
        ldr     r0, [r0, #4]
        ldr     r7, [r7, +r6, lsl #3]
        tst     r0, r0
        bpl     LGGZ16
        rsbs    r7, r7, #0
        rsc     r0, r0, #0
LGGZ16:
        subs    r10, r7, lr
        sbcs    r9, r0, r12
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        movne   lr, r7
        movne   r12, r0
        add     r6, r6, #1
        cmp     r6, r4
        add     r5, r5, #8
        ble     LGGZ15
LGGZ17:
        subs    r0, lr, #1, 6
        sbcs    r5, r12, #0
        movlt   r0, #0
        movlt   r5, #0
        orrs    r5, r0, r5
        mov     r7, #1
        mov     r0, #8
        beq     LGGZ23
        mov     r5, r12, lsl #31
        orr     lr, r5, lr, lsr #1
        subs    r5, lr, #1, 6
        mov     r12, r12, asr #1
        sbcs    r6, r12, #0
        movlt   r5, #0
        movlt   r6, #0
        orrs    r6, r5, r6
        sub     r8, r8, #1
        beq     LGGZ19
LGGZ18:
        mov     r5, r12, lsl #31
        orr     lr, r5, lr, lsr #1
        subs    r5, lr, #1, 6
        mov     r12, r12, asr #1
        sbcs    r6, r12, #0
        movlt   r5, #0
        movlt   r6, #0
        orrs    r6, r5, r6
        sub     r8, r8, #1
        bne     LGGZ18
LGGZ19:
        cmp     r4, #1
        blt     LGGZ27
        sub     r12, r4, #1
        cmp     r12, #6
        sublt   r5, r3, r8
        movlt   r6, r5, asr #31
        blt     LGGZ21
        sub     r5, r3, r8
        sub     r10, r4, #6
        str     r4, [sp, #4]
        mov     r6, r5, asr #31
        add     r9, r1, #8
        str     r11, [sp, #8]
        str     r1, [sp]
        mov     r4, r0
LGGZ20:
        add     r1, sp, #0x30
        ldr     r0, [r1, +r7, lsl #3]
        add     r11, r1, r4
        ldr     r1, [r11, #4]
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        str     r0, [r9, #-4]
        ldr     r0, [r11, #8]
        ldr     r1, [r11, #0xC]
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        str     r0, [r9]
        ldr     r0, [r11, #0x10]
        ldr     r1, [r11, #0x14]
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        str     r0, [r9, #4]
        ldr     r0, [r11, #0x18]
        ldr     r1, [r11, #0x1C]
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        str     r0, [r9, #8]
        ldr     r0, [r11, #0x20]
        ldr     r1, [r11, #0x24]
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        add     r7, r7, #5
        str     r0, [r9, #0xC]
        cmp     r7, r10
        add     r4, r4, #0x28
        add     r9, r9, #0x14
        ble     LGGZ20
        ldr     r11, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r1, [sp]
LGGZ21:
        add     r9, r1, r7, lsl #2
        mov     r10, r7, lsl #3
LGGZ22:
        add     r1, sp, #0x30
        ldr     r0, [r1, +r7, lsl #3]
        add     r1, r1, r10
        ldr     r1, [r1, #4]
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        add     r7, r7, #1
        str     r0, [r9], #4
        cmp     r7, r4
        add     r10, r10, #8
        ble     LGGZ22
        b       LGGZ27
LGGZ23:
        cmp     r4, #1
        blt     LGGZ27
        sub     r3, r4, #1
        cmp     r3, #6
        blt     LGGZ25
        sub     r12, r4, #6
        add     r3, r1, #8
LGGZ24:
        add     lr, sp, #0x30
        add     r5, lr, r0
        ldr     r6, [r5, #8]
        ldr     r9, [lr, +r7, lsl #3]
        ldr     lr, [r5, #0x10]
        str     r6, [r3]
        ldr     r6, [r5, #0x18]
        ldr     r5, [r5, #0x20]
        add     r7, r7, #5
        str     r9, [r3, #-4]
        str     lr, [r3, #4]
        str     r6, [r3, #8]
        str     r5, [r3, #0xC]
        cmp     r7, r12
        add     r3, r3, #0x14
        add     r0, r0, #0x28
        ble     LGGZ24
LGGZ25:
        add     r1, r1, r7, lsl #2
LGGZ26:
        add     r0, sp, #0x30
        ldr     r0, [r0, +r7, lsl #3]
        add     r7, r7, #1
        cmp     r7, r4
        str     r0, [r1], #4
        ble     LGGZ26
LGGZ27:
        mov     r0, #0
        str     r8, [r11]
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LGGZ28:
        mvn     r0, #0x98
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
LGGZ29:
        mvn     r0, #0x98
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
        .long   LGGZ_pIQTns


        .data
        .align  4


LGGZ_pIQTns:
        .byte   0x17,0xAF,0x38,0xD4,0xB7,0x22,0xB9,0xAD,0x5F,0x14,0x26,0x91,0xCE,0xD1,0xF1,0x81
        .byte   0xCE,0xD1,0xF1,0x81,0x5F,0x14,0x26,0x91,0xB7,0x22,0xB9,0xAD,0x17,0xAF,0x38,0xD4
        .byte   0x00,0x00,0x00,0x00,0x9B,0x80,0x89,0x37,0xD4,0x0D,0x13,0x64,0x15,0x70,0xCA,0x7C
        .byte   0x15,0x70,0xCA,0x7C,0xD4,0x0D,0x13,0x64,0x9B,0x80,0x89,0x37,0x00,0x00,0x00,0x00
        .byte   0x53,0xC8,0x8B,0x80,0xB7,0xE5,0xE2,0x84,0x0E,0x4A,0x6B,0x8D,0x4E,0x92,0xDA,0x99
        .byte   0x56,0x57,0xC4,0xA9,0xF2,0xDE,0x9D,0xBC,0x45,0xD5,0xC2,0xD1,0x53,0xE5,0x7A,0xE8
        .byte   0x00,0x00,0x00,0x00,0xAC,0xD9,0x9C,0x1A,0x42,0xF2,0x0F,0x34,0x12,0x8C,0x3C,0x4B
        .byte   0xA1,0x5E,0x1F,0x5F,0xA1,0xEB,0xD9,0x6E,0x4D,0x38,0xBC,0x79,0x54,0x7E,0x4C,0x7F


