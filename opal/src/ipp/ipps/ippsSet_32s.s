        .text
        .align  4
        .globl  _ippsSet_32s


_ippsSet_32s:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r2, #6
        mov     r3, #0
        blt     LBNA1
        sub     lr, r2, #6
        add     r12, r1, #4
LBNA0:
        add     r3, r3, #5
        str     r0, [r12, #-4]
        str     r0, [r12]
        str     r0, [r12, #4]
        str     r0, [r12, #8]
        str     r0, [r12, #0xC]
        cmp     r3, lr
        add     r12, r12, #0x14
        ble     LBNA0
LBNA1:
        add     r1, r1, r3, lsl #2
LBNA2:
        add     r3, r3, #1
        str     r0, [r1], #4
        cmp     r3, r2
        blt     LBNA2
        mov     r0, #0
        ldr     pc, [sp], #4


