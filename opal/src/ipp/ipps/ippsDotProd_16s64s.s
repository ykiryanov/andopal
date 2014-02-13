        .text
        .align  4
        .globl  _ippsDotProd_16s64s


_ippsDotProd_16s64s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCGT0
        cmp     r1, #0
        beq     LCGT0
        cmp     r3, #0
        beq     LCGT0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownps_DotProd_16s16s
        mov     r0, #0
        ldr     pc, [sp], #4
LCGT0:
        mvn     r0, #7
        ldr     pc, [sp], #4


