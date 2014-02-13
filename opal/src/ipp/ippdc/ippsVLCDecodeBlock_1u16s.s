        .text
        .align  4
        .globl  _ippsVLCDecodeBlock_1u16s


_ippsVLCDecodeBlock_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     r12, [sp, #0x54]
        cmp     r0, #0
        beq     LGAS24
        cmp     r1, #0
        beq     LGAS24
        cmp     r2, #0
        beq     LGAS24
        cmp     r12, #0
        beq     LGAS24
        ldr     lr, [r1]
        cmp     lr, #0
        blt     LGAS0
        cmp     lr, #7
        ble     LGAS1
LGAS0:
        mvn     r0, #0x7E
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAS1:
        and     r4, r12, #0x1F
        rsb     r4, r4, #0
        and     r6, r4, #0x1F
        ldr     r5, [r6, +r12]
        ldr     r4, [pc, #0x4D8]
        add     r12, r12, r6
        cmp     r4, r5
        beq     LGAS2
        mvn     r0, #0x7E
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAS2:
        ldr     r5, [r12, #0xC]
        ldr     r4, [r0]
        mvn     r10, #0xFF, 8
        str     r5, [sp, #0x20]
        ldr     r5, [r12, #8]
        str     r5, [sp, #0x1C]
        ldr     r5, [r12, #0x14]
        ldr     r6, [r12, #0x10]
        and     r12, r4, #3
        sub     r7, r4, r12
        ldr     r12, [r7]
        sub     r4, r4, r7
        ldr     r9, [r7, #4]
        mov     r4, r4, lsl #3
        rsb     r4, r4, #0
        sub     r4, r4, lr
        and     lr, r12, #0xFF, 24
        add     r5, r5, #1
        mov     lr, lr, lsl #8
        orr     lr, lr, r12, lsl #24
        add     r7, r7, #8
        str     lr, [sp, #0x24]
        ldr     r11, [sp, #0x24]
        and     lr, r9, #0xFF, 24
        str     r7, [sp, #0x28]
        mov     r8, r12, lsr #8
        mov     r7, lr, lsl #8
        orr     r7, r7, r9, lsl #24
        mov     lr, r9, lsr #8
        str     r7, [sp, #8]
        and     r8, r8, #0xFF, 24
        and     r7, lr, #0xFF, 24
        orr     r8, r11, r8
        ldr     r11, [sp, #8]
        mov     lr, #1
        bic     r12, r12, r10
        mov     lr, lr, lsl r5
        orr     r7, r11, r7
        bic     r10, r9, r10
        cmp     r6, #0x10
        add     r4, r4, #0x20
        sub     lr, lr, #1
        orr     r12, r8, r12, lsr #24
        orr     r7, r7, r10, lsr #24
        beq     LGAS17
        cmp     r6, #0x20
        beq     LGAS10
        cmp     r3, #0
        ble     LGAS9
        ldr     r6, [pc, #0x3FC]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LGAS3:
        ldrb    r0, [r11]
        cmp     r4, r10
        str     r0, [sp]
        bge     LGAS4
        ldr     r1, [r6, +r4, lsl #2]
        sub     r9, r10, r4
        rsb     r8, r9, #0x20
        mov     r8, r7, lsr r8
        and     r1, r12, r1
        orr     r8, r8, r1, lsl r9
        b       LGAS5
LGAS4:
        ldr     r1, [r6, +r10, lsl #2]
        sub     r8, r4, r10
        and     r8, r1, r12, lsr r8
LGAS5:
        sub     r1, r10, r0
        add     r1, r11, r8, lsr r1
        ldrb    r1, [r1, #1]
        mov     r9, r1, asr #1
        str     r9, [sp, #4]
        tst     r1, #1
        movne   r9, #0
        bne     LGAS7
        str     lr, [sp, #8]
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #4]
        ldr     lr, [sp]
        mov     r9, #0
        str     r5, [sp, #0xC]
LGAS6:
        add     r9, r9, r0
        ldrb    r0, [r3, +r11]
        ldr     r5, [r6, +r0, lsl #2]
        add     lr, r0, lr
        sub     r1, r10, lr
        and     r1, r5, r8, lsr r1
        add     r1, r11, r1
        add     r3, r1, r3
        ldrb    r1, [r3, #1]
        tst     r1, #1
        mov     r3, r1, asr #1
        beq     LGAS6
        ldr     lr, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #0x10]
LGAS7:
        and     r0, lr, r1
        mov     r1, r1, lsl #24
        add     r9, r9, r0, asr #1
        mov     r1, r1, asr #24
        mov     r1, r1, asr r5
        sub     r4, r4, r9
        strh    r1, [r2], #2
        cmp     r4, #0
        bgt     LGAS8
        ldr     r1, [sp, #0x28]
        add     r4, r4, #0x20
        mov     r12, r7
        ldr     r0, [r1], #4
        str     r1, [sp, #0x28]
        and     r7, r0, #0xFF, 24
        mov     r1, r0, lsr #8
        mov     r7, r7, lsl #8
        orr     r8, r7, r0, lsl #24
        mvn     r7, #0xFF, 8
        and     r1, r1, #0xFF, 24
        bic     r7, r0, r7
        orr     r1, r8, r1
        orr     r7, r1, r7, lsr #24
LGAS8:
        subs    r3, r3, #1
        bne     LGAS3
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LGAS9:
        ldr     r2, [sp, #0x28]
        rsb     r4, r4, #0x20
        sub     r2, r2, #8
        add     r2, r2, r4, asr #3
        str     r2, [r0]
        and     r4, r4, #7
        mov     r0, #0
        str     r4, [r1]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LGAS10:
        cmp     r3, #0
        ble     LGAS9
        ldr     r6, [sp, #0x20]
        ldr     r8, [pc, #0x29C]
        str     lr, [sp, #8]
        str     r5, [sp, #0xC]
        ldr     lr, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        add     r6, r6, #4
        str     r7, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LGAS11:
        ldr     r1, [r5]
        cmp     r4, lr
        mov     r0, r1
        bge     LGAS12
        ldr     r7, [r8, +r4, lsl #2]
        ldr     r10, [sp, #0x24]
        sub     r9, lr, r4
        str     r9, [sp, #4]
        rsb     r9, r9, #0x20
        mov     r9, r10, lsr r9
        ldr     r10, [sp, #4]
        and     r7, r12, r7
        orr     r11, r9, r7, lsl r10
        b       LGAS13
LGAS12:
        ldr     r7, [r8, +lr, lsl #2]
        sub     r9, r4, lr
        and     r11, r7, r12, lsr r9
LGAS13:
        sub     r7, lr, r1
        mov     r7, r11, lsr r7
        ldr     r7, [r6, +r7, lsl #2]
        tst     r7, #1
        mov     r10, r7, lsr #1
        movne   r9, #0
        bne     LGAS15
        mov     r9, #0
        str     r3, [sp, #0x10]
LGAS14:
        add     r9, r9, r1
        ldr     r1, [r5, +r10, lsl #2]
        ldr     r7, [r8, +r1, lsl #2]
        add     r0, r1, r0
        sub     r3, lr, r0
        and     r3, r7, r11, lsr r3
        add     r10, r3, r10
        ldr     r7, [r6, +r10, lsl #2]
        tst     r7, #1
        mov     r10, r7, lsr #1
        beq     LGAS14
        ldr     r3, [sp, #0x10]
LGAS15:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        and     r0, r7, r0
        add     r0, r9, r0, lsr #1
        sub     r4, r4, r0
        mov     r7, r7, asr r1
        strh    r7, [r2], #2
        cmp     r4, #0
        bgt     LGAS16
        ldr     r1, [sp, #0x28]
        ldr     r12, [sp, #0x24]
        add     r4, r4, #0x20
        ldr     r0, [r1], #4
        str     r1, [sp, #0x28]
        and     r7, r0, #0xFF, 24
        mov     r1, r0, lsr #8
        mov     r7, r7, lsl #8
        orr     r9, r7, r0, lsl #24
        mvn     r7, #0xFF, 8
        and     r1, r1, #0xFF, 24
        bic     r7, r0, r7
        orr     r1, r9, r1
        orr     r7, r1, r7, lsr #24
        str     r7, [sp, #0x24]
LGAS16:
        subs    r3, r3, #1
        bne     LGAS11
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        b       LGAS9
LGAS17:
        cmp     r3, #0
        ble     LGAS9
        ldr     r6, [sp, #0x20]
        ldr     r8, [pc, #0x160]
        ldr     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        add     r6, r6, #2
        str     r7, [sp, #0x24]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LGAS18:
        ldrh    r0, [r11]
        cmp     r4, r10
        str     r0, [sp]
        bge     LGAS19
        ldr     r7, [r8, +r4, lsl #2]
        sub     r1, r10, r4
        rsb     r9, r1, #0x20
        and     r7, r12, r7
        str     r9, [sp, #4]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #4]
        ldr     r9, [sp, #0x24]
        mov     r7, r9, lsr r7
        ldr     r9, [sp, #0x2C]
        orr     r7, r7, r9, lsl r1
        b       LGAS20
LGAS19:
        ldr     r7, [r8, +r10, lsl #2]
        sub     r1, r4, r10
        and     r7, r7, r12, lsr r1
LGAS20:
        sub     r1, r10, r0
        mov     r1, r7, lsr r1
        mov     r1, r1, lsl #1
        ldrh    r1, [r6, +r1]
        mov     r9, r1, asr #1
        str     r9, [sp, #4]
        tst     r1, #1
        movne   r9, #0
        bne     LGAS22
        str     lr, [sp, #8]
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #4]
        ldr     lr, [sp]
        mov     r9, #0
        str     r5, [sp, #0xC]
LGAS21:
        mov     r1, r3, lsl #1
        add     r9, r9, r0
        ldrh    r0, [r11, +r1]
        ldr     r1, [r8, +r0, lsl #2]
        add     lr, r0, lr
        sub     r5, r10, lr
        and     r5, r1, r7, lsr r5
        add     r3, r5, r3
        mov     r1, r3, lsl #1
        ldrh    r1, [r6, +r1]
        tst     r1, #1
        mov     r3, r1, asr #1
        beq     LGAS21
        ldr     lr, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #0x10]
LGAS22:
        and     r0, lr, r1
        mov     r1, r1, lsl #16
        add     r9, r9, r0, asr #1
        mov     r1, r1, asr #16
        mov     r0, r1, asr r5
        sub     r4, r4, r9
        strh    r0, [r2], #2
        cmp     r4, #0
        bgt     LGAS23
        ldr     r0, [sp, #0x28]
        ldr     r12, [sp, #0x24]
        add     r4, r4, #0x20
        ldr     r1, [r0], #4
        str     r0, [sp, #0x28]
        and     r7, r1, #0xFF, 24
        mov     r0, r1, lsr #8
        mov     r7, r7, lsl #8
        orr     r9, r7, r1, lsl #24
        mvn     r7, #0xFF, 8
        and     r0, r0, #0xFF, 24
        bic     r7, r1, r7
        orr     r0, r9, r0
        orr     r7, r0, r7, lsr #24
        str     r7, [sp, #0x24]
LGAS23:
        subs    r3, r3, #1
        bne     LGAS18
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        b       LGAS9
LGAS24:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4160
        .long   LGAS_table_mask


        .data
        .align  4


LGAS_table_mask:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x7F,0x00,0x00,0x00
        .byte   0xFF,0x00,0x00,0x00,0xFF,0x01,0x00,0x00,0xFF,0x03,0x00,0x00,0xFF,0x07,0x00,0x00
        .byte   0xFF,0x0F,0x00,0x00,0xFF,0x1F,0x00,0x00,0xFF,0x3F,0x00,0x00,0xFF,0x7F,0x00,0x00
        .byte   0xFF,0xFF,0x00,0x00,0xFF,0xFF,0x01,0x00,0xFF,0xFF,0x03,0x00,0xFF,0xFF,0x07,0x00
        .byte   0xFF,0xFF,0x0F,0x00,0xFF,0xFF,0x1F,0x00,0xFF,0xFF,0x3F,0x00,0xFF,0xFF,0x7F,0x00
        .byte   0xFF,0xFF,0xFF,0x00,0xFF,0xFF,0xFF,0x01,0xFF,0xFF,0xFF,0x03,0xFF,0xFF,0xFF,0x07
        .byte   0xFF,0xFF,0xFF,0x0F,0xFF,0xFF,0xFF,0x1F,0xFF,0xFF,0xFF,0x3F,0xFF,0xFF,0xFF,0x7F
        .byte   0xFF,0xFF,0xFF,0xFF


