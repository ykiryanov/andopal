        .text
        .align  4
        .globl  _ipps_crDftFwd_Fact5_64f


_ipps_crDftFwd_Fact5_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        mov     r8, r0
        ldr     r12, [sp, #0xFC]
        mov     r5, r3
        mov     r7, r1
        mov     r6, r2
        add     r11, r8, r5, lsl #4
        str     r11, [sp, #0x30]
        ldr     lr, [r8, +r5, lsl #4]
        add     r9, r8, r5, lsl #5
        add     r12, r12, #0x40
        str     lr, [sp, #0x60]
        ldr     lr, [r11, #4]
        ldr     r0, [sp, #0x60]
        str     lr, [sp, #0x58]
        ldr     lr, [r8, +r5, lsl #6]
        ldr     r1, [sp, #0x58]
        str     lr, [sp, #0x54]
        add     lr, r8, r5, lsl #6
        str     lr, [sp, #0x40]
        ldr     lr, [lr, #4]
        str     r12, [sp, #0x5C]
        ldr     r2, [sp, #0x54]
        str     lr, [sp, #0x50]
        ldr     r3, [sp, #0x50]
        add     r12, r6, r5, lsl #3
        str     r12, [sp, #0x48]
        rsb     r12, r5, r5, lsl #2
        str     r12, [sp, #0x64]
        add     r10, r8, r12, lsl #4
        str     r10, [sp, #0x24]
        add     r12, r7, r5, lsl #3
        str     r12, [sp, #0x4C]
        str     r9, [sp, #0x20]
        add     r12, r7, r5, lsl #4
        str     r12, [sp, #0x44]
        bl      __adddf3
        ldr     r4, [r11, #8]
        ldr     r12, [sp, #0x40]
        ldr     r11, [r11, #0xC]
        ldr     lr, [r12, #8]
        str     lr, [sp, #0x3C]
        ldr     r12, [r12, #0xC]
        str     r0, [sp, #0x68]
        ldr     r2, [sp, #0x3C]
        str     r1, [sp, #0x6C]
        str     r12, [sp, #0x38]
        ldr     r3, [sp, #0x38]
        mov     r1, r11
        mov     r0, r4
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x74]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x58]
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x58]
        mov     r1, r11
        add     r12, r6, r5, lsl #4
        str     r12, [sp, #0x3C]
        mov     r0, r4
        bl      __subdf3
        ldr     r12, [sp, #0x64]
        ldr     r12, [r8, +r12, lsl #4]
        str     r12, [sp, #0x54]
        ldr     r12, [r10, #4]
        ldr     r2, [sp, #0x54]
        str     r12, [sp, #0x50]
        ldr     r12, [r8, +r5, lsl #5]
        ldr     r3, [sp, #0x50]
        str     r12, [sp, #0x38]
        ldr     r12, [r9, #4]
        str     r1, [sp, #0x7C]
        str     r0, [sp, #0x78]
        str     r12, [sp, #0x34]
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        bl      __adddf3
        ldr     r4, [r10, #8]
        ldr     r11, [r9, #8]
        ldr     r9, [r9, #0xC]
        ldr     r10, [r10, #0xC]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x84]
        mov     r2, r4
        mov     r0, r11
        mov     r1, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0x34]
        bl      __subdf3
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x50]
        mov     r3, r10
        mov     r2, r4
        mov     r0, r11
        mov     r1, r9
        bl      __subdf3
        ldr     r12, [pc, #0xD90]
        ldr     lr, [r8]
        str     lr, [sp, #0x90]
        ldr     lr, [r8, #4]
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x68]
        str     lr, [sp, #0x94]
        ldr     r11, [r12]
        str     r11, [sp, #0xC]
        ldr     r9, [r12, #4]
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #0x6C]
        str     r9, [sp]
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        ldr     lr, [sp, #0x64]
        ldr     r12, [pc, #0xD50]
        add     r4, r7, lr, lsl #3
        add     lr, r6, lr, lsl #3
        str     lr, [sp, #0x34]
        str     r4, [sp, #0x38]
        add     lr, r7, r5, lsl #5
        str     lr, [sp, #0x28]
        ldr     lr, [r12]
        str     lr, [sp, #4]
        ldr     r12, [r12, #4]
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x1C]
        str     r12, [sp, #0x14]
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x84]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x90]
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x2C]
        mov     r4, r1
        ldr     r1, [sp, #0x94]
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0x74]
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x8C]
        bl      __muldf3
        ldr     r12, [r8, #8]
        ldr     r3, [sp, #0x1C]
        ldr     r2, [sp, #0x2C]
        str     r12, [sp, #0xA8]
        ldr     r12, [r8, #0xC]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0xA8]
        str     r12, [sp, #0xAC]
        mov     r4, r1
        ldr     r1, [sp, #0xAC]
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [pc, #0xC74]
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0xB4]
        ldr     lr, [r12]
        ldr     r1, [sp, #0x7C]
        str     lr, [sp, #0x10]
        ldr     r12, [r12, #4]
        ldr     r2, [sp, #0x10]
        str     r12, [sp, #0x18]
        ldr     r3, [sp, #0x18]
        add     r12, r6, r5, lsl #5
        str     r12, [sp, #0x2C]
        bl      __muldf3
        ldr     r12, [pc, #0xC40]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x98]
        str     r1, [sp, #0xBC]
        ldr     r10, [r12]
        ldr     r1, [sp, #0x9C]
        str     r10, [sp, #8]
        ldr     r4, [r12, #4]
        mov     r2, r10
        str     r4, [sp, #0x1C]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xBC]
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0x58]
        bl      __muldf3
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0x50]
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0xC8]
        bl      __adddf3
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0x84]
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        str     r0, [sp, #0xC0]
        str     r1, [sp, #0xCC]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x6C]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x94]
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0xD0]
        bl      __adddf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xCC]
        bl      __adddf3
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0x8C]
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0xD4]
        ldr     r1, [sp, #0x74]
        bl      __muldf3
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xAC]
        bl      __adddf3
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0x98]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0x9C]
        bl      __muldf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x7C]
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        bl      __subdf3
        str     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        bl      __muldf3
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x58]
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __subdf3
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0x98]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        ldr     r2, [sp, #0x80]
        ldr     r3, [sp, #0x84]
        bl      __adddf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r0, [r8, #8]
        ldr     r1, [r8, #0xC]
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x74]
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x8C]
        bl      __adddf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xA4]
        bl      __subdf3
        str     r0, [r7, +r5, lsl #3]
        ldr     r12, [sp, #0x4C]
        str     r1, [r12, #4]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xB4]
        bl      __adddf3
        str     r0, [r6, +r5, lsl #3]
        ldr     r12, [sp, #0x48]
        str     r1, [r12, #4]
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        ldr     r0, [sp, #0xD0]
        ldr     r1, [sp, #0xCC]
        bl      __subdf3
        str     r0, [r7, +r5, lsl #4]
        ldr     r12, [sp, #0x44]
        str     r1, [r12, #4]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        ldr     r0, [sp, #0xD4]
        ldr     r1, [sp, #0xC0]
        bl      __adddf3
        str     r0, [r6, +r5, lsl #4]
        ldr     r12, [sp, #0x3C]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0xD0]
        ldr     r1, [sp, #0xCC]
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        bl      __adddf3
        ldr     r12, [sp, #0x64]
        str     r0, [r7, +r12, lsl #3]
        ldr     r12, [sp, #0x38]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0xD4]
        ldr     r1, [sp, #0xC0]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __subdf3
        ldr     r12, [sp, #0x64]
        str     r0, [r6, +r12, lsl #3]
        ldr     r12, [sp, #0x34]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0xBC]
        ldr     r3, [sp, #0xB8]
        bl      __adddf3
        str     r0, [r7, +r5, lsl #5]
        ldr     r12, [sp, #0x28]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xB4]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __subdf3
        str     r0, [r6, +r5, lsl #5]
        ldr     r12, [sp, #0x2C]
        cmp     r5, #1
        str     r1, [r12, #4]
        ble     LCON1
        ldr     r0, [sp, #0x40]
        ldr     r4, [sp, #0x44]
        add     r8, r8, #0xC
        add     r0, r0, #4
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x24]
        str     r8, [sp, #0x58]
        ldr     r8, [sp, #0x48]
        add     r0, r0, #4
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x20]
        add     r4, r4, #4
        add     r8, r8, #4
        add     r0, r0, #4
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x30]
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x4C]
        add     r0, r0, #4
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        add     r8, r8, #4
        str     r8, [sp, #0x20]
        add     lr, r0, #4
        ldr     r0, [sp, #0x28]
        add     r6, r6, #4
        add     r7, r7, #4
        add     r0, r0, #4
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x34]
        sub     r5, r5, #1
        str     r5, [sp, #0x4C]
        add     r12, r0, #4
        ldr     r0, [sp, #0x38]
        str     r7, [sp, #0x38]
        str     r6, [sp, #0x48]
        add     r0, r0, #4
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x3C]
        str     r4, [sp, #0x44]
        str     r12, [sp, #0x34]
        add     r0, r0, #4
        str     r0, [sp, #0x3C]
        str     lr, [sp, #0x60]
LCON0:
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x5C]
        ldr     r9, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        ldr     r4, [r12, #0x18]
        ldr     r6, [lr]
        ldr     r7, [lr, #4]
        ldr     r5, [lr, #0xC]
        ldr     r11, [lr, #8]
        ldr     r8, [r12, #0x14]
        mov     r2, r6
        mov     r1, r10
        mov     r3, r7
        mov     r0, r9
        bl      __muldf3
        str     r1, [sp, #0xD0]
        str     r0, [sp, #0xD4]
        mov     r0, r8
        mov     r2, r11
        mov     r1, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xD4]
        mov     r3, r1
        ldr     r1, [sp, #0xD0]
        bl      __subdf3
        str     r0, [sp, #0xD4]
        str     r1, [sp, #0xD0]
        mov     r0, r8
        mov     r1, r4
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r4, r0
        mov     r6, r1
        mov     r0, r9
        mov     r2, r11
        mov     r3, r5
        mov     r1, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x40]
        ldr     r3, [sp, #0x5C]
        ldr     r11, [r12, #0xC]
        ldr     r5, [r12, #0x18]
        ldr     r10, [r12, #0x10]
        ldr     r7, [r12, #0x14]
        ldr     r12, [sp, #0x5C]
        ldr     r8, [r3, #0x10]
        ldr     r4, [r3, #0x14]
        ldr     r6, [r12, #0x1C]
        ldr     r9, [r12, #0x18]
        str     r1, [sp, #0xC8]
        str     r0, [sp, #0xCC]
        mov     r1, r10
        mov     r2, r8
        mov     r3, r4
        mov     r0, r11
        bl      __muldf3
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        mov     r0, r7
        mov     r1, r5
        mov     r3, r6
        mov     r2, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xC4]
        mov     r3, r1
        ldr     r1, [sp, #0xC0]
        bl      __subdf3
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC0]
        mov     r2, r8
        mov     r3, r4
        mov     r0, r7
        mov     r1, r5
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r11
        mov     r1, r10
        mov     r3, r6
        mov     r2, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x50]
        ldr     r3, [sp, #0x5C]
        ldr     r7, [r12, #0x14]
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        ldr     r4, [r3, #0x24]
        ldr     r5, [r12, #0x18]
        ldr     r8, [r3, #0x20]
        ldr     r12, [sp, #0x5C]
        mov     r3, r4
        mov     r2, r8
        ldr     r6, [r12, #0x2C]
        ldr     r9, [r12, #0x28]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xB8]
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        mov     r0, r7
        mov     r3, r6
        mov     r2, r9
        mov     r1, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xB0]
        mov     r2, r0
        ldr     r0, [sp, #0xB4]
        bl      __subdf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        mov     r2, r8
        mov     r1, r5
        mov     r3, r4
        mov     r0, r7
        bl      __muldf3
        mov     r5, r1
        mov     r4, r0
        mov     r2, r9
        mov     r0, r11
        mov     r3, r6
        mov     r1, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x54]
        ldr     lr, [sp, #0x5C]
        ldr     r7, [r12, #0x10]
        ldr     r6, [r12, #0xC]
        ldr     r2, [lr, #0x30]
        str     r2, [sp, #0xAC]
        ldr     r11, [lr, #0x34]
        ldr     r8, [lr, #0x38]
        ldr     r5, [lr, #0x3C]
        ldr     r10, [r12, #0x14]
        ldr     r9, [r12, #0x18]
        ldr     r2, [sp, #0xAC]
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xA4]
        mov     r3, r11
        mov     r1, r7
        mov     r0, r6
        bl      __muldf3
        str     r1, [sp, #0x9C]
        str     r0, [sp, #0xA0]
        mov     r1, r9
        mov     r0, r10
        mov     r2, r8
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x9C]
        mov     r2, r0
        ldr     r0, [sp, #0xA0]
        bl      __subdf3
        ldr     r2, [sp, #0xAC]
        str     r1, [sp, #0xA0]
        mov     r4, r0
        mov     r3, r11
        mov     r1, r9
        mov     r0, r10
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r8
        mov     r1, r7
        mov     r3, r5
        mov     r0, r6
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        mov     r6, r1
        ldr     r1, [sp, #0xD0]
        ldr     r3, [sp, #0xA0]
        mov     r5, r0
        ldr     r0, [sp, #0xD4]
        mov     r2, r4
        bl      __adddf3
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #0xC8]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xCC]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x98]
        ldr     r3, [sp, #0xA0]
        ldr     r0, [sp, #0xD4]
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0xD0]
        mov     r2, r4
        bl      __subdf3
        str     r0, [sp, #0xD4]
        str     r1, [sp, #0xD0]
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0xC4]
        str     r1, [sp, #0xC8]
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB0]
        ldr     r1, [sp, #0xC0]
        bl      __adddf3
        ldr     r3, [sp, #0xA4]
        ldr     r2, [sp, #0xA8]
        mov     r4, r1
        ldr     r1, [sp, #0xB8]
        mov     r6, r0
        ldr     r0, [sp, #0xBC]
        bl      __adddf3
        ldr     r2, [sp, #0xB4]
        ldr     r3, [sp, #0xB0]
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0xC4]
        mov     r5, r1
        ldr     r1, [sp, #0xC0]
        bl      __subdf3
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0xBC]
        ldr     r3, [sp, #0xA4]
        ldr     r2, [sp, #0xA8]
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0xB8]
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0x9C]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0xAC]
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r6
        mov     r1, r4
        bl      __muldf3
        ldr     r12, [sp, #0x58]
        ldr     r8, [r12, #4]
        ldr     r7, [r12, #8]
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB0]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0xA0]
        mov     r9, r1
        mov     r1, r5
        bl      __muldf3
        ldr     r12, [sp, #0x58]
        ldr     r2, [sp, #0xA8]
        ldr     r10, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        mov     r3, r9
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0xC8]
        ldr     r0, [sp, #0xCC]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0xBC]
        mov     r9, r1
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x8C]
        ldr     r0, [sp, #0xD4]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0xD0]
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x1C]
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0xC0]
        mov     r9, r0
        ldr     r0, [sp, #0xC4]
        bl      __muldf3
        ldr     r3, [sp, #0x88]
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x84]
        mov     r0, r6
        mov     r1, r4
        bl      __muldf3
        str     r1, [sp, #0x80]
        mov     r9, r0
        ldr     r0, [sp, #0xAC]
        ldr     r1, [sp, #0x9C]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        ldr     r3, [sp, #0x80]
        mov     r2, r9
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0xA0]
        mov     r9, r1
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x98]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x94]
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0xB8]
        mov     r10, r0
        ldr     r0, [sp, #0xBC]
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0xBC]
        mov     r11, r1
        ldr     r0, [sp, #0xCC]
        ldr     r1, [sp, #0xC8]
        bl      __muldf3
        ldr     r2, [sp, #0xBC]
        mov     r3, r11
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0xCC]
        mov     r11, r1
        ldr     r1, [sp, #0xC0]
        ldr     r0, [sp, #0xC4]
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0xD4]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0xD0]
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __subdf3
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0x9C]
        mov     r2, r6
        mov     r3, r4
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        mov     r3, r5
        str     r0, [r2, #4]
        ldr     r2, [sp, #0x38]
        str     r1, [r2, #8]
        ldr     r0, [sp, #0x98]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0xA0]
        bl      __adddf3
        ldr     r12, [sp, #0x58]
        ldr     r2, [r12, #0xC]
        ldr     r3, [r12, #0x10]
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        bl      __subdf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0xA4]
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        mov     r3, r11
        str     r1, [r2, #8]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x80]
        ldr     r2, [sp, #0xCC]
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x44]
        str     r1, [r2, #8]
        str     r0, [r2, #4]
        ldr     r1, [sp, #0x7C]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        mov     r0, r10
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        mov     r3, r11
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r0, [sp, #0x80]
        ldr     r2, [sp, #0xCC]
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r1, [sp, #0x7C]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        mov     r0, r10
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB0]
        ldr     r2, [sp, #0x90]
        ldr     r3, [sp, #0x8C]
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __subdf3
        ldr     r2, [sp, #0x60]
        str     r1, [r2, #8]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x4C]
        add     r2, r2, #8
        str     r2, [sp, #0x60]
        subs    r0, r0, #1
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #8
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #8
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #8
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #8
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #8
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x4C]
        bne     LCON0
LCON1:
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCON_C_1_5
        .long   LCON_C_2_5
        .long   LCON_S_1_5
        .long   LCON_S_2_5


        .data
        .align  4


LCON_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCON_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCON_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCON_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


