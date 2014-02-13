        .text
        .align  4
        .globl  _ipps_rDftInv_Fact5_64f


_ipps_rDftInv_Fact5_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x11, 28
        ldr     r12, [sp, #0x134]
        cmp     r3, #0
        str     r3, [sp, #8]
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r4, r2
        ble     LCNP3
        ldr     lr, [pc, #0xCAC]
        ldr     r3, [pc, #0xCAC]
        ldr     r1, [pc, #0xCAC]
        ldr     r0, [pc, #0xCAC]
        ldr     r8, [lr]
        ldr     r7, [r3]
        ldr     r6, [r1]
        ldr     r5, [r0]
        ldr     lr, [lr, #4]
        ldr     r3, [r3, #4]
        ldr     r1, [r1, #4]
        ldr     r0, [r0, #4]
        rsb     r9, r4, r4, lsl #2
        mov     r10, r4, lsl #1
        str     r8, [sp, #0xA0]
        str     r9, [sp, #0x48]
        ldr     r8, [sp]
        ldr     r9, [sp, #4]
        add     r12, r12, #0x40
        sub     r10, r10, #3
        mov     r2, r4, asr #1
        add     r11, r4, r4, lsl #2
        str     r11, [sp, #0x58]
        str     r2, [sp, #0x54]
        str     r10, [sp, #0x50]
        str     r12, [sp, #0x4C]
        str     r0, [sp, #0x88]
        str     r5, [sp, #0x98]
        str     r1, [sp, #0x8C]
        str     r6, [sp, #0x84]
        str     r3, [sp, #0x94]
        str     r7, [sp, #0x9C]
        str     lr, [sp, #0x90]
LCNP0:
        add     r5, r9, r4, lsl #4
        ldr     r2, [r5, #-8]
        ldr     r3, [r5, #-4]
        sub     r12, r5, #8
        mov     r0, r2
        str     r12, [sp, #0xC]
        mov     r1, r3
        bl      __adddf3
        ldr     r2, [r9, +r4, lsl #4]
        ldr     r3, [r5, #4]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r2
        mov     r1, r3
        add     r10, r9, r4, lsl #5
        bl      __adddf3
        ldr     r2, [r10, #-8]
        ldr     r3, [r10, #-4]
        str     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r2, [r9, +r4, lsl #5]
        ldr     r3, [r10, #4]
        mov     r6, r1
        mov     r5, r0
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r11, [r9, #4]
        ldr     r7, [r9]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x90]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x80]
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x94]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x64]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r0, r7
        mov     r1, r11
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x74]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x6C]
        bl      __muldf3
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x60]
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x90]
        str     r1, [sp, #0x5C]
        str     r0, [sp, #0x60]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x94]
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x80]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x6C]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x74]
        ldr     r0, [sp, #0x78]
        bl      __muldf3
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x6C]
        bl      __subdf3
        ldr     r2, [sp, #0x80]
        ldr     r3, [sp, #0x7C]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r1, r11
        mov     r0, r7
        bl      __adddf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        bl      __adddf3
        str     r0, [r8, +r4, lsl #3]
        add     r7, r8, r4, lsl #3
        str     r1, [r7, #4]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        bl      __adddf3
        str     r0, [r8, +r4, lsl #4]
        add     r6, r8, r4, lsl #4
        str     r1, [r6, #4]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        bl      __subdf3
        ldr     r3, [sp, #0x48]
        sub     r10, r10, #8
        str     r0, [r8, +r3, lsl #3]
        add     r5, r8, r3, lsl #3
        str     r1, [r5, #4]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        bl      __subdf3
        str     r0, [r8, +r4, lsl #5]
        ldr     r0, [sp, #0x54]
        add     r3, r8, r4, lsl #5
        str     r1, [r3, #4]
        cmp     r0, #1
        ldr     r0, [sp, #0xC]
        add     r12, r0, #8
        ldr     r0, [sp, #0x4C]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x50]
        blt     LCNP2
        mov     r1, r0, lsl #3
        add     lr, r1, #0x14
        ldr     r1, [sp, #0xC]
        add     r12, lr, r12
        str     r12, [sp, #0x24]
        add     r11, r1, #0x10
        add     r12, r3, #4
        str     r11, [sp, #0x80]
        mov     r2, #1
        sub     r3, r3, #4
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x80]
        str     r3, [sp, #0x28]
        add     r3, r5, #4
        add     r11, r9, #8
        str     r3, [sp, #0x2C]
        add     r3, r6, #4
        add     r11, lr, r11
        add     r2, lr, r2
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x54]
        str     r11, [sp, #0x30]
        add     r3, r7, #4
        add     r11, r1, #0xC
        add     lr, lr, r9
        sub     r5, r5, #4
        sub     r6, r6, #4
        str     r3, [sp, #0x14]
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x3C]
        add     r3, r10, #0xC
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x38]
        str     r5, [sp, #0x18]
        str     r6, [sp, #0x10]
        sub     r7, r7, #4
        add     r6, r8, #4
        sub     r5, r8, #4
        add     lr, r9, #4
        sub     r12, r9, #4
        add     r10, r10, #4
        add     r1, r1, #4
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x70]
        str     r10, [sp, #0x78]
        str     r3, [sp, #0x7C]
        str     r12, [sp, #0x5C]
        str     lr, [sp, #0x80]
        str     r5, [sp, #0x60]
        str     r6, [sp, #0x64]
        str     r7, [sp, #0x68]
        str     r0, [sp, #0x6C]
        str     r4, [sp, #0x44]
        str     r8, [sp]
        str     r9, [sp, #4]
LCNP1:
        ldr     r1, [sp, #0x6C]
        ldr     r0, [sp, #4]
        ldr     r8, [r0, +r1, lsl #3]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x70]
        mov     r2, r8
        ldr     r4, [r0, #-0x10]
        ldr     r0, [r1, #0xC]
        str     r0, [sp, #0xA4]
        ldr     r5, [r1, #0x10]
        ldr     r0, [sp, #0xA4]
        mov     r3, r4
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        ldr     r6, [r12, #-0x10]
        ldr     r9, [r12, #-0x14]
        ldr     r12, [sp, #0x74]
        mov     r2, r9
        mov     r3, r6
        ldr     r7, [r12, #0x10]
        ldr     r10, [r12, #0xC]
        str     r0, [sp, #0xA8]
        str     r1, [sp, #0xAC]
        mov     r1, r7
        mov     r0, r10
        bl      __subdf3
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0xA4]
        str     r1, [sp, #0xB4]
        mov     r3, r4
        mov     r2, r8
        mov     r1, r5
        bl      __subdf3
        str     r0, [sp, #0xA4]
        str     r1, [sp, #0xB8]
        mov     r2, r9
        mov     r3, r6
        mov     r1, r7
        mov     r0, r10
        bl      __adddf3
        ldr     r3, [sp, #0x78]
        ldr     r2, [r3, #0xC]
        str     r2, [sp, #0xBC]
        ldr     r4, [r3, #0x10]
        ldr     r3, [sp, #0x24]
        ldr     r7, [r3, #-0x10]
        ldr     r9, [r3, #-0x14]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0xBC]
        str     r1, [sp, #0xC4]
        mov     r3, r7
        mov     r2, r9
        mov     r1, r4
        bl      __adddf3
        ldr     r12, [sp, #0x7C]
        ldr     r6, [r12, #0x10]
        ldr     r10, [r12, #0xC]
        ldr     r12, [sp, #0x20]
        ldr     r8, [r12, #-0x14]
        ldr     r5, [r12, #-0x10]
        str     r0, [sp, #0xC8]
        str     r1, [sp, #0xCC]
        mov     r0, r10
        mov     r1, r6
        mov     r2, r8
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0xD0]
        ldr     r0, [sp, #0xBC]
        str     r1, [sp, #0xD4]
        mov     r3, r7
        mov     r2, r9
        mov     r1, r4
        bl      __subdf3
        str     r1, [sp, #0xD8]
        str     r0, [sp, #0xBC]
        mov     r0, r10
        mov     r1, r6
        mov     r2, r8
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x90]
        mov     r6, r0
        ldr     r0, [sp, #0xA8]
        mov     r5, r1
        ldr     r1, [sp, #0xAC]
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [sp, #0xCC]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x94]
        mov     r8, r0
        ldr     r0, [sp, #0xC8]
        bl      __muldf3
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #0x40]
        mov     r2, r8
        mov     r3, r7
        ldr     lr, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x5C]
        str     lr, [sp, #0xDC]
        ldr     r4, [r12, #0x10]
        bl      __adddf3
        ldr     r2, [sp, #0xDC]
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #0x80]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x90]
        ldr     r8, [r12, #0xC]
        ldr     r7, [r12, #0x10]
        str     r0, [sp, #0xE0]
        ldr     r0, [sp, #0xB0]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0xB4]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        mov     r10, r1
        mov     r9, r0
        ldr     r0, [sp, #0xD0]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x94]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r1, [sp, #0xEC]
        ldr     r1, [sp, #0xC4]
        str     r0, [sp, #0xE8]
        ldr     r0, [sp, #0xC0]
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x88]
        mov     r10, r1
        mov     r9, r0
        mov     r0, r6
        mov     r1, r5
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        str     r0, [sp, #0xF0]
        ldr     r0, [sp, #0xA4]
        str     r1, [sp, #0xF4]
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x88]
        mov     r10, r1
        ldr     r1, [sp, #0xD8]
        mov     r9, r0
        ldr     r0, [sp, #0xBC]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x90]
        str     r0, [sp, #0xF8]
        ldr     r0, [sp, #0xC8]
        str     r1, [sp, #0xFC]
        ldr     r1, [sp, #0xCC]
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x94]
        mov     r9, r0
        ldr     r0, [sp, #0xA8]
        mov     r10, r1
        ldr     r1, [sp, #0xAC]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [sp, #0xDC]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x94]
        str     r0, [sp, #0x100]
        ldr     r0, [sp, #0xB0]
        str     r1, [sp, #0x104]
        ldr     r1, [sp, #0xB4]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        mov     r8, r1
        mov     r7, r0
        ldr     r0, [sp, #0xD0]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0x90]
        bl      __muldf3
        mov     r3, r8
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        mov     r7, r0
        mov     r8, r1
        mov     r1, r5
        mov     r0, r6
        bl      __muldf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x88]
        mov     r6, r0
        ldr     r0, [sp, #0xC0]
        mov     r5, r1
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        mov     r3, r5
        mov     r2, r6
        bl      __subdf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x88]
        mov     r5, r1
        mov     r6, r0
        ldr     r0, [sp, #0xA4]
        ldr     r1, [sp, #0xB8]
        bl      __muldf3
        mov     r9, r0
        ldr     r0, [sp, #0xBC]
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        mov     r10, r1
        ldr     r1, [sp, #0xD8]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __subdf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xF4]
        mov     r10, r0
        ldr     r0, [sp, #0xE0]
        mov     r9, r1
        ldr     r1, [sp, #0xE4]
        bl      __adddf3
        ldr     r2, [sp, #0xF8]
        ldr     r3, [sp, #0xFC]
        str     r0, [sp, #0xD8]
        ldr     r0, [sp, #0xE8]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0xEC]
        bl      __subdf3
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x100]
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0x104]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        str     r0, [sp, #0xB8]
        str     r1, [sp, #0xA4]
        mov     r2, r10
        mov     r3, r9
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        str     r0, [sp, #0x108]
        ldr     r0, [sp, #0x100]
        str     r1, [sp, #0x10C]
        ldr     r1, [sp, #0x104]
        mov     r3, r5
        mov     r2, r6
        bl      __subdf3
        str     r0, [sp, #0x104]
        str     r1, [sp, #0x100]
        mov     r0, r7
        mov     r1, r8
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0xF0]
        ldr     r3, [sp, #0xF4]
        mov     r6, r0
        ldr     r0, [sp, #0xE0]
        mov     r5, r1
        ldr     r1, [sp, #0xE4]
        bl      __subdf3
        ldr     r2, [sp, #0xF8]
        mov     r9, r0
        mov     r10, r1
        ldr     r3, [sp, #0xFC]
        ldr     r0, [sp, #0xE8]
        ldr     r1, [sp, #0xEC]
        bl      __adddf3
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        mov     r8, r0
        ldr     r0, [sp, #0xA8]
        mov     r7, r1
        ldr     r1, [sp, #0xAC]
        bl      __adddf3
        ldr     r2, [sp, #0xDC]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x40]
        str     r0, [r2, +r3, lsl #3]
        ldr     r2, [sp, #0x60]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x80]
        ldr     r3, [sp, #0xB4]
        ldr     r0, [r2, #0xC]
        ldr     r1, [r2, #0x10]
        ldr     r2, [sp, #0xB0]
        bl      __adddf3
        ldr     r2, [sp, #0xD0]
        ldr     r3, [sp, #0xD4]
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        str     r0, [sp, #0xFC]
        ldr     r0, [sp, #0xC0]
        str     r1, [sp, #0xF8]
        ldr     r1, [sp, #0xBC]
        bl      __muldf3
        ldr     r3, [sp, #0xF8]
        ldr     r2, [sp, #0xFC]
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xC0]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        ldr     r1, [sp, #0xBC]
        bl      __muldf3
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        str     r0, [sp, #0xFC]
        mov     r4, r1
        ldr     r0, [sp, #0xD8]
        ldr     r1, [sp, #0xC4]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0xFC]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2, #0xC]
        ldr     r2, [sp, #0x14]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xB8]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [r11, #0x10]
        ldr     r3, [r11, #0x14]
        bl      __muldf3
        ldr     r2, [r11, #0x18]
        ldr     r3, [r11, #0x1C]
        mov     r4, r0
        ldr     r0, [sp, #0x108]
        str     r1, [sp, #0xFC]
        ldr     r1, [sp, #0x10C]
        bl      __muldf3
        ldr     r3, [sp, #0xFC]
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x108]
        ldr     r2, [r11, #0x10]
        ldr     r3, [r11, #0x14]
        ldr     r1, [sp, #0x10C]
        bl      __muldf3
        ldr     r2, [r11, #0x18]
        ldr     r3, [r11, #0x1C]
        str     r0, [sp, #0x10C]
        ldr     r0, [sp, #0xB8]
        mov     r4, r1
        ldr     r1, [sp, #0xA4]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x10C]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x104]
        ldr     r1, [sp, #0x100]
        ldr     r2, [r11, #0x20]
        ldr     r3, [r11, #0x24]
        bl      __muldf3
        ldr     r2, [r11, #0x28]
        ldr     r3, [r11, #0x2C]
        str     r0, [sp, #0x10C]
        mov     r4, r1
        mov     r0, r6
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [sp, #0x10C]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r11, #0x20]
        ldr     r3, [r11, #0x24]
        mov     r1, r5
        mov     r0, r6
        bl      __muldf3
        ldr     r2, [r11, #0x28]
        ldr     r3, [r11, #0x2C]
        mov     r4, r0
        ldr     r0, [sp, #0x104]
        mov     r5, r1
        ldr     r1, [sp, #0x100]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r11, #0x30]
        ldr     r3, [r11, #0x34]
        mov     r0, r9
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [r11, #0x38]
        ldr     r3, [r11, #0x3C]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r7
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r11, #0x30]
        ldr     r3, [r11, #0x34]
        mov     r0, r8
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [r11, #0x38]
        ldr     r3, [r11, #0x3C]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r9
        mov     r1, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        add     r11, r11, #0x40
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0xC]
        add     r2, r2, #0x10
        str     r2, [sp, #0x38]
        subs    r0, r0, #1
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #0x10
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x80]
        add     r0, r0, #0x10
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x7C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x78]
        add     r0, r0, #0x10
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #0x10
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #0x10
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #2
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x20]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x30]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x6C]
        sub     r0, r0, #2
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0xC]
        bne     LCNP1
        ldr     r4, [sp, #0x44]
        ldr     r8, [sp]
        ldr     r9, [sp, #4]
LCNP2:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x58]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        add     r9, r9, r1, lsl #3
        add     r8, r8, r1, lsl #3
        bne     LCNP0
LCNP3:
        add     sp, sp, #0x11, 28
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNP_C_1_5
        .long   LCNP_C_2_5
        .long   LCNP_S_1_5
        .long   LCNP_S_2_5


        .data
        .align  4


LCNP_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCNP_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCNP_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCNP_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


