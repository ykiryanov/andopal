        .text
        .align  4
        .globl  isnanf


isnanf:
        mvn     r1, #2, 2
        and     r0, r0, r1
        mov     r1, #0xFE, 10
        orr     r1, r1, #1, 2
        rsb     r1, r0, r1
        mov     r0, r1, asr #31
        bx      lr


