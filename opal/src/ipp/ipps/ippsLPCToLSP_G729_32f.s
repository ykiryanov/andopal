        .text
        .align  4
        .globl  _ippsLPCToLSP_G729_32f


_ippsLPCToLSP_G729_32f:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r3, r2
        beq     LDIE0
        cmp     r1, #0
        beq     LDIE0
        cmp     r3, #0
        beq     LDIE0
        ldr     r2, [pc, #0x28]
        mov     r12, #4
        str     r12, [sp, #4]
        mov     r12, #0x3C
        str     r12, [sp]
        bl      ownLPCToLSP_G729_32f
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDIE0:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4
        .long   LDIE_grid


        .data
        .align  4


LDIE_grid:
        .byte   0x01,0xF0,0x7F,0x3F,0x2F,0xA6,0x7F,0x3F,0xFD,0x98,0x7E,0x3F,0x26,0xD9,0x7C,0x3F
        .byte   0xE2,0x67,0x7A,0x3F,0xEA,0x46,0x77,0x3F,0x70,0x78,0x73,0x3F,0x20,0xFF,0x6E,0x3F
        .byte   0x1D,0xDE,0x69,0x3F,0x01,0x19,0x64,0x3F,0xD7,0xB3,0x5D,0x3F,0x1E,0xB3,0x56,0x3F
        .byte   0xBD,0x1B,0x4F,0x3F,0x0A,0xF3,0x46,0x3F,0xBD,0x3E,0x3E,0x3F,0xF4,0x04,0x35,0x3F
        .byte   0x25,0x4C,0x2B,0x3F,0x24,0x1B,0x21,0x3F,0x17,0x79,0x16,0x3F,0x78,0x6D,0x0B,0x3F
        .byte   0x00,0x00,0x00,0x3F,0x71,0x71,0xE8,0x3E,0xC8,0x3F,0xD0,0x3E,0xFF,0x7B,0xB7,0x3E
        .byte   0x7A,0x37,0x9E,0x3E,0xED,0x83,0x84,0x3E,0xCE,0xE6,0x54,0x3E,0x5E,0x30,0x20,0x3E
        .byte   0x0A,0x13,0xD6,0x3D,0x46,0x5E,0x56,0x3D,0x00,0x00,0x00,0x00,0x46,0x5E,0x56,0xBD
        .byte   0x0A,0x13,0xD6,0xBD,0x5E,0x30,0x20,0xBE,0xCE,0xE6,0x54,0xBE,0xED,0x83,0x84,0xBE
        .byte   0x7A,0x37,0x9E,0xBE,0xFF,0x7B,0xB7,0xBE,0xC8,0x3F,0xD0,0xBE,0x71,0x71,0xE8,0xBE
        .byte   0x00,0x00,0x00,0xBF,0x78,0x6D,0x0B,0xBF,0x17,0x79,0x16,0xBF,0x24,0x1B,0x21,0xBF
        .byte   0x25,0x4C,0x2B,0xBF,0xF4,0x04,0x35,0xBF,0xBD,0x3E,0x3E,0xBF,0x0A,0xF3,0x46,0xBF
        .byte   0xBD,0x1B,0x4F,0xBF,0x1E,0xB3,0x56,0xBF,0xD7,0xB3,0x5D,0xBF,0x01,0x19,0x64,0xBF
        .byte   0x1D,0xDE,0x69,0xBF,0x20,0xFF,0x6E,0xBF,0x70,0x78,0x73,0xBF,0xEA,0x46,0x77,0xBF
        .byte   0xE2,0x67,0x7A,0xBF,0x26,0xD9,0x7C,0xBF,0xFD,0x98,0x7E,0xBF,0x2F,0xA6,0x7F,0xBF
        .byte   0x01,0xF0,0x7F,0xBF,0x01,0xF0,0x7F,0xBF


