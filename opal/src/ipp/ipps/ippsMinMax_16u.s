        .text
        .align  4
        .globl  _ippsMinMax_16u


_ippsMinMax_16u:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LBGI2
        cmp     r2, #0
        beq     LBGI2
        cmp     r3, #0
        beq     LBGI2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        ldrh    lr, [r0]
        cmp     r1, #0
        mov     r12, lr
        ble     LBGI1
LBGI0:
        ldrh    r4, [r0], #2
        cmp     r4, r12
        movlt   r12, r4
        cmp     r4, lr
        movgt   lr, r4
        subs    r1, r1, #1
        bne     LBGI0
LBGI1:
        strh    r12, [r2]
        mov     r0, #0
        strh    lr, [r3]
        ldmia   sp!, {r4, pc}
LBGI2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


