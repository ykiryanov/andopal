        .text
        .align  4
        .globl  _ippsDecodeGetStateSize_G726_8u16s


_ippsDecodeGetStateSize_G726_8u16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x5C
        str     r1, [r0]
        mov     r0, #0
        bx      lr


