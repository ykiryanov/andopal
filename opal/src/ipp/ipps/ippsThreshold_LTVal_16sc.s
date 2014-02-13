        .text
        .align  4
        .globl  _ippsThreshold_LTVal_16sc


_ippsThreshold_LTVal_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAPH3
        cmp     r1, #0
        beq     LAPH3
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        mvnlt   r0, #0x12
        ldrlt   pc, [sp], #4
        mul     r3, r3, r3
        cmp     r2, #0
        ble     LAPH2
        sub     r1, r1, #2
LAPH0:
        ldrsh   lr, [r0, #2]
        ldrsh   r12, [r0]
        mul     lr, lr, lr
        mla     lr, r12, r12, lr
        cmp     lr, r3
        strcsh  r12, [r1, #2]
        ldrcssh r12, [r0, #2]
        bcs     LAPH1
        ldrsh   r12, [sp, #4]
        strh    r12, [r1, #2]
        ldrsh   r12, [sp, #6]
LAPH1:
        strh    r12, [r1, #4]!
        subs    r2, r2, #1
        add     r0, r0, #4
        bne     LAPH0
LAPH2:
        mov     r0, #0
        ldr     pc, [sp], #4
LAPH3:
        mvn     r0, #7
        ldr     pc, [sp], #4


