        .text
        .align  4
        .globl  _ippiTransformQuantInvAddPred4x4_H264_16s_C1IR


_ippiTransformQuantInvAddPred4x4_H264_16s_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r12, [sp, #0x7C]
        ldr     lr, [sp, #0x80]
        ldr     r5, [sp, #0x84]
        ldr     r6, [sp, #0x88]
        ldr     r4, [sp, #0x8C]
        cmp     r0, #0
        beq     LLBQ12
        cmp     r12, #0
        beq     LLBQ12
        cmp     r2, #0
        beq     LLBQ12
        cmp     r5, #0
        blt     LLBQ7
        cmp     r5, #0x33
        bgt     LLBQ7
        ldr     r8, [pc, #0xF14]
        ldr     r7, [pc, #0xF14]
        cmp     r4, #0
        ldrb    r8, [r5, +r8]
        ldrb    r7, [r5, +r7]
        ldreq   r4, [pc, #0xF08]
        addeq   r4, r4, r8, lsl #5
        cmp     r6, #0
        mov     r8, #1
        mov     r6, #0
        beq     LLBQ4
        cmp     r5, #0x18
        blt     LLBQ1
        cmp     r3, #0
        sub     r5, r7, #4
        ldrnesh r3, [r3]
        beq     LLBQ8
LLBQ0:
        ldrsh   r7, [r2, #2]
        ldrsh   r9, [r2, #8]
        strh    r3, [r2]
        ldrsh   r8, [r4, #2]
        ldrsh   r3, [r2, #4]
        mul     r8, r7, r8
        ldrsh   r7, [r2, #6]
        str     r9, [sp]
        ldrsh   r9, [r2, #0xA]
        mov     r8, r8, lsl r5
        str     r9, [sp, #4]
        strh    r8, [r2, #2]
        ldrsh   r8, [r4, #4]
        mul     r3, r3, r8
        ldrsh   r8, [r2, #0xC]
        str     r8, [sp, #8]
        ldrsh   r8, [r2, #0xE]
        mov     r3, r3, lsl r5
        str     r8, [sp, #0xC]
        ldrsh   r8, [r2, #0x10]
        str     r8, [sp, #0x10]
        ldrsh   r8, [r2, #0x12]
        strh    r3, [r2, #4]
        ldrsh   r3, [r4, #6]
        str     r8, [sp, #0x14]
        ldrsh   r8, [r2, #0x14]
        mul     r10, r7, r3
        str     r8, [sp, #0x18]
        ldrsh   r8, [r2, #0x16]
        mov     r10, r10, lsl r5
        str     r8, [sp, #0x1C]
        strh    r10, [r2, #6]
        ldrsh   r10, [r4, #8]
        ldr     r11, [sp]
        ldrsh   r3, [r2, #0x18]
        ldrsh   r7, [r2, #0x1A]
        ldrsh   r8, [r2, #0x1C]
        mul     r11, r10, r11
        ldrsh   r9, [r2, #0x1E]
        mov     r10, r11, lsl r5
        strh    r10, [r2, #8]
        ldr     r11, [sp, #4]
        ldrsh   r10, [r4, #0xA]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0xA]
        ldr     r11, [sp, #8]
        ldrsh   r10, [r4, #0xC]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0xC]
        ldrsh   r10, [r4, #0xE]
        ldr     r11, [sp, #0xC]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0xE]
        ldr     r11, [sp, #0x10]
        ldrsh   r10, [r4, #0x10]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0x10]
        ldr     r11, [sp, #0x14]
        ldrsh   r10, [r4, #0x12]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0x12]
        ldr     r11, [sp, #0x18]
        ldrsh   r10, [r4, #0x14]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0x14]
        ldr     r11, [sp, #0x1C]
        ldrsh   r10, [r4, #0x16]
        mul     r11, r10, r11
        mov     r10, r11, lsl r5
        strh    r10, [r2, #0x16]
        ldrsh   r10, [r4, #0x18]
        mul     r3, r10, r3
        mov     r3, r3, lsl r5
        strh    r3, [r2, #0x18]
        ldrsh   r3, [r4, #0x1A]
        mul     r7, r3, r7
        mov     r3, r7, lsl r5
        strh    r3, [r2, #0x1A]
        ldrsh   r3, [r4, #0x1C]
        mul     r8, r3, r8
        mov     r3, r8, lsl r5
        strh    r3, [r2, #0x1C]
        ldrsh   r4, [r4, #0x1E]
        mul     r9, r4, r9
        mov     r5, r9, lsl r5
        b       LLBQ3
LLBQ1:
        rsb     r5, r7, #4
        sub     r7, r5, #1
        cmp     r3, #0
        mov     r7, r8, lsl r7
        ldrnesh r3, [r3]
        beq     LLBQ9
LLBQ2:
        ldrsh   r8, [r2, #4]
        strh    r3, [r2]
        ldrsh   r9, [r4, #2]
        ldrsh   r3, [r2, #2]
        mla     r3, r3, r9, r7
        ldrsh   r9, [r2, #6]
        str     r9, [sp, #0x1C]
        ldrsh   r9, [r2, #8]
        mov     r3, r3, asr r5
        str     r9, [sp, #0x18]
        ldrsh   r9, [r2, #0xA]
        str     r9, [sp, #0x14]
        ldrsh   r9, [r2, #0xC]
        str     r9, [sp, #0x10]
        ldrsh   r9, [r2, #0xE]
        strh    r3, [r2, #2]
        ldrsh   r3, [r4, #4]
        str     r9, [sp, #0xC]
        ldrsh   r9, [r2, #0x10]
        mla     r8, r8, r3, r7
        str     r9, [sp, #8]
        ldrsh   r9, [r2, #0x12]
        str     r9, [sp, #4]
        ldrsh   r3, [r2, #0x14]
        mov     r8, r8, asr r5
        str     r3, [sp]
        ldrsh   r3, [r2, #0x16]
        str     r3, [sp, #0x20]
        ldrsh   r3, [r2, #0x18]
        str     r3, [sp, #0x24]
        strh    r8, [r2, #4]
        ldrsh   r11, [r4, #6]
        ldr     r10, [sp, #0x1C]
        ldrsh   r9, [r2, #0x1A]
        ldrsh   r3, [r2, #0x1C]
        ldrsh   r8, [r2, #0x1E]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #6]
        ldr     r11, [sp, #0x18]
        ldrsh   r10, [r4, #8]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #8]
        ldr     r11, [sp, #0x14]
        ldrsh   r10, [r4, #0xA]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0xA]
        ldr     r11, [sp, #0x10]
        ldrsh   r10, [r4, #0xC]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0xC]
        ldrsh   r10, [r4, #0xE]
        ldr     r11, [sp, #0xC]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0xE]
        ldrsh   r10, [r4, #0x10]
        ldr     r11, [sp, #8]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0x10]
        ldr     r11, [sp, #4]
        ldrsh   r10, [r4, #0x12]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0x12]
        ldr     r11, [sp]
        ldrsh   r10, [r4, #0x14]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0x14]
        ldr     r11, [sp, #0x20]
        ldrsh   r10, [r4, #0x16]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0x16]
        ldr     r11, [sp, #0x24]
        ldrsh   r10, [r4, #0x18]
        mla     r11, r10, r11, r7
        mov     r10, r11, asr r5
        strh    r10, [r2, #0x18]
        ldrsh   r10, [r4, #0x1A]
        mla     r9, r10, r9, r7
        mov     r9, r9, asr r5
        strh    r9, [r2, #0x1A]
        ldrsh   r9, [r4, #0x1C]
        mla     r3, r9, r3, r7
        mov     r3, r3, asr r5
        strh    r3, [r2, #0x1C]
        ldrsh   r4, [r4, #0x1E]
        mla     r7, r4, r8, r7
        mov     r5, r7, asr r5
LLBQ3:
        strh    r5, [r2, #0x1E]
        add     r5, sp, #0x48
        str     r2, [r5]
        add     r3, sp, #0x4C
        add     r5, sp, #0x48
        ldr     r5, [r5]
        add     r7, r2, #8
        str     r7, [r3]
        ldrsh   r9, [r5, #2]
        ldrsh   r7, [r5, #6]
        ldrsh   r11, [r5]
        ldrsh   r10, [r5, #4]
        add     r8, r2, #0x18
        add     r4, sp, #0x48
        str     r8, [r4, #0xC]
        rsb     r8, r7, r9, asr #1
        add     r4, sp, #0x48
        ldr     r4, [r4, #0xC]
        add     r7, r9, r7, asr #1
        add     r9, r11, r10
        add     r3, sp, #0x48
        ldr     r3, [r3, #4]
        mov     r7, r7, lsl #16
        sub     r10, r11, r10
        mov     r9, r9, lsl #16
        mov     r7, r7, asr #16
        mov     r8, r8, lsl #16
        mov     r10, r10, lsl #16
        rsb     r11, r7, r9, asr #16
        add     r9, r7, r9, asr #16
        mov     r8, r8, asr #16
        strh    r11, [r5, #6]
        strh    r9, [r5]
        add     r7, r8, r10, asr #16
        strh    r7, [r5, #2]
        rsb     r10, r8, r10, asr #16
        strh    r10, [r5, #4]
        ldrsh   r8, [r3, #4]
        ldrsh   r7, [r3]
        add     r11, sp, #0x50
        add     r9, r2, #0x10
        str     r7, [sp, #0x24]
        ldrsh   r10, [r3, #2]
        ldrsh   r7, [r3, #6]
        str     r9, [r11]
        add     r9, sp, #0x48
        ldr     r9, [r9, #8]
        rsb     r11, r7, r10, asr #1
        add     r7, r10, r7, asr #1
        ldr     r10, [sp, #0x24]
        str     r11, [sp, #0x20]
        mov     r7, r7, lsl #16
        add     r11, r10, r8
        sub     r10, r10, r8
        ldr     r8, [sp, #0x20]
        mov     r11, r11, lsl #16
        mov     r7, r7, asr #16
        str     r7, [sp, #0x24]
        rsb     r7, r7, r11, asr #16
        strh    r7, [r3, #6]
        ldr     r7, [sp, #0x24]
        mov     r8, r8, lsl #16
        mov     r10, r10, lsl #16
        add     r11, r7, r11, asr #16
        strh    r11, [r3]
        mov     r8, r8, asr #16
        add     r7, r8, r10, asr #16
        strh    r7, [r3, #2]
        rsb     r10, r8, r10, asr #16
        strh    r10, [r3, #4]
        ldrsh   r8, [r9, #2]
        ldrsh   r7, [r9]
        ldrsh   r10, [r9, #6]
        add     r11, r12, lr
        str     r10, [sp, #0x24]
        ldrsh   r10, [r9, #4]
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        rsb     r11, r11, r8, asr #1
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x24]
        add     r8, r8, r11, asr #1
        add     r11, r7, r10
        str     r11, [sp, #0x24]
        sub     r11, r7, r10
        ldr     r7, [sp, #0x1C]
        mov     r10, r8, lsl #16
        ldr     r8, [sp, #0x24]
        mov     r11, r11, lsl #16
        mov     r10, r10, asr #16
        str     r10, [sp, #0x24]
        mov     r8, r8, lsl #16
        mov     r7, r7, lsl #16
        rsb     r10, r10, r8, asr #16
        strh    r10, [r9, #6]
        ldr     r10, [sp, #0x24]
        mov     r7, r7, asr #16
        add     r8, r10, r8, asr #16
        strh    r8, [r9]
        add     r8, r7, r11, asr #16
        strh    r8, [r9, #2]
        rsb     r11, r7, r11, asr #16
        strh    r11, [r9, #4]
        ldrsh   r8, [r4, #2]
        ldrsh   r11, [r4, #6]
        str     r11, [sp, #0x24]
        ldrsh   r10, [r4]
        ldrsh   r7, [r4, #4]
        rsb     r11, r11, r8, asr #1
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x24]
        add     r11, r8, r11, asr #1
        str     r11, [sp, #0x24]
        sub     r8, r10, r7
        ldr     r11, [sp, #0x24]
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        add     r10, r10, r7
        ldr     r7, [sp, #0x18]
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x24]
        mov     r8, r8, lsl #16
        mov     r7, r7, lsl #16
        mov     r11, r10, lsl #16
        mov     r8, r8, asr #16
        add     r10, r8, r7, asr #16
        strh    r10, [r4, #2]
        ldr     r10, [sp, #0x24]
        rsb     r7, r8, r7, asr #16
        strh    r7, [r4, #4]
        mov     r10, r10, asr #16
        rsb     r7, r10, r11, asr #16
        strh    r7, [r4, #6]
        add     r11, r10, r11, asr #16
        strh    r11, [r4]
        ldrsh   r7, [r2, #8]
        ldrsh   r8, [r2, #0x18]
        ldrsh   r10, [r2, #0xA]
        str     r10, [sp, #0x24]
        ldrsh   r10, [r2, #0x1A]
        str     r10, [sp, #0x1C]
        ldrsh   r10, [r2, #0xC]
        ldrsh   r11, [r2, #0x1C]
        str     r11, [sp, #0x18]
        ldrsh   r11, [r2, #0xE]
        str     r11, [sp, #0x14]
        ldrsh   r11, [r2, #0x1E]
        str     r11, [sp, #0x10]
        ldrsh   r11, [r2]
        str     r11, [sp, #0xC]
        ldrsh   r11, [r2, #0x10]
        str     r11, [sp, #8]
        ldrsh   r11, [r2, #2]
        str     r11, [sp, #4]
        ldrsh   r11, [r2, #0x12]
        str     r11, [sp]
        ldrsh   r11, [r2, #4]
        str     r11, [sp, #0x28]
        ldrsh   r11, [r2, #0x14]
        str     r11, [sp, #0x2C]
        ldrsh   r11, [r2, #6]
        str     r11, [sp, #0x30]
        ldrsh   r11, [r2, #0x16]
        str     r11, [sp, #0x34]
        rsb     r11, r8, r7, asr #1
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #4]
        add     r8, r7, r8, asr #1
        str     r8, [sp, #0x3C]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x24]
        rsb     r8, r7, r8, asr #1
        ldr     r7, [sp, #0x24]
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x1C]
        add     r8, r7, r8, asr #1
        ldr     r7, [sp, #0x18]
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x14]
        rsb     r7, r7, r10, asr #1
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        add     r7, r10, r7, asr #1
        ldr     r10, [sp, #0xC]
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        rsb     r8, r7, r8, asr #1
        ldr     r7, [sp, #0x14]
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x10]
        add     r8, r7, r8, asr #1
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #8]
        add     r7, r10, r8
        sub     r10, r10, r8
        ldr     r8, [sp, #0x38]
        str     r10, [sp, #0x10]
        ldr     r10, [sp]
        mov     r7, r7, lsl #16
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x3C]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x3C]
        add     r8, r11, r10
        str     r8, [sp, #0xC]
        ldr     r8, [sp, #0x40]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x2C]
        str     r11, [sp, #8]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x24]
        add     r8, r11, r10
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x1C]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x34]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x28]
        ldr     r8, [sp, #0x18]
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x30]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x1C]
        add     r8, r11, r10
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #0x44]
        sub     r11, r11, r10
        str     r11, [sp, #0x34]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x14]
        str     r7, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x30]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #0x38]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0xC]
        ldr     r10, [sp, #0x3C]
        mov     r8, r7, lsl #16
        ldr     r7, [sp, #8]
        add     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x38]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0xC]
        ldr     r7, [sp, #0x40]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x40]
        ldr     r7, [sp, #0x24]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #4]
        mov     r7, r7, lsl #16
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x2C]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #0x1C]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0x34]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x34]
        ldr     r7, [sp, #0x44]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x44]
        ldr     r7, [sp, #0x30]
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x10]
        mov     r7, r7, asr #16
        add     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x38]
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x10]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x3C]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x14]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x24]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0xC]
        add     r10, r10, r8, asr #16
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x40]
        add     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x40]
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x24]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x34]
        rsb     r8, r10, r8, asr #16
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x1C]
        ldr     r10, [sp, #8]
        add     r10, r8, r10, asr #16
        ldr     r8, [sp, #0x28]
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x2C]
        add     r10, r8, r10, asr #16
        str     r10, [sp]
        ldr     r8, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        rsb     r10, r8, r10, asr #16
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #8]
        ldr     r8, [sp, #0x1C]
        rsb     r10, r8, r10, asr #16
        ldr     r8, [sp, #0x18]
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x44]
        add     r8, r7, r8, asr #16
        str     r8, [sp, #0x1C]
        add     r8, r10, r11, asr #16
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x18]
        str     r11, [sp, #0x44]
        add     r8, r8, #0x20
        rsb     r11, r7, r10, asr #16
        ldr     r7, [sp, #0x30]
        ldr     r10, [sp, #4]
        add     r11, r11, #0x20
        add     r7, r7, #0x20
        mov     r8, r8, asr #6
        add     r10, r10, #0x20
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        mov     r7, r7, asr #6
        mov     r11, r11, asr #6
        add     r10, r10, #0x20
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x3C]
        add     r10, r10, #0x20
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x14]
        add     r10, r10, #0x20
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x10]
        add     r10, r10, #0x20
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x40]
        add     r10, r10, #0x20
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x24]
        add     r10, r10, #0x20
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0xC]
        add     r10, r10, #0x20
        str     r10, [sp, #0x14]
        ldr     r10, [sp]
        add     r10, r10, #0x20
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x2C]
        add     r10, r10, #0x20
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        add     r10, r10, #0x20
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x1C]
        add     r10, r10, #0x20
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x44]
        strh    r7, [r2]
        ldr     r7, [sp, #0x34]
        add     r10, r10, #0x20
        mov     r7, r7, asr #6
        strh    r7, [r2, #8]
        ldr     r7, [sp, #0x38]
        mov     r10, r10, asr #6
        mov     r7, r7, asr #6
        strh    r7, [r2, #0x10]
        ldr     r7, [sp, #0x3C]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0x18]
        ldr     r7, [sp, #0x30]
        mov     r7, r7, asr #6
        strh    r7, [r2, #2]
        ldr     r7, [sp, #0x18]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0xA]
        ldr     r7, [sp, #0x40]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0x12]
        ldr     r7, [sp, #0x24]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0x1A]
        ldr     r7, [sp, #0x14]
        mov     r7, r7, asr #6
        strh    r7, [r2, #4]
        ldr     r7, [sp, #0x10]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0xC]
        ldr     r7, [sp, #0x2C]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0x14]
        ldr     r7, [sp, #0x28]
        mov     r7, r7, asr #6
        strh    r7, [r2, #0x1C]
        ldr     r7, [sp, #0x1C]
        strh    r11, [r2, #0x1E]
        strh    r8, [r2, #0xE]
        mov     r7, r7, asr #6
        strh    r7, [r2, #6]
        strh    r10, [r2, #0x16]
        ldrb    r8, [r0]
        ldrsh   r10, [r5]
        add     r2, r0, r1
        str     r2, [sp, #0x44]
        ldr     r2, [sp, #0x20]
        add     r10, r8, r10
        cmp     r10, #0xFF
        add     r7, r2, lr
        ldr     r2, [sp, #0x44]
        mov     r8, #0xFF
        movgt   r10, r8
        cmp     r10, #0
        add     r2, r2, r1
        movlt   r10, r6
        strb    r10, [r12]
        ldrb    r8, [r0, #1]
        add     r11, r2, r1
        str     r8, [sp, #0x40]
        ldrsh   r10, [r5, #2]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x40]
        add     r8, r7, lr
        add     r10, r11, r10
        mov     r11, #0xFF
        cmp     r10, #0xFF
        movgt   r10, r11
        cmp     r10, #0
        movlt   r10, r6
        strb    r10, [r12, #1]
        ldrb    r10, [r0, #2]
        ldrsh   r11, [r5, #4]
        add     r10, r10, r11
        cmp     r10, #0xFF
        mov     r11, #0xFF
        movgt   r10, r11
        cmp     r10, #0
        movlt   r10, r6
        strb    r10, [r12, #2]
        ldrb    r10, [r0, #3]
        ldrsh   r5, [r5, #6]
        add     r5, r10, r5
        cmp     r5, #0xFF
        mov     r10, #0xFF
        movgt   r5, r10
        cmp     r5, #0
        movlt   r5, r6
        strb    r5, [r12, #3]
        ldrb    r0, [r1, +r0]
        ldrsh   r5, [r3]
        add     r0, r0, r5
        mov     r5, #0xFF
        cmp     r0, #0xFF
        movgt   r0, r5
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [lr, +r12]
        ldr     r0, [sp, #0x44]
        ldrsh   r12, [r3, #2]
        ldrb    r0, [r0, #1]
        add     r0, r0, r12
        cmp     r0, #0xFF
        mov     r12, #0xFF
        movgt   r0, r12
        ldr     r12, [sp, #0x20]
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r12, #1]
        ldr     r0, [sp, #0x44]
        ldrsh   r12, [r3, #4]
        ldrb    r0, [r0, #2]
        add     r0, r0, r12
        cmp     r0, #0xFF
        mov     r12, #0xFF
        movgt   r0, r12
        ldr     r12, [sp, #0x20]
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r12, #2]
        ldr     r0, [sp, #0x44]
        ldrsh   r3, [r3, #6]
        ldrb    r0, [r0, #3]
        add     r0, r0, r3
        cmp     r0, #0xFF
        mov     r3, #0xFF
        movgt   r0, r3
        ldr     r3, [sp, #0x20]
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r3, #3]
        ldr     r0, [sp, #0x44]
        ldrsh   r3, [r9]
        ldrb    r0, [r1, +r0]
        add     r0, r0, r3
        cmp     r0, #0xFF
        mov     r3, #0xFF
        movgt   r0, r3
        ldr     r3, [sp, #0x20]
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [lr, +r3]
        ldrsh   r3, [r9, #2]
        ldrb    r0, [r2, #1]
        add     r0, r0, r3
        mov     r3, #0xFF
        cmp     r0, #0xFF
        movgt   r0, r3
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r7, #1]
        ldrsh   r3, [r9, #4]
        ldrb    r0, [r2, #2]
        add     r0, r0, r3
        mov     r3, #0xFF
        cmp     r0, #0xFF
        movgt   r0, r3
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r7, #2]
        ldrb    r0, [r2, #3]
        ldrsh   r9, [r9, #6]
        add     r9, r0, r9
        mov     r0, #0xFF
        cmp     r9, #0xFF
        movgt   r9, r0
        cmp     r9, #0
        movlt   r9, r6
        strb    r9, [r7, #3]
        ldrb    r2, [r1, +r2]
        ldrsh   r0, [r4]
        add     r2, r2, r0
        mov     r0, #0xFF
        cmp     r2, #0xFF
        movgt   r2, r0
        cmp     r2, #0
        movlt   r2, r6
        strb    r2, [lr, +r7]
        ldr     r0, [sp, #0x3C]
        ldrsh   r1, [r4, #2]
        ldrb    r0, [r0, #1]
        add     r0, r0, r1
        cmp     r0, #0xFF
        mov     r1, #0xFF
        movgt   r0, r1
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r8, #1]
        ldr     r0, [sp, #0x3C]
        ldrsh   r1, [r4, #4]
        ldrb    r0, [r0, #2]
        add     r0, r0, r1
        cmp     r0, #0xFF
        mov     r1, #0xFF
        movgt   r0, r1
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [r8, #2]
        ldr     r0, [sp, #0x3C]
        ldrsh   r4, [r4, #6]
        mov     r1, #0xFF
        ldrb    r0, [r0, #3]
        add     r0, r0, r4
        cmp     r0, #0xFF
        movgt   r0, r1
        cmp     r0, #0
        movlt   r0, r6
        b       LLBQ6
LLBQ4:
        cmp     r3, #0
        ldrnesh r2, [r3]
        beq     LLBQ10
LLBQ5:
        ldrb    r3, [r0]
        add     r2, r2, #0x20
        add     r7, r0, r1
        mov     r9, #0xFF
        mov     r2, r2, asr #6
        add     r4, r12, lr
        add     r5, r4, lr
        mov     r2, r2, lsl #16
        add     r3, r3, r2, asr #16
        cmp     r3, #0xFF
        movgt   r3, r9
        cmp     r3, #0
        movlt   r3, r6
        strb    r3, [r12]
        ldrb    r8, [r0, #1]
        add     r3, r7, r1
        add     r8, r8, r2, asr #16
        cmp     r8, #0xFF
        movgt   r8, r9
        cmp     r8, #0
        movlt   r8, r6
        strb    r8, [r12, #1]
        ldrb    r8, [r0, #2]
        add     r8, r8, r2, asr #16
        cmp     r8, #0xFF
        movgt   r8, r9
        cmp     r8, #0
        movlt   r8, r6
        strb    r8, [r12, #2]
        ldrb    r8, [r0, #3]
        add     r8, r8, r2, asr #16
        cmp     r8, #0xFF
        movgt   r8, r9
        cmp     r8, #0
        movlt   r8, r6
        strb    r8, [r12, #3]
        ldrb    r0, [r1, +r0]
        add     r8, r5, lr
        add     r0, r0, r2, asr #16
        cmp     r0, #0xFF
        movgt   r0, r9
        cmp     r0, #0
        movlt   r0, r6
        strb    r0, [lr, +r12]
        ldrb    r12, [r7, #1]
        add     r0, r3, r1
        add     r12, r12, r2, asr #16
        cmp     r12, #0xFF
        movgt   r12, r9
        cmp     r12, #0
        movlt   r12, r6
        strb    r12, [r4, #1]
        ldrb    r12, [r7, #2]
        add     r12, r12, r2, asr #16
        cmp     r12, #0xFF
        movgt   r12, r9
        cmp     r12, #0
        movlt   r12, r6
        strb    r12, [r4, #2]
        ldrb    r12, [r7, #3]
        add     r12, r12, r2, asr #16
        cmp     r12, #0xFF
        movgt   r12, r9
        cmp     r12, #0
        movlt   r12, r6
        strb    r12, [r4, #3]
        ldrb    r7, [r1, +r7]
        add     r7, r7, r2, asr #16
        cmp     r7, #0xFF
        movgt   r7, r9
        cmp     r7, #0
        movlt   r7, r6
        strb    r7, [lr, +r4]
        ldrb    r12, [r3, #1]
        add     r12, r12, r2, asr #16
        cmp     r12, #0xFF
        movgt   r12, r9
        cmp     r12, #0
        movlt   r12, r6
        strb    r12, [r5, #1]
        ldrb    r12, [r3, #2]
        add     r12, r12, r2, asr #16
        cmp     r12, #0xFF
        movgt   r12, r9
        cmp     r12, #0
        movlt   r12, r6
        strb    r12, [r5, #2]
        ldrb    r12, [r3, #3]
        add     r12, r12, r2, asr #16
        cmp     r12, #0xFF
        movgt   r12, r9
        cmp     r12, #0
        movlt   r12, r6
        strb    r12, [r5, #3]
        ldrb    r3, [r1, +r3]
        add     r1, r3, r2, asr #16
        cmp     r1, #0xFF
        movgt   r1, r9
        cmp     r1, #0
        movlt   r1, r6
        strb    r1, [lr, +r5]
        ldrb    r1, [r0, #1]
        add     r1, r1, r2, asr #16
        cmp     r1, #0xFF
        movgt   r1, r9
        cmp     r1, #0
        movlt   r1, r6
        strb    r1, [r8, #1]
        ldrb    r1, [r0, #2]
        add     r1, r1, r2, asr #16
        cmp     r1, #0xFF
        movgt   r1, r9
        cmp     r1, #0
        movlt   r1, r6
        strb    r1, [r8, #2]
        ldrb    r0, [r0, #3]
        add     r0, r0, r2, asr #16
        cmp     r0, #0xFF
        movgt   r0, r9
        cmp     r0, #0
        movlt   r0, r6
LLBQ6:
        strb    r0, [r8, #3]
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LLBQ7:
        mvn     r0, #0xA
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LLBQ8:
        ldrsh   r7, [r2]
        ldrsh   r3, [r4]
        mul     r7, r3, r7
        mov     r3, r7, lsl r5
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LLBQ0
LLBQ9:
        ldrsh   r8, [r2]
        ldrsh   r3, [r4]
        mla     r8, r3, r8, r7
        mov     r3, r8, asr r5
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LLBQ2
LLBQ10:
        ldrsh   r2, [r2]
        cmp     r5, #0x18
        blt     LLBQ11
        ldrsh   r4, [r4]
        sub     r7, r7, #4
        mul     r4, r2, r4
        mov     r7, r4, lsl r7
        mov     r2, r7, lsl #16
        mov     r2, r2, asr #16
        b       LLBQ5
LLBQ11:
        ldrsh   r4, [r4]
        rsb     r3, r7, #3
        mov     r3, r8, lsl r3
        mla     r3, r2, r4, r3
        rsb     r7, r7, #4
        mov     r7, r3, asr r7
        mov     r2, r7, lsl #16
        mov     r2, r2, asr #16
        b       LLBQ5
LLBQ12:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBQ_h264_qp_rem
        .long   LLBQ_h264_qp6
        .long   LLBQ_InvLevelScale_4x4_default


        .data
        .align  4


LLBQ_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBQ_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBQ_InvLevelScale_4x4_default:
        .byte   0xA0,0x00,0xD0,0x00,0xA0,0x00,0xD0,0x00,0xD0,0x00,0x00,0x01,0xD0,0x00,0x00,0x01
        .byte   0xA0,0x00,0xD0,0x00,0xA0,0x00,0xD0,0x00,0xD0,0x00,0x00,0x01,0xD0,0x00,0x00,0x01
        .byte   0xB0,0x00,0xE0,0x00,0xB0,0x00,0xE0,0x00,0xE0,0x00,0x20,0x01,0xE0,0x00,0x20,0x01
        .byte   0xB0,0x00,0xE0,0x00,0xB0,0x00,0xE0,0x00,0xE0,0x00,0x20,0x01,0xE0,0x00,0x20,0x01
        .byte   0xD0,0x00,0x00,0x01,0xD0,0x00,0x00,0x01,0x00,0x01,0x40,0x01,0x00,0x01,0x40,0x01
        .byte   0xD0,0x00,0x00,0x01,0xD0,0x00,0x00,0x01,0x00,0x01,0x40,0x01,0x00,0x01,0x40,0x01
        .byte   0xE0,0x00,0x20,0x01,0xE0,0x00,0x20,0x01,0x20,0x01,0x70,0x01,0x20,0x01,0x70,0x01
        .byte   0xE0,0x00,0x20,0x01,0xE0,0x00,0x20,0x01,0x20,0x01,0x70,0x01,0x20,0x01,0x70,0x01
        .byte   0x00,0x01,0x40,0x01,0x00,0x01,0x40,0x01,0x40,0x01,0x90,0x01,0x40,0x01,0x90,0x01
        .byte   0x00,0x01,0x40,0x01,0x00,0x01,0x40,0x01,0x40,0x01,0x90,0x01,0x40,0x01,0x90,0x01
        .byte   0x20,0x01,0x70,0x01,0x20,0x01,0x70,0x01,0x70,0x01,0xD0,0x01,0x70,0x01,0xD0,0x01
        .byte   0x20,0x01,0x70,0x01,0x20,0x01,0x70,0x01,0x70,0x01,0xD0,0x01,0x70,0x01,0xD0,0x01


