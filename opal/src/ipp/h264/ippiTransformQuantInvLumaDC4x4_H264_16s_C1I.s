        .text
        .align  4
        .globl  ippiTransformQuantInvLumaDC4x4_H264_16s_C1I


ippiTransformQuantInvLumaDC4x4_H264_16s_C1I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x78
        cmp     r0, #0
        str     r0, [sp, #0x14]
        str     r2, [sp]
        beq     LLBK5
        cmp     r1, #0
        blt     LLBK3
        cmp     r1, #0x33
        bgt     LLBK3
        ldr     r3, [sp, #0x14]
        ldr     r4, [sp]
        ldrsh   r0, [r3, #2]
        ldrsh   r9, [r3, #0x18]
        ldrsh   r11, [r3, #0x1C]
        ldrsh   r5, [r3, #0xC]
        ldrsh   r7, [r3, #8]
        ldrsh   lr, [r3, #0x1A]
        ldrsh   r2, [r3, #0xA]
        ldrsh   r10, [r3, #0x10]
        ldrsh   r8, [r3]
        ldrsh   r6, [r3, #4]
        ldrsh   r12, [r3, #0x12]
        cmp     r4, #0
        ldrsh   r4, [r3, #0x14]
        str     r11, [sp, #0x24]
        ldrsh   r11, [r3, #0xE]
        str     r11, [sp, #0x20]
        ldrsh   r11, [r3, #6]
        str     r11, [sp, #0x1C]
        ldrsh   r11, [r3, #0x16]
        str     r11, [sp, #0x18]
        ldrsh   r3, [r3, #0x1E]
        str     r3, [sp, #0x10]
        add     r3, r8, r7
        sub     r8, r8, r7
        add     r7, r0, r2
        str     r7, [sp, #0x28]
        sub     r0, r0, r2
        str     r8, [sp, #8]
        str     r3, [sp, #0xC]
        ldr     r11, [sp, #0xC]
        add     r3, r10, r9
        add     r2, r12, lr
        sub     lr, r12, lr
        add     r12, r6, r5
        sub     r5, r6, r5
        ldr     r6, [sp, #0x24]
        str     r3, [sp, #4]
        sub     r3, r10, r9
        ldr     r10, [sp, #0x18]
        sub     r8, r4, r6
        add     r9, r4, r6
        ldr     r6, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        add     r7, r6, r4
        sub     r6, r6, r4
        ldr     r4, [sp, #0x10]
        str     r6, [sp, #0x24]
        add     r6, r10, r4
        sub     r10, r10, r4
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #4]
        add     r4, r11, r10
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #8]
        sub     r11, r11, r10
        str     r11, [sp, #0x18]
        sub     r4, r4, r3
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #8]
        ldr     r10, [sp, #0x10]
        add     r3, r4, r3
        ldr     r4, [sp, #0x28]
        str     r3, [sp, #0xC]
        ldr     r11, [sp, #0xC]
        add     r3, r4, r2
        sub     r4, r4, r2
        sub     r2, r0, lr
        str     r2, [sp, #8]
        str     r4, [sp, #0x28]
        add     lr, r0, lr
        str     lr, [sp, #4]
        sub     r0, r5, r8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        add     r8, r5, r8
        ldr     r5, [sp, #0x20]
        add     r2, r12, r9
        sub     r4, r12, r9
        str     r8, [sp, #0x30]
        add     lr, r7, r6
        sub     r6, r7, r6
        sub     r12, r0, r5
        add     r0, r0, r5
        ldr     r5, [sp, #0x1C]
        add     r9, r2, lr
        sub     r8, r2, lr
        ldr     lr, [sp, #0x18]
        ldr     r2, [sp, #0x28]
        add     r7, r5, r3
        sub     r5, r5, r3
        add     r3, lr, r2
        str     r5, [sp, #0x24]
        sub     r2, lr, r2
        add     lr, r4, r6
        sub     r4, r4, r6
        ldr     r6, [sp, #8]
        add     r5, r10, r6
        sub     r10, r10, r6
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        add     r6, r10, r12
        sub     r10, r10, r12
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #4]
        add     r12, r11, r10
        str     r12, [sp, #0x20]
        sub     r11, r11, r10
        ldr     r10, [sp, #0x30]
        str     r11, [sp, #0x1C]
        add     r12, r10, r0
        sub     r10, r10, r0
        add     r0, r7, r9
        sub     r7, r7, r9
        str     r7, [sp, #0xC]
        add     r7, r3, lr
        sub     r3, r3, lr
        str     r3, [sp, #8]
        sub     r3, r2, r4
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x24]
        add     r4, r2, r4
        str     r4, [sp, #4]
        ldr     lr, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        str     r7, [sp, #0x24]
        str     r12, [sp, #0x18]
        ldr     r11, [sp, #0x10]
        sub     r7, lr, r4
        add     r2, r5, r6
        add     lr, lr, r4
        ldr     r4, [sp, #0x18]
        sub     r5, r5, r6
        ldr     r6, [sp, #0x20]
        sub     r12, r0, r8
        str     r10, [sp, #0x30]
        add     r0, r0, r8
        add     r8, r6, r4
        sub     r4, r6, r4
        ldr     r6, [sp, #0x1C]
        ldr     r10, [sp, #0x30]
        sub     r9, r6, r10
        add     r6, r6, r10
        add     r10, sp, #0x38
        str     r11, [r10]
        ldr     r11, [sp, #0xC]
        str     r12, [r10, #8]
        str     r0, [r10, #0xC]
        str     r11, [r10, #4]
        ldr     r11, [sp, #0x24]
        str     r11, [r10, #0x10]
        ldr     r11, [sp, #8]
        str     r3, [r10, #0x18]
        str     r11, [r10, #0x14]
        ldr     r3, [sp, #4]
        str     r2, [r10, #0x20]
        str     r5, [r10, #0x24]
        str     r3, [r10, #0x1C]
        str     r7, [r10, #0x28]
        str     lr, [r10, #0x2C]
        str     r8, [r10, #0x30]
        str     r4, [r10, #0x34]
        str     r9, [r10, #0x38]
        str     r6, [r10, #0x3C]
        beq     LLBK4
        ldr     r2, [sp]
        ldrsh   r2, [r2]
        str     r2, [sp, #8]
LLBK0:
        add     r10, sp, #0x38
        ldr     r4, [r10]
        ldr     r2, [sp, #8]
        ldr     lr, [pc, #0x2D4]
        ldr     r3, [r10, #4]
        cmp     r1, #0x24
        mul     r4, r2, r4
        str     r4, [sp, #0x10]
        ldrb    r9, [r1, +lr]
        ldr     r11, [r10, #0x30]
        ldr     r2, [r10, #0x10]
        ldr     r1, [r10, #0x14]
        ldr     lr, [r10, #0x18]
        ldr     r4, [r10, #0x1C]
        ldr     r5, [r10, #0x20]
        ldr     r6, [r10, #0x24]
        ldr     r7, [r10, #0x28]
        ldr     r8, [r10, #0x2C]
        str     r11, [sp, #0x20]
        ldr     r11, [r10, #0x34]
        str     r11, [sp, #0x1C]
        ldr     r11, [r10, #0x38]
        str     r11, [sp, #0x18]
        ldr     r10, [r10, #0x3C]
        str     r10, [sp, #0xC]
        bge     LLBK1
        rsb     r9, r9, #6
        mov     r10, #1
        sub     r11, r9, #1
        mov     r10, r10, lsl r11
        ldr     r11, [sp, #8]
        mla     r0, r11, r0, r10
        mla     r3, r11, r3, r10
        mla     r12, r11, r12, r10
        mla     r2, r11, r2, r10
        mla     r1, r11, r1, r10
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        str     r3, [sp, #0x30]
        mla     lr, r11, lr, r10
        mla     r4, r11, r4, r10
        mla     r3, r11, r0, r10
        ldr     r0, [sp, #0x1C]
        str     r2, [sp, #0x24]
        mla     r5, r11, r5, r10
        mla     r6, r11, r6, r10
        mla     r2, r11, r0, r10
        ldr     r0, [sp, #0x18]
        mla     r7, r11, r7, r10
        mla     r8, r11, r8, r10
        str     r12, [sp, #0x2C]
        mla     r0, r11, r0, r10
        ldr     r12, [sp, #0xC]
        mov     r1, r1, asr r9
        mov     lr, lr, asr r9
        mov     r4, r4, asr r9
        mla     r11, r11, r12, r10
        ldr     r12, [sp, #0x10]
        mov     r5, r5, asr r9
        mov     r6, r6, asr r9
        add     r12, r10, r12
        ldr     r10, [sp, #0x14]
        mov     r12, r12, asr r9
        mov     r7, r7, asr r9
        mov     r8, r8, asr r9
        strh    r12, [r10]
        ldr     r12, [sp, #0x30]
        str     r1, [sp, #0x10]
        str     lr, [sp, #0x18]
        mov     r12, r12, asr r9
        str     r12, [sp]
        ldr     r12, [sp, #0x2C]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x20]
        mov     r12, r12, asr r9
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x28]
        mov     r1, r3, asr r9
        mov     r2, r2, asr r9
        mov     r12, r12, asr r9
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x24]
        mov     r3, r0, asr r9
        str     r6, [sp, #0x24]
        mov     r12, r12, asr r9
        str     r12, [sp, #0xC]
        mov     r9, r11, asr r9
        b       LLBK2
LLBK1:
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #0x14]
        sub     r9, r9, #6
        mul     r0, r10, r0
        mul     r3, r10, r3
        mul     r12, r10, r12
        mul     r2, r10, r2
        mul     r1, r10, r1
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x20]
        mul     lr, r10, lr
        mul     r4, r10, r4
        mul     r5, r10, r5
        mul     r0, r10, r0
        mul     r6, r10, r6
        mul     r7, r10, r7
        mul     r8, r10, r8
        str     r3, [sp, #0x30]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x1C]
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0xC]
        mov     r2, r2, lsl r9
        mul     r3, r10, r0
        ldr     r0, [sp, #0x18]
        mov     r1, r1, lsl r9
        mov     lr, lr, lsl r9
        mul     r0, r10, r0
        mul     r10, r10, r12
        ldr     r12, [sp, #0x10]
        mov     r4, r4, lsl r9
        mov     r5, r5, lsl r9
        mov     r6, r6, lsl r9
        mov     r12, r12, lsl r9
        strh    r12, [r11]
        ldr     r12, [sp, #0x30]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r12, r12, lsl r9
        str     r12, [sp]
        ldr     r12, [sp, #0x2C]
        ldr     r1, [sp, #0x34]
        str     lr, [sp, #0x18]
        mov     r12, r12, lsl r9
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x28]
        mov     r2, r3, lsl r9
        mov     r7, r7, lsl r9
        mov     r12, r12, lsl r9
        mov     r8, r8, lsl r9
        mov     r1, r1, lsl r9
        mov     r3, r0, lsl r9
        str     r12, [sp, #8]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
        mov     r9, r10, lsl r9
LLBK2:
        ldr     lr, [sp]
        ldr     r12, [sp, #0x14]
        mov     r0, #0
        strh    lr, [r12, #2]
        ldr     lr, [sp, #4]
        strh    lr, [r12, #4]
        ldr     lr, [sp, #8]
        strh    lr, [r12, #6]
        ldr     lr, [sp, #0xC]
        strh    lr, [r12, #8]
        ldr     lr, [sp, #0x10]
        strh    lr, [r12, #0xA]
        ldr     lr, [sp, #0x18]
        strh    lr, [r12, #0xC]
        ldr     lr, [sp, #0x1C]
        strh    lr, [r12, #0xE]
        ldr     lr, [sp, #0x20]
        strh    lr, [r12, #0x10]
        ldr     lr, [sp, #0x24]
        strh    r7, [r12, #0x14]
        strh    r8, [r12, #0x16]
        strh    lr, [r12, #0x12]
        strh    r1, [r12, #0x18]
        strh    r2, [r12, #0x1A]
        strh    r3, [r12, #0x1C]
        strh    r9, [r12, #0x1E]
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
LLBK3:
        mvn     r0, #0xA
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
LLBK4:
        ldr     r3, [pc, #0x24]
        ldr     r2, [pc, #0x24]
        ldrb    r3, [r1, +r3]
        mov     r3, r3, lsl #5
        ldrsh   r3, [r2, +r3]
        str     r3, [sp, #8]
        b       LLBK0
LLBK5:
        mvn     r0, #7
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBK_h264_qp6
        .long   LLBK_h264_qp_rem
        .long   LLBK_InvLevelScale_4x4_default


        .data
        .align  4


LLBK_InvLevelScale_4x4_default:
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
LLBK_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBK_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E


