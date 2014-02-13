        .text
        .align  4
        .globl  _ipps_cDftFwd_Fact2_64fc


_ipps_cDftFwd_Fact2_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r12, [sp, #0x78]
        cmp     r3, #0
        mov     r9, r0
        mov     r8, r1
        mov     r5, r2
        ble     LCQA3
        add     r12, r12, #0x10
        mov     lr, r5, lsl #1
        str     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
LCQA0:
        ldr     r12, [sp, #0xC]
        ldr     r4, [r9]
        ldr     r11, [r9, #4]
        ldr     r7, [r9, +r5, lsl #4]
        add     r10, r9, r5, lsl #4
        ldr     r6, [r10, #4]
        str     r12, [sp]
        mov     r0, r4
        mov     r3, r6
        mov     r1, r11
        mov     r2, r7
        bl      __adddf3
        str     r1, [sp, #0x2C]
        str     r0, [sp, #0x30]
        ldr     r0, [r9, #8]
        str     r0, [sp, #0x28]
        ldr     r12, [r9, #0xC]
        str     r12, [sp, #0x24]
        ldr     r12, [r10, #8]
        ldr     r1, [sp, #0x24]
        str     r12, [sp, #0x20]
        ldr     r12, [r10, #0xC]
        ldr     r2, [sp, #0x20]
        str     r12, [sp, #0x1C]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        mov     r3, r6
        mov     r0, r4
        mov     r1, r11
        mov     r2, r7
        bl      __subdf3
        mov     r6, r0
        mov     r4, r1
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __subdf3
        ldr     r3, [sp, #0x30]
        add     r12, r8, r5, lsl #4
        str     r3, [r8]
        ldr     r3, [sp, #0x2C]
        add     lr, r9, #8
        str     r3, [r8, #4]
        ldr     r3, [sp, #0x34]
        str     r3, [r8, #8]
        ldr     r3, [sp, #0x38]
        str     r3, [r8, #0xC]
        str     r6, [r8, +r5, lsl #4]
        str     r4, [r12, #4]
        str     r0, [r12, #8]
        str     r1, [r12, #0xC]
        ldr     r3, [sp, #0x10]
        cmp     r3, #2
        add     r3, r8, #8
        ble     LCQA2
        add     r4, lr, #4
        str     r5, [sp, #4]
        ldr     r5, [sp]
        add     lr, r12, #0xC
        add     r6, r10, #4
        add     r3, r3, #4
        add     r12, r12, #4
        add     r11, r8, #4
        add     r0, r9, #4
        add     r10, r10, #0xC
        mov     r7, #2
        str     r10, [sp, #0x30]
        str     r0, [sp, #0x24]
        str     r11, [sp, #0x2C]
        str     r3, [sp, #0x20]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x1C]
        str     r8, [sp, #0x14]
        str     r9, [sp, #0x18]
LCQA1:
        ldr     r0, [r5]
        str     r0, [sp, #0x38]
        ldr     r0, [r6, #0xC]
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0x34]
        ldr     r1, [r6, #0x10]!
        str     r1, [sp, #0x3C]
        ldr     r3, [r5, #4]
        ldr     r1, [sp, #0x30]
        str     r3, [sp, #0x40]
        ldr     r10, [r5, #8]
        ldr     r11, [r5, #0xC]
        ldr     r8, [r1, #0x10]
        ldr     r9, [r1, #0xC]
        ldr     r1, [sp, #0x3C]
        add     r5, r5, #0x10
        bl      __muldf3
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r3, r11
        mov     r2, r10
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x48]
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        bl      __subdf3
        ldr     r3, [sp, #0x40]
        ldr     r2, [sp, #0x38]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x38]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x3C]
        mov     r3, r11
        mov     r2, r10
        bl      __muldf3
        ldr     r3, [sp, #0x38]
        ldr     r2, [sp, #0x40]
        bl      __adddf3
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x48]
        mov     r8, r0
        ldr     r10, [r3, +r7, lsl #3]
        ldr     r3, [sp, #0x24]
        ldr     r11, [r3, #0x10]
        ldr     r3, [sp, #0x44]
        str     r1, [sp, #0x40]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r3, [r4, #0xC]
        mov     r2, r8
        str     r3, [sp, #0x3C]
        ldr     r9, [r4, #0x10]!
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        str     r1, [sp, #0x34]
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x50]
        mov     r1, r11
        mov     r0, r10
        bl      __subdf3
        ldr     r3, [sp, #0x40]
        mov     r11, r0
        ldr     r0, [sp, #0x3C]
        mov     r10, r1
        mov     r1, r9
        mov     r2, r8
        bl      __subdf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x38]
        str     r2, [r3, +r7, lsl #3]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x34]
        add     r7, r7, #2
        str     r2, [r3, #0x10]
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x20]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x50]
        str     r3, [r2, #0x10]
        ldr     r2, [sp, #0x28]
        str     r11, [r2, #0xC]
        str     r10, [r2, #0x10]
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x10]
        cmp     r7, r0
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        blt     LCQA1
        ldr     r5, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x18]
LCQA2:
        ldr     r3, [sp, #8]
        add     r9, r9, r5, lsl #5
        add     r8, r8, r5, lsl #5
        subs    r3, r3, #1
        str     r3, [sp, #8]
        bne     LCQA0
LCQA3:
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


