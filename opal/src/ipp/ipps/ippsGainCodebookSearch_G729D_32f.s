        .text
        .align  4
        .globl  _ippsGainCodebookSearch_G729D_32f


_ippsGainCodebookSearch_G729D_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r12, [sp, #0x64]
        mov     r5, r0
        cmp     r5, #0
        beq     LDJA10
        cmp     r2, #0
        beq     LDJA10
        cmp     r3, #0
        beq     LDJA10
        cmp     r12, #0
        beq     LDJA1
        cmp     r12, #1
        beq     LDJA1
LDJA0:
        mvn     r0, #6
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDJA1:
        ldr     r9, [r2]
        cmp     r9, #0
        blt     LDJA0
        cmp     r9, #2
        bgt     LDJA0
        ldr     r7, [r2, #4]
        cmp     r7, #0
        blt     LDJA0
        cmp     r7, #2
        bgt     LDJA0
        ldr     r2, [pc, #0x2CC]
        ldr     r6, [pc, #0x2CC]
        cmp     r12, #1
        ldr     r4, [r2]
        mov     lr, #6
        sub     r2, r6, #0x40
        add     r2, r2, r9, lsl #3
        add     r12, r6, r7, lsl #3
        mov     r8, r9
        mov     r10, r7
        beq     LDJA6
        ldr     r6, [r5]
        str     r6, [sp, #0x38]
        ldr     r0, [r5, #4]
        ldr     r11, [r5, #8]
        ldr     r6, [r5, #0xC]
        ldr     r5, [r5, #0x10]
        str     r10, [sp, #0x24]
        str     r8, [sp, #0x20]
        str     r11, [sp, #0xC]
        str     r5, [sp]
        ldr     r5, [sp, #0x38]
        str     r0, [sp, #0x14]
        str     r7, [sp, #0x18]
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x10]
LDJA2:
        ldr     r3, [r2, #4]
        ldr     r0, [r2], #8
        mov     r8, #0
        mov     r7, r12
        str     r2, [sp, #0x28]
        str     r0, [sp, #8]
        str     r3, [sp, #4]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r9, [sp, #0x1C]
LDJA3:
        ldr     r0, [sp, #8]
        ldr     r1, [r7]
        bl      __addsf3
        ldr     r1, [r7, #4]
        mov     r10, r0
        ldr     r0, [sp, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        bl      __mulsf3
        ldr     r1, [sp]
        mov     r9, r0
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r5
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        mov     r10, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r9, r0
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LDJA4
        mov     r4, r9
        ldr     r0, [sp, #0x1C]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x18]
        add     r0, r8, r0
        str     r0, [sp, #0x24]
LDJA4:
        add     r8, r8, #1
        cmp     r8, #6
        add     r7, r7, #8
        blt     LDJA3
        ldr     lr, [sp, #0x30]
        ldr     r9, [sp, #0x1C]
        ldr     r2, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        subs    lr, lr, #1
        add     r9, r9, #1
        bne     LDJA2
        ldr     r10, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x34]
LDJA5:
        mov     r0, #0
        str     r8, [r3]
        str     r10, [r3, #4]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDJA6:
        ldr     r6, [pc, #0x14C]
        ldr     r6, [r6]
        str     r10, [sp, #0x24]
        str     r8, [sp, #0x20]
        str     r4, [sp, #0x3C]
        str     r7, [sp, #0x18]
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x10]
LDJA7:
        ldr     r4, [r2]
        mov     r8, #0
        mov     r7, r12
        str     r2, [sp, #0x28]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r9, [sp, #0x1C]
LDJA8:
        ldr     r1, [r7]
        mov     r0, r4
        bl      __addsf3
        mov     r10, r0
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LDJA9
        ldr     r1, [r7, #4]
        ldr     r2, [sp, #0x28]
        ldr     r0, [r2, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x10]
        bl      __mulsf3
        ldr     r1, [r5, #0x10]
        mov     r9, r0
        bl      __mulsf3
        ldr     r1, [r5, #4]
        bl      __addsf3
        ldr     r1, [r5]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [r5, #8]
        ldr     r11, [r5, #0xC]
        mov     r10, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        mov     r9, r0
        bl      __ltsf2
        cmp     r0, #0
        bge     LDJA9
        ldr     r2, [sp, #0x1C]
        str     r9, [sp, #0x3C]
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x18]
        add     r2, r8, r2
        str     r2, [sp, #0x24]
LDJA9:
        add     r8, r8, #1
        cmp     r8, #6
        add     r7, r7, #8
        blt     LDJA8
        ldr     lr, [sp, #0x30]
        ldr     r2, [sp, #0x28]
        ldr     r9, [sp, #0x1C]
        ldr     r12, [sp, #0x2C]
        subs    lr, lr, #1
        add     r9, r9, #1
        add     r2, r2, #8
        bne     LDJA7
        ldr     r10, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x34]
        b       LDJA5
LDJA10:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   LDJA__2il0floatpacket.1
        .long   LDJA_gbk2_6k
        .long   LDJA__2il0floatpacket.2


        .data
        .align  4


LDJA__2il0floatpacket.1:
        .byte   0xFF,0xFF,0x7F,0x7F
LDJA__2il0floatpacket.2:
        .byte   0x72,0xF9,0x7F,0x3F


        .data
        .align  4


LDJA_gbk1_6k:
        .byte   0x19,0xC9,0xB6,0x3E,0x00,0x00,0x00,0x00,0xC4,0x0A,0x37,0x3E,0xF2,0xB2,0x86,0x3D
        .byte   0x4A,0x45,0x13,0x3F,0x74,0xB4,0x2A,0x3E,0x8D,0x9C,0xBD,0x3E,0x12,0x6A,0xBE,0x3E
        .byte   0x18,0x08,0x62,0x3E,0xD8,0xD7,0xD2,0x3E,0x72,0x31,0x46,0x3E,0x9B,0xFE,0x10,0x3F
        .byte   0x74,0xB2,0x74,0x3E,0xB8,0x1E,0x49,0x3F,0x90,0xD7,0x9B,0x3E,0xE0,0x2B,0xAE,0x3F
LDJA_gbk2_6k:
        .byte   0x00,0x00,0x00,0x00,0x85,0x7A,0x82,0x3E,0xA8,0x39,0x79,0x3E,0x00,0x00,0x00,0x00
        .byte   0x0F,0xED,0x8B,0x3E,0x5D,0xDE,0xE4,0x3E,0x3A,0x1F,0xF6,0x3E,0xAD,0x6B,0xF4,0x3E
        .byte   0x47,0xCC,0x20,0x3F,0xEB,0xE3,0x31,0x3F,0x12,0x31,0x29,0x3F,0xDF,0xA4,0xD7,0x3F
        .byte   0xEA,0xCF,0x3A,0x3F,0xB2,0xBC,0x27,0x3F,0xD3,0x4D,0x80,0x3F,0xB8,0xB1,0x75,0x3F


