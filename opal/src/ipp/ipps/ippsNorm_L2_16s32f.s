        .text
        .align  4
        .globl  _ippsNorm_L2_16s32f


_ippsNorm_L2_16s32f:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        mov     r4, r2
        beq     LBBZ3
        cmp     r4, #0
        beq     LBBZ3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r1, #6
        mov     r5, #0
        movlt   r7, r5
        movlt   r2, r7
        blt     LBBZ1
        mov     r7, r5
        mov     r2, r7
        sub     lr, r1, #6
        mov     r12, r0
LBBZ0:
        ldrsh   r8, [r12]
        ldrsh   r6, [r12, #2]
        ldrsh   r3, [r12, #4]
        mul     r9, r8, r8
        ldrsh   r8, [r12, #6]
        mul     r6, r6, r6
        mul     r3, r3, r3
        mul     r8, r8, r8
        adds    r9, r7, r9
        ldrsh   r7, [r12, #8]
        adc     r2, r2, #0
        adds    r6, r9, r6
        adc     r2, r2, #0
        mul     r7, r7, r7
        adds    r3, r6, r3
        adc     r2, r2, #0
        adds    r8, r3, r8
        adc     r2, r2, #0
        adds    r7, r8, r7
        add     r5, r5, #5
        adc     r2, r2, #0
        cmp     r5, lr
        add     r12, r12, #0xA
        ble     LBBZ0
LBBZ1:
        add     r0, r0, r5, lsl #1
LBBZ2:
        ldrsh   r3, [r0], #2
        add     r5, r5, #1
        mul     r3, r3, r3
        adds    r7, r7, r3
        adc     r2, r2, #0
        cmp     r5, r1
        blt     LBBZ2
        mov     r0, r7
        mov     r1, r2
        bl      __floatdidf
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LBBZ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


