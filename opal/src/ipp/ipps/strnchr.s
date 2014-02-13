        .text
        .align  4
        .globl  strnchr


strnchr:
        cmp     r2, #0
        moveq   r0, #0
        bxeq    lr
        sub     r0, r0, #1
LAIM_strnchr_loop:
        ldrsb   r12, [r0, #1]!
        cmp     r12, r1
        bxeq    lr
        cmp     r12, #0
        subnes  r2, r2, #1
        bne     LAIM_strnchr_loop
        mov     r0, #0
        bx      lr


