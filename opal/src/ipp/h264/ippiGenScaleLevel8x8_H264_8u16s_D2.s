        .text
        .align  4
        .globl  ippiGenScaleLevel8x8_H264_8u16s_D2


ippiGenScaleLevel8x8_H264_8u16s_D2:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        mov     r4, r1
        beq     LLCU3
        cmp     r2, #0
        beq     LLCU3
        cmp     r3, #0
        beq     LLCU3
        cmp     r12, #0
        blt     LLCU0
        cmp     r12, #5
        ble     LLCU1
LLCU0:
        mvn     r0, #0xBF
        ldmia   sp!, {r4 - r11, pc}
LLCU1:
        ldr     r5, [pc, #0x13C]
        ldr     lr, [pc, #0x13C]
        add     r9, r0, #6
        add     r0, r5, r12, lsl #7
        sub     r8, r2, #2
        add     r12, lr, r12, lsl #7
        sub     r7, r12, #2
        sub     r6, r3, #2
        sub     r5, r0, #2
        mov     r10, #8
LLCU2:
        ldrsh   r0, [r5, #2]
        ldrb    r11, [r9, #-6]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #2]
        ldrsh   r0, [r7, #2]
        mul     r11, r0, r11
        strh    r11, [r8, #2]
        ldrb    r11, [r9, #-5]
        ldrsh   r0, [r5, #4]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #4]
        ldrsh   r0, [r7, #4]
        mul     r11, r0, r11
        strh    r11, [r8, #4]
        ldrsh   r0, [r5, #6]
        ldrb    r11, [r9, #-4]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #6]
        ldrsh   r0, [r7, #6]
        mul     r11, r0, r11
        strh    r11, [r8, #6]
        ldrb    r11, [r9, #-3]
        ldrsh   r0, [r5, #8]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #8]
        ldrsh   r0, [r7, #8]
        mul     r11, r0, r11
        strh    r11, [r8, #8]
        ldrb    r11, [r9, #-2]
        ldrsh   r0, [r5, #0xA]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #0xA]
        ldrsh   r0, [r7, #0xA]
        mul     r11, r0, r11
        strh    r11, [r8, #0xA]
        ldrsh   r0, [r5, #0xC]
        ldrb    r11, [r9, #-1]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #0xC]
        ldrsh   r0, [r7, #0xC]
        mul     r11, r0, r11
        strh    r11, [r8, #0xC]
        ldrsh   r0, [r5, #0xE]
        ldrb    r11, [r9]
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #0xE]
        ldrsh   r0, [r7, #0xE]
        mul     r11, r0, r11
        strh    r11, [r8, #0xE]
        ldrsh   r0, [r5, #0x10]!
        ldrb    r11, [r9, #1]
        add     r9, r9, r4
        mov     r1, r11
        bl      __intel_idiv
        strh    r0, [r6, #0x10]!
        ldrsh   r0, [r7, #0x10]!
        mul     r11, r0, r11
        subs    r10, r10, #1
        strh    r11, [r8, #0x10]!
        bne     LLCU2
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LLCU3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   LLCU_LevelScale_8x8_default
        .long   LLCU_InvLevelScale_8x8_default


        .data
        .align  4


LLCU_LevelScale_8x8_default:
        .byte   0x33,0x33,0xBE,0x2F,0x89,0x41,0xBE,0x2F,0x33,0x33,0xBE,0x2F,0x89,0x41,0xBE,0x2F
        .byte   0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C,0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C
        .byte   0x89,0x41,0x79,0x3C,0xEC,0x51,0x79,0x3C,0x89,0x41,0x79,0x3C,0xEC,0x51,0x79,0x3C
        .byte   0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C,0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C
        .byte   0x33,0x33,0xBE,0x2F,0x89,0x41,0xBE,0x2F,0x33,0x33,0xBE,0x2F,0x89,0x41,0xBE,0x2F
        .byte   0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C,0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C
        .byte   0x89,0x41,0x79,0x3C,0xEC,0x51,0x79,0x3C,0x89,0x41,0x79,0x3C,0xEC,0x51,0x79,0x3C
        .byte   0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C,0xBE,0x2F,0xA4,0x2C,0x79,0x3C,0xA4,0x2C
        .byte   0x8C,0x2E,0x32,0x2B,0x84,0x3A,0x32,0x2B,0x8C,0x2E,0x32,0x2B,0x84,0x3A,0x32,0x2B
        .byte   0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A,0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A
        .byte   0x84,0x3A,0xD2,0x37,0xE6,0x4A,0xD2,0x37,0x84,0x3A,0xD2,0x37,0xE6,0x4A,0xD2,0x37
        .byte   0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A,0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A
        .byte   0x8C,0x2E,0x32,0x2B,0x84,0x3A,0x32,0x2B,0x8C,0x2E,0x32,0x2B,0x84,0x3A,0x32,0x2B
        .byte   0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A,0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A
        .byte   0x84,0x3A,0xD2,0x37,0xE6,0x4A,0xD2,0x37,0x84,0x3A,0xD2,0x37,0xE6,0x4A,0xD2,0x37
        .byte   0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A,0x32,0x2B,0x4A,0x2A,0xD2,0x37,0x4A,0x2A
        .byte   0x62,0x27,0xCB,0x25,0xA6,0x31,0xCB,0x25,0x62,0x27,0xCB,0x25,0xA6,0x31,0xCB,0x25
        .byte   0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22,0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22
        .byte   0xA6,0x31,0xD1,0x2E,0x6A,0x3E,0xD1,0x2E,0xA6,0x31,0xD1,0x2E,0x6A,0x3E,0xD1,0x2E
        .byte   0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22,0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22
        .byte   0x62,0x27,0xCB,0x25,0xA6,0x31,0xCB,0x25,0x62,0x27,0xCB,0x25,0xA6,0x31,0xCB,0x25
        .byte   0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22,0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22
        .byte   0xA6,0x31,0xD1,0x2E,0x6A,0x3E,0xD1,0x2E,0xA6,0x31,0xD1,0x2E,0x6A,0x3E,0xD1,0x2E
        .byte   0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22,0xCB,0x25,0xEF,0x22,0xD1,0x2E,0xEF,0x22
        .byte   0x92,0x24,0xE3,0x22,0xD0,0x2E,0xE3,0x22,0x92,0x24,0xE3,0x22,0xD0,0x2E,0xE3,0x22
        .byte   0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20,0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20
        .byte   0xD0,0x2E,0xFB,0x2B,0x41,0x3A,0xFB,0x2B,0xD0,0x2E,0xFB,0x2B,0x41,0x3A,0xFB,0x2B
        .byte   0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20,0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20
        .byte   0x92,0x24,0xE3,0x22,0xD0,0x2E,0xE3,0x22,0x92,0x24,0xE3,0x22,0xD0,0x2E,0xE3,0x22
        .byte   0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20,0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20
        .byte   0xD0,0x2E,0xFB,0x2B,0x41,0x3A,0xFB,0x2B,0xD0,0x2E,0xFB,0x2B,0x41,0x3A,0xFB,0x2B
        .byte   0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20,0xE3,0x22,0x24,0x20,0xFB,0x2B,0x24,0x20
        .byte   0x00,0x20,0x3C,0x1E,0xF6,0x28,0x3C,0x1E,0x00,0x20,0x3C,0x1E,0xF6,0x28,0x3C,0x1E
        .byte   0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C,0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C
        .byte   0xF6,0x28,0x31,0x26,0x67,0x33,0x31,0x26,0xF6,0x28,0x31,0x26,0x67,0x33,0x31,0x26
        .byte   0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C,0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C
        .byte   0x00,0x20,0x3C,0x1E,0xF6,0x28,0x3C,0x1E,0x00,0x20,0x3C,0x1E,0xF6,0x28,0x3C,0x1E
        .byte   0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C,0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C
        .byte   0xF6,0x28,0x31,0x26,0x67,0x33,0x31,0x26,0xF6,0x28,0x31,0x26,0x67,0x33,0x31,0x26
        .byte   0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C,0x3C,0x1E,0xB2,0x1C,0x31,0x26,0xB2,0x1C
        .byte   0x72,0x1C,0xAE,0x1A,0x9E,0x23,0xAE,0x1A,0x72,0x1C,0xAE,0x1A,0x9E,0x23,0xAE,0x1A
        .byte   0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19,0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19
        .byte   0x9E,0x23,0xC0,0x21,0x32,0x2D,0xC0,0x21,0x9E,0x23,0xC0,0x21,0x32,0x2D,0xC0,0x21
        .byte   0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19,0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19
        .byte   0x72,0x1C,0xAE,0x1A,0x9E,0x23,0xAE,0x1A,0x72,0x1C,0xAE,0x1A,0x9E,0x23,0xAE,0x1A
        .byte   0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19,0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19
        .byte   0x9E,0x23,0xC0,0x21,0x32,0x2D,0xC0,0x21,0x9E,0x23,0xC0,0x21,0x32,0x2D,0xC0,0x21
        .byte   0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19,0xAE,0x1A,0x1C,0x19,0xC0,0x21,0x1C,0x19
LLCU_InvLevelScale_8x8_default:
        .byte   0x14,0x00,0x13,0x00,0x19,0x00,0x13,0x00,0x14,0x00,0x13,0x00,0x19,0x00,0x13,0x00
        .byte   0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00,0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00
        .byte   0x19,0x00,0x18,0x00,0x20,0x00,0x18,0x00,0x19,0x00,0x18,0x00,0x20,0x00,0x18,0x00
        .byte   0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00,0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00
        .byte   0x14,0x00,0x13,0x00,0x19,0x00,0x13,0x00,0x14,0x00,0x13,0x00,0x19,0x00,0x13,0x00
        .byte   0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00,0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00
        .byte   0x19,0x00,0x18,0x00,0x20,0x00,0x18,0x00,0x19,0x00,0x18,0x00,0x20,0x00,0x18,0x00
        .byte   0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00,0x13,0x00,0x12,0x00,0x18,0x00,0x12,0x00
        .byte   0x16,0x00,0x15,0x00,0x1C,0x00,0x15,0x00,0x16,0x00,0x15,0x00,0x1C,0x00,0x15,0x00
        .byte   0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00,0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00
        .byte   0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00,0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00
        .byte   0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00,0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00
        .byte   0x16,0x00,0x15,0x00,0x1C,0x00,0x15,0x00,0x16,0x00,0x15,0x00,0x1C,0x00,0x15,0x00
        .byte   0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00,0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00
        .byte   0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00,0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00
        .byte   0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00,0x15,0x00,0x13,0x00,0x1A,0x00,0x13,0x00
        .byte   0x1A,0x00,0x18,0x00,0x21,0x00,0x18,0x00,0x1A,0x00,0x18,0x00,0x21,0x00,0x18,0x00
        .byte   0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00,0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00
        .byte   0x21,0x00,0x1F,0x00,0x2A,0x00,0x1F,0x00,0x21,0x00,0x1F,0x00,0x2A,0x00,0x1F,0x00
        .byte   0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00,0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00
        .byte   0x1A,0x00,0x18,0x00,0x21,0x00,0x18,0x00,0x1A,0x00,0x18,0x00,0x21,0x00,0x18,0x00
        .byte   0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00,0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00
        .byte   0x21,0x00,0x1F,0x00,0x2A,0x00,0x1F,0x00,0x21,0x00,0x1F,0x00,0x2A,0x00,0x1F,0x00
        .byte   0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00,0x18,0x00,0x17,0x00,0x1F,0x00,0x17,0x00
        .byte   0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00,0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00
        .byte   0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00,0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00
        .byte   0x23,0x00,0x21,0x00,0x2D,0x00,0x21,0x00,0x23,0x00,0x21,0x00,0x2D,0x00,0x21,0x00
        .byte   0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00,0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00
        .byte   0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00,0x1C,0x00,0x1A,0x00,0x23,0x00,0x1A,0x00
        .byte   0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00,0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00
        .byte   0x23,0x00,0x21,0x00,0x2D,0x00,0x21,0x00,0x23,0x00,0x21,0x00,0x2D,0x00,0x21,0x00
        .byte   0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00,0x1A,0x00,0x19,0x00,0x21,0x00,0x19,0x00
        .byte   0x20,0x00,0x1E,0x00,0x28,0x00,0x1E,0x00,0x20,0x00,0x1E,0x00,0x28,0x00,0x1E,0x00
        .byte   0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00,0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00
        .byte   0x28,0x00,0x26,0x00,0x33,0x00,0x26,0x00,0x28,0x00,0x26,0x00,0x33,0x00,0x26,0x00
        .byte   0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00,0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00
        .byte   0x20,0x00,0x1E,0x00,0x28,0x00,0x1E,0x00,0x20,0x00,0x1E,0x00,0x28,0x00,0x1E,0x00
        .byte   0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00,0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00
        .byte   0x28,0x00,0x26,0x00,0x33,0x00,0x26,0x00,0x28,0x00,0x26,0x00,0x33,0x00,0x26,0x00
        .byte   0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00,0x1E,0x00,0x1C,0x00,0x26,0x00,0x1C,0x00
        .byte   0x24,0x00,0x22,0x00,0x2E,0x00,0x22,0x00,0x24,0x00,0x22,0x00,0x2E,0x00,0x22,0x00
        .byte   0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00,0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00
        .byte   0x2E,0x00,0x2B,0x00,0x3A,0x00,0x2B,0x00,0x2E,0x00,0x2B,0x00,0x3A,0x00,0x2B,0x00
        .byte   0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00,0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00
        .byte   0x24,0x00,0x22,0x00,0x2E,0x00,0x22,0x00,0x24,0x00,0x22,0x00,0x2E,0x00,0x22,0x00
        .byte   0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00,0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00
        .byte   0x2E,0x00,0x2B,0x00,0x3A,0x00,0x2B,0x00,0x2E,0x00,0x2B,0x00,0x3A,0x00,0x2B,0x00
        .byte   0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00,0x22,0x00,0x20,0x00,0x2B,0x00,0x20,0x00


