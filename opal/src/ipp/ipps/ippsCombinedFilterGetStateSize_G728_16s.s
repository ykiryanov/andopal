        .text
        .align  4
        .globl  _ippsCombinedFilterGetStateSize_G728_16s


_ippsCombinedFilterGetStateSize_G728_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0xD0
        str     r1, [r0]
        mov     r0, #0
        bx      lr


