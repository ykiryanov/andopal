        .text
        .align  4
        .globl  ownvc_SAD16x16_16u32s_C1R_FH


ownvc_SAD16x16_16u32s_C1R_FH:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x80
        ldr     lr, [sp, #0xA4]
        mov     r4, #0
        mov     r12, #0x10
        str     r4, [sp]
        str     lr, [sp, #0xC]
        str     r3, [sp, #4]
        str     r1, [sp, #8]
LKEE0:
        ldr     r1, [sp, #4]
        ldrh    r4, [r2]
        ldrh    r9, [r2, #0xC]
        ldrh    lr, [r2, +r1]
        ldrh    r3, [r0]
        add     r1, r1, r2
        ldrh    r10, [r1, #0xC]
        add     r5, r4, lr
        ldrh    r4, [r2, #2]
        ldrh    lr, [r1, #2]
        add     r5, r5, #1
        sub     r5, r3, r5, asr #1
        ldrh    r3, [r0, #2]
        add     r6, r4, lr
        ldrh    lr, [r1, #4]
        ldrh    r4, [r2, #4]
        add     r6, r6, #1
        sub     r6, r3, r6, asr #1
        ldrh    r3, [r2, #6]
        add     r4, r4, lr
        ldrh    lr, [r0, #4]
        add     r7, r4, #1
        ldrh    r4, [r1, #6]
        subs    r12, r12, #1
        sub     r7, lr, r7, asr #1
        ldrh    lr, [r0, #6]
        add     r4, r3, r4
        ldrh    r3, [r2, #8]
        add     r4, r4, #1
        sub     r8, lr, r4, asr #1
        ldrh    r4, [r1, #8]
        ldrh    lr, [r0, #8]
        add     r10, r9, r10
        add     r10, r10, #1
        add     r4, r3, r4
        add     r3, r4, #1
        sub     lr, lr, r3, asr #1
        ldrh    r3, [r1, #0xA]
        ldrh    r4, [r2, #0xA]
        add     r3, r4, r3
        ldrh    r4, [r0, #0xA]
        add     r3, r3, #1
        sub     r3, r4, r3, asr #1
        ldrh    r4, [r0, #0xC]
        str     r4, [sp, #0x10]
        ldrh    r11, [r0, #0xE]
        ldrh    r4, [r2, #0xE]
        str     r11, [sp, #0x14]
        ldrh    r11, [r1, #0xE]
        str     r11, [sp, #0x18]
        ldrh    r11, [r0, #0x10]
        str     r11, [sp, #0x1C]
        ldrh    r11, [r2, #0x10]
        str     r11, [sp, #0x20]
        ldrh    r11, [r1, #0x10]
        str     r11, [sp, #0x24]
        ldrh    r11, [r0, #0x12]
        str     r11, [sp, #0x28]
        ldrh    r11, [r2, #0x12]
        str     r11, [sp, #0x2C]
        ldrh    r11, [r1, #0x12]
        str     r11, [sp, #0x30]
        ldrh    r11, [r0, #0x14]
        str     r11, [sp, #0x34]
        ldrh    r11, [r2, #0x14]
        str     r11, [sp, #0x38]
        ldrh    r11, [r1, #0x14]
        str     r11, [sp, #0x3C]
        ldrh    r11, [r0, #0x16]
        str     r11, [sp, #0x40]
        ldrh    r11, [r2, #0x16]
        str     r11, [sp, #0x44]
        ldrh    r11, [r1, #0x16]
        str     r11, [sp, #0x48]
        ldrh    r11, [r0, #0x18]
        str     r11, [sp, #0x4C]
        ldrh    r11, [r2, #0x18]
        str     r11, [sp, #0x50]
        ldrh    r11, [r1, #0x18]
        str     r11, [sp, #0x54]
        ldrh    r11, [r0, #0x1A]
        str     r11, [sp, #0x58]
        ldrh    r11, [r2, #0x1A]
        str     r11, [sp, #0x5C]
        ldrh    r11, [r1, #0x1A]
        str     r11, [sp, #0x60]
        ldrh    r11, [r0, #0x1C]
        str     r11, [sp, #0x64]
        ldrh    r11, [r2, #0x1C]
        str     r11, [sp, #0x68]
        ldrh    r11, [r1, #0x1C]
        str     r11, [sp, #0x6C]
        ldrh    r11, [r0, #0x1E]
        str     r11, [sp, #0x70]
        ldrh    r2, [r2, #0x1E]
        eor     r11, r6, r6, asr #31
        str     r2, [sp, #0x74]
        ldrh    r2, [r1, #0x1E]
        str     r11, [sp, #0x7C]
        str     r2, [sp, #0x78]
        eor     r2, r5, r5, asr #31
        sub     r2, r2, r5, asr #31
        ldr     r5, [sp]
        add     r2, r2, r5
        ldr     r5, [sp, #0x7C]
        sub     r5, r5, r6, asr #31
        eor     r6, r7, r7, asr #31
        add     r5, r5, r2
        eor     r2, r8, r8, asr #31
        sub     r6, r6, r7, asr #31
        ldr     r7, [sp, #0x18]
        add     r5, r6, r5
        eor     r6, lr, lr, asr #31
        add     r7, r4, r7
        add     r4, r7, #1
        ldr     r7, [sp, #0x14]
        sub     r8, r2, r8, asr #31
        ldr     r2, [sp, #0x10]
        sub     r6, r6, lr, asr #31
        add     r5, r8, r5
        sub     r4, r7, r4, asr #1
        ldr     r7, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        eor     lr, r3, r3, asr #31
        add     r5, r6, r5
        add     r7, r8, r7
        sub     r6, lr, r3, asr #31
        ldr     lr, [sp, #0x1C]
        add     r7, r7, #1
        sub     r2, r2, r10, asr #1
        ldr     r8, [sp, #0x2C]
        sub     lr, lr, r7, asr #1
        ldr     r7, [sp, #0x30]
        eor     r3, r2, r2, asr #31
        add     r5, r6, r5
        sub     r6, r3, r2, asr #31
        ldr     r3, [sp, #0x28]
        add     r7, r8, r7
        add     r7, r7, #1
        ldr     r8, [sp, #0x38]
        sub     r3, r3, r7, asr #1
        ldr     r7, [sp, #0x3C]
        eor     r2, r4, r4, asr #31
        add     r5, r6, r5
        sub     r6, r2, r4, asr #31
        ldr     r2, [sp, #0x34]
        add     r7, r8, r7
        add     r7, r7, #1
        ldr     r8, [sp, #0x44]
        sub     r2, r2, r7, asr #1
        ldr     r7, [sp, #0x48]
        eor     r4, lr, lr, asr #31
        add     r5, r6, r5
        sub     r6, r4, lr, asr #31
        ldr     lr, [sp, #0x40]
        add     r7, r8, r7
        add     r7, r7, #1
        ldr     r8, [sp, #0x50]
        sub     lr, lr, r7, asr #1
        ldr     r7, [sp, #0x54]
        eor     r4, r3, r3, asr #31
        add     r5, r6, r5
        sub     r6, r4, r3, asr #31
        ldr     r3, [sp, #0x4C]
        add     r7, r8, r7
        add     r7, r7, #1
        ldr     r8, [sp, #0x5C]
        sub     r3, r3, r7, asr #1
        ldr     r7, [sp, #0x60]
        eor     r4, r2, r2, asr #31
        add     r5, r6, r5
        sub     r6, r4, r2, asr #31
        ldr     r2, [sp, #0x58]
        add     r7, r8, r7
        add     r7, r7, #1
        ldr     r8, [sp, #0x68]
        eor     r4, lr, lr, asr #31
        sub     r2, r2, r7, asr #1
        ldr     r7, [sp, #0x6C]
        add     r5, r6, r5
        sub     r4, r4, lr, asr #31
        ldr     lr, [sp, #0x64]
        add     r7, r8, r7
        ldr     r8, [sp, #0x74]
        add     r7, r7, #1
        sub     lr, lr, r7, asr #1
        ldr     r7, [sp, #0x78]
        eor     r6, r3, r3, asr #31
        add     r5, r4, r5
        sub     r6, r6, r3, asr #31
        ldr     r3, [sp, #0x70]
        eor     r4, r2, r2, asr #31
        add     r7, r8, r7
        sub     r2, r4, r2, asr #31
        add     r5, r6, r5
        add     r7, r7, #1
        add     r5, r2, r5
        sub     r3, r3, r7, asr #1
        eor     r4, lr, lr, asr #31
        eor     r2, r3, r3, asr #31
        sub     r4, r4, lr, asr #31
        add     r5, r4, r5
        sub     r2, r2, r3, asr #31
        add     r5, r2, r5
        mov     r2, r1
        ldr     r1, [sp, #8]
        str     r5, [sp]
        add     r0, r1, r0
        bne     LKEE0
        ldr     r4, [sp]
        ldr     lr, [sp, #0xC]
        str     r4, [lr]
        add     sp, sp, #0x80
        ldmia   sp!, {r4 - r11, pc}


