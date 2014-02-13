        .text
        .align  4
        .globl  _ipps_crDftFwd_Prime3_64f


_ipps_crDftFwd_Prime3_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     lr, [sp, #0x90]
        ldr     r6, [sp, #0x8C]
        ldr     r12, [sp, #0x94]
        cmp     lr, #0
        mov     r4, r3
        ble     LCOL3
        ldr     r9, [pc, #0x2E4]
        ldr     r5, [pc, #0x2E4]
        mul     r7, r2, r6
        ldr     r8, [r9]
        ldr     r9, [r9, #4]
        ldr     r10, [r5]
        ldr     r5, [r5, #4]
        mov     r6, r6, lsl #1
        mul     r6, r2, r6
        str     r10, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r9, [sp, #0x2C]
        str     r8, [sp, #0x38]
        str     r2, [sp, #0x18]
LCOL0:
        ldr     r5, [r12], #4
        cmp     r7, #0
        add     r2, r0, r5, lsl #3
        add     r8, r1, r5, lsl #3
        add     r10, r2, r7, lsl #3
        add     r11, r8, r7, lsl #3
        add     r3, r2, r6, lsl #3
        add     r9, r8, r6, lsl #3
        ble     LCOL2
        mov     r5, #0
        str     r9, [sp, #0x30]
        str     r3, [sp, #0x34]
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x40]
        str     r2, [sp, #0x28]
        str     r12, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r7, [sp, #0x14]
        str     lr, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LCOL1:
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x34]
        ldr     r12, [sp, #0x34]
        ldr     r11, [r1, +r5, lsl #3]
        add     r1, r1, r5, lsl #3
        ldr     r7, [r2, +r5, lsl #3]
        ldr     r8, [r1, #4]
        add     r12, r12, r5, lsl #3
        ldr     r3, [r12, #4]
        mov     r2, r7
        mov     r0, r11
        mov     r1, r8
        str     r3, [sp, #0x44]
        bl      __adddf3
        ldr     r12, [sp, #0x3C]
        ldr     r6, [r12, +r5, lsl #3]
        ldr     r12, [sp, #0x30]
        ldr     r9, [r12, +r5, lsl #3]
        ldr     r12, [sp, #0x3C]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x4C]
        mov     r2, r9
        add     r12, r12, r5, lsl #3
        ldr     r10, [r12, #4]
        ldr     r12, [sp, #0x30]
        mov     r0, r6
        mov     r1, r10
        add     r12, r12, r5, lsl #3
        ldr     r3, [r12, #4]
        str     r3, [sp, #0x50]
        bl      __adddf3
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x58]
        mov     r2, r7
        mov     r0, r11
        mov     r1, r8
        bl      __subdf3
        ldr     r3, [sp, #0x50]
        ldr     r12, [sp, #0x28]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x5C]
        add     r7, r12, r5, lsl #3
        mov     r1, r10
        mov     r2, r9
        mov     r0, r6
        bl      __subdf3
        ldr     r2, [sp, #0x28]
        ldr     r8, [r7, #4]
        ldr     r3, [sp, #0x2C]
        ldr     r9, [r2, +r5, lsl #3]
        str     r0, [sp, #0x50]
        str     r1, [sp, #0x60]
        ldr     r2, [sp, #0x38]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x40]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x2C]
        ldr     r11, [r12, +r5, lsl #3]
        add     r12, r12, r5, lsl #3
        str     r12, [sp, #0x64]
        ldr     r10, [r12, #4]
        mov     r6, r0
        ldr     r0, [sp, #0x54]
        mov     r7, r1
        ldr     r1, [sp, #0x58]
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        mov     r10, r0
        ldr     r0, [sp, #0x50]
        mov     r11, r1
        ldr     r1, [sp, #0x60]
        bl      __muldf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x50]
        ldr     r2, [sp, #0x20]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x5C]
        ldr     r3, [sp, #0x24]
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        str     r0, [sp, #0x5C]
        str     r1, [sp, #0x44]
        mov     r0, r9
        mov     r1, r8
        bl      __adddf3
        str     r1, [r4, #4]
        str     r0, [r4]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x58]
        ldr     r0, [r2, +r5, lsl #3]
        ldr     r2, [sp, #0x64]
        ldr     r1, [r2, #4]
        ldr     r2, [sp, #0x54]
        bl      __adddf3
        str     r0, [r4, #8]
        str     r1, [r4, #0xC]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x50]
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        str     r0, [r4, #0x10]
        str     r1, [r4, #0x14]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x44]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        str     r0, [r4, #0x18]
        str     r1, [r4, #0x1C]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x50]
        mov     r0, r6
        mov     r1, r7
        bl      __adddf3
        str     r0, [r4, #0x20]
        str     r1, [r4, #0x24]
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x44]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x18]
        str     r0, [r4, #0x28]
        str     r1, [r4, #0x2C]
        ldr     r0, [sp, #0x14]
        add     r5, r2, r5
        add     r4, r4, #0x30
        cmp     r5, r0
        blt     LCOL1
        ldr     r12, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #0x14]
        ldr     lr, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCOL2:
        subs    lr, lr, #1
        bne     LCOL0
LCOL3:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
        .long   LCOL_C_1_3
        .long   LCOL_S_1_3


        .data
        .align  4


LCOL_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCOL_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


