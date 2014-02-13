        .text
        .align  4
        .globl  _ippsPhaseDispersionUpdate_G729D_16s


_ippsPhaseDispersionUpdate_G729D_16s:
        cmp     r2, #0
        mvneq   r0, #7
        bxeq    lr
        ldrsh   r3, [r2, #8]
        strh    r1, [r2, #0xE]
        ldrsh   r1, [r2, #6]
        strh    r3, [r2, #0xA]
        ldrsh   r3, [r2, #4]
        strh    r1, [r2, #8]
        ldrsh   r1, [r2, #2]
        strh    r3, [r2, #6]
        ldrsh   r3, [r2]
        strh    r0, [r2]
        mov     r0, #2
        strh    r0, [r2, #0xC]
        mov     r0, #0
        strh    r0, [r2, #0x10]
        mov     r0, #0
        strh    r1, [r2, #4]
        strh    r3, [r2, #2]
        bx      lr


