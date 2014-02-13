        .text
        .align  4
        .globl  _ippsSet_8u


_ippsSet_8u:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r2, #6
        mov     r3, #0
        blt     LBMW1
        sub     lr, r2, #6
        sub     r12, r1, #1
LBMW0:
        add     r3, r3, #5
        strb    r0, [r12, #1]
        strb    r0, [r12, #2]
        strb    r0, [r12, #3]
        strb    r0, [r12, #4]
        strb    r0, [r12, #5]!
        cmp     r3, lr
        ble     LBMW0
LBMW1:
        add     r1, r3, r1
LBMW2:
        add     r3, r3, #1
        strb    r0, [r1], #1
        cmp     r3, r2
        blt     LBMW2
        mov     r0, #0
        ldr     pc, [sp], #4


