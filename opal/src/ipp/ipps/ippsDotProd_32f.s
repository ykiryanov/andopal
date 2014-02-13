        .text
        .align  4
        .globl  _ippsDotProd_32f


_ippsDotProd_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCGR0
        cmp     r1, #0
        beq     LCGR0
        cmp     r3, #0
        beq     LCGR0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      DotProd_32f
        mov     r0, #0
        ldr     pc, [sp], #4
LCGR0:
        mvn     r0, #7
        ldr     pc, [sp], #4


