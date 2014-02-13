        .text
        .align  4
        .globl  _ippsIIRGetStateSize32sc_BiQuad_16sc


_ippsIIRGetStateSize32sc_BiQuad_16sc:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #1
        bge     _ippsIIRGetStateSize32fc_BiQuad_16sc
        mvnlt   r0, #0x18
        bxlt    lr


