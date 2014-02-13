        .text
        .align  4
        .globl  _ippsCopy_64f


_ippsCopy_64f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCVS0
        cmp     r1, #0
        beq     LCVS0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r2, r2, lsl #3
        bl      ownsCopy_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LCVS0:
        mvn     r0, #7
        ldr     pc, [sp], #4


