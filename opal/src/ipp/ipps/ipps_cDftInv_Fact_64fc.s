        .text
        .align  4
        .globl  _ipps_cDftInv_Fact_64fc


_ipps_cDftInv_Fact_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x90
        ldr     r5, [sp, #0xB4]
        ldr     r12, [sp, #0xB8]
        ldr     r4, [sp, #0xBC]
        add     lr, r2, #1
        cmp     r3, #0
        mov     r6, lr, asr #1
        ble     LCPM9
        rsb     lr, r3, #0
        mla     r7, r2, r3, lr
        add     r9, r4, #0x10
        sub     r8, r2, #1
        mov     lr, #0
        str     r8, [sp, #0x70]
        str     r9, [sp, #0x6C]
        str     r7, [sp, #0x68]
        str     r6, [sp, #0x64]
        str     r4, [sp, #0x60]
        str     r5, [sp, #0x5C]
        str     r2, [sp, #0x58]
LCPM0:
        ldr     r7, [r0]
        ldr     r6, [r0, #4]
        ldr     r4, [r0, #8]
        ldr     r2, [r0, #0xC]
        add     r5, r0, r3, lsl #4
        str     r5, [sp, #0x38]
        ldr     r5, [sp, #0x68]
        cmp     lr, #0
        mov     r10, r7
        add     r8, r0, r5, lsl #4
        str     r8, [sp, #0x3C]
        add     r8, r1, r3, lsl #4
        add     r5, r1, r5, lsl #4
        str     r8, [sp, #0x50]
        str     r5, [sp, #0x54]
        mov     r9, r6
        mov     r8, r4
        mov     r5, r2
        bne     LCPM2
        ldr     r11, [sp, #0x64]
        cmp     r11, #1
        ble     LCPM10
        ldr     r11, [sp, #0x60]
        str     r5, [sp, #0x10]
        str     r8, [sp, #0xC]
        sub     r11, r11, #4
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x60]
        ldr     r8, [sp, #0x3C]
        str     r9, [sp, #4]
        sub     r11, r11, #0x14
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x64]
        ldr     r9, [sp, #0x44]
        str     r10, [sp, #8]
        sub     r11, r11, #1
        str     r11, [sp]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x38]
        str     r2, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCPM1:
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        bl      __adddf3
        ldr     r2, [r11, #8]
        ldr     r3, [r8, #0xC]
        ldr     r4, [r11, #0xC]
        ldr     r5, [r8, #8]
        mov     r6, r0
        mov     r0, r2
        mov     r7, r1
        mov     r2, r5
        mov     r1, r4
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #8]
        mov     r4, r1
        ldr     r1, [sp, #4]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r5, [r9, #0x1C]
        str     r4, [r9, #0x20]
        str     r6, [r9, #0x14]
        str     r7, [r9, #0x18]
        ldr     r2, [r11]
        ldr     r3, [r8, #4]
        ldr     r4, [r11, #4]
        ldr     r5, [r8]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __subdf3
        str     r0, [r10, #0x14]
        str     r1, [r10, #0x18]
        ldr     r0, [r11, #8]
        ldr     r1, [r11, #0xC]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __subdf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        ldr     r0, [sp]
        add     r9, r9, #0x20
        subs    r0, r0, #1
        str     r0, [sp]
        ldr     r0, [sp, #0x14]
        add     r11, r11, r0, lsl #4
        sub     r8, r8, r0, lsl #4
        ldr     r0, [sp]
        bne     LCPM1
        ldr     r11, [sp, #0x58]
        ldr     r12, [sp, #0x18]
        ldr     r5, [sp, #0x10]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r2, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r11, r12, r11, lsl #4
        str     r11, [sp]
        b       LCPM4
LCPM2:
        ldr     r11, [sp, #0x64]
        cmp     r11, #1
        ble     LCPM12
        mov     r11, #1
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x58]
        str     r5, [sp, #0x10]
        str     r8, [sp, #0xC]
        add     r11, r12, r11, lsl #4
        str     r11, [sp]
        ldr     r11, [sp, #0x60]
        str     r9, [sp, #4]
        str     r10, [sp, #8]
        sub     r11, r11, #4
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x60]
        str     r4, [sp, #0x20]
        ldr     r4, [sp, #0x44]
        sub     r11, r11, #0x14
        str     r11, [sp, #0x4C]
        add     r11, r12, #4
        str     r11, [sp, #0x40]
        str     r2, [sp, #0x1C]
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCPM3:
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x18]
        ldr     r12, [sp, #0x40]
        ldr     r6, [r1, #4]
        ldr     r7, [r1]
        ldr     r2, [r2, +r4, lsl #4]
        mov     r0, r7
        mov     r1, r6
        str     r2, [sp, #0x74]
        ldr     r10, [r12, #0x10]
        ldr     r8, [r12, #0x14]
        ldr     r5, [r12, #0x18]
        ldr     r12, [sp, #0x38]
        ldr     r2, [sp, #0x74]
        mov     r3, r10
        ldr     r11, [r12, #8]
        ldr     r9, [r12, #0xC]
        bl      __muldf3
        str     r0, [sp, #0x78]
        str     r1, [sp, #0x7C]
        mov     r1, r9
        mov     r2, r8
        mov     r3, r5
        mov     r0, r11
        bl      __muldf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        mov     r3, r10
        mov     r0, r11
        mov     r1, r9
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r2, r8
        mov     r3, r5
        mov     r1, r6
        mov     r0, r7
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subdf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp]
        ldr     r8, [r2, #8]
        ldr     r6, [r2, #4]
        ldr     r11, [r2]
        ldr     r9, [r2, #0xC]
        str     r0, [sp, #0x74]
        rsb     r2, r4, #0
        ldr     r3, [r3, +r2, lsl #4]
        str     r1, [sp, #0x84]
        mov     r0, r11
        str     r3, [sp, #0x80]
        ldr     r3, [sp]
        mov     r1, r6
        add     r4, r4, #1
        add     r2, r3, r2, lsl #4
        ldr     r7, [r2, #4]
        ldr     r5, [r2, #0xC]
        ldr     r10, [r2, #8]
        ldr     r2, [sp, #0x80]
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x8C]
        mov     r3, r5
        mov     r0, r8
        mov     r1, r9
        mov     r2, r10
        bl      __muldf3
        ldr     r3, [sp, #0x8C]
        ldr     r2, [sp, #0x88]
        bl      __adddf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x88]
        mov     r0, r8
        mov     r1, r9
        mov     r3, r7
        bl      __muldf3
        mov     r8, r1
        mov     r7, r0
        mov     r1, r6
        mov     r3, r5
        mov     r0, r11
        mov     r2, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r8
        mov     r0, r7
        bl      __subdf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x88]
        mov     r5, r0
        ldr     r0, [sp, #0x7C]
        mov     r6, r1
        ldr     r1, [sp, #0x78]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x74]
        mov     r7, r1
        ldr     r1, [sp, #0x84]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x4C]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r10, [r12, #0x14]
        str     r7, [r12, #0x18]
        str     r9, [r12, #0x1C]
        str     r8, [r12, #0x20]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x78]
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x88]
        bl      __subdf3
        ldr     r12, [sp, #0x48]
        mov     r2, r5
        str     r0, [r12, #0x14]
        str     r1, [r12, #0x18]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x84]
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x38]
        cmp     r4, r0
        ldr     r0, [sp, #0x14]
        add     r1, r1, r0, lsl #4
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        sub     r1, r1, r0, lsl #4
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x3C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        blt     LCPM3
        ldr     r5, [sp, #0x10]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r2, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCPM4:
        ldr     r12, [sp, #0x64]
        str     r10, [r1]
        str     r9, [r1, #4]
        cmp     r12, #1
        str     r8, [r1, #8]
        str     r5, [r1, #0xC]
        ble     LCPM8
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        mov     r5, #1
        str     r2, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x28]
        str     lr, [sp, #0x2C]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCPM5:
        ldr     r0, [sp, #0x70]
        mov     r1, r5
        cmp     r0, #0
        ldr     r0, [sp, #0x28]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x24]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x1C]
        str     r0, [sp, #0x3C]
        ble     LCPM11
        mov     r0, #0
        mov     r9, r0
        ldr     r2, [sp, #0x60]
        mov     r8, r9
        ldr     r4, [sp, #0x6C]
        mov     r7, r8
        mov     r6, r7
        str     r9, [sp, #0xC]
        ldr     r9, [sp, #0x58]
        str     r6, [sp, #0x48]
        str     r7, [sp, #0x44]
        str     r5, [sp, #0x4C]
        str     r8, [sp, #0x38]
        str     r10, [sp, #0x54]
        str     r11, [sp, #0x50]
        mov     r6, r0
        mov     r7, r1
        mov     r5, r2
LCPM6:
        ldr     r3, [sp, #0x5C]
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r11, [r3, +r7, lsl #4]
        add     r8, r3, r7, lsl #4
        ldr     r10, [r8, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [r5, #8]
        ldr     r3, [r5, #0xC]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        ldr     r10, [r8, #8]
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x38]
        bl      __adddf3
        ldr     r3, [sp, #0x4C]
        str     r0, [sp, #0xC]
        add     r7, r3, r7
        cmp     r7, r9
        str     r1, [sp, #0x38]
        subge   r7, r7, r9
        ldr     r3, [sp, #0x70]
        add     r6, r6, #2
        add     r4, r4, #0x20
        cmp     r6, r3
        add     r5, r5, #0x20
        blt     LCPM6
        ldr     r6, [sp, #0x48]
        ldr     r7, [sp, #0x44]
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0xC]
        ldr     r5, [sp, #0x4C]
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x50]
LCPM7:
        ldr     r4, [sp, #0x18]
        ldr     r1, [sp, #0x10]
        mov     r2, r7
        mov     r0, r4
        mov     r3, r6
        bl      __adddf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        mov     r2, r9
        mov     r3, r8
        bl      __subdf3
        str     r1, [r11, #0xC]
        str     r0, [r11, #8]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [sp, #0x64]
        add     r5, r5, #1
        cmp     r5, r0
        ldr     r0, [sp, #0x14]
        add     r11, r11, r0, lsl #4
        sub     r10, r10, r0, lsl #4
        blt     LCPM5
        ldr     lr, [sp, #0x2C]
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCPM8:
        ldr     r12, [sp]
        add     lr, lr, #1
        cmp     lr, r3
        add     r0, r0, #0x10
        add     r1, r1, #0x10
        blt     LCPM0
LCPM9:
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LCPM10:
        ldr     r11, [sp, #0x58]
        add     r11, r12, r11, lsl #4
        str     r11, [sp]
        b       LCPM4
LCPM11:
        mov     r6, #0
        mov     r9, r6
        mov     r8, r9
        mov     r7, r8
        b       LCPM7
LCPM12:
        ldr     r11, [sp, #0x58]
        add     r11, r12, r11, lsl #4
        str     r11, [sp]
        b       LCPM4


