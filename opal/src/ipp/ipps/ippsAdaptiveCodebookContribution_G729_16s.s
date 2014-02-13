        .text
        .align  4
        .globl  _ippsAdaptiveCodebookContribution_G729_16s


_ippsAdaptiveCodebookContribution_G729_16s:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0
        beq     LDQX1
        cmp     r2, #0
        beq     LDQX1
        cmp     r3, #0
        beq     LDQX1
        mov     r12, #0
LDQX0:
        ldrsh   r4, [r1]
        ldrsh   lr, [r2]
        add     r12, r12, #4
        mul     r4, r0, r4
        cmp     r12, #0x28
        sub     lr, lr, r4, asr #14
        strh    lr, [r3]
        ldrsh   r4, [r1, #2]
        ldrsh   lr, [r2, #2]
        mul     r4, r0, r4
        sub     lr, lr, r4, asr #14
        strh    lr, [r3, #2]
        ldrsh   r4, [r1, #4]
        ldrsh   lr, [r2, #4]
        mul     r4, r0, r4
        sub     lr, lr, r4, asr #14
        strh    lr, [r3, #4]
        ldrsh   r4, [r1, #6]
        ldrsh   lr, [r2, #6]
        add     r1, r1, #8
        mul     r4, r0, r4
        add     r2, r2, #8
        sub     lr, lr, r4, asr #14
        strh    lr, [r3, #6]
        add     r3, r3, #8
        blt     LDQX0
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LDQX1:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


