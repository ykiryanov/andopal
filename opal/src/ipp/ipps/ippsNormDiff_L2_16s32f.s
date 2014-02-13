        .text
        .align  4
        .globl  _ippsNormDiff_L2_16s32f


_ippsNormDiff_L2_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r4, r3
        beq     LBCN3
        cmp     r8, #0
        beq     LBCN3
        cmp     r4, #0
        beq     LBCN3
        cmp     r2, #0
        ble     LBCN4
        cmp     r2, #5
        mov     r6, #0
        movlt   r0, r6
        movlt   r1, r0
        blt     LBCN1
        mov     r0, r6
        mov     r1, r0
        sub     r5, r2, #5
        mov     lr, r7
        mov     r12, r8
        str     r2, [sp, #8]
        str     r8, [sp, #4]
        str     r7, [sp]
LBCN0:
        ldrsh   r7, [lr]
        ldrsh   r2, [r12]
        ldrsh   r10, [r12, #2]
        ldrsh   r11, [lr, #2]
        ldrsh   r8, [r12, #6]
        sub     r7, r7, r2
        mul     r3, r7, r7
        ldrsh   r2, [r12, #4]
        ldrsh   r7, [lr, #4]
        ldrsh   r9, [lr, #6]
        sub     r11, r11, r10
        mul     r10, r11, r11
        adds    r0, r0, r3
        adc     r1, r1, #0
        sub     r7, r7, r2
        mul     r2, r7, r7
        sub     r9, r9, r8
        mul     r7, r9, r9
        adds    r10, r0, r10
        adc     r1, r1, #0
        adds    r2, r10, r2
        adc     r1, r1, #0
        adds    r0, r2, r7
        add     r6, r6, #4
        adc     r1, r1, #0
        cmp     r6, r5
        add     lr, lr, #8
        add     r12, r12, #8
        ble     LBCN0
        ldr     r2, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r7, [sp]
LBCN1:
        add     r7, r7, r6, lsl #1
        add     r8, r8, r6, lsl #1
LBCN2:
        ldrsh   lr, [r7], #2
        ldrsh   r12, [r8], #2
        add     r6, r6, #1
        sub     lr, lr, r12
        mul     lr, lr, lr
        adds    r0, r0, lr
        adc     r1, r1, #0
        cmp     r6, r2
        blt     LBCN2
        bl      __floatdidf
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCN3:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCN4:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


