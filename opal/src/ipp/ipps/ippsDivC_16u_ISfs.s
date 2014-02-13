        .text
        .align  4
        .globl  _ippsDivC_16u_ISfs


_ippsDivC_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r3, #0x10
        ble     LDAO0
        cmp     r0, #0
        beq     LDAO1
        mov     r0, r1
        mov     r1, r2
        ldr     lr, [sp], #4
        b       _ippsZero_16s
LDAO0:
        cmn     r3, #0x1F
        bge     LDAO1
        cmp     r0, #0
        beq     LDAO1
        mvn     r0, #0
        ldr     lr, [sp], #4
        b       _ippsSet_16s
LDAO1:
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r0, #0
        mvneq   r0, #9
        ldreq   pc, [sp], #4
        cmp     r0, #1
        beq     LDAO2
        bl      ownps_DivC_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4
LDAO2:
        cmp     r3, #0
        moveq   r0, #0
        ldreq   pc, [sp], #4
        mov     r0, #1
        bl      ownps_MulC_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4


