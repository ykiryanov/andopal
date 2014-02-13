        .text
        .align  4
        .globl  __aeabi_lmul
        .globl  __lmul


__aeabi_lmul:
__lmul:
        mul     r12, r0, r3
        umull   r0, r3, r2, r0
        mla     r1, r2, r1, r12
        add     r1, r1, r3
        bx      lr


