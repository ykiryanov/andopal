        .text
        .align  4
        .globl  __arm_ge_sll


__arm_ge_sll:
        cmp     r0, r2
        sbcs    r1, r1, r3
        movlt   r0, #0
        blt     LAHK0
        mov     r0, #1
        bx      lr
LAHK0:
        bx      lr


