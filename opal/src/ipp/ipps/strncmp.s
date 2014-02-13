        .text
        .align  4
        .globl  strncmp


strncmp:
        cmp     r2, #0
        moveq   r0, #0
        bxeq    lr
        mov     r3, r0
LAIL_strncmp_loop:
        ldrsb   r0, [r3], #1
        ldrsb   r12, [r1], #1
        subs    r0, r0, r12
        bxne    lr
        cmp     r12, #0
        subnes  r2, r2, #1
        bne     LAIL_strncmp_loop
        bx      lr


