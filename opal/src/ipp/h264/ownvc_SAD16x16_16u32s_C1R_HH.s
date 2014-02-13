        .text
        .align  4
        .globl  ownvc_SAD16x16_16u32s_C1R_HH


ownvc_SAD16x16_16u32s_C1R_HH:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE0
        ldr     r12, [sp, #0x104]
        mov     lr, #0
        mov     r9, r2
        mov     r8, #0x10
        str     lr, [sp]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        str     r1, [sp, #8]
LKEC0:
        ldrh    lr, [r9]
        ldr     r1, [sp, #4]
        ldrh    r12, [r9, #2]
        ldrh    r5, [r9, #4]
        subs    r8, r8, #1
        ldrh    r3, [r9, +r1]
        add     r4, lr, r12
        ldrh    r12, [r0]
        add     r1, r1, r9
        ldrh    lr, [r1, #2]
        ldrh    r2, [r1, #0xA]
        add     r4, r4, r3
        ldrh    r3, [r9, #2]
        ldrh    r7, [r1, #6]
        add     lr, r4, lr
        ldrh    r4, [r1, #2]
        add     r5, r3, r5
        ldrh    r3, [r9, #6]
        add     lr, lr, #2
        sub     lr, r12, lr, asr #2
        ldrh    r12, [r9, #4]
        add     r4, r5, r4
        ldrh    r5, [r1, #4]
        add     r12, r12, r3
        ldrh    r3, [r0, #2]
        add     r4, r4, r5
        ldrh    r5, [r1, #4]
        add     r4, r4, #2
        sub     r3, r3, r4, asr #2
        ldrh    r4, [r9, #6]
        add     r6, r12, r5
        ldrh    r5, [r9, #8]
        ldrh    r12, [r0, #4]
        add     r6, r6, r7
        ldrh    r7, [r1, #8]
        add     r4, r4, r5
        ldrh    r5, [r1, #6]
        add     r6, r6, #2
        sub     r6, r12, r6, asr #2
        ldrh    r12, [r9, #8]
        add     r4, r4, r5
        ldrh    r5, [r9, #0xA]
        add     r4, r4, r7
        add     r7, r4, #2
        ldrh    r4, [r1, #8]
        add     r12, r12, r5
        ldrh    r5, [r0, #6]
        add     r11, r12, r4
        ldrh    r12, [r0, #8]
        ldrh    r4, [r9, #0xC]
        sub     r5, r5, r7, asr #2
        ldrh    r7, [r9, #0xA]
        str     r12, [sp, #0x10]
        ldrh    r12, [r1, #0xA]
        add     r2, r11, r2
        add     r4, r7, r4
        eor     r7, r3, r3, asr #31
        str     r12, [sp, #0x14]
        ldrh    r12, [r9, #0xC]
        add     r2, r2, #2
        str     r12, [sp, #0x18]
        ldrh    r12, [r9, #0xE]
        str     r12, [sp, #0x1C]
        ldrh    r10, [r1, #0xC]
        ldrh    r12, [r1, #0xC]
        str     r10, [sp, #0x20]
        ldrh    r10, [r9, #0xE]
        str     r10, [sp, #0x24]
        ldrh    r10, [r9, #0x10]
        ldr     r11, [sp, #0x24]
        str     r10, [sp, #0x28]
        ldrh    r10, [r1, #0xE]
        str     r10, [sp, #0x2C]
        ldrh    r10, [r1, #0xE]
        str     r10, [sp, #0x30]
        ldrh    r10, [r9, #0x10]
        str     r10, [sp, #0x34]
        ldrh    r10, [r9, #0x12]
        str     r10, [sp, #0x38]
        ldrh    r10, [r0, #0xA]
        str     r10, [sp, #0x3C]
        ldrh    r10, [r0, #0xC]
        str     r10, [sp, #0x40]
        ldrh    r10, [r0, #0xE]
        str     r10, [sp, #0x44]
        ldrh    r10, [r1, #0x10]
        str     r10, [sp, #0x48]
        ldrh    r10, [r0, #0x10]
        str     r10, [sp, #0x4C]
        ldrh    r10, [r1, #0x10]
        str     r10, [sp, #0x50]
        ldrh    r10, [r1, #0x12]
        str     r10, [sp, #0x54]
        ldrh    r10, [r0, #0x12]
        str     r10, [sp, #0x58]
        ldrh    r10, [r9, #0x12]
        str     r10, [sp, #0x5C]
        ldrh    r10, [r9, #0x14]
        str     r10, [sp, #0x60]
        ldrh    r10, [r1, #0x12]
        str     r10, [sp, #0x64]
        ldrh    r10, [r1, #0x14]
        str     r10, [sp, #0x68]
        ldrh    r10, [r0, #0x14]
        str     r10, [sp, #0x6C]
        ldrh    r10, [r9, #0x14]
        str     r10, [sp, #0x70]
        ldrh    r10, [r9, #0x16]
        str     r10, [sp, #0x74]
        ldrh    r10, [r1, #0x14]
        str     r10, [sp, #0x78]
        ldrh    r10, [r1, #0x16]
        str     r10, [sp, #0x7C]
        ldrh    r10, [r0, #0x16]
        str     r10, [sp, #0x80]
        ldrh    r10, [r9, #0x16]
        str     r10, [sp, #0x84]
        ldrh    r10, [r9, #0x18]
        str     r10, [sp, #0x88]
        ldrh    r10, [r1, #0x16]
        str     r10, [sp, #0x8C]
        ldrh    r10, [r1, #0x18]
        str     r10, [sp, #0x90]
        ldrh    r10, [r0, #0x18]
        str     r10, [sp, #0x94]
        ldrh    r10, [r9, #0x18]
        str     r10, [sp, #0x98]
        ldrh    r10, [r9, #0x1A]
        str     r10, [sp, #0x9C]
        ldrh    r10, [r1, #0x18]
        str     r10, [sp, #0xA0]
        ldrh    r10, [r1, #0x1A]
        str     r10, [sp, #0xA4]
        ldrh    r10, [r0, #0x1A]
        str     r10, [sp, #0xA8]
        ldrh    r10, [r9, #0x1A]
        str     r10, [sp, #0xAC]
        ldrh    r10, [r9, #0x1C]
        str     r10, [sp, #0xB0]
        ldrh    r10, [r1, #0x1A]
        str     r10, [sp, #0xB4]
        ldrh    r10, [r1, #0x1C]
        str     r10, [sp, #0xB8]
        ldrh    r10, [r0, #0x1C]
        str     r10, [sp, #0xBC]
        ldrh    r10, [r9, #0x1C]
        str     r10, [sp, #0xC0]
        ldrh    r10, [r9, #0x1E]
        str     r10, [sp, #0xC4]
        ldrh    r10, [r1, #0x1C]
        str     r10, [sp, #0xC8]
        ldrh    r10, [r1, #0x1E]
        str     r10, [sp, #0xCC]
        ldrh    r10, [r0, #0x1E]
        str     r10, [sp, #0xD0]
        ldrh    r10, [r9, #0x1E]
        str     r10, [sp, #0xD4]
        ldrh    r9, [r9, #0x20]
        eor     r10, lr, lr, asr #31
        sub     r10, r10, lr, asr #31
        ldr     lr, [sp, #0x14]
        str     r9, [sp, #0xD8]
        ldrh    r9, [r1, #0x1E]
        add     lr, r4, lr
        ldr     r4, [sp, #0x10]
        add     r12, lr, r12
        ldr     lr, [sp, #0x18]
        str     r9, [sp, #0xDC]
        ldrh    r9, [r1, #0x20]
        sub     r4, r4, r2, asr #2
        ldr     r2, [sp, #0x1C]
        add     r12, r12, #2
        add     r2, lr, r2
        ldr     lr, [sp]
        add     lr, r10, lr
        sub     r10, r7, r3, asr #31
        ldr     r3, [sp, #0x20]
        eor     r7, r6, r6, asr #31
        add     lr, r10, lr
        add     r2, r2, r3
        ldr     r3, [sp, #0x3C]
        sub     r10, r7, r6, asr #31
        ldr     r6, [sp, #0x30]
        eor     r7, r5, r5, asr #31
        sub     r12, r3, r12, asr #2
        ldr     r3, [sp, #0x2C]
        add     lr, r10, lr
        sub     r10, r7, r5, asr #31
        ldr     r5, [sp, #0x50]
        add     r2, r2, r3
        ldr     r3, [sp, #0x28]
        eor     r7, r4, r4, asr #31
        add     r2, r2, #2
        add     lr, r10, lr
        add     r3, r11, r3
        ldr     r11, [sp, #0x34]
        add     r3, r3, r6
        ldr     r6, [sp, #0x40]
        sub     r10, r7, r4, asr #31
        ldr     r4, [sp, #0x64]
        eor     r7, r12, r12, asr #31
        sub     r6, r6, r2, asr #2
        ldr     r2, [sp, #0x48]
        add     lr, r10, lr
        ldr     r10, [sp, #0x78]
        sub     r12, r7, r12, asr #31
        add     r2, r3, r2
        ldr     r3, [sp, #0x38]
        eor     r7, r6, r6, asr #31
        add     r2, r2, #2
        sub     r7, r7, r6, asr #31
        ldr     r6, [sp, #0x8C]
        add     r3, r11, r3
        ldr     r11, [sp, #0x5C]
        add     r3, r3, r5
        ldr     r5, [sp, #0x44]
        add     lr, r12, lr
        add     lr, r7, lr
        ldr     r7, [sp, #0xA0]
        sub     r5, r5, r2, asr #2
        ldr     r2, [sp, #0x54]
        eor     r12, r5, r5, asr #31
        sub     r12, r12, r5, asr #31
        add     lr, r12, lr
        add     r2, r3, r2
        ldr     r3, [sp, #0x60]
        add     r2, r2, #2
        add     r3, r11, r3
        ldr     r11, [sp, #0x70]
        add     r3, r3, r4
        ldr     r4, [sp, #0x4C]
        sub     r4, r4, r2, asr #2
        ldr     r2, [sp, #0x68]
        eor     r5, r4, r4, asr #31
        add     r2, r3, r2
        ldr     r3, [sp, #0x74]
        add     r2, r2, #2
        sub     r5, r5, r4, asr #31
        ldr     r4, [sp, #0xB4]
        add     r3, r11, r3
        ldr     r11, [sp, #0x84]
        add     r10, r3, r10
        ldr     r3, [sp, #0x58]
        add     lr, r5, lr
        ldr     r5, [sp, #0xC8]
        sub     r3, r3, r2, asr #2
        ldr     r2, [sp, #0x7C]
        eor     r12, r3, r3, asr #31
        sub     r12, r12, r3, asr #31
        add     lr, r12, lr
        add     r2, r10, r2
        ldr     r10, [sp, #0x88]
        ldr     r12, [sp, #0xDC]
        add     r2, r2, #2
        add     r10, r11, r10
        add     r6, r10, r6
        ldr     r10, [sp, #0x6C]
        ldr     r11, [sp, #0x98]
        sub     r10, r10, r2, asr #2
        ldr     r2, [sp, #0x90]
        eor     r3, r10, r10, asr #31
        sub     r10, r3, r10, asr #31
        add     lr, r10, lr
        add     r2, r6, r2
        ldr     r6, [sp, #0x9C]
        add     r2, r2, #2
        add     r6, r11, r6
        add     r7, r6, r7
        ldr     r6, [sp, #0x80]
        ldr     r11, [sp, #0xAC]
        sub     r6, r6, r2, asr #2
        ldr     r2, [sp, #0xA4]
        eor     r3, r6, r6, asr #31
        sub     r3, r3, r6, asr #31
        ldr     r6, [sp, #0xBC]
        add     r2, r7, r2
        ldr     r7, [sp, #0xB0]
        add     r2, r2, #2
        add     lr, r3, lr
        ldr     r3, [sp, #0xD0]
        add     r7, r11, r7
        add     r4, r7, r4
        ldr     r7, [sp, #0x94]
        ldr     r11, [sp, #0xC0]
        sub     r7, r7, r2, asr #2
        ldr     r2, [sp, #0xB8]
        add     r2, r4, r2
        ldr     r4, [sp, #0xC4]
        add     r2, r2, #2
        add     r4, r11, r4
        add     r4, r4, r5
        ldr     r5, [sp, #0xA8]
        ldr     r11, [sp, #0xD4]
        sub     r5, r5, r2, asr #2
        ldr     r2, [sp, #0xCC]
        add     r2, r4, r2
        ldr     r4, [sp, #0xD8]
        add     r2, r2, #2
        sub     r2, r6, r2, asr #2
        add     r4, r11, r4
        add     r4, r4, r12
        eor     r12, r7, r7, asr #31
        add     r9, r4, r9
        sub     r7, r12, r7, asr #31
        eor     r12, r5, r5, asr #31
        add     r4, r9, #2
        add     lr, r7, lr
        sub     r12, r12, r5, asr #31
        sub     r3, r3, r4, asr #2
        add     lr, r12, lr
        eor     r4, r2, r2, asr #31
        eor     r12, r3, r3, asr #31
        sub     r4, r4, r2, asr #31
        add     lr, r4, lr
        mov     r9, r1
        ldr     r1, [sp, #8]
        sub     r12, r12, r3, asr #31
        add     lr, r12, lr
        str     lr, [sp]
        add     r0, r1, r0
        bne     LKEC0
        ldr     lr, [sp]
        ldr     r12, [sp, #0xC]
        str     lr, [r12]
        add     sp, sp, #0xE0
        ldmia   sp!, {r4 - r11, pc}


