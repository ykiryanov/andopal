        .text
        .align  4
        .globl  _ippsIIRGetStateSize_32f


_ippsIIRGetStateSize_32f:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0
        mvnle   r0, #0x18
        bxle    lr
        ldrgt   r2, [pc]
        bgt     ownsIIRGetStateSize_32f
        stmmidb r9, {r0, r4, r5, r12, sp}^


