        .text
        .align  4
        .globl  _ippiTransformQuantFwdChromaDC2x4_H264_16s_C1I


_ippiTransformQuantFwdChromaDC2x4_H264_16s_C1I:
        stmdb   sp!, {r4 - r9, lr}
        ldr     lr, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        beq     LLBU5
        cmp     r1, #0
        beq     LLBU5
        cmp     r3, #0
        beq     LLBU5
        cmp     r2, #0
        blt     LLBU3
        cmp     r2, #0x27
        bgt     LLBU3
        cmp     r4, #0
        beq     LLBU0
        ldrsh   r4, [r0, #8]
        ldrsh   r8, [r0, #0xA]
        ldrsh   r5, [r0, #0xC]
        ldrsh   r7, [r0, #0xE]
        ldrsh   r6, [r0]
        add     r4, r4, r8
        ldrsh   r9, [r0, #6]
        ldrsh   r8, [r0, #4]
        add     r5, r5, r7
        ldrsh   r7, [r0, #2]
        add     r9, r8, r9
        rsb     r8, r5, #0
        sub     r8, r8, r4
        add     r6, r6, r7
        add     r7, r6, r9
        add     r8, r7, r8
        strh    r8, [r1, #4]
        add     r8, r4, r5
        add     r8, r7, r8
        sub     r7, r5, r4
        sub     r4, r4, r5
        sub     r6, r6, r9
        add     r4, r6, r4
        add     r7, r6, r7
        strh    r4, [r1, #0xC]
        strh    r8, [r1]
        strh    r7, [r1, #8]
        ldrsh   r4, [r0, #0xA]
        ldrsh   r8, [r0, #8]
        ldrsh   r5, [r0, #0xE]
        ldrsh   r7, [r0, #0xC]
        ldrsh   r6, [r0]
        sub     r4, r8, r4
        ldrsh   r9, [r0, #4]
        ldrsh   r8, [r0, #6]
        sub     r5, r7, r5
        ldrsh   r7, [r0, #2]
        sub     r9, r9, r8
        rsb     r8, r5, #0
        sub     r8, r8, r4
        sub     r6, r6, r7
        add     r7, r6, r9
        add     r8, r7, r8
        strh    r8, [r1, #6]
        add     r8, r4, r5
        add     r8, r7, r8
        sub     r7, r5, r4
        sub     r6, r6, r9
        sub     r4, r4, r5
        add     r7, r6, r7
        add     r4, r6, r4
        strh    r8, [r1, #2]
        strh    r7, [r1, #0xA]
        strh    r4, [r1, #0xE]
LLBU0:
        ldr     r4, [pc, #0xB0]
        add     r2, r2, #3
        cmp     r12, #0
        ldrb    r4, [r2, +r4]
        ldrnesh r12, [r12]
        addne   r4, r4, #0xB
        beq     LLBU4
LLBU1:
        cmp     lr, #0
        mov     r2, #0x56
        orr     r2, r2, #1, 24
        sub     lr, r4, #0xA
        addne   r2, r2, #0x55, 30
        mov     r2, r2, lsl lr
        add     lr, r4, #1
        mov     r6, #0
        mov     r4, r0
        mov     r5, #8
LLBU2:
        ldrsh   r8, [r1], #2
        cmp     r8, #0
        mvnlt   r7, #0
        movge   r7, #1
        mul     r8, r12, r8
        mla     r8, r8, r7, r2
        movs    r8, r8, asr lr
        mul     r7, r7, r8
        strh    r7, [r4], #2
        addne   r6, r6, #1
        subs    r5, r5, #1
        bne     LLBU2
        ldrsh   r0, [r0]
        cmp     r0, #0
        rsbne   r6, r6, #0
        mov     r0, #0
        str     r6, [r3]
        ldmia   sp!, {r4 - r9, pc}
LLBU3:
        mvn     r0, #0xA
        ldmia   sp!, {r4 - r9, pc}
LLBU4:
        ldr     r5, [pc, #0x20]
        ldr     r12, [pc, #0x20]
        add     r4, r4, #0xF
        ldrb    r5, [r2, +r5]
        mov     r2, r5, lsl #5
        ldrsh   r12, [r12, +r2]
        b       LLBU1
LLBU5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}
        .long   LLBU_h264_qp6
        .long   LLBU_h264_qp_rem
        .long   LLBU_FwdQuantTable_16s


        .data
        .align  4


LLBU_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBU_FwdQuantTable_16s:
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
LLBU_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05

