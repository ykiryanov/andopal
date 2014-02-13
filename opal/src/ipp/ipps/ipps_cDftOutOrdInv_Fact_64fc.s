        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact_64fc


_ipps_cDftOutOrdInv_Fact_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r4, [sp, #0x98]
        mul     lr, r2, r3
        mul     r6, r2, r4
        ldr     r5, [sp, #0x9C]
        ldr     r12, [sp, #0xA0]
        mul     r7, r4, lr
        ldr     r4, [sp, #0xA4]
        add     r6, r12, r6, lsl #4
        add     r8, r2, #1
        add     r12, r0, r7, lsl #4
        cmp     r3, #0
        add     r1, r1, r7, lsl #4
        mov     r0, r8, asr #1
        ble     LCOU7
        rsb     lr, r3, lr
        sub     r8, r2, #1
        add     r9, r6, r2, lsl #4
        add     r10, r4, #0x10
        mov     r7, r3
        str     r7, [sp, #0x64]
        str     r10, [sp, #0x60]
        str     r9, [sp, #0x5C]
        str     r8, [sp, #0x58]
        str     lr, [sp, #0x54]
        str     r6, [sp, #0x50]
        str     r4, [sp, #0x4C]
        str     r5, [sp, #0x48]
        str     r3, [sp, #0x70]
        str     r2, [sp, #0x44]
LCOU0:
        ldr     r6, [sp, #0x54]
        ldr     r8, [sp, #0x70]
        ldr     r5, [r12]
        ldr     lr, [r12, #4]
        ldr     r3, [r12, #8]
        ldr     r2, [r12, #0xC]
        add     r7, r12, r6, lsl #4
        add     r4, r12, r8, lsl #4
        add     r8, r1, r8, lsl #4
        add     r6, r1, r6, lsl #4
        str     r7, [sp, #0x18]
        str     r8, [sp, #0x68]
        str     r6, [sp, #0x6C]
        cmp     r0, #1
        mov     r9, r5
        mov     r8, lr
        mov     r7, r3
        mov     r6, r2
        ble     LCOU2
        ldr     r11, [sp, #0x4C]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        sub     r10, r11, #4
        str     r10, [sp, #0x20]
        sub     r11, r11, #0x14
        sub     r10, r0, #1
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x1C]
        str     r9, [sp, #0x14]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x20]
        ldr     r9, [sp, #0x18]
        str     r8, [sp, #0x10]
        str     r2, [sp, #0x28]
        str     r3, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        str     r12, [sp, #0x40]
LCOU1:
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        ldr     r0, [r4]
        ldr     r1, [r4, #4]
        bl      __adddf3
        ldr     r2, [r4, #8]
        ldr     r3, [r9, #0xC]
        ldr     r5, [r4, #0xC]
        ldr     r6, [r9, #8]
        mov     r7, r0
        mov     r0, r2
        mov     r8, r1
        mov     r2, r6
        mov     r1, r5
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [sp, #0x14]
        mov     r5, r1
        ldr     r1, [sp, #0x10]
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        str     r6, [r10, #0x1C]
        str     r5, [r10, #0x20]
        str     r7, [r10, #0x14]
        str     r8, [r10, #0x18]
        ldr     r2, [r4]
        ldr     r3, [r9, #4]
        ldr     r5, [r4, #4]
        ldr     r6, [r9]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r5
        mov     r2, r6
        bl      __subdf3
        str     r0, [r11, #0x14]
        str     r1, [r11, #0x18]
        ldr     r0, [r4, #8]
        ldr     r1, [r4, #0xC]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        bl      __subdf3
        str     r0, [r11, #0x1C]
        str     r1, [r11, #0x20]!
        ldr     r0, [sp, #0x1C]
        add     r10, r10, #0x20
        subs    r0, r0, #1
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x70]
        add     r4, r4, r0, lsl #4
        sub     r9, r9, r0, lsl #4
        ldr     r0, [sp, #0x1C]
        bne     LCOU1
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        ldr     r5, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
LCOU2:
        cmp     r0, #1
        str     r9, [r1]
        str     r8, [r1, #4]
        str     r7, [r1, #8]
        str     r6, [r1, #0xC]
        ble     LCOU6
        ldr     r4, [sp, #0x50]
        mov     r9, #1
        str     r2, [sp, #0x28]
        add     r8, r4, #0xC
        str     r3, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        str     r12, [sp, #0x40]
LCOU3:
        ldr     r0, [sp, #0x58]
        mov     r7, r9
        cmp     r0, #0
        ldr     r0, [sp, #0x34]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x30]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x2C]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x28]
        str     r0, [sp, #0x10]
        ble     LCOU8
        mov     r4, #0
        mov     r10, r4
        str     r10, [sp]
        ldr     r5, [sp, #0x60]
        ldr     r6, [sp, #0x4C]
        str     r10, [sp, #0xC]
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x44]
        mov     r11, r10
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r8, [sp, #0x24]
LCOU4:
        ldr     r3, [sp, #0x48]
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        ldr     r11, [r3, +r7, lsl #4]
        add     r8, r3, r7, lsl #4
        ldr     r10, [r8, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r3, [r6, #8]
        ldr     r2, [r6, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r10, [r8, #8]
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r3, [r5]
        ldr     r2, [r5, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r3, [sp, #0x20]
        str     r0, [sp]
        add     r7, r3, r7
        cmp     r7, r9
        str     r1, [sp, #0xC]
        subge   r7, r7, r9
        ldr     r0, [sp, #0x58]
        add     r4, r4, #2
        add     r5, r5, #0x20
        cmp     r4, r0
        add     r6, r6, #0x20
        blt     LCOU4
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp, #0x20]
LCOU5:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        ldr     r3, [sp, #0xC]
        mov     r5, r0
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp]
        mov     r6, r1
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        mov     r7, r1
        ldr     r1, [sp, #4]
        mov     r4, r0
        ldr     r0, [sp, #8]
        mov     r3, r11
        mov     r2, r10
        bl      __subdf3
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp]
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x14]
        mov     r10, r1
        ldr     r1, [sp, #0x10]
        bl      __adddf3
        ldr     r2, [r8, #4]
        ldr     r3, [r8, #8]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [r8, #0xC]
        ldr     r3, [r8, #0x10]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r1, r7
        mov     r0, r4
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r11, [sp, #0x68]
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [r8, #4]
        ldr     r3, [r8, #8]
        mov     r0, r4
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [r8, #0xC]
        ldr     r3, [r8, #0x10]!
        mov     r7, r1
        mov     r4, r0
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r7
        mov     r0, r4
        bl      __subdf3
        str     r1, [r11, #0xC]
        str     r0, [r11, #8]
        ldr     r0, [sp, #0x5C]
        rsb     r5, r9, #0
        mov     r1, r10
        ldr     r2, [r0, +r5, lsl #4]
        add     r4, r0, r5, lsl #4
        ldr     r3, [r4, #4]
        ldr     r0, [sp, #0x1C]
        add     r9, r9, #1
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r7, r1
        ldr     r1, [sp, #0x14]
        mov     r6, r0
        ldr     r0, [sp, #0x18]
        bl      __muldf3
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        ldr     r6, [sp, #0x6C]
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [sp, #0x5C]
        ldr     r3, [r4, #4]
        ldr     r1, [sp, #0x14]
        ldr     r2, [r0, +r5, lsl #4]
        ldr     r0, [sp, #0x18]
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r4, r0
        ldr     r0, [sp, #0x1C]
        mov     r5, r1
        mov     r1, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r6, #8]
        str     r1, [r6, #0xC]
        ldr     r0, [sp, #0x38]
        cmp     r9, r0
        ldr     r0, [sp, #0x70]
        add     r11, r11, r0, lsl #4
        str     r11, [sp, #0x68]
        sub     r6, r6, r0, lsl #4
        str     r6, [sp, #0x6C]
        blt     LCOU3
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
LCOU6:
        ldr     r2, [sp, #0x64]
        add     r12, r12, #0x10
        add     r1, r1, #0x10
        subs    r2, r2, #1
        str     r2, [sp, #0x64]
        bne     LCOU0
LCOU7:
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LCOU8:
        mov     r11, #0
        mov     r10, r11
        str     r10, [sp]
        str     r10, [sp, #0xC]
        b       LCOU5


