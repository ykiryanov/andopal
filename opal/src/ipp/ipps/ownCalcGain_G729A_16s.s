        .text
        .align  4
        .globl  ownCalcGain_G729A_16s


ownCalcGain_G729A_16s:
        stmdb   sp!, {r4 - r6, lr}
        ldrsh   r4, [r2]
        mov     r3, #0x33
        orr     r3, r3, #0x73, 24
        mov     lr, #0
LDVP0:
        mul     r5, r4, r3
        ldrsh   r4, [r0]
        ldrsh   r12, [r0, #2]
        add     lr, lr, #2
        add     r5, r1, r5, asr #15
        cmp     lr, #0x28
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        mul     r6, r5, r3
        mul     r5, r5, r4
        add     r6, r1, r6, asr #15
        mov     r4, r6, lsl #16
        mov     r4, r4, asr #16
        mul     r12, r4, r12
        mov     r5, r5, asr #12
        strh    r5, [r0]
        mov     r12, r12, asr #12
        strh    r12, [r0, #2]
        add     r0, r0, #4
        blt     LDVP0
        strh    r4, [r2]
        ldmia   sp!, {r4 - r6, pc}


