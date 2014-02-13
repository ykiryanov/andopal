        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact3_64fc


_ipps_cDftOutOrdFwd_Fact3_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r12, [sp, #0xA8]
        ldr     lr, [sp, #0xAC]
        add     r4, r2, r2, lsl #2
        add     r4, r2, r4
        mul     r4, r4, r3
        cmp     r2, #1
        add     lr, lr, r3, lsl #5
        add     r0, r0, r4, lsl #3
        add     r1, r1, r4, lsl #3
        mov     r8, #0
        beq     LCPF4
        cmp     r12, #0
        ble     LCPF3
        ldr     r5, [pc, #0x9DC]
        ldr     r7, [pc, #0x9DC]
        mov     r3, r2, lsl #1
        ldr     r4, [r5]
        ldr     r5, [r5, #4]
        ldr     r6, [r7]
        ldr     r7, [r7, #4]
        rsb     r9, r2, r2, lsl #2
        str     r9, [sp, #0x48]
        str     r3, [sp, #0x44]
        str     r7, [sp, #0x34]
        str     r6, [sp, #0x28]
        str     r5, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     lr, [sp, #0x24]
        str     r12, [sp, #0x4C]
        str     r2, [sp, #0x50]
        str     r8, [sp, #0x54]
LCPF0:
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x50]
        cmp     r2, #0
        add     lr, r0, r3, lsl #4
        add     r12, r0, r3, lsl #5
        add     r2, r1, r3, lsl #4
        add     r3, r1, r3, lsl #5
        ble     LCPF2
        sub     r5, r12, #4
        sub     r12, r12, #0xC
        str     r12, [sp, #0x5C]
        sub     r11, r3, #4
        sub     r10, r2, #4
        sub     r12, lr, #4
        sub     r3, r3, #0xC
        sub     r2, r2, #0xC
        sub     r9, r1, #4
        sub     r8, r1, #0xC
        sub     r7, r0, #4
        sub     r6, r0, #0xC
        sub     lr, lr, #0xC
        mov     r4, #0
        str     r12, [sp, #0x58]
        str     lr, [sp, #4]
        str     r5, [sp, #8]
        str     r6, [sp, #0x20]
        str     r7, [sp]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r2, [sp, #0x14]
        str     r10, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     r11, [sp, #0x38]
        str     r1, [sp, #0x40]
        str     r0, [sp, #0x3C]
LCPF1:
        ldr     r12, [sp, #0x24]
        ldr     r1, [sp, #4]
        ldr     r2, [r12]
        ldr     r10, [r1, #0xC]
        ldr     r7, [r1, #0x10]
        str     r2, [sp, #0x60]
        ldr     r8, [r12, #4]
        ldr     r11, [r12, #8]
        ldr     r6, [r12, #0xC]
        ldr     r12, [sp, #0x58]
        ldr     r2, [sp, #0x60]
        mov     r0, r10
        ldr     r5, [r12, #0x10]
        ldr     r9, [r12, #0xC]
        mov     r1, r7
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r3, r6
        mov     r0, r9
        mov     r2, r11
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x64]
        mov     r3, r1
        ldr     r1, [sp, #0x68]
        bl      __subdf3
        ldr     r2, [sp, #0x60]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r9
        mov     r3, r8
        mov     r1, r5
        bl      __muldf3
        mov     r5, r0
        mov     r8, r1
        mov     r2, r11
        mov     r0, r10
        mov     r1, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        mov     r5, r0
        mov     r7, r1
        ldr     r11, [r2, #0xC]
        ldr     r10, [r2, #0x10]
        ldr     r2, [sp, #0x24]
        mov     r0, r11
        mov     r1, r10
        ldr     r3, [r2, #0x10]
        str     r3, [sp, #0x60]
        ldr     r3, [r2, #0x14]
        str     r3, [sp, #0x6C]
        ldr     r3, [r2, #0x18]
        str     r3, [sp, #0x70]
        ldr     r9, [r2, #0x1C]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x6C]
        ldr     r12, [r2, #0xC]
        str     r12, [sp, #0x74]
        ldr     r2, [r2, #0x10]
        str     r2, [sp, #0x78]
        ldr     r2, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [sp, #0x70]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0x78]
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x80]
        mov     r2, r0
        ldr     r0, [sp, #0x7C]
        bl      __subdf3
        mov     r8, r1
        ldr     r3, [sp, #0x6C]
        mov     r6, r0
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x78]
        ldr     r2, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [sp, #0x70]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r1, r10
        mov     r3, r9
        mov     r0, r11
        bl      __muldf3
        ldr     r2, [sp, #0x80]
        ldr     r3, [sp, #0x7C]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x68]
        mov     r9, r1
        ldr     r1, [sp, #0x64]
        mov     r2, r6
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r3, r9
        mov     r1, r7
        mov     r2, r10
        mov     r0, r5
        bl      __adddf3
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x68]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x64]
        mov     r3, r8
        mov     r2, r6
        bl      __subdf3
        str     r1, [sp, #0x6C]
        str     r0, [sp, #0x70]
        mov     r0, r5
        mov     r3, r9
        mov     r1, r7
        mov     r2, r10
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x20]
        ldr     r7, [r2, +r4, lsl #3]
        ldr     r2, [sp, #0x30]
        ldr     r6, [r3, #0x10]
        ldr     r3, [sp, #0x2C]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        ldr     r9, [r12, #0xC]
        ldr     r8, [r12, #0x10]
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x74]
        mov     r5, r0
        ldr     r0, [sp, #0x78]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x34]
        mov     r11, r0
        ldr     r0, [sp, #0x68]
        mov     r10, r1
        ldr     r1, [sp, #0x64]
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp, #0x70]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x34]
        ldr     r1, [sp, #0x6C]
        bl      __muldf3
        ldr     r2, [sp, #0x80]
        ldr     r3, [sp, #0x7C]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r12, [sp, #0x40]
        str     r0, [r12, +r4, lsl #3]
        ldr     r12, [sp, #0x10]
        add     r4, r4, #2
        str     r1, [r12, #0x10]
        ldr     r12, [sp]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        ldr     r0, [r12, #0xC]
        ldr     r1, [r12, #0x10]
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        mov     r2, r9
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r1, [sp, #0x60]
        mov     r0, r5
        mov     r3, r8
        bl      __subdf3
        ldr     r12, [sp, #0x14]
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x6C]
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        mov     r2, r9
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r1, [sp, #0x60]
        mov     r0, r5
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x6C]
        mov     r0, r11
        mov     r1, r10
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x44]
        cmp     r4, r0
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x10
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x10
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        blt     LCPF1
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
LCPF2:
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x4C]
        add     r2, r2, #1
        str     r2, [sp, #0x54]
        cmp     r2, r3
        ldr     r2, [sp, #0x24]
        add     r2, r2, #0x20
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x48]
        add     r0, r0, r2, lsl #4
        add     r1, r1, r2, lsl #4
        blt     LCPF0
LCPF3:
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LCPF4:
        add     r2, r12, r12, lsl #2
        add     r12, r12, r2
        cmp     r12, #0
        ble     LCPF3
        ldr     r4, [pc, #0x4AC]
        ldr     r2, [pc, #0x4AC]
        sub     r6, r1, #4
        ldr     r3, [r4]
        sub     r5, r1, #0xC
        sub     r11, r0, #0x24
        sub     r9, r0, #0x2C
        str     r3, [sp, #0x48]
        ldr     r7, [r2]
        ldr     r3, [r4, #4]
        ldr     r2, [r2, #4]
        sub     r4, r1, #0x14
        str     r4, [sp, #0x4C]
        str     r9, [sp, #0x5C]
        sub     r4, r1, #0x1C
        sub     r9, r0, #0xC
        str     r4, [sp, #0x58]
        str     r9, [sp, #0x50]
        sub     r4, r1, #0x24
        sub     r10, r0, #4
        sub     r9, r0, #0x14
        sub     r1, r1, #0x2C
        sub     r0, r0, #0x1C
        str     r0, [sp, #0x40]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r11, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r4, [sp, #0x28]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x38]
        str     r2, [sp, #0x34]
        str     r7, [sp, #0x30]
        str     r3, [sp, #0x2C]
        str     r12, [sp, #0x44]
        str     lr, [sp, #0x24]
        str     r8, [sp, #0x54]
LCPF5:
        ldr     r1, [sp, #0x40]
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #0x24]
        ldr     r10, [r1, #0x2C]
        ldr     r6, [r1, #0x30]
        ldr     r9, [r12, #0x2C]
        ldr     r5, [r12, #0x30]
        ldr     r12, [sp, #0x24]
        ldr     r8, [r3]
        ldr     r4, [r3, #4]
        mov     r0, r10
        ldr     r11, [r12, #8]
        ldr     r7, [r12, #0xC]
        mov     r3, r4
        mov     r1, r6
        mov     r2, r8
        bl      __muldf3
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r9
        mov     r2, r11
        mov     r1, r5
        mov     r3, r7
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x7C]
        mov     r2, r0
        ldr     r0, [sp, #0x80]
        bl      __subdf3
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r1, r5
        mov     r2, r8
        mov     r3, r4
        mov     r0, r9
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r1, r6
        mov     r2, r11
        mov     r0, r10
        mov     r3, r7
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x24]
        ldr     lr, [sp, #0x18]
        ldr     r11, [r2, #0x2C]
        ldr     r9, [r2, #0x30]
        ldr     r2, [r3, #0x10]
        mov     r6, r0
        mov     r0, r11
        mov     r5, r1
        str     r2, [sp, #0x78]
        ldr     r2, [r3, #0x14]
        mov     r1, r9
        str     r2, [sp, #0x74]
        ldr     r10, [r3, #0x18]
        ldr     r8, [r3, #0x1C]
        ldr     r12, [lr, #0x2C]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        str     r12, [sp, #0x70]
        ldr     r7, [lr, #0x30]
        bl      __muldf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x70]
        mov     r4, r1
        mov     r1, r7
        mov     r3, r8
        mov     r2, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x6C]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        mov     r4, r0
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x78]
        mov     r7, r1
        mov     r3, r8
        mov     r0, r11
        mov     r2, r10
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        mov     r3, r7
        bl      __adddf3
        ldr     r3, [sp, #0x6C]
        mov     r8, r0
        ldr     r0, [sp, #0x80]
        mov     r7, r1
        ldr     r1, [sp, #0x7C]
        mov     r2, r4
        bl      __adddf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r1, r5
        mov     r2, r8
        mov     r0, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r3, [sp, #0x6C]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0x68]
        ldr     r1, [sp, #0x7C]
        mov     r2, r4
        bl      __subdf3
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r3, r7
        mov     r0, r6
        mov     r1, r5
        mov     r2, r8
        bl      __subdf3
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x48]
        ldr     r7, [r3, #0x2C]
        ldr     r6, [r3, #0x30]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x64]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        ldr     r3, [sp, #0x2C]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x2C]
        ldr     r8, [r12, #0x30]
        ldr     r9, [r12, #0x2C]
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x68]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        mov     r8, r0
        ldr     r0, [sp, #0x6C]
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        mov     r10, r0
        ldr     r0, [sp, #0x80]
        mov     r9, r1
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        str     r0, [sp, #0x80]
        mov     r11, r1
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        str     r0, [r12, #0x2C]
        ldr     r12, [sp, #0x14]
        str     r1, [r12, #0x30]
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x68]
        ldr     r0, [r12, #0x2C]
        ldr     r1, [r12, #0x30]
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        mov     r2, r10
        str     r0, [r12, #0x2C]
        str     r1, [r12, #0x30]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r9
        bl      __subdf3
        ldr     r12, [sp, #0x58]
        str     r1, [r12, #0x30]
        str     r0, [r12, #0x2C]
        ldr     r1, [sp, #0x60]
        ldr     r2, [sp, #0x80]
        mov     r0, r8
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x4C]
        mov     r2, r10
        str     r0, [r12, #0x2C]
        str     r1, [r12, #0x30]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        str     r1, [r2, #0x30]
        str     r0, [r2, #0x2C]
        ldr     r1, [sp, #0x60]
        ldr     r2, [sp, #0x80]
        mov     r0, r8
        mov     r3, r11
        bl      __subdf3
        ldr     r2, [sp, #0x54]
        add     r2, r2, #6
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x38]
        str     r1, [r2, #0x30]
        str     r0, [r2, #0x2C]
        ldr     r1, [sp, #0x44]
        ldr     r0, [sp, #0x54]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x20
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x30
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x30
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x30
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x30
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x30
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x30
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x30
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x30
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x30
        str     r0, [sp, #0x40]
        blt     LCPF5
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   LCPF_C_1_3
        .long   LCPF_S_1_3


        .data
        .align  4


LCPF_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCPF_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


