        .text
        .align  4
        .globl  __arm_eq_sll


__arm_eq_sll:
        cmp     r1, r3
        cmpeq   r0, r2
        movne   r0, #0
        bne     LAHM0
        mov     r0, #1
        bx      lr
LAHM0:
        bx      lr


