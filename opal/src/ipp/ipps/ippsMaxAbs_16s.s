        .text
        .align  4
        .globl  _ippsMaxAbs_16s


_ippsMaxAbs_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBHD2
        cmp     r2, #0
        beq     LBHD2
        cmp     r1, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        ldrsh   r3, [r0]
        cmp     r1, #1
        eor     r12, r3, r3, asr #31
        sub     r3, r12, r3, asr #31
        ble     LBHD1
        add     r0, r0, #2
        sub     r1, r1, #1
LBHD0:
        ldrsh   lr, [r0], #2
        eor     r12, lr, lr, asr #31
        sub     r12, r12, lr, asr #31
        cmp     r3, r12
        movlt   r3, r12
        subs    r1, r1, #1
        bne     LBHD0
LBHD1:
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        cmp     r0, r3
        movlt   r3, r0
        mov     r0, #0
        strh    r3, [r2]
        ldr     pc, [sp], #4
LBHD2:
        mvn     r0, #7
        ldr     pc, [sp], #4


