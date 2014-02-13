        .text
        .align  4
        .globl  _ippsSet_16s


_ippsSet_16s:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r2, #6
        mov     r3, #0
        blt     LBNC1
        sub     lr, r2, #6
        mov     r12, r1
LBNC0:
        add     r3, r3, #5
        strh    r0, [r12]
        strh    r0, [r12, #2]
        strh    r0, [r12, #4]
        strh    r0, [r12, #6]
        strh    r0, [r12, #8]
        cmp     r3, lr
        add     r12, r12, #0xA
        ble     LBNC0
LBNC1:
        add     r1, r1, r3, lsl #1
LBNC2:
        add     r3, r3, #1
        strh    r0, [r1], #2
        cmp     r3, r2
        blt     LBNC2
        mov     r0, #0
        ldr     pc, [sp], #4


