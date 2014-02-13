        .text
        .align  4
        .globl  _ippiTransformFwdLuma8x8_H264_16s32s_C1


_ippiTransformFwdLuma8x8_H264_16s32s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4D, 30
        cmp     r0, #0
        beq     LLCB2
        cmp     r1, #0
        beq     LLCB2
        mov     r5, #0
        add     r7, r0, #0xE
        add     r6, r0, #2
        add     lr, r0, #0xC
        add     r12, r0, #4
        add     r3, r0, #0xA
        add     r2, r0, #6
        add     r8, r0, #8
        mov     r4, r5
        str     r8, [sp, #0x1C]
        str     r2, [sp, #0x14]
        str     r3, [sp, #8]
        str     r12, [sp]
        str     lr, [sp, #0xC]
        str     r6, [sp, #4]
        str     r7, [sp, #0x10]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x18]
LLCB0:
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
        ldr     r12, [sp, #0x14]
        ldrsh   r0, [r1], #0x10
        str     r1, [sp, #4]
        ldr     r1, [sp, #0xC]
        ldrsh   r10, [r1], #0x10
        str     r1, [sp, #0xC]
        ldrsh   r1, [r2], #0x10
        str     r2, [sp]
        ldr     r2, [sp, #8]
        sub     r8, r0, r10
        add     r0, r0, r10
        ldrsh   lr, [r2], #0x10
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x18]
        sub     r9, r1, lr
        add     r1, r1, lr
        ldrsh   r3, [r2], #0x10
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x10]
        add     r10, r9, r9, asr #1
        add     r11, r8, r8, asr #1
        ldrsh   r7, [r2], #0x10
        str     r2, [sp, #0x10]
        ldrsh   r2, [r12], #0x10
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        ldrsh   r6, [r12], #0x10
        str     r11, [sp, #0x24]
        str     r12, [sp, #0x1C]
        add     r12, r3, r7
        sub     r3, r3, r7
        add     lr, r2, r6
        add     r11, r3, r3, asr #1
        str     r11, [sp, #0x28]
        sub     r2, r2, r6
        add     r6, r12, lr
        add     r7, r0, r1
        add     r11, r8, r9
        str     r11, [sp, #0x2C]
        sub     r10, r3, r10
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x24]
        sub     r12, r12, lr
        sub     r1, r0, r1
        ldr     lr, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        sub     r3, r3, r10
        add     r10, r2, r2, asr #1
        add     lr, lr, r0
        ldr     r0, [sp, #0x30]
        sub     r9, r8, r9
        add     r11, r6, r7
        str     r11, [sp, #0x24]
        add     r10, r9, r10
        ldr     r9, [sp, #0x24]
        sub     r0, r0, r2
        add     r2, r3, r2
        add     r3, sp, #0x34
        add     r8, sp, #0x34
        str     r9, [r3, +r4, lsl #2]
        add     r3, r12, r1, asr #1
        add     r8, r8, r5
        sub     r6, r6, r7
        rsb     r12, r1, r12, asr #1
        add     r7, lr, r10, asr #2
        add     r1, r0, r2, asr #2
        add     r4, r4, #1
        sub     r2, r2, r0, asr #2
        rsb     lr, r10, lr, asr #2
        cmp     r4, #8
        str     r3, [r8, #0x40]
        str     r6, [r8, #0x80]
        str     r12, [r8, #0xC0]
        str     r7, [r8, #0x20]
        str     r1, [r8, #0x60]
        str     r2, [r8, #0xA0]
        str     lr, [r8, #0xE0]
        add     r5, r5, #4
        blt     LLCB0
        ldr     r1, [sp, #0x20]
        mov     r6, #0
        mov     r5, r6
        add     r2, r1, #0x60
        add     r0, r1, #0xA0
        add     r7, r1, #0xE0
        add     r4, r1, #0x40
        add     lr, r1, #0x80
        add     r12, r1, #0xC0
        add     r3, r1, #0x20
        str     r7, [sp, #0xC]
        str     r0, [sp, #0x18]
        str     r2, [sp, #0x1C]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r1, [sp, #0x20]
LLCB1:
        ldr     r1, [sp, #0x14]
        add     r2, sp, #0x34
        add     r0, r2, r1
        add     r1, r1, #0x20
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r2, [r2, +r1, lsl #5]
        add     r1, r1, #1
        str     r1, [sp, #0x10]
        ldr     r7, [r0, #8]
        ldr     r6, [r0, #0x14]
        ldr     r10, [r0, #0x1C]
        ldr     r5, [r0, #4]
        ldr     r8, [r0, #0x18]
        ldr     r9, [r0, #0x10]
        ldr     r0, [r0, #0xC]
        cmp     r1, #8
        add     r1, r2, r10
        str     r0, [sp, #0x30]
        add     r11, r5, r8
        str     r11, [sp, #0x2C]
        add     r11, r7, r6
        add     r0, r0, r9
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        str     r0, [sp, #0x24]
        add     r0, r1, r0
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x28]
        sub     r2, r2, r10
        sub     r5, r5, r8
        add     r0, r11, r0
        ldr     r11, [sp, #8]
        str     r0, [sp, #4]
        sub     r7, r7, r6
        add     r0, r11, r0
        ldr     r11, [sp, #0x20]
        str     r0, [r11]
        ldr     r0, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        sub     r0, r1, r0
        ldr     r1, [sp, #0x2C]
        sub     r1, r1, r11
        add     r10, r0, r1, asr #1
        str     r10, [r4], #4
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r8, [sp, #4]
        add     r10, r7, r7, asr #1
        sub     r6, r5, r9
        ldr     r5, [sp, #8]
        rsb     r0, r1, r0, asr #1
        sub     r10, r2, r10
        sub     r5, r5, r8
        str     r5, [lr], #4
        ldr     r5, [sp, #0x2C]
        str     r0, [r12], #4
        add     r8, r2, r2, asr #1
        add     r9, r5, r7
        add     r11, r5, r5, asr #1
        sub     r5, r5, r7
        add     r7, r6, r6, asr #1
        add     r9, r8, r9
        add     r7, r5, r7
        sub     r2, r2, r11
        add     r0, r9, r7, asr #2
        str     r0, [r3], #4
        ldr     r1, [sp, #0x20]
        sub     r0, r10, r6
        add     r6, r2, r6
        add     r1, r1, #4
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        add     r2, r0, r6, asr #2
        sub     r6, r6, r0, asr #2
        str     r2, [r1]
        ldr     r0, [sp, #0x18]
        rsb     r9, r7, r9, asr #2
        str     r6, [r0]
        ldr     r0, [sp, #0xC]
        str     r9, [r0], #4
        ldr     r1, [sp, #0x1C]
        str     r0, [sp, #0xC]
        add     r1, r1, #4
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        add     r1, r1, #4
        str     r1, [sp, #0x18]
        blt     LLCB1
        mov     r0, #0
        add     sp, sp, #0x4D, 30
        ldmia   sp!, {r4 - r11, pc}
LLCB2:
        mvn     r0, #7
        add     sp, sp, #0x4D, 30
        ldmia   sp!, {r4 - r11, pc}


