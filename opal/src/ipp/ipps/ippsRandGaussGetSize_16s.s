        .text
        .align  4
        .globl  _ippsRandGaussGetSize_16s


_ippsRandGaussGetSize_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x40
        str     r1, [r0]
        mov     r0, #0
        bx      lr

