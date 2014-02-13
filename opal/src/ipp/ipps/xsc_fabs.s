        .text
        .align  4
        .globl  fabs


fabs:
        mov     r2, r1
        mvn     r3, #2, 2
        and     r1, r2, r3
        rsb     r3, r0, #0
        orr     r3, r0, r3
        mov     r12, #0xFF, 12
        orr     r3, r1, r3, lsr #31
        orr     r12, r12, #7, 4
        cmp     r12, r3
        orrcc   r1, r2, #2, 14
        bx      lr


