        .text
        .align  4
        .globl  __aeabi_ulcmp
        .globl  __ulcmp


__aeabi_ulcmp:
__ulcmp:
        subs    r0, r0, r2
        sbc     r0, r1, r3
        bx      lr


