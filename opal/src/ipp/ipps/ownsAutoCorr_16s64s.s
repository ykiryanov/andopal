        .text
        .align  4
        .globl  ownsAutoCorr_16s64s


ownsAutoCorr_16s64s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        bic     lr, r3, #3
        sub     r4, r1, #3
        cmp     lr, #0
        sub     r1, r1, lr
        mov     r5, r0
        ble     LCYP3
        mov     r12, #0
        str     r1, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #0x14]
        str     r3, [sp, #0x30]
        str     r0, [sp, #0x38]
LCYP0:
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x38]
        cmp     r0, #0
        ble     LCYP11
        mov     r1, #0
        mov     r0, r1
        str     r0, [sp, #0x3C]
        mov     r6, r0
        str     r6, [sp]
        str     r6, [sp, #4]
        str     r6, [sp, #8]
        add     r4, r5, #4
        str     r6, [sp, #0xC]
        mov     r7, r4
        str     r4, [sp, #0x20]
        ldr     r4, [sp, #0x3C]
        str     r6, [sp, #0x10]
        add     lr, r5, #2
        add     r10, r5, #6
        mov     r9, r6
        mov     r8, lr
        str     lr, [sp, #0x1C]
        str     r12, [sp, #0x24]
        str     r5, [sp, #0x18]
        str     r2, [sp, #0x34]
LCYP1:
        ldr     r2, [sp, #0x18]
        ldrsh   lr, [r3], #2
        ldrsh   r5, [r7], #2
        ldrsh   r12, [r2, +r9]
        ldrsh   r11, [r10], #2
        ldrsh   r2, [r8], #2
        mul     r5, lr, r5
        mul     r12, lr, r12
        str     r11, [sp, #0x40]
        mul     r2, lr, r2
        ldr     r11, [sp, #0x40]
        add     r6, r6, #1
        mul     lr, lr, r11
        ldr     r11, [sp, #0xC]
        add     r9, r9, #2
        adds    r11, r11, r12
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        adc     r11, r11, r12, asr #31
        ldr     r12, [sp, #4]
        str     r11, [sp, #0x10]
        adds    r12, r12, r2
        str     r12, [sp, #4]
        ldr     r12, [sp, #8]
        adc     r12, r12, r2, asr #31
        ldr     r2, [sp]
        adds    r0, r0, r5
        str     r12, [sp, #8]
        adc     r2, r2, r5, asr #31
        str     r2, [sp]
        ldr     r2, [sp, #0x14]
        adds    r1, r1, lr
        adc     r4, r4, lr, asr #31
        cmp     r6, r2
        blt     LCYP1
        str     r4, [sp, #0x3C]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r5, [sp, #0x18]
        ldr     r2, [sp, #0x34]
LCYP2:
        ldrsh   r9, [r3]
        mov     r6, r6, lsl #1
        ldrsh   r10, [r5, +r6]
        ldrsh   r8, [lr, +r6]
        ldrsh   r11, [r3, #2]
        ldrsh   r7, [r4, +r6]
        mul     r9, r9, r10
        ldrsh   r10, [r3, #4]
        mul     r8, r11, r8
        add     r11, r2, r12, lsl #3
        mul     r7, r10, r7
        ldr     r10, [sp, #0xC]
        str     r11, [sp, #0x40]
        add     r5, r5, #8
        adds    r10, r10, r9
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        adc     r9, r10, r9, asr #31
        adds    r11, r8, r7
        mov     r7, r7, asr #31
        adc     r8, r7, r8, asr #31
        ldr     r7, [sp, #0xC]
        str     r9, [sp, #0x10]
        add     r9, r12, #1
        add     r10, r12, #2
        adds    r11, r7, r11
        str     r11, [r2, +r12, lsl #3]
        ldr     r7, [sp, #0x10]
        add     r11, r2, r9, lsl #3
        adc     r8, r7, r8
        ldr     r7, [sp, #0x40]
        str     r8, [r7, #4]
        ldrsh   lr, [lr, +r6]
        str     lr, [sp, #0x40]
        ldrsh   r7, [r3, #2]
        ldrsh   r8, [r4, +r6]
        ldrsh   lr, [r3]
        str     r11, [sp, #0x1C]
        mul     r7, r7, r8
        ldr     r11, [sp, #0x40]
        ldr     r8, [sp, #0x14]
        mul     r11, lr, r11
        add     lr, r2, r10, lsl #3
        str     lr, [sp, #0x10]
        sub     r8, r8, #4
        str     r8, [sp, #0x14]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #4]
        ldr     r8, [sp, #0x40]
        add     lr, r12, #3
        add     r12, r12, #4
        adds    r11, r11, r8
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #8]
        adc     r8, r11, r8, asr #31
        ldr     r11, [sp, #0xC]
        adds    r11, r11, r7
        str     r11, [r2, +r9, lsl #3]
        adc     r7, r8, r7, asr #31
        ldr     r8, [sp, #0x1C]
        str     r7, [r8, #4]
        ldrsh   r6, [r4, +r6]
        ldrsh   r4, [r3]
        add     r3, r2, lr, lsl #3
        mul     r6, r4, r6
        adds    r0, r0, r6
        str     r0, [r2, +r10, lsl #3]
        ldr     r4, [sp]
        adc     r6, r4, r6, asr #31
        ldr     r4, [sp, #0x10]
        str     r6, [r4, #4]
        str     r1, [r2, +lr, lsl #3]
        ldr     r0, [sp, #0x3C]
        str     r0, [r3, #4]
        ldr     r0, [sp, #0x2C]
        cmp     r12, r0
        blt     LCYP0
        ldr     r1, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        ldr     r0, [sp, #0x38]
LCYP3:
        cmp     lr, r3
        bge     LCYP9
        mov     r12, lr, lsl #3
        sub     r12, r12, #4
        add     r12, r12, r2
        sub     r3, r3, lr
LCYP4:
        cmp     r1, #0
        mov     r8, #0
        mov     r7, r0
        movle   r2, r8
        movle   r9, r2
        ble     LCYP8
        cmp     r1, #6
        blt     LCYP10
        mov     r2, r8
        mov     r11, #6
        str     r11, [sp, #0x2C]
        mov     r9, r2
        sub     r10, r1, #6
        mov     r11, #8
        str     r11, [sp, #0x20]
        mov     lr, r9
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x34]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x2C]
        mov     r6, #2
        mov     r4, #4
        str     r3, [sp, #0x30]
        str     r12, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x38]
LCYP5:
        ldrsh   r0, [r5, +r8]
        ldrsh   r1, [r7]
        ldrsh   r3, [r5, +r6]
        ldrsh   r12, [r7, #2]
        ldrsh   r11, [r5, +r4]
        mul     r1, r1, r0
        ldrsh   r0, [r7, #4]
        mul     r3, r12, r3
        add     lr, lr, #5
        mul     r12, r0, r11
        adds    r0, r2, r1
        add     r8, r8, #0xA
        str     r3, [sp, #0x40]
        ldrsh   r3, [r5, +r10]
        add     r6, r6, #0xA
        add     r4, r4, #0xA
        add     r10, r10, #0xA
        str     r3, [sp, #0x1C]
        ldrsh   r2, [r7, #8]
        ldrsh   r3, [r7, #6]
        ldrsh   r11, [r5, +r9]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x1C]
        add     r7, r7, #0xA
        add     r9, r9, #0xA
        mul     r3, r3, r2
        ldr     r2, [sp, #0x3C]
        adc     r2, r2, r1, asr #31
        ldr     r1, [sp, #0x14]
        mul     r1, r1, r11
        ldr     r11, [sp, #0x40]
        adds    r0, r0, r11
        adc     r11, r2, r11, asr #31
        adds    r0, r0, r12
        adc     r12, r11, r12, asr #31
        adds    r0, r0, r3
        adc     r3, r12, r3, asr #31
        adds    r2, r0, r1
        ldr     r0, [sp, #0x34]
        adc     r1, r3, r1, asr #31
        str     r1, [sp, #0x3C]
        cmp     lr, r0
        ble     LCYP5
        ldr     r9, [sp, #0x3C]
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x38]
LCYP6:
        mov     r4, lr, lsl #1
LCYP7:
        ldrsh   r8, [r5, +r4]
        ldrsh   r6, [r7], #2
        add     r4, r4, #2
        add     lr, lr, #1
        mul     r8, r6, r8
        adds    r2, r2, r8
        adc     r9, r9, r8, asr #31
        cmp     lr, r1
        blt     LCYP7
LCYP8:
        str     r2, [r12, #4]
        str     r9, [r12, #8]!
        subs    r3, r3, #1
        sub     r1, r1, #1
        add     r5, r5, #2
        bne     LCYP4
LCYP9:
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LCYP10:
        mov     r2, r8
        mov     r9, r2
        mov     lr, r9
        b       LCYP6
LCYP11:
        mov     r1, #0
        mov     r0, r1
        str     r0, [sp, #0x3C]
        mov     r6, r0
        str     r6, [sp]
        str     r6, [sp, #4]
        str     r6, [sp, #8]
        str     r6, [sp, #0xC]
        str     r6, [sp, #0x10]
        add     lr, r5, #2
        add     r4, r5, #4
        b       LCYP2


