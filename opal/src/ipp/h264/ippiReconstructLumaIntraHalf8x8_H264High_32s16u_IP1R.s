        .text
        .align  4
        .globl  _ippiReconstructLumaIntraHalf8x8_H264High_32s16u_IP1R


_ippiReconstructLumaIntraHalf8x8_H264High_32s16u_IP1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x46, 30
        cmp     r0, #0
        beq     LKVS88
        ldr     r12, [r0]
        cmp     r12, #0
        beq     LKVS88
        ldr     r3, [r0, #4]
        cmp     r3, #0
        beq     LKVS88
        cmp     r1, #0
        beq     LKVS88
        ldr     r12, [r12]
        cmp     r12, #0
        beq     LKVS88
        ldr     lr, [r0, #0x14]
        cmp     lr, #0
        beq     LKVS88
        ldr     r7, [r0, #8]
        cmp     r7, #0
        ble     LKVS87
        ldr     lr, [r0, #0x10]
        cmp     lr, #0
        blt     LKVS0
        ldr     r5, [r0, #0x1C]
        add     r4, r5, r5, lsl #2
        add     r4, r5, r4
        add     r4, r4, #3
        cmp     lr, r4
        ble     LKVS1
LKVS0:
        mvn     r0, #0xA
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LKVS1:
        ldr     r10, [pc, #0xCE8]
        ldr     r11, [pc, #0xCE8]
        ldr     r9, [pc, #0xCE8]
        mov     r4, #1
        and     r8, r2, #1
        and     lr, r2, #4
        add     r5, sp, #0x7C
        mov     r6, #0
        str     r1, [sp, #0x34]
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x40]
        str     r9, [sp, #0x48]
        str     lr, [sp, #0x4C]
        str     r8, [sp, #0x50]
        str     r4, [sp, #0x44]
        str     r12, [sp, #0x2C]
        str     r2, [sp]
LKVS2:
        ldr     lr, [sp, #0x34]
        ldr     r1, [sp, #0x40]
        ldr     r12, [sp, #0x3C]
        ldr     r2, [lr], #4
        ldrb    r4, [r1], #1
        str     r2, [sp, #0x30]
        ldrb    r2, [r12], #1
        cmp     r4, #0
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x3C]
        str     r1, [sp, #0x40]
        beq     LKVS3
        ldr     r1, [sp, #0x4C]
        cmp     r1, #0
        movne   r1, #1
        bne     LKVS4
LKVS3:
        mov     r1, #0
LKVS4:
        cmp     r2, #0
        beq     LKVS5
        ldr     r2, [sp, #0x50]
        cmp     r2, #0
        movne   r12, #1
        bne     LKVS6
LKVS5:
        cmp     r1, #0
        movne   r12, #0
        beq     LKVS7
LKVS6:
        cmp     r6, #0
        bne     LKVS8
        ldr     r2, [sp]
        tst     r2, #0x10
        bne     LKVS8
        b       LKVS9
LKVS7:
        ldr     r2, [sp]
        tst     r2, #0x10
        moveq   r12, #0
        beq     LKVS9
        cmp     r6, #0
        movne   r12, #0
        moveq   r12, #0
        bne     LKVS9
LKVS8:
        mov     lr, #1
        b       LKVS10
LKVS9:
        mov     lr, #0
LKVS10:
        cmp     r1, #0
        beq     LKVS11
        cmp     r6, #1
        bne     LKVS12
        ldr     r2, [sp]
        tst     r2, #0x20
        bne     LKVS12
        b       LKVS13
LKVS11:
        ldr     r2, [sp]
        tst     r2, #0x20
        beq     LKVS13
        cmp     r6, #1
        bne     LKVS13
LKVS12:
        mov     r4, #1
        b       LKVS14
LKVS13:
        mov     r4, #0
LKVS14:
        cmp     r1, #0
        mov     r2, #0
        mov     r5, r2
        mov     r1, #1
        moveq   r5, r1
        cmp     r12, #0
        mov     r8, r2
        moveq   r8, r1
        cmp     lr, #0
        mov     r12, r2
        moveq   r12, r1
        cmp     r4, #0
        orr     r8, r5, r8, lsl #1
        orr     r12, r8, r12, lsl #5
        moveq   r2, r1
        orr     r4, r12, r2, lsl #6
        ands    r10, r4, #1
        str     r3, [sp, #0x38]
        beq     LKVS15
        sub     r1, r3, r7, lsl #1
        ldrh    r1, [r1]
        rsb     r2, r7, #0
        add     r11, sp, #0x7C
        str     r1, [sp, #8]
        mov     r2, r2, lsl #1
        add     r12, r2, #2
        ldrh    r12, [r3, +r12]
        add     lr, r2, #4
        add     r5, r2, #6
        str     r12, [sp, #0xC]
        ldrh    lr, [r3, +lr]
        ldrh    r5, [r3, +r5]
        add     r8, r2, #8
        ldrh    r8, [r3, +r8]
        add     r9, r2, #0xC
        str     r8, [sp, #0x1C]
        strh    r1, [r11, #2]
        ldrh    r9, [r3, +r9]
        add     r1, sp, #0x7C
        strh    r12, [r1, #4]
        add     r1, sp, #0x7C
        strh    lr, [r1, #6]
        add     r1, sp, #0x7C
        strh    r5, [r1, #8]
        ldr     r12, [sp, #0x1C]
        add     r8, r2, #0xA
        ldrh    r8, [r3, +r8]
        add     r1, sp, #0x7C
        strh    r12, [r1, #0xA]
        add     r2, r2, #0xE
        ldrh    r2, [r3, +r2]
        add     r1, sp, #0x7C
        strh    r8, [r1, #0xC]
        add     r1, sp, #0x7C
        strh    r9, [r1, #0xE]
        b       LKVS16
LKVS15:
        ldr     r1, [r0, #0x1C]
        mov     r2, #1
        add     r12, sp, #0x7C
        sub     r1, r1, #1
        mov     r1, r2, lsl r1
        bic     r1, r1, #0xFF, 8
        bic     r2, r1, #0xFF, 16
        str     r2, [sp, #0xC]
        add     r1, sp, #0x7C
        strh    r2, [r1, #0xE]
        add     r1, sp, #0x7C
        strh    r2, [r1, #0xC]
        add     r1, sp, #0x7C
        strh    r2, [r1, #0xA]
        add     r1, sp, #0x7C
        strh    r2, [r1, #8]
        add     r1, sp, #0x7C
        strh    r2, [r1, #6]
        add     r1, sp, #0x7C
        strh    r2, [r1, #4]
        mov     r1, r2
        str     r1, [sp, #8]
        strh    r2, [r12, #2]
LKVS16:
        add     r12, sp, #0x7C
        tst     r4, #0x40
        strh    r2, [r12, #0x10]
        beq     LKVS17
        rsb     r1, r7, #0
        add     r11, sp, #0x7C
        mov     r2, r1, lsl #1
        add     r8, r2, #0x18
        add     r1, r2, #0x10
        ldrh    r8, [r3, +r8]
        ldrh    r1, [r3, +r1]
        add     r12, r2, #0x12
        ldrh    r12, [r3, +r12]
        add     lr, r2, #0x14
        ldrh    lr, [r3, +lr]
        add     r5, r2, #0x16
        ldrh    r5, [r3, +r5]
        str     r8, [sp, #0x1C]
        add     r9, r2, #0x1C
        add     r8, r2, #0x1A
        ldrh    r9, [r3, +r9]
        ldrh    r8, [r3, +r8]
        add     r2, r2, #0x1E
        str     r9, [sp, #4]
        strh    r1, [r11, #0x12]
        ldrh    r2, [r3, +r2]
        add     r1, sp, #0x7C
        strh    r12, [r1, #0x14]
        add     r1, sp, #0x7C
        strh    lr, [r1, #0x16]
        add     r1, sp, #0x7C
        strh    r5, [r1, #0x18]
        ldr     r12, [sp, #0x1C]
        add     r1, sp, #0x7C
        strh    r12, [r1, #0x1A]
        add     r1, sp, #0x7C
        strh    r8, [r1, #0x1C]
        add     r1, sp, #0x7C
        strh    r9, [r1, #0x1E]
        b       LKVS18
LKVS17:
        str     r2, [sp, #4]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x1E]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x1C]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x1A]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x18]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x16]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x14]
        add     r12, sp, #0x7C
        strh    r2, [r12, #0x12]
LKVS18:
        add     r1, sp, #0x7C
        ands    r9, r4, #2
        strh    r2, [r1, #0x20]
        beq     LKVS19
        ldrh    lr, [r3, #-2]
        add     r12, r7, r7, lsl #2
        add     r11, r7, r12
        str     lr, [sp, #0x1C]
        mov     r12, r12, lsl #1
        str     r12, [sp, #0x14]
        add     r8, r7, r7, lsl #1
        mov     r5, r7, lsl #2
        mov     r1, r7, lsl #1
        mov     r8, r8, lsl #1
        str     r8, [sp, #0x18]
        rsb     r12, r7, r7, lsl #3
        str     r12, [sp, #0x10]
        sub     r5, r5, #2
        ldrh    r5, [r3, +r5]
        sub     r1, r1, #2
        ldrh    r1, [r3, +r1]
        str     r5, [sp, #0x58]
        ldr     r5, [sp, #0x18]
        mov     r8, r7, lsl #3
        mov     r11, r11, lsl #1
        sub     r5, r5, #2
        ldrh    r5, [r3, +r5]
        sub     r8, r8, #2
        sub     r11, r11, #2
        str     r5, [sp, #0x5C]
        ldrh    r5, [r3, +r8]
        ldr     r8, [sp, #0x10]
        str     r5, [sp, #0x60]
        ldr     r5, [sp, #0x14]
        mov     r8, r8, lsl #1
        sub     r8, r8, #2
        sub     r5, r5, #2
        ldrh    r5, [r3, +r5]
        str     r5, [sp, #0x14]
        ldrh    r5, [r3, +r11]
        str     r5, [sp, #0x18]
        ldrh    r12, [r3, +r8]
        add     r8, sp, #0x7C
        strh    lr, [r8, #0x22]
        add     lr, sp, #0x7C
        strh    r1, [lr, #0x24]
        ldr     r8, [sp, #0x58]
        add     lr, sp, #0x7C
        strh    r8, [lr, #0x26]
        ldr     r8, [sp, #0x5C]
        add     lr, sp, #0x7C
        strh    r8, [lr, #0x28]
        ldr     r8, [sp, #0x60]
        add     lr, sp, #0x7C
        strh    r8, [lr, #0x2A]
        ldr     r8, [sp, #0x14]
        add     lr, sp, #0x7C
        strh    r8, [lr, #0x2C]
        add     lr, sp, #0x7C
        strh    r5, [lr, #0x2E]
        b       LKVS20
LKVS19:
        ldr     r1, [r0, #0x1C]
        mov     r12, #1
        add     lr, sp, #0x7C
        sub     r1, r1, #1
        mov     r1, r12, lsl r1
        bic     r1, r1, #0xFF, 8
        bic     r12, r1, #0xFF, 16
        mov     r1, r12
        str     r1, [sp, #0x18]
        strh    r12, [lr, #0x2E]
        add     lr, sp, #0x7C
        strh    r12, [lr, #0x2C]
        add     lr, sp, #0x7C
        strh    r12, [lr, #0x2A]
        add     lr, sp, #0x7C
        strh    r12, [lr, #0x28]
        add     lr, sp, #0x7C
        strh    r12, [lr, #0x26]
        add     lr, sp, #0x7C
        strh    r12, [lr, #0x24]
        str     r1, [sp, #0x1C]
        add     lr, sp, #0x7C
        strh    r12, [lr, #0x22]
LKVS20:
        add     lr, sp, #0x7C
        ands    r8, r4, #0x20
        strh    r12, [lr, #0x30]
        beq     LKVS21
        rsb     lr, r7, #0
        mov     lr, lr, lsl #1
        sub     lr, lr, #2
        ldrh    lr, [r3, +lr]
        b       LKVS22
LKVS21:
        ldr     lr, [r0, #0x1C]
        mov     r5, #1
        sub     lr, lr, #1
        mov     lr, r5, lsl lr
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
LKVS22:
        mov     r5, #0
        str     r5, [sp, #0x10]
        mov     r5, #0x19
        str     r5, [sp, #0x14]
        add     r5, sp, #0x7C
        strh    lr, [r5]
        str     r0, [sp, #0x28]
        ldr     r5, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        str     r3, [sp, #0x24]
LKVS23:
        add     r11, sp, #0x7C
        ldrh    r11, [r11, +r0]
        add     r3, sp, #0xB0
        subs    r5, r5, #1
        strh    r11, [r3, +r0]
        add     r0, r0, #2
        bne     LKVS23
        ldr     r3, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        cmp     r10, #0
        beq     LKVS27
        cmp     r8, #0
        beq     LKVS24
        ldr     r5, [sp, #8]
        add     r5, lr, r5, lsl #1
        str     r5, [sp, #0x60]
        ldr     r5, [sp, #0xC]
        ldr     r11, [sp, #0x60]
        add     r5, r5, #2
        add     r5, r11, r5
        b       LKVS25
LKVS24:
        ldr     r5, [sp, #8]
        ldr     r11, [sp, #0xC]
        add     r5, r5, r5, lsl #1
        add     r11, r5, r11
        add     r5, r11, #2
LKVS25:
        add     r11, sp, #0xB0
        mov     r5, r5, asr #2
        strh    r5, [r11, #2]
        mov     r11, #0xE
        str     r11, [sp, #0x14]
        str     r6, [sp, #0x20]
        ldr     r6, [sp, #0x14]
        mov     r5, #4
        str     r7, [sp, #0x54]
        str     r3, [sp, #0x24]
        str     r0, [sp, #0x28]
LKVS26:
        add     r0, sp, #0x7C
        add     r11, r0, r5
        ldrh    r7, [r11, #-2]
        ldrh    r0, [r0, +r5]
        ldrh    r11, [r11, #2]
        add     r3, sp, #0xB0
        subs    r6, r6, #1
        add     r0, r7, r0, lsl #1
        add     r11, r0, r11
        add     r0, r11, #2
        mov     r0, r0, asr #2
        strh    r0, [r3, +r5]
        add     r5, r5, #2
        bne     LKVS26
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x54]
        ldr     r3, [sp, #0x24]
        ldr     r0, [sp, #0x28]
        add     r2, r2, r2, lsl #1
        add     r2, r5, r2
        add     r2, r2, #2
        add     r5, sp, #0xB0
        mov     r2, r2, asr #2
        strh    r2, [r5, #0x20]
LKVS27:
        cmp     r8, #0
        beq     LKVS29
        and     r2, r4, #3
        cmp     r2, #3
        beq     LKVS34
        cmp     r10, #0
        beq     LKVS28
        ldr     r2, [sp, #8]
        add     r5, lr, lr, lsl #1
        add     r2, r5, r2
        add     r2, r2, #2
        add     r5, sp, #0xB0
        mov     r2, r2, asr #2
        strh    r2, [r5]
        b       LKVS29
LKVS28:
        cmp     r9, #0
        beq     LKVS29
        ldr     r2, [sp, #0x1C]
        add     r5, lr, lr, lsl #1
        add     r2, r5, r2
        add     r2, r2, #2
        add     r5, sp, #0xB0
        mov     r2, r2, asr #2
        strh    r2, [r5]
LKVS29:
        cmp     r9, #0
        beq     LKVS33
        cmp     r8, #0
        beq     LKVS30
        ldr     r2, [sp, #0x1C]
        add     r1, r1, #2
        add     lr, lr, r2, lsl #1
        add     r1, lr, r1
        b       LKVS31
LKVS30:
        ldr     r2, [sp, #0x1C]
        add     r2, r2, r2, lsl #1
        add     r1, r2, r1
        add     r1, r1, #2
LKVS31:
        add     lr, sp, #0xB0
        mov     r2, r1, asr #2
        strh    r2, [lr, #0x22]
        mov     r5, #0x24
        mov     lr, #6
LKVS32:
        add     r2, sp, #0x7C
        add     r1, r2, r5
        ldrh    r11, [r1, #-2]
        ldrh    r2, [r2, +r5]
        ldrh    r1, [r1, #2]
        add     r8, sp, #0xB0
        subs    lr, lr, #1
        add     r2, r11, r2, lsl #1
        add     r1, r2, r1
        add     r2, r1, #2
        mov     r2, r2, asr #2
        strh    r2, [r8, +r5]
        add     r5, r5, #2
        bne     LKVS32
        ldr     r1, [sp, #0x18]
        add     r12, r12, r12, lsl #1
        add     r2, sp, #0xB0
        add     r12, r1, r12
        add     r1, r12, #2
        mov     r1, r1, asr #2
        strh    r1, [r2, #0x30]
LKVS33:
        ldr     r2, [sp, #0x30]
        ldr     r1, [pc, #0x600]
        sub     r2, r2, #9
        adds    r2, #9							//!!SB!!			cmn     r2, #9
        ldrcs   r2, [r1, +r2, lsl #2]
        addcs   pc, pc, r2
        mvn     r0, #0xA
LKVS_.Lpc1:
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LKVS34:
        ldr     r5, [sp, #8]
        ldr     r2, [sp, #0x1C]
        add     r5, r5, #2
        add     r2, r2, lr, lsl #1
        add     r5, r2, r5
        mov     r2, r5, asr #2
        add     r5, sp, #0xB0
        strh    r2, [r5]
        b       LKVS29
LKVS_bd.1.1:
        .long   0xe28d10b0
        .long   0xe1d110b2
        .long   0xe28dc0b0
        .long   0xe1dcc0b6
        .long   0xe28de0b0
        .long   0xe1dee0b8
        .long   0xe0675207
        .long   0xe0455007
        .long   0xe18310b5
        .long   0xe5908008
        .long   0xe28d50b0
        .long   0xe1d550ba
        .long   0xe28d70b0
        .long   0xe1d770bc
        .long   0xe28d20b0
        .long   0xe1d220b4
        .long   0xe0689108
        .long   0xe28d80b0
        .long   0xe1d881b0
        .long   0xe1a09109
        .long   0xe18310b9
        .long   0xe590a008
        .long   0xe28d40b0
        .long   0xe1d440be
        .long   0xe08a918a
        .long   0xe08a9009
        .long   0xe18310b9
        .long   0xe5909008
        .long   0xe1a09189
        .long   0xe18310b9
        .long   0xe590a008
        .long   0xe08a910a
        .long   0xe08a9009
        .long   0xe18310b9
        .long   0xe5909008
        .long   0xe1a09109
        .long   0xe18310b9
        .long   0xe5909008
        .long   0xe1a09089
        .long   0xe18310b9
        .long   0xe1c310b0
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5909008
        .long   0xe0891109
        .long   0xe0891001
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe1c320b2
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183c0b1
        .long   0xe1c3c0b4
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe1c3e0b6
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18350b1
        .long   0xe1c350b8
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18370b1
        .long   0xe1c370ba
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe1c340bc
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18380b1
        .long   0xe1c380be
LKVS35:
        .long   0xe590200c
        .long   0xe59d1044
        .long   0xe1120001
        .long   0x05907008
        .long   0x0a00003e
        .long   0xe5901018
        .long   0xe3510000
        .long   0x05902010
        .long   0x0a000002
        .long   0xe5902010
        .long   0xe3520000
        .long   0xda000054
LKVS36:
        .long   0xe59f1134
        .long   0xe0cc1192
        .long   0xe04c1fc2
        .long   0xe3510006
        .long   0xba000017
        .long   0xe59de02c
        .long   0xe3a04000
        .long   0xe2412006
        .long   0xe1a01004
LKVS37:
        .long   0xe3a08000
        .long   0xe1a0c084
LKVS38:
        .long   0xe5907014
        .long   0xe79e5104
        .long   0xe1811008
        .long   0xe19770fc
        .long   0xe28cc002
        .long   0xe0070795
        .long   0xe1a05217
        .long   0xe78e5104
        .long   0xe2844001
        .long   0xe3540040
        .long   0xaa000039
        .long   0xe3540000
        .long   0xdafffff0
        .long   0xe79e5104
        .long   0xe3550000
        .long   0x13a08001
        .long   0x1affffee
        .long   0xeaffffeb
LKVS39:
        .long   0xe2612005
        .long   0xe3a0c001
        .long   0xe59d502c
        .long   0xe1a0c21c
        .long   0xe3a0e000
        .long   0xe2612006
        .long   0xe1a0100e
LKVS40:
        .long   0xe3a08000
        .long   0xe1a0408e
LKVS41:
        .long   0xe5909014
        .long   0xe795710e
        .long   0xe1811008
        .long   0xe19990f4
        .long   0xe2844002
        .long   0xe029c997
        .long   0xe1a07259
        .long   0xe785710e
        .long   0xe28ee001
        .long   0xe35e0040
        .long   0xaa0002b0
        .long   0xe35e0000
        .long   0xdafffff0
        .long   0xe795710e
        .long   0xe3570000
        .long   0x13a08001
        .long   0x1affffee
        .long   0xeaffffeb
LKVS42:
        .long   0xe59dc048
        .long   0xe2866001
        .long   0xe3560002
        .long   0xe1dc10d1
        .long   0xe1fc20d2
        .long   0xe58dc048
        .long   0xe59dc044
        .long   0xe0211297
        .long   0xe1a0c08c
        .long   0xe58dc044
        .long   0xe0833081
        .long   0x3afffcdb
        .long   0xe5901000
        .long   0xe59dc02c
        .long   0xe3a00000
        .long   0xe581c000
        .long   0xe28ddf46
        .long   0xe8bd8ff0
        .long   0xea000004
        .long   top_edge_tab4
        .long   left_edge_tab4
        .long   xyoff8
        .long   LKVS_bt.1
        .long   0x2aaaaaab
LKVS43:
        .long   0xe58de02c
LKVS44:
        .long   0xe3510000
        .long   0x05901018
        .long   0x15901018
        .long   0x1a000004
LKVS45:
        .long   0xe3510000
        .long   0x0a0001c3
        .long   0xe5902010
        .long   0xe3520000
        .long   0x1a0001c0
LKVS46:
        .long   0xe59da02c
        .long   0xe3510000
        .long   0xe28d10f8
        .long   0xe28a7020
        .long   0xe5817004
        .long   0xe28d10f8
        .long   0xe28a5040
        .long   0xe5815008
        .long   0xe28d10f8
        .long   0xe28a4060
        .long   0xe581400c
        .long   0xe28d10f8
        .long   0xe28ae080
        .long   0xe581e010
        .long   0xe28d10f8
        .long   0xe28ac0a0
        .long   0xe581c014
        .long   0xe28d10f8
        .long   0xe28a20c0
        .long   0xe5812018
        .long   0xe28d90f8
        .long   0xe28a80e0
        .long   0xe28d10f8
        .long   0xe589a000
        .long   0xe581801c
        .long   0x0a000002
        .long   0xe5901010
        .long   0xe3510000
        .long   0xda0000d8
LKVS47:
        .long   0xe3a01000
        .long   0xe58d8004
        .long   0xe58d2008
        .long   0xe58dc00c
        .long   0xe58de010
        .long   0xe58d4014
        .long   0xe58d5018
        .long   0xe58d701c
        .long   0xe58d6020
        .long   0xe58d3024
        .long   0xe58d0028
LKVS48:
        .long   0xe28d00f8
        .long   0xe7900101
        .long   0xe2811001
        .long   0xe3510008
        .long   0xe590e01c
        .long   0xe590700c
        .long   0xe5908014
        .long   0xe5905004
        .long   0xe5903000
        .long   0xe590a010
        .long   0xe5904008
        .long   0xe5909018
        .long   0xe1a020ce
        .long   0xe0486007
        .long   0xe58d6060
        .long   0xe59db060
        .long   0xe1a0c0c7
        .long   0xe2622000
        .long   0xe085600e
        .long   0xe26cc000
        .long   0xe042200e
        .long   0xe04ee005
        .long   0xe04cc007
        .long   0xe58de05c
        .long   0xe0877008
        .long   0xe088e0c8
        .long   0xe08580c5
        .long   0xe083500a
        .long   0xe043300a
        .long   0xe59da05c
        .long   0xe086c00c
        .long   0xe06960c4
        .long   0xe0877008
        .long   0xe08440c9
        .long   0xe08b2002
        .long   0xe08ae00e
        .long   0xe085a004
        .long   0xe083b006
        .long   0xe0828147
        .long   0xe08c914e
        .long   0xe0433006
        .long   0xe0455004
        .long   0xe06ec14c
        .long   0xe0477142
        .long   0xe08a6007
        .long   0xe08b200c
        .long   0xe089e003
        .long   0xe0884005
        .long   0xe0455008
        .long   0xe0433009
        .long   0xe04bb00c
        .long   0xe04aa007
        .long   0xe5806000
        .long   0xe5802004
        .long   0xe580e008
        .long   0xe580400c
        .long   0xe5805010
        .long   0xe5803014
        .long   0xe580b018
        .long   0xe580a01c
        .long   0xbaffffc2
        .long   0xe59d8004
        .long   0xe59d6020
        .long   0xe59d3024
        .long   0xe59d0028
        .long   0xe59d2008
        .long   0xe59dc00c
        .long   0xe59de010
        .long   0xe59d4014
        .long   0xe59d5018
        .long   0xe59d701c
        .long   0xe3a01000
        .long   0xe58d8004
        .long   0xe58d6020
        .long   0xe58d3024
        .long   0xe58d0028
LKVS49:
        .long   0xe59d0004
        .long   0xe5978000
        .long   0xe5946000
        .long   0xe5903000
        .long   0xe59d002c
        .long   0xe59c9000
        .long   0xe7900101
        .long   0xe1a0a0c3
        .long   0xe26aa000
        .long   0xe58d0060
        .long   0xe59e0000
        .long   0xe04aa003
        .long   0xe049b006
        .long   0xe58d005c
        .long   0xe5950000
        .long   0xe58d0058
        .long   0xe5920000
        .long   0xe58db054
        .long   0xe59db05c
        .long   0xe58da038
        .long   0xe1a0a0c6
        .long   0xe58da030
        .long   0xe086a009
        .long   0xe58da064
        .long   0xe088a0c8
        .long   0xe58da068
        .long   0xe59da060
        .long   0xe08ab00b
        .long   0xe59da054
        .long   0xe58db06c
        .long   0xe59db038
        .long   0xe08ab00b
        .long   0xe59da030
        .long   0xe58db054
        .long   0xe59db068
        .long   0xe26aa000
        .long   0xe58da038
        .long   0xe59da058
        .long   0xe08aa0c0
        .long   0xe58da030
        .long   0xe59da064
        .long   0xe08ab00b
        .long   0xe58db068
        .long   0xe088a003
        .long   0xe58da064
        .long   0xe59da038
        .long   0xe0433008
        .long   0xe58d3070
        .long   0xe59d306c
        .long   0xe59d8030
        .long   0xe04aa006
        .long   0xe58da038
        .long   0xe08960c9
        .long   0xe0838008
        .long   0xe59d9038
        .long   0xe59d3054
        .long   0xe58d8074
        .long   0xe59d8068
        .long   0xe0488143
        .long   0xe59d305c
        .long   0xe58d8078
        .long   0xe59d8060
        .long   0xe0483003
        .long   0xe59d8064
        .long   0xe0889009
        .long   0xe59d8058
        .long   0xe060a0c8
        .long   0xe59d0070
        .long   0xe080b006
        .long   0xe59d6078
        .long   0xe59d0074
        .long   0xe06b8149
        .long   0xe089914b
        .long   0xe0800006
        .long   0xe083600a
        .long   0xe2800020
        .long   0xe043300a
        .long   0xe59da02c
        .long   0xe1a00340
        .long   0xe78a0101
        .long   0xe0860008
        .long   0xe2800020
        .long   0xe58d0070
        .long   0xe59da068
        .long   0xe59d0054
        .long   0xe0466008
        .long   0xe2811001
        .long   0xe3510008
        .long   0xe080b14a
        .long   0xe59da06c
        .long   0xe59d0030
        .long   0xe04aa000
        .long   0xe59d0070
        .long   0xe1a00340
        .long   0xe4870004
        .long   0xe0890003
        .long   0xe2800020
        .long   0xe58d0070
        .long   0xe08b000a
        .long   0xe58d006c
        .long   0xe59d0070
        .long   0xe04aa00b
        .long   0xe28aa020
        .long   0xe1a00340
        .long   0xe4850004
        .long   0xe59d006c
        .long   0xe0433009
        .long   0xe1a0a34a
        .long   0xe2800020
        .long   0xe2833020
        .long   0xe1a00340
        .long   0xe4840004
        .long   0xe48ea004
        .long   0xe1a03343
        .long   0xe48c3004
        .long   0xe2860020
        .long   0xe59d3078
        .long   0xe59d6074
        .long   0xe1a00340
        .long   0xe4820004
        .long   0xe0463003
        .long   0xe2833020
        .long   0xe1a00343
        .long   0xe59d3004
        .long   0xe4830004
        .long   0xe58d3004
        .long   0xbaffff80
        .long   0xe59d6020
        .long   0xe59d3024
        .long   0xe59d0028
LKVS50:
        .long   0xe1a02003
        .long   0xe3a01000
        .long   0xe3a0c001
LKVS51:
        .long   0xe590401c
        .long   0xe28de0f8
        .long   0xe79ee101
        .long   0xe1d270b0
        .long   0xe1a0441c
        .long   0xe59e8000
        .long   0xe2645001
        .long   0xe2444001
        .long   0xe1580005
        .long   0xc1a05008
        .long   0xe1540005
        .long   0xe1a08005
        .long   0xb1a08004
        .long   0xe0878008
        .long   0xe1540008
        .long   0xba000008
        .long   0xe1540005
        .long   0xe1a08005
        .long   0xb1a08004
        .long   0xe0978008
        .long   0x43a04000
        .long   0x4a000002
        .long   0xe1540005
        .long   0xb1a05004
        .long   0xe0854007
LKVS52:
        .long   0xe1c240b0
        .long   0xe590501c
        .long   0xe59e7004
        .long   0xe1d240b2
        .long   0xe1a0851c
        .long   0xe2685001
        .long   0xe1570005
        .long   0xc1a05007
        .long   0xe2487001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS53:
        .long   0xe1c270b2
        .long   0xe590501c
        .long   0xe59e7008
        .long   0xe1d240b4
        .long   0xe1a0851c
        .long   0xe2685001
        .long   0xe1570005
        .long   0xc1a05007
        .long   0xe2487001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS54:
        .long   0xe1c270b4
        .long   0xe590501c
        .long   0xe59e700c
        .long   0xe1d240b6
        .long   0xe1a0851c
        .long   0xe2685001
        .long   0xe1570005
        .long   0xc1a05007
        .long   0xe2487001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS55:
        .long   0xe1c270b6
        .long   0xe590501c
        .long   0xe59e7010
        .long   0xe1d240b8
        .long   0xe1a0851c
        .long   0xe2685001
        .long   0xe1570005
        .long   0xc1a05007
        .long   0xe2487001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS56:
        .long   0xe1c270b8
        .long   0xe590501c
        .long   0xe59e7014
        .long   0xe1d240ba
        .long   0xe1a0851c
        .long   0xe2685001
        .long   0xe1570005
        .long   0xc1a05007
        .long   0xe2487001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS57:
        .long   0xe1c270ba
        .long   0xe590501c
        .long   0xe59e7018
        .long   0xe1d240bc
        .long   0xe1a0851c
        .long   0xe2685001
        .long   0xe1570005
        .long   0xc1a05007
        .long   0xe2487001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS58:
        .long   0xe1c270bc
        .long   0xe590701c
        .long   0xe59e501c
        .long   0xe1d240be
        .long   0xe1a0771c
        .long   0xe267e001
        .long   0xe155000e
        .long   0xc1a0e005
        .long   0xe2475001
        .long   0xe155000e
        .long   0xe1a0700e
        .long   0xb1a07005
        .long   0xe0847007
        .long   0xe1550007
        .long   0xba000008
        .long   0xe155000e
        .long   0xe1a0700e
        .long   0xb1a07005
        .long   0xe0947007
        .long   0x43a05000
        .long   0x4a000002
        .long   0xe155000e
        .long   0xb1a0e005
        .long   0xe084500e
LKVS59:
        .long   0xe1c250be
        .long   0xe5907008
        .long   0xe2811001
        .long   0xe3510008
        .long   0xe0822087
        .long   0xbaffff38
        .long   0xea0000c2
LKVS60:
        .long   0xe59d102c
        .long   0xe1a0c003
        .long   0xe3a02008
        .long   0xe5911000
        .long   0xe3a0e001
        .long   0xe2811020
        .long   0xe1a01341
LKVS61:
        .long   0xe590501c
        .long   0xe1dc40b0
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS62:
        .long   0xe1cc70b0
        .long   0xe590501c
        .long   0xe1dc40b2
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS63:
        .long   0xe1cc70b2
        .long   0xe590501c
        .long   0xe1dc40b4
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS64:
        .long   0xe1cc70b4
        .long   0xe590501c
        .long   0xe1dc40b6
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS65:
        .long   0xe1cc70b6
        .long   0xe590501c
        .long   0xe1dc40b8
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS66:
        .long   0xe1cc70b8
        .long   0xe590501c
        .long   0xe1dc40ba
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS67:
        .long   0xe1cc70ba
        .long   0xe590501c
        .long   0xe1dc40bc
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS68:
        .long   0xe1cc70bc
        .long   0xe590501c
        .long   0xe1dc40be
        .long   0xe1a0751e
        .long   0xe2675001
        .long   0xe1510005
        .long   0xc1a05001
        .long   0xe2477001
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0848008
        .long   0xe1570008
        .long   0xba000008
        .long   0xe1570005
        .long   0xe1a08005
        .long   0xb1a08007
        .long   0xe0948008
        .long   0x43a07000
        .long   0x4a000002
        .long   0xe1570005
        .long   0xb1a05007
        .long   0xe0847005
LKVS69:
        .long   0xe1cc70be
        .long   0xe5907008
        .long   0xe2522001
        .long   0xe08cc087
        .long   0x1affff43
LKVS70:
        .long   0xe59d102c
        .long   0xe2811c01
        .long   0xe58d102c
        .long   0xeafffd55
LKVS71:
        .long   0xe58d502c
        .long   0xeafffd6c
LKVS_bd.1.2:
        .long   0xe28d20b0
        .long   0xe1d242b2
        .long   0xe28d10b0
        .long   0xe1d182b4
        .long   0xe1c340be
        .long   0xe1c340bc
        .long   0xe1c340ba
        .long   0xe1c340b8
        .long   0xe1c340b6
        .long   0xe1c340b4
        .long   0xe1c340b2
        .long   0xe1c340b0
        .long   0xe5907008
        .long   0xe28d10b0
        .long   0xe1d112b6
        .long   0xe1a09087
        .long   0xe18380b9
        .long   0xe0897003
        .long   0xe1c780be
        .long   0xe1c780bc
        .long   0xe1c780ba
        .long   0xe1c780b8
        .long   0xe1c780b6
        .long   0xe1c780b4
        .long   0xe1c780b2
        .long   0xe5908008
        .long   0xe28d20b0
        .long   0xe1d222b8
        .long   0xe1a09088
        .long   0xe0898007
        .long   0xe18710b9
        .long   0xe1c810be
        .long   0xe1c810bc
        .long   0xe1c810ba
        .long   0xe1c810b8
        .long   0xe1c810b6
        .long   0xe1c810b4
        .long   0xe1c810b2
        .long   0xe5901008
        .long   0xe28dc0b0
        .long   0xe1dcc2ba
        .long   0xe1a07081
        .long   0xe0871008
        .long   0xe18820b7
        .long   0xe1c120be
        .long   0xe1c120bc
        .long   0xe1c120ba
        .long   0xe1c120b8
        .long   0xe1c120b6
        .long   0xe1c120b4
        .long   0xe1c120b2
        .long   0xe5902008
        .long   0xe28de0b0
        .long   0xe1dee2bc
        .long   0xe1a07082
        .long   0xe0872001
        .long   0xe181c0b7
        .long   0xe1c2c0be
        .long   0xe1c2c0bc
        .long   0xe1c2c0ba
        .long   0xe1c2c0b8
        .long   0xe1c2c0b6
        .long   0xe1c2c0b4
        .long   0xe1c2c0b2
        .long   0xe5901008
        .long   0xe28d40b0
        .long   0xe1d442be
        .long   0xe1a0c081
        .long   0xe08c1002
        .long   0xe182e0bc
        .long   0xe1c1e0be
        .long   0xe1c1e0bc
        .long   0xe1c1e0ba
        .long   0xe1c1e0b8
        .long   0xe1c1e0b6
        .long   0xe1c1e0b4
        .long   0xe1c1e0b2
        .long   0xe5902008
        .long   0xe28d50b0
        .long   0xe1d553b0
        .long   0xe1a0c082
        .long   0xe08c2001
        .long   0xe18140bc
        .long   0xe1c240be
        .long   0xe1c240bc
        .long   0xe1c240ba
        .long   0xe1c240b8
        .long   0xe1c240b6
        .long   0xe1c240b4
        .long   0xe1c240b2
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe081c002
        .long   0xe1cc50be
        .long   0xe1cc50bc
        .long   0xe1cc50ba
        .long   0xe1cc50b8
        .long   0xe1cc50b6
        .long   0xe1cc50b4
        .long   0xe1cc50b2
        .long   0xe18250b1
        .long   0xeafffca9
LKVS_bd.1.3:
        .long   0xe2044003
        .long   0xe3540003
        .long   0x0a000095
        .long   0xe35a0000
        .long   0x0a00001a
        .long   0xe28dc0b0
        .long   0xe1dc40b8
        .long   0xe28dc0b0
        .long   0xe1dce0ba
        .long   0xe28dc0b0
        .long   0xe1dc80bc
        .long   0xe28dc0b0
        .long   0xe1dc70be
        .long   0xe28dc0b0
        .long   0xe1dc50b6
        .long   0xe28d10b0
        .long   0xe28d20b0
        .long   0xe1d110b4
        .long   0xe1d220b2
        .long   0xe28dc0b0
        .long   0xe1dcc1b0
        .long   0xe0821001
        .long   0xe084e00e
        .long   0xe0887007
        .long   0xe0815005
        .long   0xe08e7007
        .long   0xe28cc004
        .long   0xe0855007
        .long   0xe085c00c
        .long   0xe1a011cc
        .long   0xe3c11801
        .long   0xea000022
LKVS72:
        .long   0xe3590000
        .long   0x0a00001a
        .long   0xe28dc0b0
        .long   0xe1dc42b8
        .long   0xe28dc0b0
        .long   0xe1dce2ba
        .long   0xe28dc0b0
        .long   0xe1dc82bc
        .long   0xe28dc0b0
        .long   0xe1dc72be
        .long   0xe28dc0b0
        .long   0xe1dc52b6
        .long   0xe28d10b0
        .long   0xe28d20b0
        .long   0xe1d112b4
        .long   0xe1d222b2
        .long   0xe28dc0b0
        .long   0xe1dcc3b0
        .long   0xe0821001
        .long   0xe084e00e
        .long   0xe0887007
        .long   0xe0815005
        .long   0xe08e7007
        .long   0xe28cc004
        .long   0xe0855007
        .long   0xe085c00c
        .long   0xe1a011cc
        .long   0xe3c11801
        .long   0xea000005
LKVS73:
        .long   0xe590101c
        .long   0xe3a02001
        .long   0xe2411001
        .long   0xe1a01112
        .long   0xe3c114ff
        .long   0xe3c118ff
LKVS74:
        .long   0xe1c310be
        .long   0xe1c310bc
        .long   0xe1c310ba
        .long   0xe1c310b8
        .long   0xe1c310b6
        .long   0xe1c310b4
        .long   0xe1c310b2
        .long   0xe1c310b0
        .long   0xe5902008
        .long   0xe1a02082
        .long   0xe18310b2
        .long   0xe082c003
        .long   0xe1cc10be
        .long   0xe1cc10bc
        .long   0xe1cc10ba
        .long   0xe1cc10b8
        .long   0xe1cc10b6
        .long   0xe1cc10b4
        .long   0xe1cc10b2
        .long   0xe5902008
        .long   0xe1a0e082
        .long   0xe18c10be
        .long   0xe08e200c
        .long   0xe1c210be
        .long   0xe1c210bc
        .long   0xe1c210ba
        .long   0xe1c210b8
        .long   0xe1c210b6
        .long   0xe1c210b4
        .long   0xe1c210b2
        .long   0xe590c008
        .long   0xe1a0e08c
        .long   0xe08ec002
        .long   0xe18210be
        .long   0xe1cc10be
        .long   0xe1cc10bc
        .long   0xe1cc10ba
        .long   0xe1cc10b8
        .long   0xe1cc10b6
        .long   0xe1cc10b4
        .long   0xe1cc10b2
        .long   0xe5902008
        .long   0xe1a0e082
        .long   0xe08e200c
        .long   0xe18c10be
        .long   0xe1c210be
        .long   0xe1c210bc
        .long   0xe1c210ba
        .long   0xe1c210b8
        .long   0xe1c210b6
        .long   0xe1c210b4
        .long   0xe1c210b2
        .long   0xe590c008
        .long   0xe1a0e08c
        .long   0xe08ec002
        .long   0xe18210be
        .long   0xe1cc10be
        .long   0xe1cc10bc
        .long   0xe1cc10ba
        .long   0xe1cc10b8
        .long   0xe1cc10b6
        .long   0xe1cc10b4
        .long   0xe1cc10b2
        .long   0xe5902008
        .long   0xe1a0e082
        .long   0xe08e200c
        .long   0xe18c10be
        .long   0xe1c210be
        .long   0xe1c210bc
        .long   0xe1c210ba
        .long   0xe1c210b8
        .long   0xe1c210b6
        .long   0xe1c210b4
        .long   0xe1c210b2
        .long   0xe590c008
        .long   0xe1a0c08c
        .long   0xe08ce002
        .long   0xe1ce10be
        .long   0xe1ce10bc
        .long   0xe1ce10ba
        .long   0xe1ce10b8
        .long   0xe1ce10b6
        .long   0xe1ce10b4
        .long   0xe1ce10b2
        .long   0xe18210bc
        .long   0xeafffc10
LKVS75:
        .long   0xe28d20b0
        .long   0xe1d280b2
        .long   0xe28d20b0
        .long   0xe1d250b8
        .long   0xe28d10b0
        .long   0xe1d172b2
        .long   0xe28dc0b0
        .long   0xe1dc90b4
        .long   0xe28d20b0
        .long   0xe1d240ba
        .long   0xe28d10b0
        .long   0xe1d112b4
        .long   0xe28dc0b0
        .long   0xe28d20b0
        .long   0xe1d220bc
        .long   0xe1dcc0be
        .long   0xe28de0b0
        .long   0xe1dee1b0
        .long   0xe58d1078
        .long   0xe28da0b0
        .long   0xe1daa0b6
        .long   0xe28d10b0
        .long   0xe1d112b6
        .long   0xe58da074
        .long   0xe28da0b0
        .long   0xe1daa2b8
        .long   0xe0889009
        .long   0xe0854004
        .long   0xe58da070
        .long   0xe28da0b0
        .long   0xe1daa2ba
        .long   0xe082c00c
        .long   0xe59d2078
        .long   0xe58da06c
        .long   0xe28da0b0
        .long   0xe1daa2bc
        .long   0xe0821001
        .long   0xe59d2074
        .long   0xe58da068
        .long   0xe28da0b0
        .long   0xe1daa2be
        .long   0xe0899002
        .long   0xe08e7007
        .long   0xe59d206c
        .long   0xe59de070
        .long   0xe58da064
        .long   0xe0871001
        .long   0xe084c00c
        .long   0xe08e2002
        .long   0xe28da0b0
        .long   0xe1daa3b0
        .long   0xe0821001
        .long   0xe59d2064
        .long   0xe089900c
        .long   0xe59dc068
        .long   0xe58da060
        .long   0xe0891001
        .long   0xe08c2002
        .long   0xe59dc060
        .long   0xe28cc008
        .long   0xe082c00c
        .long   0xe081c00c
        .long   0xe1a0124c
        .long   0xe3c11801
        .long   0xeaffff68
LKVS_bd.1.4:
        .long   0xe59d9038
        .long   0xe3a05000
        .long   0xe1a04005
        .long   0xe28da0b0
LKVS76:
        .long   0xe28d10b0
        .long   0xe28d80b0
        .long   0xe3a07000
        .long   0xe0812005
LKVS77:
        .long   0xe0821087
        .long   0xe1d1e0b4
        .long   0xe1d1c0b2
        .long   0xe1d110b6
        .long   0xe1a0b087
        .long   0xe08ce08e
        .long   0xe08e1001
        .long   0xe2811002
LKVS78:
        .long   0xe1a01141
        .long   0xe2877001
        .long   0xe18910bb
        .long   0xe3570008
        .long   0xe28bb002
        .long   0xaa00000b
        .long   0xe3570007
        .long   0x0a000000
        .long   0xeaffffee
LKVS79:
        .long   0xe3540007
        .long   0x0a000000
        .long   0xeaffffeb
LKVS80:
        .long   0xe1dac2b0
        .long   0xe1d811be
        .long   0xe08cc08c
        .long   0xe081c00c
        .long   0xe28c1002
        .long   0xeaffffed
LKVS81:
        .long   0xe5901008
        .long   0xe2844001
        .long   0xe3540008
        .long   0xe2855002
        .long   0xe0899081
        .long   0xbaffffdb
        .long   0xeafffba6
LKVS_bd.1.5:
        .long   0xe28d10b0
        .long   0xe28d20b0
        .long   0xe1d2a0b2
        .long   0xe1d112b2
        .long   0xe28dc0b0
        .long   0xe1dc90b0
        .long   0xe28d20b0
        .long   0xe1d222b4
        .long   0xe08aa001
        .long   0xe08aa009
        .long   0xe289b002
        .long   0xe08aa00b
        .long   0xe28db0e4
        .long   0xe1cb90b0
        .long   0xe28d90e4
        .long   0xe1c910b2
        .long   0xe28dc0b0
        .long   0xe1dcc2b6
        .long   0xe28d10e4
        .long   0xe1c120b4
        .long   0xe28de0b0
        .long   0xe1dee2b8
        .long   0xe28d10e4
        .long   0xe1c1c0b6
        .long   0xe28d40b0
        .long   0xe1d442ba
        .long   0xe28d10e4
        .long   0xe1c1e0b8
        .long   0xe28d50b0
        .long   0xe1d552bc
        .long   0xe28d10e4
        .long   0xe1c140ba
        .long   0xe28d70b0
        .long   0xe1d772be
        .long   0xe28d10e4
        .long   0xe1c150bc
        .long   0xe28d80b0
        .long   0xe1d883b0
        .long   0xe28d10e4
        .long   0xe1c170be
        .long   0xe28d10e4
        .long   0xe1c181b0
        .long   0xe59dc038
        .long   0xe1a0114a
        .long   0xe3a02000
LKVS82:
        .long   0xe3520000
        .long   0xda000013
        .long   0xe28de0e4
        .long   0xe3a05000
        .long   0xe1a04005
        .long   0xe08ee082
LKVS83:
        .long   0xe2647000
        .long   0xe2844001
        .long   0xe1a08087
        .long   0xe08e7008
        .long   0xe15790b2
        .long   0xe19e80b8
        .long   0xe1d770b2
        .long   0xe1540002
        .long   0xe0899008
        .long   0xe0898008
        .long   0xe0887007
        .long   0xe2877002
        .long   0xe1a07147
        .long   0xe18c70b5
        .long   0xe2855002
        .long   0xbaffffef
LKVS84:
        .long   0xe2827001
        .long   0xe3570008
        .long   0xe1a05007
        .long   0xaa000011
        .long   0xe262e000
        .long   0xe28d80b0
        .long   0xe088e08e
        .long   0xe1a04085
        .long   0xe08ee085
LKVS85:
        .long   0xe15ea0b2
        .long   0xe1de90b0
        .long   0xe1fe80b2
        .long   0xe2855001
        .long   0xe08aa009
        .long   0xe08a9009
        .long   0xe0898008
        .long   0xe2888002
        .long   0xe3550008
        .long   0xe1a08148
        .long   0xe18c80b4
        .long   0xe2844002
        .long   0xbafffff2
LKVS86:
        .long   0xe1a02082
        .long   0xe18c10b2
        .long   0xe590e008
        .long   0xe3570008
        .long   0xe1a02007
        .long   0xe08cc08e
        .long   0xbaffffcc
        .long   0xeafffb45
LKVS_bd.1.6:
        .long   0xe28d20b0
        .long   0xe1d240b2
        .long   0xe28d10b0
        .long   0xe1d110b0
        .long   0xe28dc0b0
        .long   0xe1dce0bc
        .long   0xe28d20b0
        .long   0xe1d250b4
        .long   0xe58d1078
        .long   0xe28d10b0
        .long   0xe1d120b6
        .long   0xe28d80b0
        .long   0xe28d10b0
        .long   0xe1d110b8
        .long   0xe1d880be
        .long   0xe28dc0b0
        .long   0xe1dcc0ba
        .long   0xe085b002
        .long   0xe58d8074
        .long   0xe28d80b0
        .long   0xe1d881b0
        .long   0xe28d90b0
        .long   0xe28bb001
        .long   0xe58d8070
        .long   0xe1d992b4
        .long   0xe28d80b0
        .long   0xe58d906c
        .long   0xe28d90b0
        .long   0xe1d992b6
        .long   0xe58d9068
        .long   0xe28d90b0
        .long   0xe1d992b8
        .long   0xe58d9064
        .long   0xe1d882b2
        .long   0xe0879107
        .long   0xe0879009
        .long   0xe58d8060
        .long   0xe28d80b0
        .long   0xe1d882ba
        .long   0xe1a09089
        .long   0xe2899006
        .long   0xe58d805c
        .long   0xe28d80b0
        .long   0xe1d882bc
        .long   0xe58d8058
        .long   0xe28d80b0
        .long   0xe1d882be
        .long   0xe58d8038
        .long   0xe59d8078
        .long   0xe0848008
        .long   0xe2887001
        .long   0xe0848005
        .long   0xe1a070c7
        .long   0xe18370b9
        .long   0xe590a008
        .long   0xe2889001
        .long   0xe1a0a18a
        .long   0xe28a8004
        .long   0xe18370b8
        .long   0xe5908008
        .long   0xe1a090c9
        .long   0xe085a082
        .long   0xe1a08108
        .long   0xe2888002
        .long   0xe18370b8
        .long   0xe1c370b0
        .long   0xe5907008
        .long   0xe2818002
        .long   0xe08aa008
        .long   0xe0878107
        .long   0xe0877008
        .long   0xe1a0a14a
        .long   0xe58da054
        .long   0xe1a07087
        .long   0xe2877008
        .long   0xe18390b7
        .long   0xe5907008
        .long   0xe1a080cb
        .long   0xe59db074
        .long   0xe59da070
        .long   0xe1a07187
        .long   0xe2877006
        .long   0xe18390b7
        .long   0xe08ba00a
        .long   0xe590b008
        .long   0xe0827001
        .long   0xe2877001
        .long   0xe1a0b10b
        .long   0xe28bb004
        .long   0xe18390bb
        .long   0xe1c390b2
        .long   0xe5909008
        .long   0xe28aa001
        .long   0xe1a070c7
        .long   0xe089b109
        .long   0xe089900b
        .long   0xe1a0a0ca
        .long   0xe58da030
        .long   0xe1a09089
        .long   0xe289900a
        .long   0xe18380b9
        .long   0xe590b008
        .long   0xe59d9074
        .long   0xe08ca08e
        .long   0xe1a0b18b
        .long   0xe2899002
        .long   0xe08a9009
        .long   0xe28ba008
        .long   0xe18380ba
        .long   0xe590b008
        .long   0xe59da060
        .long   0xe1a09149
        .long   0xe58d901c
        .long   0xe59d9078
        .long   0xe1a0b10b
        .long   0xe08aa089
        .long   0xe28b9006
        .long   0xe18380b9
        .long   0xe1c380b4
        .long   0xe5908008
        .long   0xe081900c
        .long   0xe2899001
        .long   0xe088b108
        .long   0xe088800b
        .long   0xe08cb00e
        .long   0xe1a08088
        .long   0xe288800c
        .long   0xe18370b8
        .long   0xe5908008
        .long   0xe1a090c9
        .long   0xe28bb001
        .long   0xe58d8018
        .long   0xe2848002
        .long   0xe08a8008
        .long   0xe58d8014
        .long   0xe59d8018
        .long   0xe1a08188
        .long   0xe288800a
        .long   0xe18370b8
        .long   0xe5908008
        .long   0xe59da074
        .long   0xe1a08108
        .long   0xe2888008
        .long   0xe18370b8
        .long   0xe1c370b6
        .long   0xe5907008
        .long   0xe1a080cb
        .long   0xe08ea00a
        .long   0xe28aa001
        .long   0xe087b107
        .long   0xe087b00b
        .long   0xe59d7014
        .long   0xe1a0a0ca
        .long   0xe58da018
        .long   0xe1a0b08b
        .long   0xe1a07147
        .long   0xe28ba00e
        .long   0xe18390ba
        .long   0xe59db078
        .long   0xe590a008
        .long   0xe08bb084
        .long   0xe58db014
        .long   0xe285b002
        .long   0xe58db010
        .long   0xe1a0a18a
        .long   0xe28aa00c
        .long   0xe18390ba
        .long   0xe590a008
        .long   0xe59db014
        .long   0xe0845085
        .long   0xe58da00c
        .long   0xe59da010
        .long   0xe59d400c
        .long   0xe58d5014
        .long   0xe08ba00a
        .long   0xe282b002
        .long   0xe1a04104
        .long   0xe284400a
        .long   0xe18390b4
        .long   0xe1c390b8
        .long   0xe59d4074
        .long   0xe5909008
        .long   0xe1a0a14a
        .long   0xe08e5084
        .long   0xe59d4070
        .long   0xe1a09189
        .long   0xe289900e
        .long   0xe18380b9
        .long   0xe5909008
        .long   0xe2844002
        .long   0xe0854004
        .long   0xe1a09109
        .long   0xe289900c
        .long   0xe18380b9
        .long   0xe1c380ba
        .long   0xe5908008
        .long   0xe59d5014
        .long   0xe28ee002
        .long   0xe1a08108
        .long   0xe1a04144
        .long   0xe085b00b
        .long   0xe288500e
        .long   0xe59d8018
        .long   0xe18380b5
        .long   0xe1c380bc
        .long   0xe59d5030
        .long   0xe1c350be
        .long   0xe5905008
        .long   0xe58d4074
        .long   0xe1a0414b
        .long   0xe0658185
        .long   0xe081508c
        .long   0xe1a08088
        .long   0xe2888006
        .long   0xe18370b8
        .long   0xe5908008
        .long   0xe085900e
        .long   0xe082e081
        .long   0xe59d2060
        .long   0xe0885108
        .long   0xe59d806c
        .long   0xe1a05085
        .long   0xe2855004
        .long   0xe18370b5
        .long   0xe0882082
        .long   0xe5905008
        .long   0xe59d8078
        .long   0xe1a01149
        .long   0xe2888002
        .long   0xe0822008
        .long   0xe0858085
        .long   0xe28c5002
        .long   0xe1a08088
        .long   0xe288c002
        .long   0xe18370bc
        .long   0xe590c008
        .long   0xe08e5005
        .long   0xe59de06c
        .long   0xe59d8068
        .long   0xe1a0c08c
        .long   0xe18370bc
        .long   0xe5907008
        .long   0xe088e08e
        .long   0xe59d8064
        .long   0xe1a02142
        .long   0xe1a0c145
        .long   0xe59d5060
        .long   0xe0677187
        .long   0xe1a07087
        .long   0xe2877008
        .long   0xe2855002
        .long   0xe08ee005
        .long   0xe59d5068
        .long   0xe183a0b7
        .long   0xe5907008
        .long   0xe0885085
        .long   0xe59d806c
        .long   0xe1a0e14e
        .long   0xe2889002
        .long   0xe0855009
        .long   0xe59d905c
        .long   0xe0878107
        .long   0xe59d7064
        .long   0xe1a08088
        .long   0xe2888006
        .long   0xe183a0b8
        .long   0xe0897087
        .long   0xe59d9068
        .long   0xe5908008
        .long   0xe59db058
        .long   0xe2899002
        .long   0xe0877009
        .long   0xe59d905c
        .long   0xe0888088
        .long   0xe1a05145
        .long   0xe1a08088
        .long   0xe08b9089
        .long   0xe2888004
        .long   0xe183a0b8
        .long   0xe590b008
        .long   0xe59d8064
        .long   0xe1a07147
        .long   0xe1a0b08b
        .long   0xe28bb002
        .long   0xe183a0bb
        .long   0xe590a008
        .long   0xe2888002
        .long   0xe0899008
        .long   0xe59db038
        .long   0xe59d8058
        .long   0xe1a09149
        .long   0xe58d9078
        .long   0xe59d905c
        .long   0xe08b8088
        .long   0xe06aa18a
        .long   0xe2899002
        .long   0xe0889009
        .long   0xe1a0a08a
        .long   0xe28aa00a
        .long   0xe18340ba
        .long   0xe590a008
        .long   0xe08aa10a
        .long   0xe1a0808a
        .long   0xe2888008
        .long   0xe18340b8
        .long   0xe590a008
        .long   0xe1a08149
        .long   0xe08aa08a
        .long   0xe1a0908a
        .long   0xe2899006
        .long   0xe18340b9
        .long   0xe5909008
        .long   0xe1a09089
        .long   0xe2899004
        .long   0xe18340b9
        .long   0xe5904008
        .long   0xe59d9054
        .long   0xe0644184
        .long   0xe1a04084
        .long   0xe284400c
        .long   0xe18390b4
        .long   0xe5904008
        .long   0xe59d9054
        .long   0xe0844104
        .long   0xe1a04084
        .long   0xe284400a
        .long   0xe18390b4
        .long   0xe5904008
        .long   0xe59d9054
        .long   0xe0844084
        .long   0xe1a04084
        .long   0xe2844008
        .long   0xe18390b4
        .long   0xe5904008
        .long   0xe59d9054
        .long   0xe1a04084
        .long   0xe2844006
        .long   0xe18390b4
        .long   0xe5904008
        .long   0xe0644184
        .long   0xe1a04084
        .long   0xe284400e
        .long   0xe183c0b4
        .long   0xe5904008
        .long   0xe0844104
        .long   0xe1a04084
        .long   0xe284400c
        .long   0xe183c0b4
        .long   0xe5904008
        .long   0xe0844084
        .long   0xe1a04084
        .long   0xe284400a
        .long   0xe183c0b4
        .long   0xe5904008
        .long   0xe1a04084
        .long   0xe2844008
        .long   0xe183c0b4
        .long   0xe590c008
        .long   0xe08cc10c
        .long   0xe1a0c08c
        .long   0xe28cc00e
        .long   0xe18310bc
        .long   0xe590c008
        .long   0xe08cc08c
        .long   0xe1a0c08c
        .long   0xe28cc00c
        .long   0xe18310bc
        .long   0xe590c008
        .long   0xe1a0c08c
        .long   0xe28cc00a
        .long   0xe18310bc
        .long   0xe5901008
        .long   0xe59dc01c
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe59dc01c
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe59dc074
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183c0b1
        .long   0xe590c008
        .long   0xe08c110c
        .long   0xe08c1001
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18370b1
        .long   0xe5902008
        .long   0xe0821182
        .long   0xe0821001
        .long   0xe18370b1
        .long   0xe5901008
        .long   0xe59d2078
        .long   0xe0611101
        .long   0xe1a01101
        .long   0xe18320b1
        .long   0xe5902008
        .long   0xe0621202
        .long   0xe0411002
        .long   0xe18380b1
        .long   0xeafff98b
LKVS_bd.1.7:
        .long   0xe28dc0b0
        .long   0xe1dce2b2
        .long   0xe28dc0b0
        .long   0xe1dc52b6
        .long   0xe28d20b0
        .long   0xe1d220b0
        .long   0xe28d10b0
        .long   0xe1d112b4
        .long   0xe28dc0b0
        .long   0xe58d2078
        .long   0xe1dcc2ba
        .long   0xe28d80b0
        .long   0xe28d20b0
        .long   0xe1d222b8
        .long   0xe28d40b0
        .long   0xe1d442bc
        .long   0xe1d882be
        .long   0xe28d90b0
        .long   0xe58d8074
        .long   0xe28d80b0
        .long   0xe1d883b0
        .long   0xe58d8070
        .long   0xe1d990b4
        .long   0xe28d80b0
        .long   0xe58d906c
        .long   0xe28d90b0
        .long   0xe1d990b6
        .long   0xe58d9068
        .long   0xe28d90b0
        .long   0xe1d990b8
        .long   0xe58d9064
        .long   0xe1d880b2
        .long   0xe58d8060
        .long   0xe28d80b0
        .long   0xe1d880ba
        .long   0xe58d805c
        .long   0xe28d80b0
        .long   0xe1d880bc
        .long   0xe58d8058
        .long   0xe28d80b0
        .long   0xe1d880be
        .long   0xe58d8038
        .long   0xe59d8078
        .long   0xe08e9008
        .long   0xe0878087
        .long   0xe2899001
        .long   0xe0817005
        .long   0xe1a08088
        .long   0xe1a090c9
        .long   0xe288800c
        .long   0xe18390b8
        .long   0xe590a008
        .long   0xe2878001
        .long   0xe08e7001
        .long   0xe1a0a10a
        .long   0xe28aa008
        .long   0xe18390ba
        .long   0xe590b008
        .long   0xe1a080c8
        .long   0xe085a082
        .long   0xe1a0b08b
        .long   0xe28bb004
        .long   0xe18390bb
        .long   0xe1c390b0
        .long   0xe5909008
        .long   0xe2877001
        .long   0xe28cb002
        .long   0xe1a09189
        .long   0xe289900c
        .long   0xe1a070c7
        .long   0xe18370b9
        .long   0xe5909008
        .long   0xe08ab00b
        .long   0xe085a002
        .long   0xe0899089
        .long   0xe1a0b14b
        .long   0xe58db054
        .long   0xe1a09089
        .long   0xe2899008
        .long   0xe18370b9
        .long   0xe59db078
        .long   0xe5909008
        .long   0xe28aa001
        .long   0xe08bb08e
        .long   0xe58db030
        .long   0xe281b002
        .long   0xe58db01c
        .long   0xe1a09109
        .long   0xe2899004
        .long   0xe18370b9
        .long   0xe590b008
        .long   0xe1a090ca
        .long   0xe082a00c
        .long   0xe58da018
        .long   0xe1a0b08b
        .long   0xe18370bb
        .long   0xe59d701c
        .long   0xe590a008
        .long   0xe59db030
        .long   0xe08b7007
        .long   0xe59db018
        .long   0xe08aa10a
        .long   0xe1a07147
        .long   0xe1a0a08a
        .long   0xe28bb001
        .long   0xe58db030
        .long   0xe28aa00c
        .long   0xe18380ba
        .long   0xe590a008
        .long   0xe082b08c
        .long   0xe2822002
        .long   0xe58da01c
        .long   0xe284a002
        .long   0xe08ba00a
        .long   0xe59db01c
        .long   0xe1a0a14a
        .long   0xe1a0b18b
        .long   0xe28bb008
        .long   0xe18380bb
        .long   0xe590b008
        .long   0xe58da01c
        .long   0xe59da060
        .long   0xe08bb08b
        .long   0xe58db014
        .long   0xe28aa002
        .long   0xe58da018
        .long   0xe59da078
        .long   0xe59db018
        .long   0xe08ea08a
        .long   0xe08aa00b
        .long   0xe59db014
        .long   0xe1a0a14a
        .long   0xe1a0b08b
        .long   0xe28bb004
        .long   0xe18380bb
        .long   0xe590b008
        .long   0xe58da014
        .long   0xe59da074
        .long   0xe1a0b10b
        .long   0xe084a00a
        .long   0xe58da010
        .long   0xe18380bb
        .long   0xe590a008
        .long   0xe59d8030
        .long   0xe08cb004
        .long   0xe58db030
        .long   0xe08ab10a
        .long   0xe08ab00b
        .long   0xe59da030
        .long   0xe1a080c8
        .long   0xe1a0b08b
        .long   0xe28aa001
        .long   0xe58da030
        .long   0xe59da010
        .long   0xe28bb00c
        .long   0xe18390bb
        .long   0xe590b008
        .long   0xe28aa001
        .long   0xe08cc084
        .long   0xe08bb10b
        .long   0xe58db00c
        .long   0xe59db074
        .long   0xe1a0a0ca
        .long   0xe58da010
        .long   0xe59da030
        .long   0xe1a0a0ca
        .long   0xe58da030
        .long   0xe59da070
        .long   0xe08ba00a
        .long   0xe28aa001
        .long   0xe58da008
        .long   0xe59da00c
        .long   0xe081b085
        .long   0xe08e1081
        .long   0xe1a0a08a
        .long   0xe28aa008
        .long   0xe18390ba
        .long   0xe590a008
        .long   0xe58d2004
        .long   0xe58db00c
        .long   0xe1a0a18a
        .long   0xe28a2004
        .long   0xe18390b2
        .long   0xe5902008
        .long   0xe59da008
        .long   0xe2855002
        .long   0xe082e102
        .long   0xe0815005
        .long   0xe1a0a0ca
        .long   0xe58da008
        .long   0xe082e00e
        .long   0xe18390be
        .long   0xe59d900c
        .long   0xe59de004
        .long   0xe5902008
        .long   0xe089900e
        .long   0xe062e182
        .long   0xe1a02149
        .long   0xe1a0e08e
        .long   0xe28e100c
        .long   0xe18380b1
        .long   0xe590e008
        .long   0xe1a01145
        .long   0xe08e510e
        .long   0xe08ee005
        .long   0xe59d5074
        .long   0xe1a0e08e
        .long   0xe28ee008
        .long   0xe18380be
        .long   0xe59de074
        .long   0xe2855002
        .long   0xe08cc005
        .long   0xe5905008
        .long   0xe084e08e
        .long   0xe1a0c14c
        .long   0xe0854105
        .long   0xe59d5070
        .long   0xe1a04084
        .long   0xe2844004
        .long   0xe18380b4
        .long   0xe5904008
        .long   0xe2855002
        .long   0xe08ee005
        .long   0xe59d506c
        .long   0xe1a04184
        .long   0xe1a0e14e
        .long   0xe58de074
        .long   0xe59de060
        .long   0xe18380b4
        .long   0xe5904008
        .long   0xe59d8068
        .long   0xe085e08e
        .long   0xe59d5078
        .long   0xe0644184
        .long   0xe1a04084
        .long   0xe2844008
        .long   0xe2855002
        .long   0xe08ee005
        .long   0xe59d506c
        .long   0xe1a0e14e
        .long   0xe0885085
        .long   0xe59d8030
        .long   0xe18380b4
        .long   0xe59d8018
        .long   0xe59d9064
        .long   0xe5904008
        .long   0xe0858008
        .long   0xe59d5068
        .long   0xe0895085
        .long   0xe0849104
        .long   0xe084a009
        .long   0xe1a04148
        .long   0xe59d806c
        .long   0xe1a0a08a
        .long   0xe2889002
        .long   0xe28a8004
        .long   0xe59da030
        .long   0xe0859009
        .long   0xe1a09149
        .long   0xe183a0b8
        .long   0xe59d5064
        .long   0xe59da05c
        .long   0xe5908008
        .long   0xe08a5085
        .long   0xe088a188
        .long   0xe088800a
        .long   0xe59da030
        .long   0xe183a0b8
        .long   0xe5908008
        .long   0xe58d9078
        .long   0xe59d9068
        .long   0xe59da058
        .long   0xe0688188
        .long   0xe2899002
        .long   0xe0859009
        .long   0xe59d505c
        .long   0xe1a08088
        .long   0xe2888004
        .long   0xe08a5085
        .long   0xe59da010
        .long   0xe1a09149
        .long   0xe183a0b8
        .long   0xe5908008
        .long   0xe58d9070
        .long   0xe59d9064
        .long   0xe59da038
        .long   0xe0688108
        .long   0xe2899002
        .long   0xe0859009
        .long   0xe59d5058
        .long   0xe1a09149
        .long   0xe1a08108
        .long   0xe08a5085
        .long   0xe59da010
        .long   0xe183a0b8
        .long   0xe5908008
        .long   0xe58d906c
        .long   0xe59d905c
        .long   0xe068a208
        .long   0xe04a8008
        .long   0xe59da008
        .long   0xe2899002
        .long   0xe0859009
        .long   0xe183a0b8
        .long   0xe5908008
        .long   0xe1a09149
        .long   0xe0888088
        .long   0xe1a05088
        .long   0xe59d8014
        .long   0xe285500e
        .long   0xe18380b5
        .long   0xe5905008
        .long   0xe59d8014
        .long   0xe58d9068
        .long   0xe1a05105
        .long   0xe285500a
        .long   0xe18380b5
        .long   0xe5905008
        .long   0xe59d8014
        .long   0xe1a05085
        .long   0xe2855006
        .long   0xe18380b5
        .long   0xe1c380b2
        .long   0xe5905008
        .long   0xe1a05185
        .long   0xe285500e
        .long   0xe18370b5
        .long   0xe5905008
        .long   0xe0855085
        .long   0xe1a05085
        .long   0xe285500a
        .long   0xe18370b5
        .long   0xe5905008
        .long   0xe1a05105
        .long   0xe2855006
        .long   0xe18370b5
        .long   0xe5905008
        .long   0xe1a05085
        .long   0xe2855002
        .long   0xe18370b5
        .long   0xe5905008
        .long   0xe0855105
        .long   0xe1a05085
        .long   0xe285500e
        .long   0xe18310b5
        .long   0xe5905008
        .long   0xe1a05185
        .long   0xe285500a
        .long   0xe18310b5
        .long   0xe5905008
        .long   0xe0855085
        .long   0xe1a05085
        .long   0xe2855006
        .long   0xe18310b5
        .long   0xe5905008
        .long   0xe1a05105
        .long   0xe2855002
        .long   0xe18310b5
        .long   0xe5905008
        .long   0xe0851105
        .long   0xe0851001
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe2811006
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe59d2054
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18320b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe59d2054
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe59d2054
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe59d2054
        .long   0xe1a01181
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe59d201c
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18320b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe59d201c
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe59d201c
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183c0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe59d2074
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe281100c
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe183e0b1
        .long   0xe1c3e0b4
        .long   0xe5901008
        .long   0xe1a01101
        .long   0xe281100e
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18340b1
        .long   0xe1c340b6
        .long   0xe5901008
        .long   0xe59d2078
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18320b1
        .long   0xe1c320b8
        .long   0xe5901008
        .long   0xe59d2070
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18320b1
        .long   0xe1c320ba
        .long   0xe59d106c
        .long   0xe1c310bc
        .long   0xe59d1068
        .long   0xe1c310be
        .long   0xeafff7b2
LKVS_bd.1.8:
        .long   0xe28d10b0
        .long   0xe28d20b0
        .long   0xe1d220b4
        .long   0xe28d80b0
        .long   0xe28d40b0
        .long   0xe58d2078
        .long   0xe28d20b0
        .long   0xe1d221b6
        .long   0xe59da078
        .long   0xe28de0b0
        .long   0xe58d2074
        .long   0xe1d110b2
        .long   0xe28d20b0
        .long   0xe28d90b0
        .long   0xe58d1070
        .long   0xe59db070
        .long   0xe28d10b0
        .long   0xe1d150b6
        .long   0xe28d10b0
        .long   0xe1d110b8
        .long   0xe08ba00a
        .long   0xe28aa001
        .long   0xe58d106c
        .long   0xe1d220be
        .long   0xe1d441b4
        .long   0xe28d10b0
        .long   0xe1d1c0ba
        .long   0xe1de71b0
        .long   0xe28d10b0
        .long   0xe1d110bc
        .long   0xe1d881b8
        .long   0xe28de0b0
        .long   0xe1dee1b2
        .long   0xe1a0a0ca
        .long   0xe58d8068
        .long   0xe1d991ba
        .long   0xe58d9064
        .long   0xe1c3a0b0
        .long   0xe5908008
        .long   0xe59d9078
        .long   0xe0899005
        .long   0xe289a001
        .long   0xe1a09108
        .long   0xe59d806c
        .long   0xe1a0a0ca
        .long   0xe183a0b9
        .long   0xe1c3a0b2
        .long   0xe0858008
        .long   0xe5909008
        .long   0xe288a001
        .long   0xe59d806c
        .long   0xe1a09189
        .long   0xe1a0a0ca
        .long   0xe183a0b9
        .long   0xe590b008
        .long   0xe087900e
        .long   0xe088800c
        .long   0xe2899001
        .long   0xe1a0b10b
        .long   0xe28bb002
        .long   0xe183a0bb
        .long   0xe1c3a0b4
        .long   0xe590a008
        .long   0xe1a090c9
        .long   0xe58d9060
        .long   0xe2888001
        .long   0xe06aa10a
        .long   0xe1a090c8
        .long   0xe59d806c
        .long   0xe1a0a10a
        .long   0xe18390ba
        .long   0xe590b008
        .long   0xe088808c
        .long   0xe281a002
        .long   0xe1a0b18b
        .long   0xe088a00a
        .long   0xe28b8002
        .long   0xe18390b8
        .long   0xe590b008
        .long   0xe08c8001
        .long   0xe2888001
        .long   0xe1a0b10b
        .long   0xe28bb004
        .long   0xe18390bb
        .long   0xe1c390b6
        .long   0xe590b008
        .long   0xe59d9074
        .long   0xe1a0a14a
        .long   0xe58da05c
        .long   0xe08ba10b
        .long   0xe08bb00a
        .long   0xe0849009
        .long   0xe289a001
        .long   0xe1a0b08b
        .long   0xe1a090c8
        .long   0xe28b8002
        .long   0xe18390b8
        .long   0xe5908008
        .long   0xe1a0a0ca
        .long   0xe58da058
        .long   0xe1a08188
        .long   0xe2888004
        .long   0xe18390b8
        .long   0xe590a008
        .long   0xe0818002
        .long   0xe08eb004
        .long   0xe1a0a10a
        .long   0xe28aa006
        .long   0xe18390ba
        .long   0xe1c390b8
        .long   0xe590a008
        .long   0xe2888001
        .long   0xe28bb001
        .long   0xe1a090c8
        .long   0xe08a810a
        .long   0xe08aa008
        .long   0xe1a0b0cb
        .long   0xe58db054
        .long   0xe0828087
        .long   0xe1a0a08a
        .long   0xe28aa004
        .long   0xe18390ba
        .long   0xe590a008
        .long   0xe28eb002
        .long   0xe088800b
        .long   0xe1a0a18a
        .long   0xe28aa006
        .long   0xe18390ba
        .long   0xe590b008
        .long   0xe1a08148
        .long   0xe082a007
        .long   0xe1a0b10b
        .long   0xe28bb008
        .long   0xe18390bb
        .long   0xe1c390ba
        .long   0xe59db078
        .long   0xe5909008
        .long   0xe28aa001
        .long   0xe58da01c
        .long   0xe08bb085
        .long   0xe58db038
        .long   0xe59db06c
        .long   0xe28bb002
        .long   0xe58db030
        .long   0xe59da030
        .long   0xe089b109
        .long   0xe089900b
        .long   0xe59db038
        .long   0xe08ba00a
        .long   0xe1a0b089
        .long   0xe59d901c
        .long   0xe28bb006
        .long   0xe1a0a14a
        .long   0xe1a090c9
        .long   0xe18390bb
        .long   0xe590b008
        .long   0xe58da038
        .long   0xe08ca081
        .long   0xe58da030
        .long   0xe1a0b18b
        .long   0xe28ba008
        .long   0xe18390ba
        .long   0xe590a008
        .long   0xe59db074
        .long   0xe28cc002
        .long   0xe58da01c
        .long   0xe59da068
        .long   0xe08ba00a
        .long   0xe28aa001
        .long   0xe58da018
        .long   0xe59da01c
        .long   0xe1a0a10a
        .long   0xe28aa00a
        .long   0xe18390ba
        .long   0xe1c390bc
        .long   0xe59db030
        .long   0xe590a008
        .long   0xe2829002
        .long   0xe08b9009
        .long   0xe0812082
        .long   0xe08ab10a
        .long   0xe08ab00b
        .long   0xe59da078
        .long   0xe58db030
        .long   0xe59db070
        .long   0xe1a09149
        .long   0xe2871002
        .long   0xe08ba08a
        .long   0xe59db060
        .long   0xe58da078
        .long   0xe59da030
        .long   0xe0822001
        .long   0xe087708e
        .long   0xe08ee084
        .long   0xe1a0a08a
        .long   0xe28aa008
        .long   0xe183b0ba
        .long   0xe590a008
        .long   0xe59db078
        .long   0xe1a02142
        .long   0xe58da070
        .long   0xe285a002
        .long   0xe08ba00a
        .long   0xe59db060
        .long   0xe58da078
        .long   0xe59da070
        .long   0xe1a0a18a
        .long   0xe28aa00a
        .long   0xe183b0ba
        .long   0xe59db018
        .long   0xe590a008
        .long   0xe1a0b0cb
        .long   0xe58db070
        .long   0xe59db078
        .long   0xe1a0a10a
        .long   0xe28aa00c
        .long   0xe1a0b14b
        .long   0xe58db078
        .long   0xe59db060
        .long   0xe183b0ba
        .long   0xe1c3b0be
        .long   0xe590a008
        .long   0xe59d106c
        .long   0xe08ab10a
        .long   0xe08aa00b
        .long   0xe0855081
        .long   0xe085500c
        .long   0xe1a0a08a
        .long   0xe28a100a
        .long   0xe59da054
        .long   0xe183a0b1
        .long   0xe5901008
        .long   0xe59dc054
        .long   0xe1a01181
        .long   0xe281100c
        .long   0xe183c0b1
        .long   0xe590c008
        .long   0xe1a01145
        .long   0xe59d5054
        .long   0xe1a0c10c
        .long   0xe28cc00e
        .long   0xe18350bc
        .long   0xe5905008
        .long   0xe284c002
        .long   0xe087c00c
        .long   0xe59d7058
        .long   0xe085a105
        .long   0xe085500a
        .long   0xe1a0c14c
        .long   0xe1a05085
        .long   0xe285500c
        .long   0xe18370b5
        .long   0xe5905008
        .long   0xe59d7074
        .long   0xe59da058
        .long   0xe1a05185
        .long   0xe285500e
        .long   0xe2877002
        .long   0xe183a0b5
        .long   0xe5905008
        .long   0xe08e7007
        .long   0xe59de074
        .long   0xe084e08e
        .long   0xe0854105
        .long   0xe085a004
        .long   0xe59d5068
        .long   0xe1a04147
        .long   0xe1a0a08a
        .long   0xe2855002
        .long   0xe28a700e
        .long   0xe59da070
        .long   0xe08ee005
        .long   0xe1a0e14e
        .long   0xe183a0b7
        .long   0xe59da074
        .long   0xe5907008
        .long   0xe59d5068
        .long   0xe08a5085
        .long   0xe59da078
        .long   0xe1a07087
        .long   0xe183a0b7
        .long   0xe590a008
        .long   0xe59db038
        .long   0xe59d7064
        .long   0xe1a0a08a
        .long   0xe28aa002
        .long   0xe183b0ba
        .long   0xe590a008
        .long   0xe2877002
        .long   0xe0857007
        .long   0xe08a510a
        .long   0xe08aa005
        .long   0xe59d5038
        .long   0xe1a07147
        .long   0xe18350ba
        .long   0xe5905008
        .long   0xe0855085
        .long   0xe1a05085
        .long   0xe2855002
        .long   0xe18310b5
        .long   0xe5905008
        .long   0xe1a05085
        .long   0xe2855004
        .long   0xe18310b5
        .long   0xe590a008
        .long   0xe08a518a
        .long   0xe08a5005
        .long   0xe18310b5
        .long   0xe5901008
        .long   0xe59d505c
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe59d505c
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe59d505c
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18350b1
        .long   0xe5905008
        .long   0xe0651205
        .long   0xe0411005
        .long   0xe59d505c
        .long   0xe18350b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe18390b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18390b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe18390b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe18390b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe18320b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe18380b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe183c0b1
        .long   0xe5901008
        .long   0xe0811081
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe18340b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe18370b1
        .long   0xeafff5fd
LKVS_bd.1.9:
        .long   0xe28d10b0
        .long   0xe28d20b0
        .long   0xe1d222b4
        .long   0xe28de0b0
        .long   0xe58d2078
        .long   0xe59d4078
        .long   0xe28d20b0
        .long   0xe1d112b2
        .long   0xe1d282b6
        .long   0xe58d1074
        .long   0xe59d5074
        .long   0xe1dee3b0
        .long   0xe28d10b0
        .long   0xe1d172b8
        .long   0xe0854004
        .long   0xe28d10b0
        .long   0xe1d122ba
        .long   0xe2844001
        .long   0xe28d10b0
        .long   0xe1d1c2bc
        .long   0xe1a040c4
        .long   0xe1c340b0
        .long   0xe59d4078
        .long   0xe5905008
        .long   0xe082a08c
        .long   0xe0844008
        .long   0xe2844001
        .long   0xe28d10b0
        .long   0xe1d112be
        .long   0xe1a040c4
        .long   0xe1a05085
        .long   0xe18340b5
        .long   0xe1c340b4
        .long   0xe5905008
        .long   0xe2819002
        .long   0xe08a9009
        .long   0xe0884007
        .long   0xe2844001
        .long   0xe1a05105
        .long   0xe1a09149
        .long   0xe58d9070
        .long   0xe1a040c4
        .long   0xe18340b5
        .long   0xe5909008
        .long   0xe08e508e
        .long   0xe0815005
        .long   0xe1a09089
        .long   0xe2899004
        .long   0xe18340b9
        .long   0xe1c340b8
        .long   0xe5909008
        .long   0xe0874002
        .long   0xe2844001
        .long   0xe089a109
        .long   0xe1a040c4
        .long   0xe089900a
        .long   0xe18340b9
        .long   0xe590b008
        .long   0xe2859002
        .long   0xe082a00c
        .long   0xe1a0b10b
        .long   0xe28b5004
        .long   0xe18340b5
        .long   0xe5905008
        .long   0xe1a09149
        .long   0xe58d906c
        .long   0xe28aa001
        .long   0xe1a05085
        .long   0xe2855008
        .long   0xe18340b5
        .long   0xe1c340bc
        .long   0xe5905008
        .long   0xe1a090ca
        .long   0xe08c4001
        .long   0xe1a05185
        .long   0xe18390b5
        .long   0xe5905008
        .long   0xe081a00e
        .long   0xe58da068
        .long   0xe59da068
        .long   0xe0855085
        .long   0xe2844001
        .long   0xe28aa001
        .long   0xe1a05085
        .long   0xe58da068
        .long   0xe2855004
        .long   0xe18390b5
        .long   0xe5905008
        .long   0xe59db074
        .long   0xe59da078
        .long   0xe58d5064
        .long   0xe59d5068
        .long   0xe08c1081
        .long   0xe1a040c4
        .long   0xe08ba08a
        .long   0xe58da074
        .long   0xe59da064
        .long   0xe1a050c5
        .long   0xe1a0a10a
        .long   0xe28aa008
        .long   0xe18390ba
        .long   0xe590a008
        .long   0xe59db074
        .long   0xe58da068
        .long   0xe288a002
        .long   0xe08ba00a
        .long   0xe58da074
        .long   0xe59da068
        .long   0xe1a0a08a
        .long   0xe28aa00c
        .long   0xe18390ba
        .long   0xe5909008
        .long   0xe59da074
        .long   0xe1a0a14a
        .long   0xe58da074
        .long   0xe087a082
        .long   0xe58da068
        .long   0xe089a189
        .long   0xe089a00a
        .long   0xe18340ba
        .long   0xe5909008
        .long   0xe59db068
        .long   0xe28ca002
        .long   0xe1a09189
        .long   0xe2899004
        .long   0xe08ba00a
        .long   0xe58da068
        .long   0xe18340b9
        .long   0xe5909008
        .long   0xe287b002
        .long   0xe0887087
        .long   0xe58d9064
        .long   0xe59d9078
        .long   0xe089a088
        .long   0xe59d9064
        .long   0xe08aa00b
        .long   0xe0899089
        .long   0xe1a09089
        .long   0xe2898008
        .long   0xe18340b8
        .long   0xe590b008
        .long   0xe1a0814a
        .long   0xe2829002
        .long   0xe1a0b10b
        .long   0xe28b200c
        .long   0xe18340b2
        .long   0xe5904008
        .long   0xe59d2068
        .long   0xe0879009
        .long   0xe0644104
        .long   0xe1a0c149
        .long   0xe1a02142
        .long   0xe1a04104
        .long   0xe18350b4
        .long   0xe5904008
        .long   0xe28e7002
        .long   0xe0811007
        .long   0xe0844104
        .long   0xe1a04084
        .long   0xe2844004
        .long   0xe18350b4
        .long   0xe5904008
        .long   0xe1a01141
        .long   0xe1a04184
        .long   0xe2844008
        .long   0xe18350b4
        .long   0xe5904008
        .long   0xe0844084
        .long   0xe1a04084
        .long   0xe284400c
        .long   0xe18350b4
        .long   0xe5905008
        .long   0xe0854105
        .long   0xe0854004
        .long   0xe59d506c
        .long   0xe1a04084
        .long   0xe2844002
        .long   0xe18350b4
        .long   0xe5904008
        .long   0xe59d506c
        .long   0xe0844104
        .long   0xe1a04084
        .long   0xe2844006
        .long   0xe18350b4
        .long   0xe5904008
        .long   0xe59d506c
        .long   0xe1a04184
        .long   0xe284400a
        .long   0xe18350b4
        .long   0xe5904008
        .long   0xe59d506c
        .long   0xe0844084
        .long   0xe1a04084
        .long   0xe284400e
        .long   0xe18350b4
        .long   0xe59d4074
        .long   0xe1c340b2
        .long   0xe5904008
        .long   0xe1a04084
        .long   0xe2844002
        .long   0xe18380b4
        .long   0xe1c380b6
        .long   0xe5904008
        .long   0xe1a04104
        .long   0xe2844002
        .long   0xe183c0b4
        .long   0xe5904008
        .long   0xe1a04084
        .long   0xe2844006
        .long   0xe183c0b4
        .long   0xe1c3c0ba
        .long   0xe590c008
        .long   0xe08cc08c
        .long   0xe1a0c08c
        .long   0xe28cc002
        .long   0xe18320bc
        .long   0xe590c008
        .long   0xe1a0c10c
        .long   0xe28cc006
        .long   0xe18320bc
        .long   0xe590c008
        .long   0xe1a0c08c
        .long   0xe28cc00a
        .long   0xe18320bc
        .long   0xe1c320be
        .long   0xe5902008
        .long   0xe59dc070
        .long   0xe1a02182
        .long   0xe2822002
        .long   0xe183c0b2
        .long   0xe5902008
        .long   0xe59dc070
        .long   0xe0822082
        .long   0xe1a02082
        .long   0xe2822006
        .long   0xe183c0b2
        .long   0xe5902008
        .long   0xe59dc070
        .long   0xe1a02102
        .long   0xe282200a
        .long   0xe183c0b2
        .long   0xe5902008
        .long   0xe59dc070
        .long   0xe1a02082
        .long   0xe282200e
        .long   0xe183c0b2
        .long   0xe5902008
        .long   0xe0822102
        .long   0xe1a02082
        .long   0xe2822002
        .long   0xe18310b2
        .long   0xe5902008
        .long   0xe1a02182
        .long   0xe2822006
        .long   0xe18310b2
        .long   0xe5902008
        .long   0xe0822082
        .long   0xe1a02082
        .long   0xe282200a
        .long   0xe18310b2
        .long   0xe5902008
        .long   0xe1a02102
        .long   0xe282200e
        .long   0xe18310b2
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100e
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe281100e
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100c
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe1a01181
        .long   0xe281100c
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe281100a
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0811101
        .long   0xe1a01081
        .long   0xe2811008
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811006
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0821102
        .long   0xe0821001
        .long   0xe1a01081
        .long   0xe2811004
        .long   0xe183e0b1
        .long   0xe5901008
        .long   0xe0611181
        .long   0xe1a01081
        .long   0xe2811002
        .long   0xe183e0b1
        .long   0xe5902008
        .long   0xe0621202
        .long   0xe0411002
        .long   0xe183e0b1
        .long   0xeafff48d
LKVS87:
        mvn     r0, #0xD
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LKVS88:
        mvn     r0, #7
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LKVS_bt.1:
        andeq   r0, r0, r12, lsr #32
        andeq   r1, r0, r8, asr #32
        andeq   r1, r0, r0, ror #3
        andeq   r1, r0, r8, asr #10
        andeq   r1, r0, r12, ror #11
        andeq   r1, r0, r0, ror r7
        andeq   r1, r0, r8, asr lr
        .long   0x000025bc
        .long   0x00002c90


