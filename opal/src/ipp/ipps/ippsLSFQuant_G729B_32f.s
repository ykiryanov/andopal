        .text
        .align  4
        .globl  _ippsLSFQuant_G729B_32f


_ippsLSFQuant_G729B_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xF0
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        mov     r7, r3
        beq     LDHX14
        cmp     r7, #0
        beq     LDHX14
        cmp     r4, #0
        beq     LDHX14
        cmp     r5, #0
        beq     LDHX14
        ldr     r0, [r6, #4]
        mov     r12, #0xFF, 12
        orr     r8, r12, #3, 4
        bl      __extendsfdf2
        ldr     r2, [pc, #0x5F8]
        ldr     r3, [pc, #0x5F8]
        bl      __subdf3
        mov     r3, r8
        mov     r2, #0
        bl      __subdf3
        bl      __truncdfsf2
        ldr     lr, [pc, #0x5E4]
        ldr     r12, [pc, #0x5E4]
        mov     r10, r0
        ldr     r9, [lr]
        ldr     r8, [r12]
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        add     r11, sp, #0x1C
        strgt   r8, [r11]
        bgt     LDHX0
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        ldr     r12, [pc, #0x5B4]
        ldr     r1, [r12]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r11]
LDHX0:
        ldr     r0, [pc, #0x59C]
        sub     r12, r6, #4
        mov     r2, #1
        add     r11, r6, #8
        mov     r1, #8
        str     r7, [sp]
        str     r5, [sp, #4]
        str     r6, [sp, #0xC]
        add     r10, r12, #4
        str     r4, [sp, #8]
        mov     r7, r0
        mov     r5, r1
        mov     r6, r2
LDHX1:
        ldr     r0, [r11], #4
        mov     r1, r8
        bl      __subsf3
        ldr     r1, [r10], #4
        bl      __subsf3
        mov     r4, r0
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        movgt   r0, r8
        bgt     LDHX2
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [r7]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
LDHX2:
        add     r3, sp, #0x1C
        str     r0, [r3, +r6, lsl #2]
        subs    r5, r5, #1
        add     r6, r6, #1
        bne     LDHX1
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp]
        ldr     r5, [sp, #4]
        ldr     r0, [r6, #0x20]
        ldr     r4, [sp, #8]
        bl      __extendsfdf2
        ldr     r11, [pc, #0x4F8]
        ldr     r10, [pc, #0x4F8]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subdf3
        bl      __truncdfsf2
        mov     r10, r0
        mov     r1, r9
        add     r11, sp, #0x1C
        bl      __gtsf2
        cmp     r0, #0
        bgt     LDHX3
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        ldr     r12, [pc, #0x4B0]
        ldr     r1, [r12]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
LDHX3:
        ldr     r12, [pc, #0x4A4]
        str     r8, [r11, #0x24]
        add     lr, sp, #0x1C
        ldr     r0, [lr, #0x10]
        ldr     r8, [r12]
        mov     r10, #0
        mov     r9, r10
        mov     r1, r8
        bl      __mulsf3
        add     r12, sp, #0x1C
        str     r0, [r12, #0x10]
        add     r11, sp, #0x1C
        ldr     r0, [r11, #0x14]
        mov     r1, r8
        bl      __mulsf3
        ldr     r8, [pc, #0x46C]
        str     r0, [r11, #0x14]
        add     r12, r8, #5, 26
        str     r7, [sp]
        str     r5, [sp, #4]
        mov     r1, r4
        mov     r0, r6
        mov     r2, r10
LDHX4:
        add     r3, sp, #0x74
        add     r10, r8, #0x74
        add     r6, r1, #0x74
        add     r5, r3, r2
        mov     r4, r0
        mov     r11, r12
        mov     r7, #0xA
        str     r12, [sp, #0x18]
        str     r9, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
LDHX5:
        ldr     r1, [r10, #-0x74]
        ldr     r0, [r6, #-0x74]
        ldr     r9, [r4], #4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [r6, #-0x4C]
        ldr     r2, [r10, #-0x4C]
        mov     r9, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [r10, #-0x24]
        ldr     r2, [r6, #-0x24]
        mov     r9, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [r6, #4]!
        ldr     r2, [r10, #4]!
        mov     r9, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [r11], #4
        bl      __mulsf3
        str     r0, [r5], #4
        subs    r7, r7, #1
        bne     LDHX5
        ldr     r9, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #0xC]
        add     r9, r9, #1
        cmp     r9, #2
        add     r8, r8, #0xA0
        add     r2, r2, #0x28
        add     r12, r12, #0x28
        blt     LDHX4
        mov     r4, r1
        ldr     r7, [sp]
        ldr     r5, [sp, #4]
        add     r1, sp, #0x1C
        add     r0, sp, #0x74
        add     r3, sp, #0xEC
        add     r2, r7, #4
        str     r9, [sp, #0xEC]
        bl      _ippsLSPSelect_G729B_32f
        ldr     lr, [sp, #0xEC]
        ldr     r6, [pc, #0x330]
        ldr     r12, [r7, #8]
        str     lr, [r7]
        ldr     r7, [r7, #4]
        add     lr, r6, #0x19, 28
        ldr     r3, [lr, +r12, lsl #2]
        add     r12, lr, r12, lsl #2
        ldr     r12, [r12, #0x40]
        add     r8, sp, #0x44
        str     r3, [r8]
        add     r3, r6, #0x21, 28
        ldr     r0, [r3, +r7, lsl #2]
        add     lr, sp, #0x44
        add     r2, sp, #0x4C
        add     r1, sp, #0x44
        str     r12, [lr, #4]
        bl      _ippsBuildQuantLSPVector_G729_32f
        ldr     lr, [pc, #0x2D4]
        ldr     r12, [pc, #0x2EC]
        ldr     r3, [pc, #0x2EC]
        ldr     r9, [lr]
        add     r10, sp, #0x4C
        ldr     r8, [r12]
        ldr     r7, [r3]
        mov     r0, #1
        str     r5, [sp, #4]
        mov     r11, r0
        str     r4, [sp, #8]
        mov     r5, r0
LDHX6:
        add     r2, sp, #0x4C
        ldr     r1, [r2, +r11, lsl #2]
        ldr     r6, [r10]
        mov     r0, r6
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        mov     r1, r7
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r9
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHX7
        mov     r0, r6
        mov     r1, r4
        add     r6, sp, #0x4C
        bl      __subsf3
        str     r0, [r10]
        ldr     r0, [r6, +r5, lsl #2]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r6, +r5, lsl #2]
LDHX7:
        add     r11, r11, #1
        cmp     r11, #0xA
        add     r5, r5, #1
        add     r10, r10, #4
        blt     LDHX6
        ldr     r6, [pc, #0x24C]
        ldr     r3, [sp, #0xEC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #4]
        add     r12, r6, #0x29, 28
        add     r3, r3, r3, lsl #2
        mov     r8, #0
        mov     r7, r8
        add     r6, r6, r3, lsl #5
        add     r9, r12, r3, lsl #3
        add     r6, r6, #0x74
        add     r10, r4, #0x74
        str     r4, [sp, #8]
LDHX8:
        ldr     r1, [r9], #4
        add     r0, sp, #0x4C
        ldr     r0, [r0, +r7, lsl #2]
        add     r4, sp, #0xC4
        bl      __mulsf3
        ldr     r2, [r10, #-0x74]
        ldr     r1, [r6, #-0x74]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #-0x4C]
        ldr     r2, [r10, #-0x4C]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #-0x24]
        ldr     r2, [r10, #-0x24]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [r6, #4]!
        ldr     r2, [r10, #4]!
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4, +r7, lsl #2]
        add     r7, r7, #1
        cmp     r7, #0xA
        blt     LDHX8
        ldr     r4, [sp, #8]
        mov     r2, #0x1E
        mov     r9, r8
        add     r1, r4, #0x28
        mov     r0, r4
        bl      _ippsMove_32f
        add     r0, sp, #0x4C
        mov     r1, r4
        mov     r2, #0xA
        bl      _ippsCopy_32f
        ldr     r0, [pc, #0x144]
        add     r10, sp, #0xC8
        mov     r7, r9
        ldr     r4, [r0]
        mov     r6, r10
        str     r5, [sp, #4]
LDHX9:
        add     r2, sp, #0xC4
        ldr     r5, [r2, +r9, lsl #2]
        ldr     r11, [r6]
        mov     r1, r5
        mov     r0, r11
        bl      __subsf3
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHX10
        str     r5, [r6]
        add     r2, sp, #0xC4
        str     r11, [r2, +r7, lsl #2]
LDHX10:
        add     r9, r9, #1
        cmp     r9, #9
        add     r7, r7, #1
        add     r6, r6, #4
        blt     LDHX9
        ldr     r0, [pc, #0x108]
        ldr     r5, [sp, #4]
        add     r1, sp, #0xC4
        ldr     r9, [r1]
        ldr     r7, [r0]
        mov     r6, r8
        mov     r1, r9
        mov     r0, r7
        bl      __gtsf2
        ldr     r3, [pc, #0xE8]
        cmp     r0, #0
        ldr     r4, [r3]
        add     r12, sp, #0xC4
        movgt   r9, r7
        str     r9, [r12]
LDHX11:
        add     r3, sp, #0xC4
        ldr     r0, [r10]
        ldr     r7, [r3, +r6, lsl #2]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHX12
        mov     r0, r4
        mov     r1, r7
        bl      __addsf3
        str     r0, [r10]
LDHX12:
        add     r6, r6, #1
        cmp     r6, #9
        add     r10, r10, #4
        blt     LDHX11
        ldr     r0, [pc, #0x90]
        add     r6, sp, #0xC4
        ldr     r4, [r6, #0x24]
        ldr     r7, [r0]
        mov     r1, r4
        mov     r0, r7
        bl      __ltsf2
        cmp     r0, #0
        movlt   r4, r7
        str     r4, [r6, #0x24]
LDHX13:
        add     r0, sp, #0xC4
        ldr     r0, [r0, +r8, lsl #2]
        add     r8, r8, #1
        bl      __extendsfdf2
        bl      cos
        bl      __truncdfsf2
        str     r0, [r5], #4
        cmp     r8, #0xA
        blt     LDHX13
        mov     r0, #0
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}
LDHX14:
        mvn     r0, #7
        add     sp, sp, #0xF0
        ldmia   sp!, {r4 - r11, pc}
        .long   0x8c0eff43
        .long   0x3fc015bf
        .long   LDHX__2il0floatpacket.1
        .long   LDHX__2il0floatpacket.2
        .long   LDHX__2il0floatpacket.3
        .long   0xd215980a
        .long   0x3ffe3e86
        .long   LDHX__2il0floatpacket.4
        .long   LDHX_noise
        .long   LDHX__2il0floatpacket.5
        .long   LDHX__2il0floatpacket.6
        .long   LDHX__2il0floatpacket.7
        .long   LDHX__2il0floatpacket.8
        .long   LDHX__2il0floatpacket.9


        .data
        .align  4


LDHX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDHX__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F
LDHX__2il0floatpacket.3:
        .byte   0x00,0x00,0x20,0x41
LDHX__2il0floatpacket.4:
        .byte   0x9A,0x99,0x99,0x3F
LDHX__2il0floatpacket.5:
        .byte   0x52,0x49,0x9D,0x3A
LDHX__2il0floatpacket.6:
        .byte   0x00,0x00,0x00,0x3F
LDHX__2il0floatpacket.7:
        .byte   0x0A,0xD7,0xA3,0x3B
LDHX__2il0floatpacket.8:
        .byte   0x2E,0x90,0x20,0x3D
LDHX__2il0floatpacket.9:
        .byte   0xD7,0xA3,0x48,0x40


        .data
        .align  4


LDHX_noise:
        .byte   0x81,0x95,0x83,0x3E,0x04,0x56,0x8E,0x3E,0x29,0x5C,0x8F,0x3E,0x4D,0x15,0x8C,0x3E
        .byte   0x8D,0x28,0x8D,0x3E,0x4D,0x84,0x8D,0x3E,0xC3,0xF5,0x88,0x3E,0x15,0x1D,0x89,0x3E
        .byte   0xE9,0x48,0x8E,0x3E,0xC2,0x86,0x87,0x3E,0x3F,0x57,0x5B,0x3E,0x65,0xAA,0x60,0x3E
        .byte   0xC4,0xB1,0x6E,0x3E,0x1D,0x5A,0x64,0x3E,0x1E,0xA7,0x68,0x3E,0xD4,0x9A,0x66,0x3E
        .byte   0x88,0xF4,0x5B,0x3E,0x2C,0x65,0x59,0x3E,0x75,0x93,0x58,0x3E,0x62,0xA1,0x56,0x3E
        .byte   0x0C,0x02,0x2B,0x3E,0x88,0xF4,0x1B,0x3E,0xF7,0x75,0x20,0x3E,0xC1,0xCA,0x21,0x3E
        .byte   0x41,0xF1,0x23,0x3E,0x65,0xAA,0x20,0x3E,0xAE,0xB6,0x22,0x3E,0x64,0x3B,0x1F,0x3E
        .byte   0x07,0xF0,0x16,0x3E,0xD3,0xDE,0x20,0x3E,0xDB,0x8A,0xFD,0x3D,0xA4,0x70,0xBD,0x3D
        .byte   0x2F,0x6E,0xA3,0x3D,0xC8,0x07,0xBD,0x3D,0xA2,0x45,0xB6,0x3D,0x0C,0x93,0xA9,0x3D
        .byte   0x17,0xD9,0xCE,0x3D,0xA8,0x57,0xCA,0x3D,0xEA,0x95,0xB2,0x3D,0x87,0x16,0xD9,0x3D
        .byte   0x00,0x91,0x7E,0x3E,0xF0,0xA7,0x86,0x3E,0x0E,0x32,0x89,0x3E,0xC4,0x25,0x87,0x3E
        .byte   0x42,0x3E,0x88,0x3E,0x48,0xF9,0x89,0x3E,0x4A,0x29,0x88,0x3E,0x35,0x07,0x88,0x3E
        .byte   0x88,0x9D,0x89,0x3E,0xE8,0x9F,0x80,0x3E,0xF3,0x3C,0x38,0x3E,0xF7,0xAF,0x2C,0x3E
        .byte   0xDE,0x1F,0x2F,0x3E,0xC6,0x6D,0x34,0x3E,0x20,0x0C,0x3C,0x3E,0x27,0x88,0x3A,0x3E
        .byte   0x6F,0x47,0x38,0x3E,0xD9,0x5F,0x36,0x3E,0x96,0xCF,0x32,0x3E,0x7C,0x61,0x32,0x3E
        .byte   0x5C,0xC9,0x0E,0x3E,0xAA,0x65,0xEB,0x3D,0x23,0x67,0xE1,0x3D,0xE0,0xB9,0xF7,0x3D
        .byte   0x37,0x89,0x01,0x3E,0xBD,0x6F,0xFC,0x3D,0x55,0x13,0x04,0x3E,0x46,0x5F,0x01,0x3E
        .byte   0xEE,0xB1,0xF4,0x3D,0x81,0x04,0x05,0x3E,0xD3,0xBC,0xE3,0x3D,0x25,0x7A,0x99,0x3D
        .byte   0x79,0x23,0x73,0x3D,0xE3,0x36,0x9A,0x3D,0x00,0x74,0x98,0x3D,0xE7,0x3A,0x8D,0x3D
        .byte   0x2B,0xFB,0xAE,0x3D,0xAE,0x81,0xAD,0x3D,0x1E,0xFE,0x9A,0x3D,0x1B,0x4C,0xC3,0x3D
LDHX_noise_fg_sum_inv:
        .byte   0x0C,0x75,0x86,0x40,0xF2,0x41,0x78,0x40,0xFF,0x95,0x7F,0x40,0xF8,0xDD,0x7C,0x40
        .byte   0x03,0x09,0x81,0x40,0xED,0x65,0x77,0x40,0xF2,0x41,0x78,0x40,0xE0,0xF5,0x70,0x40
        .byte   0xCE,0xE1,0x67,0x40,0xE9,0xB5,0x73,0x40,0xFB,0x72,0x47,0x40,0x59,0x16,0x29,0x40
        .byte   0x41,0x69,0x23,0x40,0x4B,0x03,0x30,0x40,0x81,0x31,0x37,0x40,0x2B,0xB2,0x33,0x40
        .byte   0x60,0x61,0x3C,0x40,0x36,0x66,0x39,0x40,0x21,0x0F,0x31,0x40,0xAF,0x30,0x37,0x40
LDHX_PtrTab_2:
        .byte   0x1F,0x00,0x00,0x00,0x15,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x03,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x13,0x00,0x00,0x00,0x1A,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x1D,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x1B,0x00,0x00,0x00,0x15,0x00,0x00,0x00,0x0C,0x00,0x00,0x00
        .byte   0x10,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x19,0x00,0x00,0x00,0x16,0x00,0x00,0x00,0x14,0x00,0x00,0x00
        .byte   0x13,0x00,0x00,0x00,0x17,0x00,0x00,0x00,0x14,0x00,0x00,0x00,0x1F,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x14,0x00,0x00,0x00,0x1F,0x00,0x00,0x00
LDHX_PtrTab_1:
        .byte   0x60,0x00,0x00,0x00,0x34,0x00,0x00,0x00,0x14,0x00,0x00,0x00,0x36,0x00,0x00,0x00
        .byte   0x56,0x00,0x00,0x00,0x72,0x00,0x00,0x00,0x52,0x00,0x00,0x00,0x44,0x00,0x00,0x00
        .byte   0x24,0x00,0x00,0x00,0x79,0x00,0x00,0x00,0x30,0x00,0x00,0x00,0x5C,0x00,0x00,0x00
        .byte   0x12,0x00,0x00,0x00,0x78,0x00,0x00,0x00,0x5E,0x00,0x00,0x00,0x7C,0x00,0x00,0x00
        .byte   0x32,0x00,0x00,0x00,0x7D,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x64,0x00,0x00,0x00
        .byte   0x1C,0x00,0x00,0x00,0x4C,0x00,0x00,0x00,0x0C,0x00,0x00,0x00,0x75,0x00,0x00,0x00
        .byte   0x51,0x00,0x00,0x00,0x16,0x00,0x00,0x00,0x5A,0x00,0x00,0x00,0x74,0x00,0x00,0x00
        .byte   0x7F,0x00,0x00,0x00,0x15,0x00,0x00,0x00,0x6C,0x00,0x00,0x00,0x42,0x00,0x00,0x00
LDHX_noise_fg_sum:
        .byte   0xE5,0xB1,0x73,0x3E,0x06,0xFD,0x83,0x3E,0x01,0x35,0x80,0x3E,0x03,0x95,0x81,0x3E
        .byte   0xFB,0xF1,0x7D,0x3E,0x09,0x75,0x84,0x3E,0x06,0xFD,0x83,0x3E,0x10,0xFD,0x87,0x3E
        .byte   0x1B,0x4D,0x8D,0x3E,0x0E,0x71,0x86,0x3E,0xE2,0x4A,0xA4,0x3E,0x1B,0xCB,0xC1,0x3E
        .byte   0x5E,0x86,0xC8,0x3E,0x10,0x2B,0xBA,0x3E,0x01,0xDF,0xB2,0x3E,0x3A,0x5A,0xB6,0x3E
        .byte   0x29,0xF2,0xAD,0x3E,0x2E,0xBE,0xB0,0x3E,0x72,0x11,0xB9,0x3E,0xCD,0xDF,0xB2,0x3E


