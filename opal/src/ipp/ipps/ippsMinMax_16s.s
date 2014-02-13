        .text
        .align  4
        .globl  _ippsMinMax_16s


_ippsMinMax_16s:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LBGJ2
        cmp     r2, #0
        beq     LBGJ2
        cmp     r3, #0
        beq     LBGJ2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        ldrsh   lr, [r0]
        cmp     r1, #0
        mov     r12, lr
        ble     LBGJ1
LBGJ0:
        ldrsh   r4, [r0], #2
        cmp     r4, r12
        movlt   r12, r4
        cmp     r4, lr
        movgt   lr, r4
        subs    r1, r1, #1
        bne     LBGJ0
LBGJ1:
        strh    r12, [r2]
        mov     r0, #0
        strh    lr, [r3]
        ldmia   sp!, {r4, pc}
LBGJ2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


