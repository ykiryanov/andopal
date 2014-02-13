        .text
        .align  4
        .globl  _ippsConvert_8s32f


_ippsConvert_8s32f:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LCWG6
        cmp     r1, #0
        beq     LCWG6
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        ldr     r8, [pc, #0x110]
        cmp     r2, #4
        mov     r12, #0
        blt     LCWG1
        ldr     r7, [r8]
        mov     r6, #4
        add     r5, r1, #4
        add     r4, r1, #8
        add     lr, r1, #0xC
LCWG0:
        ldrsb   r3, [r12, +r0]
        add     r11, r0, r12
        ldrsb   r9, [r11, #1]
        ldrsb   r10, [r11, #2]
        ldr     r3, [r7, +r3, lsl #2]
        ldrsb   r11, [r11, #3]
        str     r3, [r1, +r12, lsl #2]
        ldr     r9, [r7, +r9, lsl #2]
        str     r9, [r5, +r12, lsl #2]
        ldr     r10, [r7, +r10, lsl #2]
        str     r10, [r4, +r12, lsl #2]
        ldr     r11, [r7, +r11, lsl #2]
        str     r11, [lr, +r12, lsl #2]
        mov     r12, r6
        add     r6, r6, #4
        cmp     r2, r6
        bge     LCWG0
LCWG1:
        cmp     r12, r2
        bge     LCWG5
        sub     r3, r2, r12
        cmp     r3, #6
        ldrlt   r8, [r8]
        blt     LCWG3
        ldr     r8, [r8]
        mov     r3, r12, lsl #2
        add     r3, r3, #4
        sub     lr, r12, #1
        add     lr, lr, r0
        add     r3, r3, r1
        sub     r4, r2, #6
LCWG2:
        ldrsb   r5, [lr, #1]
        add     r12, r12, #5
        cmp     r12, r4
        ldr     r5, [r8, +r5, lsl #2]
        str     r5, [r3, #-4]
        ldrsb   r5, [lr, #2]
        ldr     r5, [r8, +r5, lsl #2]
        str     r5, [r3]
        ldrsb   r5, [lr, #3]
        ldr     r5, [r8, +r5, lsl #2]
        str     r5, [r3, #4]
        ldrsb   r5, [lr, #4]
        ldr     r5, [r8, +r5, lsl #2]
        str     r5, [r3, #8]
        ldrsb   r5, [lr, #5]!
        ldr     r5, [r8, +r5, lsl #2]
        str     r5, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LCWG2
LCWG3:
        add     r0, r12, r0
        add     r1, r1, r12, lsl #2
LCWG4:
        ldrsb   r3, [r0], #1
        add     r12, r12, #1
        ldr     r3, [r8, +r3, lsl #2]
        cmp     r12, r2
        str     r3, [r1], #4
        blt     LCWG4
LCWG5:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LCWG6:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   LCWG_owntablIntToFloat


        .data
        .align  4


LCWG_owntablIntToFloat:
        .long   LCWG_own_tablIntToFloat
LCWG_own_tablIntToFloat:
        .byte   0x00,0x00,0x00,0xC3,0x00,0x00,0xFE,0xC2,0x00,0x00,0xFC,0xC2,0x00,0x00,0xFA,0xC2
        .byte   0x00,0x00,0xF8,0xC2,0x00,0x00,0xF6,0xC2,0x00,0x00,0xF4,0xC2,0x00,0x00,0xF2,0xC2
        .byte   0x00,0x00,0xF0,0xC2,0x00,0x00,0xEE,0xC2,0x00,0x00,0xEC,0xC2,0x00,0x00,0xEA,0xC2
        .byte   0x00,0x00,0xE8,0xC2,0x00,0x00,0xE6,0xC2,0x00,0x00,0xE4,0xC2,0x00,0x00,0xE2,0xC2
        .byte   0x00,0x00,0xE0,0xC2,0x00,0x00,0xDE,0xC2,0x00,0x00,0xDC,0xC2,0x00,0x00,0xDA,0xC2
        .byte   0x00,0x00,0xD8,0xC2,0x00,0x00,0xD6,0xC2,0x00,0x00,0xD4,0xC2,0x00,0x00,0xD2,0xC2
        .byte   0x00,0x00,0xD0,0xC2,0x00,0x00,0xCE,0xC2,0x00,0x00,0xCC,0xC2,0x00,0x00,0xCA,0xC2
        .byte   0x00,0x00,0xC8,0xC2,0x00,0x00,0xC6,0xC2,0x00,0x00,0xC4,0xC2,0x00,0x00,0xC2,0xC2
        .byte   0x00,0x00,0xC0,0xC2,0x00,0x00,0xBE,0xC2,0x00,0x00,0xBC,0xC2,0x00,0x00,0xBA,0xC2
        .byte   0x00,0x00,0xB8,0xC2,0x00,0x00,0xB6,0xC2,0x00,0x00,0xB4,0xC2,0x00,0x00,0xB2,0xC2
        .byte   0x00,0x00,0xB0,0xC2,0x00,0x00,0xAE,0xC2,0x00,0x00,0xAC,0xC2,0x00,0x00,0xAA,0xC2
        .byte   0x00,0x00,0xA8,0xC2,0x00,0x00,0xA6,0xC2,0x00,0x00,0xA4,0xC2,0x00,0x00,0xA2,0xC2
        .byte   0x00,0x00,0xA0,0xC2,0x00,0x00,0x9E,0xC2,0x00,0x00,0x9C,0xC2,0x00,0x00,0x9A,0xC2
        .byte   0x00,0x00,0x98,0xC2,0x00,0x00,0x96,0xC2,0x00,0x00,0x94,0xC2,0x00,0x00,0x92,0xC2
        .byte   0x00,0x00,0x90,0xC2,0x00,0x00,0x8E,0xC2,0x00,0x00,0x8C,0xC2,0x00,0x00,0x8A,0xC2
        .byte   0x00,0x00,0x88,0xC2,0x00,0x00,0x86,0xC2,0x00,0x00,0x84,0xC2,0x00,0x00,0x82,0xC2
        .byte   0x00,0x00,0x80,0xC2,0x00,0x00,0x7C,0xC2,0x00,0x00,0x78,0xC2,0x00,0x00,0x74,0xC2
        .byte   0x00,0x00,0x70,0xC2,0x00,0x00,0x6C,0xC2,0x00,0x00,0x68,0xC2,0x00,0x00,0x64,0xC2
        .byte   0x00,0x00,0x60,0xC2,0x00,0x00,0x5C,0xC2,0x00,0x00,0x58,0xC2,0x00,0x00,0x54,0xC2
        .byte   0x00,0x00,0x50,0xC2,0x00,0x00,0x4C,0xC2,0x00,0x00,0x48,0xC2,0x00,0x00,0x44,0xC2
        .byte   0x00,0x00,0x40,0xC2,0x00,0x00,0x3C,0xC2,0x00,0x00,0x38,0xC2,0x00,0x00,0x34,0xC2
        .byte   0x00,0x00,0x30,0xC2,0x00,0x00,0x2C,0xC2,0x00,0x00,0x28,0xC2,0x00,0x00,0x24,0xC2
        .byte   0x00,0x00,0x20,0xC2,0x00,0x00,0x1C,0xC2,0x00,0x00,0x18,0xC2,0x00,0x00,0x14,0xC2
        .byte   0x00,0x00,0x10,0xC2,0x00,0x00,0x0C,0xC2,0x00,0x00,0x08,0xC2,0x00,0x00,0x04,0xC2
        .byte   0x00,0x00,0x00,0xC2,0x00,0x00,0xF8,0xC1,0x00,0x00,0xF0,0xC1,0x00,0x00,0xE8,0xC1
        .byte   0x00,0x00,0xE0,0xC1,0x00,0x00,0xD8,0xC1,0x00,0x00,0xD0,0xC1,0x00,0x00,0xC8,0xC1
        .byte   0x00,0x00,0xC0,0xC1,0x00,0x00,0xB8,0xC1,0x00,0x00,0xB0,0xC1,0x00,0x00,0xA8,0xC1
        .byte   0x00,0x00,0xA0,0xC1,0x00,0x00,0x98,0xC1,0x00,0x00,0x90,0xC1,0x00,0x00,0x88,0xC1
        .byte   0x00,0x00,0x80,0xC1,0x00,0x00,0x70,0xC1,0x00,0x00,0x60,0xC1,0x00,0x00,0x50,0xC1
        .byte   0x00,0x00,0x40,0xC1,0x00,0x00,0x30,0xC1,0x00,0x00,0x20,0xC1,0x00,0x00,0x10,0xC1
        .byte   0x00,0x00,0x00,0xC1,0x00,0x00,0xE0,0xC0,0x00,0x00,0xC0,0xC0,0x00,0x00,0xA0,0xC0
        .byte   0x00,0x00,0x80,0xC0,0x00,0x00,0x40,0xC0,0x00,0x00,0x00,0xC0,0x00,0x00,0x80,0xBF
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x3F,0x00,0x00,0x00,0x40,0x00,0x00,0x40,0x40
        .byte   0x00,0x00,0x80,0x40,0x00,0x00,0xA0,0x40,0x00,0x00,0xC0,0x40,0x00,0x00,0xE0,0x40
        .byte   0x00,0x00,0x00,0x41,0x00,0x00,0x10,0x41,0x00,0x00,0x20,0x41,0x00,0x00,0x30,0x41
        .byte   0x00,0x00,0x40,0x41,0x00,0x00,0x50,0x41,0x00,0x00,0x60,0x41,0x00,0x00,0x70,0x41
        .byte   0x00,0x00,0x80,0x41,0x00,0x00,0x88,0x41,0x00,0x00,0x90,0x41,0x00,0x00,0x98,0x41
        .byte   0x00,0x00,0xA0,0x41,0x00,0x00,0xA8,0x41,0x00,0x00,0xB0,0x41,0x00,0x00,0xB8,0x41
        .byte   0x00,0x00,0xC0,0x41,0x00,0x00,0xC8,0x41,0x00,0x00,0xD0,0x41,0x00,0x00,0xD8,0x41
        .byte   0x00,0x00,0xE0,0x41,0x00,0x00,0xE8,0x41,0x00,0x00,0xF0,0x41,0x00,0x00,0xF8,0x41
        .byte   0x00,0x00,0x00,0x42,0x00,0x00,0x04,0x42,0x00,0x00,0x08,0x42,0x00,0x00,0x0C,0x42
        .byte   0x00,0x00,0x10,0x42,0x00,0x00,0x14,0x42,0x00,0x00,0x18,0x42,0x00,0x00,0x1C,0x42
        .byte   0x00,0x00,0x20,0x42,0x00,0x00,0x24,0x42,0x00,0x00,0x28,0x42,0x00,0x00,0x2C,0x42
        .byte   0x00,0x00,0x30,0x42,0x00,0x00,0x34,0x42,0x00,0x00,0x38,0x42,0x00,0x00,0x3C,0x42
        .byte   0x00,0x00,0x40,0x42,0x00,0x00,0x44,0x42,0x00,0x00,0x48,0x42,0x00,0x00,0x4C,0x42
        .byte   0x00,0x00,0x50,0x42,0x00,0x00,0x54,0x42,0x00,0x00,0x58,0x42,0x00,0x00,0x5C,0x42
        .byte   0x00,0x00,0x60,0x42,0x00,0x00,0x64,0x42,0x00,0x00,0x68,0x42,0x00,0x00,0x6C,0x42
        .byte   0x00,0x00,0x70,0x42,0x00,0x00,0x74,0x42,0x00,0x00,0x78,0x42,0x00,0x00,0x7C,0x42
        .byte   0x00,0x00,0x80,0x42,0x00,0x00,0x82,0x42,0x00,0x00,0x84,0x42,0x00,0x00,0x86,0x42
        .byte   0x00,0x00,0x88,0x42,0x00,0x00,0x8A,0x42,0x00,0x00,0x8C,0x42,0x00,0x00,0x8E,0x42
        .byte   0x00,0x00,0x90,0x42,0x00,0x00,0x92,0x42,0x00,0x00,0x94,0x42,0x00,0x00,0x96,0x42
        .byte   0x00,0x00,0x98,0x42,0x00,0x00,0x9A,0x42,0x00,0x00,0x9C,0x42,0x00,0x00,0x9E,0x42
        .byte   0x00,0x00,0xA0,0x42,0x00,0x00,0xA2,0x42,0x00,0x00,0xA4,0x42,0x00,0x00,0xA6,0x42
        .byte   0x00,0x00,0xA8,0x42,0x00,0x00,0xAA,0x42,0x00,0x00,0xAC,0x42,0x00,0x00,0xAE,0x42
        .byte   0x00,0x00,0xB0,0x42,0x00,0x00,0xB2,0x42,0x00,0x00,0xB4,0x42,0x00,0x00,0xB6,0x42
        .byte   0x00,0x00,0xB8,0x42,0x00,0x00,0xBA,0x42,0x00,0x00,0xBC,0x42,0x00,0x00,0xBE,0x42
        .byte   0x00,0x00,0xC0,0x42,0x00,0x00,0xC2,0x42,0x00,0x00,0xC4,0x42,0x00,0x00,0xC6,0x42
        .byte   0x00,0x00,0xC8,0x42,0x00,0x00,0xCA,0x42,0x00,0x00,0xCC,0x42,0x00,0x00,0xCE,0x42
        .byte   0x00,0x00,0xD0,0x42,0x00,0x00,0xD2,0x42,0x00,0x00,0xD4,0x42,0x00,0x00,0xD6,0x42
        .byte   0x00,0x00,0xD8,0x42,0x00,0x00,0xDA,0x42,0x00,0x00,0xDC,0x42,0x00,0x00,0xDE,0x42
        .byte   0x00,0x00,0xE0,0x42,0x00,0x00,0xE2,0x42,0x00,0x00,0xE4,0x42,0x00,0x00,0xE6,0x42
        .byte   0x00,0x00,0xE8,0x42,0x00,0x00,0xEA,0x42,0x00,0x00,0xEC,0x42,0x00,0x00,0xEE,0x42
        .byte   0x00,0x00,0xF0,0x42,0x00,0x00,0xF2,0x42,0x00,0x00,0xF4,0x42,0x00,0x00,0xF6,0x42
        .byte   0x00,0x00,0xF8,0x42,0x00,0x00,0xFA,0x42,0x00,0x00,0xFC,0x42,0x00,0x00,0xFE,0x42
        .byte   0x00,0x00,0x00,0x43,0x00,0x00,0x01,0x43,0x00,0x00,0x02,0x43,0x00,0x00,0x03,0x43
        .byte   0x00,0x00,0x04,0x43,0x00,0x00,0x05,0x43,0x00,0x00,0x06,0x43,0x00,0x00,0x07,0x43
        .byte   0x00,0x00,0x08,0x43,0x00,0x00,0x09,0x43,0x00,0x00,0x0A,0x43,0x00,0x00,0x0B,0x43
        .byte   0x00,0x00,0x0C,0x43,0x00,0x00,0x0D,0x43,0x00,0x00,0x0E,0x43,0x00,0x00,0x0F,0x43
        .byte   0x00,0x00,0x10,0x43,0x00,0x00,0x11,0x43,0x00,0x00,0x12,0x43,0x00,0x00,0x13,0x43
        .byte   0x00,0x00,0x14,0x43,0x00,0x00,0x15,0x43,0x00,0x00,0x16,0x43,0x00,0x00,0x17,0x43
        .byte   0x00,0x00,0x18,0x43,0x00,0x00,0x19,0x43,0x00,0x00,0x1A,0x43,0x00,0x00,0x1B,0x43
        .byte   0x00,0x00,0x1C,0x43,0x00,0x00,0x1D,0x43,0x00,0x00,0x1E,0x43,0x00,0x00,0x1F,0x43
        .byte   0x00,0x00,0x20,0x43,0x00,0x00,0x21,0x43,0x00,0x00,0x22,0x43,0x00,0x00,0x23,0x43
        .byte   0x00,0x00,0x24,0x43,0x00,0x00,0x25,0x43,0x00,0x00,0x26,0x43,0x00,0x00,0x27,0x43
        .byte   0x00,0x00,0x28,0x43,0x00,0x00,0x29,0x43,0x00,0x00,0x2A,0x43,0x00,0x00,0x2B,0x43
        .byte   0x00,0x00,0x2C,0x43,0x00,0x00,0x2D,0x43,0x00,0x00,0x2E,0x43,0x00,0x00,0x2F,0x43
        .byte   0x00,0x00,0x30,0x43,0x00,0x00,0x31,0x43,0x00,0x00,0x32,0x43,0x00,0x00,0x33,0x43
        .byte   0x00,0x00,0x34,0x43,0x00,0x00,0x35,0x43,0x00,0x00,0x36,0x43,0x00,0x00,0x37,0x43
        .byte   0x00,0x00,0x38,0x43,0x00,0x00,0x39,0x43,0x00,0x00,0x3A,0x43,0x00,0x00,0x3B,0x43
        .byte   0x00,0x00,0x3C,0x43,0x00,0x00,0x3D,0x43,0x00,0x00,0x3E,0x43,0x00,0x00,0x3F,0x43
        .byte   0x00,0x00,0x40,0x43,0x00,0x00,0x41,0x43,0x00,0x00,0x42,0x43,0x00,0x00,0x43,0x43
        .byte   0x00,0x00,0x44,0x43,0x00,0x00,0x45,0x43,0x00,0x00,0x46,0x43,0x00,0x00,0x47,0x43
        .byte   0x00,0x00,0x48,0x43,0x00,0x00,0x49,0x43,0x00,0x00,0x4A,0x43,0x00,0x00,0x4B,0x43
        .byte   0x00,0x00,0x4C,0x43,0x00,0x00,0x4D,0x43,0x00,0x00,0x4E,0x43,0x00,0x00,0x4F,0x43
        .byte   0x00,0x00,0x50,0x43,0x00,0x00,0x51,0x43,0x00,0x00,0x52,0x43,0x00,0x00,0x53,0x43
        .byte   0x00,0x00,0x54,0x43,0x00,0x00,0x55,0x43,0x00,0x00,0x56,0x43,0x00,0x00,0x57,0x43
        .byte   0x00,0x00,0x58,0x43,0x00,0x00,0x59,0x43,0x00,0x00,0x5A,0x43,0x00,0x00,0x5B,0x43
        .byte   0x00,0x00,0x5C,0x43,0x00,0x00,0x5D,0x43,0x00,0x00,0x5E,0x43,0x00,0x00,0x5F,0x43
        .byte   0x00,0x00,0x60,0x43,0x00,0x00,0x61,0x43,0x00,0x00,0x62,0x43,0x00,0x00,0x63,0x43
        .byte   0x00,0x00,0x64,0x43,0x00,0x00,0x65,0x43,0x00,0x00,0x66,0x43,0x00,0x00,0x67,0x43
        .byte   0x00,0x00,0x68,0x43,0x00,0x00,0x69,0x43,0x00,0x00,0x6A,0x43,0x00,0x00,0x6B,0x43
        .byte   0x00,0x00,0x6C,0x43,0x00,0x00,0x6D,0x43,0x00,0x00,0x6E,0x43,0x00,0x00,0x6F,0x43
        .byte   0x00,0x00,0x70,0x43,0x00,0x00,0x71,0x43,0x00,0x00,0x72,0x43,0x00,0x00,0x73,0x43
        .byte   0x00,0x00,0x74,0x43,0x00,0x00,0x75,0x43,0x00,0x00,0x76,0x43,0x00,0x00,0x77,0x43
        .byte   0x00,0x00,0x78,0x43,0x00,0x00,0x79,0x43,0x00,0x00,0x7A,0x43,0x00,0x00,0x7B,0x43
        .byte   0x00,0x00,0x7C,0x43,0x00,0x00,0x7D,0x43,0x00,0x00,0x7E,0x43,0x00,0x00,0x7F,0x43

