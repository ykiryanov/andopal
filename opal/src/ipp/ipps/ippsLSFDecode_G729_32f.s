        .text
        .align  4
        .globl  _ippsLSFDecode_G729_32f


_ippsLSFDecode_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r3, r0
        cmp     r3, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDHY15
        cmp     r5, #0
        beq     LDHY15
        cmp     r4, #0
        beq     LDHY15
        ldr     r0, [r3, #4]
        ldr     r7, [r3]
        add     r1, r3, #8
        mov     r2, r4
        bl      _ippsBuildQuantLSPVector_G729_32f
        ldr     r3, [pc, #0x480]
        ldr     lr, [pc, #0x480]
        ldr     r12, [pc, #0x480]
        ldr     r11, [r3]
        sub     r3, r4, #4
        ldr     r1, [lr]
        ldr     r6, [r12]
        str     r5, [sp, #0xC]
        add     r9, r4, #4
        add     r10, r3, #4
        mov     r8, #9
        str     r3, [sp]
        str     r7, [sp, #4]
        str     r4, [sp, #8]
        mov     r5, r1
LDHY0:
        ldr     r1, [r9]
        ldr     r7, [r10]
        mov     r0, r7
        bl      __subsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHY1
        mov     r0, r7
        mov     r1, r4
        bl      __subsf3
        str     r0, [r10]
        ldr     r0, [r9]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r9]
LDHY1:
        subs    r8, r8, #1
        add     r9, r9, #4
        add     r10, r10, #4
        bne     LDHY0
        mov     r1, r5
        ldr     r12, [pc, #0x3E8]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp]
        ldr     r8, [r12]
        ldr     r4, [sp, #8]
        ldr     r7, [sp, #4]
        str     r5, [sp, #0xC]
        add     r9, r3, #4
        add     r11, r4, #4
        mov     r10, #9
        str     r7, [sp, #4]
        str     r4, [sp, #8]
        mov     r5, r1
LDHY2:
        ldr     r1, [r11]
        ldr     r7, [r9]
        mov     r0, r7
        bl      __subsf3
        mov     r1, r8
        bl      __addsf3
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LDHY3
        mov     r0, r7
        mov     r1, r4
        bl      __subsf3
        str     r0, [r9]
        ldr     r0, [r11]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r11]
LDHY3:
        subs    r10, r10, #1
        add     r11, r11, #4
        add     r9, r9, #4
        bne     LDHY2
        ldr     r4, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r5, [sp, #0xC]
        add     r1, sp, #0x10
        mov     r2, #0xA
        mov     r0, r4
        bl      _ippsCopy_32f
        ldr     r3, [pc, #0x338]
        add     r7, r7, r7, lsl #2
        add     r10, r5, #0x74
        sub     r12, r3, #0x50
        add     r3, r3, r7, lsl #5
        add     r7, r12, r7, lsl #3
        add     r6, r3, #0x74
        mov     r9, r4
        mov     r8, #0xA
LDHY4:
        ldr     r0, [r9]
        ldr     r1, [r7], #4
        bl      __mulsf3
        mov     r11, r0
        str     r11, [r9]
        ldr     r0, [r10, #-0x74]
        ldr     r1, [r6, #-0x74]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        str     r11, [r9]
        ldr     r0, [r10, #-0x4C]
        ldr     r1, [r6, #-0x4C]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        str     r11, [r9]
        ldr     r0, [r10, #-0x24]
        ldr     r1, [r6, #-0x24]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        str     r11, [r9]
        ldr     r0, [r10, #4]!
        ldr     r1, [r6, #4]!
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r9], #4
        subs    r8, r8, #1
        bne     LDHY4
        ldr     r3, [pc, #0x284]
        add     r9, r4, #4
        mov     r11, r4
        ldr     r6, [r3]
        mov     r10, #9
LDHY5:
        ldr     r8, [r9]
        ldr     r7, [r11]
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        strlt   r7, [r9]
        strlt   r8, [r11]
        subs    r10, r10, #1
        add     r11, r11, #4
        add     r9, r9, #4
        bne     LDHY5
        ldr     r3, [pc, #0x244]
        ldr     r6, [r4]
        ldr     r7, [r3]
        mov     r1, r7
        mov     r0, r6
        bl      __gtsf2
        cmp     r0, #0
        ldr     r0, [r4, #4]
        movgt   r7, r6
        str     r7, [r4]
        mov     r1, r7
        bl      __subsf3
        ldr     r3, [pc, #0x218]
        ldr     r6, [r3]
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY6
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #4]
LDHY6:
        ldr     r0, [r4, #8]
        ldr     r7, [r4, #4]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY7
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #8]
LDHY7:
        ldr     r0, [r4, #0xC]
        ldr     r7, [r4, #8]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY8
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0xC]
LDHY8:
        ldr     r0, [r4, #0x10]
        ldr     r7, [r4, #0xC]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY9
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x10]
LDHY9:
        ldr     r0, [r4, #0x14]
        ldr     r7, [r4, #0x10]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY10
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x14]
LDHY10:
        ldr     r0, [r4, #0x18]
        ldr     r7, [r4, #0x14]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY11
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x18]
LDHY11:
        ldr     r0, [r4, #0x1C]
        ldr     r7, [r4, #0x18]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY12
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x1C]
LDHY12:
        ldr     r0, [r4, #0x20]
        ldr     r7, [r4, #0x1C]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY13
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x20]
LDHY13:
        ldr     r0, [r4, #0x24]
        ldr     r7, [r4, #0x20]
        mov     r1, r7
        bl      __subsf3
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDHY14
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x24]
LDHY14:
        ldr     r3, [pc, #0x74]
        ldr     r6, [r4, #0x24]
        add     r8, r5, #0x28
        ldr     r7, [r3]
        mov     r0, r6
        mov     r1, r7
        bl      __ltsf2
        cmp     r0, #0
        movlt   r7, r6
        str     r7, [r4, #0x24]
        mov     r1, r8
        mov     r0, r5
        mov     r2, #0x1E
        bl      _ippsMove_32f
        add     r0, sp, #0x10
        mov     r1, r5
        mov     r2, #0xA
        bl      _ippsCopy_32f
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDHY15:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LDHY__2il0floatpacket.1
        .long   LDHY__2il0floatpacket.2
        .long   LDHY__2il0floatpacket.3
        .long   LDHY__2il0floatpacket.4
        .long   LDHY_fg
        .long   LDHY__2il0floatpacket.5
        .long   LDHY__2il0floatpacket.6
        .long   LDHY__2il0floatpacket.7


        .data
        .align  4


LDHY__2il0floatpacket.1:
        .byte   0x52,0x49,0x9D,0x3A
LDHY__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x3F
LDHY__2il0floatpacket.3:
        .byte   0x00,0x00,0x00,0x00
LDHY__2il0floatpacket.4:
        .byte   0x52,0x49,0x1D,0x3A
LDHY__2il0floatpacket.5:
        .byte   0x0A,0xD7,0xA3,0x3B
LDHY__2il0floatpacket.6:
        .byte   0x2E,0x90,0x20,0x3D
LDHY__2il0floatpacket.7:
        .byte   0xD7,0xA3,0x48,0x40


        .data
        .align  4


LDHY_fg_sum:
        .byte   0x46,0xB6,0x73,0x3E,0x5D,0xFE,0x83,0x3E,0x6E,0x34,0x80,0x3E,0x54,0x96,0x81,0x3E
        .byte   0xB7,0xF3,0x7D,0x3E,0x55,0x74,0x84,0x3E,0x5B,0xFE,0x83,0x3E,0xBA,0xFC,0x87,0x3E
        .byte   0xE0,0x4F,0x8D,0x3E,0x80,0x73,0x86,0x3E,0x26,0xE4,0xE3,0x3E,0x65,0x3B,0x0F,0x3F
        .byte   0x6D,0x78,0x1A,0x3F,0x34,0x80,0x07,0x3F,0x31,0x55,0x00,0x3F,0xBC,0x96,0x00,0x3F
        .byte   0xCE,0xCC,0xEC,0x3E,0xF2,0xD2,0xED,0x3E,0xD9,0xAC,0xFA,0x3E,0xEA,0x73,0xF5,0x3E
LDHY_fg:
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
        .byte   0xFC,0xA9,0x71,0x3E,0xA2,0x45,0x76,0x3E,0xC9,0xE5,0x7F,0x3E,0xEE,0x7C,0x7F,0x3E
        .byte   0xD3,0xDE,0x80,0x3E,0xC1,0xA8,0x84,0x3E,0x94,0xF6,0x86,0x3E,0x66,0x66,0x86,0x3E
        .byte   0x78,0x9C,0x82,0x3E,0x44,0x8B,0x6C,0x3E,0x81,0x95,0x03,0x3E,0xA4,0x70,0xBD,0x3D
        .byte   0x09,0x8A,0x9F,0x3D,0x87,0x16,0xD9,0x3D,0x45,0x47,0xF2,0x3D,0x45,0xD8,0xF0,0x3D
        .byte   0xCA,0xC3,0x02,0x3E,0xDC,0xD7,0x01,0x3E,0x8F,0x53,0xF4,0x3D,0x47,0x03,0xF8,0x3D
        .byte   0xA7,0xE8,0xC8,0x3D,0x20,0x41,0x71,0x3D,0xE6,0x3F,0x24,0x3D,0x6F,0xF0,0x85,0x3D
        .byte   0x51,0xDA,0x9B,0x3D,0x2B,0x18,0x95,0x3D,0x9F,0x3C,0xAC,0x3D,0x30,0x2A,0xA9,0x3D
        .byte   0xC0,0xEC,0x9E,0x3D,0x10,0x7A,0xB6,0x3D,0xC8,0x07,0xBD,0x3D,0xCB,0x10,0x47,0x3D
        .byte   0x43,0x1C,0xEB,0x3C,0x16,0xFB,0x4B,0x3D,0x19,0x73,0x57,0x3D,0x5D,0x6D,0x45,0x3D
        .byte   0x92,0x5C,0x7E,0x3D,0xB8,0x40,0x82,0x3D,0xD7,0x34,0x6F,0x3D,0x78,0x9C,0xA2,0x3D


