        .text
        .align  4
        .globl  _ippiTransformQuantFwdLumaDC4x4_H264_32s_C1I


_ippiTransformQuantFwdLumaDC4x4_H264_32s_C1I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r4, [sp, #0x80]
        ldr     lr, [sp, #0x74]
        ldr     r7, [sp, #0x78]
        ldr     r12, [sp, #0x7C]
        mov     r5, r0
        cmp     r5, #0
        str     r4, [sp, #0xC]
        beq     LLBR6
        cmp     r1, #0
        beq     LLBR6
        cmp     r3, #0
        beq     LLBR6
        cmp     r7, #0
        beq     LLBR6
        cmp     r12, #0
        beq     LLBR6
        cmp     r2, #0
        blt     LLBR4
        cmp     r2, #0x57
        bgt     LLBR4
        cmp     lr, #0
        beq     LLBR0
        ldr     r9, [r5]
        ldr     r6, [r5, #0x10]
        ldr     r8, [r5, #0x20]
        ldr     lr, [r5, #0x30]
        add     r4, r9, r6
        sub     r6, r9, r6
        add     r9, r8, lr
        sub     r8, r8, lr
        add     lr, r4, r9
        sub     r4, r4, r9
        str     r4, [sp, #8]
        str     r4, [r1, #0x10]
        sub     r4, r6, r8
        str     lr, [r1]
        add     r8, r6, r8
        str     r8, [sp, #4]
        str     r8, [r1, #0x30]
        str     r4, [r1, #0x20]
        ldr     r9, [r5, #0x14]
        ldr     r10, [r5, #4]
        ldr     r6, [r5, #0x24]
        ldr     r11, [r5, #0x34]
        add     r8, r10, r9
        sub     r9, r10, r9
        add     r10, r6, r11
        sub     r11, r6, r11
        add     r6, r8, r10
        sub     r8, r8, r10
        sub     r10, r9, r11
        str     r10, [sp]
        add     r11, r9, r11
        str     r11, [sp, #0x1C]
        str     r6, [r1, #4]
        str     r8, [r1, #0x14]
        ldr     r9, [sp]
        str     r11, [r1, #0x34]
        str     r9, [r1, #0x24]
        ldr     r10, [r5, #8]
        ldr     r11, [r5, #0x28]
        ldr     r9, [r5, #0x18]
        str     r11, [sp, #0x20]
        ldr     r11, [r5, #0x38]
        str     r11, [sp, #0x24]
        add     r11, lr, r6
        str     r11, [sp, #0x28]
        add     r11, r10, r9
        sub     r10, r10, r9
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x20]
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x24]
        sub     lr, lr, r6
        add     r9, r11, r10
        sub     r11, r11, r10
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r10, r11, r9
        str     r10, [sp, #0x20]
        sub     r9, r11, r9
        ldr     r11, [sp, #0x30]
        sub     r10, r11, r0
        add     r11, r11, r0
        ldr     r0, [sp, #0x20]
        str     r11, [sp, #0x30]
        str     r10, [r1, #0x28]
        str     r11, [r1, #0x38]
        str     r9, [r1, #0x18]
        str     r0, [r1, #8]
        ldr     r11, [r5, #0x1C]
        str     r11, [sp, #0x2C]
        ldr     r11, [r5, #0xC]
        str     r11, [sp, #0x24]
        ldr     r11, [r5, #0x2C]
        str     r11, [sp, #0x34]
        ldr     r11, [r5, #0x3C]
        str     lr, [sp, #0x3C]
        ldr     lr, [sp, #0x2C]
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x24]
        ldr     r0, [sp, #0x34]
        add     r6, r11, lr
        sub     r11, r11, lr
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x38]
        add     lr, r0, r11
        sub     r0, r0, r11
        add     r11, r6, lr
        str     r0, [sp, #0x38]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x2C]
        ldr     r0, [sp, #0x38]
        sub     lr, r6, lr
        sub     r6, r11, r0
        add     r0, r11, r0
        str     r0, [sp, #0x38]
        ldr     r11, [sp, #0x20]
        ldr     r0, [sp, #0x34]
        add     r0, r11, r0
        ldr     r11, [sp, #0x34]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x20]
        sub     r0, r0, r11
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #8]
        add     r11, r0, r8
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x2C]
        sub     r0, r0, r8
        add     r8, r9, lr
        sub     r9, r9, lr
        ldr     lr, [sp]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        str     r8, [sp, #8]
        add     lr, r4, lr
        str     r9, [sp, #0x40]
        str     lr, [sp, #0x44]
        ldr     lr, [sp]
        sub     r4, r4, lr
        add     lr, r10, r6
        str     lr, [sp, #0x48]
        ldr     lr, [sp, #0x1C]
        str     r4, [sp]
        ldr     r4, [sp, #4]
        sub     r10, r10, r6
        ldr     r6, [sp, #0x30]
        add     r9, r4, lr
        sub     r4, r4, lr
        ldr     lr, [sp, #0x38]
        add     r8, r6, lr
        sub     r6, r6, lr
        add     lr, r0, r11
        sub     r0, r0, r11
        ldr     r11, [sp, #0x3C]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        str     lr, [sp, #0x38]
        sub     lr, r11, r0
        str     lr, [sp, #0x2C]
        add     r0, r11, r0
        ldr     lr, [sp, #0x24]
        ldr     r11, [sp, #8]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x20]
        add     r11, lr, r11
        ldr     lr, [sp, #8]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x24]
        sub     lr, r11, lr
        ldr     r11, [sp, #0x40]
        mov     lr, lr, asr #1
        str     lr, [sp, #0x4C]
        sub     r0, r0, r11
        ldr     r11, [sp, #0x20]
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x40]
        ldr     lr, [sp, #0x28]
        add     r0, r11, r0
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x48]
        ldr     r11, [sp, #0x44]
        mov     lr, lr, asr #1
        add     r0, r11, r0
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        sub     r0, r0, r11
        ldr     r11, [sp]
        str     r0, [sp, #0x48]
        sub     r11, r11, r10
        str     r11, [sp, #0x44]
        ldr     r11, [sp]
        add     r10, r11, r10
        str     r10, [sp, #0x20]
        add     r10, r9, r8
        sub     r9, r9, r8
        sub     r8, r4, r6
        add     r6, r4, r6
        ldr     r4, [sp, #0x38]
        str     r10, [sp, #0x1C]
        str     r9, [sp, #8]
        mov     r4, r4, asr #1
        str     r4, [sp, #0x38]
        ldr     r4, [sp, #0x30]
        ldr     r9, [sp, #0x44]
        ldr     r0, [sp, #0x38]
        mov     r4, r4, asr #1
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x2C]
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x48]
        mov     r4, r4, asr #1
        str     r4, [sp, #0x2C]
        ldr     r4, [sp, #0x3C]
        mov     r9, r9, asr #1
        str     r9, [sp, #0x48]
        mov     r4, r4, asr #1
        ldr     r9, [sp, #0x20]
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x34]
        mov     r9, r9, asr #1
        str     r9, [sp, #0x44]
        mov     r4, r4, asr #1
        ldr     r9, [sp, #0x1C]
        str     r4, [sp, #0x34]
        ldr     r4, [sp, #0x40]
        str     r6, [sp]
        ldr     r6, [sp, #0x24]
        mov     r9, r9, asr #1
        str     r9, [sp, #0x40]
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp]
        str     r0, [r1]
        ldr     r0, [sp, #0x30]
        mov     r4, r4, asr #1
        mov     r6, r6, asr #1
        mov     r8, r8, asr #1
        str     r0, [r1, #4]
        ldr     r0, [sp, #0x2C]
        mov     r9, r9, asr #1
        mov     r10, r10, asr #1
        str     r0, [r1, #8]
        ldr     r0, [sp, #0x3C]
        mov     r11, r11, asr #1
        str     r0, [r1, #0xC]
        ldr     r0, [sp, #0x34]
        str     r0, [r1, #0x10]
        ldr     r0, [sp, #0x4C]
        str     lr, [r1, #0x18]
        str     r4, [r1, #0x1C]
        str     r0, [r1, #0x14]
        str     r6, [r1, #0x20]
        str     r8, [r1, #0x24]
        ldr     lr, [sp, #0x48]
        str     lr, [r1, #0x28]
        ldr     lr, [sp, #0x44]
        str     lr, [r1, #0x2C]
        ldr     lr, [sp, #0x40]
        str     r9, [r1, #0x34]
        str     r10, [r1, #0x38]
        str     lr, [r1, #0x30]
        str     r11, [r1, #0x3C]
LLBR0:
        ldr     r4, [sp, #0xC]
        ldr     r6, [pc, #0x140]
        ldr     lr, [pc, #0x140]
        cmp     r4, #0
        ldrb    r4, [r2, +r6]
        ldrb    r2, [r2, +lr]
        beq     LLBR5
        ldr     r2, [sp, #0xC]
        add     lr, r4, #1
        add     r4, r4, #0xC
        ldrsh   r11, [r2]
        mov     r2, #0xAA
        orr     r2, r2, #2, 24
        mov     lr, r2, lsl lr
LLBR1:
        mov     r0, #0
        mov     r2, r0
        mov     r10, lr, asr #31
        mov     r6, r4, asr #31
        mov     r8, r1
        mov     r9, #0x10
        str     r11, [sp, #4]
        str     r2, [sp, #0xC]
        str     r0, [sp, #8]
        str     lr, [sp]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0x18]
LLBR2:
        ldr     r1, [r8], #4
        cmp     r1, #0
        mvnlt   r11, #0
        movge   r11, #1
        mul     r1, r11, r1
        ldr     r12, [sp, #4]
        ldr     lr, [sp]
        mov     r2, r4
        smull   r12, r1, r12, r1
        mov     r3, r6
        adds    r0, lr, r12
        adc     r1, r10, r1
        bl      __ashrdi3
        mul     r11, r11, r0
        cmp     r0, #0
        str     r11, [r5], #4
        beq     LLBR3
        ldr     r12, [sp, #8]
        ldrsh   r1, [r7]
        add     r12, r12, #1
        str     r12, [sp, #8]
        ldr     r12, [sp, #0xC]
        cmp     r12, r1
        strlt   r1, [sp, #0xC]
LLBR3:
        subs    r9, r9, #1
        add     r7, r7, #2
        bne     LLBR2
        ldr     r2, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x14]
        str     r2, [r12]
        ldr     r1, [r1]
        cmp     r1, #0
        rsbne   r0, r0, #0
        str     r0, [r3]
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBR4:
        mvn     r0, #0xA
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLBR5:
        ldr     r6, [pc, #0x34]
        mov     lr, #1
        add     r4, r4, #0x10
        mov     lr, lr, lsl r4
        smull   r6, r8, lr, r6
        ldr     r6, [pc, #0x24]
        mov     r2, r2, lsl #5
        sub     lr, r8, lr, asr #31
        ldrsh   r11, [r6, +r2]
        b       LLBR1
LLBR6:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBR_h264_qp6
        .long   LLBR_h264_qp_rem
        .long   0x55555556
        .long   LLBR_FwdQuantTable_16s


        .data
        .align  4


LLBR_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBR_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBR_FwdQuantTable_16s:
        .byte   0x33,0x33,0x82,0x1F,0x33,0x33,0x82,0x1F,0x82,0x1F,0x7B,0x14,0x82,0x1F,0x7B,0x14
        .byte   0x33,0x33,0x82,0x1F,0x33,0x33,0x82,0x1F,0x82,0x1F,0x7B,0x14,0x82,0x1F,0x7B,0x14
        .byte   0x8C,0x2E,0x42,0x1D,0x8C,0x2E,0x42,0x1D,0x42,0x1D,0x34,0x12,0x42,0x1D,0x34,0x12
        .byte   0x8C,0x2E,0x42,0x1D,0x8C,0x2E,0x42,0x1D,0x42,0x1D,0x34,0x12,0x42,0x1D,0x34,0x12
        .byte   0x62,0x27,0x9A,0x19,0x62,0x27,0x9A,0x19,0x9A,0x19,0x62,0x10,0x9A,0x19,0x62,0x10
        .byte   0x62,0x27,0x9A,0x19,0x62,0x27,0x9A,0x19,0x9A,0x19,0x62,0x10,0x9A,0x19,0x62,0x10
        .byte   0x92,0x24,0xC1,0x16,0x92,0x24,0xC1,0x16,0xC1,0x16,0x3F,0x0E,0xC1,0x16,0x3F,0x0E
        .byte   0x92,0x24,0xC1,0x16,0x92,0x24,0xC1,0x16,0xC1,0x16,0x3F,0x0E,0xC1,0x16,0x3F,0x0E
        .byte   0x00,0x20,0x7B,0x14,0x00,0x20,0x7B,0x14,0x7B,0x14,0x1B,0x0D,0x7B,0x14,0x1B,0x0D
        .byte   0x00,0x20,0x7B,0x14,0x00,0x20,0x7B,0x14,0x7B,0x14,0x1B,0x0D,0x7B,0x14,0x1B,0x0D
        .byte   0x72,0x1C,0xCF,0x11,0x72,0x1C,0xCF,0x11,0xCF,0x11,0x4D,0x0B,0xCF,0x11,0x4D,0x0B
        .byte   0x72,0x1C,0xCF,0x11,0x72,0x1C,0xCF,0x11,0xCF,0x11,0x4D,0x0B,0xCF,0x11,0x4D,0x0B


