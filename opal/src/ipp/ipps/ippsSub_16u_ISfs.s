        .text
        .align  4
        .globl  _ippsSub_16u_ISfs


_ippsSub_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r3, #0x10
        ble     LDAC0
        cmp     r0, #0
        beq     LDAC1
        mov     r0, r1
        mov     r1, r2
        ldr     lr, [sp], #4
        b       _ippsZero_16s
LDAC0:
        cmp     r0, #0
        beq     LDAC1
        cmp     r1, #0
        beq     LDAC1
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownps_Sub_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4
LDAC1:
        mvn     r0, #7
        ldr     pc, [sp], #4


