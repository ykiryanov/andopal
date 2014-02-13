        .text
        .align  4
        .globl  _ippsDotProd_32f32fc


_ippsDotProd_32f32fc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCGQ0
        cmp     r1, #0
        beq     LCGQ0
        cmp     r3, #0
        beq     LCGQ0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      DotProd_32f32fc
        mov     r0, #0
        ldr     pc, [sp], #4
LCGQ0:
        mvn     r0, #7
        ldr     pc, [sp], #4


