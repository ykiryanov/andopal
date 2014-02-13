        .text
        .align  4
        .globl  _ippsSqrt_16u_Sfs


_ippsSqrt_16u_Sfs:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAVZ0
        cmp     r1, #0
        beq     LAVZ0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownippsSqrt_16u
        mov     r0, #0
        ldr     pc, [sp], #4
LAVZ0:
        mvn     r0, #7
        ldr     pc, [sp], #4


