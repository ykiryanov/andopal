        .text
        .align  4
        .globl  _ipps_rDftFwd_Prime5_64f


_ipps_rDftFwd_Prime5_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7C
        ldr     r12, [sp, #0xA0]
        ldr     lr, [sp, #0xA4]
        cmp     r12, #0
        str     lr, [sp, #8]
        str     r0, [sp, #4]
        str     r2, [sp]
        ble     LCNT3
        mul     r5, r1, r3
        ldr     r4, [pc, #0x374]
        ldr     r8, [pc, #0x374]
        ldr     r6, [pc, #0x374]
        ldr     r7, [pc, #0x374]
        mov     r0, r3, lsl #1
        mul     lr, r1, r0
        add     r0, r1, r1, lsl #1
        mul     r2, r3, r0
        mov     r3, r3, lsl #2
        mul     r0, r1, r3
        ldr     r3, [r8, #4]
        ldr     r9, [r8]
        ldr     r10, [r4]
        ldr     r8, [r6]
        ldr     r11, [r7]
        ldr     r4, [r4, #4]
        ldr     r6, [r6, #4]
        ldr     r7, [r7, #4]
        str     r3, [sp, #0x30]
        str     r1, [sp, #0x20]
        ldr     r3, [sp, #8]
        ldr     r1, [sp, #4]
        str     r7, [sp, #0x3C]
        str     r11, [sp, #0x38]
        str     r6, [sp, #0x50]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x4C]
        str     r4, [sp, #0x2C]
        str     r10, [sp, #0x44]
LCNT0:
        ldr     r4, [r3], #4
        cmp     r5, #0
        add     r6, r1, r4, lsl #3
        add     r8, r6, r5, lsl #3
        add     r9, r6, lr, lsl #3
        add     r10, r6, r2, lsl #3
        add     r7, r6, r0, lsl #3
        ble     LCNT2
        mov     r4, #0
        str     r7, [sp, #0x28]
        str     r10, [sp, #0x48]
        str     r9, [sp, #0x54]
        str     r8, [sp, #0x24]
        str     r6, [sp, #0x40]
        str     r3, [sp, #8]
        str     r0, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r5, [sp, #0x1C]
        str     r12, [sp, #0xC]
LCNT1:
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x28]
        ldr     r9, [r1, +r4, lsl #3]
        add     r1, r1, r4, lsl #3
        ldr     r8, [r2, +r4, lsl #3]
        ldr     r7, [r1, #4]
        add     r3, r3, r4, lsl #3
        ldr     r10, [r3, #4]
        mov     r2, r8
        mov     r0, r9
        mov     r1, r7
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0x48]
        mov     r3, r10
        mov     r6, r0
        mov     r5, r1
        mov     r0, r9
        add     r10, r12, r4, lsl #3
        mov     r1, r7
        mov     r2, r8
        bl      __subdf3
        ldr     r12, [sp, #0x48]
        ldr     r12, [r12, +r4, lsl #3]
        str     r12, [sp, #0x58]
        ldr     r12, [sp, #0x54]
        ldr     r9, [r10, #4]
        ldr     r2, [sp, #0x58]
        ldr     r11, [r12, +r4, lsl #3]
        ldr     r12, [sp, #0x54]
        mov     r3, r9
        add     r12, r12, r4, lsl #3
        ldr     r10, [r12, #4]
        str     r1, [sp, #0x60]
        str     r0, [sp, #0x5C]
        mov     r0, r11
        mov     r1, r10
        bl      __adddf3
        ldr     r2, [sp, #0x58]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r11
        mov     r1, r10
        mov     r3, r9
        bl      __subdf3
        ldr     r12, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x2C]
        ldr     r9, [r12, +r4, lsl #3]
        ldr     r12, [sp, #0x40]
        str     r0, [sp, #0x58]
        mov     r0, r6
        add     r12, r12, r4, lsl #3
        ldr     r10, [r12, #4]
        mov     r11, r1
        mov     r1, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x30]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r0, r7
        mov     r1, r8
        bl      __muldf3
        ldr     r3, [sp, #0x68]
        ldr     r2, [sp, #0x64]
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x50]
        str     r1, [sp, #0x64]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x70]
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x30]
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x6C]
        mov     r0, r6
        mov     r1, r5
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x2C]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x78]
        mov     r0, r7
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x5C]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x60]
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x50]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x58]
        str     r1, [sp, #0x5C]
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x5C]
        bl      __subdf3
        str     r0, [sp, #0x60]
        mov     r11, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        add     r4, r2, r4
        ldr     r2, [sp]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [sp, #0x68]
        str     r0, [r2, #8]
        ldr     r0, [sp, #0x64]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x70]
        str     r0, [r2, #0x10]
        ldr     r0, [sp, #0x6C]
        str     r0, [r2, #0x14]
        ldr     r0, [sp, #0x78]
        str     r0, [r2, #0x18]
        ldr     r0, [sp, #0x74]
        str     r0, [r2, #0x1C]
        ldr     r0, [sp, #0x60]
        str     r11, [r2, #0x24]
        str     r0, [r2, #0x20]
        ldr     r0, [sp, #0x1C]
        cmp     r4, r0
        ldr     r0, [sp]
        add     r0, r0, #0x28
        str     r0, [sp]
        blt     LCNT1
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        ldr     r5, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        ldr     r1, [sp, #4]
LCNT2:
        subs    r12, r12, #1
        bne     LCNT0
LCNT3:
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNT_C_1_5
        .long   LCNT_C_2_5
        .long   LCNT_S_1_5
        .long   LCNT_S_2_5


        .data
        .align  4


LCNT_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCNT_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCNT_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCNT_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


