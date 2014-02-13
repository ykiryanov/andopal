        .text
        .align  4
        .globl  ownvc_SAD8x8_16u32s_C1R


ownvc_SAD8x8_16u32s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     lr, [sp, #0x3C]
        mov     r4, #0
        mov     r12, #8
        str     r4, [sp]
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
LKDP0:
        ldrh    r3, [r0]
        ldrh    r4, [r2]
        ldrh    r1, [r0, #2]
        ldrh    lr, [r2, #2]
        ldrh    r5, [r2, #4]
        sub     r3, r3, r4
        ldrh    r4, [r0, #4]
        sub     lr, r1, lr
        ldrh    r1, [r0, #6]
        ldrh    r6, [r0, #8]
        sub     r4, r4, r5
        ldrh    r5, [r2, #6]
        ldrh    r7, [r2, #8]
        ldrh    r10, [r0, #0xC]
        ldrh    r9, [r2, #0xC]
        sub     r5, r1, r5
        ldrh    r1, [r0, #0xA]
        sub     r6, r6, r7
        ldrh    r7, [r2, #0xA]
        subs    r12, r12, #1
        eor     r11, lr, lr, asr #31
        sub     r9, r10, r9
        sub     r1, r1, r7
        ldrh    r7, [r0, #0xE]
        str     r7, [sp, #0x10]
        ldrh    r8, [r2, #0xE]
        eor     r7, r3, r3, asr #31
        str     r11, [sp, #0x14]
        sub     r7, r7, r3, asr #31
        ldr     r3, [sp]
        add     r3, r7, r3
        ldr     r7, [sp, #0x14]
        sub     r7, r7, lr, asr #31
        eor     lr, r4, r4, asr #31
        add     r7, r7, r3
        sub     lr, lr, r4, asr #31
        eor     r3, r5, r5, asr #31
        add     r7, lr, r7
        sub     r3, r3, r5, asr #31
        ldr     r5, [sp, #0x10]
        add     lr, r3, r7
        eor     r4, r6, r6, asr #31
        eor     r3, r1, r1, asr #31
        sub     r8, r5, r8
        sub     r4, r4, r6, asr #31
        sub     r1, r3, r1, asr #31
        add     lr, r4, lr
        add     lr, r1, lr
        eor     r3, r9, r9, asr #31
        eor     r1, r8, r8, asr #31
        sub     r3, r3, r9, asr #31
        add     lr, r3, lr
        sub     r1, r1, r8, asr #31
        add     lr, r1, lr
        ldr     r1, [sp, #8]
        str     lr, [sp]
        add     r2, r1, r2
        ldr     r1, [sp, #4]
        add     r0, r1, r0
        bne     LKDP0
        ldr     r4, [sp]
        ldr     lr, [sp, #0xC]
        str     r4, [lr]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


