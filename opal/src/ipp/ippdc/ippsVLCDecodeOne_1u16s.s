        .text
        .align  4
        .globl  _ippsVLCDecodeOne_1u16s


_ippsVLCDecodeOne_1u16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        cmp     r0, #0
        beq     LGAN14
        cmp     r1, #0
        beq     LGAN14
        cmp     r2, #0
        beq     LGAN14
        cmp     r3, #0
        beq     LGAN14
        ldr     r7, [r1]
        cmp     r7, #0
        blt     LGAN0
        cmp     r7, #7
        ble     LGAN1
LGAN0:
        mvn     r0, #0x7E
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LGAN1:
        and     r12, r3, #0x1F
        rsb     r12, r12, #0
        and     r4, r12, #0x1F
        ldr     r12, [r4, +r3]
        ldr     lr, [pc, #0x35C]
        add     r8, r3, r4
        cmp     lr, r12
        beq     LGAN2
        mvn     r0, #0x7E
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LGAN2:
        ldr     r6, [r0]
        ldr     r12, [r8, #0xC]
        ldr     r3, [r8, #8]
        ldr     lr, [r8, #0x14]
        and     r4, r6, #3
        sub     r9, r6, r4
        ldr     r4, [r9]
        add     r5, lr, #1
        sub     lr, r6, r9
        mov     r11, r4, lsr #8
        and     r11, r11, #0xFF, 24
        str     r11, [sp, #0x14]
        mvn     r11, #0xFF, 8
        str     r11, [sp, #0x10]
        and     r10, r4, #0xFF, 24
        mov     r11, #1
        mov     r10, r10, lsl #8
        mov     r11, r11, lsl r5
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        orr     r10, r10, r4, lsl #24
        mov     lr, lr, lsl #3
        orr     r10, r10, r11
        ldr     r11, [sp, #0x10]
        rsb     lr, lr, #0
        sub     lr, lr, r7
        add     lr, lr, #0x20
        bic     r11, r4, r11
        ldr     r4, [sp, #0x18]
        cmp     lr, r3
        orr     r11, r10, r11, lsr #24
        sub     r4, r4, #1
        bge     LGAN3
        ldr     r10, [pc, #0x2C0]
        ldr     r9, [r9, #4]
        ldr     r10, [r10, +lr, lsl #2]
        sub     lr, r3, lr
        str     lr, [sp, #0x20]
        str     r10, [sp, #0x18]
        mvn     r10, #0xFF, 8
        str     r10, [sp, #0x14]
        and     r10, r9, #0xFF, 24
        str     r10, [sp, #0x10]
        mov     r10, r9, lsr #8
        and     r10, r10, #0xFF, 24
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        mov     r10, r10, lsl #8
        orr     r10, r10, r9, lsl #24
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x10]
        orr     lr, r10, lr
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x14]
        bic     lr, r9, lr
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x20]
        ldr     r9, [sp, #0x1C]
        rsb     lr, lr, #0x20
        str     lr, [sp, #0x10]
        ldr     lr, [sp, #0x18]
        and     r11, r11, lr
        ldr     lr, [sp, #0x14]
        orr     lr, r9, lr, lsr #24
        ldr     r9, [sp, #0x10]
        mov     lr, lr, lsr r9
        ldr     r9, [sp, #0x20]
        orr     lr, lr, r11, lsl r9
        b       LGAN4
LGAN3:
        ldr     r9, [pc, #0x22C]
        sub     lr, lr, r3
        ldr     r9, [r9, +r3, lsl #2]
        and     lr, r9, r11, lsr lr
LGAN4:
        ldr     r8, [r8, #0x10]
        cmp     r8, #0x10
        beq     LGAN11
        cmp     r8, #0x20
        mov     r8, #0
        beq     LGAN8
        ldrb    r10, [r12]
        sub     r9, r3, r10
        add     r9, r12, lr, lsr r9
        ldrb    r9, [r9, #1]
        str     r10, [sp, #0x10]
        tst     r9, #1
        mov     r11, r9, asr #1
        bne     LGAN6
        ldr     r9, [pc, #0x1E4]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        str     r0, [sp]
        mov     r8, #0
        str     r2, [sp, #8]
        mov     r0, r9
LGAN5:
        add     r8, r8, r10
        ldrb    r10, [r11, +r12]
        ldr     r2, [r0, +r10, lsl #2]
        add     r1, r10, r1
        sub     r9, r3, r1
        and     r9, r2, lr, lsr r9
        add     r2, r12, r9
        add     r11, r2, r11
        ldrb    r9, [r11, #1]
        tst     r9, #1
        mov     r11, r9, asr #1
        beq     LGAN5
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LGAN6:
        mov     r3, r9, lsl #24
        and     r9, r4, r9
        mov     r3, r3, asr #24
        mov     r5, r3, asr r5
        strh    r5, [r2]
        add     r9, r8, r9, asr #1
LGAN7:
        add     r7, r9, r7
        add     r6, r6, r7, asr #3
        str     r6, [r0]
        and     r7, r7, #7
        mov     r0, #0
        str     r7, [r1]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LGAN8:
        ldr     r9, [r12]
        add     r10, r12, #4
        sub     r11, r3, r9
        mov     r11, lr, lsr r11
        ldr     r10, [r10, +r11, lsl #2]
        str     r9, [sp, #0x14]
        tst     r10, #1
        mov     r11, r10, lsr #1
        bne     LGAN10
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        ldr     r1, [pc, #0x128]
        ldr     r2, [sp, #0x14]
        add     r10, r12, #4
        str     r0, [sp]
        mov     r8, #0
        str     r7, [sp, #0xC]
        mov     r0, r10
LGAN9:
        add     r8, r8, r9
        ldr     r9, [r12, +r11, lsl #2]
        ldr     r7, [r1, +r9, lsl #2]
        add     r2, r9, r2
        sub     r10, r3, r2
        and     r10, r7, lr, lsr r10
        add     r11, r10, r11
        ldr     r10, [r0, +r11, lsl #2]
        tst     r10, #1
        mov     r11, r10, lsr #1
        beq     LGAN9
        ldr     r7, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LGAN10:
        and     r4, r10, r4
        mov     r5, r10, asr r5
        strh    r5, [r2]
        add     r9, r8, r4, lsr #1
        b       LGAN7
LGAN11:
        ldrh    r10, [r12]
        add     r11, r12, #2
        sub     r8, r3, r10
        mov     r8, lr, lsr r8
        mov     r8, r8, lsl #1
        ldrh    r8, [r11, +r8]
        str     r10, [sp, #0x14]
        mov     r9, r8, asr #1
        tst     r8, #1
        str     r9, [sp, #0x10]
        movne   r9, #0
        bne     LGAN13
        ldr     r8, [pc, #0x8C]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        str     r0, [sp]
        mov     r9, #0
        str     r7, [sp, #0xC]
        mov     r0, r8
LGAN12:
        mov     r7, r1, lsl #1
        add     r9, r9, r10
        ldrh    r10, [r12, +r7]
        ldr     r8, [r0, +r10, lsl #2]
        add     r2, r10, r2
        sub     r7, r3, r2
        and     r7, r8, lr, lsr r7
        add     r1, r7, r1
        mov     r1, r1, lsl #1
        ldrh    r8, [r11, +r1]
        tst     r8, #1
        mov     r1, r8, asr #1
        beq     LGAN12
        ldr     r7, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LGAN13:
        mov     r3, r8, lsl #16
        and     r8, r4, r8
        mov     r3, r3, asr #16
        mov     r5, r3, asr r5
        strh    r5, [r2]
        add     r9, r9, r8, asr #1
        b       LGAN7
LGAN14:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4160
        .long   LGAN_table_mask


        .data
        .align  4


LGAN_table_mask:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x0F,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x7F,0x00,0x00,0x00
        .byte   0xFF,0x00,0x00,0x00,0xFF,0x01,0x00,0x00,0xFF,0x03,0x00,0x00,0xFF,0x07,0x00,0x00
        .byte   0xFF,0x0F,0x00,0x00,0xFF,0x1F,0x00,0x00,0xFF,0x3F,0x00,0x00,0xFF,0x7F,0x00,0x00
        .byte   0xFF,0xFF,0x00,0x00,0xFF,0xFF,0x01,0x00,0xFF,0xFF,0x03,0x00,0xFF,0xFF,0x07,0x00
        .byte   0xFF,0xFF,0x0F,0x00,0xFF,0xFF,0x1F,0x00,0xFF,0xFF,0x3F,0x00,0xFF,0xFF,0x7F,0x00
        .byte   0xFF,0xFF,0xFF,0x00,0xFF,0xFF,0xFF,0x01,0xFF,0xFF,0xFF,0x03,0xFF,0xFF,0xFF,0x07
        .byte   0xFF,0xFF,0xFF,0x0F,0xFF,0xFF,0xFF,0x1F,0xFF,0xFF,0xFF,0x3F,0xFF,0xFF,0xFF,0x7F
        .byte   0xFF,0xFF,0xFF,0xFF


