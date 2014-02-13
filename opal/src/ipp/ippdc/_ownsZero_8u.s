        .text
        .align  4
        .globl  _ownsZero_8u


_ownsZero_8u:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r1, #0
        mov     r3, r0
        ble     LCVC7
        tst     r0, #3
        mov     r2, #0
        beq     LCVC1
LCVC0:
        strb    r2, [r3], #1
        subs    r1, r1, #1
        beq     LCVC8
        tst     r3, #3
        bne     LCVC0
LCVC1:
        and     r12, r1, #0x1F
        sub     lr, r1, r12
        add     r1, lr, r3
        mov     r4, lr, asr #1
        add     r4, lr, r4, lsr #30
        mov     lr, r4, asr #2
        cmp     lr, #0
        ble     LCVC3
        mov     r11, #0
        add     r10, r3, #4
        add     r9, r3, #8
        add     r8, r3, #0xC
        add     r7, r3, #0x10
        add     r6, r3, #0x14
        add     r5, r3, #0x18
        add     r4, r3, #0x1C
LCVC2:
        str     r2, [r3, +r11, lsl #2]
        str     r2, [r10], #0x20
        str     r2, [r9], #0x20
        str     r2, [r8], #0x20
        str     r2, [r7], #0x20
        str     r2, [r6], #0x20
        str     r2, [r5], #0x20
        add     r11, r11, #8
        str     r2, [r4], #0x20
        cmp     r11, lr
        blt     LCVC2
LCVC3:
        cmp     r12, #0
        beq     LCVC7
        cmp     r12, #0
        ble     LCVC7
        cmp     r12, #6
        mov     r3, #0
        movlt   r2, #0
        blt     LCVC5
        mov     r2, #0
        sub     r5, r12, #6
        mov     r4, r2
        sub     lr, r1, #1
LCVC4:
        add     r2, r2, #5
        strb    r4, [lr, #1]
        strb    r4, [lr, #2]
        strb    r4, [lr, #3]
        strb    r4, [lr, #4]
        strb    r4, [lr, #5]!
        cmp     r2, r5
        ble     LCVC4
LCVC5:
        add     r1, r2, r1
LCVC6:
        add     r2, r2, #1
        strb    r3, [r1], #1
        cmp     r2, r12
        blt     LCVC6
LCVC7:
        ldmia   sp!, {r4 - r11, pc}
LCVC8:
        ldmia   sp!, {r4 - r11, pc}


