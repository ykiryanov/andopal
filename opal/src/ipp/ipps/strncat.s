        .text
        .align  4
        .globl  strncat


strncat:
        sub     r3, r0, #1
LAIN_strcat_loop1:
        ldrb    r12, [r3, #1]!
        cmp     r12, #0
        bne     LAIN_strcat_loop1
        cmp     r2, #0
        bxeq    lr
LAIN_strcat_loop2:
        ldrb    r12, [r1], #1
        strb    r12, [r3], #1
        cmp     r12, #0
        subnes  r2, r2, #1
        bne     LAIN_strcat_loop2
        cmp     r12, #0
        mov     r12, #0
        strneb  r12, [r3]
        bx      lr


