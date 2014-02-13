        .text
        .align  4
        .globl  _ippsFullbandControllerReset_EC_16s


_ippsFullbandControllerReset_EC_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        and     r1, r0, #0xF
        rsb     r1, r1, #0
        and     r2, r1, #0xF
        mov     r1, #0
        str     r1, [r2, +r0]
        add     r2, r0, r2
        mov     r0, #0
        str     r1, [r2, #4]
        str     r1, [r2, #8]
        str     r1, [r2, #0x10]
        str     r1, [r2, #0x14]
        bx      lr


