        .text
        .align  4
        .globl  _ippiReconstructChromaInter4x4MB_H264_16s8u_P2R


_ippiReconstructChromaInter4x4MB_H264_16s8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xAC
        ldr     r8, [sp, #0xD0]
        ldr     r6, [sp, #0xD4]
        ldr     r5, [sp, #0xD8]
        ldr     r4, [sp, #0xDC]
        ldr     lr, [sp, #0xE0]
        ldr     r7, [sp, #0xE4]
        cmp     r0, #0
        beq     LKWM23
        cmp     r1, #0
        beq     LKWM23
        cmp     r2, #0
        beq     LKWM23
        ldr     r9, [r0]
        cmp     r9, #0
        beq     LKWM23
        cmp     r4, #0
        beq     LKWM23
        cmp     lr, #0
        beq     LKWM23
        cmp     r6, #0x27
        bhi     LKWM20
        cmp     r5, #0x27
        bhi     LKWM20
        mov     r12, #0xFE, 16
        orr     r12, r12, #7, 8
        tst     r8, r12
        beq     LKWM19
        ldr     r12, [pc, #0xECC]
        add     r10, sp, #0x94
        tst     r8, #6, 16
        str     r12, [r10]
        add     r10, sp, #0x94
        str     r12, [r10, #4]
        beq     LKWM5
        ldr     r12, [pc, #0xEB4]
        tst     r8, #2, 16
        umull   r12, r10, r6, r12
        ldrsh   r12, [r4]
        mov     r10, r10, lsr #2
        str     r10, [sp]
        beq     LKWM2
        add     r10, sp, #0x94
        cmp     r7, #0
        str     r9, [r10]
        beq     LKWM0
        cmp     r6, #0
        ble     LKWM1
LKWM0:
        ldrsh   r10, [r9, #6]
        str     r10, [sp, #0x4C]
        ldrsh   r10, [r9, #4]
        str     r10, [sp, #0x48]
        ldrsh   r10, [r9]
        str     r10, [sp, #0x44]
        ldrsh   r10, [r9, #2]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x4C]
        rsb     r11, r10, #0
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x48]
        add     r11, r10, r11
        ldr     r10, [sp, #0x48]
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x44]
        add     r10, r11, r10
        str     r10, [sp, #0x28]
        ldr     r11, [sp, #0x44]
        ldr     r10, [sp, #0x40]
        add     r10, r11, r10
        ldr     r11, [sp, #0x4C]
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0x40]
        add     r10, r11, r10
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x48]
        sub     r10, r10, r11
        str     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        sub     r10, r10, r11
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x4C]
        sub     r10, r10, r11
        str     r10, [sp, #0x4C]
        ldr     r11, [sp, #0x24]
        ldr     r10, [sp, #0x2C]
        add     r10, r11, r10
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x20]
        sub     r10, r10, r11
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x3C]
        ldr     r11, [sp, #0x24]
        add     r10, r11, r10
        ldr     r11, [sp, #0x4C]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x48]
        sub     r10, r10, r11
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x44]
        ldr     r11, [sp, #0x3C]
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x40]
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        mov     r10, r10, lsl #16
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x48]
        mov     r10, r10, asr #16
        mul     r10, r10, r12
        mov     r11, r11, asr #16
        mul     r11, r11, r12
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        mov     r11, r11, asr #16
        mul     r11, r11, r12
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        mov     r11, r11, asr #16
        mul     r12, r11, r12
        ldr     r11, [sp, #0x48]
        str     r12, [sp, #0x4C]
        ldr     r12, [sp]
        mov     r11, r11, lsl r12
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        mov     r10, r10, lsl r12
        mov     r11, r11, lsl r12
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        mov     r10, r10, asr #5
        mov     r12, r11, lsl r12
        ldr     r11, [sp, #0x48]
        mov     r12, r12, asr #5
        mov     r11, r11, asr #5
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x44]
        mov     r11, r11, asr #5
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        strh    r10, [r9, #2]
        strh    r11, [r9]
        ldr     r10, [sp, #0x48]
        strh    r12, [r9, #6]
        strh    r10, [r9, #4]
        ldr     r9, [r0]
LKWM1:
        add     r9, r9, #8
        str     r9, [r0]
LKWM2:
        ldr     r12, [pc, #0xCD8]
        tst     r8, #1, 14
        umull   r12, r10, r5, r12
        ldrsh   r12, [lr]
        mov     r10, r10, lsr #2
        str     r10, [sp]
        beq     LKWM5
        add     r10, sp, #0x94
        cmp     r7, #0
        str     r9, [r10, #4]
        beq     LKWM3
        cmp     r5, #0
        ble     LKWM4
LKWM3:
        ldrsh   r10, [r9, #6]
        str     r10, [sp, #0x4C]
        ldrsh   r10, [r9, #4]
        str     r10, [sp, #0x48]
        ldrsh   r10, [r9]
        str     r10, [sp, #0x44]
        ldrsh   r10, [r9, #2]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x4C]
        rsb     r11, r10, #0
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x48]
        add     r11, r10, r11
        ldr     r10, [sp, #0x48]
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x44]
        add     r10, r11, r10
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x44]
        add     r10, r11, r10
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x4C]
        add     r10, r11, r10
        str     r10, [sp, #0x20]
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp, #0x3C]
        sub     r10, r10, r11
        ldr     r11, [sp, #0x48]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x44]
        sub     r10, r10, r11
        ldr     r11, [sp, #0x4C]
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x40]
        sub     r10, r10, r11
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x24]
        add     r10, r11, r10
        str     r10, [sp, #0x44]
        ldr     r11, [sp, #0x20]
        ldr     r10, [sp, #0x28]
        sub     r10, r10, r11
        str     r10, [sp, #0x40]
        ldr     r11, [sp, #0x24]
        ldr     r10, [sp, #0x3C]
        add     r10, r11, r10
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x48]
        ldr     r11, [sp, #0x4C]
        sub     r10, r10, r11
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x44]
        ldr     r11, [sp, #0x40]
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        mul     r10, r10, r12
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x3C]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x48]
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        mov     r10, r10, asr #16
        mul     r10, r10, r12
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x4C]
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        mov     r10, r10, asr #16
        mul     r10, r10, r12
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x4C]
        mov     r10, r10, asr #16
        mul     r12, r10, r12
        ldr     r10, [sp]
        mov     r11, r11, lsl r10
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        str     r12, [sp, #0x4C]
        ldr     r12, [sp, #0x40]
        mov     r11, r11, lsl r10
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        mov     r12, r12, lsl r10
        mov     r10, r11, lsl r10
        str     r10, [sp, #0x4C]
        mov     r11, r12, asr #5
        ldr     r12, [sp, #0x48]
        mov     r10, r12, asr #5
        ldr     r12, [sp, #0x44]
        mov     r12, r12, asr #5
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0x4C]
        strh    r10, [r9, #2]
        strh    r11, [r9]
        ldr     r10, [sp, #0x48]
        mov     r12, r12, asr #5
        strh    r12, [r9, #6]
        strh    r10, [r9, #4]
        ldr     r9, [r0]
LKWM4:
        add     r9, r9, #8
        str     r9, [r0]
LKWM5:
        ldr     r10, [pc, #0xAF8]
        mov     r12, #2, 14
        str     r12, [sp, #4]
        mov     r12, #0
        str     r12, [sp]
        str     r7, [sp, #0x38]
        ldr     r7, [sp]
        add     r11, sp, #0x9C
        mov     r9, #1
        mvn     r12, #0xFF
        str     r8, [sp, #0x34]
        str     r3, [sp, #8]
        str     r0, [sp, #0x30]
LKWM6:
        mov     r3, r4
        mov     r0, r6
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x10]
LKWM7:
        ldr     r8, [pc, #0xAB0]
        add     r6, sp, #0x94
        mov     r4, #0
        sub     r8, r8, #2, 2
        smull   r10, r8, r0, r8
        ldr     r10, [r6, +r7, lsl #2]
        sub     r6, r8, r0, asr #31
        rsb     r8, r6, #3
        sub     r11, r6, #4
        rsb     r6, r6, #4
        str     r6, [sp, #0x28]
        str     r5, [sp, #0x14]
        ldr     r5, [pc, #0xA84]
        ldr     r6, [sp, #8]
        mov     r8, r9, lsl r8
        str     r3, [sp, #0x2C]
        str     r8, [sp, #0x24]
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r7, [sp]
        str     lr, [sp, #0x1C]
        str     r2, [sp, #0xC]
LKWM8:
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #4]
        tst     r2, r3
        beq     LKWM16
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x38]
        ldr     lr, [r2]
        str     lr, [sp, #0x44]
        add     lr, lr, #0x20
        cmp     r3, #0
        str     lr, [r2]
        beq     LKWM9
        cmp     r0, #0
        ble     LKWM13
LKWM9:
        cmp     r0, #0x18
        blt     LKWM11
        ldr     r3, [sp, #0x44]
        ldr     r7, [sp, #0x2C]
        ldr     r4, [sp, #0x20]
        mov     r2, #0
        mov     lr, #0x10
LKWM10:
        ldrsh   r8, [r7, +r2]
        ldrsh   r9, [r3]
        add     r2, r2, #2
        subs    lr, lr, #1
        mul     r8, r9, r8
        mov     r8, r8, lsl r4
        strh    r8, [r3], #2
        bne     LKWM10
        str     r7, [sp, #0x2C]
        str     r4, [sp, #0x20]
        b       LKWM13
LKWM11:
        ldr     r2, [sp, #0x44]
        ldr     r4, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x24]
        mov     lr, #0
        mov     r3, #0x10
LKWM12:
        ldrsh   r9, [r4, +lr]
        ldrsh   r10, [r2]
        add     lr, lr, #2
        subs    r3, r3, #1
        mla     r9, r10, r9, r8
        mov     r9, r9, asr r7
        strh    r9, [r2], #2
        bne     LKWM12
        str     r4, [sp, #0x2C]
        str     r7, [sp, #0x28]
        str     r8, [sp, #0x24]
LKWM13:
        ldr     r2, [sp, #0x3C]
        ldr     r8, [sp, #0x44]
        ldr     r7, [sp, #0x38]
        ldrsh   r4, [r2]
        add     r9, sp, #0x9C
        add     lr, r8, #8
        add     r3, r8, #0x10
        strh    r4, [r8]
        add     r4, sp, #0x9C
        str     lr, [r4, #4]
        add     lr, sp, #0x9C
        str     r3, [lr, #8]
        add     r2, r8, #0x18
        add     r3, sp, #0x9C
        cmp     r7, #0
        str     r8, [r9]
        str     r2, [r3, #0xC]
        beq     LKWM14
        cmp     r0, #0
        ble     LKWM21
LKWM14:
        add     r2, sp, #0x9C
        ldr     r8, [r2]
        ldr     r7, [r2, #4]
        ldr     r2, [r2, #8]
        str     r2, [sp, #0x48]
        ldrsh   r4, [r8, #6]
        ldrsh   lr, [r8, #2]
        ldrsh   r9, [r8, #4]
        ldrsh   r10, [r8]
        rsb     r3, r4, lr, asr #1
        add     lr, lr, r4, asr #1
        add     r4, r10, r9
        sub     r9, r10, r9
        mov     r3, r3, lsl #16
        mov     lr, lr, lsl #16
        mov     r9, r9, lsl #16
        mov     r4, r4, lsl #16
        mov     lr, lr, asr #16
        mov     r3, r3, asr #16
        add     r11, lr, r4, asr #16
        strh    r11, [r8]
        add     r10, r3, r9, asr #16
        rsb     r9, r3, r9, asr #16
        strh    r9, [r8, #4]
        rsb     r4, lr, r4, asr #16
        strh    r4, [r8, #6]
        strh    r10, [r8, #2]
        ldrsh   r4, [r7, #2]
        ldrsh   r10, [r7, #6]
        ldrsh   lr, [r7]
        ldrsh   r11, [r7, #4]
        add     r3, sp, #0x9C
        ldr     r3, [r3, #0xC]
        rsb     r9, r10, r4, asr #1
        add     r10, r4, r10, asr #1
        add     r4, lr, r11
        str     r3, [sp, #0x4C]
        sub     lr, lr, r11
        mov     r10, r10, lsl #16
        mov     r4, r4, lsl #16
        mov     r10, r10, asr #16
        add     r11, r10, r4, asr #16
        str     r11, [sp, #0x50]
        mov     r9, r9, lsl #16
        mov     lr, lr, lsl #16
        mov     r9, r9, asr #16
        add     r11, r9, lr, asr #16
        str     r11, [sp, #0x54]
        rsb     lr, r9, lr, asr #16
        ldr     r9, [sp, #0x50]
        rsb     r4, r10, r4, asr #16
        strh    r9, [r7]
        ldr     r9, [sp, #0x54]
        strh    lr, [r7, #4]
        strh    r4, [r7, #6]
        strh    r9, [r7, #2]
        ldrsh   r9, [r2, #2]
        ldrsh   r10, [r2, #6]
        ldrsh   r4, [r2]
        ldrsh   r11, [r2, #4]
        rsb     lr, r10, r9, asr #1
        add     r10, r9, r10, asr #1
        mov     lr, lr, lsl #16
        add     r9, r4, r11
        mov     r10, r10, lsl #16
        sub     r4, r4, r11
        mov     r9, r9, lsl #16
        mov     lr, lr, asr #16
        mov     r4, r4, lsl #16
        mov     r10, r10, asr #16
        add     r11, r10, r9, asr #16
        str     r11, [sp, #0x54]
        add     r11, lr, r4, asr #16
        rsb     r4, lr, r4, asr #16
        ldr     lr, [sp, #0x54]
        str     r11, [sp, #0x50]
        rsb     r9, r10, r9, asr #16
        strh    lr, [r2]
        ldr     lr, [sp, #0x50]
        strh    r4, [r2, #4]
        strh    r9, [r2, #6]
        strh    lr, [r2, #2]
        ldrsh   lr, [r3, #2]
        ldrsh   r4, [r3, #6]
        ldrsh   r9, [r3]
        ldrsh   r10, [r3, #4]
        rsb     r2, r4, lr, asr #1
        add     lr, lr, r4, asr #1
        mov     r4, r2, lsl #16
        add     r2, r9, r10
        sub     r10, r9, r10
        mov     r9, lr, lsl #16
        mov     lr, r2, lsl #16
        mov     r4, r4, asr #16
        mov     r9, r9, asr #16
        mov     r2, r10, lsl #16
        add     r11, r9, lr, asr #16
        strh    r11, [r3]
        add     r10, r4, r2, asr #16
        rsb     r2, r4, r2, asr #16
        strh    r2, [r3, #4]
        strh    r10, [r3, #2]
        rsb     lr, r9, lr, asr #16
        strh    lr, [r3, #6]
        ldr     r2, [sp, #0x44]
        ldrsh   r3, [r2, #8]
        ldrsh   r4, [r2, #0xA]
        ldrsh   lr, [r2, #0x18]
        str     r4, [sp, #0x54]
        ldrsh   r4, [r2, #0x1A]
        str     r4, [sp, #0x50]
        ldrsh   r9, [r2, #0x1C]
        ldrsh   r4, [r2, #0xC]
        str     r9, [sp, #0x58]
        ldrsh   r10, [r2, #0x1E]
        ldrsh   r9, [r2, #0xE]
        ldrsh   r11, [r2]
        str     r11, [sp, #0x5C]
        ldrsh   r11, [r2, #0x10]
        str     r11, [sp, #0x60]
        ldrsh   r11, [r2, #2]
        str     r11, [sp, #0x64]
        ldrsh   r11, [r2, #0x12]
        str     r11, [sp, #0x68]
        ldrsh   r11, [r2, #4]
        str     r11, [sp, #0x6C]
        ldrsh   r11, [r2, #0x14]
        str     r11, [sp, #0x70]
        ldrsh   r11, [r2, #6]
        str     r11, [sp, #0x74]
        ldrsh   r11, [r2, #0x16]
        str     r11, [sp, #0x78]
        rsb     r11, lr, r3, asr #1
        str     r11, [sp, #0x7C]
        add     lr, r3, lr, asr #1
        ldr     r11, [sp, #0x6C]
        str     lr, [sp, #0x80]
        ldr     lr, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        rsb     lr, r3, lr, asr #1
        ldr     r3, [sp, #0x54]
        str     lr, [sp, #0x84]
        ldr     lr, [sp, #0x50]
        add     lr, r3, lr, asr #1
        ldr     r3, [sp, #0x58]
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x60]
        rsb     r3, r3, r4, asr #1
        str     r3, [sp, #0x50]
        ldr     r3, [sp, #0x58]
        add     r3, r4, r3, asr #1
        str     r3, [sp, #0x58]
        ldr     r4, [sp, #0x5C]
        rsb     r3, r10, r9, asr #1
        str     r3, [sp, #0x88]
        add     r3, r4, lr
        sub     r4, r4, lr
        ldr     lr, [sp, #0x7C]
        str     r4, [sp, #0x60]
        ldr     r4, [sp, #0x68]
        mov     lr, lr, lsl #16
        str     lr, [sp, #0x7C]
        ldr     lr, [sp, #0x80]
        add     r10, r9, r10, asr #1
        ldr     r9, [sp, #0x64]
        mov     lr, lr, lsl #16
        str     lr, [sp, #0x80]
        mov     r3, r3, lsl #16
        add     lr, r9, r4
        sub     r9, r9, r4
        ldr     r4, [sp, #0x84]
        str     r9, [sp, #0x68]
        ldr     r9, [sp, #0x70]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x84]
        ldr     r4, [sp, #0x54]
        mov     r10, r10, lsl #16
        mov     lr, lr, lsl #16
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x64]
        add     r4, r11, r9
        str     r4, [sp, #0x5C]
        ldr     r4, [sp, #0x50]
        sub     r11, r11, r9
        ldr     r9, [sp, #0x78]
        str     r11, [sp, #0x70]
        ldr     r11, [sp, #0x74]
        str     r10, [sp, #0x74]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x6C]
        ldr     r4, [sp, #0x58]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x58]
        add     r4, r11, r9
        str     r4, [sp, #0x54]
        ldr     r4, [sp, #0x88]
        sub     r11, r11, r9
        ldr     r9, [sp, #0x54]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x88]
        ldr     r4, [sp, #0x60]
        str     r11, [sp, #0x78]
        mov     r9, r9, lsl #16
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x60]
        ldr     r4, [sp, #0x7C]
        ldr     r11, [sp, #0x60]
        mov     r4, r4, asr #16
        str     r4, [sp, #0x7C]
        ldr     r4, [sp, #0x80]
        mov     r4, r4, asr #16
        str     r4, [sp, #0x80]
        ldr     r4, [sp, #0x68]
        ldr     r10, [sp, #0x80]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x68]
        ldr     r4, [sp, #0x84]
        add     r10, r10, r3, asr #16
        mov     r4, r4, asr #16
        str     r4, [sp, #0x84]
        ldr     r4, [sp, #0x64]
        mov     r4, r4, asr #16
        str     r4, [sp, #0x64]
        ldr     r4, [sp, #0x5C]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x5C]
        ldr     r4, [sp, #0x70]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x70]
        ldr     r4, [sp, #0x6C]
        mov     r4, r4, asr #16
        str     r4, [sp, #0x6C]
        ldr     r4, [sp, #0x58]
        str     r9, [sp, #0x58]
        ldr     r9, [sp, #0x78]
        mov     r4, r4, asr #16
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x78]
        ldr     r9, [sp, #0x88]
        mov     r9, r9, asr #16
        str     r9, [sp, #0x88]
        ldr     r9, [sp, #0x74]
        str     r10, [sp, #0x74]
        ldr     r10, [sp, #0x7C]
        mov     r9, r9, asr #16
        add     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x7C]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x60]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x80]
        str     r11, [sp, #0x7C]
        rsb     r3, r10, r3, asr #16
        str     r3, [sp, #0x80]
        ldr     r3, [sp, #0x64]
        ldr     r10, [sp, #0x68]
        add     r3, r3, lr, asr #16
        str     r3, [sp, #0x60]
        ldr     r3, [sp, #0x84]
        add     r10, r3, r10, asr #16
        ldr     r3, [sp, #0x84]
        str     r10, [sp, #0x50]
        ldr     r10, [sp, #0x68]
        ldr     r11, [sp, #0x50]
        rsb     r10, r3, r10, asr #16
        ldr     r3, [sp, #0x64]
        str     r10, [sp, #0x84]
        add     r11, r11, #0x20
        rsb     lr, r3, lr, asr #16
        ldr     r3, [sp, #0x5C]
        str     lr, [sp, #0x68]
        ldr     lr, [sp, #0x70]
        add     r3, r4, r3, asr #16
        str     r3, [sp, #0x64]
        ldr     r3, [sp, #0x6C]
        add     lr, r3, lr, asr #16
        ldr     r3, [sp, #0x6C]
        str     lr, [sp, #0x8C]
        ldr     lr, [sp, #0x70]
        rsb     lr, r3, lr, asr #16
        ldr     r3, [sp, #0x5C]
        str     lr, [sp, #0x70]
        ldr     lr, [sp, #0x78]
        rsb     r3, r4, r3, asr #16
        ldr     r4, [sp, #0x7C]
        str     r3, [sp, #0x6C]
        ldr     r3, [sp, #0x58]
        add     r4, r4, #0x20
        str     r4, [sp, #0x7C]
        ldr     r4, [sp, #0x80]
        add     r3, r9, r3, asr #16
        str     r3, [sp, #0x5C]
        ldr     r3, [sp, #0x88]
        str     r11, [sp, #0x80]
        ldr     r11, [sp, #0x84]
        add     lr, r3, lr, asr #16
        str     lr, [sp, #0x90]
        ldr     r3, [sp, #0x88]
        ldr     lr, [sp, #0x78]
        add     r4, r4, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x84]
        ldr     r11, [sp, #0x68]
        rsb     lr, r3, lr, asr #16
        ldr     r3, [sp, #0x58]
        str     lr, [sp, #0x88]
        ldr     lr, [sp, #0x54]
        add     r11, r11, #0x20
        str     r11, [sp, #0x78]
        ldr     r11, [sp, #0x64]
        rsb     r10, r9, r3, asr #16
        ldr     r3, [sp, #0x74]
        ldr     r9, [sp, #0x60]
        add     r11, r11, #0x20
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0x8C]
        add     r3, r3, #0x20
        add     lr, lr, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x70]
        mov     r3, r3, asr #6
        str     r3, [sp, #0x60]
        ldr     r3, [sp, #0x7C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x70]
        ldr     r11, [sp, #0x6C]
        mov     r3, r3, asr #6
        str     r3, [sp, #0x7C]
        ldr     r3, [sp, #0x80]
        add     r11, r11, #0x20
        str     r11, [sp, #0x6C]
        ldr     r11, [sp, #0x5C]
        mov     r4, r4, asr #6
        str     r4, [sp, #0x58]
        ldr     r4, [sp, #0x6C]
        mov     r3, r3, asr #6
        str     r3, [sp, #0x80]
        ldr     r3, [sp, #0x84]
        mov     lr, lr, asr #6
        str     lr, [sp, #0x5C]
        ldr     lr, [sp, #0x74]
        mov     r3, r3, asr #6
        str     r3, [sp, #0x84]
        ldr     r3, [sp, #0x78]
        add     r11, r11, #0x20
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x90]
        mov     lr, lr, asr #6
        str     lr, [sp, #0x78]
        ldr     lr, [sp, #0x8C]
        add     r11, r11, #0x20
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x88]
        mov     r4, r4, asr #6
        str     r4, [sp, #0x74]
        mov     lr, lr, asr #6
        ldr     r4, [sp, #0x68]
        str     lr, [sp, #0x8C]
        ldr     lr, [sp, #0x70]
        add     r9, r9, #0x20
        add     r11, r11, #0x20
        str     r11, [sp, #0x88]
        add     r10, r10, #0x20
        mov     r9, r9, asr #6
        mov     r4, r4, asr #6
        str     r10, [sp, #0x64]
        ldr     r11, [sp, #0x60]
        str     r9, [sp, #0x54]
        str     r4, [sp, #0x70]
        ldr     r4, [sp, #0x90]
        ldr     r9, [sp, #0x88]
        ldr     r10, [sp, #0x64]
        strh    r11, [r2]
        ldr     r11, [sp, #0x5C]
        mov     r3, r3, asr #6
        mov     lr, lr, asr #6
        mov     r4, r4, asr #6
        strh    r11, [r2, #8]
        ldr     r11, [sp, #0x7C]
        mov     r9, r9, asr #6
        mov     r10, r10, asr #6
        strh    r11, [r2, #0x10]
        ldr     r11, [sp, #0x58]
        strh    r11, [r2, #0x18]
        ldr     r11, [sp, #0x54]
        strh    r11, [r2, #2]
        ldr     r11, [sp, #0x80]
        strh    r11, [r2, #0xA]
        ldr     r11, [sp, #0x84]
        strh    r3, [r2, #0x1A]
        strh    r11, [r2, #0x12]
        ldr     r3, [sp, #0x78]
        strh    r3, [r2, #4]
        ldr     r3, [sp, #0x8C]
        strh    lr, [r2, #0x14]
        strh    r3, [r2, #0xC]
        ldr     r3, [sp, #0x74]
        strh    r3, [r2, #0x1C]
        ldr     r3, [sp, #0x70]
        strh    r4, [r2, #0xE]
        strh    r9, [r2, #0x16]
        strh    r3, [r2, #6]
        strh    r10, [r2, #0x1E]
LKWM15:
        ldrsh   r2, [r8]
        ldrb    lr, [r1, #1]
        ldrb    r4, [r1, #2]
        ldrb    r3, [r1]
        ldrb    r9, [r1, #3]
        cmp     r2, r12
        mov     r10, r12
        movgt   r10, r2
        mov     r2, #1, 24
        cmp     r10, #1, 24
        movgt   r10, r2
        add     r10, r5, r10
        add     r3, r10, r3
        ldrb    r3, [r3, #0x100]
        add     r9, r5, r9
        str     r9, [sp, #0x90]
        strb    r3, [r1]
        ldrsh   r10, [r8, #2]
        add     r3, r1, r6
        mov     r11, r12
        cmp     r10, r12
        movgt   r11, r10
        cmp     r11, #1, 24
        add     r9, r5, r4
        movgt   r11, r2
        add     r4, r5, lr
        add     lr, r6, r3
        add     r11, r4, r11
        ldrb    r10, [r11, #0x100]
        mov     r11, r12
        add     r4, r6, lr
        strb    r10, [r1, #1]
        ldrsh   r10, [r8, #4]
        cmp     r10, r12
        movgt   r11, r10
        cmp     r11, #1, 24
        movgt   r11, r2
        add     r11, r9, r11
        ldrb    r9, [r11, #0x100]
        mov     r10, r12
        strb    r9, [r1, #2]
        ldrsh   r9, [r8, #6]
        mov     r8, r12
        cmp     r9, r12
        movgt   r8, r9
        ldr     r9, [sp, #0x90]
        cmp     r8, #1, 24
        movgt   r8, r2
        add     r8, r9, r8
        ldrb    r8, [r8, #0x100]
        strb    r8, [r1, #3]
        ldrsh   r11, [r7]
        ldrb    r8, [r6, +r1]
        ldrb    r9, [r3, #1]
        cmp     r11, r12
        movgt   r10, r11
        str     r9, [sp, #0x90]
        ldrb    r9, [r3, #2]
        ldrb    r11, [r3, #3]
        cmp     r10, #1, 24
        movgt   r10, r2
        add     r10, r5, r10
        add     r8, r10, r8
        ldrb    r8, [r8, #0x100]
        mov     r10, r12
        strb    r8, [r6, +r1]
        ldrsh   r8, [r7, #2]
        cmp     r8, r12
        movgt   r10, r8
        cmp     r10, #1, 24
        movgt   r10, r2
        add     r8, r5, r10
        ldr     r10, [sp, #0x90]
        add     r10, r8, r10
        ldrb    r8, [r10, #0x100]
        mov     r10, r12
        strb    r8, [r3, #1]
        ldrsh   r8, [r7, #4]
        cmp     r8, r12
        movgt   r10, r8
        cmp     r10, #1, 24
        movgt   r10, r2
        add     r10, r5, r10
        add     r9, r10, r9
        ldrb    r8, [r9, #0x100]
        strb    r8, [r3, #2]
        ldrsh   r7, [r7, #6]
        mov     r8, r12
        cmp     r7, r12
        movgt   r8, r7
        cmp     r8, #1, 24
        movgt   r8, r2
        add     r8, r5, r8
        add     r11, r8, r11
        ldrb    r7, [r11, #0x100]
        mov     r11, r12
        strb    r7, [r3, #3]
        ldr     r9, [sp, #0x48]
        ldrb    r7, [r3, +r6]
        ldrsh   r10, [r9]
        cmp     r10, r12
        movgt   r11, r10
        cmp     r11, #1, 24
        movgt   r11, r2
        str     r7, [sp, #0x90]
        ldrb    r7, [lr, #1]
        ldrb    r8, [lr, #2]
        add     r10, r5, r11
        ldr     r11, [sp, #0x90]
        add     r11, r10, r11
        ldrb    r11, [r11, #0x100]
        ldrb    r10, [lr, #3]
        strb    r11, [r3, +r6]
        ldrsh   r3, [r9, #2]
        mov     r11, r12
        cmp     r3, r12
        movgt   r11, r3
        cmp     r11, #1, 24
        movgt   r11, r2
        add     r11, r5, r11
        add     r7, r11, r7
        ldrb    r3, [r7, #0x100]
        mov     r7, r12
        mov     r11, r12
        strb    r3, [lr, #1]
        ldrsh   r3, [r9, #4]
        cmp     r3, r12
        movgt   r7, r3
        cmp     r7, #1, 24
        movgt   r7, r2
        add     r7, r5, r7
        add     r8, r7, r8
        ldrb    r3, [r8, #0x100]
        strb    r3, [lr, #2]
        ldrsh   r9, [r9, #6]
        mov     r3, r12
        cmp     r9, r12
        movgt   r3, r9
        cmp     r3, #1, 24
        movgt   r3, r2
        add     r3, r5, r3
        add     r10, r3, r10
        ldrb    r3, [r10, #0x100]
        strb    r3, [lr, #3]
        ldr     r8, [sp, #0x4C]
        ldrb    r9, [lr, +r6]
        ldrb    r3, [r4, #1]
        ldrsh   r10, [r8]
        ldrb    r7, [r4, #2]
        cmp     r10, r12
        movgt   r11, r10
        cmp     r11, #1, 24
        movgt   r11, r2
        add     r11, r5, r11
        add     r9, r11, r9
        ldrb    r10, [r9, #0x100]
        ldrb    r9, [r4, #3]
        strb    r10, [lr, +r6]
        ldrsh   lr, [r8, #2]
        mov     r10, r12
        cmp     lr, r12
        movgt   r10, lr
        cmp     r10, #1, 24
        movgt   r10, r2
        add     r10, r5, r10
        add     r3, r10, r3
        ldrb    r3, [r3, #0x100]
        mov     lr, r12
        strb    r3, [r4, #1]
        ldrsh   r3, [r8, #4]
        cmp     r3, r12
        movgt   lr, r3
        cmp     lr, #1, 24
        movgt   lr, r2
        add     lr, r5, lr
        add     r7, lr, r7
        ldrb    r3, [r7, #0x100]
        strb    r3, [r4, #2]
        ldrsh   r8, [r8, #6]
        mov     r3, r12
        cmp     r8, r12
        movgt   r3, r8
        cmp     r3, #1, 24
        movgt   r3, r2
        add     r3, r5, r3
        add     r9, r3, r9
        ldrb    r2, [r9, #0x100]
        strb    r2, [r4, #3]
        b       LKWM18
        .long   LKWM_zeroArray
        .long   0xaaaaaaab
        .long   ClampTbl
LKWM16:
        ldr     r2, [sp, #0x3C]
        ldrsh   r3, [r2]
        cmp     r3, #0
        beq     LKWM18
        ldr     r2, [sp, #0x38]
        cmp     r2, #0
        beq     LKWM17
        cmp     r0, #0
        ble     LKWM22
LKWM17:
        add     r3, r3, #0x20
        ldrb    r8, [r1]
        mov     r2, r3, asr #6
        ldrb    r3, [r1, #1]
        ldrb    lr, [r1, #2]
        mov     r2, r2, lsl #16
        ldrb    r7, [r1, #3]
        add     r4, r5, r3
        mov     r2, r2, asr #16
        cmp     r2, r12
        mov     r3, r12
        movgt   r3, r2
        cmp     r3, #1, 24
        mov     r2, #1, 24
        movgt   r3, r2
        add     lr, r5, lr
        add     lr, lr, r3
        add     r2, r5, r3
        add     r4, r4, r3
        add     r7, r5, r7
        ldrb    r4, [r4, #0x100]
        ldrb    lr, [lr, #0x100]
        add     r3, r7, r3
        ldrb    r3, [r3, #0x100]
        add     r8, r2, r8
        ldrb    r8, [r8, #0x100]
        strb    r4, [r1, #1]
        strb    r3, [r1, #3]
        strb    lr, [r1, #2]
        strb    r8, [r1]
        add     r3, r1, r6
        ldrb    lr, [r3, #1]
        ldrb    r7, [r3, #2]
        ldrb    r4, [r6, +r1]
        ldrb    r8, [r3, #3]
        add     lr, r2, lr
        ldrb    lr, [lr, #0x100]
        add     r7, r2, r7
        add     r4, r2, r4
        ldrb    r4, [r4, #0x100]
        ldrb    r7, [r7, #0x100]
        add     r8, r2, r8
        ldrb    r8, [r8, #0x100]
        strb    lr, [r3, #1]
        strb    r7, [r3, #2]
        strb    r4, [r6, +r1]
        strb    r8, [r3, #3]
        add     lr, r6, r3
        ldrb    r9, [lr, #3]
        ldrb    r7, [r3, +r6]
        ldrb    r4, [lr, #1]
        ldrb    r8, [lr, #2]
        add     r9, r2, r9
        ldrb    r9, [r9, #0x100]
        add     r7, r2, r7
        ldrb    r7, [r7, #0x100]
        add     r4, r2, r4
        ldrb    r4, [r4, #0x100]
        add     r8, r2, r8
        ldrb    r8, [r8, #0x100]
        strb    r9, [lr, #3]
        strb    r7, [r3, +r6]
        strb    r4, [lr, #1]
        strb    r8, [lr, #2]
        add     r9, r6, lr
        ldrb    r4, [lr, +r6]
        ldrb    r3, [r9, #1]
        ldrb    r7, [r9, #2]
        ldrb    r8, [r9, #3]
        add     r4, r2, r4
        ldrb    r4, [r4, #0x100]
        add     r3, r2, r3
        ldrb    r3, [r3, #0x100]
        add     r7, r2, r7
        ldrb    r7, [r7, #0x100]
        add     r8, r2, r8
        ldrb    r2, [r8, #0x100]
        strb    r4, [lr, +r6]
        strb    r3, [r9, #1]
        strb    r7, [r9, #2]
        strb    r2, [r9, #3]
LKWM18:
        ldr     r2, [sp, #0x40]
        add     r1, r1, #4
        cmp     r2, #1
        addeq   r1, r1, r6, lsl #2
        subeq   r1, r1, #8
        ldr     r2, [sp, #0x40]
        add     r2, r2, #1
        cmp     r2, #4
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x3C]
        add     r2, r2, #2
        str     r2, [sp, #0x3C]
        ldr     r2, [sp, #4]
        mov     r2, r2, lsl #1
        str     r2, [sp, #4]
        bcc     LKWM8
        ldr     r7, [sp]
        ldr     r2, [sp, #0xC]
        ldr     lr, [sp, #0x1C]
        ldr     r5, [sp, #0x14]
        add     r7, r7, #1
        cmp     r7, #2
        mov     r9, #1
        mov     r1, r2
        bcs     LKWM19
        cmp     r7, #0
        movne   r3, lr
        movne   r0, r5
        bne     LKWM7
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LKWM6
LKWM19:
        mov     r0, #0
        add     sp, sp, #0xAC
        ldmia   sp!, {r4 - r11, pc}
LKWM20:
        mvn     r0, #0xA
        add     sp, sp, #0xAC
        ldmia   sp!, {r4 - r11, pc}
LKWM21:
        add     r3, sp, #0x9C
        ldr     r2, [r3, #8]
        ldr     r8, [r3]
        ldr     r7, [r3, #4]
        str     r2, [sp, #0x48]
        ldr     r3, [r3, #0xC]
        str     r3, [sp, #0x4C]
        b       LKWM15
LKWM22:
        cmp     r3, r12
        mov     r2, r12
        movgt   r2, r3
        ldrb    r3, [r1]
        cmp     r2, #1, 24
        mov     lr, #1, 24
        movgt   r2, lr
        add     r2, r5, r2
        add     r3, r2, r3
        ldrb    r2, [r3, #0x100]
        strb    r2, [r1]
        b       LKWM18
LKWM23:
        mvn     r0, #7
        add     sp, sp, #0xAC
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LKWM_zeroArray:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


