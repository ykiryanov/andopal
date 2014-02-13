        .text
        .align  4
        .globl  _ippsSumSquare_NS_16s32s_Sfs


_ippsSumSquare_NS_16s32s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r2, #0
        mov     r4, #0
        ble     LDRX6
        cmp     r1, #0
        movle   r12, r4
        ble     LDRX4
        cmp     r1, #6
        blt     LDRX5
        mov     r12, r4
        mov     lr, r12
        mov     r5, lr
        sub     r7, r1, #6
        mov     r6, r0
        str     r4, [sp]
LDRX0:
        ldrsh   r4, [r6]
        ldrsh   r8, [r6, #2]
        ldrsh   r9, [r6, #4]
        mov     r4, r4, asr r2
        mul     r4, r4, r4
        ldrsh   r10, [r6, #6]
        ldrsh   r11, [r6, #8]
        mov     r8, r8, asr r2
        mul     r8, r8, r8
        adds    r12, r12, r4
        adc     r4, lr, r4, asr #31
        mov     r9, r9, asr r2
        mul     lr, r9, r9
        adds    r12, r12, r8
        adc     r8, r4, r8, asr #31
        mov     r10, r10, asr r2
        mul     r4, r10, r10
        adds    r12, r12, lr
        adc     lr, r8, lr, asr #31
        mov     r11, r11, asr r2
        mul     r8, r11, r11
        adds    r12, r12, r4
        adc     r4, lr, r4, asr #31
        add     r5, r5, #5
        add     r6, r6, #0xA
        adds    r12, r12, r8
        adc     lr, r4, r8, asr #31
        cmp     r5, r7
        ble     LDRX0
        ldr     r4, [sp]
LDRX1:
        add     r0, r0, r5, lsl #1
LDRX2:
        ldrsh   r6, [r0], #2
        add     r5, r5, #1
        mov     r6, r6, asr r2
        mul     r6, r6, r6
        adds    r12, r12, r6
        adc     lr, lr, r6, asr #31
        cmp     r5, r1
        blt     LDRX2
LDRX3:
        mvn     r0, #2, 2
        subs    r1, r12, r0
        sbcs    lr, lr, #0
        movlt   r1, #0
        movlt   lr, #0
        orrs    lr, r1, lr
        movne   r12, r0
        movne   r4, #1
LDRX4:
        cmp     r4, #0
        str     r12, [r3]
        bne     LDRX11
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LDRX5:
        mov     r12, r4
        mov     lr, r12
        mov     r5, lr
        b       LDRX1
LDRX6:
        cmp     r1, #0
        movle   r12, r4
        ble     LDRX4
        cmp     r1, #6
        blt     LDRX10
        mov     r12, r4
        mov     lr, r12
        mov     r7, lr
        sub     r9, r1, #6
        mov     r8, r0
LDRX7:
        ldrsh   r2, [r8]
        ldrsh   r5, [r8, #2]
        ldrsh   r6, [r8, #4]
        mul     r2, r2, r2
        ldrsh   r10, [r8, #6]
        mul     r5, r5, r5
        mul     r6, r6, r6
        mul     r10, r10, r10
        adds    r12, r12, r2
        ldrsh   r11, [r8, #8]
        adc     r2, lr, r2, asr #31
        adds    r12, r12, r5
        adc     r5, r2, r5, asr #31
        mul     r11, r11, r11
        adds    r12, r12, r6
        adc     r6, r5, r6, asr #31
        adds    r12, r12, r10
        adc     r10, r6, r10, asr #31
        adds    r12, r12, r11
        add     r7, r7, #5
        adc     lr, r10, r11, asr #31
        cmp     r7, r9
        add     r8, r8, #0xA
        ble     LDRX7
LDRX8:
        add     r0, r0, r7, lsl #1
LDRX9:
        ldrsh   r2, [r0], #2
        add     r7, r7, #1
        mul     r2, r2, r2
        adds    r12, r12, r2
        adc     lr, lr, r2, asr #31
        cmp     r7, r1
        blt     LDRX9
        b       LDRX3
LDRX10:
        mov     r12, r4
        mov     lr, r12
        mov     r7, lr
        b       LDRX8
LDRX11:
        mov     r0, #0xC
        ldmia   sp!, {r1, r4 - r11, pc}


