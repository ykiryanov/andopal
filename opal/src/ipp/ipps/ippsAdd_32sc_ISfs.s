        .text
        .align  4
        .globl  _ippsAdd_32sc_ISfs


_ippsAdd_32sc_ISfs:
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r2, lsl #1
        bgt     _ippsAdd_32s_ISfs


