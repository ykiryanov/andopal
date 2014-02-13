        .text
        .align  4
        .globl  _ipps_cDftFwd_Prime5_64fc


_ipps_cDftFwd_Prime5_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD4
        ldr     r12, [sp, #0xF8]
        ldr     lr, [sp, #0xFC]
        cmp     r12, #0
        str     lr, [sp, #8]
        str     r0, [sp, #4]
        str     r2, [sp]
        ble     LCPT3
        ldr     r8, [pc, #0x678]
        ldr     r2, [pc, #0x678]
        ldr     r6, [pc, #0x678]
        ldr     r7, [pc, #0x678]
        add     r0, r1, r1, lsl #2
        add     r0, r1, r0
        mul     r4, r0, r3
        mov     lr, r3, lsl #2
        mul     r5, r1, lr
        mov     r0, r3, lsl #1
        mul     r0, r1, r0
        mov     r3, r3, lsl #3
        mul     lr, r1, r3
        ldr     r10, [r8]
        ldr     r3, [r8, #4]
        ldr     r9, [r2]
        ldr     r8, [r6]
        ldr     r11, [r7]
        ldr     r2, [r2, #4]
        ldr     r6, [r6, #4]
        ldr     r7, [r7, #4]
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #8]
        str     r11, [sp, #0x54]
        str     r6, [sp, #0x60]
        str     r7, [sp, #0x64]
        str     r8, [sp, #0x68]
        str     r2, [sp, #0x50]
        str     r9, [sp, #0x4C]
        str     r3, [sp, #0x5C]
        str     r10, [sp, #0x58]
        str     lr, [sp, #0x18]
        str     r4, [sp, #0x14]
        str     r1, [sp, #0x20]
LCPT0:
        ldr     r1, [r5], #4
        ldr     r2, [sp, #4]
        ldr     r4, [sp, #0x18]
        cmp     r0, #0
        add     r3, r2, r1, lsl #4
        ldr     r1, [sp, #0x10]
        add     lr, r3, r0, lsl #3
        add     r6, r3, r4, lsl #3
        add     r2, r3, r1, lsl #3
        ldr     r1, [sp, #0x14]
        add     r1, r3, r1, lsl #3
        ble     LCPT2
        add     r9, r6, #8
        str     r9, [sp, #0x3C]
        ldr     r9, [sp]
        add     r8, lr, #8
        add     r10, r2, #8
        add     r11, r1, #8
        add     r7, r3, #8
        mov     r4, #0
        str     r7, [sp, #0x48]
        str     r11, [sp, #0x38]
        str     r10, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r6, [sp, #0x40]
        str     r1, [sp, #0x44]
        str     r2, [sp, #0x30]
        str     lr, [sp, #0x34]
        str     r3, [sp, #0x24]
        str     r5, [sp, #8]
        str     r0, [sp, #0x1C]
        str     r12, [sp, #0xC]
LCPT1:
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x40]
        ldr     r11, [r1, +r4, lsl #3]
        add     r1, r1, r4, lsl #3
        ldr     r2, [r2, +r4, lsl #3]
        mov     r0, r11
        str     r2, [sp, #0x6C]
        ldr     r5, [r1, #4]
        ldr     r2, [sp, #0x40]
        mov     r1, r5
        add     r2, r2, r4, lsl #3
        ldr     r3, [r2, #4]
        ldr     r2, [sp, #0x6C]
        str     r3, [sp, #0x70]
        bl      __adddf3
        ldr     r3, [sp, #0x2C]
        ldr     r2, [sp, #0x3C]
        ldr     r10, [r3, +r4, lsl #3]
        ldr     r8, [r2, +r4, lsl #3]
        add     r3, r3, r4, lsl #3
        ldr     r6, [r3, #4]
        ldr     r3, [sp, #0x3C]
        mov     r2, r8
        add     r3, r3, r4, lsl #3
        ldr     r7, [r3, #4]
        str     r1, [sp, #0x78]
        str     r0, [sp, #0x74]
        mov     r1, r6
        mov     r0, r10
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x80]
        mov     r0, r11
        mov     r1, r5
        bl      __subdf3
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        mov     r1, r6
        mov     r2, r8
        mov     r0, r10
        mov     r3, r7
        bl      __subdf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [r3, +r4, lsl #3]
        add     r3, r3, r4, lsl #3
        str     r2, [sp, #0x84]
        ldr     r2, [sp, #0x44]
        ldr     r3, [r3, #4]
        ldr     r7, [r2, +r4, lsl #3]
        str     r3, [sp, #0x88]
        ldr     r3, [sp, #0x44]
        mov     r2, r7
        add     r3, r3, r4, lsl #3
        ldr     r5, [r3, #4]
        str     r1, [sp, #0x90]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        ldr     lr, [sp, #0x38]
        ldr     r11, [r12, +r4, lsl #3]
        ldr     r10, [lr, +r4, lsl #3]
        add     r12, r12, r4, lsl #3
        ldr     r6, [r12, #4]
        ldr     r12, [sp, #0x38]
        mov     r2, r10
        add     r12, r12, r4, lsl #3
        ldr     r8, [r12, #4]
        str     r1, [sp, #0x98]
        str     r0, [sp, #0x94]
        mov     r1, r6
        mov     r0, r11
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x9C]
        str     r1, [sp, #0xA0]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        mov     r2, r7
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x84]
        mov     r1, r6
        mov     r0, r11
        mov     r3, r8
        mov     r2, r10
        bl      __subdf3
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x58]
        ldr     r8, [r3, +r4, lsl #3]
        add     r3, r3, r4, lsl #3
        ldr     r5, [r3, #4]
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0x74]
        ldr     r3, [sp, #0x5C]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0x78]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r6, r0
        ldr     r0, [sp, #0x94]
        mov     r7, r1
        ldr     r1, [sp, #0x98]
        bl      __muldf3
        ldr     r12, [sp, #0x48]
        add     r12, r12, r4, lsl #3
        mov     r2, r6
        mov     r3, r7
        str     r12, [sp, #0xAC]
        bl      __adddf3
        ldr     r12, [sp, #0x48]
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        ldr     r11, [r12, +r4, lsl #3]
        ldr     r12, [sp, #0xAC]
        ldr     r10, [r12, #4]
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0x7C]
        str     r1, [sp, #0xB4]
        ldr     r1, [sp, #0x80]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r6, r0
        ldr     r0, [sp, #0x9C]
        mov     r7, r1
        ldr     r1, [sp, #0xA0]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0x90]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0xB8]
        ldr     r0, [sp, #0x8C]
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x64]
        mov     r6, r0
        ldr     r0, [sp, #0xA4]
        mov     r7, r1
        ldr     r1, [sp, #0xA8]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0xC0]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0x6C]
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x64]
        mov     r6, r0
        ldr     r0, [sp, #0x88]
        mov     r7, r1
        ldr     r1, [sp, #0x84]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        str     r0, [sp, #0xC8]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0x78]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        mov     r6, r0
        ldr     r0, [sp, #0x94]
        mov     r7, r1
        ldr     r1, [sp, #0x98]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x80]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r11
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x9C]
        ldr     r1, [sp, #0xA0]
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x64]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0x90]
        mov     r10, r0
        ldr     r0, [sp, #0x8C]
        bl      __muldf3
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0xA4]
        mov     r11, r1
        ldr     r1, [sp, #0xA8]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x90]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x64]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0x6C]
        bl      __muldf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x88]
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0x60]
        mov     r11, r1
        ldr     r1, [sp, #0x84]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x90]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        str     r0, [sp, #0x90]
        mov     r11, r1
        mov     r0, r8
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        bl      __adddf3
        str     r1, [r9, #4]
        str     r0, [r9]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x80]
        ldr     r0, [r2, +r4, lsl #3]
        ldr     r2, [sp, #0xAC]
        ldr     r1, [r2, #4]
        ldr     r2, [sp, #0x7C]
        bl      __adddf3
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xB4]
        bl      __subdf3
        str     r0, [r9, #0x10]
        str     r1, [r9, #0x14]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        ldr     r0, [sp, #0xB8]
        ldr     r1, [sp, #0xBC]
        bl      __adddf3
        str     r0, [r9, #0x18]
        str     r1, [r9, #0x1C]
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xA4]
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        str     r0, [r9, #0x20]
        str     r1, [r9, #0x24]
        ldr     r1, [sp, #0xD0]
        ldr     r2, [sp, #0x90]
        mov     r0, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r9, #0x28]
        str     r1, [r9, #0x2C]
        ldr     r2, [sp, #0xA8]
        ldr     r3, [sp, #0xA4]
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        str     r1, [r9, #0x34]
        str     r0, [r9, #0x30]
        ldr     r1, [sp, #0xD0]
        ldr     r2, [sp, #0x90]
        mov     r0, r10
        mov     r3, r11
        bl      __subdf3
        str     r0, [r9, #0x38]
        str     r1, [r9, #0x3C]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [sp, #0xB4]
        ldr     r2, [sp, #0xC0]
        ldr     r3, [sp, #0xC4]
        bl      __adddf3
        str     r0, [r9, #0x40]
        str     r1, [r9, #0x44]
        ldr     r0, [sp, #0xB8]
        ldr     r1, [sp, #0xBC]
        ldr     r2, [sp, #0xC8]
        ldr     r3, [sp, #0xCC]
        bl      __subdf3
        ldr     r2, [sp, #0x20]
        str     r0, [r9, #0x48]
        str     r1, [r9, #0x4C]
        ldr     r0, [sp, #0x1C]
        add     r4, r4, r2, lsl #1
        add     r9, r9, #0x50
        cmp     r4, r0
        blt     LCPT1
        ldr     r5, [sp, #8]
        ldr     r0, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        str     r9, [sp]
LCPT2:
        subs    r12, r12, #1
        bne     LCPT0
LCPT3:
        add     sp, sp, #0xD4
        ldmia   sp!, {r4 - r11, pc}
        .long   LCPT_C_1_5
        .long   LCPT_C_2_5
        .long   LCPT_S_1_5
        .long   LCPT_S_2_5


        .data
        .align  4


LCPT_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCPT_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCPT_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCPT_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


