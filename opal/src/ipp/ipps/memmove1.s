        .text
        .align  4
        .globl  __aeabi_memmove


__aeabi_memmove:
        movs    r12, r2
        bxeq    lr
        add     r1, r1, r2
        cmp     r1, r0
        add     r0, r0, r2
        cmpcc   r0, r1
        bcc     LAIH_Copy_to_Top
LAIH_Loop:
        ldrb    r2, [r1, #-1]!
        subs    r12, r12, #1
        strb    r2, [r0, #-1]!
        bne     LAIH_Loop
        bx      lr
LAIH_Copy_to_Top:
        sub     r1, r1, r2
        sub     r0, r0, r2
LAIH_Loopt:
        ldrb    r2, [r1], #1
        subs    r12, r12, #1
        strb    r2, [r0], #1
        bne     LAIH_Loopt
        bx      lr


