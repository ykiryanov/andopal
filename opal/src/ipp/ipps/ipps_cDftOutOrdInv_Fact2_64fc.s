        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact2_64fc


_ipps_cDftOutOrdInv_Fact2_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     lr, [sp, #0x78]
        ldr     r4, [sp, #0x7C]
        mov     r12, r3, lsl #2
        mul     r12, r2, r12
        cmp     r2, #1
        add     r4, r4, r3, lsl #4
        add     r0, r0, r12, lsl #3
        add     r1, r1, r12, lsl #3
        mov     r12, #0
        beq     LCOY4
        cmp     lr, #0
        ble     LCOY3
        mov     r3, r12
        mov     r5, r2, lsl #1
        str     r5, [sp, #0x1C]
        str     lr, [sp, #0x24]
        str     r12, [sp, #0x2C]
LCOY0:
        ldr     r12, [sp, #0x1C]
        add     r7, r0, r2, lsl #4
        cmp     r12, #0
        add     r12, r1, r2, lsl #4
        ble     LCOY2
        ldr     r6, [sp, #0x2C]
        sub     r10, r12, #4
        sub     r12, r12, #0xC
        sub     r5, r1, #4
        sub     lr, r1, #0xC
        sub     r9, r7, #4
        sub     r11, r0, #0xC
        sub     r8, r0, #4
        sub     r7, r7, #0xC
        str     r11, [sp, #0xC]
        str     lr, [sp, #8]
        str     r5, [sp, #4]
        str     r12, [sp]
        str     r10, [sp, #0x10]
        str     r3, [sp, #0x20]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
        str     r2, [sp, #0x28]
LCOY1:
        ldr     r0, [r7, #0xC]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #0x30]
        ldr     r0, [r0, +r6, lsl #3]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0xC]
        ldr     r0, [r0, #0x10]
        str     r0, [sp, #0x38]
        ldr     r5, [r7, #0x10]!
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x38]
        mov     r3, r5
        bl      __adddf3
        ldr     r10, [r8, #0xC]
        ldr     r11, [r8, #0x10]!
        ldr     r2, [r9, #0xC]
        str     r2, [sp, #0x3C]
        ldr     r2, [r9, #0x10]!
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x44]
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x38]
        mov     r3, r5
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        str     r1, [sp, #0x38]
        mov     r5, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subdf3
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x18]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r5
        str     r3, [r2, +r6, lsl #3]
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp, #8]
        add     r6, r6, #2
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #4]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #0x10]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        ldr     r1, [sp, #0x38]
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        ldr     r2, [sp]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r11, r1
        ldr     r1, [sp, #0x38]
        mov     r10, r0
        mov     r0, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x1C]
        cmp     r6, r0
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        blt     LCOY1
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #0x28]
LCOY2:
        ldr     r12, [sp, #0x24]
        add     r3, r3, #1
        add     r4, r4, #0x10
        cmp     r3, r12
        add     r0, r0, r2, lsl #5
        add     r1, r1, r2, lsl #5
        blt     LCOY0
LCOY3:
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCOY4:
        mov     lr, lr, lsl #2
        cmp     lr, #0
        ble     LCOY3
        sub     r9, r0, #4
        sub     r8, r0, #0x14
        sub     r7, r0, #0xC
        sub     r5, r1, #4
        sub     r3, r1, #0xC
        sub     r2, r1, #0x14
        sub     r0, r0, #0x1C
        sub     r6, r1, #0x1C
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0x24]
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x2C]
LCOY5:
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x2C]
        ldr     r5, [r1, #0x1C]
        add     r2, r2, #4
        str     r2, [sp, #0x2C]
        ldr     r2, [r1, #0x20]!
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x50]
        ldr     r2, [r7, #0x1C]
        mov     r0, r5
        str     r2, [sp, #0x4C]
        ldr     r1, [r7, #0x20]!
        str     r1, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        ldr     r1, [sp, #0x50]
        bl      __adddf3
        ldr     r11, [r8, #0x20]
        ldr     r10, [r8, #0x1C]
        ldr     r2, [r9, #0x1C]
        str     r2, [sp, #0x44]
        ldr     r2, [r9, #0x20]!
        str     r1, [sp, #0x38]
        str     r0, [sp, #0x3C]
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x50]
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        mov     r5, r0
        str     r1, [sp, #0x50]
        mov     r1, r11
        mov     r0, r10
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        mov     r10, r0
        mov     r0, r5
        str     r2, [r6, #0x1C]
        ldr     r2, [sp, #0x38]
        mov     r11, r1
        str     r2, [r6, #0x20]!
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x34]
        add     r8, r8, #0x20
        str     r3, [r2, #0x1C]
        ldr     r3, [sp, #0x30]
        str     r3, [r2, #0x20]
        ldr     r1, [sp, #0x50]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x48]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r1, [r2, #0x20]
        str     r0, [r2, #0x1C]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        mov     r1, r11
        mov     r0, r10
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r11, r1
        ldr     r1, [sp, #0x50]
        mov     r10, r0
        mov     r0, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        add     r4, r4, #0x10
        add     r2, r2, #0x20
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x10]
        add     r2, r2, #0x20
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x24]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        blt     LCOY5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


