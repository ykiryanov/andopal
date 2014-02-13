        .text
        .align  4
        .globl  _ippsNormDiff_L1_64fc64f


_ippsNormDiff_L1_64fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        cmp     r0, #0
        mov     r11, r3
        beq     LBBM4
        cmp     r1, #0
        beq     LBBM4
        cmp     r11, #0
        beq     LBBM4
        cmp     r2, #0
        ble     LBBM5
        bic     lr, r2, #1
        cmp     lr, #0
        mov     r12, #0
        ble     LBBM3
        mov     r10, r12
        mov     r9, r10
        mov     r7, r9
        mov     r8, r7
        sub     r3, r1, #4
        str     r9, [sp, #0x1C]
        sub     r6, r0, #4
        sub     r5, r1, #0x14
        sub     r4, r0, #0x14
        str     r10, [sp, #0x20]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x24]
        str     r11, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r9, r3
LBBM0:
        ldr     r2, [r5, #0x14]
        ldr     r0, [r4, #0x14]
        ldr     r1, [r4, #0x18]
        ldr     r3, [r5, #0x18]
        bl      __subdf3
        ldr     r2, [r4, #0x1C]
        ldr     r8, [r5, #0x1C]
        ldr     r7, [r4, #0x20]!
        ldr     r3, [r5, #0x20]!
        str     r0, [sp, #0x28]
        mov     r0, r2
        mov     r10, r1
        mov     r1, r7
        mov     r2, r8
        bl      __subdf3
        ldr     r3, [r9, #0x18]
        ldr     r2, [r6, #0x14]
        ldr     r7, [r6, #0x18]
        ldr     r8, [r9, #0x14]
        str     r0, [sp, #0x2C]
        mov     r11, r1
        mov     r0, r2
        mov     r2, r8
        mov     r1, r7
        bl      __subdf3
        ldr     r8, [r6, #0x20]
        ldr     r3, [r9, #0x20]
        ldr     r2, [r6, #0x1C]
        ldr     r12, [r9, #0x1C]
        str     r0, [sp, #0x30]
        mov     r0, r2
        mov     r7, r1
        mov     r1, r8
        mov     r2, r12
        bl      __subdf3
        ldr     r2, [sp, #0x28]
        str     r0, [sp, #0x34]
        mov     r0, r2
        mov     r8, r1
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        mov     r10, r1
        mov     r3, r11
        mov     r2, r0
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        mov     r10, r0
        ldr     r0, [sp, #0x30]
        str     r1, [sp, #0x2C]
        mov     r2, r0
        mov     r3, r7
        mov     r1, r7
        bl      __muldf3
        mov     r7, r0
        ldr     r0, [sp, #0x34]
        mov     r11, r1
        mov     r3, r8
        mov     r2, r0
        mov     r1, r8
        bl      __muldf3
        mov     r2, r7
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r7, r0
        mov     r8, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0x2C]
        mov     r2, r10
        bl      __adddf3
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r12, [sp, #0x10]
        add     r2, r2, #2
        cmp     r2, r12
        str     r2, [sp, #0x24]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        add     r9, r9, #0x20
        add     r6, r6, #0x20
        blt     LBBM0
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r11, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBM1:
        tst     r2, #1
        beq     LBBM2
        sub     r12, r1, #0x10
        ldr     r3, [r12, +r2, lsl #4]
        sub     lr, r0, #0x10
        ldr     r0, [lr, +r2, lsl #4]
        add     r6, lr, r2, lsl #4
        ldr     r1, [r6, #4]
        add     r4, r12, r2, lsl #4
        ldr     r5, [r4, #4]
        mov     r2, r3
        mov     r3, r5
        bl      __subdf3
        ldr     r2, [r6, #8]
        ldr     r6, [r6, #0xC]
        ldr     r3, [r4, #0xC]
        ldr     r12, [r4, #8]
        mov     r4, r0
        mov     r0, r2
        mov     r5, r1
        mov     r2, r12
        mov     r1, r6
        bl      __subdf3
        str     r0, [sp, #0x34]
        mov     r6, r1
        mov     r0, r4
        mov     r2, r4
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        bl      sqrt
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        mov     r7, r0
        mov     r8, r1
LBBM2:
        mov     r0, r10
        mov     r1, r9
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [r11]
        mov     r0, #0
        str     r1, [r11, #4]
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBBM3:
        mov     r10, r12
        mov     r9, r10
        mov     r7, r9
        mov     r8, r7
        b       LBBM1
LBBM4:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBBM5:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


