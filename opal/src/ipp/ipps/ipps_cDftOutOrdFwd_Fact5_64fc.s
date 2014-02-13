        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact5_64fc


_ipps_cDftOutOrdFwd_Fact5_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xF0
        ldr     lr, [sp, #0x114]
        ldr     r12, [sp, #0x118]
        add     r4, r2, r2, lsl #3
        add     r4, r2, r4
        mul     r4, r4, r3
        add     r12, r12, r3, lsl #6
        cmp     r2, #1
        add     r3, r1, r4, lsl #3
        add     r0, r0, r4, lsl #3
        mov     r1, #0
        beq     LCPD4
        cmp     lr, #0
        ble     LCPD3
        ldr     r8, [pc, #0xA6C]
        ldr     r4, [pc, #0xA6C]
        ldr     r7, [pc, #0xA6C]
        ldr     r6, [r8]
        ldr     r8, [r8, #4]
        ldr     r5, [pc, #0xA64]
        rsb     r10, r2, r2, lsl #2
        str     r8, [sp, #0x8C]
        ldr     r8, [r4]
        mov     r9, r2, lsl #1
        add     r11, r2, r2, lsl #2
        str     r8, [sp, #0x88]
        ldr     r8, [r7]
        ldr     r4, [r4, #4]
        str     r8, [sp, #0x94]
        ldr     r8, [r5]
        ldr     r7, [r7, #4]
        ldr     r5, [r5, #4]
        str     r11, [sp, #0x90]
        str     r9, [sp, #0x4C]
        str     r10, [sp, #0x50]
        str     r5, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0x14]
        str     r4, [sp, #8]
        str     r6, [sp, #0x18]
        str     r12, [sp, #4]
        str     lr, [sp, #0x54]
        str     r2, [sp, #0x58]
        str     r1, [sp, #0x5C]
LCPD0:
        ldr     r1, [sp, #0x4C]
        ldr     r2, [sp, #0x50]
        cmp     r1, #0
        ldr     r1, [sp, #0x58]
        add     r7, r0, r2, lsl #4
        add     r2, r3, r2, lsl #4
        add     r9, r0, r1, lsl #4
        add     r8, r0, r1, lsl #5
        add     r6, r0, r1, lsl #6
        add     r11, r3, r1, lsl #4
        add     r10, r3, r1, lsl #5
        add     r1, r3, r1, lsl #6
        ble     LCPD2
        sub     r5, r10, #4
        sub     r10, r10, #0xC
        str     r10, [sp, #0x84]
        sub     r10, r11, #4
        str     r10, [sp, #0x60]
        sub     r10, r11, #0xC
        sub     r11, r3, #4
        str     r11, [sp, #0x74]
        sub     r11, r3, #0xC
        str     r11, [sp, #0x70]
        sub     r11, r0, #4
        str     r11, [sp, #0x6C]
        sub     r11, r0, #0xC
        str     r11, [sp, #0x68]
        sub     r11, r6, #4
        str     r11, [sp, #0x64]
        sub     r11, r7, #4
        str     r11, [sp, #0x78]
        sub     r11, r8, #4
        str     r11, [sp, #0x7C]
        sub     lr, r1, #4
        sub     r4, r2, #4
        sub     r11, r9, #4
        mov     r12, #0
        sub     r1, r1, #0xC
        sub     r2, r2, #0xC
        sub     r6, r6, #0xC
        sub     r7, r7, #0xC
        sub     r8, r8, #0xC
        sub     r9, r9, #0xC
        str     r11, [sp, #0x80]
        str     r9, [sp, #0x2C]
        str     r8, [sp, #0x28]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x20]
        str     r10, [sp, #0x1C]
        str     r5, [sp, #0x3C]
        str     r2, [sp, #0x38]
        str     r4, [sp, #0x34]
        str     r1, [sp, #0x30]
        str     lr, [sp, #0x40]
        str     r12, [sp]
        str     r3, [sp, #0x48]
        str     r0, [sp, #0x44]
LCPD1:
        ldr     r12, [sp, #4]
        ldr     r1, [sp, #0x2C]
        ldr     r9, [r12]
        ldr     r8, [r12, #4]
        ldr     r11, [r12, #8]
        ldr     r6, [r12, #0xC]
        ldr     r12, [sp, #0x80]
        ldr     r10, [r1, #0xC]
        ldr     r5, [r1, #0x10]
        ldr     r7, [r12, #0xC]
        ldr     r4, [r12, #0x10]
        mov     r3, r8
        mov     r2, r9
        mov     r0, r10
        mov     r1, r5
        bl      __muldf3
        str     r0, [sp, #0x98]
        str     r1, [sp, #0x9C]
        mov     r0, r7
        mov     r1, r4
        mov     r3, r6
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x98]
        mov     r3, r1
        ldr     r1, [sp, #0x9C]
        bl      __subdf3
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0x98]
        mov     r0, r7
        mov     r3, r8
        mov     r2, r9
        mov     r1, r4
        bl      __muldf3
        mov     r4, r1
        mov     r7, r0
        mov     r0, r10
        mov     r1, r5
        mov     r3, r6
        mov     r2, r11
        bl      __muldf3
        mov     r3, r4
        mov     r2, r7
        bl      __adddf3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x28]
        ldr     r9, [r3, #0x10]
        ldr     r4, [r3, #0x14]
        ldr     r11, [r12, #0xC]
        ldr     r7, [r12, #0x10]
        ldr     r12, [sp, #4]
        mov     r2, r9
        mov     r3, r4
        ldr     r10, [r12, #0x18]
        ldr     r6, [r12, #0x1C]
        ldr     r12, [sp, #0x7C]
        ldr     r5, [r12, #0x10]
        ldr     r8, [r12, #0xC]
        str     r1, [sp, #0xA4]
        str     r0, [sp, #0xA0]
        mov     r1, r7
        mov     r0, r11
        bl      __muldf3
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xAC]
        mov     r0, r8
        mov     r2, r10
        mov     r3, r6
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xA8]
        mov     r3, r1
        ldr     r1, [sp, #0xAC]
        bl      __subdf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        mov     r3, r4
        mov     r2, r9
        mov     r0, r8
        mov     r1, r5
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, r10
        mov     r3, r6
        mov     r0, r11
        mov     r1, r7
        bl      __muldf3
        mov     r3, r4
        mov     r2, r5
        bl      __adddf3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #0x24]
        ldr     r6, [r12, #0x2C]
        ldr     r7, [r12, #0x20]
        ldr     r8, [r12, #0x24]
        ldr     r10, [r12, #0x28]
        ldr     r12, [sp, #0x78]
        ldr     r11, [r2, #0xC]
        ldr     r5, [r2, #0x10]
        ldr     r4, [r12, #0x10]
        ldr     r9, [r12, #0xC]
        str     r1, [sp, #0xB4]
        str     r0, [sp, #0xB0]
        mov     r1, r5
        mov     r2, r7
        mov     r0, r11
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xBC]
        mov     r3, r6
        mov     r1, r4
        mov     r2, r10
        mov     r0, r9
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        ldr     r1, [sp, #0xBC]
        ldr     r0, [sp, #0xB8]
        bl      __subdf3
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r0, r9
        mov     r2, r7
        mov     r3, r8
        mov     r1, r4
        bl      __muldf3
        mov     r7, r0
        mov     r4, r1
        mov     r1, r5
        mov     r2, r10
        mov     r0, r11
        mov     r3, r6
        bl      __muldf3
        mov     r3, r4
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x64]
        ldr     r11, [r2, #0xC]
        ldr     r6, [r2, #0x10]
        ldr     r9, [r3, #0x30]
        ldr     r8, [r3, #0x34]
        ldr     lr, [r12, #0xC]
        mov     r2, r9
        str     lr, [sp, #0xC0]
        ldr     r7, [r12, #0x10]
        ldr     r12, [sp, #4]
        mov     r3, r8
        ldr     r5, [r12, #0x3C]
        ldr     r10, [r12, #0x38]
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC8]
        mov     r0, r11
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xC0]
        mov     r4, r1
        mov     r1, r7
        mov     r3, r5
        mov     r2, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xCC]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0xC0]
        str     r1, [sp, #0xCC]
        mov     r1, r7
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        mov     r0, r11
        mov     r1, r6
        mov     r3, r5
        mov     r2, r10
        bl      __muldf3
        mov     r3, r8
        mov     r2, r7
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [sp, #0x9C]
        ldr     r3, [sp, #0xCC]
        mov     r5, r1
        ldr     r1, [sp, #0x98]
        mov     r2, r4
        bl      __adddf3
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0xA0]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0xA4]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0xCC]
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0x9C]
        str     r1, [sp, #0xD8]
        ldr     r1, [sp, #0x98]
        mov     r2, r4
        bl      __subdf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xA0]
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #0xA4]
        mov     r2, r6
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [sp, #0xB8]
        ldr     r2, [sp, #0xBC]
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xA0]
        ldr     r1, [sp, #0xA8]
        bl      __adddf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC8]
        mov     r4, r0
        ldr     r0, [sp, #0xB0]
        mov     r5, r1
        ldr     r1, [sp, #0xB4]
        bl      __adddf3
        ldr     r3, [sp, #0xB8]
        ldr     r2, [sp, #0xBC]
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0xA8]
        bl      __subdf3
        ldr     r3, [sp, #0xC8]
        ldr     r2, [sp, #0xC4]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0xB0]
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0xB4]
        bl      __subdf3
        ldr     lr, [sp, #0x44]
        ldr     r12, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x8C]
        ldr     r7, [lr, +r12, lsl #3]
        ldr     r12, [sp, #0x68]
        ldr     r6, [r12, #0x10]
        str     r0, [sp, #0xC8]
        str     r1, [sp, #0xC4]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xD0]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #8]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x8C]
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        ldr     r0, [sp, #0xD4]
        ldr     r1, [sp, #0xD8]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r9, r1
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #8]
        ldr     r1, [sp, #0xDC]
        mov     r8, r0
        ldr     r0, [sp, #0x98]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xA0]
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xA4]
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r8, r0
        ldr     r0, [sp, #0xC8]
        mov     r9, r1
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        mov     r3, r9
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0x9C]
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0xBC]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r9, r1
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0xE8]
        str     r1, [sp, #0xEC]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xD0]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x8C]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r0, [sp, #0xD4]
        ldr     r1, [sp, #0xD8]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x8C]
        mov     r10, r0
        ldr     r0, [sp, #0x98]
        mov     r11, r1
        ldr     r1, [sp, #0xDC]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r1, [sp, #0xA0]
        ldr     r0, [sp, #0xA4]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0xC8]
        str     r1, [sp, #0xA0]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xA0]
        mov     r2, r0
        ldr     r0, [sp, #0xA4]
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0x9C]
        bl      __muldf3
        str     r1, [sp, #0xA4]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xBC]
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xA4]
        mov     r2, r0
        ldr     r0, [sp, #0xCC]
        bl      __subdf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xD0]
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xBC]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp]
        str     r0, [r3, +r2, lsl #3]
        ldr     r2, [sp, #0x70]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0xD8]
        ldr     r0, [r2, #0xC]
        ldr     r1, [r2, #0x10]
        ldr     r2, [sp, #0xD4]
        bl      __adddf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0x74]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0x1C]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xEC]
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x84]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xBC]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xBC]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xEC]
        bl      __subdf3
        ldr     r2, [sp]
        add     r2, r2, #2
        str     r2, [sp]
        ldr     r2, [sp, #0x40]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r1, [sp]
        ldr     r0, [sp, #0x4C]
        cmp     r1, r0
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x84]
        add     r0, r0, #0x10
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #0x10
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x10
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x10
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x7C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x80]
        add     r0, r0, #0x10
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        blt     LCPD1
        ldr     r3, [sp, #0x48]
        ldr     r0, [sp, #0x44]
LCPD2:
        ldr     r1, [sp, #0x5C]
        ldr     r2, [sp, #0x54]
        add     r1, r1, #1
        str     r1, [sp, #0x5C]
        cmp     r1, r2
        ldr     r1, [sp, #4]
        add     r1, r1, #0x40
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x90]
        add     r0, r0, r1, lsl #4
        add     r3, r3, r1, lsl #4
        blt     LCPD0
LCPD3:
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000003
        .long   LCPD_C_1_5
        .long   LCPD_C_2_5
        .long   LCPD_S_1_5
        .long   LCPD_S_2_5
LCPD4:
        add     r2, lr, lr, lsl #3
        add     r2, lr, r2
        cmp     r2, #0
        ble     LCPD3
        ldr     r7, [pc, #-0x28]
        ldr     r5, [pc, #-0x28]
        ldr     r4, [pc, #-0x28]
        ldr     r6, [r7]
        ldr     lr, [pc, #-0x2C]
        sub     r11, r0, #0x44
        sub     r10, r0, #0x4C
        str     r6, [sp, #0x3C]
        ldr     r7, [r7, #4]
        sub     r9, r0, #4
        sub     r8, r0, #0xC
        str     r7, [sp, #0x70]
        ldr     r6, [r5]
        sub     r7, r0, #0x14
        str     r6, [sp, #0x74]
        ldr     r5, [r5, #4]
        sub     r6, r0, #0x1C
        str     r5, [sp, #0x60]
        ldr     r5, [r4]
        str     r5, [sp, #0x64]
        ldr     r4, [r4, #4]
        sub     r5, r0, #0x24
        str     r4, [sp, #0x4C]
        ldr     r4, [lr]
        str     r4, [sp, #0x40]
        ldr     lr, [lr, #4]
        sub     r4, r0, #0x2C
        str     r4, [sp, #0x8C]
        str     lr, [sp, #0x58]
        sub     lr, r3, #4
        str     lr, [sp, #0x68]
        sub     lr, r3, #0xC
        str     lr, [sp, #0x6C]
        sub     lr, r3, #0x14
        str     lr, [sp, #0x50]
        sub     lr, r3, #0x1C
        str     lr, [sp, #0x38]
        sub     lr, r3, #0x24
        str     lr, [sp, #0x54]
        sub     lr, r3, #0x2C
        str     lr, [sp, #0x78]
        sub     lr, r3, #0x34
        str     lr, [sp, #0x7C]
        sub     lr, r3, #0x3C
        str     lr, [sp, #0x80]
        sub     lr, r3, #0x44
        str     lr, [sp, #0x84]
        sub     lr, r0, #0x34
        sub     r3, r3, #0x4C
        sub     r0, r0, #0x3C
        str     r0, [sp, #0x44]
        str     lr, [sp, #0x90]
        str     r5, [sp, #0x88]
        str     r6, [sp, #0x48]
        str     r7, [sp, #0x34]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x2C]
        str     r10, [sp, #0x28]
        str     r11, [sp, #0x20]
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x94]
        str     r12, [sp, #4]
        str     r1, [sp, #0x5C]
LCPD5:
        ldr     r12, [sp, #0x90]
        ldr     r1, [sp, #0x44]
        ldr     r3, [sp, #4]
        ldr     r8, [r12, #0x4C]
        ldr     r5, [r12, #0x50]
        ldr     r11, [r1, #0x4C]
        ldr     r4, [r3, #4]
        ldr     r12, [sp, #4]
        ldr     r7, [r1, #0x50]
        ldr     r9, [r3]
        mov     r0, r11
        ldr     r10, [r12, #8]
        ldr     r6, [r12, #0xC]
        mov     r3, r4
        mov     r2, r9
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0xEC]
        str     r1, [sp, #0xE8]
        mov     r1, r5
        mov     r0, r8
        mov     r3, r6
        mov     r2, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0xEC]
        ldr     r1, [sp, #0xE8]
        bl      __subdf3
        str     r0, [sp, #0xEC]
        str     r1, [sp, #0xE8]
        mov     r2, r9
        mov     r1, r5
        mov     r3, r4
        mov     r0, r8
        bl      __muldf3
        mov     r5, r1
        mov     r4, r0
        mov     r2, r10
        mov     r1, r7
        mov     r0, r11
        mov     r3, r6
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #0x8C]
        ldr     r8, [r12, #0x14]
        ldr     r7, [r12, #0x10]
        ldr     r6, [r2, #0x50]
        ldr     r10, [r12, #0x18]
        ldr     r5, [r12, #0x1C]
        ldr     r12, [sp, #0x88]
        ldr     r11, [r2, #0x4C]
        mov     r2, r7
        ldr     r9, [r12, #0x4C]
        ldr     r4, [r12, #0x50]
        str     r0, [sp, #0xE4]
        str     r1, [sp, #0xE0]
        mov     r1, r6
        mov     r0, r11
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0xDC]
        str     r1, [sp, #0xD8]
        mov     r2, r10
        mov     r0, r9
        mov     r1, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xDC]
        mov     r3, r1
        ldr     r1, [sp, #0xD8]
        bl      __subdf3
        str     r0, [sp, #0xDC]
        str     r1, [sp, #0xD8]
        mov     r0, r9
        mov     r1, r4
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r4, r0
        mov     r7, r1
        mov     r3, r5
        mov     r0, r11
        mov     r2, r10
        mov     r1, r6
        bl      __muldf3
        mov     r3, r7
        mov     r2, r4
        bl      __adddf3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x34]
        ldr     r2, [sp, #0x48]
        ldr     r9, [r3, #0x20]
        ldr     r4, [r3, #0x24]
        ldr     r5, [r12, #0x50]
        ldr     r8, [r12, #0x4C]
        ldr     r12, [sp, #4]
        ldr     r10, [r2, #0x4C]
        ldr     r7, [r2, #0x50]
        ldr     r6, [r12, #0x2C]
        ldr     r11, [r12, #0x28]
        str     r0, [sp, #0xD4]
        str     r1, [sp, #0xD0]
        mov     r1, r7
        mov     r0, r10
        mov     r3, r4
        mov     r2, r9
        bl      __muldf3
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        mov     r1, r5
        mov     r0, r8
        mov     r3, r6
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xCC]
        mov     r3, r1
        ldr     r1, [sp, #0xC8]
        bl      __subdf3
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        mov     r3, r4
        mov     r2, r9
        mov     r1, r5
        mov     r0, r8
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r1, r7
        mov     r0, r10
        mov     r3, r6
        mov     r2, r11
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x2C]
        ldr     r11, [r2, #0x4C]
        ldr     r8, [r2, #0x50]
        ldr     r2, [r3, #0x30]
        str     r2, [sp, #0xC4]
        ldr     r2, [r3, #0x34]
        str     r2, [sp, #0xC0]
        ldr     r10, [r3, #0x38]
        ldr     r7, [r3, #0x3C]
        ldr     r9, [r12, #0x4C]
        ldr     r6, [r12, #0x50]
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r0, r11
        mov     r1, r8
        bl      __muldf3
        str     r0, [sp, #0xB4]
        mov     r4, r1
        mov     r3, r7
        mov     r2, r10
        mov     r1, r6
        mov     r0, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xB4]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        mov     r4, r1
        mov     r5, r0
        mov     r1, r6
        mov     r0, r9
        bl      __muldf3
        mov     r6, r0
        mov     r9, r1
        mov     r2, r10
        mov     r0, r11
        mov     r3, r7
        mov     r1, r8
        bl      __muldf3
        mov     r3, r9
        mov     r2, r6
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [sp, #0xEC]
        mov     r7, r1
        ldr     r1, [sp, #0xE8]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0xE0]
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0xE4]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xEC]
        str     r1, [sp, #0xB0]
        ldr     r1, [sp, #0xE8]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [sp, #0xEC]
        ldr     r0, [sp, #0xE4]
        str     r1, [sp, #0xE8]
        ldr     r1, [sp, #0xE0]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        str     r1, [sp, #0xE0]
        ldr     r1, [sp, #0xD8]
        str     r0, [sp, #0xE4]
        ldr     r0, [sp, #0xDC]
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        bl      __adddf3
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        mov     r4, r0
        ldr     r0, [sp, #0xD4]
        mov     r5, r1
        ldr     r1, [sp, #0xD0]
        bl      __adddf3
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xC8]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xDC]
        mov     r6, r1
        ldr     r1, [sp, #0xD8]
        bl      __subdf3
        ldr     r2, [sp, #0xBC]
        str     r0, [sp, #0xDC]
        ldr     r0, [sp, #0xD4]
        str     r1, [sp, #0xD8]
        ldr     r1, [sp, #0xD0]
        ldr     r3, [sp, #0xB8]
        bl      __subdf3
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x70]
        ldr     r8, [r12, #0x4C]
        ldr     r7, [r12, #0x50]
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0xC4]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0xC0]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x60]
        mov     r10, r1
        mov     r9, r0
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x70]
        ldr     r10, [r12, #0x4C]
        ldr     r9, [r12, #0x50]
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0xAC]
        mov     r11, r1
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0xBC]
        mov     r3, r11
        bl      __adddf3
        str     r0, [sp, #0xBC]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x4C]
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0xE0]
        ldr     r0, [sp, #0xE4]
        bl      __muldf3
        str     r1, [sp, #0xA8]
        mov     r11, r0
        ldr     r0, [sp, #0xD4]
        ldr     r1, [sp, #0xD0]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        ldr     r3, [sp, #0xA8]
        mov     r2, r11
        bl      __adddf3
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xEC]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x4C]
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0xE8]
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x58]
        str     r1, [sp, #0xA0]
        ldr     r1, [sp, #0xD8]
        mov     r11, r0
        ldr     r0, [sp, #0xDC]
        bl      __muldf3
        ldr     r3, [sp, #0xA0]
        mov     r2, r11
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0xC4]
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #0xC0]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x70]
        mov     r11, r0
        str     r1, [sp, #0x98]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r3, [sp, #0x98]
        mov     r2, r11
        bl      __adddf3
        str     r0, [sp, #0x98]
        str     r1, [sp, #0x1C]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x60]
        bl      __muldf3
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x70]
        mov     r9, r0
        ldr     r0, [sp, #0xAC]
        mov     r10, r1
        mov     r1, r6
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0x18]
        mov     r9, r1
        ldr     r1, [sp, #0xE0]
        ldr     r0, [sp, #0xE4]
        bl      __muldf3
        str     r0, [sp, #0xE4]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x4C]
        ldr     r0, [sp, #0xD4]
        mov     r10, r1
        ldr     r1, [sp, #0xD0]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xE4]
        mov     r3, r1
        mov     r1, r10
        bl      __subdf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0xE4]
        mov     r10, r1
        ldr     r0, [sp, #0xEC]
        ldr     r1, [sp, #0xE8]
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x4C]
        str     r0, [sp, #0xEC]
        str     r1, [sp, #0xE8]
        ldr     r0, [sp, #0xDC]
        ldr     r1, [sp, #0xD8]
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xE8]
        mov     r2, r0
        ldr     r0, [sp, #0xEC]
        bl      __subdf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        str     r0, [sp, #0xEC]
        mov     r11, r1
        mov     r0, r8
        mov     r1, r7
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        str     r0, [r2, #0x4C]
        ldr     r0, [sp, #0x24]
        str     r1, [r0, #0x50]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0xB0]
        ldr     r0, [r2, #0x4C]
        ldr     r1, [r2, #0x50]
        ldr     r2, [sp, #0xB4]
        bl      __adddf3
        ldr     r2, [sp, #0xAC]
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        str     r0, [r2, #0x4C]
        ldr     r0, [sp, #0x84]
        str     r1, [r0, #0x50]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xA4]
        bl      __subdf3
        ldr     r2, [sp, #0x80]
        str     r0, [r2, #0x4C]
        ldr     r0, [sp, #0x80]
        str     r1, [r0, #0x50]
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xB8]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x9C]
        bl      __adddf3
        ldr     r2, [sp, #0x7C]
        mov     r3, r10
        str     r0, [r2, #0x4C]
        str     r1, [r2, #0x50]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0xE4]
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        mov     r3, r11
        str     r0, [r2, #0x4C]
        str     r1, [r2, #0x50]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xEC]
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        mov     r3, r10
        str     r0, [r2, #0x4C]
        str     r1, [r2, #0x50]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0xE4]
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        mov     r3, r11
        str     r1, [r2, #0x50]
        str     r0, [r2, #0x4C]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xEC]
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x50]
        str     r0, [r2, #0x4C]
        str     r1, [r2, #0x50]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xA4]
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        str     r0, [r2, #0x4C]
        str     r1, [r2, #0x50]
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xB8]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x9C]
        bl      __subdf3
        ldr     r2, [sp, #0x5C]
        add     r2, r2, #0xA
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x68]
        str     r0, [r2, #0x4C]
        str     r1, [r2, #0x50]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x94]
        cmp     r0, r1
        ldr     r0, [sp, #4]
        add     r0, r0, #0x40
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x50
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x50
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x50
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x50
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x50
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x50
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x7C]
        add     r0, r0, #0x50
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x80]
        add     r0, r0, #0x50
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x84]
        add     r0, r0, #0x50
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x50
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x50
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x50
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x50
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x50
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x50
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x50
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x88]
        add     r0, r0, #0x50
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x8C]
        add     r0, r0, #0x50
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x90]
        add     r0, r0, #0x50
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x50
        str     r0, [sp, #0x44]
        blt     LCPD5
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LCPD_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCPD_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCPD_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCPD_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


