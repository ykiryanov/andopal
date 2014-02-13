        .text
        .align  4
        .globl  _ippiSumsDiff8x8Blocks4x4_16u32s_C1R


_ippiSumsDiff8x8Blocks4x4_16u32s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
        cmp     r0, #0
        beq     LLCC6
        cmp     r2, #0
        beq     LLCC6
        cmp     lr, #0
        beq     LLCC6
        mov     r8, r1, asr #1
        mov     r7, r3, asr #1
        mov     r3, r8, lsl #2
        mov     r1, r7, lsl #2
        mov     r4, #0
        cmp     r12, #0
        sub     r3, r3, #8
        sub     r1, r1, #8
        mov     r6, #2
        mov     r5, r4
        beq     LLCC3
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
LLCC0:
        mov     r7, r4
        mov     r9, #0
        mov     r8, r9
        str     r4, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r6, [sp, #0x24]
LLCC1:
        mov     r6, #0
        str     r5, [lr, +r8, lsl #2]
        mov     r10, r6
        mov     r4, r10
        mov     r3, r4
        mov     r1, r7
        str     r10, [sp]
        str     r7, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r0, [sp, #4]
LLCC2:
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #4]
        mov     r5, r3, lsl #1
        mov     r0, r6, lsl #1
        ldrh    r10, [r2, +r0]
        ldrh    r7, [r8, +r5]
        add     r3, r3, r11
        ldr     r11, [sp, #0xC]
        sub     r10, r7, r10
        add     r5, r8, r5
        add     r0, r2, r0
        add     r6, r6, r11
        ldr     r11, [sp]
        mov     r10, r10, lsl #16
        mov     r8, r1, lsl #1
        mov     r10, r10, asr #16
        add     r11, r11, r10
        str     r11, [lr, +r9, lsl #2]
        strh    r10, [r12, +r8]
        ldrh    r10, [r5, #2]
        ldrh    r11, [r0, #2]
        add     r7, r12, r8
        ldr     r8, [lr, +r9, lsl #2]
        add     r1, r1, #4
        sub     r10, r10, r11
        add     r4, r4, #1
        cmp     r4, #4
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        add     r8, r8, r10
        str     r8, [lr, +r9, lsl #2]
        strh    r10, [r7, #2]
        ldrh    r10, [r5, #4]
        ldrh    r11, [r0, #4]
        ldr     r8, [lr, +r9, lsl #2]
        sub     r10, r10, r11
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        add     r8, r8, r10
        str     r8, [lr, +r9, lsl #2]
        strh    r10, [r7, #4]
        ldrh    r5, [r5, #6]
        ldrh    r8, [r0, #6]
        ldr     r0, [lr, +r9, lsl #2]
        sub     r5, r5, r8
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        add     r0, r0, r5
        str     r0, [lr, +r9, lsl #2]
        strh    r5, [r7, #6]
        ldrlt   r0, [lr, +r9, lsl #2]
        strlt   r0, [sp]
        blt     LLCC2
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r0, [sp, #4]
        add     r8, r8, #1
        cmp     r8, #2
        mov     r5, #0
        add     r2, r2, #8
        add     r0, r0, #8
        add     r9, r9, #1
        add     r7, r7, #0x10
        blt     LLCC1
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        subs    r6, r6, #1
        add     r2, r2, r1, lsl #1
        add     lr, lr, #8
        add     r0, r0, r3, lsl #1
        add     r4, r4, #0x20
        bne     LLCC0
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LLCC3:
        mov     r9, r4
        mov     r12, r9
        str     r4, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r6, [sp, #0x24]
LLCC4:
        mov     r6, #0
        str     r5, [lr, +r9, lsl #2]
        mov     r1, r6
        mov     r4, r1
        mov     r3, #4
        str     r9, [sp, #0x14]
LLCC5:
        mov     r9, r4, lsl #1
        ldrh    r10, [r0, +r9]
        mov     r5, r6, lsl #1
        ldrh    r11, [r2, +r5]
        add     r9, r0, r9
        add     r5, r2, r5
        add     r4, r4, r8
        sub     r10, r10, r11
        add     r6, r6, r7
        subs    r3, r3, #1
        mov     r10, r10, lsl #16
        add     r1, r1, r10, asr #16
        str     r1, [lr, +r12, lsl #2]
        ldrh    r11, [r9, #2]
        ldrh    r10, [r5, #2]
        sub     r11, r11, r10
        mov     r10, r11, lsl #16
        add     r1, r1, r10, asr #16
        str     r1, [lr, +r12, lsl #2]
        ldrh    r11, [r9, #4]
        ldrh    r10, [r5, #4]
        sub     r11, r11, r10
        mov     r10, r11, lsl #16
        add     r1, r1, r10, asr #16
        str     r1, [lr, +r12, lsl #2]
        ldrh    r9, [r9, #6]
        ldrh    r5, [r5, #6]
        sub     r9, r9, r5
        mov     r5, r9, lsl #16
        add     r1, r1, r5, asr #16
        str     r1, [lr, +r12, lsl #2]
        bne     LLCC5
        ldr     r9, [sp, #0x14]
        mov     r5, #0
        add     r2, r2, #8
        add     r9, r9, #1
        cmp     r9, #2
        add     r0, r0, #8
        add     r12, r12, #1
        blt     LLCC4
        ldr     r6, [sp, #0x24]
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        ldr     r4, [sp, #0x18]
        subs    r6, r6, #1
        add     r0, r0, r3, lsl #1
        add     r2, r2, r1, lsl #1
        add     lr, lr, #8
        bne     LLCC3
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LLCC6:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


