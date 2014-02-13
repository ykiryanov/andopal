        .text
        .align  4
        .globl  _ippsISFQuantHighBand_AMRWBE_16s


_ippsISFQuantHighBand_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r12, [sp, #0x68]
        cmp     r0, #0
        beq     LDEK27
        cmp     r1, #0
        beq     LDEK27
        cmp     r2, #0
        beq     LDEK27
        cmp     r3, #0
        beq     LDEK27
        cmp     r12, #0
        ldreq   r5, [pc, #0x4D4]
        ldreq   r4, [pc, #0x4D4]
        ldrne   r5, [pc, #0x4D4]
        ldrne   r4, [pc, #0x4D4]
        ldrsh   r8, [r3]
        ldrsh   lr, [r3, #2]
        mvn     r12, #0xFF
        bic     r6, r12, #0x7F, 24
        mvn     r9, #2, 2
        mvn     r10, r6
        mvn     r11, #0
        mov     r7, r9
        mov     r12, #0
        mov     r6, r4
        str     r2, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     lr, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r9, [sp, #0x20]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDEK0:
        ldr     r1, [sp]
        ldr     r0, [sp, #4]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x28]
        mov     r4, #0
        mov     r3, r6
        mov     lr, #8
LDEK1:
        ldrsh   r9, [r1], #2
        ldrsh   r2, [r3], #2
        sub     r9, r9, r2
        cmp     r5, r9
        blt     LDEK2
        cmn     r9, #2, 18
        movge   r2, r9, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        b       LDEK3
LDEK2:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDEK3:
        ldrsh   r9, [r8, +r4]
        sub     r2, r2, r9
        cmp     r5, r2
        blt     LDEK4
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        b       LDEK5
LDEK4:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDEK5:
        ldrsh   r9, [r0], #2
        mov     r9, r9, lsl #14
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        sub     r2, r2, r9, asr #16
        cmp     r5, r2
        blt     LDEK6
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        b       LDEK7
LDEK6:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDEK7:
        add     r9, sp, #0x34
        strh    r2, [r9, +r4]
        subs    lr, lr, #1
        add     r4, r4, #2
        bne     LDEK1
        ldr     r3, [pc, #0x3A0]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
        mov     r2, #0
        mvn     r1, #2, 2
        mov     r0, r2
        str     r12, [sp, #0x30]
LDEK8:
        mov     r5, #0
        mov     lr, r5
        mov     r4, #8
LDEK9:
        add     r10, sp, #0x34
        ldrsh   r10, [r10, +r5]
        ldrsh   r12, [r3], #2
        sub     r10, r10, r12
        cmp     r8, r10
        blt     LDEK10
        cmn     r10, #2, 18
        movge   r12, r10, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDEK11
LDEK10:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDEK11:
        mul     r12, r12, r12
        cmp     r12, #1, 2
        mvneq   r12, #2, 2
        movne   r12, r12, lsl #1
        mov     r10, lr, asr #31
        adds    lr, lr, r12
        adc     r12, r10, r12, asr #31
        subs    r11, lr, r9
        sbcs    r10, r12, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   lr, #2, 2
        bne     LDEK12
        cmp     lr, #2, 2
        sbcs    r12, r12, r7
        movlt   lr, #2, 2
LDEK12:
        subs    r4, r4, #1
        add     r5, r5, #2
        bne     LDEK9
        cmp     lr, r1
        movlt   r1, lr
        movlt   r0, r2
        add     r2, r2, #1
        cmp     r2, #0x80
        blt     LDEK8
        ldr     r5, [pc, #0x2CC]
        ldr     r12, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        mov     r2, r0, lsl #16
        mov     r4, #0xA
        mov     lr, #3
        mov     r2, r2, asr #12
        ldrsh   r3, [r5, +r2]
        add     r2, r5, r2
        ldrsh   r5, [r2, #2]
        ldrsh   r8, [r2, #4]
        ldrsh   r9, [r2, #6]
        ldrsh   r10, [r2, #8]
        add     r11, sp, #0x34
        strh    r3, [r11]
        add     r3, sp, #0x34
        strh    r5, [r3, #2]
        add     r3, sp, #0x34
        strh    r8, [r3, #4]
        add     r3, sp, #0x34
        strh    r9, [r3, #6]
        add     r3, sp, #0x34
        strh    r10, [r3, #8]
        add     r2, r2, #0xA
LDEK13:
        ldrsh   r3, [r2], #2
        add     r5, sp, #0x34
        subs    lr, lr, #1
        strh    r3, [r5, +r4]
        add     r4, r4, #2
        bne     LDEK13
        cmp     r1, r7
        bge     LDEK14
        mov     r7, r1
        ldr     r1, [sp, #8]
        str     r12, [sp, #0xC]
        strh    r12, [r1]
        str     r0, [sp, #0x10]
        strh    r0, [r1, #2]
LDEK14:
        add     r12, r12, #1
        cmp     r12, #4
        add     r6, r6, #0x10
        blt     LDEK0
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r1, [sp, #4]
        mov     r0, #0xFF
        orr     r12, r0, #0x7F, 24
        mov     r8, r8, lsl #16
        sub     r0, r12, #7, 20
        mov     r3, #0
        mov     r6, r8, asr #16
        cmp     r0, r6
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvnlt   r6, r0
        blt     LDEK15
        cmn     r6, #1, 20
        sublt   r6, r3, #2, 18
        blt     LDEK15
        mov     r6, r6, lsl #3
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEK15:
        mov     lr, lr, lsl #16
        sub     r12, r12, #7, 20
        mov     lr, lr, asr #16
        cmp     r12, lr
        mvnlt   r12, r0
        blt     LDEK16
        cmn     lr, #1, 20
        sublt   r12, r3, #2, 18
        blt     LDEK16
        mov     lr, lr, lsl #3
        mov     lr, lr, lsl #16
        mov     r12, lr, asr #16
LDEK16:
        ldr     lr, [pc, #0x198]
        add     r4, r4, r6, lsl #1
        mvn     r9, r0
        add     r12, lr, r12, lsl #1
        mov     r6, r1
        mov     r8, r2
        mov     r7, #8
LDEK17:
        ldrsh   lr, [r12], #2
        ldrsh   r10, [r4], #2
        add     lr, r10, lr
        cmp     r9, lr
        mvnlt   lr, r0
        blt     LDEK18
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
LDEK18:
        ldrsh   r10, [r5, +r3]
        add     r10, lr, r10
        cmp     r9, r10
        blt     LDEK19
        cmn     r10, #2, 18
        movge   lr, r10, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LDEK20
LDEK19:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LDEK20:
        ldrsh   r10, [r6], #2
        mov     r10, r10, lsl #14
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        mov     r10, r10, lsl #16
        add     r10, lr, r10, asr #16
        cmp     r9, r10
        blt     LDEK21
        cmn     r10, #2, 18
        movge   lr, r10, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LDEK22
LDEK21:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LDEK22:
        strh    lr, [r8], #2
        subs    r7, r7, #1
        add     r3, r3, #2
        bne     LDEK17
        mov     r3, #0xCD
        mvn     r0, #0xFF
        orr     r12, r3, #1, 24
        bic     r0, r0, #0x7F, 24
        mov     r3, #0
        mov     r7, r12
        mvn     r6, r0
        mov     lr, r2
        mov     r4, #7
LDEK23:
        ldrsh   r8, [lr]
        cmp     r8, r7
        strlth  r7, [lr]
        movlt   r8, r7
        add     r8, r8, r12
        cmp     r6, r8
        mvnlt   r7, r0
        blt     LDEK24
        cmn     r8, #2, 18
        movge   r7, r8, lsl #16
        movge   r7, r7, asr #16
        sublt   r7, r3, #2, 18
LDEK24:
        subs    r4, r4, #1
        add     lr, lr, #2
        bne     LDEK23
        mvn     r4, r0
        mov     lr, #0
        mov     r12, #8
LDEK25:
        ldrsh   r6, [r2], #2
        ldrsh   r7, [r5, +lr]
        sub     r6, r6, r7
        cmp     r4, r6
        sublt   r6, r3, #2, 18
        mvnlt   r6, r6
        blt     LDEK26
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, r0
LDEK26:
        strh    r6, [r1], #2
        subs    r12, r12, #1
        add     lr, lr, #2
        bne     LDEK25
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LDEK27:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LDEK_Mean_isf_hf_low_rate
        .long   LDEK_Dico1_isf_hf_low_rate
        .long   LDEK_Mean_isf_hf_12k8
        .long   LDEK_Dico1_isf_hf_12k8
        .long   LDEK_Dico2_isf_hf


        .data
        .align  4


LDEK_Mean_isf_hf_low_rate:
        .byte   0xFF,0x15,0x3D,0x19,0x36,0x20,0x25,0x25,0x48,0x2C,0x28,0x32,0x87,0x38,0x8C,0x0C
LDEK_Dico1_isf_hf_low_rate:
        .byte   0x6D,0x00,0xE8,0x00,0x6C,0x01,0xDE,0x01,0x91,0x01,0x5A,0x01,0xAC,0x00,0x68,0x00
        .byte   0xA8,0xFF,0x73,0xFF,0x6C,0xFF,0x73,0xFF,0x41,0x00,0xAC,0x00,0x94,0x00,0xE5,0xFF
        .byte   0x96,0x00,0xBA,0x00,0x9B,0x00,0x66,0x00,0x8A,0xFF,0x20,0xFF,0x44,0xFF,0x07,0x00
        .byte   0x68,0xFF,0x0C,0xFF,0xAD,0xFE,0x61,0xFE,0x61,0xFE,0x66,0xFE,0x26,0xFF,0xB2,0xFF
LDEK_Mean_isf_hf_12k8:
        .byte   0xB1,0x09,0xB1,0x11,0x1F,0x1A,0x36,0x22,0xC0,0x29,0x85,0x31,0x1C,0x38,0x78,0x0F
LDEK_Dico1_isf_hf_12k8:
        .byte   0xC2,0x01,0x66,0x02,0x8A,0x02,0xCF,0x01,0x97,0x01,0xC6,0x00,0xAF,0x00,0xC4,0xFF
        .byte   0xB0,0xFE,0x5B,0xFE,0xB7,0xFE,0xC0,0xFE,0x14,0xFF,0x6C,0xFF,0xE6,0xFF,0xFC,0xFF
        .byte   0x89,0x00,0xA6,0x00,0x69,0x00,0x16,0x00,0xFD,0xFF,0x12,0x00,0x0D,0x00,0xBD,0xFF
        .byte   0x82,0xFD,0x65,0xFB,0x5A,0xFA,0x12,0xFE,0xFF,0xFD,0x22,0xFF,0x6D,0xFF,0x99,0x01
LDEK_Dico2_isf_hf:
        .byte   0x91,0xF4,0xCC,0xF8,0x8F,0xF9,0x74,0xFC,0xAE,0xFD,0xC3,0xFF,0xA5,0x00,0xAF,0x03
        .byte   0xAB,0xF9,0x66,0xFE,0x10,0xFE,0x5D,0x00,0xF6,0xFF,0xB2,0x00,0xB4,0x00,0x0F,0x03
        .byte   0x0B,0xFF,0x81,0xFE,0x6A,0xFD,0xCE,0xFC,0x9A,0xFF,0x5D,0x00,0xA9,0x00,0xC4,0xFF
        .byte   0x64,0xFF,0xF1,0xFE,0x0D,0xFE,0x5C,0xFD,0x95,0xFD,0xA1,0xFD,0x4A,0xFE,0xBD,0xFF
        .byte   0x02,0x00,0x91,0xFF,0xBD,0xFE,0x66,0xFF,0xA0,0xFF,0x28,0xFF,0xAF,0x00,0xDD,0xFF
        .byte   0x95,0xFF,0x4D,0xFF,0xBC,0xFF,0x16,0xFF,0x37,0xFF,0x7F,0xFF,0xB1,0xFF,0xBB,0xFF
        .byte   0xCB,0xFF,0x49,0xFF,0xC4,0xFE,0x65,0xFF,0x2C,0x00,0x58,0x00,0x78,0xFF,0x4C,0x00
        .byte   0xF4,0xFE,0x7E,0xFE,0x7E,0xFF,0xAA,0xFF,0xA6,0x00,0x08,0xFF,0xD1,0xFF,0x03,0x00
        .byte   0x5D,0xFF,0x48,0xFF,0x36,0xFF,0xD8,0xFF,0x45,0x00,0xE8,0xFF,0x65,0x00,0xE0,0xFE
        .byte   0x70,0xFF,0x57,0xFF,0x88,0xFF,0x9C,0xFE,0x1F,0x00,0x1C,0x01,0xF5,0xFF,0x63,0xFF
        .byte   0x36,0xFF,0xD2,0xFE,0x44,0x00,0x6D,0xFF,0xC5,0xFF,0x23,0x00,0xC8,0x00,0x3F,0x00
        .byte   0xDF,0xFF,0xF4,0xFF,0x63,0xFF,0x29,0xFF,0xE5,0xFF,0x4F,0x00,0xF7,0xFD,0xE4,0xFE
        .byte   0x01,0x00,0x05,0x00,0x77,0x00,0xAB,0xFF,0x14,0x00,0xFC,0xFF,0xBC,0xFF,0xBE,0xFF
        .byte   0x02,0x00,0xF9,0xFF,0xC7,0xFF,0x92,0xFF,0x8B,0x00,0xD2,0xFE,0xB7,0xFE,0xCB,0xFF
        .byte   0x03,0x00,0xE9,0xFF,0xE6,0xFF,0x35,0x00,0xFA,0xFE,0x8A,0xFF,0x09,0xFF,0x64,0xFF
        .byte   0x41,0x00,0x8F,0x00,0x97,0xFF,0xEB,0xFE,0x82,0xFF,0x48,0xFF,0xFA,0xFF,0xDE,0xFE
        .byte   0x7B,0xFF,0x79,0xFF,0x43,0x00,0x5D,0x00,0x3F,0xFF,0x7B,0xFE,0x30,0x00,0x4B,0xFF
        .byte   0xEB,0xFF,0xB2,0xFF,0x4E,0x00,0x57,0x00,0x74,0xFF,0x29,0xFF,0x64,0xFF,0x97,0x00
        .byte   0x3F,0x00,0x32,0x00,0x55,0x00,0x6E,0xFF,0xC7,0xFF,0x7B,0xFE,0x2E,0x00,0x6E,0x00
        .byte   0xB6,0x00,0x8F,0x00,0x7E,0xFF,0x32,0xFF,0x75,0xFF,0x5D,0xFF,0x40,0xFF,0x41,0x00
        .byte   0x82,0x00,0x65,0x00,0xF0,0xFF,0xF2,0xFF,0x7C,0xFE,0x30,0xFF,0x74,0x00,0xD6,0xFF
        .byte   0x89,0x00,0x76,0x00,0xEC,0xFE,0xD6,0x00,0xCB,0xFF,0x68,0xFE,0xCC,0xFF,0x5C,0xFF
        .byte   0xD5,0x00,0xB6,0x00,0x05,0x00,0x87,0x00,0x90,0xFF,0xF6,0xFF,0xAC,0xFF,0x0D,0x00
        .byte   0xE5,0xFF,0x89,0xFF,0x5F,0x00,0x13,0xFF,0x9E,0xFF,0xDB,0xFF,0x2B,0xFE,0xFE,0x00
        .byte   0x1C,0xFF,0x92,0xFE,0xB2,0xFF,0x1F,0x01,0xC6,0xFF,0x7B,0xFE,0x81,0xFE,0x38,0x00
        .byte   0x8D,0xFF,0x78,0xFF,0x12,0x00,0x93,0x00,0x90,0xFF,0x4C,0xFE,0xA5,0xFB,0xA2,0xFF
        .byte   0x34,0xFF,0x29,0xFF,0x84,0x01,0x52,0x00,0x1A,0xFF,0x6D,0xFF,0x5D,0xFE,0x62,0xFF
        .byte   0xBE,0xFE,0x11,0xFE,0xF7,0xFF,0xDA,0xFF,0x6C,0xFF,0xAF,0x00,0xE0,0xFE,0xF6,0xFF
        .byte   0x86,0xFF,0x27,0xFF,0xDD,0xFD,0xBE,0x00,0x83,0x00,0x91,0xFF,0x71,0xFE,0xD1,0xFE
        .byte   0x0C,0xFF,0xB8,0xFE,0x32,0xFF,0xB4,0xFF,0x73,0x01,0xA6,0xFF,0x78,0xFD,0x21,0x00
        .byte   0x29,0xFE,0x0A,0xFF,0xA6,0x00,0x70,0x00,0xD9,0x00,0xEA,0xFF,0x2C,0xFF,0x46,0xFE
        .byte   0x3B,0xFF,0x57,0xFF,0xCD,0x00,0xAE,0x01,0x19,0x01,0x28,0x00,0xD5,0xFD,0x96,0xFF
        .byte   0x52,0xFF,0xED,0xFE,0xFD,0xFF,0xD6,0x00,0xE8,0x00,0x02,0x01,0xA2,0xFF,0xDE,0xFF
        .byte   0x00,0xFF,0x7D,0xFE,0x26,0xFF,0xEF,0x00,0xE1,0xFE,0x7E,0x00,0x5E,0x00,0x06,0xFF
        .byte   0x26,0xFE,0xA5,0xFD,0x0F,0x01,0x9A,0x00,0x23,0xFF,0xF1,0xFE,0x55,0x00,0xD5,0xFF
        .byte   0xC0,0xFD,0x00,0xFD,0xBC,0xFF,0xA7,0xFF,0x0F,0x01,0xF1,0x00,0x77,0x00,0xA9,0xFF
        .byte   0x54,0xFE,0xA9,0xFD,0x8E,0xFE,0xB9,0x02,0x53,0x01,0xF9,0xFF,0x55,0xFE,0x52,0xFF
        .byte   0xD2,0xFD,0x32,0xFD,0xAA,0x01,0x7D,0x01,0x26,0x00,0x44,0xFF,0xA6,0xFD,0xF0,0xFF
        .byte   0xCE,0xFD,0x6C,0xFD,0x6F,0x02,0xE4,0x01,0x94,0x00,0xA1,0x00,0xD7,0xFF,0xE7,0xFF
        .byte   0xED,0xFE,0x63,0xFE,0x6B,0x00,0x9B,0x02,0xD1,0x00,0x89,0xFF,0x0D,0x00,0xB0,0x00
        .byte   0x17,0xFF,0xBA,0xFE,0x4A,0x01,0x3E,0x00,0x7E,0x01,0xDF,0xFF,0x96,0xFF,0xD0,0x00
        .byte   0x28,0xFF,0xCC,0xFE,0xA0,0xFE,0xDD,0x01,0x07,0x00,0x7A,0xFE,0x43,0x01,0xC8,0xFF
        .byte   0xD0,0xFF,0xA4,0xFF,0xB1,0x00,0x0E,0x02,0x84,0xFF,0xC5,0xFF,0x14,0x00,0x90,0xFF
        .byte   0x68,0xFF,0x58,0xFF,0x5D,0x00,0xE6,0x00,0xB3,0x00,0x33,0x00,0x6F,0x01,0xD1,0xFF
        .byte   0x0F,0x00,0x17,0x00,0x92,0x00,0x10,0x01,0x0C,0x01,0x41,0xFF,0x81,0xFF,0xDE,0xFF
        .byte   0x67,0xFF,0xC7,0xFF,0x00,0x02,0xCA,0x00,0x1F,0x00,0x1D,0x00,0x4B,0x00,0xA2,0xFF
        .byte   0x59,0x00,0x4B,0x00,0xA8,0x00,0xFC,0x00,0x98,0x00,0xA2,0x00,0x49,0x00,0x42,0x00
        .byte   0x53,0x00,0x8F,0x00,0xF0,0x00,0xCC,0x00,0x13,0x00,0x4A,0xFF,0x20,0x01,0xAD,0xFF
        .byte   0x9E,0xFF,0xBF,0xFF,0x81,0x00,0x6E,0x00,0xF3,0xFF,0x81,0x01,0xA1,0x00,0x69,0xFF
        .byte   0x41,0x00,0xEE,0x00,0x41,0x00,0x02,0x01,0x52,0x00,0x50,0x00,0xC0,0xFF,0x9B,0xFE
        .byte   0x59,0x00,0x5B,0x00,0x26,0x01,0x88,0x00,0x50,0x00,0x91,0x00,0x86,0xFE,0xF6,0xFF
        .byte   0xFF,0xFF,0x23,0x00,0x2F,0x00,0x17,0x00,0xAC,0x01,0xBC,0x00,0x59,0x00,0x75,0xFF
        .byte   0x45,0x00,0x07,0x00,0x66,0xFF,0xB8,0xFF,0x57,0x00,0xD1,0x00,0xE7,0x00,0x0B,0x00
        .byte   0x48,0x00,0x73,0x00,0x4A,0x01,0xB8,0x00,0x63,0xFE,0xEE,0x00,0x00,0x00,0x33,0xFF
        .byte   0x46,0x00,0x1C,0x00,0x94,0xFF,0x1C,0x00,0xAB,0x00,0xE5,0x01,0x60,0xFF,0xDA,0xFF
        .byte   0x25,0x00,0xF6,0xFF,0x91,0xFE,0x9D,0xFF,0xD0,0xFE,0x18,0x01,0x10,0x00,0xFD,0xFE
        .byte   0xBB,0xFF,0xA2,0xFF,0x37,0x00,0x36,0xFF,0x13,0xFE,0x3F,0x01,0x53,0xFF,0xBE,0xFF
        .byte   0xD6,0x00,0x84,0x00,0x2C,0xFE,0x4E,0xFF,0xC9,0x00,0x22,0x00,0xC9,0xFF,0x0C,0xFF
        .byte   0xD3,0xFF,0xD0,0xFF,0xC3,0xFF,0x17,0xFF,0x01,0xFF,0x2E,0x00,0xAF,0x01,0x4E,0xFF
        .byte   0x5E,0x00,0x04,0x00,0x9F,0xFF,0x4B,0xFE,0xBF,0xFE,0x28,0x00,0xA8,0x00,0xCC,0x00
        .byte   0xEB,0xFF,0xD9,0xFF,0x54,0xFF,0x64,0xFE,0xED,0x00,0x8A,0xFF,0xAF,0x00,0xF7,0xFF
        .byte   0x7D,0x01,0x50,0x01,0x61,0xFF,0xFE,0xFE,0x64,0xFE,0x41,0x00,0xD9,0xFF,0x0F,0xFF
        .byte   0xCE,0x00,0xA1,0x00,0x11,0xFF,0xC4,0xFD,0x9D,0xFF,0x5C,0x01,0x3C,0xFF,0x54,0x00
        .byte   0xA2,0xFF,0x34,0xFF,0x26,0xFF,0x42,0x00,0x05,0xFF,0x2B,0x00,0x03,0x01,0xCC,0x00
        .byte   0xC3,0xFF,0x7E,0xFF,0x60,0xFF,0xC1,0xFE,0xB9,0x00,0x3D,0xFF,0xC8,0xFF,0x08,0x02
        .byte   0x74,0x01,0x45,0x01,0xFC,0xFE,0xAE,0xFD,0x90,0x00,0x53,0xFF,0xE4,0xFF,0x28,0x00
        .byte   0xE6,0x00,0xE7,0x00,0x2B,0xFF,0xCC,0xFE,0x8B,0xFF,0x29,0xFE,0xE3,0x01,0x3A,0x00
        .byte   0x27,0x01,0x00,0x01,0xE6,0xFE,0x65,0xFE,0xDC,0xFF,0xE8,0x00,0xC5,0x01,0xDF,0xFF
        .byte   0x39,0x01,0x53,0x01,0x83,0xFF,0xC1,0xFE,0x0A,0x01,0xFA,0xFF,0xBC,0xFD,0x4E,0x00
        .byte   0x1A,0x01,0x47,0x01,0x55,0x00,0xCD,0xFF,0xD7,0x00,0x66,0xFF,0x23,0x00,0x17,0x00
        .byte   0x00,0x00,0xF1,0xFF,0x58,0xFE,0xBE,0xFD,0xE5,0x01,0x61,0x00,0x5D,0xFE,0x8F,0xFF
        .byte   0x1E,0x00,0xC4,0xFF,0x52,0xFF,0x66,0x00,0xAD,0x01,0xD8,0xFF,0x88,0x00,0x99,0x00
        .byte   0xA7,0xFF,0xB1,0x01,0x18,0x00,0xF0,0xFE,0x71,0x01,0x91,0x00,0x41,0x00,0x77,0xFF
        .byte   0x77,0x01,0x48,0x01,0x4D,0xFF,0x99,0xFE,0x5D,0x02,0x3B,0x01,0x1C,0x00,0x60,0x00
        .byte   0x45,0xFF,0x5C,0xFF,0x15,0x00,0xFD,0xFE,0xEA,0x01,0xEC,0x00,0xD8,0xFE,0x41,0x00
        .byte   0x14,0x00,0x71,0x00,0x2C,0xFF,0xA5,0x00,0x3F,0x02,0x82,0x00,0x59,0xFE,0x27,0xFF
        .byte   0x92,0x00,0x99,0x00,0x7B,0x00,0xF7,0xFF,0x85,0x01,0x4E,0x00,0x04,0xFF,0x32,0x01
        .byte   0xEC,0xFF,0xB7,0xFF,0xBA,0x00,0x75,0xFF,0xBC,0x00,0x3D,0x01,0x82,0x00,0xD0,0x00
        .byte   0x1A,0xFF,0x91,0xFE,0xAE,0xFD,0xB4,0xFF,0x41,0x02,0x3E,0x01,0xE7,0xFF,0x5B,0xFF
        .byte   0x1C,0x00,0xE7,0xFF,0x40,0xFE,0x6B,0xFD,0xAD,0x01,0xFF,0x01,0xD1,0x00,0x30,0x00
        .byte   0x26,0xFF,0xD1,0xFE,0x82,0xFE,0x36,0xFF,0xB6,0x00,0xF9,0x00,0x10,0x02,0x02,0x00
        .byte   0x10,0x00,0xB5,0xFF,0x73,0xFE,0x49,0x02,0xFC,0x00,0x92,0x00,0xFD,0xFF,0x33,0xFF
        .byte   0x9A,0x00,0x28,0x00,0x10,0xFF,0x9C,0x01,0xE7,0xFF,0xE8,0xFF,0xCF,0xFD,0x89,0xFF
        .byte   0xD5,0xFF,0xD1,0xFF,0x10,0xFF,0x2D,0x02,0x15,0x01,0xB3,0xFF,0x75,0xFE,0x61,0x01
        .byte   0x99,0x01,0x72,0x01,0x11,0xFF,0xFC,0x00,0xF4,0x00,0x51,0x00,0xCB,0xFF,0xD8,0xFF
        .byte   0x63,0x00,0x93,0x00,0x2A,0xFF,0xBF,0x00,0x6F,0x00,0x57,0xFF,0x43,0x02,0x24,0xFF
        .byte   0xCF,0x00,0x85,0x00,0x8B,0xFF,0x2E,0x01,0x1B,0xFF,0x43,0x01,0x45,0x01,0x4A,0xFF
        .byte   0xD7,0x00,0x03,0x01,0x62,0x00,0x12,0x00,0x94,0x00,0xD4,0x00,0x2F,0x01,0xEA,0xFF
        .byte   0xE5,0x00,0x9C,0x00,0xAE,0xFF,0x6D,0x01,0x10,0x00,0xCE,0xFE,0x1B,0x01,0x07,0x01
        .byte   0x98,0xFF,0x97,0x00,0xA0,0xFF,0xD3,0x00,0x0E,0x00,0x84,0x01,0x65,0x00,0xE3,0x01
        .byte   0xBD,0x00,0xC8,0x00,0x55,0x01,0xF1,0xFF,0x75,0xFF,0x35,0x00,0x39,0x00,0xD1,0x00
        .byte   0x39,0x00,0x60,0x00,0x6E,0x00,0x8F,0xFF,0xE9,0x00,0xA1,0xFF,0x1A,0x02,0xEF,0x00
        .byte   0x3A,0x01,0x6D,0x01,0x65,0x00,0x94,0xFF,0x4E,0x00,0x61,0x01,0x7D,0xFF,0x95,0xFF
        .byte   0xB1,0x00,0xD1,0x00,0x61,0x00,0x6A,0xFF,0x2B,0xFF,0x57,0x02,0xF1,0x00,0x5C,0x00
        .byte   0x1E,0x00,0x12,0x00,0x26,0x01,0x8D,0x00,0xFC,0xFE,0x83,0x00,0x3F,0x02,0x9F,0x00
        .byte   0x8C,0xFF,0x47,0xFF,0x0B,0x01,0xE9,0xFF,0xDE,0xFD,0x58,0xFF,0x92,0x00,0x63,0x00
        .byte   0x37,0xFF,0xEC,0xFE,0xE9,0xFF,0x97,0xFF,0x81,0xFF,0x33,0xFE,0x09,0x02,0xA3,0x00
        .byte   0x1A,0x00,0x44,0x00,0x1F,0x00,0x49,0xFF,0xBE,0xFC,0x83,0x01,0xD9,0x01,0x49,0xFF
        .byte   0x88,0xFF,0x27,0x00,0x7F,0x00,0x45,0x00,0x00,0xFE,0x6C,0xFE,0xC2,0x02,0xEF,0xFE
        .byte   0xE2,0x00,0x82,0x01,0xEA,0xFF,0x98,0xFE,0x9C,0xFD,0x67,0xFF,0x59,0x02,0x95,0x00
        .byte   0x91,0x00,0xCC,0x00,0x0E,0x00,0x43,0xFF,0x7D,0xFD,0x3C,0xFC,0x95,0xFF,0x3D,0x00
        .byte   0x47,0x00,0xF4,0x00,0x2A,0x01,0x4F,0x00,0xEC,0xFE,0x21,0xFD,0x50,0x02,0x11,0x01
        .byte   0x32,0xFF,0x5B,0x02,0xDA,0x00,0xB3,0xFF,0xA0,0xFE,0xB4,0x00,0x57,0x01,0x4D,0xFF
        .byte   0x83,0x01,0xE9,0x01,0x86,0x00,0xFE,0xFF,0x22,0xFF,0xD7,0xFF,0xDB,0x01,0xC3,0xFF
        .byte   0x43,0xFF,0x12,0x02,0x77,0x00,0x8A,0xFF,0xD9,0xFF,0x86,0xFF,0x8B,0xFE,0x9B,0xFF
        .byte   0xA5,0x00,0x54,0x01,0xB8,0x01,0xE2,0x00,0xDB,0xFE,0x6A,0xFE,0x6F,0xFF,0xB0,0xFF
        .byte   0x81,0x01,0x7E,0x01,0xFD,0xFF,0xF7,0xFF,0x2F,0xFF,0x20,0xFF,0x42,0xFD,0x48,0xFF
        .byte   0xEC,0x00,0x17,0x01,0x3D,0x00,0x80,0xFF,0x3B,0xFE,0xC2,0xFC,0xCD,0xFB,0x93,0x00
        .byte   0x1D,0x02,0x98,0x02,0x87,0x00,0xB1,0xFF,0x01,0xFF,0x68,0xFE,0xA2,0xFF,0xC7,0x00
        .byte   0x43,0x01,0x90,0x01,0x96,0x00,0x5E,0xFF,0x00,0xFE,0xD6,0x00,0x04,0xFF,0xF0,0x00
        .byte   0xB4,0x00,0xDC,0x00,0x1C,0x01,0xEE,0x00,0xC1,0xFF,0x63,0xFE,0x9A,0xFD,0x0E,0x01
        .byte   0x21,0xFF,0xF6,0xFE,0xAE,0x01,0x39,0x01,0xFF,0xFE,0x33,0xFD,0x6C,0xFF,0x15,0x01
        .byte   0x7B,0xFF,0xDA,0xFE,0x96,0x01,0x01,0x01,0x39,0xFF,0x37,0x01,0x91,0xFF,0x2A,0x01
        .byte   0xFF,0xFF,0xAE,0xFF,0xB2,0x01,0xE6,0x00,0x4A,0x00,0xFF,0xFE,0x98,0x00,0xA4,0x01
        .byte   0x07,0xFF,0xD0,0xFF,0xAA,0x02,0x67,0x02,0x46,0x00,0x06,0xFF,0xF7,0xFD,0x33,0x01
        .byte   0xC2,0xFE,0x93,0xFE,0xD7,0x01,0x7A,0x01,0x8A,0xFF,0x90,0xFE,0x4A,0x02,0x6A,0x00
        .byte   0x9C,0xFE,0x62,0xFE,0x51,0x01,0x5A,0x00,0x35,0xFE,0x9D,0x01,0x7E,0x01,0xDF,0xFF
        .byte   0x4A,0xFD,0x7D,0x00,0x73,0xFF,0x91,0x00,0x9B,0xFF,0x09,0x00,0x7E,0x00,0xDD,0x02
        .byte   0x02,0xFE,0xB4,0x02,0x5A,0x02,0xAB,0x01,0x56,0x00,0x1B,0x00,0x90,0xFF,0xC6,0x00
        .byte   0x69,0x01,0xFF,0x02,0xC4,0x01,0x8F,0x01,0x31,0x00,0x16,0x00,0x7A,0xFF,0x18,0x01
        .byte   0x65,0xFE,0x46,0xFE,0x46,0xFF,0x11,0x02,0x8B,0x02,0xCB,0x01,0x06,0x01,0x58,0x00
        .byte   0x93,0xFF,0xD6,0xFF,0xCB,0xFF,0x65,0x00,0x4C,0x01,0x4A,0x03,0xFA,0x01,0x3F,0x00
        .byte   0x0F,0xFF,0xE6,0xFE,0xB0,0xFE,0x76,0xFE,0xCF,0xFE,0x1E,0x03,0x89,0x01,0x1C,0x00
        .byte   0x0C,0xFF,0x14,0xFF,0x2A,0xFF,0xFD,0xFE,0x59,0x03,0x74,0x02,0xB4,0x00,0x3D,0x01
        .byte   0x7A,0x01,0x2D,0x02,0x27,0x00,0x5B,0xFE,0xA6,0x00,0xAA,0x00,0x98,0x00,0xDC,0x01
        .byte   0x67,0x01,0x07,0x02,0x08,0x00,0x7F,0xFE,0x59,0xFD,0x6A,0x02,0x5F,0x01,0x6A,0x00
        .byte   0xD6,0x02,0xBB,0x02,0x29,0x00,0xB5,0xFF,0x7B,0xFF,0x01,0x01,0x5A,0x00,0xDF,0x00
        .byte   0x14,0x00,0x42,0x01,0x17,0x02,0xF2,0x02,0x14,0x02,0xA9,0x01,0xC5,0x00,0xC3,0x00

