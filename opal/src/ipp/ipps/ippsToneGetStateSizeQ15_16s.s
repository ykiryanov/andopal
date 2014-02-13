        .text
        .align  4
        .globl  _ippsToneGetStateSizeQ15_16s


_ippsToneGetStateSizeQ15_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x30
        str     r1, [r0]
        mov     r0, #0
        bx      lr


