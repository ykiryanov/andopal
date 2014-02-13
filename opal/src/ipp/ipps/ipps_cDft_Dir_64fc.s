        .text
        .align  4
        .globl  _ipps_cDft_Dir_64fc


_ipps_cDft_Dir_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7C
        ldr     r12, [sp, #0xA0]
        str     r0, [sp, #0x24]
        str     r12, [sp, #0x78]
        ldr     r7, [r0]
        ldr     r6, [r0, #4]
        ldr     r5, [r0, #8]
        ldr     r4, [r0, #0xC]
        ldr     r11, [sp, #0xA4]
        mov     r9, r2
        tst     r9, #1
        mov     r8, r1
        str     r3, [sp, #0x74]
        beq     LCQF6
        add     r3, r9, #1
        mov     r1, r7
        mov     r3, r3, asr #1
        cmp     r3, #1
        mov     r0, r6
        mov     lr, r5
        mov     r12, r4
        ble     LCQF1
        mov     r10, #1
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x68]
        add     r2, r10, r9, lsl #4
        str     r2, [sp, #0x28]
        sub     r2, r11, #4
        str     r2, [sp, #0x2C]
        sub     r2, r11, #0x14
        str     r11, [sp, #0x48]
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x2C]
        ldr     r11, [sp, #0x20]
        str     r2, [sp, #0x30]
        add     r10, r10, #0xC
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x70]
        str     r3, [sp, #0x34]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r7, [sp, #0x44]
        str     r8, [sp, #0x1C]
LCQF0:
        ldr     r3, [sp, #0x28]
        rsb     r12, r11, #0
        str     r12, [sp, #0x60]
        ldr     r2, [r3, +r12, lsl #4]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        add     r8, r3, r12, lsl #4
        ldr     r3, [r8, #4]
        bl      __adddf3
        ldr     r2, [r10, #0xC]
        ldr     r4, [r10, #0x10]
        ldr     r5, [r8, #8]
        ldr     r3, [r8, #0xC]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        mov     r2, r5
        mov     r1, r4
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [sp, #0x70]
        mov     r5, r1
        ldr     r1, [sp, #0x6C]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x68]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x64]
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        add     r11, r11, #1
        str     r5, [r12, #0x20]
        str     r4, [r12, #0x1C]
        str     r6, [r12, #0x14]
        str     r7, [r12, #0x18]
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp, #0x28]
        ldr     r2, [r10, #4]
        ldr     r3, [r10, #8]
        ldr     r4, [r8, #4]
        ldr     r5, [r12, +lr, lsl #4]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [r9, #0x14]
        str     r1, [r9, #0x18]
        ldr     r0, [r10, #0xC]
        ldr     r1, [r10, #0x10]!
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __subdf3
        str     r0, [r9, #0x1C]
        str     r1, [r9, #0x20]!
        ldr     r0, [sp, #0x34]
        cmp     r11, r0
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x20
        str     r0, [sp, #0x30]
        blt     LCQF0
        ldr     r12, [sp, #0x64]
        ldr     lr, [sp, #0x68]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x70]
        ldr     r3, [sp, #0x34]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        ldr     r8, [sp, #0x1C]
LCQF1:
        cmp     r3, #1
        str     r1, [r8]
        str     r0, [r8, #4]
        str     lr, [r8, #8]
        str     r12, [r8, #0xC]
        ble     LCQF17
        add     r12, r8, r9, lsl #4
        add     lr, r11, #0x10
        sub     r0, r9, #1
        mov     r10, #1
        add     r8, r8, #0x10
        str     r0, [sp, #0x24]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        str     r3, [sp, #0x34]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r7, [sp, #0x44]
        str     r11, [sp, #0x48]
        str     r9, [sp, #0x4C]
LCQF2:
        ldr     r2, [sp, #0x3C]
        ldr     r0, [sp, #0x24]
        ldr     r7, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x38]
        cmp     r0, #0
        str     r2, [sp, #0x10]
        mov     r0, r10
        ble     LCQF19
        mov     r1, #0
        mov     r4, r1
        mov     r5, r4
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x48]
        mov     r9, r5
        mov     r11, r9
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x4C]
        str     r5, [sp, #0xC]
        str     r4, [sp]
        str     r6, [sp, #4]
        str     r7, [sp, #8]
        str     r11, [sp, #0x1C]
        str     r8, [sp, #0x28]
        str     r10, [sp, #0x20]
        mov     r7, r0
        mov     r6, r1
        mov     r4, r2
        mov     r5, r3
LCQF3:
        ldr     r12, [sp, #0x78]
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        ldr     r11, [r12, +r7, lsl #4]
        add     r8, r12, r7, lsl #4
        ldr     r10, [r8, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r10, [r8, #8]
        ldr     r3, [r4, #8]
        ldr     r2, [r4, #0xC]
        ldr     r8, [r8, #0xC]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r3, [r4]
        ldr     r2, [r4, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        str     r0, [sp]
        add     r7, r12, r7
        cmp     r7, r9
        str     r1, [sp, #0xC]
        subge   r7, r7, r9
        ldr     r12, [sp, #0x24]
        add     r6, r6, #2
        add     r4, r4, #0x20
        cmp     r6, r12
        add     r5, r5, #0x20
        blt     LCQF3
        ldr     r11, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp]
        ldr     r6, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0x28]
        ldr     r10, [sp, #0x20]
LCQF4:
        ldr     r12, [sp, #0x74]
        cmp     r12, #0
        ble     LCQF18
        mov     r0, r7
        mov     r1, r6
        mov     r2, r9
        mov     r3, r11
        bl      __subdf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r1, [r8, #0xC]
        str     r0, [r8, #8]
        mov     r1, r6
        mov     r0, r7
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        rsb     lr, r10, #0
        str     r0, [r12, +lr, lsl #4]
        add     r6, r12, lr, lsl #4
        str     r1, [r6, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
LCQF5:
        ldr     r2, [sp, #0x34]
        add     r10, r10, #1
        str     r0, [r6, #8]
        cmp     r10, r2
        str     r1, [r6, #0xC]
        add     r8, r8, #0x10
        blt     LCQF2
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LCQF6:
        ldr     r3, [sp, #0x24]
        mov     r10, r9, asr #1
        mov     r0, r7
        ldr     r2, [r3, +r10, lsl #4]
        add     r12, r3, r10, lsl #4
        mov     r1, r6
        str     r2, [sp, #0x20]
        ldr     r3, [r12, #4]
        str     r3, [sp, #0x18]
        ldr     lr, [r12, #8]
        str     lr, [sp, #0x14]
        ldr     r12, [r12, #0xC]
        str     r12, [sp, #0xC]
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x54]
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        ldr     r12, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x5C]
        cmp     r10, #1
        str     r7, [sp]
        str     r6, [sp, #0x60]
        str     r5, [sp, #8]
        str     r4, [sp, #0x10]
        ble     LCQF8
        mov     lr, #1
        str     lr, [sp, #0x28]
        ldr     lr, [sp, #0x24]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x64]
        add     r2, lr, r9, lsl #4
        str     r2, [sp, #0x2C]
        sub     r2, r11, #4
        str     r2, [sp, #0x30]
        sub     r2, r11, #0x14
        str     r10, [sp, #4]
        str     r11, [sp, #0x48]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x28]
        add     lr, lr, #0xC
        str     r8, [sp, #0x1C]
        str     r2, [sp, #0x34]
        str     r3, [sp, #0x6C]
        str     r12, [sp, #0x68]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r6, [sp, #0x40]
        str     r7, [sp, #0x44]
        str     r9, [sp, #0x4C]
        mov     r8, lr
LCQF7:
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        ldr     r3, [sp, #0x2C]
        rsb     r12, r11, #0
        str     r12, [sp, #0x24]
        ldr     r2, [r3, +r12, lsl #4]
        add     r9, r3, r12, lsl #4
        ldr     r3, [r9, #4]
        bl      __adddf3
        ldr     r2, [r8, #0xC]
        ldr     r5, [r9, #8]
        ldr     r3, [r9, #0xC]
        ldr     r4, [r8, #0x10]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __adddf3
        mov     r4, r1
        ldr     r1, [sp, #0x6C]
        mov     r5, r0
        ldr     r0, [sp, #0x68]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x70]
        mov     r3, r4
        mov     r2, r5
        bl      __adddf3
        ldr     r3, [sp, #0x60]
        ldr     r2, [sp]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x70]
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x10]
        str     r0, [sp]
        str     r1, [sp, #0x60]
        mov     r1, r4
        mov     r0, r5
        bl      __subdf3
        ldr     r12, [sp, #0x34]
        str     r4, [r12, #0x20]
        str     r5, [r12, #0x1C]
        str     r6, [r12, #0x14]
        str     r7, [r12, #0x18]
        ldr     r4, [sp, #0x24]
        ldr     r12, [sp, #0x2C]
        ldr     r2, [r8, #4]
        ldr     r3, [r8, #8]
        add     r11, r11, #1
        ldr     r5, [r12, +r4, lsl #4]
        ldr     r4, [r9, #4]
        str     r0, [sp, #8]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r0, [r10, #0x14]
        str     r1, [r10, #0x18]
        ldr     r0, [r8, #0xC]
        ldr     r1, [r8, #0x10]!
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        bl      __subdf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        ldr     r0, [sp, #4]
        cmp     r11, r0
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x34]
        blt     LCQF7
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x64]
        ldr     r3, [sp, #0x6C]
        ldr     r12, [sp, #0x68]
        ldr     r10, [sp, #4]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x40]
        ldr     r7, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        ldr     r8, [sp, #0x1C]
LCQF8:
        str     r3, [r8, #4]
        str     r12, [r8]
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        add     r3, r8, r10, lsl #4
        tst     r10, #1
        str     r3, [sp, #0x34]
        beq     LCQF9
        ldr     r0, [sp]
        ldr     r1, [sp, #0x60]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x18]
        bl      __subdf3
        str     r0, [r8, +r10, lsl #4]
        ldr     r3, [sp, #0x34]
        str     r1, [r3, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        bl      __subdf3
        b       LCQF10
LCQF9:
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp]
        ldr     r3, [sp, #0x60]
        bl      __subdf3
        str     r0, [r8, +r10, lsl #4]
        ldr     r3, [sp, #0x34]
        str     r1, [r3, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x10]
        bl      __subdf3
LCQF10:
        ldr     r3, [sp, #0x34]
        cmp     r10, #1
        str     r0, [r3, #8]
        str     r1, [r3, #0xC]
        ble     LCQF17
        mov     r0, r7
        mov     r1, r6
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x18]
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        str     r0, [sp]
        mov     r6, r1
        mov     r1, r4
        mov     r0, r5
        bl      __subdf3
        add     r12, r8, r9, lsl #4
        sub     lr, r9, #2
        add     r3, r11, #0x10
        mov     r4, #1
        add     r8, r8, #0x10
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r12, [sp, #8]
        str     lr, [sp, #0x20]
        str     r10, [sp, #4]
        str     r11, [sp, #0x48]
        str     r9, [sp, #0x4C]
LCQF11:
        tst     r4, #1
        beq     LCQF12
        ldr     r1, [sp, #0x10]
        ldr     r9, [sp]
        ldr     r5, [sp, #0x18]
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x14]
        str     r1, [sp, #0x30]
        b       LCQF13
LCQF12:
        ldr     r1, [sp, #0x54]
        ldr     r9, [sp, #0x50]
        ldr     r5, [sp, #0x5C]
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x58]
        str     r1, [sp, #0x30]
LCQF13:
        ldr     r2, [sp, #0x20]
        mov     r0, r4
        cmp     r2, #0
        ble     LCQF21
        mov     r1, #0
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x48]
        mov     r7, r1
        mov     r6, r7
        mov     r10, r6
        str     r8, [sp, #0x1C]
        ldr     r8, [sp, #0x4C]
        mov     r11, r10
        str     r6, [sp, #0x38]
        str     r7, [sp, #0x44]
        str     r5, [sp, #0x34]
        str     r9, [sp, #0x3C]
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x2C]
        str     r4, [sp, #0x24]
        mov     r9, r0
        mov     r7, r1
        mov     r5, r2
        mov     r6, r3
LCQF14:
        ldr     r12, [sp, #0x78]
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        ldr     r11, [r12, +r9, lsl #4]
        add     r4, r12, r9, lsl #4
        ldr     r10, [r4, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r3, [r6, #8]
        ldr     r2, [r6, #0xC]
        str     r1, [sp, #0x40]
        str     r0, [sp, #0x3C]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        ldr     r10, [r4, #8]
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        ldr     r4, [r4, #0xC]
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x34]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        bl      __adddf3
        ldr     r3, [r5]
        ldr     r2, [r5, #4]
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x38]
        bl      __adddf3
        ldr     r12, [sp, #0x24]
        str     r0, [sp, #0x44]
        add     r9, r12, r9
        cmp     r9, r8
        str     r1, [sp, #0x38]
        subge   r9, r9, r8
        ldr     r12, [sp, #0x20]
        add     r7, r7, #2
        add     r5, r5, #0x20
        cmp     r7, r12
        add     r6, r6, #0x20
        blt     LCQF14
        ldr     r11, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r6, [sp, #0x38]
        ldr     r7, [sp, #0x44]
        ldr     r5, [sp, #0x34]
        ldr     r9, [sp, #0x3C]
        ldr     r8, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
LCQF15:
        ldr     r12, [sp, #0x74]
        cmp     r12, #0
        ble     LCQF20
        mov     r0, r9
        ldr     r1, [sp, #0x40]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        str     r1, [r8, #0xC]
        str     r0, [r8, #8]
        ldr     r1, [sp, #0x40]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #8]
        rsb     lr, r4, #0
        str     r0, [r12, +lr, lsl #4]
        add     r9, r12, lr, lsl #4
        str     r1, [r9, #4]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
LCQF16:
        ldr     r2, [sp, #4]
        add     r4, r4, #1
        str     r0, [r9, #8]
        cmp     r4, r2
        str     r1, [r9, #0xC]
        add     r8, r8, #0x10
        blt     LCQF11
LCQF17:
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LCQF18:
        mov     r0, r7
        mov     r1, r6
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r1, [r8, #0xC]
        str     r0, [r8, #8]
        mov     r1, r6
        mov     r0, r7
        mov     r2, r9
        mov     r3, r11
        bl      __subdf3
        ldr     lr, [sp, #0x30]
        rsb     r12, r10, #0
        str     r0, [lr, +r12, lsl #4]
        add     r6, lr, r12, lsl #4
        str     r1, [r6, #4]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        b       LCQF5
LCQF19:
        mov     r11, #0
        mov     r4, r11
        mov     r5, r4
        mov     r9, r5
        b       LCQF4
LCQF20:
        mov     r0, r9
        ldr     r1, [sp, #0x40]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        str     r1, [r8, #0xC]
        str     r0, [r8, #8]
        ldr     r1, [sp, #0x40]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     lr, [sp, #8]
        rsb     r12, r4, #0
        str     r0, [lr, +r12, lsl #4]
        add     r9, lr, r12, lsl #4
        str     r1, [r9, #4]
        ldr     r0, [sp, #0x30]
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        b       LCQF16
LCQF21:
        mov     r11, #0
        mov     r7, r11
        mov     r6, r7
        mov     r10, r6
        b       LCQF15


