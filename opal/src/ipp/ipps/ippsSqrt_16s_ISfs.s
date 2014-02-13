        .text
        .align  4
        .globl  _ippsSqrt_16s_ISfs


_ippsSqrt_16s_ISfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        beq     LAWE38
        cmp     r5, #0
        ble     LAWE39
        cmp     r2, #0
        mov     r0, #0
        mov     r12, #1
        blt     LAWE13
        cmp     r2, #8
        bgt     LAWE11
        cmp     r2, #0
        bne     LAWE4
        cmp     r5, #0
        ble     LAWE29
        ldr     r4, [pc, #0x474]
        ldr     lr, [pc, #0x474]
        ldr     r12, [pc, #0x474]
        ldr     r3, [pc, #0x474]
        mov     r7, #0
        mov     r8, r7
LAWE0:
        ldrsh   r10, [r6]
        cmp     r10, #0
        strlth  r0, [r6]
        movlt   r7, #3
        blt     LAWE3
        tst     r10, #7, 20
        beq     LAWE1
        ldrb    r2, [lr, +r10, asr #8]
        mov     r11, r2, lsl #1
        ldrh    r11, [r4, +r11]
        cmp     r11, r10
        bge     LAWE2
        add     r2, r2, #1
        mov     r11, r2, lsl #1
        ldrh    r11, [r4, +r11]
        cmp     r11, r10
        addlt   r2, r2, #1
        b       LAWE2
LAWE1:
        tst     r10, #0xFE, 28
        ldreqsb r2, [r10, +r3]
        beq     LAWE2
        mov     r2, r10, asr #4
        ldrsb   r2, [r12, +r2]
        mov     r11, r2, lsl #1
        ldrh    r11, [r4, +r11]
        cmp     r11, r10
        addlt   r2, r2, #1
LAWE2:
        strh    r2, [r6]
LAWE3:
        add     r8, r8, #1
        cmp     r8, r5
        add     r6, r6, #2
        blt     LAWE0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE4:
        cmp     r5, #0
        mov     r9, r2, lsl #1
        sub     r8, r2, #1
        ble     LAWE30
        ldr     lr, [pc, #0x3C4]
        ldr     r3, [pc, #0x3C4]
        ldr     r10, [pc, #0x3C4]
        ldr     r11, [pc, #0x3C4]
        mov     r7, #0
        mov     r4, r7
LAWE5:
        ldrsh   r10, [r6]
        cmp     r10, #0
        strlth  r0, [r6]
        movlt   r7, #3
        blt     LAWE10
        mov     r12, r10, asr r9
        mov     r1, r12, lsl #16
        mov     r11, r1, asr #16
        tst     r11, #7, 20
        beq     LAWE6
        ldrb    r11, [r3, +r1, asr #24]
        mov     r1, r11, lsl #1
        ldrh    r1, [lr, +r1]
        cmp     r1, r12
        bge     LAWE7
        add     r11, r11, #1
        mov     r1, r11, lsl #1
        ldrh    r1, [lr, +r1]
        cmp     r1, r12
        addlt   r11, r11, #1
        b       LAWE7
LAWE6:
        tst     r11, #0xFE, 28
        ldreq   r12, [pc, #0x360]
        ldreqsb r11, [r12, +r11]
        beq     LAWE7
        ldr     r1, [pc, #0x350]
        mov     r11, r11, asr #4
        ldrsb   r11, [r1, +r11]
        mov     r1, r11, lsl #1
        ldrh    r1, [lr, +r1]
        cmp     r1, r12
        addlt   r11, r11, #1
LAWE7:
        mov     r12, #1
        mov     r1, r11, lsl r2
        add     r12, r1, r12, lsl r8
        mul     r12, r12, r12
        cmp     r12, r10
        blt     LAWE8
        cmp     r12, r10
        bne     LAWE9
        tst     r11, #1
        beq     LAWE9
LAWE8:
        add     r11, r11, #1
LAWE9:
        strh    r11, [r6]
LAWE10:
        add     r4, r4, #1
        cmp     r4, r5
        add     r6, r6, #2
        blt     LAWE5
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE11:
        cmp     r5, #0
        ble     LAWE31
        mov     r7, #0
        mov     r2, r7
LAWE12:
        ldrsh   r3, [r6]
        cmp     r3, #0
        movlt   r7, #3
        add     r2, r2, #1
        strh    r0, [r6], #2
        cmp     r2, r5
        blt     LAWE12
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE13:
        rsb     r2, r2, #0
        mov     r3, #0xFF
        cmp     r2, #0xE
        orr     r9, r3, #0x7F, 24
        bgt     LAWE26
        mov     r3, #0xFE, 12
        cmp     r2, #7
        orr     r4, r3, #3, 4
        mov     r10, r2, lsl #1
        bgt     LAWE23
        cmp     r2, #3
        bgt     LAWE20
        sub     r3, r2, #1
        cmp     r5, #0
        mov     r12, r12, lsl r3
        ble     LAWE32
        ldr     r4, [pc, #0x270]
        ldr     lr, [pc, #0x270]
        ldr     r3, [pc, #0x270]
        ldr     r11, [pc, #0x270]
        mov     r7, #0
        mov     r8, r7
LAWE14:
        ldrsh   r9, [r6]
        cmp     r9, #0
        strlth  r0, [r6]
        movlt   r7, #3
        blt     LAWE19
        tst     r9, #7, 20
        beq     LAWE15
        ldrb    r11, [lr, +r9, asr #8]
        mov     r1, r11, lsl #1
        ldrh    r1, [r4, +r1]
        cmp     r1, r9
        bge     LAWE16
        add     r11, r11, #1
        mov     r1, r11, lsl #1
        ldrh    r1, [r4, +r1]
        cmp     r1, r9
        addlt   r11, r11, #1
        b       LAWE16
LAWE15:
        tst     r9, #0xFE, 28
        ldreq   r11, [pc, #0x218]
        ldreqsb r11, [r9, +r11]
        beq     LAWE16
        mov     r11, r9, asr #4
        ldrsb   r11, [r3, +r11]
        mov     r1, r11, lsl #1
        ldrh    r1, [r4, +r1]
        cmp     r1, r9
        addlt   r11, r11, #1
LAWE16:
        mul     r1, r11, r11
        cmp     r9, r1
        sublt   r11, r11, #1
        cmp     r12, #0
        mov     r11, r11, lsl r2
        mov     r1, r12
        beq     LAWE18
        str     r5, [sp]
LAWE17:
        orr     r11, r11, r1
        mul     r5, r11, r11
        cmp     r5, r9, lsl r10
        eorgt   r11, r11, r1
        movs    r1, r1, asr #1
        bne     LAWE17
        ldr     r5, [sp]
LAWE18:
        mla     r1, r11, r11, r11
        cmp     r1, r9, lsl r10
        addlt   r11, r11, #1
        strh    r11, [r6]
LAWE19:
        add     r8, r8, #1
        cmp     r8, r5
        add     r6, r6, #2
        blt     LAWE14
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE20:
        cmp     r5, #0
        ble     LAWE33
        mov     r7, #0
        mov     r8, r7
        mov     r9, r0
LAWE21:
        ldrsh   r2, [r6]
        cmp     r2, #0
        strlth  r9, [r6]
        movlt   r7, #3
        blt     LAWE22
        mov     r0, r2, lsl r10
        bl      __floatsidf
        bl      sqrt
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __fixdfsi
        strh    r0, [r6]
LAWE22:
        add     r8, r8, #1
        cmp     r8, r5
        add     r6, r6, #2
        blt     LAWE21
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE23:
        sub     r2, r2, #8
        cmp     r5, #0
        mov     r8, r2, lsl #1
        mov     r2, #1, 18
        ble     LAWE35
        mov     r7, #0
        mov     r11, r7
LAWE24:
        ldrsh   r12, [r6]
        cmp     r12, #0
        blt     LAWE34
        mov     r2, #1, 18
        cmp     r12, r2, asr r8
        strgeh  r9, [r6]
        bge     LAWE25
        mov     r0, r12, lsl r10
        bl      __floatsidf
        bl      sqrt
        mov     r2, #0
        mov     r3, r4
        bl      __adddf3
        bl      __fixdfsi
        strh    r0, [r6]
LAWE25:
        add     r11, r11, #1
        cmp     r11, r5
        add     r6, r6, #2
        blt     LAWE24
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE26:
        cmp     r5, #0
        ble     LAWE37
        mov     r7, #0
        mov     r3, r7
LAWE27:
        ldrsh   r2, [r6]
        cmp     r2, #0
        strgth  r9, [r6]
        ble     LAWE36
LAWE28:
        add     r3, r3, #1
        cmp     r3, r5
        add     r6, r6, #2
        blt     LAWE27
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE29:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE30:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE31:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE32:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE33:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE34:
        mov     r2, #0
        strh    r2, [r6]
        mov     r7, #3
        b       LAWE25
LAWE35:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE36:
        cmp     r2, #0
        strneh  r0, [r6]
        movne   r7, #3
        b       LAWE28
LAWE37:
        mov     r7, #0
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE38:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LAWE39:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   LAWE_sqtbmx
        .long   LAWE_sqrtb2
        .long   LAWE_sqrtb1
        .long   LAWE_sqrtb0


        .data
        .align  4


LAWE_sqrtb0:
        .byte   0x00,0x01,0x01,0x02,0x02,0x02,0x02,0x03,0x03,0x03,0x03,0x03,0x03,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x06
LAWE_sqrtb1:
        .byte   0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x0B,0x0C,0x0D,0x0D,0x0E,0x0E,0x0F,0x0F
        .byte   0x10,0x10,0x11,0x11,0x12,0x12,0x13,0x13,0x14,0x14,0x14,0x15,0x15,0x16,0x16,0x16
        .byte   0x17,0x17,0x17,0x18,0x18,0x18,0x19,0x19,0x19,0x1A,0x1A,0x1A,0x1B,0x1B,0x1B,0x1B
        .byte   0x1C,0x1C,0x1C,0x1D,0x1D,0x1D,0x1D,0x1E,0x1E,0x1E,0x1E,0x1F,0x1F,0x1F,0x1F,0x20
        .byte   0x20,0x20,0x20,0x21,0x21,0x21,0x21,0x22,0x22,0x22,0x22,0x23,0x23,0x23,0x23,0x24
        .byte   0x24,0x24,0x24,0x24,0x25,0x25,0x25,0x25,0x26,0x26,0x26,0x26,0x26,0x27,0x27,0x27
        .byte   0x27,0x27,0x28,0x28,0x28,0x28,0x28,0x29,0x29,0x29,0x29,0x29,0x2A,0x2A,0x2A,0x2A
        .byte   0x2A,0x2B,0x2B,0x2B,0x2B,0x2B,0x2B,0x2C,0x2C,0x2C,0x2C,0x2C,0x2D,0x2D,0x2D,0x2D
        .byte   0x2D,0x2D,0x2E,0x2E,0x2E,0x2E,0x2E,0x2E,0x2F,0x2F,0x2F,0x2F,0x2F,0x2F,0x30,0x30
        .byte   0x30,0x30,0x30,0x30,0x31,0x31,0x31,0x31,0x31,0x31,0x32,0x32,0x32,0x32,0x32,0x32
        .byte   0x33,0x33,0x33,0x33,0x33,0x33,0x34,0x34,0x34,0x34,0x34,0x34,0x34,0x35,0x35,0x35
        .byte   0x35,0x35,0x35,0x36,0x36,0x36,0x36,0x36,0x36,0x36,0x37,0x37,0x37,0x37,0x37,0x37
        .byte   0x37,0x38,0x38,0x38,0x38,0x38,0x38,0x38,0x39,0x39,0x39,0x39,0x39,0x39,0x39,0x3A
        .byte   0x3A,0x3A,0x3A,0x3A,0x3A,0x3A,0x3B,0x3B,0x3B,0x3B,0x3B,0x3B,0x3B,0x3B,0x3C,0x3C
        .byte   0x3C,0x3C,0x3C,0x3C,0x3C,0x3D,0x3D,0x3D,0x3D,0x3D,0x3D,0x3D,0x3D,0x3E,0x3E,0x3E
        .byte   0x3E,0x3E,0x3E,0x3E,0x3E,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x40,0x40,0x40
LAWE_sqtbmx:
        .byte   0x00,0x00,0x02,0x00,0x06,0x00,0x0C,0x00,0x0E,0x00,0x1E,0x00,0x2A,0x00,0x38,0x00
        .byte   0x48,0x00,0x5A,0x00,0x6E,0x00,0x84,0x00,0x9C,0x00,0xB6,0x00,0xD2,0x00,0xF0,0x00
        .byte   0x10,0x01,0x32,0x01,0x56,0x01,0x7C,0x01,0xA4,0x01,0xCE,0x01,0xFA,0x01,0x28,0x02
        .byte   0x58,0x02,0x8A,0x02,0xBE,0x02,0xF4,0x02,0x2C,0x03,0x66,0x03,0xA2,0x03,0xE0,0x03
        .byte   0x20,0x04,0x62,0x04,0xA6,0x04,0xEC,0x04,0x34,0x05,0x7E,0x05,0xCA,0x05,0x18,0x06
        .byte   0x68,0x06,0xBA,0x06,0x0E,0x07,0x64,0x07,0xBC,0x07,0x16,0x08,0x72,0x08,0xD0,0x08
        .byte   0x30,0x09,0x92,0x09,0xF6,0x09,0x5C,0x0A,0xC4,0x0A,0x2E,0x0B,0x9A,0x0B,0x08,0x0C
        .byte   0x78,0x0C,0xEA,0x0C,0x5E,0x0D,0xD4,0x0D,0x4C,0x0E,0xC6,0x0E,0x42,0x0F,0xC0,0x0F
        .byte   0x40,0x10,0xC2,0x10,0x46,0x11,0xCC,0x11,0x54,0x12,0xDE,0x12,0x6A,0x13,0xF8,0x13
        .byte   0x88,0x14,0x1A,0x15,0xAE,0x15,0x44,0x16,0xDC,0x16,0x76,0x17,0x12,0x18,0xB0,0x18
        .byte   0x50,0x19,0xF2,0x19,0x96,0x1A,0x3C,0x1B,0xE4,0x1B,0x8E,0x1C,0x3A,0x1D,0xE8,0x1D
        .byte   0x98,0x1E,0x4A,0x1F,0xFE,0x1F,0xB4,0x20,0x6C,0x21,0x26,0x22,0xE2,0x22,0xA0,0x23
        .byte   0x60,0x24,0x22,0x25,0xE6,0x25,0xAC,0x26,0x74,0x27,0x3E,0x28,0x0A,0x29,0xD8,0x29
        .byte   0xA8,0x2A,0x7A,0x2B,0x4E,0x2C,0x24,0x2D,0xFC,0x2D,0xD6,0x2E,0xB2,0x2F,0x90,0x30
        .byte   0x70,0x31,0x52,0x32,0x36,0x33,0x1C,0x34,0x04,0x35,0xEE,0x35,0xDA,0x36,0xC8,0x37
        .byte   0xB8,0x38,0xAA,0x39,0x9E,0x3A,0x94,0x3B,0x8C,0x3C,0x86,0x3D,0x82,0x3E,0x80,0x3F
        .byte   0x80,0x40,0x82,0x41,0x86,0x42,0x8C,0x43,0x94,0x44,0x9E,0x45,0xAA,0x46,0xB8,0x47
        .byte   0xC8,0x48,0xDA,0x49,0xEE,0x4A,0x04,0x4C,0x1C,0x4D,0x36,0x4E,0x52,0x4F,0x70,0x50
        .byte   0x90,0x51,0xB2,0x52,0xD6,0x53,0xFC,0x54,0x24,0x56,0x4E,0x57,0x7A,0x58,0xA8,0x59
        .byte   0xD8,0x5A,0x0A,0x5C,0x3E,0x5D,0x74,0x5E,0xAC,0x5F,0xE6,0x60,0x22,0x62,0x60,0x63
        .byte   0xA0,0x64,0xE2,0x65,0x26,0x67,0x6C,0x68,0xB4,0x69,0xFE,0x6A,0x4A,0x6C,0x98,0x6D
        .byte   0xE8,0x6E,0x3A,0x70,0x8E,0x71,0xE4,0x72,0x3C,0x74,0x96,0x75,0xF2,0x76,0x50,0x78
        .byte   0xB0,0x79,0x12,0x7B,0x76,0x7C,0xDC,0x7D,0x44,0x7F,0xAE,0x80,0x1A,0x82,0x88,0x83
        .byte   0xF8,0x84,0x6A,0x86,0xDE,0x87,0x54,0x89,0xCC,0x8A,0x46,0x8C,0xC2,0x8D,0x40,0x8F
        .byte   0xC0,0x90,0x42,0x92,0xC6,0x93,0x4C,0x95,0xD4,0x96,0x5E,0x98,0xEA,0x99,0x78,0x9B
LAWE_sqrtb2:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x40,0x42,0x44,0x46,0x48,0x49,0x4B,0x4D,0x4E,0x50,0x52,0x53,0x55,0x56,0x58,0x59
        .byte   0x5B,0x5C,0x5D,0x5F,0x60,0x61,0x63,0x64,0x65,0x66,0x68,0x69,0x6A,0x6B,0x6D,0x6E
        .byte   0x6F,0x70,0x71,0x72,0x73,0x74,0x76,0x77,0x78,0x79,0x7A,0x7B,0x7C,0x7D,0x7E,0x7F
        .byte   0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8B,0x8C,0x8D,0x8E
        .byte   0x8F,0x90,0x91,0x92,0x93,0x94,0x94,0x95,0x96,0x97,0x98,0x99,0x99,0x9A,0x9B,0x9C
        .byte   0x9D,0x9E,0x9E,0x9F,0xA0,0xA1,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA6,0xA7,0xA8,0xA9
        .byte   0xA9,0xAA,0xAB,0xAC,0xAC,0xAD,0xAE,0xAF,0xAF,0xB0,0xB1,0xB1,0xB2,0xB3,0xB4,0xB4
        .byte   0xB5,0xB6,0xB6,0xB7,0xB8,0xB9,0xB9,0xBA,0xBB,0xBB,0xBC,0xBD,0xBD,0xBE,0xBF,0xBF
        .byte   0xC0,0xC1,0xC1,0xC2,0xC3,0xC3,0xC4,0xC5,0xC5,0xC6,0xC7,0xC7,0xC8,0xC8,0xC9,0xCA

