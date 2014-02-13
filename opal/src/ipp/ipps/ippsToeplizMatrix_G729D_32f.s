        .text
        .align  4
        .globl  _ippsToeplizMatrix_G729D_32f


_ippsToeplizMatrix_G729D_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDHA0
        cmp     r1, #0
        beq     LDHA0
        bl      ownToeplizMatrix_G729D_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LDHA0:
        mvn     r0, #7
        ldr     pc, [sp], #4


