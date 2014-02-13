        .text
        .align  4
        .globl  _ippsAdd_16u_ISfs


_ippsAdd_16u_ISfs:
        stmdb   sp!, {lr}
        cmp     r3, #0x11
        ble     LDAQ0
        cmp     r0, #0
        beq     LDAQ1
        mov     r0, r1
        mov     r1, r2
        ldr     lr, [sp], #4
        b       _ippsZero_16s
LDAQ0:
        cmp     r0, #0
        beq     LDAQ1
        cmp     r1, #0
        beq     LDAQ1
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        bl      ownps_Add_16u_ISfs
        mov     r0, #0
        ldr     pc, [sp], #4
LDAQ1:
        mvn     r0, #7
        ldr     pc, [sp], #4


