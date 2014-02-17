        .text
        .align  4
        .globl  ippiSumsDiff16x16Blocks4x4_16u32s_C1R


ippiSumsDiff16x16Blocks4x4_16u32s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r12, [sp, #0x48]
        ldr     lr, [sp, #0x4C]
        cmp     r0, #0
        beq     LLCD7
        cmp     r2, #0
        beq     LLCD7
        cmp     r12, #0
        beq     LLCD7
        mov     r4, r1, asr #1
        mov     r6, r3, asr #1
        mov     r1, r4, lsl #2
        mov     r3, r6, lsl #2
        cmp     lr, #0
        sub     r1, r1, #0x10
        sub     r3, r3, #0x10
        mov     r5, #4
        beq     LLCD3
        mov     r9, #0
        str     r6, [sp, #4]
        str     r4, [sp]
LLCD0:
        mov     r7, r9
        mov     r8, #0
        str     r9, [sp, #0x10]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r5, [sp, #0x1C]
LLCD1:
        mov     r6, #0
        mov     r4, r7
        mov     r1, r6
        mov     r5, r1
        mov     r3, #4
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        str     r12, [sp, #0x20]
LLCD2:
        ldr     r11, [sp]
        mov     r7, r5, lsl #1
        ldrh    r12, [r0, +r7]
        mov     r8, r6, lsl #1
        ldrh    r10, [r2, +r8]
        add     r5, r5, r11
        ldr     r11, [sp, #4]
        mov     r9, r4, lsl #1
        sub     r12, r12, r10
        add     r7, r0, r7
        add     r8, r2, r8
        mov     r12, r12, lsl #16
        add     r10, lr, r9
        add     r6, r6, r11
        mov     r12, r12, asr #16
        strh    r12, [lr, +r9]
        ldrh    r9, [r7, #2]
        ldrh    r11, [r8, #2]
        add     r12, r1, r12
        add     r4, r4, #4
        subs    r3, r3, #1
        sub     r9, r9, r11
        mov     r1, r9, lsl #16
        mov     r11, r1, asr #16
        strh    r11, [r10, #2]
        ldrh    r1, [r7, #4]
        ldrh    r9, [r8, #4]
        add     r12, r12, r11
        sub     r1, r1, r9
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r10, #4]
        ldrh    r7, [r7, #6]
        ldrh    r8, [r8, #6]
        add     r1, r12, r1
        sub     r7, r7, r8
        mov     r12, r7, lsl #16
        mov     r12, r12, asr #16
        add     r1, r1, r12
        strh    r12, [r10, #6]
        bne     LLCD2
        ldr     r8, [sp, #0xC]
        ldr     r12, [sp, #0x20]
        ldr     r7, [sp, #8]
        add     r2, r2, #8
        add     r0, r0, #8
        str     r1, [r12, +r8, lsl #2]
        add     r8, r8, #1
        cmp     r8, #4
        add     r7, r7, #0x10
        blt     LLCD1
        ldr     r5, [sp, #0x1C]
        ldr     r9, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        subs    r5, r5, #1
        add     r2, r2, r3, lsl #1
        add     r12, r12, #0x10
        add     r0, r0, r1, lsl #1
        add     r9, r9, #0x40
        bne     LLCD0
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLCD3:
        mov     lr, r5
        str     r6, [sp, #4]
        str     r4, [sp]
LLCD4:
        mov     r6, #0
        str     lr, [sp, #0x10]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x18]
LLCD5:
        mov     r1, #0
        mov     r3, r5
        mov     r4, r1
        mov     lr, r4
        str     r6, [sp, #0xC]
        str     r5, [sp, #0x1C]
        str     r12, [sp, #0x20]
LLCD6:
        mov     r12, r4, lsl #1
        ldrh    r5, [r0, +r12]
        mov     r7, lr, lsl #1
        ldrh    r6, [r2, +r7]
        add     r12, r0, r12
        add     r11, r2, r7
        ldrh    r7, [r12, #2]
        ldrh    r8, [r11, #2]
        ldrh    r9, [r12, #4]
        ldrh    r10, [r11, #4]
        ldrh    r12, [r12, #6]
        ldrh    r11, [r11, #6]
        sub     r5, r5, r6
        sub     r7, r7, r8
        sub     r9, r9, r10
        mov     r6, r5, lsl #16
        sub     r12, r12, r11
        mov     r7, r7, lsl #16
        add     r6, r1, r6, asr #16
        mov     r1, r12, lsl #16
        ldr     r12, [sp]
        mov     r5, r9, lsl #16
        add     r7, r6, r7, asr #16
        add     r5, r7, r5, asr #16
        add     r4, r4, r12
        ldr     r12, [sp, #4]
        subs    r3, r3, #1
        add     r1, r5, r1, asr #16
        add     lr, lr, r12
        bne     LLCD6
        ldr     r6, [sp, #0xC]
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        add     r2, r2, #8
        add     r0, r0, #8
        str     r1, [r12, +r6, lsl #2]
        add     r6, r6, #1
        cmp     r6, #4
        blt     LLCD5
        ldr     lr, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        subs    lr, lr, #1
        add     r12, r12, #0x10
        add     r0, r0, r1, lsl #1
        add     r2, r2, r3, lsl #1
        bne     LLCD4
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LLCD7:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


