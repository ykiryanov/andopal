        .text
        .align  4
        .globl  _ippsMinMax_8u


_ippsMinMax_8u:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LBGF2
        cmp     r2, #0
        beq     LBGF2
        cmp     r3, #0
        beq     LBGF2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        ldrb    lr, [r0]
        cmp     r1, #0
        mov     r12, lr
        ble     LBGF1
LBGF0:
        ldrb    r4, [r0], #1
        cmp     r4, r12
        movlt   r12, r4
        cmp     r4, lr
        movgt   lr, r4
        subs    r1, r1, #1
        bne     LBGF0
LBGF1:
        strb    r12, [r2]
        mov     r0, #0
        strb    lr, [r3]
        ldmia   sp!, {r4, pc}
LBGF2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


