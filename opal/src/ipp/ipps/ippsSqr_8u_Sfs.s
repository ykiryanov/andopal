        .text
        .align  4
        .globl  _ippsSqr_8u_Sfs


_ippsSqr_8u_Sfs:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAWH0
        cmp     r1, #0
        beq     LAWH0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownippsSqr_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LAWH0:
        mvn     r0, #7
        ldr     pc, [sp], #4


