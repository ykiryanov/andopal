        .text
        .align  4
        .globl  _ippsCountInRange_32s


_ippsCountInRange_32s:
        stmdb   sp!, {r4, lr}
        ldr     r12, [sp, #8]
        cmp     r0, #0
        beq     LCUT3
        cmp     r2, #0
        beq     LCUT3
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        mov     lr, #0
        cmp     r1, #0
        str     lr, [r2]
        ble     LCUT2
LCUT0:
        ldr     r4, [r0], #4
        cmp     r4, r3
        ble     LCUT1
        cmp     r4, r12
        addlt   lr, lr, #1
        strlt   lr, [r2]
LCUT1:
        subs    r1, r1, #1
        bne     LCUT0
LCUT2:
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LCUT3:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


