        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Fact3_32fc


_ipps_cDftOutOrdFwd_Fact3_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r12, [sp, #0x78]
        ldr     r4, [sp, #0x7C]
        add     lr, r2, r2, lsl #2
        add     lr, r2, lr
        mul     lr, lr, r3
        add     r8, r4, r3, lsl #4
        cmp     r2, #1
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        mov     r3, #0
        beq     LCKU4
        cmp     r12, #0
        ble     LCKU3
        ldr     lr, [pc, #0x668]
        ldr     r5, [pc, #0x668]
        mov     r4, r2, lsl #1
        ldr     lr, [lr]
        rsb     r6, r2, r2, lsl #2
        ldr     r5, [r5]
        str     r6, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     lr, [sp, #0x28]
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x20]
        str     r12, [sp, #0x40]
        str     r2, [sp, #0x44]
LCKU0:
        ldr     r2, [sp, #0x38]
        ldr     r4, [sp, #0x44]
        cmp     r2, #0
        add     r2, r0, r4, lsl #3
        add     r12, r0, r4, lsl #4
        add     lr, r1, r4, lsl #3
        add     r4, r1, r4, lsl #4
        ble     LCKU2
        add     r10, r1, #4
        add     r7, r2, #4
        add     r6, r12, #4
        add     r5, lr, #4
        add     r11, r4, #4
        mov     r9, #0
        add     r8, r0, #4
        str     r11, [sp, #0x2C]
        str     r5, [sp, #4]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0xC]
        str     r10, [sp]
        str     r4, [sp, #0x18]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x1C]
        str     r2, [sp, #8]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x30]
        str     r3, [sp, #0x48]
LCKU1:
        ldr     r2, [sp, #0x20]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r10, [r2]
        ldr     r7, [r2, #4]
        ldr     r6, [r0]
        ldr     r4, [r3]
        mov     r1, r10
        mov     r0, r6
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r6
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r6, r0
        ldr     r4, [r2, #0xC]
        ldr     r11, [r2, #8]
        ldr     r2, [sp, #0x14]
        ldr     r10, [r1]
        mov     r1, r11
        ldr     r2, [r2]
        mov     r0, r10
        str     r2, [sp, #0x4C]
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x4C]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [sp, #0x4C]
        mov     r1, r11
        bl      __mulsf3
        mov     r11, r0
        mov     r1, r4
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        str     r0, [sp, #0x4C]
        mov     r0, r6
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        mov     r1, r7
        mov     r0, r5
        bl      __subsf3
        str     r0, [sp, #0x50]
        mov     r1, r10
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x28]
        mov     r10, r0
        ldr     r0, [sp, #0x4C]
        ldr     r7, [r2, +r9, lsl #2]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r6, [r8]
        ldr     r1, [sp, #0x28]
        mov     r5, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        mov     r11, r0
        ldr     r0, [sp, #0x50]
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        mov     r10, r0
        mov     r0, r7
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        mov     r1, r4
        str     r0, [r2, +r9, lsl #2]
        ldr     r0, [r8], #8
        ldr     r2, [sp, #8]
        add     r9, r9, #2
        add     r2, r2, #8
        str     r2, [sp, #8]
        bl      __addsf3
        ldr     r2, [sp]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x10]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r6
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        str     r0, [r1]
        ldr     r0, [sp, #0x38]
        cmp     r9, r0
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #8
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #8
        str     r0, [sp, #0x2C]
        blt     LCKU1
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        ldr     r3, [sp, #0x48]
LCKU2:
        ldr     r2, [sp, #0x40]
        add     r3, r3, #1
        cmp     r3, r2
        ldr     r2, [sp, #0x20]
        add     r2, r2, #0x10
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x3C]
        add     r0, r0, r2, lsl #3
        add     r1, r1, r2, lsl #3
        blt     LCKU0
LCKU3:
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCKU4:
        add     r2, r12, r12, lsl #2
        add     r12, r12, r2
        cmp     r12, #0
        ble     LCKU3
        ldr     lr, [pc, #0x30C]
        ldr     r2, [pc, #0x304]
        add     r7, r0, #8
        ldr     lr, [lr]
        add     r6, r0, #0xC
        ldr     r2, [r2]
        add     r5, r0, #0x10
        str     lr, [sp, #0x40]
        add     lr, r1, #4
        add     r10, r1, #0xC
        str     lr, [sp, #0x44]
        str     r10, [sp, #0x3C]
        add     r4, r0, #0x14
        add     lr, r1, #8
        add     r10, r1, #0x10
        add     r11, r1, #0x14
        add     r9, r0, #4
        str     r11, [sp, #0x2C]
        str     r10, [sp, #0x18]
        str     lr, [sp, #0xC]
        str     r2, [sp, #0x28]
        str     r4, [sp, #0x10]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0x24]
        str     r12, [sp, #0x38]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x30]
        str     r3, [sp, #0x48]
LCKU5:
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x14]
        ldr     r7, [r8]
        ldr     r6, [r0]
        ldr     r10, [r8, #4]
        ldr     r4, [r2]
        mov     r1, r7
        mov     r0, r6
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r7
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r6
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        mov     r6, r0
        ldr     r10, [r1]
        ldr     r1, [r8, #8]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #0x10]
        ldr     r11, [r8, #0xC]
        mov     r0, r10
        ldr     r4, [r1]
        ldr     r1, [sp, #0x50]
        add     r8, r8, #0x10
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [sp, #0x50]
        mov     r7, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r1, r10
        mov     r0, r6
        bl      __addsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r7
        bl      __subsf3
        str     r0, [sp, #0x4C]
        mov     r1, r10
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x30]
        ldr     r1, [sp, #0x28]
        mov     r10, r0
        ldr     r7, [r2]
        ldr     r0, [sp, #0x50]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r6, [r9]
        ldr     r1, [sp, #0x28]
        mov     r5, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x4C]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        mov     r10, r0
        mov     r0, r7
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        mov     r1, r4
        str     r0, [r2]
        ldr     r2, [sp, #0x24]
        ldr     r0, [r9], #0x18
        add     r2, r2, #0x18
        str     r2, [sp, #0x24]
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r6
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x48]
        add     r1, r1, #6
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x2C]
        str     r0, [r1]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x38]
        cmp     r0, r1
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x18
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #0x18
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x18
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x18
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x18
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x18
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #0x18
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #0x18
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #0x18
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #0x18
        str     r0, [sp, #0x34]
        blt     LCKU5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKU_C_1_3
        .long   LCKU_S_1_3


        .data
        .align  4


LCKU_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCKU_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


