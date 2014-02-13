        .text
        .align  4
        .globl  __aeabi_memmove8


__aeabi_memmove8:
        movs    r12, r2
        bxeq    lr
        add     r1, r1, r2
        cmp     r1, r0
        add     r0, r0, r2
        cmpcc   r0, r1
        bcc     LAIF_Copy_to_Top
        tst     r12, #1
        ldrneb  r2, [r1, #-1]!
        strneb  r2, [r0, #-1]!
        tst     r12, #2
        ldrneh  r2, [r1, #-2]!
        strneh  r2, [r0, #-2]!
        tst     r12, #4
        ldrne   r2, [r1, #-4]!
        strne   r2, [r0, #-4]!
        bics    r12, r12, #7
        bxcc    lr
LAIF_Loop8:
        ldrd    r2, [r1, #-8]!
        subs    r12, r12, #8
        strd    r2, [r0, #-8]!
        bne     LAIF_Loop8
        bx      lr
LAIF_Copy_to_Top:
        sub     r1, r1, r2
        sub     r0, r0, r2
        cmp     r12, #8
        bcc     LAIF_RestCopy
LAIF_Loopt8:
        ldrd    r2, [r1], #8
        sub     r12, r12, #8
        cmp     r12, #8
        strd    r2, [r0], #8
        bcs     LAIF_Loopt8
LAIF_RestCopy:
        tst     r12, #4
        ldrne   r2, [r1], #4
        strne   r2, [r0], #4
        tst     r12, #2
        ldrneh  r2, [r1], #2
        strneh  r2, [r0], #2
        tst     r12, #1
        ldrneb  r2, [r1], #1
        strneb  r2, [r0], #1
        bx      lr


