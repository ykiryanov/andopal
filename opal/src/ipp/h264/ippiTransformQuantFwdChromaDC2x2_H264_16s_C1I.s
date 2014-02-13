        .text
        .align  4
        .globl  _ippiTransformQuantFwdChromaDC2x2_H264_16s_C1I


_ippiTransformQuantFwdChromaDC2x2_H264_16s_C1I:
        stmdb   sp!, {r4 - r8, lr}
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        cmp     r0, #0
        beq     LLBW4
        cmp     r1, #0
        beq     LLBW4
        cmp     r3, #0
        beq     LLBW4
        cmp     r2, #0
        blt     LLBW2
        cmp     r2, #0x27
        bgt     LLBW2
        cmp     r4, #0
        beq     LLBW0
        ldrsh   r5, [r0, #6]
        ldrsh   r6, [r0]
        ldrsh   r4, [r0, #2]
        ldrsh   r7, [r0, #4]
        add     r5, r4, r5
        add     r6, r6, r7
        add     r5, r6, r5
        strh    r5, [r1]
        ldrsh   r6, [r0]
        ldrsh   r5, [r0, #6]
        ldrsh   r7, [r0, #4]
        ldrsh   r4, [r0, #2]
        add     r6, r6, r7
        add     r5, r4, r5
        sub     r6, r6, r5
        strh    r6, [r1, #2]
        ldrsh   r5, [r0, #2]
        ldrsh   r6, [r0, #4]
        ldrsh   r4, [r0, #6]
        ldrsh   r7, [r0]
        sub     r5, r5, r4
        sub     r6, r7, r6
        add     r5, r6, r5
        strh    r5, [r1, #4]
        ldrsh   r6, [r0, #4]
        ldrsh   r5, [r0, #2]
        ldrsh   r7, [r0]
        ldrsh   r4, [r0, #6]
        sub     r6, r7, r6
        sub     r5, r5, r4
        sub     r6, r6, r5
        strh    r6, [r1, #6]
LLBW0:
        ldr     r4, [pc, #0x134]
        ldr     r5, [pc, #0x134]
        cmp     r12, #0
        ldrb    r4, [r2, +r4]
        ldrb    r5, [r2, +r5]
        ldrnesh r12, [r12]
        addne   r2, r4, #0xC
        beq     LLBW3
LLBW1:
        ldr     r5, [pc, #0x11C]
        cmp     lr, #0
        mov     r4, #1
        mov     lr, r4, lsl r2
        movne   r5, r5, lsl #1
        smull   r6, r5, lr, r5
        ldrsh   r7, [r1]
        sub     lr, r5, lr, asr #31
        mvn     r5, #0
        cmp     r7, #0
        movlt   r6, r5
        movge   r6, r4
        mul     r7, r12, r7
        mla     r7, r7, r6, lr
        mov     r7, r7, asr r2
        mov     r7, r7, lsl #16
        movs    r7, r7, asr #16
        mul     r6, r6, r7
        strh    r6, [r0]
        moveq   r6, #0
        movne   r6, r4
        ldrsh   r8, [r1, #2]
        cmp     r8, #0
        movlt   r7, r5
        movge   r7, r4
        mul     r8, r12, r8
        mla     r8, r8, r7, lr
        mov     r8, r8, asr r2
        mov     r8, r8, lsl #16
        movs    r8, r8, asr #16
        mul     r7, r7, r8
        strh    r7, [r0, #2]
        addne   r6, r6, #1
        ldrsh   r8, [r1, #4]
        cmp     r8, #0
        movlt   r7, r5
        movge   r7, r4
        mul     r8, r12, r8
        mla     r8, r8, r7, lr
        mov     r8, r8, asr r2
        mov     r8, r8, lsl #16
        movs    r8, r8, asr #16
        mul     r7, r7, r8
        strh    r7, [r0, #4]
        addne   r6, r6, #1
        ldrsh   r1, [r1, #6]
        cmp     r1, #0
        movlt   r4, r5
        mul     r1, r12, r1
        mla     lr, r1, r4, lr
        mov     r2, lr, asr r2
        mov     r1, r2, lsl #16
        movs    r1, r1, asr #16
        mul     r4, r4, r1
        strh    r4, [r0, #6]
        addne   r6, r6, #1
        ldrsh   r0, [r0]
        cmp     r0, #0
        rsbne   r6, r6, #0
        mov     r0, #0
        str     r6, [r3]
        ldmia   sp!, {r4 - r8, pc}
LLBW2:
        mvn     r0, #0xA
        ldmia   sp!, {r4 - r8, pc}
LLBW3:
        ldr     r2, [pc, #0x20]
        mov     r5, r5, lsl #5
        ldrsh   r12, [r2, +r5]
        add     r2, r4, #0x10
        b       LLBW1
LLBW4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}
        .long   LLBW_h264_qp6
        .long   LLBW_h264_qp_rem
        .long   0x2aaaaaab
        .long   LLBW_FwdQuantTable_16s


        .data
        .align  4


LLBW_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBW_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x00
LLBW_FwdQuantTable_16s:
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


