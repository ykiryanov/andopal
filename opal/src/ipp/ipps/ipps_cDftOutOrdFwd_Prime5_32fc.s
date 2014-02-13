        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Prime5_32fc


_ipps_cDftOutOrdFwd_Prime5_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        rsb     r3, r2, r2, lsl #2
        cmp     r2, #0
        add     r8, r0, r3, lsl #3
        add     r12, r1, r3, lsl #3
        add     r5, r0, r2, lsl #3
        add     r4, r0, r2, lsl #4
        add     r11, r0, r2, lsl #5
        add     r9, r1, r2, lsl #3
        add     lr, r1, r2, lsl #4
        add     r3, r1, r2, lsl #5
        ble     LCKP1
        ldr     r7, [pc, #0x3E8]
        ldr     r6, [pc, #0x3E8]
        sub     r10, r9, #4
        ldr     r7, [r7]
        sub     r1, r1, #4
        ldr     r6, [r6]
        str     r1, [sp]
        sub     r9, r0, #4
        sub     r0, r4, #4
        ldr     r4, [pc, #0x3CC]
        sub     r1, r5, #4
        sub     r3, r3, #4
        sub     r12, r12, #4
        ldr     r5, [r4]
        ldr     r4, [pc, #0x3BC]
        sub     lr, lr, #4
        sub     r8, r8, #4
        ldr     r4, [r4]
        sub     r11, r11, #4
        str     r1, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r0, [sp, #0x1C]
        str     r10, [sp, #0xC]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x20]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
LCKP0:
        ldr     r0, [sp, #0x10]
        ldr     r0, [r0, #4]
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x24]
        ldr     r0, [r0, #4]
        str     r0, [sp, #0x28]
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r11, [r2, #8]
        ldr     r2, [sp, #0x10]
        ldr     r10, [r2, #8]
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #0x2C]
        mov     r0, r11
        mov     r1, r10
        add     r2, r2, #8
        str     r2, [sp, #0x10]
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x28]
        bl      __subsf3
        str     r0, [sp, #0x28]
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        ldr     r2, [sp, #0x1C]
        ldr     r2, [r2, #4]
        str     r2, [sp, #0x24]
        ldr     r2, [r8, #4]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x14]
        str     r2, [sp, #0x34]
        ldr     r1, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        mov     r10, r0
        ldr     r2, [r2, #8]
        str     r2, [sp, #0x3C]
        ldr     r0, [sp, #0x3C]
        ldr     r11, [r8, #8]!
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x24]
        bl      __subsf3
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        mov     r1, r11
        bl      __subsf3
        ldr     r11, [r9, #4]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x2C]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r6
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        ldr     r2, [r9, #8]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x30]
        str     r2, [sp, #0x24]
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x40]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        bl      __addsf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x38]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x3C]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x28]
        mov     r1, r5
        bl      __mulsf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x34]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x2C]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x54]
        mov     r1, r7
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        bl      __addsf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x30]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x40]
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x38]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x28]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x34]
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #0x38]
        mov     r0, r11
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp]
        str     r0, [r2, #4]
        ldr     r1, [sp, #0x30]
        ldr     r0, [r9, #8]!
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r2, [sp]
        str     r0, [r2, #8]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x4C]
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #8]
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x54]
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2, #8]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x38]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x24]
        bl      __subsf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2, #8]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r2, [sp, #8]
        str     r0, [r2, #4]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x50]
        bl      __subsf3
        ldr     r2, [sp, #8]
        str     r0, [r2, #8]!
        ldr     r0, [sp, #4]
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x20]
        subs    r0, r0, #1
        str     r0, [sp, #4]
        add     r2, r2, #8
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        add     r2, r2, #8
        str     r2, [sp, #0x1C]
        bne     LCKP0
LCKP1:
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKP_C_1_5
        .long   LCKP_C_2_5
        .long   LCKP_S_1_5
        .long   LCKP_S_2_5


        .data
        .align  4


LCKP_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCKP_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCKP_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCKP_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


