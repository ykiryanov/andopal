        .text
        .align  4
        .globl  _ippsIIRGetStateSize_BiQuad_32fc


_ippsIIRGetStateSize_BiQuad_32fc:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #1
        ldrge   r2, [pc, #8]
        bge     ownsIIRGetStateSize_BiQuad_32fc
        mvnlt   r0, #0x18
        bxlt    lr
        stmmidb r9, {r2, r4, r5, r12, sp}^


