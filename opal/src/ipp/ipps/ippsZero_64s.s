        .text
        .align  4
        .globl  _ippsZero_64s


_ippsZero_64s:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        mov     r1, r1, lsl #3
        cmp     r1, #0
        ble     LBMR3
        cmp     r1, #6
        mov     r3, #0
        movlt   r2, #0
        blt     LBMR1
        mov     r2, #0
        sub     r4, r1, #6
        mov     lr, r2
        sub     r12, r0, #1
LBMR0:
        add     r2, r2, #5
        strb    lr, [r12, #1]
        strb    lr, [r12, #2]
        strb    lr, [r12, #3]
        strb    lr, [r12, #4]
        strb    lr, [r12, #5]!
        cmp     r2, r4
        ble     LBMR0
LBMR1:
        add     r0, r2, r0
LBMR2:
        add     r2, r2, #1
        strb    r3, [r0], #1
        cmp     r2, r1
        blt     LBMR2
LBMR3:
        mov     r0, #0
        ldmia   sp!, {r4, pc}


