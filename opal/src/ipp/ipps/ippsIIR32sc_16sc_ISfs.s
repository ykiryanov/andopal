        .text
        .align  4
        .globl  _ippsIIR32sc_16sc_ISfs


_ippsIIR32sc_16sc_ISfs:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        mov     r4, r2
        beq     LBPE1
        cmp     r4, #0
        beq     LBPE1
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        ldr     r12, [r4]
        ldr     r5, [pc, #0x4C]
        subs    r12, r12, r5
        beq     LBPE0
        adds    r12, r12, #1
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
        sub     r12, r5, #0xFB
        str     r12, [r4]
        mov     r2, r4
        bl      _ippsIIR32fc_16sc_ISfs
        sub     r5, r5, #1
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBPE0:
        sub     r12, r5, #0xFA
        str     r12, [r4]
        mov     r2, r4
        bl      _ippsIIR32fc_16sc_ISfs
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBPE1:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493132


