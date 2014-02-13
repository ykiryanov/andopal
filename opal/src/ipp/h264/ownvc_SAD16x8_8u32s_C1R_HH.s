        .text
        .align  4
        .globl  ownvc_SAD16x8_8u32s_C1R_HH


ownvc_SAD16x8_8u32s_C1R_HH:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x9C
        ldr     r12, [sp, #0xC0]
        mov     lr, #0
        mov     r8, #8
        str     lr, [sp]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LKDU0:
        ldrb    r1, [r2, #1]
        ldr     r3, [sp, #8]
        mov     r6, r2
        ldrb    r7, [r6]
        ldrb    r4, [r6, #2]
        ldrb    r12, [r6, #3]
        add     r2, r2, r3
        ldrb    r3, [r2, #1]
        ldrb    r5, [r2, #2]
        ldrb    lr, [r2]
        add     r7, r7, r1
        add     r1, r1, r4
        add     r1, r1, r3
        add     r4, r4, r12
        add     r1, r1, r5
        add     lr, r7, lr
        ldrb    r7, [r2, #3]
        add     r1, r1, #2
        add     r5, r4, r5
        ldrb    r4, [r0]
        add     lr, lr, r3
        ldrb    r3, [r6, #4]
        add     lr, lr, #2
        sub     r4, r4, lr, asr #2
        ldrb    lr, [r2, #4]
        add     r12, r12, r3
        add     r12, r12, r7
        add     r5, r5, r7
        ldrb    r7, [r6, #5]
        add     r5, r5, #2
        add     r12, r12, lr
        add     r12, r12, #2
        str     r12, [sp, #0x10]
        ldrb    r12, [r0, #1]
        add     r3, r3, r7
        add     lr, r3, lr
        str     lr, [sp, #0x14]
        sub     r12, r12, r1, asr #2
        ldrb    lr, [r6, #6]
        ldrb    r10, [r2, #5]
        ldrb    r1, [r0, #2]
        subs    r8, r8, #1
        add     r7, r7, lr
        str     r1, [sp, #0x18]
        ldrb    r3, [r6, #7]
        ldrb    r9, [r0, #3]
        ldrb    r1, [r2, #6]
        str     r9, [sp, #0x1C]
        ldrb    r9, [r2, #7]
        str     r9, [sp, #0x20]
        ldrb    r9, [r6, #8]
        str     r9, [sp, #0x24]
        ldrb    r9, [r0, #4]
        str     r9, [sp, #0x28]
        ldrb    r9, [r2, #8]
        str     r9, [sp, #0x2C]
        ldrb    r9, [r6, #9]
        str     r9, [sp, #0x30]
        ldrb    r9, [r2, #9]
        str     r9, [sp, #0x34]
        ldrb    r9, [r6, #0xA]
        str     r9, [sp, #0x38]
        ldrb    r9, [r2, #0xA]
        str     r9, [sp, #0x3C]
        ldrb    r9, [r6, #0xB]
        str     r9, [sp, #0x40]
        ldrb    r9, [r2, #0xB]
        str     r9, [sp, #0x44]
        ldrb    r9, [r6, #0xC]
        str     r9, [sp, #0x48]
        ldrb    r9, [r0, #5]
        str     r9, [sp, #0x4C]
        ldrb    r9, [r0, #6]
        str     r9, [sp, #0x50]
        ldrb    r9, [r0, #7]
        str     r9, [sp, #0x54]
        ldrb    r9, [r0, #8]
        str     r9, [sp, #0x58]
        ldrb    r9, [r0, #9]
        str     r9, [sp, #0x5C]
        ldrb    r9, [r0, #0xA]
        str     r9, [sp, #0x60]
        ldrb    r9, [r2, #0xC]
        str     r9, [sp, #0x64]
        ldrb    r9, [r0, #0xB]
        str     r9, [sp, #0x68]
        ldrb    r9, [r6, #0xD]
        str     r9, [sp, #0x6C]
        ldrb    r9, [r2, #0xD]
        str     r9, [sp, #0x70]
        ldrb    r9, [r0, #0xC]
        str     r9, [sp, #0x74]
        ldrb    r9, [r6, #0xE]
        str     r9, [sp, #0x78]
        ldrb    r9, [r2, #0xE]
        str     r9, [sp, #0x7C]
        ldrb    r9, [r0, #0xD]
        str     r9, [sp, #0x80]
        ldrb    r11, [r2, #0xF]
        ldrb    r9, [r6, #0xF]
        str     r11, [sp, #0x84]
        ldrb    r11, [r0, #0xE]
        str     r11, [sp, #0x88]
        ldrb    r11, [r0, #0xF]
        str     r11, [sp, #0x8C]
        ldrb    r6, [r6, #0x10]
        ldr     r11, [sp, #0x10]
        str     r6, [sp, #0x90]
        ldrb    r6, [r2, #0x10]
        str     r6, [sp, #0x94]
        eor     r6, r4, r4, asr #31
        str     r6, [sp, #0x98]
        ldr     r6, [sp, #0x18]
        sub     r6, r6, r5, asr #2
        ldr     r5, [sp, #0x1C]
        sub     r5, r5, r11, asr #2
        ldr     r11, [sp, #0x14]
        add     r11, r11, r10
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x98]
        add     r10, r7, r10
        ldr     r7, [sp, #0x28]
        sub     r11, r11, r4, asr #31
        eor     r4, r12, r12, asr #31
        str     r4, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        str     r11, [sp, #0x98]
        add     r10, r10, r1
        add     r4, r4, #2
        sub     r4, r7, r4, asr #2
        ldr     r7, [sp, #0x98]
        add     r11, lr, r3
        ldr     lr, [sp]
        add     r10, r10, #2
        add     r1, r11, r1
        ldr     r11, [sp, #0x24]
        add     lr, r7, lr
        str     lr, [sp, #0x98]
        ldr     lr, [sp, #0x18]
        eor     r7, r6, r6, asr #31
        sub     lr, lr, r12, asr #31
        ldr     r12, [sp, #0x4C]
        sub     r12, r12, r10, asr #2
        ldr     r10, [sp, #0x20]
        add     r1, r1, r10
        ldr     r10, [sp, #0x24]
        add     r1, r1, #2
        add     r3, r3, r10
        ldr     r10, [sp, #0x98]
        add     lr, lr, r10
        sub     r10, r7, r6, asr #31
        ldr     r6, [sp, #0x20]
        eor     r7, r5, r5, asr #31
        add     lr, r10, lr
        add     r3, r3, r6
        ldr     r6, [sp, #0x50]
        sub     r10, r7, r5, asr #31
        ldr     r5, [sp, #0x2C]
        add     lr, r10, lr
        sub     r6, r6, r1, asr #2
        ldr     r1, [sp, #0x2C]
        eor     r7, r4, r4, asr #31
        sub     r10, r7, r4, asr #31
        ldr     r4, [sp, #0x34]
        add     r1, r3, r1
        ldr     r3, [sp, #0x30]
        add     r1, r1, #2
        eor     r7, r12, r12, asr #31
        add     lr, r10, lr
        ldr     r10, [sp, #0x3C]
        add     r3, r11, r3
        ldr     r11, [sp, #0x30]
        add     r3, r3, r5
        ldr     r5, [sp, #0x54]
        sub     r12, r7, r12, asr #31
        eor     r7, r6, r6, asr #31
        add     lr, r12, lr
        sub     r5, r5, r1, asr #2
        ldr     r1, [sp, #0x34]
        sub     r7, r7, r6, asr #31
        ldr     r6, [sp, #0x44]
        eor     r12, r5, r5, asr #31
        add     r1, r3, r1
        ldr     r3, [sp, #0x38]
        add     r1, r1, #2
        add     lr, r7, lr
        ldr     r7, [sp, #0x64]
        add     r3, r11, r3
        ldr     r11, [sp, #0x38]
        add     r3, r3, r4
        ldr     r4, [sp, #0x58]
        sub     r12, r12, r5, asr #31
        add     lr, r12, lr
        sub     r4, r4, r1, asr #2
        ldr     r1, [sp, #0x3C]
        eor     r5, r4, r4, asr #31
        sub     r5, r5, r4, asr #31
        ldr     r4, [sp, #0x70]
        add     r1, r3, r1
        ldr     r3, [sp, #0x40]
        add     r1, r1, #2
        add     lr, r5, lr
        ldr     r5, [sp, #0x7C]
        add     r3, r11, r3
        add     r10, r3, r10
        ldr     r3, [sp, #0x5C]
        ldr     r11, [sp, #0x40]
        sub     r3, r3, r1, asr #2
        ldr     r1, [sp, #0x44]
        eor     r12, r3, r3, asr #31
        sub     r12, r12, r3, asr #31
        add     lr, r12, lr
        add     r1, r10, r1
        ldr     r10, [sp, #0x48]
        ldr     r12, [sp, #0x84]
        add     r1, r1, #2
        add     r10, r11, r10
        add     r6, r10, r6
        ldr     r10, [sp, #0x60]
        ldr     r11, [sp, #0x48]
        sub     r10, r10, r1, asr #2
        ldr     r1, [sp, #0x64]
        eor     r3, r10, r10, asr #31
        sub     r10, r3, r10, asr #31
        add     lr, r10, lr
        add     r1, r6, r1
        ldr     r6, [sp, #0x6C]
        add     r1, r1, #2
        add     r6, r11, r6
        add     r7, r6, r7
        ldr     r6, [sp, #0x68]
        ldr     r11, [sp, #0x6C]
        sub     r6, r6, r1, asr #2
        ldr     r1, [sp, #0x70]
        eor     r3, r6, r6, asr #31
        sub     r3, r3, r6, asr #31
        add     lr, r3, lr
        add     r1, r7, r1
        ldr     r7, [sp, #0x78]
        ldr     r3, [sp, #0x8C]
        add     r1, r1, #2
        add     r7, r11, r7
        add     r4, r7, r4
        ldr     r7, [sp, #0x74]
        sub     r7, r7, r1, asr #2
        ldr     r1, [sp, #0x7C]
        add     r4, r4, r1
        ldr     r1, [sp, #0x78]
        add     r4, r4, #2
        add     r1, r1, r9
        add     r1, r1, r5
        ldr     r5, [sp, #0x80]
        sub     r4, r5, r4, asr #2
        ldr     r5, [sp, #0x84]
        add     r1, r1, r5
        ldr     r5, [sp, #0x90]
        add     r1, r1, #2
        add     r9, r9, r5
        ldr     r5, [sp, #0x88]
        add     r9, r9, r12
        eor     r12, r7, r7, asr #31
        sub     r1, r5, r1, asr #2
        ldr     r5, [sp, #0x94]
        sub     r7, r12, r7, asr #31
        eor     r12, r4, r4, asr #31
        add     lr, r7, lr
        add     r5, r9, r5
        sub     r12, r12, r4, asr #31
        eor     r4, r1, r1, asr #31
        add     r5, r5, #2
        add     lr, r12, lr
        sub     r3, r3, r5, asr #2
        sub     r4, r4, r1, asr #31
        ldr     r1, [sp, #4]
        eor     r12, r3, r3, asr #31
        add     lr, r4, lr
        sub     r12, r12, r3, asr #31
        add     lr, r12, lr
        str     lr, [sp]
        add     r0, r0, r1
        bne     LKDU0
        ldr     lr, [sp]
        ldr     r12, [sp, #0xC]
        str     lr, [r12]
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}


