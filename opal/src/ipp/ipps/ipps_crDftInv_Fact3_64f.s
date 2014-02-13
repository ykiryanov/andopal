        .text
        .align  4
        .globl  _ipps_crDftInv_Fact3_64f


_ipps_crDftInv_Fact3_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     r12, [sp, #0x80]
        mov     r8, r0
        mov     r5, r3
        ldr     lr, [r8, +r5, lsl #4]
        add     r12, r12, #0x20
        add     r11, r8, r5, lsl #5
        mov     r7, r1
        str     lr, [sp, #0x34]
        ldr     r4, [r8, +r5, lsl #5]
        add     r10, r8, r5, lsl #4
        str     r10, [sp, #0x18]
        ldr     lr, [r10, #4]
        ldr     r0, [sp, #0x34]
        str     r11, [sp, #0x1C]
        str     lr, [sp, #0x30]
        ldr     r1, [sp, #0x30]
        ldr     r9, [r11, #4]
        mov     r6, r2
        str     r12, [sp, #0x20]
        mov     r2, r4
        mov     r3, r9
        bl      __adddf3
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        ldr     r12, [r10, #8]
        str     r12, [sp, #0x24]
        ldr     r10, [r10, #0xC]
        ldr     r0, [sp, #0x24]
        str     r10, [sp, #0x14]
        ldr     r12, [r11, #8]
        ldr     r1, [sp, #0x14]
        str     r12, [sp, #0x10]
        ldr     r11, [r11, #0xC]
        ldr     r2, [sp, #0x10]
        str     r11, [sp, #0xC]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x34]
        mov     r2, r4
        mov     r3, r9
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x24]
        ldr     r3, [sp, #0xC]
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        ldr     lr, [r8]
        ldr     r12, [pc, #0x5B4]
        mov     r10, r0
        ldr     r0, [sp, #0x2C]
        str     lr, [sp, #0x24]
        ldr     lr, [r8, #4]
        str     lr, [sp, #0x40]
        add     lr, r7, r5, lsl #3
        str     lr, [sp, #0x14]
        ldr     r9, [r12]
        str     r9, [sp, #0xC]
        ldr     r4, [r12, #4]
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x28]
        str     r4, [sp, #0x10]
        mov     r3, r4
        mov     r2, r9
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x38]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x3C]
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __adddf3
        ldr     r12, [pc, #0x540]
        str     r0, [sp, #0x4C]
        mov     r0, r10
        ldr     r11, [r12]
        mov     r4, r1
        ldr     r1, [sp, #8]
        str     r11, [sp]
        ldr     r10, [r12, #4]
        add     r12, r6, r5, lsl #3
        str     r12, [sp, #8]
        str     r10, [sp, #4]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x30]
        mov     r9, r0
        ldr     r0, [sp, #0x34]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        mov     r10, r0
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        bl      __adddf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r0, [r8, #8]
        ldr     r1, [r8, #0xC]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x50]
        mov     r2, r9
        bl      __adddf3
        str     r0, [r7, +r5, lsl #3]
        ldr     r12, [sp, #0x14]
        mov     r2, r10
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x4C]
        ldr     r3, [sp, #0x34]
        mov     r1, r4
        bl      __subdf3
        str     r0, [r6, +r5, lsl #3]
        ldr     r12, [sp, #8]
        mov     r2, r9
        str     r1, [r12, #4]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x50]
        add     r9, r7, r5, lsl #4
        bl      __subdf3
        str     r0, [r7, +r5, lsl #4]
        str     r1, [r9, #4]
        ldr     r0, [sp, #0x4C]
        ldr     r3, [sp, #0x34]
        mov     r2, r10
        mov     r1, r4
        bl      __adddf3
        str     r0, [r6, +r5, lsl #4]
        add     r10, r6, r5, lsl #4
        cmp     r5, #1
        str     r1, [r10, #4]
        ble     LCOG1
        ldr     r0, [sp, #0x1C]
        add     r4, r8, #0xC
        ldr     r8, [sp, #8]
        add     lr, r0, #4
        ldr     r0, [sp, #0x18]
        add     r9, r9, #4
        add     r8, r8, #4
        add     r6, r6, #4
        add     r12, r0, #4
        add     r0, r10, #4
        ldr     r10, [sp, #0x14]
        add     r7, r7, #4
        sub     r5, r5, #1
        str     r5, [sp, #0x18]
        add     r10, r10, #4
        str     r7, [sp, #8]
        str     r6, [sp, #0x14]
        str     r10, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r9, [sp, #0x24]
        str     r0, [sp, #0x1C]
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x34]
LCOG0:
        ldr     r0, [sp, #0x20]
        ldr     r12, [sp, #0x30]
        ldr     r8, [r0]
        ldr     r5, [r0, #4]
        ldr     r0, [r12, #0xC]
        mov     r2, r8
        str     r0, [sp, #0x50]
        ldr     r10, [r12, #0x10]
        ldr     r9, [r12, #0x14]
        ldr     r6, [r12, #0x18]
        ldr     r12, [sp, #0x20]
        ldr     r0, [sp, #0x50]
        mov     r1, r10
        mov     r3, r5
        ldr     r11, [r12, #8]
        ldr     r7, [r12, #0xC]
        bl      __muldf3
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x48]
        mov     r0, r9
        mov     r2, r11
        mov     r3, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp, #0x4C]
        bl      __adddf3
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x48]
        mov     r3, r5
        mov     r0, r9
        mov     r1, r6
        mov     r2, r8
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x50]
        mov     r6, r1
        mov     r2, r11
        mov     r3, r7
        mov     r1, r10
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        ldr     r12, [sp, #0x34]
        ldr     r3, [sp, #0x20]
        mov     r7, r0
        ldr     r2, [r12, #0xC]
        mov     r8, r1
        str     r2, [sp, #0x50]
        ldr     r11, [r12, #0x10]
        ldr     r2, [r3, #0x10]
        ldr     r0, [sp, #0x50]
        mov     r1, r11
        str     r2, [sp, #0x44]
        ldr     r2, [r3, #0x14]
        str     r2, [sp, #0x40]
        ldr     r10, [r3, #0x18]
        ldr     r9, [r3, #0x1C]
        ldr     lr, [r12, #0x14]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        str     lr, [sp, #0x3C]
        ldr     r12, [r12, #0x18]
        str     r12, [sp, #0x38]
        bl      __muldf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x38]
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x58]
        ldr     r2, [sp, #0x54]
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x3C]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        mov     r6, r1
        ldr     r1, [sp, #0x38]
        bl      __muldf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x54]
        mov     r2, r10
        mov     r3, r9
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x58]
        mov     r3, r1
        ldr     r1, [sp, #0x54]
        bl      __subdf3
        mov     r10, r0
        mov     r9, r1
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x48]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x48]
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x4C]
        mov     r2, r5
        mov     r3, r6
        bl      __subdf3
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x4C]
        mov     r2, r10
        mov     r0, r7
        mov     r3, r9
        mov     r1, r8
        bl      __adddf3
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        mov     r0, r7
        mov     r3, r9
        mov     r1, r8
        mov     r2, r10
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        ldr     r3, [sp, #0x10]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x54]
        bl      __muldf3
        ldr     r11, [r4, #4]
        ldr     r10, [r4, #8]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r5, r0
        mov     r9, r1
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x44]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __muldf3
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]
        bl      __adddf3
        mov     r7, r1
        mov     r6, r0
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        ldr     r0, [sp, #0x40]
        bl      __muldf3
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x50]
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        ldr     r1, [sp, #0x4C]
        bl      __muldf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x58]
        mov     r8, r1
        ldr     r1, [sp, #0x54]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #8]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r0, [sp, #0x48]
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]!
        ldr     r1, [sp, #0x44]
        bl      __adddf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        mov     r0, r5
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        mov     r3, r8
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r2, [sp, #0x50]
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        mov     r0, r5
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x24]
        mov     r3, r8
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r2, [sp, #0x50]
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, #4]
        str     r1, [r2, #8]!
        ldr     r0, [sp, #0x18]
        str     r2, [sp, #0x1C]
        subs    r0, r0, #1
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        add     r0, r0, #0x20
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x10
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x10
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #8
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x18]
        bne     LCOG0
LCOG1:
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCOG_C_1_3
        .long   LCOG_S_1_3


        .data
        .align  4


LCOG_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCOG_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


