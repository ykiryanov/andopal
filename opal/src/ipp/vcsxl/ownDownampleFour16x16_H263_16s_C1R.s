        .text
        .align  4
        .globl  ownDownampleFour16x16_H263_16s_C1R


ownDownampleFour16x16_H263_16s_C1R:
        stmdb   sp!, {r4 - r7, lr}
        mov     lr, #8
LFFF0:
        ldrsh   r7, [r0]
        ldrsh   r6, [r0, #2]
        ldrsh   r5, [r0, +r1]
        add     r12, r1, r0
        ldrsh   r4, [r12, #2]
        add     r6, r7, r6
        add     r5, r6, r5
        subs    lr, lr, #1
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2]
        ldrsh   r7, [r0, #4]
        ldrsh   r6, [r0, #6]
        ldrsh   r5, [r12, #4]
        ldrsh   r4, [r12, #6]
        add     r6, r7, r6
        add     r5, r6, r5
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2, #2]
        ldrsh   r7, [r0, #8]
        ldrsh   r6, [r0, #0xA]
        ldrsh   r5, [r12, #8]
        ldrsh   r4, [r12, #0xA]
        add     r6, r7, r6
        add     r5, r6, r5
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2, #4]
        ldrsh   r7, [r0, #0xC]
        ldrsh   r6, [r0, #0xE]
        ldrsh   r5, [r12, #0xC]
        ldrsh   r4, [r12, #0xE]
        add     r6, r7, r6
        add     r5, r6, r5
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2, #6]
        ldrsh   r6, [r0, #0x12]
        ldrsh   r7, [r0, #0x10]
        ldrsh   r5, [r12, #0x10]
        ldrsh   r4, [r12, #0x12]
        add     r6, r7, r6
        add     r5, r6, r5
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2, #8]
        ldrsh   r6, [r0, #0x16]
        ldrsh   r7, [r0, #0x14]
        ldrsh   r5, [r12, #0x14]
        ldrsh   r4, [r12, #0x16]
        add     r6, r7, r6
        add     r5, r6, r5
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2, #0xA]
        ldrsh   r6, [r0, #0x1A]
        ldrsh   r7, [r0, #0x18]
        ldrsh   r5, [r12, #0x18]
        ldrsh   r4, [r12, #0x1A]
        add     r6, r7, r6
        add     r5, r6, r5
        add     r4, r5, r4
        add     r4, r4, #2
        mov     r4, r4, asr #2
        strh    r4, [r2, #0xC]
        ldrsh   r4, [r12, #0x1C]
        ldrsh   r5, [r0, #0x1E]
        ldrsh   r6, [r0, #0x1C]
        ldrsh   r12, [r12, #0x1E]
        add     r0, r0, r1, lsl #1
        add     r5, r6, r5
        add     r4, r5, r4
        add     r12, r4, r12
        add     r12, r12, #2
        mov     r12, r12, asr #2
        strh    r12, [r2, #0xE]
        add     r2, r2, r3
        bne     LFFF0
        ldmia   sp!, {r4 - r7, pc}


