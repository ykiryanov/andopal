        .text
        .align  4
        .globl  _ippsMinIndx_16s


_ippsMinIndx_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LBGP2
        cmp     r2, #0
        beq     LBGP2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r3, #0
        ldmeqia sp!, {r4, r5, lr}
        beq     _ippsMin_16s
        mov     r12, #0xFF
        cmp     r1, #0
        orr     r12, r12, #0x7F, 24
        mov     lr, #0
        movle   r4, lr
        ble     LBGP1
        mov     r4, lr
LBGP0:
        ldrsh   r5, [r0], #2
        cmp     r12, r5
        movgt   r12, r5
        movgt   r4, lr
        add     lr, lr, #1
        cmp     lr, r1
        blt     LBGP0
LBGP1:
        strh    r12, [r2]
        mov     r0, #0
        str     r4, [r3]
        ldmia   sp!, {r4, r5, pc}
LBGP2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


