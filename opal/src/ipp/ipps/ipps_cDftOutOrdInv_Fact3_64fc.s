        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact3_64fc


_ipps_cDftOutOrdInv_Fact3_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     r12, [sp, #0xB0]
        ldr     r4, [sp, #0xB4]
        add     lr, r2, r2, lsl #2
        add     lr, r2, lr
        mul     lr, lr, r3
        cmp     r2, #1
        add     r4, r4, r3, lsl #5
        add     r0, r0, lr, lsl #3
        add     r1, r1, lr, lsl #3
        mov     r8, #0
        beq     LCOX4
        cmp     r12, #0
        ble     LCOX3
        ldr     r5, [pc, #0x990]
        ldr     r7, [pc, #0x990]
        mov     r3, r2, lsl #1
        ldr     lr, [r5]
        ldr     r5, [r5, #4]
        ldr     r6, [r7]
        ldr     r7, [r7, #4]
        rsb     r9, r2, r2, lsl #2
        str     r9, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r7, [sp, #0x2C]
        str     r6, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x44]
        str     r2, [sp, #0x48]
        str     r8, [sp, #0x4C]
LCOX0:
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x48]
        cmp     r2, #0
        add     lr, r0, r3, lsl #4
        add     r12, r0, r3, lsl #5
        add     r2, r1, r3, lsl #4
        add     r3, r1, r3, lsl #5
        ble     LCOX2
        sub     r11, r0, #0xC
        str     r11, [sp, #0x58]
        sub     r11, r12, #4
        str     r11, [sp, #0x54]
        sub     r10, r3, #4
        sub     r9, r2, #4
        sub     r11, lr, #4
        sub     r3, r3, #0xC
        sub     r2, r2, #0xC
        sub     r7, r1, #4
        sub     r6, r1, #0xC
        sub     r5, r0, #4
        sub     r12, r12, #0xC
        sub     lr, lr, #0xC
        mov     r8, #0
        str     r11, [sp, #0x50]
        str     lr, [sp, #8]
        str     r12, [sp, #4]
        str     r5, [sp]
        str     r6, [sp, #0x1C]
        str     r7, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r3, [sp, #0x18]
        str     r10, [sp, #0x30]
        str     r1, [sp, #0x38]
        str     r0, [sp, #0x34]
LCOX1:
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r9, [r1, #0xC]
        ldr     r5, [r1, #0x10]
        ldr     r3, [r2, #0xC]
        mov     r0, r9
        str     r3, [sp, #0x5C]
        ldr     r2, [r2, #0x10]
        mov     r1, r5
        str     r2, [sp, #0x60]
        ldr     r3, [sp, #0x60]
        ldr     r2, [sp, #0x5C]
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        ldr     r11, [r2, #0xC]
        ldr     r7, [r2, #0x10]
        ldr     r6, [r3, #0x10]
        ldr     r10, [r3, #0xC]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r1, r7
        mov     r0, r11
        mov     r2, r10
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x70]
        mov     r1, r5
        mov     r0, r9
        bl      __subdf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r1, r7
        mov     r0, r11
        mov     r2, r10
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x58]
        ldr     r5, [r2, +r8, lsl #3]
        ldr     r2, [sp, #0x28]
        ldr     r6, [r3, #0x10]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x68]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x64]
        ldr     r3, [sp, #0x24]
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r12, [sp]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        ldr     r7, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x6C]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x2C]
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x74]
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        ldr     r0, [sp, #0x60]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x2C]
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x68]
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        mov     r1, r6
        mov     r0, r5
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r1, r7
        mov     r0, r11
        bl      __adddf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x7C]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x80]
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x84]
        mov     r5, r1
        ldr     r1, [sp, #0x88]
        bl      __subdf3
        mov     r6, r0
        ldr     r0, [sp, #0x7C]
        mov     r7, r1
        ldr     r1, [sp, #0x80]
        mov     r2, r9
        mov     r3, r10
        bl      __subdf3
        str     r0, [sp, #0x80]
        mov     r11, r1
        ldr     r1, [sp, #0x88]
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x74]
        ldr     r0, [sp, #0x84]
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x64]
        mov     r10, r0
        mov     r9, r1
        mov     r1, r5
        str     r3, [r2, +r8, lsl #3]
        ldr     r3, [sp, #0x68]
        ldr     r2, [sp, #0x1C]
        add     r8, r8, #2
        str     r3, [r2, #0x10]
        ldr     r3, [sp, #0x70]
        ldr     r2, [sp, #0xC]
        str     r3, [r2, #0xC]
        ldr     r3, [sp, #0x6C]
        str     r3, [r2, #0x10]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        ldr     r0, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        str     r1, [sp, #0x84]
        str     r0, [sp, #0x88]
        mov     r1, r7
        mov     r0, r6
        bl      __muldf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x84]
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r6, r0
        ldr     r0, [sp, #0x60]
        mov     r7, r1
        mov     r1, r5
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r7
        mov     r0, r6
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        ldr     r0, [sp, #0x80]
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r6, r1
        mov     r5, r0
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r5, r0
        ldr     r0, [sp, #0x80]
        mov     r6, r1
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #0x30]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x3C]
        cmp     r8, r0
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x10
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x1C]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        blt     LCOX1
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x34]
LCOX2:
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x44]
        add     r4, r4, #0x20
        add     r2, r2, #1
        str     r2, [sp, #0x4C]
        cmp     r2, r3
        ldr     r2, [sp, #0x40]
        add     r0, r0, r2, lsl #4
        add     r1, r1, r2, lsl #4
        blt     LCOX0
LCOX3:
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LCOX4:
        add     r2, r12, r12, lsl #2
        add     r12, r12, r2
        cmp     r12, #0
        ble     LCOX3
        ldr     lr, [pc, #0x488]
        ldr     r2, [pc, #0x488]
        sub     r6, r1, #4
        ldr     r3, [lr]
        sub     r5, r1, #0xC
        sub     r11, r0, #0x24
        sub     r9, r0, #0x2C
        str     r3, [sp, #0x44]
        ldr     r7, [r2]
        ldr     r3, [lr, #4]
        ldr     r2, [r2, #4]
        sub     lr, r1, #0x14
        str     lr, [sp, #0x48]
        str     r9, [sp, #0x58]
        sub     lr, r1, #0x1C
        sub     r9, r0, #0x14
        str     lr, [sp, #0x54]
        str     r9, [sp, #0x50]
        sub     lr, r1, #0x24
        sub     r10, r0, #4
        sub     r9, r0, #0xC
        sub     r1, r1, #0x2C
        sub     r0, r0, #0x1C
        str     r0, [sp, #0x34]
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r1, [sp, #0x38]
        str     lr, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x3C]
        str     r2, [sp, #0x30]
        str     r7, [sp, #0x2C]
        str     r3, [sp, #0x28]
        str     r12, [sp, #0x40]
        str     r8, [sp, #0x4C]
LCOX5:
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x34]
        ldr     r6, [r0, #0x30]
        ldr     r11, [r0, #0x2C]
        ldr     r0, [r1, #0x2C]
        mov     r3, r6
        str     r0, [sp, #0x88]
        ldr     r7, [r1, #0x30]
        ldr     r0, [sp, #0x88]
        mov     r2, r11
        mov     r1, r7
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        ldr     r5, [r12, #0x2C]
        ldr     r12, [sp, #0x50]
        ldr     r10, [r12, #0x2C]
        ldr     r8, [r12, #0x30]
        ldr     r12, [sp, #0x14]
        mov     r2, r5
        ldr     r9, [r12, #0x30]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r1, r8
        mov     r3, r9
        mov     r0, r10
        bl      __adddf3
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0x78]
        mov     r2, r11
        mov     r3, r6
        mov     r1, r7
        bl      __subdf3
        str     r1, [sp, #0x74]
        str     r0, [sp, #0x88]
        mov     r1, r8
        mov     r3, r9
        mov     r0, r10
        mov     r2, r5
        bl      __subdf3
        ldr     r3, [sp, #0x58]
        ldr     r2, [sp, #0x44]
        ldr     r7, [r3, #0x2C]
        ldr     r5, [r3, #0x30]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x84]
        str     r1, [sp, #0x6C]
        ldr     r3, [sp, #0x28]
        ldr     r1, [sp, #0x80]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x28]
        ldr     r8, [r12, #0x2C]
        ldr     r6, [r12, #0x30]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x7C]
        mov     r9, r1
        ldr     r1, [sp, #0x78]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x6C]
        bl      __muldf3
        mov     r10, r0
        ldr     r0, [sp, #0x88]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        mov     r11, r1
        ldr     r1, [sp, #0x74]
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x80]
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x74]
        mov     r0, r7
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x78]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r0, r8
        mov     r1, r6
        bl      __adddf3
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x68]
        str     r1, [sp, #0x78]
        mov     r1, r9
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r5, r0
        ldr     r2, [sp, #0x88]
        ldr     r0, [sp, #0x64]
        ldr     r3, [sp, #0x74]
        mov     r6, r1
        ldr     r1, [sp, #0x60]
        bl      __subdf3
        mov     r7, r0
        ldr     r0, [sp, #0x68]
        mov     r8, r1
        mov     r1, r9
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x74]
        mov     r10, r0
        ldr     r0, [sp, #0x64]
        mov     r11, r1
        ldr     r1, [sp, #0x60]
        bl      __adddf3
        ldr     r3, [sp, #0x84]
        ldr     r2, [sp, #0x38]
        mov     r9, r0
        mov     r0, r5
        str     r3, [r2, #0x2C]
        ldr     r3, [sp, #0x80]
        str     r3, [r2, #0x30]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x7C]
        str     r3, [r2, #0x2C]
        ldr     r3, [sp, #0x78]
        str     r3, [r2, #0x30]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        str     r1, [sp, #0x88]
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r1, r8
        mov     r0, r7
        bl      __muldf3
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x80]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        str     r1, [r2, #0x30]
        str     r0, [r2, #0x2C]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        mov     r0, r7
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r0, [r2, #0x2C]
        str     r1, [r2, #0x30]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
        mov     r6, r1
        ldr     r1, [sp, #0x88]
        mov     r5, r0
        mov     r0, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        str     r1, [r2, #0x30]
        str     r0, [r2, #0x2C]
        ldr     r1, [sp, #0x88]
        ldr     r2, [r4, #0x10]
        ldr     r3, [r4, #0x14]
        mov     r0, r9
        bl      __muldf3
        ldr     r2, [r4, #0x18]
        ldr     r3, [r4, #0x1C]
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
        ldr     r2, [sp, #0x4C]
        add     r4, r4, #0x20
        add     r2, r2, #6
        str     r2, [sp, #0x4C]
        ldr     r2, [sp, #0x3C]
        str     r0, [r2, #0x2C]
        str     r1, [r2, #0x30]
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x40]
        cmp     r0, r1
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x30
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x30
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x30
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x30
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x30
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x30
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x30
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x30
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x30
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x30
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x30
        str     r0, [sp, #0x34]
        blt     LCOX5
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCOX_C_1_3
        .long   LCOX_S_1_3


        .data
        .align  4


LCOX_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCOX_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


