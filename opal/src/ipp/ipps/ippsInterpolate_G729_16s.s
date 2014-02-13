        .text
        .align  4
        .globl  _ippsInterpolate_G729_16s


_ippsInterpolate_G729_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LDRQ6
        cmp     r1, #0
        beq     LDRQ6
        cmp     r2, #0
        beq     LDRQ6
        cmp     r3, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        ble     LDRQ3
LDRQ0:
        ldrsh   r12, [r0], #2
        cmp     r12, #0
        movge   r12, r12, asr #1
        blt     LDRQ5
LDRQ1:
        ldrsh   lr, [r1], #2
        cmp     lr, #0
        movge   lr, lr, asr #1
        blt     LDRQ4
LDRQ2:
        add     lr, r12, lr
        strh    lr, [r2], #2
        subs    r3, r3, #1
        bne     LDRQ0
LDRQ3:
        mov     r0, #0
        ldr     pc, [sp], #4
LDRQ4:
        mvn     lr, lr
        mov     lr, lr, asr #1
        mvn     lr, lr
        b       LDRQ2
LDRQ5:
        mvn     r12, r12
        mov     r12, r12, asr #1
        mvn     r12, r12
        b       LDRQ1
LDRQ6:
        mvn     r0, #7
        ldr     pc, [sp], #4


