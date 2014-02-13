        .text
        .align  4
        .globl  _ippsIIRGetStateSize32s_BiQuad_16s32f


_ippsIIRGetStateSize32s_BiQuad_16s32f:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #1
        bge     _ippsIIRGetStateSize32s_BiQuad_16s
        mvnlt   r0, #0x18
        bxlt    lr


