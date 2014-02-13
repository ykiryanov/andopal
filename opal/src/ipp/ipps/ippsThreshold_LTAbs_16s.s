        .text
        .align  4
        .globl  _ippsThreshold_LTAbs_16s


_ippsThreshold_LTAbs_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LAPZ4
        cmp     r1, #0
        beq     LAPZ4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        mvnlt   r0, #0x12
        ldrlt   pc, [sp], #4
        cmp     r3, #0
        ldreq   lr, [sp], #4
        beq     _ippsCopy_16s
        cmp     r2, #0
        rsb     r12, r3, #0
        ble     LAPZ3
LAPZ0:
        ldrsh   lr, [r0], #2
        cmp     lr, r3
        bge     LAPZ1
        cmp     lr, r12
        ble     LAPZ1
        cmp     lr, #0
        movlt   lr, r12
        movge   lr, r3
        strh    lr, [r1]
        b       LAPZ2
LAPZ1:
        strh    lr, [r1]
LAPZ2:
        subs    r2, r2, #1
        add     r1, r1, #2
        bne     LAPZ0
LAPZ3:
        mov     r0, #0
        ldr     pc, [sp], #4
LAPZ4:
        mvn     r0, #7
        ldr     pc, [sp], #4


