        .text
        .align  4
        .globl  ownvc_SAD8x8_16u32s_C1R_HF


ownvc_SAD8x8_16u32s_C1R_HF:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r12, [sp, #0x44]
        mov     lr, #0
        mov     r5, #8
        str     lr, [sp]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LKDN0:
        ldrh    lr, [r2]
        ldrh    r12, [r2, #2]
        ldrh    r3, [r0]
        ldrh    r1, [r2, #2]
        ldrh    r4, [r2, #0xA]
        add     lr, lr, r12
        ldrh    r12, [r2, #4]
        add     lr, lr, #1
        sub     r9, r3, lr, asr #1
        ldrh    r3, [r0, #2]
        add     lr, r1, r12
        ldrh    r12, [r2, #4]
        ldrh    r1, [r2, #6]
        ldrh    r10, [r2, #0xE]
        ldrh    r6, [r0, #0xC]
        add     lr, lr, #1
        sub     r8, r3, lr, asr #1
        ldrh    lr, [r2, #6]
        ldrh    r3, [r2, #8]
        add     r12, r12, r1
        ldrh    r1, [r0, #4]
        add     r12, r12, #1
        add     lr, lr, r3
        ldrh    r3, [r2, #8]
        sub     r1, r1, r12, asr #1
        ldrh    r12, [r0, #6]
        add     lr, lr, #1
        add     r4, r3, r4
        add     r3, r4, #1
        sub     r12, r12, lr, asr #1
        ldrh    lr, [r0, #8]
        ldrh    r4, [r2, #0xA]
        subs    r5, r5, #1
        sub     lr, lr, r3, asr #1
        ldrh    r3, [r2, #0xC]
        add     r3, r4, r3
        ldrh    r4, [r0, #0xA]
        add     r3, r3, #1
        sub     r4, r4, r3, asr #1
        ldrh    r3, [r2, #0xC]
        str     r6, [sp, #0x10]
        ldrh    r11, [r0, #0xE]
        ldrh    r7, [r2, #0x10]
        ldrh    r6, [r2, #0xE]
        add     r3, r3, r10
        str     r11, [sp, #0x14]
        eor     r11, r9, r9, asr #31
        str     r11, [sp, #0x18]
        ldr     r10, [sp, #0x18]
        eor     r11, r8, r8, asr #31
        str     r11, [sp, #0x1C]
        sub     r9, r10, r9, asr #31
        ldr     r10, [sp]
        add     r3, r3, #1
        add     r7, r6, r7
        add     r9, r9, r10
        ldr     r10, [sp, #0x1C]
        sub     r8, r10, r8, asr #31
        eor     r10, r1, r1, asr #31
        add     r9, r8, r9
        eor     r8, r12, r12, asr #31
        sub     r10, r10, r1, asr #31
        sub     r8, r8, r12, asr #31
        ldr     r12, [sp, #0x10]
        eor     r1, lr, lr, asr #31
        add     r9, r10, r9
        sub     r3, r12, r3, asr #1
        sub     r6, r1, lr, asr #31
        ldr     r1, [sp, #0x14]
        add     r12, r7, #1
        add     r9, r8, r9
        eor     lr, r4, r4, asr #31
        sub     r1, r1, r12, asr #1
        add     r9, r6, r9
        sub     r4, lr, r4, asr #31
        eor     r12, r1, r1, asr #31
        eor     lr, r3, r3, asr #31
        add     r9, r4, r9
        sub     r12, r12, r1, asr #31
        ldr     r1, [sp, #8]
        sub     lr, lr, r3, asr #31
        add     r9, lr, r9
        add     r9, r12, r9
        add     r2, r1, r2
        ldr     r1, [sp, #4]
        str     r9, [sp]
        add     r0, r1, r0
        bne     LKDN0
        ldr     lr, [sp]
        ldr     r12, [sp, #0xC]
        str     lr, [r12]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


