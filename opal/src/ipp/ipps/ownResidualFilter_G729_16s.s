        .text
        .align  4
        .globl  ownResidualFilter_G729_16s


ownResidualFilter_G729_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     r0, r0, #0x16
        mov     r3, #0x28
LDTR0:
        ldrsh   r12, [r0, #0x14]
        ldrsh   lr, [r1, #2]
        ldrsh   r5, [r1]
        ldrsh   r6, [r0, #0x12]
        ldrsh   r7, [r1, #4]
        mul     r12, lr, r12
        ldrsh   lr, [r0, #0x16]
        ldrsh   r4, [r0, #0x10]
        subs    r3, r3, #1
        mla     r8, r5, lr, r12
        ldrsh   r5, [r1, #6]
        ldrsh   r12, [r0, #0xE]
        ldrsh   lr, [r1, #8]
        mla     r8, r7, r6, r8
        ldrsh   r6, [r0, #0xC]
        ldrsh   r7, [r1, #0xA]
        mla     r8, r5, r4, r8
        ldrsh   r4, [r0, #0xA]
        ldrsh   r5, [r1, #0xC]
        mla     r8, lr, r12, r8
        ldrsh   lr, [r0, #8]
        ldrsh   r12, [r1, #0xE]
        mla     r8, r7, r6, r8
        ldrsh   r6, [r0, #6]
        ldrsh   r7, [r1, #0x10]
        mla     r9, r5, r4, r8
        ldrsh   r5, [r0, #4]
        ldrsh   r4, [r1, #0x12]
        ldrsh   r8, [r1, #0x14]
        mla     r9, r12, lr, r9
        ldrsh   r12, [r0, #2]!
        mla     r9, r7, r6, r9
        mla     r9, r4, r5, r9
        mla     r9, r8, r12, r9
        add     r12, r9, #2, 22
        mov     r12, r12, asr #12
        strh    r12, [r2], #2
        bne     LDTR0
        ldmia   sp!, {r4 - r9, pc}


