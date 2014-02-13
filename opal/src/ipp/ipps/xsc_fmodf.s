        .text
        .align  4
        .globl  fmodf


fmodf:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0xC
        mov     r3, r0
        str     r1, [sp, #8]
        mov     r2, r3, lsl #1
        cmp     r2, #0xFF, 8
        str     r0, [sp, #4]
        mvn     r1, #2, 2
        bcs     LACM0
        ldr     lr, [sp, #8]
        mov     r12, lr, lsl #1
        cmp     r12, #0xFF, 8
        bcs     LACM0
        cmp     r12, #0
        bne     LACM5
LACM0:
        cmp     r2, #0xFF, 8
        bhi     LACM4
        ldr     lr, [sp, #8]
        mov     r12, lr, lsl #1
        cmp     r12, #0xFF, 8
        bhi     LACM3
        cmp     r2, #0xFF, 8
        beq     LACM1
        cmp     r12, #0
        bne     LACM2
LACM1:
        mov     r3, r1, lsl #22
LACM2:
        cmp     r12, #0
        beq     LACM15
        mov     r0, r3
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LACM3:
        orr     r0, lr, #1, 10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LACM4:
        orr     r0, r3, #1, 10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LACM5:
        and     r12, r3, r1
        and     r2, lr, r1
        cmp     r12, r2
        bic     r3, r3, r1
        blt     LACM14
        mov     r4, r12, lsl #1
        str     r2, [sp, #8]
        movs    r0, r4, lsr #24
        mvn     r4, #0xFF, 8
        str     r12, [sp, #4]
        and     lr, r12, r4
        orrne   lr, lr, #2, 10
        subne   r0, r0, #1
        cmp     r12, #0
        rsblt   lr, lr, #0
        mov     r12, r2, lsl #1
        rsb     r0, r0, #0x95
        movs    r5, r12, lsr #24
        and     r12, r2, r4
        orrne   r12, r12, #2, 10
        subne   r5, r5, #1
        cmp     r2, #0
        rsblt   r12, r12, #0
        cmp     lr, #2, 10
        rsb     r2, r5, #0x95
        bcs     LACM6
        clz     r4, lr
        sub     r4, r4, #8
        mov     lr, lr, lsl r4
        add     r0, r0, r4
LACM6:
        cmp     r12, #2, 10
        bcc     LACM17
LACM7:
        sub     r4, r2, r0
        bic     r2, lr, #2, 2
        movs    r5, r4, asr #2
        mov     lr, r12, lsl #1
        mov     r7, r12, lsl #2
        mov     r6, r12, lsl #3
        mov     r12, r12, lsl #4
        sub     r8, r4, r5, lsl #2
        beq     LACM9
LACM8:
        mov     r2, r2, lsl #4
        cmp     r2, r12
        subcs   r2, r2, r12
        cmp     r2, r6
        subcs   r2, r2, r6
        cmp     r2, r7
        subcs   r2, r2, r7
        cmp     r2, lr
        subcs   r2, r2, lr
        subs    r5, r5, #1
        bne     LACM8
LACM9:
        cmp     r8, #0
        beq     LACM11
LACM10:
        mov     r2, r2, lsl #1
        cmp     r2, lr
        subcs   r2, r2, lr
        subs    r8, r8, #1
        bne     LACM10
LACM11:
        mov     r2, r2, lsl #1
        cmp     r2, lr
        subcs   r2, r2, lr
        add     r4, r0, r4
        cmp     r2, #0
        add     r0, r4, #1
        rsblt   r12, r2, #0
        movge   r12, r2
        clz     lr, r12
        add     r0, r0, lr
        cmp     r2, #0
        rsb     r0, r0, #0x9D
        mvneq   r0, #0
        cmp     r0, #0xFD
        bhi     LACM12
        sub     lr, lr, #1
        mov     lr, r12, lsl lr
        add     r12, lr, #0x40
        mov     r0, r0, lsl #23
        bic     r1, r2, r1
        add     r12, r0, r12, lsr #7
        orr     r1, r12, r1
        b       LACM13
LACM12:
        cmp     r0, #0
        bic     r1, r2, r1
        ble     LACM16
        mov     r0, #0xFE, 10
        orr     r0, r0, #1, 2
        orr     r0, r1, r0
        orr     r1, r0, r1
LACM13:
        eor     r0, r3, r1
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LACM14:
        eor     r0, r3, r12
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LACM15:
        mov     r2, sp
        add     r1, sp, #8
        add     r0, sp, #4
        str     r3, [sp]
        mov     r3, #0x7A
        bl      __libm_error_support
        ldr     r3, [sp]
        mov     r0, r3
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r8, pc}
LACM16:
        rsb     r0, r0, #7
        mov     lr, r12, lsl lr
        mov     r0, lr, lsr r0
        add     r0, r0, #1
        orr     r1, r1, r0, asr #1
        b       LACM13
LACM17:
        clz     r4, r12
        sub     r4, r4, #8
        mov     r12, r12, lsl r4
        add     r2, r4, r2
        b       LACM7


        .data
        .align  4


LACM_sgl_recip_tbl:
        .byte   0xC0,0xFF,0xC1,0xFF,0xC2,0xFF,0xC3,0xFF,0xC4,0xFF,0xC5,0xFF,0xC6,0xFF,0xC7,0xFF
        .byte   0xC8,0xFF,0xC8,0xFF,0xC9,0xFF,0xCA,0xFF,0xCA,0xFF,0xCB,0xFF,0xCC,0xFF,0xCC,0xFF
        .byte   0xCD,0xFF,0xCE,0xFF,0xCE,0xFF,0xCF,0xFF,0xD0,0xFF,0xD0,0xFF,0xD1,0xFF,0xD1,0xFF
        .byte   0xD2,0xFF,0xD2,0xFF,0xD3,0xFF,0xD3,0xFF,0xD4,0xFF,0xD4,0xFF,0xD5,0xFF,0xD5,0xFF
        .byte   0xD6,0xFF,0xD6,0xFF,0xD6,0xFF,0xD7,0xFF,0xD7,0xFF,0xD8,0xFF,0xD8,0xFF,0xD8,0xFF
        .byte   0xD9,0xFF,0xD9,0xFF,0xDA,0xFF,0xDA,0xFF,0xDA,0xFF,0xDB,0xFF,0xDB,0xFF,0xDB,0xFF
        .byte   0xDC,0xFF,0xDC,0xFF,0xDC,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDE,0xFF
        .byte   0xDE,0xFF,0xDE,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xE0,0xFF,0xE0,0xFF
LACM_log_coeffs_25:
        .byte   0x00,0x00,0x00,0xC0,0xAB,0xAA,0xAA,0x2A,0x00,0x00,0x00,0xE0,0x9A,0x99,0x99,0x19
        .byte   0xAB,0xAA,0xAA,0xEA,0x92,0x24,0x49,0x12,0x00,0x00,0x00,0xF0
LACM_rcp_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41
LACM_rsqrt_table:
        .byte   0xFE,0xFC,0xFA,0xF8,0xF6,0xF4,0xF2,0xF0,0xEE,0xED,0xEB,0xE9,0xE7,0xE6,0xE4,0xE2
        .byte   0xE1,0xDF,0xDD,0xDC,0xDA,0xD8,0xD7,0xD5,0xD4,0xD2,0xD1,0xCF,0xCE,0xCC,0xCB,0xC9
        .byte   0xC8,0xC7,0xC5,0xC4,0xC2,0xC1,0xC0,0xBE,0xBD,0xBC,0xBA,0xB9,0xB8,0xB7,0xB5,0xB4
        .byte   0xB3,0xB2,0xB0,0xAF,0xAE,0xAD,0xAC,0xAB,0xA9,0xA8,0xA7,0xA6,0xA5,0xA4,0xA3,0xA2
        .byte   0xA0,0x9F,0x9E,0x9D,0x9C,0x9B,0x9A,0x99,0x98,0x97,0x96,0x95,0x94,0x93,0x92,0x91
        .byte   0x90,0x8F,0x8E,0x8D,0x8C,0x8B,0x8B,0x8A,0x89,0x88,0x87,0x86,0x85,0x84,0x83,0x83
        .byte   0x82,0x81,0x80,0x7F,0x7E,0x7D,0x7D,0x7C,0x7B,0x7A,0x79,0x79,0x78,0x77,0x76,0x75
        .byte   0x75,0x74,0x73,0x72,0x72,0x71,0x70,0x6F,0x6F,0x6E,0x6D,0x6C,0x6C,0x6B,0x6A,0x6A
        .byte   0x68,0x67,0x65,0x64,0x63,0x61,0x60,0x5F,0x5D,0x5C,0x5B,0x5A,0x58,0x57,0x56,0x55
        .byte   0x54,0x52,0x51,0x50,0x4F,0x4E,0x4D,0x4C,0x4B,0x4A,0x48,0x47,0x46,0x45,0x44,0x43
        .byte   0x42,0x41,0x40,0x3F,0x3E,0x3D,0x3C,0x3C,0x3B,0x3A,0x39,0x38,0x37,0x36,0x35,0x34
        .byte   0x33,0x33,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2D,0x2C,0x2B,0x2A,0x29,0x29,0x28,0x27
        .byte   0x26,0x26,0x25,0x24,0x23,0x23,0x22,0x21,0x20,0x20,0x1F,0x1E,0x1E,0x1D,0x1C,0x1C
        .byte   0x1B,0x1A,0x19,0x19,0x18,0x17,0x17,0x16,0x16,0x15,0x14,0x14,0x13,0x12,0x12,0x11
        .byte   0x11,0x10,0x0F,0x0F,0x0E,0x0E,0x0D,0x0C,0x0C,0x0B,0x0B,0x0A,0x0A,0x09,0x08,0x08
        .byte   0x07,0x07,0x06,0x06,0x05,0x05,0x04,0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x00,0x00

