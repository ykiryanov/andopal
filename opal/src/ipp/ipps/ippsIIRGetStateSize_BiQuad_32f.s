        .text
        .align  4
        .globl  _ippsIIRGetStateSize_BiQuad_32f


_ippsIIRGetStateSize_BiQuad_32f:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #1
        ldrge   r2, [pc, #8]
        bge     ownsIIRGetStateSize_BiQuad_32f
        mvnlt   r0, #0x18
        bxlt    lr
        stmmidb r9, {r1, r4, r5, r12, sp}^


