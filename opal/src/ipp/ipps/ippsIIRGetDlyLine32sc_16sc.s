        .text
        .align  4
        .globl  _ippsIIRGetDlyLine32sc_16sc


_ippsIIRGetDlyLine32sc_16sc:
        cmp     r0, #0
        beq     LBOZ1
        cmp     r1, #0
        beq     LBOZ1
        ldr     r3, [pc, #0x24]
        ldr     r12, [r0]
        sub     r2, r3, #1
        cmp     r2, r12
        beq     LBOZ0
        cmp     r3, r12
        mvnne   r0, #0x10
        bxne    lr
LBOZ0:
        b       ownsIIRGetDlyLine32sc_16sc
LBOZ1:
        mvn     r0, #7
        bx      lr
        .long   0x49493132


