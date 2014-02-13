        .text
        .align  4
        .globl  _ippsThreshold_GTVal_16s


_ippsThreshold_GTVal_16s:
        stmdb   sp!, {lr}
        ldr     r12, [sp, #4]
        cmp     r0, #0
        beq     LAQZ2
        cmp     r1, #0
        beq     LAQZ2
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r2, #0
        ble     LAQZ1
LAQZ0:
        ldrsh   lr, [r0], #2
        cmp     lr, r3
        movgt   lr, r12
        strh    lr, [r1], #2
        subs    r2, r2, #1
        bne     LAQZ0
LAQZ1:
        mov     r0, #0
        ldr     pc, [sp], #4
LAQZ2:
        mvn     r0, #7
        ldr     pc, [sp], #4


