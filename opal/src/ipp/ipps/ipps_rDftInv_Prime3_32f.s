        .text
        .align  4
        .globl  _ipps_rDftInv_Prime3_32f


_ipps_rDftInv_Prime3_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     lr, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        mov     r9, r0
        cmp     lr, #0
        mov     r8, r1
        ble     LCJC3
        mul     r4, r8, r3
        ldr     r6, [pc, #0x10C]
        ldr     r5, [pc, #0x10C]
        mov     r3, r3, lsl #1
        mul     r3, r8, r3
        ldr     r6, [r6]
        ldr     r7, [r5]
        str     r6, [sp, #0x20]
LCJC0:
        ldr     r5, [r12], #4
        cmp     r4, #0
        add     r5, r2, r5, lsl #2
        add     r11, r5, r3, lsl #2
        add     r6, r5, r4, lsl #2
        ble     LCJC2
        mov     r10, #0
        str     r11, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     lr, [sp, #4]
        str     r2, [sp]
LCJC1:
        ldr     r0, [r9, #4]
        mov     r1, r0
        bl      __addsf3
        ldr     r1, [r9, #8]
        mov     r4, r0
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        ldr     r6, [r9], #0xC
        mov     r11, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r5, r0
        mov     r0, r11
        mov     r1, r7
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r6
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2, +r10, lsl #2]
        mov     r0, r5
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r1, r11
        str     r0, [r2, +r10, lsl #2]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, +r10, lsl #2]
        ldr     r2, [sp, #0x10]
        add     r10, r8, r10
        cmp     r10, r2
        blt     LCJC1
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r2, [sp]
LCJC2:
        subs    lr, lr, #1
        bne     LCJC0
LCJC3:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJC_C_1_3
        .long   LCJC_S_1_3


        .data
        .align  4


LCJC_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCJC_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


