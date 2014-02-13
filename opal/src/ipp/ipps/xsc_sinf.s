        .text
        .align  4
        .globl  sinf


sinf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mvn     r2, #2, 2
        bic     r1, r0, r2
        eor     r3, r0, r1
        mvn     lr, #0xFF, 8
        mov     r12, r3, lsl #1
        and     lr, r3, lr
        movs    r12, r12, lsr #24
        orrne   lr, lr, #2, 10
        subne   r12, r12, #1
        cmp     r3, #0
        rsblt   lr, lr, #0
        rsb     r3, r12, #0x95
        cmn     r3, #0x69
        mvn     r4, #0
        beq     LAAK17
        ldr     r0, [pc, #0x448]
        cmp     r3, #0x19
        blt     LAAK2
        eor     r12, lr, lr, asr #31
        clz     r12, r12
        sub     r12, r12, #1
        add     r3, r3, r12
        mov     lr, lr, lsl r12
        sub     r12, r3, #0x20
        mov     r12, lr, asr r12
        smull   r5, r12, r12, r12
        ldr     r6, [pc, #0x420]
        ldr     r5, [pc, #0x420]
        add     r0, r0, #4
        smull   r6, r7, r6, r12
        add     r5, r7, r5
        smull   r5, r6, r5, r12
        sub     r6, r6, r0
        smull   r12, r0, r6, r12
        smull   r0, r12, lr, r0
        add     r12, r12, #1
        adds    lr, lr, r12, asr #1
        eor     r0, lr, lr, asr #31
        sub     r12, r0, lr, asr #31
        clz     r5, r12
        add     r3, r3, r5
        rsb     r0, r3, #0x9D
        moveq   r0, r4
        cmp     r0, #0xFD
        bic     r2, lr, r2
        bhi     LAAK0
        sub     r5, r5, #1
        mov     r5, r12, lsl r5
        add     r3, r5, #0x40
        mov     r0, r0, lsl #23
        add     r3, r0, r3, lsr #7
        orr     r2, r3, r2
        b       LAAK1
LAAK0:
        cmp     r0, #0
        ble     LAAK15
        mov     r0, #0xFE, 10
        orr     r0, r0, #1, 2
        orr     r0, r2, r0
        orr     r2, r0, r2
LAAK1:
        eor     r0, r2, r1
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAAK2:
        ldr     r12, [pc, #0x398]
        cmp     r3, #0x10
        blt     LAAK5
        ldr     r4, [pc, #0x390]
        ldr     r5, [pc, #0x390]
        smull   r4, r6, r4, lr
        smull   r5, lr, r5, lr
        add     r5, r5, r6
        cmp     r5, r6
        addcc   lr, lr, #1
        rsb     r7, r3, #0x24
        mov     r6, lr, lsl r7
        movs    r6, r6, asr r7
        sub     lr, lr, r6
        sub     r7, r3, #4
        mov     lr, lr, asr r7
        beq     LAAK3
        cmn     r6, #1
        bne     LAAK4
LAAK3:
        mov     r7, r5, lsr #2
        mov     r4, r4, lsr #2
        orr     r6, r7, r6, lsl #30
        orr     r5, r4, r5, lsl #30
        add     r3, r3, #0x1E
LAAK4:
        eor     r4, r6, r6, asr #31
        sub     r4, r4, r6, asr #31
        clz     r4, r4
        sub     r4, r4, #1
        rsb     r7, r4, #0x20
        mov     r7, r5, lsr r7
        orr     r6, r7, r6, lsl r4
        smull   r5, r12, r12, r6
        add     r4, r3, r4
        sub     r3, r4, #2
        mov     r5, r5, lsr #30
        add     r5, r5, #1
        mov     r5, r5, asr #1
        add     r12, r5, r12, lsl #1
        b       LAAK10
LAAK5:
        cmn     r3, #1
        mov     r9, #0
        rsble   r4, r3, r4
        movle   r5, r4, asr #4
        movgt   r5, r9
        ldr     r4, [pc, #0x2F4]
        mov     r7, r5, lsl #1
        add     r6, r4, r7
        ldrh    r7, [r4, +r7]
        ldrh    r8, [r6, #8]
        ldrh    r10, [r6, #4]
        ldrh    r4, [r6, #0xA]
        ldrh    r11, [r6, #6]
        ldrh    r6, [r6, #2]
        orr     r8, r4, r8, lsl #16
        umull   r4, r8, lr, r8
        orr     r10, r11, r10, lsl #16
        umull   r10, r11, lr, r10
        orr     r7, r6, r7, lsl #16
        umull   lr, r6, lr, r7
        mov     r7, sp
        str     r4, [r7, #0xC]
        add     r10, r10, r8
        mov     r4, sp
        cmp     r10, r8
        str     r10, [r4, #8]
        movcc   r9, #1
        add     lr, lr, r11
        add     lr, lr, r9
        mov     r4, sp
        cmp     lr, r11
        str     lr, [r4, #4]
        bcc     LAAK6
        cmp     r9, #0
        moveq   lr, sp
        streq   r6, [lr]
        beq     LAAK7
        cmp     lr, r11
        movne   lr, sp
        strne   r6, [lr]
        bne     LAAK7
LAAK6:
        mov     lr, sp
        add     r6, r6, #1
        str     r6, [lr]
LAAK7:
        add     r5, r3, r5, lsl #4
        rsb     r3, r5, #0
        add     r3, r3, #0x23
        mov     lr, sp
        mov     r6, r3, asr #5
        sub     r4, r3, r6, lsl #5
        cmp     r4, #4
        add     r8, r4, #1
        bge     LAAK8
        add     r3, lr, r6, lsl #2
        ldr     r7, [r3, #-4]
        ldr     r5, [lr, +r6, lsl #2]
        rsb     r4, r4, #0x1F
        mov     r7, r7, lsl r8
        str     r7, [r3, #-4]
        orr     lr, r7, r5, lsr r4
        b       LAAK9
LAAK8:
        ldr     r5, [lr, +r6, lsl #2]
        rsb     r4, r4, #0x1F
        add     r3, lr, r6, lsl #2
        mov     lr, r5, lsr r4
LAAK9:
        ldr     r7, [r3, #4]
        mov     r9, r7, lsr r4
        orr     r5, r9, r5, lsl r8
        bics    r9, r5, r2
        addne   lr, lr, #1
        mov     r9, sp
        add     r6, r9, r6, lsl #2
        ldr     r9, [r6, #8]
        eor     r6, r5, r5, asr #31
        and     lr, lr, #0x1F
        mov     r4, r9, lsr r4
        orr     r8, r4, r7, lsl r8
        sub     r6, r6, r5, asr #31
        str     r8, [r3, #4]
        clz     r4, r6
        rsb     r3, r4, #0x21
        mov     r8, r8, lsr r3
        sub     r3, r4, #1
        orr     r3, r8, r5, lsl r3
        smull   r5, r12, r12, r3
        add     r3, r4, #0x21
        mov     r5, r5, lsr #30
        add     r5, r5, #1
        mov     r5, r5, asr #1
        add     r12, r5, r12, lsl #1
LAAK10:
        sub     r4, r3, #0x20
        mov     r5, r12, asr r4
        smull   r6, r5, r5, r5
        ldr     r7, [pc, #0x198]
        ldr     r6, [pc, #0x198]
        ldr     r10, [pc, #0x198]
        smull   r7, r8, r7, r5
        smull   r6, r5, r6, r5
        sub     r0, r8, r0
        smull   r0, r8, r12, r0
        ldr     r0, [pc, #0x188]
        sub     r2, r2, #0xF8
        ldr     r7, [pc, #0x184]
        and     r9, lr, #0xF
        sub     r6, r5, r2
        ldr     r5, [r0, +r9, lsl #2]
        ldr     r2, [pc, #0x178]
        ldr     r0, [r10, +r9, lsl #2]
        ldr     r7, [r7, +r9, lsl #2]
        ldr     r2, [r2, +r9, lsl #2]
        smull   r10, r9, r12, r12
        cmp     r5, #0
        mov     lr, lr, asr #4
        beq     LAAK11
        smull   r10, r8, r8, r0
        smull   r12, r0, r12, r0
        smull   r6, r12, r6, r5
        sub     r6, r3, r2
        add     r6, r6, r7
        add     r6, r6, #1
        add     r7, r3, r7
        add     r6, r12, r8, asr r6
        smull   r9, r3, r6, r9
        cmp     r0, #0
        add     r4, r2, r4, lsl #1
        moveq   r7, r4
        sub     r4, r4, r7
        add     r4, r0, r3, asr r4
        sub     r7, r7, r2
        add     r5, r5, r4, asr r7
        b       LAAK12
LAAK11:
        mov     r10, r10, lsr #30
        add     r10, r10, #1
        mov     r2, r3, lsl #1
        mov     r10, r10, asr #1
        add     r9, r10, r9, lsl #1
        smull   r9, r0, r8, r9
        sub     r2, r2, #0x1F
        add     r2, r3, r2
        sub     r2, r2, #0x1F
        sub     r2, r2, r3
        add     r5, r12, r0, asr r2
        mov     r2, r3
LAAK12:
        eor     r0, r5, r5, asr #31
        cmp     r5, #0
        sub     r3, r0, r5, asr #31
        clz     r12, r3
        add     r2, r2, r12
        rsb     r0, r2, #0x9D
        mvneq   r0, #0
        cmp     r0, #0xFD
        mvn     r2, #2, 2
        bhi     LAAK13
        sub     r12, r12, #1
        mov     r12, r3, lsl r12
        add     r3, r12, #0x40
        mov     r0, r0, lsl #23
        bic     r2, r5, r2
        add     r3, r0, r3, lsr #7
        orr     r2, r3, r2
        b       LAAK14
LAAK13:
        cmp     r0, #0
        bic     r5, r5, r2
        ble     LAAK16
        mov     r0, #0xFE, 10
        orr     r0, r0, #1, 2
        orr     r0, r5, r0
        orr     r2, r0, r5
LAAK14:
        eor     lr, r1, lr, lsl #31
        eor     r0, r2, lr
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAAK15:
        rsb     r0, r0, #7
        mov     r5, r12, lsl r5
        mov     r0, r5, lsr r0
        add     r0, r0, #1
        orr     r2, r2, r0, asr #1
        b       LAAK1
LAAK16:
        rsb     r0, r0, #7
        mov     r12, r3, lsl r12
        mov     r0, r12, lsr r0
        add     r0, r0, #1
        orr     r2, r5, r0, asr #1
        b       LAAK14
LAAK17:
        add     r4, r4, #2, 10
        tst     r0, r4
        orreq   r0, r0, #2, 2
        orr     r0, r0, #1, 10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x5555550e
        .long   0xffe62a9e
        .long   0x04443dde
        .long   0x6487ed51
        .long   0x27220a95
        .long   0x517cc1b7
        .long   LAAK_inv_pi
        .long   0x0443e8e7
        .long   0x0aa96b54
        .long   LAAK_sgl_tbl_cosjpiby16
        .long   LAAK_sgl_tbl_sinjpiby16
        .long   LAAK_sgl_tbl_scale_cosjpiby16
        .long   LAAK_sgl_tbl_scale_sinjpiby16


        .data
        .align  4


LAAK_inv_pi:
        .byte   0x7C,0x51,0xB7,0xC1,0x22,0x27,0x94,0x0A,0x13,0xFE,0xE8,0xAB,0x9A,0xFA,0xE0,0x6E
        .byte   0xB1,0x6D,0xCC,0x4A,0x21,0x9E,0x20,0xC8
LAAK_sgl_recip_tbl:
        .byte   0xC0,0xFF,0xC1,0xFF,0xC2,0xFF,0xC3,0xFF,0xC4,0xFF,0xC5,0xFF,0xC6,0xFF,0xC7,0xFF
        .byte   0xC8,0xFF,0xC8,0xFF,0xC9,0xFF,0xCA,0xFF,0xCA,0xFF,0xCB,0xFF,0xCC,0xFF,0xCC,0xFF
        .byte   0xCD,0xFF,0xCE,0xFF,0xCE,0xFF,0xCF,0xFF,0xD0,0xFF,0xD0,0xFF,0xD1,0xFF,0xD1,0xFF
        .byte   0xD2,0xFF,0xD2,0xFF,0xD3,0xFF,0xD3,0xFF,0xD4,0xFF,0xD4,0xFF,0xD5,0xFF,0xD5,0xFF
        .byte   0xD6,0xFF,0xD6,0xFF,0xD6,0xFF,0xD7,0xFF,0xD7,0xFF,0xD8,0xFF,0xD8,0xFF,0xD8,0xFF
        .byte   0xD9,0xFF,0xD9,0xFF,0xDA,0xFF,0xDA,0xFF,0xDA,0xFF,0xDB,0xFF,0xDB,0xFF,0xDB,0xFF
        .byte   0xDC,0xFF,0xDC,0xFF,0xDC,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDE,0xFF
        .byte   0xDE,0xFF,0xDE,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xE0,0xFF,0xE0,0xFF
LAAK_log_coeffs_25:
        .byte   0x00,0x00,0x00,0xC0,0xAB,0xAA,0xAA,0x2A,0x00,0x00,0x00,0xE0,0x9A,0x99,0x99,0x19
        .byte   0xAB,0xAA,0xAA,0xEA,0x92,0x24,0x49,0x12,0x00,0x00,0x00,0xF0
LAAK_rcp_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41
LAAK_rsqrt_table:
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
LAAK_asin_coeffs:
        .byte   0xB2,0xBD,0x9C,0x34,0xFD,0xB7,0xA6,0x36,0x70,0xF9,0x8E,0x3A,0x33,0x4F,0x9A,0x3F
        .byte   0xC8,0xCC,0xBD,0x22,0x0D,0x02,0x2D,0x26,0x42,0x44,0x37,0x2A,0x9A,0xB9,0x05,0x2F
        .byte   0xAC,0xC7,0xD0,0x34,0x7E,0x7A,0xE7,0x3B,0x9E,0xE7,0x5D,0x22,0x1A,0xCA,0xFB,0x27
        .byte   0xF0,0xF0,0x50,0x2F,0x33,0x33,0x33,0x39,0x9D,0xD8,0x89,0x23,0x5D,0x74,0xD1,0x2D
        .byte   0x8E,0xE3,0x38,0x3E,0x6D,0xDB,0xB6,0x2D,0x66,0x66,0x66,0x26,0xAA,0xAA,0xAA,0x2A
LAAK_special_asin_coeff:
        .byte   0xEB,0x06,0xA8,0x66,0x1F,0x00,0x00,0x00,0x20,0x7F,0x06,0x2E,0x02,0x00,0x00,0x00
        .byte   0x3A,0x83,0x37,0x22,0x04,0x00,0x00,0x00,0x57,0x50,0x5F,0x21,0x03,0x00,0x00,0x00
        .byte   0x6D,0x4C,0xE9,0x24,0x03,0x00,0x00,0x00,0x1C,0x2B,0x2F,0x2E,0x03,0x00,0x00,0x00
        .byte   0xE3,0xF9,0xAE,0x3D,0x03,0x00,0x00,0x00,0x58,0xC2,0x23,0x2B,0x02,0x00,0x00,0x00
        .byte   0x37,0xBF,0x5E,0x3E,0x03,0x00,0x00,0x00,0x12,0xF2,0xC5,0x72,0x1F,0x00,0x00,0x00
        .byte   0x62,0x9D,0x43,0x33,0x02,0x00,0x00,0x00,0x8C,0x81,0x64,0x33,0x04,0x00,0x00,0x00
        .byte   0x77,0x33,0x7C,0x3E,0x03,0x00,0x00,0x00,0x69,0x8F,0xA5,0x2C,0x02,0x00,0x00,0x00
        .byte   0x64,0x5B,0xD7,0x23,0x02,0x00,0x00,0x00,0x27,0x10,0x89,0x3D,0x03,0x00,0x00,0x00
        .byte   0xB9,0x7E,0x50,0x37,0x02,0x00,0x00,0x00,0x21,0x9D,0x66,0x33,0x02,0x00,0x00,0x00
        .byte   0x47,0x56,0x45,0x40,0x1E,0x00,0x00,0x00,0x1F,0x9D,0x9E,0x3B,0x03,0x00,0x00,0x00
        .byte   0x68,0x56,0xA7,0x2B,0x03,0x00,0x00,0x00,0x68,0x5B,0x46,0x24,0x02,0x00,0x00,0x00
        .byte   0xA3,0x89,0x5B,0x24,0x02,0x00,0x00,0x00,0x7A,0x9D,0xCF,0x28,0x02,0x00,0x00,0x00
        .byte   0xDA,0x9B,0x07,0x31,0x02,0x00,0x00,0x00,0x88,0x1D,0xAF,0x3D,0x02,0x00,0x00,0x00
        .byte   0x1D,0xA5,0x1D,0x28,0x01,0x00,0x00,0x00


        .data
        .align  4


LAAK_sgl_tbl_sinjpiby16:
        .byte   0x00,0x00,0x00,0x00,0x79,0x70,0xF1,0x31,0x9B,0x8A,0xF7,0x61,0xE7,0xEC,0x1C,0x47
        .byte   0x9A,0x79,0x82,0x5A,0xA4,0x98,0x6D,0x6A,0x3D,0xAF,0x41,0x76,0x40,0x5F,0x8A,0x7D
        .byte   0x00,0x00,0x00,0x40,0x40,0x5F,0x8A,0x7D,0x3D,0xAF,0x41,0x76,0xA4,0x98,0x6D,0x6A
        .byte   0x9A,0x79,0x82,0x5A,0xE7,0xEC,0x1C,0x47,0x9B,0x8A,0xF7,0x61,0x79,0x70,0xF1,0x31
LAAK_sgl_tbl_scale_sinjpiby16:
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x1F,0x00,0x00,0x00
        .byte   0x1F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00
        .byte   0x1E,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00
        .byte   0x1F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
LAAK_sgl_tbl_cosjpiby16:
        .byte   0x00,0x00,0x00,0x40,0x40,0x5F,0x8A,0x7D,0x3D,0xAF,0x41,0x76,0xA4,0x98,0x6D,0x6A
        .byte   0x9A,0x79,0x82,0x5A,0xE7,0xEC,0x1C,0x47,0x9B,0x8A,0xF7,0x61,0x79,0x70,0xF1,0x31
        .byte   0x00,0x00,0x00,0x00,0x87,0x8F,0x0E,0xCE,0x65,0x75,0x08,0x9E,0x19,0x13,0xE3,0xB8
        .byte   0x66,0x86,0x7D,0xA5,0x5C,0x67,0x92,0x95,0xC3,0x50,0xBE,0x89,0xC0,0xA0,0x75,0x82
LAAK_sgl_tbl_scale_cosjpiby16:
        .byte   0xFE,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
LAAK_sgl_const_oneovpi1:
        .byte   0xB7,0xC1,0x7C,0x51
LAAK_sgl_const_oneovpi2:
        .byte   0x95,0x0A,0x22,0x27
LAAK_sgl_const_pi:
        .byte   0x51,0xED,0x87,0x64
LAAK_sgl_const_pi30:
        .byte   0xA2,0xDA,0x0F,0xC9
LAAK_sgl_const_piby2_up:
        .byte   0x52,0xED,0x87,0x64
LAAK_sgl_const_piby2:
        .byte   0x51,0xED,0x87,0x64
LAAK_sgl_coeff_sinxmxovx:
        .byte   0xEE,0xAA,0xAA,0xAA,0xDE,0x3D,0x44,0x04,0x9E,0x2A,0xE6,0xFF
LAAK_sgl_coeff_sinxmxovx3:
        .byte   0xF2,0xAA,0xAA,0xAA,0xE7,0xE8,0x43,0x04
LAAK_sgl_coeff_cosxm1:
        .byte   0x30,0x01,0x00,0x80,0xD5,0x8D,0xAA,0x0A,0x75,0xC1,0xA5,0xFF
LAAK_sgl_coeff_cosxm1ovx2:
        .byte   0xF9,0x00,0x00,0x80,0x54,0x6B,0xA9,0x0A
LAAK_sgl_coeff_tanxmxovx3:
        .byte   0x64,0x57,0x55,0x55,0xA6,0xAF,0x21,0x22,0xC1,0xE7,0xD8,0x0D,0x78,0xDD,0x5A,0x05
        .byte   0x9E,0xB1,0x19,0x03
LAAK_sgl_coeff_atan:
        .byte   0x66,0xBC,0xAA,0xAA,0x70,0x3E,0xFD,0x32
LAAK_sgl_table_atan_rcp:
        .byte   0x20,0x00,0x1F,0x00,0x1E,0x00,0x1D,0x00,0x1C,0x00,0x1B,0x00,0x1B,0x00,0x1A,0x00
        .byte   0x19,0x00,0x19,0x00,0x18,0x00,0x18,0x00,0x17,0x00,0x17,0x00,0x16,0x00,0x16,0x00
        .byte   0x15,0x00,0x15,0x00,0x14,0x00,0x14,0x00,0x14,0x00,0x13,0x00,0x13,0x00,0x12,0x00
        .byte   0x12,0x00,0x12,0x00,0x12,0x00,0x11,0x00,0x11,0x00,0x11,0x00,0x10,0x00,0x10,0x00
LAAK_sgl_table_atanjby16_up:
        .byte   0x00,0x00,0x00,0x00,0x6F,0xB7,0xEA,0x3F,0x36,0x75,0xAB,0x3F,0x30,0xED,0xE5,0x5E
        .byte   0xF3,0xEB,0xB6,0x3E,0xDD,0xDC,0x89,0x4D,0x08,0x65,0xD8,0x5B,0x10,0xBB,0x93,0x69
        .byte   0x16,0x9C,0xB1,0x76,0x54,0xFA,0x95,0x41,0xB0,0x2E,0x80,0x47,0x74,0xC0,0x17,0x4D
        .byte   0x8D,0x3E,0x5E,0x52,0x1D,0x26,0x56,0x57,0x16,0x9F,0x02,0x5C,0xDD,0x42,0x67,0x60
        .byte   0x52,0xED,0x87,0x64,0xCC,0x97,0x68,0x68,0xE2,0x3C,0x0D,0x6C,0xB6,0xC3,0x79,0x6F


