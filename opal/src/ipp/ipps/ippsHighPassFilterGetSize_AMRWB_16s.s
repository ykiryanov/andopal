        .text
        .align  4
        .globl  _ippsHighPassFilterGetSize_AMRWB_16s


_ippsHighPassFilterGetSize_AMRWB_16s:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #2
        blt     LDJN0
        cmp     r0, #3
        bgt     LDJN0
        mov     r0, #0x28
        str     r0, [r1]
        mov     r0, #0
        bx      lr
LDJN0:
        mvn     r0, #6
        bx      lr


