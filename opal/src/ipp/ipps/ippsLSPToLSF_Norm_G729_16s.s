        .text
        .align  4
        .globl  _ippsLSPToLSF_Norm_G729_16s


_ippsLSPToLSF_Norm_G729_16s:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LDST3
        cmp     r1, #0
        beq     LDST3
        ldr     r3, [pc, #0x74]
        add     r0, r0, #0x12
        add     r1, r1, #0x12
        mov     lr, #0x3F
        mov     r12, #9
        sub     r2, r3, #0x80
LDST0:
        ldrsh   r4, [r0], #-2
        mov     r5, lr, lsl #1
        ldrsh   r5, [r2, +r5]
        cmp     r5, r4
        bge     LDST2
        add     r6, r2, lr, lsl #1
LDST1:
        sub     r6, r6, #2
        ldrsh   r5, [r6]
        sub     lr, lr, #1
        cmp     r5, r4
        blt     LDST1
LDST2:
        mov     r6, lr, lsl #1
        ldrsh   r6, [r3, +r6]
        sub     r4, r4, r5
        subs    r12, r12, #1
        mul     r6, r4, r6
        mov     r4, lr, lsl #8
        add     r5, r6, #2, 22
        add     r5, r4, r5, asr #12
        strh    r5, [r1], #-2
        bpl     LDST0
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LDST3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}
        .long   LDST_acos12


        .data
        .align  4


LDST_cos15:
        .byte   0xFF,0x7F,0xD9,0x7F,0x62,0x7F,0x9D,0x7E,0x8A,0x7D,0x2A,0x7C,0x7D,0x7A,0x85,0x78
        .byte   0x42,0x76,0xB6,0x73,0xE3,0x70,0xCA,0x6D,0x6E,0x6A,0xD0,0x66,0xF2,0x62,0xD7,0x5E
        .byte   0x82,0x5A,0xF6,0x55,0x34,0x51,0x40,0x4C,0x1D,0x47,0xCE,0x41,0x57,0x3C,0xBA,0x36
        .byte   0xFC,0x30,0x1F,0x2B,0x28,0x25,0x1A,0x1F,0xF9,0x18,0xC8,0x12,0x8C,0x0C,0x48,0x06
        .byte   0x00,0x00,0xB8,0xF9,0x74,0xF3,0x38,0xED,0x07,0xE7,0xE6,0xE0,0xD8,0xDA,0xE1,0xD4
        .byte   0x04,0xCF,0x46,0xC9,0xA9,0xC3,0x32,0xBE,0xE3,0xB8,0xC0,0xB3,0xCC,0xAE,0x0A,0xAA
        .byte   0x7E,0xA5,0x29,0xA1,0x0E,0x9D,0x30,0x99,0x92,0x95,0x36,0x92,0x1D,0x8F,0x4A,0x8C
        .byte   0xBE,0x89,0x7B,0x87,0x83,0x85,0xD6,0x83,0x76,0x82,0x63,0x81,0x9E,0x80,0x27,0x80
LDST_acos12:
        .byte   0xF9,0x96,0x94,0xDD,0x35,0xEB,0x1B,0xF1,0x5D,0xF4,0x74,0xF6,0xDF,0xF7,0xED,0xF8
        .byte   0xB8,0xF9,0x56,0xFA,0xD6,0xFA,0x3D,0xFB,0x94,0xFB,0xDD,0xFB,0x1A,0xFC,0x4E,0xFC
        .byte   0x7B,0xFC,0xA3,0xFC,0xC5,0xFC,0xE3,0xFC,0xFC,0xFC,0x12,0xFD,0x26,0xFD,0x37,0xFD
        .byte   0x45,0xFD,0x51,0xFD,0x5B,0xFD,0x64,0xFD,0x6A,0xFD,0x6F,0xFD,0x72,0xFD,0x74,0xFD
        .byte   0x74,0xFD,0x72,0xFD,0x6F,0xFD,0x6A,0xFD,0x64,0xFD,0x5B,0xFD,0x51,0xFD,0x45,0xFD
        .byte   0x37,0xFD,0x26,0xFD,0x12,0xFD,0xFC,0xFC,0xE3,0xFC,0xC5,0xFC,0xA3,0xFC,0x7B,0xFC
        .byte   0x4E,0xFC,0x1A,0xFC,0xDD,0xFB,0x94,0xFB,0x3D,0xFB,0xD6,0xFA,0x56,0xFA,0xB8,0xF9
        .byte   0xED,0xF8,0xDF,0xF7,0x74,0xF6,0x5D,0xF4,0x1B,0xF1,0x35,0xEB,0x94,0xDD,0xF9,0x96


