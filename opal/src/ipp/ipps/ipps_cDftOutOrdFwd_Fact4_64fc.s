        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact4_64fc


_ipps_cDftOutOrdFwd_Fact4_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x98
        ldr     lr, [sp, #0xBC]
        ldr     r12, [sp, #0xC0]
        mov     r4, r3, lsl #3
        mul     r4, r2, r4
        rsb     r3, r3, r3, lsl #2
        add     r3, r12, r3, lsl #4
        cmp     r2, #1
        add     r0, r0, r4, lsl #3
        add     r1, r1, r4, lsl #3
        mov     r12, #0
        beq     LCPE4
        cmp     lr, #0
        ble     LCPE3
        rsb     r4, r2, r2, lsl #2
        mov     r5, r2, lsl #1
        str     r5, [sp, #0x34]
        str     r4, [sp, #0x38]
        str     r3, [sp, #4]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x44]
LCPE0:
        ldr     r3, [sp, #0x34]
        add     r5, r0, r2, lsl #4
        add     r4, r0, r2, lsl #5
        cmp     r3, #0
        ldr     r3, [sp, #0x38]
        add     r12, r1, r2, lsl #4
        add     r10, r0, r3, lsl #4
        add     lr, r1, r3, lsl #4
        add     r3, r1, r2, lsl #5
        ble     LCPE2
        sub     r11, r1, #4
        str     r11, [sp, #0x60]
        sub     r11, r1, #0xC
        str     r11, [sp, #0x54]
        sub     r11, r0, #4
        str     r11, [sp, #0x50]
        sub     r11, r0, #0xC
        str     r11, [sp, #0x4C]
        sub     r11, r10, #4
        str     r11, [sp, #0x48]
        sub     r11, r4, #4
        str     r11, [sp, #0x58]
        sub     r8, lr, #4
        sub     r7, r12, #4
        sub     r6, r3, #4
        sub     r11, r5, #4
        mov     r9, #0
        sub     lr, lr, #0xC
        sub     r12, r12, #0xC
        sub     r3, r3, #0xC
        sub     r10, r10, #0xC
        sub     r4, r4, #0xC
        sub     r5, r5, #0xC
        str     r11, [sp, #0x5C]
        str     r5, [sp, #8]
        str     r4, [sp, #0x10]
        str     r10, [sp, #0xC]
        str     r3, [sp, #0x24]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     r7, [sp, #0x18]
        str     lr, [sp, #0x20]
        str     r8, [sp, #0x28]
        str     r9, [sp]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x2C]
        str     r2, [sp, #0x40]
LCPE1:
        ldr     r1, [sp, #8]
        ldr     r12, [sp, #0x5C]
        ldr     r3, [sp, #4]
        ldr     r11, [r1, #0xC]
        ldr     r6, [r1, #0x10]
        ldr     r8, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        ldr     r12, [sp, #4]
        ldr     r9, [r3]
        ldr     r4, [r3, #4]
        mov     r0, r11
        ldr     r10, [r12, #8]
        ldr     r7, [r12, #0xC]
        mov     r3, r4
        mov     r1, r6
        mov     r2, r9
        bl      __muldf3
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r1, r5
        mov     r0, r8
        mov     r2, r10
        mov     r3, r7
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x64]
        mov     r3, r1
        ldr     r1, [sp, #0x68]
        bl      __subdf3
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r1, r5
        mov     r0, r8
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r1, r6
        mov     r2, r10
        mov     r3, r7
        mov     r0, r11
        bl      __muldf3
        mov     r3, r4
        mov     r2, r5
        bl      __adddf3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x10]
        ldr     r9, [r12, #0x14]
        ldr     r10, [r12, #0x18]
        ldr     r6, [r12, #0x1C]
        ldr     r12, [sp, #0x58]
        ldr     r4, [r2, #0x10]
        ldr     r11, [r3, #0xC]
        ldr     r7, [r3, #0x10]
        ldr     r8, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x70]
        mov     r2, r4
        mov     r1, r7
        mov     r3, r9
        mov     r0, r11
        bl      __muldf3
        str     r1, [sp, #0x78]
        str     r0, [sp, #0x74]
        mov     r1, r5
        mov     r2, r10
        mov     r0, r8
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x78]
        mov     r2, r0
        ldr     r0, [sp, #0x74]
        bl      __subdf3
        str     r1, [sp, #0x74]
        str     r0, [sp, #0x78]
        mov     r1, r5
        mov     r2, r4
        mov     r0, r8
        mov     r3, r9
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r1, r7
        mov     r3, r6
        mov     r2, r10
        mov     r0, r11
        bl      __muldf3
        mov     r3, r4
        mov     r2, r5
        bl      __adddf3
        ldr     r12, [sp, #4]
        ldr     r3, [sp, #0xC]
        mov     r4, r0
        ldr     r9, [r12, #0x20]
        ldr     r8, [r12, #0x24]
        ldr     r6, [r3, #0x10]
        ldr     r10, [r12, #0x28]
        ldr     r11, [r3, #0xC]
        ldr     r12, [r12, #0x2C]
        mov     r2, r9
        str     r12, [sp, #0x7C]
        ldr     r12, [sp, #0x48]
        mov     r0, r11
        mov     r3, r8
        ldr     r7, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        str     r1, [sp, #0x80]
        mov     r1, r6
        bl      __muldf3
        ldr     r3, [sp, #0x7C]
        str     r1, [sp, #0x88]
        str     r0, [sp, #0x84]
        mov     r0, r7
        mov     r2, r10
        mov     r1, r5
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        ldr     r1, [sp, #0x88]
        ldr     r0, [sp, #0x84]
        bl      __subdf3
        str     r1, [sp, #0x84]
        str     r0, [sp, #0x88]
        mov     r1, r5
        mov     r2, r9
        mov     r0, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0x7C]
        mov     r5, r0
        mov     r7, r1
        mov     r2, r10
        mov     r1, r6
        mov     r0, r11
        bl      __muldf3
        mov     r3, r7
        mov     r2, r5
        bl      __adddf3
        ldr     lr, [sp, #0x2C]
        ldr     r12, [sp]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        mov     r5, r0
        ldr     r9, [lr, +r12, lsl #3]
        ldr     r12, [sp, #0x4C]
        ldr     r7, [r12, #0x10]
        mov     r6, r1
        mov     r0, r9
        mov     r1, r7
        bl      __adddf3
        ldr     r12, [sp, #0x50]
        ldr     r3, [sp, #0x80]
        ldr     r10, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x8C]
        mov     r0, r10
        mov     r2, r4
        mov     r1, r8
        bl      __adddf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        str     r0, [sp, #0x90]
        str     r1, [sp, #0x94]
        mov     r1, r7
        mov     r0, r9
        bl      __subdf3
        ldr     r3, [sp, #0x80]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r0, r10
        mov     r2, r4
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        mov     r8, r0
        ldr     r0, [sp, #0x68]
        mov     r9, r1
        ldr     r1, [sp, #0x64]
        bl      __adddf3
        mov     r10, r0
        mov     r4, r1
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x70]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r3, [sp, #0x84]
        ldr     r2, [sp, #0x88]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x68]
        mov     r7, r1
        ldr     r1, [sp, #0x64]
        bl      __subdf3
        str     r1, [sp, #0x88]
        mov     r11, r0
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x70]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        mov     r5, r0
        ldr     r0, [sp, #0x7C]
        mov     r6, r1
        ldr     r1, [sp, #0x8C]
        mov     r2, r10
        mov     r3, r4
        bl      __adddf3
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp]
        str     r0, [lr, +r12, lsl #3]
        ldr     r12, [sp, #0x54]
        mov     r3, r7
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x80]
        bl      __adddf3
        ldr     r12, [sp, #0x60]
        mov     r2, r10
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x8C]
        mov     r3, r4
        bl      __subdf3
        ldr     r12, [sp, #0x24]
        mov     r3, r7
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x90]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x80]
        bl      __subdf3
        ldr     r12, [sp, #0x1C]
        mov     r2, r5
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        mov     r2, r11
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r3, [sp, #0x88]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r12, [sp, #0x18]
        mov     r2, r5
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        mov     r3, r6
        bl      __subdf3
        ldr     r3, [sp, #0x20]
        mov     r2, r11
        str     r0, [r3, #0xC]
        str     r1, [r3, #0x10]
        ldr     r3, [sp, #0x88]
        mov     r0, r8
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp]
        add     r2, r2, #2
        str     r2, [sp]
        ldr     r2, [sp, #0x28]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp]
        cmp     r1, r0
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x10
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        blt     LCPE1
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        ldr     r2, [sp, #0x40]
LCPE2:
        ldr     r3, [sp, #0x44]
        ldr     r12, [sp, #0x3C]
        add     r0, r0, r2, lsl #6
        add     r3, r3, #1
        str     r3, [sp, #0x44]
        cmp     r3, r12
        ldr     r3, [sp, #4]
        add     r1, r1, r2, lsl #6
        add     r3, r3, #0x30
        str     r3, [sp, #4]
        blt     LCPE0
LCPE3:
        add     sp, sp, #0x98
        ldmia   sp!, {r4 - r11, pc}
LCPE4:
        mov     r2, lr, lsl #3
        cmp     r2, #0
        ble     LCPE3
        sub     r8, r0, #0xC
        str     r8, [sp, #0x50]
        sub     lr, r1, #0xC
        sub     r8, r0, #0x14
        str     lr, [sp, #0x5C]
        str     r8, [sp, #0x60]
        sub     lr, r1, #0x24
        sub     r8, r0, #0x1C
        str     lr, [sp, #0x54]
        str     r8, [sp, #0x58]
        sub     r7, r1, #4
        sub     r6, r1, #0x2C
        sub     r5, r1, #0x14
        sub     r4, r1, #0x1C
        sub     lr, r1, #0x34
        sub     r11, r0, #0x34
        sub     r10, r0, #0x3C
        sub     r9, r0, #4
        sub     r8, r0, #0x24
        sub     r1, r1, #0x3C
        sub     r0, r0, #0x2C
        str     r0, [sp, #0x30]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x20]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0x40]
        str     r4, [sp, #0x3C]
        str     r5, [sp, #0x38]
        str     r6, [sp, #0x34]
        str     r7, [sp, #0x48]
        str     r2, [sp, #0x4C]
        str     r3, [sp, #4]
        str     r12, [sp, #0x44]
LCPE5:
        ldr     r12, [sp, #4]
        ldr     r1, [sp, #0x30]
        ldr     r9, [r12]
        ldr     r8, [r12, #4]
        ldr     r11, [r12, #8]
        ldr     r5, [r1, #0x40]
        ldr     r6, [r12, #0xC]
        ldr     r12, [sp, #0x28]
        ldr     r10, [r1, #0x3C]
        mov     r2, r9
        mov     r1, r5
        ldr     r7, [r12, #0x3C]
        ldr     r4, [r12, #0x40]
        mov     r3, r8
        mov     r0, r10
        bl      __muldf3
        str     r0, [sp, #0x94]
        str     r1, [sp, #0x90]
        mov     r1, r4
        mov     r0, r7
        mov     r2, r11
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x90]
        mov     r2, r0
        ldr     r0, [sp, #0x94]
        bl      __subdf3
        str     r0, [sp, #0x94]
        str     r1, [sp, #0x90]
        mov     r3, r8
        mov     r1, r4
        mov     r0, r7
        mov     r2, r9
        bl      __muldf3
        mov     r4, r0
        mov     r7, r1
        mov     r3, r6
        mov     r0, r10
        mov     r2, r11
        mov     r1, r5
        bl      __muldf3
        mov     r3, r7
        mov     r2, r4
        bl      __adddf3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x60]
        ldr     r2, [sp, #0x58]
        ldr     r9, [r3, #0x10]
        ldr     r4, [r3, #0x14]
        ldr     r8, [r12, #0x3C]
        ldr     r5, [r12, #0x40]
        ldr     r12, [sp, #4]
        ldr     r11, [r2, #0x3C]
        ldr     r6, [r2, #0x40]
        ldr     r10, [r12, #0x18]
        ldr     r7, [r12, #0x1C]
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x88]
        mov     r1, r6
        mov     r3, r4
        mov     r0, r11
        mov     r2, r9
        bl      __muldf3
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r2, r10
        mov     r3, r7
        mov     r1, r5
        mov     r0, r8
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x84]
        mov     r3, r1
        ldr     r1, [sp, #0x80]
        bl      __subdf3
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r1, r5
        mov     r2, r9
        mov     r3, r4
        mov     r0, r8
        bl      __muldf3
        mov     r5, r1
        mov     r4, r0
        mov     r1, r6
        mov     r0, r11
        mov     r2, r10
        mov     r3, r7
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #4]
        mov     r4, r0
        ldr     r5, [r3, #0x20]
        ldr     r3, [sp, #0x50]
        ldr     r10, [r3, #0x3C]
        ldr     r3, [r3, #0x40]
        mov     r2, r5
        str     r3, [sp, #0x7C]
        ldr     r7, [r12, #0x2C]
        ldr     r8, [r12, #0x24]
        ldr     r11, [r12, #0x28]
        ldr     r12, [sp, #0x24]
        mov     r0, r10
        mov     r3, r8
        ldr     r9, [r12, #0x3C]
        ldr     r6, [r12, #0x40]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r0, r9
        mov     r2, r11
        mov     r3, r7
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x74]
        mov     r3, r1
        ldr     r1, [sp, #0x70]
        bl      __subdf3
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r2, r5
        mov     r0, r9
        mov     r3, r8
        mov     r1, r6
        bl      __muldf3
        mov     r6, r1
        ldr     r1, [sp, #0x7C]
        mov     r5, r0
        mov     r2, r11
        mov     r3, r7
        mov     r0, r10
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r12, [sp, #0x1C]
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x80]
        ldr     r9, [r12, #0x3C]
        ldr     r7, [r12, #0x40]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r9
        mov     r1, r7
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        ldr     r3, [sp, #0x78]
        mov     r2, r4
        ldr     r8, [r12, #0x40]
        ldr     r10, [r12, #0x3C]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x6C]
        mov     r0, r10
        mov     r1, r8
        bl      __adddf3
        ldr     r3, [sp, #0x80]
        ldr     r2, [sp, #0x84]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r9
        mov     r1, r7
        bl      __subdf3
        ldr     r3, [sp, #0x78]
        str     r1, [sp, #0x80]
        str     r0, [sp, #0x84]
        mov     r1, r8
        mov     r2, r4
        mov     r0, r10
        bl      __subdf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x94]
        mov     r9, r1
        ldr     r1, [sp, #0x90]
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [sp, #0x8C]
        mov     r4, r1
        ldr     r1, [sp, #0x88]
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x94]
        mov     r8, r1
        ldr     r1, [sp, #0x90]
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x88]
        mov     r2, r6
        mov     r3, r5
        bl      __subdf3
        mov     r6, r0
        ldr     r0, [sp, #0x7C]
        mov     r5, r1
        ldr     r1, [sp, #0x6C]
        mov     r2, r7
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        mov     r3, r8
        str     r0, [r12, #0x3C]
        ldr     r12, [sp, #0x18]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        ldr     r2, [sp, #0x2C]
        bl      __adddf3
        ldr     r12, [sp, #0x40]
        mov     r2, r7
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x6C]
        mov     r3, r4
        bl      __subdf3
        ldr     r12, [sp, #0x3C]
        mov     r3, r8
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        ldr     r2, [sp, #0x2C]
        bl      __subdf3
        ldr     r12, [sp, #0x38]
        mov     r2, r6
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x80]
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x34]
        mov     r2, r11
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x78]
        mov     r1, r9
        mov     r3, r10
        bl      __subdf3
        ldr     r12, [sp, #0x54]
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x80]
        mov     r2, r6
        mov     r3, r5
        bl      __subdf3
        ldr     r12, [sp, #0x5C]
        mov     r2, r11
        str     r0, [r12, #0x3C]
        str     r1, [r12, #0x40]
        ldr     r0, [sp, #0x78]
        mov     r1, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        add     r2, r2, #8
        str     r2, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        str     r1, [r2, #0x40]
        str     r0, [r2, #0x3C]
        ldr     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x44]
        cmp     r0, r1
        ldr     r0, [sp, #4]
        add     r0, r0, #0x30
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x40
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x40
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x40
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x40
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x40
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x40
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x40
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x40
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x40
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x40
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x40
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x40
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x40
        str     r0, [sp, #0x30]
        blt     LCPE5
        add     sp, sp, #0x98
        ldmia   sp!, {r4 - r11, pc}


