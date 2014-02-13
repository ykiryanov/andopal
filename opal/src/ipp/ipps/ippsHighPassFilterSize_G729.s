        .text
        .align  4
        .globl  _ippsHighPassFilterSize_G729


_ippsHighPassFilterSize_G729:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x18
        str     r1, [r0]
        mov     r0, #0
        bx      lr


