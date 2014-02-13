        .text
        .align  4
        .globl  _ippsSubCRev_16u_ISfs


_ippsSubCRev_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDAG0
        cmp     r3, #0x10
        bgt     LDAG0
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownps_SubCRev_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4
LDAG0:
        mov     r0, r1
        mov     r1, r2
        ldr     lr, [sp], #4
        b       _ippsZero_16s


