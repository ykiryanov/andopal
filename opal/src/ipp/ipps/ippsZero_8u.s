        .text
        .align  4
        .globl  _ippsZero_8u


_ippsZero_8u:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        cmp     r1, #0
        ble     LBMP3
        cmp     r1, #6
        mov     r3, #0
        movlt   r2, #0
        blt     LBMP1
        mov     r2, #0
        sub     r4, r1, #6
        mov     lr, r2
        sub     r12, r0, #1
LBMP0:
        add     r2, r2, #5
        strb    lr, [r12, #1]
        strb    lr, [r12, #2]
        strb    lr, [r12, #3]
        strb    lr, [r12, #4]
        strb    lr, [r12, #5]!
        cmp     r2, r4
        ble     LBMP0
LBMP1:
        add     r0, r2, r0
LBMP2:
        add     r2, r2, #1
        strb    r3, [r0], #1
        cmp     r2, r1
        blt     LBMP2
LBMP3:
        mov     r0, #0
        ldmia   sp!, {r4, pc}


