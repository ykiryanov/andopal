        .text
        .align  4
        .globl  __arm_ge_ull


__arm_ge_ull:
        cmp     r1, r3
        cmpeq   r0, r2
        movcc   r0, #0
        bcc     LAHJ0
        mov     r0, #1
        bx      lr
LAHJ0:
        bx      lr


