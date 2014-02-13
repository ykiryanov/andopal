        .text
        .align  4
        .globl  _ippsFFTFwd_RToPerm_GSMAMR_16s_I


_ippsFFTFwd_RToPerm_GSMAMR_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        beq     LDUR15
        ldr     r2, [pc, #0x390]
        add     r6, r0, #2
        mov     r1, #0x1C
        sub     r3, r2, #0xB9, 30
LDUR0:
        ldr     r4, [r3, #8]
        ldr     r12, [r3, #4]
        subs    r1, r1, #1
        mov     r4, r4, lsl #1
        ldrsh   r4, [r0, +r4]
        mov     lr, r12, lsl #1
        ldrsh   r12, [r0, +lr]
        strh    r4, [r0, +lr]
        ldr     lr, [r3, #8]
        mov     lr, lr, lsl #1
        strh    r12, [r0, +lr]
        ldr     r4, [r3, #8]
        ldr     r12, [r3, #4]
        mov     r4, r4, lsl #1
        ldrsh   r4, [r6, +r4]
        mov     lr, r12, lsl #1
        ldrsh   r12, [r6, +lr]
        strh    r4, [r6, +lr]
        ldr     lr, [r3, #8]!
        mov     lr, lr, lsl #1
        strh    r12, [r6, +lr]
        bne     LDUR0
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        mov     r12, #0
        mov     r7, #2
        sub     r3, r2, #2, 24
LDUR1:
        mov     r5, r7, lsl r12
        cmp     r5, #0
        ble     LDUR13
        mov     r4, #0
        mov     lr, r4
LDUR2:
        cmp     lr, #0x80
        mov     r8, lr
        bge     LDUR12
        add     r7, r3, r4, lsl #1
        str     lr, [sp, #4]
        str     r4, [sp, #8]
        str     r3, [sp, #0xC]
        str     r12, [sp]
LDUR3:
        add     r2, r5, r8
        ldrsh   r12, [r7, #4]
        mov     r3, r2, lsl #1
        ldrsh   r10, [r6, +r3]
        ldrsh   r11, [r0, +r3]
        ldrsh   r2, [r7, #2]
        ldr     lr, [sp, #8]
        mul     r12, r12, r11
        ldr     r4, [sp, #0xC]
        mul     r2, r2, r10
        ldrsh   r9, [r7, #6]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r4, +lr]
        mov     r4, r8, lsl #1
        mla     r11, r9, r11, r2
        ldrsh   r2, [r0, +r4]
        mla     r10, lr, r10, r12
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        mov     r12, r11, lsl #16
        sub     lr, r2, r12, asr #16
        cmp     r1, lr
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        mov     r2, r10, lsl #16
        blt     LDUR4
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LDUR5
LDUR4:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LDUR5:
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #17
        strh    lr, [r0, +r3]
        ldrsh   lr, [r6, +r4]
        sub     lr, lr, r2, asr #16
        cmp     r1, lr
        blt     LDUR6
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LDUR7
LDUR6:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LDUR7:
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #17
        strh    lr, [r6, +r3]
        ldrsh   r3, [r0, +r4]
        add     r12, r3, r12, asr #16
        cmp     r1, r12
        blt     LDUR8
        cmn     r12, #2, 18
        movge   r3, r12, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDUR9
LDUR8:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDUR9:
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #17
        strh    r3, [r0, +r4]
        ldrsh   r3, [r6, +r4]
        add     r2, r3, r2, asr #16
        cmp     r1, r2
        blt     LDUR10
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        mvnlt   r2, #0xFF
        biclt   r2, r2, #0x7F, 24
        b       LDUR11
LDUR10:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     r2, r2
LDUR11:
        mov     r2, r2, lsl #16
        add     r8, r8, r5, lsl #1
        mov     r2, r2, asr #17
        cmp     r8, #0x80
        strh    r2, [r6, +r4]
        blt     LDUR3
        ldr     lr, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r12, [sp]
        ldr     r2, [pc, #0x168]
LDUR12:
        mov     r7, r12, lsl #1
        ldrsh   r7, [r2, +r7]
        add     lr, lr, #2
        cmp     lr, r5
        add     r4, r7, r4
        blt     LDUR2
        mov     r7, #2
LDUR13:
        add     r12, r12, #1
        cmp     r12, #6
        blt     LDUR1
        ldrsh   r4, [r0]
        ldrsh   r12, [r0, #2]
        ldr     r2, [pc, #0x134]
        mov     lr, #0x7E
        mov     r3, #2
        add     r1, r4, r12
        sub     r4, r4, r12
        strh    r1, [r0]
        strh    r4, [r0, #2]
        sub     r2, r2, #2, 24
LDUR14:
        mov     r11, lr, lsl #1
        mov     r10, r3, lsl #1
        ldrsh   r1, [r0, +r11]
        ldrsh   r12, [r0, +r10]
        ldrsh   r8, [r6, +r10]
        ldrsh   r7, [r6, +r11]
        mov     lr, lr, lsl #2
        str     lr, [sp, #0xC]
        mov     r4, r3, lsl #2
        ldrsh   r5, [r2, +r4]
        add     r3, r3, #2
        add     lr, r2, r4
        sub     r4, r1, r12
        mov     r3, r3, lsl #16
        str     r3, [sp, #8]
        ldrsh   r3, [lr, #2]
        ldrsh   lr, [lr, #4]
        add     r1, r12, r1
        mov     r12, r4, lsl #16
        add     r9, r8, r7
        mov     r1, r1, lsl #16
        mov     r12, r12, asr #16
        mul     r3, r3, r12
        mov     r4, r9, lsl #16
        mul     r9, r5, r12
        mov     r4, r4, asr #16
        mov     r1, r1, asr #16
        mla     r5, r4, r5, r3
        mla     r9, r4, lr, r9
        ldr     r3, [sp, #8]
        sub     r8, r8, r7
        mov     r8, r8, lsl #16
        add     r5, r5, r1, lsl #15
        mov     lr, r8, asr #16
        add     r5, r5, #2, 18
        mov     r3, r3, asr #16
        add     r9, r9, lr, lsl #15
        mov     r5, r5, asr #16
        add     r7, r9, #2, 18
        strh    r5, [r0, +r10]
        cmp     r3, #0x40
        mov     r7, r7, asr #16
        strh    r7, [r6, +r10]
        ldr     r5, [sp, #0xC]
        add     r7, r2, r5
        ldrsh   r9, [r7, #4]
        ldrsh   r5, [r2, +r5]
        ldrsh   r7, [r7, #2]
        mul     r8, r5, r12
        mul     r12, r9, r12
        mla     r8, r4, r7, r8
        mla     r5, r4, r5, r12
        rsb     r12, r3, #0x80
        add     lr, r8, lr, lsl #15
        rsb     r4, lr, #0
        mov     r12, r12, lsl #16
        add     r1, r5, r1, lsl #15
        add     lr, r1, #2, 18
        add     r1, r4, #2, 18
        mov     lr, lr, asr #16
        strh    lr, [r0, +r11]
        mov     r1, r1, asr #16
        strh    r1, [r6, +r11]
        mov     lr, r12, asr #16
        ble     LDUR14
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDUR15:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LDUR_ii_table


        .data
        .align  4


LDUR_bitrevTab:
        .byte   0x02,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x06,0x00,0x00,0x00,0x60,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x10,0x00,0x00,0x00
        .byte   0x0A,0x00,0x00,0x00,0x50,0x00,0x00,0x00,0x0C,0x00,0x00,0x00,0x30,0x00,0x00,0x00
        .byte   0x0E,0x00,0x00,0x00,0x70,0x00,0x00,0x00,0x12,0x00,0x00,0x00,0x48,0x00,0x00,0x00
        .byte   0x14,0x00,0x00,0x00,0x28,0x00,0x00,0x00,0x16,0x00,0x00,0x00,0x68,0x00,0x00,0x00
        .byte   0x1A,0x00,0x00,0x00,0x58,0x00,0x00,0x00,0x1C,0x00,0x00,0x00,0x38,0x00,0x00,0x00
        .byte   0x1E,0x00,0x00,0x00,0x78,0x00,0x00,0x00,0x22,0x00,0x00,0x00,0x44,0x00,0x00,0x00
        .byte   0x26,0x00,0x00,0x00,0x64,0x00,0x00,0x00,0x2A,0x00,0x00,0x00,0x54,0x00,0x00,0x00
        .byte   0x2C,0x00,0x00,0x00,0x34,0x00,0x00,0x00,0x2E,0x00,0x00,0x00,0x74,0x00,0x00,0x00
        .byte   0x32,0x00,0x00,0x00,0x4C,0x00,0x00,0x00,0x36,0x00,0x00,0x00,0x6C,0x00,0x00,0x00
        .byte   0x3A,0x00,0x00,0x00,0x5C,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x7C,0x00,0x00,0x00
        .byte   0x46,0x00,0x00,0x00,0x62,0x00,0x00,0x00,0x4A,0x00,0x00,0x00,0x52,0x00,0x00,0x00
        .byte   0x4E,0x00,0x00,0x00,0x72,0x00,0x00,0x00,0x56,0x00,0x00,0x00,0x6A,0x00,0x00,0x00
        .byte   0x5E,0x00,0x00,0x00,0x7A,0x00,0x00,0x00,0x6E,0x00,0x00,0x00,0x76,0x00,0x00,0x00
LDUR_twd_tbl:
        .byte   0xFF,0x7F,0x00,0x00,0x00,0x00,0xFF,0x7F,0xD9,0x7F,0x48,0x06,0xB8,0xF9,0xD9,0x7F
        .byte   0x62,0x7F,0x8C,0x0C,0x74,0xF3,0x62,0x7F,0x9D,0x7E,0xC8,0x12,0x38,0xED,0x9D,0x7E
        .byte   0x8A,0x7D,0xF9,0x18,0x07,0xE7,0x8A,0x7D,0x2A,0x7C,0x1A,0x1F,0xE6,0xE0,0x2A,0x7C
        .byte   0x7D,0x7A,0x28,0x25,0xD8,0xDA,0x7D,0x7A,0x85,0x78,0x1F,0x2B,0xE1,0xD4,0x85,0x78
        .byte   0x42,0x76,0xFC,0x30,0x04,0xCF,0x42,0x76,0xB6,0x73,0xBA,0x36,0x46,0xC9,0xB6,0x73
        .byte   0xE3,0x70,0x57,0x3C,0xA9,0xC3,0xE3,0x70,0xCA,0x6D,0xCE,0x41,0x32,0xBE,0xCA,0x6D
        .byte   0x6E,0x6A,0x1D,0x47,0xE3,0xB8,0x6E,0x6A,0xD0,0x66,0x40,0x4C,0xC0,0xB3,0xD0,0x66
        .byte   0xF2,0x62,0x34,0x51,0xCC,0xAE,0xF2,0x62,0xD7,0x5E,0xF6,0x55,0x0A,0xAA,0xD7,0x5E
        .byte   0x82,0x5A,0x82,0x5A,0x7E,0xA5,0x82,0x5A,0xF6,0x55,0xD7,0x5E,0x29,0xA1,0xF6,0x55
        .byte   0x34,0x51,0xF2,0x62,0x0E,0x9D,0x34,0x51,0x40,0x4C,0xD0,0x66,0x30,0x99,0x40,0x4C
        .byte   0x1D,0x47,0x6E,0x6A,0x92,0x95,0x1D,0x47,0xCE,0x41,0xCA,0x6D,0x36,0x92,0xCE,0x41
        .byte   0x57,0x3C,0xE3,0x70,0x1D,0x8F,0x57,0x3C,0xBA,0x36,0xB6,0x73,0x4A,0x8C,0xBA,0x36
        .byte   0xFC,0x30,0x42,0x76,0xBE,0x89,0xFC,0x30,0x1F,0x2B,0x85,0x78,0x7B,0x87,0x1F,0x2B
        .byte   0x28,0x25,0x7D,0x7A,0x83,0x85,0x28,0x25,0x1A,0x1F,0x2A,0x7C,0xD6,0x83,0x1A,0x1F
        .byte   0xF9,0x18,0x8A,0x7D,0x76,0x82,0xF9,0x18,0xC8,0x12,0x9D,0x7E,0x63,0x81,0xC8,0x12
        .byte   0x8C,0x0C,0x62,0x7F,0x9E,0x80,0x8C,0x0C,0x48,0x06,0xD9,0x7F,0x27,0x80,0x48,0x06
        .byte   0x00,0x00,0xFF,0x7F,0x00,0x80,0x00,0x00,0xB8,0xF9,0xD9,0x7F,0x27,0x80,0xB8,0xF9
        .byte   0x74,0xF3,0x62,0x7F,0x9E,0x80,0x74,0xF3,0x38,0xED,0x9D,0x7E,0x63,0x81,0x38,0xED
        .byte   0x07,0xE7,0x8A,0x7D,0x76,0x82,0x07,0xE7,0xE6,0xE0,0x2A,0x7C,0xD6,0x83,0xE6,0xE0
        .byte   0xD8,0xDA,0x7D,0x7A,0x83,0x85,0xD8,0xDA,0xE1,0xD4,0x85,0x78,0x7B,0x87,0xE1,0xD4
        .byte   0x04,0xCF,0x42,0x76,0xBE,0x89,0x04,0xCF,0x46,0xC9,0xB6,0x73,0x4A,0x8C,0x46,0xC9
        .byte   0xA9,0xC3,0xE3,0x70,0x1D,0x8F,0xA9,0xC3,0x32,0xBE,0xCA,0x6D,0x36,0x92,0x32,0xBE
        .byte   0xE3,0xB8,0x6E,0x6A,0x92,0x95,0xE3,0xB8,0xC0,0xB3,0xD0,0x66,0x30,0x99,0xC0,0xB3
        .byte   0xCC,0xAE,0xF2,0x62,0x0E,0x9D,0xCC,0xAE,0x0A,0xAA,0xD7,0x5E,0x29,0xA1,0x0A,0xAA
        .byte   0x7E,0xA5,0x82,0x5A,0x7E,0xA5,0x7E,0xA5,0x29,0xA1,0xF6,0x55,0x0A,0xAA,0x29,0xA1
        .byte   0x0E,0x9D,0x34,0x51,0xCC,0xAE,0x0E,0x9D,0x30,0x99,0x40,0x4C,0xC0,0xB3,0x30,0x99
        .byte   0x92,0x95,0x1D,0x47,0xE3,0xB8,0x92,0x95,0x36,0x92,0xCE,0x41,0x32,0xBE,0x36,0x92
        .byte   0x1D,0x8F,0x57,0x3C,0xA9,0xC3,0x1D,0x8F,0x4A,0x8C,0xBA,0x36,0x46,0xC9,0x4A,0x8C
        .byte   0xBE,0x89,0xFC,0x30,0x04,0xCF,0xBE,0x89,0x7B,0x87,0x1F,0x2B,0xE1,0xD4,0x7B,0x87
        .byte   0x83,0x85,0x28,0x25,0xD8,0xDA,0x83,0x85,0xD6,0x83,0x1A,0x1F,0xE6,0xE0,0xD6,0x83
        .byte   0x76,0x82,0xF9,0x18,0x07,0xE7,0x76,0x82,0x63,0x81,0xC8,0x12,0x38,0xED,0x63,0x81
        .byte   0x9E,0x80,0x8C,0x0C,0x74,0xF3,0x9E,0x80,0x27,0x80,0x48,0x06,0xB8,0xF9,0x27,0x80
LDUR_ii_table:
        .byte   0x00,0x01,0x80,0x00,0x40,0x00,0x20,0x00,0x10,0x00,0x08,0x00


