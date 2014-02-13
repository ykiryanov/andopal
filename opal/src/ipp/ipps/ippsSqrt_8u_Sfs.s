        .text
        .align  4
        .globl  _ippsSqrt_8u_Sfs


_ippsSqrt_8u_Sfs:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAVL0
        cmp     r1, #0
        beq     LAVL0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownippsSqrt_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LAVL0:
        mvn     r0, #7
        ldr     pc, [sp], #4


