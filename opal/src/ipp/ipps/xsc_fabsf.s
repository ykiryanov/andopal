        .text
        .align  4
        .globl  fabsf


fabsf:
        mvn     r1, #2, 2
        mov     r2, #0xFE, 10
        and     r1, r0, r1
        orr     r2, r2, #1, 2
        cmp     r2, r1
        bge     LACY0
        orr     r1, r0, #1, 10
        mov     r0, r1
        bx      lr
LACY0:
        mov     r0, r1
        bx      lr


