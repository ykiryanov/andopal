        .text
        .align  4
        .globl  _memcopy


_memcopy:
        ldrb    r12, [r1], #1
        subs    r2, r2, #1
        strb    r12, [r0], #1
        bne     _memcopy
        bx      lr


