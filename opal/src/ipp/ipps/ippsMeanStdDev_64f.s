        .text
        .align  4
        .globl  _ippsMeanStdDev_64f


_ippsMeanStdDev_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        cmp     r0, #0
        mov     r6, r1
        mov     r7, r2
        str     r3, [sp, #0x30]
        beq     LBHW9
        ldr     r3, [sp, #0x30]
        cmp     r3, #0
        beq     LBHW9
        cmp     r7, #0
        beq     LBHW9
        cmp     r6, #2
        blt     LBHW7
        subs    r12, r6, #4
        mov     r11, #0
        bmi     LBHW8
        mov     r9, r11
        mov     r8, r9
        mov     r4, r8
        str     r4, [sp, #0x38]
        str     r4, [sp, #0x3C]
        mov     r5, r4
        str     r5, [sp, #0x40]
        sub     r1, r0, #4
        sub     r2, r0, #0x14
        sub     lr, r0, #0x1C
        str     r5, [sp, #0x34]
        sub     r10, r0, #0xC
        str     r5, [sp, #0x1C]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r4, [sp, #0x18]
        str     lr, [sp]
        str     r2, [sp, #4]
        str     r1, [sp, #8]
        str     r12, [sp, #0x20]
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r0, [sp, #0x2C]
LBHW0:
        ldr     r0, [sp]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #4]
        ldr     r2, [r0, #0x1C]
        str     r2, [sp, #0x44]
        ldr     r6, [r0, #0x20]
        ldr     r8, [r12, #0x1C]
        ldr     r7, [r12, #0x20]
        ldr     r12, [sp, #8]
        ldr     r0, [sp, #0xC]
        ldr     r11, [r10, #0x1C]
        ldr     r9, [r10, #0x20]!
        ldr     r5, [r12, #0x1C]
        ldr     r4, [r12, #0x20]
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x3C]
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x38]
        mov     r0, r8
        mov     r2, r8
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0xC]
        mov     r2, r11
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r0, r11
        mov     r1, r9
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x3C]
        mov     r6, r1
        ldr     r1, [sp, #0x38]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        mov     r3, r4
        mov     r1, r4
        mov     r2, r5
        mov     r0, r5
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [sp, #0x44]
        mov     r5, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x40]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x40]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x34]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x20]
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #8]
        add     r3, r3, #4
        str     r3, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        cmp     r3, r2
        add     r0, r0, #0x20
        str     r0, [sp, #4]
        ldr     r0, [sp]
        str     r1, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp]
        ble     LBHW0
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x24]
        ldr     r6, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LBHW1:
        cmp     r11, r6
        bge     LBHW5
        sub     r12, r6, r11
        cmp     r12, #5
        blt     LBHW3
        mov     r12, r11, lsl #3
        sub     lr, r12, #4
        sub     r12, r6, #5
        add     r10, lr, r0
        str     r5, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r0, [sp, #0x2C]
LBHW2:
        ldr     r11, [r10, #8]
        ldr     r7, [r10, #4]
        ldr     r12, [sp, #0x14]
        mov     r1, r11
        mov     r3, r11
        add     r12, r12, #4
        str     r12, [sp, #0x14]
        mov     r0, r7
        mov     r2, r7
        bl      __muldf3
        mov     r6, r1
        mov     r5, r0
        mov     r0, r9
        mov     r3, r11
        mov     r2, r7
        mov     r1, r8
        bl      __adddf3
        mov     r7, r1
        ldr     r1, [sp, #0x40]
        str     r0, [sp, #0x50]
        mov     r3, r6
        mov     r0, r4
        mov     r2, r5
        bl      __adddf3
        ldr     r4, [r10, #0xC]
        ldr     r11, [r10, #0x10]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r4
        mov     r2, r4
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x50]
        mov     r9, r1
        mov     r3, r11
        mov     r2, r4
        mov     r1, r7
        bl      __adddf3
        str     r0, [sp, #0x50]
        mov     r4, r1
        mov     r2, r8
        mov     r3, r9
        mov     r1, r6
        mov     r0, r5
        bl      __adddf3
        ldr     r11, [r10, #0x14]
        ldr     r9, [r10, #0x18]
        mov     r6, r1
        mov     r5, r0
        mov     r0, r11
        mov     r1, r9
        mov     r3, r9
        mov     r2, r11
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x50]
        mov     r8, r1
        mov     r1, r4
        mov     r3, r9
        mov     r2, r11
        bl      __adddf3
        str     r0, [sp, #0x50]
        mov     r4, r1
        mov     r3, r8
        mov     r0, r5
        mov     r1, r6
        mov     r2, r7
        bl      __adddf3
        ldr     r9, [r10, #0x1C]
        ldr     r8, [r10, #0x20]!
        mov     r5, r0
        mov     r6, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x50]
        mov     r11, r1
        mov     r2, r9
        mov     r3, r8
        mov     r1, r4
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r6
        mov     r2, r7
        mov     r3, r11
        bl      __adddf3
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x14]
        mov     r4, r0
        str     r1, [sp, #0x40]
        cmp     r12, lr
        ble     LBHW2
        ldr     r5, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x24]
        ldr     r6, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LBHW3:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r0
        str     r5, [sp, #0x1C]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x28]
LBHW4:
        ldr     r6, [r10, #4]
        ldr     r5, [r10, #8]!
        add     r11, r11, #1
        mov     r0, r6
        mov     r2, r6
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x50]
        mov     r7, r1
        mov     r1, r8
        mov     r0, r9
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        mov     r8, r1
        ldr     r1, [sp, #0x40]
        ldr     r2, [sp, #0x50]
        mov     r9, r0
        mov     r0, r4
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        mov     r4, r0
        cmp     r11, r12
        str     r1, [sp, #0x40]
        blt     LBHW4
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0x24]
        ldr     r6, [sp, #0x28]
LBHW5:
        mov     r2, r9
        mov     r3, r8
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        bl      __adddf3
        ldr     r3, [sp, #0x40]
        mov     r9, r0
        mov     r8, r1
        ldr     r1, [sp, #0x34]
        mov     r0, r5
        mov     r2, r4
        bl      __adddf3
        mov     r10, r0
        mov     r0, r6
        mov     r11, r1
        bl      __floatsidf
        mov     r4, r0
        mov     r5, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r9
        mov     r1, r8
        bl      __divdf3
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, r10
        mov     r2, r4
        mov     r3, r5
        mov     r1, r11
        bl      __muldf3
        mov     r7, r0
        mov     r10, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r10
        bl      __subdf3
        sub     r6, r6, #1
        mov     r7, r0
        mov     r0, r6
        mov     r6, r1
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r1, #0
        movle   r0, r1
        ble     LBHW6
        mov     r0, r7
        mov     r1, r6
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
        bl      sqrt
LBHW6:
        ldr     r2, [sp, #0x30]
        str     r0, [r2]
        mov     r0, #0
        str     r1, [r2, #4]
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBHW7:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBHW8:
        mov     r9, r11
        mov     r8, r9
        mov     r4, r8
        str     r4, [sp, #0x38]
        str     r4, [sp, #0x3C]
        mov     r5, r4
        str     r5, [sp, #0x40]
        str     r5, [sp, #0x34]
        b       LBHW1
LBHW9:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


