        .text
        .align  4
        .globl  _ipps_rDftFwd_Prime3_32f


_ipps_rDftFwd_Prime3_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     lr, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        cmp     lr, #0
        mov     r7, r2
        ble     LCJJ3
        ldr     r6, [pc, #0x104]
        mul     r4, r1, r3
        ldr     r5, [pc, #0x100]
        ldr     r8, [r6]
        mov     r3, r3, lsl #1
        mul     r3, r1, r3
        ldr     r6, [r5]
        str     r8, [sp, #0x1C]
        str     r1, [sp, #0x18]
LCJJ0:
        ldr     r5, [r12], #4
        cmp     r4, #0
        add     r5, r0, r5, lsl #2
        add     r8, r5, r3, lsl #2
        add     r10, r5, r4, lsl #2
        ble     LCJJ2
        mov     r9, #0
        str     r8, [sp, #0x14]
        str     r5, [sp, #0x20]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     lr, [sp, #4]
        str     r0, [sp]
LCJJ1:
        ldr     r0, [sp, #0x14]
        ldr     r8, [r10, +r9, lsl #2]
        ldr     r5, [r0, +r9, lsl #2]
        mov     r1, r5
        mov     r0, r8
        bl      __addsf3
        mov     r4, r0
        mov     r1, r5
        mov     r0, r8
        bl      __subsf3
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r11, r0
        ldr     r5, [r3, +r9, lsl #2]
        ldr     r3, [sp, #0x18]
        mov     r0, r4
        add     r9, r3, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r8, r0
        mov     r0, r11
        mov     r1, r6
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r4
        bl      __addsf3
        str     r0, [r7]
        str     r8, [r7, #4]
        str     r11, [r7, #8]
        ldr     r0, [sp, #0x10]
        add     r7, r7, #0xC
        cmp     r9, r0
        blt     LCJJ1
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r0, [sp]
LCJJ2:
        subs    lr, lr, #1
        bne     LCJJ0
LCJJ3:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJJ_C_1_3
        .long   LCJJ_S_1_3


        .data
        .align  4


LCJJ_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCJJ_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


