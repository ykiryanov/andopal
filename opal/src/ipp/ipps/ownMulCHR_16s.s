        .text
        .align  4
        .globl  ownMulCHR_16s


ownMulCHR_16s:
        stmdb   sp!, {lr}
        cmp     r3, #0
        ble     LDMY2
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
LDMY0:
        ldrsh   lr, [r0], #2
        mul     lr, r1, lr
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        cmp     r12, lr
        movlt   lr, r12
        blt     LDMY1
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        mvnlt   lr, r12
LDMY1:
        strh    lr, [r2], #2
        subs    r3, r3, #1
        bne     LDMY0
LDMY2:
        ldr     pc, [sp], #4


