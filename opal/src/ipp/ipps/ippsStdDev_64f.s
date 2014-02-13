        .text
        .align  4
        .globl  _ippsStdDev_64f


_ippsStdDev_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        cmp     r0, #0
        mov     r9, r1
        mov     r10, r2
        beq     LAUY9
        cmp     r10, #0
        beq     LAUY9
        cmp     r9, #2
        blt     LAUY7
        subs    r12, r9, #4
        mov     r1, #0
        bmi     LAUY8
        mov     r6, r1
        mov     r4, r6
        mov     r5, r4
        str     r5, [sp, #0x38]
        str     r5, [sp, #0x3C]
        mov     r7, r5
        mov     r8, r7
        sub     r2, r0, #4
        sub     r3, r0, #0x14
        sub     lr, r0, #0x1C
        str     r8, [sp, #0x34]
        sub     r11, r0, #0xC
        str     r8, [sp, #0x20]
        str     r4, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r7, [sp, #0x1C]
        str     r5, [sp, #0x18]
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
        str     r12, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r0, [sp, #0x30]
LAUY0:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x10]
        ldr     r12, [sp, #4]
        ldr     r2, [r0, #0x1C]
        str     r2, [sp, #0x40]
        ldr     r6, [r0, #0x20]
        ldr     r8, [r12, #0x1C]
        ldr     r7, [r12, #0x20]
        ldr     r12, [sp]
        ldr     r0, [sp, #0xC]
        ldr     r10, [r11, #0x1C]
        ldr     r9, [r11, #0x20]!
        ldr     r5, [r12, #0x1C]
        ldr     r4, [r12, #0x20]
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x44]
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
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x10]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0xC]
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r0, r10
        mov     r1, r9
        mov     r2, r10
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
        ldr     r0, [sp, #0x40]
        mov     r5, r1
        ldr     r1, [sp, #0x44]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x34]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x20]
        ldr     r0, [sp]
        add     r3, r3, #4
        str     r3, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp]
        ldr     r0, [sp, #4]
        cmp     r3, r2
        add     r0, r0, #0x20
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #8]
        ble     LAUY0
        ldr     r8, [sp, #0x20]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #0x1C]
        ldr     r5, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r10, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
LAUY1:
        cmp     r1, r9
        bge     LAUY5
        sub     r12, r9, r1
        cmp     r12, #5
        blt     LAUY3
        mov     r12, r1, lsl #3
        sub     r12, r12, #4
        add     r11, r12, r0
        sub     r12, r9, #5
        str     r8, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r0, [sp, #0x30]
LAUY2:
        ldr     r12, [sp, #0x14]
        ldr     r10, [r11, #4]
        ldr     r9, [r11, #8]
        add     r12, r12, #4
        str     r12, [sp, #0x14]
        mov     r0, r10
        mov     r2, r10
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0x4C]
        mov     r8, r1
        mov     r0, r6
        mov     r2, r10
        mov     r3, r9
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x48]
        mov     r4, r1
        mov     r0, r5
        mov     r1, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r9, [r11, #0xC]
        ldr     r10, [r11, #0x10]
        mov     r6, r1
        mov     r5, r0
        mov     r0, r9
        mov     r1, r10
        mov     r3, r10
        mov     r2, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x48]
        mov     r8, r1
        mov     r1, r4
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r0, [sp, #0x4C]
        mov     r4, r1
        mov     r2, r7
        mov     r3, r8
        mov     r1, r6
        mov     r0, r5
        bl      __adddf3
        ldr     r10, [r11, #0x14]
        ldr     r9, [r11, #0x18]
        mov     r6, r1
        mov     r5, r0
        mov     r0, r10
        mov     r2, r10
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x4C]
        mov     r8, r1
        mov     r1, r4
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0x4C]
        mov     r4, r1
        mov     r1, r6
        mov     r2, r7
        mov     r0, r5
        mov     r3, r8
        bl      __adddf3
        ldr     r6, [r11, #0x20]
        ldr     r10, [r11, #0x1C]
        mov     r7, r1
        mov     r5, r0
        mov     r1, r6
        mov     r3, r6
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x4C]
        mov     r9, r1
        mov     r1, r4
        mov     r3, r6
        mov     r2, r10
        bl      __adddf3
        mov     r6, r0
        mov     r4, r1
        mov     r0, r5
        mov     r1, r7
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0x14]
        mov     r5, r0
        mov     r7, r1
        cmp     r12, lr
        add     r11, r11, #0x20
        ble     LAUY2
        ldr     r8, [sp, #0x20]
        ldr     r1, [sp, #0x14]
        ldr     r10, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
LAUY3:
        mov     r12, r1, lsl #3
        sub     r12, r12, #4
        str     r10, [sp, #0x28]
        add     r11, r12, r0
        str     r8, [sp, #0x20]
        str     r7, [sp, #0x1C]
        str     r9, [sp, #0x2C]
        mov     r10, r1
LAUY4:
        ldr     r8, [r11, #4]
        ldr     r7, [r11, #8]!
        add     r10, r10, #1
        mov     r0, r8
        mov     r2, r8
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x4C]
        mov     r9, r1
        mov     r1, r4
        mov     r0, r6
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        mov     r4, r1
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x4C]
        mov     r6, r0
        mov     r0, r5
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        mov     r5, r0
        cmp     r10, r12
        str     r1, [sp, #0x1C]
        blt     LAUY4
        ldr     r8, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r10, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
LAUY5:
        mov     r2, r6
        mov     r3, r4
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        bl      __adddf3
        mov     r4, r1
        ldr     r1, [sp, #0x34]
        mov     r6, r0
        mov     r2, r5
        mov     r3, r7
        mov     r0, r8
        bl      __adddf3
        mov     r11, r0
        mov     r8, r1
        mov     r0, r9
        bl      __floatsidf
        mov     r5, r0
        mov     r7, r1
        mov     r2, r11
        mov     r3, r8
        bl      __muldf3
        mov     r11, r1
        mov     r8, r0
        mov     r1, r4
        mov     r3, r4
        mov     r0, r6
        mov     r2, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r11
        bl      __subdf3
        mov     r4, r0
        sub     r0, r9, #1
        mov     r6, r1
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r7
        bl      __muldf3
        mov     r7, r0
        mov     r5, r1
        mov     r0, r4
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r1, #0
        movle   r0, r1
        ble     LAUY6
        mov     r0, r4
        mov     r1, r6
        mov     r2, r7
        mov     r3, r5
        bl      __divdf3
        bl      sqrt
LAUY6:
        str     r0, [r10]
        mov     r0, #0
        str     r1, [r10, #4]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAUY7:
        mvn     r0, #5
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAUY8:
        mov     r6, r1
        mov     r4, r6
        mov     r5, r4
        str     r5, [sp, #0x38]
        str     r5, [sp, #0x3C]
        mov     r7, r5
        mov     r8, r7
        str     r8, [sp, #0x34]
        b       LAUY1
LAUY9:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


