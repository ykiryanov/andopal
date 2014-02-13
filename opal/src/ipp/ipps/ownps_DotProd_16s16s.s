        .text
        .align  4
        .globl  ownps_DotProd_16s16s


ownps_DotProd_16s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r2, #0
        mov     r8, r0
        mov     r7, #0
        movle   r0, r7
        movle   r12, r0
        ble     LCGB3
        cmp     r2, #6
        movlt   r0, r7
        movlt   r12, r0
        blt     LCGB1
        mov     r0, r7
        mov     r12, r0
        sub     r6, r2, #6
        mov     r5, r1
        mov     r4, r8
        str     r1, [sp, #4]
        str     r8, [sp]
LCGB0:
        ldrsh   r1, [r5]
        ldrsh   lr, [r4]
        ldrsh   r8, [r4, #2]
        ldrsh   r10, [r5, #4]
        ldrsh   r11, [r4, #4]
        mul     r1, lr, r1
        ldrsh   lr, [r5, #2]
        mul     r10, r11, r10
        ldrsh   r9, [r4, #6]
        mul     lr, r8, lr
        ldrsh   r8, [r5, #6]
        ldrsh   r11, [r5, #8]
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        mul     r8, r9, r8
        ldrsh   r9, [r4, #8]
        adds    r0, r0, lr
        adc     lr, r1, lr, asr #31
        mul     r11, r9, r11
        adds    r0, r0, r10
        adc     r10, lr, r10, asr #31
        adds    r0, r0, r8
        adc     r8, r10, r8, asr #31
        adds    r0, r0, r11
        add     r7, r7, #5
        add     r5, r5, #0xA
        add     r4, r4, #0xA
        adc     r12, r8, r11, asr #31
        cmp     r7, r6
        ble     LCGB0
        ldr     r1, [sp, #4]
        ldr     r8, [sp]
LCGB1:
        add     r1, r1, r7, lsl #1
        add     r8, r8, r7, lsl #1
LCGB2:
        ldrsh   r4, [r1], #2
        ldrsh   lr, [r8], #2
        add     r7, r7, #1
        mul     r4, lr, r4
        adds    r0, r0, r4
        adc     r12, r12, r4, asr #31
        cmp     r7, r2
        blt     LCGB2
LCGB3:
        str     r0, [r3]
        str     r12, [r3, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


