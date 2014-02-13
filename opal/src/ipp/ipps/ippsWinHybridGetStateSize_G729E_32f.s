        .text
        .align  4
        .globl  _ippsWinHybridGetStateSize_G729E_32f


_ippsWinHybridGetStateSize_G729E_32f:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x7C
        str     r1, [r0]
        mov     r0, #0
        bx      lr


