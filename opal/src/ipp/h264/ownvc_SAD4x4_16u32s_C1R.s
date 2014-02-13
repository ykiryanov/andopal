        .text
        .align  4
        .globl  ownvc_SAD4x4_16u32s_C1R


ownvc_SAD4x4_16u32s_C1R:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        mov     lr, #0
        mov     r9, #4
LKDT0:
        ldrh    r4, [r2]
        ldrh    r6, [r0]
        ldrh    r5, [r2, #2]
        ldrh    r7, [r0, #2]
        ldrh    r10, [r2, #4]
        sub     r4, r6, r4
        ldrh    r6, [r0, #4]
        sub     r5, r7, r5
        ldrh    r7, [r0, #6]
        ldrh    r8, [r2, #6]
        sub     r6, r6, r10
        eor     r10, r4, r4, asr #31
        sub     r7, r7, r8
        eor     r8, r5, r5, asr #31
        sub     r10, r10, r4, asr #31
        add     lr, r10, lr
        sub     r8, r8, r5, asr #31
        add     r4, r8, lr
        eor     r5, r6, r6, asr #31
        eor     lr, r7, r7, asr #31
        subs    r9, r9, #1
        sub     r5, r5, r6, asr #31
        sub     lr, lr, r7, asr #31
        add     r4, r5, r4
        add     r0, r1, r0
        add     r2, r3, r2
        add     lr, lr, r4
        bne     LKDT0
        str     lr, [r12]
        ldmia   sp!, {r4 - r10, pc}


