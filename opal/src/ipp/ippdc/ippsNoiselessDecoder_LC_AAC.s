        .text
        .align  4
        .globl  _ippsNoiselessDecoder_LC_AAC


_ippsNoiselessDecoder_LC_AAC:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r7, [sp, #0x94]
        ldr     r6, [sp, #0x98]
        ldr     r10, [sp, #0x9C]
        ldr     r11, [sp, #0xA0]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r9, r2
        mov     r8, r3
        beq     LGFY14
        cmp     r4, #0
        beq     LGFY14
        cmp     r8, #0
        beq     LGFY14
        cmp     r7, #0
        beq     LGFY14
        cmp     r6, #0
        beq     LGFY14
        cmp     r10, #0
        beq     LGFY14
        cmp     r11, #0
        beq     LGFY14
        ldr     r12, [r5]
        cmp     r12, #0
        beq     LGFY14
        ldr     r12, [r8, #0x30]
        cmp     r12, #0
        str     r12, [sp, #0x40]
        beq     LGFY14
        ldr     r12, [r4]
        cmp     r12, #0
        blt     LGFY11
        cmp     r12, #7
        bgt     LGFY11
        cmp     r9, #0
        blt     LGFY10
        cmp     r9, #1
        bgt     LGFY10
        ldr     r12, [r8, #8]
        cmp     r12, #0
        str     r12, [sp, #0x44]
        blt     LGFY9
        ldr     r12, [sp, #0x44]
        cmp     r12, #0xB
        bgt     LGFY9
        ldr     r12, [r8, #0xC]
        cmp     r12, #0
        str     r12, [sp, #0x30]
        beq     LGFY0
        mvn     r0, #0xA0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY0:
        mov     lr, #0
        str     lr, [sp, #0x68]
        str     lr, [sp, #0x6C]
        mov     r0, r5
        mov     r2, #8
        mov     r1, r4
        bl      ownsGetBits_AAC
        str     r0, [r8, #0x20]
        add     r12, r8, #0x38
        str     r12, [sp, #0x38]
        add     r12, r8, #0xB0
        str     r12, [sp, #0x34]
        add     r12, r8, #0x4A, 30
        str     r12, [sp, #0x3C]
        add     r12, r8, #0x52, 30
        str     r12, [sp, #0x2C]
        add     r12, r8, #0x5A, 30
        str     r12, [sp, #0x28]
        add     r12, r8, #0x62, 30
        str     r12, [sp, #0x24]
        add     r12, r8, #0x6A, 30
        str     r12, [sp, #0x20]
        add     r12, r8, #0x72, 30
        cmp     r9, #0
        str     r12, [sp, #0x1C]
        bne     LGFY1
        mov     r0, r5
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x40]
        mov     r1, r4
        bl      ownsUnpackIcsInfo_AAC
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
LGFY1:
        ldr     r12, [sp, #0x40]
        ldr     lr, [r12, #4]
        ldr     r12, [sp, #0x44]
        cmp     lr, #2
        mov     r12, r12, lsl #1
        beq     LGFY13
        ldr     r9, [pc, #0x2F8]
        ldr     r1, [sp, #0x44]
        ldr     lr, [pc, #0x2F4]
        sub     r9, r9, #0x30
        mov     r0, #1
        ldr     r1, [r9, +r1, lsl #2]
        mov     r9, #1, 22
        str     r1, [sp, #0x30]
LGFY2:
        ldrsh   r12, [lr, +r12]
        ldr     lr, [r8, #0x30]
        str     r0, [r8, #0x18]
        str     r12, [r8, #0x1C]
        ldr     lr, [lr, #0xC]
        cmp     lr, r12
        ble     LGFY3
        mvn     r0, #0xA1
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY3:
        str     r9, [r8, #0x14]
        str     r10, [sp, #0x10]
        ldr     r12, [sp, #0x3C]
        mov     r1, r4
        mov     r0, r5
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x34]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x38]
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x40]
        ldr     lr, [r12, #0x4C]
        str     lr, [sp]
        ldr     r3, [r12, #4]
        ldr     r2, [r12, #0xC]
        bl      ownsDecodeSectData_AAC
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
        ldr     r12, [sp, #0x34]
        mov     r2, r7
        mov     r1, r4
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x38]
        mov     r0, r5
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x3C]
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x40]
        ldr     r12, [r12, #0x4C]
        str     r12, [sp]
        ldr     r3, [r8, #0x20]
        bl      ownsDecodeScalefactor_AAC_1u16s
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        ldr     r12, [sp, #0x40]
        ldr     r12, [r12, #4]
        str     r0, [sp, #0x18]
        cmp     r12, #2
        beq     LGFY12
LGFY4:
        ldr     r12, [sp, #0x18]
        cmp     r12, #0
        str     r12, [r8, #0x24]
        beq     LGFY5
        add     lr, sp, #0x58
        add     r12, sp, #0x48
        add     r3, sp, #0x6C
        add     r2, sp, #0x68
        str     lr, [sp, #4]
        str     r12, [sp]
        mov     r0, r5
        mov     r1, r4
        bl      ownsDecodePulseData_AAC
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
        ldr     r12, [sp, #0x6C]
        ldr     lr, [r8, #0x1C]
        cmp     r12, lr
        blt     LGFY5
        mvn     r0, #0x9F
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY5:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        mov     r12, #0
        cmp     r0, #0
        str     r0, [r8, #0x28]
        str     r12, [r8, #0x148]
        beq     LGFY6
        str     r11, [sp, #0x10]
        ldr     r12, [sp, #0x1C]
        mov     r0, r5
        mov     r1, r4
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x20]
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x24]
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x28]
        str     r12, [sp]
        ldr     r12, [sp, #0x40]
        ldr     r3, [sp, #0x2C]
        ldr     r2, [r12, #4]
        bl      ownsDecodeTnsData_AAC
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
LGFY6:
        mov     r0, r5
        mov     r1, r4
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r8, #0x2C]
        beq     LGFY7
        mvn     r0, #0x9E
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY7:
        ldr     r3, [sp, #0x44]
        mov     r0, r5
        mov     r1, r4
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x34]
        mov     r2, r6
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x38]
        str     r3, [sp, #8]
        ldr     r3, [sp, #0x3C]
        str     r9, [sp, #0x14]
        str     r3, [sp, #4]
        ldr     r12, [sp, #0x40]
        add     r3, r12, #0x50
        str     r3, [sp]
        ldr     r3, [r12, #0x4C]
        bl      ownsDecodeSpectralData_AAC_1u32s
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
        ldr     r1, [sp, #0x40]
        ldr     r1, [r1, #4]
        cmp     r1, #2
        beq     LGFY8
        ldr     r1, [sp, #0x18]
        cmp     r1, #0
        beq     LGFY8
        str     r9, [sp, #8]
        ldr     r3, [sp, #0x30]
        add     r1, sp, #0x58
        str     r1, [sp]
        str     r3, [sp, #4]
        ldr     r2, [sp, #0x6C]
        ldr     r1, [sp, #0x68]
        add     r3, sp, #0x48
        mov     r0, r6
        bl      ownsAddPulseData_AAC
        cmp     r0, #0
        addne   sp, sp, #0x70
        ldmneia sp!, {r4 - r11, pc}
LGFY8:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY9:
        mvn     r0, #0x92
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY10:
        mvn     r0, #0x8E
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY11:
        mvn     r0, #0x94
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY12:
        ldr     r12, [sp, #0x18]
        cmp     r12, #0
        beq     LGFY4
        mvn     r0, #0x9F
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LGFY13:
        ldr     r1, [sp, #0x44]
        ldr     r9, [pc, #0x20]
        ldr     lr, [pc, #0x24]
        mov     r0, #8
        ldr     r1, [r9, +r1, lsl #2]
        mov     r9, #0x80
        str     r1, [sp, #0x30]
        b       LGFY2
LGFY14:
        mvn     r0, #7
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
        .long   LGFY__pAACSwbOffsetTableShort
        .long   LGFY__pAACNumSwbTableLong
        .long   LGFY__pAACNumSwbTableShort


        .data
        .align  4


LGFY__pSwbOffsetLong96000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x2C,0x00,0x30,0x00,0x34,0x00,0x38,0x00,0x40,0x00
        .byte   0x48,0x00,0x50,0x00,0x58,0x00,0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00
        .byte   0x9C,0x00,0xAC,0x00,0xBC,0x00,0xD4,0x00,0xF0,0x00,0x14,0x01,0x40,0x01,0x80,0x01
        .byte   0xC0,0x01,0x00,0x02,0x40,0x02,0x80,0x02,0xC0,0x02,0x00,0x03,0x40,0x03,0x80,0x03
        .byte   0xC0,0x03,0x00,0x04
LGFY__pSwbOffsetLong64000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x2C,0x00,0x30,0x00,0x34,0x00,0x38,0x00,0x40,0x00
        .byte   0x48,0x00,0x50,0x00,0x58,0x00,0x64,0x00,0x70,0x00,0x7C,0x00,0x8C,0x00,0x9C,0x00
        .byte   0xAC,0x00,0xC0,0x00,0xD8,0x00,0xF0,0x00,0x0C,0x01,0x30,0x01,0x58,0x01,0x80,0x01
        .byte   0xA8,0x01,0xD0,0x01,0xF8,0x01,0x20,0x02,0x48,0x02,0x70,0x02,0x98,0x02,0xC0,0x02
        .byte   0xE8,0x02,0x10,0x03,0x38,0x03,0x60,0x03,0x88,0x03,0xB0,0x03,0xD8,0x03,0x00,0x04
LGFY__pSwbOffsetLong48000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x30,0x00,0x38,0x00,0x40,0x00,0x48,0x00,0x50,0x00
        .byte   0x58,0x00,0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00,0xA0,0x00,0xB0,0x00
        .byte   0xC4,0x00,0xD8,0x00,0xF0,0x00,0x08,0x01,0x24,0x01,0x40,0x01,0x60,0x01,0x80,0x01
        .byte   0xA0,0x01,0xC0,0x01,0xE0,0x01,0x00,0x02,0x20,0x02,0x40,0x02,0x60,0x02,0x80,0x02
        .byte   0xA0,0x02,0xC0,0x02,0xE0,0x02,0x00,0x03,0x20,0x03,0x40,0x03,0x60,0x03,0x80,0x03
        .byte   0xA0,0x03,0x00,0x04
LGFY__pSwbOffsetLong32000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x30,0x00,0x38,0x00,0x40,0x00,0x48,0x00,0x50,0x00
        .byte   0x58,0x00,0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00,0xA0,0x00,0xB0,0x00
        .byte   0xC4,0x00,0xD8,0x00,0xF0,0x00,0x08,0x01,0x24,0x01,0x40,0x01,0x60,0x01,0x80,0x01
        .byte   0xA0,0x01,0xC0,0x01,0xE0,0x01,0x00,0x02,0x20,0x02,0x40,0x02,0x60,0x02,0x80,0x02
        .byte   0xA0,0x02,0xC0,0x02,0xE0,0x02,0x00,0x03,0x20,0x03,0x40,0x03,0x60,0x03,0x80,0x03
        .byte   0xA0,0x03,0xC0,0x03,0xE0,0x03,0x00,0x04
LGFY__pSwbOffsetLong24000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x2C,0x00,0x34,0x00,0x3C,0x00,0x44,0x00,0x4C,0x00
        .byte   0x54,0x00,0x5C,0x00,0x64,0x00,0x6C,0x00,0x74,0x00,0x7C,0x00,0x88,0x00,0x94,0x00
        .byte   0xA0,0x00,0xAC,0x00,0xBC,0x00,0xCC,0x00,0xDC,0x00,0xF0,0x00,0x04,0x01,0x1C,0x01
        .byte   0x34,0x01,0x50,0x01,0x6C,0x01,0x8C,0x01,0xB0,0x01,0xD4,0x01,0xFC,0x01,0x28,0x02
        .byte   0x58,0x02,0x8C,0x02,0xC0,0x02,0x00,0x03,0x40,0x03,0x80,0x03,0xC0,0x03,0x00,0x04
LGFY__pSwbOffsetLong16000:
        .byte   0x00,0x00,0x08,0x00,0x10,0x00,0x18,0x00,0x20,0x00,0x28,0x00,0x30,0x00,0x38,0x00
        .byte   0x40,0x00,0x48,0x00,0x50,0x00,0x58,0x00,0x64,0x00,0x70,0x00,0x7C,0x00,0x88,0x00
        .byte   0x94,0x00,0xA0,0x00,0xAC,0x00,0xB8,0x00,0xC4,0x00,0xD4,0x00,0xE4,0x00,0xF4,0x00
        .byte   0x04,0x01,0x18,0x01,0x2C,0x01,0x40,0x01,0x58,0x01,0x70,0x01,0x8C,0x01,0xA8,0x01
        .byte   0xC8,0x01,0xEC,0x01,0x14,0x02,0x3C,0x02,0x68,0x02,0x98,0x02,0xCC,0x02,0x04,0x03
        .byte   0x40,0x03,0x80,0x03,0xC0,0x03,0x00,0x04
LGFY__pSwbOffsetLong8000:
        .byte   0x00,0x00,0x0C,0x00,0x18,0x00,0x24,0x00,0x30,0x00,0x3C,0x00,0x48,0x00,0x54,0x00
        .byte   0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00,0x9C,0x00,0xAC,0x00,0xBC,0x00
        .byte   0xCC,0x00,0xDC,0x00,0xEC,0x00,0xFC,0x00,0x0C,0x01,0x20,0x01,0x34,0x01,0x48,0x01
        .byte   0x5C,0x01,0x74,0x01,0x8C,0x01,0xA4,0x01,0xC0,0x01,0xDC,0x01,0xFC,0x01,0x20,0x02
        .byte   0x44,0x02,0x6C,0x02,0x98,0x02,0xC8,0x02,0xFC,0x02,0x34,0x03,0x70,0x03,0xB0,0x03
        .byte   0x00,0x04,0x00,0x00
LGFY__pAACNumSwbTableLong:
        .byte   0x29,0x00,0x29,0x00,0x2F,0x00,0x31,0x00,0x31,0x00,0x33,0x00,0x2F,0x00,0x2F,0x00
        .byte   0x2B,0x00,0x2B,0x00,0x2B,0x00,0x28,0x00
LGFY__pSwbOffsetShort96000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x20,0x00
        .byte   0x28,0x00,0x30,0x00,0x40,0x00,0x5C,0x00,0x80,0x00,0x00,0x00
LGFY__pSwbOffsetShort64000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x20,0x00
        .byte   0x28,0x00,0x30,0x00,0x40,0x00,0x5C,0x00,0x80,0x00,0x00,0x00
LGFY__pSwbOffsetShort48000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x1C,0x00,0x24,0x00
        .byte   0x2C,0x00,0x38,0x00,0x44,0x00,0x50,0x00,0x60,0x00,0x70,0x00,0x80,0x00,0x00,0x00
LGFY__pSwbOffsetShort24000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x24,0x00,0x2C,0x00,0x34,0x00,0x40,0x00,0x4C,0x00,0x5C,0x00,0x6C,0x00,0x80,0x00
LGFY__pSwbOffsetShort16000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x28,0x00,0x30,0x00,0x3C,0x00,0x48,0x00,0x58,0x00,0x6C,0x00,0x80,0x00
LGFY__pSwbOffsetShort8000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x24,0x00,0x2C,0x00,0x34,0x00,0x3C,0x00,0x48,0x00,0x58,0x00,0x6C,0x00,0x80,0x00
LGFY__pAACNumSwbTableShort:
        .byte   0x0C,0x00,0x0C,0x00,0x0C,0x00,0x0E,0x00,0x0E,0x00,0x0E,0x00,0x0F,0x00,0x0F,0x00
        .byte   0x0F,0x00,0x0F,0x00,0x0F,0x00,0x0F,0x00


        .data
        .align  4


LGFY__pAACSwbOffsetTableLong:
        .long   LGFY__pSwbOffsetLong96000
        .long   LGFY__pSwbOffsetLong96000
        .long   LGFY__pSwbOffsetLong64000
        .long   LGFY__pSwbOffsetLong48000
        .long   LGFY__pSwbOffsetLong48000
        .long   LGFY__pSwbOffsetLong32000
        .long   LGFY__pSwbOffsetLong24000
        .long   LGFY__pSwbOffsetLong24000
        .long   LGFY__pSwbOffsetLong16000
        .long   LGFY__pSwbOffsetLong16000
        .long   LGFY__pSwbOffsetLong16000
        .long   LGFY__pSwbOffsetLong8000
LGFY__pAACSwbOffsetTableShort:
        .long   LGFY__pSwbOffsetShort96000
        .long   LGFY__pSwbOffsetShort96000
        .long   LGFY__pSwbOffsetShort64000
        .long   LGFY__pSwbOffsetShort48000
        .long   LGFY__pSwbOffsetShort48000
        .long   LGFY__pSwbOffsetShort48000
        .long   LGFY__pSwbOffsetShort24000
        .long   LGFY__pSwbOffsetShort24000
        .long   LGFY__pSwbOffsetShort16000
        .long   LGFY__pSwbOffsetShort16000
        .long   LGFY__pSwbOffsetShort16000
        .long   LGFY__pSwbOffsetShort8000


