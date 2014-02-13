        .text
        .align  4
        .globl  ownsTestTaps


ownsTestTaps:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r1, #0
        ble     LBVE3
        cmp     r1, #6
        mov     r5, #0
        movlt   r2, r5
        movlt   r3, r2
        blt     LBVE1
        mov     r2, r5
        mov     r3, r2
        sub     r4, r1, #6
        mov     lr, r0
LBVE0:
        ldrsh   r7, [lr]
        ldrsh   r6, [lr, #2]
        ldrsh   r12, [lr, #4]
        mov     r7, r7, lsl #15
        rsb     r7, r7, #0
        adds    r2, r2, r7
        mov     r6, r6, lsl #15
        adc     r7, r3, r7, asr #31
        rsb     r6, r6, #0
        adds    r2, r2, r6
        mov     r12, r12, lsl #15
        adc     r6, r7, r6, asr #31
        ldrsh   r7, [lr, #6]
        rsb     r3, r12, #0
        ldrsh   r12, [lr, #8]
        adds    r2, r2, r3
        adc     r3, r6, r3, asr #31
        mov     r7, r7, lsl #15
        rsb     r6, r7, #0
        adds    r2, r2, r6
        mov     r12, r12, lsl #15
        adc     r6, r3, r6, asr #31
        rsb     r12, r12, #0
        adds    r2, r2, r12
        add     r5, r5, #5
        add     lr, lr, #0xA
        adc     r3, r6, r12, asr #31
        cmp     r5, r4
        ble     LBVE0
LBVE1:
        add     r0, r0, r5, lsl #1
LBVE2:
        ldrsh   r12, [r0], #2
        add     r5, r5, #1
        mov     r12, r12, lsl #15
        rsb     r12, r12, #0
        adds    r2, r2, r12
        adc     r3, r3, r12, asr #31
        cmp     r5, r1
        blt     LBVE2
        mvn     r0, #2, 2
        subs    r0, r2, r0
        sbcs    r1, r3, #0
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        bne     LBVE4
        cmp     r2, #2, 2
        mvn     r0, #0
        sbcs    r3, r3, r0
        blt     LBVE4
LBVE3:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBVE4:
        mov     r0, #1
        ldmia   sp!, {r4 - r7, pc}


