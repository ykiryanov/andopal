        .text
        .align  4
        .globl  _ippiTransformQuantFwdLumaDC4x4_H264_16s_C1I


_ippiTransformQuantFwdLumaDC4x4_H264_16s_C1I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r5, [sp, #0x74]
        ldr     r4, [sp, #0x68]
        ldr     r12, [sp, #0x6C]
        ldr     lr, [sp, #0x70]
        cmp     r0, #0
        str     r5, [sp]
        beq     LLBS6
        cmp     r1, #0
        beq     LLBS6
        cmp     r3, #0
        beq     LLBS6
        cmp     r12, #0
        beq     LLBS6
        cmp     lr, #0
        beq     LLBS6
        cmp     r2, #0
        blt     LLBS4
        cmp     r2, #0x33
        bgt     LLBS4
        cmp     r4, #0
        beq     LLBS0
        ldrsh   r8, [r0]
        ldrsh   r4, [r0, #8]
        ldrsh   r7, [r0, #0x10]
        ldrsh   r6, [r0, #0x18]
        add     r5, r8, r4
        sub     r4, r8, r4
        add     r8, r7, r6
        sub     r7, r7, r6
        add     r6, r5, r8
        sub     r8, r5, r8
        sub     r5, r4, r7
        add     r4, r4, r7
        mov     r7, r8, lsl #16
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        mov     r8, r4, lsl #16
        mov     r4, r6, asr #16
        strh    r4, [r1]
        mov     r6, r7, asr #16
        strh    r6, [r1, #8]
        mov     r7, r5, asr #16
        mov     r8, r8, asr #16
        strh    r7, [r1, #0x10]
        strh    r8, [r1, #0x18]
        ldrsh   r5, [r0, #0xA]
        mov     r8, r8, lsl #16
        mov     r4, r4, lsl #16
        mov     r6, r6, lsl #16
        str     r8, [sp, #0x10]
        str     r4, [sp, #4]
        mov     r7, r7, lsl #16
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
        ldrsh   r8, [r0, #2]
        ldrsh   r7, [r0, #0x12]
        ldrsh   r6, [r0, #0x1A]
        add     r4, r8, r5
        sub     r5, r8, r5
        add     r8, r7, r6
        sub     r7, r7, r6
        add     r6, r4, r8
        sub     r8, r4, r8
        sub     r4, r5, r7
        add     r9, r5, r7
        mov     r5, r8, lsl #16
        mov     r7, r4, lsl #16
        mov     r6, r6, lsl #16
        mov     r8, r9, lsl #16
        mov     r4, r5, asr #16
        mov     r5, r7, asr #16
        mov     r8, r8, asr #16
        str     r8, [sp, #0x14]
        strh    r4, [r1, #0xA]
        strh    r5, [r1, #0x12]
        mov     r9, r6, asr #16
        strh    r9, [r1, #2]
        strh    r8, [r1, #0x1A]
        ldrsh   r7, [r0, #0x14]
        ldrsh   r8, [r0, #0x1C]
        ldrsh   r6, [r0, #4]
        ldrsh   r10, [r0, #0xC]
        mov     r9, r9, lsl #16
        str     r9, [sp, #0x18]
        mov     r4, r4, lsl #16
        add     r9, r6, r10
        sub     r6, r6, r10
        add     r10, r7, r8
        sub     r7, r7, r8
        add     r8, r9, r10
        sub     r9, r9, r10
        sub     r10, r6, r7
        add     r7, r6, r7
        mov     r9, r9, lsl #16
        mov     r10, r10, lsl #16
        mov     r7, r7, lsl #16
        mov     r9, r9, asr #16
        mov     r8, r8, lsl #16
        mov     r7, r7, asr #16
        str     r9, [sp, #0x1C]
        mov     r8, r8, asr #16
        str     r7, [sp, #0x20]
        strh    r8, [r1, #4]
        ldr     r9, [sp, #0x1C]
        strh    r7, [r1, #0x1C]
        mov     r6, r10, asr #16
        strh    r9, [r1, #0xC]
        strh    r6, [r1, #0x14]
        ldrsh   r7, [r0, #0xE]
        ldrsh   r10, [r0, #0x16]
        ldrsh   r9, [r0, #6]
        mov     r6, r6, lsl #16
        mov     r8, r8, lsl #16
        str     r10, [sp, #0x24]
        ldrsh   r10, [r0, #0x1E]
        ldr     r11, [sp, #0x24]
        str     r6, [sp, #0x38]
        ldr     r6, [sp, #4]
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x18]
        str     r4, [sp, #0x34]
        ldr     r4, [sp, #0x14]
        str     r8, [sp, #0x14]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x18]
        add     r10, r9, r7
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        sub     r7, r9, r7
        mov     r5, r5, lsl #16
        add     r9, r11, r10
        sub     r11, r11, r10
        ldr     r10, [sp, #0x2C]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #8]
        mov     r5, r5, asr #16
        add     r10, r10, r9
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0x2C]
        sub     r10, r10, r9
        ldr     r9, [sp, #0x28]
        str     r10, [sp, #0x2C]
        sub     r9, r7, r9
        str     r9, [sp, #0x30]
        ldr     r10, [sp, #0x30]
        ldr     r9, [sp, #0x28]
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x30]
        add     r9, r7, r9
        str     r9, [sp, #0x28]
        ldr     r10, [sp, #0x28]
        str     r5, [sp, #0x28]
        ldr     r5, [sp, #0x1C]
        mov     r10, r10, lsl #16
        mov     r7, r4, lsl #16
        ldr     r4, [sp, #0x24]
        mov     r5, r5, lsl #16
        str     r5, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        mov     r9, r4, lsl #16
        ldr     r4, [sp, #0x2C]
        mov     r5, r5, lsl #16
        str     r5, [sp, #0x20]
        ldr     r5, [sp, #0x30]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x34]
        mov     r7, r7, asr #16
        str     r7, [sp, #0x24]
        mov     r10, r10, asr #16
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x34]
        mov     r8, r9, asr #16
        ldr     r9, [sp, #0x14]
        mov     r5, r5, asr #16
        str     r5, [sp, #0x30]
        ldr     r5, [sp, #0x2C]
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        mov     r5, r5, asr #16
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #0x18]
        add     r7, r5, r6, asr #16
        rsb     r5, r5, r6, asr #16
        add     r6, r8, r9, asr #16
        rsb     r8, r8, r9, asr #16
        add     r9, r10, r11, asr #16
        str     r9, [sp, #0x18]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x1C]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0xC]
        add     r9, r4, r10, asr #16
        rsb     r10, r4, r10, asr #16
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x28]
        add     r4, r10, r11, asr #16
        str     r4, [sp, #0x14]
        ldr     r4, [sp, #0x30]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x38]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x10]
        add     r10, r4, r10, asr #16
        ldr     r4, [sp, #0x30]
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x38]
        rsb     r10, r4, r10, asr #16
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x24]
        add     r4, r10, r11, asr #16
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x2C]
        rsb     r11, r10, r11, asr #16
        ldr     r10, [sp, #0x20]
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x30]
        add     r10, r4, r10, asr #16
        ldr     r4, [sp, #0x2C]
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x20]
        rsb     r10, r4, r10, asr #16
        str     r10, [sp, #0x2C]
        add     r4, r7, r6
        str     r4, [sp, #0x20]
        sub     r4, r5, r8
        add     r8, r5, r8
        ldr     r5, [sp, #0x18]
        str     r4, [sp, #4]
        ldr     r10, [sp, #0x28]
        add     r4, r5, r9
        str     r8, [sp, #0x3C]
        str     r4, [sp, #0x40]
        sub     r7, r7, r6
        ldr     r6, [sp, #0x1C]
        sub     r4, r5, r9
        ldr     r5, [sp, #0x34]
        str     r7, [sp, #8]
        ldr     r7, [sp, #0x14]
        mov     r4, r4, asr #1
        sub     r8, r5, r6
        add     r5, r5, r6
        ldr     r6, [sp, #0xC]
        str     r4, [sp, #0x14]
        mov     r8, r8, asr #1
        mov     r5, r5, asr #1
        add     r9, r7, r6
        sub     r6, r7, r6
        ldr     r7, [sp, #0x38]
        str     r5, [sp, #0xC]
        mov     r9, r9, asr #1
        mov     r4, r6, asr #1
        sub     r10, r10, r7
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x28]
        ldr     r5, [sp, #0x34]
        add     r10, r7, r10
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x10]
        ldr     r6, [sp, #0x38]
        str     r8, [sp, #0x10]
        add     r7, r11, r10
        str     r7, [sp, #0x28]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x2C]
        ldr     r7, [sp, #0x24]
        str     r11, [sp, #0x30]
        ldr     r8, [sp, #0x30]
        mov     r5, r5, asr #1
        sub     r10, r7, r10
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x2C]
        mov     r6, r6, asr #1
        mov     r8, r8, asr #1
        add     r10, r7, r10
        ldr     r7, [sp, #0x20]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x2C]
        mov     r7, r7, asr #1
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #8]
        ldr     r11, [sp, #0x24]
        str     r9, [sp, #8]
        mov     r7, r7, asr #1
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #4]
        ldr     r9, [sp, #0x1C]
        mov     r10, r10, asr #1
        mov     r7, r7, asr #1
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0x3C]
        mov     r9, r9, asr #1
        mov     r7, r7, asr #1
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x40]
        mov     r7, r7, asr #1
        str     r7, [sp, #0x40]
        ldr     r7, [sp, #0x28]
        strh    r11, [r1]
        ldr     r11, [sp, #0x20]
        mov     r7, r7, asr #1
        strh    r11, [r1, #2]
        ldr     r11, [sp, #0x18]
        strh    r11, [r1, #4]
        ldr     r11, [sp, #0x3C]
        strh    r11, [r1, #6]
        ldr     r11, [sp, #0x40]
        strh    r11, [r1, #8]
        ldr     r11, [sp, #0x14]
        strh    r11, [r1, #0xA]
        ldr     r11, [sp, #0x10]
        strh    r11, [r1, #0xC]
        ldr     r11, [sp, #0xC]
        strh    r11, [r1, #0xE]
        ldr     r11, [sp, #8]
        strh    r4, [r1, #0x12]
        strh    r5, [r1, #0x14]
        strh    r11, [r1, #0x10]
        strh    r6, [r1, #0x16]
        strh    r7, [r1, #0x18]
        strh    r8, [r1, #0x1A]
        strh    r9, [r1, #0x1C]
        strh    r10, [r1, #0x1E]
LLBS0:
        ldr     r6, [pc, #0xE4]
        ldr     r4, [pc, #0xE4]
        ldr     r5, [sp]
        ldrb    r6, [r2, +r6]
        ldrb    r4, [r2, +r4]
        cmp     r5, #0
        beq     LLBS5
        ldr     r2, [sp]
        add     r5, r6, #1
        ldrsh   r4, [r2]
        mov     r2, #0xAA
        orr     r2, r2, #2, 24
        mov     r5, r2, lsl r5
        add     r2, r6, #0xC
LLBS1:
        mov     r11, #0
        mov     r8, r1
        mov     r10, r11
        mov     r9, #0x10
LLBS2:
        ldrsh   r6, [r8], #2
        cmp     r6, #0
        mvnlt   r7, #0
        movge   r7, #1
        mul     r6, r4, r6
        mla     r6, r6, r7, r5
        movs    r6, r6, asr r2
        mul     r7, r7, r6
        strh    r7, [r0], #2
        beq     LLBS3
        ldrsh   r6, [r12]
        add     r11, r11, #1
        cmp     r10, r6
        movlt   r10, r6
LLBS3:
        subs    r9, r9, #1
        add     r12, r12, #2
        bne     LLBS2
        str     r10, [lr]
        ldrsh   r1, [r1]
        cmp     r1, #0
        rsbne   r11, r11, #0
        mov     r0, #0
        str     r11, [r3]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LLBS4:
        mvn     r0, #0xA
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LLBS5:
        ldr     r7, [pc, #0x34]
        mov     r5, #1
        add     r2, r6, #0x10
        mov     r5, r5, lsl r2
        smull   r6, r7, r5, r7
        ldr     r6, [pc, #0x24]
        mov     r4, r4, lsl #5
        sub     r5, r7, r5, asr #31
        ldrsh   r4, [r6, +r4]
        b       LLBS1
LLBS6:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBS_h264_qp6
        .long   LLBS_h264_qp_rem
        .long   0x55555556
        .long   LLBS_FwdQuantTable_16s


        .data
        .align  4


LLBS_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBS_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBS_FwdQuantTable_16s:
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


