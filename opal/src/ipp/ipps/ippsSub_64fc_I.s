        .text
        .align  4
        .globl  _ippsSub_64fc_I


_ippsSub_64fc_I:
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r2, lsl #1
        bgt     _ippsSub_64f_I


