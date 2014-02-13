        .text
        .align  4
        .globl  _ippsLSPToLPC_GSMAMR_16s


_ippsLSPToLPC_GSMAMR_16s:
        cmp     r0, #0
        beq     LDOS0
        cmp     r1, #0
        bne     _ippsLSPToLPC_G729_16s
LDOS0:
        mvn     r0, #7
        bx      lr


