        .text
        .align  4
        .globl  __arm_eq_ull


__arm_eq_ull:
        cmp     r1, r3
        cmpeq   r0, r2
        movne   r0, #0
        bne     LAHL0
        mov     r0, #1
        bx      lr
LAHL0:
        bx      lr


