        .text
        .align  4
        .globl  _ipps_rDftFwd_Fact5_64f


_ipps_rDftFwd_Fact5_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #1, 24
        ldr     r12, [sp, #0x124]
        cmp     r3, #0
        str     r3, [sp, #8]
        str     r0, [sp, #4]
        str     r1, [sp]
        ble     LCNW3
        ldr     r1, [pc, #0xD24]
        ldr     r0, [pc, #0xD24]
        ldr     lr, [pc, #0xD24]
        ldr     r3, [pc, #0xD24]
        ldr     r5, [r1]
        ldr     r4, [r0]
        ldr     r7, [lr]
        ldr     r6, [r3]
        ldr     lr, [lr, #4]
        ldr     r3, [r3, #4]
        ldr     r1, [r1, #4]
        ldr     r0, [r0, #4]
        mov     r9, r2, lsl #1
        str     r4, [sp, #0x8C]
        str     r5, [sp, #0xA0]
        ldr     r4, [sp]
        ldr     r5, [sp, #4]
        add     r12, r12, #0x40
        rsb     r8, r2, r2, lsl #2
        sub     r9, r9, #3
        mov     r11, r2, asr #1
        add     r10, r2, r2, lsl #2
        str     r10, [sp, #0x5C]
        str     r11, [sp, #0x58]
        str     r9, [sp, #0x54]
        str     r12, [sp, #0x50]
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x88]
        str     r3, [sp, #0x98]
        str     r6, [sp, #0x94]
        str     lr, [sp, #0x84]
        str     r7, [sp, #0x9C]
        str     r8, [sp, #0x4C]
        str     r2, [sp, #0x48]
LCNW0:
        ldr     r11, [sp, #0x48]
        ldr     r10, [r5, +r11, lsl #3]
        ldr     r7, [r5, +r11, lsl #5]
        add     r1, r5, r11, lsl #3
        str     r1, [sp, #0x30]
        ldr     r6, [r1, #4]
        add     r3, r5, r11, lsl #5
        str     r3, [sp, #0x28]
        ldr     r3, [r3, #4]
        mov     r2, r7
        mov     r0, r10
        str     r3, [sp, #0x80]
        add     r3, r5, r11, lsl #4
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x4C]
        mov     r1, r6
        add     r3, r5, r3, lsl #3
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x80]
        bl      __adddf3
        ldr     r3, [sp, #0x80]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r10
        mov     r1, r6
        mov     r2, r7
        bl      __subdf3
        ldr     r12, [r5, +r11, lsl #4]
        str     r12, [sp, #0x80]
        ldr     r12, [sp, #0x10]
        ldr     r10, [r12, #4]
        ldr     r12, [sp, #0x4C]
        ldr     r12, [r5, +r12, lsl #3]
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0xC]
        ldr     r2, [sp, #0x7C]
        ldr     r12, [r12, #4]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0x70]
        str     r12, [sp, #0x78]
        ldr     r3, [sp, #0x78]
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        mov     r6, r0
        ldr     r0, [sp, #0x80]
        mov     r7, r1
        mov     r1, r10
        bl      __subdf3
        ldr     r10, [r5]
        ldr     r12, [r5, #4]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x84]
        str     r12, [sp, #0x80]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x68]
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x64]
        mov     r0, r10
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        bl      __adddf3
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x88]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x70]
        bl      __muldf3
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x7C]
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x60]
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x60]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x40]
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        ldr     r3, [sp, #0x80]
        mov     r2, r10
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x44]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x88]
        ldr     r0, [sp, #0x7C]
        bl      __muldf3
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x74]
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        bl      __muldf3
        ldr     r3, [sp, #0x78]
        ldr     r2, [sp, #0x7C]
        bl      __subdf3
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x7C]
        mov     r0, r10
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [r4]
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x64]
        add     r1, r4, r11, lsl #4
        sub     r12, r1, #8
        str     r0, [r4, +r11, lsl #4]
        ldr     r0, [sp, #0x6C]
        add     r3, r12, #8
        str     r0, [r1, #-8]
        ldr     r0, [sp, #0x68]
        str     r0, [r1, #-4]
        ldr     r0, [sp, #0x60]
        str     r0, [r1, #4]
        ldr     r2, [sp, #0x7C]
        add     r0, r4, r11, lsl #5
        sub     lr, r0, #8
        str     r2, [r4, +r11, lsl #5]
        ldr     r1, [sp, #0x58]
        cmp     r1, #1
        ldr     r1, [sp, #0x44]
        str     r1, [r0, #-8]
        ldr     r1, [sp, #0x40]
        str     r1, [r0, #-4]
        ldr     r1, [sp, #0x78]
        str     r1, [r0, #4]
        ldr     r0, [sp, #0x50]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x54]
        blt     LCNW2
        mov     r1, r0, lsl #3
        add     r6, r1, #0x14
        add     r3, r6, r3
        mov     r7, #1
        str     r3, [sp, #0x34]
        add     r3, lr, #0xC
        str     r7, [sp, #0x44]
        add     r7, r6, r4
        str     r3, [sp, #0x38]
        add     r3, lr, #4
        ldr     r11, [sp, #0x58]
        str     r7, [sp, #0x3C]
        add     lr, r12, #0xC
        add     r2, r12, #0x10
        add     r7, r12, #4
        sub     r12, r4, #4
        str     r12, [sp, #0x14]
        add     r12, r5, #4
        str     r12, [sp, #0x18]
        sub     r12, r5, #4
        str     r12, [sp, #0x1C]
        ldr     r12, [sp, #0x28]
        str     lr, [sp, #0x2C]
        add     r1, r4, #8
        add     lr, r12, #4
        sub     r12, r12, #4
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0xC]
        str     lr, [sp, #0x20]
        add     r1, r6, r1
        add     r2, r6, r2
        add     lr, r12, #4
        sub     r6, r12, #4
        ldr     r12, [sp, #0x10]
        str     lr, [sp, #0x28]
        add     r10, r4, #4
        add     r9, r12, #4
        sub     lr, r12, #4
        ldr     r12, [sp, #0x30]
        str     r11, [sp, #0x30]
        add     r8, r12, #4
        sub     r12, r12, #4
        str     r12, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     lr, [sp, #0x74]
        str     r9, [sp, #0x78]
        str     r6, [sp, #0x7C]
        str     r10, [sp, #0x80]
        str     r7, [sp, #0x64]
        str     r3, [sp, #0x68]
        str     r2, [sp, #0x6C]
        str     r1, [sp, #0x60]
        str     r0, [sp, #0x70]
        str     r4, [sp]
        str     r5, [sp, #4]
LCNW1:
        ldr     r12, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        ldr     r3, [sp, #0x40]
        ldr     r5, [r12, #0x10]
        ldr     r8, [r12, #0xC]
        ldr     r12, [sp, #0x40]
        ldr     r10, [r1, #0xC]
        ldr     r7, [r1, #0x10]
        ldr     r9, [r3]
        ldr     r4, [r3, #4]
        ldr     r6, [r12, #0xC]
        ldr     r11, [r12, #8]
        mov     r0, r10
        mov     r3, r4
        mov     r2, r9
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0xA4]
        str     r1, [sp, #0xA8]
        mov     r0, r8
        mov     r3, r6
        mov     r1, r5
        mov     r2, r11
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xA8]
        mov     r2, r0
        ldr     r0, [sp, #0xA4]
        bl      __subdf3
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xA4]
        mov     r2, r9
        mov     r0, r8
        mov     r1, r5
        mov     r3, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r3, r6
        mov     r1, r7
        mov     r2, r11
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x74]
        ldr     r3, [sp, #0x40]
        ldr     r11, [r12, #0xC]
        ldr     r6, [r12, #0x10]
        ldr     r9, [r3, #0x10]
        ldr     r12, [sp, #0x78]
        ldr     r4, [r3, #0x14]
        ldr     r8, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        ldr     r12, [sp, #0x40]
        mov     r2, r9
        mov     r3, r4
        ldr     r10, [r12, #0x18]
        ldr     r7, [r12, #0x1C]
        str     r1, [sp, #0xB0]
        str     r0, [sp, #0xAC]
        mov     r0, r11
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0xB4]
        str     r1, [sp, #0xB8]
        mov     r0, r8
        mov     r1, r5
        mov     r2, r10
        mov     r3, r7
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xB4]
        mov     r3, r1
        ldr     r1, [sp, #0xB8]
        bl      __subdf3
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xB4]
        mov     r3, r4
        mov     r0, r8
        mov     r1, r5
        mov     r2, r9
        bl      __muldf3
        mov     r5, r1
        mov     r4, r0
        mov     r1, r6
        mov     r2, r10
        mov     r3, r7
        mov     r0, r11
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x40]
        ldr     r12, [sp, #0x7C]
        ldr     r9, [r3, #0x20]
        ldr     r4, [r3, #0x24]
        ldr     r6, [r12, #0x10]
        ldr     r10, [r12, #0xC]
        ldr     r12, [sp, #0x40]
        mov     r2, r9
        mov     r3, r4
        ldr     r11, [r12, #0x28]
        ldr     r7, [r12, #0x2C]
        ldr     r12, [sp, #0x28]
        ldr     r8, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        str     r0, [sp, #0xBC]
        str     r1, [sp, #0xC0]
        mov     r0, r10
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0xC4]
        str     r1, [sp, #0xC8]
        mov     r3, r7
        mov     r0, r8
        mov     r2, r11
        mov     r1, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xC8]
        mov     r2, r0
        ldr     r0, [sp, #0xC4]
        bl      __subdf3
        str     r1, [sp, #0xC4]
        str     r0, [sp, #0xC8]
        mov     r1, r5
        mov     r2, r9
        mov     r0, r8
        mov     r3, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r3, r7
        mov     r1, r6
        mov     r2, r11
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x40]
        ldr     r12, [sp, #0x40]
        ldr     r7, [r2, #0xC]
        ldr     r6, [r2, #0x10]
        ldr     r2, [r3, #0x30]
        str     r2, [sp, #0xCC]
        ldr     r2, [sp, #0x20]
        ldr     r10, [r3, #0x34]
        ldr     r8, [r12, #0x38]
        ldr     r11, [r2, #0xC]
        ldr     r9, [r2, #0x10]
        ldr     r5, [r12, #0x3C]
        ldr     r2, [sp, #0xCC]
        str     r0, [sp, #0xD0]
        str     r1, [sp, #0xD4]
        mov     r0, r7
        mov     r1, r6
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0xD8]
        str     r1, [sp, #0xDC]
        mov     r2, r8
        mov     r1, r9
        mov     r0, r11
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xDC]
        mov     r2, r0
        ldr     r0, [sp, #0xD8]
        bl      __subdf3
        ldr     r2, [sp, #0xCC]
        str     r1, [sp, #0xDC]
        mov     r4, r0
        mov     r1, r9
        mov     r0, r11
        mov     r3, r10
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r3, r5
        mov     r0, r7
        mov     r1, r6
        mov     r2, r8
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r3, [sp, #0xDC]
        mov     r5, r0
        ldr     r0, [sp, #0xA8]
        mov     r6, r1
        ldr     r1, [sp, #0xA4]
        mov     r2, r4
        bl      __adddf3
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0xB0]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r3, [sp, #0xDC]
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0xA8]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0xA4]
        mov     r2, r4
        bl      __subdf3
        str     r0, [sp, #0xDC]
        ldr     r0, [sp, #0xAC]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xB0]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        ldr     r3, [sp, #0xC4]
        ldr     r2, [sp, #0xC8]
        str     r0, [sp, #0xB0]
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0xB4]
        ldr     r0, [sp, #0xB8]
        bl      __adddf3
        mov     r6, r0
        mov     r4, r1
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xD4]
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xC0]
        bl      __adddf3
        ldr     r3, [sp, #0xC4]
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0xB8]
        mov     r5, r1
        ldr     r1, [sp, #0xB4]
        ldr     r2, [sp, #0xC8]
        bl      __subdf3
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0xBC]
        ldr     r2, [sp, #0xD0]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0xC0]
        ldr     r3, [sp, #0xD4]
        bl      __subdf3
        str     r0, [sp, #0xD4]
        ldr     r2, [sp, #0x9C]
        str     r1, [sp, #0xD0]
        ldr     r3, [sp, #0x84]
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xCC]
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r6
        mov     r1, r4
        bl      __muldf3
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #0x44]
        ldr     r8, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x1C]
        mov     r3, r10
        ldr     r7, [r12, #0x10]
        mov     r2, r9
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x84]
        ldr     r11, [r12, #0xC]
        ldr     r10, [r12, #0x10]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0xE0]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0xE4]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0xA4]
        mov     r9, r1
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0xB8]
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0xB0]
        str     r1, [sp, #0xB4]
        ldr     r1, [sp, #0xAC]
        bl      __muldf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        str     r1, [sp, #0xE8]
        ldr     r1, [sp, #0xD0]
        mov     r9, r0
        ldr     r0, [sp, #0xD4]
        bl      __muldf3
        ldr     r3, [sp, #0xE8]
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x88]
        str     r1, [sp, #0xEC]
        ldr     r1, [sp, #0xA8]
        str     r0, [sp, #0xE8]
        ldr     r0, [sp, #0xDC]
        bl      __muldf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        str     r1, [sp, #0xF0]
        ldr     r1, [sp, #0xC4]
        mov     r9, r0
        ldr     r0, [sp, #0xC8]
        bl      __muldf3
        ldr     r3, [sp, #0xF0]
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0xF0]
        str     r1, [sp, #0xF4]
        mov     r0, r6
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        str     r1, [sp, #0xF8]
        ldr     r3, [sp, #0x98]
        ldr     r1, [sp, #0xCC]
        mov     r9, r0
        ldr     r0, [sp, #0xD8]
        bl      __muldf3
        ldr     r3, [sp, #0xF8]
        mov     r2, r9
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        mov     r9, r0
        ldr     r0, [sp, #0xE0]
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        str     r1, [sp, #0xF8]
        ldr     r1, [sp, #0xE4]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r11
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0xA4]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x84]
        mov     r11, r1
        mov     r1, r5
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        str     r0, [sp, #0xFC]
        mov     r10, r1
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xAC]
        bl      __muldf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0xD4]
        mov     r11, r1
        ldr     r1, [sp, #0xD0]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xB0]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0xD4]
        ldr     r0, [sp, #0xC8]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0xDC]
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0xA8]
        bl      __muldf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xC4]
        bl      __subdf3
        str     r1, [sp, #0xDC]
        ldr     r1, [sp, #0xCC]
        mov     r11, r0
        ldr     r0, [sp, #0xD8]
        mov     r2, r6
        mov     r3, r4
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp]
        ldr     r12, [sp, #0x44]
        str     r0, [r2, +r12, lsl #3]
        ldr     r2, [sp, #0x14]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xE4]
        ldr     r0, [r2, #0xC]
        ldr     r1, [r2, #0x10]
        ldr     r2, [sp, #0xE0]
        bl      __adddf3
        ldr     r2, [sp, #0xA4]
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x80]
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0x80]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xEC]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xBC]
        bl      __subdf3
        ldr     r2, [sp, #0x64]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB4]
        ldr     r0, [sp, #0xF0]
        ldr     r1, [sp, #0xF4]
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r1, [sp, #0xF8]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        mov     r0, r9
        bl      __subdf3
        ldr     r2, [sp, #0x68]
        mov     r3, r10
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0xFC]
        ldr     r1, [sp, #0xDC]
        mov     r0, r11
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r1, [sp, #0xF8]
        ldr     r2, [sp, #0xD4]
        ldr     r3, [sp, #0xD0]
        mov     r0, r9
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        mov     r3, r10
        str     r0, [r2, #-0x14]
        str     r1, [r2, #-0x10]
        ldr     r1, [sp, #0xDC]
        ldr     r2, [sp, #0xFC]
        mov     r0, r11
        bl      __subdf3
        ldr     r2, [sp, #0x6C]
        str     r0, [r2, #-0x14]
        str     r1, [r2, #-0x10]
        ldr     r0, [sp, #0xC0]
        ldr     r1, [sp, #0xBC]
        ldr     r2, [sp, #0xE8]
        ldr     r3, [sp, #0xEC]
        bl      __adddf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x70]
        str     r0, [r2, +r3, lsl #3]
        ldr     r0, [sp, #0x3C]
        str     r1, [r0, #-0x10]
        ldr     r0, [sp, #0xF0]
        ldr     r1, [sp, #0xF4]
        ldr     r2, [sp, #0xB8]
        ldr     r3, [sp, #0xB4]
        bl      __subdf3
        ldr     r2, [sp, #0x60]
        str     r1, [r2, #-0x10]
        str     r0, [r2, #-0x14]
        ldr     r0, [sp, #0x30]
        sub     r2, r2, #0x10
        str     r2, [sp, #0x60]
        subs    r0, r0, #1
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x40
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x80]
        add     r0, r0, #0x10
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x7C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x10
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #0x10
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #2
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x3C]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x6C]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x34]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x70]
        sub     r0, r0, #2
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x30]
        bne     LCNW1
        ldr     r4, [sp]
        ldr     r5, [sp, #4]
LCNW2:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x5C]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        add     r5, r5, r1, lsl #3
        add     r4, r4, r1, lsl #3
        bne     LCNW0
LCNW3:
        add     sp, sp, #1, 24
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNW_S_1_5
        .long   LCNW_S_2_5
        .long   LCNW_C_1_5
        .long   LCNW_C_2_5


        .data
        .align  4


LCNW_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCNW_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCNW_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCNW_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


