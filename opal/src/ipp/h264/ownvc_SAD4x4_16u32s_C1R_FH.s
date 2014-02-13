        .text
        .align  4
        .globl  ownvc_SAD4x4_16u32s_C1R_FH


ownvc_SAD4x4_16u32s_C1R_FH:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     lr, #0
        mov     r5, #4
LKDS0:
        ldrh    r7, [r2]
        ldrh    r8, [r2, +r3]
        ldrh    r4, [r0]
        add     r6, r3, r2
        ldrh    r9, [r6, #2]
        add     r7, r7, r8
        ldrh    r8, [r2, #2]
        ldrh    r10, [r6, #4]
        add     r7, r7, #1
        sub     r4, r4, r7, asr #1
        ldrh    r7, [r0, #2]
        add     r8, r8, r9
        ldrh    r9, [r2, #4]
        ldrh    r2, [r2, #6]
        add     r8, r8, #1
        sub     r8, r7, r8, asr #1
        ldrh    r7, [r0, #4]
        add     r9, r9, r10
        ldrh    r10, [r6, #6]
        add     r9, r9, #1
        sub     r7, r7, r9, asr #1
        ldrh    r9, [r0, #6]
        add     r10, r2, r10
        eor     r11, r4, r4, asr #31
        add     r2, r10, #1
        sub     r9, r9, r2, asr #1
        sub     r11, r11, r4, asr #31
        eor     r10, r8, r8, asr #31
        add     lr, r11, lr
        mov     r2, r6
        sub     r10, r10, r8, asr #31
        add     r4, r10, lr
        eor     r6, r7, r7, asr #31
        eor     lr, r9, r9, asr #31
        subs    r5, r5, #1
        sub     r6, r6, r7, asr #31
        sub     lr, lr, r9, asr #31
        add     r4, r6, r4
        add     r0, r1, r0
        add     lr, lr, r4
        bne     LKDS0
        str     lr, [r12]
        ldmia   sp!, {r4 - r11, pc}


