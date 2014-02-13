        .text
        .align  4
        .globl  _ippsMinMax_32s


_ippsMinMax_32s:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        beq     LBGH2
        cmp     r2, #0
        beq     LBGH2
        cmp     r3, #0
        beq     LBGH2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        ldr     lr, [r0]
        cmp     r1, #0
        mov     r12, lr
        ble     LBGH1
LBGH0:
        ldr     r4, [r0], #4
        cmp     r4, r12
        movlt   r12, r4
        cmp     r4, lr
        movgt   lr, r4
        subs    r1, r1, #1
        bne     LBGH0
LBGH1:
        str     r12, [r2]
        mov     r0, #0
        str     lr, [r3]
        ldmia   sp!, {r4, pc}
LBGH2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


