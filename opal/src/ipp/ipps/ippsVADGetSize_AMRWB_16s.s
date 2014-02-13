        .text
        .align  4
        .globl  _ippsVADGetSize_AMRWB_16s


_ippsVADGetSize_AMRWB_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0xAC
        str     r1, [r0]
        mov     r0, #0
        bx      lr


