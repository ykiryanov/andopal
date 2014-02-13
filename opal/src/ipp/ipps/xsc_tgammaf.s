        .text
        .align  4
        .globl  tgammaf


tgammaf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r1, #0xFF
        orr     r1, r1, #0xFF, 24
        sub     r1, r1, #0x3E, 22
        str     r0, [sp, #0x18]
        mov     r2, #0xFE, 10
        and     r4, r1, r0, asr #20
        orr     r1, r2, #3, 2
        cmp     r4, #3, 24
        mvn     r2, #2, 2
        mov     lr, #0x1F
        blt     LAAC93
        ldr     r3, [pc, #0xF80]
        mov     r12, #0
        cmp     r3, r0
        ble     LAAC92
        mov     r2, #0x43
        mvn     r3, r1
        add     r2, r2, #0x3E, 28
        cmp     r2, r4
        and     r3, r0, r3
        orr     r3, r3, #2, 10
        mov     r2, r4, asr #3
        ble     LAAC89
        mvn     r4, #0xFE, 10
        cmp     r2, #0x80
        bic     r6, r4, #3, 2
        blt     LAAC77
        rsb     r1, r2, #0x96
        mov     r5, r3, asr r1
        eors    r4, r3, r5, lsl r1
        bne     LAAC0
        tst     r0, #2, 2
        subeq   r1, r6, #0x7F, 16
        bne     LAAC91
LAAC0:
        sub     r12, r2, #0x82
        ldr     r0, [pc, #0xF24]
        str     r3, [sp, #0x14]
        mov     r12, r12, lsr #30
        and     r3, r12, #2
        sub     r5, r5, r3
        eor     r3, r4, r4, asr #31
        clz     r3, r3
        sub     r12, r3, #1
        mov     lr, r5, asr #3
        add     r3, r1, r12
        add     r1, lr, lr, lsl #3
        str     r5, [sp]
        add     lr, r1, lr, lsl #2
        ldr     r1, [r0, +lr, lsl #3]
        mov     r6, r4, lsl r12
        add     lr, r0, lr, lsl #3
        ldr     r5, [lr, #4]
        mov     r12, r1, asr #24
        str     r12, [sp, #8]
        mov     r1, r1, lsl #8
        str     r1, [sp, #4]
        ldr     r7, [sp, #4]
        ldr     r12, [sp, #8]
        add     r3, r3, #0x20
        add     r0, lr, #8
        mov     r4, #0xC
LAAC1:
        umull   lr, r1, r6, r5
        umull   r8, r9, r6, r7
        adds    lr, lr, r9
        adc     r1, r1, #0
        tst     r5, r5
        bmi     LAAC109
LAAC2:
        cmp     r6, #0
        blt     LAAC108
LAAC3:
        eors    r5, r1, r1, asr #31
        beq     LAAC4
        clz     r5, r5
        subs    r5, r5, #2
        beq     LAAC4
        rsb     r7, r5, #0x20
        mov     r8, r8, lsr r7
        mov     r7, lr, lsr r7
        orr     r1, r7, r1, lsl r5
        orr     lr, r8, lr, lsl r5
LAAC4:
        ldr     r8, [r0]
        ldr     r7, [r0, #4]
        add     r12, r3, r12
        add     r5, r12, r5
        sub     r12, r5, #0x40
        mov     r10, r8, asr #24
        subs    r9, r12, r10
        add     r0, r0, #8
        mov     r5, r8, lsl #8
        bmi     LAAC5
        mov     r12, r10
        mov     r8, r5
        mov     r5, r7
        b       LAAC6
LAAC5:
        mov     r8, lr
        mov     lr, r5
        mov     r5, r1
        rsb     r9, r9, #0
        mov     r1, r7
LAAC6:
        cmp     r9, #0x20
        bcs     LAAC7
        rsb     r7, r9, #0x20
        mov     r7, r1, lsl r7
        orr     lr, r7, lr, lsr r9
        mov     r9, r1, asr r9
        b       LAAC8
LAAC7:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     lr, r1, asr r9
        mov     r9, r1, asr #31
LAAC8:
        adds    r7, r8, lr
        sub     r4, r4, #1
        adc     r5, r5, r9
        cmp     r4, #0
        bgt     LAAC1
        ldr     r0, [sp]
        str     r7, [sp, #4]
        str     r12, [sp, #8]
        ands    r0, r0, #7
        beq     LAAC15
        ldr     r1, [sp, #0x14]
        rsb     r2, r2, #0x9D
        mov     r7, #1
        mov     r1, r1, lsl #7
        sub     r1, r1, r7, lsl r2
        subs    r0, r0, #1
        mov     lr, r1
        mov     r12, #0
        add     r8, r2, #0x20
        sub     r4, r2, #0x20
        beq     LAAC10
LAAC9:
        sub     r1, r1, r7, lsl r2
        umull   r9, r12, r1, r12
        umull   r9, lr, r1, lr
        add     r8, r4, r8
        adds    r12, r9, r12
        adc     lr, lr, #0
        subs    r0, r0, #1
        bne     LAAC9
LAAC10:
        tst     lr, #1, 2
        bne     LAAC13
        cmp     lr, #0
        bne     LAAC11
        cmp     r12, #0
        moveq   r0, #0
        beq     LAAC12
        clz     r0, r12
        mov     r12, r12, lsl r0
        str     r1, [sp, #0x14]
        add     r0, r0, #0x1F
        mov     lr, r12, lsr #1
        b       LAAC12
LAAC11:
        clz     r0, lr
        sub     r0, r0, #1
        str     r1, [sp, #0x14]
        rsb     r1, r0, #0x20
        mov     r1, r12, lsr r1
        orr     lr, r1, lr, lsl r0
LAAC12:
        add     r8, r8, r0
LAAC13:
        ldr     r0, [sp, #4]
        umull   r5, r2, lr, r5
        umull   r0, r12, lr, r0
        adds    r12, r5, r12
        str     r12, [sp, #4]
        adc     r5, r2, #0
        cmp     r5, #0
        str     lr, [sp, #0x14]
        mov     r1, r5
        beq     LAAC14
        clz     r1, r5
        subs    r1, r1, #1
        beq     LAAC14
        ldr     r2, [sp, #4]
        rsb     r12, r1, #0x20
        mov     r0, r0, lsr r12
        mov     r12, r2, lsr r12
        orr     r2, r0, r2, lsl r1
        orr     r5, r12, r5, lsl r1
        str     r2, [sp, #4]
LAAC14:
        ldr     r0, [sp, #8]
        add     r8, r0, r8
        add     r1, r8, r1
        sub     r0, r1, #0x40
        str     r0, [sp, #8]
LAAC15:
        ldr     r0, [sp, #0x18]
        tst     r0, #2, 2
        beq     LAAC73
        cmp     r3, #0x3F
        beq     LAAC106
LAAC16:
        umull   r8, r7, r6, r6
        cmp     r7, #0
        mov     r0, r7
        beq     LAAC17
        clz     r0, r7
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r8, lsr r1
        orr     r7, r1, r7, lsl r0
        mov     r8, r8, lsl r0
LAAC17:
        ldr     r2, [pc, #0xC98]
        ldr     r12, [pc, #0xC98]
        add     r1, r0, r3, lsl #1
        umull   lr, r0, r2, r8
        umull   lr, r2, r2, r7
        sub     r1, r1, #0x40
        adds    r0, lr, r0
        umull   r4, lr, r12, r7
        umull   r12, r9, r12, r8
        adc     r2, r2, #0
        adds    r4, r4, r9
        adc     lr, lr, #0
        adds    r0, r0, r12
        adc     r2, r2, #0
        adds    r12, r2, r4
        adc     r2, lr, #0
        mov     lr, r2
        cmp     lr, #0
        beq     LAAC18
        clz     r9, lr
        mov     r4, lr
        subs    lr, r9, #1
        beq     LAAC18
        rsb     r9, lr, #0x20
        mov     r2, r12, lsr r9
        mov     r0, r0, lsr r9
        orr     r2, r2, r4, lsl lr
        orr     r12, r0, r12, lsl lr
LAAC18:
        add     lr, r1, lr
        sub     r0, lr, #0x3C
        cmp     r0, #0x20
        add     r4, lr, #0x13
        bcs     LAAC19
        rsb     r4, r4, #0x6F
        mov     lr, r2, lsl r4
        orr     r12, lr, r12, lsr r0
        mov     r0, r2, asr r0
        b       LAAC20
LAAC19:
        cmp     r0, #0x40
        movcs   lr, #0x1F
        subcc   lr, lr, #0x5C
        mov     r12, r2, asr lr
        mov     r0, r2, asr #31
LAAC20:
        ldr     lr, [pc, #0xBF4]
        ldr     r2, [pc, #0xBF4]
        subs    r12, lr, r12
        sbc     r0, r2, r0
        tst     r0, #1, 2
        mov     r2, #0x4F
        bne     LAAC23
        cmp     r0, #0
        bne     LAAC21
        cmp     r12, #0
        moveq   r2, #0
        beq     LAAC22
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r2, r0, #0x1F
        mov     r0, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LAAC22
LAAC21:
        clz     r2, r0
        sub     r2, r2, #1
        rsb     lr, r2, #0x20
        mov     lr, r12, lsr lr
        orr     r0, lr, r0, lsl r2
        mov     r12, r12, lsl r2
LAAC22:
        add     r2, r2, #0x4F
LAAC23:
        umull   lr, r11, r12, r8
        umull   r10, r12, r12, r7
        umull   r4, lr, r8, r0
        umull   r0, r9, r7, r0
        adds    r10, r10, r11
        adc     r12, r12, #0
        adds    lr, r0, lr
        adc     r9, r9, #0
        adds    r4, r10, r4
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r9, r9, #0
        mov     r12, r9
        cmp     r12, #0
        beq     LAAC24
        clz     r10, r12
        mov     r0, r12
        subs    r12, r10, #1
        beq     LAAC24
        rsb     r10, r12, #0x20
        mov     r9, lr, lsr r10
        mov     r4, r4, lsr r10
        orr     r9, r9, r0, lsl r12
        orr     lr, r4, lr, lsl r12
LAAC24:
        add     r2, r1, r2
        add     r12, r2, r12
        sub     r2, r12, #0x40
        sub     r0, r2, #0x4A
        cmp     r0, #0x20
        bcs     LAAC25
        rsb     r2, r2, #0x6A
        mov     r2, r9, lsl r2
        orr     lr, r2, lr, lsr r0
        mov     r0, r9, asr r0
        b       LAAC26
LAAC25:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x6A
        mov     lr, r9, asr r2
        mov     r0, r9, asr #31
LAAC26:
        ldr     r12, [pc, #0xAF8]
        ldr     r2, [pc, #0xAF8]
        subs    r12, r12, lr
        sbc     r0, r2, r0
        tst     r0, #1, 2
        mov     r2, #0x4A
        bne     LAAC29
        cmp     r0, #0
        bne     LAAC27
        cmp     r12, #0
        moveq   r2, #0
        beq     LAAC28
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r2, r0, #0x1F
        mov     r0, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LAAC28
LAAC27:
        clz     r2, r0
        sub     r2, r2, #1
        rsb     lr, r2, #0x20
        mov     lr, r12, lsr lr
        orr     r0, lr, r0, lsl r2
        mov     r12, r12, lsl r2
LAAC28:
        add     r2, r2, #0x4A
LAAC29:
        umull   lr, r11, r12, r8
        umull   r10, r12, r12, r7
        umull   r4, lr, r8, r0
        umull   r0, r9, r7, r0
        adds    r10, r10, r11
        adc     r12, r12, #0
        adds    lr, r0, lr
        adc     r9, r9, #0
        adds    r4, r10, r4
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r9, r9, #0
        mov     r12, r9
        cmp     r12, #0
        beq     LAAC30
        clz     r10, r12
        mov     r0, r12
        subs    r12, r10, #1
        beq     LAAC30
        rsb     r10, r12, #0x20
        mov     r9, lr, lsr r10
        mov     r4, r4, lsr r10
        orr     r9, r9, r0, lsl r12
        orr     lr, r4, lr, lsl r12
LAAC30:
        add     r2, r1, r2
        add     r12, r2, r12
        sub     r2, r12, #0x40
        sub     r0, r2, #0x46
        cmp     r0, #0x20
        bcs     LAAC31
        rsb     r2, r2, #0x66
        mov     r2, r9, lsl r2
        orr     lr, r2, lr, lsr r0
        mov     r0, r9, asr r0
        b       LAAC32
LAAC31:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x66
        mov     lr, r9, asr r2
        mov     r0, r9, asr #31
LAAC32:
        ldr     r12, [pc, #0x9FC]
        ldr     r2, [pc, #0x9FC]
        subs    r12, r12, lr
        sbc     r0, r2, r0
        tst     r0, #1, 2
        mov     r2, #0x46
        bne     LAAC35
        cmp     r0, #0
        bne     LAAC33
        cmp     r12, #0
        moveq   r2, #0
        beq     LAAC34
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r2, r0, #0x1F
        mov     r0, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LAAC34
LAAC33:
        clz     r2, r0
        sub     r2, r2, #1
        rsb     lr, r2, #0x20
        mov     lr, r12, lsr lr
        orr     r0, lr, r0, lsl r2
        mov     r12, r12, lsl r2
LAAC34:
        add     r2, r2, #0x46
LAAC35:
        umull   lr, r11, r12, r8
        umull   r10, r12, r12, r7
        umull   r4, lr, r8, r0
        umull   r0, r9, r7, r0
        adds    r10, r10, r11
        adc     r12, r12, #0
        adds    lr, r0, lr
        adc     r9, r9, #0
        adds    r4, r10, r4
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r9, r9, #0
        mov     r12, r9
        cmp     r12, #0
        beq     LAAC36
        clz     r10, r12
        mov     r0, r12
        subs    r12, r10, #1
        beq     LAAC36
        rsb     r10, r12, #0x20
        mov     r9, lr, lsr r10
        mov     r4, r4, lsr r10
        orr     r9, r9, r0, lsl r12
        orr     lr, r4, lr, lsl r12
LAAC36:
        add     r2, r1, r2
        add     r12, r2, r12
        sub     r2, r12, #0x40
        sub     r0, r2, #0x43
        cmp     r0, #0x20
        bcs     LAAC37
        rsb     r2, r2, #0x63
        mov     r2, r9, lsl r2
        orr     lr, r2, lr, lsr r0
        mov     r0, r9, asr r0
        b       LAAC38
LAAC37:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x63
        mov     lr, r9, asr r2
        mov     r0, r9, asr #31
LAAC38:
        ldr     r12, [pc, #0x900]
        ldr     r2, [pc, #0x900]
        subs    r12, r12, lr
        sbc     r0, r2, r0
        tst     r0, #1, 2
        mov     r2, #0x43
        bne     LAAC41
        cmp     r0, #0
        bne     LAAC39
        cmp     r12, #0
        moveq   r2, #0
        beq     LAAC40
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r2, r0, #0x1F
        mov     r0, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LAAC40
LAAC39:
        clz     r2, r0
        sub     r2, r2, #1
        rsb     lr, r2, #0x20
        mov     lr, r12, lsr lr
        orr     r0, lr, r0, lsl r2
        mov     r12, r12, lsl r2
LAAC40:
        add     r2, r2, #0x43
LAAC41:
        umull   lr, r11, r12, r8
        umull   r10, r12, r12, r7
        umull   r4, lr, r8, r0
        umull   r0, r9, r7, r0
        adds    r10, r10, r11
        adc     r12, r12, #0
        adds    lr, r0, lr
        adc     r9, r9, #0
        adds    r4, r10, r4
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r9, r9, #0
        mov     r12, r9
        cmp     r12, #0
        beq     LAAC42
        clz     r10, r12
        mov     r0, r12
        subs    r12, r10, #1
        beq     LAAC42
        rsb     r10, r12, #0x20
        mov     r9, lr, lsr r10
        mov     r4, r4, lsr r10
        orr     r9, r9, r0, lsl r12
        orr     lr, r4, lr, lsl r12
LAAC42:
        add     r2, r1, r2
        add     r12, r2, r12
        sub     r2, r12, #0x40
        sub     r0, r2, #0x40
        cmp     r0, #0x20
        bcs     LAAC43
        rsb     r2, r2, #0x60
        mov     r2, r9, lsl r2
        orr     lr, r2, lr, lsr r0
        mov     r0, r9, asr r0
        b       LAAC44
LAAC43:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x60
        mov     lr, r9, asr r2
        mov     r0, r9, asr #31
LAAC44:
        ldr     r12, [pc, #0x804]
        ldr     r2, [pc, #0x804]
        subs    r12, r12, lr
        sbc     r0, r2, r0
        tst     r0, #1, 2
        mov     r2, #0x40
        bne     LAAC47
        cmp     r0, #0
        bne     LAAC45
        cmp     r12, #0
        moveq   r2, #0
        beq     LAAC46
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r2, r0, #0x1F
        mov     r0, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LAAC46
LAAC45:
        clz     r2, r0
        sub     r2, r2, #1
        rsb     lr, r2, #0x20
        mov     lr, r12, lsr lr
        orr     r0, lr, r0, lsl r2
        mov     r12, r12, lsl r2
LAAC46:
        add     r2, r2, #0x40
LAAC47:
        umull   lr, r11, r12, r8
        umull   r10, r12, r12, r7
        umull   r4, lr, r8, r0
        umull   r0, r9, r7, r0
        adds    r10, r10, r11
        adc     r12, r12, #0
        adds    lr, r0, lr
        adc     r9, r9, #0
        adds    r4, r10, r4
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r9, r9, #0
        mov     r12, r9
        cmp     r12, #0
        beq     LAAC48
        clz     r10, r12
        mov     r0, r12
        subs    r12, r10, #1
        beq     LAAC48
        rsb     r10, r12, #0x20
        mov     r9, lr, lsr r10
        mov     r4, r4, lsr r10
        orr     r9, r9, r0, lsl r12
        orr     lr, r4, lr, lsl r12
LAAC48:
        add     r2, r1, r2
        add     r12, r2, r12
        sub     r2, r12, #0x40
        sub     r0, r2, #0x3E
        cmp     r0, #0x20
        bcs     LAAC49
        rsb     r2, r2, #0x5E
        mov     r2, r9, lsl r2
        orr     lr, r2, lr, lsr r0
        mov     r0, r9, asr r0
        b       LAAC50
LAAC49:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x5E
        mov     lr, r9, asr r2
        mov     r0, r9, asr #31
LAAC50:
        ldr     r12, [pc, #0x708]
        ldr     r2, [pc, #0x708]
        subs    r12, r12, lr
        sbc     r0, r2, r0
        tst     r0, #1, 2
        mov     r2, #0x3E
        bne     LAAC53
        cmp     r0, #0
        bne     LAAC51
        cmp     r12, #0
        moveq   r2, #0
        beq     LAAC52
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r2, r0, #0x1F
        mov     r0, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LAAC52
LAAC51:
        clz     r2, r0
        sub     r2, r2, #1
        rsb     lr, r2, #0x20
        mov     lr, r12, lsr lr
        orr     r0, lr, r0, lsl r2
        mov     r12, r12, lsl r2
LAAC52:
        add     r2, r2, #0x3E
LAAC53:
        umull   lr, r11, r12, r8
        umull   r10, r12, r12, r7
        umull   r4, lr, r8, r0
        umull   r0, r9, r7, r0
        adds    r10, r10, r11
        adc     r12, r12, #0
        adds    lr, r0, lr
        adc     r9, r9, #0
        adds    r4, r10, r4
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r9, r9, #0
        mov     r12, r9
        cmp     r12, #0
        beq     LAAC54
        clz     r10, r12
        mov     r0, r12
        subs    r12, r10, #1
        beq     LAAC54
        rsb     r10, r12, #0x20
        mov     r9, lr, lsr r10
        mov     r4, r4, lsr r10
        orr     r9, r9, r0, lsl r12
        orr     lr, r4, lr, lsl r12
LAAC54:
        add     r2, r1, r2
        add     r12, r2, r12
        sub     r2, r12, #0x40
        sub     r0, r2, #0x3D
        cmp     r0, #0x20
        bcs     LAAC55
        rsb     r2, r2, #0x5D
        mov     r2, r9, lsl r2
        orr     lr, r2, lr, lsr r0
        mov     r0, r9, asr r0
        b       LAAC56
LAAC55:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x5D
        mov     lr, r9, asr r2
        mov     r0, r9, asr #31
LAAC56:
        ldr     r12, [pc, #0x60C]
        ldr     r2, [pc, #0x60C]
        subs    r4, r12, lr
        sbc     r12, r2, r0
        tst     r12, #1, 2
        mov     r0, #0x3D
        bne     LAAC59
        cmp     r12, #0
        bne     LAAC57
        cmp     r4, #0
        moveq   r0, #0
        beq     LAAC58
        clz     r0, r4
        mov     r4, r4, lsl r0
        add     r0, r0, #0x1F
        mov     r12, r4, lsr #1
        mov     r4, r4, lsl #31
        b       LAAC58
LAAC57:
        clz     r0, r12
        sub     r0, r0, #1
        rsb     r2, r0, #0x20
        mov     r2, r4, lsr r2
        orr     r12, r2, r12, lsl r0
        mov     r4, r4, lsl r0
LAAC58:
        add     r0, r0, #0x3D
LAAC59:
        umull   r2, r10, r4, r8
        umull   lr, r9, r8, r12
        umull   r11, r2, r4, r7
        str     r9, [sp, #0xC]
        str     lr, [sp, #0x10]
        umull   lr, r9, r7, r12
        adds    r10, r11, r10
        ldr     r11, [sp, #0xC]
        adc     r2, r2, #0
        adds    lr, lr, r11
        ldr     r11, [sp, #0x10]
        adc     r9, r9, #0
        adds    r10, r10, r11
        adc     r2, r2, #0
        adds    lr, r2, lr
        adc     r9, r9, #0
        tst     r12, r12
        bmi     LAAC105
LAAC60:
        tst     r7, r7
        bmi     LAAC104
LAAC61:
        eors    r2, r9, r9, asr #31
        beq     LAAC62
        clz     r2, r2
        subs    r2, r2, #1
        beq     LAAC62
        rsb     r12, r2, #0x20
        mov     r10, r10, lsr r12
        mov     r12, lr, lsr r12
        orr     r9, r12, r9, lsl r2
        orr     lr, r10, lr, lsl r2
LAAC62:
        umull   r12, r4, r6, lr
        add     r0, r1, r0
        add     r1, r0, r2
        umull   r2, r0, r6, r9
        sub     r1, r1, #0x40
        adds    r2, r2, r4
        adc     r0, r0, #0
        tst     r9, r9
        movpl   r4, #0
        bmi     LAAC103
LAAC63:
        cmp     r6, #0
        blt     LAAC102
LAAC64:
        eors    lr, r0, r0, asr #31
        beq     LAAC65
        clz     lr, lr
        subs    lr, lr, #1
        beq     LAAC65
        rsb     r7, lr, #0x20
        mov     r12, r12, lsr r7
        mov     r7, r2, lsr r7
        orr     r0, r7, r0, lsl lr
        orr     r2, r12, r2, lsl lr
LAAC65:
        add     r1, r3, r1
        add     lr, r1, lr
        sub     r1, lr, #0x40
        sub     r1, r1, r3
        cmp     r1, #0x20
        bcs     LAAC66
        rsb     r12, r1, #0x20
        mov     r12, r0, lsl r12
        orr     r2, r12, r2, lsr r1
        mov     r1, r0, asr r1
        b       LAAC67
LAAC66:
        cmp     r1, #0x40
        movcs   r1, #0x1F
        subcc   r1, r1, #0x20
        mov     r2, r0, asr r1
        mov     r1, r0, asr #31
LAAC67:
        subs    r4, r4, r2
        sbc     r6, r6, r1
        tst     r6, #1, 2
        bne     LAAC70
        cmp     r6, #0
        bne     LAAC68
        cmp     r4, #0
        moveq   r0, #0
        beq     LAAC69
        clz     r0, r4
        mov     r4, r4, lsl r0
        add     r0, r0, #0x1F
        mov     r6, r4, lsr #1
        mov     r4, r4, lsl #31
        b       LAAC69
LAAC68:
        clz     r0, r6
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r4, lsr r1
        orr     r6, r1, r6, lsl r0
        mov     r4, r4, lsl r0
LAAC69:
        add     r3, r3, r0
LAAC70:
        ldr     r0, [sp, #0x18]
        mvn     r2, #0xFF, 8
        and     r2, r0, r2
        mov     r0, r0, asr #23
        mov     r2, r2, lsl #7
        orr     r2, r2, #1, 2
        umull   r6, r12, r2, r6
        str     r2, [sp, #0x14]
        umull   r4, r2, r2, r4
        and     r1, r0, #0xFF
        adds    r2, r6, r2
        adc     r0, r12, #0
        cmp     r0, #0
        rsb     lr, r1, #0xBD
        mov     r12, r0
        beq     LAAC71
        clz     r1, r0
        subs    r12, r1, #1
        beq     LAAC71
        rsb     r1, r12, #0x20
        mov     r4, r4, lsr r1
        mov     r1, r2, lsr r1
        orr     r0, r1, r0, lsl r12
        orr     r2, r4, r2, lsl r12
LAAC71:
        ldr     r6, [sp, #4]
        add     r3, lr, r3
        add     r12, r3, r12
        umull   r4, r1, r2, r6
        umull   r2, r4, r2, r5
        umull   r3, lr, r6, r0
        umull   r6, r5, r0, r5
        sub     r0, r12, #0x40
        adds    r1, r2, r1
        adc     r4, r4, #0
        adds    lr, r6, lr
        adc     r5, r5, #0
        adds    r3, r1, r3
        adc     r4, r4, #0
        adds    lr, r4, lr
        adc     r2, r5, #0
        mov     r1, r2
        cmp     r1, #0
        beq     LAAC72
        clz     r12, r1
        mov     r3, r1
        subs    r1, r12, #1
        beq     LAAC72
        rsb     r2, r1, #0x20
        mov     r2, lr, lsr r2
        orr     r2, r2, r3, lsl r1
LAAC72:
        ldr     r3, [sp, #8]
        add     r0, r3, r0
        add     r1, r0, r1
        sub     r0, r1, #0x40
        mvn     r1, #2, 2
        bics    r1, r2, r1
        sub     r0, r0, #0x20
        rsbne   r2, r2, #0
        ldr     r3, [pc, #0x360]
        rsb     r0, r0, #0x3D
        add     r3, r3, r2, lsr #25
        ldrsb   r12, [r3, #-0x20]
        mov     r3, r2, asr #7
        add     r3, r3, #1
        rsb     r3, r3, #0
        mul     lr, r3, r12
        mov     r2, r2, lsl #2
        mvn     r3, #0
        add     r5, lr, #1, 2
        smull   r4, lr, r12, r5
        mov     r5, r5, lsr #31
        rsb     r12, r5, r12, lsl #25
        mov     r4, r4, lsr #5
        orr     lr, r4, lr, lsl #27
        add     r12, r12, lr
        umull   r4, lr, r2, r12
        rsb     r4, r12, r3
        subs    r4, r4, lr
        umull   lr, r4, r12, r4
        add     r12, r12, r4
        umull   r4, lr, r2, r12
        rsb     r3, r12, r3
        subs    r3, r3, lr
        umull   r3, lr, r12, r3
        add     lr, r12, lr
        cmp     r2, #0
        mov     lr, lr, lsr #1
        add     r5, lr, #1
        subeq   r0, r0, #1
        moveq   r5, #1, 2
        cmp     r1, #0
        streq   r5, [sp, #0x14]
        rsbne   r5, r5, #0
        strne   r5, [sp, #0x14]
        ldr     r1, [sp]
        eor     r1, r1, #1
        b       LAAC74
LAAC73:
        ldr     r0, [sp, #8]
        mov     r1, #0
        str     r5, [sp, #0x14]
        sub     r0, r0, #0x20
LAAC74:
        eor     r2, r5, r5, asr #31
        ldr     r3, [sp, #0x14]
        sub     r5, r2, r5, asr #31
        clz     r12, r5
        add     r0, r0, r12
        cmp     r3, #0
        rsb     r2, r0, #0x9D
        mvneq   r2, #0
        mvn     r0, #2, 2
        cmp     r2, #0xFD
        bic     r0, r3, r0
        bhi     LAAC75
        sub     r12, r12, #1
        mov     r12, r5, lsl r12
        add     r3, r12, #0x40
        mov     r2, r2, lsl #23
        add     r3, r2, r3, lsr #7
        orr     r0, r3, r0
        b       LAAC76
LAAC75:
        cmp     r2, #0
        ble     LAAC107
        mov     r2, #0xFE, 10
        orr     r2, r2, #3, 2
        sub     r2, r2, #2, 2
        orr     r2, r0, r2
        orr     r0, r2, r0
LAAC76:
        orr     r0, r0, r1, lsl #31
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC77:
        cmp     r2, #0x7F
        eoreq   r3, r3, #2, 10
        cmp     r3, #0
        rsb     r2, r2, #0x96
        bne     LAAC78
        tst     r0, #2, 2
        subeq   r2, r6, #0x7F, 16
        bne     LAAC91
LAAC78:
        str     r3, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        eor     lr, r3, r3, asr #31
        clz     lr, lr
        sub     lr, lr, #1
        tst     r0, #2, 2
        add     r0, r2, lr
        mov     r7, r3, lsl lr
        beq     LAAC79
        cmp     r0, #0x3C
        mov     r2, #0x3C
        movlt   r2, r0
        sub     r2, r2, #0x1E
        mov     r2, r7, asr r2
        rsb     r0, r2, #1, 2
        str     r0, [sp, #0x14]
        eor     r3, r0, r0, asr #31
        clz     r3, r3
        sub     r3, r3, #1
        mov     r7, r0, lsl r3
        add     r0, r3, #0x1E
LAAC79:
        cmp     r0, #0x20
        suble   r2, r0, #2
        movle   r12, r7, asr r2
        cmp     r12, #1
        beq     LAAC123
LAAC80:
        ldr     r2, [pc, #0x1BC]
        str     r7, [sp, #0x14]
        add     r4, r0, #0x20
        ldr     r3, [r2, +r12, lsl #6]
        add     r12, r2, r12, lsl #6
        ldr     r2, [r12, #4]
        mov     r0, r3, asr #24
        mov     r6, #7
        add     r12, r12, #8
        mov     r3, r3, lsl #8
LAAC81:
        umull   r5, lr, r7, r2
        umull   r8, r9, r7, r3
        adds    r5, r5, r9
        adc     lr, lr, #0
        tst     r2, r2
        bmi     LAAC122
LAAC82:
        cmp     r7, #0
        blt     LAAC121
LAAC83:
        eors    r2, lr, lr, asr #31
        beq     LAAC84
        clz     r2, r2
        subs    r2, r2, #2
        beq     LAAC84
        rsb     r3, r2, #0x20
        mov     r8, r8, lsr r3
        mov     r3, r5, lsr r3
        orr     lr, r3, lr, lsl r2
        orr     r5, r8, r5, lsl r2
LAAC84:
        ldr     r7, [r12]
        ldr     r3, [r12, #4]
        add     r0, r4, r0
        add     r2, r0, r2
        sub     r0, r2, #0x40
        mov     r9, r7, asr #24
        subs    r8, r0, r9
        add     r12, r12, #8
        mov     r2, r7, lsl #8
        bmi     LAAC85
        mov     r0, r9
        mov     r7, r2
        mov     r2, r3
        b       LAAC86
LAAC85:
        mov     r7, r5
        mov     r5, r2
        mov     r2, lr
        rsb     r8, r8, #0
        mov     lr, r3
LAAC86:
        cmp     r8, #0x20
        bcs     LAAC87
        rsb     r3, r8, #0x20
        mov     r3, lr, lsl r3
        orr     r5, r3, r5, lsr r8
        mov     r8, lr, asr r8
        b       LAAC88
LAAC87:
        cmp     r8, #0x40
        movcs   r8, #0x1F
        subcc   r8, r8, #0x20
        mov     r5, lr, asr r8
        mov     r8, lr, asr #31
LAAC88:
        adds    r3, r7, r5
        sub     r6, r6, #1
        adc     r2, r2, r8
        cmp     r6, #0
        ldrgt   r7, [sp, #0x14]
        bgt     LAAC81
        b       LAAC110
LAAC89:
        sub     r2, r2, #0x7F
        cmp     r2, #0x17
        bcs     LAAC90
        mov     r1, #2, 10
        mov     r1, r1, asr r2
        sub     r1, r1, #1
        tst     r0, r1
        beq     LAAC91
        rsb     r2, r2, #0x17
        mov     r2, r3, asr r2
        eor     r0, r2, #1
        mov     r0, r0, lsl #31
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC90:
        mov     r1, r0, lsl #1
        cmp     r1, #0xFF, 8
        bls     LAAC91
        orr     r0, r0, #1, 10
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC91:
        add     lr, lr, #0xE7
        sub     r12, r12, #1, 10
        b       LAAC101
LAAC92:
        and     r3, r0, r1
        sub     r4, r1, #2, 2
        cmp     r4, r3
        beq     LAAC124
        b       LAAC99
        .long   0x420c2910
        .long   LAAC_s_dwTgammafCi
        .long   0xe73c2600
        .long   0x21f9325f
        .long   0x39c130ea
        .long   0x3a84931a
        .long   0x56722a20
        .long   0x26e8e33f
        .long   0x8c0f5690
        .long   0x26702d54
        .long   0xe6a14c58
        .long   0x358d00b9
        .long   0x41b6cde8
        .long   0x30d51c8e
        .long   0x5788d916
        .long   0x33f39680
        .long   0xa60fa687
        .long   0x34a34cc4
        .long   LAAC_rcp_table
        .long   LAAC_s_dwTgammafCi_1_2
        .long   0x762d8635
LAAC93:
        mov     r3, r0, lsl #1
        cmp     r3, #1, 10
        ble     LAAC98
        mov     r3, r0, asr #23
        mvn     r12, #0xFF, 8
        ands    r3, r3, #0xFF
        and     r0, r0, r12
        beq     LAAC126
        mov     r0, r0, lsl #7
        orr     lr, r0, #1, 2
        rsb     r3, r3, #0x9D
LAAC94:
        bics    r12, lr, r2
        rsbne   lr, lr, #0
        ldr     r0, [pc, #-0x48]
        mov     r4, lr, asr #7
        rsb     r3, r3, #0x3D
        add     r0, r0, lr, lsr #25
        ldrsb   r0, [r0, #-0x20]
        add     r4, r4, #1
        rsb     r4, r4, #0
        mul     r5, r4, r0
        mov     lr, lr, lsl #2
        mvn     r4, #0
        add     r7, r5, #1, 2
        smull   r6, r5, r0, r7
        mov     r7, r7, lsr #31
        rsb     r0, r7, r0, lsl #25
        mov     r6, r6, lsr #5
        orr     r5, r6, r5, lsl #27
        add     r0, r0, r5
        umull   r6, r5, lr, r0
        rsb     r6, r0, r4
        subs    r6, r6, r5
        umull   r5, r6, r0, r6
        add     r0, r0, r6
        umull   r6, r5, lr, r0
        rsb     r6, r0, r4
        subs    r6, r6, r5
        umull   r5, r6, r0, r6
        add     r6, r0, r6
        cmp     lr, #0
        mov     r6, r6, lsr #1
        add     lr, r6, #1
        subeq   r3, r3, #1
        moveq   lr, #1, 2
        cmp     r12, #0
        streq   lr, [sp, #0x14]
        rsbne   lr, lr, #0
        strne   lr, [sp, #0x14]
        eor     r12, lr, lr, asr #31
        ldr     r0, [sp, #0x14]
        sub     r12, r12, lr, asr #31
        clz     lr, r12
        add     r3, r3, lr
        cmp     r0, #0
        rsb     r3, r3, #0x9D
        moveq   r3, r4
        cmp     r3, #0xFD
        bic     r0, r0, r2
        bhi     LAAC95
        sub     lr, lr, #1
        mov     lr, r12, lsl lr
        add     r1, lr, #0x40
        mov     r3, r3, lsl #23
        add     r1, r3, r1, lsr #7
        orr     r0, r1, r0
        b       LAAC96
LAAC95:
        cmp     r3, #0
        ble     LAAC125
        sub     r1, r1, #2, 2
        orr     r1, r0, r1
        orr     r0, r1, r0
LAAC96:
        ldr     r1, [sp, #0x18]
        bic     r2, r1, r2
        orr     r0, r0, r2
LAAC97:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC98:
        cmp     r3, #0
        addeq   lr, lr, #0xE7
        beq     LAAC100
LAAC99:
        add     lr, lr, #0xE6
LAAC100:
        bic     r2, r0, r2
        sub     r1, r1, #2, 2
        orr     r12, r2, r1
LAAC101:
        add     r0, sp, #0x18
        add     r2, sp, #0x14
        add     r1, sp, #0x18
        str     r12, [sp, #0x14]
        mov     r3, lr
        bl      __libm_error_support
        ldr     r0, [sp, #0x14]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC102:
        subs    r2, r2, lr
        sbc     r0, r0, r9
        b       LAAC64
LAAC103:
        subs    r2, r2, #0
        sbc     r0, r0, r6
        mov     r4, #0
        b       LAAC63
LAAC104:
        subs    lr, lr, r4
        sbc     r9, r9, r12
        b       LAAC61
LAAC105:
        subs    lr, lr, r8
        sbc     r9, r9, r7
        b       LAAC60
LAAC106:
        mov     r6, r6, asr #1
        rsb     r1, r6, #1, 2
        eor     r0, r1, r1, asr #31
        clz     r0, r0
        sub     r2, r0, #1
        mov     r6, r1, lsl r2
        add     r3, r0, #0x3D
        b       LAAC16
LAAC107:
        rsb     r2, r2, #7
        mov     r12, r5, lsl r12
        mov     r2, r12, lsr r2
        add     r2, r2, #1
        orr     r0, r0, r2, asr #1
        b       LAAC76
LAAC108:
        subs    lr, lr, r7
        sbc     r1, r1, r5
        b       LAAC3
LAAC109:
        subs    lr, lr, #0
        sbc     r1, r1, r6
        b       LAAC2
LAAC110:
        ldr     r5, [sp, #0x18]
        mov     r7, #0
        mov     r4, r7
        mov     r12, r5, asr #23
        cmp     r12, #0x7F
        bge     LAAC115
        mvn     lr, #0xFF, 8
        and     lr, r5, lr
        tst     r12, #2, 2
        mov     r5, lr, lsl #7
        and     lr, r12, #0xFF
        orr     r5, r5, #1, 2
        rsb     r12, lr, #0xBD
        beq     LAAC113
        cmp     lr, #0x7F
        mov     r6, r5
        str     r5, [sp, #0x14]
        mov     lr, r12
        movne   r4, #1
        beq     LAAC118
LAAC111:
        sub     lr, lr, #0x3E
        mov     lr, r6, asr lr
        rsb     r6, lr, #1, 2
        umull   r7, lr, r7, r6
        umull   r6, r5, r5, r6
        adds    lr, r6, lr
        adc     r5, r5, #0
        cmp     r5, #0
        mov     r6, r5
        beq     LAAC112
        clz     r6, r5
        subs    r6, r6, #1
        beq     LAAC112
        rsb     r7, r6, #0x20
        mov     r7, lr, lsr r7
        orr     r5, r7, r5, lsl r6
LAAC112:
        add     r6, r12, r6
        sub     r12, r6, #2
LAAC113:
        mvn     lr, #2, 2
        bics    lr, r5, lr
        sub     r12, r12, #0x20
        rsbne   r5, r5, #0
        ldr     r6, [pc, #-0x2B4]
        rsb     r12, r12, #0x3D
        add     r6, r6, r5, lsr #25
        ldrsb   r7, [r6, #-0x20]
        mov     r6, r5, asr #7
        add     r6, r6, #1
        rsb     r6, r6, #0
        mul     r8, r6, r7
        mov     r5, r5, lsl #2
        mvn     r6, #0
        add     r10, r8, #1, 2
        smull   r9, r8, r7, r10
        mov     r10, r10, lsr #31
        rsb     r7, r10, r7, lsl #25
        mov     r9, r9, lsr #5
        orr     r8, r9, r8, lsl #27
        add     r7, r7, r8
        umull   r9, r8, r5, r7
        rsb     r9, r7, r6
        subs    r9, r9, r8
        umull   r8, r9, r7, r9
        add     r7, r7, r9
        umull   r9, r8, r5, r7
        rsb     r6, r7, r6
        subs    r6, r6, r8
        umull   r6, r8, r7, r6
        add     r8, r7, r8
        cmp     r5, #0
        mov     r8, r8, lsr #1
        add     r5, r8, #1
        subeq   r12, r12, #1
        moveq   r5, #1, 2
        cmp     lr, #0
        rsbne   r5, r5, #0
        umull   lr, r3, r5, r3
        umull   lr, r2, r5, r2
        add     r12, r12, #0x20
        adds    lr, lr, r3
        adc     r2, r2, #0
        cmp     r2, #0
        mov     r3, r2
        beq     LAAC114
        clz     r3, r2
        subs    r3, r3, #1
        str     r5, [sp, #0x14]
        beq     LAAC114
        rsb     r5, r3, #0x20
        mov     r5, lr, lsr r5
        orr     r2, r5, r2, lsl r3
LAAC114:
        add     r0, r12, r0
        add     r3, r0, r3
        sub     r0, r3, #0x40
LAAC115:
        eor     r3, r2, r2, asr #31
        sub     r0, r0, #0x20
        sub     r3, r3, r2, asr #31
        clz     r12, r3
        add     r0, r0, r12
        cmp     r2, #0
        str     r2, [sp, #0x14]
        rsb     r0, r0, #0x9D
        mvneq   r0, #0
        mvn     lr, #2, 2
        cmp     r0, #0xFD
        bic     r2, r2, lr
        bhi     LAAC116
        sub     r12, r12, #1
        mov     r12, r3, lsl r12
        add     r1, r12, #0x40
        mov     r0, r0, lsl #23
        add     r1, r0, r1, lsr #7
        orr     r2, r1, r2
        b       LAAC117
LAAC116:
        cmp     r0, #0
        ble     LAAC120
        sub     r1, r1, #2, 2
        orr     r0, r2, r1
        orr     r2, r0, r2
LAAC117:
        orr     r0, r2, r4, lsl #31
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC118:
        sub     r6, r5, #1, 2
        umull   r7, r5, r5, r6
        cmp     r5, #0
        mov     r8, r5
        beq     LAAC119
        clz     r8, r5
        sub     r8, r8, #1
        rsb     r9, r8, #0x20
        mov     r9, r7, lsr r9
        orr     r5, r9, r5, lsl r8
        mov     r7, r7, lsl r8
LAAC119:
        add     r12, r8, r12, lsl #1
        sub     r12, r12, #0x40
        b       LAAC111
LAAC120:
        rsb     r0, r0, #7
        mov     r12, r3, lsl r12
        mov     r0, r12, lsr r0
        add     r0, r0, #1
        orr     r2, r2, r0, asr #1
        b       LAAC117
LAAC121:
        subs    r5, r5, r3
        sbc     lr, lr, r2
        b       LAAC83
LAAC122:
        subs    r5, r5, #0
        sbc     lr, lr, r7
        b       LAAC82
LAAC123:
        ldr     r2, [pc, #-0x454]
        sub     r7, r7, r2
        eor     r2, r7, r7, asr #31
        clz     r2, r2
        sub     r2, r2, #1
        add     r0, r0, r2
        mov     r7, r7, lsl r2
        b       LAAC80
LAAC124:
        sub     r12, r12, #2, 10
        mvn     r1, r12
        tst     r0, r1
        beq     LAAC97
        orr     r0, r0, #1, 10
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAAC125:
        rsb     r3, r3, #7
        mov     lr, r12, lsl lr
        mov     r3, lr, lsr r3
        add     r1, r3, #1
        orr     r0, r0, r1, asr #1
        b       LAAC96
LAAC126:
        clz     r3, r0
        sub     r12, r3, #1
        str     r0, [sp, #0x14]
        mov     lr, r0, lsl r12
        add     r3, r3, #0x94
        b       LAAC94


        .data
        .align  4


LAAC_rcp_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41
LAAC_s_dwTgammafCi_1_2:
        .byte   0x30,0xCF,0xDB,0x3F,0x6E,0xD3,0xDE,0xCC,0x1E,0xA4,0x50,0x3E,0xDD,0xFD,0xDF,0x32
        .byte   0x66,0xE9,0x1B,0x3E,0x11,0xBE,0x91,0xC3,0x76,0x94,0x21,0x3E,0x40,0xAF,0x90,0x3E
        .byte   0x90,0x6C,0x97,0x3E,0x4D,0xFE,0xEF,0xC5,0x38,0x22,0x89,0x3E,0xA2,0x91,0x4C,0x3F
        .byte   0xB8,0x4A,0x57,0x3E,0x65,0xE6,0x0E,0xDB,0x3C,0x41,0xD2,0x3E,0xFF,0xFF,0xFF,0x3F
        .byte   0x28,0xD9,0xB2,0x41,0x37,0xB9,0xBD,0xD7,0x22,0xCD,0xE6,0x42,0x29,0xEA,0x46,0x3E
        .byte   0x84,0x22,0x57,0x41,0x8B,0x0F,0x30,0xD0,0xC6,0xA2,0xA8,0x40,0x34,0x40,0x2D,0x29
        .byte   0x8E,0xDE,0xEB,0x40,0x1D,0x43,0x8A,0xDE,0x3E,0xDE,0x77,0x3F,0xCB,0xA8,0xD8,0x36
        .byte   0x2A,0x5A,0xF7,0x5E,0xC4,0xB8,0xF2,0xC2,0x44,0x35,0x47,0x3E,0x05,0xB9,0xAD,0x38
        .byte   0x32,0x4F,0x0D,0x43,0x5D,0xE9,0x19,0xD7,0xF6,0xD8,0x02,0x41,0xC7,0x07,0x84,0x3E
        .byte   0xAC,0x97,0x8A,0x3F,0x83,0x9C,0xC5,0xD4,0x8E,0x22,0xE1,0x3E,0x91,0x19,0x92,0x27
        .byte   0x38,0xB8,0x85,0x3E,0x04,0x7B,0x49,0xCF,0xE2,0xCE,0x64,0x3E,0xF5,0xAA,0xCA,0x3C
        .byte   0x90,0x94,0x11,0x3E,0xC4,0xD1,0x74,0xDB,0x90,0xF7,0xCF,0x3E,0x75,0xC2,0xF8,0x3F
        .byte   0x04,0x3D,0x91,0x45,0x5D,0xAF,0x72,0xD1,0xE6,0x6B,0x2E,0x42,0xA1,0x6F,0xDC,0x32
        .byte   0xD4,0xED,0x53,0x40,0xF1,0x31,0x1E,0xD2,0x7C,0xEB,0x22,0x3F,0x29,0x5B,0x4C,0x36
        .byte   0x8A,0x7E,0xEA,0x3E,0x77,0x6A,0x7B,0xD8,0x4A,0xF9,0x2E,0x3E,0x15,0x50,0xAD,0x38
        .byte   0xD6,0x56,0x9B,0x3E,0x40,0xA2,0x7C,0xDC,0x44,0x40,0x96,0x3E,0xC8,0x3C,0xDC,0x3F
LAAC_s_dwTgammafCi:
        .byte   0xED,0x32,0xE8,0x4E,0x02,0xB1,0x35,0x24,0x29,0x07,0x2E,0x4B,0xA2,0x9D,0xF4,0xDC
        .byte   0x8E,0xE6,0x73,0x49,0x70,0xEF,0x78,0x25,0xA7,0x12,0xA2,0x48,0xDD,0x39,0x4C,0xCF
        .byte   0x60,0x0B,0xB8,0x46,0x4A,0x57,0xAB,0x20,0xD3,0x21,0x35,0x46,0xEC,0xFF,0x0F,0xD2
        .byte   0x13,0xD7,0x6F,0x44,0x9D,0xF3,0x9F,0x2D,0xAE,0xD8,0x6C,0x49,0x01,0xF1,0x6C,0xDD
        .byte   0x59,0xF7,0xE4,0x41,0xBE,0xE8,0x03,0x26,0xC0,0x4E,0x8F,0x41,0x61,0x74,0xC4,0x29
        .byte   0x10,0x62,0xF3,0x3F,0x13,0x2F,0xB7,0x34,0x48,0xDE,0x4E,0x3F,0x0E,0xCC,0x1D,0x36
        .byte   0x30,0xFB,0xFF,0x3E,0xFF,0xFF,0xFF,0x3F,0x96,0xA9,0xA1,0x3E,0x23,0xB7,0xED,0x2D
        .byte   0x78,0x03,0x42,0x3E,0xAB,0x56,0xDF,0xD1,0x77,0x8C,0x27,0x3B,0x17,0x36,0x90,0x3B
        .byte   0x54,0xA5,0x14,0x3A,0x1C,0xB3,0x02,0x3C,0x43,0xD5,0xB7,0x37,0xEA,0x86,0x86,0x23
        .byte   0xFB,0x59,0x4E,0x36,0x6F,0xC8,0xF9,0x39,0xD3,0xB7,0x33,0x34,0xC4,0x4D,0xF2,0x2B
        .byte   0x62,0x58,0x38,0x33,0xB8,0x98,0xC3,0x39,0x9C,0xD4,0x85,0x31,0x5B,0x30,0x44,0x20
        .byte   0xEF,0xCA,0x8D,0x31,0x9C,0x95,0xE8,0x3A,0xE1,0x50,0xB0,0x30,0xB6,0xC9,0x4D,0x29
        .byte   0x2F,0x90,0xA7,0x30,0x42,0xD5,0xAE,0x27,0xDD,0x0C,0x00,0x31,0x00,0x00,0x60,0x27
        .byte   0xAD,0xDA,0x2B,0x1E,0x6F,0x6E,0x65,0x33,0xC6,0x50,0x29,0x1D,0x42,0x85,0x77,0xD5
        .byte   0x1C,0x9A,0xCB,0x1B,0x10,0xAF,0xDB,0x33,0x01,0xB3,0x93,0x1B,0x9A,0x8D,0xE6,0x2D
        .byte   0x54,0x57,0x0D,0x18,0xC3,0xC0,0xB8,0x20,0x14,0x09,0x1A,0x17,0x14,0x57,0xCE,0x28
        .byte   0x7B,0xE6,0xE3,0x16,0x47,0xD4,0xAE,0x32,0x8F,0xF6,0xF0,0x15,0x38,0x8C,0x3A,0x35
        .byte   0x22,0x6F,0x24,0x14,0x42,0x48,0x09,0x2F,0x7D,0x20,0x61,0x13,0xB1,0xB4,0x7D,0x21
        .byte   0x01,0x9E,0x8C,0x13,0xA1,0x90,0x0C,0x24,0x99,0x93,0xC0,0x14,0x45,0xC1,0x28,0x34
        .byte   0xE3,0xBE,0x00,0x15,0xEB,0xEE,0x0E,0x26,0x85,0x8D,0xCF,0xF9,0xA2,0xB6,0x3A,0x25
        .byte   0xCA,0xE2,0xD4,0xF8,0x67,0x26,0xAF,0xDA,0x29,0xD4,0xBF,0xF6,0x08,0xFD,0xA1,0x21
        .byte   0xE0,0x82,0xD4,0xF8,0xD3,0x6D,0xA9,0x2B,0x3F,0x66,0xA6,0xF5,0x10,0xFB,0x63,0x38
        .byte   0x13,0x6D,0x0C,0xF4,0x4D,0xB8,0x39,0x39,0x58,0xFB,0x8C,0xF2,0xE8,0x32,0x30,0x20
        .byte   0xDD,0xC9,0xFA,0xF2,0x0B,0x2E,0xA0,0x3B,0xDF,0x62,0xC3,0xF1,0x82,0xB2,0x79,0x2E
        .byte   0xEC,0x23,0xFA,0xF1,0x60,0x0F,0x27,0x3A,0x60,0x0B,0x8E,0xF1,0x69,0xF7,0xCB,0x36
        .byte   0xA0,0x77,0xF7,0xF1,0xA2,0xE8,0x90,0x22,0xF0,0x30,0xF5,0xF3,0x6B,0x86,0xCB,0x2B
        .byte   0xD0,0xBB,0x1B,0xD2,0x36,0x95,0xE9,0x3F,0x5C,0xD1,0xA2,0xD0,0x7E,0x23,0x70,0xDC
        .byte   0xBA,0x58,0x4B,0xCF,0xB7,0x4F,0x85,0x36,0xF7,0xCE,0xFD,0xD7,0x50,0x87,0x09,0x32
        .byte   0xE5,0x62,0x71,0xCD,0x22,0xB9,0x79,0x22,0x69,0x34,0x76,0xCD,0x17,0xDE,0x53,0x3A
        .byte   0x5D,0x91,0x24,0xCC,0x11,0xA4,0x3F,0x3E,0xB0,0x76,0x16,0xCB,0xCA,0xF5,0xEA,0x34
        .byte   0xC7,0xBD,0x35,0xCA,0xFE,0x3D,0xFE,0x25,0xC2,0xCD,0x1F,0xCA,0xD7,0x57,0xB3,0x2B
        .byte   0xAC,0xAA,0x40,0xCA,0x33,0xDD,0xCC,0x25,0x18,0x1B,0x8B,0xCB,0x98,0x9C,0xB5,0x2B
        .byte   0x90,0xDF,0x68,0xCD,0x15,0x5A,0xAD,0x32,0xAC,0x69,0x5B,0xA7,0xE4,0x73,0x6C,0x28
        .byte   0x88,0xF0,0x5C,0xA6,0x62,0xB6,0xE3,0xCF,0xFC,0x73,0x5E,0xA4,0xCF,0x7F,0x5A,0x21
        .byte   0x81,0x3A,0x8F,0xA7,0x8A,0xED,0x96,0xCA,0xA4,0x6B,0x51,0xA3,0x02,0xAB,0x60,0x22
        .byte   0x9A,0xC8,0x13,0xA3,0xF7,0xF8,0x15,0x31,0x16,0x0C,0x38,0xA2,0xFE,0x2E,0x10,0x33
        .byte   0xD8,0xA8,0xCB,0xA1,0xBC,0x4D,0xAA,0x28,0x69,0xF7,0xAA,0xA1,0xD4,0x7B,0x01,0x37
        .byte   0x03,0xCC,0xD3,0xA1,0xBC,0xDC,0x81,0x3B,0x0E,0x9B,0x45,0xA1,0x1F,0x50,0x61,0x30
        .byte   0x30,0xEF,0xD4,0xA2,0x61,0x8B,0x8A,0x34,0x98,0xE9,0x52,0xA4,0x3E,0xC3,0x2A,0x39
LAAC_sgl_recip_tbl:
        .byte   0xC0,0xFF,0xC1,0xFF,0xC2,0xFF,0xC3,0xFF,0xC4,0xFF,0xC5,0xFF,0xC6,0xFF,0xC7,0xFF
        .byte   0xC8,0xFF,0xC8,0xFF,0xC9,0xFF,0xCA,0xFF,0xCA,0xFF,0xCB,0xFF,0xCC,0xFF,0xCC,0xFF
        .byte   0xCD,0xFF,0xCE,0xFF,0xCE,0xFF,0xCF,0xFF,0xD0,0xFF,0xD0,0xFF,0xD1,0xFF,0xD1,0xFF
        .byte   0xD2,0xFF,0xD2,0xFF,0xD3,0xFF,0xD3,0xFF,0xD4,0xFF,0xD4,0xFF,0xD5,0xFF,0xD5,0xFF
        .byte   0xD6,0xFF,0xD6,0xFF,0xD6,0xFF,0xD7,0xFF,0xD7,0xFF,0xD8,0xFF,0xD8,0xFF,0xD8,0xFF
        .byte   0xD9,0xFF,0xD9,0xFF,0xDA,0xFF,0xDA,0xFF,0xDA,0xFF,0xDB,0xFF,0xDB,0xFF,0xDB,0xFF
        .byte   0xDC,0xFF,0xDC,0xFF,0xDC,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDD,0xFF,0xDE,0xFF
        .byte   0xDE,0xFF,0xDE,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xDF,0xFF,0xE0,0xFF,0xE0,0xFF
LAAC_log_coeffs_25:
        .byte   0x00,0x00,0x00,0xC0,0xAB,0xAA,0xAA,0x2A,0x00,0x00,0x00,0xE0,0x9A,0x99,0x99,0x19
        .byte   0xAB,0xAA,0xAA,0xEA,0x92,0x24,0x49,0x12,0x00,0x00,0x00,0xF0
LAAC_rsqrt_table:
        .byte   0xFE,0xFC,0xFA,0xF8,0xF6,0xF4,0xF2,0xF0,0xEE,0xED,0xEB,0xE9,0xE7,0xE6,0xE4,0xE2
        .byte   0xE1,0xDF,0xDD,0xDC,0xDA,0xD8,0xD7,0xD5,0xD4,0xD2,0xD1,0xCF,0xCE,0xCC,0xCB,0xC9
        .byte   0xC8,0xC7,0xC5,0xC4,0xC2,0xC1,0xC0,0xBE,0xBD,0xBC,0xBA,0xB9,0xB8,0xB7,0xB5,0xB4
        .byte   0xB3,0xB2,0xB0,0xAF,0xAE,0xAD,0xAC,0xAB,0xA9,0xA8,0xA7,0xA6,0xA5,0xA4,0xA3,0xA2
        .byte   0xA0,0x9F,0x9E,0x9D,0x9C,0x9B,0x9A,0x99,0x98,0x97,0x96,0x95,0x94,0x93,0x92,0x91
        .byte   0x90,0x8F,0x8E,0x8D,0x8C,0x8B,0x8B,0x8A,0x89,0x88,0x87,0x86,0x85,0x84,0x83,0x83
        .byte   0x82,0x81,0x80,0x7F,0x7E,0x7D,0x7D,0x7C,0x7B,0x7A,0x79,0x79,0x78,0x77,0x76,0x75
        .byte   0x75,0x74,0x73,0x72,0x72,0x71,0x70,0x6F,0x6F,0x6E,0x6D,0x6C,0x6C,0x6B,0x6A,0x6A
        .byte   0x68,0x67,0x65,0x64,0x63,0x61,0x60,0x5F,0x5D,0x5C,0x5B,0x5A,0x58,0x57,0x56,0x55
        .byte   0x54,0x52,0x51,0x50,0x4F,0x4E,0x4D,0x4C,0x4B,0x4A,0x48,0x47,0x46,0x45,0x44,0x43
        .byte   0x42,0x41,0x40,0x3F,0x3E,0x3D,0x3C,0x3C,0x3B,0x3A,0x39,0x38,0x37,0x36,0x35,0x34
        .byte   0x33,0x33,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2D,0x2C,0x2B,0x2A,0x29,0x29,0x28,0x27
        .byte   0x26,0x26,0x25,0x24,0x23,0x23,0x22,0x21,0x20,0x20,0x1F,0x1E,0x1E,0x1D,0x1C,0x1C
        .byte   0x1B,0x1A,0x19,0x19,0x18,0x17,0x17,0x16,0x16,0x15,0x14,0x14,0x13,0x12,0x12,0x11
        .byte   0x11,0x10,0x0F,0x0F,0x0E,0x0E,0x0D,0x0C,0x0C,0x0B,0x0B,0x0A,0x0A,0x09,0x08,0x08
        .byte   0x07,0x07,0x06,0x06,0x05,0x05,0x04,0x04,0x03,0x03,0x02,0x02,0x01,0x01,0x00,0x00


