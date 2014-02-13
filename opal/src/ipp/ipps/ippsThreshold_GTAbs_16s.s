        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_16s


_ippsThreshold_GTAbs_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LARH4
        cmp     r1, #0
        beq     LARH4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        mvnlt   r0, #0x12
        ldrlt   pc, [sp], #4
        cmp     r2, #0
        rsb     r12, r3, #0
        ble     LARH3
LARH0:
        ldrsh   lr, [r0], #2
        cmp     lr, r3
        bgt     LARH1
        cmp     lr, r12
        strgeh  lr, [r1]
        bge     LARH2
LARH1:
        cmp     lr, #0
        movlt   lr, r12
        movge   lr, r3
        strh    lr, [r1]
LARH2:
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LARH0
LARH3:
        mov     r0, #0
        ldr     pc, [sp], #4
LARH4:
        mvn     r0, #7
        ldr     pc, [sp], #4


