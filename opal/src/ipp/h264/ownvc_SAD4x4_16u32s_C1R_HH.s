        .text
        .align  4
        .globl  ownvc_SAD4x4_16u32s_C1R_HH


ownvc_SAD4x4_16u32s_C1R_HH:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     r4, #0
        mov     r7, #4
LKDQ0:
        ldrh    r6, [r2, #2]
        ldrh    lr, [r2]
        ldrh    r5, [r2, +r3]
        ldrh    r10, [r2, #4]
        ldrh    r11, [r2, #6]
        add     r9, lr, r6
        ldrh    lr, [r0]
        add     r8, r3, r2
        ldrh    r6, [r8, #2]
        add     r5, r9, r5
        ldrh    r9, [r2, #2]
        subs    r7, r7, #1
        add     r5, r5, r6
        ldrh    r6, [r2, #4]
        add     r5, r5, #2
        sub     r5, lr, r5, asr #2
        ldrh    lr, [r8, #2]
        add     r6, r9, r6
        ldrh    r9, [r8, #4]
        add     r6, r6, lr
        add     lr, r10, r11
        ldrh    r11, [r0, #2]
        add     r9, r6, r9
        ldrh    r10, [r8, #4]
        add     r6, r9, #2
        ldrh    r9, [r2, #6]
        ldrh    r2, [r2, #8]
        add     lr, lr, r10
        ldrh    r10, [r8, #6]
        add     r2, r9, r2
        ldrh    r9, [r0, #4]
        sub     r6, r11, r6, asr #2
        add     lr, lr, r10
        ldrh    r10, [r8, #6]
        add     lr, lr, #2
        sub     lr, r9, lr, asr #2
        ldrh    r9, [r8, #8]
        add     r10, r2, r10
        ldrh    r2, [r0, #6]
        eor     r11, r5, r5, asr #31
        add     r9, r10, r9
        eor     r10, r6, r6, asr #31
        sub     r11, r11, r5, asr #31
        add     r9, r9, #2
        add     r4, r11, r4
        sub     r10, r10, r6, asr #31
        sub     r9, r2, r9, asr #2
        add     r5, r10, r4
        eor     r6, lr, lr, asr #31
        eor     r4, r9, r9, asr #31
        add     r0, r1, r0
        sub     r6, r6, lr, asr #31
        sub     r4, r4, r9, asr #31
        add     r5, r6, r5
        mov     r2, r8
        add     r4, r4, r5
        bne     LKDQ0
        str     r4, [r12]
        ldmia   sp!, {r4 - r11, pc}


