        .text
        .align  4
        .globl  truncf


truncf:
        mvn     r2, #2, 2
        and     r1, r0, r2
        bic     r3, r0, r2
        mov     r12, r1, asr #23
        cmp     r12, #0x7F
        mvn     r2, #0
        bgt     LAAA0
        cmp     r12, #0x7F
        bne     LAAA1
        orr     r0, r3, #0xFE, 10
        bx      lr
LAAA0:
        cmp     r12, #0x96
        blt     LAAA3
LAAA1:
        cmp     r12, #0xFF
        beq     LAAA4
        cmp     r12, #0x96
        movlt   r0, r3
        bxlt    lr
LAAA2:
        bx      lr
LAAA3:
        rsb     r12, r12, #0x96
        and     r0, r0, r2, lsl r12
        bx      lr
LAAA4:
        add     r2, r2, #2, 10
        tst     r1, r2
        beq     LAAA2
        orr     r0, r0, #1, 10
        bx      lr


