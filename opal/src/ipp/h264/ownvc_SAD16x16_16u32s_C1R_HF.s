        .text
        .align  4
        .globl  ownvc_SAD16x16_16u32s_C1R_HF


ownvc_SAD16x16_16u32s_C1R_HF:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7C
        ldr     r12, [sp, #0xA0]
        mov     r4, #0
        mov     lr, #0x10
        str     r4, [sp]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LKED0:
        ldrh    r4, [r2]
        ldrh    r12, [r2, #2]
        ldrh    r3, [r0]
        ldrh    r11, [r2, #0xC]
        ldrh    r1, [r2, #2]
        add     r4, r4, r12
        ldrh    r12, [r2, #4]
        add     r4, r4, #1
        ldrh    r5, [r2, #0xE]
        sub     r8, r3, r4, asr #1
        ldrh    r3, [r0, #2]
        add     r4, r1, r12
        ldrh    r12, [r2, #4]
        ldrh    r1, [r2, #6]
        add     r4, r4, #1
        sub     r9, r3, r4, asr #1
        add     r4, r12, r1
        ldrh    r1, [r0, #4]
        ldrh    r12, [r2, #6]
        ldrh    r3, [r2, #8]
        add     r4, r4, #1
        sub     r6, r1, r4, asr #1
        ldrh    r1, [r0, #6]
        ldrh    r4, [r2, #0xA]
        add     r12, r12, r3
        ldrh    r3, [r2, #8]
        ldrh    r7, [r2, #0xE]
        add     r12, r12, #1
        sub     r1, r1, r12, asr #1
        ldrh    r12, [r0, #8]
        add     r4, r3, r4
        add     r3, r4, #1
        ldrh    r4, [r2, #0xA]
        sub     r3, r12, r3, asr #1
        ldrh    r12, [r2, #0xC]
        add     r7, r11, r7
        subs    lr, lr, #1
        add     r7, r7, #1
        add     r12, r4, r12
        ldrh    r4, [r0, #0xA]
        add     r12, r12, #1
        sub     r12, r4, r12, asr #1
        ldrh    r4, [r0, #0xC]
        str     r5, [sp, #0x10]
        ldrh    r5, [r2, #0x10]
        sub     r4, r4, r7, asr #1
        ldr     r7, [sp, #0x10]
        str     r5, [sp, #0x14]
        ldrh    r5, [r0, #0xE]
        str     r5, [sp, #0x18]
        ldrh    r5, [r0, #0x10]
        str     r5, [sp, #0x1C]
        ldrh    r5, [r2, #0x10]
        str     r5, [sp, #0x20]
        ldrh    r5, [r2, #0x12]
        str     r5, [sp, #0x24]
        ldrh    r5, [r0, #0x12]
        str     r5, [sp, #0x28]
        ldrh    r5, [r2, #0x12]
        str     r5, [sp, #0x2C]
        ldrh    r5, [r2, #0x14]
        str     r5, [sp, #0x30]
        ldrh    r5, [r0, #0x14]
        str     r5, [sp, #0x34]
        ldrh    r5, [r2, #0x14]
        str     r5, [sp, #0x38]
        ldrh    r5, [r2, #0x16]
        str     r5, [sp, #0x3C]
        ldrh    r5, [r0, #0x16]
        str     r5, [sp, #0x40]
        ldrh    r5, [r2, #0x16]
        str     r5, [sp, #0x44]
        ldrh    r5, [r2, #0x18]
        str     r5, [sp, #0x48]
        ldrh    r5, [r0, #0x18]
        str     r5, [sp, #0x4C]
        ldrh    r5, [r2, #0x18]
        str     r5, [sp, #0x50]
        ldrh    r5, [r2, #0x1A]
        str     r5, [sp, #0x54]
        ldrh    r5, [r0, #0x1A]
        str     r5, [sp, #0x58]
        ldrh    r5, [r2, #0x1A]
        str     r5, [sp, #0x5C]
        ldrh    r5, [r2, #0x1C]
        str     r5, [sp, #0x60]
        ldrh    r5, [r0, #0x1C]
        str     r5, [sp, #0x64]
        ldrh    r5, [r2, #0x1C]
        ldrh    r10, [r2, #0x1E]
        str     r10, [sp, #0x68]
        ldrh    r10, [r0, #0x1E]
        str     r10, [sp, #0x6C]
        ldrh    r10, [r2, #0x1E]
        str     r10, [sp, #0x70]
        ldrh    r10, [r2, #0x20]
        str     r10, [sp, #0x74]
        eor     r10, r8, r8, asr #31
        str     r10, [sp, #0x78]
        ldr     r11, [sp, #0x78]
        eor     r10, r9, r9, asr #31
        sub     r8, r11, r8, asr #31
        ldr     r11, [sp]
        sub     r9, r10, r9, asr #31
        eor     r10, r6, r6, asr #31
        add     r8, r8, r11
        add     r9, r9, r8
        eor     r8, r1, r1, asr #31
        sub     r10, r10, r6, asr #31
        add     r6, r10, r9
        sub     r9, r8, r1, asr #31
        ldr     r1, [sp, #0x14]
        eor     r8, r3, r3, asr #31
        add     r6, r9, r6
        ldr     r9, [sp, #0x20]
        add     r1, r7, r1
        add     r1, r1, #1
        sub     r8, r8, r3, asr #31
        ldr     r3, [sp, #0x18]
        eor     r7, r12, r12, asr #31
        add     r6, r8, r6
        sub     r8, r7, r12, asr #31
        sub     r3, r3, r1, asr #1
        ldr     r1, [sp, #0x24]
        ldr     r12, [sp, #0x1C]
        eor     r7, r4, r4, asr #31
        add     r6, r8, r6
        add     r1, r9, r1
        add     r1, r1, #1
        sub     r1, r12, r1, asr #1
        ldr     r12, [sp, #0x30]
        ldr     r9, [sp, #0x2C]
        sub     r8, r7, r4, asr #31
        ldr     r4, [sp, #0x28]
        eor     r7, r3, r3, asr #31
        add     r12, r9, r12
        add     r12, r12, #1
        sub     r12, r4, r12, asr #1
        ldr     r4, [sp, #0x3C]
        ldr     r9, [sp, #0x38]
        add     r6, r8, r6
        sub     r8, r7, r3, asr #31
        ldr     r3, [sp, #0x34]
        add     r4, r9, r4
        add     r4, r4, #1
        ldr     r9, [sp, #0x44]
        sub     r3, r3, r4, asr #1
        ldr     r4, [sp, #0x48]
        eor     r7, r1, r1, asr #31
        add     r6, r8, r6
        sub     r8, r7, r1, asr #31
        ldr     r1, [sp, #0x40]
        add     r4, r9, r4
        add     r4, r4, #1
        ldr     r9, [sp, #0x50]
        sub     r1, r1, r4, asr #1
        ldr     r4, [sp, #0x54]
        eor     r7, r12, r12, asr #31
        add     r6, r8, r6
        sub     r8, r7, r12, asr #31
        ldr     r12, [sp, #0x4C]
        add     r4, r9, r4
        add     r4, r4, #1
        ldr     r9, [sp, #0x5C]
        sub     r12, r12, r4, asr #1
        ldr     r4, [sp, #0x60]
        eor     r7, r3, r3, asr #31
        add     r6, r8, r6
        sub     r8, r7, r3, asr #31
        ldr     r3, [sp, #0x58]
        add     r4, r9, r4
        add     r4, r4, #1
        eor     r7, r1, r1, asr #31
        sub     r3, r3, r4, asr #1
        ldr     r4, [sp, #0x68]
        add     r6, r8, r6
        ldr     r8, [sp, #0x70]
        sub     r7, r7, r1, asr #31
        add     r4, r5, r4
        add     r5, r4, #1
        ldr     r1, [sp, #0x64]
        eor     r4, r12, r12, asr #31
        add     r6, r7, r6
        sub     r7, r4, r12, asr #31
        eor     r4, r3, r3, asr #31
        sub     r1, r1, r5, asr #1
        ldr     r5, [sp, #0x74]
        ldr     r12, [sp, #0x6C]
        sub     r3, r4, r3, asr #31
        eor     r4, r1, r1, asr #31
        add     r6, r7, r6
        add     r5, r8, r5
        add     r6, r3, r6
        sub     r4, r4, r1, asr #31
        ldr     r1, [sp, #8]
        add     r5, r5, #1
        sub     r12, r12, r5, asr #1
        add     r6, r4, r6
        add     r2, r1, r2
        ldr     r1, [sp, #4]
        eor     r3, r12, r12, asr #31
        sub     r3, r3, r12, asr #31
        add     r6, r3, r6
        str     r6, [sp]
        add     r0, r1, r0
        bne     LKED0
        ldr     r4, [sp]
        ldr     r12, [sp, #0xC]
        str     r4, [r12]
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}


