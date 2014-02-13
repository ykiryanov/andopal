        .text
        .align  4
        .globl  _ippsThreshold_LTAbs_32s


_ippsThreshold_LTAbs_32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAPV4
        cmp     r1, #0
        beq     LAPV4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        mvnlt   r0, #0x12
        ldrlt   pc, [sp], #4
        cmp     r2, #0
        rsb     r12, r3, #0
        ble     LAPV3
LAPV0:
        ldr     lr, [r0], #4
        cmp     lr, r3
        bge     LAPV1
        cmp     lr, r12
        ble     LAPV1
        cmp     lr, #0
        movlt   lr, r12
        movge   lr, r3
        str     lr, [r1]
        b       LAPV2
LAPV1:
        str     lr, [r1]
LAPV2:
        subs    r2, r2, #1
        add     r1, r1, #4
        bne     LAPV0
LAPV3:
        mov     r0, #0
        ldr     pc, [sp], #4
LAPV4:
        mvn     r0, #7
        ldr     pc, [sp], #4


