        .text
        .align  4
        .globl  _ippsResidualFilter_G729_16s


_ippsResidualFilter_G729_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDTZ0
        cmp     r1, #0
        beq     LDTZ0
        cmp     r2, #0
        beq     LDTZ0
        bl      ownResidualFilter_G729_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LDTZ0:
        mvn     r0, #7
        ldr     pc, [sp], #4


