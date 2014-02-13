        .text
        .align  4
        .globl  ownInterpol_3


ownInterpol_3:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r1, #0
        addlt   r1, r1, #3
        sublt   r0, r0, #2
        ldr     r2, [pc, #0x8C]
        mov     r3, r1, lsl #1
        rsb     r1, r1, #0
        add     r12, r2, r3
        ldrsh   r6, [r12, #0xC]
        add     r1, r2, r1, lsl #1
        ldrsh   r2, [r2, +r3]
        ldrsh   r4, [r0, #4]
        ldrsh   r3, [r0, #0xC]
        ldrsh   lr, [r1, #0xC]
        ldrsh   r5, [r0, #8]
        mul     r4, r4, r6
        mul     r3, r3, lr
        ldrsh   lr, [r0, #0x10]
        mul     r2, r5, r2
        ldrsh   r5, [r1, #0x18]
        ldrsh   r6, [r12, #0x12]
        ldrsh   r12, [r12, #6]
        ldrsh   r8, [r0, #6]
        mul     lr, lr, r5
        ldrsh   r7, [r0, #2]
        ldrsh   r5, [r1, #6]
        mla     r2, r8, r12, r2
        ldrsh   r12, [r0, #0xA]
        ldrsh   r0, [r0, #0xE]
        ldrsh   r1, [r1, #0x12]
        mla     r4, r7, r6, r4
        mla     r3, r12, r5, r3
        mla     lr, r0, r1, lr
        add     r2, r4, r2
        add     lr, r3, lr
        add     lr, r2, lr
        adds    r0, lr, #1, 18
        mov     r0, r0, lsr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        ldmia   sp!, {r4 - r8, pc}
        .long   inter_3


