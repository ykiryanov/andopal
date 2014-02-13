        .text
        .align  4
        .globl  _ippsSub_16sc_ISfs


_ippsSub_16sc_ISfs:
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r2, lsl #1
        bgt     _ippsSub_16s_ISfs


