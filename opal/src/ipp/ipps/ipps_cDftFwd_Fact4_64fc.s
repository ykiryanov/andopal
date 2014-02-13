        .text
        .align  4
        .globl  _ipps_cDftFwd_Fact4_64fc


_ipps_cDftFwd_Fact4_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x9C
        ldr     r12, [sp, #0xC0]
        cmp     r3, #0
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        ble     LCPY3
        add     r12, r12, #0x30
        rsb     r7, r4, r4, lsl #2
        mov     lr, r4, lsl #1
        str     lr, [sp, #0x38]
        str     r12, [sp, #0x34]
        str     r7, [sp, #0x30]
        str     r3, [sp, #0x2C]
LCPY0:
        ldr     r3, [r6, +r4, lsl #5]
        add     r7, r6, r4, lsl #5
        str     r7, [sp, #8]
        str     r3, [sp, #0x60]
        ldr     r3, [r7, #4]
        ldr     r2, [sp, #0x60]
        str     r3, [sp, #0x5C]
        ldr     r3, [r6]
        str     r3, [sp, #0x58]
        ldr     r3, [sp, #0x34]
        ldr     r0, [sp, #0x58]
        str     r3, [sp, #0x24]
        ldr     r3, [r6, #4]
        str     r3, [sp, #0x54]
        ldr     r1, [sp, #0x54]
        ldr     r3, [sp, #0x5C]
        bl      __adddf3
        ldr     r3, [r7, #8]
        ldr     r9, [r6, #8]
        ldr     r10, [r6, #0xC]
        ldr     r12, [sp, #0x30]
        str     r3, [sp, #0x50]
        ldr     r11, [r7, #0xC]
        ldr     r2, [sp, #0x50]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x48]
        add     r8, r6, r12, lsl #4
        str     r8, [sp]
        add     r12, r5, r4, lsl #5
        str     r12, [sp, #4]
        mov     r0, r9
        mov     r1, r10
        mov     r3, r11
        add     r7, r6, r4, lsl #4
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x58]
        bl      __subdf3
        ldr     r2, [sp, #0x50]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r0, r9
        mov     r1, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r11, [r7, #4]
        ldr     r3, [sp, #0x30]
        ldr     r10, [r6, +r4, lsl #4]
        ldr     r3, [r6, +r3, lsl #4]
        str     r3, [sp, #0x58]
        ldr     r3, [r8, #4]
        ldr     r2, [sp, #0x58]
        str     r0, [sp, #0x50]
        str     r3, [sp, #0x54]
        ldr     r3, [sp, #0x54]
        str     r1, [sp, #0x1C]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r9, [r7, #8]
        ldr     r3, [r7, #0xC]
        str     r3, [sp, #0x18]
        ldr     r3, [r8, #8]
        str     r3, [sp, #0x14]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x64]
        str     r8, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r1, [sp, #0x18]
        mov     r0, r9
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x6C]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        str     r0, [sp, #0x58]
        mov     r8, r1
        ldr     r1, [sp, #0x18]
        mov     r0, r9
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x64]
        mov     r9, r0
        ldr     r0, [sp, #0x4C]
        mov     r11, r1
        ldr     r1, [sp, #0x48]
        bl      __adddf3
        str     r0, [r5]
        str     r1, [r5, #4]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x6C]
        bl      __adddf3
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x48]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x64]
        bl      __subdf3
        str     r0, [r5, +r4, lsl #5]
        ldr     r12, [sp, #4]
        add     r10, r5, r4, lsl #4
        str     r1, [r12, #4]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x6C]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x20]
        bl      __subdf3
        ldr     r12, [sp, #4]
        mov     r2, r9
        str     r0, [r12, #8]
        str     r1, [r12, #0xC]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x5C]
        mov     r3, r11
        bl      __adddf3
        str     r0, [r5, +r4, lsl #4]
        str     r1, [r10, #4]
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x58]
        mov     r3, r8
        bl      __subdf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x5C]
        mov     r2, r9
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [sp, #0x30]
        mov     r3, r8
        str     r0, [r5, +r12, lsl #4]
        add     r9, r5, r12, lsl #4
        str     r1, [r9, #4]
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x58]
        add     r8, r6, #8
        bl      __adddf3
        ldr     r3, [sp, #0x38]
        add     r12, r5, #8
        cmp     r3, #2
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ble     LCPY2
        mov     r3, #2
        str     r3, [sp, #0x1C]
        add     r3, r9, #0xC
        str     r3, [sp, #0x20]
        add     r3, r10, #0xC
        add     r10, r10, #4
        str     r10, [sp, #0xC]
        add     r10, r8, #4
        ldr     r8, [sp]
        add     r9, r9, #4
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #4]
        str     r9, [sp, #0x14]
        add     r1, r8, #4
        add     r9, r8, #0xC
        ldr     r8, [sp, #8]
        add     lr, r3, #0xC
        add     r11, r7, #4
        add     r0, r8, #4
        str     lr, [sp, #0x10]
        add     r3, r3, #4
        add     r12, r12, #4
        add     lr, r5, #4
        add     r2, r6, #4
        add     r8, r8, #0xC
        add     r7, r7, #0xC
        str     r7, [sp, #8]
        str     r11, [sp, #0x58]
        str     r8, [sp, #0x60]
        str     r0, [sp, #0x54]
        str     r9, [sp]
        str     r1, [sp, #0x50]
        str     r2, [sp, #4]
        str     r10, [sp, #0x5C]
        str     lr, [sp, #0x44]
        str     r12, [sp, #0x48]
        str     r3, [sp, #0x4C]
        str     r4, [sp, #0x28]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
LCPY1:
        ldr     r1, [sp, #0x58]
        ldr     r2, [sp, #8]
        ldr     r12, [sp, #0x24]
        ldr     r11, [r1, #0xC]
        ldr     r5, [r1, #0x10]
        ldr     r9, [r2, #0xC]
        ldr     r4, [r2, #0x10]
        ldr     r7, [r12]
        ldr     r8, [r12, #4]
        ldr     r10, [r12, #8]
        ldr     r6, [r12, #0xC]
        mov     r0, r11
        mov     r2, r7
        mov     r1, r5
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r3, r6
        mov     r1, r4
        mov     r2, r10
        mov     r0, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x68]
        mov     r2, r0
        ldr     r0, [sp, #0x6C]
        bl      __subdf3
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r2, r7
        mov     r3, r8
        mov     r1, r4
        mov     r0, r9
        bl      __muldf3
        mov     r4, r0
        mov     r7, r1
        mov     r2, r10
        mov     r0, r11
        mov     r1, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r4
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r12, [sp, #0x24]
        ldr     r7, [r2, #0xC]
        ldr     r4, [r2, #0x10]
        ldr     r2, [sp, #0x54]
        ldr     r9, [r12, #0x10]
        ldr     r8, [r12, #0x14]
        ldr     r11, [r12, #0x18]
        ldr     r6, [r2, #0x10]
        ldr     r10, [r2, #0xC]
        ldr     r5, [r12, #0x1C]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x70]
        mov     r0, r10
        mov     r2, r9
        mov     r1, r6
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x78]
        mov     r2, r11
        mov     r3, r5
        mov     r1, r4
        mov     r0, r7
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x74]
        mov     r3, r1
        ldr     r1, [sp, #0x78]
        bl      __subdf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r2, r9
        mov     r1, r4
        mov     r3, r8
        mov     r0, r7
        bl      __muldf3
        mov     r4, r0
        mov     r7, r1
        mov     r1, r6
        mov     r2, r11
        mov     r0, r10
        mov     r3, r5
        bl      __muldf3
        mov     r3, r7
        mov     r2, r4
        bl      __adddf3
        ldr     r12, [sp]
        ldr     r3, [sp, #0x50]
        mov     r4, r0
        ldr     r6, [r12, #0x10]
        ldr     r8, [r12, #0xC]
        ldr     r11, [r3, #0xC]
        ldr     r7, [r3, #0x10]
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x24]
        mov     r0, r11
        ldr     r10, [r12, #0x28]
        ldr     r12, [r12, #0x2C]
        ldr     r5, [r3, #0x24]
        ldr     r9, [r3, #0x20]
        str     r1, [sp, #0x80]
        str     r12, [sp, #0x7C]
        mov     r1, r7
        mov     r2, r9
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0x7C]
        str     r1, [sp, #0x88]
        str     r0, [sp, #0x84]
        mov     r1, r6
        mov     r2, r10
        mov     r0, r8
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x88]
        mov     r2, r0
        ldr     r0, [sp, #0x84]
        bl      __subdf3
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x84]
        mov     r0, r8
        mov     r3, r5
        mov     r1, r6
        mov     r2, r9
        bl      __muldf3
        ldr     r3, [sp, #0x7C]
        mov     r5, r0
        mov     r6, r1
        mov     r2, r10
        mov     r0, r11
        mov     r1, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #0x40]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        mov     r5, r1
        ldr     r9, [r12, +lr, lsl #3]
        ldr     r12, [sp, #4]
        ldr     r7, [r12, #0x10]
        mov     r6, r0
        mov     r0, r9
        mov     r1, r7
        bl      __adddf3
        ldr     r12, [sp, #0x5C]
        ldr     r3, [sp, #0x80]
        ldr     r10, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        str     r1, [sp, #0x8C]
        str     r0, [sp, #0x7C]
        mov     r0, r10
        mov     r1, r8
        mov     r2, r4
        bl      __adddf3
        ldr     r3, [sp, #0x74]
        ldr     r2, [sp, #0x78]
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x94]
        mov     r1, r7
        mov     r0, r9
        bl      __subdf3
        ldr     r3, [sp, #0x80]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r1, r8
        mov     r0, r10
        mov     r2, r4
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0x80]
        mov     r9, r1
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x68]
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [sp, #0x64]
        mov     r7, r1
        ldr     r1, [sp, #0x70]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0x98]
        mov     r8, r1
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x68]
        bl      __subdf3
        mov     r11, r0
        ldr     r0, [sp, #0x64]
        mov     r10, r1
        ldr     r1, [sp, #0x70]
        mov     r2, r6
        mov     r3, r5
        bl      __subdf3
        mov     r6, r0
        mov     r5, r1
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x8C]
        mov     r2, r4
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x3C]
        ldr     lr, [sp, #0x1C]
        str     r0, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x44]
        mov     r3, r8
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        bl      __adddf3
        ldr     r12, [sp, #0x48]
        mov     r2, r4
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x8C]
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [sp, #0x4C]
        mov     r3, r8
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        bl      __subdf3
        ldr     r12, [sp, #0x10]
        mov     r2, r6
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        mov     r2, r11
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x80]
        mov     r1, r9
        mov     r3, r10
        bl      __subdf3
        ldr     r12, [sp, #0x18]
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        mov     r2, r6
        mov     r3, r5
        bl      __subdf3
        ldr     r12, [sp, #0x14]
        mov     r2, r11
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x80]
        mov     r1, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        add     r2, r2, #2
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x1C]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x30
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x10
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x10
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        blt     LCPY1
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
LCPY2:
        ldr     r3, [sp, #0x2C]
        add     r6, r6, r4, lsl #6
        add     r5, r5, r4, lsl #6
        subs    r3, r3, #1
        str     r3, [sp, #0x2C]
        bne     LCPY0
LCPY3:
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}


