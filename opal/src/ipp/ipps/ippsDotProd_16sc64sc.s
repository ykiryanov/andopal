        .text
        .align  4
        .globl  _ippsDotProd_16sc64sc


_ippsDotProd_16sc64sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCGS0
        cmp     r1, #0
        beq     LCGS0
        cmp     r3, #0
        beq     LCGS0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownps_DotProd_16sc16sc
        mov     r0, #0
        ldr     pc, [sp], #4
LCGS0:
        mvn     r0, #7
        ldr     pc, [sp], #4

