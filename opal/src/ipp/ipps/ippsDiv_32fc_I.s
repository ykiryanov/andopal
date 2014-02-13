        .text
        .align  4
        .globl  _ippsDiv_32fc_I


_ippsDiv_32fc_I:
        cmp     r0, #0
        mov     r3, r2
        beq     LCHK0
        cmp     r1, #0
        beq     LCHK0
        cmp     r3, #0
        mvnle   r0, #5
        bxle    lr
        movgt   r2, r1
        bgt     _ippsDiv_32fc
LCHK0:
        mvn     r0, #7
        bx      lr


