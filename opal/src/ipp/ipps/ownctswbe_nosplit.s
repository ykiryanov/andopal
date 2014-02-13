        .data
        .align  4
        .globl  ownTab_pow2
        .globl  ownTab_factorial
        .globl  Ds_
        .globl  Ia_
        .globl  Is_


ownTab_pow2:
        .byte   0x80,0x00,0x40,0x00,0x20,0x00,0x10,0x00,0x08,0x00,0x04,0x00,0x02,0x00,0x01,0x00
ownTab_factorial:
        .byte   0xB0,0x13,0xD0,0x02,0x78,0x00,0x18,0x00,0x06,0x00,0x02,0x00,0x01,0x00,0x01,0x00
Ds_:
        .byte   0x00,0x00,0x03,0x00,0x0F,0x00,0x3F,0x00,0xFF,0x00,0x00,0x00,0x40,0x00,0xC0,0x00
        .byte   0x00,0x00,0x10,0x00,0x30,0x00,0x70,0x00,0xF0,0x00,0x01,0x00,0x07,0x00,0x1F,0x00
        .byte   0x7F,0x00,0x80,0x00,0x83,0x00,0x8F,0x00,0xBF,0x00,0x00,0x00,0x80,0x00,0x00,0x00
        .byte   0x04,0x00,0x0C,0x00,0x1C,0x00,0x3C,0x00,0x7C,0x00,0xFC,0x00,0x00,0x00,0x03,0x00
        .byte   0x0F,0x00,0x3F,0x00,0x41,0x00,0x47,0x00,0x5F,0x00,0xC0,0x00,0xC3,0x00,0xCF,0x00
        .byte   0xFF,0x00,0x00,0x00,0x20,0x00,0x60,0x00,0x80,0x00,0xA0,0x00,0xE0,0x00,0x00,0x00
        .byte   0x01,0x00,0x03,0x00,0x07,0x00,0x0F,0x00,0x1F,0x00,0x3F,0x00,0x7F,0x00,0xFF,0x00
        .byte   0x01,0x00,0x07,0x00,0x1F,0x00,0x20,0x00,0x23,0x00,0x2F,0x00,0x61,0x00,0x67,0x00
        .byte   0x7F,0x00,0xE0,0x00,0xE3,0x00,0xEF,0x00,0x00,0x00,0x08,0x00,0x18,0x00,0x38,0x00
        .byte   0x78,0x00,0x80,0x00,0x88,0x00,0x98,0x00,0xB8,0x00,0xF8,0x00,0x00,0x00,0x40,0x00
        .byte   0xC0,0x00,0x00,0x00,0x03,0x00,0x0F,0x00,0x3F,0x00,0x81,0x00,0x87,0x00,0x9F,0x00
        .byte   0xFF,0x00,0x00,0x00,0x03,0x00,0x0F,0x00,0x11,0x00,0x17,0x00,0x30,0x00,0x33,0x00
        .byte   0x3F,0x00,0x71,0x00,0x77,0x00,0xF0,0x00,0xF3,0x00,0xFF,0x00,0x00,0x00,0x02,0x00
        .byte   0x06,0x00,0x0E,0x00,0x1E,0x00,0x3E,0x00,0x7E,0x00,0x80,0x00,0x82,0x00,0x86,0x00
        .byte   0x8E,0x00,0x9E,0x00,0xBE,0x00,0xFE,0x00,0x00,0x00,0x10,0x00,0x30,0x00,0x40,0x00
        .byte   0x50,0x00,0x70,0x00,0xC0,0x00,0xD0,0x00,0xF0,0x00,0x01,0x00,0x07,0x00,0x1F,0x00
        .byte   0x40,0x00,0x43,0x00,0x4F,0x00,0x7F,0x00,0x80,0x00,0x83,0x00,0x8F,0x00,0xBF,0x00
        .byte   0xC1,0x00,0xC7,0x00,0xDF,0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xC0,0x00,0x00,0x00
        .byte   0x20,0x00,0x60,0x00,0xE0,0x00,0x00,0x00,0x10,0x00,0x30,0x00,0x70,0x00,0x80,0x00
        .byte   0x90,0x00,0xB0,0x00,0xF0,0x00,0x00,0x00,0x20,0x00,0x40,0x00,0x60,0x00,0x80,0x00
        .byte   0xA0,0x00,0xC0,0x00,0xE0,0x00,0x01,0x00,0x07,0x00,0x1F,0x00,0x7F,0x00,0x80,0x00
        .byte   0x83,0x00,0x8F,0x00,0xBF,0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x40,0x00,0xC0,0x00
        .byte   0x00,0x00,0x20,0x00,0x60,0x00,0x80,0x00,0xA0,0x00,0xE0,0x00,0x00,0x00,0x40,0x00
        .byte   0x80,0x00,0xC0,0x00,0x00,0x00,0x03,0x00,0x0F,0x00,0x3F,0x00,0x81,0x00,0x87,0x00
        .byte   0x9F,0x00,0xFF,0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xC0,0x00,0x00,0x00,0x40,0x00
        .byte   0xC0,0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xC0,0x00,0x00,0x00,0x80,0x00,0x00,0x00
        .byte   0x40,0x00,0x80,0x00,0xC0,0x00,0x00,0x00,0x40,0x00,0xC0,0x00,0x00,0x00,0x40,0x00
        .byte   0x80,0x00,0xC0,0x00,0x00,0x00,0x40,0x00,0x80,0x00,0xC0,0x00,0x00,0x00,0x80,0x00
Ia_:
        .byte   0x00,0x00,0x05,0x00,0x08,0x00,0x0D,0x00,0x15,0x00,0x17,0x00,0x1E,0x00,0x29,0x00
        .byte   0x2F,0x00,0x38,0x00,0x44,0x00,0x4E,0x00,0x51,0x00,0x59,0x00,0x66,0x00,0x74,0x00
        .byte   0x7D,0x00,0x8B,0x00,0x8F,0x00,0x93,0x00,0x9B,0x00,0xA3,0x00,0xAB,0x00,0xAD,0x00
        .byte   0xB0,0x00,0xB6,0x00,0xBA,0x00,0xC2,0x00,0xC6,0x00,0xC9,0x00,0xCD,0x00,0xCF,0x00
        .byte   0xD3,0x00,0xD6,0x00,0xDA,0x00,0xDE,0x00
Is_:
        .byte   0x00,0x00,0x01,0x00,0x1D,0x00,0x63,0x00,0x7F,0x00,0x80,0x00,0x9C,0x00,0xD4,0x00
        .byte   0x00,0x01,0x46,0x01,0x5E,0x02,0x02,0x04,0x1A,0x05,0x60,0x05,0x98,0x05,0xB0,0x06
        .byte   0x58,0x07,0x60,0x07,0x68,0x07,0x10,0x08,0x28,0x09,0xF0,0x00,0xF8,0x00,0x00,0x00
        .byte   0x1C,0x00,0xC4,0x00,0x68,0x02,0x98,0x04,0x3C,0x06,0xE4,0x06,0x00,0x07,0x1C,0x07
        .byte   0xC0,0x08,0x64,0x0A,0x80,0x0A,0xD0,0x0B,0x30,0x10,0x80,0x11,0x9C,0x11,0x40,0x13
        .byte   0xE4,0x14,0x60,0x09,0x08,0x0A,0x58,0x0B,0x00,0x0C,0xA8,0x0C,0xF8,0x0D,0x00,0x15
        .byte   0x01,0x15,0x09,0x15,0x25,0x15,0x5D,0x15,0xA3,0x15,0xDB,0x15,0xF7,0x15,0xFF,0x15
        .byte   0x00,0x16,0x18,0x17,0x48,0x19,0x80,0x19,0x28,0x1A,0xB8,0x20,0x00,0x24,0x48,0x27
        .byte   0xD8,0x2D,0x80,0x2E,0xB8,0x2E,0xE8,0x30,0x00,0x32,0x18,0x33,0x78,0x37,0x08,0x3E
        .byte   0x68,0x42,0x80,0x43,0x98,0x44,0xF8,0x48,0x88,0x4F,0xE8,0x53,0xA0,0x0E,0xBC,0x0E
        .byte   0xF4,0x0E,0x00,0x55,0x08,0x55,0xB0,0x55,0xC8,0x56,0x00,0x57,0x38,0x57,0x50,0x58
        .byte   0xF8,0x58,0x00,0x59,0x46,0x59,0xEA,0x5A,0x30,0x5B,0x90,0x5F,0xF0,0x63,0x94,0x65
        .byte   0x6C,0x6F,0x10,0x71,0x70,0x75,0xD0,0x79,0x16,0x7A,0xBA,0x7B,0x00,0x7C,0x38,0x7C
        .byte   0x88,0x7D,0xD0,0x80,0x30,0x85,0x78,0x88,0xC8,0x89,0x00,0x8A,0x38,0x8A,0x88,0x8B
        .byte   0xD0,0x8E,0x30,0x93,0x78,0x96,0xC8,0x97,0x00,0x98,0xA4,0x99,0xEC,0x9C,0x90,0x9E
        .byte   0xD8,0xA1,0x68,0xA8,0xB0,0xAB,0x54,0xAD,0x9C,0xB0,0x40,0xB2,0x90,0xB3,0xF0,0xB7
        .byte   0x40,0xB9,0x78,0xB9,0xC0,0xBC,0x08,0xC0,0x40,0xC0,0x78,0xC0,0xC0,0xC3,0x08,0xC7
        .byte   0x40,0xC7,0x90,0xC8,0xF0,0xCC,0x10,0x0F,0x48,0x0F,0x80,0x0F,0xB8,0x0F,0x40,0xCE
        .byte   0x78,0xCE,0x20,0xCF,0xC8,0xCF,0x00,0xD0,0x18,0xD1,0x60,0xD4,0xA8,0xD7,0xC0,0xD8
        .byte   0xD8,0xD9,0x20,0xDD,0x68,0xE0,0x80,0xE1,0xD0,0xE2,0x20,0xE4,0x70,0xE5,0xC0,0xE6
        .byte   0x10,0xE8,0x60,0xE9,0xB0,0xEA,0x00,0xEC,0x38,0xEC,0x50,0xED,0xF8,0xED,0x00,0xEE
        .byte   0x08,0xEE,0xB0,0xEE,0xC8,0xEF,0xF0,0x0F,0xF8,0x0F,0x00,0xF0,0x1C,0xF0,0x54,0xF0
        .byte   0x70,0xF0,0x18,0xF1,0x68,0xF2,0x10,0xF3,0xB8,0xF3,0x08,0xF5,0xB0,0xF5,0xE8,0xF5
        .byte   0x20,0xF6,0x58,0xF6,0x90,0xF6,0x98,0xF6,0x40,0xF7,0x58,0xF8,0x90,0xF8,0xC8,0xF8
        .byte   0xE0,0xF9,0x88,0xFA,0x90,0xFA,0xC8,0xFA,0x00,0xFB,0x38,0xFB,0x70,0xFB,0x8C,0xFB
        .byte   0xC4,0xFB,0xE0,0xFB,0x18,0xFC,0x50,0xFC,0x88,0xFC,0xC0,0xFC,0xC8,0xFC,0xD0,0xFC
        .byte   0x08,0xFD,0x40,0xFD,0x78,0xFD,0xB0,0xFD,0xCC,0xFD,0x04,0xFE,0x20,0xFE,0x58,0xFE
        .byte   0x90,0xFE,0xC8,0xFE,0x00,0xFF,0x38,0xFF,0x70,0xFF,0xA8,0xFF,0xE0,0xFF,0xE8,0xFF


