        .text
        .align  4
        .globl  __aeabi_uwrite8


__aeabi_uwrite8:
        tst     r2, #3
        streq   r0, [r2]
        streq   r1, [r2]
        bxeq    lr
        strb    r0, [r2]
        mov     r3, r0, lsr #8
        strb    r3, [r2, #1]
        mov     r3, r3, lsr #8
        strb    r3, [r2, #2]
        mov     r3, r3, lsr #8
        strb    r3, [r2, #3]
        strb    r1, [r2, #4]
        mov     r3, r1, lsr #8
        strb    r3, [r2, #5]
        mov     r3, r3, lsr #8
        strb    r3, [r2, #6]
        mov     r3, r3, lsr #8
        strb    r3, [r2, #7]
        bx      lr


