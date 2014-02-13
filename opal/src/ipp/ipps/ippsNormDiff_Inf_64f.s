        .text
        .align  4
        .globl  _ippsNormDiff_Inf_64f


_ippsNormDiff_Inf_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        mov     r10, r2
        beq     LBCU3
        cmp     r1, #0
        beq     LBCU3
        cmp     r3, #0
        beq     LBCU3
        cmp     r10, #0
        ble     LBCU4
        cmp     r10, #6
        mov     r9, #0
        movlt   r5, r9
        movlt   r4, r5
        blt     LBCU1
        mov     r5, r9
        mov     r4, r5
        sub     r8, r10, #6
        sub     r7, r1, #4
        sub     r6, r0, #4
        str     r3, [sp]
        str     r10, [sp, #0xC]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
LBCU0:
        ldr     r2, [r7, #4]
        ldr     r0, [r6, #4]
        ldr     r3, [r7, #8]
        ldr     r1, [r6, #8]
        bl      __subdf3
        bic     r11, r1, #2, 2
        mov     r10, r0
        mov     r3, r4
        mov     r2, r5
        mov     r1, r11
        bl      __gtdf2
        ldr     r1, [r6, #0x10]
        ldr     r2, [r7, #0xC]
        ldr     r3, [r7, #0x10]
        cmp     r0, #0
        ldr     r0, [r6, #0xC]
        movgt   r4, r11
        movgt   r5, r10
        bl      __subdf3
        mov     r10, r0
        bic     r11, r1, #2, 2
        mov     r1, r11
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        ldr     r1, [r6, #0x18]
        ldr     r12, [r6, #0x14]
        ldr     r2, [r7, #0x14]
        ldr     r3, [r7, #0x18]
        cmp     r0, #0
        movgt   r5, r10
        movgt   r4, r11
        mov     r0, r12
        bl      __subdf3
        mov     r10, r0
        bic     r11, r1, #2, 2
        mov     r2, r5
        mov     r3, r4
        mov     r1, r11
        bl      __gtdf2
        ldr     r1, [r6, #0x1C]
        ldr     r2, [r7, #0x1C]
        ldr     r3, [r7, #0x20]
        ldr     r12, [r6, #0x20]
        cmp     r0, #0
        mov     r0, r1
        mov     r1, r12
        movgt   r5, r10
        movgt   r4, r11
        bl      __subdf3
        mov     r10, r0
        bic     r11, r1, #2, 2
        mov     r2, r5
        mov     r3, r4
        mov     r1, r11
        bl      __gtdf2
        ldr     r1, [r6, #0x24]
        ldr     r12, [r6, #0x28]!
        ldr     r2, [r7, #0x24]
        ldr     r3, [r7, #0x28]!
        cmp     r0, #0
        mov     r0, r1
        mov     r1, r12
        movgt   r5, r10
        movgt   r4, r11
        bl      __subdf3
        mov     r10, r0
        bic     r11, r1, #2, 2
        mov     r2, r5
        mov     r3, r4
        mov     r1, r11
        bl      __gtdf2
        cmp     r0, #0
        add     r9, r9, #5
        movgt   r5, r10
        movgt   r4, r11
        cmp     r9, r8
        ble     LBCU0
        ldr     r3, [sp]
        ldr     r10, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
LBCU1:
        mov     r12, r9, lsl #3
        sub     r12, r12, #4
        add     r6, r12, r1
        add     r11, r12, r0
        str     r3, [sp]
LBCU2:
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]!
        ldr     r2, [r6, #4]
        ldr     r3, [r6, #8]!
        bl      __subdf3
        mov     r7, r0
        bic     r8, r1, #2, 2
        mov     r2, r5
        mov     r3, r4
        mov     r1, r8
        bl      __gtdf2
        cmp     r0, #0
        movgt   r5, r7
        movgt   r4, r8
        add     r9, r9, #1
        cmp     r9, r10
        blt     LBCU2
        ldr     r3, [sp]
        mov     r0, #0
        str     r5, [r3]
        str     r4, [r3, #4]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBCU3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBCU4:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


