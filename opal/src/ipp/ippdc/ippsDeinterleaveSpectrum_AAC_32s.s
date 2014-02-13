        .text
        .align  4
        .globl  _ippsDeinterleaveSpectrum_AAC_32s


_ippsDeinterleaveSpectrum_AAC_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x60]
        ldr     r4, [sp, #0x64]
        cmp     r0, #0
        beq     LGGD13
        cmp     r1, #0
        beq     LGGD13
        cmp     r3, #0
        beq     LGGD13
        cmp     r4, #0x80
        beq     LGGD0
        mvn     r0, #0x91
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGGD0:
        cmp     r2, #1
        blt     LGGD11
        cmp     r2, #8
        bgt     LGGD11
        cmp     r12, #0
        blt     LGGD10
        cmp     r12, #0x33
        bgt     LGGD10
        cmp     lr, #0
        blt     LGGD9
        cmp     lr, #0xB
        bgt     LGGD9
        ldr     r7, [pc, #0x20C]
        ldr     r5, [pc, #0x20C]
        mov     r6, lr, lsl #1
        ldrsh   r6, [r7, +r6]
        ldr     r11, [r5, +lr, lsl #2]
        cmp     r12, r6
        bgt     LGGD10
        cmp     r2, #0
        ble     LGGD8
        mov     r10, #0
        add     r9, r11, #2
        mov     r6, r3
        str     r3, [sp]
LGGD1:
        cmp     r12, #0
        mov     r5, r0
        ble     LGGD12
        ldr     lr, [r6]
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        mov     r8, r12
        str     r11, [sp, #0x14]
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x1C]
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r11, [sp]
        mov     r7, r10, lsl #2
        str     r0, [sp, #0x24]
        mov     r3, #0
        str     r7, [sp, #0x28]
        str     r6, [sp, #0x34]
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
        mov     r0, r8
LGGD2:
        ldrsh   r7, [r12], #2
        ldrsh   r6, [r2], #2
        cmp     lr, #0
        sub     r7, r7, r6
        ble     LGGD4
        mov     r10, #0
        mov     r9, r10
        add     r8, r1, r3, lsl #2
        mov     r6, r7, lsl #2
        str     r3, [sp, #0x2C]
        str     r12, [sp, #4]
        str     r2, [sp, #8]
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x20]
LGGD3:
        add     r1, r8, r10, lsl #2
        mov     r2, r6
        mov     r0, r5
        bl      _ippsCopy_8u
        ldr     r1, [sp, #0x28]
        add     r9, r9, #1
        add     r5, r5, r7, lsl #2
        ldr     lr, [r11, +r1]
        add     r10, r10, r4
        cmp     r9, lr
        blt     LGGD3
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x20]
LGGD4:
        subs    r0, r0, #1
        add     r3, r3, r7
        bne     LGGD2
        ldr     r7, [sp, #0x28]
        ldr     r6, [sp, #0x34]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
LGGD5:
        cmp     lr, #0
        ble     LGGD7
        sub     lr, r4, r3
        str     r11, [sp, #0x14]
        ldr     r11, [sp]
        mov     r8, #0
        add     r3, r1, r3, lsl #2
        mov     lr, lr, lsl #2
        str     r9, [sp, #0xC]
        str     r10, [sp, #0x10]
        mov     r5, r8
        str     r12, [sp, #0x18]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
        mov     r10, r3
        mov     r9, lr
LGGD6:
        add     r0, r10, r8, lsl #2
        mov     r1, r9
        bl      _ippsZero_8u
        ldr     lr, [r7, +r11]
        add     r5, r5, #1
        add     r8, r8, r4
        cmp     r5, lr
        blt     LGGD6
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LGGD7:
        mul     lr, r4, lr
        add     r10, r10, #1
        cmp     r10, r2
        add     r6, r6, #4
        add     r0, r0, lr, lsl #2
        add     r1, r1, lr, lsl #2
        blt     LGGD1
LGGD8:
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGGD9:
        mvn     r0, #0x92
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGGD10:
        mvn     r0, #0xA1
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGGD11:
        mvn     r0, #0x90
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LGGD12:
        ldr     lr, [r6]
        mov     r3, #0
        mov     r7, r10, lsl #2
        b       LGGD5
LGGD13:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LGGD__pAACNumSwbTableShort
        .long   LGGD__pAACSwbOffsetTableShort


        .data
        .align  4


LGGD__pSwbOffsetShort96000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x20,0x00
        .byte   0x28,0x00,0x30,0x00,0x40,0x00,0x5C,0x00,0x80,0x00,0x00,0x00
LGGD__pSwbOffsetShort64000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x20,0x00
        .byte   0x28,0x00,0x30,0x00,0x40,0x00,0x5C,0x00,0x80,0x00,0x00,0x00
LGGD__pSwbOffsetShort48000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x1C,0x00,0x24,0x00
        .byte   0x2C,0x00,0x38,0x00,0x44,0x00,0x50,0x00,0x60,0x00,0x70,0x00,0x80,0x00,0x00,0x00
LGGD__pSwbOffsetShort24000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x24,0x00,0x2C,0x00,0x34,0x00,0x40,0x00,0x4C,0x00,0x5C,0x00,0x6C,0x00,0x80,0x00
LGGD__pSwbOffsetShort16000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x20,0x00,0x28,0x00,0x30,0x00,0x3C,0x00,0x48,0x00,0x58,0x00,0x6C,0x00,0x80,0x00
LGGD__pSwbOffsetShort8000:
        .byte   0x00,0x00,0x04,0x00,0x08,0x00,0x0C,0x00,0x10,0x00,0x14,0x00,0x18,0x00,0x1C,0x00
        .byte   0x24,0x00,0x2C,0x00,0x34,0x00,0x3C,0x00,0x48,0x00,0x58,0x00,0x6C,0x00,0x80,0x00
LGGD__pAACNumSwbTableShort:
        .byte   0x0C,0x00,0x0C,0x00,0x0C,0x00,0x0E,0x00,0x0E,0x00,0x0E,0x00,0x0F,0x00,0x0F,0x00
        .byte   0x0F,0x00,0x0F,0x00,0x0F,0x00,0x0F,0x00


        .data
        .align  4


LGGD__pAACSwbOffsetTableShort:
        .long   LGGD__pSwbOffsetShort96000
        .long   LGGD__pSwbOffsetShort96000
        .long   LGGD__pSwbOffsetShort64000
        .long   LGGD__pSwbOffsetShort48000
        .long   LGGD__pSwbOffsetShort48000
        .long   LGGD__pSwbOffsetShort48000
        .long   LGGD__pSwbOffsetShort24000
        .long   LGGD__pSwbOffsetShort24000
        .long   LGGD__pSwbOffsetShort16000
        .long   LGGD__pSwbOffsetShort16000
        .long   LGGD__pSwbOffsetShort16000
        .long   LGGD__pSwbOffsetShort8000


