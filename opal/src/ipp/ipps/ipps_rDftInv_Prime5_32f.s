        .text
        .align  4
        .globl  _ipps_rDftInv_Prime5_32f


_ipps_rDftInv_Prime5_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     lr, [sp, #0x70]
        ldr     r12, [sp, #0x74]
        mov     r4, r0
        cmp     lr, #0
        ble     LCJB3
        ldr     r6, [pc, #0x240]
        ldr     r7, [pc, #0x240]
        ldr     r8, [pc, #0x240]
        ldr     r9, [r6]
        ldr     r5, [pc, #0x23C]
        ldr     r10, [r7]
        ldr     r11, [r8]
        mul     r8, r1, r3
        ldr     r5, [r5]
        mov     r6, r3, lsl #1
        mul     r7, r1, r6
        add     r6, r1, r1, lsl #1
        mul     r6, r3, r6
        mov     r3, r3, lsl #2
        mul     r3, r1, r3
        str     r5, [sp, #0x38]
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x40]
        str     r1, [sp, #0x20]
LCJB0:
        ldr     r1, [r12], #4
        cmp     r8, #0
        add     r1, r2, r1, lsl #2
        add     r10, r1, r7, lsl #2
        add     r11, r1, r6, lsl #2
        add     r0, r1, r3, lsl #2
        add     r9, r1, r8, lsl #2
        ble     LCJB2
        mov     r5, #0
        str     r0, [sp, #0x1C]
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x2C]
        str     r9, [sp, #0x30]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        str     r8, [sp, #0x18]
        str     lr, [sp, #4]
        str     r2, [sp]
LCJB1:
        ldr     r1, [r4, #4]
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [r4, #8]
        mov     r7, r0
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [r4, #0xC]
        mov     r8, r0
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [r4, #0x10]
        mov     r6, r0
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        ldr     r10, [r4], #0x14
        mov     r9, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r11, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        mov     r11, r0
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        str     r0, [sp, #0x44]
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x44]
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        str     r0, [sp, #0x48]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        str     r0, [sp, #0x48]
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        mov     r8, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r7
        mov     r0, r10
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2, +r5, lsl #2]
        ldr     r1, [sp, #0x44]
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #0x30]
        mov     r1, r8
        str     r0, [r2, +r5, lsl #2]
        ldr     r0, [sp, #0x48]
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        mov     r1, r8
        str     r0, [r2, +r5, lsl #2]
        ldr     r0, [sp, #0x48]
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        str     r0, [r1, +r5, lsl #2]
        ldr     r1, [sp, #0x44]
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x1C]
        str     r0, [r1, +r5, lsl #2]
        ldr     r1, [sp, #0x20]
        add     r5, r1, r5
        ldr     r1, [sp, #0x18]
        cmp     r5, r1
        blt     LCJB1
        ldr     r12, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #0x18]
        ldr     lr, [sp, #4]
        ldr     r2, [sp]
LCJB2:
        subs    lr, lr, #1
        bne     LCJB0
LCJB3:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJB_S_1_5
        .long   LCJB_C_2_5
        .long   LCJB_C_1_5
        .long   LCJB_S_2_5


        .data
        .align  4


LCJB_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCJB_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCJB_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCJB_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


