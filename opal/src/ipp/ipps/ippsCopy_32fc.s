        .text
        .align  4
        .globl  _ippsCopy_32fc


_ippsCopy_32fc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCVT0
        cmp     r1, #0
        beq     LCVT0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r2, r2, lsl #3
        bl      ownsCopy_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LCVT0:
        mvn     r0, #7
        ldr     pc, [sp], #4


