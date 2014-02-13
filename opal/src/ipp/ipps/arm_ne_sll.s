        .text
        .align  4
        .globl  __arm_ne_sll


__arm_ne_sll:
        cmp     r1, r3
        cmpeq   r0, r2
        moveq   r0, #0
        beq     LAHC0
        mov     r0, #1
        bx      lr
LAHC0:
        bx      lr


