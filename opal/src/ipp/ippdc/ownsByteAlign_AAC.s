        .text
        .align  4
        .globl  ownsByteAlign_AAC


ownsByteAlign_AAC:
        ldr     r2, [r1]
        tst     r2, #7
        beq     LGHR0
        ldr     r3, [r0]
        mov     r2, #0
        add     r3, r3, #1
        str     r3, [r0]
        str     r2, [r1]
LGHR0:
        bx      lr


