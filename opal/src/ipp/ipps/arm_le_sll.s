        .text
        .align  4
        .globl  __arm_le_sll


__arm_le_sll:
        subs    r0, r0, r2
        sbcs    r1, r1, r3
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        movne   r0, #0
        bne     LAHG0
        mov     r0, #1
        bx      lr
LAHG0:
        bx      lr


