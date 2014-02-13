        .text
        .align  4
        .globl  _ippiTransformQuantFwdChromaDC2x4_H264_32s_C1I


_ippiTransformQuantFwdChromaDC2x4_H264_32s_C1I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     lr, [sp, #0x38]
        cmp     r0, #0
        mov     r5, r1
        beq     LLBT6
        cmp     r5, #0
        beq     LLBT6
        cmp     r3, #0
        beq     LLBT6
        cmp     r2, #0
        blt     LLBT4
        cmp     r2, #0x4B
        bgt     LLBT4
        cmp     r4, #0
        beq     LLBT0
        ldr     r4, [r0, #8]
        ldr     r7, [r0]
        ldr     r9, [r0, #0xC]
        ldr     r8, [r0, #4]
        ldr     r6, [r0, #0x10]
        add     r4, r4, r9
        ldr     r9, [r0, #0x18]
        add     r7, r7, r8
        ldr     r10, [r0, #0x1C]
        ldr     r8, [r0, #0x14]
        add     r6, r6, r8
        add     r10, r9, r10
        add     r9, r4, r6
        add     r8, r7, r10
        sub     r4, r4, r6
        add     r6, r8, r9
        sub     r7, r7, r10
        str     r6, [r5]
        add     r6, r7, r4
        sub     r7, r7, r4
        sub     r8, r8, r9
        str     r7, [r5, #0x18]
        str     r8, [r5, #0x10]
        str     r6, [r5, #8]
        ldr     r4, [r0, #0xC]
        ldr     r7, [r0, #4]
        ldr     r9, [r0, #8]
        ldr     r8, [r0]
        ldr     r6, [r0, #0x10]
        sub     r4, r9, r4
        ldr     r10, [r0, #0x18]
        sub     r7, r8, r7
        ldr     r8, [r0, #0x14]
        ldr     r9, [r0, #0x1C]
        sub     r6, r6, r8
        sub     r10, r10, r9
        add     r9, r4, r6
        add     r8, r7, r10
        sub     r4, r4, r6
        add     r6, r8, r9
        sub     r7, r7, r10
        str     r6, [r5, #4]
        add     r6, r7, r4
        sub     r8, r8, r9
        sub     r7, r7, r4
        str     r8, [r5, #0x14]
        str     r6, [r5, #0xC]
        str     r7, [r5, #0x1C]
LLBT0:
        ldr     r6, [pc, #0xF8]
        add     r4, r2, #3
        cmp     lr, #0
        ldrb    r2, [r4, +r6]
        ldrnesh r8, [lr]
        addne   r2, r2, #0xB
        beq     LLBT5
LLBT1:
        cmp     r12, #0
        mov     r12, #0x56
        orr     r12, r12, #1, 24
        sub     lr, r2, #0xA
        addne   r12, r12, #0x55, 30
        mov     r7, r12, lsl lr
        add     r4, r2, #1
        mov     r12, #0
        mov     r6, r4, asr #31
        mov     r9, r0
        mov     r10, #8
        str     r12, [sp]
        str     r3, [sp, #4]
        str     r0, [sp, #8]
LLBT2:
        ldr     r0, [r5], #4
        cmp     r0, #0
        mvnlt   r11, #0
        movge   r11, #1
        mul     r0, r11, r0
        mov     r2, r4
        mov     r3, r6
        smull   r0, r12, r8, r0
        adds    r0, r7, r0
        adc     r1, r12, r7, asr #31
        bl      __ashrdi3
        mul     r11, r11, r0
        cmp     r0, #0
        str     r11, [r9], #4
        beq     LLBT3
        ldr     r0, [sp]
        add     r0, r0, #1
        str     r0, [sp]
LLBT3:
        subs    r10, r10, #1
        bne     LLBT2
        ldr     r0, [sp, #8]
        ldr     r12, [sp]
        ldr     r3, [sp, #4]
        ldr     r0, [r0]
        cmp     r0, #0
        rsbne   r12, r12, #0
        mov     r0, #0
        str     r12, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLBT4:
        mvn     r0, #0xA
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LLBT5:
        ldr     r6, [pc, #0x24]
        ldr     lr, [pc, #0x24]
        add     r2, r2, #0xF
        ldrb    r6, [r4, +r6]
        mov     r4, r6, lsl #5
        ldrsh   r8, [lr, +r4]
        b       LLBT1
LLBT6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   LLBT_h264_qp6
        .long   LLBT_h264_qp_rem
        .long   LLBT_FwdQuantTable_16s


        .data
        .align  4


LLBT_h264_qp6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x02,0x02,0x02,0x02
        .byte   0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x06,0x06,0x06,0x06,0x06,0x06,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A
        .byte   0x0A,0x0A,0x0B,0x0B,0x0B,0x0B,0x0B,0x0B,0x0C,0x0C,0x0C,0x0C,0x0C,0x0C,0x0D,0x0D
        .byte   0x0D,0x0D,0x0D,0x0D,0x0E,0x0E,0x0E,0x0E,0x0E,0x0E,0x00,0x00
LLBT_FwdQuantTable_16s:
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
LLBT_h264_qp_rem:
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05
        .byte   0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03
        .byte   0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01
        .byte   0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x04,0x05


