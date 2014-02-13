        .text
        .align  4
        .globl  _ippsPhaseDispersionGetStateSize_G729D_16s


_ippsPhaseDispersionGetStateSize_G729D_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r1, #0x14
        str     r1, [r0]
        mov     r0, #0
        bx      lr


