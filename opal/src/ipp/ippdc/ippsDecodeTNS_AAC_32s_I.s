        .text
        .align  4
        .globl  _ippsDecodeTNS_AAC_32s_I


_ippsDecodeTNS_AAC_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x90
        ldr     r10, [sp, #0xB4]
        ldr     r9, [sp, #0xB8]
        ldr     r8, [sp, #0xBC]
        ldr     lr, [sp, #0xC0]
        ldr     r12, [sp, #0xC8]
        ldr     r6, [sp, #0xCC]
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LGFW29
        cmp     r1, #0
        beq     LGFW29
        cmp     r5, #0
        beq     LGFW29
        cmp     r4, #0
        beq     LGFW29
        cmp     r10, #0
        beq     LGFW29
        cmp     r9, #0
        beq     LGFW29
        cmp     r8, #0
        beq     LGFW29
        cmp     r6, #0x80
        beq     LGFW0
        cmp     r6, #1, 22
        beq     LGFW0
        mvn     r0, #0x91
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW0:
        cmp     r12, #0
        blt     LGFW15
        cmp     r12, #0xB
        bgt     LGFW15
        cmp     lr, #0
        blt     LGFW14
        cmp     lr, #0x33
        bgt     LGFW14
        cmp     r6, #1, 22
        mov     r11, r12, lsl #1
        beq     LGFW25
        ldr     r7, [pc, #0x330]
        ldr     r3, [pc, #0x330]
        sub     r2, r7, #0x30
        mov     r7, #8
LGFW1:
        ldrsh   r11, [r3, +r11]
        ldr     r2, [r2, +r12, lsl #2]
        cmp     lr, r11
        str     r2, [sp, #0x34]
        bgt     LGFW14
        cmp     r6, #0x80
        moveq   r2, #1
        moveq   r6, #7
        movne   r2, #0
        movne   r6, #0xC
        ldr     r3, [pc, #0x300]
        cmp     r7, #0
        add     r12, r3, r12, lsl #3
        ldr     r2, [r12, +r2, lsl #2]
        str     r2, [sp, #0x30]
        ble     LGFW13
        mov     r12, #0x1A
        str     r12, [sp, #0x8C]
        mov     r2, #0
        mov     r3, r2
        mov     r12, r1
        str     lr, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x18]
        str     r1, [sp, #0x14]
LGFW2:
        ldr     r1, [r12], #4
        mov     r8, r11
        cmp     r1, #0
        blt     LGFW24
        cmp     r7, #8
        beq     LGFW23
        cmp     r7, #1
        beq     LGFW21
LGFW3:
        cmp     r1, #0
        ble     LGFW11
LGFW4:
        mov     r9, #0
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #0x20]
        str     r11, [sp, #0x2C]
        str     r0, [sp, #0x10]
LGFW5:
        ldr     r12, [r5]
        mov     r11, r8
        cmp     r12, #0
        blt     LGFW20
        ldr     r0, [sp, #0x2C]
        cmp     r12, r0
        bgt     LGFW19
        sub     r8, r8, r12
        cmp     r8, #0
        movle   r8, #0
        ldr     r10, [r4]
        add     r5, r5, #4
        cmp     r10, #0
        blt     LGFW18
        cmp     r7, #8
        beq     LGFW17
        cmp     r7, #1
        beq     LGFW16
LGFW6:
        cmp     r10, r6
        movge   r10, r6
        cmp     r10, #0
        add     r4, r4, #4
        beq     LGFW10
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        ldr     r3, [r0, +r1, lsl #2]
        cmp     r3, #3
        beq     LGFW7
        cmp     r3, #4
        bne     LGFW26
LGFW7:
        ldr     r0, [sp, #0x28]
        add     r12, sp, #0x8C
        add     r1, sp, #0x38
        str     r12, [sp]
        mov     r2, r10
        bl      ownsTnsDecodeCoef
        cmp     r0, #0
        bne     LGFW28
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x30]
        cmp     r0, r1
        ldr     r0, [sp, #0x28]
        add     r0, r0, r10
        str     r0, [sp, #0x28]
        ldrge   r0, [sp, #0x30]
        ldrlt   r0, [sp, #0x1C]
        cmp     r0, r8
        mov     r1, r8
        ldr     r12, [sp, #0x34]
        movlt   r1, r0
        cmp     r0, r11
        movlt   r11, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r12, +r1]
        mov     r11, r11, lsl #1
        ldr     r0, [r0]
        ldrsh   r12, [r12, +r11]
        cmp     r0, #0
        sub     r2, r12, r1
        beq     LGFW8
        cmp     r0, #1
        bne     LGFW27
LGFW8:
        ldr     lr, [sp, #0x24]
        ldr     r0, [lr], #4
        str     lr, [sp, #0x24]
        cmp     r0, #0
        moveq   r3, #1
        subne   r1, r12, #1
        mvnne   r3, #0
        cmp     r2, #0
        bgt     LGFW9
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        ldr     r1, [r0, +r1, lsl #2]
        b       LGFW10
LGFW9:
        ldr     r0, [sp, #0x8C]
        str     r10, [sp]
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x10]
        add     r0, r0, r1, lsl #2
        add     r1, sp, #0x38
        bl      ownsTnsArFilter
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        ldr     r1, [r0, +r1, lsl #2]
LGFW10:
        add     r9, r9, #1
        cmp     r9, r1
        blt     LGFW5
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #0x20]
        ldr     r11, [sp, #0x2C]
        ldr     r0, [sp, #0x10]
LGFW11:
        cmp     r7, #8
        addeq   r0, r0, #2, 24
LGFW12:
        add     r3, r3, #1
        cmp     r3, r7
        add     r2, r2, #1
        blt     LGFW2
LGFW13:
        mov     r0, #0
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW14:
        mvn     r0, #0xA1
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW15:
        mvn     r0, #0x92
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW16:
        cmp     r10, #0xC
        ble     LGFW6
        mvn     r0, #0x9A
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW17:
        cmp     r10, #7
        ble     LGFW6
        mvn     r0, #0x9A
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW18:
        mvn     r0, #0x9A
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW19:
        mvn     r0, #0x9B
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW20:
        mvn     r0, #0x9B
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW21:
        cmp     r1, #3
        bgt     LGFW22
        cmp     r1, #0
        bgt     LGFW4
        b       LGFW12
LGFW22:
        mvn     r0, #0x9C
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW23:
        cmp     r1, #1
        ble     LGFW3
        mvn     r0, #0x9C
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW24:
        mvn     r0, #0x9C
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW25:
        ldr     r3, [pc, #0x44]
        ldr     r2, [pc, #0x34]
        mov     r7, #1
        b       LGFW1
LGFW26:
        mvn     r0, #0x99
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW27:
        mvn     r0, #0x97
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW28:
        mvn     r0, #0x98
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
LGFW29:
        mvn     r0, #7
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
        .long   LGFW__pAACSwbOffsetTableLong
        .long   LGFW__pAACNumSwbTableShort
        .long   LGFW__pAACTnsMaxBandTable
        .long   LGFW__pAACNumSwbTableLong


        .data
        .align  4


LGFW__pAACNumSwbTableShort:
        .byte   0x0C,0x00,0x0C,0x00,0x0C,0x00,0x0E,0x00,0x0E,0x00,0x0E,0x00,0x0F,0x00,0x0F,0x00
        .byte   0x0F,0x00,0x0F,0x00,0x0F,0x00,0x0F,0x00
LGFW__pSwbOffsetShort96000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x20,0x00
        .byte   0x28,0x00,0x30,0x00,0x40,0x00,0x5C,0x00,0x80,0x00,0x00,0x00
LGFW__pSwbOffsetShort64000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x20,0x00
        .byte   0x28,0x00,0x30,0x00,0x40,0x00,0x5C,0x00,0x80,0x00,0x00,0x00
LGFW__pSwbOffsetShort48000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x1C,0x00,0x24,0x00
        .byte   0x2C,0x00,0x38,0x00,0x44,0x00,0x50,0x00,0x60,0x00,0x70,0x00,0x80,0x00,0x00,0x00
LGFW__pSwbOffsetShort24000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x24,0x00,0x2C,0x00,0x34,0x00,0x40,0x00,0x4C,0x00,0x5C,0x00,0x6C,0x00,0x80,0x00
LGFW__pSwbOffsetShort16000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x28,0x00,0x30,0x00,0x3C,0x00,0x48,0x00,0x58,0x00,0x6C,0x00,0x80,0x00
LGFW__pSwbOffsetShort8000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x24,0x00,0x2C,0x00,0x34,0x00,0x3C,0x00,0x48,0x00,0x58,0x00,0x6C,0x00,0x80,0x00
LGFW__pAACNumSwbTableLong:
        .byte   0x29,0x00,0x29,0x00,0x2F,0x00,0x31,0x00,0x31,0x00,0x33,0x00,0x2F,0x00,0x2F,0x00
        .byte   0x2B,0x00,0x2B,0x00,0x2B,0x00,0x28,0x00
LGFW__pSwbOffsetLong96000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x2C,0x00,0x30,0x00,0x34,0x00,0x38,0x00,0x40,0x00
        .byte   0x48,0x00,0x50,0x00,0x58,0x00,0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00
        .byte   0x9C,0x00,0xAC,0x00,0xBC,0x00,0xD4,0x00,0xF0,0x00,0x14,0x01,0x40,0x01,0x80,0x01
        .byte   0xC0,0x01,0x00,0x02,0x40,0x02,0x80,0x02,0xC0,0x02,0x00,0x03,0x40,0x03,0x80,0x03
        .byte   0xC0,0x03,0x00,0x04
LGFW__pSwbOffsetLong64000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x2C,0x00,0x30,0x00,0x34,0x00,0x38,0x00,0x40,0x00
        .byte   0x48,0x00,0x50,0x00,0x58,0x00,0x64,0x00,0x70,0x00,0x7C,0x00,0x8C,0x00,0x9C,0x00
        .byte   0xAC,0x00,0xC0,0x00,0xD8,0x00,0xF0,0x00,0x0C,0x01,0x30,0x01,0x58,0x01,0x80,0x01
        .byte   0xA8,0x01,0xD0,0x01,0xF8,0x01,0x20,0x02,0x48,0x02,0x70,0x02,0x98,0x02,0xC0,0x02
        .byte   0xE8,0x02,0x10,0x03,0x38,0x03,0x60,0x03,0x88,0x03,0xB0,0x03,0xD8,0x03,0x00,0x04
LGFW__pSwbOffsetLong48000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x30,0x00,0x38,0x00,0x40,0x00,0x48,0x00,0x50,0x00
        .byte   0x58,0x00,0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00,0xA0,0x00,0xB0,0x00
        .byte   0xC4,0x00,0xD8,0x00,0xF0,0x00,0x08,0x01,0x24,0x01,0x40,0x01,0x60,0x01,0x80,0x01
        .byte   0xA0,0x01,0xC0,0x01,0xE0,0x01,0x00,0x02,0x20,0x02,0x40,0x02,0x60,0x02,0x80,0x02
        .byte   0xA0,0x02,0xC0,0x02,0xE0,0x02,0x00,0x03,0x20,0x03,0x40,0x03,0x60,0x03,0x80,0x03
        .byte   0xA0,0x03,0x00,0x04
LGFW__pSwbOffsetLong32000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x30,0x00,0x38,0x00,0x40,0x00,0x48,0x00,0x50,0x00
        .byte   0x58,0x00,0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00,0xA0,0x00,0xB0,0x00
        .byte   0xC4,0x00,0xD8,0x00,0xF0,0x00,0x08,0x01,0x24,0x01,0x40,0x01,0x60,0x01,0x80,0x01
        .byte   0xA0,0x01,0xC0,0x01,0xE0,0x01,0x00,0x02,0x20,0x02,0x40,0x02,0x60,0x02,0x80,0x02
        .byte   0xA0,0x02,0xC0,0x02,0xE0,0x02,0x00,0x03,0x20,0x03,0x40,0x03,0x60,0x03,0x80,0x03
        .byte   0xA0,0x03,0xC0,0x03,0xE0,0x03,0x00,0x04
LGFW__pSwbOffsetLong24000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x24,0x00,0x28,0x00,0x2C,0x00,0x34,0x00,0x3C,0x00,0x44,0x00,0x4C,0x00
        .byte   0x54,0x00,0x5C,0x00,0x64,0x00,0x6C,0x00,0x74,0x00,0x7C,0x00,0x88,0x00,0x94,0x00
        .byte   0xA0,0x00,0xAC,0x00,0xBC,0x00,0xCC,0x00,0xDC,0x00,0xF0,0x00,0x04,0x01,0x1C,0x01
        .byte   0x34,0x01,0x50,0x01,0x6C,0x01,0x8C,0x01,0xB0,0x01,0xD4,0x01,0xFC,0x01,0x28,0x02
        .byte   0x58,0x02,0x8C,0x02,0xC0,0x02,0x00,0x03,0x40,0x03,0x80,0x03,0xC0,0x03,0x00,0x04
LGFW__pSwbOffsetLong16000:
        .byte   0x00,0x00,0x08,0x00,0x10,0x00,0x18,0x00,0x20,0x00,0x28,0x00,0x30,0x00,0x38,0x00
        .byte   0x40,0x00,0x48,0x00,0x50,0x00,0x58,0x00,0x64,0x00,0x70,0x00,0x7C,0x00,0x88,0x00
        .byte   0x94,0x00,0xA0,0x00,0xAC,0x00,0xB8,0x00,0xC4,0x00,0xD4,0x00,0xE4,0x00,0xF4,0x00
        .byte   0x04,0x01,0x18,0x01,0x2C,0x01,0x40,0x01,0x58,0x01,0x70,0x01,0x8C,0x01,0xA8,0x01
        .byte   0xC8,0x01,0xEC,0x01,0x14,0x02,0x3C,0x02,0x68,0x02,0x98,0x02,0xCC,0x02,0x04,0x03
        .byte   0x40,0x03,0x80,0x03,0xC0,0x03,0x00,0x04
LGFW__pSwbOffsetLong8000:
        .byte   0x00,0x00,0x0C,0x00,0x18,0x00,0x24,0x00,0x30,0x00,0x3C,0x00,0x48,0x00,0x54,0x00
        .byte   0x60,0x00,0x6C,0x00,0x78,0x00,0x84,0x00,0x90,0x00,0x9C,0x00,0xAC,0x00,0xBC,0x00
        .byte   0xCC,0x00,0xDC,0x00,0xEC,0x00,0xFC,0x00,0x0C,0x01,0x20,0x01,0x34,0x01,0x48,0x01
        .byte   0x5C,0x01,0x74,0x01,0x8C,0x01,0xA4,0x01,0xC0,0x01,0xDC,0x01,0xFC,0x01,0x20,0x02
        .byte   0x44,0x02,0x6C,0x02,0x98,0x02,0xC8,0x02,0xFC,0x02,0x34,0x03,0x70,0x03,0xB0,0x03
        .byte   0x00,0x04,0x00,0x00
LGFW__pAACTnsMaxBandTable:
        .byte   0x1F,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x22,0x00,0x00,0x00,0x0A,0x00,0x00,0x00,0x28,0x00,0x00,0x00,0x0E,0x00,0x00,0x00
        .byte   0x2A,0x00,0x00,0x00,0x0E,0x00,0x00,0x00,0x33,0x00,0x00,0x00,0x0E,0x00,0x00,0x00
        .byte   0x2E,0x00,0x00,0x00,0x0E,0x00,0x00,0x00,0x2E,0x00,0x00,0x00,0x0E,0x00,0x00,0x00
        .byte   0x2A,0x00,0x00,0x00,0x0E,0x00,0x00,0x00,0x2A,0x00,0x00,0x00,0x0E,0x00,0x00,0x00
        .byte   0x2A,0x00,0x00,0x00,0x0E,0x00,0x00,0x00,0x27,0x00,0x00,0x00,0x0E,0x00,0x00,0x00


        .data
        .align  4


LGFW__pAACSwbOffsetTableShort:
        .long   LGFW__pSwbOffsetShort96000
        .long   LGFW__pSwbOffsetShort96000
        .long   LGFW__pSwbOffsetShort64000
        .long   LGFW__pSwbOffsetShort48000
        .long   LGFW__pSwbOffsetShort48000
        .long   LGFW__pSwbOffsetShort48000
        .long   LGFW__pSwbOffsetShort24000
        .long   LGFW__pSwbOffsetShort24000
        .long   LGFW__pSwbOffsetShort16000
        .long   LGFW__pSwbOffsetShort16000
        .long   LGFW__pSwbOffsetShort16000
        .long   LGFW__pSwbOffsetShort8000
LGFW__pAACSwbOffsetTableLong:
        .long   LGFW__pSwbOffsetLong96000
        .long   LGFW__pSwbOffsetLong96000
        .long   LGFW__pSwbOffsetLong64000
        .long   LGFW__pSwbOffsetLong48000
        .long   LGFW__pSwbOffsetLong48000
        .long   LGFW__pSwbOffsetLong32000
        .long   LGFW__pSwbOffsetLong24000
        .long   LGFW__pSwbOffsetLong24000
        .long   LGFW__pSwbOffsetLong16000
        .long   LGFW__pSwbOffsetLong16000
        .long   LGFW__pSwbOffsetLong16000
        .long   LGFW__pSwbOffsetLong8000


