        .text
        .align  4
        .globl  __aeabi_uwrite4


__aeabi_uwrite4:
        tst     r1, #3
        streq   r0, [r1]
        bxeq    lr
        strb    r0, [r1]
        mov     r3, r0, lsr #8
        strb    r3, [r1, #1]
        mov     r3, r3, lsr #8
        strb    r3, [r1, #2]
        mov     r3, r3, lsr #8
        strb    r3, [r1, #3]
        bx      lr


