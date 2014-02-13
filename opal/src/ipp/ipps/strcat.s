        .text
        .align  4
        .globl  strcat


strcat:
        sub     r3, r0, #1
LAIS_strcat_loop1:
        ldrb    r12, [r3, #1]!
        cmp     r12, #0
        bne     LAIS_strcat_loop1
LAIS_strcat_loop2:
        ldrb    r12, [r1], #1
        strb    r12, [r3], #1
        cmp     r12, #0
        bne     LAIS_strcat_loop2
        bx      lr


