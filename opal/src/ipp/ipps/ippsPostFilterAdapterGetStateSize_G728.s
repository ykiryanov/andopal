        .text
        .align  4
        .globl  _ippsPostFilterAdapterGetStateSize_G728


_ippsPostFilterAdapterGetStateSize_G728:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0xB0
        str     r1, [r0]
        mov     r0, #0
        bx      lr


