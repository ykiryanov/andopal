        .text
        .align  4
        .globl  _ippsNormDiff_L2_16s32s_Sfs


_ippsNormDiff_L2_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r4, [sp, #0x34]
        mov     r8, r0
        cmp     r8, #0
        mov     r9, r1
        mov     r5, r3
        beq     LBCM6
        cmp     r9, #0
        beq     LBCM6
        cmp     r5, #0
        beq     LBCM6
        cmp     r2, #0
        ble     LBCM7
        cmp     r2, #5
        mov     r7, #0
        movlt   r0, r7
        movlt   r1, r0
        blt     LBCM1
        mov     r0, r7
        mov     r1, r0
        sub     r6, r2, #5
        mov     lr, r8
        mov     r12, r9
        str     r5, [sp, #0xC]
        str     r2, [sp, #8]
        str     r9, [sp, #4]
        str     r8, [sp]
LBCM0:
        ldrsh   r3, [lr]
        ldrsh   r2, [r12]
        ldrsh   r9, [r12, #2]
        ldrsh   r10, [lr, #2]
        ldrsh   r5, [r12, #6]
        sub     r3, r3, r2
        mul     r11, r3, r3
        ldrsh   r2, [r12, #4]
        ldrsh   r3, [lr, #4]
        ldrsh   r8, [lr, #6]
        sub     r10, r10, r9
        mul     r9, r10, r10
        adds    r0, r0, r11
        adc     r1, r1, #0
        sub     r3, r3, r2
        mul     r2, r3, r3
        sub     r8, r8, r5
        mul     r3, r8, r8
        adds    r9, r0, r9
        adc     r1, r1, #0
        adds    r2, r9, r2
        adc     r1, r1, #0
        adds    r0, r2, r3
        add     r7, r7, #4
        adc     r1, r1, #0
        cmp     r7, r6
        add     lr, lr, #8
        add     r12, r12, #8
        ble     LBCM0
        ldr     r5, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r8, [sp]
LBCM1:
        add     r8, r8, r7, lsl #1
        add     r9, r9, r7, lsl #1
LBCM2:
        ldrsh   lr, [r8], #2
        ldrsh   r12, [r9], #2
        add     r7, r7, #1
        sub     lr, lr, r12
        mul     lr, lr, lr
        adds    r0, r0, lr
        adc     r1, r1, #0
        cmp     r7, r2
        blt     LBCM2
        bl      __floatdidf
        bl      sqrt
        cmp     r4, #0
        mov     r7, r0
        mov     r6, r1
        mov     r12, #1
        ble     LBCM5
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __divdf3
        mov     r7, r0
        mov     r6, r1
LBCM3:
        mov     r0, r7
        mov     lr, #0
        mvn     r12, #0xE2, 12
        sub     r2, lr, #1, 10
        bic     r3, r12, #0xB, 4
        mov     r1, r6
        bl      __gtdf2
        cmp     r0, #0
        mvngt   r0, #2, 2
        bgt     LBCM4
        mov     r0, r7
        mov     r1, r6
        bl      __fixdfsi
LBCM4:
        str     r0, [r5]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBCM5:
        cmp     r4, #0
        bge     LBCM3
        rsb     r4, r4, #0
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        b       LBCM3
LBCM6:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBCM7:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


