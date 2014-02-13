        .text
        .align  4
        .globl  ownUpsampleFour8x8_H263_16s_C1R


ownUpsampleFour8x8_H263_16s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldrsh   r12, [r0]
        strh    r12, [r2]
        ldrsh   r4, [r0, #2]
        add     lr, r12, r12, lsl #1
        add     r5, r4, #2
        add     r12, r12, r4, lsl #1
        add     lr, lr, r5
        add     r12, r12, r5
        add     r6, r4, r4, lsl #1
        mov     r5, lr, asr #31
        and     r5, r5, #3
        add     lr, lr, r5
        mov     r5, r12, asr #31
        and     r5, r5, #3
        add     r5, r12, r5
        mov     lr, lr, asr #2
        strh    lr, [r2, #2]
        mov     r5, r5, asr #2
        strh    r5, [r2, #4]
        ldrsh   r5, [r0, #4]
        add     r12, r2, r3
        mov     lr, #7
        add     r4, r4, r5, lsl #1
        add     r7, r5, #2
        add     r4, r4, r7
        add     r6, r6, r7
        mov     r7, r6, asr #31
        and     r7, r7, #3
        add     r6, r6, r7
        mov     r7, r4, asr #31
        and     r7, r7, #3
        add     r7, r4, r7
        mov     r6, r6, asr #2
        mov     r7, r7, asr #2
        strh    r7, [r2, #8]
        strh    r6, [r2, #6]
        ldrsh   r4, [r0, #6]
        add     r6, r5, r5, lsl #1
        add     r5, r5, r4, lsl #1
        add     r7, r4, #2
        add     r6, r6, r7
        add     r5, r5, r7
        mov     r7, r6, asr #31
        and     r7, r7, #3
        add     r6, r6, r7
        mov     r7, r5, asr #31
        and     r7, r7, #3
        add     r7, r5, r7
        mov     r6, r6, asr #2
        mov     r7, r7, asr #2
        strh    r7, [r2, #0xC]
        strh    r6, [r2, #0xA]
        ldrsh   r5, [r0, #8]
        add     r6, r4, r4, lsl #1
        add     r7, r5, #2
        add     r4, r4, r5, lsl #1
        add     r4, r4, r7
        add     r6, r6, r7
        mov     r8, r4, asr #31
        mov     r7, r6, asr #31
        and     r8, r8, #3
        and     r7, r7, #3
        add     r8, r4, r8
        add     r7, r6, r7
        mov     r8, r8, asr #2
        mov     r7, r7, asr #2
        strh    r8, [r2, #0x10]
        strh    r7, [r2, #0xE]
        ldrsh   r4, [r0, #0xA]
        add     r8, r5, r5, lsl #1
        add     r7, r5, r4, lsl #1
        add     r6, r4, #2
        add     r5, r8, r6
        add     r7, r7, r6
        add     r6, r4, r4, lsl #1
        mov     r8, r5, asr #31
        mov     r9, r7, asr #31
        and     r8, r8, #3
        and     r9, r9, #3
        add     r8, r5, r8
        add     r9, r7, r9
        mov     r8, r8, asr #2
        strh    r8, [r2, #0x12]
        mov     r9, r9, asr #2
        strh    r9, [r2, #0x14]
        ldrsh   r5, [r0, #0xC]
        add     r7, r5, #2
        add     r6, r6, r7
        add     r4, r4, r5, lsl #1
        add     r4, r4, r7
        mov     r7, r6, asr #31
        mov     r8, r4, asr #31
        and     r7, r7, #3
        and     r8, r8, #3
        add     r7, r6, r7
        add     r8, r4, r8
        mov     r7, r7, asr #2
        strh    r7, [r2, #0x16]
        mov     r8, r8, asr #2
        strh    r8, [r2, #0x18]
        ldrsh   r6, [r0, #0xE]
        add     r4, r5, r5, lsl #1
        add     r7, r6, #2
        add     r5, r5, r6, lsl #1
        add     r4, r4, r7
        add     r5, r5, r7
        strh    r6, [r2, #0x1E]
        mov     r7, r4, asr #31
        mov     r8, r5, asr #31
        and     r7, r7, #3
        and     r8, r8, #3
        add     r7, r4, r7
        add     r8, r5, r8
        mov     r7, r7, asr #2
        mov     r8, r8, asr #2
        strh    r7, [r2, #0x1A]
        strh    r8, [r2, #0x1C]
        str     lr, [sp, #4]
        str     r3, [sp]
LFFB0:
        ldrsh   r3, [r0]
        ldrsh   lr, [r0, +r1]
        ldr     r2, [sp, #4]
        add     r4, r3, r3, lsl #1
        add     r6, r4, lr
        add     lr, lr, lr, lsl #1
        subs    r2, r2, #1
        str     r2, [sp, #4]
        ldr     r2, [sp]
        add     r8, r3, lr
        add     r3, r6, #2
        add     lr, r8, #2
        add     r2, r2, r12
        mov     r3, r3, asr #31
        mov     lr, lr, asr #31
        and     r3, r3, #3
        and     r4, lr, #3
        add     lr, r6, r3
        add     lr, lr, #2
        add     r3, r8, r4
        mov     lr, lr, asr #2
        strh    lr, [r12]
        ldr     lr, [sp]
        add     r3, r3, #2
        add     r5, r6, r6, lsl #1
        add     r9, r8, r8, lsl #1
        mov     r3, r3, asr #2
        strh    r3, [r12, +lr]
        ldrsh   r3, [r0, #2]
        add     lr, r1, r0
        str     lr, [sp, #8]
        ldrsh   r4, [lr, #2]
        add     r7, r3, r3, lsl #1
        add     lr, r4, r4, lsl #1
        add     r3, r3, lr
        add     lr, r0, #8
        str     lr, [sp, #0xC]
        add     r4, r7, r4
        add     r10, r3, r3, lsl #1
        add     lr, r4, r4, lsl #1
        add     r4, r4, #8
        add     r7, r4, r5
        add     r5, r10, #8
        add     r3, r3, #8
        mov     r10, r7, asr #31
        add     lr, lr, #8
        and     r10, r10, #0xF
        add     r7, r7, r10
        add     r6, r6, lr
        add     r8, r8, r5
        mov     r10, r6, asr #31
        and     r10, r10, #0xF
        mov     r7, r7, asr #4
        add     r10, r6, r10
        strh    r7, [r12, #2]
        add     r9, r3, r9
        mov     r6, r8, asr #31
        mov     r10, r10, asr #4
        mov     r7, r9, asr #31
        and     r7, r7, #0xF
        strh    r10, [r12, #4]
        and     r6, r6, #0xF
        add     r6, r8, r6
        add     r7, r9, r7
        mov     r6, r6, asr #4
        strh    r6, [r2, #4]
        mov     r7, r7, asr #4
        strh    r7, [r2, #2]
        ldrsh   r7, [r0, #4]
        ldr     r9, [sp, #0xC]
        add     r8, r0, #4
        ldrsh   r6, [r8, +r1]
        add     r8, r1, r8
        add     r9, r1, r9
        str     r8, [sp, #0x10]
        str     r9, [sp, #0x14]
        add     r9, r6, r6, lsl #1
        add     r8, r7, r7, lsl #1
        add     r6, r8, r6
        add     r9, r7, r9
        str     r9, [sp, #0x18]
        add     r10, r9, r5
        add     r8, r6, r6, lsl #1
        add     r5, r9, r9, lsl #1
        mov     r11, r10, asr #31
        add     lr, r6, lr
        add     r4, r4, r8
        and     r11, r11, #0xF
        add     r10, r10, r11
        add     r3, r3, r5
        mov     r7, lr, asr #31
        mov     r9, r4, asr #31
        mov     r11, r3, asr #31
        and     r7, r7, #0xF
        and     r9, r9, #0xF
        and     r11, r11, #0xF
        add     r7, lr, r7
        add     r9, r4, r9
        add     r11, r3, r11
        mov     r9, r9, asr #4
        mov     r7, r7, asr #4
        strh    r7, [r12, #6]
        strh    r9, [r12, #8]
        mov     r10, r10, asr #4
        mov     r11, r11, asr #4
        strh    r11, [r2, #8]
        strh    r10, [r2, #6]
        ldrsh   r3, [r0, #6]
        ldr     lr, [sp, #0x10]
        ldr     r9, [sp, #0x18]
        add     r7, r0, #0xC
        add     r4, r3, r3, lsl #1
        ldrsh   lr, [lr, #2]
        str     r7, [sp, #0x10]
        add     r7, r1, r7
        str     r7, [sp, #0x1C]
        add     r7, lr, lr, lsl #1
        add     r3, r3, r7
        add     lr, r4, lr
        add     r7, lr, #8
        add     r4, lr, lr, lsl #1
        add     r8, r7, r8
        add     r4, r4, #8
        add     r6, r6, r4
        mov     r10, r8, asr #31
        add     lr, r3, r3, lsl #1
        and     r10, r10, #0xF
        str     r10, [sp, #0x24]
        add     lr, lr, #8
        add     r3, r3, #8
        add     r5, r3, r5
        mov     r11, r6, asr #31
        add     r9, r9, lr
        str     r9, [sp, #0x18]
        str     r11, [sp, #0x20]
        ldr     r10, [sp, #0x20]
        mov     r9, r9, asr #31
        and     r9, r9, #0xF
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        mov     r11, r5, asr #31
        and     r11, r11, #0xF
        and     r10, r10, #0xF
        add     r11, r5, r11
        ldr     r5, [sp, #0x20]
        add     r10, r6, r10
        ldr     r6, [sp, #0x18]
        add     r8, r8, r9
        mov     r10, r10, asr #4
        mov     r8, r8, asr #4
        add     r5, r6, r5
        strh    r8, [r12, #0xA]
        strh    r10, [r12, #0xC]
        mov     r5, r5, asr #4
        mov     r11, r11, asr #4
        strh    r11, [r2, #0xA]
        strh    r5, [r2, #0xC]
        ldrsh   r5, [r0, #8]
        ldr     r6, [sp, #0xC]
        ldrsh   r9, [r6, +r1]
        add     r6, r5, r5, lsl #1
        add     r8, r6, r9
        add     r6, r8, r4
        add     r9, r9, r9, lsl #1
        add     r5, r5, r9
        mov     r9, r6, asr #31
        and     r9, r9, #0xF
        add     r4, r8, r8, lsl #1
        add     r10, r7, r4
        add     r9, r6, r9
        add     r7, r5, r5, lsl #1
        mov     r9, r9, asr #4
        strh    r9, [r12, #0xE]
        add     r3, r3, r7
        mov     r11, r10, asr #31
        add     lr, r5, lr
        mov     r6, r3, asr #31
        and     r11, r11, #0xF
        mov     r9, lr, asr #31
        and     r6, r6, #0xF
        and     r9, r9, #0xF
        add     r11, r10, r11
        add     r9, lr, r9
        mov     r11, r11, asr #4
        strh    r11, [r12, #0x10]
        add     r6, r3, r6
        mov     r9, r9, asr #4
        strh    r9, [r2, #0xE]
        mov     r6, r6, asr #4
        strh    r6, [r2, #0x10]
        ldr     lr, [sp, #0x14]
        ldrsh   r3, [r0, #0xA]
        ldrsh   r9, [lr, #2]
        add     lr, r3, r3, lsl #1
        add     lr, lr, r9
        add     r9, r9, r9, lsl #1
        add     r6, lr, #8
        add     lr, lr, lr, lsl #1
        add     r11, r3, r9
        add     r9, lr, #8
        add     lr, r11, r11, lsl #1
        add     r3, r6, r4
        add     r10, r8, r9
        mov     r8, r3, asr #31
        and     r8, r8, #0xF
        add     r8, r3, r8
        add     lr, lr, #8
        mov     r8, r8, asr #4
        add     r4, r11, #8
        strh    r8, [r12, #0x12]
        add     r5, r5, lr
        mov     r11, r10, asr #31
        add     r7, r4, r7
        and     r11, r11, #0xF
        mov     r8, r7, asr #31
        mov     r3, r5, asr #31
        and     r8, r8, #0xF
        and     r3, r3, #0xF
        add     r11, r10, r11
        add     r3, r5, r3
        mov     r11, r11, asr #4
        strh    r11, [r12, #0x14]
        add     r8, r7, r8
        mov     r3, r3, asr #4
        strh    r3, [r2, #0x14]
        mov     r8, r8, asr #4
        strh    r8, [r2, #0x12]
        ldr     r3, [sp, #0x10]
        ldrsh   r5, [r0, #0xC]
        ldrsh   r7, [r3, +r1]
        add     r3, r5, r5, lsl #1
        add     r3, r3, r7
        add     r8, r3, r9
        add     r7, r7, r7, lsl #1
        add     r5, r5, r7
        add     r9, r3, r3, lsl #1
        add     r10, r6, r9
        mov     r6, r8, asr #31
        and     r6, r6, #0xF
        add     r6, r8, r6
        add     r7, r5, r5, lsl #1
        mov     r6, r6, asr #4
        mov     r11, r10, asr #31
        strh    r6, [r12, #0x16]
        add     r4, r4, r7
        and     r11, r11, #0xF
        add     lr, r5, lr
        mov     r6, r4, asr #31
        mov     r8, lr, asr #31
        add     r11, r10, r11
        and     r6, r6, #0xF
        and     r8, r8, #0xF
        mov     r11, r11, asr #4
        strh    r11, [r12, #0x18]
        add     r6, r4, r6
        add     r8, lr, r8
        mov     r6, r6, asr #4
        strh    r6, [r2, #0x18]
        mov     r8, r8, asr #4
        strh    r8, [r2, #0x16]
        ldrsh   r4, [r0, #0xE]
        ldr     r0, [sp, #0x1C]
        add     lr, r4, r4, lsl #1
        ldrsh   r6, [r0, #2]
        ldr     r0, [sp, #8]
        add     lr, lr, r6
        add     r8, lr, #8
        add     r6, r6, r6, lsl #1
        add     r4, r4, r6
        add     r6, lr, lr, lsl #1
        add     r10, r6, #8
        add     r6, r4, r4, lsl #1
        add     r3, r3, r10
        add     r6, r6, #8
        str     r6, [sp, #0x24]
        mov     r11, r3, asr #31
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        add     r9, r8, r9
        add     r5, r5, r11
        mov     r6, r9, asr #31
        and     r11, r6, #0xF
        ldr     r6, [sp, #0x20]
        add     r10, r4, #8
        add     r7, r10, r7
        add     r11, r9, r11
        and     r6, r6, #0xF
        add     r6, r3, r6
        add     lr, lr, #2
        mov     r6, r6, asr #4
        strh    r6, [r12, #0x1C]
        mov     r3, r7, asr #31
        mov     lr, lr, asr #31
        mov     r6, r5, asr #31
        add     r4, r4, #2
        and     r3, r3, #0xF
        and     lr, lr, #3
        and     r6, r6, #0xF
        mov     r11, r11, asr #4
        strh    r11, [r12, #0x1A]
        mov     r4, r4, asr #31
        add     r3, r7, r3
        add     lr, r8, lr
        add     r6, r5, r6
        and     r4, r4, #3
        mov     r3, r3, asr #4
        strh    r3, [r2, #0x1A]
        sub     lr, lr, #6
        mov     r6, r6, asr #4
        strh    r6, [r2, #0x1C]
        add     r4, r10, r4
        mov     lr, lr, asr #2
        strh    lr, [r12, #0x1E]
        ldr     r3, [sp]
        sub     r4, r4, #6
        mov     r4, r4, asr #2
        strh    r4, [r2, #0x1E]
        ldr     r2, [sp, #4]
        add     r12, r12, r3, lsl #1
        bne     LFFB0
        ldr     r0, [sp, #8]
        ldrsh   r1, [r0]
        strh    r1, [r12]
        ldrsh   r3, [r0, #2]
        add     r2, r1, r1, lsl #1
        add     r1, r1, r3, lsl #1
        add     r1, r1, r3
        add     r2, r2, r3
        add     lr, r1, #2
        add     r2, r2, #2
        mov     r5, lr, asr #31
        mov     r4, r2, asr #31
        and     r4, r4, #3
        and     r5, r5, #3
        add     r4, r2, r4
        add     r5, lr, r5
        mov     r4, r4, asr #2
        strh    r4, [r12, #2]
        mov     r5, r5, asr #2
        strh    r5, [r12, #4]
        ldrsh   r2, [r0, #4]
        add     r1, r3, r3, lsl #1
        add     r3, r3, r2, lsl #1
        add     r1, r1, r2
        add     r3, r3, r2
        add     lr, r1, #2
        add     r1, r3, #2
        add     r3, r2, r2, lsl #1
        mov     r5, lr, asr #31
        mov     r4, r1, asr #31
        and     r5, r5, #3
        add     lr, lr, r5
        and     r4, r4, #3
        add     r4, r1, r4
        mov     lr, lr, asr #2
        strh    lr, [r12, #6]
        mov     r4, r4, asr #2
        strh    r4, [r12, #8]
        ldrsh   r1, [r0, #6]
        add     r2, r2, r1, lsl #1
        add     r3, r3, r1
        add     r2, r2, r1
        add     lr, r3, #2
        add     r3, r1, r1, lsl #1
        add     r2, r2, #2
        mov     r4, lr, asr #31
        and     r4, r4, #3
        add     lr, lr, r4
        mov     r4, r2, asr #31
        and     r4, r4, #3
        add     r4, r2, r4
        mov     lr, lr, asr #2
        mov     r4, r4, asr #2
        strh    r4, [r12, #0xC]
        strh    lr, [r12, #0xA]
        ldrsh   r2, [r0, #8]
        add     r1, r1, r2, lsl #1
        add     r3, r3, r2
        add     r1, r1, r2
        add     lr, r3, #2
        add     r1, r1, #2
        add     r3, r2, r2, lsl #1
        mov     r4, lr, asr #31
        and     r4, r4, #3
        add     lr, lr, r4
        mov     r4, r1, asr #31
        and     r4, r4, #3
        add     r4, r1, r4
        mov     lr, lr, asr #2
        mov     r4, r4, asr #2
        strh    lr, [r12, #0xE]
        strh    r4, [r12, #0x10]
        ldrsh   r1, [r0, #0xA]
        add     r3, r3, r1
        add     lr, r3, #2
        add     r2, r2, r1, lsl #1
        add     r2, r2, r1
        mov     r4, lr, asr #31
        and     r4, r4, #3
        add     r3, r2, #2
        add     lr, lr, r4
        mov     r4, r3, asr #31
        and     r4, r4, #3
        add     r4, r3, r4
        mov     lr, lr, asr #2
        strh    lr, [r12, #0x12]
        mov     r4, r4, asr #2
        strh    r4, [r12, #0x14]
        ldrsh   r3, [r0, #0xC]
        add     r2, r1, r1, lsl #1
        add     r2, r2, r3
        add     r2, r2, #2
        add     r1, r1, r3, lsl #1
        mov     lr, r2, asr #31
        add     r1, r1, r3
        and     lr, lr, #3
        add     r1, r1, #2
        add     r2, r2, lr
        mov     lr, r1, asr #31
        and     lr, lr, #3
        add     lr, r1, lr
        mov     r2, r2, asr #2
        strh    r2, [r12, #0x16]
        mov     lr, lr, asr #2
        strh    lr, [r12, #0x18]
        ldrsh   r1, [r0, #0xE]
        add     r0, r3, r3, lsl #1
        add     r0, r0, r1
        add     r0, r0, #2
        add     r3, r3, r1, lsl #1
        mov     r2, r0, asr #31
        add     r3, r3, r1
        and     r2, r2, #3
        strh    r1, [r12, #0x1E]
        add     r1, r3, #2
        add     r0, r0, r2
        mov     r2, r1, asr #31
        and     r2, r2, #3
        add     r2, r1, r2
        mov     r0, r0, asr #2
        mov     r2, r2, asr #2
        strh    r0, [r12, #0x1A]
        strh    r2, [r12, #0x1C]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


