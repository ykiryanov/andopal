        .text
        .align  4
        .globl  memchr


memchr:
        cmp     r2, #0
        moveq   r0, #0
        bxeq    lr
        mov     r1, r1, lsl #24
        tst     r0, #3
        bne     LAIX_memchr_single
        cmp     r2, #4
        bcc     LAIX_memchr_single
        sub     r2, r2, #4
LAIX_memchr_loop4:
        ldr     r12, [r0]
        cmp     r1, r12, lsl #24
        bxeq    lr
        bic     r12, r12, #0xFF
        add     r0, r0, #1
        cmp     r1, r12, lsl #16
        bxeq    lr
        bic     r12, r12, #0xFF, 24
        add     r0, r0, #1
        cmp     r1, r12, lsl #8
        bxeq    lr
        bic     r12, r12, #0xFF, 16
        add     r0, r0, #1
        cmp     r1, r12
        bxeq    lr
        add     r0, r0, #1
        subs    r2, r2, #4
        bcc     LAIX_memchr_loop4
        adds    r2, r2, #4
        moveq   r0, #0
        bxeq    lr
LAIX_memchr_single:
        sub     r0, r0, #1
LAIX_memchr_loop:
        ldrsb   r12, [r0, #1]!
        cmp     r1, r12, lsl #24
        bxeq    lr
        subs    r2, r2, #1
        bne     LAIX_memchr_loop
        mov     r0, #0
        bx      lr


