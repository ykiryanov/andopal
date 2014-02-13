        .text
        .align  4
        .globl  ownvc_SAD4x4_16u32s_C1R_HF


ownvc_SAD4x4_16u32s_C1R_HF:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        mov     lr, #0
        mov     r7, #4
LKDR0:
        ldrh    r6, [r2]
        ldrh    r8, [r2, #2]
        ldrh    r4, [r0]
        ldrh    r5, [r2, #2]
        ldrh    r9, [r2, #6]
        add     r6, r6, r8
        ldrh    r8, [r2, #4]
        ldrh    r10, [r2, #8]
        add     r6, r6, #1
        sub     r4, r4, r6, asr #1
        ldrh    r6, [r0, #2]
        add     r5, r5, r8
        ldrh    r8, [r2, #4]
        add     r5, r5, #1
        sub     r5, r6, r5, asr #1
        ldrh    r6, [r0, #4]
        add     r8, r8, r9
        ldrh    r9, [r2, #6]
        add     r8, r8, #1
        sub     r6, r6, r8, asr #1
        ldrh    r8, [r0, #6]
        add     r10, r9, r10
        add     r9, r10, #1
        eor     r10, r4, r4, asr #31
        sub     r8, r8, r9, asr #1
        eor     r9, r5, r5, asr #31
        sub     r10, r10, r4, asr #31
        add     lr, r10, lr
        sub     r9, r9, r5, asr #31
        add     r4, r9, lr
        eor     r5, r6, r6, asr #31
        eor     lr, r8, r8, asr #31
        subs    r7, r7, #1
        sub     r5, r5, r6, asr #31
        sub     lr, lr, r8, asr #31
        add     r4, r5, r4
        add     r2, r3, r2
        add     r0, r1, r0
        add     lr, lr, r4
        bne     LKDR0
        str     lr, [r12]
        ldmia   sp!, {r4 - r10, pc}


