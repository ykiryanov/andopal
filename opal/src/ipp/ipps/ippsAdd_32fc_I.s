        .text
        .align  4
        .globl  _ippsAdd_32fc_I


_ippsAdd_32fc_I:
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r2, lsl #1
        bgt     _ippsAdd_32f_I


