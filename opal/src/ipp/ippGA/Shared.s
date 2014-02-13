        .text
        .align  4
        .globl  kodiakExp


kodiakExp:
        stmdb   sp!, {r4 - r11, lr}
LAAI_$M334:
        mov     r3, r0
        ldr     r0, [pc, #0xA0]
        mov     r7, r2
        mov     r2, r3, asr #31
        mov     lr, r1
        mul     r1, r2, r0
        umull   r11, r2, r3, r0
        mul     r0, r3, r0
        ldr     r3, [pc, #0x80]
        add     r1, r1, r2
        mov     r2, lr
        ldr     r3, [r3]
        mov     lr, pc
        mov     pc, r3
        mov     r3, r1, lsl #1
        ldr     r8, [pc, #0x60]
        orr     r6, r3, r0, lsr #31
        ldr     r9, [pc, #0x54]
        sub     r1, r0, r6, lsl #31
        ldr     r0, [pc, #0x48]
        mov     r3, r1, asr #31
        mul     r2, r3, r0
        umull   lr, r3, r1, r0
        mul     lr, r1, r0
        add     r0, r2, r3
        mov     r3, r0, lsl #1
        orr     r2, r3, lr, lsr #31
        mov     r0, #2, 2
        mov     r1, #0
        mov     r4, #1, 2
        mov     lr, #0
        mov     r5, #0
LAAI0:
        ldr     r3, [r5, +r9]
        cmp     r2, r3
        ble     LAAI1
        sub     r2, r2, r3
        adds    r3, r4, #2, 2
        adc     r11, lr, #0
        b       LAAI2
        .long   0x58b90bfc
        .long   ExpTable1
        .long   ExpTable2
        .long   __imp___rt_srsh
        .long   0xb8aa3b29
LAAI1:
        ldr     r3, [r5, +r8]
        cmp     r2, r3
        bge     LAAI3
        sub     r2, r2, r3
        rsbs    r3, r4, #2, 2
        rsc     r11, lr, #0
LAAI2:
        mov     r10, r3
        mul     r1, r10, r1
        mul     r10, r11, r0
        add     r1, r1, r10
        umull   r10, r11, r3, r0
        mul     r10, r3, r0
        add     r0, r1, r11
        mov     r3, r0, lsl #1
        orr     r3, r3, r10, lsr #31
        mov     r1, r0, asr #31
        mov     r0, r3
LAAI3:
        mov     r3, lr, lsl #31
        add     r5, r5, #4
        orr     r4, r3, r4, lsr #1
        mov     lr, lr, asr #1
        cmp     r5, #0x80
        blt     LAAI0
        sub     r3, r7, r6
        adds    r2, r3, #0x1F
        bpl     LAAI5
        add     r3, r2, #0x1F
        mov     lr, #0
        mov     r11, lr, lsl r3
        rsb     r10, r3, #0x20
        mov     lr, #1
        orr     r11, r11, lr, lsr r10
        sub     r10, r3, #0x20
        mov     r3, lr, lsl r3
        orr     lr, r11, lr, lsl r10
        cmp     r1, lr
        blt     LAAI4
        bgt     LAAI6
        cmp     r0, r3
        bcs     LAAI6
LAAI4:
        rsb     r1, r2, #0
        mov     r0, r0, lsl r1
        b       LAAI7
LAAI5:
        ldr     r3, [pc, #-0xBC]
        ldr     r3, [r3]
        mov     lr, pc
        mov     pc, r3
        cmp     r1, #0
        bmi     LAAI7
        bgt     LAAI6
        mvn     r3, #2, 2
        cmp     r0, r3
        bls     LAAI7
LAAI6:
        mvn     r0, #2, 2
LAAI7:
        ldmia   sp!, {r4 - r11, pc}
LAAI_$M335:


        .text
        .align  4
        .globl  _divide32


LAAI_$M341:
_divide32:
        cmp     r0, #0
        mov     r2, #0
        moveq   r2, #0
        beq     LAAI9
        mov     r3, #0x1E       
LAAI8:
        mov     r0, r0, lsl #1
        cmp     r0, r1
        mov     r2, r2, lsl #1
        sub     r3, r3, #1
        subge   r0, r0, r1
        addge   r2, r2, #1
        cmp     r3, #0
        bhi     LAAI8
LAAI9:
        mov     r0, r2
        mov     pc, lr
LAAI_$M342:


        .text
        .align  4
        .globl  _clz32s


LAAI_$M348:
_clz32s:
        mov     r2, r0
        cmp     r2, #0
        mov     r0, #0
        moveq   r0, #0x20
        beq     LAAI11
        ble     LAAI11
        mov     r1, #1, 2
        mov     r0, #1
        ands    r3, r2, #1, 2
        bne     LAAI11
LAAI10:
        mov     r1, r1, asr #1
        add     r0, r0, #1
        ands    r3, r2, r1
        beq     LAAI10
LAAI11:
        mov     pc, lr
LAAI_$M349:


        .data
        .align  4
        .globl  ExpTable2
        .globl  ExpTable1


ExpTable1:
        .byte   0xD9,0x47,0xE6,0x33,0xC8,0xF7,0x8F,0x1C,0xB7,0x83,0x13,0x0F,0x30,0x8C,0xC2,0x07
        .byte   0x62,0x53,0xF0,0x03,0x8B,0x0A,0xFC,0x01,0x53,0x01,0xFF,0x00,0x2B,0xC0,0x7F,0x00
        .byte   0x05,0xF0,0x3F,0x00,0x01,0xFC,0x1F,0x00,0x00,0xFF,0x0F,0x00,0xC0,0xFF,0x07,0x00
        .byte   0xF0,0xFF,0x03,0x00,0xFC,0xFF,0x01,0x00,0xFF,0xFF,0x00,0x00,0x00,0x80,0x00,0x00
        .byte   0x00,0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x08,0x00,0x00
        .byte   0x00,0x04,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x80,0x00,0x00,0x00
        .byte   0x40,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x10,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        .byte   0x04,0x00,0x00,0x00,0x02,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00
ExpTable2:
        .byte   0x04,0xF4,0x46,0xA7,0xDE,0x3B,0x2D,0xDB,0x7E,0x71,0xE8,0xEE,0xA5,0x33,0xBD,0xF7
        .byte   0x9E,0xA8,0xEF,0xFB,0x35,0xF5,0xFB,0xFD,0xA9,0xFE,0xFE,0xFE,0xD5,0xBF,0x7F,0xFF
        .byte   0xFB,0xEF,0xBF,0xFF,0xFF,0xFB,0xDF,0xFF,0x00,0xFF,0xEF,0xFF,0xC0,0xFF,0xF7,0xFF
        .byte   0xF0,0xFF,0xFB,0xFF,0xFC,0xFF,0xFD,0xFF,0xFF,0xFF,0xFE,0xFF,0x00,0x80,0xFF,0xFF
        .byte   0x00,0xC0,0xFF,0xFF,0x00,0xE0,0xFF,0xFF,0x00,0xF0,0xFF,0xFF,0x00,0xF8,0xFF,0xFF
        .byte   0x00,0xFC,0xFF,0xFF,0x00,0xFE,0xFF,0xFF,0x00,0xFF,0xFF,0xFF,0x80,0xFF,0xFF,0xFF
        .byte   0xC0,0xFF,0xFF,0xFF,0xE0,0xFF,0xFF,0xFF,0xF0,0xFF,0xFF,0xFF,0xF8,0xFF,0xFF,0xFF
        .byte   0xFC,0xFF,0xFF,0xFF,0xFE,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF


        .data
        .align  4


LAAI_$T336:
        .long   kodiakExp
        .byte   0x01,0x64,0x00,0x40


        .data
        .align  4


LAAI_$T343:
        .long   _divide32
        .byte   0x00,0x0F,0x00,0x40


        .data
        .align  4


LAAI_$T350:
        .long   _clz32s
        .byte   0x00,0x0F,0x00,0x40


