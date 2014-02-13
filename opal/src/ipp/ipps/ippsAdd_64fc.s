        .text
        .align  4
        .globl  _ippsAdd_64fc


_ippsAdd_64fc:
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r3, r3, lsl #1
        bgt     _ippsAdd_64f


