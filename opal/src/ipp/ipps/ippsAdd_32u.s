        .text
        .align  4
        .globl  _ippsAdd_32u


_ippsAdd_32u:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LDBV2
        cmp     r1, #0
        beq     LDBV2
        cmp     r2, #0
        beq     LDBV2
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r3, #0
        ble     LDBV1
        mvn     lr, #0
        mov     r12, #0
LDBV0:
        ldr     r4, [r1], #4
        ldr     r5, [r0], #4
        adds    r4, r5, r4
        adc     r5, r12, #0
        cmp     r5, #0
        cmpeq   r4, lr
        movcs   r4, lr
        str     r4, [r2], #4
        subs    r3, r3, #1
        bne     LDBV0
LDBV1:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LDBV2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


