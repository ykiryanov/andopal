        .text
        .align  4
        .globl  _ippsNorm_Inf_64fc64f


_ippsNorm_Inf_64fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        cmp     r0, #0
        mov     r10, r2
        beq     LBBI4
        cmp     r10, #0
        beq     LBBI4
        cmp     r1, #0
        ble     LBBI5
        bic     r12, r1, #1
        cmp     r12, #0
        mov     r8, #0
        ble     LBBI3
        mov     r9, r8
        mov     r6, r9
        mov     r5, r6
        sub     lr, r0, #0xC
        mov     r4, r5
        sub     r7, r0, #0x1C
        str     r9, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r10, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBBI0:
        ldr     r1, [r7, #0x20]
        ldr     r0, [r7, #0x1C]
        ldr     r9, [r7, #0x24]
        ldr     r10, [r7, #0x28]
        mov     r3, r1
        mov     r2, r0
        bl      __muldf3
        str     r1, [sp, #0x18]
        mov     r11, r0
        mov     r2, r9
        mov     r0, r9
        mov     r3, r10
        mov     r1, r10
        bl      __muldf3
        ldr     r3, [sp, #0x18]
        mov     r2, r11
        bl      __adddf3
        bl      sqrt
        ldr     r12, [sp, #0x10]
        mov     r9, r1
        mov     r10, r0
        ldr     r11, [r12, #0x28]
        ldr     lr, [r12, #0x24]
        add     r8, r8, #2
        add     r7, r7, #0x20
        str     lr, [sp, #0x18]
        ldr     r3, [r12, #0x20]
        ldr     r2, [r12, #0x1C]
        add     r12, r12, #0x20
        mov     r1, r3
        str     r12, [sp, #0x10]
        mov     r0, r2
        bl      __muldf3
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0x20]
        mov     r3, r11
        mov     r2, r0
        mov     r1, r11
        bl      __muldf3
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        bl      __adddf3
        bl      sqrt
        str     r1, [sp, #0x20]
        mov     r11, r0
        mov     r3, r4
        mov     r2, r5
        mov     r0, r10
        mov     r1, r9
        bl      __gtdf2
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x20]
        cmp     r0, #0
        mov     r3, r6
        mov     r0, r11
        movgt   r4, r9
        movgt   r5, r10
        bl      __gtdf2
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        movgt   r12, r11
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x20]
        movgt   r6, r12
        ldr     r12, [sp, #0xC]
        cmp     r8, r12
        blt     LBBI0
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBI1:
        tst     r1, #1
        beq     LBBI2
        sub     r0, r0, #0x10
        add     r12, r0, r1, lsl #4
        ldr     r2, [r0, +r1, lsl #4]
        ldr     r3, [r12, #4]
        ldr     r11, [r12, #8]
        ldr     r7, [r12, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r8, r1
        mov     r1, r7
        mov     r3, r7
        mov     r0, r11
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        mov     r8, r0
        mov     r7, r1
        mov     r2, r5
        mov     r3, r4
        bl      __gtdf2
        cmp     r0, #0
        movgt   r5, r8
        movgt   r4, r7
LBBI2:
        mov     r0, r5
        mov     r1, r4
        mov     r2, r9
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        movgt   r9, r5
        movgt   r6, r4
        mov     r0, #0
        str     r9, [r10]
        str     r6, [r10, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBI3:
        mov     r9, r8
        mov     r6, r9
        mov     r5, r6
        mov     r4, r5
        b       LBBI1
LBBI4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBI5:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


