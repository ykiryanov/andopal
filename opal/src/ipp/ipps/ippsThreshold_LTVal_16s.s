        .text
        .align  4
        .globl  _ippsThreshold_LTVal_16s


_ippsThreshold_LTVal_16s:
        stmdb   sp!, {lr}
        ldr     r12, [sp, #4]
        cmp     r0, #0
        beq     LAPJ2
        cmp     r1, #0
        beq     LAPJ2
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r2, #0
        ble     LAPJ1
LAPJ0:
        ldrsh   lr, [r0], #2
        cmp     lr, r3
        movlt   lr, r12
        strh    lr, [r1], #2
        subs    r2, r2, #1
        bne     LAPJ0
LAPJ1:
        mov     r0, #0
        ldr     pc, [sp], #4
LAPJ2:
        mvn     r0, #7
        ldr     pc, [sp], #4


