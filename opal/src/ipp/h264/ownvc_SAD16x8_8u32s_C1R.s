        .text
        .align  4
        .globl  ownvc_SAD16x8_8u32s_C1R


ownvc_SAD16x8_8u32s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     lr, [sp, #0x7C]
        mov     r4, #0
        mov     r12, #8
        str     r4, [sp]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LKDX0:
        ldrb    r3, [r0]
        ldrb    lr, [r2]
        ldrb    r10, [r0, #6]
        ldrb    r1, [r0, #1]
        ldrb    r4, [r2, #1]
        sub     r9, r3, lr
        ldrb    r3, [r0, #2]
        ldrb    lr, [r2, #2]
        sub     r5, r1, r4
        ldrb    r1, [r0, #3]
        ldrb    r4, [r2, #3]
        sub     r6, r3, lr
        ldrb    r3, [r0, #4]
        ldrb    lr, [r2, #4]
        sub     r8, r1, r4
        ldrb    r1, [r0, #5]
        sub     r7, r3, lr
        ldrb    r3, [r2, #5]
        ldrb    lr, [r0, #7]
        subs    r12, r12, #1
        eor     r11, r9, r9, asr #31
        sub     r1, r1, r3
        ldrb    r3, [r2, #6]
        str     lr, [sp, #0x10]
        ldrb    lr, [r2, #7]
        sub     r3, r10, r3
        str     lr, [sp, #0x14]
        ldrb    lr, [r0, #8]
        str     lr, [sp, #0x18]
        ldrb    lr, [r2, #8]
        str     lr, [sp, #0x1C]
        ldrb    lr, [r0, #9]
        str     lr, [sp, #0x20]
        ldrb    lr, [r2, #9]
        str     lr, [sp, #0x24]
        ldrb    lr, [r0, #0xA]
        str     lr, [sp, #0x28]
        ldrb    lr, [r2, #0xA]
        str     lr, [sp, #0x2C]
        ldrb    lr, [r0, #0xB]
        str     lr, [sp, #0x30]
        ldrb    lr, [r2, #0xB]
        str     lr, [sp, #0x34]
        ldrb    lr, [r0, #0xC]
        str     lr, [sp, #0x38]
        ldrb    lr, [r2, #0xC]
        str     lr, [sp, #0x3C]
        ldrb    lr, [r0, #0xD]
        str     lr, [sp, #0x40]
        ldrb    lr, [r2, #0xD]
        str     lr, [sp, #0x44]
        ldrb    lr, [r0, #0xE]
        str     lr, [sp, #0x48]
        ldrb    lr, [r2, #0xE]
        str     lr, [sp, #0x4C]
        ldrb    r4, [r0, #0xF]
        ldrb    lr, [r2, #0xF]
        str     r11, [sp, #0x50]
        ldr     r10, [sp, #0x50]
        eor     r11, r5, r5, asr #31
        str     r11, [sp, #0x54]
        sub     r4, r4, lr
        sub     r9, r10, r9, asr #31
        ldr     r10, [sp]
        add     r9, r9, r10
        ldr     r10, [sp, #0x54]
        sub     r10, r10, r5, asr #31
        eor     r5, r6, r6, asr #31
        add     r10, r10, r9
        eor     r9, r8, r8, asr #31
        sub     r5, r5, r6, asr #31
        add     r10, r5, r10
        sub     r9, r9, r8, asr #31
        eor     r5, r7, r7, asr #31
        add     r8, r9, r10
        sub     r7, r5, r7, asr #31
        ldr     r9, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        add     r8, r7, r8
        eor     r6, r1, r1, asr #31
        sub     r7, r6, r1, asr #31
        ldr     r1, [sp, #0x18]
        sub     r5, r5, r9
        ldr     r9, [sp, #0x1C]
        add     r8, r7, r8
        eor     r6, r3, r3, asr #31
        sub     r7, r6, r3, asr #31
        ldr     r3, [sp, #0x20]
        sub     r1, r1, r9
        ldr     r9, [sp, #0x24]
        add     r8, r7, r8
        eor     r6, r5, r5, asr #31
        sub     r7, r6, r5, asr #31
        ldr     r5, [sp, #0x28]
        sub     r3, r3, r9
        ldr     r9, [sp, #0x2C]
        add     r8, r7, r8
        eor     r6, r1, r1, asr #31
        sub     r7, r6, r1, asr #31
        ldr     r1, [sp, #0x30]
        sub     r5, r5, r9
        ldr     r9, [sp, #0x34]
        add     r8, r7, r8
        eor     r6, r3, r3, asr #31
        sub     r7, r6, r3, asr #31
        ldr     r3, [sp, #0x38]
        sub     r1, r1, r9
        ldr     r9, [sp, #0x3C]
        add     r8, r7, r8
        eor     r6, r5, r5, asr #31
        sub     r7, r6, r5, asr #31
        ldr     r5, [sp, #0x40]
        sub     r3, r3, r9
        ldr     r9, [sp, #0x44]
        eor     r6, r1, r1, asr #31
        add     r8, r7, r8
        sub     r7, r6, r1, asr #31
        ldr     r1, [sp, #0x48]
        sub     r5, r5, r9
        ldr     r9, [sp, #0x4C]
        eor     r6, r3, r3, asr #31
        add     r8, r7, r8
        sub     r6, r6, r3, asr #31
        sub     r1, r1, r9
        eor     r3, r5, r5, asr #31
        add     r8, r6, r8
        eor     lr, r1, r1, asr #31
        sub     r3, r3, r5, asr #31
        add     r8, r3, r8
        sub     lr, lr, r1, asr #31
        ldr     r1, [sp, #8]
        eor     r3, r4, r4, asr #31
        add     r8, lr, r8
        sub     r3, r3, r4, asr #31
        add     r2, r2, r1
        ldr     r1, [sp, #4]
        add     r8, r3, r8
        str     r8, [sp]
        add     r0, r0, r1
        bne     LKDX0
        ldr     r4, [sp]
        ldr     lr, [sp, #0xC]
        str     r4, [lr]
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}


