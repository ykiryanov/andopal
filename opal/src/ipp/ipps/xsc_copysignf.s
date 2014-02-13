        .text
        .align  4
        .globl  copysignf


copysignf:
        mov     r3, #0xFE, 10
        mvn     r2, #2, 2
        and     r0, r0, r2
        orr     r3, r3, #1, 2
        cmp     r3, r0
        orrlt   r0, r0, #1, 10
        bic     r2, r1, r2
        orr     r0, r0, r2
        bx      lr


