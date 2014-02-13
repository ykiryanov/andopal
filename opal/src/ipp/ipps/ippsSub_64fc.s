        .text
        .align  4
        .globl  _ippsSub_64fc


_ippsSub_64fc:
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r3, r3, lsl #1
        bgt     _ippsSub_64f


