        .text
        .align  4
        .globl  strrchr


strrchr:
        sub     r3, r0, #1
        mov     r0, #0
LAIJ_strrchr_loop:
        ldrsb   r12, [r3, #1]!
        cmp     r12, r1
        moveq   r0, r3
        cmp     r12, #0
        bne     LAIJ_strrchr_loop
        bx      lr


