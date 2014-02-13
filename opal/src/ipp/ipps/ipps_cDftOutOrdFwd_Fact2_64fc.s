        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact2_64fc


_ipps_cDftOutOrdFwd_Fact2_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     lr, [sp, #0x78]
        ldr     r4, [sp, #0x7C]
        mov     r12, r3, lsl #2
        mul     r12, r2, r12
        add     r4, r4, r3, lsl #4
        cmp     r2, #1
        add     r3, r1, r12, lsl #3
        add     r0, r0, r12, lsl #3
        mov     r1, #0
        beq     LCPG4
        cmp     lr, #0
        ble     LCPG3
        mov     r12, r1
        mov     r5, r2, lsl #1
        str     r5, [sp, #0x20]
        str     lr, [sp, #0x28]
        str     r1, [sp, #0x30]
LCPG0:
        ldr     r1, [sp, #0x20]
        add     r6, r0, r2, lsl #4
        cmp     r1, #0
        add     r1, r3, r2, lsl #4
        ble     LCPG2
        ldr     r5, [sp, #0x30]
        sub     lr, r1, #4
        sub     r1, r1, #0xC
        sub     r9, r3, #4
        sub     r10, r3, #0xC
        sub     r11, r0, #0xC
        sub     r7, r6, #4
        sub     r8, r0, #4
        sub     r6, r6, #0xC
        str     r11, [sp, #4]
        str     r10, [sp]
        str     r9, [sp, #8]
        str     r1, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x24]
        str     r4, [sp, #0x14]
        str     r3, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r2, [sp, #0x2C]
LCPG1:
        ldr     r0, [sp, #0x14]
        ldr     r1, [r0]
        str     r1, [sp, #0x34]
        ldr     r1, [r6, #0xC]
        ldr     r2, [sp, #0x34]
        str     r1, [sp, #0x38]
        ldr     r1, [r6, #0x10]!
        str     r1, [sp, #0x3C]
        ldr     r1, [r0, #4]
        str     r1, [sp, #0x40]
        ldr     r11, [r0, #8]
        ldr     r4, [r0, #0xC]
        ldr     r0, [sp, #0x38]
        ldr     r3, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        ldr     r9, [r7, #0xC]
        ldr     r10, [r7, #0x10]!
        bl      __muldf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r1, r10
        mov     r2, r11
        mov     r3, r4
        mov     r0, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x40]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r9
        mov     r1, r10
        bl      __muldf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x38]
        mov     r9, r1
        ldr     r1, [sp, #0x3C]
        mov     r2, r11
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x44]
        ldr     r10, [r2, +r5, lsl #3]
        ldr     r2, [sp, #4]
        ldr     r11, [r2, #0x10]
        ldr     r2, [sp, #0x48]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r4, [r8, #0xC]
        ldr     r9, [r8, #0x10]!
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        mov     r0, r4
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x50]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r9
        bl      __subdf3
        ldr     r3, [sp, #0x38]
        ldr     r2, [sp, #0x1C]
        str     r3, [r2, +r5, lsl #3]
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp]
        add     r5, r5, #2
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #8]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0xC]
        str     r11, [r2, #0xC]
        str     r10, [r2, #0x10]
        ldr     r2, [sp, #0x10]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x20]
        cmp     r5, r0
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        blt     LCPG1
        ldr     r12, [sp, #0x24]
        ldr     r4, [sp, #0x14]
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0x2C]
LCPG2:
        ldr     r1, [sp, #0x28]
        add     r12, r12, #1
        add     r4, r4, #0x10
        cmp     r12, r1
        add     r0, r0, r2, lsl #5
        add     r3, r3, r2, lsl #5
        blt     LCPG0
LCPG3:
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCPG4:
        mov     lr, lr, lsl #2
        cmp     lr, #0
        ble     LCPG3
        sub     r8, r3, #4
        sub     r12, r3, #0xC
        sub     r2, r3, #0x14
        sub     r7, r0, #0x14
        sub     r6, r0, #0x1C
        sub     r5, r0, #4
        sub     r3, r3, #0x1C
        sub     r0, r0, #0xC
        str     r0, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x28]
        str     r8, [sp, #0x24]
        str     lr, [sp, #0x2C]
        str     r1, [sp, #0x30]
LCPG5:
        ldr     r0, [r4]
        ldr     r1, [sp, #0x18]
        str     r0, [sp, #0x50]
        ldr     r0, [r4, #4]
        ldr     r2, [sp, #0x50]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x30]
        ldr     r3, [sp, #0x4C]
        add     r0, r0, #4
        str     r0, [sp, #0x30]
        ldr     r0, [r1, #0x1C]
        str     r0, [sp, #0x48]
        ldr     r1, [r1, #0x20]
        str     r1, [sp, #0x44]
        ldr     r11, [r4, #0xC]
        ldr     r9, [r5, #0x20]
        ldr     r1, [sp, #0x44]
        ldr     r8, [r5, #0x1C]
        ldr     r10, [r4, #8]
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r3, r11
        mov     r0, r8
        mov     r2, r10
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x40]
        mov     r3, r1
        ldr     r1, [sp, #0x3C]
        bl      __subdf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x48]
        mov     r8, r1
        ldr     r1, [sp, #0x44]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [sp, #0x50]
        mov     r3, r8
        bl      __adddf3
        ldr     r10, [r6, #0x1C]
        ldr     r11, [r6, #0x20]!
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        mov     r8, r0
        str     r1, [sp, #0x50]
        mov     r1, r11
        mov     r0, r10
        bl      __adddf3
        ldr     r3, [r7, #0x1C]
        str     r3, [sp, #0x4C]
        ldr     r9, [r7, #0x20]!
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        str     r1, [sp, #0x44]
        mov     r1, r9
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        mov     r11, r0
        ldr     r0, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r10, r1
        mov     r1, r9
        mov     r2, r8
        bl      __subdf3
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp, #0x1C]
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x44]
        str     r3, [r2, #0x20]
        ldr     r3, [sp, #0x38]
        ldr     r2, [sp, #0x20]
        add     r5, r5, #0x20
        add     r4, r4, #0x10
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x34]
        str     r3, [r2, #0x20]
        ldr     r2, [sp, #0x28]
        str     r11, [r2, #0x1C]
        str     r10, [r2, #0x20]!
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x20]
        add     r2, r2, #0x20
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        add     r2, r2, #0x20
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x24]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x20
        str     r0, [sp, #0x18]
        blt     LCPG5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


