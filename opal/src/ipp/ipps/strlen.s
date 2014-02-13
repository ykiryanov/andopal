        .text
        .align  4
        .globl  strlen


strlen:
        add     r1, r0, #1
LAIO_strlen_loop:
        ldrb    r12, [r0], #1
        cmp     r12, #0
        bne     LAIO_strlen_loop
        sub     r0, r0, r1
        bx      lr


