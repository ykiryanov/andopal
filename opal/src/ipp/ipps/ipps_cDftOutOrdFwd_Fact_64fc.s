        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact_64fc


_ipps_cDftOutOrdFwd_Fact_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x94
        ldr     r6, [sp, #0xB8]
        mul     lr, r2, r3
        mul     r12, r2, r6
        ldr     r7, [sp, #0xC0]
        ldr     r5, [sp, #0xBC]
        ldr     r4, [sp, #0xC4]
        mul     r8, r6, lr
        add     r7, r7, r12, lsl #4
        cmp     r3, #0
        add     r12, r0, r8, lsl #4
        add     r0, r2, #1
        add     r1, r1, r8, lsl #4
        mov     r0, r0, asr #1
        ble     LCPC9
        rsb     lr, r3, lr
        add     r9, r7, r2, lsl #4
        add     r10, r4, #0x10
        sub     r11, r2, #1
        mov     r8, r3
        str     r8, [sp, #0x70]
        str     r11, [sp, #0x6C]
        str     r10, [sp, #0x68]
        str     r9, [sp, #0x64]
        str     lr, [sp, #0x60]
        str     r7, [sp, #0x5C]
        str     r4, [sp, #0x58]
        str     r5, [sp, #0x54]
        str     r6, [sp, #0x50]
        str     r3, [sp, #0x74]
        str     r2, [sp, #0x4C]
LCPC0:
        ldr     r5, [sp, #0x50]
        ldr     r4, [r12]
        ldr     lr, [r12, #4]
        ldr     r3, [r12, #8]
        ldr     r2, [r12, #0xC]
        cmp     r5, #0
        ldr     r5, [sp, #0x74]
        mov     r9, r4
        mov     r8, lr
        add     r6, r12, r5, lsl #4
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x60]
        add     r5, r1, r5, lsl #4
        add     r7, r12, r6, lsl #4
        add     r6, r1, r6, lsl #4
        str     r7, [sp, #0x34]
        str     r6, [sp, #0x48]
        mov     r7, r3
        mov     r6, r2
        bne     LCPC2
        cmp     r0, #1
        ble     LCPC4
        ldr     r10, [sp, #0x58]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        sub     r11, r10, #4
        sub     r10, r10, #0x14
        str     r10, [sp, #0x40]
        sub     r10, r0, #1
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x38]
        str     r8, [sp, #4]
        str     r9, [sp]
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x3C]
        ldr     r8, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        str     r2, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
LCPC1:
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        bl      __adddf3
        ldr     r2, [r11, #8]
        ldr     r3, [r8, #0xC]
        ldr     r4, [r11, #0xC]
        ldr     r5, [r8, #8]
        mov     r6, r0
        mov     r0, r2
        mov     r7, r1
        mov     r2, r5
        mov     r1, r4
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp]
        mov     r4, r1
        ldr     r1, [sp, #4]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp]
        ldr     r0, [sp, #8]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0xC]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r5, [r9, #0x1C]
        str     r4, [r9, #0x20]
        str     r6, [r9, #0x14]
        str     r7, [r9, #0x18]
        ldr     r2, [r11]
        ldr     r3, [r8, #4]
        ldr     r4, [r11, #4]
        ldr     r5, [r8]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __subdf3
        str     r0, [r10, #0x14]
        str     r1, [r10, #0x18]
        ldr     r0, [r11, #8]
        ldr     r1, [r11, #0xC]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __subdf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        ldr     r0, [sp, #0x38]
        add     r9, r9, #0x20
        subs    r0, r0, #1
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x74]
        add     r11, r11, r0, lsl #4
        sub     r8, r8, r0, lsl #4
        ldr     r0, [sp, #0x38]
        bne     LCPC1
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        b       LCPC4
LCPC2:
        cmp     r0, #1
        ble     LCPC4
        mov     r10, #1
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x58]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        sub     r11, r10, #4
        sub     r10, r10, #0x14
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x5C]
        str     r4, [sp, #0x20]
        ldr     r4, [sp, #0x3C]
        add     r10, r10, #4
        str     r11, [sp, #0x40]
        str     r10, [sp, #0x38]
        str     r8, [sp, #4]
        str     r9, [sp]
        str     r2, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r5, [sp, #0x24]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
LCPC3:
        ldr     r1, [sp, #0x30]
        ldr     r12, [sp, #0x38]
        ldr     r7, [r1, #4]
        ldr     r11, [r1]
        ldr     r2, [r12, #0xC]
        mov     r1, r7
        str     r2, [sp, #0x78]
        ldr     r10, [r12, #0x14]
        ldr     r9, [r12, #0x10]
        ldr     r6, [r12, #0x18]
        ldr     r12, [sp, #0x30]
        ldr     r2, [sp, #0x78]
        mov     r0, r11
        mov     r3, r9
        ldr     r8, [r12, #8]
        ldr     r5, [r12, #0xC]
        bl      __muldf3
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x80]
        mov     r2, r10
        mov     r0, r8
        mov     r1, r5
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x80]
        mov     r2, r0
        ldr     r0, [sp, #0x7C]
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r8
        mov     r1, r5
        mov     r3, r9
        bl      __muldf3
        mov     r5, r0
        mov     r8, r1
        mov     r1, r7
        mov     r3, r6
        mov     r2, r10
        mov     r0, r11
        bl      __muldf3
        mov     r3, r8
        rsb     r11, r4, #0
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [r2, #8]
        add     r4, r4, #1
        str     r3, [sp, #0x78]
        ldr     r10, [r2]
        ldr     r9, [r2, #0xC]
        ldr     r6, [r2, #4]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x64]
        ldr     r7, [r2, +r11, lsl #4]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x88]
        add     r12, r3, r11, lsl #4
        ldr     r11, [r12, #4]
        ldr     r8, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r1, r6
        mov     r3, r11
        mov     r0, r10
        mov     r2, r7
        bl      __muldf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x90]
        mov     r2, r8
        mov     r1, r9
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x90]
        mov     r2, r0
        ldr     r0, [sp, #0x8C]
        bl      __subdf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x8C]
        mov     r1, r9
        mov     r3, r11
        mov     r2, r7
        bl      __muldf3
        mov     r7, r0
        mov     r9, r1
        mov     r3, r5
        mov     r1, r6
        mov     r2, r8
        mov     r0, r10
        bl      __muldf3
        mov     r3, r9
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        mov     r5, r0
        ldr     r0, [sp, #0x80]
        mov     r6, r1
        ldr     r1, [sp, #0x7C]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x84]
        mov     r7, r1
        ldr     r1, [sp, #0x88]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp]
        ldr     r0, [sp, #8]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0xC]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x44]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        str     r10, [r12, #0x14]
        str     r7, [r12, #0x18]
        str     r9, [r12, #0x1C]
        str     r8, [r12, #0x20]
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x7C]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        bl      __subdf3
        ldr     r12, [sp, #0x40]
        mov     r2, r5
        str     r0, [r12, #0x14]
        str     r1, [r12, #0x18]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0x40]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x30]
        cmp     r4, r0
        ldr     r0, [sp, #0x74]
        add     r1, r1, r0, lsl #4
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        sub     r1, r1, r0, lsl #4
        ldr     r0, [sp, #0x40]
        str     r1, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x20
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        blt     LCPC3
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
LCPC4:
        cmp     r0, #1
        str     r9, [r1]
        str     r8, [r1, #4]
        str     r7, [r1, #8]
        str     r6, [r1, #0xC]
        ble     LCPC8
        ldr     r11, [sp, #0x48]
        mov     r6, #1
        str     r2, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
LCPC5:
        ldr     r0, [sp, #0x6C]
        mov     r1, r6
        cmp     r0, #0
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x1C]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x18]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x14]
        str     r0, [sp, #0x34]
        ble     LCPC10
        mov     r0, #0
        mov     r10, r0
        ldr     r2, [sp, #0x58]
        mov     r9, r10
        ldr     r4, [sp, #0x68]
        mov     r8, r9
        str     r9, [sp, #0x30]
        ldr     r9, [sp, #0x4C]
        mov     r7, r8
        str     r7, [sp, #0x40]
        str     r6, [sp, #0x44]
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x3C]
        str     r10, [sp, #4]
        str     r11, [sp, #0x48]
        mov     r6, r0
        mov     r7, r1
        mov     r5, r2
LCPC6:
        ldr     r3, [sp, #0x54]
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r11, [r3, +r7, lsl #4]
        add     r8, r3, r7, lsl #4
        ldr     r10, [r8, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0xC]
        bl      __adddf3
        ldr     r2, [r5, #8]
        ldr     r3, [r5, #0xC]
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        ldr     r10, [r8, #8]
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x40]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x30]
        bl      __adddf3
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #4]
        add     r7, r3, r7
        cmp     r7, r9
        str     r1, [sp, #0x30]
        subge   r7, r7, r9
        ldr     r3, [sp, #0x6C]
        add     r6, r6, #2
        add     r4, r4, #0x20
        cmp     r6, r3
        add     r5, r5, #0x20
        blt     LCPC6
        ldr     r7, [sp, #0x40]
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #4]
        ldr     r6, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r5, [sp, #0x24]
LCPC7:
        ldr     r4, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r8
        mov     r0, r4
        mov     r3, r7
        bl      __subdf3
        str     r0, [r5]
        str     r1, [r5, #4]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r1, [r5, #0xC]
        str     r0, [r5, #8]
        ldr     r1, [sp, #8]
        mov     r0, r4
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        mov     r2, r10
        mov     r3, r9
        bl      __subdf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r0, [sp, #0x10]
        add     r6, r6, #1
        cmp     r6, r0
        ldr     r0, [sp, #0x74]
        add     r5, r5, r0, lsl #4
        sub     r11, r11, r0, lsl #4
        blt     LCPC5
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
LCPC8:
        ldr     r2, [sp, #0x70]
        add     r12, r12, #0x10
        add     r1, r1, #0x10
        subs    r2, r2, #1
        str     r2, [sp, #0x70]
        bne     LCPC0
LCPC9:
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LCPC10:
        mov     r7, #0
        mov     r10, r7
        mov     r9, r10
        mov     r8, r9
        b       LCPC7


