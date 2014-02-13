        .text
        .align  4
        .globl  ownvc_SAD8x8_16u32s_C1R_HH


ownvc_SAD8x8_16u32s_C1R_HH:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r12, [sp, #0x64]
        mov     lr, #0
        mov     r5, #8
        str     lr, [sp]
        str     r12, [sp, #0xC]
        str     r3, [sp, #4]
        str     r1, [sp, #8]
LKDM0:
        ldrh    r12, [r2, #2]
        ldr     r1, [sp, #4]
        ldrh    lr, [r2]
        subs    r5, r5, #1
        ldrh    r3, [r2, +r1]
        add     r4, lr, r12
        ldrh    r12, [r0]
        add     r1, r1, r2
        ldrh    lr, [r1, #2]
        add     r4, r4, r3
        ldrh    r3, [r2, #2]
        ldrh    r8, [r1, #6]
        add     lr, r4, lr
        ldrh    r4, [r2, #4]
        add     lr, lr, #2
        sub     r6, r12, lr, asr #2
        ldrh    lr, [r1, #2]
        add     r4, r3, r4
        ldrh    r12, [r2, #4]
        ldrh    r3, [r2, #6]
        add     lr, r4, lr
        ldrh    r4, [r1, #4]
        add     r12, r12, r3
        ldrh    r3, [r0, #2]
        add     lr, lr, r4
        ldrh    r4, [r1, #4]
        add     lr, lr, #2
        sub     r3, r3, lr, asr #2
        ldrh    lr, [r2, #6]
        add     r7, r12, r4
        ldrh    r4, [r2, #8]
        ldrh    r12, [r0, #4]
        add     r8, r7, r8
        ldrh    r7, [r1, #6]
        add     r8, r8, #2
        add     r4, lr, r4
        sub     lr, r12, r8, asr #2
        ldrh    r8, [r1, #8]
        ldrh    r12, [r2, #8]
        add     r7, r4, r7
        ldrh    r4, [r2, #0xA]
        add     r7, r7, r8
        add     r8, r7, #2
        ldrh    r7, [r1, #8]
        add     r4, r12, r4
        ldrh    r12, [r0, #6]
        add     r4, r4, r7
        sub     r12, r12, r8, asr #2
        ldrh    r8, [r2, #0xA]
        str     r8, [sp, #0x10]
        ldrh    r11, [r1, #0xA]
        ldrh    r7, [r0, #8]
        ldrh    r10, [r2, #0xC]
        add     r4, r4, r11
        ldr     r11, [sp, #0x10]
        str     r7, [sp, #0x14]
        ldrh    r7, [r1, #0xA]
        add     r4, r4, #2
        add     r10, r11, r10
        str     r7, [sp, #0x18]
        ldrh    r7, [r2, #0xC]
        ldr     r11, [sp, #0x18]
        str     r7, [sp, #0x1C]
        ldrh    r7, [r2, #0xE]
        add     r10, r10, r11
        ldr     r11, [sp, #0x14]
        str     r7, [sp, #0x20]
        ldrh    r9, [r1, #0xC]
        ldrh    r7, [r1, #0xC]
        sub     r4, r11, r4, asr #2
        ldr     r11, [sp, #0x1C]
        str     r7, [sp, #0x24]
        ldrh    r7, [r2, #0xE]
        add     r9, r10, r9
        ldr     r10, [sp, #0x20]
        add     r9, r9, #2
        str     r7, [sp, #0x28]
        ldrh    r2, [r2, #0x10]
        add     r10, r11, r10
        ldr     r11, [sp]
        str     r2, [sp, #0x2C]
        ldrh    r2, [r1, #0xE]
        ldrh    r7, [r1, #0xE]
        str     r2, [sp, #0x30]
        ldrh    r2, [r0, #0xC]
        ldrh    r8, [r0, #0xA]
        str     r2, [sp, #0x34]
        ldrh    r2, [r0, #0xE]
        sub     r8, r8, r9, asr #2
        str     r2, [sp, #0x38]
        ldrh    r2, [r1, #0x10]
        str     r2, [sp, #0x3C]
        eor     r2, r6, r6, asr #31
        sub     r2, r2, r6, asr #31
        eor     r6, r3, r3, asr #31
        add     r2, r2, r11
        sub     r6, r6, r3, asr #31
        ldr     r11, [sp, #0x24]
        eor     r3, lr, lr, asr #31
        add     r6, r6, r2
        add     r10, r10, r11
        sub     lr, r3, lr, asr #31
        add     r9, r10, r7
        ldr     r10, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        eor     r3, r12, r12, asr #31
        add     r6, lr, r6
        ldr     lr, [sp, #0x34]
        add     r2, r9, #2
        ldr     r9, [sp, #0x30]
        sub     r3, r3, r12, asr #31
        sub     r2, lr, r2, asr #2
        ldr     lr, [sp, #0x3C]
        add     r7, r10, r7
        eor     r12, r4, r4, asr #31
        add     r6, r3, r6
        ldr     r3, [sp, #0x38]
        add     r7, r7, r9
        add     lr, r7, lr
        add     lr, lr, #2
        sub     r4, r12, r4, asr #31
        eor     r12, r8, r8, asr #31
        sub     r3, r3, lr, asr #2
        add     r6, r4, r6
        sub     r12, r12, r8, asr #31
        eor     lr, r2, r2, asr #31
        add     r6, r12, r6
        sub     lr, lr, r2, asr #31
        eor     r12, r3, r3, asr #31
        add     r6, lr, r6
        mov     r2, r1
        ldr     r1, [sp, #8]
        sub     r12, r12, r3, asr #31
        add     r6, r12, r6
        str     r6, [sp]
        add     r0, r1, r0
        bne     LKDM0
        ldr     lr, [sp]
        ldr     r12, [sp, #0xC]
        str     lr, [r12]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


