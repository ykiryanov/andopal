        .text
        .align  4
        .globl  _ipps_initTabTwd_L1_64f


LCEB_IPP_INT_PTR:
        mov     r12, sp
        stmdb   sp!, {r11, r12}
        mov     r11, r12
        sub     sp, sp, #8
        str     r0, [r11, #-0xC]
        ldr     r0, [r11, #-0xC]
        str     r0, [r11, #-0x10]
        ldr     r0, [r11, #-0x10]
        ldmdb   r11, {r11, sp}
        bx      lr
_ipps_initTabTwd_L1_64f:
        mov     r12, sp
        stmdb   sp!, {r4, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x20
        str     r0, [r11, #-0x20]
        str     r1, [r11, #-0x1C]
        str     r2, [r11, #-0x18]
        str     r3, [r11, #-0x14]
        ldr     r0, [r11, #-0x20]
        mov     r4, #1
        mov     r0, r4, lsl r0
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x14]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x14]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        add     r1, r1, #1
        mov     r2, #3
        mul     r2, r1, r2
        mov     r1, r2, lsl #4
        add     r0, r0, r1
        bl      LCEB_IPP_INT_PTR
        ldr     r1, [r11, #-0x14]
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, asr #1
        mov     r2, r2, lsr #30
        ldr     r3, [r11, #-0x30]
        add     r3, r2, r3
        mov     r2, r3, asr #2
        add     r2, r2, #1
        mov     r3, #3
        mul     r3, r2, r3
        mov     r2, r3, lsl #4
        add     r1, r1, r2
        and     r2, r0, #0x1F
        mov     r0, #0
        sub     r2, r0, r2
        and     r2, r2, #0x1F
        add     r2, r1, r2
        str     r2, [r11, #-0x14]
        ldr     r1, [r11, #-0x18]
        ldr     r2, [r11, #-0x20]
        sub     r2, r0, r2
        add     r2, r1, r2
        mov     r2, r4, lsl r2
        str     r2, [r11, #-0x28]
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        cmp     r0, r1
        bgt     LCEB11
LCEB0:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        ldr     r2, [r11, #-0x24]
        mov     r3, #0
        sub     r3, r3, r2
        add     r3, r1, r3
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r3
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x24]
        mov     lr, #0x30
        mul     r3, r3, lr
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0x1C]
        ldr     r2, [r11, #-0x24]
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r2
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x24]
        mov     lr, #0x30
        mul     lr, r3, lr
        add     lr, r2, lr
        str     r0, [lr, #8]
        str     r1, [lr, #0xC]
        ldr     r0, [r11, #-0x24]
        mov     r0, r0, lsl #1
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        cmp     r0, r1
        bgt     LCEB1
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        ldr     r2, [r11, #-0x24]
        mov     r2, r2, lsl #1
        mov     r3, #0
        sub     r3, r3, r2
        add     r3, r1, r3
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r3
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        b       LCEB2
LCEB1:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x24]
        mov     r1, r1, lsl #1
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, asr #1
        mov     r2, r2, lsr #30
        ldr     r3, [r11, #-0x30]
        add     r3, r2, r3
        mov     r2, r3, asr #2
        mov     r3, #0
        sub     r3, r3, r2
        add     r3, r1, r3
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r3
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
LCEB2:
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x24]
        mov     lr, #3
        mul     lr, r3, lr
        mov     r3, lr, lsl #4
        add     r3, r3, #0x10
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0x24]
        mov     r0, r0, lsl #1
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        cmp     r0, r1
        bgt     LCEB3
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x24]
        mov     r1, r1, lsl #1
        ldr     r2, [r11, #-0x28]
        mul     r2, r2, r1
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
        b       LCEB4
LCEB3:
        ldr     r0, [r11, #-0x1C]
        ldr     r3, [r11, #-0x30]
        ldr     lr, [r11, #-0x30]
        mov     r1, #0
        mov     r2, #1
        cmp     lr, #0
        mov     lr, r1
        movlt   lr, r2
        add     lr, r3, lr
        mov     r2, lr, asr #1
        ldr     r3, [r11, #-0x24]
        mov     r3, r3, lsl #1
        sub     r1, r1, r3
        add     r1, r2, r1
        ldr     r2, [r11, #-0x28]
        mul     r2, r2, r1
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
LCEB4:
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x24]
        mov     lr, #3
        mul     lr, r3, lr
        add     r3, lr, #1
        mov     r3, r3, lsl #4
        add     r3, r2, r3
        str     r0, [r3, #8]
        str     r1, [r3, #0xC]
        ldr     r0, [r11, #-0x24]
        mov     r1, #3
        mul     r0, r0, r1
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        cmp     r0, r1
        bgt     LCEB5
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        ldr     r2, [r11, #-0x24]
        mov     r3, #3
        mul     r2, r2, r3
        mov     r3, #0
        sub     r3, r3, r2
        add     r3, r1, r3
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r3
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        b       LCEB7
LCEB5:
        ldr     r0, [r11, #-0x24]
        mov     r1, #3
        mul     r0, r0, r1
        ldr     r2, [r11, #-0x30]
        ldr     lr, [r11, #-0x30]
        mov     r3, #0
        mov     r1, #1
        cmp     lr, #0
        movlt   r3, r1
        add     r3, r2, r3
        mov     r1, r3, asr #1
        cmp     r0, r1
        bgt     LCEB6
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x24]
        mov     r2, #3
        mul     r1, r1, r2
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, asr #1
        mov     r2, r2, lsr #30
        ldr     r3, [r11, #-0x30]
        add     r3, r2, r3
        mov     r2, r3, asr #2
        mov     r3, #0
        sub     r3, r3, r2
        add     r3, r1, r3
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r3
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
        b       LCEB7
LCEB6:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x30]
        mov     r2, #3
        mul     r2, r1, r2
        mov     r1, r2, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        mov     r3, #3
        mul     r3, r2, r3
        add     r3, r1, r3
        mov     r1, r3, asr #2
        ldr     r2, [r11, #-0x24]
        mov     r3, #3
        mul     r2, r2, r3
        mov     r3, #0
        sub     r3, r3, r2
        add     r3, r1, r3
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r3
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
LCEB7:
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x24]
        mov     lr, #3
        mul     lr, r3, lr
        mov     r3, lr, lsl #4
        add     r3, r3, #0x20
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0x24]
        mov     r1, #3
        mul     r0, r0, r1
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        cmp     r0, r1
        bgt     LCEB8
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x24]
        mov     r2, #3
        mul     r1, r1, r2
        ldr     r2, [r11, #-0x28]
        mul     r2, r2, r1
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
        b       LCEB10
LCEB8:
        ldr     r0, [r11, #-0x24]
        mov     r1, #3
        mul     r0, r0, r1
        ldr     r2, [r11, #-0x30]
        ldr     lr, [r11, #-0x30]
        mov     r3, #0
        mov     r1, #1
        cmp     lr, #0
        movlt   r3, r1
        add     r3, r2, r3
        mov     r1, r3, asr #1
        cmp     r0, r1
        bgt     LCEB9
        ldr     r0, [r11, #-0x1C]
        ldr     r3, [r11, #-0x30]
        ldr     lr, [r11, #-0x30]
        mov     r1, #0
        mov     r2, #1
        cmp     lr, #0
        mov     lr, r1
        movlt   lr, r2
        add     lr, r3, lr
        mov     r2, lr, asr #1
        ldr     r3, [r11, #-0x24]
        mov     lr, #3
        mul     lr, r3, lr
        sub     r1, r1, lr
        add     r1, r2, r1
        ldr     r2, [r11, #-0x28]
        mul     r2, r2, r1
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        eor     r1, r1, #2, 2
        b       LCEB10
LCEB9:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x24]
        mov     r2, #3
        mul     r1, r1, r2
        ldr     lr, [r11, #-0x30]
        ldr     r4, [r11, #-0x30]
        mov     r2, #0
        mov     r3, #1
        cmp     r4, #0
        mov     r4, r2
        movlt   r4, r3
        add     r4, lr, r4
        mov     r3, r4, asr #1
        sub     r2, r2, r3
        add     r2, r1, r2
        ldr     r1, [r11, #-0x28]
        mul     r2, r1, r2
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
LCEB10:
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x24]
        mov     lr, #3
        mul     lr, r3, lr
        add     r3, lr, #2
        mov     r3, r3, lsl #4
        add     r3, r2, r3
        str     r0, [r3, #8]
        str     r1, [r3, #0xC]
        ldr     r0, [r11, #-0x24]
        add     r0, r0, #1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, asr #1
        mov     r1, r1, lsr #30
        ldr     r2, [r11, #-0x30]
        add     r2, r1, r2
        mov     r1, r2, asr #2
        cmp     r0, r1
        ble     LCEB0
LCEB11:
        ldr     r0, [r11, #-0x14]
        ldmdb   r11, {r4, r11, sp, pc}


