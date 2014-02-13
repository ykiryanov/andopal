        .text
        .align  4
        .globl  _ippsConvPartial_NR_16s


_ippsConvPartial_NR_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDJT0
        cmp     r1, #0
        beq     LDJT0
        cmp     r2, #0
        beq     LDJT0
        cmp     r3, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownConvPartial_NR_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LDJT0:
        mvn     r0, #7
        ldr     pc, [sp], #4


