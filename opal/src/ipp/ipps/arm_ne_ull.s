        .text
        .align  4
        .globl  __arm_ne_ull


__arm_ne_ull:
        cmp     r1, r3
        cmpeq   r0, r2
        moveq   r0, #0
        beq     LAHB0
        mov     r0, #1
        bx      lr
LAHB0:
        bx      lr


