        .text
        .align  4
        .globl  _ippsNormDiff_L2_64fc64f


_ippsNormDiff_L2_64fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        cmp     r0, #0
        mov     r8, r3
        beq     LBBK4
        cmp     r1, #0
        beq     LBBK4
        cmp     r8, #0
        beq     LBBK4
        cmp     r2, #0
        ble     LBBK5
        bic     lr, r2, #1
        cmp     lr, #0
        mov     r12, #0
        ble     LBBK3
        mov     r7, r12
        mov     r6, r7
        mov     r4, r6
        mov     r5, r4
        sub     r3, r1, #4
        str     r6, [sp, #0x14]
        sub     r11, r0, #4
        sub     r10, r1, #0x14
        sub     r9, r0, #0x14
        str     r7, [sp, #0x18]
        str     r5, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x24]
        str     r8, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r6, r3
LBBK0:
        ldr     r0, [r9, #0x14]
        ldr     r1, [r9, #0x18]
        ldr     r2, [r10, #0x14]
        ldr     r3, [r10, #0x18]
        bl      __subdf3
        ldr     r2, [r9, #0x1C]
        ldr     r4, [r9, #0x20]!
        ldr     r5, [r10, #0x1C]
        ldr     r3, [r10, #0x20]!
        str     r0, [sp, #0x28]
        mov     r0, r2
        mov     r7, r1
        mov     r2, r5
        mov     r1, r4
        bl      __subdf3
        ldr     r5, [r6, #0x14]
        ldr     r2, [r11, #0x14]
        ldr     r4, [r11, #0x18]
        ldr     r3, [r6, #0x18]
        str     r0, [sp, #0x2C]
        mov     r0, r2
        mov     r8, r1
        mov     r1, r4
        mov     r2, r5
        bl      __subdf3
        ldr     r2, [r6, #0x1C]
        ldr     r5, [r11, #0x1C]
        ldr     r12, [r11, #0x20]!
        ldr     r3, [r6, #0x20]!
        str     r0, [sp, #0x30]
        mov     r4, r1
        mov     r1, r12
        mov     r0, r5
        bl      __subdf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x28]
        mov     r5, r1
        mov     r3, r7
        mov     r2, r0
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        mov     r7, r1
        mov     r3, r8
        mov     r2, r0
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        str     r0, [sp, #0x2C]
        mov     r7, r1
        mov     r0, r2
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        mov     r4, r0
        mov     r8, r1
        mov     r0, r2
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r2, r4
        mov     r3, r8
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x2C]
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r12, [sp, #0x10]
        add     r2, r2, #2
        cmp     r2, r12
        str     r2, [sp, #0x24]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        blt     LBBK0
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r5, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBK1:
        tst     r2, #1
        beq     LBBK2
        sub     r1, r1, #0x10
        ldr     r11, [r1, +r2, lsl #4]
        sub     r12, r0, #0x10
        ldr     r0, [r12, +r2, lsl #4]
        add     r9, r12, r2, lsl #4
        add     r10, r1, r2, lsl #4
        ldr     r3, [r10, #4]
        ldr     r1, [r9, #4]
        mov     r2, r11
        bl      __subdf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        ldr     r12, [r9, #0xC]
        ldr     r11, [r9, #8]
        mov     r10, r1
        mov     r9, r0
        mov     r1, r12
        mov     r0, r11
        bl      __subdf3
        str     r0, [sp, #0x34]
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r2
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
LBBK2:
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        bl      sqrt
        str     r0, [r8]
        mov     r0, #0
        str     r1, [r8, #4]
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBBK3:
        mov     r7, r12
        mov     r6, r7
        mov     r4, r6
        mov     r5, r4
        b       LBBK1
LBBK4:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBBK5:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


