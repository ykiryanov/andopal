        .text
        .align  4
        .globl  _ippsMaxIndx_16s


_ippsMaxIndx_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LBGR2
        cmp     r2, #0
        beq     LBGR2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r3, #0
        ldmeqia sp!, {r4, r5, lr}
        beq     _ippsMax_16s
        cmp     r1, #0
        mov     r12, #0
        movle   r4, r12
        suble   lr, r12, #2, 18
        ble     LBGR1
        mov     r4, r12
        sub     lr, r12, #2, 18
LBGR0:
        ldrsh   r5, [r0], #2
        cmp     lr, r5
        movlt   lr, r5
        movlt   r4, r12
        add     r12, r12, #1
        cmp     r12, r1
        blt     LBGR0
LBGR1:
        strh    lr, [r2]
        mov     r0, #0
        str     r4, [r3]
        ldmia   sp!, {r4, r5, pc}
LBGR2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


