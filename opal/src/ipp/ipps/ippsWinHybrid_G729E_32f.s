        .text
        .align  4
        .globl  _ippsWinHybrid_G729E_32f


_ippsWinHybrid_G729E_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x39, 28
        add     lr, sp, #0x14
        add     r12, sp, #0x9E, 30
        and     lr, lr, #0x1F
        and     r12, r12, #0x1F
        rsb     lr, lr, #0
        rsb     r12, r12, #0
        add     r3, sp, #0x14
        add     r10, sp, #0x9E, 30
        and     lr, lr, #0x1F
        and     r8, r12, #0x1F
        cmp     r0, #0
        add     r4, r3, lr
        mov     r7, r1
        mov     r5, r2
        add     r9, r10, r8
        beq     LDEU4
        cmp     r7, #0
        beq     LDEU4
        cmp     r5, #0
        beq     LDEU4
        ldr     r1, [pc, #0x7C4]
        mov     r2, r4
        mov     r3, #0x91
        bl      _ippsMul_32f
        add     r0, r4, #0x78
        mov     r2, r4
        mov     r11, #0
        sub     r6, r9, #4
        str     r5, [sp, #8]
        str     r9, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r7, [sp]
        mov     r4, r0
LDEU0:
        mov     r10, #0
        rsb     r1, r11, #0
        mov     r9, r10
        add     r12, r4, r1, lsl #2
        add     r5, r12, #4
        mov     r8, r9
        add     r7, r2, #0x7C
        str     r2, [sp, #4]
LDEU1:
        ldr     r1, [r5, #-4]
        ldr     r0, [r7, #-4]
        add     r8, r8, #4
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r3, [r7]
        ldr     r2, [r5]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [r7, #4]
        ldr     r3, [r5, #4]
        mov     r9, r1
        mov     r10, r0
        mov     r0, r2
        mov     r1, r3
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r3, [r7, #8]
        ldr     r2, [r5, #8]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r3
        mov     r1, r2
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        cmp     r8, #0x50
        mov     r10, r0
        mov     r9, r1
        add     r7, r7, #0x10
        add     r5, r5, #0x10
        blt     LDEU1
        ldr     r2, [sp, #4]
        add     r11, r11, #1
        str     r10, [r6, #4]
        str     r9, [r6, #8]!
        cmp     r11, #0x1F
        blt     LDEU0
        mov     r4, r2
        ldr     r5, [sp, #8]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r3, [pc, #0x690]
        ldr     r0, [r5]
        ldr     r7, [sp]
        add     r10, sp, #0x9E, 30
        ldr     r11, [r3]
        mov     r6, #0
        mov     r1, r11
        bl      __mulsf3
        ldr     r10, [r8, +r10]
        ldr     r1, [r9, #4]
        mov     r8, r0
        mov     r0, r10
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #4]
        str     r0, [r5]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0xC]
        ldr     r2, [r9, #8]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #8]
        str     r0, [r5, #4]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0x14]
        ldr     r2, [r9, #0x10]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0xC]
        str     r0, [r5, #8]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x1C]
        ldr     r2, [r9, #0x18]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x10]
        str     r0, [r5, #0xC]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x24]
        ldr     r2, [r9, #0x20]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x14]
        str     r0, [r5, #0x10]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0x2C]
        ldr     r2, [r9, #0x28]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x18]
        str     r0, [r5, #0x14]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r9, #0x30]
        ldr     r1, [r9, #0x34]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x1C]
        str     r0, [r5, #0x18]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x3C]
        ldr     r2, [r9, #0x38]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x20]
        str     r0, [r5, #0x1C]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9, #0x40]
        ldr     r1, [r9, #0x44]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x24]
        str     r0, [r5, #0x20]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9, #0x48]
        ldr     r1, [r9, #0x4C]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x28]
        str     r0, [r5, #0x24]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x54]
        ldr     r2, [r9, #0x50]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x2C]
        str     r0, [r5, #0x28]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r9, #0x58]
        ldr     r1, [r9, #0x5C]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x30]
        str     r0, [r5, #0x2C]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x64]
        ldr     r2, [r9, #0x60]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x34]
        str     r0, [r5, #0x30]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9, #0x68]
        ldr     r1, [r9, #0x6C]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x38]
        str     r0, [r5, #0x34]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x74]
        ldr     r2, [r9, #0x70]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x3C]
        str     r0, [r5, #0x38]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0x7C]
        ldr     r2, [r9, #0x78]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x40]
        str     r0, [r5, #0x3C]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9, #0x80]
        ldr     r1, [r9, #0x84]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x44]
        str     r0, [r5, #0x40]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x8C]
        ldr     r2, [r9, #0x88]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x48]
        str     r0, [r5, #0x44]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0x94]
        ldr     r2, [r9, #0x90]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x4C]
        str     r0, [r5, #0x48]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9, #0x98]
        ldr     r1, [r9, #0x9C]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x50]
        str     r0, [r5, #0x4C]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0xA4]
        ldr     r2, [r9, #0xA0]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x54]
        str     r0, [r5, #0x50]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0xAC]
        ldr     r2, [r9, #0xA8]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x58]
        str     r0, [r5, #0x54]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r9, #0xB0]
        ldr     r1, [r9, #0xB4]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x5C]
        str     r0, [r5, #0x58]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0xBC]
        ldr     r2, [r9, #0xB8]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x60]
        str     r0, [r5, #0x5C]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0xC4]
        ldr     r2, [r9, #0xC0]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x64]
        str     r0, [r5, #0x60]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0xCC]
        ldr     r2, [r9, #0xC8]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x68]
        str     r0, [r5, #0x64]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r2, [r9, #0xD0]
        ldr     r1, [r9, #0xD4]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x6C]
        str     r0, [r5, #0x68]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r2, [r9, #0xD8]
        ldr     r1, [r9, #0xDC]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x70]
        str     r0, [r5, #0x6C]
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0xE4]
        ldr     r2, [r9, #0xE0]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x74]
        str     r0, [r5, #0x70]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0xEC]
        ldr     r2, [r9, #0xE8]
        mov     r8, r0
        mov     r0, r2
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [r5, #0x78]
        str     r0, [r5, #0x74]
        mov     r0, r2
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r9, #0xF0]
        ldr     r9, [r9, #0xF4]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r9
        bl      __truncdfsf2
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #0x78]
LDEU2:
        ldr     r11, [r5], #4
        rsb     r3, r6, #0
        str     r7, [sp]
        mov     r0, #0x6E
        add     r8, r4, r3, lsl #2
        mov     r7, r11
        add     r10, r4, #0x6F, 30
        add     r9, r8, #0x6F, 30
        mov     r11, r0
LDEU3:
        ldr     r0, [r10, #-4]
        ldr     r1, [r9, #-4]
        add     r11, r11, #2
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [r10], #8
        ldr     r1, [r9], #8
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        cmp     r11, #0x8F
        mov     r7, r0
        blt     LDEU3
        mov     r0, r11
        mov     r11, r7
        ldr     r1, [r4, +r0, lsl #2]
        ldr     r8, [r8, +r0, lsl #2]
        ldr     r7, [sp]
        mov     r0, r1
        add     r6, r6, #1
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r7], #4
        cmp     r6, #0x1E
        ble     LDEU2
        mov     r0, #0
        add     sp, sp, #0x39, 28
        ldmia   sp!, {r4 - r11, pc}
LDEU4:
        mvn     r0, #7
        add     sp, sp, #0x39, 28
        ldmia   sp!, {r4 - r11, pc}
        .long   LDEU_hybridWindowInverse
        .long   LDEU__2il0floatpacket.1


        .data
        .align  4


LDEU__2il0floatpacket.1:
        .byte   0x00,0x00,0xA2,0x3E


        .data
        .align  4


LDEU_hybridWindowInverse:
        .byte   0xC3,0x2D,0xE7,0x3E,0xED,0xD8,0xE8,0x3E,0x1A,0x87,0xEA,0x3E,0x8F,0x38,0xEC,0x3E
        .byte   0x07,0xED,0xED,0x3E,0xA5,0xA4,0xEF,0x3E,0x67,0x5F,0xF1,0x3E,0x71,0x1D,0xF3,0x3E
        .byte   0xA0,0xDE,0xF4,0x3E,0x16,0xA3,0xF6,0x3E,0xD3,0x6A,0xF8,0x3E,0xF8,0x35,0xFA,0x3E
        .byte   0x43,0x04,0xFC,0x3E,0xF5,0xD5,0xFD,0x3E,0xEF,0xAA,0xFF,0x3E,0xB9,0xC1,0x00,0x3F
        .byte   0x9F,0xAF,0x01,0x3F,0x38,0x9F,0x02,0x3F,0x97,0x90,0x03,0x3F,0xBA,0x83,0x04,0x3F
        .byte   0x92,0x78,0x05,0x3F,0x2F,0x6F,0x06,0x3F,0xA1,0x67,0x07,0x3F,0xC8,0x61,0x08,0x3F
        .byte   0xD5,0x5D,0x09,0x3F,0xA7,0x5B,0x0A,0x3F,0x4F,0x5B,0x0B,0x3F,0xCD,0x5C,0x0C,0x3F
        .byte   0x31,0x60,0x0D,0x3F,0x6B,0x65,0x0E,0x3F,0x8B,0x6C,0x0F,0x3F,0x92,0x75,0x10,0x3F
        .byte   0x80,0x80,0x11,0x3F,0x54,0x8D,0x12,0x3F,0x20,0x9C,0x13,0x3F,0xE2,0xAC,0x14,0x3F
        .byte   0x9C,0xBF,0x15,0x3F,0x4E,0xD4,0x16,0x3F,0x07,0xEB,0x17,0x3F,0xB8,0x03,0x19,0x3F
        .byte   0x71,0x1E,0x1A,0x3F,0x43,0x3B,0x1B,0x3F,0x1D,0x5A,0x1C,0x3F,0xFF,0x7A,0x1D,0x3F
        .byte   0xF9,0x9D,0x1E,0x3F,0x0D,0xC3,0x1F,0x3F,0x4B,0xEA,0x20,0x3F,0xA1,0x13,0x22,0x3F
        .byte   0x21,0x3F,0x23,0x3F,0xCA,0x6C,0x24,0x3F,0x9D,0x9C,0x25,0x3F,0x9A,0xCE,0x26,0x3F
        .byte   0xD1,0x02,0x28,0x3F,0x43,0x39,0x29,0x3F,0x00,0x72,0x2A,0x3F,0xE6,0xAC,0x2B,0x3F
        .byte   0x29,0xEA,0x2C,0x3F,0xA6,0x29,0x2E,0x3F,0x7F,0x6B,0x2F,0x3F,0xA3,0xAF,0x30,0x3F
        .byte   0x12,0xF6,0x31,0x3F,0xEE,0x3E,0x33,0x3F,0x26,0x8A,0x34,0x3F,0xBA,0xD7,0x35,0x3F
        .byte   0xBB,0x27,0x37,0x3F,0x29,0x7A,0x38,0x3F,0x14,0xCF,0x39,0x3F,0x6C,0x26,0x3B,0x3F
        .byte   0x41,0x80,0x3C,0x3F,0x83,0xDC,0x3D,0x3F,0x64,0x3B,0x3F,0x3F,0xB2,0x9C,0x40,0x3F
        .byte   0x9F,0x00,0x42,0x3F,0x1B,0x67,0x43,0x3F,0x24,0xD0,0x44,0x3F,0xDE,0x3B,0x46,0x3F
        .byte   0x26,0xAA,0x47,0x3F,0x0D,0x1B,0x49,0x3F,0xB4,0x8E,0x4A,0x3F,0xFB,0x04,0x4C,0x3F
        .byte   0xF2,0x7D,0x4D,0x3F,0xA9,0xF9,0x4E,0x3F,0x21,0x78,0x50,0x3F,0x59,0xF9,0x51,0x3F
        .byte   0x52,0x7D,0x53,0x3F,0x1D,0x04,0x55,0x3F,0xB9,0x8D,0x56,0x3F,0x26,0x1A,0x58,0x3F
        .byte   0x76,0xA9,0x59,0x3F,0xA7,0x3B,0x5B,0x3F,0xCC,0xD0,0x5C,0x3F,0xD3,0x68,0x5E,0x3F
        .byte   0xCD,0x03,0x60,0x3F,0xBA,0xA1,0x61,0x3F,0x9A,0x42,0x63,0x3F,0x8E,0xE6,0x64,0x3F
        .byte   0x86,0x8D,0x66,0x3F,0x93,0x37,0x68,0x3F,0xA4,0xE4,0x69,0x3F,0xD9,0x94,0x6B,0x3F
        .byte   0x24,0x48,0x6D,0x3F,0x93,0xFE,0x6E,0x3F,0x39,0xB8,0x70,0x3F,0x04,0x75,0x72,0x3F
        .byte   0x05,0x35,0x74,0x3F,0x3C,0xF8,0x75,0x3F,0xBA,0xBE,0x77,0x3F,0x90,0x88,0x79,0x3F
        .byte   0x9B,0x55,0x7B,0x3F,0x0F,0x26,0x7D,0x3F,0xF7,0xAD,0x7E,0x3F,0x1B,0xA1,0x7F,0x3F
        .byte   0xD2,0xFE,0x7F,0x3F,0xEB,0xC6,0x7F,0x3F,0x87,0xF9,0x7E,0x3F,0x2D,0x97,0x7D,0x3F
        .byte   0xA5,0xA0,0x7B,0x3F,0x0D,0x17,0x79,0x3F,0xD7,0xFB,0x75,0x3F,0xE7,0x50,0x72,0x3F
        .byte   0x6A,0x18,0x6E,0x3F,0xB9,0x54,0x69,0x3F,0xA7,0x08,0x64,0x3F,0x69,0x37,0x5E,0x3F
        .byte   0x36,0xE4,0x57,0x3F,0xEC,0x12,0x51,0x3F,0x69,0xC7,0x49,0x3F,0xFF,0x05,0x42,0x3F
        .byte   0x35,0xD3,0x39,0x3F,0xC2,0x33,0x31,0x3F,0xD4,0x2C,0x28,0x3F,0x98,0xC3,0x1E,0x3F
        .byte   0x8F,0xFD,0x14,0x3F,0x7E,0xE0,0x0A,0x3F,0x3B,0x72,0x00,0x3F,0xDA,0x71,0xEB,0x3E
        .byte   0xC0,0x75,0xD5,0x3E,0xBD,0xFC,0xBE,0x3E,0x2F,0x14,0xA8,0x3E,0x75,0xC9,0x90,0x3E
        .byte   0x1E,0x54,0x72,0x3E,0x7F,0x87,0x42,0x3E,0xA1,0x49,0x12,0x3E,0x16,0x6C,0xC3,0x3D
        .byte   0x3C,0xA5,0x43,0x3D


