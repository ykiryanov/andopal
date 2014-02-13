        .text
        .align  4
        .globl  _ipps_cDft_Dir_64f


_ipps_cDft_Dir_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r12, [sp, #0xB0]
        ldr     r11, [sp, #0xAC]
        mov     r7, r0
        str     r12, [sp, #0x74]
        ldr     r12, [sp, #0xB4]
        str     r1, [sp, #0x50]
        str     r12, [sp, #0x78]
        ldr     r12, [sp, #0xB8]
        tst     r11, #1
        mov     r9, r2
        str     r12, [sp, #0x7C]
        ldr     r12, [r7, #4]
        ldr     r6, [r7]
        mov     r8, r3
        str     r12, [sp, #0x80]
        ldr     r5, [r1]
        ldr     r4, [r1, #4]
        beq     LCQG6
        ldr     lr, [sp, #0x80]
        add     r12, r11, #1
        mov     r2, r6
        mov     r12, r12, asr #1
        cmp     r12, #1
        mov     r1, r5
        mov     r0, r4
        ble     LCQG1
        mov     r10, #1
        str     r10, [sp, #0x28]
        add     r10, r7, r11, lsl #3
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x50]
        add     r7, r7, #4
        str     r0, [sp, #0x6C]
        add     r3, r10, r11, lsl #3
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x7C]
        add     r10, r10, #4
        str     r1, [sp, #0x68]
        sub     r3, r3, #4
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x7C]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x48]
        ldr     r5, [sp, #0x30]
        ldr     r6, [sp, #0x28]
        sub     r3, r3, #0x14
        str     r3, [sp, #0x38]
        str     lr, [sp, #0x64]
        str     r2, [sp, #0x70]
        str     r12, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r11, [sp, #0x4C]
        str     r8, [sp, #0x54]
        str     r9, [sp, #0x24]
LCQG0:
        ldr     r2, [sp, #0x2C]
        ldr     r0, [r7, #4]
        rsb     r4, r6, #0
        add     r6, r6, #1
        add     r1, r2, r4, lsl #3
        str     r1, [sp, #0x60]
        ldr     r3, [r1, #4]
        ldr     r2, [r2, +r4, lsl #3]
        ldr     r1, [r7, #8]
        add     r12, r5, r4, lsl #3
        str     r12, [sp, #0x5C]
        bl      __adddf3
        ldr     r9, [r5, +r4, lsl #3]
        ldr     r12, [sp, #0x5C]
        ldr     r2, [r10, #4]
        ldr     r8, [r10, #8]
        ldr     r3, [r12, #4]
        str     r0, [sp, #0x58]
        mov     r11, r1
        mov     r0, r2
        mov     r1, r8
        mov     r2, r9
        bl      __adddf3
        mov     r9, r1
        ldr     r1, [sp, #0x64]
        ldr     r2, [sp, #0x58]
        mov     r8, r0
        ldr     r0, [sp, #0x70]
        mov     r3, r11
        bl      __adddf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x6C]
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x58]
        ldr     lr, [sp, #0x38]
        str     r11, [lr, #0x18]
        str     r12, [lr, #0x14]
        str     r8, [lr, #0x1C]
        str     r9, [lr, #0x20]
        ldr     r12, [sp, #0x2C]
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]!
        ldr     r8, [r12, +r4, lsl #3]
        ldr     r12, [sp, #0x60]
        ldr     r9, [r12, #4]
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x6C]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, #0x14]
        str     r1, [r2, #0x18]
        ldr     r3, [sp, #0x5C]
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]!
        ldr     r2, [r5, +r4, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x3C]
        cmp     r6, r0
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x20
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x20
        str     r0, [sp, #0x38]
        blt     LCQG0
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x68]
        ldr     lr, [sp, #0x64]
        ldr     r2, [sp, #0x70]
        ldr     r12, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x44]
        ldr     r6, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        ldr     r8, [sp, #0x54]
        ldr     r9, [sp, #0x24]
LCQG1:
        str     r2, [r9]
        str     lr, [r9, #4]
        cmp     r12, #1
        str     r1, [r8]
        str     r0, [r8, #4]
        ble     LCQG17
        ldr     r10, [sp, #0x7C]
        add     lr, r9, r11, lsl #3
        add     r2, r8, r11, lsl #3
        add     r10, r10, #0x10
        sub     r0, r11, #1
        mov     r7, #1
        add     r9, r9, #8
        add     r8, r8, #8
        str     r0, [sp, #0x24]
        str     r10, [sp, #0x30]
        str     r2, [sp, #0x34]
        str     lr, [sp, #0x38]
        str     r12, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x48]
        str     r11, [sp, #0x4C]
LCQG2:
        ldr     r0, [sp, #0x24]
        ldr     r4, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        cmp     r0, #0
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x10]
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x80]
        str     r0, [sp, #4]
        mov     r0, r7
        ble     LCQG19
        mov     r1, #0
        mov     r5, r1
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x7C]
        mov     r6, r5
        mov     r10, r6
        mov     r11, r10
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #0x4C]
        str     r11, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r5, [sp]
        str     r4, [sp, #0x14]
        str     r6, [sp, #0xC]
        str     r9, [sp, #0x28]
        str     r8, [sp, #0x2C]
        mov     r5, r0
        mov     r4, r1
        mov     r10, r2
        mov     r11, r3
LCQG3:
        ldr     r12, [sp, #0x78]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        ldr     r9, [r12, +r5, lsl #4]
        add     r6, r12, r5, lsl #4
        ldr     r8, [r6, #4]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        bl      __adddf3
        ldr     r3, [r11, #8]
        ldr     r2, [r11, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r8, [r6, #8]
        ldr     r3, [r10, #8]
        ldr     r2, [r10, #0xC]
        ldr     r6, [r6, #0xC]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r3, [r10]
        ldr     r2, [r10, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r12, [sp, #0x20]
        str     r0, [sp]
        add     r5, r12, r5
        cmp     r5, r7
        str     r1, [sp, #0xC]
        subge   r5, r5, r7
        ldr     r12, [sp, #0x24]
        add     r4, r4, #2
        add     r10, r10, #0x20
        cmp     r4, r12
        add     r11, r11, #0x20
        blt     LCQG3
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp]
        ldr     r4, [sp, #0x14]
        ldr     r9, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
        ldr     r7, [sp, #0x20]
LCQG4:
        ldr     r1, [sp, #0x74]
        cmp     r1, #0
        ble     LCQG18
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        str     r1, [r9, #4]
        str     r0, [r9]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x38]
        rsb     r10, r7, #0
        mov     r11, r10, lsl #3
        str     r0, [r12, +r10, lsl #3]
        add     r12, r12, r11
        str     r1, [r12, #4]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
LCQG5:
        ldr     r2, [sp, #0x34]
        add     r7, r7, #1
        add     r8, r8, #8
        str     r0, [r2, +r10, lsl #3]
        ldr     r0, [sp, #0x3C]
        add     r2, r11, r2
        str     r1, [r2, #4]
        cmp     r7, r0
        add     r9, r9, #8
        blt     LCQG2
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LCQG6:
        mov     r10, r11, asr #1
        ldr     r2, [r7, +r10, lsl #3]
        ldr     lr, [sp, #0x50]
        ldr     r1, [sp, #0x80]
        str     r2, [sp, #0x28]
        add     r12, r7, r10, lsl #3
        ldr     r3, [r12, #4]
        mov     r0, r6
        str     r3, [sp, #0x20]
        ldr     r12, [lr, +r10, lsl #3]
        add     lr, lr, r10, lsl #3
        str     r12, [sp, #0x1C]
        ldr     lr, [lr, #4]
        str     lr, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x5C]
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0x80]
        ldr     lr, [sp, #0x58]
        ldr     r12, [sp, #0x5C]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x64]
        cmp     r10, #1
        str     r6, [sp, #4]
        str     r2, [sp, #0xC]
        str     r5, [sp, #0x10]
        str     r4, [sp, #0x14]
        ble     LCQG8
        mov     r2, #1
        str     r2, [sp, #0x2C]
        add     r2, r7, r11, lsl #3
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x7C]
        add     r7, r7, #4
        add     r2, r2, r11, lsl #3
        str     r2, [sp, #0x34]
        sub     r2, r3, #4
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x50]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x2C]
        sub     r3, r3, #0x14
        add     r2, r2, #4
        str     r8, [sp, #0x54]
        str     r9, [sp, #0x24]
        str     r3, [sp, #0x3C]
        str     r1, [sp]
        str     r0, [sp, #0x70]
        str     r12, [sp, #0x6C]
        str     lr, [sp, #0x68]
        str     r10, [sp, #8]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x44]
        str     r6, [sp, #0x48]
        mov     r8, r2
        mov     r9, r7
LCQG7:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        rsb     r10, r11, #0
        ldr     r2, [r3, +r10, lsl #3]
        add     r3, r3, r10, lsl #3
        str     r3, [sp, #0x50]
        ldr     r3, [r3, #4]
        add     r12, r12, r10, lsl #3
        str     r12, [sp, #0x84]
        bl      __adddf3
        ldr     r12, [sp, #0x34]
        ldr     r4, [r8, #4]
        ldr     r5, [r8, #8]
        ldr     r2, [r12, +r10, lsl #3]
        ldr     r12, [sp, #0x84]
        mov     r6, r0
        mov     r7, r1
        ldr     r3, [r12, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x68]
        mov     r4, r1
        ldr     r1, [sp, #0x6C]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x70]
        str     r1, [sp]
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r0, [sp, #4]
        mov     r1, r4
        mov     r0, r5
        bl      __subdf3
        ldr     r12, [sp, #0x3C]
        str     r4, [r12, #0x20]
        str     r5, [r12, #0x1C]
        str     r6, [r12, #0x14]
        str     r7, [r12, #0x18]
        ldr     r12, [sp, #0x30]
        ldr     r2, [r9, #4]
        ldr     r3, [r9, #8]!
        ldr     r4, [r12, +r10, lsl #3]
        ldr     r12, [sp, #0x50]
        add     r11, r11, #1
        ldr     r5, [r12, #4]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        ldr     r3, [sp, #0x38]
        str     r0, [r3, #0x14]
        str     r1, [r3, #0x18]
        ldr     r3, [sp, #0x34]
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]!
        ldr     r2, [r3, +r10, lsl #3]
        ldr     r3, [sp, #0x84]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [sp, #0x38]
        str     r0, [r3, #0x1C]
        str     r1, [r3, #0x20]
        ldr     r0, [sp, #8]
        cmp     r11, r0
        ldr     r0, [sp, #0x38]
        add     r0, r0, #0x20
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x3C]
        blt     LCQG7
        ldr     r1, [sp]
        ldr     r0, [sp, #0x70]
        ldr     r12, [sp, #0x6C]
        ldr     lr, [sp, #0x68]
        ldr     r10, [sp, #8]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x44]
        ldr     r6, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        ldr     r8, [sp, #0x54]
        ldr     r9, [sp, #0x24]
LCQG8:
        str     r12, [r9, #4]
        str     lr, [r9]
        str     r0, [r8]
        str     r1, [r8, #4]
        add     r12, r8, r10, lsl #3
        tst     r10, #1
        add     r7, r9, r10, lsl #3
        str     r12, [sp, #0x50]
        beq     LCQG9
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        str     r0, [r9, +r10, lsl #3]
        str     r1, [r7, #4]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __subdf3
        b       LCQG10
LCQG9:
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        bl      __subdf3
        str     r0, [r9, +r10, lsl #3]
        str     r1, [r7, #4]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        bl      __subdf3
LCQG10:
        str     r0, [r8, +r10, lsl #3]
        ldr     r12, [sp, #0x50]
        cmp     r10, #1
        str     r1, [r12, #4]
        ble     LCQG17
        mov     r0, r6
        ldr     r1, [sp, #0x80]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x20]
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        ldr     r5, [sp, #0x7C]
        sub     r12, r11, #2
        str     r12, [sp, #0x50]
        add     lr, r9, r11, lsl #3
        add     r12, r8, r11, lsl #3
        add     r5, r5, #0x10
        add     r9, r9, #8
        mov     r4, #1
        add     r8, r8, #8
        str     r9, [sp, #0x24]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r10, [sp, #8]
        str     r11, [sp, #0x4C]
LCQG11:
        tst     r4, #1
        beq     LCQG12
        ldr     r1, [sp, #4]
        ldr     r9, [sp]
        ldr     r5, [sp, #0x1C]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x18]
        str     r1, [sp, #0x34]
        b       LCQG13
LCQG12:
        ldr     r1, [sp, #0x5C]
        ldr     r9, [sp, #0x58]
        ldr     r5, [sp, #0x64]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x60]
        str     r1, [sp, #0x34]
LCQG13:
        ldr     r2, [sp, #0x50]
        mov     r0, r4
        cmp     r2, #0
        ble     LCQG21
        mov     r1, #0
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x7C]
        mov     r7, r1
        mov     r6, r7
        mov     r10, r6
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x4C]
        mov     r11, r10
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x48]
        str     r5, [sp, #0x38]
        str     r9, [sp, #0x40]
        str     r11, [sp, #0x2C]
        str     r10, [sp, #0x30]
        str     r4, [sp, #0x28]
        mov     r9, r0
        mov     r7, r1
        mov     r5, r2
        mov     r6, r3
LCQG14:
        ldr     r12, [sp, #0x78]
        ldr     r0, [r6]
        ldr     r1, [r6, #4]
        ldr     r11, [r12, +r9, lsl #4]
        add     r4, r12, r9, lsl #4
        ldr     r10, [r4, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        ldr     r3, [r6, #8]
        ldr     r2, [r6, #0xC]
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x40]
        mov     r1, r2
        mov     r0, r3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        bl      __adddf3
        ldr     r10, [r4, #8]
        ldr     r3, [r5, #8]
        ldr     r2, [r5, #0xC]
        ldr     r4, [r4, #0xC]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __adddf3
        ldr     r3, [r5]
        ldr     r2, [r5, #4]
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x2C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        str     r0, [sp, #0x48]
        add     r9, r12, r9
        cmp     r9, r8
        str     r1, [sp, #0x3C]
        subge   r9, r9, r8
        ldr     r12, [sp, #0x50]
        add     r7, r7, #2
        add     r5, r5, #0x20
        cmp     r7, r12
        add     r6, r6, #0x20
        blt     LCQG14
        ldr     r11, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x48]
        ldr     r5, [sp, #0x38]
        ldr     r9, [sp, #0x40]
        ldr     r8, [sp, #0x20]
        ldr     r4, [sp, #0x28]
LCQG15:
        ldr     r12, [sp, #0x74]
        cmp     r12, #0
        ble     LCQG20
        mov     r0, r9
        ldr     r1, [sp, #0x44]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [sp, #0x24]
        mov     r2, r7
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        mov     r3, r6
        bl      __adddf3
        str     r1, [r8, #4]
        str     r0, [r8]
        ldr     r1, [sp, #0x44]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        rsb     r9, r4, #0
        mov     r10, r9, lsl #3
        str     r0, [r12, +r9, lsl #3]
        add     r12, r12, r10
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
LCQG16:
        ldr     r2, [sp, #0x10]
        add     r4, r4, #1
        add     r8, r8, #8
        str     r0, [r2, +r9, lsl #3]
        ldr     r0, [sp, #8]
        add     r2, r10, r2
        str     r1, [r2, #4]
        cmp     r4, r0
        ldr     r0, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #0x24]
        blt     LCQG11
LCQG17:
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LCQG18:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r1, [r9, #4]
        str     r0, [r9]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [sp, #0x38]
        rsb     r10, r7, #0
        mov     r11, r10, lsl #3
        str     r0, [r12, +r10, lsl #3]
        add     r12, r12, r11
        str     r1, [r12, #4]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        b       LCQG5
LCQG19:
        mov     r11, #0
        mov     r5, r11
        mov     r6, r5
        mov     r10, r6
        b       LCQG4
LCQG20:
        mov     r0, r9
        ldr     r1, [sp, #0x44]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x24]
        mov     r2, r7
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        mov     r3, r6
        bl      __subdf3
        str     r1, [r8, #4]
        str     r0, [r8]
        ldr     r1, [sp, #0x44]
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     r12, [sp, #0xC]
        rsb     r9, r4, #0
        mov     r10, r9, lsl #3
        str     r0, [r12, +r9, lsl #3]
        add     r12, r12, r10
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        b       LCQG16
LCQG21:
        mov     r11, #0
        mov     r7, r11
        mov     r6, r7
        mov     r10, r6
        b       LCQG15


