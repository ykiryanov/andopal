        .text
        .align  4
        .globl  ippiReconstructChromaInterMB_H264_16s8u_P2R


ippiReconstructChromaInterMB_H264_16s8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     lr, [sp, #0xB0]
        ldr     r12, [sp, #0xB4]
        cmp     r0, #0
        beq     LKWV8
        cmp     r1, #0
        beq     LKWV8
        cmp     r2, #0
        beq     LKWV8
        ldr     r4, [r0]
        cmp     r4, #0
        beq     LKWV8
        cmp     r12, #0x27
        bhi     LKWV7
        mov     r5, #0xFE, 16
        orr     r5, r5, #7, 8
        tst     lr, r5
        beq     LKWV6
        ldr     r6, [pc, #0xFF4]
        add     r7, sp, #0x74
        add     r5, sp, #0x74
        tst     lr, #6, 16
        str     r6, [r7]
        str     r6, [r5, #4]
        beq     LKWV1
        tst     lr, #2, 16
        beq     LKWV0
        ldr     r7, [pc, #0xFD4]
        ldrsh   r6, [r4, #6]
        ldrsh   r8, [r4, #4]
        ldrsh   r10, [r4]
        ldrsh   r5, [r4, #2]
        add     r9, sp, #0x74
        str     r4, [r9]
        rsb     r9, r12, r12, lsl #2
        ldr     r9, [r7, +r9, lsl #2]
        rsb     r11, r6, #0
        str     r11, [sp, #0x20]
        add     r11, r6, r8
        str     r11, [sp, #0x1C]
        add     r11, r10, r8
        str     r11, [sp, #0x18]
        add     r11, r6, r5
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x20]
        add     r7, r10, r5
        sub     r11, r11, r8
        sub     r8, r10, r8
        str     r11, [sp, #0x20]
        sub     r10, r5, r6
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r11, [sp, #0xC]
        sub     r8, r8, r10
        sub     r6, r6, r11
        ldr     r11, [sp, #0x20]
        add     r5, r7, r5
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        add     r7, r7, r11
        mov     r8, r8, lsl #16
        mov     r5, r5, asr #16
        mul     r5, r5, r9
        mov     r7, r7, lsl #16
        mov     r6, r6, asr #16
        mul     r6, r6, r9
        mov     r7, r7, asr #16
        mul     r7, r7, r9
        mov     r8, r8, asr #16
        mul     r9, r8, r9
        mov     r5, r5, asr #1
        mov     r6, r6, asr #1
        mov     r7, r7, asr #1
        mov     r9, r9, asr #1
        strh    r5, [r4]
        strh    r6, [r4, #2]
        strh    r7, [r4, #4]
        strh    r9, [r4, #6]
        ldr     r4, [r0]
        add     r4, r4, #8
        str     r4, [r0]
LKWV0:
        tst     lr, #1, 14
        beq     LKWV1
        ldr     r7, [pc, #0xEF4]
        ldrsh   r6, [r4, #6]
        ldrsh   r8, [r4, #4]
        ldrsh   r10, [r4]
        ldrsh   r5, [r4, #2]
        add     r9, sp, #0x74
        str     r4, [r9, #4]
        rsb     r9, r12, r12, lsl #2
        ldr     r9, [r7, +r9, lsl #2]
        rsb     r11, r6, #0
        str     r11, [sp, #0x20]
        add     r11, r6, r8
        str     r11, [sp, #0x1C]
        add     r11, r10, r8
        str     r11, [sp, #0x18]
        add     r11, r6, r5
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x20]
        add     r7, r10, r5
        sub     r11, r11, r8
        sub     r8, r10, r8
        str     r11, [sp, #0x20]
        sub     r10, r5, r6
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r11, [sp, #0xC]
        sub     r8, r8, r10
        sub     r6, r6, r11
        ldr     r11, [sp, #0x20]
        add     r5, r7, r5
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        add     r7, r7, r11
        mov     r8, r8, lsl #16
        mov     r5, r5, asr #16
        mul     r5, r5, r9
        mov     r7, r7, lsl #16
        mov     r6, r6, asr #16
        mul     r6, r6, r9
        mov     r7, r7, asr #16
        mul     r7, r7, r9
        mov     r8, r8, asr #16
        mul     r9, r8, r9
        mov     r5, r5, asr #1
        mov     r6, r6, asr #1
        mov     r7, r7, asr #1
        mov     r9, r9, asr #1
        strh    r5, [r4]
        strh    r6, [r4, #2]
        strh    r7, [r4, #4]
        strh    r9, [r4, #6]
        ldr     r4, [r0]
        add     r4, r4, #8
        str     r4, [r0]
LKWV1:
        ldr     r8, [pc, #0xE20]
        mov     r9, r12, lsl #5
        str     r0, [sp, #0x10]
        ldr     r0, [pc, #0xE18]
        mov     r10, #2, 14
        add     r11, r8, r9
        add     r7, sp, #0x7C
        add     r6, sp, #0x7C
        add     r5, sp, #0x7C
        mov     r4, #0
        mvn     r12, #0xFF
        str     r11, [sp, #0xC]
        str     r9, [sp, #8]
        str     r10, [sp, #0x18]
        str     lr, [sp, #0x14]
LKWV2:
        add     r5, sp, #0x74
        ldr     r5, [r5, +r4, lsl #2]
        mov     lr, #0
        str     lr, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r4, [sp, #4]
        str     r2, [sp]
LKWV3:
        ldr     r2, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        tst     r2, lr
        beq     LKWV4
        ldr     r10, [sp, #0x10]
        ldr     lr, [sp, #8]
        ldr     r2, [pc, #0xDB0]
        ldr     r8, [r10]
        ldr     r9, [sp, #0xC]
        ldrsh   lr, [r2, +lr]
        str     lr, [sp, #0x24]
        ldrsh   r2, [r9, #2]
        str     r2, [sp, #0x28]
        ldrsh   r5, [r9, #0xA]
        ldrsh   r4, [r9, #8]
        ldrsh   r2, [r9, #4]
        ldrsh   r7, [r9, #0xE]
        ldrsh   r6, [r9, #0xC]
        ldrsh   r11, [r9, #0x10]
        ldrsh   lr, [r9, #6]
        str     r11, [sp, #0x2C]
        ldrsh   r11, [r9, #0x12]
        str     r11, [sp, #0x30]
        ldrsh   r11, [r9, #0x14]
        str     r11, [sp, #0x34]
        ldrsh   r11, [r9, #0x16]
        str     r11, [sp, #0x38]
        ldrsh   r11, [r9, #0x18]
        str     r11, [sp, #0x3C]
        ldrsh   r11, [r9, #0x1A]
        str     r11, [sp, #0x40]
        ldrsh   r11, [r9, #0x1C]
        str     r11, [sp, #0x44]
        ldrsh   r9, [r9, #0x1E]
        str     r9, [sp, #0x48]
        add     r9, r8, #0x20
        str     r9, [r10]
        ldrsh   r9, [r8, #2]
        ldrsh   r11, [r8, #4]
        ldrsh   r10, [r8]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x24]
        mul     r10, r11, r10
        ldr     r11, [sp, #0x28]
        str     r10, [sp, #0x24]
        ldrsh   r10, [r8, #6]
        mul     r9, r11, r9
        mul     r10, lr, r10
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x4C]
        str     r10, [sp, #0x50]
        mul     r9, r2, r9
        str     r9, [sp, #0x4C]
        ldrsh   r10, [r8, #8]
        ldrsh   r9, [r8, #0xA]
        ldrsh   r2, [r8, #0xC]
        ldrsh   lr, [r8, #0xE]
        mul     r10, r4, r10
        mul     r9, r5, r9
        mul     r2, r6, r2
        str     r9, [sp, #0x58]
        str     r10, [sp, #0x54]
        str     r2, [sp, #0x5C]
        mul     r2, r7, lr
        ldrsh   r7, [r8, #0x10]
        ldrsh   r6, [r8, #0x12]
        ldrsh   r4, [r8, #0x14]
        ldr     lr, [sp, #0x2C]
        ldrsh   r5, [r8, #0x16]
        mul     lr, lr, r7
        ldr     r7, [sp, #0x30]
        mul     r6, r7, r6
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        ldrsh   r10, [r8, #0x1C]
        ldrsh   r7, [r8, #0x1A]
        mul     r4, r6, r4
        ldr     r6, [sp, #0x38]
        ldrsh   r11, [r8, #0x18]
        ldrsh   r9, [r8, #0x1E]
        mul     r5, r6, r5
        ldr     r6, [sp, #0x3C]
        mul     r6, r6, r11
        ldr     r11, [sp, #0x40]
        mul     r7, r11, r7
        ldr     r11, [sp, #0x44]
        mul     r10, r11, r10
        ldr     r11, [sp, #0x48]
        mul     r9, r11, r9
        ldr     r11, [sp, #0x24]
        strh    r11, [r8]
        ldr     r11, [sp, #0x28]
        strh    r11, [r8, #2]
        ldr     r11, [sp, #0x4C]
        strh    r11, [r8, #4]
        ldr     r11, [sp, #0x50]
        strh    r11, [r8, #6]
        ldr     r11, [sp, #0x54]
        strh    r11, [r8, #8]
        ldr     r11, [sp, #0x58]
        strh    r11, [r8, #0xA]
        ldr     r11, [sp, #0x5C]
        strh    lr, [r8, #0x10]
        strh    r2, [r8, #0xE]
        strh    r11, [r8, #0xC]
        ldr     r2, [sp, #0x30]
        strh    r7, [r8, #0x1A]
        strh    r10, [r8, #0x1C]
        strh    r2, [r8, #0x12]
        strh    r5, [r8, #0x16]
        strh    r4, [r8, #0x14]
        strh    r6, [r8, #0x18]
        strh    r9, [r8, #0x1E]
        ldr     r2, [sp, #0x20]
        add     lr, sp, #0x7C
        str     r8, [lr]
        ldrsh   r2, [r2]
        add     lr, sp, #0x7C
        ldr     r4, [lr]
        strh    r2, [r8]
        add     r2, r8, #8
        add     lr, sp, #0x7C
        ldrsh   r6, [r4, #4]
        ldrsh   r11, [r4, #6]
        ldrsh   r10, [r4, #2]
        ldrsh   r7, [r4]
        str     r2, [lr, #4]
        add     lr, r8, #0x10
        add     r5, sp, #0x7C
        str     lr, [r5, #8]
        rsb     lr, r11, r10, asr #1
        add     r5, sp, #0x7C
        ldr     r5, [r5, #8]
        sub     r9, r7, r6
        add     r6, r7, r6
        mov     lr, lr, lsl #16
        mov     r9, r9, lsl #16
        mov     r7, r6, lsl #16
        mov     lr, lr, asr #16
        add     r10, r10, r11, asr #1
        rsb     r6, lr, r9, asr #16
        strh    r6, [r4, #4]
        mov     r10, r10, lsl #16
        add     r9, lr, r9, asr #16
        strh    r9, [r4, #2]
        add     r2, sp, #0x7C
        ldr     r2, [r2, #4]
        mov     r6, r10, asr #16
        add     r9, sp, #0x7C
        add     lr, r8, #0x18
        str     lr, [r9, #0xC]
        add     r10, r6, r7, asr #16
        rsb     r7, r6, r7, asr #16
        strh    r10, [r4]
        add     lr, sp, #0x7C
        ldr     lr, [lr, #0xC]
        strh    r7, [r4, #6]
        ldrsh   r11, [r2, #4]
        ldrsh   r6, [r2]
        ldrsh   r10, [r2, #2]
        ldrsh   r7, [r2, #6]
        add     r9, r1, r3
        str     r9, [sp, #0x5C]
        rsb     r9, r7, r10, asr #1
        add     r10, r10, r7, asr #1
        add     r7, r6, r11
        sub     r6, r6, r11
        mov     r9, r9, lsl #16
        mov     r6, r6, lsl #16
        mov     r9, r9, asr #16
        mov     r10, r10, lsl #16
        rsb     r11, r9, r6, asr #16
        mov     r10, r10, asr #16
        strh    r11, [r2, #4]
        mov     r7, r7, lsl #16
        add     r6, r9, r6, asr #16
        add     r11, r10, r7, asr #16
        strh    r11, [r2]
        strh    r6, [r2, #2]
        rsb     r7, r10, r7, asr #16
        strh    r7, [r2, #6]
        ldrsh   r9, [r5, #6]
        ldrsh   r10, [r5, #2]
        ldrsh   r7, [r5]
        ldrsh   r6, [r5, #4]
        rsb     r11, r9, r10, asr #1
        str     r11, [sp, #0x54]
        add     r9, r10, r9, asr #1
        str     r6, [sp, #0x58]
        ldr     r10, [sp, #0x58]
        ldr     r6, [sp, #0x5C]
        str     r9, [sp, #0x50]
        ldr     r9, [sp, #0x58]
        ldr     r11, [sp, #0x50]
        add     r10, r7, r10
        add     r6, r3, r6
        sub     r9, r7, r9
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x54]
        ldr     r7, [sp, #0x4C]
        mov     r11, r11, lsl #16
        mov     r9, r9, lsl #16
        str     r11, [sp, #0x58]
        mov     r7, r7, lsl #16
        mov     r9, r9, asr #16
        mov     r10, r10, lsl #16
        rsb     r11, r9, r7, asr #16
        strh    r11, [r5, #4]
        ldr     r11, [sp, #0x58]
        add     r7, r9, r7, asr #16
        mov     r11, r11, asr #16
        str     r11, [sp, #0x58]
        rsb     r11, r11, r10, asr #16
        strh    r11, [r5, #6]
        ldr     r11, [sp, #0x58]
        strh    r7, [r5, #2]
        add     r10, r11, r10, asr #16
        strh    r10, [r5]
        ldrsh   r7, [lr, #2]
        ldrsh   r10, [lr]
        add     r11, r3, r6
        str     r7, [sp, #0x58]
        ldrsh   r7, [lr, #4]
        ldrsh   r9, [lr, #6]
        str     r11, [sp, #0x54]
        add     r11, r10, r7
        sub     r10, r10, r7
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x58]
        str     r11, [sp, #0x50]
        add     r11, r10, r9, asr #1
        rsb     r7, r9, r10, asr #1
        ldr     r9, [sp, #0x50]
        mov     r11, r11, lsl #16
        mov     r7, r7, lsl #16
        mov     r10, r9, lsl #16
        ldr     r9, [sp, #0x4C]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x58]
        mov     r11, r11, asr #16
        mov     r9, r9, lsl #16
        add     r7, r7, r9, asr #16
        strh    r7, [lr, #2]
        add     r7, r11, r10, asr #16
        strh    r7, [lr]
        ldr     r7, [sp, #0x58]
        rsb     r10, r11, r10, asr #16
        strh    r10, [lr, #6]
        rsb     r9, r7, r9, asr #16
        strh    r9, [lr, #4]
        ldrsh   r7, [r8, #8]
        ldrsh   r9, [r8, #0x18]
        ldrsh   r10, [r8, #0xA]
        str     r10, [sp, #0x58]
        ldrsh   r10, [r8, #0x1A]
        str     r10, [sp, #0x50]
        ldrsh   r10, [r8, #0xC]
        str     r10, [sp, #0x4C]
        ldrsh   r10, [r8, #0x1C]
        str     r10, [sp, #0x48]
        ldrsh   r11, [r8, #0x1E]
        ldrsh   r10, [r8, #0xE]
        str     r11, [sp, #0x44]
        ldrsh   r11, [r8]
        str     r11, [sp, #0x40]
        ldrsh   r11, [r8, #0x10]
        str     r11, [sp, #0x3C]
        ldrsh   r11, [r8, #2]
        str     r11, [sp, #0x38]
        ldrsh   r11, [r8, #0x12]
        str     r11, [sp, #0x34]
        ldrsh   r11, [r8, #4]
        str     r11, [sp, #0x30]
        ldrsh   r11, [r8, #0x14]
        str     r11, [sp, #0x2C]
        ldrsh   r11, [r8, #6]
        str     r11, [sp, #0x28]
        ldrsh   r11, [r8, #0x16]
        str     r11, [sp, #0x24]
        rsb     r11, r9, r7, asr #1
        add     r9, r7, r9, asr #1
        ldr     r7, [sp, #0x50]
        str     r11, [sp, #0x60]
        str     r9, [sp, #0x64]
        ldr     r9, [sp, #0x58]
        ldr     r11, [sp, #0x38]
        rsb     r9, r7, r9, asr #1
        str     r9, [sp, #0x68]
        ldr     r7, [sp, #0x58]
        ldr     r9, [sp, #0x50]
        add     r9, r7, r9, asr #1
        ldr     r7, [sp, #0x48]
        str     r9, [sp, #0x58]
        ldr     r9, [sp, #0x4C]
        rsb     r9, r7, r9, asr #1
        str     r9, [sp, #0x50]
        ldr     r9, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        add     r9, r7, r9, asr #1
        ldr     r7, [sp, #0x44]
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x3C]
        rsb     r7, r7, r10, asr #1
        str     r7, [sp, #0x48]
        ldr     r7, [sp, #0x44]
        add     r7, r10, r7, asr #1
        ldr     r10, [sp, #0x40]
        str     r7, [sp, #0x44]
        add     r7, r10, r9
        sub     r10, r10, r9
        ldr     r9, [sp, #0x60]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x34]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x64]
        mov     r7, r7, lsl #16
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x64]
        add     r9, r11, r10
        str     r9, [sp, #0x3C]
        ldr     r9, [sp, #0x68]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x2C]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x68]
        ldr     r9, [sp, #0x58]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x30]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x58]
        add     r9, r11, r10
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x50]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x24]
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x40]
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x28]
        mov     r9, r9, lsl #16
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x40]
        ldr     r7, [sp, #0x60]
        str     r9, [sp, #0x50]
        ldr     r9, [sp, #0x4C]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x64]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x4C]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x64]
        ldr     r7, [sp, #0x3C]
        add     r9, r11, r10
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x48]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x38]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0x38]
        ldr     r7, [sp, #0x68]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x30]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x58]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x24]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x34]
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x58]
        ldr     r10, [sp, #0x50]
        mov     r7, r7, asr #16
        mov     r9, r9, lsl #16
        mov     r10, r10, asr #16
        str     r10, [sp, #0x50]
        ldr     r10, [sp, #0x4C]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x2C]
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x28]
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x48]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x64]
        add     r11, r10, r11, asr #16
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x40]
        ldr     r10, [sp, #0x60]
        add     r11, r10, r11, asr #16
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x40]
        ldr     r10, [sp, #0x60]
        rsb     r11, r10, r11, asr #16
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x24]
        ldr     r10, [sp, #0x64]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x3C]
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x38]
        add     r10, r7, r10, asr #16
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x68]
        add     r11, r10, r11, asr #16
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        ldr     r10, [sp, #0x68]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x3C]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x68]
        rsb     r10, r7, r10, asr #16
        ldr     r7, [sp, #0x4C]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x58]
        add     r11, r11, #0x20
        add     r7, r7, r9, asr #16
        str     r7, [sp, #0x38]
        ldr     r7, [sp, #0x50]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x3C]
        add     r10, r7, r10, asr #16
        str     r10, [sp, #0x6C]
        ldr     r10, [sp, #0x58]
        ldr     r7, [sp, #0x50]
        add     r11, r11, #0x20
        rsb     r10, r7, r10, asr #16
        ldr     r7, [sp, #0x4C]
        str     r10, [sp, #0x58]
        ldr     r10, [sp, #0x24]
        rsb     r9, r7, r9, asr #16
        str     r9, [sp, #0x50]
        ldr     r7, [sp, #0x44]
        ldr     r9, [sp, #0x34]
        add     r10, r10, #0x20
        mov     r10, r10, asr #6
        add     r9, r7, r9, asr #16
        str     r9, [sp, #0x4C]
        ldr     r7, [sp, #0x48]
        ldr     r9, [sp, #0x30]
        add     r9, r7, r9, asr #16
        ldr     r7, [sp, #0x48]
        str     r9, [sp, #0x70]
        ldr     r9, [sp, #0x30]
        rsb     r9, r7, r9, asr #16
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x34]
        ldr     r7, [sp, #0x44]
        rsb     r9, r7, r9, asr #16
        ldr     r7, [sp, #0x2C]
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x60]
        str     r10, [sp, #0x2C]
        add     r7, r7, #0x20
        add     r9, r9, #0x20
        str     r9, [sp, #0x60]
        ldr     r9, [sp, #0x64]
        str     r7, [sp, #0x34]
        ldr     r7, [sp, #0x28]
        add     r9, r9, #0x20
        str     r9, [sp, #0x64]
        ldr     r9, [sp, #0x40]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x38]
        add     r7, r7, #0x20
        add     r9, r9, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x6C]
        mov     r9, r9, asr #6
        str     r9, [sp, #0x30]
        ldr     r9, [sp, #0x3C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x58]
        ldr     r10, [sp, #0x6C]
        mov     r7, r7, asr #6
        add     r11, r11, #0x20
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x50]
        mov     r10, r10, asr #6
        str     r10, [sp, #0x6C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x4C]
        ldr     r10, [sp, #0x58]
        mov     r9, r9, asr #6
        add     r11, r11, #0x20
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x70]
        mov     r10, r10, asr #6
        str     r10, [sp, #0x58]
        ldr     r10, [sp, #0x50]
        add     r11, r11, #0x20
        str     r11, [sp, #0x70]
        ldr     r11, [sp, #0x48]
        mov     r10, r10, asr #6
        str     r10, [sp, #0x50]
        add     r11, r11, #0x20
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        ldr     r10, [sp, #0x4C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x34]
        str     r7, [sp, #0x34]
        ldr     r7, [sp, #0x60]
        mov     r10, r10, asr #6
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x70]
        mov     r7, r7, asr #6
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x64]
        mov     r10, r10, asr #6
        str     r10, [sp, #0x70]
        mov     r7, r7, asr #6
        ldr     r10, [sp, #0x48]
        str     r7, [sp, #0x64]
        ldr     r7, [sp, #0x68]
        mov     r11, r11, asr #6
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x38]
        mov     r7, r7, asr #6
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x40]
        mov     r10, r10, asr #6
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        strh    r11, [r8]
        ldr     r11, [sp, #0x34]
        mov     r7, r7, asr #6
        mov     r10, r10, asr #6
        strh    r11, [r8, #8]
        ldr     r11, [sp, #0x60]
        strh    r11, [r8, #0x10]
        ldr     r11, [sp, #0x64]
        strh    r11, [r8, #0x18]
        ldr     r11, [sp, #0x30]
        strh    r11, [r8, #2]
        ldr     r11, [sp, #0x2C]
        strh    r11, [r8, #0xA]
        ldr     r11, [sp, #0x68]
        strh    r7, [r8, #0x1A]
        strh    r9, [r8, #4]
        strh    r11, [r8, #0x12]
        ldr     r7, [sp, #0x6C]
        strh    r7, [r8, #0xC]
        ldr     r7, [sp, #0x58]
        strh    r7, [r8, #0x14]
        ldr     r7, [sp, #0x50]
        strh    r7, [r8, #0x1C]
        ldr     r7, [sp, #0x4C]
        strh    r7, [r8, #6]
        ldr     r7, [sp, #0x70]
        strh    r7, [r8, #0xE]
        ldr     r7, [sp, #0x48]
        strh    r10, [r8, #0x1E]
        strh    r7, [r8, #0x16]
        ldrb    r10, [r1]
        ldrb    r7, [r1, #1]
        ldrb    r11, [r1, #3]
        ldrb    r8, [r1, #2]
        ldrsh   r9, [r4]
        str     r11, [sp, #0x70]
        mov     r11, r12
        add     r8, r0, r8
        cmp     r9, r12
        movgt   r11, r9
        cmp     r11, #1, 24
        mov     r9, #1, 24
        movgt   r11, r9
        add     r11, r0, r11
        add     r10, r11, r10
        ldr     r11, [sp, #0x70]
        ldrb    r10, [r10, #0x100]
        str     r8, [sp, #0x70]
        add     r11, r0, r11
        add     r7, r0, r7
        strb    r10, [r1]
        ldrsh   r8, [r4, #2]
        mov     r10, r12
        cmp     r8, r12
        movgt   r10, r8
        cmp     r10, #1, 24
        movgt   r10, r9
        add     r10, r7, r10
        ldrb    r7, [r10, #0x100]
        mov     r10, r12
        strb    r7, [r1, #1]
        ldrsh   r8, [r4, #4]
        mov     r7, r12
        cmp     r8, r12
        movgt   r7, r8
        ldr     r8, [sp, #0x70]
        cmp     r7, #1, 24
        movgt   r7, r9
        add     r7, r8, r7
        ldrb    r7, [r7, #0x100]
        strb    r7, [r1, #2]
        ldrsh   r4, [r4, #6]
        mov     r7, r12
        cmp     r4, r12
        movgt   r7, r4
        cmp     r7, #1, 24
        movgt   r7, r9
        add     r7, r11, r7
        ldrb    r4, [r7, #0x100]
        strb    r4, [r1, #3]
        ldrsh   r11, [r2]
        ldrb    r7, [r3, +r1]
        ldr     r4, [sp, #0x5C]
        cmp     r11, r12
        movgt   r10, r11
        ldrb    r8, [r4, #1]
        ldrb    r4, [r4, #2]
        cmp     r10, #1, 24
        ldr     r11, [sp, #0x5C]
        movgt   r10, r9
        add     r10, r0, r10
        add     r7, r10, r7
        ldrb    r11, [r11, #3]
        ldrb    r7, [r7, #0x100]
        mov     r10, r12
        strb    r7, [r3, +r1]
        ldrsh   r7, [r2, #2]
        cmp     r7, r12
        movgt   r10, r7
        cmp     r10, #1, 24
        movgt   r10, r9
        add     r10, r0, r10
        add     r8, r10, r8
        ldrb    r7, [r8, #0x100]
        ldr     r8, [sp, #0x5C]
        mov     r10, r12
        strb    r7, [r8, #1]
        ldrsh   r7, [r2, #4]
        mov     r8, r12
        cmp     r7, r12
        movgt   r8, r7
        ldr     r7, [sp, #0x5C]
        cmp     r8, #1, 24
        movgt   r8, r9
        add     r8, r0, r8
        add     r4, r8, r4
        ldrb    r4, [r4, #0x100]
        strb    r4, [r7, #2]
        ldrsh   r2, [r2, #6]
        mov     r4, r12
        cmp     r2, r12
        movgt   r4, r2
        cmp     r4, #1, 24
        movgt   r4, r9
        add     r4, r0, r4
        add     r11, r4, r11
        ldrb    r4, [r11, #0x100]
        ldr     r2, [sp, #0x5C]
        strb    r4, [r2, #3]
        ldrsh   r8, [r5]
        ldrb    r7, [r6, #1]
        ldrb    r2, [r2, +r3]
        ldrb    r4, [r6, #2]
        cmp     r8, r12
        movgt   r10, r8
        cmp     r10, #1, 24
        movgt   r10, r9
        add     r10, r0, r10
        add     r2, r10, r2
        ldr     r10, [sp, #0x5C]
        ldrb    r8, [r2, #0x100]
        ldrb    r2, [r6, #3]
        strb    r8, [r10, +r3]
        ldrsh   r8, [r5, #2]
        mov     r10, r12
        cmp     r8, r12
        movgt   r10, r8
        cmp     r10, #1, 24
        movgt   r10, r9
        add     r10, r0, r10
        add     r7, r10, r7
        ldrb    r7, [r7, #0x100]
        mov     r8, r12
        strb    r7, [r6, #1]
        ldrsh   r7, [r5, #4]
        cmp     r7, r12
        movgt   r8, r7
        cmp     r8, #1, 24
        movgt   r8, r9
        add     r8, r0, r8
        add     r4, r8, r4
        ldrb    r4, [r4, #0x100]
        mov     r8, r12
        strb    r4, [r6, #2]
        ldrsh   r5, [r5, #6]
        mov     r4, r12
        cmp     r5, r12
        movgt   r4, r5
        cmp     r4, #1, 24
        movgt   r4, r9
        add     r4, r0, r4
        add     r2, r4, r2
        ldrb    r2, [r2, #0x100]
        strb    r2, [r6, #3]
        ldrsh   r7, [lr]
        ldrb    r2, [r6, +r3]
        ldr     r4, [sp, #0x54]
        cmp     r7, r12
        movgt   r8, r7
        ldrb    r5, [r4, #1]
        ldrb    r4, [r4, #2]
        cmp     r8, #1, 24
        movgt   r8, r9
        add     r8, r0, r8
        add     r2, r8, r2
        ldrb    r7, [r2, #0x100]
        ldr     r2, [sp, #0x54]
        strb    r7, [r6, +r3]
        ldrsh   r6, [lr, #2]
        mov     r7, r12
        ldrb    r2, [r2, #3]
        cmp     r6, r12
        movgt   r7, r6
        cmp     r7, #1, 24
        movgt   r7, r9
        add     r7, r0, r7
        add     r5, r7, r5
        ldr     r6, [sp, #0x54]
        ldrb    r5, [r5, #0x100]
        strb    r5, [r6, #1]
        ldrsh   r5, [lr, #4]
        mov     r6, r12
        cmp     r5, r12
        movgt   r6, r5
        cmp     r6, #1, 24
        movgt   r6, r9
        add     r6, r0, r6
        add     r4, r6, r4
        ldr     r5, [sp, #0x54]
        ldrb    r4, [r4, #0x100]
        strb    r4, [r5, #2]
        ldrsh   lr, [lr, #6]
        mov     r4, r12
        cmp     lr, r12
        movgt   r4, lr
        cmp     r4, #1, 24
        movgt   r4, r9
        add     r4, r0, r4
        add     r2, r4, r2
        ldr     lr, [sp, #0x54]
        ldrb    r2, [r2, #0x100]
        strb    r2, [lr, #3]
        b       LKWV5
LKWV4:
        ldr     r2, [sp, #0x20]
        ldrsh   r2, [r2]
        cmp     r2, #0
        beq     LKWV5
        ldrb    r6, [r1]
        ldrb    r5, [r1, #2]
        ldrb    r7, [r1, #3]
        add     r2, r2, #0x20
        mov     r4, r12
        add     r5, r0, r5
        mov     lr, r2, asr #6
        ldrb    r2, [r1, #1]
        add     r7, r0, r7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, r12
        movgt   r4, lr
        cmp     r4, #1, 24
        mov     lr, #1, 24
        movgt   r4, lr
        add     r2, r0, r2
        add     lr, r0, r4
        add     r2, r2, r4
        ldrb    r2, [r2, #0x100]
        add     r5, r5, r4
        ldrb    r5, [r5, #0x100]
        add     r4, r7, r4
        add     r6, lr, r6
        ldrb    r4, [r4, #0x100]
        ldrb    r6, [r6, #0x100]
        strb    r2, [r1, #1]
        strb    r5, [r1, #2]
        strb    r4, [r1, #3]
        strb    r6, [r1]
        ldrb    r2, [r3, +r1]
        add     r4, r1, r3
        ldrb    r6, [r4, #1]
        ldrb    r5, [r4, #3]
        ldrb    r7, [r4, #2]
        add     r2, lr, r2
        ldrb    r2, [r2, #0x100]
        add     r6, lr, r6
        ldrb    r6, [r6, #0x100]
        add     r5, lr, r5
        add     r7, lr, r7
        ldrb    r7, [r7, #0x100]
        ldrb    r5, [r5, #0x100]
        strb    r2, [r3, +r1]
        strb    r6, [r4, #1]
        strb    r7, [r4, #2]
        strb    r5, [r4, #3]
        add     r2, r3, r4
        ldrb    r8, [r2, #3]
        ldrb    r6, [r4, +r3]
        ldrb    r5, [r2, #1]
        ldrb    r7, [r2, #2]
        add     r8, lr, r8
        ldrb    r8, [r8, #0x100]
        add     r6, lr, r6
        ldrb    r6, [r6, #0x100]
        add     r5, lr, r5
        ldrb    r5, [r5, #0x100]
        add     r7, lr, r7
        ldrb    r7, [r7, #0x100]
        strb    r8, [r2, #3]
        strb    r6, [r4, +r3]
        strb    r5, [r2, #1]
        strb    r7, [r2, #2]
        add     r8, r3, r2
        ldrb    r5, [r2, +r3]
        ldrb    r4, [r8, #1]
        ldrb    r6, [r8, #2]
        ldrb    r7, [r8, #3]
        add     r5, lr, r5
        ldrb    r5, [r5, #0x100]
        add     r4, lr, r4
        ldrb    r4, [r4, #0x100]
        add     r6, lr, r6
        ldrb    r6, [r6, #0x100]
        add     r7, lr, r7
        ldrb    lr, [r7, #0x100]
        strb    r5, [r2, +r3]
        strb    r4, [r8, #1]
        strb    r6, [r8, #2]
        strb    lr, [r8, #3]
LKWV5:
        ldr     r2, [sp, #0x1C]
        add     r1, r1, #4
        cmp     r2, #1
        addeq   r1, r1, r3, lsl #2
        subeq   r1, r1, #8
        ldr     r2, [sp, #0x1C]
        add     r2, r2, #1
        cmp     r2, #4
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        add     r2, r2, #2
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x18]
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x18]
        bcc     LKWV3
        ldr     r4, [sp, #4]
        ldr     r2, [sp]
        add     r4, r4, #1
        cmp     r4, #2
        mov     r1, r2
        bcc     LKWV2
LKWV6:
        mov     r0, #0
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWV7:
        mvn     r0, #0xA
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LKWV8:
        mvn     r0, #7
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
        .long   LKWV_zeroArray
        .long   InvQuantTable
        .long   InvQuantTable_w7
        .long   ClampTbl


        .data
        .align  4


LKWV_zeroArray:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


