        .text
        .align  4
        .globl  ownvc_SAD8x8_16u32s_C1R_FH


ownvc_SAD8x8_16u32s_C1R_FH:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r12, [sp, #0x44]
        mov     lr, #0
        mov     r5, #8
        str     lr, [sp]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        str     r1, [sp, #8]
LKDO0:
        ldrh    lr, [r2]
        ldr     r1, [sp, #4]
        ldrh    r3, [r0]
        ldrh    r10, [r2, #0xC]
        subs    r5, r5, #1
        ldrh    r12, [r2, +r1]
        add     r1, r1, r2
        ldrh    r6, [r1, #8]
        add     r4, lr, r12
        ldrh    lr, [r2, #2]
        ldrh    r12, [r1, #2]
        add     r4, r4, #1
        sub     r8, r3, r4, asr #1
        ldrh    r3, [r0, #2]
        add     r4, lr, r12
        ldrh    lr, [r2, #4]
        ldrh    r12, [r1, #4]
        add     r4, r4, #1
        sub     r9, r3, r4, asr #1
        ldrh    r3, [r0, #4]
        add     lr, lr, r12
        ldrh    r4, [r1, #6]
        ldrh    r12, [r2, #6]
        add     lr, lr, #1
        sub     r3, r3, lr, asr #1
        ldrh    lr, [r0, #6]
        add     r4, r12, r4
        ldrh    r12, [r2, #8]
        add     r4, r4, #1
        sub     r4, lr, r4, asr #1
        ldrh    lr, [r0, #8]
        add     r6, r12, r6
        add     r12, r6, #1
        ldrh    r6, [r2, #0xA]
        sub     r12, lr, r12, asr #1
        ldrh    lr, [r1, #0xA]
        ldrh    r2, [r2, #0xE]
        add     lr, r6, lr
        ldrh    r6, [r0, #0xA]
        add     lr, lr, #1
        str     r2, [sp, #0x10]
        ldrh    r11, [r1, #0xE]
        ldrh    r2, [r1, #0xC]
        sub     lr, r6, lr, asr #1
        ldrh    r6, [r0, #0xC]
        ldrh    r7, [r0, #0xE]
        str     r11, [sp, #0x14]
        eor     r11, r8, r8, asr #31
        str     r11, [sp, #0x18]
        add     r2, r10, r2
        ldr     r10, [sp, #0x18]
        eor     r11, r9, r9, asr #31
        str     r11, [sp, #0x1C]
        sub     r8, r10, r8, asr #31
        ldr     r10, [sp]
        add     r2, r2, #1
        sub     r6, r6, r2, asr #1
        add     r8, r8, r10
        ldr     r10, [sp, #0x1C]
        ldr     r2, [sp, #0x14]
        sub     r9, r10, r9, asr #31
        eor     r10, r3, r3, asr #31
        add     r9, r9, r8
        eor     r8, r4, r4, asr #31
        sub     r10, r10, r3, asr #31
        eor     r3, r12, r12, asr #31
        sub     r8, r8, r4, asr #31
        ldr     r4, [sp, #0x10]
        add     r9, r10, r9
        sub     r12, r3, r12, asr #31
        eor     r3, lr, lr, asr #31
        add     r2, r4, r2
        add     r9, r8, r9
        add     r2, r2, #1
        sub     r7, r7, r2, asr #1
        sub     lr, r3, lr, asr #31
        add     r9, r12, r9
        eor     r3, r6, r6, asr #31
        add     r9, lr, r9
        eor     r2, r7, r7, asr #31
        sub     r3, r3, r6, asr #31
        add     r9, r3, r9
        sub     r2, r2, r7, asr #31
        add     r9, r2, r9
        mov     r2, r1
        ldr     r1, [sp, #8]
        str     r9, [sp]
        add     r0, r1, r0
        bne     LKDO0
        ldr     lr, [sp]
        ldr     r12, [sp, #0xC]
        str     lr, [r12]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


