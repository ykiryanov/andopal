        .text
        .align  4
        .globl  _ippsAddC_16u_ISfs


_ippsAddC_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r3, #0x11
        bgt     LDAS2
        cmn     r3, #0xF
        bge     LDAS0
        cmp     r0, #0
        beq     LDAS0
        mvn     r0, #0
        ldr     lr, [sp], #4
        b       _ippsSet_16s
LDAS0:
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        bne     LDAS1
        cmp     r0, #0
        moveq   r0, #0
        ldreq   pc, [sp], #4
LDAS1:
        bl      ownps_AddC_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4
LDAS2:
        mov     r0, r1
        mov     r1, r2
        ldr     lr, [sp], #4
        b       _ippsZero_16s


