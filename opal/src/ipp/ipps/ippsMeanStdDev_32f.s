        .text
        .align  4
        .globl  _ippsMeanStdDev_32f


_ippsMeanStdDev_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        str     r2, [sp, #0x3C]
        str     r3, [sp, #0x40]
        beq     LBHX9
        ldr     r2, [sp, #0x40]
        cmp     r2, #0
        beq     LBHX9
        ldr     r2, [sp, #0x3C]
        cmp     r2, #0
        beq     LBHX9
        cmp     r6, #2
        blt     LBHX7
        subs    r4, r6, #4
        mov     r8, #0
        bmi     LBHX8
        mov     r0, r8
        mov     r1, r0
        mov     r2, r1
        mov     r3, r2
        mov     r10, r3
        mov     r11, r10
        mov     r9, r11
        add     r5, r7, #0xC
        str     r5, [sp, #0x38]
        add     lr, r7, #4
        add     r12, r7, #8
        mov     r5, r7
        str     r9, [sp, #0x28]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #0xC]
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r5, [sp, #0x24]
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r4, [sp, #0x2C]
        str     r6, [sp, #0x30]
        str     r7, [sp, #0x34]
LBHX0:
        ldr     r1, [sp, #0x24]
        add     r8, r8, #4
        ldr     r0, [r1], #0x10
        str     r1, [sp, #0x24]
        bl      __extendsfdf2
        ldr     r2, [sp, #4]
        ldr     r12, [sp, #4]
        ldr     r2, [r2]
        str     r0, [sp, #0x48]
        add     r12, r12, #0x10
        str     r12, [sp, #4]
        mov     r0, r2
        mov     r6, r1
        bl      __extendsfdf2
        ldr     r12, [sp]
        mov     r7, r0
        mov     r9, r1
        ldr     r2, [r12]
        ldr     r12, [sp]
        add     r12, r12, #0x10
        str     r12, [sp]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r12, [sp, #0x38]
        mov     r11, r0
        mov     r10, r1
        ldr     r2, [r12]
        ldr     r12, [sp, #0x38]
        add     r12, r12, #0x10
        str     r12, [sp, #0x38]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r4, r1
        ldr     r1, [sp, #0x14]
        mov     r5, r0
        ldr     r2, [sp, #0x48]
        ldr     r0, [sp, #0x10]
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #8]
        mov     r3, r9
        mov     r2, r7
        bl      __adddf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r1, r9
        mov     r3, r9
        mov     r0, r7
        mov     r2, r7
        bl      __muldf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x10]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r0, r11
        mov     r1, r10
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0xC]
        mov     r6, r1
        ldr     r1, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r2, r5
        mov     r3, r4
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r7, r0
        mov     r6, r1
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x54]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x28]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        str     r0, [sp, #0x18]
        cmp     r8, r2
        str     r1, [sp, #0x28]
        ble     LBHX0
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r11, [sp, #0x20]
        ldr     r10, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x34]
LBHX1:
        bl      __adddf3
        ldr     r3, [sp, #0x28]
        mov     r5, r0
        mov     r4, r1
        mov     r2, r9
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        cmp     r8, r6
        mov     r9, r0
        str     r1, [sp, #0x2C]
        bge     LBHX5
        sub     r12, r6, r8
        cmp     r12, #5
        blt     LBHX3
        mov     r12, r8, lsl #2
        add     r12, r12, #4
        add     r10, r12, r7
        sub     r12, r6, #5
        str     r12, [sp, #0x38]
        str     r8, [sp, #0x44]
        str     r6, [sp, #0x30]
        str     r7, [sp, #0x34]
LBHX2:
        ldr     r12, [sp, #0x44]
        ldr     r0, [r10, #-4]
        add     r12, r12, #4
        str     r12, [sp, #0x44]
        bl      __extendsfdf2
        mov     r11, r1
        mov     r8, r0
        mov     r3, r11
        mov     r2, r8
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r2, r8
        mov     r0, r5
        mov     r1, r4
        mov     r3, r11
        bl      __adddf3
        str     r0, [sp, #0x54]
        mov     r4, r1
        ldr     r1, [sp, #0x2C]
        mov     r2, r6
        mov     r3, r7
        mov     r0, r9
        bl      __adddf3
        ldr     r2, [r10]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r11, r0
        mov     r9, r1
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x54]
        mov     r8, r1
        mov     r1, r4
        mov     r2, r11
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0x54]
        mov     r4, r1
        mov     r3, r8
        mov     r2, r7
        mov     r1, r5
        mov     r0, r6
        bl      __adddf3
        ldr     r2, [r10, #4]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r11, r1
        mov     r9, r0
        mov     r3, r11
        mov     r2, r9
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x54]
        mov     r8, r1
        mov     r1, r4
        mov     r3, r11
        mov     r2, r9
        bl      __adddf3
        str     r0, [sp, #0x54]
        mov     r4, r1
        mov     r2, r7
        mov     r0, r6
        mov     r1, r5
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [r10, #8]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r5, r1
        mov     r11, r0
        mov     r3, r5
        mov     r2, r11
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x54]
        mov     r9, r1
        mov     r1, r4
        mov     r3, r5
        mov     r2, r11
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        mov     r3, r9
        mov     r0, r7
        mov     r1, r6
        mov     r2, r8
        bl      __adddf3
        ldr     lr, [sp, #0x38]
        ldr     r12, [sp, #0x44]
        add     r10, r10, #0x10
        cmp     r12, lr
        mov     r9, r0
        str     r1, [sp, #0x2C]
        ble     LBHX2
        ldr     r8, [sp, #0x44]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x34]
LBHX3:
        add     r7, r7, r8, lsl #2
        str     r6, [sp, #0x30]
LBHX4:
        ldr     r0, [r7], #4
        add     r8, r8, #1
        bl      __extendsfdf2
        mov     r10, r0
        mov     r6, r1
        mov     r2, r10
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x54]
        mov     r11, r1
        mov     r1, r4
        mov     r0, r5
        mov     r2, r10
        mov     r3, r6
        bl      __adddf3
        mov     r4, r1
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x54]
        mov     r5, r0
        mov     r0, r9
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        mov     r9, r0
        str     r1, [sp, #0x2C]
        cmp     r8, r12
        blt     LBHX4
        ldr     r6, [sp, #0x30]
LBHX5:
        mov     r0, r6
        bl      __floatsidf
        mov     r7, r1
        mov     r8, r0
        mov     r1, r4
        mov     r0, r5
        mov     r3, r7
        mov     r2, r8
        bl      __divdf3
        bl      __truncdfsf2
        ldr     r12, [sp, #0x3C]
        mov     r3, r7
        str     r0, [r12]
        ldr     r1, [sp, #0x2C]
        mov     r0, r9
        mov     r2, r8
        bl      __muldf3
        mov     r10, r1
        mov     r9, r0
        mov     r1, r4
        mov     r3, r4
        mov     r0, r5
        mov     r2, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __subdf3
        sub     r6, r6, #1
        mov     r4, r0
        mov     r0, r6
        mov     r5, r1
        bl      __floatsidf
        mov     r3, r7
        mov     r2, r8
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r1, #0
        movle   r0, r1
        ble     LBHX6
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        bl      sqrt
LBHX6:
        bl      __truncdfsf2
        ldr     r1, [sp, #0x40]
        str     r0, [r1]
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHX7:
        mvn     r0, #5
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHX8:
        mov     r0, r8
        mov     r1, r0
        mov     r2, r1
        mov     r3, r2
        mov     r10, r3
        mov     r11, r10
        mov     r9, r11
        str     r9, [sp, #0x28]
        b       LBHX1
LBHX9:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}


