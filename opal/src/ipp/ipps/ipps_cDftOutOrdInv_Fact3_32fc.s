        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Fact3_32fc


_ipps_cDftOutOrdInv_Fact3_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r12, [sp, #0x7C]
        ldr     r4, [sp, #0x80]
        add     lr, r2, r2, lsl #2
        add     lr, r2, lr
        mul     lr, lr, r3
        add     r8, r4, r3, lsl #4
        cmp     r2, #1
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        mov     r3, #0
        beq     LCKM4
        cmp     r12, #0
        ble     LCKM3
        ldr     lr, [pc, #0x644]
        ldr     r5, [pc, #0x644]
        mov     r4, r2, lsl #1
        ldr     lr, [lr]
        rsb     r6, r2, r2, lsl #2
        ldr     r5, [r5]
        str     r6, [sp, #0x38]
        str     r4, [sp, #0x30]
        str     lr, [sp, #0x1C]
        str     r5, [sp, #0x18]
        str     r12, [sp, #0x3C]
        str     r2, [sp, #0x40]
        str     r3, [sp, #0x44]
LCKM0:
        ldr     r2, [sp, #0x30]
        ldr     lr, [sp, #0x40]
        cmp     r2, #0
        add     r2, r0, lr, lsl #3
        add     r3, r0, lr, lsl #4
        add     r12, r1, lr, lsl #3
        add     lr, r1, lr, lsl #4
        ble     LCKM2
        add     r7, r0, #4
        add     r6, r2, #4
        add     r5, r3, #4
        add     r4, r12, #4
        add     r11, lr, #4
        mov     r10, #0
        add     r9, r1, #4
        str     r11, [sp, #0x28]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x14]
        str     r6, [sp]
        str     r7, [sp, #8]
        str     lr, [sp, #0x10]
        str     r12, [sp, #4]
        str     r3, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x2C]
LCKM1:
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r11, [r2], #8
        ldr     r5, [r1]
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x20]
        mov     r0, r11
        mov     r1, r5
        add     r2, r2, #8
        str     r2, [sp, #0x20]
        bl      __addsf3
        ldr     r2, [sp]
        ldr     r7, [r2]
        ldr     r2, [sp, #0x14]
        ldr     r4, [r2]
        ldr     r2, [sp]
        str     r0, [sp, #0x48]
        mov     r0, r7
        mov     r1, r4
        add     r2, r2, #8
        str     r2, [sp]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x4C]
        mov     r1, r4
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [sp, #0x2C]
        mov     r5, r0
        ldr     r1, [sp, #0x1C]
        ldr     r2, [r2, +r10, lsl #2]
        ldr     r0, [sp, #0x48]
        str     r2, [sp, #0x50]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0x1C]
        mov     r11, r0
        ldr     r7, [r2]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x4C]
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x48]
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r1, r6
        mov     r0, r7
        bl      __addsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x4C]
        mov     r0, r11
        bl      __addsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x54]
        mov     r7, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x50]
        ldr     r1, [sp, #0x34]
        mov     r4, r0
        mov     r0, r6
        str     r2, [r1, +r10, lsl #2]
        ldr     r1, [sp, #0x4C]
        add     r10, r10, #2
        str     r1, [r9], #8
        ldr     r1, [r8]
        bl      __mulsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [r8, #4]
        mov     r5, r0
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x14]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [r1]
        ldr     r2, [sp, #8]
        ldr     r1, [r8]
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #8]
        bl      __mulsf3
        ldr     r1, [r8, #4]
        mov     r5, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1]
        ldr     r1, [r8, #8]
        ldr     r2, [sp, #4]
        mov     r0, r11
        add     r2, r2, #8
        str     r2, [sp, #4]
        bl      __mulsf3
        ldr     r1, [r8, #0xC]
        ldr     r2, [sp, #0xC]
        mov     r5, r0
        mov     r0, r4
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        str     r0, [r1]
        ldr     r2, [sp, #0x10]
        ldr     r1, [r8, #8]
        mov     r0, r4
        add     r2, r2, #8
        str     r2, [sp, #0x10]
        bl      __mulsf3
        ldr     r1, [r8, #0xC]
        mov     r4, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        str     r0, [r1], #8
        ldr     r0, [sp, #0x30]
        str     r1, [sp, #0x28]
        cmp     r10, r0
        blt     LCKM1
        ldr     r1, [sp, #0x34]
        ldr     r0, [sp, #0x2C]
LCKM2:
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x3C]
        add     r8, r8, #0x10
        add     r2, r2, #1
        str     r2, [sp, #0x44]
        cmp     r2, r3
        ldr     r2, [sp, #0x38]
        add     r0, r0, r2, lsl #3
        add     r1, r1, r2, lsl #3
        blt     LCKM0
LCKM3:
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LCKM4:
        add     r2, r12, r12, lsl #2
        add     r12, r12, r2
        cmp     r12, #0
        ble     LCKM3
        ldr     lr, [pc, #0x308]
        ldr     r2, [pc, #0x300]
        add     r9, r0, #8
        ldr     lr, [lr]
        add     r7, r0, #0x10
        ldr     r2, [r2]
        add     r6, r0, #0xC
        str     lr, [sp, #0x3C]
        add     lr, r1, #4
        add     r10, r1, #0xC
        str     lr, [sp, #0x40]
        str     r10, [sp, #0x38]
        add     r5, r0, #0x14
        add     r4, r0, #4
        add     lr, r1, #8
        add     r10, r1, #0x10
        add     r11, r1, #0x14
        str     r11, [sp, #0x24]
        str     r10, [sp, #0x28]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r2, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r6, [sp, #8]
        str     r7, [sp, #0x1C]
        str     r9, [sp, #0x20]
        str     r12, [sp, #0x30]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x2C]
        str     r3, [sp, #0x44]
LCKM5:
        ldr     r0, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        ldr     r4, [r0]
        ldr     r7, [r2], #0x18
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        mov     r1, r4
        mov     r0, r7
        add     r2, r2, #0x18
        str     r2, [sp, #0x1C]
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        mov     r9, r0
        ldr     r6, [r2]
        ldr     r2, [sp, #8]
        ldr     r5, [r2]
        ldr     r2, [sp, #8]
        mov     r1, r6
        add     r2, r2, #0x18
        str     r2, [sp, #8]
        mov     r0, r5
        bl      __addsf3
        mov     r10, r0
        mov     r1, r4
        mov     r0, r7
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x18]
        mov     r6, r0
        ldr     r2, [r2]
        mov     r0, r9
        str     r2, [sp, #0x50]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x18]
        mov     r5, r0
        ldr     r11, [r2]
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        mov     r4, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x3C]
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x50]
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x54]
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r0, r5
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        mov     r0, r4
        mov     r1, r7
        bl      __subsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x54]
        ldr     r2, [sp, #0x34]
        mov     r4, r0
        mov     r0, r9
        str     r1, [r2]
        ldr     r2, [sp, #0x40]
        ldr     r1, [sp, #0x50]
        str     r1, [r2]
        ldr     r1, [r8]
        bl      __mulsf3
        ldr     r2, [sp, #0x14]
        ldr     r1, [r8, #4]
        mov     r6, r0
        mov     r0, r10
        add     r2, r2, #0x18
        str     r2, [sp, #0x14]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [r8]
        mov     r0, r10
        add     r2, r2, #0x18
        str     r2, [sp, #0x2C]
        bl      __mulsf3
        ldr     r2, [sp, #0x10]
        ldr     r1, [r8, #4]
        mov     r6, r0
        add     r2, r2, #0x18
        str     r2, [sp, #0x10]
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x40]
        add     r1, r1, #0x18
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0xC]
        add     r1, r1, #0x18
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x38]
        str     r0, [r1], #0x18
        ldr     r2, [sp, #0x34]
        str     r1, [sp, #0x38]
        ldr     r1, [r8, #8]
        add     r2, r2, #0x18
        str     r2, [sp, #0x34]
        mov     r0, r5
        bl      __mulsf3
        ldr     r2, [sp, #0x44]
        ldr     r1, [r8, #0xC]
        mov     r6, r0
        add     r2, r2, #6
        str     r2, [sp, #0x44]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2], #0x18
        ldr     r1, [r8, #8]
        str     r2, [sp, #0x28]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [r8, #0xC]
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        add     r8, r8, #0x10
        str     r0, [r1]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x30]
        cmp     r0, r1
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x18
        str     r0, [sp, #0x24]
        blt     LCKM5
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKM_C_1_3
        .long   LCKM_S_1_3


        .data
        .align  4


LCKM_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCKM_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


