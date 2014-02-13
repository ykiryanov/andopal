        .text
        .align  4
        .globl  _ippsGainCodebookSearch_G729_32f


_ippsGainCodebookSearch_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r12, [sp, #0x60]
        mov     r6, r0
        cmp     r6, #0
        beq     LDIZ9
        cmp     r2, #0
        beq     LDIZ9
        cmp     r3, #0
        beq     LDIZ9
        cmp     r12, #0
        beq     LDIZ1
        cmp     r12, #1
        beq     LDIZ1
LDIZ0:
        mvn     r0, #6
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LDIZ1:
        ldr     r8, [r2]
        cmp     r8, #0
        blt     LDIZ0
        cmp     r8, #4
        bgt     LDIZ0
        ldr     r7, [r2, #4]
        cmp     r7, #0
        blt     LDIZ0
        cmp     r7, #8
        bgt     LDIZ0
        ldr     lr, [pc, #0x2E8]
        ldr     r4, [pc, #0x2E8]
        cmp     r12, #1
        sub     r2, lr, #0x40
        add     r12, lr, r7, lsl #3
        add     r2, r2, r8, lsl #3
        mov     lr, #4
        beq     LDIZ5
        ldr     r4, [r4]
        mov     r11, r7
        mov     r0, r8
        str     r4, [sp, #0x38]
        ldr     r10, [r6]
        ldr     r9, [r6, #4]
        ldr     r5, [r6, #8]
        ldr     r4, [r6, #0xC]
        ldr     r6, [r6, #0x10]
        str     r9, [sp, #0x30]
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x10]
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x14]
        str     r3, [sp]
        str     r1, [sp, #0x2C]
LDIZ2:
        ldr     r3, [r2, #4]
        ldr     r9, [r2], #8
        mov     r8, #0
        mov     r7, r12
        str     r2, [sp, #0xC]
        str     r9, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     r0, [sp, #0x18]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LDIZ3:
        ldr     r1, [r7]
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        ldr     r1, [r7, #4]
        mov     r10, r0
        ldr     r0, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        mov     r9, r0
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r10
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDIZ4
        mov     r6, r9
        ldr     r0, [sp, #0x18]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x1C]
        add     r0, r8, r0
        str     r0, [sp, #0x10]
LDIZ4:
        add     r8, r8, #1
        cmp     r8, #8
        add     r7, r7, #8
        blt     LDIZ3
        ldr     lr, [sp, #4]
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xC]
        ldr     r12, [sp, #8]
        subs    lr, lr, #1
        add     r0, r0, #1
        bne     LDIZ2
        ldr     r3, [sp]
        ldr     r11, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        str     r8, [r3]
        str     r11, [r3, #4]
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LDIZ5:
        ldr     r5, [r4]
        ldr     r9, [pc, #0x164]
        mov     r10, r7
        ldr     r4, [r9]
        mov     r9, r8
        str     r5, [sp, #0x38]
        str     r10, [sp, #0x30]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x14]
        str     r3, [sp]
        str     r1, [sp, #0x2C]
LDIZ6:
        ldr     r5, [r2]
        mov     r8, #0
        mov     r7, r12
        str     r2, [sp, #0xC]
        str     r9, [sp, #0x34]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LDIZ7:
        ldr     r1, [r7]
        mov     r0, r5
        bl      __addsf3
        mov     r10, r0
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LDIZ8
        ldr     r1, [r7, #4]
        ldr     r2, [sp, #0xC]
        ldr     r0, [r2, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        bl      __mulsf3
        ldr     r1, [r6, #0x10]
        mov     r9, r0
        bl      __mulsf3
        ldr     r1, [r6, #4]
        bl      __addsf3
        ldr     r1, [r6]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [r6, #8]
        ldr     r11, [r6, #0xC]
        mov     r10, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r9, r0
        bl      __ltsf2
        cmp     r0, #0
        bge     LDIZ8
        ldr     r2, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x1C]
        add     r2, r8, r2
        str     r2, [sp, #0x30]
LDIZ8:
        add     r8, r8, #1
        cmp     r8, #8
        add     r7, r7, #8
        blt     LDIZ7
        ldr     lr, [sp, #4]
        ldr     r2, [sp, #0xC]
        ldr     r9, [sp, #0x34]
        ldr     r12, [sp, #8]
        subs    lr, lr, #1
        add     r9, r9, #1
        add     r2, r2, #8
        bne     LDIZ6
        ldr     r3, [sp]
        ldr     r10, [sp, #0x30]
        ldr     r8, [sp, #0x14]
        str     r8, [r3]
        str     r10, [r3, #4]
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LDIZ9:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   LDIZ_gbk2
        .long   LDIZ__2il0floatpacket.1
        .long   LDIZ__2il0floatpacket.2


        .data
        .align  4


LDIZ__2il0floatpacket.1:
        .byte   0xFF,0xFF,0x7F,0x7F
LDIZ__2il0floatpacket.2:
        .byte   0x72,0xF9,0x7F,0x3F


        .data
        .align  4


LDIZ_gbk1:
        .byte   0xAC,0xC5,0x27,0x37,0xA9,0x86,0x3D,0x3E,0x09,0xFC,0xC1,0x3D,0xE6,0x91,0x97,0x3E
        .byte   0x63,0xEC,0xE4,0x3D,0x90,0xF5,0x1C,0x3F,0xB1,0x6C,0x66,0x3B,0x58,0xE7,0x28,0x3F
        .byte   0xF6,0x24,0xF0,0x3D,0xFD,0x2F,0x91,0x3F,0x8F,0xA6,0x4A,0x3E,0x21,0x75,0x9B,0x3F
        .byte   0x31,0x5B,0xB2,0x3C,0x9B,0x90,0xE6,0x3F,0x46,0x61,0x27,0x3E,0x6E,0x34,0x54,0x40
LDIZ_gbk2:
        .byte   0x70,0xB5,0x4E,0x3D,0xBA,0xA4,0x7A,0x3E,0x9E,0x43,0xF9,0x3D,0xAC,0xC5,0x27,0x37
        .byte   0xB3,0xB3,0xA0,0x3E,0xE8,0x2F,0x94,0x3D,0x0F,0x80,0xC0,0x3E,0x52,0xB5,0x95,0x3E
        .byte   0x87,0xDC,0xFC,0x3E,0xB8,0xE9,0x17,0x3F,0x06,0x80,0x0E,0x3F,0x0C,0x40,0x83,0x3D
        .byte   0x82,0x36,0x25,0x3F,0x88,0x67,0xB9,0x3E,0x76,0xC5,0x34,0x3F,0xDC,0x9D,0x15,0x3E
        .byte   0x05,0x32,0x4F,0x3F,0x7A,0x8F,0xCB,0x3E,0x04,0xCB,0x5D,0x3F,0x76,0xDD,0x4B,0x3E
        .byte   0x2E,0x71,0x6C,0x3F,0x89,0x95,0x19,0x3F,0x71,0xE5,0x6C,0x3F,0xA9,0x12,0xDF,0x3F
        .byte   0xBF,0x28,0x71,0x3F,0x08,0xCA,0xED,0x3C,0xF8,0xC3,0x7B,0x3F,0x91,0x0D,0xD4,0x3E
        .byte   0x78,0x27,0x87,0x3F,0x72,0xA3,0x68,0x3E,0x9F,0x3A,0x94,0x3F,0xDC,0x7E,0x39,0x3F


