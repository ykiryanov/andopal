        .text
        .align  4
        .globl  _ippsDiv_32f_I


_ippsDiv_32f_I:
        cmp     r0, #0
        mov     r3, r2
        beq     LCHM0
        cmp     r1, #0
        beq     LCHM0
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r1
        bgt     _ippsDiv_32f
LCHM0:
        mvn     r0, #7
        bx      lr


