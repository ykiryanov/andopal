        .text
        .align  4
        .globl  ownsTestTapsCplx


ownsTestTapsCplx:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r1, #0
        ble     LBVD3
        cmp     r1, #4
        mov     r7, #0
        blt     LBVD5
        mov     r3, r7
        mov     lr, r3
        mov     r2, lr
        mov     r12, r2
        sub     r6, r1, #4
        sub     r5, r0, #2
        str     r0, [sp]
LBVD0:
        ldrsh   r0, [r5, #4]
        ldrsh   r8, [r5, #2]
        ldrsh   r11, [r5, #6]
        mov     r4, r0, lsl #15
        ldrsh   r9, [r5, #0xC]
        ldrsh   r10, [r5, #0xA]
        sub     r4, r4, r8, lsl #15
        add     r0, r8, r0
        ldrsh   r8, [r5, #8]
        adds    r2, r2, r4
        mov     r0, r0, lsl #15
        adc     r4, r12, r4, asr #31
        rsb     r0, r0, #0
        adds    r12, r3, r0
        mov     r3, r8, lsl #15
        adc     r0, lr, r0, asr #31
        add     r8, r11, r8
        sub     r3, r3, r11, lsl #15
        adds    r2, r2, r3
        mov     r8, r8, lsl #15
        adc     r4, r4, r3, asr #31
        rsb     r8, r8, #0
        adds    r3, r12, r8
        mov     lr, r9, lsl #15
        adc     r0, r0, r8, asr #31
        add     r9, r10, r9
        sub     r12, lr, r10, lsl #15
        adds    r2, r2, r12
        mov     r9, r9, lsl #15
        rsb     lr, r9, #0
        adc     r12, r4, r12, asr #31
        adds    r3, r3, lr
        add     r7, r7, #3
        add     r5, r5, #0xC
        adc     lr, r0, lr, asr #31
        cmp     r7, r6
        ble     LBVD0
        ldr     r0, [sp]
LBVD1:
        mov     r4, r7, lsl #2
        add     r4, r4, #2
        add     r0, r4, r0
LBVD2:
        ldrsh   r4, [r0]
        ldrsh   r5, [r0, #-2]
        add     r0, r0, #4
        mov     r6, r4, lsl #15
        add     r7, r7, #1
        add     r4, r5, r4
        sub     r6, r6, r5, lsl #15
        adds    r2, r2, r6
        mov     r4, r4, lsl #15
        rsb     r4, r4, #0
        adc     r12, r12, r6, asr #31
        adds    r3, r3, r4
        adc     lr, lr, r4, asr #31
        cmp     r7, r1
        blt     LBVD2
        mvn     r0, #2, 2
        subs    r4, r2, r0
        sbcs    r1, r12, #0
        movlt   r4, #0
        movlt   r1, #0
        orrs    r1, r4, r1
        bne     LBVD4
        cmp     r2, #2, 2
        mvn     r1, #0
        sbcs    r12, r12, r1
        blt     LBVD4
        subs    r0, r3, r0
        sbcs    r2, lr, #0
        movlt   r0, #0
        movlt   r2, #0
        orrs    r2, r0, r2
        bne     LBVD4
        cmp     r3, #2, 2
        sbcs    lr, lr, r1
        blt     LBVD4
LBVD3:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBVD4:
        mov     r0, #1
        ldmia   sp!, {r1, r4 - r11, pc}
LBVD5:
        mov     r3, r7
        mov     lr, r3
        mov     r2, lr
        mov     r12, r2
        b       LBVD1


