        .text
        .align  4
        .globl  __aeabi_dneg
        .globl  __negdf2


__aeabi_dneg:
__negdf2:
        eor     r1, r1, #2, 2
        mov     r12, r1, lsl #1
        subs    r12, r12, #0xFF, 8
        subcss  r12, r12, #0xE, 12
        bxcc    lr
        orrs    r12, r0, r1, lsl #12
        bxeq    lr
        eor     r1, r1, #2, 2
        orr     r1, r1, #2, 14
        bx      lr


