        .text
        .align  4
        .globl  _ipps_cDftFwd_Prime3_32fc


_ipps_cDftFwd_Prime3_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     lr, [sp, #0x64]
        ldr     r12, [sp, #0x68]
        cmp     lr, #0
        mov     r8, r2
        ble     LCLJ3
        ldr     r6, [pc, #0x1D8]
        ldr     r5, [pc, #0x1D8]
        mov     r4, r3, lsl #1
        mul     r4, r1, r4
        mov     r3, r3, lsl #2
        mul     r3, r1, r3
        ldr     r6, [r6]
        ldr     r5, [r5]
        str     r1, [sp, #0x18]
        str     r6, [sp, #0x2C]
        str     r5, [sp, #0x34]
LCLJ0:
        ldr     r1, [r12], #4
        cmp     r4, #0
        add     r1, r0, r1, lsl #3
        add     r6, r1, r3, lsl #2
        add     r5, r1, r4, lsl #2
        ble     LCLJ2
        add     r10, r5, #4
        add     r11, r6, #4
        add     r7, r1, #4
        mov     r9, #0
        str     r7, [sp, #0x30]
        str     r11, [sp, #0x14]
        str     r10, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x1C]
        str     r1, [sp, #0x28]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     lr, [sp, #4]
        str     r0, [sp]
LCLJ1:
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x24]
        ldr     r7, [r0, +r9, lsl #2]
        ldr     r4, [r1, +r9, lsl #2]
        mov     r0, r7
        mov     r1, r4
        bl      __addsf3
        ldr     r3, [sp, #0x14]
        mov     r5, r0
        ldr     r11, [r3, +r9, lsl #2]
        ldr     r3, [sp, #0x20]
        ldr     r10, [r3, +r9, lsl #2]
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        mov     r6, r0
        mov     r0, r7
        mov     r1, r4
        bl      __subsf3
        str     r0, [sp, #0x38]
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        ldr     r3, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        mov     r10, r0
        ldr     r7, [r3, +r9, lsl #2]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r3, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        ldr     r4, [r3, +r9, lsl #2]
        str     r0, [sp, #0x3C]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r4, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x34]
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r5
        bl      __addsf3
        str     r0, [r8]
        ldr     r3, [sp, #0x30]
        mov     r1, r6
        ldr     r0, [r3, +r9, lsl #2]
        ldr     r3, [sp, #0x18]
        add     r9, r9, r3, lsl #1
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r0, [sp, #0x3C]
        mov     r1, r11
        bl      __subsf3
        str     r0, [r8, #8]
        mov     r0, r4
        mov     r1, r10
        bl      __addsf3
        str     r0, [r8, #0xC]
        ldr     r0, [sp, #0x3C]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #0x10]
        mov     r0, r4
        mov     r1, r10
        bl      __subsf3
        str     r0, [r8, #0x14]
        ldr     r0, [sp, #0x10]
        add     r8, r8, #0x18
        cmp     r9, r0
        blt     LCLJ1
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r0, [sp]
LCLJ2:
        subs    lr, lr, #1
        bne     LCLJ0
LCLJ3:
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLJ_C_1_3
        .long   LCLJ_S_1_3


        .data
        .align  4


LCLJ_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCLJ_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


