        .text
        .align  4
        .globl  _ippsNorm_Inf_64f


_ippsNorm_Inf_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r10, r1
        mov     r6, r2
        beq     LBCG3
        cmp     r6, #0
        beq     LBCG3
        cmp     r10, #0
        ble     LBCG4
        cmp     r10, #6
        mov     r9, #0
        movlt   r5, r9
        movlt   r4, r5
        blt     LBCG1
        mov     r5, r9
        mov     r4, r5
        sub     r8, r10, #6
        sub     r7, r0, #4
        str     r10, [sp, #4]
        str     r0, [sp]
LBCG0:
        ldr     r1, [r7, #8]
        ldr     r11, [r7, #4]
        mov     r2, r5
        bic     r10, r1, #2, 2
        mov     r1, r10
        mov     r0, r11
        mov     r3, r4
        bl      __gtdf2
        ldr     r1, [r7, #0x10]
        cmp     r0, #0
        movgt   r5, r11
        ldr     r11, [r7, #0xC]
        movgt   r4, r10
        bic     r10, r1, #2, 2
        mov     r3, r4
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        bl      __gtdf2
        cmp     r0, #0
        ldr     r1, [r7, #0x18]
        movgt   r5, r11
        ldr     r11, [r7, #0x14]
        movgt   r4, r10
        bic     r10, r1, #2, 2
        mov     r3, r4
        mov     r2, r5
        mov     r1, r10
        mov     r0, r11
        bl      __gtdf2
        cmp     r0, #0
        ldr     r1, [r7, #0x20]
        movgt   r5, r11
        ldr     r11, [r7, #0x1C]
        movgt   r4, r10
        bic     r10, r1, #2, 2
        mov     r3, r4
        mov     r2, r5
        mov     r0, r11
        mov     r1, r10
        bl      __gtdf2
        cmp     r0, #0
        ldr     r1, [r7, #0x28]
        movgt   r5, r11
        ldr     r11, [r7, #0x24]
        movgt   r4, r10
        bic     r10, r1, #2, 2
        mov     r2, r5
        mov     r3, r4
        mov     r0, r11
        mov     r1, r10
        bl      __gtdf2
        cmp     r0, #0
        add     r9, r9, #5
        movgt   r5, r11
        movgt   r4, r10
        cmp     r9, r8
        add     r7, r7, #0x28
        ble     LBCG0
        ldr     r10, [sp, #4]
        ldr     r0, [sp]
LBCG1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r11, r12, r0
LBCG2:
        ldr     r12, [r11, #8]
        ldr     r8, [r11, #4]
        add     r11, r11, #8
        bic     r7, r12, #2, 2
        mov     r2, r5
        mov     r3, r4
        mov     r0, r8
        mov     r1, r7
        bl      __gtdf2
        cmp     r0, #0
        add     r9, r9, #1
        movgt   r5, r8
        movgt   r4, r7
        cmp     r9, r10
        blt     LBCG2
        mov     r0, #0
        str     r5, [r6]
        str     r4, [r6, #4]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBCG3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBCG4:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


