        .text
        .align  4
        .globl  _ippsMinIndx_32s


_ippsMinIndx_32s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LBGV2
        cmp     r2, #0
        beq     LBGV2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r3, #0
        ldmeqia sp!, {r4, r5, lr}
        beq     _ippsMin_32s
        cmp     r1, #0
        mvn     r4, #2, 2
        mov     r12, #0
        movle   lr, r12
        ble     LBGV1
        mov     lr, r12
LBGV0:
        ldr     r5, [r0], #4
        cmp     r4, r5
        movgt   r4, r5
        movgt   lr, r12
        add     r12, r12, #1
        cmp     r12, r1
        blt     LBGV0
LBGV1:
        str     r4, [r2]
        mov     r0, #0
        str     lr, [r3]
        ldmia   sp!, {r4, r5, pc}
LBGV2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


