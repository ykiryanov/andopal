        .text
        .align  4
        .globl  _ippsDiv_64f_I


_ippsDiv_64f_I:
        cmp     r0, #0
        mov     r3, r2
        beq     LCHF0
        cmp     r1, #0
        beq     LCHF0
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r1
        bgt     _ippsDiv_64f
LCHF0:
        mvn     r0, #7
        bx      lr


