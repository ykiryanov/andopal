        .text
        .align  4
        .globl  _ippiTransformQuantInvAddPred4x4_H264_32s_C1IR


_ippiTransformQuantInvAddPred4x4_H264_32s_C1IR:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r12, [sp, #0x7C]
        ldr     r7, [sp, #0x80]
        ldr     r4, [sp, #0x84]
        ldr     r6, [sp, #0x88]
        ldr     r5, [sp, #0x8C]
        ldr     lr, [sp, #0x90]
        cmp     r0, #0
        beq     LLBP12
        cmp     r2, #0
        beq     LLBP12
        cmp     r12, #0
        beq     LLBP12
        cmp     r4, #0
        blt     LLBP7
        cmp     r4, #0x57
        bgt     LLBP7
        cmp     r5, #9
        blt     LLBP7
        cmp     r5, #0xE
        bgt     LLBP7
        ldr     r9, [pc, #0xD8C]
        ldr     r8, [pc, #0xD8C]
        cmp     lr, #0
        ldrb    r9, [r4, +r9]
        ldrb    r8, [r4, +r8]
        ldreq   lr, [pc, #0xD80]
        addeq   lr, lr, r9, lsl #5
        cmp     r6, #0
        mov     r6, r1, lsr #1
        mov     r7, r7, lsr #1
        beq     LLBP4
        cmp     r4, #0x18
        blt     LLBP1
        cmp     r3, #0
        sub     r1, r8, #4
        ldrne   r3, [r3]
        beq     LLBP8
LLBP0:
        str     r3, [r2]
        ldrsh   r8, [lr, #2]
        ldr     r4, [r2, #4]
        ldr     r3, [r2, #8]
        mul     r4, r4, r8
        ldr     r8, [r2, #0xC]
        str     r8, [sp]
        ldr     r8, [r2, #0x10]
        mov     r4, r4, lsl r1
        str     r8, [sp, #4]
        ldr     r8, [r2, #0x14]
        str     r8, [sp, #8]
        ldr     r8, [r2, #0x18]
        str     r8, [sp, #0xC]
        str     r4, [r2, #4]
        ldrsh   r4, [lr, #4]
        ldr     r8, [r2, #0x1C]
        str     r8, [sp, #0x10]
        ldr     r8, [r2, #0x20]
        str     r8, [sp, #0x14]
        ldr     r8, [r2, #0x24]
        str     r8, [sp, #0x18]
        mul     r8, r3, r4
        ldr     r3, [r2, #0x28]
        str     r3, [sp, #0x1C]
        ldr     r3, [r2, #0x2C]
        mov     r8, r8, lsl r1
        str     r3, [sp, #0x20]
        str     r8, [r2, #8]
        ldrsh   r11, [lr, #6]
        ldr     r10, [sp]
        ldr     r3, [r2, #0x30]
        ldr     r4, [r2, #0x34]
        ldr     r8, [r2, #0x38]
        mul     r11, r10, r11
        ldr     r9, [r2, #0x3C]
        mov     r10, r11, lsl r1
        str     r10, [r2, #0xC]
        ldrsh   r10, [lr, #8]
        ldr     r11, [sp, #4]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x10]
        ldr     r11, [sp, #8]
        ldrsh   r10, [lr, #0xA]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x14]
        ldr     r11, [sp, #0xC]
        ldrsh   r10, [lr, #0xC]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x18]
        ldrsh   r10, [lr, #0xE]
        ldr     r11, [sp, #0x10]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x1C]
        ldr     r11, [sp, #0x14]
        ldrsh   r10, [lr, #0x10]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x20]
        ldr     r11, [sp, #0x18]
        ldrsh   r10, [lr, #0x12]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x24]
        ldr     r11, [sp, #0x1C]
        ldrsh   r10, [lr, #0x14]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x28]
        ldr     r11, [sp, #0x20]
        ldrsh   r10, [lr, #0x16]
        mul     r11, r10, r11
        mov     r10, r11, lsl r1
        str     r10, [r2, #0x2C]
        ldrsh   r10, [lr, #0x18]
        mul     r3, r10, r3
        mov     r3, r3, lsl r1
        str     r3, [r2, #0x30]
        ldrsh   r3, [lr, #0x1A]
        mul     r4, r3, r4
        mov     r3, r4, lsl r1
        str     r3, [r2, #0x34]
        ldrsh   r3, [lr, #0x1C]
        mul     r8, r3, r8
        mov     r3, r8, lsl r1
        str     r3, [r2, #0x38]
        ldrsh   lr, [lr, #0x1E]
        mul     r9, lr, r9
        mov     r1, r9, lsl r1
        b       LLBP3
LLBP1:
        rsb     r1, r8, #4
        mov     r4, #1
        sub     r8, r1, #1
        cmp     r3, #0
        mov     r4, r4, lsl r8
        ldrne   r3, [r3]
        beq     LLBP9
LLBP2:
        str     r3, [r2]
        ldrsh   r8, [lr, #2]
        ldr     r3, [r2, #4]
        ldr     r10, [r2, #0xC]
        ldr     r11, [r2, #0x18]
        mla     r8, r3, r8, r4
        ldr     r3, [r2, #8]
        mov     r8, r8, asr r1
        str     r8, [r2, #4]
        ldrsh   r8, [lr, #4]
        mla     r9, r3, r8, r4
        ldr     r3, [r2, #0x10]
        ldr     r8, [r2, #0x14]
        str     r11, [sp, #0x20]
        ldr     r11, [r2, #0x1C]
        mov     r9, r9, asr r1
        str     r9, [r2, #8]
        ldrsh   r9, [lr, #6]
        str     r11, [sp, #0x1C]
        ldr     r11, [r2, #0x20]
        mla     r9, r10, r9, r4
        str     r11, [sp, #0x18]
        ldr     r11, [r2, #0x24]
        str     r11, [sp, #0x14]
        ldr     r10, [r2, #0x28]
        mov     r9, r9, asr r1
        str     r10, [sp, #0x10]
        ldr     r10, [r2, #0x2C]
        str     r10, [sp, #0xC]
        ldr     r10, [r2, #0x30]
        str     r10, [sp, #8]
        ldr     r10, [r2, #0x34]
        str     r10, [sp, #4]
        str     r9, [r2, #0xC]
        ldrsh   r11, [lr, #8]
        ldr     r9, [r2, #0x38]
        ldr     r10, [r2, #0x3C]
        mla     r3, r11, r3, r4
        mov     r3, r3, asr r1
        str     r3, [r2, #0x10]
        ldrsh   r3, [lr, #0xA]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x14]
        ldrsh   r3, [lr, #0xC]
        ldr     r8, [sp, #0x20]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x18]
        ldr     r8, [sp, #0x1C]
        ldrsh   r3, [lr, #0xE]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x1C]
        ldr     r8, [sp, #0x18]
        ldrsh   r3, [lr, #0x10]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x20]
        ldr     r8, [sp, #0x14]
        ldrsh   r3, [lr, #0x12]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x24]
        ldr     r8, [sp, #0x10]
        ldrsh   r3, [lr, #0x14]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x28]
        ldr     r8, [sp, #0xC]
        ldrsh   r3, [lr, #0x16]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x2C]
        ldr     r8, [sp, #8]
        ldrsh   r3, [lr, #0x18]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x30]
        ldr     r8, [sp, #4]
        ldrsh   r3, [lr, #0x1A]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        str     r3, [r2, #0x34]
        ldrsh   r3, [lr, #0x1C]
        mla     r9, r3, r9, r4
        mov     r3, r9, asr r1
        str     r3, [r2, #0x38]
        ldrsh   lr, [lr, #0x1E]
        mla     r4, lr, r10, r4
        mov     r1, r4, asr r1
LLBP3:
        str     r1, [r2, #0x3C]
        add     r1, sp, #0x48
        str     r2, [r1]
        mov     r1, #1
        mov     r5, r1, lsl r5
        add     r1, sp, #0x48
        ldr     r3, [r1]
        add     r4, r2, #0x10
        mov     r6, r6, lsl #1
        ldr     r9, [r3, #8]
        ldr     lr, [r3, #0xC]
        sub     r1, r5, #1
        str     r6, [sp, #0x20]
        ldr     r10, [r3]
        ldr     r6, [r3, #4]
        add     r5, sp, #0x4C
        str     r4, [r5]
        mov     r7, r7, lsl #1
        add     r8, sp, #0x48
        add     r5, r2, #0x30
        str     r5, [r8, #0xC]
        add     r5, sp, #0x48
        ldr     r5, [r5, #0xC]
        add     r8, r10, r9
        sub     r9, r10, r9
        rsb     r10, lr, r6, asr #1
        add     lr, r6, lr, asr #1
        sub     r6, r8, lr
        str     r6, [r3, #0xC]
        add     lr, r8, lr
        str     lr, [r3]
        add     r4, sp, #0x48
        ldr     r4, [r4, #4]
        add     lr, r9, r10
        sub     r9, r9, r10
        str     r9, [r3, #8]
        str     lr, [r3, #4]
        ldr     r10, [r4, #8]
        ldr     r11, [r4]
        ldr     r6, [r4, #4]
        ldr     r8, [r4, #0xC]
        add     lr, r2, #0x20
        add     r9, sp, #0x50
        str     lr, [r9]
        add     lr, sp, #0x48
        ldr     lr, [lr, #8]
        add     r9, r11, r10
        sub     r10, r11, r10
        rsb     r11, r8, r6, asr #1
        add     r8, r6, r8, asr #1
        sub     r6, r9, r8
        str     r6, [r4, #0xC]
        add     r6, r10, r11
        str     r6, [r4, #4]
        add     r8, r9, r8
        sub     r10, r10, r11
        str     r10, [r4, #8]
        str     r8, [r4]
        ldr     r9, [lr, #8]
        ldr     r10, [lr]
        ldr     r6, [lr, #4]
        str     r6, [sp, #0x1C]
        ldr     r6, [lr, #0xC]
        add     r8, r10, r9
        sub     r10, r10, r9
        str     r6, [sp, #0x18]
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        add     r6, r12, r7
        rsb     r9, r11, r10, asr #1
        add     r11, r10, r11, asr #1
        str     r11, [sp, #0x1C]
        sub     r10, r8, r11
        str     r10, [lr, #0xC]
        ldr     r10, [sp, #0x1C]
        add     r10, r8, r10
        str     r10, [lr]
        ldr     r8, [sp, #0x14]
        add     r8, r8, r9
        str     r8, [lr, #4]
        ldr     r8, [sp, #0x14]
        sub     r8, r8, r9
        str     r8, [lr, #8]
        ldr     r10, [r5]
        ldr     r9, [r5, #8]
        ldr     r8, [r5, #4]
        str     r8, [sp, #0x1C]
        ldr     r8, [r5, #0xC]
        str     r8, [sp, #0x18]
        ldr     r11, [sp, #0x18]
        sub     r8, r10, r9
        add     r9, r10, r9
        ldr     r10, [sp, #0x1C]
        str     r9, [sp, #0x14]
        rsb     r9, r11, r10, asr #1
        add     r11, r10, r11, asr #1
        str     r11, [sp, #0x1C]
        add     r10, r8, r9
        sub     r8, r8, r9
        str     r8, [r5, #8]
        str     r10, [r5, #4]
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x1C]
        sub     r9, r9, r8
        str     r9, [r5, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x1C]
        add     r9, r8, r9
        str     r9, [r5]
        ldr     r8, [r2, #0x20]
        ldr     r10, [r2, #0x10]
        ldr     r9, [r2]
        str     r10, [sp, #0x1C]
        ldr     r11, [r2, #4]
        ldr     r10, [r2, #0x30]
        str     r11, [sp, #0x18]
        ldr     r11, [r2, #0x24]
        str     r11, [sp, #0x14]
        ldr     r11, [r2, #0x14]
        str     r11, [sp, #0x10]
        ldr     r11, [r2, #0x34]
        str     r11, [sp, #0xC]
        ldr     r11, [r2, #8]
        str     r11, [sp, #8]
        ldr     r11, [r2, #0x28]
        str     r11, [sp, #4]
        ldr     r11, [r2, #0x18]
        str     r11, [sp]
        ldr     r11, [r2, #0x38]
        str     r11, [sp, #0x24]
        ldr     r11, [r2, #0xC]
        str     r11, [sp, #0x28]
        ldr     r11, [r2, #0x2C]
        str     r11, [sp, #0x2C]
        ldr     r11, [r2, #0x1C]
        str     r11, [sp, #0x30]
        ldr     r11, [r2, #0x3C]
        str     r11, [sp, #0x34]
        add     r11, r9, r8
        sub     r9, r9, r8
        ldr     r8, [sp, #0x1C]
        str     r9, [sp, #0x3C]
        str     r11, [sp, #0x38]
        ldr     r9, [sp, #0x14]
        rsb     r8, r10, r8, asr #1
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x34]
        add     r10, r8, r10, asr #1
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        add     r8, r10, r9
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0xC]
        sub     r10, r10, r9
        ldr     r9, [sp, #0x10]
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #8]
        rsb     r9, r8, r9, asr #1
        str     r9, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        add     r9, r8, r9, asr #1
        str     r9, [sp, #0x10]
        ldr     r9, [sp, #4]
        add     r8, r10, r9
        str     r8, [sp, #0xC]
        sub     r10, r10, r9
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x24]
        ldr     r9, [sp]
        rsb     r8, r10, r9, asr #1
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x2C]
        add     r10, r9, r10, asr #1
        ldr     r9, [sp, #0x28]
        str     r10, [sp, #0x24]
        add     r10, r9, r8
        sub     r9, r9, r8
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        rsb     r8, r11, r9, asr #1
        str     r8, [sp, #0x28]
        add     r8, r9, r11, asr #1
        ldr     r9, [sp, #0x38]
        ldr     r11, [sp, #0x1C]
        add     r11, r9, r11
        str     r11, [sp, #0x34]
        ldr     r9, [sp, #0x3C]
        ldr     r11, [sp, #0x40]
        add     r11, r9, r11
        str     r11, [sp, #0x30]
        ldr     r9, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        sub     r11, r11, r9
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x38]
        ldr     r9, [sp, #0x1C]
        sub     r11, r11, r9
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x10]
        ldr     r9, [sp, #0x44]
        add     r11, r9, r11
        ldr     r9, [sp, #0x18]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x14]
        add     r11, r9, r11
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        sub     r11, r11, r9
        str     r11, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r11, [sp, #0x44]
        sub     r11, r11, r9
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x24]
        ldr     r9, [sp, #0xC]
        add     r11, r9, r11
        str     r11, [sp, #0x14]
        ldr     r9, [sp, #8]
        ldr     r11, [sp, #4]
        add     r11, r9, r11
        ldr     r9, [sp, #4]
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #8]
        sub     r11, r11, r9
        ldr     r9, [sp, #0x24]
        str     r11, [sp, #8]
        ldr     r11, [sp, #0xC]
        sub     r11, r11, r9
        add     r9, r10, r8
        str     r9, [sp, #0xC]
        str     r11, [sp, #0x24]
        ldr     r9, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        sub     r10, r10, r8
        ldr     r8, [sp, #0x34]
        add     r10, r10, #0x20
        add     r11, r11, r9
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x2C]
        add     r8, r8, #0x20
        str     r8, [sp, #0x34]
        ldr     r8, [sp, #0x30]
        sub     r11, r11, r9
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #4]
        add     r9, r8, #0x20
        ldr     r8, [sp, #0x40]
        add     r11, r11, #0x20
        mov     r9, r9, asr #6
        mov     r10, r10, asr #6
        add     r8, r8, #0x20
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x3C]
        add     r8, r8, #0x20
        str     r8, [sp, #0x3C]
        ldr     r8, [sp, #0x38]
        add     r8, r8, #0x20
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x1C]
        add     r8, r8, #0x20
        str     r8, [sp, #0x30]
        ldr     r8, [sp, #0x18]
        add     r8, r8, #0x20
        str     r8, [sp, #0x28]
        ldr     r8, [sp, #0x44]
        add     r8, r8, #0x20
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x14]
        add     r8, r8, #0x20
        str     r8, [sp, #0x1C]
        ldr     r8, [sp, #0x10]
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x2C]
        add     r8, r8, #0x20
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #8]
        add     r11, r11, #0x20
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x34]
        add     r8, r8, #0x20
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0x24]
        mov     r11, r11, asr #6
        add     r8, r8, #0x20
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0xC]
        str     r9, [r2, #0x10]
        str     r11, [r2]
        ldr     r9, [sp, #0x40]
        add     r8, r8, #0x20
        mov     r9, r9, asr #6
        str     r9, [r2, #0x20]
        ldr     r9, [sp, #0x3C]
        mov     r8, r8, asr #6
        mov     r9, r9, asr #6
        str     r9, [r2, #0x30]
        ldr     r9, [sp, #0x38]
        mov     r9, r9, asr #6
        str     r9, [r2, #4]
        ldr     r9, [sp, #0x30]
        mov     r9, r9, asr #6
        str     r9, [r2, #0x14]
        ldr     r9, [sp, #0x28]
        mov     r9, r9, asr #6
        str     r9, [r2, #0x24]
        ldr     r9, [sp, #0x44]
        mov     r9, r9, asr #6
        str     r9, [r2, #0x34]
        ldr     r9, [sp, #0x1C]
        mov     r9, r9, asr #6
        str     r9, [r2, #8]
        ldr     r9, [sp, #0x18]
        mov     r9, r9, asr #6
        str     r9, [r2, #0x18]
        ldr     r9, [sp, #0x14]
        mov     r9, r9, asr #6
        str     r9, [r2, #0x28]
        ldr     r9, [sp, #0x24]
        str     r8, [r2, #0xC]
        mov     r9, r9, asr #6
        str     r9, [r2, #0x38]
        ldr     r8, [sp, #0x10]
        add     r9, r6, r7
        mov     r8, r8, asr #6
        str     r8, [r2, #0x1C]
        ldr     r8, [sp, #0x2C]
        str     r10, [r2, #0x3C]
        mov     r8, r8, asr #6
        str     r8, [r2, #0x2C]
        ldrh    r10, [r0]
        ldr     r2, [r3]
        ldr     r11, [sp, #0x20]
        add     r8, r0, r11
        str     r8, [sp, #0x44]
        add     r8, r8, r11
        add     r2, r10, r2
        cmp     r1, r2
        movlt   r2, r1
        mov     r10, #0
        cmp     r2, #0
        movlt   r2, r10
        strh    r2, [r12]
        ldrh    r2, [r0, #2]
        ldr     r11, [sp, #0x20]
        str     r2, [sp, #0x40]
        ldr     r10, [r3, #4]
        add     r2, r9, r7
        add     r11, r8, r11
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x40]
        add     r10, r11, r10
        cmp     r1, r10
        movlt   r10, r1
        cmp     r10, #0
        mov     r11, #0
        movlt   r10, r11
        strh    r10, [r12, #2]
        ldrh    r10, [r0, #4]
        ldr     r11, [r3, #8]
        add     r10, r10, r11
        cmp     r1, r10
        movlt   r10, r1
        mov     r11, #0
        cmp     r10, #0
        movlt   r10, r11
        strh    r10, [r12, #4]
        ldr     r3, [r3, #0xC]
        ldrh    r10, [r0, #6]
        add     r3, r10, r3
        cmp     r1, r3
        movlt   r3, r1
        cmp     r3, #0
        mov     r10, #0
        movlt   r3, r10
        strh    r3, [r12, #6]
        ldr     r3, [sp, #0x20]
        ldrh    r0, [r0, +r3]
        ldr     r3, [r4]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        cmp     r0, #0
        mov     r3, #0
        movlt   r0, r3
        strh    r0, [r12, +r7]
        ldr     r0, [sp, #0x44]
        ldr     r3, [r4, #4]
        ldrh    r0, [r0, #2]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        mov     r3, #0
        cmp     r0, #0
        movlt   r0, r3
        strh    r0, [r6, #2]
        ldr     r0, [sp, #0x44]
        ldr     r3, [r4, #8]
        ldrh    r0, [r0, #4]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        cmp     r0, #0
        mov     r3, #0
        movlt   r0, r3
        strh    r0, [r6, #4]
        ldr     r0, [sp, #0x44]
        ldr     r4, [r4, #0xC]
        ldrh    r0, [r0, #6]
        add     r4, r0, r4
        cmp     r1, r4
        movlt   r4, r1
        mov     r0, #0
        cmp     r4, #0
        movlt   r4, r0
        strh    r4, [r6, #6]
        ldr     r0, [sp, #0x44]
        ldr     r3, [sp, #0x20]
        ldrh    r0, [r0, +r3]
        ldr     r3, [lr]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        mov     r3, #0
        cmp     r0, #0
        movlt   r0, r3
        strh    r0, [r6, +r7]
        ldrh    r0, [r8, #2]
        ldr     r3, [lr, #4]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        cmp     r0, #0
        mov     r3, #0
        movlt   r0, r3
        strh    r0, [r9, #2]
        ldrh    r0, [r8, #4]
        ldr     r3, [lr, #8]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        mov     r3, #0
        cmp     r0, #0
        movlt   r0, r3
        strh    r0, [r9, #4]
        ldr     lr, [lr, #0xC]
        ldrh    r0, [r8, #6]
        add     lr, r0, lr
        cmp     r1, lr
        movlt   lr, r1
        mov     r0, #0
        cmp     lr, #0
        movlt   lr, r0
        strh    lr, [r9, #6]
        ldr     r0, [sp, #0x20]
        ldrh    r8, [r8, +r0]
        ldr     r0, [r5]
        add     r8, r8, r0
        cmp     r1, r8
        movlt   r8, r1
        cmp     r8, #0
        mov     r0, #0
        movlt   r8, r0
        strh    r8, [r9, +r7]
        ldr     r0, [sp, #0x3C]
        ldr     r3, [r5, #4]
        ldrh    r0, [r0, #2]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        cmp     r0, #0
        mov     r3, #0
        movlt   r0, r3
        strh    r0, [r2, #2]
        ldr     r0, [sp, #0x3C]
        ldr     r3, [r5, #8]
        ldrh    r0, [r0, #4]
        add     r0, r0, r3
        cmp     r1, r0
        movlt   r0, r1
        cmp     r0, #0
        mov     r3, #0
        movlt   r0, r3
        strh    r0, [r2, #4]
        ldr     r0, [sp, #0x3C]
        ldr     r5, [r5, #0xC]
        ldrh    r0, [r0, #6]
        add     r0, r0, r5
        cmp     r1, r0
        movlt   r0, r1
        cmp     r0, #0
        mov     r1, #0
        movlt   r0, r1
        b       LLBP6
LLBP4:
        cmp     r3, #0
        ldrne   r3, [r3]
        beq     LLBP10
LLBP5:
        ldrh    r2, [r0]
        add     r1, r3, #0x20
        mov     r3, #1
        mov     r5, r3, lsl r5
        sub     r3, r5, #1
        add     r2, r2, r1, asr #6
        cmp     r3, r2
        movlt   r2, r3
        mov     r4, #0
        cmp     r2, #0
        movlt   r2, r4
        strh    r2, [r12]
        ldrh    r2, [r0, #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl #1
        add     lr, r12, r7
        add     r2, r2, r1, asr #6
        cmp     r3, r2
        movlt   r2, r3
        cmp     r2, #0
        movlt   r2, r4
        strh    r2, [r12, #2]
        ldrh    r2, [r0, #4]
        add     r8, lr, r7
        add     r9, r0, r6
        add     r2, r2, r1, asr #6
        cmp     r3, r2
        movlt   r2, r3
        cmp     r2, #0
        movlt   r2, r4
        strh    r2, [r12, #4]
        ldrh    r2, [r0, #6]
        add     r5, r9, r6
        add     r2, r2, r1, asr #6
        cmp     r3, r2
        movlt   r2, r3
        cmp     r2, #0
        movlt   r2, r4
        strh    r2, [r12, #6]
        ldrh    r0, [r0, +r6]
        add     r2, r8, r7
        add     r0, r0, r1, asr #6
        cmp     r3, r0
        movlt   r0, r3
        cmp     r0, #0
        movlt   r0, r4
        strh    r0, [r12, +r7]
        ldrh    r12, [r9, #2]
        add     r0, r5, r6
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [lr, #2]
        ldrh    r12, [r9, #4]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [lr, #4]
        ldrh    r12, [r9, #6]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [lr, #6]
        ldrh    r9, [r9, +r6]
        add     r9, r9, r1, asr #6
        cmp     r3, r9
        movlt   r9, r3
        cmp     r9, #0
        movlt   r9, r4
        strh    r9, [lr, +r7]
        ldrh    r12, [r5, #2]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [r8, #2]
        ldrh    r12, [r5, #4]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [r8, #4]
        ldrh    r12, [r5, #6]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [r8, #6]
        ldrh    r6, [r5, +r6]
        add     r12, r6, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [r8, +r7]
        ldrh    r12, [r0, #2]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [r2, #2]
        ldrh    r12, [r0, #4]
        add     r12, r12, r1, asr #6
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, #0
        movlt   r12, r4
        strh    r12, [r2, #4]
        ldrh    r0, [r0, #6]
        add     r0, r0, r1, asr #6
        cmp     r3, r0
        movlt   r0, r3
        cmp     r0, #0
        movlt   r0, r4
LLBP6:
        strh    r0, [r2, #6]
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LLBP7:
        mvn     r0, #0xA
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LLBP8:
        ldr     r4, [r2]
        ldrsh   r3, [lr]
        mul     r4, r3, r4
        mov     r3, r4, lsl r1
        b       LLBP0
LLBP9:
        ldr     r8, [r2]
        ldrsh   r3, [lr]
        mla     r8, r3, r8, r4
        mov     r3, r8, asr r1
        b       LLBP2
LLBP10:
        ldr     r2, [r2]
        cmp     r4, #0x18
        blt     LLBP11
        ldrsh   lr, [lr]
        sub     r8, r8, #4
        mul     lr, r2, lr
        mov     r3, lr, lsl r8
        b       LLBP5
LLBP11:
        ldrsh   lr, [lr]
        rsb     r3, r8, #3
        mov     r1, #1
        mov     r3, r1, lsl r3
        mla     r3, r2, lr, r3
        rsb     r8, r8, #4
        mov     r3, r3, asr r8
        b       LLBP5
LLBP12:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBP_h264_qp_rem
        .long   LLBP_h264_qp6
        .long   LLBP_InvLevelScale_4x4_default


        .data
        .align  4


LLBP_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBP_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBP_InvLevelScale_4x4_default:
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


