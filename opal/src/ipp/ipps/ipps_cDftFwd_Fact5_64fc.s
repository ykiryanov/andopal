        .text
        .align  4
        .globl  _ipps_cDftFwd_Fact5_64fc


_ipps_cDftFwd_Fact5_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xFC
        ldr     r12, [sp, #0x120]
        cmp     r3, #0
        str     r3, [sp, #4]
        str     r0, [sp]
        mov     r8, r1
        mov     r7, r2
        ble     LCPX3
        ldr     lr, [pc, #0xFB8]
        ldr     r3, [pc, #0xFB8]
        ldr     r0, [pc, #0xFB8]
        ldr     r4, [pc, #0xFB8]
        ldr     r9, [lr]
        ldr     r6, [r3]
        ldr     r5, [r0]
        ldr     r10, [r4]
        ldr     lr, [lr, #4]
        ldr     r3, [r3, #4]
        ldr     r0, [r0, #4]
        ldr     r4, [r4, #4]
        add     r11, r7, r7, lsl #2
        str     r11, [sp, #0x54]
        ldr     r11, [sp]
        add     r12, r12, #0x40
        rsb     r1, r7, r7, lsl #2
        mov     r2, r7, lsl #1
        str     r2, [sp, #0x58]
        str     r4, [sp, #0x88]
        str     r10, [sp, #0x84]
        str     r0, [sp, #0x98]
        str     r5, [sp, #0x94]
        str     r3, [sp, #0x7C]
        str     r6, [sp, #0x90]
        str     lr, [sp, #0x80]
        str     r9, [sp, #0x8C]
        str     r12, [sp, #0x50]
        str     r1, [sp, #0x4C]
LCPX0:
        ldr     r10, [r11, +r7, lsl #4]
        ldr     r2, [r11, +r7, lsl #6]
        add     r4, r11, r7, lsl #4
        str     r4, [sp, #0x24]
        ldr     r3, [sp, #0x4C]
        str     r2, [sp, #0x78]
        ldr     r1, [r4, #4]
        add     r9, r11, r3, lsl #4
        str     r9, [sp, #0x10]
        str     r1, [sp, #0x74]
        add     r5, r11, r7, lsl #6
        str     r5, [sp, #0x1C]
        ldr     r3, [r5, #4]
        str     r3, [sp, #0x70]
        mov     r0, r10
        add     r12, r8, r7, lsl #4
        str     r12, [sp, #8]
        bl      __adddf3
        ldr     r3, [r5, #8]
        str     r3, [sp, #0x6C]
        ldr     r6, [r4, #8]
        ldr     r4, [r4, #0xC]
        ldr     r5, [r5, #0xC]
        ldr     r2, [sp, #0x6C]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r1, r4
        mov     r0, r6
        mov     r3, r5
        bl      __adddf3
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x74]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x60]
        mov     r0, r10
        add     r10, r11, r7, lsl #5
        str     r10, [sp, #0x14]
        bl      __subdf3
        ldr     r2, [sp, #0x6C]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        add     r12, r8, r7, lsl #5
        str     r12, [sp, #0xC]
        mov     r1, r4
        mov     r0, r6
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [r11, +r7, lsl #5]
        str     r3, [sp, #0x70]
        ldr     r3, [r10, #4]
        str     r3, [sp, #0x6C]
        ldr     r3, [sp, #0x4C]
        ldr     r3, [r11, +r3, lsl #4]
        str     r3, [sp, #0x40]
        ldr     r5, [r9, #4]
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        mov     r3, r5
        bl      __adddf3
        ldr     r4, [r10, #8]
        ldr     r6, [r9, #8]
        ldr     r10, [r10, #0xC]
        ldr     r9, [r9, #0xC]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x30]
        mov     r3, r9
        mov     r2, r6
        mov     r0, r4
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x6C]
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        mov     r1, r10
        mov     r3, r9
        mov     r2, r6
        mov     r0, r4
        bl      __subdf3
        ldr     r3, [r11]
        ldr     r10, [sp, #0x8C]
        ldr     r9, [sp, #0x80]
        str     r3, [sp, #0x40]
        ldr     r3, [r11, #4]
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #0x64]
        str     r3, [sp, #0x20]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x68]
        mov     r3, r9
        mov     r2, r10
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        str     r0, [sp, #0xA0]
        mov     r4, r1
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        bl      __muldf3
        ldr     r2, [sp, #0xA0]
        mov     r5, r0
        ldr     r0, [sp, #0x40]
        mov     r6, r1
        ldr     r1, [sp, #0x20]
        mov     r3, r4
        bl      __adddf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        str     r0, [sp, #0xA0]
        str     r1, [sp, #0xA4]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x44]
        mov     r3, r9
        mov     r2, r10
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0x28]
        bl      __muldf3
        ldr     r12, [r11, #8]
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        mov     r5, r0
        str     r12, [sp, #0xB0]
        ldr     r12, [r11, #0xC]
        ldr     r0, [sp, #0xB0]
        mov     r4, r1
        str     r12, [sp, #0xB4]
        ldr     r1, [sp, #0xB4]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        ldr     r4, [sp, #0x98]
        ldr     r2, [sp, #0x94]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x38]
        mov     r3, r4
        bl      __muldf3
        ldr     r5, [sp, #0x84]
        ldr     r6, [sp, #0x88]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x18]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0x9C]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xBC]
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0x74]
        mov     r3, r4
        bl      __muldf3
        str     r1, [sp, #0xC4]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x6C]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0x30]
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        str     r0, [sp, #0xC8]
        str     r1, [sp, #0xCC]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        ldr     r3, [sp, #0x7C]
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x20]
        bl      __adddf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0x28]
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        mov     r9, r1
        ldr     r1, [sp, #0x44]
        bl      __muldf3
        ldr     r3, [sp, #0xB4]
        ldr     r2, [sp, #0xB0]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        str     r0, [sp, #0xB4]
        mov     r9, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x9C]
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0x3C]
        mov     r10, r1
        ldr     r1, [sp, #0x38]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0xB0]
        mov     r3, r10
        bl      __subdf3
        ldr     r2, [sp, #0x94]
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0x70]
        mov     r10, r1
        ldr     r1, [sp, #0x6C]
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x74]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x70]
        bl      __subdf3
        mov     r5, r0
        mov     r6, r1
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x30]
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x60]
        ldr     r0, [r11, #8]
        ldr     r1, [r11, #0xC]
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        bl      __adddf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        bl      __subdf3
        str     r0, [r8, +r7, lsl #4]
        ldr     r12, [sp, #8]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r3, r10
        str     r0, [r12, #8]
        ldr     r12, [sp, #8]
        str     r1, [r12, #0xC]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        ldr     r2, [sp, #0xB0]
        bl      __subdf3
        str     r0, [r8, +r7, lsl #5]
        ldr     r12, [sp, #0xC]
        mov     r2, r5
        str     r1, [r12, #4]
        ldr     r0, [sp, #0xB4]
        mov     r3, r6
        mov     r1, r9
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        str     r0, [r12, #8]
        str     r1, [r12, #0xC]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        ldr     r2, [sp, #0xB0]
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0x4C]
        mov     r2, r5
        str     r0, [r8, +r12, lsl #4]
        add     r4, r8, r12, lsl #4
        str     r1, [r4, #4]
        ldr     r0, [sp, #0xB4]
        mov     r1, r9
        mov     r3, r6
        bl      __subdf3
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        bl      __adddf3
        str     r0, [r8, +r7, lsl #6]
        add     r5, r8, r7, lsl #6
        str     r1, [r5, #4]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __subdf3
        ldr     r3, [sp, #0x58]
        add     r12, r11, #8
        cmp     r3, #2
        ldr     r3, [sp, #0x50]
        str     r3, [sp, #0x44]
        add     r3, r8, #8
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
        ble     LCPX2
        mov     r0, #2
        str     r0, [sp, #0x3C]
        add     r0, r5, #0xC
        str     r0, [sp, #0x40]
        add     r0, r4, #0xC
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x14]
        add     r5, r5, #4
        add     lr, r0, #0xC
        add     r0, r0, #4
        add     r4, r4, #4
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #8]
        str     r4, [sp, #0x2C]
        add     r4, r12, #4
        ldr     r12, [sp, #0x1C]
        str     lr, [sp, #0x30]
        str     r5, [sp, #0x34]
        add     lr, r0, #0xC
        add     r5, r1, #4
        add     r1, r1, #0xC
        str     lr, [sp, #0x28]
        add     r9, r12, #4
        add     lr, r12, #0xC
        ldr     r12, [sp, #0x10]
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x24]
        add     r0, r0, #4
        str     r0, [sp, #0x18]
        add     r0, r3, #4
        add     r6, r12, #4
        add     r2, r1, #4
        add     r3, r8, #4
        add     r10, r11, #4
        add     r12, r12, #0xC
        add     r1, r1, #0xC
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x24]
        str     r5, [sp, #0x1C]
        str     r12, [sp, #0x10]
        str     r6, [sp, #0x68]
        str     lr, [sp, #0x6C]
        str     r9, [sp, #0x70]
        str     r10, [sp, #0x60]
        str     r4, [sp, #0x78]
        str     r3, [sp, #0x64]
        str     r0, [sp, #0x74]
        str     r7, [sp, #0x48]
        str     r8, [sp, #0x5C]
        str     r11, [sp]
LCPX1:
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0xC]
        ldr     r12, [sp, #0x44]
        ldr     r9, [r1, #0xC]
        ldr     r11, [r3, #0xC]
        ldr     r5, [r1, #0x10]
        ldr     r4, [r2]
        ldr     r7, [r3, #0x10]
        ldr     r8, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r6, [r12, #0xC]
        mov     r0, r11
        mov     r2, r4
        mov     r1, r7
        mov     r3, r8
        bl      __muldf3
        str     r1, [sp, #0xC8]
        str     r0, [sp, #0xCC]
        mov     r3, r6
        mov     r1, r5
        mov     r2, r10
        mov     r0, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xC8]
        mov     r2, r0
        ldr     r0, [sp, #0xCC]
        bl      __subdf3
        str     r0, [sp, #0xCC]
        str     r1, [sp, #0xC8]
        mov     r1, r5
        mov     r3, r8
        mov     r0, r9
        mov     r2, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r7
        mov     r3, r6
        mov     r2, r10
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r12, [sp, #0x44]
        ldr     r10, [r2, #0xC]
        ldr     r5, [r2, #0x10]
        ldr     r11, [r12, #0x18]
        ldr     r7, [r12, #0x10]
        ldr     r8, [r12, #0x14]
        ldr     r6, [r12, #0x1C]
        ldr     r12, [sp, #8]
        mov     r2, r7
        mov     r3, r8
        ldr     r4, [r12, #0x10]
        ldr     r9, [r12, #0xC]
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        mov     r0, r10
        mov     r1, r5
        bl      __muldf3
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r1, r4
        mov     r2, r11
        mov     r3, r6
        mov     r0, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xBC]
        mov     r3, r1
        ldr     r1, [sp, #0xB8]
        bl      __subdf3
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r2, r7
        mov     r0, r9
        mov     r3, r8
        mov     r1, r4
        bl      __muldf3
        mov     r4, r0
        mov     r7, r1
        mov     r2, r11
        mov     r3, r6
        mov     r0, r10
        mov     r1, r5
        bl      __muldf3
        mov     r3, r7
        mov     r2, r4
        bl      __adddf3
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x68]
        ldr     r12, [sp, #0x10]
        ldr     r9, [r3, #0x20]
        ldr     r4, [r3, #0x24]
        ldr     r8, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        ldr     r11, [r2, #0xC]
        ldr     r6, [r2, #0x10]
        ldr     r12, [sp, #0x44]
        mov     r2, r9
        ldr     r7, [r12, #0x2C]
        ldr     r10, [r12, #0x28]
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        mov     r0, r11
        mov     r1, r6
        mov     r3, r4
        bl      __muldf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        mov     r2, r10
        mov     r1, r5
        mov     r0, r8
        mov     r3, r7
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xAC]
        mov     r3, r1
        ldr     r1, [sp, #0xA8]
        bl      __subdf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        mov     r3, r4
        mov     r1, r5
        mov     r0, r8
        mov     r2, r9
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r3, r7
        mov     r0, r11
        mov     r1, r6
        mov     r2, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x44]
        ldr     r12, [sp, #0x6C]
        ldr     r11, [r2, #0xC]
        ldr     r9, [r2, #0x10]
        ldr     r2, [r3, #0x30]
        str     r2, [sp, #0xA4]
        ldr     r2, [r12, #0xC]
        ldr     r7, [r3, #0x34]
        str     r2, [sp, #0xA0]
        ldr     r6, [r12, #0x10]
        ldr     r12, [sp, #0x44]
        ldr     r2, [sp, #0xA4]
        mov     r3, r7
        ldr     r10, [r12, #0x38]
        ldr     r8, [r12, #0x3C]
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0x14]
        mov     r0, r11
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0xA0]
        mov     r4, r1
        mov     r2, r10
        mov     r3, r8
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xD0]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0xA4]
        mov     r5, r1
        mov     r1, r6
        mov     r3, r7
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r1, r9
        mov     r0, r11
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r7, r1
        ldr     r1, [sp, #0xC8]
        mov     r6, r0
        ldr     r0, [sp, #0xCC]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0xC4]
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0xC0]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0xA0]
        str     r1, [sp, #0xD4]
        ldr     r1, [sp, #0xC8]
        ldr     r0, [sp, #0xCC]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xC4]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0xC0]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0xB8]
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0xBC]
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x9C]
        mov     r5, r0
        ldr     r0, [sp, #0xB4]
        mov     r4, r1
        ldr     r1, [sp, #0xB0]
        bl      __adddf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0xBC]
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0xB8]
        bl      __subdf3
        ldr     r2, [sp, #0x9C]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r3, [sp, #0x14]
        bl      __subdf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x80]
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xD0]
        str     r1, [sp, #0xB0]
        ldr     r1, [sp, #0xA4]
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        ldr     r12, [sp]
        ldr     lr, [sp, #0x3C]
        ldr     r7, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x60]
        mov     r2, r8
        ldr     r6, [r12, #0x10]
        mov     r3, r9
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x80]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xA0]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xD4]
        bl      __muldf3
        mov     r11, r1
        mov     r8, r0
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xDC]
        bl      __muldf3
        ldr     r12, [sp, #0x78]
        mov     r3, r11
        ldr     r10, [r12, #0xC]
        ldr     r9, [r12, #0x10]
        mov     r2, r8
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0xC4]
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0xC0]
        bl      __muldf3
        mov     r11, r1
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x88]
        ldr     r1, [sp, #0xB0]
        mov     r8, r0
        ldr     r0, [sp, #0xB4]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0xC8]
        bl      __muldf3
        mov     r8, r0
        mov     r11, r1
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x88]
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x80]
        str     r0, [sp, #0xE8]
        str     r1, [sp, #0xEC]
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        mov     r8, r0
        ldr     r0, [sp, #0xD0]
        mov     r11, r1
        ldr     r1, [sp, #0xA4]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r8
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x80]
        str     r1, [sp, #0xF0]
        ldr     r1, [sp, #0xDC]
        mov     r8, r0
        ldr     r0, [sp, #0xD8]
        bl      __muldf3
        str     r0, [sp, #0xF4]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x7C]
        mov     r11, r1
        ldr     r1, [sp, #0xD4]
        bl      __muldf3
        ldr     r2, [sp, #0xF4]
        mov     r3, r11
        bl      __adddf3
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r0, [sp, #0xF4]
        ldr     r0, [sp, #0xB4]
        str     r1, [sp, #0xF8]
        ldr     r1, [sp, #0xB0]
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x88]
        mov     r9, r0
        ldr     r0, [sp, #0xC4]
        mov     r10, r1
        ldr     r1, [sp, #0xC0]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __subdf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        mov     r11, r0
        ldr     r0, [sp, #0xBC]
        mov     r10, r1
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0xCC]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0xC8]
        bl      __muldf3
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC0]
        bl      __subdf3
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0xA4]
        mov     r9, r0
        ldr     r0, [sp, #0xD0]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x3C]
        str     r0, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x64]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [sp, #0xD8]
        ldr     r3, [sp, #0xDC]
        bl      __adddf3
        ldr     r12, [sp, #0x78]
        ldr     r2, [r12, #0xC]
        ldr     r3, [r12, #0x10]
        bl      __adddf3
        ldr     r12, [sp, #0x74]
        str     r0, [r12, #0xC]
        ldr     r12, [sp, #0x74]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        bl      __subdf3
        ldr     r12, [sp, #0x18]
        str     r0, [r12, #0xC]
        ldr     r12, [sp, #0x18]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xEC]
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        mov     r2, r11
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r1, [sp, #0xF0]
        mov     r0, r8
        mov     r3, r10
        bl      __subdf3
        ldr     r12, [sp, #0x20]
        mov     r2, r9
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0xF4]
        ldr     r1, [sp, #0xF8]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        mov     r2, r11
        str     r1, [r12, #0x10]
        str     r0, [r12, #0xC]
        ldr     r1, [sp, #0xF0]
        mov     r0, r8
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [sp, #0x2C]
        mov     r2, r9
        str     r0, [r3, #0xC]
        str     r1, [r3, #0x10]
        ldr     r0, [sp, #0xF4]
        ldr     r1, [sp, #0xF8]
        ldr     r3, [sp, #0xCC]
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0xA8]
        ldr     r2, [sp, #0xE0]
        ldr     r3, [sp, #0xE4]
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xEC]
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        add     r2, r2, #2
        str     r2, [sp, #0x3C]
        ldr     r2, [sp, #0x40]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x58]
        cmp     r0, r1
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x40
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #0x10
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x10
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x10
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        blt     LCPX1
        ldr     r7, [sp, #0x48]
        ldr     r8, [sp, #0x5C]
        ldr     r11, [sp]
LCPX2:
        ldr     r0, [sp, #4]
        ldr     r3, [sp, #0x54]
        subs    r0, r0, #1
        str     r0, [sp, #4]
        add     r11, r11, r3, lsl #4
        add     r8, r8, r3, lsl #4
        bne     LCPX0
LCPX3:
        add     sp, sp, #0xFC
        ldmia   sp!, {r4 - r11, pc}
        .long   LCPX_C_1_5
        .long   LCPX_C_2_5
        .long   LCPX_S_1_5
        .long   LCPX_S_2_5


        .data
        .align  4


LCPX_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCPX_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCPX_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCPX_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


