        .text
        .align  4
        .globl  _ipps_ibMpyBySqrt2_64s


_ipps_ibMpyBySqrt2_64s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        cmp     r1, #0
        ble     LBZZ3
        ldr     r2, [pc, #0x214]
        cmp     r1, #5
        mov     r5, #0
        blt     LBZZ1
        sub     r3, r1, #5
        sub     r4, r0, #4
        str     r3, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBZZ0:
        ldr     r3, [r4, #0xC]
        ldr     r2, [r4, #4]
        ldr     r0, [r4, #0x10]
        ldr     r12, [pc, #0x1E4]
        ldr     r1, [r4, #8]
        str     r0, [sp, #0xC]
        ldr     r0, [r4, #0x14]
        umull   r12, r2, r12, r2
        add     r5, r5, #4
        str     r12, [sp, #0x10]
        ldr     r12, [pc, #0x1C8]
        umull   r12, lr, r12, r1
        str     lr, [sp, #0x14]
        ldr     lr, [pc, #0x1BC]
        mov     r1, r1, asr #31
        umull   r3, r6, lr, r3
        ldr     lr, [sp, #0xC]
        str     r3, [sp, #0x18]
        ldr     r3, [pc, #0x1A8]
        umull   r3, lr, r3, lr
        str     lr, [sp, #0x1C]
        ldr     lr, [pc, #0x19C]
        umull   r0, r7, lr, r0
        str     r0, [sp, #0x20]
        ldr     r0, [pc, #0x190]
        ldr     r9, [r4, #0x20]
        ldr     lr, [r4, #0x18]
        mul     r1, r1, r0
        ldr     r8, [r4, #0x1C]
        str     r1, [sp, #0x24]
        ldr     r1, [pc, #0x178]
        umull   r1, r10, r1, lr
        str     r10, [sp, #0x28]
        ldr     r10, [pc, #0x16C]
        mov     lr, lr, asr #31
        umull   r10, r11, r10, r9
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x10]
        mov     r9, r9, asr #31
        str     r10, [sp, #0x2C]
        ldr     r10, [pc, #0x150]
        umull   r10, r8, r10, r8
        str     r10, [sp, #0x34]
        mov     r10, r2, lsl #2
        orr     r11, r10, r11, lsr #30
        adds    r10, r11, r12, lsl #2
        ldr     r11, [sp, #0x14]
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x24]
        mov     r12, r12, lsr #30
        add     r11, r10, r11
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x24]
        ldr     r10, [sp, #0xC]
        orr     r11, r12, r11, lsl #2
        adc     r12, r11, r2, asr #30
        ldr     r11, [sp, #0x18]
        mov     r2, r6, lsl #2
        mov     r10, r10, asr #31
        mul     r10, r10, r0
        orr     r11, r2, r11, lsr #30
        adds    r2, r11, r3, lsl #2
        ldr     r11, [sp, #0x1C]
        add     r10, r10, r11
        mov     r11, r3, lsr #30
        mul     r3, lr, r0
        mul     r0, r9, r0
        orr     r10, r11, r10, lsl #2
        adc     r6, r10, r6, asr #30
        ldr     r10, [sp, #0x20]
        mov     lr, r7, lsl #2
        ldr     r9, [sp, #0x2C]
        orr     r10, lr, r10, lsr #30
        adds    lr, r10, r1, lsl #2
        ldr     r10, [sp, #0x28]
        mov     r1, r1, lsr #30
        add     r3, r3, r10
        orr     r3, r1, r3, lsl #2
        adc     r7, r3, r7, asr #30
        ldr     r3, [sp, #0x34]
        mov     r1, r8, lsl #2
        orr     r1, r1, r3, lsr #30
        ldr     r3, [sp, #0x30]
        adds    r1, r1, r9, lsl #2
        add     r0, r0, r3
        mov     r3, r9, lsr #30
        orr     r0, r3, r0, lsl #2
        adc     r8, r0, r8, asr #30
        ldr     r0, [sp, #0x10]
        str     r12, [r4, #8]
        str     r2, [r4, #0xC]
        str     r6, [r4, #0x10]
        str     r0, [r4, #4]
        str     lr, [r4, #0x14]
        str     r7, [r4, #0x18]
        str     r1, [r4, #0x1C]
        str     r8, [r4, #0x20]!
        ldr     r0, [sp, #8]
        cmp     r5, r0
        ble     LBZZ0
        ldr     r2, [pc, #0x60]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBZZ1:
        mov     r3, r5, lsl #3
        sub     r3, r3, #4
        add     r0, r3, r0
LBZZ2:
        ldr     r4, [r0, #8]
        ldr     r3, [r0, #4]
        umull   r12, lr, r2, r4
        mov     r4, r4, asr #31
        mul     r6, r4, r2
        umull   r4, r3, r2, r3
        mov     r7, r3, lsl #2
        add     r5, r5, #1
        add     lr, r6, lr
        mov     r6, r12, lsr #30
        orr     r4, r7, r4, lsr #30
        adds    r12, r4, r12, lsl #2
        orr     lr, r6, lr, lsl #2
        adc     r3, lr, r3, asr #30
        str     r12, [r0, #4]
        str     r3, [r0, #8]!
        cmp     r5, r1
        blt     LBZZ2
LBZZ3:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   0x2d413ccd


