        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729_32f


_ippsToeplizMatrix_G729_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDGZ0
        cmp     r1, #0
        beq     LDGZ0
        bl      ownToeplizMatrix_G729_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LDGZ0:
        mvn     r0, #7
        ldr     pc, [sp], #4


