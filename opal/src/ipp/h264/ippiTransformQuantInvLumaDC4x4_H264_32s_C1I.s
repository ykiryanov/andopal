        .text
        .align  4
        .globl  _ippiTransformQuantInvLumaDC4x4_H264_32s_C1I


_ippiTransformQuantInvLumaDC4x4_H264_32s_C1I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r3, r0
        cmp     r3, #0
        str     r2, [sp]
        beq     LLBJ5
        cmp     r1, #0
        blt     LLBJ3
        cmp     r1, #0x57
        bgt     LLBJ3
        ldr     r6, [sp]
        ldr     r9, [r3]
        ldr     r12, [r3, #0x10]
        ldr     r11, [r3, #0x20]
        ldr     r10, [r3, #0x30]
        ldr     r8, [r3, #0x14]
        ldr     r2, [r3, #4]
        ldr     lr, [r3, #0x24]
        ldr     r4, [r3, #0x34]
        ldr     r5, [r3, #0x18]
        ldr     r7, [r3, #8]
        cmp     r6, #0
        ldr     r6, [r3, #0x28]
        ldr     r0, [r3, #0x38]
        str     r0, [sp, #0x10]
        ldr     r0, [r3, #0x1C]
        str     r0, [sp, #0xC]
        ldr     r0, [r3, #0xC]
        str     r0, [sp, #8]
        ldr     r0, [r3, #0x2C]
        str     r0, [sp, #4]
        ldr     r0, [r3, #0x3C]
        str     r0, [sp, #0x14]
        add     r0, r9, r12
        sub     r9, r9, r12
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x18]
        str     r9, [sp, #0x1C]
        add     r12, r11, r10
        str     r12, [sp, #0x20]
        sub     r12, r11, r10
        ldr     r11, [sp, #4]
        add     r9, r2, r8
        str     r9, [sp, #0x24]
        sub     r2, r2, r8
        add     r8, lr, r4
        str     r8, [sp, #0x28]
        ldr     r8, [sp, #8]
        sub     r4, lr, r4
        add     lr, r7, r5
        sub     r5, r7, r5
        ldr     r7, [sp, #0x10]
        add     r9, r6, r7
        sub     r10, r6, r7
        ldr     r6, [sp, #0xC]
        add     r7, r8, r6
        sub     r8, r8, r6
        ldr     r6, [sp, #0x14]
        str     r8, [sp, #0x10]
        add     r8, r11, r6
        sub     r11, r11, r6
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x20]
        add     r6, r0, r11
        str     r6, [sp, #0xC]
        ldr     r6, [sp, #0x1C]
        sub     r0, r0, r11
        str     r0, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        sub     r6, r6, r12
        str     r6, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        add     r12, r6, r12
        ldr     r6, [sp, #0x28]
        str     r12, [sp, #0x1C]
        add     r12, r11, r6
        sub     r11, r11, r6
        str     r11, [sp, #0x28]
        sub     r6, r2, r4
        str     r6, [sp, #0x24]
        add     r4, r2, r4
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x14]
        ldr     r0, [sp, #8]
        sub     r2, r5, r10
        str     r2, [sp, #4]
        ldr     r2, [sp, #0x10]
        add     r6, lr, r9
        add     r10, r5, r10
        ldr     r5, [sp, #0xC]
        sub     r9, lr, r9
        str     r10, [sp, #0x2C]
        add     r11, r7, r8
        sub     lr, r2, r4
        sub     r10, r7, r8
        ldr     r8, [sp, #0x28]
        add     r2, r2, r4
        add     r4, r5, r12
        sub     r12, r5, r12
        add     r5, r6, r11
        sub     r6, r6, r11
        ldr     r11, [sp, #0x20]
        add     r7, r11, r8
        sub     r11, r11, r8
        add     r8, r9, r10
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x18]
        sub     r9, r9, r10
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        add     r10, r11, r9
        sub     r11, r11, r9
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #4]
        add     r9, r11, lr
        sub     lr, r11, lr
        ldr     r11, [sp, #0x1C]
        add     r0, r11, r0
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #8]
        sub     r11, r11, r0
        ldr     r0, [sp, #0x2C]
        str     r11, [sp, #0x1C]
        add     r11, r0, r2
        str     r11, [sp, #0x14]
        sub     r0, r0, r2
        add     r2, r4, r5
        str     r2, [sp, #0x10]
        sub     r2, r12, r6
        sub     r4, r4, r5
        add     r6, r12, r6
        ldr     r12, [sp, #0x28]
        ldr     r5, [sp, #0x20]
        str     r4, [sp, #0xC]
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x24]
        sub     r4, r12, r5
        add     r12, r12, r5
        add     r5, r10, r9
        str     r2, [sp, #8]
        str     r5, [sp, #0x28]
        add     r2, r7, r8
        sub     r5, r6, lr
        sub     r7, r7, r8
        ldr     r8, [sp, #0x18]
        add     r6, r6, lr
        ldr     lr, [sp, #0x14]
        str     r0, [sp, #0x2C]
        sub     r10, r10, r9
        ldr     r0, [sp, #0x2C]
        add     r9, r8, lr
        sub     r8, r8, lr
        ldr     lr, [sp, #0x1C]
        sub     r11, lr, r0
        add     lr, lr, r0
        ldr     r0, [sp, #0x10]
        str     r0, [r3]
        ldr     r0, [sp, #0xC]
        str     r0, [r3, #4]
        ldr     r0, [sp, #8]
        str     r0, [r3, #8]
        ldr     r0, [sp, #4]
        str     r2, [r3, #0x10]
        str     r7, [r3, #0x14]
        str     r0, [r3, #0xC]
        str     r4, [r3, #0x18]
        str     r12, [r3, #0x1C]
        ldr     r2, [sp, #0x28]
        str     r10, [r3, #0x24]
        str     r5, [r3, #0x28]
        str     r2, [r3, #0x20]
        str     r6, [r3, #0x2C]
        str     r9, [r3, #0x30]
        str     r8, [r3, #0x34]
        str     r11, [r3, #0x38]
        str     lr, [r3, #0x3C]
        ldrne   r2, [sp]
        ldrnesh r6, [r2]
        beq     LLBJ4
LLBJ0:
        ldr     r2, [pc, #0x2C0]
        ldr     r12, [r3]
        cmp     r1, #0x24
        ldrb    r5, [r1, +r2]
        bge     LLBJ1
        ldr     r1, [r3, #4]
        rsb     r8, r5, #6
        sub     r0, r8, #1
        str     r1, [sp, #0x2C]
        ldr     r10, [r3, #0x28]
        ldr     r5, [r3, #8]
        ldr     r9, [r3, #0x10]
        ldr     r1, [r3, #0x24]
        ldr     r7, [r3, #0xC]
        ldr     r11, [r3, #0x14]
        ldr     r4, [r3, #0x18]
        ldr     r2, [r3, #0x20]
        ldr     lr, [r3, #0x1C]
        str     r10, [sp, #0x28]
        ldr     r10, [r3, #0x2C]
        str     r10, [sp, #0x24]
        ldr     r10, [r3, #0x30]
        str     r10, [sp, #0x20]
        ldr     r10, [r3, #0x34]
        str     r10, [sp, #0x1C]
        ldr     r10, [r3, #0x38]
        str     r10, [sp, #0x18]
        ldr     r10, [r3, #0x3C]
        str     r10, [sp, #0x14]
        mov     r10, #1
        mov     r10, r10, lsl r0
        mla     r12, r6, r12, r10
        mla     r5, r6, r5, r10
        mla     r7, r6, r7, r10
        mla     r9, r6, r9, r10
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x2C]
        mla     lr, r6, lr, r10
        str     r5, [sp, #0xC]
        mla     r5, r6, r1, r10
        mla     r12, r6, r12, r10
        ldr     r1, [sp, #0x28]
        str     r9, [sp, #0x30]
        ldr     r9, [sp, #0x1C]
        str     r7, [sp, #8]
        mla     r7, r6, r1, r10
        str     r12, [sp, #0x2C]
        mla     r12, r6, r11, r10
        mla     r11, r6, r4, r10
        mla     r4, r6, r2, r10
        ldr     r1, [sp, #0x24]
        mla     r9, r6, r9, r10
        ldr     r0, [sp, #0x14]
        mla     r2, r6, r1, r10
        ldr     r1, [sp, #0x20]
        mov     r12, r12, asr r8
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x18]
        mla     r1, r6, r1, r10
        mov     lr, lr, asr r8
        mov     r4, r4, asr r8
        mla     r9, r6, r9, r10
        mla     r10, r6, r0, r10
        ldr     r6, [sp, #0x10]
        mov     r5, r5, asr r8
        mov     r1, r1, asr r8
        mov     r9, r9, asr r8
        mov     r6, r6, asr r8
        str     r6, [r3]
        ldr     r6, [sp, #0x2C]
        str     r12, [sp, #0x10]
        mov     r12, r11, asr r8
        mov     r6, r6, asr r8
        str     r6, [sp]
        ldr     r6, [sp, #0xC]
        mov     r6, r6, asr r8
        str     r6, [sp, #4]
        ldr     r6, [sp, #8]
        mov     r6, r6, asr r8
        str     r6, [sp, #8]
        ldr     r6, [sp, #0x30]
        mov     r6, r6, asr r8
        str     r6, [sp, #0xC]
        mov     r6, r7, asr r8
        mov     r7, r2, asr r8
        ldr     r2, [sp, #0x28]
        mov     r2, r2, asr r8
        mov     r8, r10, asr r8
        b       LLBJ2
LLBJ1:
        mul     r4, r6, r12
        ldr     r10, [r3, #0x20]
        ldr     r2, [r3, #4]
        ldr     r12, [r3, #8]
        ldr     r1, [r3, #0xC]
        ldr     lr, [r3, #0x10]
        mul     r2, r6, r2
        mul     r12, r6, r12
        mul     r1, r6, r1
        mul     lr, r6, lr
        ldr     r7, [r3, #0x14]
        ldr     r9, [r3, #0x18]
        sub     r8, r5, #6
        mul     r7, r6, r7
        ldr     r5, [r3, #0x1C]
        mul     r9, r6, r9
        mov     r4, r4, lsl r8
        mul     r5, r6, r5
        str     r4, [r3]
        mul     r4, r6, r10
        ldr     r10, [r3, #0x24]
        mov     r12, r12, lsl r8
        mov     r2, r2, lsl r8
        str     r2, [sp]
        mul     r10, r6, r10
        str     r12, [sp, #4]
        mov     r1, r1, lsl r8
        str     r1, [sp, #8]
        mov     lr, lr, lsl r8
        str     lr, [sp, #0xC]
        mov     r7, r7, lsl r8
        str     r7, [sp, #0x10]
        ldr     r11, [r3, #0x28]
        ldr     r7, [r3, #0x2C]
        ldr     r1, [r3, #0x30]
        mul     r11, r6, r11
        ldr     r2, [r3, #0x34]
        mul     r7, r6, r7
        mul     r1, r6, r1
        mul     r2, r6, r2
        mov     r12, r9, lsl r8
        ldr     r9, [r3, #0x38]
        mov     lr, r5, lsl r8
        mov     r5, r10, lsl r8
        ldr     r10, [r3, #0x3C]
        mul     r9, r6, r9
        mov     r4, r4, lsl r8
        mov     r7, r7, lsl r8
        mul     r10, r6, r10
        mov     r6, r11, lsl r8
        mov     r1, r1, lsl r8
        mov     r2, r2, lsl r8
        mov     r9, r9, lsl r8
        mov     r8, r10, lsl r8
LLBJ2:
        ldr     r10, [sp]
        mov     r0, #0
        str     r10, [r3, #4]
        ldr     r10, [sp, #4]
        str     r10, [r3, #8]
        ldr     r10, [sp, #8]
        str     r10, [r3, #0xC]
        ldr     r10, [sp, #0xC]
        str     r10, [r3, #0x10]
        ldr     r10, [sp, #0x10]
        str     r12, [r3, #0x18]
        str     lr, [r3, #0x1C]
        str     r10, [r3, #0x14]
        str     r4, [r3, #0x20]
        str     r5, [r3, #0x24]
        str     r6, [r3, #0x28]
        str     r7, [r3, #0x2C]
        str     r1, [r3, #0x30]
        str     r2, [r3, #0x34]
        str     r9, [r3, #0x38]
        str     r8, [r3, #0x3C]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LLBJ3:
        mvn     r0, #0xA
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LLBJ4:
        ldr     r12, [pc, #0x20]
        ldr     r2, [pc, #0x20]
        ldrb    r12, [r1, +r12]
        mov     r12, r12, lsl #5
        ldrsh   r6, [r2, +r12]
        b       LLBJ0
LLBJ5:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBJ_h264_qp6
        .long   LLBJ_h264_qp_rem
        .long   LLBJ_InvLevelScale_4x4_default


        .data
        .align  4


LLBJ_InvLevelScale_4x4_default:
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
LLBJ_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBJ_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E


