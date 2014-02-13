        .text
        .align  4
        .globl  ownConvPartial_NR_16s


ownConvPartial_NR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r3, #0
        ble     LDJC5
        mov     r12, #2, 2
        sub     r12, r12, #2, 18
        mov     r5, #0
        mvn     r4, #2, 2
        mvn     lr, #0
LDJC0:
        cmp     r5, #0
        movlt   r10, #0
        movlt   r9, r5, lsl #1
        blt     LDJC3
        mov     r10, #0
        mov     r9, r5, lsl #1
        add     r7, r1, r9
        mov     r6, r0
        mov     r8, r10
        str     r1, [sp, #4]
        str     r0, [sp]
LDJC1:
        rsb     r1, r8, #0
        ldrsh   r0, [r6], #2
        mov     r1, r1, lsl #1
        ldrsh   r1, [r7, +r1]
        mul     r1, r0, r1
        mov     r0, r10, asr #31
        mov     r1, r1, lsl #1
        adds    r10, r10, r1
        adc     r0, r0, r1, asr #31
        subs    r1, r10, r4
        sbcs    r11, r0, #0
        movlt   r1, #0
        movlt   r11, #0
        orrs    r11, r1, r11
        mvnne   r10, #2, 2
        bne     LDJC2
        cmp     r10, #2, 2
        sbcs    r0, r0, lr
        movlt   r10, #2, 2
LDJC2:
        add     r8, r8, #1
        cmp     r8, r5
        ble     LDJC1
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDJC3:
        cmp     r12, r10
        mvnle   r6, #0
        addle   r6, r6, #2, 18
        ble     LDJC4
        add     r10, r10, #2, 18
        mov     r6, r10, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDJC4:
        add     r5, r5, #1
        cmp     r5, r3
        strh    r6, [r2, +r9]
        blt     LDJC0
LDJC5:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


