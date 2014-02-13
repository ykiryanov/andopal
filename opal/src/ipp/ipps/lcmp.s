        .text
        .align  4
        .globl  __aeabi_lcmp
        .globl  __lcmp


__aeabi_lcmp:
__lcmp:
        teq     r1, r3
        movmi   r0, r1, asr #31
        orrmi   r0, r0, #1
        bxmi    lr
        subs    r0, r0, r2
        sbc     r0, r1, r3
        bx      lr


