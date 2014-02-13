        .text
        .align  4
        .globl  _ipps_crDftInv_Prime5_64f


_ipps_crDftInv_Prime5_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xD8
        ldr     lr, [sp, #0x100]
        ldr     r4, [sp, #0x104]
        ldr     r12, [sp, #0xFC]
        cmp     lr, #0
        str     lr, [sp, #8]
        str     r4, [sp, #0xC]
        str     r0, [sp, #4]
        str     r1, [sp]
        ble     LCOB3
        mul     r0, r2, r12
        ldr     r6, [pc, #0x678]
        ldr     r7, [pc, #0x678]
        ldr     r8, [pc, #0x678]
        mov     r1, r12, lsl #1
        mul     lr, r2, r1
        add     r1, r2, r2, lsl #1
        mul     r4, r12, r1
        mov     r12, r12, lsl #2
        mul     r1, r2, r12
        ldr     r11, [pc, #0x660]
        ldr     r5, [r6]
        ldr     r12, [r6, #4]
        ldr     r6, [r7]
        ldr     r9, [r8]
        ldr     r10, [r11]
        ldr     r7, [r7, #4]
        ldr     r8, [r8, #4]
        ldr     r11, [r11, #4]
        str     r9, [sp, #0x6C]
        str     r7, [sp, #0x50]
        ldr     r7, [sp, #0xC]
        ldr     r9, [sp, #8]
        str     r11, [sp, #0x68]
        str     r10, [sp, #0x5C]
        str     r8, [sp, #0x58]
        str     r6, [sp, #0x60]
        str     r12, [sp, #0x54]
        str     r5, [sp, #0x64]
        str     r1, [sp, #0x1C]
        str     r4, [sp, #0x18]
        str     lr, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0x24]
LCOB0:
        ldr     r1, [r7], #4
        ldr     r2, [sp, #4]
        ldr     r8, [sp, #0x1C]
        cmp     r0, #0
        add     r3, r2, r1, lsl #3
        ldr     r2, [sp]
        add     r6, r3, r0, lsl #3
        add     r10, r3, r8, lsl #3
        add     r12, r2, r1, lsl #3
        ldr     r1, [sp, #0x14]
        add     r5, r12, r0, lsl #3
        add     r11, r12, r8, lsl #3
        add     r4, r3, r1, lsl #3
        add     r2, r12, r1, lsl #3
        ldr     r1, [sp, #0x18]
        add     lr, r3, r1, lsl #3
        add     r1, r12, r1, lsl #3
        ble     LCOB2
        str     r9, [sp, #8]
        ldr     r9, [sp, #0x10]
        mov     r8, #0
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x40]
        str     r1, [sp, #0x44]
        str     lr, [sp, #0x48]
        str     r2, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x38]
        str     r12, [sp, #0x4C]
        str     r3, [sp, #0x28]
        str     r7, [sp, #0xC]
        str     r0, [sp, #0x20]
LCOB1:
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x40]
        ldr     r11, [r1, +r8, lsl #3]
        add     r1, r1, r8, lsl #3
        ldr     r2, [r2, +r8, lsl #3]
        mov     r0, r11
        str     r2, [sp, #0x70]
        ldr     r4, [r1, #4]
        ldr     r2, [sp, #0x40]
        mov     r1, r4
        add     r2, r2, r8, lsl #3
        ldr     r3, [r2, #4]
        ldr     r2, [sp, #0x70]
        str     r3, [sp, #0x74]
        bl      __adddf3
        ldr     r3, [sp, #0x34]
        ldr     r2, [sp, #0x3C]
        ldr     r10, [r3, +r8, lsl #3]
        ldr     r7, [r2, +r8, lsl #3]
        add     r3, r3, r8, lsl #3
        ldr     r5, [r3, #4]
        ldr     r3, [sp, #0x3C]
        mov     r2, r7
        add     r3, r3, r8, lsl #3
        ldr     r6, [r3, #4]
        str     r1, [sp, #0x7C]
        str     r0, [sp, #0x78]
        mov     r1, r5
        mov     r0, r10
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x70]
        ldr     r3, [sp, #0x74]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x84]
        mov     r0, r11
        mov     r1, r4
        bl      __subdf3
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r1, r5
        mov     r2, r7
        mov     r0, r10
        mov     r3, r6
        bl      __subdf3
        ldr     r3, [sp, #0x30]
        ldr     r2, [r3, +r8, lsl #3]
        add     r3, r3, r8, lsl #3
        str     r2, [sp, #0x88]
        ldr     r2, [sp, #0x48]
        ldr     r3, [r3, #4]
        ldr     r6, [r2, +r8, lsl #3]
        str     r3, [sp, #0x8C]
        ldr     r3, [sp, #0x48]
        mov     r2, r6
        add     r3, r3, r8, lsl #3
        ldr     r4, [r3, #4]
        str     r1, [sp, #0x94]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x8C]
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x44]
        ldr     r11, [r12, +r8, lsl #3]
        ldr     r10, [lr, +r8, lsl #3]
        add     r12, r12, r8, lsl #3
        ldr     r5, [r12, #4]
        ldr     r12, [sp, #0x44]
        mov     r2, r10
        add     r12, r12, r8, lsl #3
        ldr     r7, [r12, #4]
        str     r1, [sp, #0x9C]
        str     r0, [sp, #0x98]
        mov     r1, r5
        mov     r0, r11
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0xA0]
        str     r1, [sp, #0xA4]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x8C]
        mov     r2, r6
        mov     r3, r4
        bl      __subdf3
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x88]
        mov     r1, r5
        mov     r0, r11
        mov     r3, r7
        mov     r2, r10
        bl      __subdf3
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x64]
        ldr     r7, [r3, +r8, lsl #3]
        add     r3, r3, r8, lsl #3
        ldr     r4, [r3, #4]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x78]
        ldr     r3, [sp, #0x54]
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x50]
        mov     r5, r0
        ldr     r0, [sp, #0x98]
        mov     r6, r1
        ldr     r1, [sp, #0x9C]
        bl      __muldf3
        ldr     r12, [sp, #0x4C]
        add     r12, r12, r8, lsl #3
        mov     r2, r5
        mov     r3, r6
        str     r12, [sp, #0xB0]
        bl      __adddf3
        ldr     r12, [sp, #0x4C]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x54]
        ldr     r11, [r12, +r8, lsl #3]
        ldr     r12, [sp, #0xB0]
        ldr     r10, [r12, #4]
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0x84]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x50]
        mov     r5, r0
        ldr     r0, [sp, #0xA0]
        mov     r6, r1
        ldr     r1, [sp, #0xA4]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0x94]
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0xBC]
        ldr     r0, [sp, #0x90]
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x68]
        mov     r5, r0
        ldr     r0, [sp, #0xA8]
        mov     r6, r1
        ldr     r1, [sp, #0xAC]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0xC4]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0x70]
        bl      __muldf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x68]
        mov     r5, r0
        ldr     r0, [sp, #0x8C]
        mov     r6, r1
        ldr     r1, [sp, #0x88]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x50]
        str     r0, [sp, #0xCC]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0xD0]
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x54]
        mov     r5, r0
        ldr     r0, [sp, #0x98]
        mov     r6, r1
        ldr     r1, [sp, #0x9C]
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r5, r0
        mov     r6, r1
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x50]
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x84]
        bl      __muldf3
        mov     r3, r10
        mov     r2, r11
        bl      __adddf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0xA4]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x54]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x68]
        str     r1, [sp, #0xD4]
        ldr     r1, [sp, #0x94]
        mov     r10, r0
        ldr     r0, [sp, #0x90]
        bl      __muldf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x58]
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0xA8]
        mov     r11, r1
        ldr     r1, [sp, #0xAC]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x94]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x68]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0x70]
        bl      __muldf3
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x8C]
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x58]
        mov     r11, r1
        ldr     r1, [sp, #0x88]
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x94]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        str     r0, [sp, #0x94]
        mov     r11, r1
        mov     r0, r7
        mov     r1, r4
        bl      __adddf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x9C]
        bl      __adddf3
        str     r1, [r9, #4]
        str     r0, [r9]
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x84]
        ldr     r0, [r2, +r8, lsl #3]
        ldr     r2, [sp, #0xB0]
        ldr     r1, [r2, #4]
        ldr     r2, [sp, #0x80]
        bl      __adddf3
        ldr     r2, [sp, #0xA0]
        ldr     r3, [sp, #0xA4]
        bl      __adddf3
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC8]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB8]
        bl      __adddf3
        str     r0, [r9, #0x10]
        str     r1, [r9, #0x14]
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xD0]
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xC0]
        bl      __subdf3
        str     r0, [r9, #0x18]
        str     r1, [r9, #0x1C]
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        mov     r0, r5
        mov     r1, r6
        bl      __adddf3
        str     r0, [r9, #0x20]
        str     r1, [r9, #0x24]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [sp, #0x94]
        mov     r0, r10
        mov     r3, r11
        bl      __subdf3
        str     r0, [r9, #0x28]
        str     r1, [r9, #0x2C]
        ldr     r2, [sp, #0xAC]
        ldr     r3, [sp, #0xA8]
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        str     r1, [r9, #0x34]
        str     r0, [r9, #0x30]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [sp, #0x94]
        mov     r0, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [r9, #0x38]
        str     r1, [r9, #0x3C]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [sp, #0xB8]
        ldr     r2, [sp, #0xC4]
        ldr     r3, [sp, #0xC8]
        bl      __subdf3
        str     r0, [r9, #0x40]
        str     r1, [r9, #0x44]
        ldr     r0, [sp, #0xBC]
        ldr     r1, [sp, #0xC0]
        ldr     r2, [sp, #0xCC]
        ldr     r3, [sp, #0xD0]
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        str     r0, [r9, #0x48]
        str     r1, [r9, #0x4C]
        ldr     r0, [sp, #0x20]
        add     r8, r2, r8
        add     r9, r9, #0x50
        cmp     r8, r0
        blt     LCOB1
        str     r9, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r0, [sp, #0x20]
        ldr     r9, [sp, #8]
LCOB2:
        subs    r9, r9, #1
        bne     LCOB0
LCOB3:
        add     sp, sp, #0xD8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCOB_C_1_5
        .long   LCOB_C_2_5
        .long   LCOB_S_1_5
        .long   LCOB_S_2_5


        .data
        .align  4


LCOB_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCOB_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCOB_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCOB_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


