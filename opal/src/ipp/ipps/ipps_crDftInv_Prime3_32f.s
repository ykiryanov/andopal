        .text
        .align  4
        .globl  _ipps_crDftInv_Prime3_32f


_ipps_crDftInv_Prime3_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     lr, [sp, #0x6C]
        ldr     r4, [sp, #0x68]
        ldr     r12, [sp, #0x70]
        cmp     lr, #0
        mov     r8, r3
        ble     LCJR3
        mul     r5, r2, r4
        ldr     r7, [pc, #0x1D8]
        ldr     r6, [pc, #0x1D8]
        mov     r4, r4, lsl #1
        mul     r4, r2, r4
        ldr     r7, [r7]
        ldr     r6, [r6]
        str     r2, [sp, #0x1C]
        str     r7, [sp, #0x30]
        str     r6, [sp, #0x38]
LCJR0:
        ldr     r6, [r12], #4
        cmp     r5, #0
        add     r2, r0, r6, lsl #2
        add     r6, r1, r6, lsl #2
        add     r10, r2, r5, lsl #2
        add     r11, r6, r5, lsl #2
        add     r3, r2, r4, lsl #2
        add     r7, r6, r4, lsl #2
        ble     LCJR2
        mov     r9, #0
        str     r7, [sp, #0x18]
        str     r3, [sp, #0x28]
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x2C]
        str     r6, [sp, #0x34]
        str     r2, [sp, #0x20]
        str     r12, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x14]
        str     lr, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LCJR1:
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        ldr     r7, [r0, +r9, lsl #2]
        ldr     r4, [r1, +r9, lsl #2]
        mov     r0, r7
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r5, r0
        ldr     r11, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x24]
        ldr     r10, [r2, +r9, lsl #2]
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        mov     r6, r0
        mov     r0, r7
        mov     r1, r4
        bl      __subsf3
        str     r0, [sp, #0x3C]
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x30]
        mov     r10, r0
        ldr     r7, [r2, +r9, lsl #2]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x30]
        ldr     r4, [r2, +r9, lsl #2]
        str     r0, [sp, #0x40]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r4, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x38]
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r5
        bl      __addsf3
        str     r0, [r8]
        ldr     r2, [sp, #0x34]
        mov     r1, r6
        ldr     r0, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x1C]
        add     r9, r2, r9
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r0, [sp, #0x40]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, #8]
        mov     r0, r4
        mov     r1, r10
        bl      __subsf3
        str     r0, [r8, #0xC]
        ldr     r0, [sp, #0x40]
        mov     r1, r11
        bl      __subsf3
        str     r0, [r8, #0x10]
        mov     r0, r4
        mov     r1, r10
        bl      __addsf3
        str     r0, [r8, #0x14]
        ldr     r0, [sp, #0x14]
        add     r8, r8, #0x18
        cmp     r9, r0
        blt     LCJR1
        ldr     r12, [sp, #0x10]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x14]
        ldr     lr, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LCJR2:
        subs    lr, lr, #1
        bne     LCJR0
LCJR3:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJR_C_1_3
        .long   LCJR_S_1_3


        .data
        .align  4


LCJR_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCJR_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


