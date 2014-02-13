        .text
        .align  4
        .globl  ownvc_SAD16x8_8u32s_C1R_FH


ownvc_SAD16x8_8u32s_C1R_FH:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x78
        ldr     lr, [sp, #0x9C]
        mov     r4, #0
        mov     r12, #8
        str     r4, [sp]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LKDW0:
        mov     r1, r2
        ldr     r3, [sp, #8]
        ldrb    r5, [r1]
        ldrb    r4, [r0]
        add     r2, r2, r3
        ldrb    r3, [r2]
        ldrb    r7, [r2, #4]
        ldrb    r8, [r2, #5]
        ldrb    lr, [r1, #1]
        add     r6, r5, r3
        ldrb    r5, [r2, #1]
        ldrb    r3, [r1, #2]
        add     r6, r6, #1
        subs    r12, r12, #1
        add     lr, lr, r5
        ldrb    r5, [r2, #2]
        sub     r9, r4, r6, asr #1
        ldrb    r4, [r0, #1]
        ldrb    r6, [r1, #3]
        add     r5, r3, r5
        ldrb    r3, [r2, #3]
        add     lr, lr, #1
        sub     r4, r4, lr, asr #1
        ldrb    lr, [r0, #2]
        add     r6, r6, r3
        ldrb    r3, [r0, #3]
        add     r5, r5, #1
        sub     r5, lr, r5, asr #1
        ldrb    lr, [r1, #4]
        add     r6, r6, #1
        sub     r6, r3, r6, asr #1
        ldrb    r3, [r0, #4]
        add     r7, lr, r7
        ldrb    lr, [r1, #5]
        add     r7, r7, #1
        sub     r7, r3, r7, asr #1
        ldrb    r3, [r0, #5]
        add     r8, lr, r8
        add     lr, r8, #1
        ldrb    r8, [r1, #6]
        sub     lr, r3, lr, asr #1
        ldrb    r3, [r2, #6]
        eor     r11, r4, r4, asr #31
        add     r3, r8, r3
        ldrb    r8, [r0, #6]
        add     r3, r3, #1
        sub     r3, r8, r3, asr #1
        ldrb    r8, [r1, #7]
        str     r8, [sp, #0x10]
        ldrb    r10, [r0, #7]
        ldrb    r8, [r2, #7]
        str     r10, [sp, #0x14]
        ldrb    r10, [r0, #8]
        str     r10, [sp, #0x18]
        ldrb    r10, [r1, #8]
        str     r10, [sp, #0x1C]
        ldrb    r10, [r2, #8]
        str     r10, [sp, #0x20]
        ldrb    r10, [r0, #9]
        str     r10, [sp, #0x24]
        ldrb    r10, [r1, #9]
        str     r10, [sp, #0x28]
        ldrb    r10, [r2, #9]
        str     r10, [sp, #0x2C]
        ldrb    r10, [r0, #0xA]
        str     r10, [sp, #0x30]
        ldrb    r10, [r1, #0xA]
        str     r10, [sp, #0x34]
        ldrb    r10, [r2, #0xA]
        str     r10, [sp, #0x38]
        ldrb    r10, [r0, #0xB]
        str     r10, [sp, #0x3C]
        ldrb    r10, [r1, #0xB]
        str     r10, [sp, #0x40]
        ldrb    r10, [r2, #0xB]
        str     r10, [sp, #0x44]
        ldrb    r10, [r0, #0xC]
        str     r10, [sp, #0x48]
        ldrb    r10, [r1, #0xC]
        str     r10, [sp, #0x4C]
        ldrb    r10, [r2, #0xC]
        str     r10, [sp, #0x50]
        ldrb    r10, [r0, #0xD]
        str     r10, [sp, #0x54]
        ldrb    r10, [r1, #0xD]
        str     r10, [sp, #0x58]
        ldrb    r10, [r2, #0xD]
        str     r10, [sp, #0x5C]
        ldrb    r10, [r0, #0xE]
        str     r10, [sp, #0x60]
        ldrb    r10, [r1, #0xE]
        str     r10, [sp, #0x64]
        ldrb    r10, [r2, #0xE]
        str     r10, [sp, #0x68]
        ldrb    r10, [r0, #0xF]
        str     r10, [sp, #0x6C]
        ldrb    r10, [r2, #0xF]
        ldrb    r1, [r1, #0xF]
        str     r11, [sp, #0x74]
        str     r10, [sp, #0x70]
        eor     r10, r9, r9, asr #31
        sub     r10, r10, r9, asr #31
        ldr     r9, [sp]
        add     r10, r10, r9
        ldr     r9, [sp, #0x74]
        sub     r4, r9, r4, asr #31
        eor     r9, r5, r5, asr #31
        add     r4, r4, r10
        sub     r9, r9, r5, asr #31
        ldr     r5, [sp, #0x10]
        eor     r10, r6, r6, asr #31
        add     r8, r5, r8
        add     r5, r9, r4
        sub     r10, r10, r6, asr #31
        eor     r9, r7, r7, asr #31
        add     r6, r10, r5
        ldr     r5, [sp, #0x14]
        add     r4, r8, #1
        sub     r7, r9, r7, asr #31
        ldr     r9, [sp, #0x1C]
        sub     r5, r5, r4, asr #1
        ldr     r4, [sp, #0x20]
        eor     r8, lr, lr, asr #31
        add     r7, r7, r6
        add     r4, r9, r4
        sub     r9, r8, lr, asr #31
        ldr     lr, [sp, #0x18]
        add     r4, r4, #1
        eor     r8, r3, r3, asr #31
        add     r7, r9, r7
        sub     r6, lr, r4, asr #1
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x28]
        sub     r9, r8, r3, asr #31
        ldr     r3, [sp, #0x24]
        add     lr, r4, lr
        add     lr, lr, #1
        eor     r8, r5, r5, asr #31
        sub     r4, r3, lr, asr #1
        ldr     r3, [sp, #0x38]
        ldr     lr, [sp, #0x34]
        add     r7, r9, r7
        ldr     r9, [sp, #0x40]
        add     r3, lr, r3
        ldr     lr, [sp, #0x30]
        add     r3, r3, #1
        sub     r8, r8, r5, asr #31
        eor     r5, r6, r6, asr #31
        sub     lr, lr, r3, asr #1
        ldr     r3, [sp, #0x44]
        add     r7, r8, r7
        sub     r8, r5, r6, asr #31
        ldr     r5, [sp, #0x3C]
        add     r3, r9, r3
        add     r3, r3, #1
        ldr     r9, [sp, #0x4C]
        sub     r3, r5, r3, asr #1
        ldr     r5, [sp, #0x50]
        eor     r6, r4, r4, asr #31
        add     r7, r8, r7
        sub     r8, r6, r4, asr #31
        ldr     r4, [sp, #0x48]
        add     r5, r9, r5
        add     r5, r5, #1
        ldr     r9, [sp, #0x58]
        sub     r4, r4, r5, asr #1
        ldr     r5, [sp, #0x5C]
        eor     r6, lr, lr, asr #31
        add     r7, r8, r7
        sub     r8, r6, lr, asr #31
        ldr     lr, [sp, #0x54]
        add     r5, r9, r5
        add     r5, r5, #1
        ldr     r9, [sp, #0x64]
        sub     lr, lr, r5, asr #1
        ldr     r5, [sp, #0x68]
        eor     r6, r3, r3, asr #31
        add     r7, r8, r7
        ldr     r8, [sp, #0x60]
        add     r5, r9, r5
        add     r5, r5, #1
        sub     r6, r6, r3, asr #31
        eor     r3, r4, r4, asr #31
        sub     r5, r8, r5, asr #1
        ldr     r8, [sp, #0x70]
        add     r7, r6, r7
        ldr     r6, [sp, #0x6C]
        sub     r4, r3, r4, asr #31
        eor     r3, lr, lr, asr #31
        add     r8, r1, r8
        add     r1, r8, #1
        sub     r3, r3, lr, asr #31
        add     r7, r4, r7
        add     r7, r3, r7
        sub     r1, r6, r1, asr #1
        eor     lr, r5, r5, asr #31
        eor     r3, r1, r1, asr #31
        sub     lr, lr, r5, asr #31
        sub     r3, r3, r1, asr #31
        ldr     r1, [sp, #4]
        add     r7, lr, r7
        add     r7, r3, r7
        str     r7, [sp]
        add     r0, r0, r1
        bne     LKDW0
        ldr     r4, [sp]
        ldr     lr, [sp, #0xC]
        str     r4, [lr]
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}


