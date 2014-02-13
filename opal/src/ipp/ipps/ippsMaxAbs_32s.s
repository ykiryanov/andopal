        .text
        .align  4
        .globl  _ippsMaxAbs_32s


_ippsMaxAbs_32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBHC2
        cmp     r2, #0
        beq     LBHC2
        cmp     r1, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        ldr     r3, [r0]
        cmp     r1, #1
        eor     r12, r3, r3, asr #31
        sub     r3, r12, r3, asr #31
        ble     LBHC1
        add     r0, r0, #4
        sub     r1, r1, #1
LBHC0:
        ldr     lr, [r0], #4
        eor     r12, lr, lr, asr #31
        sub     r12, r12, lr, asr #31
        cmp     r3, r12
        movcc   r3, r12
        subs    r1, r1, #1
        bne     LBHC0
LBHC1:
        cmn     r3, #6, 2
        mvn     r0, #2, 2
        movhi   r3, r0
        mov     r0, #0
        str     r3, [r2]
        ldr     pc, [sp], #4
LBHC2:
        mvn     r0, #7
        ldr     pc, [sp], #4

