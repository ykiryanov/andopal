        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Prime3_64fc


_ipps_cDftOutOrdFwd_Prime3_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        cmp     r2, #0
        add     r4, r0, r2, lsl #4
        add     r5, r0, r2, lsl #5
        add     r6, r1, r2, lsl #4
        add     lr, r1, r2, lsl #5
        ble     LCPB1
        ldr     r3, [pc, #0x240]
        ldr     r12, [pc, #0x240]
        sub     r9, lr, #4
        ldr     lr, [r3]
        ldr     r3, [r3, #4]
        ldr     r10, [r12]
        ldr     r12, [r12, #4]
        sub     r8, r6, #4
        sub     r7, r1, #4
        sub     r6, r0, #4
        sub     r5, r5, #4
        sub     r4, r4, #4
        str     r12, [sp, #0xC]
        str     r10, [sp, #8]
        str     r3, [sp, #0x10]
        str     lr, [sp, #4]
        str     r2, [sp]
LCPB0:
        ldr     r0, [r4, #4]
        str     r0, [sp, #0x14]
        ldr     r1, [r4, #8]
        str     r1, [sp, #0x18]
        ldr     r2, [r5, #4]
        str     r2, [sp, #0x1C]
        ldr     r1, [r5, #8]
        str     r1, [sp, #0x20]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        bl      __adddf3
        ldr     r10, [r4, #0xC]
        ldr     r11, [r4, #0x10]!
        ldr     r2, [r5, #0xC]
        str     r2, [sp, #0x24]
        ldr     r2, [r5, #0x10]!
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        ldr     r3, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x18]
        bl      __subdf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [r6, #4]
        ldr     r3, [sp, #0x10]
        str     r2, [sp, #0x28]
        ldr     r11, [r6, #8]
        ldr     r2, [sp, #4]
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x30]
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r6, #0xC]
        ldr     r3, [sp, #0x10]
        str     r2, [sp, #0x14]
        ldr     r2, [r6, #0x10]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        str     r2, [sp, #0x3C]
        ldr     r2, [sp, #4]
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x38]
        bl      __muldf3
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x14]
        bl      __adddf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        str     r1, [sp, #0x3C]
        ldr     r1, [sp, #0x18]
        mov     r10, r0
        ldr     r0, [sp, #0x24]
        bl      __muldf3
        str     r0, [sp, #0x24]
        ldr     r2, [sp, #8]
        str     r1, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x1C]
        mov     r1, r11
        bl      __adddf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]!
        bl      __adddf3
        str     r0, [r7, #0xC]
        str     r1, [r7, #0x10]!
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x44]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x18]
        bl      __subdf3
        str     r1, [r8, #8]
        str     r0, [r8, #4]
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        mov     r0, r10
        bl      __adddf3
        str     r0, [r8, #0xC]
        str     r1, [r8, #0x10]!
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x44]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        str     r1, [r9, #8]
        str     r0, [r9, #4]
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        mov     r0, r10
        bl      __subdf3
        str     r0, [r9, #0xC]
        str     r1, [r9, #0x10]!
        ldr     r0, [sp]
        subs    r0, r0, #1
        str     r0, [sp]
        bne     LCPB0
LCPB1:
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
        .long   LCPB_C_1_3
        .long   LCPB_S_1_3


        .data
        .align  4


LCPB_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCPB_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


