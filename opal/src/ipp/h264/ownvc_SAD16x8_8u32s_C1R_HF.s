        .text
        .align  4
        .globl  ownvc_SAD16x8_8u32s_C1R_HF


ownvc_SAD16x8_8u32s_C1R_HF:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r12, [sp, #0x8C]
        mov     r4, #0
        mov     lr, #8
        str     lr, [sp, #4]
        str     r4, [sp]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r1, [sp, #8]
LKDV0:
        ldr     r3, [sp, #4]
        ldrb    lr, [r2, #1]
        ldrb    r4, [r2]
        ldrb    r1, [r2, #2]
        ldrb    r12, [r2, #3]
        subs    r3, r3, #1
        str     r3, [sp, #4]
        ldrb    r3, [r0]
        add     r5, r4, lr
        ldrb    r4, [r2, #4]
        add     r5, r5, #1
        sub     r3, r3, r5, asr #1
        ldrb    r5, [r0, #1]
        add     lr, lr, r1
        add     lr, lr, #1
        add     r1, r1, r12
        sub     r10, r5, lr, asr #1
        ldrb    lr, [r2, #5]
        add     r12, r12, r4
        add     r1, r1, #1
        add     r12, r12, #1
        str     r12, [sp, #0x14]
        add     r4, r4, lr
        add     r12, r4, #1
        str     r12, [sp, #0x18]
        ldrb    r12, [r0, #2]
        ldrb    r9, [r0, #3]
        ldrb    r4, [r2, #7]
        sub     r12, r12, r1, asr #1
        ldrb    r1, [r2, #6]
        ldrb    r5, [r0, #4]
        str     r5, [sp, #0x1C]
        ldrb    r5, [r2, #8]
        add     lr, lr, r1
        add     r1, r1, r4
        str     r5, [sp, #0x20]
        ldrb    r7, [r2, #0xB]
        ldrb    r5, [r2, #9]
        ldrb    r6, [r2, #0xA]
        str     r7, [sp, #0x24]
        ldrb    r8, [r0, #5]
        ldrb    r7, [r2, #0xC]
        add     r1, r1, #1
        str     r8, [sp, #0x28]
        ldrb    r8, [r0, #6]
        str     r8, [sp, #0x2C]
        ldrb    r8, [r0, #7]
        str     r8, [sp, #0x30]
        ldrb    r8, [r0, #8]
        str     r8, [sp, #0x34]
        ldrb    r8, [r0, #9]
        str     r8, [sp, #0x38]
        ldrb    r8, [r0, #0xA]
        str     r8, [sp, #0x3C]
        ldrb    r8, [r0, #0xB]
        str     r8, [sp, #0x40]
        ldrb    r11, [r0, #0xC]
        ldrb    r8, [r2, #0xD]
        str     r11, [sp, #0x44]
        ldrb    r11, [r2, #0xE]
        str     r11, [sp, #0x48]
        ldrb    r11, [r0, #0xD]
        str     r11, [sp, #0x4C]
        ldrb    r11, [r2, #0xF]
        str     r11, [sp, #0x50]
        ldrb    r11, [r0, #0xE]
        str     r11, [sp, #0x54]
        ldrb    r11, [r0, #0xF]
        str     r11, [sp, #0x58]
        ldrb    r11, [r2, #0x10]
        str     r11, [sp, #0x5C]
        eor     r11, r3, r3, asr #31
        str     r11, [sp, #0x60]
        eor     r11, r10, r10, asr #31
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x14]
        sub     r9, r9, r11, asr #1
        ldr     r11, [sp, #0x60]
        sub     r3, r11, r3, asr #31
        ldr     r11, [sp]
        add     r11, r3, r11
        ldr     r3, [sp, #0x64]
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x18]
        sub     r10, r3, r10, asr #31
        eor     r3, r12, r12, asr #31
        str     r3, [sp, #0x64]
        ldr     r3, [sp, #0x1C]
        sub     r3, r3, r11, asr #1
        add     r11, lr, #1
        ldr     lr, [sp, #0x60]
        add     lr, r10, lr
        str     lr, [sp, #0x60]
        ldr     lr, [sp, #0x64]
        eor     r10, r9, r9, asr #31
        sub     lr, lr, r12, asr #31
        ldr     r12, [sp, #0x28]
        sub     r9, r10, r9, asr #31
        eor     r10, r3, r3, asr #31
        sub     r12, r12, r11, asr #1
        ldr     r11, [sp, #0x60]
        sub     r10, r10, r3, asr #31
        ldr     r3, [sp, #0x30]
        add     lr, lr, r11
        ldr     r11, [sp, #0x2C]
        add     lr, r9, lr
        eor     r9, r12, r12, asr #31
        add     lr, r10, lr
        ldr     r10, [sp, #0x34]
        sub     r1, r11, r1, asr #1
        ldr     r11, [sp, #0x20]
        sub     r9, r9, r12, asr #31
        eor     r12, r1, r1, asr #31
        add     lr, r9, lr
        add     r11, r4, r11
        add     r4, r11, #1
        sub     r4, r3, r4, asr #1
        ldr     r3, [sp, #0x20]
        sub     r9, r12, r1, asr #31
        ldr     r1, [sp, #0x38]
        add     r3, r3, r5
        add     r5, r5, r6
        add     r5, r5, #1
        sub     r5, r1, r5, asr #1
        ldr     r1, [sp, #0x24]
        eor     r12, r4, r4, asr #31
        add     r3, r3, #1
        add     r1, r6, r1
        sub     r6, r12, r4, asr #31
        ldr     r12, [sp, #0x3C]
        add     r1, r1, #1
        add     lr, r9, lr
        sub     r3, r10, r3, asr #1
        sub     r1, r12, r1, asr #1
        ldr     r12, [sp, #0x24]
        eor     r4, r3, r3, asr #31
        add     lr, r6, lr
        sub     r6, r4, r3, asr #31
        ldr     r3, [sp, #0x40]
        add     r12, r12, r7
        eor     r4, r5, r5, asr #31
        add     r12, r12, #1
        add     lr, r6, lr
        ldr     r6, [sp, #0x44]
        sub     r3, r3, r12, asr #1
        add     r7, r7, r8
        add     r12, r7, #1
        sub     r5, r4, r5, asr #31
        ldr     r7, [sp, #0x48]
        eor     r4, r1, r1, asr #31
        sub     r12, r6, r12, asr #1
        ldr     r6, [sp, #0x48]
        add     lr, r5, lr
        sub     r5, r4, r1, asr #31
        ldr     r1, [sp, #0x4C]
        add     r6, r8, r6
        add     r6, r6, #1
        add     lr, r5, lr
        eor     r4, r3, r3, asr #31
        sub     r1, r1, r6, asr #1
        ldr     r6, [sp, #0x50]
        sub     r5, r4, r3, asr #31
        ldr     r3, [sp, #0x54]
        eor     r4, r12, r12, asr #31
        add     r6, r7, r6
        ldr     r7, [sp, #0x50]
        add     r6, r6, #1
        sub     r3, r3, r6, asr #1
        ldr     r6, [sp, #0x5C]
        add     lr, r5, lr
        sub     r5, r4, r12, asr #31
        ldr     r12, [sp, #0x58]
        eor     r4, r1, r1, asr #31
        add     r6, r7, r6
        sub     r1, r4, r1, asr #31
        add     lr, r5, lr
        add     r6, r6, #1
        add     lr, r1, lr
        sub     r12, r12, r6, asr #1
        eor     r4, r3, r3, asr #31
        eor     r1, r12, r12, asr #31
        sub     r4, r4, r3, asr #31
        add     lr, r4, lr
        sub     r1, r1, r12, asr #31
        add     lr, r1, lr
        ldr     r1, [sp, #0xC]
        str     lr, [sp]
        add     r2, r2, r1
        ldr     r1, [sp, #8]
        add     r0, r0, r1
        ldr     r1, [sp, #4]
        bne     LKDV0
        ldr     r4, [sp]
        ldr     r12, [sp, #0x10]
        str     r4, [r12]
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}


