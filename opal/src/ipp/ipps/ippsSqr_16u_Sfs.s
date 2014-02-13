        .text
        .align  4
        .globl  _ippsSqr_16u_Sfs


_ippsSqr_16u_Sfs:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAWR0
        cmp     r1, #0
        beq     LAWR0
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownippsSqr_16u
        mov     r0, #0
        ldr     pc, [sp], #4
LAWR0:
        mvn     r0, #7
        ldr     pc, [sp], #4


