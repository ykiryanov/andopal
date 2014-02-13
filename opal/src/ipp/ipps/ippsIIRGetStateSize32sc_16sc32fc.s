        .text
        .align  4
        .globl  _ippsIIRGetStateSize32sc_16sc32fc


_ippsIIRGetStateSize32sc_16sc32fc:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #1
        bge     _ippsIIRGetStateSize32sc_16sc
        mvnlt   r0, #0x18
        bxlt    lr


