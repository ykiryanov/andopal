        .text
        .align  4
        .globl  strchr


strchr:
        sub     r0, r0, #1
LAIR_strchr_loop:
        ldrsb   r12, [r0, #1]!
        cmp     r12, r1
        bxeq    lr
        cmp     r12, #0
        bne     LAIR_strchr_loop
        mov     r0, #0
        bx      lr


