        .text
        .align  4
        .globl  _ippsHuffmanDecodeSfb_MP3_1u32s


_ippsHuffmanDecodeSfb_MP3_1u32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     lr, [sp, #0x54]
        ldr     r10, [sp, #0x58]
        ldr     r12, [sp, #0x5C]
        ldr     r9, [sp, #0x60]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r7, r3
        beq     LGDT31
        cmp     r4, #0
        beq     LGDT31
        cmp     r6, #0
        beq     LGDT31
        cmp     r7, #0
        beq     LGDT31
        cmp     lr, #0
        beq     LGDT31
        cmp     r10, #0
        beq     LGDT31
        ldr     r1, [r5]
        cmp     r1, #0
        beq     LGDT31
        ldr     r0, [r4]
        cmp     r0, #0
        blt     LGDT25
        cmp     r0, #7
        bgt     LGDT25
        cmp     r12, #0
        blt     LGDT25
        ldr     r8, [lr]
        cmp     r12, r8
        bgt     LGDT25
        ldr     r8, [lr, #4]
        movs    r8, r8, lsl #1
        bmi     LGDT29
        cmp     r8, #9, 26
        bgt     LGDT29
        ldr     r2, [lr, #0x14]
        cmp     r2, #0
        blt     LGDT29
        cmp     r2, #3
        bgt     LGDT29
        ldr     r11, [lr, #0x10]
        cmp     r11, #0
        beq     LGDT0
        cmp     r11, #1
        beq     LGDT0
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT0:
        ldr     r3, [lr, #0x44]
        cmp     r3, #0
        beq     LGDT1
        cmp     r3, #1
        beq     LGDT1
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT1:
        ldr     r3, [r10]
        cmp     r3, #0
        str     r3, [sp, #0x20]
        beq     LGDT2
        ldr     r3, [sp, #0x20]
        cmp     r3, #1
        beq     LGDT2
        mvn     r0, #0xAA
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT2:
        ldr     r3, [r10, #4]
        cmp     r3, #1
        beq     LGDT4
LGDT3:
        mvn     r0, #0xAA
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT4:
        ldr     r10, [r10, #0x10]
        cmp     r10, #0
        blt     LGDT3
        cmp     r10, #2
        bgt     LGDT3
        cmp     r12, #0
        bne     LGDT10
        cmp     r11, #0
        beq     LGDT6
        cmp     r2, #0
        beq     LGDT29
        ldr     r0, [lr, #0x1C]
        cmp     r0, #0
        blt     LGDT29
        cmp     r0, #0x1F
        bgt     LGDT29
        ldr     lr, [lr, #0x20]
        cmp     lr, #0
        blt     LGDT5
        cmp     lr, #0x1F
        ble     LGDT8
LGDT5:
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT6:
        ldr     r0, [lr, #0x34]
        cmp     r0, #0
        blt     LGDT29
        ldr     r1, [lr, #0x38]
        cmp     r1, #0
        blt     LGDT29
        add     r1, r0, r1
        add     r0, r1, #2
        cmp     r0, #0x17
        bge     LGDT29
        ldr     r0, [lr, #0x1C]
        cmp     r0, #0
        blt     LGDT29
        cmp     r0, #0x1F
        bgt     LGDT29
        ldr     r0, [lr, #0x20]
        cmp     r0, #0
        blt     LGDT29
        cmp     r0, #0x1F
        bgt     LGDT29
        ldr     lr, [lr, #0x24]
        cmp     lr, #0
        blt     LGDT7
        cmp     lr, #0x1F
        ble     LGDT8
LGDT7:
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT8:
        mov     r0, #0
        add     r6, r6, #4
        mov     r2, #0
        mov     r1, r0
LGDT9:
        add     r0, r0, #6
        str     r1, [r6, #-4]
        str     r1, [r6]
        str     r1, [r6, #4]
        str     r1, [r6, #8]
        str     r1, [r6, #0xC]
        str     r1, [r6, #0x10]
        cmp     r0, #9, 26
        add     r6, r6, #0x18
        blt     LGDT9
        mov     r0, #0
        str     r2, [r7]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT10:
        cmp     r11, #0
        beq     LGDT17
        cmp     r2, #0
        beq     LGDT29
        ldr     r9, [sp, #0x20]
        cmp     r9, #1
        beq     LGDT28
        cmp     r2, #2
        movne   r11, #0x36
        beq     LGDT28
LGDT11:
        cmp     r11, r8
        add     r9, sp, #0x24
        movge   r11, r8
        add     r10, sp, #0x24
        str     r11, [r10]
        sub     r11, r8, r11
        str     r11, [r9, #4]
        mov     r11, #0
        mov     r10, r11
        mov     r9, lr
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r7, [sp, #8]
LGDT12:
        ldr     r2, [r9, #0x1C]
        add     r12, sp, #0x24
        ldr     r7, [r12, +r11, lsl #2]
        cmp     r2, #0
        blt     LGDT27
        cmp     r2, #0x1F
        bgt     LGDT26
        cmp     r7, #0
        beq     LGDT16
        cmp     r2, #0
        add     r3, r6, r10, lsl #2
        bne     LGDT14
LGDT13:
        mov     r1, r7, lsl #2
        mov     r0, r3
        bl      ownsZero_8u
        b       LGDT15
LGDT14:
        cmp     r2, #4
        beq     LGDT13
        cmp     r2, #0xE
        beq     LGDT13
        str     r7, [sp]
        mov     r1, r4
        mov     r0, r5
        bl      LGDT__sHuffmanGetPairs_MP3
LGDT15:
        add     r10, r10, r7
LGDT16:
        add     r11, r11, #1
        cmp     r11, #2
        add     r9, r9, #4
        blt     LGDT12
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r7, [sp, #8]
        b       LGDT23
LGDT17:
        ldr     r2, [lr, #0x34]
        cmp     r2, #0
        blt     LGDT29
        ldr     r11, [lr, #0x38]
        cmp     r11, #0
        blt     LGDT29
        add     r11, r2, r11
        str     r11, [sp, #0x1C]
        add     r11, r11, #2
        cmp     r11, #0x17
        bge     LGDT29
        ldr     r11, [sp, #0x20]
        mov     r3, #0x8A
        mul     r11, r11, r3
        rsb     r3, r10, r10, lsl #2
        rsb     r3, r10, r3, lsl #3
        mov     r10, r2, lsl #1
        add     r3, r9, r3, lsl #1
        add     r10, r10, #2
        add     r11, r3, r11
        ldrsh   r9, [r11, +r10]
        ldr     r10, [sp, #0x1C]
        mov     r10, r10, lsl #1
        add     r10, r10, #4
        ldrsh   r10, [r11, +r10]
        cmp     r9, r8
        movge   r9, r8
        add     r11, sp, #0x24
        cmp     r10, r8
        str     r9, [r11]
        movge   r10, r8
        sub     r9, r10, r9
        add     r11, sp, #0x24
        sub     r10, r8, r10
        str     r10, [r11, #8]
        add     r2, sp, #0x24
        str     r9, [r2, #4]
        mov     r11, #0
        mov     r10, r11
        mov     r9, lr
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     lr, [sp, #0xC]
        str     r7, [sp, #8]
LGDT18:
        ldr     r2, [r9, #0x1C]
        add     r12, sp, #0x24
        ldr     r7, [r12, +r11, lsl #2]
        cmp     r2, #0
        blt     LGDT30
        cmp     r2, #0x1F
        bgt     LGDT29
        cmp     r7, #0
        beq     LGDT22
        cmp     r2, #0
        add     r3, r6, r10, lsl #2
        bne     LGDT20
LGDT19:
        mov     r1, r7, lsl #2
        mov     r0, r3
        bl      ownsZero_8u
        b       LGDT21
LGDT20:
        cmp     r2, #4
        beq     LGDT19
        cmp     r2, #0xE
        beq     LGDT19
        str     r7, [sp]
        mov     r1, r4
        mov     r0, r5
        bl      LGDT__sHuffmanGetPairs_MP3
LGDT21:
        add     r10, r10, r7
LGDT22:
        add     r11, r11, #1
        cmp     r11, #2
        add     r9, r9, #4
        ble     LGDT18
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r7, [sp, #8]
LGDT23:
        ldr     r10, [r5]
        ldr     r9, [r4]
        sub     r10, r10, r1
        add     r10, r9, r10, lsl #3
        sub     r10, r10, r0
        subs    r12, r12, r10
        bmi     LGDT24
        str     r12, [sp, #4]
        str     r8, [sp]
        ldr     r2, [lr, #0x44]
        mov     r0, r5
        mov     r3, r6
        mov     r1, r4
        bl      LGDT__sHuffmanGetQuads_MP3
        str     r0, [r7]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT24:
        mvn     r0, #1
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT25:
        mvn     r0, #4
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT26:
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT27:
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT28:
        mov     r11, #0x24
        b       LGDT11
LGDT29:
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT30:
        mvn     r0, #0xA9
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT31:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGDT__sHuffmanGetPairs_MP3:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        cmp     r12, #0
        beq     LGDT61
        cmp     r2, #0
        mov     r7, #0
        beq     LGDT59
        cmp     r2, #4
        beq     LGDT59
        cmp     r2, #0xE
        beq     LGDT59
        ldr     r4, [r1]
        ldr     lr, [r0]
        cmp     r4, #0
        mov     r8, lr
        moveq   r4, r7
        moveq   r10, r4
        beq     LGDT32
        ldr     r6, [pc, #0xBD8]
        rsb     r4, r4, #8
        ldrb    r5, [lr]
        ldr     r6, [r6, +r4, lsl #2]
        add     r8, lr, #1
        and     r10, r5, r6
LGDT32:
        cmp     r2, #0xD
        bge     LGDT42
        ldr     r5, [pc, #0xBBC]
        cmp     r12, #0
        ldr     r5, [r5, +r2, lsl #2]
        ble     LGDT58
        add     r6, r3, #4
LGDT33:
        cmp     r4, #0xC
        bgt     LGDT34
        ldrb    lr, [r8]
        ldrb    r2, [r8, #1]
        add     r4, r4, #0x10
        mov     lr, lr, lsl #8
        orr     r10, lr, r10, lsl #16
        orr     r10, r10, r2
        add     r8, r8, #2
LGDT34:
        sub     r4, r4, #4
        mov     r2, r10, lsr r4
        and     r2, r2, #0xF
        ldrb    r2, [r5, +r2]
        and     lr, r2, #0xF
        tst     lr, #1
        beq     LGDT35
        ldr     r9, [pc, #0xB6C]
        mov     lr, lr, lsr #1
        sub     lr, lr, #7
        cmn     lr, #7
        ldrcsb  r9, [r9, +lr]
        mov     lr, #0
        addcs   pc, pc, r9, lsl #2
        b       LGDT_bd.1.6
LGDT_bd.1.4:
        .long   0xe2844003
        .long   0xe1a0200e
        .long   0xea00002d
LGDT_bd.1.3:
        .long   0xe2844002
        .long   0xe1a0200e
        .long   0xea00002a
LGDT35:
        mov     r2, r2, asr #1
        sub     r4, r4, #1
        and     r2, r2, #0x7F
        mov     lr, r10, lsr r4
        tst     lr, #1
        add     r2, r5, r2
        addeq   lr, r2, #0x11
        beq     LGDT36
        ldrb    r2, [r2, #0x10]
        mov     r2, r2, asr #1
        and     r2, r2, #0x7F
        add     r2, r5, r2
        add     lr, r2, #0x10
LGDT36:
        ldrb    r2, [lr]
        tst     r2, #1
        bne     LGDT39
LGDT37:
        sub     r4, r4, #1
        mov     r9, r10, lsr r4
        tst     r9, #1
        addeq   lr, lr, #1
        beq     LGDT38
        mov     r2, r2, asr #1
        and     r2, r2, #0x7F
        add     r2, r5, r2
        add     lr, r2, #0x10
LGDT38:
        ldrb    r2, [lr]
        tst     r2, #1
        beq     LGDT37
LGDT39:
        mov     r9, r2, asr #5
        mov     lr, r2, asr #2
        ands    r2, r9, #7
        and     lr, lr, #7
        beq     LGDT40
        sub     r4, r4, #1
        mov     r9, r10, lsr r4
        tst     r9, #1
        rsbne   r2, r2, #0
LGDT40:
        cmp     lr, #0
        beq     LGDT41
        sub     r4, r4, #1
        mov     r9, r10, lsr r4
        tst     r9, #1
        rsbne   lr, lr, #0
LGDT41:
        str     r2, [r3], #8
        add     r7, r7, #2
        str     lr, [r6], #8
        cmp     r7, r12
        blt     LGDT33
        ldr     lr, [r0]
        b       LGDT58
LGDT42:
        ldr     r5, [pc, #0xA70]
        ldr     r6, [pc, #0xA70]
        cmp     r12, #0
        add     r5, r5, r2
        add     r2, r6, r2, lsl #2
        ldrb    r6, [r5, #-0xD]
        ldr     r5, [r2, #-0x34]
        ble     LGDT58
        add     r9, r3, #4
        str     r1, [sp, #4]
        str     r0, [sp]
LGDT43:
        cmp     r4, #0x14
        bgt     LGDT46
        cmp     r4, #0x10
        ble     LGDT44
        ldrb    r0, [r8], #1
        add     r4, r4, #8
        orr     r10, r0, r10, lsl #8
        b       LGDT46
LGDT44:
        cmp     r4, #8
        ble     LGDT45
        ldrb    r1, [r8]
        ldrb    r0, [r8, #1]
        add     r4, r4, #0x10
        mov     r1, r1, lsl #8
        orr     r10, r1, r10, lsl #16
        orr     r10, r10, r0
        add     r8, r8, #2
        b       LGDT46
LGDT45:
        ldrb    r1, [r8]
        ldrb    r0, [r8, #1]
        add     r4, r4, #0x18
        mov     r1, r1, lsl #16
        orr     r10, r1, r10, lsl #24
        ldrb    r1, [r8, #2]
        orr     r0, r10, r0, lsl #8
        add     r8, r8, #3
        orr     r10, r0, r1
LGDT46:
        sub     r4, r4, #4
        mov     r0, r10, lsr r4
        and     r0, r0, #0xF
        mov     r0, r0, lsl #1
        ldrh    lr, [r5, +r0]
        and     r0, lr, #0xF
        tst     r0, #1
        beq     LGDT47
        ldr     r11, [pc, #0x9C0]
        mov     r0, r0, lsr #1
        sub     r2, r0, #7
        cmn     r2, #7
        ldrcsb  r2, [r11, +r2]
        mvn     r0, #0
        mov     r1, #0
        addcs   pc, pc, r2, lsl #2
        ldr     r1, [sp, #4]
LGDT_.Lpc2:
        ldr     r0, [sp]
        str     r1, [sp, #4]
        str     r0, [sp]
        b       LGDT_bd.2.6
LGDT_bd.2.2:
        .long   0xe2844001
        .long   0xe1a00001
        .long   0xea000038
LGDT_bd.2.4:
        .long   0xe2844003
        .long   0xe1a00001
        .long   0xea000035
LGDT47:
        mvn     r0, #1
        add     r0, r0, #1, 16
        sub     r4, r4, #1
        bic     lr, lr, #1
        and     r0, lr, r0
        mov     r1, r10, lsr r4
        tst     r1, #1
        add     r0, r5, r0
        addeq   r1, r0, #0x22
        beq     LGDT48
        ldrh    r0, [r0, #0x20]
        mvn     r1, #1
        add     r1, r1, #1, 16
        bic     r0, r0, #1
        and     r1, r0, r1
        add     r0, r5, r1
        add     r1, r0, #0x20
LGDT48:
        ldrh    r0, [r1]
        tst     r0, #1
        bne     LGDT51
LGDT49:
        sub     r4, r4, #1
        mov     r2, r10, lsr r4
        tst     r2, #1
        addeq   r1, r1, #2
        beq     LGDT50
        mvn     r1, #1
        add     r1, r1, #1, 16
        bic     r0, r0, #1
        and     r1, r0, r1
        add     r0, r5, r1
        add     r1, r0, #0x20
LGDT50:
        ldrh    r0, [r1]
        tst     r0, #1
        beq     LGDT49
LGDT51:
        mov     r1, r0, asr #6
        and     r1, r1, #0xF
        mov     r0, r0, asr #2
        cmp     r1, #0xF
        and     r0, r0, #0xF
        beq     LGDT67
LGDT52:
        cmp     r1, #0
        beq     LGDT54
LGDT53:
        sub     r4, r4, #1
        mov     r2, r10, lsr r4
        tst     r2, #1
        rsbne   r1, r1, #0
LGDT54:
        cmp     r0, #0xF
        beq     LGDT65
LGDT55:
        cmp     r0, #0
        beq     LGDT57
LGDT56:
        sub     r4, r4, #1
        mov     r2, r10, lsr r4
        tst     r2, #1
        rsbne   r0, r0, #0
LGDT57:
        str     r1, [r3], #8
        add     r7, r7, #2
        str     r0, [r9], #8
        cmp     r7, r12
        blt     LGDT43
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        ldr     lr, [r0]
LGDT58:
        sub     r8, r8, lr
        rsb     r8, r4, r8, lsl #3
        str     r8, [r1]
        ldr     r2, [r0]
        add     r8, r2, r8, asr #3
        str     r8, [r0]
        ldr     r0, [r1]
        and     r0, r0, #7
        str     r0, [r1]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDT59:
        cmp     r12, #0
        ble     LGDT61
        mov     r1, r7
        add     r0, r3, #4
LGDT60:
        str     r7, [r3], #8
        add     r1, r1, #2
        str     r7, [r0], #8
        cmp     r1, r12
        blt     LGDT60
LGDT61:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LGDT_bd.1.7:
        .long   0xe2444001
        .long   0xe1a02c02
        .long   0xe1a0e43a
        .long   0xe31e0001
        .long   0xe1a02f42
        .long   0x03a0e001
        .long   0x13e0e000
        .long   0xeaffff5b
LGDT_bd.1.5:
        .long   0xe2444001
        .long   0xe1a0243a
        .long   0xe3120001
        .long   0x03a02002
        .long   0x13e02001
        .long   0xeaffff55
LGDT_bd.1.2:
        .long   0xe1a0ed02
        .long   0xe1a09c02
        .long   0xe2844001
        .long   0xe1a02f49
        .long   0xe1a0ef4e
        .long   0xeaffff4f
LGDT_bd.1.1:
        .long   0xe1a0ed02
        .long   0xe1a09c02
        .long   0xe1a0ef4e
        .long   0xe1a02f49
        .long   0xeaffff4a
LGDT_bd.1.6:
        .long   0xe2444002
        .long   0xe1a0e242
        .long   0xe1a0943a
        .long   0xe1a0b342
        .long   0xe3190002
        .long   0xe20b2003
        .long   0xe20ee003
        .long   0x12622000
        .long   0xe3190001
        .long   0x126ee000
        .long   0xeaffff3f
LGDT_bd.2.3:
        .long   0xe1a0044e
        .long   0xe200100f
        .long   0xe1a0e24e
        .long   0xe351000f
        .long   0xe20e000f
        .long   0x0a000006
LGDT62:
        .long   0xe2444002
        .long   0xe1a0243a
        .long   0xe3120002
        .long   0x12611000
        .long   0xe3120001
        .long   0x12600000
        .long   0xeaffffb0
LGDT63:
        .long   0xe3560000
        .long   0x0afffff6
        .long   0xe59f2744
        .long   0xe0444006
        .long   0xe244e001
        .long   0xe7922106
        .long   0xe1a0be3a
        .long   0xe31b0001
        .long   0xe002443a
        .long   0xe0811004
        .long   0x12611000
        .long   0xe15e0006
        .long   0xca000006
        .long   0xe5d8b000
        .long   0xe5d84001
        .long   0xe28ee010
        .long   0xe1a0b40b
        .long   0xe18ba80a
        .long   0xe18aa004
        .long   0xe2888002
LGDT64:
        .long   0xe04eb006
        .long   0xe24b4001
        .long   0xe1a0e43a
        .long   0xe002bb3a
        .long   0xe31e0001
        .long   0xe080000b
        .long   0x12600000
        .long   0xeaffff94
LGDT_bd.2.1:
        .long   0xe1a0ea0e
        .long   0xe3a00000
        .long   0xe1a01e4e
        .long   0xeaffff90
LGDT_bd.2.5:
        .long   0xe2444001
        .long   0xe1a0143a
        .long   0xe3110001
        .long   0x03a01001
        .long   0x03a00000
        .long   0x11a01000
        .long   0x13a00000
        .long   0xeaffff88
LGDT_bd.2.6:
        .long   0xe2444001
        .long   0xe1a0143a
        .long   0xe3110001
        .long   0x03a01000
        .long   0x03a00001
        .long   0x13a01000
        .long   0xeaffff81
LGDT_bd.2.7:
        .long   0xe2444001
        .long   0xe1a0043a
        .long   0xe1a0ea0e
        .long   0xe3100001
        .long   0xe1a01e4e
        .long   0x03a00001
        .long   0x13e00000
        .long   0xeaffff79
LGDT65:
        cmp     r6, #0
        beq     LGDT56
        cmp     r4, r6
        bgt     LGDT66
        ldrb    lr, [r8]
        ldrb    r2, [r8, #1]
        add     r4, r4, #0x10
        mov     lr, lr, lsl #8
        orr     r10, lr, r10, lsl #16
        add     r8, r8, #2
        orr     r10, r10, r2
LGDT66:
        ldr     r2, [pc, #0x644]
        sub     r4, r4, r6
        ldr     r2, [r2, +r6, lsl #2]
        and     r2, r2, r10, lsr r4
        add     r0, r0, r2
        b       LGDT55
LGDT67:
        cmp     r6, #0
        beq     LGDT53
        sub     r2, r4, #1
        cmp     r6, r2
        blt     LGDT68
        ldrb    lr, [r8]
        ldrb    r2, [r8, #1]
        add     r4, r4, #0x10
        mov     lr, lr, lsl #8
        orr     r10, lr, r10, lsl #16
        add     r8, r8, #2
        orr     r10, r10, r2
LGDT68:
        ldr     r2, [pc, #0x5FC]
        sub     r4, r4, r6
        ldr     r2, [r2, +r6, lsl #2]
        and     r2, r2, r10, lsr r4
        add     r1, r1, r2
        b       LGDT52
LGDT_bt.2:
        .long  0x078204AB
        .long  0x00BEB7AF
LGDT_bt.1:
        .long  0x0003DBE1
        .long  0x00CDE6D5
//LGDT_bt.2:
//        streq   r0, [r2, +r11, lsr #9]
//        adceqs  r11, lr, pc, lsr #15
//LGDT_bt.1:
//        andeq   sp, r3, r1, ror #23
//        ldreqd  lr, [sp], #0x65
LGDT__sHuffmanGetQuads_MP3:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r4, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        mov     r6, #0xA
        add     lr, r6, #0x8D, 30
        cmp     lr, r4
        ble     LGDT90
        cmp     r12, #0
        ble     LGDT90
        ldr     lr, [r1]
        ldr     r8, [r0]
        cmp     lr, #0
        mov     r5, r8
        moveq   r7, #0
        moveq   lr, r7
        beq     LGDT69
        ldr     r7, [pc, #0x590]
        rsb     lr, lr, #8
        ldrb    r5, [r8]
        ldr     r7, [r7, +lr, lsl #2]
        and     r7, r5, r7
        add     r5, r8, #1
LGDT69:
        cmp     r2, #0
        add     r2, r6, #0x8D, 30
        bne     LGDT82
        cmp     r2, r4
        ble     LGDT89
        ldr     r8, [pc, #0x57C]
        add     r11, r3, #8
        add     r2, r6, #0x8D, 30
        add     r10, r3, #4
        add     r9, r3, #0xC
        str     r11, [sp]
        str     r5, [sp, #0x10]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
LGDT70:
        cmp     lr, #9
        bgt     LGDT71
        ldr     r6, [sp, #0x10]
        add     lr, lr, #0x10
        ldrb    r5, [r6]
        ldrb    r1, [r6, #1]
        add     r6, r6, #2
        str     r6, [sp, #0x10]
        mov     r5, r5, lsl #8
        orr     r7, r5, r7, lsl #16
        orr     r7, r7, r1
LGDT71:
        sub     r1, lr, #6
        mov     r1, r7, lsr r1
        and     r5, r1, #0x3F
        cmp     r5, #0x20
        bcc     LGDT72
        mov     r1, #0
        mov     r0, r1
        mov     r6, r0
        sub     lr, lr, #1
        mov     r5, r6
        mov     r11, #1
        b       LGDT81
LGDT72:
        cmp     r5, #0x10
        bcc     LGDT73
        ldrb    r0, [r5, +r8]
        sub     lr, lr, #5
        mov     r11, #5
        mov     r1, r0, lsl #24
        mov     r5, r0, lsl #26
        mov     r6, r0, lsl #28
        mov     r0, r0, lsl #30
        mov     r1, r1, asr #30
        mov     r5, r5, asr #30
        mov     r6, r6, asr #30
        mov     r0, r0, asr #30
        b       LGDT81
LGDT73:
        ldrb    r1, [r5, +r8]
        cmp     r5, #6
        bcc     LGDT74
        sub     lr, lr, #7
        mov     r5, r7, lsr lr
        add     r1, r8, r1
        and     r5, r5, #1
        ldrb    r0, [r1, +r5]
        mov     r11, #7
        mov     r1, r0, lsl #24
        mov     r5, r0, lsl #26
        mov     r6, r0, lsl #28
        mov     r0, r0, lsl #30
        mov     r1, r1, asr #30
        mov     r5, r5, asr #30
        mov     r6, r6, asr #30
        mov     r0, r0, asr #30
        b       LGDT81
LGDT74:
        and     r5, r1, #7
        subs    r6, r5, #3
        beq     LGDT77
        ldr     r11, [sp]
        ldr     r5, [sp, #0x10]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #0xC]
        adds    r6, r6, #1
        beq     LGDT75
        str     r11, [sp]
        sub     lr, lr, #0xA
        mov     r11, r7, lsr lr
        tst     r11, #8
        str     r5, [sp, #0x10]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
        moveq   r1, #1
        mvnne   r1, #0
        tst     r11, #4
        moveq   r5, #1
        mvnne   r5, #0
        tst     r11, #2
        moveq   r6, #1
        mvnne   r6, #0
        tst     r11, #1
        moveq   r0, #1
        moveq   r11, #0xA
        movne   r11, #0xA
        mvnne   r0, #0
        b       LGDT81
LGDT75:
        str     r1, [sp, #8]
        sub     lr, lr, #8
        mov     r1, r7, lsr lr
        tst     r1, #2
        str     r11, [sp]
        str     r5, [sp, #0x10]
        str     r0, [sp, #0xC]
        moveq   r5, #1
        mvnne   r5, #0
        tst     r1, #1
        beq     LGDT76
        mov     r1, #0
        mov     r6, r1
        mov     r11, #8
        mvn     r0, #0
        b       LGDT81
LGDT76:
        mov     r1, #0
        mov     r6, r1
        mov     r0, #1
        mov     r11, #8
        b       LGDT81
LGDT77:
        mov     r11, r1, asr #3
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x14]
        mov     r5, r1, asr #5
        mov     r6, r1, asr #4
        movs    r1, r1, asr #6
        sub     lr, lr, #9
        and     r5, r5, #1
        and     r6, r6, #1
        and     r0, r11, #1
        beq     LGDT80
        mov     r11, r7, lsr lr
        tst     r11, #4
        str     r11, [sp, #0x14]
        mvnne   r1, #0
        ldr     r11, [sp, #0x14]
        cmp     r5, #0
        and     r11, r11, #2
        str     r11, [sp, #4]
        beq     LGDT79
        ldr     r11, [sp, #4]
        cmp     r11, #0
        mvnne   r5, #0
        ldr     r11, [sp, #0x14]
        cmp     r6, #0
        and     r11, r11, #1
        beq     LGDT78
        cmp     r11, #0
        moveq   r11, #9
        movne   r11, #9
        mvnne   r6, #0
        b       LGDT81
LGDT78:
        cmp     r11, #0
        moveq   r11, #9
        movne   r11, #9
        mvnne   r0, #0
        b       LGDT81
LGDT79:
        ldr     r11, [sp, #4]
        cmp     r11, #0
        mvnne   r6, #0
        ldr     r11, [sp, #0x14]
        tst     r11, #1
        moveq   r11, #9
        movne   r11, #9
        mvnne   r0, #0
        b       LGDT81
LGDT80:
        mov     r11, r7, lsr lr
        tst     r11, #4
        mvnne   r5, #0
        tst     r11, #2
        mvnne   r6, #0
        tst     r11, #1
        moveq   r11, #9
        movne   r11, #9
        mvnne   r0, #0
LGDT81:
        str     r1, [r3, +r4, lsl #2]
        str     r5, [r10, +r4, lsl #2]
        ldr     r1, [sp]
        sub     r12, r12, r11
        str     r6, [r1, +r4, lsl #2]
        str     r0, [r9, +r4, lsl #2]
        add     r4, r4, #4
        cmp     r2, r4
        ble     LGDT102
        cmp     r12, #0
        bgt     LGDT70
        ldr     r0, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r1, [sp, #8]
        ldr     r8, [r0]
        b       LGDT89
LGDT82:
        cmp     r2, r4
        ble     LGDT89
        add     r9, r3, #8
        add     r8, r3, #0xC
        add     r6, r6, #0x8D, 30
        add     r2, r3, #4
        str     r8, [sp, #4]
        str     r9, [sp]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
LGDT83:
        cmp     lr, #7
        bgt     LGDT84
        ldrb    r9, [r5]
        ldrb    r8, [r5, #1]
        ldrb    r1, [r5, #2]
        mov     r9, r9, lsl #16
        orr     r7, r9, r7, lsl #24
        orr     r8, r7, r8, lsl #8
        add     lr, lr, #0x18
        orr     r7, r8, r1
        add     r5, r5, #3
LGDT84:
        sub     lr, lr, #4
        mov     r1, r7, lsr lr
        and     r8, r1, #0xF
        eor     r10, r8, #1
        mov     r9, r8, lsr #2
        mov     r1, r8, lsr #1
        mov     r8, r8, lsr #3
        eor     r9, r9, #1
        eor     r1, r1, #1
        eors    r8, r8, #1
        and     r9, r9, #1
        and     r1, r1, #1
        and     r10, r10, #1
        moveq   r11, #4
        beq     LGDT85
        sub     lr, lr, #1
        mov     r11, r7, lsr lr
        tst     r11, #1
        rsbne   r8, r8, #0
        mov     r11, #5
LGDT85:
        cmp     r9, #0
        beq     LGDT86
        sub     lr, lr, #1
        mov     r0, r7, lsr lr
        tst     r0, #1
        add     r11, r11, #1
        rsbne   r9, r9, #0
LGDT86:
        cmp     r1, #0
        beq     LGDT87
        sub     lr, lr, #1
        mov     r0, r7, lsr lr
        tst     r0, #1
        add     r11, r11, #1
        rsbne   r1, r1, #0
LGDT87:
        cmp     r10, #0
        beq     LGDT88
        sub     lr, lr, #1
        mov     r0, r7, lsr lr
        tst     r0, #1
        add     r11, r11, #1
        rsbne   r10, r10, #0
LGDT88:
        str     r8, [r3, +r4, lsl #2]
        str     r9, [r2, +r4, lsl #2]
        ldr     r8, [sp]
        sub     r12, r12, r11
        str     r1, [r8, +r4, lsl #2]
        ldr     r1, [sp, #4]
        str     r10, [r1, +r4, lsl #2]
        add     r4, r4, #4
        cmp     r6, r4
        ble     LGDT103
        cmp     r12, #0
        bgt     LGDT83
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r8, [r0]
LGDT89:
        sub     r5, r5, r8
        rsb     lr, lr, r5, lsl #3
        str     lr, [r1]
        ldr     r2, [r0]
        add     lr, r2, lr, asr #3
        str     lr, [r0]
        ldr     r2, [r1]
        and     r2, r2, #7
        str     r2, [r1]
LGDT90:
        cmp     r12, #0
        beq     LGDT95
        ldr     r2, [r1]
        add     r2, r12, r2
        cmp     r2, #7
        strle   r2, [r1]
        ble     LGDT92
LGDT91:
        sub     r2, r2, #8
        str     r2, [r1]
        ldr     r2, [r0]
        add     r2, r2, #1
        str     r2, [r0]
        ldr     r2, [r1]
        cmp     r2, #7
        bgt     LGDT91
LGDT92:
        cmp     r2, #0
        bge     LGDT94
LGDT93:
        add     r2, r2, #8
        str     r2, [r1]
        ldr     r2, [r0]
        sub     r2, r2, #1
        str     r2, [r0]
        ldr     r2, [r1]
        cmp     r2, #0
        blt     LGDT93
LGDT94:
        cmp     r12, #0
        sublt   r4, r4, #4
LGDT95:
        cmp     r4, #9, 26
        bge     LGDT98
        rsb     r1, r4, #9, 26
        cmp     r1, #0
        ble     LGDT97
        add     r2, r3, r4, lsl #2
        sub     r2, r2, #4
        mov     lr, #0
        mov     r12, #0
LGDT96:
        add     r12, r12, #2
        str     lr, [r2, #4]
        str     lr, [r2, #8]!
        cmp     r12, r1
        blt     LGDT96
LGDT97:
        cmp     r4, #1
        ble     LGDT100
LGDT98:
        sub     r1, r3, #4
        add     r1, r1, r4, lsl #2
LGDT99:
        ldr     r2, [r1], #-4
        cmp     r2, #0
        bne     LGDT105
        sub     r4, r4, #1
        cmp     r4, #1
        bgt     LGDT99
LGDT100:
        cmp     r4, #1
        beq     LGDT104
LGDT101:
        mov     r0, r4
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LGDT102:
        ldr     r0, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r1, [sp, #8]
        ldr     r8, [r0]
        b       LGDT89
LGDT103:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r8, [r0]
        b       LGDT89
LGDT104:
        ldr     r3, [r3]
        cmp     r3, #0
        bne     LGDT101
        sub     r4, r4, #1
        mov     r0, r4
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LGDT105:
        mov     r0, r4
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LGDT__pBitsMasks
        .long   _pHuffmanSmallTables
        .long   LGDT_bt.1
        .long   _pHfLinbits
        .long   _pHuffmanBigTables
        .long   LGDT_bt.2
        .long   _pHfQTable0


        .data
        .align  4


LGDT__pBitsMasks:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x7F,0x00,0x00,0x00
        .byte   0xFF,0x00,0x00,0x00,0xFF,0x01,0x00,0x00,0xFF,0x03,0x00,0x00,0xFF,0x07,0x00,0x00
        .byte   0xFF,0x0F,0x00,0x00,0xFF,0x1F,0x00,0x00,0xFF,0x3F,0x00,0x00,0xFF,0x7F,0x00,0x00


