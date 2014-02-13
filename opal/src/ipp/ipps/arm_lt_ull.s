        .text
        .align  4
        .globl  __arm_lt_ull


__arm_lt_ull:
        cmp     r1, r3
        cmpeq   r0, r2
        movcs   r0, #0
        bcs     LAHD0
        mov     r0, #1
        bx      lr
LAHD0:
        bx      lr


