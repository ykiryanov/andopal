        .text
        .align  4
        .globl  _ippsDotProd_64f64fc


_ippsDotProd_64f64fc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCGN0
        cmp     r1, #0
        beq     LCGN0
        cmp     r3, #0
        beq     LCGN0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      DotProd_64f64fc
        mov     r0, #0
        ldr     pc, [sp], #4
LCGN0:
        mvn     r0, #7
        ldr     pc, [sp], #4


