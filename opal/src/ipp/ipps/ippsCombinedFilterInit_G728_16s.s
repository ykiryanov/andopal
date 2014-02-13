        .text
        .align  4
        .globl  _ippsCombinedFilterInit_G728_16s


_ippsCombinedFilterInit_G728_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        movne   r1, #0x68
        bne     _ippsZero_16s


