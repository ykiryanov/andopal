        .text
        .align  4
        .globl  _ippsVLCDecodeUTupleEscBlock_AAC_1u16s


_ippsVLCDecodeUTupleEscBlock_AAC_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     lr, [sp, #0x60]
        cmp     r0, #0
        beq     LGAB59
        cmp     r1, #0
        beq     LGAB59
        cmp     r2, #0
        beq     LGAB59
        cmp     lr, #0
        beq     LGAB59
        ldr     r12, [r1]
        cmp     r12, #0
        blt     LGAB0
        cmp     r12, #7
        ble     LGAB1
LGAB0:
        mvn     r0, #0xC0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB1:
        and     r4, lr, #0x1F
        rsb     r4, r4, #0
        and     r6, r4, #0x1F
        ldr     r4, [r6, +lr]
        ldr     r5, [pc, #0xC40]
        add     r6, lr, r6
        cmp     r5, r4
        beq     LGAB2
        mvn     r0, #0x10
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB2:
        ldr     lr, [r6, #0x20]
        ldr     r9, [r0]
        ldr     r4, [r6, #0x1C]
        ldr     r5, [r6, #0xC]
        str     lr, [sp, #0x10]
        ldr     r8, [r6, #8]
        ldr     r7, [r6, #0x14]
        ands    lr, r9, #3
        mov     r11, #1
        add     r8, r8, #2
        str     r8, [sp, #0x24]
        sub     r8, r9, lr
        sub     r10, r9, r8
        add     r7, r7, #1
        mov     r10, r10, lsl #3
        mov     r11, r11, lsl r7
        rsb     r10, r10, #0
        str     r10, [sp, #0x30]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        mov     r10, #1
        mov     r10, r10, lsl r4
        sub     r12, r11, r12
        ldr     r11, [sp, #0x34]
        sub     r10, r10, #1
        str     r10, [sp, #0x34]
        sub     r11, r11, #1
        str     r11, [sp, #0x30]
        add     r12, r12, #0x20
        beq     LGAB51
        rsb     r10, lr, #4
        mov     lr, #0
LGAB3:
        ldrb    r11, [r9], #1
        subs    r10, r10, #1
        orr     lr, r11, lr, lsl #8
        bne     LGAB3
LGAB4:
        ldr     r9, [r8, #4]
        ldr     r6, [r6, #0x10]
        add     r8, r8, #8
        and     r10, r9, #0xFF, 24
        str     r8, [sp, #0x28]
        mov     r8, r9, lsr #8
        mov     r10, r10, lsl #8
        orr     r11, r10, r9, lsl #24
        and     r8, r8, #0xFF, 24
        mvn     r10, #0xFF, 8
        cmp     r6, #0x20
        orr     r8, r11, r8
        bic     r10, r9, r10
        bic     r3, r3, #1
        orr     r6, r8, r10, lsr #24
        beq     LGAB28
        cmp     r3, #0
        ble     LGAB15
        ldr     r8, [sp, #0x10]
        ldr     r10, [pc, #0xB4C]
        str     r3, [sp]
        sub     r8, r8, r4
        add     r9, r8, r7
        sub     r11, r9, r4
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        sub     r4, r10, #0x84
        add     r10, r2, #2
        mov     r8, #0
        add     r7, r5, #2
        str     r10, [sp, #8]
        str     r11, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r2, [sp, #0x18]
        str     r1, [sp, #0x1C]
LGAB5:
        ldrh    r3, [r5]
        cmp     r12, r0
        str     r3, [sp, #0x2C]
        bge     LGAB6
        ldr     r2, [r4, +r12, lsl #2]
        sub     r1, r0, r12
        rsb     r9, r1, #0x20
        and     r2, lr, r2
        mov     r9, r6, lsr r9
        orr     r2, r9, r2, lsl r1
        b       LGAB7
LGAB6:
        ldr     r2, [r4, +r0, lsl #2]
        sub     r1, r12, r0
        and     r2, r2, lr, lsr r1
LGAB7:
        sub     r1, r0, r3
        mov     r1, r2, lsr r1
        mov     r1, r1, lsl #1
        ldrh    r1, [r7, +r1]
        tst     r1, #1
        mov     r10, r1, asr #1
        movne   r9, #0
        bne     LGAB9
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x2C]
        mov     r9, #0
LGAB8:
        mov     r1, r10, lsl #1
        add     r9, r9, r3
        ldrh    r3, [r5, +r1]
        ldr     r1, [r4, +r3, lsl #2]
        add     r12, r3, r12
        sub     r11, r0, r12
        and     r11, r1, r2, lsr r11
        add     r10, r11, r10
        mov     r1, r10, lsl #1
        ldrh    r1, [r7, +r1]
        tst     r1, #1
        mov     r10, r1, asr #1
        beq     LGAB8
        ldr     r12, [sp, #0x14]
LGAB9:
        ldr     r3, [sp, #0x34]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        and     r10, r3, r1, asr r10
        and     r3, r3, r1, asr r11
        ldr     r11, [sp, #0x30]
        mov     r10, r10, lsl #16
        mov     r3, r3, lsl #16
        and     r11, r11, r1
        mov     r1, r10, asr #16
        cmp     r1, #0
        add     r11, r9, r11, asr #1
        mov     r3, r3, asr #16
        beq     LGAB10
        add     r11, r11, #1
        sub     r9, r0, r11
        mov     r9, r2, lsr r9
        tst     r9, #1
        beq     LGAB10
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LGAB10:
        cmp     r3, #0
        beq     LGAB11
        add     r11, r11, #1
        sub     r9, r0, r11
        mov     r9, r2, lsr r9
        tst     r9, #1
        beq     LGAB11
        rsb     r3, r3, #0
        mov     r2, r3, lsl #16
        mov     r3, r2, asr #16
LGAB11:
        sub     r12, r12, r11
        cmp     r12, #0
        bgt     LGAB12
        ldr     r10, [sp, #0x28]
        add     r12, r12, #0x20
        mov     lr, r6
        ldr     r2, [r10], #4
        str     r10, [sp, #0x28]
        mov     r6, r2, lsr #8
        and     r9, r2, #0xFF, 24
        and     r10, r6, #0xFF, 24
        mov     r9, r9, lsl #8
        mvn     r6, #0xFF, 8
        orr     r9, r9, r2, lsl #24
        bic     r6, r2, r6
        orr     r10, r9, r10
        orr     r6, r10, r6, lsr #24
LGAB12:
        cmp     r1, #0x10
        beq     LGAB25
        cmn     r1, #0x10
        beq     LGAB22
        ldr     r9, [sp, #0x18]
        mov     r2, r8, lsl #1
        strh    r1, [r9, +r2]
LGAB13:
        cmp     r3, #0x10
        beq     LGAB19
        cmn     r3, #0x10
        ldrne   r1, [sp, #8]
        strneh  r3, [r1, +r2]
        beq     LGAB16
LGAB14:
        ldr     r1, [sp]
        add     r8, r8, #2
        cmp     r8, r1
        blt     LGAB5
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
LGAB15:
        ldr     r2, [sp, #0x28]
        rsb     r12, r12, #0x20
        sub     r2, r2, #8
        add     r2, r2, r12, asr #3
        str     r2, [r0]
        and     r12, r12, #7
        mov     r0, #0
        str     r12, [r1]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB16:
        cmp     r12, #0x15
        bge     LGAB17
        ldr     r1, [r4, +r12, lsl #2]
        rsb     r9, r12, #0x15
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x2C]
        add     r3, r12, #0xB
        and     r1, lr, r1
        mov     r3, r6, lsr r3
        orr     r1, r3, r1, lsl r9
        b       LGAB18
LGAB17:
        ldr     r1, [pc, #0x90C]
        sub     r3, r12, #0x15
        ldr     r1, [r1, #-0x30]
        and     r1, r1, lr, lsr r3
LGAB18:
        ldr     r3, [pc, #0x8FC]
        ldrb    r9, [r3, +r1, lsr #12]
        cmp     r9, #0xC
        bgt     LGAB57
        mov     r10, #1
        mov     r10, r10, lsl r9
        mov     r3, r9, lsl #1
        str     r10, [sp, #0x2C]
        rsb     r9, r3, #0x18
        sub     r10, r10, #1
        and     r9, r10, r1, lsr r9
        sub     r1, r12, r3
        ldr     r3, [sp, #0x2C]
        add     r12, r1, #3
        cmp     r12, #0
        add     r9, r9, r3
        rsb     r3, r9, #0
        ldr     r9, [sp, #8]
        strh    r3, [r9, +r2]
        bgt     LGAB14
        ldr     r3, [sp, #0x28]
        add     r12, r1, #0x23
        mov     lr, r6
        ldr     r2, [r3], #4
        str     r3, [sp, #0x28]
        and     r6, r2, #0xFF, 24
        mov     r1, r2, lsr #8
        mov     r6, r6, lsl #8
        orr     r3, r6, r2, lsl #24
        and     r6, r1, #0xFF, 24
        mvn     r1, #0xFF, 8
        orr     r6, r3, r6
        bic     r1, r2, r1
        orr     r6, r6, r1, lsr #24
        b       LGAB14
LGAB19:
        cmp     r12, #0x15
        bge     LGAB20
        ldr     r1, [r4, +r12, lsl #2]
        rsb     r9, r12, #0x15
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x2C]
        add     r3, r12, #0xB
        and     r1, lr, r1
        mov     r3, r6, lsr r3
        orr     r9, r3, r1, lsl r9
        b       LGAB21
LGAB20:
        ldr     r1, [pc, #0x844]
        sub     r3, r12, #0x15
        ldr     r1, [r1, #-0x30]
        and     r9, r1, lr, lsr r3
LGAB21:
        ldr     r1, [pc, #0x834]
        ldrb    r3, [r1, +r9, lsr #12]
        cmp     r3, #0xC
        bgt     LGAB53
        mov     r1, r3, lsl #1
        mov     r10, #1
        mov     r3, r10, lsl r3
        rsb     r10, r1, #0x18
        str     r10, [sp, #0x2C]
        sub     r10, r3, #1
        str     r10, [sp, #4]
        sub     r1, r12, r1
        ldr     r12, [sp, #0x2C]
        ldr     r10, [sp, #4]
        and     r9, r10, r9, lsr r12
        add     r3, r9, r3
        ldr     r9, [sp, #8]
        add     r12, r1, #3
        cmp     r12, #0
        strh    r3, [r9, +r2]
        bgt     LGAB14
        ldr     r3, [sp, #0x28]
        add     r12, r1, #0x23
        mov     lr, r6
        ldr     r2, [r3], #4
        str     r3, [sp, #0x28]
        and     r6, r2, #0xFF, 24
        mov     r1, r2, lsr #8
        mov     r6, r6, lsl #8
        orr     r3, r6, r2, lsl #24
        and     r6, r1, #0xFF, 24
        mvn     r1, #0xFF, 8
        orr     r6, r3, r6
        bic     r1, r2, r1
        orr     r6, r6, r1, lsr #24
        b       LGAB14
LGAB22:
        cmp     r12, #0x15
        bge     LGAB23
        ldr     r1, [r4, +r12, lsl #2]
        rsb     r9, r12, #0x15
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x2C]
        add     r2, r12, #0xB
        and     r1, lr, r1
        mov     r2, r6, lsr r2
        orr     r1, r2, r1, lsl r9
        b       LGAB24
LGAB23:
        ldr     r1, [pc, #0x778]
        sub     r2, r12, #0x15
        ldr     r1, [r1, #-0x30]
        and     r1, r1, lr, lsr r2
LGAB24:
        ldr     r2, [pc, #0x768]
        ldrb    r9, [r2, +r1, lsr #12]
        cmp     r9, #0xC
        bgt     LGAB54
        mov     r10, #1
        mov     r10, r10, lsl r9
        mov     r2, r9, lsl #1
        str     r10, [sp, #0x2C]
        rsb     r9, r2, #0x18
        sub     r10, r10, #1
        and     r1, r10, r1, lsr r9
        sub     r9, r12, r2
        ldr     r2, [sp, #0x2C]
        ldr     r10, [sp, #0x18]
        add     r12, r9, #3
        add     r1, r1, r2
        mov     r2, r8, lsl #1
        rsb     r1, r1, #0
        cmp     r12, #0
        strh    r1, [r10, +r2]
        bgt     LGAB13
        ldr     r1, [sp, #0x28]
        mov     lr, r6
        ldr     r12, [r1], #4
        str     r1, [sp, #0x28]
        str     r12, [sp, #0x2C]
        ldr     r6, [sp, #0x2C]
        ldr     r1, [sp, #0x2C]
        add     r12, r9, #0x23
        and     r9, r6, #0xFF, 24
        mov     r6, r6, lsr #8
        and     r6, r6, #0xFF, 24
        mov     r9, r9, lsl #8
        orr     r9, r9, r1, lsl #24
        orr     r6, r9, r6
        ldr     r9, [sp, #0x2C]
        mvn     r1, #0xFF, 8
        bic     r1, r9, r1
        orr     r6, r6, r1, lsr #24
        b       LGAB13
LGAB25:
        cmp     r12, #0x15
        bge     LGAB26
        ldr     r1, [r4, +r12, lsl #2]
        rsb     r9, r12, #0x15
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x2C]
        add     r2, r12, #0xB
        and     r1, lr, r1
        mov     r2, r6, lsr r2
        orr     r9, r2, r1, lsl r9
        b       LGAB27
LGAB26:
        ldr     r1, [pc, #0x69C]
        sub     r2, r12, #0x15
        ldr     r1, [r1, #-0x30]
        and     r9, r1, lr, lsr r2
LGAB27:
        ldr     r1, [pc, #0x68C]
        ldrb    r2, [r1, +r9, lsr #12]
        cmp     r2, #0xC
        bgt     LGAB55
        mov     r10, #1
        mov     r10, r10, lsl r2
        mov     r1, r2, lsl #1
        str     r10, [sp, #0x2C]
        sub     r10, r10, #1
        rsb     r2, r1, #0x18
        str     r10, [sp, #4]
        sub     r1, r12, r1
        ldr     r12, [sp, #4]
        ldr     r10, [sp, #0x2C]
        and     r9, r12, r9, lsr r2
        add     r12, r1, #3
        mov     r2, r8, lsl #1
        add     r9, r9, r10
        ldr     r10, [sp, #0x18]
        cmp     r12, #0
        strh    r9, [r10, +r2]
        bgt     LGAB13
        ldr     r9, [sp, #0x28]
        mov     lr, r6
        ldr     r12, [r9], #4
        str     r9, [sp, #0x28]
        str     r12, [sp, #0x2C]
        add     r12, r1, #0x23
        ldr     r1, [sp, #0x2C]
        ldr     r9, [sp, #0x2C]
        and     r6, r1, #0xFF, 24
        mov     r1, r1, lsr #8
        mov     r6, r6, lsl #8
        orr     r6, r6, r9, lsl #24
        and     r9, r1, #0xFF, 24
        orr     r6, r6, r9
        ldr     r9, [sp, #0x2C]
        mvn     r1, #0xFF, 8
        bic     r1, r9, r1
        orr     r6, r6, r1, lsr #24
        b       LGAB13
LGAB28:
        cmp     r3, #0
        ble     LGAB15
        ldr     r8, [sp, #0x10]
        ldr     r9, [pc, #0x5DC]
        add     r11, r2, #2
        sub     r8, r8, r4
        add     r8, r8, r7
        mov     r7, #0
        str     r7, [sp, #0x2C]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x24]
        sub     r10, r8, r4
        sub     r4, r9, #0x84
        add     r7, r5, #4
        mov     r9, #1
        str     r11, [sp, #4]
        str     r10, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     r3, [sp]
        str     r2, [sp, #0x18]
LGAB29:
        ldr     r8, [r5]
        cmp     r12, r1
        str     r8, [sp, #8]
        bge     LGAB30
        ldr     r3, [r4, +r12, lsl #2]
        sub     r2, r1, r12
        rsb     r9, r2, #0x20
        and     r3, lr, r3
        mov     r9, r6, lsr r9
        orr     r3, r9, r3, lsl r2
        b       LGAB31
LGAB30:
        ldr     r2, [r4, +r1, lsl #2]
        sub     r3, r12, r1
        and     r3, r2, lr, lsr r3
LGAB31:
        sub     r2, r1, r8
        mov     r2, r3, lsr r2
        ldr     r2, [r7, +r2, lsl #2]
        tst     r2, #1
        mov     r10, r2, lsr #1
        movne   r9, #0
        bne     LGAB33
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #8]
        mov     r9, #0
LGAB32:
        add     r9, r9, r8
        ldr     r8, [r5, +r10, lsl #2]
        ldr     r11, [r4, +r8, lsl #2]
        add     r12, r8, r12
        sub     r2, r1, r12
        and     r2, r11, r3, lsr r2
        add     r10, r2, r10
        ldr     r2, [r7, +r10, lsl #2]
        tst     r2, #1
        mov     r10, r2, lsr #1
        beq     LGAB32
        ldr     r12, [sp, #0x14]
LGAB33:
        ldr     r8, [sp, #0x34]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        and     r10, r8, r2, lsr r10
        and     r8, r8, r2, lsr r11
        ldr     r11, [sp, #0x30]
        mov     r10, r10, lsl #16
        mov     r8, r8, lsl #16
        and     r11, r2, r11
        mov     r2, r10, asr #16
        cmp     r2, #0
        add     r11, r9, r11, lsr #1
        mov     r8, r8, asr #16
        beq     LGAB34
        add     r11, r11, #1
        sub     r9, r1, r11
        mov     r9, r3, lsr r9
        tst     r9, #1
        beq     LGAB34
        rsb     r2, r2, #0
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LGAB34:
        cmp     r8, #0
        beq     LGAB35
        add     r11, r11, #1
        sub     r9, r1, r11
        mov     r9, r3, lsr r9
        tst     r9, #1
        beq     LGAB35
        rsb     r8, r8, #0
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LGAB35:
        sub     r12, r12, r11
        cmp     r12, #0
        bgt     LGAB36
        ldr     r9, [sp, #0x28]
        add     r12, r12, #0x20
        mov     lr, r6
        ldr     r3, [r9], #4
        str     r9, [sp, #0x28]
        and     r10, r3, #0xFF, 24
        mov     r6, r3, lsr #8
        mov     r10, r10, lsl #8
        orr     r9, r10, r3, lsl #24
        and     r10, r6, #0xFF, 24
        mvn     r6, #0xFF, 8
        bic     r6, r3, r6
        orr     r10, r9, r10
        orr     r6, r10, r6, lsr #24
LGAB36:
        cmp     r2, #0x10
        beq     LGAB42
        cmn     r2, #0x10
        beq     LGAB39
        ldr     r9, [sp, #0x18]
        mov     r3, r0, lsl #1
        strh    r2, [r9, +r3]
LGAB37:
        cmp     r8, #0x10
        beq     LGAB45
        cmn     r8, #0x10
        ldrne   r2, [sp, #4]
        strneh  r8, [r2, +r3]
        beq     LGAB48
LGAB38:
        ldr     r2, [sp]
        add     r0, r0, #2
        cmp     r0, r2
        blt     LGAB29
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        b       LGAB15
LGAB39:
        cmp     r12, #0x15
        bge     LGAB40
        ldr     r9, [r4, +r12, lsl #2]
        rsb     r2, r12, #0x15
        str     r2, [sp, #8]
        and     r2, lr, r9
        ldr     r9, [sp, #8]
        add     r3, r12, #0xB
        mov     r3, r6, lsr r3
        orr     r2, r3, r2, lsl r9
        b       LGAB41
LGAB40:
        ldr     r2, [pc, #0x3C0]
        sub     r3, r12, #0x15
        ldr     r2, [r2, #-0x30]
        and     r2, r2, lr, lsr r3
LGAB41:
        ldr     r3, [pc, #0x3B0]
        ldrb    r9, [r3, +r2, lsr #12]
        cmp     r9, #0xC
        bgt     LGAB52
        mov     r10, #1
        mov     r10, r10, lsl r9
        mov     r3, r9, lsl #1
        str     r10, [sp, #8]
        rsb     r9, r3, #0x18
        sub     r10, r10, #1
        and     r2, r10, r2, lsr r9
        sub     r9, r12, r3
        ldr     r3, [sp, #8]
        ldr     r10, [sp, #0x18]
        add     r12, r9, #3
        add     r2, r2, r3
        mov     r3, r0, lsl #1
        rsb     r2, r2, #0
        cmp     r12, #0
        strh    r2, [r10, +r3]
        bgt     LGAB37
        ldr     r2, [sp, #0x28]
        mov     lr, r6
        ldr     r12, [r2], #4
        str     r2, [sp, #0x28]
        str     r12, [sp, #8]
        ldr     r6, [sp, #8]
        ldr     r2, [sp, #8]
        add     r12, r9, #0x23
        and     r9, r6, #0xFF, 24
        mov     r6, r6, lsr #8
        and     r6, r6, #0xFF, 24
        mov     r9, r9, lsl #8
        orr     r9, r9, r2, lsl #24
        orr     r9, r9, r6
        ldr     r6, [sp, #8]
        mvn     r2, #0xFF, 8
        bic     r2, r6, r2
        orr     r6, r9, r2, lsr #24
        b       LGAB37
LGAB42:
        cmp     r12, #0x15
        bge     LGAB43
        ldr     r9, [r4, +r12, lsl #2]
        rsb     r2, r12, #0x15
        str     r2, [sp, #8]
        and     r2, lr, r9
        ldr     r9, [sp, #8]
        add     r3, r12, #0xB
        mov     r3, r6, lsr r3
        orr     r9, r3, r2, lsl r9
        b       LGAB44
LGAB43:
        ldr     r2, [pc, #0x2E4]
        sub     r3, r12, #0x15
        ldr     r2, [r2, #-0x30]
        and     r9, r2, lr, lsr r3
LGAB44:
        ldr     r2, [pc, #0x2D4]
        ldrb    r3, [r2, +r9, lsr #12]
        cmp     r3, #0xC
        bgt     LGAB60
        mov     r10, #1
        mov     r10, r10, lsl r3
        mov     r2, r3, lsl #1
        str     r10, [sp, #8]
        sub     r10, r10, #1
        rsb     r3, r2, #0x18
        str     r10, [sp, #0x38]
        sub     r2, r12, r2
        ldr     r12, [sp, #0x38]
        ldr     r10, [sp, #8]
        and     r9, r12, r9, lsr r3
        add     r12, r2, #3
        mov     r3, r0, lsl #1
        add     r9, r9, r10
        ldr     r10, [sp, #0x18]
        cmp     r12, #0
        strh    r9, [r10, +r3]
        bgt     LGAB37
        ldr     r9, [sp, #0x28]
        mov     lr, r6
        ldr     r12, [r9], #4
        str     r9, [sp, #0x28]
        str     r12, [sp, #0x38]
        add     r12, r2, #0x23
        ldr     r2, [sp, #0x38]
        ldr     r9, [sp, #0x38]
        and     r6, r2, #0xFF, 24
        mov     r2, r2, lsr #8
        mov     r6, r6, lsl #8
        orr     r6, r6, r9, lsl #24
        and     r9, r2, #0xFF, 24
        orr     r6, r6, r9
        ldr     r9, [sp, #0x38]
        mvn     r2, #0xFF, 8
        bic     r2, r9, r2
        orr     r6, r6, r2, lsr #24
        b       LGAB37
LGAB45:
        cmp     r12, #0x15
        bge     LGAB46
        ldr     r8, [r4, +r12, lsl #2]
        add     r9, r12, #0xB
        mov     r9, r6, lsr r9
        rsb     r2, r12, #0x15
        and     r8, lr, r8
        orr     r9, r9, r8, lsl r2
        b       LGAB47
LGAB46:
        ldr     r2, [pc, #0x20C]
        sub     r8, r12, #0x15
        ldr     r2, [r2, #-0x30]
        and     r9, r2, lr, lsr r8
LGAB47:
        ldr     r2, [pc, #0x1FC]
        ldrb    r8, [r2, +r9, lsr #12]
        cmp     r8, #0xC
        bgt     LGAB56
        mov     r2, r8, lsl #1
        mov     r10, #1
        mov     r8, r10, lsl r8
        rsb     r10, r2, #0x18
        str     r10, [sp, #0x38]
        sub     r10, r8, #1
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x38]
        sub     r2, r12, r2
        ldr     r12, [sp, #8]
        and     r10, r12, r9, lsr r10
        ldr     r9, [sp, #4]
        add     r12, r2, #3
        add     r8, r10, r8
        cmp     r12, #0
        strh    r8, [r9, +r3]
        bgt     LGAB38
        ldr     r8, [sp, #0x28]
        add     r12, r2, #0x23
        mov     lr, r6
        ldr     r3, [r8], #4
        str     r8, [sp, #0x28]
        and     r6, r3, #0xFF, 24
        mov     r2, r3, lsr #8
        and     r8, r2, #0xFF, 24
        mov     r6, r6, lsl #8
        orr     r6, r6, r3, lsl #24
        mvn     r2, #0xFF, 8
        orr     r8, r6, r8
        bic     r2, r3, r2
        orr     r6, r8, r2, lsr #24
        b       LGAB38
LGAB48:
        cmp     r12, #0x15
        bge     LGAB49
        ldr     r9, [r4, +r12, lsl #2]
        rsb     r2, r12, #0x15
        str     r2, [sp, #0x38]
        and     r2, lr, r9
        ldr     r9, [sp, #0x38]
        add     r8, r12, #0xB
        mov     r8, r6, lsr r8
        orr     r2, r8, r2, lsl r9
        b       LGAB50
LGAB49:
        ldr     r2, [pc, #0x140]
        sub     r8, r12, #0x15
        ldr     r2, [r2, #-0x30]
        and     r2, r2, lr, lsr r8
LGAB50:
        ldr     r8, [pc, #0x130]
        ldrb    r9, [r8, +r2, lsr #12]
        cmp     r9, #0xC
        bgt     LGAB58
        mov     r10, #1
        mov     r10, r10, lsl r9
        mov     r8, r9, lsl #1
        str     r10, [sp, #0x38]
        rsb     r9, r8, #0x18
        sub     r10, r10, #1
        and     r9, r10, r2, lsr r9
        sub     r2, r12, r8
        ldr     r12, [sp, #0x38]
        add     r9, r9, r12
        rsb     r8, r9, #0
        ldr     r9, [sp, #4]
        add     r12, r2, #3
        cmp     r12, #0
        strh    r8, [r9, +r3]
        bgt     LGAB38
        ldr     r8, [sp, #0x28]
        add     r12, r2, #0x23
        mov     lr, r6
        ldr     r3, [r8], #4
        str     r8, [sp, #0x28]
        and     r6, r3, #0xFF, 24
        mov     r2, r3, lsr #8
        and     r8, r2, #0xFF, 24
        mov     r6, r6, lsl #8
        orr     r6, r6, r3, lsl #24
        mvn     r2, #0xFF, 8
        orr     r8, r6, r8
        bic     r2, r3, r2
        orr     r6, r8, r2, lsr #24
        b       LGAB38
LGAB51:
        ldr     lr, [r8]
        mvn     r9, #0xFF, 8
        str     r9, [sp, #0x38]
        mov     r10, lr, lsr #8
        and     r9, lr, #0xFF, 24
        and     r10, r10, #0xFF, 24
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x2C]
        mov     r9, r9, lsl #8
        orr     r9, r9, lr, lsl #24
        orr     r9, r9, r10
        ldr     r10, [sp, #0x38]
        bic     r10, lr, r10
        orr     lr, r9, r10, lsr #24
        b       LGAB4
LGAB52:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB53:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB54:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB55:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB56:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB57:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB58:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB59:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LGAB60:
        mvn     r0, #0x7E
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4160
        .long   LGAB_aac_table


        .data
        .align  4


LGAB_table:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x7F,0x00,0x00,0x00
        .byte   0xFF,0x00,0x00,0x00,0xFF,0x01,0x00,0x00,0xFF,0x03,0x00,0x00,0xFF,0x07,0x00,0x00
        .byte   0xFF,0x0F,0x00,0x00,0xFF,0x1F,0x00,0x00,0xFF,0x3F,0x00,0x00,0xFF,0x7F,0x00,0x00
        .byte   0xFF,0xFF,0x00,0x00,0xFF,0xFF,0x01,0x00,0xFF,0xFF,0x03,0x00,0xFF,0xFF,0x07,0x00
        .byte   0xFF,0xFF,0x0F,0x00,0xFF,0xFF,0x1F,0x00,0xFF,0xFF,0x3F,0x00,0xFF,0xFF,0x7F,0x00
        .byte   0xFF,0xFF,0xFF,0x00,0xFF,0xFF,0xFF,0x01,0xFF,0xFF,0xFF,0x03,0xFF,0xFF,0xFF,0x07
        .byte   0xFF,0xFF,0xFF,0x0F,0xFF,0xFF,0xFF,0x1F,0xFF,0xFF,0xFF,0x3F,0xFF,0xFF,0xFF,0x7F
        .byte   0xFF,0xFF,0xFF,0xFF
LGAB_aac_table:
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x09,0x0A,0x0A,0x0A,0x0A,0x0B,0x0B,0x0C,0x0D


