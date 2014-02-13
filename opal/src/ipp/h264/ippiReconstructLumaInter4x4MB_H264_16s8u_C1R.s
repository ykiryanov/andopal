        .text
        .align  4
        .globl  _ippiReconstructLumaInter4x4MB_H264_16s8u_C1R


_ippiReconstructLumaInter4x4MB_H264_16s8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x7C
        ldr     r12, [sp, #0xA0]
        ldr     r6, [sp, #0xA4]
        ldr     r5, [sp, #0xA8]
        cmp     r0, #0
        beq     LKWI11
        cmp     r1, #0
        beq     LKWI11
        ldr     lr, [r0]
        cmp     lr, #0
        beq     LKWI11
        cmp     r6, #0
        beq     LKWI11
        cmp     r12, #0x33
        bhi     LKWI9
        ldr     lr, [pc, #0xAD4]
        tst     r3, lr
        beq     LKWI8
        ldr     r7, [pc, #0xACC]
        ldr     r4, [pc, #0xACC]
        mov     r10, #2
        mov     r11, #0x10
        add     r9, sp, #0x6C
        mov     r8, #1, 24
        mvn     lr, #0xFF
        str     r11, [sp, #0x14]
        str     r7, [sp, #0xC]
        str     r10, [sp, #0x10]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r3, [sp, #0x18]
        str     r0, [sp, #0x1C]
LKWI0:
        ldr     r3, [sp, #0x18]
        ldr     r0, [sp, #0x10]
        tst     r3, r0
        beq     LKWI7
        ldr     r8, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        add     r6, sp, #0x6C
        ldr     r7, [r8]
        cmp     r0, #0
        str     r7, [sp, #8]
        add     r5, r7, #8
        str     r7, [r6]
        add     r6, sp, #0x6C
        add     r3, r7, #0x10
        str     r5, [r6, #4]
        add     r5, sp, #0x6C
        str     r3, [r5, #8]
        add     r9, r7, #0x20
        add     r0, r7, #0x18
        add     r3, sp, #0x6C
        str     r9, [r8]
        str     r0, [r3, #0xC]
        beq     LKWI1
        cmp     r12, #0
        ble     LKWI10
LKWI1:
        ldr     r0, [pc, #0xA38]
        cmp     r12, #0x18
        smull   r0, r3, r12, r0
        sub     r0, r3, r12, asr #31
        blt     LKWI3
        ldr     r3, [sp, #0x24]
        ldr     r5, [sp, #8]
        sub     r0, r0, #4
        mov     r6, #0x10
LKWI2:
        ldrsh   r8, [r3], #2
        ldrsh   r7, [r5]
        subs    r6, r6, #1
        mul     r8, r7, r8
        mov     r7, r8, lsl r0
        strh    r7, [r5], #2
        bne     LKWI2
        b       LKWI5
LKWI3:
        rsb     r3, r0, #3
        mov     r5, #1
        mov     r5, r5, lsl r3
        rsb     r3, r0, #4
        ldr     r0, [sp, #0x24]
        ldr     r6, [sp, #8]
        mov     r7, #0x10
LKWI4:
        ldrsh   r9, [r0], #2
        ldrsh   r8, [r6]
        subs    r7, r7, #1
        mla     r9, r8, r9, r5
        mov     r8, r9, asr r3
        strh    r8, [r6], #2
        bne     LKWI4
LKWI5:
        add     r0, sp, #0x6C
        ldr     r7, [r0]
        str     r7, [sp]
        ldr     r3, [r0, #4]
        ldr     r0, [r0, #8]
        str     r0, [sp, #4]
        ldrsh   r6, [r7, #6]
        ldrsh   r8, [r7, #2]
        ldrsh   r10, [r7]
        ldrsh   r9, [r7, #4]
        rsb     r5, r6, r8, asr #1
        add     r6, r8, r6, asr #1
        add     r8, r10, r9
        mov     r5, r5, lsl #16
        sub     r9, r10, r9
        mov     r6, r6, lsl #16
        mov     r5, r5, asr #16
        mov     r8, r8, lsl #16
        mov     r9, r9, lsl #16
        mov     r6, r6, asr #16
        add     r11, r6, r8, asr #16
        add     r10, r5, r9, asr #16
        rsb     r8, r6, r8, asr #16
        strh    r8, [r7, #6]
        strh    r11, [r7]
        strh    r10, [r7, #2]
        rsb     r9, r5, r9, asr #16
        strh    r9, [r7, #4]
        ldrsh   r6, [r3, #6]
        ldrsh   r8, [r3, #2]
        ldrsh   r9, [r3]
        ldrsh   r10, [r3, #4]
        add     r5, sp, #0x6C
        ldr     r7, [r5, #0xC]
        rsb     r5, r6, r8, asr #1
        add     r6, r8, r6, asr #1
        add     r8, r9, r10
        sub     r9, r9, r10
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        mov     r8, r8, lsl #16
        mov     r6, r6, asr #16
        mov     r9, r9, lsl #16
        mov     r5, r5, asr #16
        add     r11, r6, r8, asr #16
        add     r10, r5, r9, asr #16
        rsb     r8, r6, r8, asr #16
        strh    r10, [r3, #2]
        strh    r11, [r3]
        rsb     r9, r5, r9, asr #16
        strh    r8, [r3, #6]
        strh    r9, [r3, #4]
        ldrsh   r8, [r0, #2]
        ldrsh   r6, [r0, #6]
        ldrsh   r9, [r0]
        ldrsh   r10, [r0, #4]
        rsb     r5, r6, r8, asr #1
        add     r6, r8, r6, asr #1
        mov     r8, r5, lsl #16
        add     r5, r9, r10
        sub     r10, r9, r10
        mov     r9, r6, lsl #16
        mov     r6, r5, lsl #16
        mov     r8, r8, asr #16
        mov     r9, r9, asr #16
        mov     r5, r10, lsl #16
        add     r11, r9, r6, asr #16
        strh    r11, [r0]
        add     r10, r8, r5, asr #16
        rsb     r5, r8, r5, asr #16
        strh    r10, [r0, #2]
        strh    r5, [r0, #4]
        rsb     r6, r9, r6, asr #16
        strh    r6, [r0, #6]
        ldrsh   r9, [r7, #2]
        ldrsh   r8, [r7, #6]
        ldrsh   r5, [r7]
        ldrsh   r6, [r7, #4]
        rsb     r0, r8, r9, asr #1
        add     r8, r9, r8, asr #1
        mov     r0, r0, lsl #16
        add     r9, r5, r6
        sub     r6, r5, r6
        mov     r8, r8, lsl #16
        mov     r5, r9, lsl #16
        mov     r6, r6, lsl #16
        mov     r9, r8, asr #16
        mov     r10, r0, asr #16
        add     r8, r10, r6, asr #16
        add     r0, r9, r5, asr #16
        strh    r0, [r7]
        rsb     r5, r9, r5, asr #16
        strh    r5, [r7, #6]
        strh    r8, [r7, #2]
        rsb     r6, r10, r6, asr #16
        strh    r6, [r7, #4]
        ldr     r0, [sp, #8]
        ldrsh   r6, [r0, #0x18]
        ldrsh   r5, [r0, #8]
        str     r6, [sp, #0x28]
        ldrsh   r6, [r0, #0xA]
        str     r6, [sp, #0x2C]
        ldrsh   r8, [r0, #0xC]
        ldrsh   r6, [r0, #0x1A]
        ldrsh   r9, [r0, #0x1C]
        ldrsh   r11, [r0, #0x1E]
        ldrsh   r10, [r0, #0xE]
        str     r11, [sp, #0x30]
        ldrsh   r11, [r0]
        str     r11, [sp, #0x34]
        ldrsh   r11, [r0, #0x10]
        str     r11, [sp, #0x38]
        ldrsh   r11, [r0, #2]
        str     r11, [sp, #0x3C]
        ldrsh   r11, [r0, #0x12]
        str     r11, [sp, #0x40]
        ldrsh   r11, [r0, #4]
        str     r11, [sp, #0x44]
        ldrsh   r11, [r0, #0x14]
        str     r11, [sp, #0x48]
        ldrsh   r11, [r0, #6]
        str     r11, [sp, #0x4C]
        ldrsh   r11, [r0, #0x16]
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x28]
        rsb     r11, r11, r5, asr #1
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x28]
        add     r11, r5, r11, asr #1
        ldr     r5, [sp, #0x2C]
        str     r11, [sp, #0x28]
        rsb     r5, r6, r5, asr #1
        str     r5, [sp, #0x58]
        ldr     r5, [sp, #0x2C]
        add     r6, r5, r6, asr #1
        rsb     r5, r9, r8, asr #1
        str     r5, [sp, #0x5C]
        ldr     r5, [sp, #0x30]
        str     r6, [sp, #0x2C]
        add     r9, r8, r9, asr #1
        rsb     r5, r5, r10, asr #1
        str     r5, [sp, #0x64]
        ldr     r5, [sp, #0x30]
        ldr     r8, [sp, #0x38]
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x40]
        add     r10, r10, r5, asr #1
        ldr     r5, [sp, #0x34]
        mov     r10, r10, lsl #16
        add     r6, r5, r8
        sub     r5, r5, r8
        ldr     r8, [sp, #0x54]
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x54]
        ldr     r8, [sp, #0x28]
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x54]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x3C]
        mov     r5, r5, asr #16
        str     r5, [sp, #0x54]
        add     r11, r8, r9
        ldr     r5, [sp, #0x38]
        str     r11, [sp, #0x34]
        sub     r8, r8, r9
        str     r8, [sp, #0x40]
        ldr     r8, [sp, #0x58]
        ldr     r9, [sp, #0x48]
        mov     r5, r5, asr #16
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x58]
        ldr     r8, [sp, #0x2C]
        str     r6, [sp, #0x2C]
        ldr     r6, [sp, #0x40]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x3C]
        ldr     r8, [sp, #0x44]
        str     r5, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        add     r11, r8, r9
        str     r11, [sp, #0x30]
        sub     r8, r8, r9
        str     r8, [sp, #0x48]
        ldr     r8, [sp, #0x5C]
        ldr     r9, [sp, #0x50]
        mov     r6, r6, lsl #16
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x5C]
        ldr     r8, [sp, #0x60]
        str     r6, [sp, #0x40]
        ldr     r6, [sp, #0x58]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x60]
        ldr     r8, [sp, #0x4C]
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x2C]
        mov     r5, r5, lsl #16
        add     r11, r8, r9
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x38]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x3C]
        sub     r8, r8, r9
        ldr     r9, [sp, #0x44]
        str     r8, [sp, #0x50]
        ldr     r8, [sp, #0x64]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x3C]
        ldr     r6, [sp, #0x30]
        mov     r8, r8, lsl #16
        str     r8, [sp, #0x64]
        mov     r8, r6, lsl #16
        ldr     r6, [sp, #0x48]
        mov     r9, r9, lsl #16
        add     r10, r11, r10, asr #16
        mov     r6, r6, lsl #16
        str     r6, [sp, #0x48]
        ldr     r6, [sp, #0x5C]
        ldr     r11, [sp, #0x54]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x50]
        mov     r6, r6, asr #16
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x50]
        ldr     r9, [sp, #0x64]
        mov     r9, r9, asr #16
        str     r9, [sp, #0x64]
        ldr     r9, [sp, #0x4C]
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x28]
        mov     r9, r9, asr #16
        add     r10, r11, r10, asr #16
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x54]
        rsb     r10, r11, r10, asr #16
        ldr     r11, [sp, #0x38]
        str     r10, [sp, #0x54]
        ldr     r10, [sp, #0x2C]
        rsb     r10, r11, r10, asr #16
        ldr     r11, [sp, #0x58]
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x3C]
        add     r10, r10, r5, asr #16
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x40]
        add     r10, r11, r10, asr #16
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x58]
        rsb     r10, r11, r10, asr #16
        ldr     r11, [sp, #0x30]
        str     r10, [sp, #0x58]
        ldr     r10, [sp, #0x3C]
        add     r11, r11, #0x20
        rsb     r5, r10, r5, asr #16
        ldr     r10, [sp, #0x5C]
        str     r5, [sp, #0x40]
        add     r5, r6, r8, asr #16
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x48]
        rsb     r8, r6, r8, asr #16
        ldr     r6, [sp, #0x64]
        add     r5, r10, r5, asr #16
        ldr     r10, [sp, #0x5C]
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #0x48]
        str     r8, [sp, #0x48]
        ldr     r8, [sp, #0x38]
        rsb     r5, r10, r5, asr #16
        str     r5, [sp, #0x5C]
        ldr     r5, [sp, #0x60]
        add     r8, r8, #0x20
        add     r5, r9, r5, asr #16
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x50]
        mov     r8, r8, asr #6
        str     r8, [sp, #0x30]
        add     r5, r6, r5, asr #16
        str     r5, [sp, #0x68]
        ldr     r6, [sp, #0x64]
        ldr     r5, [sp, #0x50]
        rsb     r5, r6, r5, asr #16
        str     r5, [sp, #0x64]
        ldr     r5, [sp, #0x60]
        ldr     r6, [sp, #0x44]
        rsb     r10, r9, r5, asr #16
        ldr     r5, [sp, #0x4C]
        ldr     r9, [sp, #0x34]
        add     r6, r6, #0x20
        str     r6, [sp, #0x60]
        ldr     r6, [sp, #0x54]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x58]
        add     r10, r10, #0x20
        add     r5, r5, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x40]
        add     r6, r6, #0x20
        add     r9, r9, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x3C]
        str     r10, [sp, #0x3C]
        mov     r5, r5, asr #6
        str     r5, [sp, #0x38]
        ldr     r5, [sp, #0x60]
        add     r11, r11, #0x20
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x2C]
        mov     r5, r5, asr #6
        str     r5, [sp, #0x60]
        ldr     r5, [sp, #0x54]
        add     r11, r11, #0x20
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x5C]
        ldr     r8, [sp, #0x44]
        mov     r6, r6, asr #6
        add     r11, r11, #0x20
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x48]
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x4C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x28]
        mov     r8, r8, asr #6
        mov     r5, r5, asr #6
        str     r5, [sp, #0x54]
        ldr     r5, [sp, #0x58]
        add     r11, r11, #0x20
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x68]
        mov     r9, r9, asr #6
        str     r9, [sp, #0x2C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x64]
        ldr     r10, [sp, #0x68]
        ldr     r9, [sp, #0x40]
        add     r11, r11, #0x20
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x64]
        mov     r5, r5, asr #6
        str     r5, [sp, #0x58]
        ldr     r5, [sp, #0x50]
        str     r8, [sp, #0x50]
        ldr     r8, [sp, #0x5C]
        mov     r11, r11, asr #6
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x3C]
        mov     r8, r8, asr #6
        str     r8, [sp, #0x5C]
        ldr     r8, [sp, #0x48]
        mov     r11, r11, asr #6
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x38]
        mov     r5, r5, asr #6
        mov     r6, r6, asr #6
        strh    r11, [r0]
        ldr     r11, [sp, #0x60]
        mov     r8, r8, asr #6
        mov     r9, r9, asr #6
        strh    r11, [r0, #8]
        ldr     r11, [sp, #0x34]
        mov     r10, r10, asr #6
        strh    r11, [r0, #0x10]
        ldr     r11, [sp, #0x30]
        strh    r11, [r0, #0x18]
        ldr     r11, [sp, #0x2C]
        strh    r11, [r0, #2]
        ldr     r11, [sp, #0x54]
        strh    r11, [r0, #0xA]
        ldr     r11, [sp, #0x58]
        strh    r5, [r0, #0x1A]
        strh    r6, [r0, #4]
        strh    r11, [r0, #0x12]
        ldr     r5, [sp, #0x50]
        strh    r5, [r0, #0xC]
        ldr     r5, [sp, #0x5C]
        strh    r8, [r0, #0x1C]
        strh    r9, [r0, #6]
        strh    r5, [r0, #0x14]
        strh    r10, [r0, #0xE]
        ldr     r5, [sp, #0x68]
        strh    r5, [r0, #0x16]
        ldr     r5, [sp, #0x64]
        strh    r5, [r0, #0x1E]
LKWI6:
        ldr     r0, [sp]
        ldrb    r5, [r1]
        ldrb    r8, [r1, #1]
        ldrsh   r6, [r0]
        str     r8, [sp, #0x68]
        mov     r8, lr
        cmp     r6, lr
        movgt   r8, r6
        ldrb    r6, [r1, #3]
        cmp     r8, #1, 24
        str     r6, [sp, #0x64]
        ldrb    r6, [r1, #2]
        str     r6, [sp, #0x60]
        mov     r6, #1, 24
        movgt   r8, r6
        add     r8, r4, r8
        add     r5, r8, r5
        ldrb    r10, [r5, #0x100]
        add     r5, r1, r2
        add     r8, r2, r5
        strb    r10, [r1]
        ldrsh   r11, [r0, #2]
        mov     r10, lr
        add     r9, r2, r8
        cmp     r11, lr
        movgt   r10, r11
        ldr     r11, [sp, #0x68]
        cmp     r10, #1, 24
        movgt   r10, r6
        add     r10, r4, r10
        add     r11, r10, r11
        ldrb    r10, [r11, #0x100]
        strb    r10, [r1, #1]
        ldrsh   r11, [r0, #4]
        mov     r10, lr
        cmp     r11, lr
        movgt   r10, r11
        ldr     r11, [sp, #0x60]
        cmp     r10, #1, 24
        movgt   r10, r6
        add     r10, r4, r10
        add     r11, r10, r11
        ldrb    r10, [r11, #0x100]
        strb    r10, [r1, #2]
        ldrsh   r0, [r0, #6]
        mov     r10, lr
        cmp     r0, lr
        movgt   r10, r0
        cmp     r10, #1, 24
        movgt   r10, r6
        add     r0, r4, r10
        ldr     r10, [sp, #0x64]
        add     r10, r0, r10
        ldrb    r0, [r10, #0x100]
        strb    r0, [r1, #3]
        ldrb    r10, [r5, #1]
        ldrsh   r11, [r3]
        ldrb    r0, [r2, +r1]
        str     r10, [sp, #0x68]
        ldrb    r10, [r5, #2]
        cmp     r11, lr
        str     r10, [sp, #0x64]
        mov     r10, lr
        movgt   r10, r11
        cmp     r10, #1, 24
        ldrb    r11, [r5, #3]
        movgt   r10, r6
        add     r10, r4, r10
        add     r0, r10, r0
        ldrb    r0, [r0, #0x100]
        strb    r0, [r2, +r1]
        ldrsh   r10, [r3, #2]
        mov     r0, lr
        cmp     r10, lr
        movgt   r0, r10
        ldr     r10, [sp, #0x68]
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r10, r0, r10
        ldrb    r0, [r10, #0x100]
        strb    r0, [r5, #1]
        ldrsh   r10, [r3, #4]
        mov     r0, lr
        cmp     r10, lr
        movgt   r0, r10
        ldr     r10, [sp, #0x64]
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r10, r0, r10
        ldrb    r0, [r10, #0x100]
        strb    r0, [r5, #2]
        ldrsh   r3, [r3, #6]
        mov     r0, lr
        cmp     r3, lr
        movgt   r0, r3
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r11, r0, r11
        ldrb    r0, [r11, #0x100]
        strb    r0, [r5, #3]
        ldr     r3, [sp, #4]
        ldrb    r0, [r5, +r2]
        ldrsh   r10, [r3]
        str     r0, [sp, #0x68]
        ldrb    r0, [r8, #1]
        ldrb    r11, [r8, #2]
        cmp     r10, lr
        str     r11, [sp, #0x64]
        mov     r11, lr
        movgt   r11, r10
        cmp     r11, #1, 24
        movgt   r11, r6
        add     r10, r4, r11
        ldr     r11, [sp, #0x68]
        add     r11, r10, r11
        ldrb    r11, [r11, #0x100]
        ldrb    r10, [r8, #3]
        strb    r11, [r5, +r2]
        ldrsh   r11, [r3, #2]
        mov     r5, lr
        cmp     r11, lr
        movgt   r5, r11
        cmp     r5, #1, 24
        movgt   r5, r6
        add     r5, r4, r5
        add     r0, r5, r0
        ldrb    r0, [r0, #0x100]
        strb    r0, [r8, #1]
        ldrsh   r5, [r3, #4]
        mov     r0, lr
        cmp     r5, lr
        movgt   r0, r5
        ldr     r5, [sp, #0x64]
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r5, r0, r5
        ldrb    r0, [r5, #0x100]
        strb    r0, [r8, #2]
        ldrsh   r3, [r3, #6]
        mov     r0, lr
        cmp     r3, lr
        movgt   r0, r3
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r10, r0, r10
        ldrb    r0, [r10, #0x100]
        mov     r10, lr
        strb    r0, [r8, #3]
        ldrsh   r11, [r7]
        ldrb    r5, [r8, +r2]
        ldrb    r0, [r9, #1]
        ldrb    r3, [r9, #2]
        cmp     r11, lr
        movgt   r10, r11
        cmp     r10, #1, 24
        movgt   r10, r6
        add     r10, r4, r10
        add     r5, r10, r5
        ldrb    r10, [r5, #0x100]
        ldrb    r5, [r9, #3]
        strb    r10, [r8, +r2]
        ldrsh   r10, [r7, #2]
        mov     r8, lr
        cmp     r10, lr
        movgt   r8, r10
        cmp     r8, #1, 24
        movgt   r8, r6
        add     r8, r4, r8
        add     r0, r8, r0
        ldrb    r0, [r0, #0x100]
        strb    r0, [r9, #1]
        ldrsh   r8, [r7, #4]
        mov     r0, lr
        cmp     r8, lr
        movgt   r0, r8
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r3, r0, r3
        ldrb    r0, [r3, #0x100]
        strb    r0, [r9, #2]
        ldrsh   r7, [r7, #6]
        mov     r0, lr
        cmp     r7, lr
        movgt   r0, r7
        cmp     r0, #1, 24
        movgt   r0, r6
        add     r0, r4, r0
        add     r5, r0, r5
        ldrb    r0, [r5, #0x100]
        strb    r0, [r9, #3]
LKWI7:
        ldr     r3, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        ldrsb   r5, [r3, #1]
        ldrsb   r0, [r3, #2]!
        add     r5, r1, r5
        mov     r6, r6, lsl #1
        mla     r1, r2, r0, r5
        ldr     r0, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r3, [sp, #0xC]
        subs    r0, r0, #1
        str     r0, [sp, #0x14]
        bne     LKWI0
LKWI8:
        mov     r0, #0
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LKWI9:
        mvn     r0, #0xA
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
LKWI10:
        add     r0, sp, #0x6C
        ldr     r3, [r0]
        str     r3, [sp]
        ldr     r5, [r0, #8]
        ldr     r3, [r0, #4]
        str     r5, [sp, #4]
        ldr     r7, [r0, #0xC]
        b       LKWI6
LKWI11:
        mvn     r0, #7
        add     sp, sp, #0x7C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x0001fffe
        .long   xyoff
        .long   ClampTbl
        .long   0x2aaaaaab


