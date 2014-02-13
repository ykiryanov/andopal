        .text
        .align  4
        .globl  _ippsSubC_16u_ISfs


_ippsSubC_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r3, #0x10
        bgt     LDAE1
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        bne     LDAE0
        cmp     r0, #0
        moveq   r0, #0
        ldreq   pc, [sp], #4
LDAE0:
        bl      ownps_SubC_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4
LDAE1:
        mov     r0, r1
        mov     r1, r2
        ldr     lr, [sp], #4
        b       _ippsZero_16s


