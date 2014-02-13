        .text
        .align  4
        .globl  _ippsFilterUpdateWiener_32s


LAAE_FLTUPWNRA:
_ippsFilterUpdateWiener_32s:
        ldr     r3, [pc, #0x4C]
        stmdb   sp!, {r4 - r7, lr}
        ldr     r4, [r0], #4
LAAE_ippsFilterUpdateWiener_32s_loop:
        mov     r5, #0
        mov     r6, r4, lsr #11
        cmp     r4, #2, 16
        movge   r6, r6, lsr #6
        addge   r5, r5, #1, 24
        cmp     r4, #2, 12
        movge   r6, r6, lsr #4
        addge   r5, r5, #0x3C
        cmp     r4, #1, 8
        movge   r5, #0x57, 30
        addlt   r5, r5, r6, lsl #2
        subs    r2, r2, #1
        ldr     r7, [r3, +r5]
        ldrgt   r4, [r0], #4
        str     r7, [r1], #4
        bgt     LAAE_ippsFilterUpdateWiener_32s_loop
        mov     r0, #0
LAAE_ippsFilterUpdateWiener_32s_Quit:
        ldmia   sp!, {r4 - r7, pc}
        .long   LAAE_FLTUPWNRDATA


        .data
        .align  4


LAAE_WienerTablea:
LAAE_FLTUPWNRDATA:
        .byte   0x00,0x00,0x00,0x00,0x87,0x87,0x87,0x07,0x8E,0xE3,0x38,0x0E,0x0D,0xE5,0x35,0x14
        .byte   0x99,0x99,0x99,0x19,0x9E,0xE7,0x79,0x1E,0x2E,0xBA,0xE8,0x22,0x9B,0xDE,0xF4,0x26
        .byte   0xAA,0xAA,0xAA,0x2A,0xE1,0x7A,0x14,0x2E,0xB1,0x13,0x3B,0x31,0x09,0xED,0x25,0x34
        .byte   0xB6,0x6D,0xDB,0x36,0x7B,0x1A,0x61,0x39,0xBB,0xBB,0xBB,0x3B,0xDE,0x7B,0xEF,0x3D
        .byte   0x00,0x00,0x00,0x40,0x1F,0x7C,0xF0,0x41,0xC3,0xC3,0xC3,0x43,0xC5,0x57,0x7C,0x45
        .byte   0xC7,0x71,0x1C,0x47,0xD6,0x0D,0xA6,0x48,0x86,0xF2,0x1A,0x4A,0xCB,0xB7,0x7C,0x4B
        .byte   0xCC,0xCC,0xCC,0x4C,0xE0,0x7C,0x0C,0x4E,0xCF,0xF3,0x3C,0x4F,0x7D,0x41,0x5F,0x50
        .byte   0x17,0x5D,0x74,0x51,0xD2,0x27,0x7D,0x52,0x4D,0x6F,0x7A,0x53,0xA8,0xEF,0x6C,0x54
        .byte   0x55,0x55,0x55,0x55,0xB1,0x3E,0x34,0x56,0x70,0x3D,0x0A,0x57,0xD7,0xD7,0xD7,0x57
        .byte   0xD8,0x89,0x9D,0x58,0x09,0xC6,0x5B,0x59,0x84,0xF6,0x12,0x5A,0xAC,0x7D,0xC3,0x5A
        .byte   0xDB,0xB6,0x6D,0x5B,0x04,0xF7,0x11,0x5C,0x3D,0x8D,0xB0,0x5C,0x41,0xC3,0x49,0x5D
        .byte   0xDD,0xDD,0xDD,0x5D,0x60,0x1D,0x6D,0x5E,0xEF,0xBD,0xF7,0x5E,0xDF,0xF7,0x7D,0x5F
        .byte   0x00,0x00,0x00,0x60,0xE0,0x07,0x7E,0x60,0x0F,0x3E,0xF8,0x60,0x54,0xCE,0x6E,0x61
        .byte   0xE1,0xE1,0xE1,0x61,0x89,0x9F,0x51,0x62,0xE2,0x2B,0xBE,0x62,0x76,0xA9,0x27,0x63
        .byte   0xE3,0x38,0x8E,0x63,0xFC,0xF8,0xF1,0x63,0xEB,0x06,0x53,0x64,0x4B,0x7E,0xB1,0x64
        .byte   0x43,0x79,0x0D,0x65,0x9F,0x10,0x67,0x65,0xE5,0x5B,0xBE,0x65,0x6A,0x71,0x13,0x66
        .byte   0x66,0x66,0x66,0x66,0x71,0x1C,0xC7,0x71,0x76,0x62,0x27,0x76,0x78,0x78,0x78,0x78
        .byte   0x79,0x9E,0xE7,0x79,0xAE,0x47,0xE1,0x7A,0xA7,0x11,0x96,0x7B,0xC1,0x07,0x1F,0x7C
        .byte   0xDD,0x60,0x8A,0x7C,0xCE,0xC7,0xE0,0x7C,0x7D,0xD2,0x27,0x7D,0xEB,0x43,0x63,0x7D
        .byte   0x60,0xBC,0x95,0x7D,0x70,0x1F,0xC1,0x7D,0xD6,0xD1,0xE6,0x7D,0x7E,0xE0,0x07,0x7E
        .byte   0x07,0xFC,0x01,0x7F,0xB5,0x37,0x56,0x7F,0x80,0x7F,0x80,0x7F,0x43,0xEB,0x99,0x7F
        .byte   0x68,0xE3,0xAA,0x7F,0x21,0x05,0xB7,0x7F,0xF0,0x1F,0xC0,0x7F,0xFF,0xFF,0xFF,0x7F


