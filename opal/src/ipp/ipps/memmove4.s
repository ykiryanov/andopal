        .text
        .align  4
        .globl  __aeabi_memmove4


__aeabi_memmove4:
        movs    r12, r2
        bxeq    lr
        add     r1, r1, r2
        cmp     r1, r0
        add     r0, r0, r2
        cmpcc   r0, r1
        bcc     LAIG_Copy_to_Top
        tst     r12, #1
        ldrneb  r2, [r1, #-1]!
        strneb  r2, [r0, #-1]!
        tst     r12, #2
        ldrneh  r2, [r1, #-2]!
        strneh  r2, [r0, #-2]!
        bics    r12, r12, #3
        bxcc    lr
LAIG_Loop4:
        ldr     r2, [r1, #-4]!
        subs    r12, r12, #4
        str     r2, [r0, #-4]!
        bne     LAIG_Loop4
        bx      lr
LAIG_Copy_to_Top:
        sub     r1, r1, r2
        sub     r0, r0, r2
        cmp     r12, #4
        bcc     LAIG_RestCopy
LAIG_Loopt4:
        ldr     r2, [r1], #4
        sub     r12, r12, #4
        cmp     r12, #4
        str     r2, [r0], #4
        bcs     LAIG_Loopt4
LAIG_RestCopy:
        tst     r12, #2
        ldrneh  r2, [r1], #2
        strneh  r2, [r0], #2
        tst     r12, #1
        ldrneb  r2, [r1], #1
        strneb  r2, [r0], #1
        bx      lr


