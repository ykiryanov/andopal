        .text
        .align  4
        .globl  ownsDecodeScalefactor_AAC_1u16s


ownsDecodeScalefactor_AAC_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r4, r0
        ldr     lr, [r4]
        ldr     r12, [sp, #0x44]
        ldr     r9, [r1]
        ldr     r8, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        ldr     r6, [sp, #0x50]
        ldrb    r5, [lr]
        cmp     r12, #0
        rsb     r9, r9, #8
        add     r10, lr, #1
        ble     LGHL12
        mov     r11, r8
        mov     r0, #0
        str     r4, [sp]
        mov     lr, r0
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        mov     r4, #0
LGHL0:
        ldr     r3, [r11], #4
        cmp     r3, #0
        ble     LGHL11
        str     r12, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        mov     r2, #0
        mov     r1, r2
        str     r11, [sp, #0x10]
LGHL1:
        ldrb    r11, [r1, +r6]
        cmp     r2, r11
        bge     LGHL10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        str     r8, [sp, #0x18]
LGHL2:
        cmp     r9, #0x10
        bgt     LGHL3
        ldrb    r8, [r10]
        ldrb    r3, [r10, #1]
        add     r9, r9, #0x10
        mov     r8, r8, lsl #8
        orr     r5, r8, r5, lsl #16
        orr     r5, r5, r3
        add     r10, r10, #2
LGHL3:
        cmp     r9, #0x18
        bgt     LGHL4
        ldrb    r3, [r10], #1
        add     r9, r9, #8
        orr     r5, r3, r5, lsl #8
LGHL4:
        ldrb    r8, [r7, +r1]
        cmp     r8, #0
        bne     LGHL5
        mov     r3, r0
        add     r0, r0, #2
        strh    r4, [r3]
        b       LGHL9
LGHL5:
        cmp     r8, #0xB
        ble     LGHL6
        cmp     r8, #0xF
        beq     LGHL6
        cmp     r8, #0xE
        bne     LGHL15
LGHL6:
        ldr     r3, [pc, #0x110]
LGHL7:
        sub     r9, r9, #1
        mov     r11, r5, lsr r9
        tst     r11, #1
        addeq   r3, r3, #1
        ldrneb  r11, [r3]
        addne   r3, r3, r11, asr #1
        ldrb    r11, [r3]
        tst     r11, #1
        beq     LGHL7
        cmp     r8, #0xB
        bgt     LGHL8
        add     r11, r12, r11, asr #1
        sub     r12, r11, #0x3C
        cmp     r12, #0xFF
        bgt     LGHL14
        cmp     r12, #0
        blt     LGHL13
        mov     r3, r0
        add     r0, r0, #2
        strh    r12, [r3]
        b       LGHL9
LGHL8:
        add     r11, lr, r11, asr #1
        mov     r3, r0
        sub     lr, r11, #0x3C
        add     r0, r0, #2
        strh    lr, [r3]
LGHL9:
        ldrb    r3, [r1, +r6]
        add     r2, r2, #1
        cmp     r2, r3
        blt     LGHL2
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r3, [r8, +r0, lsl #2]
LGHL10:
        add     r1, r1, #1
        cmp     r1, r3
        blt     LGHL1
        str     r12, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        ldr     r12, [sp, #0x1C]
LGHL11:
        subs    r12, r12, #1
        add     r6, r6, r3
        add     r7, r7, r3
        add     r0, r0, #1
        bne     LGHL0
        ldr     r4, [sp]
        ldr     r1, [sp, #4]
        ldr     lr, [r4]
LGHL12:
        sub     r10, r10, lr
        mov     r0, #0
        rsb     r9, r9, r10, lsl #3
        str     r9, [r1]
        ldr     r2, [r4]
        add     r9, r2, r9, asr #3
        str     r9, [r4]
        ldr     r2, [r1]
        and     r2, r2, #7
        str     r2, [r1]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LGHL13:
        mvn     r0, #0xA3
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LGHL14:
        mvn     r0, #0xA3
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LGHL15:
        mvn     r0, #0xA5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   LGHL__pHfTableScf


        .data
        .align  4


LGHL__pHfTableScf:
        .byte   0x04,0x79,0x0C,0x04,0x77,0x04,0x7B,0x75,0x0C,0x04,0x7D,0x04,0x73,0x7F,0x10,0x08
        .byte   0x04,0x71,0x81,0x04,0x6F,0x83,0x14,0x08,0x04,0x85,0x6D,0x04,0x87,0x04,0x6B,0x89
        .byte   0x14,0x08,0x04,0x69,0x8B,0x04,0x67,0x04,0x8D,0x65,0x18,0x08,0x04,0x63,0x8F,0x08
        .byte   0x04,0x91,0x61,0x04,0x93,0x5F,0x18,0x08,0x04,0x95,0x5D,0x08,0x04,0x99,0x97,0x04
        .byte   0x9B,0x9D,0x18,0x08,0x04,0x5B,0x57,0x08,0x04,0x59,0x9F,0x04,0x55,0x53,0x18,0x08
        .byte   0x04,0xA1,0x51,0x08,0x04,0xA3,0x4F,0x04,0xA5,0x4D,0x1C,0x0C,0x04,0xA7,0x04,0x4B
        .byte   0x47,0x08,0x04,0xAB,0x43,0x04,0x49,0x45,0x18,0x08,0x04,0xA9,0x41,0x08,0x04,0xAF
        .byte   0xB3,0x04,0x3D,0x3F,0x24,0x10,0x08,0x04,0xAD,0x3B,0x04,0x35,0x37,0x08,0x04,0x39
        .byte   0x31,0x04,0xB1,0x04,0x33,0x2D,0x58,0x1C,0x0C,0x04,0x2F,0x04,0xB5,0x2B,0x08,0x04
        .byte   0x27,0x07,0x04,0x03,0x05,0x1C,0x0C,0x04,0x01,0x04,0xC5,0xC7,0x08,0x04,0xC9,0xCB
        .byte   0x04,0xCD,0xEB,0x10,0x08,0x04,0xC3,0xB7,0x04,0xB9,0xBB,0x08,0x04,0xBD,0xBF,0x04
        .byte   0xC1,0xD1,0x40,0x20,0x10,0x08,0x04,0xDF,0xE1,0x04,0xE3,0xE5,0x08,0x04,0xE7,0xE9
        .byte   0x04,0xDD,0xD3,0x10,0x08,0x04,0xD5,0xD7,0x04,0xD9,0xDB,0x08,0x04,0xED,0x0D,0x04
        .byte   0x11,0x13,0x20,0x10,0x08,0x04,0x15,0x0B,0x04,0xCF,0xF1,0x08,0x04,0xEF,0x09,0x04
        .byte   0x0F,0x1F,0x10,0x08,0x04,0x21,0x25,0x04,0x29,0x23,0x08,0x04,0x17,0x19,0x04,0x1D
        .byte   0x1B


