        .text
        .align  4
        .globl  __arm_lt_sll


__arm_lt_sll:
        cmp     r0, r2
        sbcs    r1, r1, r3
        movge   r0, #0
        bge     LAHE0
        mov     r0, #1
        bx      lr
LAHE0:
        bx      lr


