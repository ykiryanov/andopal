        .text
        .align  4
        .globl  _ipps_cDftOutOrdFwd_Prime3_32fc


_ipps_cDftOutOrdFwd_Prime3_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r2, #0
        add     r12, r0, r2, lsl #3
        add     lr, r0, r2, lsl #4
        add     r5, r1, r2, lsl #3
        add     r6, r1, r2, lsl #4
        ble     LCKQ1
        ldr     r3, [pc, #0x154]
        ldr     r4, [pc, #0x154]
        sub     r10, r6, #4
        ldr     r3, [r3]
        sub     r9, r5, #4
        ldr     r4, [r4]
        sub     r8, r1, #4
        sub     r7, r0, #4
        sub     r6, lr, #4
        sub     r5, r12, #4
        str     r4, [sp, #4]
        str     r3, [sp, #8]
        str     r2, [sp]
LCKQ0:
        ldr     r1, [r6, #4]
        str     r1, [sp, #0xC]
        ldr     r0, [r5, #4]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x10]
        bl      __addsf3
        str     r0, [sp, #0x14]
        ldr     r11, [r6, #8]!
        ldr     r0, [r5, #8]!
        mov     r1, r11
        str     r0, [sp, #0x18]
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        bl      __subsf3
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x18]
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        ldr     r11, [r7, #4]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0xC]
        ldr     r2, [r7, #8]
        mov     r0, r4
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        ldr     r1, [sp, #0x1C]
        bl      __addsf3
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #4]
        bl      __mulsf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #4]
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        mov     r0, r11
        bl      __addsf3
        str     r0, [r8, #4]
        ldr     r0, [r7, #8]!
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8, #8]!
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        bl      __subsf3
        str     r0, [r9, #4]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        str     r0, [r9, #8]!
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        str     r0, [r10, #4]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x10]
        bl      __subsf3
        str     r0, [r10, #8]!
        ldr     r0, [sp]
        subs    r0, r0, #1
        str     r0, [sp]
        bne     LCKQ0
LCKQ1:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LCKQ_C_1_3
        .long   LCKQ_S_1_3


        .data
        .align  4


LCKQ_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCKQ_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


