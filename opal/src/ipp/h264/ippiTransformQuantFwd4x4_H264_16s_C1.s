        .text
        .align  4
        .globl  ippiTransformQuantFwd4x4_H264_16s_C1


ippiTransformQuantFwd4x4_H264_16s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r12, [sp, #0x8C]
        ldr     r4, [sp, #0x98]
        ldr     lr, [sp, #0x94]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x90]
        cmp     r0, #0
        str     r4, [sp, #0xC]
        beq     LLBX8
        cmp     r1, #0
        beq     LLBX8
        cmp     r3, #0
        beq     LLBX8
        cmp     r12, #0
        beq     LLBX8
        cmp     lr, #0
        beq     LLBX8
        cmp     r2, #0
        blt     LLBX5
        cmp     r2, #0x33
        bgt     LLBX5
        add     r4, sp, #0x48
        add     r6, sp, #0x48
        add     r5, sp, #0x58
        str     r0, [r4]
        ldr     r4, [r6]
        str     r1, [r5]
        ldr     r5, [sp, #0xC]
        ldrsh   r10, [r4, #4]
        ldrsh   r9, [r4, #2]
        ldrsh   r6, [r4, #6]
        cmp     r5, #0
        ldrsh   r5, [r4]
        add     r8, r9, r10
        sub     r9, r9, r10
        add     r4, sp, #0x58
        ldr     r4, [r4]
        sub     r7, r5, r6
        mov     r9, r9, lsl #16
        add     r6, r5, r6
        mov     r7, r7, lsl #16
        mov     r8, r8, lsl #16
        mov     r9, r9, asr #16
        mov     r5, r7, asr #16
        mov     r10, r8, asr #16
        mov     r6, r6, lsl #16
        add     r8, r9, r5, lsl #1
        sub     r5, r5, r9, lsl #1
        strh    r5, [r4, #6]
        add     r7, r10, r6, asr #16
        rsb     r6, r10, r6, asr #16
        strh    r7, [r4]
        strh    r8, [r4, #2]
        strh    r6, [r4, #4]
        ldrsh   r4, [r0, #0xC]
        ldrsh   r8, [r0, #0xA]
        ldrsh   r6, [r0, #0xE]
        ldrsh   r7, [r0, #8]
        add     r9, r0, #0x10
        add     r5, r8, r4
        sub     r4, r8, r4
        sub     r8, r7, r6
        add     r7, r7, r6
        add     r10, sp, #0x48
        str     r9, [r10, #8]
        mov     r6, r8, lsl #16
        mov     r5, r5, lsl #16
        mov     r8, r4, lsl #16
        mov     r7, r7, lsl #16
        mov     r6, r6, asr #16
        mov     r10, r8, asr #16
        add     r4, sp, #0x48
        ldr     r4, [r4, #8]
        mov     r9, r5, asr #16
        add     r8, r10, r6, lsl #1
        strh    r8, [r1, #0xA]
        add     r5, r9, r7, asr #16
        rsb     r7, r9, r7, asr #16
        strh    r5, [r1, #8]
        strh    r7, [r1, #0xC]
        sub     r6, r6, r10, lsl #1
        strh    r6, [r1, #0xE]
        ldrsh   r6, [r4, #4]
        ldrsh   r10, [r4, #2]
        ldrsh   r9, [r4]
        ldrsh   r5, [r4, #6]
        add     r4, r1, #0x10
        add     r7, sp, #0x58
        str     r4, [r7, #8]
        add     r4, sp, #0x58
        ldr     r4, [r4, #8]
        add     r8, r10, r6
        sub     r6, r10, r6
        ldr     r10, [pc, #0x524]
        sub     r7, r9, r5
        add     r5, r9, r5
        mov     r7, r7, lsl #16
        ldrb    r10, [r2, +r10]
        mov     r8, r8, lsl #16
        mov     r6, r6, lsl #16
        mov     r5, r5, lsl #16
        str     r10, [sp, #4]
        ldr     r10, [pc, #0x504]
        mov     r7, r7, asr #16
        mov     r9, r8, asr #16
        ldrb    r10, [r2, +r10]
        add     r2, r0, #0x18
        add     r0, r0, #8
        str     r10, [sp]
        add     r10, sp, #0x48
        str     r2, [r10, #0xC]
        mov     r10, r6, asr #16
        add     r2, sp, #0x48
        ldr     r2, [r2, #0xC]
        add     r8, r10, r7, lsl #1
        add     r6, r9, r5, asr #16
        strh    r6, [r4]
        strh    r8, [r4, #2]
        rsb     r5, r9, r5, asr #16
        strh    r5, [r4, #4]
        sub     r7, r7, r10, lsl #1
        strh    r7, [r4, #6]
        ldrsh   r7, [r2]
        ldrsh   r6, [r2, #6]
        ldrsh   r5, [r2, #4]
        ldrsh   r4, [r2, #2]
        add     r2, r1, #0x18
        add     r8, sp, #0x58
        str     r2, [r8, #0xC]
        sub     r9, r7, r6
        add     r8, r4, r5
        add     r7, r7, r6
        add     r2, sp, #0x58
        ldr     r2, [r2, #0xC]
        sub     r4, r4, r5
        mov     r9, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     r6, r4, lsl #16
        mov     r4, r9, asr #16
        mov     r5, r7, lsl #16
        mov     r9, r6, asr #16
        mov     r8, r8, asr #16
        add     r7, r9, r4, lsl #1
        add     r6, r8, r5, asr #16
        sub     r4, r4, r9, lsl #1
        strh    r6, [r2]
        strh    r7, [r2, #2]
        strh    r4, [r2, #6]
        rsb     r5, r8, r5, asr #16
        strh    r5, [r2, #4]
        ldrsh   r8, [r1, #0x10]
        add     r2, sp, #0x48
        ldrsh   r9, [r1, #8]
        str     r0, [r2, #4]
        ldrsh   r0, [r1, #0xA]
        str     r0, [sp, #0x10]
        ldrsh   r0, [r1, #0x12]
        str     r0, [sp, #0x14]
        ldrsh   r0, [r1, #0xC]
        str     r0, [sp, #0x18]
        ldrsh   r0, [r1, #0x14]
        str     r0, [sp, #0x1C]
        ldrsh   r0, [r1, #0xE]
        str     r0, [sp, #0x20]
        ldrsh   r0, [r1, #0x16]
        str     r0, [sp, #0x24]
        ldrsh   r11, [r1]
        str     r11, [sp, #0x28]
        ldrsh   r10, [r1, #0x18]
        str     r10, [sp, #0x2C]
        ldrsh   r4, [r1, #2]
        ldrsh   r5, [r1, #0x1A]
        ldrsh   r0, [r1, #0x1E]
        ldrsh   r6, [r1, #4]
        ldrsh   r7, [r1, #0x1C]
        ldrsh   r2, [r1, #6]
        sub     r11, r11, r10
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x1C]
        add     r10, r9, r8
        sub     r9, r9, r8
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x10]
        str     r9, [sp, #0x38]
        sub     r8, r4, r5
        str     r8, [sp, #0x3C]
        ldr     r8, [sp, #0x14]
        add     r5, r4, r5
        ldr     r4, [sp, #0x3C]
        add     r9, r10, r8
        sub     r8, r10, r8
        sub     r10, r6, r7
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x14]
        add     r11, r10, r11
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        mov     r9, r9, lsl #16
        mov     r4, r4, lsl #16
        str     r4, [sp, #0x14]
        sub     r11, r11, r10
        str     r11, [sp, #0x1C]
        sub     r10, r2, r0
        ldr     r11, [sp, #0x24]
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x10]
        mov     r8, r8, lsl #16
        add     r11, r10, r11
        str     r11, [sp, #0x40]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x20]
        str     r9, [sp, #0x20]
        str     r8, [sp, #0x44]
        mov     r4, r4, lsl #16
        sub     r11, r11, r10
        str     r11, [sp, #0x24]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        str     r5, [sp, #0x28]
        add     r8, r6, r7
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x1C]
        add     r11, r10, r11
        ldr     r10, [sp, #0x30]
        str     r11, [sp, #0x2C]
        ldr     r5, [sp, #0x2C]
        mov     r4, r4, lsl #16
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        mov     r8, r8, lsl #16
        mov     r10, r10, lsl #16
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x10]
        add     r11, r2, r0
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0x40]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        mov     r11, r11, lsl #16
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x34]
        mov     r2, r2, lsl #16
        mov     r9, r6, asr #16
        ldr     r6, [sp, #0x28]
        mov     r0, r0, lsl #16
        mov     r4, r4, lsl #16
        mov     r5, r5, lsl #16
        str     r5, [sp, #0x40]
        ldr     r5, [sp, #0x30]
        mov     r6, r6, lsl #16
        str     r6, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        mov     r2, r2, asr #16
        str     r2, [sp, #0x28]
        mov     r7, r6, asr #16
        ldr     r6, [sp, #0x20]
        add     r2, r1, #8
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x40]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x3C]
        ldr     r6, [sp, #0x44]
        str     r8, [sp, #0x44]
        ldr     r8, [sp, #0x14]
        mov     r6, r6, asr #16
        mov     r5, r5, asr #16
        mov     r10, r10, asr #16
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x1C]
        add     r11, r11, r2, asr #16
        str     r11, [sp, #0x20]
        add     r11, r9, r5, lsl #1
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x34]
        sub     r5, r5, r9, lsl #1
        str     r5, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        rsb     r2, r11, r2, asr #16
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x3C]
        ldr     r11, [sp, #0x2C]
        mov     r8, r8, asr #16
        add     r9, r2, r5, asr #16
        str     r9, [sp, #0x18]
        add     r9, r6, r7, lsl #1
        str     r9, [sp, #0x14]
        ldr     r9, [sp, #0x44]
        rsb     r5, r2, r5, asr #16
        sub     r7, r7, r6, lsl #1
        ldr     r6, [sp, #0x30]
        mov     r10, r10, asr #16
        str     r5, [sp, #0x3C]
        mov     r0, r0, asr #16
        add     r2, r6, r9, asr #16
        add     r5, r10, r8, lsl #1
        mov     r4, r4, asr #16
        rsb     r9, r6, r9, asr #16
        ldr     r6, [sp, #0x28]
        sub     r8, r8, r10, lsl #1
        add     r10, r4, r0, lsl #1
        str     r9, [sp, #0x44]
        sub     r0, r0, r4, lsl #1
        ldr     r4, [sp, #0x24]
        add     r9, r6, r11, asr #16
        rsb     r6, r6, r11, asr #16
        add     r11, sp, #0x58
        str     r4, [r11, #4]
        ldr     r4, [sp, #0x20]
        strh    r4, [r1]
        ldr     r4, [sp, #0x1C]
        strh    r4, [r1, #8]
        ldr     r4, [sp, #0x40]
        strh    r4, [r1, #0x10]
        ldr     r4, [sp, #0x34]
        strh    r4, [r1, #0x18]
        ldr     r4, [sp, #0x18]
        strh    r4, [r1, #2]
        ldr     r4, [sp, #0x14]
        strh    r4, [r1, #0xA]
        ldr     r4, [sp, #0x3C]
        strh    r2, [r1, #4]
        strh    r7, [r1, #0x1A]
        strh    r4, [r1, #0x12]
        strh    r5, [r1, #0xC]
        ldr     r2, [sp, #0x44]
        strh    r8, [r1, #0x1C]
        strh    r9, [r1, #6]
        strh    r2, [r1, #0x14]
        strh    r10, [r1, #0xE]
        strh    r6, [r1, #0x16]
        strh    r0, [r1, #0x1E]
        mov     r2, #1
        beq     LLBX6
        ldr     r0, [sp, #8]
        cmp     r0, #0
        ldr     r0, [sp, #4]
        add     r0, r0, #0xB
        mov     r2, r2, lsl r0
        beq     LLBX0
        ldr     r4, [pc, #0x120]
        mov     r4, r4, lsl #1
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
        b       LLBX1
LLBX0:
        ldr     r4, [pc, #0x10C]
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
LLBX1:
        mov     r5, #0
        str     r5, [lr]
        str     r5, [r3]
        ldr     r7, [sp, #0xC]
        mov     r2, r1
        mov     r4, #0x10
LLBX2:
        ldrsh   r10, [r2]
        cmp     r10, #0
        mvnlt   r6, #0
        movge   r6, #1
        ldrsh   r9, [r7, +r5]
        mul     r9, r10, r9
        mla     r9, r9, r6, r8
        mov     r9, r9, asr r0
        mul     r9, r6, r9
        mov     r6, r9, lsl #16
        movs    r6, r6, asr #16
        strh    r6, [r2], #2
        beq     LLBX3
        ldr     r6, [r3]
        add     r6, r6, #1
        str     r6, [r3]
        ldrsh   r6, [r12]
        ldr     r9, [lr]
        cmp     r9, r6
        strlt   r6, [lr]
LLBX3:
        subs    r4, r4, #1
        add     r5, r5, #2
        add     r12, r12, #2
        bne     LLBX2
        ldrsh   r1, [r1]
        cmp     r1, #0
        beq     LLBX4
        ldr     r0, [r3]
        rsb     r0, r0, #0
        str     r0, [r3]
LLBX4:
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LLBX5:
        mvn     r0, #0xA
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LLBX6:
        ldr     r0, [sp, #8]
        ldr     r4, [pc, #0x58]
        ldr     r5, [sp]
        cmp     r0, #0
        ldr     r0, [sp, #4]
        add     r5, r4, r5, lsl #5
        str     r5, [sp, #0xC]
        add     r0, r0, #0xF
        mov     r2, r2, lsl r0
        beq     LLBX7
        ldr     r4, [pc, #0x30]
        mov     r4, r4, lsl #1
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
        b       LLBX1
LLBX7:
        ldr     r4, [pc, #0x1C]
        smull   r4, r5, r2, r4
        sub     r8, r5, r2, asr #31
        b       LLBX1
LLBX8:
        mvn     r0, #7
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBX_h264_qp6
        .long   LLBX_h264_qp_rem
        .long   0x2aaaaaab
        .long   LLBX_FwdQuantTable_16s


        .data
        .align  4


LLBX_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBX_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBX_FwdQuantTable_16s:
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


