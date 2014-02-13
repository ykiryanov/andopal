        .text
        .align  4
        .globl  _ippsSub_32fc


_ippsSub_32fc:
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r3, r3, lsl #1
        bgt     _ippsSub_32f


