        .text
        .align  4
        .globl  DotProd_16s16sc64sc


DotProd_16s16sc64sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r2, #0
        mov     r9, #0
        ble     LCFY5
        cmp     r2, #5
        blt     LCFY4
        mov     lr, r9
        mov     r6, lr
        mov     r11, r6
        sub     r5, r2, #5
        mov     r12, r0
        mov     r4, r11
        sub     r7, r1, #0xE
        str     r12, [sp, #0xC]
        str     r5, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LCFY0:
        ldr     r2, [sp, #0xC]
        add     r12, r9, #1
        add     r8, r9, #2
        ldrsh   r3, [r2], #8
        str     r2, [sp, #0xC]
        ldrsh   r2, [r7, #0xE]
        ldrsh   r5, [r7, #0x10]!
        mul     r2, r3, r2
        mul     r5, r3, r5
        mov     r3, r12, lsl #1
        ldrsh   r3, [r0, +r3]
        mov     r12, r12, lsl #2
        ldrsh   r10, [r1, +r12]
        adds    lr, lr, r2
        adc     r6, r6, r2, asr #31
        adds    r2, r11, r5
        mul     r10, r3, r10
        add     r12, r1, r12
        adc     r5, r4, r5, asr #31
        ldrsh   r4, [r12, #2]
        mov     r12, r8, lsl #1
        ldrsh   r12, [r0, +r12]
        mov     r8, r8, lsl #2
        mul     r3, r3, r4
        ldrsh   r4, [r1, +r8]
        adds    lr, lr, r10
        add     r8, r1, r8
        mul     r4, r12, r4
        ldrsh   r8, [r8, #2]
        adc     r10, r6, r10, asr #31
        adds    r2, r2, r3
        mul     r12, r12, r8
        add     r6, r9, #3
        adc     r5, r5, r3, asr #31
        mov     r8, r6, lsl #2
        adds    lr, lr, r4
        mov     r6, r6, lsl #1
        ldrsh   r3, [r0, +r6]
        ldrsh   r6, [r1, +r8]
        adc     r4, r10, r4, asr #31
        adds    r2, r2, r12
        mul     r6, r3, r6
        adc     r12, r5, r12, asr #31
        add     r8, r1, r8
        ldrsh   r5, [r8, #2]
        add     r9, r9, #4
        adds    lr, lr, r6
        adc     r6, r4, r6, asr #31
        mul     r5, r3, r5
        adds    r11, r2, r5
        ldr     r2, [sp, #8]
        adc     r4, r12, r5, asr #31
        cmp     r9, r2
        ble     LCFY0
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LCFY1:
        mov     r12, r9, lsl #2
        sub     r12, r12, #2
        add     r1, r12, r1
        add     r0, r0, r9, lsl #1
LCFY2:
        ldrsh   r12, [r1, #2]
        ldrsh   r7, [r0], #2
        ldrsh   r5, [r1, #4]!
        mul     r12, r7, r12
        mul     r5, r7, r5
        add     r9, r9, #1
        adds    lr, lr, r12
        adc     r6, r6, r12, asr #31
        adds    r11, r11, r5
        adc     r4, r4, r5, asr #31
        cmp     r9, r2
        blt     LCFY2
LCFY3:
        str     lr, [r3]
        str     r6, [r3, #4]
        str     r11, [r3, #8]
        str     r4, [r3, #0xC]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFY4:
        mov     lr, r9
        mov     r6, lr
        mov     r11, r6
        mov     r4, r11
        b       LCFY1
LCFY5:
        mov     lr, r9
        mov     r6, lr
        mov     r11, r6
        mov     r4, r11
        b       LCFY3


