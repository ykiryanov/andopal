        .text
        .align  4
        .globl  _ippsAndC_8u_I


_ippsAndC_8u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBKD3
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LBKD1
        sub     r12, r2, #6
        sub     r3, r1, #1
LBKD0:
        ldrb    r8, [r3, #1]
        ldrb    r7, [r3, #2]
        ldrb    r6, [r3, #3]
        ldrb    r5, [r3, #4]
        ldrb    r4, [r3, #5]
        and     r8, r8, r0
        and     r7, r7, r0
        and     r6, r6, r0
        and     r5, r5, r0
        and     r4, r4, r0
        add     lr, lr, #5
        strb    r8, [r3, #1]
        strb    r7, [r3, #2]
        strb    r6, [r3, #3]
        strb    r5, [r3, #4]
        strb    r4, [r3, #5]!
        cmp     lr, r12
        ble     LBKD0
LBKD1:
        add     r1, lr, r1
LBKD2:
        ldrb    r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        and     r3, r3, r0
        strb    r3, [r1], #1
        blt     LBKD2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBKD3:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsZero_8u


