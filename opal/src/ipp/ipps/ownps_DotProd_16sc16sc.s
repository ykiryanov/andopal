        .text
        .align  4
        .globl  ownps_DotProd_16sc16sc


ownps_DotProd_16sc16sc:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r2, #0
        mov     r6, #0
        ble     LCFZ2
        mov     r4, r6
        mov     lr, r4
        add     r12, r1, #2
        add     r1, r0, #2
        mov     r5, lr
LCFZ0:
        ldrsh   r7, [r12, #-2]
        ldrsh   r9, [r1, #-2]
        ldrsh   r0, [r1], #4
        ldrsh   r10, [r12], #4
        mul     r8, r9, r7
        mul     r7, r0, r7
        mul     r0, r10, r0
        mul     r10, r9, r10
        adds    r4, r4, r8
        adc     r8, lr, r8, asr #31
        subs    r4, r4, r0
        sbc     lr, r8, r0, asr #31
        adds    r5, r5, r10
        adc     r10, r6, r10, asr #31
        adds    r5, r5, r7
        adc     r6, r10, r7, asr #31
        subs    r2, r2, #1
        bne     LCFZ0
LCFZ1:
        str     r4, [r3]
        str     lr, [r3, #4]
        str     r5, [r3, #8]
        str     r6, [r3, #0xC]
        ldmia   sp!, {r4 - r10, pc}
LCFZ2:
        mov     r4, r6
        mov     lr, r4
        mov     r5, lr
        b       LCFZ1


