        .text
        .align  4
        .globl  coshf


coshf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mvn     r12, #2, 2
        and     r4, r0, r12
        mvn     r2, #0xFF, 8
        mov     r1, r4, lsl #1
        and     r7, r4, r2
        movs    r2, r1, lsr #24
        orrne   r7, r7, #2, 10
        subne   r2, r2, #1
        cmp     r4, #0
        rsblt   r7, r7, #0
        ldr     r3, [pc, #0x310]
        rsb     lr, r2, #0x95
        cmp     lr, #0x10
        bgt     LADN1
        and     r2, r4, r12
        cmp     r2, r3, lsl #21
        movle   r0, r3, lsl #21
        orrgt   r0, r0, #1, 10
        and     r12, r0, r12
        cmp     r12, r3, lsl #21
        beq     LADN7
LADN0:
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN1:
        cmp     lr, #0x27
        blt     LADN2
        mov     r0, #0xFE, 10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN2:
        cmp     lr, #0x19
        str     r7, [sp]
        str     r4, [sp, #4]
        mvn     r2, #0
        blt     LADN4
        ldr     r0, [sp]
        eor     r7, r7, r7, asr #31
        clz     r1, r7
        sub     r1, r1, #1
        mov     r0, r0, lsl r1
        add     lr, lr, r1
        smull   r4, r1, r0, r0
        sub     r4, lr, #0x20
        mov     r4, r0, asr r4
        smull   r4, r0, r4, r4
        mov     r4, #0x53, 30
        orr     r4, r4, #0xD, 20
        smull   r5, r4, r4, r0
        ldr     r5, [pc, #0x284]
        mov     lr, lr, lsl #1
        sub     lr, lr, #0x3F
        add     r5, r4, r5
        smull   r5, r4, r0, r5
        ldr     r5, [pc, #0x274]
        str     r1, [sp, #8]
        eor     r5, r5, #0xD1, 4
        add     r5, r4, r5
        smull   r5, r0, r0, r5
        add     r0, r0, #1, 2
        smull   r4, r0, r1, r0
        mov     lr, r0, asr lr
        add     lr, lr, #1, 2
        str     lr, [sp]
        eor     r5, lr, lr, asr #31
        cmp     lr, #0
        sub     r1, r5, lr, asr #31
        clz     r4, r1
        rsb     r0, r4, #0x7F
        moveq   r0, r2
        cmp     r0, #0xFD
        bic     r12, lr, r12
        bhi     LADN3
        sub     r4, r4, #1
        mov     r4, r1, lsl r4
        add     r1, r4, #0x40
        mov     r0, r0, lsl #23
        add     r1, r0, r1, lsr #7
        orr     r0, r1, r12
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN3:
        cmp     r0, #0
        orrgt   r3, r12, r3, lsl #21
        orrgt   r0, r3, r12
        ble     LADN8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN4:
        ldr     r1, [pc, #0x1F4]
        ldr     r0, [pc, #0x1F4]
        sub     r6, lr, #5
        smull   r4, r5, r7, r1
        rsb     r9, r6, #0x20
        ldr     r1, [pc, #0x1E8]
        mov     r8, r5, lsl r9
        sub     r10, lr, #4
        mov     r8, r8, asr r9
        mov     r7, r7, asr #4
        sub     r9, r10, #1
        mvn     r11, #0x51
        mul     r7, r7, r11
        mov     r9, r4, lsr r9
        rsb     r10, r10, #0x20
        add     r4, r9, #1
        mov     r10, r8, lsl r10
        sub     r5, r5, r8
        add     r4, r10, r4, asr #1
        add     lr, r4, r7, asr lr
        smull   r7, r4, r3, lr
        mov     lr, r5, asr r6
        mvn     r6, #0x13, 2
        mov     r5, lr, lsl #29
        mov     r7, r7, lsr #30
        add     r7, r7, #1
        mov     r5, r5, asr #29
        mov     r7, r7, asr #1
        add     r4, r7, r4, lsl #1
        smull   r7, r8, r4, r4
        smull   r7, r0, r0, r8
        ldr     r7, [pc, #0x174]
        sub     lr, lr, r5
        add     r7, r7, r0, asr #4
        ldr     r0, [pc, #0x178]
        mov     lr, lr, asr #3
        cmp     lr, #0x10
        smull   r9, r0, r0, r8
        smull   r9, r7, r8, r7
        add     r0, r6, r0, asr #4
        smull   r7, r6, r4, r7
        smull   r8, r0, r8, r0
        rsb     r7, r5, #0
        add     r5, r1, r5, lsl #2
        add     r7, r1, r7, lsl #2
        ldr     r1, [r7, #0x10]
        ldr     r5, [r5, #0x10]
        add     r7, r0, r6, asr #2
        sub     r0, r0, r6, asr #2
        rsb     r0, r4, r0, asr #1
        add     r7, r4, r7, asr #1
        smull   r4, r0, r1, r0
        smull   r7, r6, r7, r5
        add     r1, r1, r0, asr #2
        add     r6, r5, r6, asr #2
        rsb     r0, lr, #0x1E
        movge   r1, #0
        mov     lr, lr, lsl #1
        add     r1, r6, r1, asr lr
        mov     r1, r1, lsr #1
        cmp     r1, #0
        eor     lr, r1, r1, asr #31
        str     r1, [sp, #8]
        sub     lr, lr, r1, asr #31
        clz     r4, lr
        add     r0, r0, r4
        rsb     r0, r0, #0x9D
        moveq   r0, r2
        cmp     r0, #0xFD
        bic     r12, r1, r12
        bhi     LADN5
        sub     r4, r4, #1
        mov     r4, lr, lsl r4
        add     r1, r4, #0x40
        mov     r0, r0, lsl #23
        add     r1, r0, r1, lsr #7
        orr     r12, r1, r12
        b       LADN6
LADN5:
        cmp     r0, #0
        orrgt   r0, r12, r3, lsl #21
        orrgt   r12, r0, r12
        ble     LADN10
LADN6:
        cmp     r12, r3, lsl #21
        beq     LADN9
        mov     r0, r12
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN7:
        cmp     r1, #0xFF, 8
        beq     LADN0
        str     r0, [sp, #8]
        add     r3, sp, #4
        add     r2, sp, #8
        add     r1, sp, #4
        mov     r0, r3
        str     r7, [sp]
        str     r4, [sp, #4]
        mov     r3, #0x41
        bl      __libm_error_support
        ldr     r0, [sp, #8]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN8:
        rsb     r0, r0, #7
        mov     r4, r1, lsl r4
        mov     r0, r4, lsr r0
        add     r0, r0, #1
        orr     r0, r12, r0, asr #1
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN9:
        mov     r2, sp
        add     r1, sp, #4
        add     r0, sp, #4
        str     r12, [sp]
        mov     r3, #0x41
        bl      __libm_error_support
        ldr     r12, [sp]
        mov     r0, r12
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LADN10:
        rsb     r0, r0, #7
        mov     r4, lr, lsl r4
        mov     r0, r4, lsr r0
        add     r0, r0, #1
        orr     r12, r12, r0, asr #1
        b       LADN6
        .long   0x58b90bfc
        .long   0x002d82a2
        .long   0x15555555
        .long   0x5c551d95
        .long   0x011114ad
        .long   LADN_sgl_table_twotojby8
        .long   0x05557555


        .data
        .align  4


LADN_sgl_recip_tbl:
        .byte   0xC0,0xFF,0xC1,0xFF,0xC2,0xFF,0xC3,0xFF,0xC4,0xFF,0xC5,0xFF,0xC6,0xFF,0xC7,0xFF
        .byte   0xC8,0xFF,0xC8,0xFF,0xC9,0xFF,0xCA,0xFF,0xCA,0xFF,0xCB,0xFF,0xCC,0xFF,0xCC,0xFF
        .byte   0xCD,0xFF,0xCE,0xFF,0xCE,0xFF,0xCF,0xFF,0xD0,0xFF,0xD0,0xFF,0xD1,0xFF,0xD1,0xFF
        .byte   0xD2,0xFF,0xD2,0xFF,0xD3,0xFF,0xD3,0xFF,0xD4,0xFF,0xD4,0xFF,0xD5,0xFF,0xD5,0xFF
        .byte   0xD6,0xFF,0xD6,0xFF,0xD6,0xFF,0xD7,0xFF,0xD7,0xFF,0xD8,0xFF,0xD8,0xFF,0xD8,0xFF
        .byte   0xD9,0xFF,0xD9,0xFF,0xDA,0xFF,0xDA,0xFF,0xDA,0xFF,0xDB,0xFF,0xDB,0xFF,0xDB,0xFF
        .byte   0xDC,0xFF,0xDC,0xFF,0xDC,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDE,0xFF
        .byte   0xDE,0xFF,0xDE,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xE0,0xFF,0xE0,0xFF
LADN_log_coeffs_25:
        .byte   0x00,0x00,0x00,0xC0,0xAB,0xAA,0xAA,0x2A,0x00,0x00,0x00,0xE0,0x9A,0x99,0x99,0x19
        .byte   0xAB,0xAA,0xAA,0xEA,0x92,0x24,0x49,0x12,0x00,0x00,0x00,0xF0
LADN_rcp_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41
LADN_rsqrt_table:
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


        .data
        .align  4


LADN_sgl_table_twotojby8:
        .byte   0xCD,0x3C,0x41,0x2D,0x84,0xCA,0x59,0x31,0x33,0x3F,0xD1,0x35,0xBA,0x31,0xB0,0x3A
        .byte   0x00,0x00,0x00,0x40,0xF2,0xE0,0xCA,0x45,0x29,0xF8,0x1B,0x4C,0x55,0x6B,0xFF,0x52
        .byte   0x9A,0x79,0x82,0x5A
LADN_sgl_coeff5_twotoxm1ovx:
        .byte   0xFC,0x0B,0xB9,0x58,0xFE,0xBD,0xBF,0x1E,0xF1,0xC1,0x1A,0x07,0x01,0x31,0x3B,0x01
        .byte   0xDC,0xDE,0x2B,0x00
LADN_sgl_const_oneovlog2:
        .byte   0x95,0x1D,0x55,0x5C
LADN_sgl_const_oneovlog10:
        .byte   0x55,0xEC,0x2D,0x6F
LADN_sgl_const_log2:
        .byte   0xFC,0x0B,0xB9,0x58
LADN_sgl_const_log10:
        .byte   0xEF,0xC6,0xAE,0x49
LADN_sgl_const_log2ovlog10:
        .byte   0x42,0x4D,0x10,0x4D
LADN_sgl_coeff_log1pxmxovx:
        .byte   0x00,0x00,0x00,0xC0,0xB5,0xA9,0xAA,0x2A,0x39,0x1B,0xFA,0xDF,0xE3,0x6F,0xA2,0x19
LADN_sgl_coeff_log1pxmxovxsq:
        .byte   0x00,0x00,0x00,0xC0,0xE1,0xA9,0xAA,0x2A,0x1C,0x01,0x00,0xE0,0xAA,0xA9,0xA1,0x19
        .byte   0x9C,0x19,0xA2,0xEA
LADN_sgl_table_1ov1pjov16:
        .byte   0x00,0x01,0x00,0x00,0xF1,0x00,0x00,0x00,0xE4,0x00,0x00,0x00,0xD8,0x00,0x00,0x00
        .byte   0xCD,0x00,0x00,0x00,0xC3,0x00,0x00,0x00,0xBA,0x00,0x00,0x00,0xB2,0x00,0x00,0x00
        .byte   0xAB,0x00,0x00,0x00,0xA4,0x00,0x00,0x00,0x9E,0x00,0x00,0x00,0x98,0x00,0x00,0x00
        .byte   0x92,0x00,0x00,0x00,0x8D,0x00,0x00,0x00,0x89,0x00,0x00,0x00,0x84,0x00,0x00,0x00
        .byte   0x80,0x00,0x00,0x00
LADN_sgl_table_log1pjby16:
        .byte   0x00,0x00,0x00,0x00,0x80,0x63,0xD4,0x3D,0xC7,0x4E,0x4E,0x3B,0xAD,0x01,0xFD,0x56
        .byte   0x8E,0xF7,0xDF,0x38,0x2F,0x73,0xAD,0x45,0x0A,0x37,0xC6,0x51,0xDB,0x61,0x07,0x5D
        .byte   0xB1,0x97,0xDA,0xB5,0x25,0xCF,0x8D,0xC0,0xC6,0xDA,0x30,0x94,0x3D,0x3E,0x03,0xA8
        .byte   0x0D,0x06,0xA2,0xBC,0x54,0x74,0x79,0xCE,0x45,0x24,0x6B,0xBA,0xF2,0x64,0x7D,0xE0
        .byte   0x00,0x00,0x00,0x00
LADN_sgl_table_scale_log1pjby16:
        .byte   0x46,0x00,0x22,0x00,0x21,0x00,0x21,0x00,0x20,0x00,0x20,0x00,0x20,0x00,0x20,0x00
        .byte   0x20,0x00,0x20,0x00,0x21,0x00,0x21,0x00,0x21,0x00,0x21,0x00,0x22,0x00,0x22,0x00
        .byte   0x46,0x00,0x00,0x00
LADN_sgl_coeff_tanhxmxovx3:
        .byte   0xB9,0xAB,0xAA,0xAA,0x39,0xE5,0x21,0x22,0x94,0x9D,0x33,0xF2,0xDA,0x01,0x74,0x05
        .byte   0x16,0xFD,0x4B,0xFE
LADN_sgl_tbl_expjby8m1:
        .byte   0x6C,0xAC,0x16,0xAF,0x13,0xBC,0x5B,0xB5,0xD8,0x81,0x76,0xBC,0x9A,0xE4,0x06,0x89
        .byte   0xE3,0x97,0x45,0x9B,0xAF,0x30,0xF2,0xAF,0xF5,0x7C,0x5F,0xC7,0x4F,0xA2,0xD6,0xC3
        .byte   0x00,0x00,0x00,0x00,0xB7,0x08,0x2C,0x44,0xC4,0xE3,0xB5,0x48,0x9F,0x28,0x3D,0x3A
        .byte   0x71,0x4C,0x09,0x53,0xFC,0xAE,0x22,0x6F,0xA3,0xED,0x7C,0x47,0x3E,0x2C,0x87,0x59
        .byte   0x59,0x54,0xF8,0x6D
LADN_sgl_tbl_scale_expjby8m1:
        .byte   0x1F,0x00,0x1F,0x00,0x1F,0x00,0x20,0x00,0x20,0x00,0x20,0x00,0x20,0x00,0x21,0x00
        .byte   0x00,0x00,0x21,0x00,0x20,0x00,0x1F,0x00,0x1F,0x00,0x1F,0x00,0x1E,0x00,0x1E,0x00
        .byte   0x1E,0x00,0x00,0x00
LADN_sgl_coeff_expm1mxovx2:
        .byte   0xF2,0xFF,0xFF,0x3F,0x51,0x55,0x55,0x15,0xF6,0x8D,0x55,0x05,0xE7,0x1B,0x11,0x01
LADN_sgl_uconst_oneovlog10:
        .byte   0xA9,0xD8,0x5B,0xDE
LADN_sgl_uconst_log2ovlog10:
        .byte   0x85,0x9A,0x20,0x9A
LADN_sgl_coeff_sinhxmxovx3:
        .byte   0x9A,0x55,0x55,0x55,0xC6,0x3D,0x44,0x04,0x46,0x2E,0x1A,0x00
LADN_sgl_coeff_coshxm1ovx2:
        .byte   0x00,0x00,0x00,0x40,0x58,0x55,0x55,0x05,0xA2,0x82,0x2D,0x00,0x4C,0xD1,0x00,0x00
LADN_sgl_coeff_sinhxmxovx:
        .byte   0x55,0x55,0x55,0x15,0xAD,0x14,0x11,0x01
LADN_sgl_coeff_coshxm1:
        .byte   0xFB,0xFF,0xFF,0x3F,0x55,0x75,0x55,0x05

