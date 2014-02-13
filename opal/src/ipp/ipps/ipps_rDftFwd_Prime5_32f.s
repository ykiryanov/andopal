        .text
        .align  4
        .globl  _ipps_rDftFwd_Prime5_32f


_ipps_rDftFwd_Prime5_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     lr, [sp, #0x74]
        ldr     r12, [sp, #0x78]
        cmp     lr, #0
        ble     LCJI3
        ldr     r6, [pc, #0x23C]
        ldr     r7, [pc, #0x23C]
        mul     r8, r1, r3
        ldr     r9, [r6]
        ldr     r4, [pc, #0x234]
        ldr     r10, [r7]
        ldr     r5, [pc, #0x230]
        mov     r6, r3, lsl #1
        mul     r7, r1, r6
        ldr     r4, [r4]
        ldr     r5, [r5]
        add     r6, r1, r1, lsl #1
        mul     r6, r3, r6
        mov     r3, r3, lsl #2
        mul     r3, r1, r3
        str     r5, [sp, #0x40]
        str     r9, [sp]
        str     r10, [sp, #0x3C]
        str     r2, [sp, #0x38]
        str     r1, [sp, #0x2C]
LCJI0:
        ldr     r2, [r12], #4
        cmp     r8, #0
        add     r2, r0, r2, lsl #2
        add     r10, r2, r7, lsl #2
        add     r11, r2, r6, lsl #2
        add     r1, r2, r3, lsl #2
        add     r9, r2, r8, lsl #2
        ble     LCJI2
        str     r11, [sp, #0x24]
        ldr     r11, [sp]
        mov     r5, #0
        str     r1, [sp, #0x1C]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x30]
        str     r2, [sp, #0x34]
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r8, [sp, #0x20]
        str     lr, [sp, #8]
        str     r0, [sp, #4]
LCJI1:
        ldr     r0, [sp, #0x1C]
        ldr     r7, [r0, +r5, lsl #2]
        ldr     r0, [sp, #0x30]
        ldr     r8, [r0, +r5, lsl #2]
        mov     r1, r7
        mov     r0, r8
        bl      __addsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        mov     r9, r0
        ldr     r8, [r2, +r5, lsl #2]
        ldr     r2, [sp, #0x28]
        ldr     r10, [r2, +r5, lsl #2]
        mov     r1, r8
        mov     r0, r10
        bl      __addsf3
        mov     r7, r0
        mov     r1, r8
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x3C]
        mov     r10, r0
        ldr     r8, [r2, +r5, lsl #2]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [sp, #0x44]
        mov     r0, r7
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        str     r0, [sp, #0x44]
        mov     r1, r4
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        str     r0, [sp, #0x48]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        bl      __addsf3
        str     r0, [sp, #0x48]
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [sp, #0x4C]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        str     r0, [sp, #0x4C]
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        mov     r9, r0
        mov     r0, r8
        mov     r1, r6
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        add     r5, r2, r5
        ldr     r2, [sp, #0x38]
        str     r0, [r2]
        ldr     r3, [sp, #0x44]
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x48]
        str     r3, [r2, #8]
        ldr     r3, [sp, #0x4C]
        str     r9, [r2, #0x10]
        str     r3, [r2, #0xC]
        ldr     r0, [sp, #0x20]
        add     r2, r2, #0x14
        str     r2, [sp, #0x38]
        cmp     r5, r0
        blt     LCJI1
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r8, [sp, #0x20]
        ldr     lr, [sp, #8]
        ldr     r0, [sp, #4]
LCJI2:
        subs    lr, lr, #1
        bne     LCJI0
LCJI3:
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJI_C_2_5
        .long   LCJI_C_1_5
        .long   LCJI_S_1_5
        .long   LCJI_S_2_5


        .data
        .align  4


LCJI_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCJI_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCJI_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCJI_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


