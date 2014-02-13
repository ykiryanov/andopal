        .text
        .align  4
        .globl  _ippsCopy_64fc


_ippsCopy_64fc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCVR0
        cmp     r1, #0
        beq     LCVR0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r2, r2, lsl #4
        bl      ownsCopy_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LCVR0:
        mvn     r0, #7
        ldr     pc, [sp], #4


