        .text
        .align  4
        .globl  ippiTransformQuantFwd4x4_H264_16s32s_C1


ippiTransformQuantFwd4x4_H264_16s32s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     r12, [sp, #0x84]
        ldr     r4, [sp, #0x90]
        ldr     lr, [sp, #0x8C]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x88]
        cmp     r0, #0
        str     r4, [sp, #0xC]
        beq     LLBY8
        cmp     r1, #0
        beq     LLBY8
        cmp     r3, #0
        beq     LLBY8
        cmp     r12, #0
        beq     LLBY8
        cmp     lr, #0
        beq     LLBY8
        cmp     r2, #0
        blt     LLBY5
        cmp     r2, #0x57
        bgt     LLBY5
        add     r4, sp, #0x40
        str     r0, [r4]
        add     r5, sp, #0x50
        str     r1, [r5]
        ldr     r6, [sp, #0xC]
        add     r4, sp, #0x40
        ldr     r5, [r4]
        add     r4, sp, #0x40
        cmp     r6, #0
        add     r6, sp, #0x50
        ldrsh   r8, [r5]
        ldrsh   r7, [r5, #6]
        ldrsh   r9, [r5, #4]
        ldrsh   r5, [r5, #2]
        ldr     r6, [r6]
        add     r10, r0, #8
        str     r10, [r4, #4]
        add     r10, r8, r7
        sub     r7, r8, r7
        add     r8, r5, r9
        sub     r5, r5, r9
        add     r11, r10, r8
        add     r9, r5, r7, lsl #1
        sub     r10, r10, r8
        str     r10, [r6, #8]
        sub     r7, r7, r5, lsl #1
        str     r11, [r6]
        str     r7, [r6, #0xC]
        add     r4, sp, #0x40
        ldr     r4, [r4, #4]
        str     r9, [r6, #4]
        add     r6, r1, #0x10
        ldrsh   r8, [r4, #6]
        ldrsh   r5, [r4, #2]
        ldrsh   r9, [r4]
        ldrsh   r4, [r4, #4]
        add     r7, sp, #0x50
        str     r6, [r7, #4]
        ldr     r7, [pc, #0x420]
        add     r6, sp, #0x50
        ldr     r6, [r6, #4]
        ldrb    r7, [r2, +r7]
        sub     r10, r5, r4
        str     r7, [sp, #4]
        ldr     r7, [pc, #0x40C]
        ldrb    r7, [r2, +r7]
        add     r2, r0, #0x10
        add     r0, r0, #0x18
        str     r7, [sp]
        add     r7, sp, #0x40
        str     r2, [r7, #8]
        add     r7, r9, r8
        sub     r8, r9, r8
        add     r9, r5, r4
        add     r2, sp, #0x40
        ldr     r2, [r2, #8]
        add     r5, r10, r8, lsl #1
        add     r4, r7, r9
        sub     r7, r7, r9
        str     r4, [r6]
        sub     r8, r8, r10, lsl #1
        str     r8, [r6, #0xC]
        str     r5, [r6, #4]
        str     r7, [r6, #8]
        ldrsh   r6, [r2, #6]
        ldrsh   r7, [r2]
        ldrsh   r4, [r2, #2]
        ldrsh   r2, [r2, #4]
        add     r5, r1, #0x20
        add     r8, sp, #0x50
        str     r5, [r8, #8]
        add     r8, sp, #0x40
        str     r0, [r8, #0xC]
        add     r8, r7, r6
        add     r5, sp, #0x50
        ldr     r5, [r5, #8]
        sub     r7, r7, r6
        sub     r9, r4, r2
        add     r0, sp, #0x40
        ldr     r0, [r0, #0xC]
        add     r6, r4, r2
        add     r2, r8, r6
        add     r4, r9, r7, lsl #1
        sub     r7, r7, r9, lsl #1
        sub     r8, r8, r6
        str     r2, [r5]
        str     r4, [r5, #4]
        str     r8, [r5, #8]
        str     r7, [r5, #0xC]
        ldrsh   r6, [r0, #6]
        ldrsh   r2, [r0, #2]
        ldrsh   r7, [r0]
        ldrsh   r0, [r0, #4]
        add     r4, r1, #0x30
        add     r5, sp, #0x50
        str     r4, [r5, #0xC]
        add     r5, r7, r6
        add     r4, sp, #0x50
        ldr     r4, [r4, #0xC]
        sub     r6, r7, r6
        sub     r8, r2, r0
        add     r7, r2, r0
        add     r2, r8, r6, lsl #1
        add     r0, r5, r7
        str     r0, [r4]
        sub     r6, r6, r8, lsl #1
        sub     r5, r5, r7
        str     r5, [r4, #8]
        str     r2, [r4, #4]
        str     r6, [r4, #0xC]
        ldr     r7, [r1, #4]
        ldr     r4, [r1, #0x14]
        ldr     r6, [r1, #0x10]
        ldr     r9, [r1, #0x20]
        ldr     r8, [r1, #0x34]
        ldr     r0, [r1, #0x24]
        ldr     r10, [r1]
        ldr     r5, [r1, #0x30]
        str     r0, [sp, #0x10]
        ldr     r0, [r1, #8]
        ldr     r11, [r1, #0x18]
        ldr     r2, [r1, #0x38]
        str     r11, [sp, #0x14]
        ldr     r11, [r1, #0x28]
        str     r11, [sp, #0x18]
        ldr     r11, [r1, #0xC]
        str     r11, [sp, #0x1C]
        ldr     r11, [r1, #0x3C]
        str     r11, [sp, #0x20]
        ldr     r11, [r1, #0x1C]
        str     r11, [sp, #0x24]
        ldr     r11, [r1, #0x2C]
        str     r11, [sp, #0x28]
        add     r11, r10, r5
        sub     r5, r10, r5
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x24]
        add     r10, r6, r9
        sub     r6, r6, r9
        add     r9, r7, r8
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x10]
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x14]
        sub     r7, r7, r8
        add     r8, r4, r9
        sub     r9, r4, r9
        add     r4, r0, r2
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        sub     r2, r0, r2
        add     r0, r10, r4
        str     r0, [sp, #0x38]
        sub     r0, r10, r4
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x1C]
        add     r10, r4, r10
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        sub     r4, r10, r4
        ldr     r10, [sp, #0x28]
        add     r11, r11, r10
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        sub     r11, r11, r10
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        add     r11, r10, r11
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x2C]
        add     r10, r6, r5, lsl #1
        sub     r5, r5, r6, lsl #1
        str     r5, [sp, #0x2C]
        ldr     r5, [sp, #0x34]
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x30]
        add     r6, r5, r8
        str     r6, [sp, #0x14]
        add     r6, r9, r7, lsl #1
        sub     r5, r5, r8
        sub     r7, r7, r9, lsl #1
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r6, [sp, #0x3C]
        sub     r11, r11, r10
        add     r5, r9, r8
        sub     r9, r9, r8
        add     r6, r0, r2, lsl #1
        sub     r8, r2, r0, lsl #1
        ldr     r2, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        str     r9, [sp, #0x38]
        ldr     r0, [sp, #0x28]
        str     r11, [sp, #0x30]
        add     r9, r10, r2
        sub     r2, r10, r2
        ldr     r10, [sp, #0x28]
        add     r0, r0, r4, lsl #1
        sub     r4, r4, r10, lsl #1
        ldr     r10, [sp, #0x24]
        str     r10, [r1]
        ldr     r10, [sp, #0x1C]
        str     r10, [r1, #0x10]
        ldr     r10, [sp, #0x30]
        str     r10, [r1, #0x20]
        ldr     r10, [sp, #0x2C]
        str     r10, [r1, #0x30]
        ldr     r10, [sp, #0x14]
        str     r10, [r1, #4]
        ldr     r10, [sp, #0x3C]
        str     r10, [r1, #0x14]
        ldr     r10, [sp, #0x34]
        str     r5, [r1, #8]
        str     r7, [r1, #0x34]
        str     r10, [r1, #0x24]
        str     r6, [r1, #0x18]
        ldr     r5, [sp, #0x38]
        str     r2, [r1, #0x2C]
        str     r8, [r1, #0x38]
        str     r5, [r1, #0x28]
        str     r9, [r1, #0xC]
        str     r0, [r1, #0x1C]
        str     r4, [r1, #0x3C]
        mov     r2, #1
        beq     LLBY6
        ldr     r0, [sp, #8]
        cmp     r0, #0
        ldr     r0, [sp, #4]
        add     r0, r0, #0xB
        mov     r2, r2, lsl r0
        beq     LLBY0
        ldr     r4, [pc, #0x118]
        mov     r4, r4, lsl #1
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
        b       LLBY1
LLBY0:
        ldr     r4, [pc, #0x104]
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
LLBY1:
        mov     r5, #0
        str     r5, [lr]
        str     r5, [r3]
        ldr     r7, [sp, #0xC]
        mov     r4, r1
        mov     r2, #0x10
LLBY2:
        ldr     r10, [r4]
        cmp     r10, #0
        mvnlt   r6, #0
        movge   r6, #1
        ldrsh   r9, [r7, +r5]
        mul     r9, r10, r9
        mla     r9, r9, r6, r8
        mov     r9, r9, lsr r0
        muls    r9, r6, r9
        str     r9, [r4], #4
        beq     LLBY3
        ldr     r6, [r3]
        add     r6, r6, #1
        str     r6, [r3]
        ldrsh   r6, [r12]
        ldr     r9, [lr]
        cmp     r9, r6
        strlt   r6, [lr]
LLBY3:
        subs    r2, r2, #1
        add     r5, r5, #2
        add     r12, r12, #2
        bne     LLBY2
        ldr     r1, [r1]
        cmp     r1, #0
        beq     LLBY4
        ldr     r0, [r3]
        rsb     r0, r0, #0
        str     r0, [r3]
LLBY4:
        mov     r0, #0
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LLBY5:
        mvn     r0, #0xA
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LLBY6:
        ldr     r0, [sp, #8]
        ldr     r4, [pc, #0x58]
        ldr     r5, [sp]
        cmp     r0, #0
        ldr     r0, [sp, #4]
        add     r5, r4, r5, lsl #5
        str     r5, [sp, #0xC]
        add     r0, r0, #0xF
        mov     r2, r2, lsl r0
        beq     LLBY7
        ldr     r4, [pc, #0x30]
        mov     r4, r4, lsl #1
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
        b       LLBY1
LLBY7:
        ldr     r4, [pc, #0x1C]
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
        b       LLBY1
LLBY8:
        mvn     r0, #7
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBY_h264_qp6
        .long   LLBY_h264_qp_rem
        .long   0x2aaaaaab
        .long   LLBY_FwdQuantTable_16s


        .data
        .align  4


LLBY_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBY_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBY_FwdQuantTable_16s:
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


