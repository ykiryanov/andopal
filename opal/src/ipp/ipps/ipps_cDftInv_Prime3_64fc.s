        .text
        .align  4
        .globl  _ipps_cDftInv_Prime3_64fc


_ipps_cDftInv_Prime3_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x64
        ldr     lr, [sp, #0x88]
        ldr     r12, [sp, #0x8C]
        cmp     lr, #0
        mov     r8, r2
        ble     LCPK3
        ldr     r7, [pc, #0x2E0]
        ldr     r5, [pc, #0x2E0]
        mov     r4, r3, lsl #1
        ldr     r6, [r7]
        mul     r4, r1, r4
        ldr     r9, [r5]
        ldr     r7, [r7, #4]
        ldr     r5, [r5, #4]
        mov     r3, r3, lsl #2
        mul     r3, r1, r3
        str     r9, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x34]
        str     r1, [sp, #0x14]
LCPK0:
        ldr     r1, [r12], #4
        cmp     r4, #0
        add     r1, r0, r1, lsl #4
        add     r6, r1, r3, lsl #3
        add     r5, r1, r4, lsl #3
        ble     LCPK2
        add     r10, r5, #8
        add     r11, r6, #8
        add     r7, r1, #8
        mov     r9, #0
        str     r7, [sp, #0x3C]
        str     r11, [sp, #0x2C]
        str     r10, [sp, #0x38]
        str     r6, [sp, #0x28]
        str     r5, [sp, #0x18]
        str     r1, [sp, #0x30]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     lr, [sp, #4]
        str     r0, [sp]
LCPK1:
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0x28]
        ldr     r11, [r1, +r9, lsl #3]
        add     r1, r1, r9, lsl #3
        ldr     r6, [r1, #4]
        ldr     r5, [r3, +r9, lsl #3]
        ldr     r3, [sp, #0x28]
        mov     r0, r11
        mov     r1, r6
        mov     r2, r5
        add     r3, r3, r9, lsl #3
        ldr     r3, [r3, #4]
        str     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r3, [sp, #0x38]
        ldr     r4, [r3, +r9, lsl #3]
        ldr     r3, [sp, #0x2C]
        ldr     r7, [r3, +r9, lsl #3]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r2, r7
        add     r3, r3, r9, lsl #3
        ldr     r10, [r3, #4]
        ldr     r3, [sp, #0x2C]
        mov     r0, r4
        mov     r1, r10
        add     r3, r3, r9, lsl #3
        ldr     r3, [r3, #4]
        str     r3, [sp, #0x4C]
        bl      __adddf3
        ldr     r3, [sp, #0x40]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x54]
        mov     r2, r5
        mov     r0, r11
        mov     r1, r6
        bl      __subdf3
        ldr     r3, [sp, #0x4C]
        ldr     r12, [sp, #0x30]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x58]
        add     r5, r12, r9, lsl #3
        mov     r1, r10
        mov     r2, r7
        mov     r0, r4
        bl      __subdf3
        ldr     r3, [sp, #0x30]
        ldr     r6, [r5, #4]
        ldr     r2, [sp, #0x34]
        ldr     r7, [r3, +r9, lsl #3]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x5C]
        ldr     r3, [sp, #0x24]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x48]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x3C]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x24]
        ldr     r11, [r12, +r9, lsl #3]
        add     r12, r12, r9, lsl #3
        str     r12, [sp, #0x60]
        ldr     r10, [r12, #4]
        mov     r4, r0
        ldr     r0, [sp, #0x50]
        mov     r5, r1
        ldr     r1, [sp, #0x54]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        mov     r10, r0
        ldr     r0, [sp, #0x4C]
        mov     r11, r1
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x4C]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x58]
        ldr     r3, [sp, #0x20]
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x40]
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        str     r1, [r8, #4]
        str     r0, [r8]
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x50]
        ldr     r0, [r3, +r9, lsl #3]
        ldr     r3, [sp, #0x60]
        ldr     r1, [r3, #4]
        ldr     r3, [sp, #0x54]
        bl      __adddf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x4C]
        mov     r0, r4
        mov     r1, r5
        bl      __adddf3
        str     r0, [r8, #0x10]
        str     r1, [r8, #0x14]
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x40]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        str     r0, [r8, #0x18]
        str     r1, [r8, #0x1C]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x4C]
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r8, #0x20]
        str     r1, [r8, #0x24]
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x40]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        str     r0, [r8, #0x28]
        str     r1, [r8, #0x2C]
        ldr     r0, [sp, #0x10]
        add     r9, r9, r3, lsl #1
        add     r8, r8, #0x30
        cmp     r9, r0
        blt     LCPK1
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r0, [sp]
LCPK2:
        subs    lr, lr, #1
        bne     LCPK0
LCPK3:
        add     sp, sp, #0x64
        ldmia   sp!, {r4 - r11, pc}
        .long   LCPK_C_1_3
        .long   LCPK_S_1_3


        .data
        .align  4


LCPK_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCPK_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


