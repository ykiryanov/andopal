        .text
        .align  4
        .globl  ownvc_MeanAbsDev16x16_8u32s_C1R


ownvc_MeanAbsDev16x16_8u32s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     lr, #0
        mov     r3, #0x10
        mov     r4, r0
        mov     r7, lr
        mov     r12, r3
LEFB0:
        ldrb    r8, [r4]
        ldrb    r6, [r4, #1]
        ldrb    r5, [r4, #2]
        add     r8, r7, r8
        ldrb    r7, [r4, #4]
        add     r6, r8, r6
        ldrb    r8, [r4, #3]
        add     r5, r6, r5
        ldrb    r6, [r4, #5]
        subs    r12, r12, #1
        add     r8, r5, r8
        ldrb    r5, [r4, #6]
        add     r7, r8, r7
        ldrb    r8, [r4, #7]
        add     r6, r7, r6
        ldrb    r7, [r4, #8]
        add     r5, r6, r5
        ldrb    r6, [r4, #9]
        add     r8, r5, r8
        ldrb    r5, [r4, #0xA]
        add     r7, r8, r7
        ldrb    r8, [r4, #0xB]
        add     r6, r7, r6
        ldrb    r7, [r4, #0xC]
        add     r5, r6, r5
        ldrb    r6, [r4, #0xD]
        add     r8, r5, r8
        ldrb    r5, [r4, #0xE]
        add     r7, r8, r7
        add     r7, r7, r6
        ldrb    r6, [r4, #0xF]
        add     r5, r7, r5
        add     r4, r4, r1
        add     r7, r5, r6
        bne     LEFB0
        add     r12, r7, #0x80
        str     lr, [sp]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
LEFB1:
        ldrb    r1, [r0]
        ldrb    lr, [r0, #1]
        ldrb    r2, [r0, #2]
        ldrb    r4, [r0, #4]
        ldrb    r7, [r0, #6]
        ldrb    r8, [r0, #8]
        ldrb    r9, [r0, #9]
        sub     r10, r1, r12, asr #8
        ldrb    r1, [r0, #3]
        sub     r6, lr, r12, asr #8
        subs    r3, r3, #1
        sub     r2, r2, r12, asr #8
        sub     lr, r1, r12, asr #8
        ldrb    r1, [r0, #5]
        sub     r4, r4, r12, asr #8
        sub     r7, r7, r12, asr #8
        sub     r8, r8, r12, asr #8
        sub     r5, r1, r12, asr #8
        ldrb    r1, [r0, #7]
        str     r9, [sp, #0xC]
        ldrb    r9, [r0, #0xA]
        sub     r1, r1, r12, asr #8
        str     r9, [sp, #0x10]
        ldrb    r9, [r0, #0xB]
        str     r9, [sp, #0x14]
        ldrb    r9, [r0, #0xC]
        str     r9, [sp, #0x18]
        ldrb    r9, [r0, #0xD]
        str     r9, [sp, #0x1C]
        ldrb    r9, [r0, #0xE]
        str     r9, [sp, #0x20]
        ldrb    r9, [r0, #0xF]
        str     r9, [sp, #0x24]
        eor     r9, r10, r10, asr #31
        str     r9, [sp, #0x28]
        ldr     r11, [sp, #0x28]
        eor     r9, r6, r6, asr #31
        sub     r10, r11, r10, asr #31
        ldr     r11, [sp]
        sub     r9, r9, r6, asr #31
        eor     r6, r2, r2, asr #31
        add     r10, r10, r11
        add     r10, r9, r10
        eor     r9, lr, lr, asr #31
        sub     r6, r6, r2, asr #31
        sub     r9, r9, lr, asr #31
        eor     lr, r4, r4, asr #31
        eor     r2, r5, r5, asr #31
        sub     lr, lr, r4, asr #31
        add     r10, r6, r10
        sub     r5, r2, r5, asr #31
        add     r10, r9, r10
        add     lr, lr, r10
        eor     r2, r7, r7, asr #31
        eor     r4, r1, r1, asr #31
        add     lr, r5, lr
        sub     r7, r2, r7, asr #31
        ldr     r2, [sp, #0xC]
        sub     r4, r4, r1, asr #31
        ldr     r1, [sp, #0x10]
        eor     r5, r8, r8, asr #31
        sub     r2, r2, r12, asr #8
        add     lr, r7, lr
        sub     r8, r5, r8, asr #31
        add     r4, r4, lr
        ldr     lr, [sp, #0x14]
        eor     r5, r2, r2, asr #31
        sub     r1, r1, r12, asr #8
        sub     r6, r5, r2, asr #31
        add     r4, r8, r4
        ldr     r2, [sp, #0x18]
        add     r4, r6, r4
        eor     r5, r1, r1, asr #31
        sub     lr, lr, r12, asr #8
        sub     r2, r2, r12, asr #8
        sub     r6, r5, r1, asr #31
        ldr     r1, [sp, #0x1C]
        add     r4, r6, r4
        eor     r5, lr, lr, asr #31
        sub     r6, r5, lr, asr #31
        eor     r5, r2, r2, asr #31
        ldr     lr, [sp, #0x20]
        add     r4, r6, r4
        sub     r1, r1, r12, asr #8
        sub     r6, r5, r2, asr #31
        ldr     r2, [sp, #0x24]
        eor     r5, r1, r1, asr #31
        sub     lr, lr, r12, asr #8
        sub     r1, r5, r1, asr #31
        add     r4, r6, r4
        add     r4, r1, r4
        sub     r2, r2, r12, asr #8
        eor     r5, lr, lr, asr #31
        eor     r1, r2, r2, asr #31
        sub     r5, r5, lr, asr #31
        add     r4, r5, r4
        sub     r1, r1, r2, asr #31
        add     r4, r1, r4
        ldr     r1, [sp, #4]
        str     r4, [sp]
        add     r0, r0, r1
        bne     LEFB1
        ldr     lr, [sp]
        ldr     r2, [sp, #8]
        str     lr, [r2]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


