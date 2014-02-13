        .text
        .align  4
        .globl  isnan


isnan:
        mvn     r2, #2, 2
        and     r1, r1, r2
        rsb     r2, r0, #0
        orr     r2, r0, r2
        mov     r0, #0xFF, 12
        orr     r0, r0, #7, 4
        orr     r2, r1, r2, lsr #31
        rsb     r0, r2, r0
        mov     r0, r0, asr #31
        bx      lr


