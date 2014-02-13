        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact4_64fc


_ipps_cDftOutOrdInv_Fact4_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA4
        ldr     r12, [sp, #0xC8]
        ldr     lr, [sp, #0xCC]
        mov     r4, r3, lsl #3
        mul     r4, r2, r4
        rsb     r3, r3, r3, lsl #2
        cmp     r2, #1
        add     r0, r0, r4, lsl #3
        add     r1, r1, r4, lsl #3
        add     r4, lr, r3, lsl #4
        mov     r3, #0
        beq     LCOW4
        cmp     r12, #0
        ble     LCOW3
        rsb     lr, r2, r2, lsl #2
        mov     r5, r2, lsl #1
        str     r5, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     r3, [sp, #0x38]
LCOW0:
        ldr     r3, [sp, #0x28]
        add     r9, r0, r2, lsl #4
        add     r8, r0, r2, lsl #5
        cmp     r3, #0
        ldr     r3, [sp, #0x2C]
        add     r10, r1, r2, lsl #4
        add     r12, r1, r2, lsl #5
        add     r11, r0, r3, lsl #4
        add     r3, r1, r3, lsl #4
        ble     LCOW2
        sub     r7, r10, #4
        sub     r10, r10, #0xC
        str     r10, [sp, #0x58]
        sub     r10, r1, #4
        str     r10, [sp, #0x48]
        sub     r10, r1, #0xC
        str     r10, [sp, #0x44]
        sub     r10, r11, #4
        str     r10, [sp, #0x40]
        sub     r10, r9, #4
        str     r10, [sp, #0x3C]
        sub     r10, r11, #0xC
        sub     r11, r8, #4
        sub     r8, r8, #0xC
        sub     lr, r3, #4
        sub     r6, r12, #4
        str     r11, [sp, #0x50]
        str     r8, [sp, #0x54]
        sub     r3, r3, #0xC
        sub     r12, r12, #0xC
        sub     r9, r9, #0xC
        sub     r11, r0, #4
        sub     r8, r0, #0xC
        mov     r5, #0
        str     r11, [sp, #0x4C]
        str     r8, [sp, #0x18]
        str     r9, [sp, #4]
        str     r10, [sp]
        str     r7, [sp, #0x10]
        str     r12, [sp, #8]
        str     r6, [sp, #0xC]
        str     r3, [sp, #0x14]
        str     lr, [sp, #0x1C]
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x20]
        str     r2, [sp, #0x34]
LCOW1:
        ldr     r0, [sp, #0x20]
        ldr     r0, [r0, +r5, lsl #3]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x18]
        ldr     r0, [r0, #0x10]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x60]
        ldr     r9, [r0, #0xC]
        ldr     r6, [r0, #0x10]
        ldr     r0, [sp, #0x5C]
        mov     r2, r9
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x50]
        ldr     r7, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        ldr     r12, [sp, #0x4C]
        mov     r2, r11
        mov     r3, r7
        ldr     r8, [r12, #0x10]
        ldr     r10, [r12, #0xC]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r1, r8
        mov     r0, r10
        bl      __adddf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x5C]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x60]
        mov     r2, r9
        mov     r3, r6
        bl      __subdf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r2, r11
        mov     r0, r10
        mov     r1, r8
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [r2, #0xC]
        str     r3, [sp, #0x74]
        ldr     r2, [r2, #0x10]
        ldr     r3, [sp]
        str     r2, [sp, #0x78]
        ldr     r6, [r3, #0x10]
        ldr     r9, [r3, #0xC]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x80]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x78]
        mov     r2, r9
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x3C]
        ldr     r8, [r12, #0x10]
        ldr     r10, [r12, #0xC]
        ldr     r12, [sp, #0x40]
        ldr     r7, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x88]
        mov     r3, r7
        mov     r2, r11
        mov     r0, r10
        mov     r1, r8
        bl      __adddf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x78]
        mov     r2, r9
        mov     r3, r6
        bl      __subdf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r1, r8
        mov     r3, r7
        mov     r2, r11
        mov     r0, r10
        bl      __subdf3
        mov     r6, r1
        ldr     r1, [sp, #0x68]
        ldr     r2, [sp, #0x84]
        mov     r7, r0
        ldr     r0, [sp, #0x64]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x6C]
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x70]
        bl      __adddf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x88]
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x64]
        str     r1, [sp, #0xA0]
        ldr     r1, [sp, #0x68]
        bl      __subdf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x90]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x6C]
        str     r1, [sp, #0x84]
        ldr     r1, [sp, #0x70]
        bl      __subdf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x60]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0x5C]
        mov     r3, r6
        mov     r2, r7
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        mov     r8, r0
        ldr     r0, [sp, #0x7C]
        mov     r9, r1
        ldr     r1, [sp, #0x80]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        mov     r11, r1
        ldr     r1, [sp, #0x5C]
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        str     r0, [sp, #0x70]
        mov     r7, r1
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x80]
        bl      __subdf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x94]
        mov     r6, r1
        str     r3, [r2, +r5, lsl #3]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x98]
        mov     r1, r9
        add     r5, r5, #2
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x9C]
        ldr     r2, [sp, #0x48]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0xA0]
        str     r3, [r2, #0x10]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        str     r0, [sp, #0xA0]
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0x98]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x84]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r8, r0
        ldr     r0, [sp, #0x90]
        mov     r9, r1
        ldr     r1, [sp, #0x8C]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #8]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x90]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        ldr     r1, [sp, #0x8C]
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r9, r1
        ldr     r1, [sp, #0x84]
        mov     r8, r0
        ldr     r0, [sp, #0x88]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r9
        mov     r0, r8
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x70]
        ldr     r2, [r4, #0x20]
        ldr     r3, [r4, #0x24]
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [r4, #0x28]
        ldr     r3, [r4, #0x2C]
        mov     r8, r0
        ldr     r0, [sp, #0xA0]
        mov     r9, r1
        mov     r1, r6
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [r4, #0x20]
        ldr     r3, [r4, #0x24]
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [r4, #0x28]
        ldr     r3, [r4, #0x2C]
        mov     r6, r0
        ldr     r0, [sp, #0x70]
        mov     r8, r1
        mov     r1, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x28]
        cmp     r5, r0
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x10
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x10
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x3C]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        blt     LCOW1
        ldr     r1, [sp, #0x24]
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0x34]
LCOW2:
        ldr     r3, [sp, #0x38]
        ldr     r12, [sp, #0x30]
        add     r4, r4, #0x30
        add     r3, r3, #1
        str     r3, [sp, #0x38]
        cmp     r3, r12
        add     r0, r0, r2, lsl #6
        add     r1, r1, r2, lsl #6
        blt     LCOW0
LCOW3:
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LCOW4:
        mov     r2, r12, lsl #3
        cmp     r2, #0
        ble     LCOW3
        sub     r8, r0, #0x2C
        str     r8, [sp, #0x48]
        sub     r12, r1, #0xC
        sub     r8, r0, #0x14
        str     r12, [sp, #0x54]
        str     r8, [sp, #0x58]
        sub     r12, r1, #0x14
        sub     r8, r0, #0x34
        str     r12, [sp, #0x4C]
        str     r8, [sp, #0x50]
        sub     r7, r1, #4
        sub     r6, r1, #0x1C
        sub     r5, r1, #0x24
        sub     lr, r1, #0x2C
        sub     r12, r1, #0x34
        sub     r11, r0, #4
        sub     r10, r0, #0x24
        sub     r9, r0, #0xC
        sub     r8, r0, #0x1C
        sub     r1, r1, #0x3C
        sub     r0, r0, #0x3C
        str     r0, [sp, #0x24]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x1C]
        str     r1, [sp, #0x3C]
        str     r12, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r5, [sp, #0x2C]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r3, [sp, #0x38]
LCOW5:
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x24]
        ldr     r7, [r0, #0x40]
        ldr     r10, [r0, #0x3C]
        ldr     r0, [r1, #0x3C]
        mov     r3, r7
        str     r0, [sp, #0xA0]
        ldr     r5, [r1, #0x40]
        ldr     r0, [sp, #0xA0]
        mov     r2, r10
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #0x58]
        ldr     r6, [r12, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r12, [sp, #0x50]
        mov     r2, r11
        mov     r3, r6
        ldr     r9, [r12, #0x3C]
        ldr     r8, [r12, #0x40]
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0x98]
        mov     r0, r9
        mov     r1, r8
        bl      __adddf3
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0xA0]
        str     r1, [sp, #0x90]
        mov     r1, r5
        mov     r2, r10
        mov     r3, r7
        bl      __subdf3
        str     r1, [sp, #0x8C]
        str     r0, [sp, #0xA0]
        mov     r1, r8
        mov     r2, r11
        mov     r3, r6
        mov     r0, r9
        bl      __subdf3
        ldr     r3, [sp, #0x10]
        ldr     r2, [r3, #0x3C]
        str     r2, [sp, #0x88]
        ldr     r2, [sp, #0x48]
        ldr     r7, [r3, #0x40]
        ldr     r5, [r2, #0x40]
        ldr     r10, [r2, #0x3C]
        ldr     r2, [sp, #0x88]
        str     r1, [sp, #0x80]
        str     r0, [sp, #0x84]
        mov     r0, r10
        mov     r1, r5
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x1C]
        ldr     r2, [sp, #0x14]
        ldr     r8, [r12, #0x40]
        ldr     r11, [r12, #0x3C]
        ldr     r9, [r2, #0x3C]
        ldr     r6, [r2, #0x40]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        mov     r1, r6
        mov     r3, r8
        mov     r0, r9
        mov     r2, r11
        bl      __adddf3
        ldr     r2, [sp, #0x88]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r1, r5
        mov     r3, r7
        mov     r0, r10
        bl      __subdf3
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x6C]
        mov     r1, r6
        mov     r3, r8
        mov     r0, r9
        mov     r2, r11
        bl      __subdf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        mov     r9, r0
        ldr     r0, [sp, #0x9C]
        mov     r10, r1
        ldr     r1, [sp, #0x98]
        bl      __adddf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x94]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x90]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        bl      __adddf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x9C]
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x98]
        bl      __subdf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x94]
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x90]
        bl      __subdf3
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0xA0]
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        mov     r2, r9
        mov     r3, r10
        bl      __subdf3
        ldr     r3, [sp, #0x6C]
        ldr     r2, [sp, #0x88]
        mov     r7, r0
        ldr     r0, [sp, #0x84]
        mov     r8, r1
        ldr     r1, [sp, #0x80]
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0xA0]
        mov     r6, r1
        ldr     r1, [sp, #0x8C]
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x80]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x6C]
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x68]
        mov     r9, r1
        str     r3, [r2, #0x3C]
        ldr     r3, [sp, #0x64]
        mov     r1, r8
        str     r3, [r2, #0x40]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x60]
        str     r3, [r2, #0x3C]
        ldr     r3, [sp, #0x5C]
        str     r3, [r2, #0x40]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        str     r0, [sp, #0xA0]
        mov     r0, r7
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        str     r1, [sp, #0x88]
        str     r0, [sp, #0x8C]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x88]
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        str     r1, [r2, #0x40]
        str     r0, [r2, #0x3C]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        mov     r0, r5
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r7
        mov     r1, r8
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0x98]
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r6, r1
        ldr     r1, [sp, #0x90]
        mov     r5, r0
        ldr     r0, [sp, #0x94]
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r0, [sp, #0x94]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        ldr     r1, [sp, #0x90]
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r5, r0
        ldr     r0, [sp, #0x9C]
        mov     r6, r1
        ldr     r1, [sp, #0x98]
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [sp, #0x4C]
        str     r0, [r2, #0x3C]
        str     r1, [r2, #0x40]
        ldr     r2, [r4, #0x20]
        ldr     r3, [r4, #0x24]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [r4, #0x28]
        ldr     r3, [r4, #0x2C]
        mov     r5, r0
        ldr     r0, [sp, #0xA0]
        mov     r6, r1
        mov     r1, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        str     r1, [r2, #0x40]
        str     r0, [r2, #0x3C]
        ldr     r2, [r4, #0x20]
        ldr     r3, [r4, #0x24]
        ldr     r0, [sp, #0xA0]
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [r4, #0x28]
        ldr     r3, [r4, #0x2C]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        add     r4, r4, #0x30
        add     r2, r2, #8
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x40]
        str     r1, [r2, #0x40]
        str     r0, [r2, #0x3C]
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x44]
        cmp     r0, r1
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x40
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x40
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x40
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x40
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x40
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x40
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x40
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x40
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x40
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x40
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x40
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x40
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x40
        str     r0, [sp, #0x24]
        blt     LCOW5
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}


