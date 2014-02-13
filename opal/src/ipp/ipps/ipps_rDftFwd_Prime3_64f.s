        .text
        .align  4
        .globl  _ipps_rDftFwd_Prime3_64f


_ipps_rDftFwd_Prime3_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     lr, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        cmp     lr, #0
        ble     LCNU3
        ldr     r7, [pc, #0x18C]
        ldr     r5, [pc, #0x18C]
        mul     r4, r1, r3
        ldr     r6, [r7]
        ldr     r7, [r7, #4]
        ldr     r8, [r5]
        ldr     r5, [r5, #4]
        mov     r3, r3, lsl #1
        mul     r3, r1, r3
        str     r8, [sp, #0x1C]
        str     r5, [sp, #0x14]
        str     r7, [sp, #0x24]
        str     r6, [sp, #0x20]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x18]
LCNU0:
        ldr     r1, [r12], #4
        cmp     r4, #0
        add     r8, r0, r1, lsl #3
        add     r2, r8, r3, lsl #3
        add     r1, r8, r4, lsl #3
        ble     LCNU2
        mov     r9, #0
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x2C]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     lr, [sp, #4]
        str     r0, [sp]
LCNU1:
        ldr     r3, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        ldr     r10, [r3, +r9, lsl #3]
        add     r3, r3, r9, lsl #3
        ldr     r11, [r3, #4]
        ldr     r7, [r0, +r9, lsl #3]
        add     r1, r0, r9, lsl #3
        ldr     r6, [r1, #4]
        mov     r2, r10
        mov     r3, r11
        mov     r0, r7
        mov     r1, r6
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        mov     r1, r6
        mov     r2, r10
        mov     r3, r11
        mov     r0, r7
        add     r6, r8, r9, lsl #3
        bl      __subdf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r7, [r8, +r9, lsl #3]
        ldr     r6, [r6, #4]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        mov     r1, r6
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        add     r9, r2, r9
        ldr     r2, [sp, #0x30]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r3, [sp, #0x34]
        str     r3, [r2, #8]
        ldr     r3, [sp, #0x38]
        str     r10, [r2, #0x10]
        str     r11, [r2, #0x14]
        str     r3, [r2, #0xC]
        ldr     r0, [sp, #0x10]
        add     r2, r2, #0x18
        str     r2, [sp, #0x30]
        cmp     r9, r0
        blt     LCNU1
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r0, [sp]
LCNU2:
        subs    lr, lr, #1
        bne     LCNU0
LCNU3:
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNU_C_1_3
        .long   LCNU_S_1_3


        .data
        .align  4


LCNU_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCNU_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


