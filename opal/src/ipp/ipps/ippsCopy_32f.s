        .text
        .align  4
        .globl  _ippsCopy_32f


_ippsCopy_32f:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCVU0
        cmp     r1, #0
        beq     LCVU0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r2, r2, lsl #2
        bl      ownsCopy_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LCVU0:
        mvn     r0, #7
        ldr     pc, [sp], #4


