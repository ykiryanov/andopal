        .text
        .align  4
        .globl  _ippsAdd_32fc


_ippsAdd_32fc:
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r3, r3, lsl #1
        bgt     _ippsAdd_32f


