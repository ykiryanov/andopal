        .text
        .align  4
        .globl  _ippsEncodeGetStateSize_G726_16s8u


_ippsEncodeGetStateSize_G726_16s8u:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x58
        str     r1, [r0]
        mov     r0, #0
        bx      lr


