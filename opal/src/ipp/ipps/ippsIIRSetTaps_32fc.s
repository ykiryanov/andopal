        .text
        .align  4
        .globl  _ippsIIRSetTaps_32fc


_ippsIIRSetTaps_32fc:
        cmp     r1, #0
        beq     LBQE0
        cmp     r0, #0
        beq     LBQE0
        ldr     r3, [r1]
        ldr     r2, [pc, #0x1C]
        subs    r3, r3, r2
        beq     ownsIIRSetTaps_BiQuad_32fc
        adds    r2, r3, #1
        beq     ownsIIRSetTaps_32fc
        mvnne   r0, #0x10
        bxne    lr
LBQE0:
        mvn     r0, #7
        bx      lr
        .long   0x49493034


