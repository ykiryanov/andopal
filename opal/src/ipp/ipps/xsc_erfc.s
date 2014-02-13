        .text
        .align  4
        .globl  erfc


erfc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        mov     r5, r1
        str     r0, [sp, #0x50]
        bics    r2, r5, #2, 2
        mov     r4, r0
        str     r1, [sp, #0x54]
        bne     LADL0
        cmp     r4, #0
        bne     LADL4
        mov     r0, #0xFF, 12
        orr     r1, r0, #3, 4
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL0:
        mov     r1, #0xFF, 12
        orr     r1, r1, #7, 4
        cmp     r1, r2
        bhi     LADL3
        mov     r1, #0xFF, 12
        orr     r1, r1, #7, 4
        cmp     r1, r5
        bne     LADL1
        cmp     r4, #0
        bne     LADL2
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL1:
        cmn     r5, #1, 12
        bne     LADL2
        cmp     r4, #0
        bne     LADL2
        mov     r0, #0
        mov     r1, #1, 2
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL2:
        orr     r1, r5, #2, 14
        mov     r0, r4
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL3:
        mov     r1, #0xF, 14
        orr     r1, r1, #1, 2
        cmp     r1, r2
        bhi     LADL4
        cmp     r5, #2, 2
        bcc     LADL212
        mov     r0, #0
        mov     r1, #1, 2
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL4:
        bic     r1, r2, #0xFF, 12
        movs    r3, r2, lsl #1
        bic     r1, r1, #0xF, 4
        moveq   r3, #2, 12
        orrne   r1, r1, #1, 12
        mvn     r12, #2, 2
        bics    r12, r2, r12
        mov     r2, r4
        beq     LADL5
        rsbs    r2, r2, #0
        rsc     r1, r1, #0
LADL5:
        mov     r12, #0x33
        orr     r12, r12, #1, 22
        mov     r6, r2, lsl #10
        sub     r10, r12, r3, lsr #21
        add     r7, r10, #0xA
        mov     r3, r2, lsr #22
        cmp     r7, #0x3E
        orr     r8, r3, r1, lsl #10
        beq     LADL468
LADL6:
        orrs    r1, r8, r6
        beq     LADL7
        cmp     r7, #0x3E
        ble     LADL10
LADL7:
        sub     r1, r10, #0x34
        cmp     r1, #0x20
        bcs     LADL8
        rsb     r2, r10, #0x54
        mov     r2, r8, lsl r2
        orr     r3, r2, r6, lsr r1
        mov     r2, r8, asr r1
        b       LADL9
LADL8:
        cmp     r1, #0x40
        movcs   r1, #0x1F
        subcc   r1, r10, #0x54
        mov     r3, r8, asr r1
        mov     r2, r8, asr #31
LADL9:
        adds    r1, r3, #0
        adc     r12, r2, #1, 2
        tst     r12, r12
        mov     lr, #0x3E
        bmi     LADL213
        b       LADL14
LADL10:
        cmp     r7, #0x3E
        beq     LADL467
LADL11:
        rsb     r1, r10, #0x34
        cmp     r1, #0x20
        bcs     LADL12
        rsb     r3, r1, #0x20
        mov     r2, #1, 2
        mov     r3, r2, lsl r3
        mov     r12, #0
        orr     r3, r3, r12, lsr r1
        mov     r2, r2, asr r1
        b       LADL13
LADL12:
        cmp     r1, #0x40
        movcs   r1, #0x1F
        subcc   r1, r1, #0x20
        mov     r2, #1, 2
        mov     r3, r2, asr r1
        mov     r2, #0
LADL13:
        adds    r1, r6, r3
        adc     r12, r8, r2
        tst     r12, r12
        mov     lr, r7
        bmi     LADL466
LADL14:
        umull   r3, r2, r1, r1
        umull   r1, r3, r1, r12
        mov     lr, lr, lsl #1
        sub     r9, lr, #0x3F
        umull   lr, r11, r12, r12
        adds    r12, r1, r2
        adc     r2, r3, #0
        adds    lr, lr, r3
        adc     r3, r11, #0
        adds    r12, r1, r12
        adc     r2, r2, #0
        adds    lr, r2, lr
        mov     r1, r12, lsr #31
        mov     r12, r12, lsr #30
        orr     r1, r1, lr, lsl #1
        adc     r3, r3, #0
        and     r12, r12, #1
        adds    r0, r1, r12
        mov     lr, lr, lsr #31
        orr     r3, lr, r3, lsl #1
        adc     r1, r3, #0
        tst     r1, #1, 2
        bne     LADL15
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r9, r9, r2
        bl      __ashldi3
LADL15:
        umull   r2, r12, r0, r0
        umull   r0, r2, r0, r1
        mov     r9, r9, lsl #1
        sub     r3, r9, #0x3F
        umull   lr, r9, r1, r1
        adds    r12, r0, r12
        adc     r1, r2, #0
        adds    lr, lr, r2
        adc     r2, r9, #0
        adds    r12, r0, r12
        adc     r1, r1, #0
        adds    lr, r1, lr
        mov     r1, r12, lsr #31
        orr     r1, r1, lr, lsl #1
        adc     r2, r2, #0
        mov     r12, r12, lsr #30
        and     r12, r12, #1
        mov     lr, lr, lsr #31
        adds    r1, r1, r12
        orr     r2, lr, r2, lsl #1
        adc     r2, r2, #0
        tst     r2, #1, 2
        bne     LADL16
        cmp     r2, #0
        clzeq   r1, r1
        addeq   r2, r1, #0x1F
        clzne   r2, r2
        subne   r2, r2, #1
        add     r3, r3, r2
LADL16:
        ldr     r2, [pc, #0xF84]
        rsb     r3, r3, #0x3E
        str     r3, [sp, #0x28]
        add     r1, r2, r3, lsl #3
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r1, [r1, #4]
        orrs    r3, r1, r2
        bne     LADL17
        orrs    r12, r8, r6
        bne     LADL17
        ldr     r3, [sp, #0x28]
        ldr     r12, [pc, #0xF5C]
        ldr     r3, [r12, +r3, lsl #2]
        str     r3, [sp, #0x2C]
        b       LADL19
LADL17:
        ldr     r12, [sp, #0x28]
        ldr     lr, [pc, #0xF48]
        ldr     r12, [lr, +r12, lsl #2]
        cmp     r12, r7
        str     r12, [sp, #0x2C]
        bne     LADL18
        cmp     r1, r8
        bne     LADL18
        cmp     r2, r6
        beq     LADL19
LADL18:
        cmp     r3, #0
        beq     LADL25
        orrs    r3, r8, r6
        beq     LADL19
        ldr     r3, [sp, #0x2C]
        cmp     r3, r7
        blt     LADL19
        ldr     r3, [sp, #0x2C]
        cmp     r3, r7
        bne     LADL25
        cmp     r1, r8
        bhi     LADL19
        cmp     r1, r8
        bne     LADL25
        cmp     r2, r6
        bls     LADL25
LADL19:
        ldr     r3, [sp, #0x2C]
        sub     r10, r10, r3
        add     r3, r10, #0xA
        cmp     r3, #0x20
        bcs     LADL20
        rsb     r12, r3, #0x20
        mov     r12, r8, lsl r12
        orr     r12, r12, r6, lsr r3
        mov     r3, r8, asr r3
        b       LADL21
LADL20:
        cmp     r3, #0x40
        movcs   r10, #0x1F
        subcc   r10, r10, #0x16
        mov     r12, r8, asr r10
        mov     r3, r8, asr #31
LADL21:
        subs    r2, r2, r12
        sbc     r1, r1, r3
        tst     r1, #1, 2
        bne     LADL24
        cmp     r1, #0
        bne     LADL22
        cmp     r2, #0
        moveq   r3, #0
        beq     LADL23
        clz     r1, r2
        mov     r2, r2, lsl r1
        add     r3, r1, #0x1F
        mov     r1, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL23
LADL22:
        clz     r3, r1
        sub     r3, r3, #1
        rsb     r12, r3, #0x20
        mov     r12, r2, lsr r12
        orr     r1, r12, r1, lsl r3
        mov     r2, r2, lsl r3
LADL23:
        ldr     r12, [sp, #0x2C]
        add     r3, r12, r3
        str     r3, [sp, #0x2C]
LADL24:
        rsbs    r2, r2, #0
        rsc     r1, r1, #0
        str     r2, [sp, #0x34]
        str     r1, [sp, #0x30]
        b       LADL30
LADL25:
        ldr     r3, [sp, #0x2C]
        sub     r3, r3, r10
        sub     r3, r3, #0xA
        cmp     r3, #0x20
        bcs     LADL26
        rsb     r12, r3, #0x20
        mov     r12, r1, lsl r12
        orr     r2, r12, r2, lsr r3
        mov     r3, r1, asr r3
        b       LADL27
LADL26:
        cmp     r3, #0x40
        movcs   r3, #0x1F
        subcc   r3, r3, #0x20
        mov     r2, r1, asr r3
        mov     r3, r1, asr #31
LADL27:
        subs    r2, r6, r2
        sbc     r3, r8, r3
        tst     r3, #1, 2
        str     r2, [sp, #0x34]
        str     r3, [sp, #0x30]
        str     r7, [sp, #0x2C]
        bne     LADL30
        ldr     r1, [sp, #0x30]
        cmp     r1, #0
        bne     LADL28
        ldr     r1, [sp, #0x34]
        cmp     r1, #0
        moveq   r1, #0
        beq     LADL29
        ldr     r2, [sp, #0x34]
        clz     r1, r2
        mov     r2, r2, lsl r1
        add     r1, r1, #0x1F
        mov     r3, r2, lsr #1
        mov     r2, r2, lsl #31
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x34]
        b       LADL29
LADL28:
        ldr     r3, [sp, #0x30]
        ldr     r2, [sp, #0x34]
        clz     r1, r3
        sub     r1, r1, #1
        rsb     r12, r1, #0x20
        mov     r12, r2, lsr r12
        orr     r3, r12, r3, lsl r1
        mov     r2, r2, lsl r1
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x34]
LADL29:
        add     r1, r1, r7
        str     r1, [sp, #0x2C]
LADL30:
        mov     r1, #0xFF
        orr     r1, r1, #0xF, 24
        and     r9, r8, r1
        bic     r8, r8, #0xF, 24
        tst     r9, #1, 2
        bic     r8, r8, #0xFF
        str     r7, [sp, #0x1C]
        bne     LADL31
        cmp     r9, #0
        clzeq   r2, r6
        addeq   r10, r2, #0x1F
        clzne   r2, r9
        subne   r10, r2, #1
        mov     r3, r10, asr #31
        mov     r2, r10
        mov     r1, r9
        mov     r0, r6
        bl      __ashldi3
        add     r10, r7, r10
        mov     r6, r0
        mov     r9, r1
        str     r10, [sp, #0x1C]
LADL31:
        umull   r10, lr, r9, r8
        mov     r2, #0
        umull   r3, r1, r2, r6
        umull   r2, r0, r2, r9
        umull   r12, r3, r6, r8
        ldr     r11, [sp, #0x1C]
        adds    r2, r2, r1
        adc     r0, r0, #0
        adds    r3, r10, r3
        adc     lr, lr, #0
        adds    r2, r12, r2
        adc     r0, r0, #0
        adds    r3, r0, r3
        mov     r12, r2, lsr #30
        mov     r10, r2, lsr #31
        orr     r2, r10, r3, lsl #1
        and     r12, r12, #1
        adc     lr, lr, #0
        mov     r3, r3, lsr #31
        adds    r12, r2, r12
        orr     lr, r3, lr, lsl #1
        add     r11, r7, r11
        adc     r10, lr, #0
        tst     r10, #1, 2
        sub     r11, r11, #0x3F
        str     r12, [sp, #0x14]
        bne     LADL34
        cmp     r10, #0
        beq     LADL32
        clz     r2, r10
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADL33
LADL32:
        ldr     r2, [sp, #0x14]
        clz     r2, r2
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADL33:
        ldr     r2, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        mov     r1, r10
        mov     r3, r2, asr #31
        ldr     r2, [sp, #0x18]
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        str     r0, [sp, #0x14]
        mov     r10, r1
        add     r11, r11, r2
LADL34:
        mov     r12, #0
        umull   r3, r2, r12, r8
        umull   r12, lr, r12, r12
        umull   r8, r12, r8, r8
        sub     r11, r11, #1
        str     r11, [sp, #0x20]
        adds    r11, r3, lr
        adc     r0, r2, #0
        adds    r2, r8, r2
        adc     r12, r12, #0
        adds    r11, r3, r11
        adc     r0, r0, #0
        adds    r3, r0, r2
        adc     r2, r12, #0
        mov     r12, r11, lsr #31
        mov     lr, r7, lsl #1
        mov     r11, r11, lsr #30
        and     r7, r11, #1
        orr     r12, r12, r3, lsl #1
        adds    r7, r12, r7
        mov     r3, r3, lsr #31
        str     r7, [sp]
        orr     r2, r3, r2, lsl #1
        adc     r7, r2, #0
        tst     r7, #1, 2
        sub     r8, lr, #0x3F
        bne     LADL36
        cmp     r7, #0
        clzne   r2, r7
        subne   r11, r2, #1
        bne     LADL35
        ldr     r2, [sp]
        clz     r2, r2
        add     r11, r2, #0x1F
LADL35:
        ldr     r0, [sp]
        mov     r3, r11, asr #31
        mov     r1, r7
        mov     r2, r11
        bl      __ashldi3
        str     r0, [sp]
        mov     r7, r1
        add     r8, r8, r11
LADL36:
        umull   r3, r2, r6, r9
        umull   r6, r12, r6, r6
        umull   lr, r6, r9, r9
        ldr     r9, [sp, #0x1C]
        adds    r12, r3, r12
        adc     r11, r2, #0
        adds    r2, lr, r2
        adc     r6, r6, #0
        adds    r12, r3, r12
        adc     r11, r11, #0
        adds    r3, r11, r2
        adc     r2, r6, #0
        mov     lr, r12, lsr #30
        mov     r6, r12, lsr #31
        orr     r12, r6, r3, lsl #1
        and     lr, lr, #1
        mov     r3, r3, lsr #31
        adds    r0, r12, lr
        orr     r2, r3, r2, lsl #1
        mov     r9, r9, lsl #1
        adc     r1, r2, #0
        tst     r1, #1, 2
        sub     r9, r9, #0x3F
        bne     LADL37
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r6, r2, #0x1F
        clzne   r2, r1
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        add     r9, r9, r6
LADL37:
        ldr     r2, [sp, #0x20]
        sub     r9, r9, r2
        cmp     r9, #0x20
        bcs     LADL38
        rsb     r2, r9, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r9
        mov     r9, r1, asr r9
        b       LADL39
LADL38:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r0, r1, asr r9
        mov     r9, r1, asr #31
LADL39:
        ldr     r2, [sp, #0x14]
        adds    r0, r2, r0
        adc     r9, r10, r9
        tst     r9, r9
        str     r0, [sp, #0x24]
        str     r9, [sp, #0x14]
        bpl     LADL40
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        sub     r2, r2, #1
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x14]
        mov     r12, r2, lsl #31
        orr     r3, r12, r3, lsr #1
        mov     r2, r2, lsr #1
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x14]
LADL40:
        ldr     r2, [pc, #0xAB4]
        ldr     r3, [r2]
        ldr     r2, [r2, #4]
        orrs    r12, r2, r3
        bne     LADL41
        ldr     lr, [sp]
        orrs    lr, r7, lr
        beq     LADL43
LADL41:
        cmp     r8, #0x37
        beq     LADL465
LADL42:
        cmp     r12, #0
        beq     LADL45
        ldr     r12, [sp]
        orrs    r12, r7, r12
        beq     LADL43
        cmp     r8, #0x37
        ble     LADL44
LADL43:
        umull   r12, lr, r3, r7
        ldr     r6, [sp]
        sub     r11, r8, #8
        umull   r3, r10, r6, r3
        umull   r3, r6, r6, r2
        umull   r9, r2, r2, r7
        adds    r12, r12, r10
        adc     lr, lr, #0
        adds    r6, r9, r6
        adc     r2, r2, #0
        adds    r12, r3, r12
        adc     lr, lr, #0
        adds    r6, lr, r6
        mov     lr, r12, lsr #31
        mov     r12, r12, lsr #30
        adc     r2, r2, #0
        mov     r3, r6, lsr #31
        orr     r6, lr, r6, lsl #1
        and     r12, r12, #1
        orr     r2, r3, r2, lsl #1
        adds    r0, r6, r12
        adc     r1, r2, #0
        b       LADL46
LADL44:
        cmp     r8, #0x37
        beq     LADL214
LADL45:
        ldr     r6, [sp]
        sub     r11, r8, #8
        umull   r12, lr, r6, r2
        umull   r6, r10, r6, r3
        umull   r3, r6, r3, r7
        umull   r9, r2, r2, r7
        adds    r12, r12, r10
        adc     lr, lr, #0
        adds    r6, r9, r6
        adc     r2, r2, #0
        adds    r12, r3, r12
        adc     lr, lr, #0
        adds    r6, lr, r6
        mov     lr, r12, lsr #31
        mov     r12, r12, lsr #30
        adc     r2, r2, #0
        mov     r3, r6, lsr #31
        orr     r6, lr, r6, lsl #1
        and     r12, r12, #1
        orr     r2, r3, r2, lsl #1
        adds    r0, r6, r12
        adc     r1, r2, #0
LADL46:
        tst     r1, #1, 2
        bne     LADL47
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r6, r2, #0x1F
        clzne   r2, r1
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        add     r11, r11, r6
LADL47:
        cmp     r11, #0x3F
        ble     LADL48
        mov     r11, #0
        str     r11, [sp, #0xC]
        mov     r10, r11
        str     r10, [sp, #0x10]
        b       LADL62
LADL48:
        cmp     r11, #0x20
        bcs     LADL49
        rsb     r2, r11, #0x20
        mov     r2, r1, lsl r2
        orr     r2, r2, r0, lsr r11
        mov     r3, r1, asr r11
        b       LADL50
LADL49:
        cmp     r11, #0x40
        movcs   r2, #0x1F
        subcc   r2, r11, #0x20
        mov     r2, r1, asr r2
        mov     r3, r1, asr #31
LADL50:
        cmp     r11, #0x20
        bcs     LADL51
        rsb     r12, r11, #0x20
        mov     r12, r2, lsr r12
        orr     r3, r12, r3, lsl r11
        str     r3, [sp, #0xC]
        mov     r10, r2, lsl r11
        b       LADL53
LADL51:
        cmp     r11, #0x40
        movcs   r2, #0
        strcs   r2, [sp, #0xC]
        bcs     LADL52
        sub     r3, r11, #0x20
        mov     r3, r2, lsl r3
        str     r3, [sp, #0xC]
LADL52:
        mov     r10, #0
LADL53:
        ldr     r3, [sp, #0xC]
        mov     r2, #0
        cmp     r2, #0x20
        str     r3, [sp, #0x10]
        bcs     LADL54
        ldr     r3, [sp, #0x10]
        orr     r2, r10, r3
        b       LADL55
LADL54:
        cmp     r2, #0x40
        movcs   r2, #0x1F
        mvncc   r2, #0x1F
        ldr     r3, [sp, #0x10]
        mov     r2, r3, asr r2
        mov     r3, r3, asr #31
LADL55:
        subs    r0, r0, r2
        sbc     r1, r1, r3
        tst     r1, #1, 2
        bne     LADL57
        cmp     r1, #0
        clzne   r1, r1
        subne   r0, r1, #1
        bne     LADL56
        cmp     r0, #0
        clzne   r0, r0
        addne   r0, r0, #0x1F
        moveq   r0, #0
LADL56:
        add     r2, r11, r0
        cmp     r2, #0x3F
        bgt     LADL62
LADL57:
        ldr     r2, [sp, #0x10]
        orrs    r2, r2, r10
        bne     LADL58
        mov     r2, #1, 2
        str     r2, [sp, #0xC]
        mov     r11, #0x3E
        str     r2, [sp, #0x10]
        mov     r10, #0
        b       LADL62
LADL58:
        rsb     r2, r11, #0x3E
        cmp     r2, #0x20
        bcs     LADL59
        rsb     lr, r2, #0x20
        mov     r3, #1, 2
        mov     r12, #0
        mov     lr, r3, lsl lr
        orr     r12, lr, r12, lsr r2
        mov     r2, r3, asr r2
        b       LADL60
LADL59:
        cmp     r2, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x20
        mov     r3, #1, 2
        mov     r12, r3, asr r2
        mov     r2, #0
LADL60:
        ldr     r3, [sp, #0xC]
        adds    r10, r10, r12
        adc     r2, r3, r2
        tst     r2, r2
        str     r2, [sp, #0xC]
        bmi     LADL61
        ldr     r2, [sp, #0xC]
        str     r2, [sp, #0x10]
        b       LADL62
LADL61:
        ldr     r3, [sp, #0xC]
        sub     r11, r11, #1
        mov     r2, r3, lsl #31
        mov     r3, r3, lsr #1
        str     r3, [sp, #0xC]
        orr     r10, r2, r10, lsr #1
        str     r3, [sp, #0x10]
LADL62:
        cmp     r11, #0x20
        bcs     LADL63
        ldr     r3, [sp, #0x10]
        rsb     r2, r11, #0x20
        mov     r2, r3, lsl r2
        orr     r2, r2, r10, lsr r11
        str     r2, [sp, #0x38]
        b       LADL64
LADL63:
        cmp     r11, #0x40
        movcs   r2, #0x1F
        subcc   r2, r11, #0x20
        ldr     r3, [sp, #0x10]
        mov     r2, r3, asr r2
        str     r2, [sp, #0x38]
LADL64:
        ldr     r3, [sp, #0x38]
        ldr     r2, [pc, #0x7AC]
        and     r3, r3, #0x7F
        str     r3, [sp, #0x3C]
        ldr     r12, [r2]
        ldr     r2, [r2, #4]
        orrs    r3, r2, r12
        bne     LADL65
        ldr     lr, [sp, #0x10]
        orrs    lr, lr, r10
        beq     LADL67
LADL65:
        cmp     r11, #0x46
        beq     LADL464
LADL66:
        cmp     r3, #0
        beq     LADL69
        ldr     r3, [sp, #0x10]
        orrs    r3, r3, r10
        beq     LADL67
        cmp     r11, #0x46
        ble     LADL68
LADL67:
        ldr     r6, [sp, #0xC]
        umull   lr, r3, r12, r6
        umull   r9, r12, r10, r12
        umull   r9, r0, r2, r10
        umull   r2, r6, r2, r6
        str     r0, [sp, #0x1C]
        adds    r12, lr, r12
        ldr     lr, [sp, #0x1C]
        adc     r3, r3, #0
        str     r6, [sp, #0x40]
        str     r9, [sp, #0x18]
        adds    lr, r2, lr
        ldr     r2, [sp, #0x40]
        ldr     r9, [sp, #0x18]
        add     r6, r11, #7
        adc     r2, r2, #0
        adds    r12, r9, r12
        adc     r3, r3, #0
        adds    lr, r3, lr
        adc     r2, r2, #0
        str     r2, [sp, #0x40]
        mov     r3, r12, lsr #31
        mov     r2, lr, lsr #31
        mov     r12, r12, lsr #30
        orr     lr, r3, lr, lsl #1
        and     r3, r12, #1
        ldr     r12, [sp, #0x40]
        adds    r3, lr, r3
        str     r3, [sp, #0x18]
        orr     r2, r2, r12, lsl #1
        adc     r9, r2, #0
        b       LADL70
LADL68:
        cmp     r11, #0x46
        beq     LADL215
LADL69:
        umull   lr, r3, r2, r10
        str     r3, [sp, #0x40]
        umull   r3, r6, r10, r12
        ldr     r9, [sp, #0xC]
        adds    lr, lr, r6
        add     r6, r11, #7
        umull   r12, r3, r12, r9
        str     r12, [sp, #0x1C]
        umull   r12, r2, r2, r9
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x40]
        ldr     r9, [sp, #0x1C]
        adc     r2, r2, #0
        adds    r12, r12, r3
        ldr     r3, [sp, #0x18]
        adc     r3, r3, #0
        adds    lr, r9, lr
        adc     r2, r2, #0
        adds    r12, r2, r12
        adc     r3, r3, #0
        str     r3, [sp, #0x40]
        mov     r3, lr, lsr #31
        mov     r2, r12, lsr #31
        mov     lr, lr, lsr #30
        orr     r12, r3, r12, lsl #1
        and     r3, lr, #1
        ldr     lr, [sp, #0x40]
        adds    r3, r12, r3
        str     r3, [sp, #0x18]
        orr     r2, r2, lr, lsl #1
        adc     r9, r2, #0
LADL70:
        tst     r9, #1, 2
        bne     LADL73
        cmp     r9, #0
        beq     LADL71
        clz     r2, r9
        sub     r2, r2, #1
        str     r2, [sp, #0x1C]
        b       LADL72
LADL71:
        ldr     r2, [sp, #0x18]
        clz     r2, r2
        add     r2, r2, #0x1F
        str     r2, [sp, #0x1C]
LADL72:
        ldr     r2, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        mov     r1, r9
        mov     r3, r2, asr #31
        ldr     r2, [sp, #0x1C]
        bl      __ashldi3
        ldr     r2, [sp, #0x1C]
        str     r0, [sp, #0x18]
        mov     r9, r1
        add     r6, r6, r2
LADL73:
        ldr     r2, [pc, #0x608]
        ldr     r3, [r2]
        ldr     r2, [r2, #4]
        orrs    r12, r2, r3
        bne     LADL74
        ldr     lr, [sp, #0x10]
        orrs    lr, lr, r10
        beq     LADL76
LADL74:
        cmp     r11, #0x5B
        beq     LADL463
LADL75:
        cmp     r12, #0
        beq     LADL78
        ldr     r12, [sp, #0x10]
        orrs    r12, r12, r10
        beq     LADL76
        cmp     r11, #0x5B
        ble     LADL77
LADL76:
        ldr     lr, [sp, #0xC]
        add     r11, r11, #0x1C
        umull   r0, r12, r3, lr
        str     r12, [sp, #0x1C]
        umull   r3, r12, r10, r3
        umull   r10, r3, r10, r2
        str     r0, [sp, #0x40]
        umull   r0, lr, r2, lr
        ldr     r2, [sp, #0x40]
        str     r10, [sp, #0x10]
        adds    r2, r2, r12
        ldr     r12, [sp, #0x1C]
        adc     r12, r12, #0
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0x10]
        adds    r3, r0, r3
        adc     lr, lr, #0
        adds    r2, r12, r2
        ldr     r12, [sp, #0x40]
        mov     r10, r2, lsr #31
        adc     r12, r12, #0
        adds    r3, r12, r3
        mov     r12, r2, lsr #30
        adc     lr, lr, #0
        mov     r2, r3, lsr #31
        orr     r3, r10, r3, lsl #1
        and     r12, r12, #1
        orr     lr, r2, lr, lsl #1
        adds    r0, r3, r12
        adc     r1, lr, #0
        b       LADL79
LADL77:
        cmp     r11, #0x5B
        beq     LADL216
LADL78:
        umull   lr, r12, r10, r2
        umull   r10, r0, r10, r3
        str     r12, [sp, #0x1C]
        add     r11, r11, #0x1C
        str     lr, [sp, #0x40]
        ldr     lr, [sp, #0xC]
        umull   r3, r12, r3, lr
        str     r3, [sp, #0x10]
        umull   lr, r3, r2, lr
        ldr     r2, [sp, #0x40]
        adds    r2, r2, r0
        ldr     r0, [sp, #0x1C]
        adc     r0, r0, #0
        adds    r12, lr, r12
        ldr     lr, [sp, #0x10]
        adc     r3, r3, #0
        str     r0, [sp, #0x40]
        adds    r2, lr, r2
        ldr     lr, [sp, #0x40]
        mov     r10, r2, lsr #31
        adc     lr, lr, #0
        adds    r12, lr, r12
        mov     lr, r2, lsr #30
        adc     r3, r3, #0
        mov     r2, r12, lsr #31
        orr     r12, r10, r12, lsl #1
        and     lr, lr, #1
        orr     r3, r2, r3, lsl #1
        adds    r0, r12, lr
        adc     r1, r3, #0
LADL79:
        tst     r1, #1, 2
        bne     LADL82
        cmp     r1, #0
        beq     LADL80
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x10]
        b       LADL81
LADL80:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x10]
LADL81:
        ldr     r10, [sp, #0x10]
        mov     r3, r10, asr #31
        mov     r2, r10
        bl      __ashldi3
        add     r11, r11, r10
LADL82:
        ldr     r2, [sp, #0x18]
        orrs    r2, r9, r2
        bne     LADL83
        ldr     r3, [sp]
        orrs    r3, r7, r3
        beq     LADL85
LADL83:
        cmp     r6, r8
        bne     LADL84
        cmp     r9, r7
        bne     LADL84
        ldr     r12, [sp, #0x18]
        ldr     r3, [sp]
        cmp     r12, r3
        beq     LADL85
LADL84:
        cmp     r2, #0
        beq     LADL91
        ldr     r2, [sp]
        orrs    r2, r7, r2
        beq     LADL85
        cmp     r6, r8
        blt     LADL85
        cmp     r6, r8
        bne     LADL91
        cmp     r9, r7
        bhi     LADL85
        cmp     r9, r7
        bne     LADL91
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp]
        cmp     r3, r2
        bls     LADL91
LADL85:
        sub     r8, r8, r6
        cmp     r8, #0x20
        bcs     LADL86
        ldr     r3, [sp]
        rsb     r2, r8, #0x20
        mov     r2, r7, lsl r2
        orr     r2, r2, r3, lsr r8
        mov     r8, r7, asr r8
        b       LADL87
LADL86:
        cmp     r8, #0x40
        movcs   r8, #0x1F
        subcc   r8, r8, #0x20
        mov     r2, r7, asr r8
        mov     r8, r7, asr #31
LADL87:
        ldr     r3, [sp, #0x18]
        subs    r2, r3, r2
        sbc     r9, r9, r8
        tst     r9, #1, 2
        bne     LADL90
        cmp     r9, #0
        bne     LADL88
        cmp     r2, #0
        moveq   r3, #0
        beq     LADL89
        clz     r3, r2
        mov     r2, r2, lsl r3
        add     r3, r3, #0x1F
        mov     r9, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL89
LADL88:
        clz     r3, r9
        sub     r3, r3, #1
        rsb     r12, r3, #0x20
        mov     r12, r2, lsr r12
        orr     r9, r12, r9, lsl r3
        mov     r2, r2, lsl r3
LADL89:
        add     r6, r6, r3
LADL90:
        rsbs    r2, r2, #0
        rsc     r7, r9, #0
        b       LADL96
LADL91:
        sub     r6, r6, r8
        cmp     r6, #0x20
        bcs     LADL92
        ldr     r3, [sp, #0x18]
        rsb     r2, r6, #0x20
        mov     r2, r9, lsl r2
        orr     r2, r2, r3, lsr r6
        mov     r6, r9, asr r6
        b       LADL93
LADL92:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r9, asr r6
        mov     r6, r9, asr #31
LADL93:
        ldr     r3, [sp]
        subs    r2, r3, r2
        sbc     r7, r7, r6
        tst     r7, #1, 2
        mov     r6, r8
        bne     LADL96
        cmp     r7, #0
        bne     LADL94
        cmp     r2, #0
        moveq   r3, #0
        beq     LADL95
        clz     r3, r2
        mov     r2, r2, lsl r3
        add     r3, r3, #0x1F
        mov     r7, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL95
LADL94:
        clz     r3, r7
        sub     r3, r3, #1
        rsb     r12, r3, #0x20
        mov     r12, r2, lsr r12
        orr     r7, r12, r7, lsl r3
        mov     r2, r2, lsl r3
LADL95:
        add     r6, r8, r3
LADL96:
        cmp     r7, #0
        blt     LADL437
        cmp     r1, #0
        blt     LADL428
        orrs    r3, r1, r0
        bne     LADL97
        orrs    r12, r7, r2
        beq     LADL99
LADL97:
        cmp     r11, r6
        bne     LADL98
        cmp     r1, r7
        bne     LADL98
        cmp     r0, r2
        beq     LADL99
LADL98:
        cmp     r3, #0
        beq     LADL105
        orrs    r3, r7, r2
        beq     LADL99
        cmp     r11, r6
        blt     LADL99
        cmp     r11, r6
        bne     LADL105
        cmp     r1, r7
        bhi     LADL99
        cmp     r1, r7
        bne     LADL105
        cmp     r0, r2
        bls     LADL105
LADL99:
        sub     r6, r6, r11
        cmp     r6, #0x20
        bcs     LADL100
        rsb     r3, r6, #0x20
        mov     r3, r7, lsl r3
        orr     r2, r3, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL101
LADL100:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL101:
        subs    r0, r0, r2
        sbc     r1, r1, r6
        tst     r1, #1, 2
        mov     r6, r11
        bne     LADL104
        cmp     r1, #0
        bne     LADL102
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL103
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL103
LADL102:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL103:
        add     r6, r11, r2
LADL104:
        rsbs    r2, r0, #0
        rsc     r7, r1, #0
        b       LADL110
LADL105:
        sub     r11, r11, r6
        cmp     r11, #0x20
        bcs     LADL106
        rsb     r3, r11, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADL107
LADL106:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADL107:
        subs    r2, r2, r0
        sbc     r7, r7, r11
        tst     r7, #1, 2
        bne     LADL110
        cmp     r7, #0
        bne     LADL108
        cmp     r2, #0
        moveq   r1, #0
        beq     LADL109
        clz     r1, r2
        mov     r2, r2, lsl r1
        add     r1, r1, #0x1F
        mov     r7, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL109
LADL108:
        clz     r1, r7
        sub     r1, r1, #1
        rsb     r3, r1, #0x20
        mov     r3, r2, lsr r3
        orr     r7, r3, r7, lsl r1
        mov     r2, r2, lsl r1
LADL109:
        add     r6, r6, r1
LADL110:
        cmp     r7, #0
        blt     LADL402
        ldr     r1, [sp, #0x14]
        cmp     r1, #0
        blt     LADL388
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x14]
        orrs    r1, r3, r1
        bne     LADL111
        orrs    r3, r7, r2
        beq     LADL113
LADL111:
        ldr     r3, [sp, #0x20]
        cmp     r3, r6
        bne     LADL112
        ldr     r3, [sp, #0x14]
        cmp     r3, r7
        bne     LADL112
        ldr     r3, [sp, #0x24]
        cmp     r3, r2
        beq     LADL113
LADL112:
        cmp     r1, #0
        beq     LADL116
        orrs    r1, r7, r2
        beq     LADL113
        ldr     r1, [sp, #0x20]
        cmp     r1, r6
        blt     LADL113
        ldr     r1, [sp, #0x20]
        cmp     r1, r6
        bne     LADL116
        ldr     r1, [sp, #0x14]
        cmp     r1, r7
        bhi     LADL113
        ldr     r1, [sp, #0x14]
        cmp     r1, r7
        bne     LADL116
        ldr     r1, [sp, #0x24]
        cmp     r1, r2
        bls     LADL116
LADL113:
        ldr     r1, [sp, #0x20]
        sub     r6, r6, r1
        cmp     r6, #0x20
        bcs     LADL114
        rsb     r1, r6, #0x20
        mov     r1, r7, lsl r1
        orr     r2, r1, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL115
LADL114:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL115:
        ldr     r1, [sp, #0x24]
        adds    r0, r1, r2
        ldr     r1, [sp, #0x14]
        adc     r1, r1, r6
        ldr     r6, [sp, #0x20]
        tst     r1, r1
        bpl     LADL119
        ldr     r2, [sp, #0x20]
        sub     r6, r2, #1
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        b       LADL119
LADL116:
        ldr     r1, [sp, #0x20]
        sub     r1, r1, r6
        cmp     r1, #0x20
        bcs     LADL117
        ldr     r3, [sp, #0x14]
        ldr     lr, [sp, #0x24]
        rsb     r12, r1, #0x20
        mov     r12, r3, lsl r12
        orr     r12, r12, lr, lsr r1
        mov     r1, r3, asr r1
        b       LADL118
        .long   LADL_qwXB_M
        .long   LADL_qwXB_SC
        .long   LADL_THE_128_LN2_DIV_M
        .long   LADL_THE_LN2_DIV_128_HI_M
        .long   LADL_THE_LN2_DIV_128_LO_M
        .long   LADL_qwE_M
        .long   LADL_qwE_SC
        .long   LADL_qwE_M
        .long   LADL_qwE_SC
        .long   LADL_qwT_M
        .long   LADL_qwP_M
        .long   LADL_qwP_SC
        .long   0x403a8b12
        .long   0xfc6e4892
LADL117:
        cmp     r1, #0x40
        movcs   r3, #0x1F
        subcc   r3, r1, #0x20
        ldr     r1, [sp, #0x14]
        mov     r12, r1, asr r3
        mov     r1, r1, asr #31
LADL118:
        adds    r0, r2, r12
        adc     r1, r7, r1
        tst     r1, r1
        bpl     LADL119
        mov     r2, r1, lsl #31
        sub     r6, r6, #1
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
LADL119:
        cmp     r1, #0
        blt     LADL387
        tst     r1, #1, 2
        bne     LADL120
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r6, r6, r2
        bl      __ashldi3
LADL120:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADL121:
        ldr     r2, [pc, #-0x9C]
        ldr     r12, [pc, #-0x9C]
        ldr     r10, [pc, #-0x9C]
        ldr     r3, [r2, #0x30]
        ldr     r2, [r2, #0x34]
        ldr     r11, [r12, #0x18]
        ldr     r9, [pc, #-0xA8]
        cmp     r1, #0
        blt     LADL345
        str     r4, [sp, #8]
        mov     r8, #6
        orr     r7, r1, r0
        str     r0, [sp]
        str     r5, [sp, #4]
        mov     r4, r1
LADL122:
        cmp     r7, #0
        bne     LADL123
        orrs    r0, r2, r3
        beq     LADL125
LADL123:
        cmp     r6, r11
        bne     LADL124
        cmp     r4, r2
        bne     LADL124
        ldr     r0, [sp]
        cmp     r0, r3
        beq     LADL125
LADL124:
        cmp     r7, #0
        beq     LADL126
        orrs    r0, r2, r3
        beq     LADL125
        cmp     r6, r11
        blt     LADL125
        cmp     r6, r11
        bne     LADL126
        cmp     r4, r2
        bhi     LADL125
        cmp     r4, r2
        bne     LADL126
        ldr     r0, [sp]
        cmp     r0, r3
        bls     LADL126
LADL125:
        ldr     r0, [sp]
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        umull   r12, lr, r0, r2
        umull   r5, r0, r3, r0
        umull   r3, r5, r3, r4
        umull   r2, r1, r4, r2
        adds    r12, r0, r12
        adc     lr, lr, #0
        adds    r5, r2, r5
        adc     r1, r1, #0
        adds    r12, r3, r12
        adc     lr, lr, #0
        adds    r5, lr, r5
        adc     r1, r1, #0
        mov     r2, r12, lsr #31
        mov     r0, r5, lsr #31
        mov     r12, r12, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r5, r2, r5, lsl #1
        and     r12, r12, #1
        adds    r0, r5, r12
        adc     r1, r1, #0
        b       LADL127
LADL126:
        umull   r12, r0, r3, r4
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        str     r12, [sp, #0x40]
        ldr     r12, [sp]
        ldr     r1, [sp, #0x40]
        umull   r3, lr, r3, r12
        umull   r3, r12, r12, r2
        umull   r2, r5, r4, r2
        adds    lr, r1, lr
        adc     r0, r0, #0
        adds    r12, r2, r12
        adc     r5, r5, #0
        adds    lr, r3, lr
        adc     r0, r0, #0
        adds    r12, r0, r12
        mov     r2, lr, lsr #31
        adc     r5, r5, #0
        mov     r0, r12, lsr #31
        mov     lr, lr, lsr #30
        orr     r5, r0, r5, lsl #1
        orr     r12, r2, r12, lsl #1
        and     lr, lr, #1
        adds    r0, r12, lr
        adc     r1, r5, #0
LADL127:
        tst     r1, #1, 2
        bne     LADL128
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r5, r2, #0x1F
        clzne   r2, r1
        subne   r5, r2, #1
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        add     r11, r11, r5
LADL128:
        ldr     r3, [r10, #-8]
        ldr     r2, [r10, #-4]
        orrs    lr, r2, r3
        bne     LADL129
        orrs    r12, r1, r0
        ldreq   r12, [r9, #-4]
        beq     LADL131
LADL129:
        ldr     r12, [r9, #-4]
        cmp     r12, r11
        bne     LADL130
        cmp     r2, r1
        bne     LADL130
        cmp     r3, r0
        beq     LADL131
LADL130:
        cmp     lr, #0
        beq     LADL134
        orrs    lr, r1, r0
        beq     LADL131
        cmp     r12, r11
        blt     LADL131
        cmp     r12, r11
        bne     LADL134
        cmp     r2, r1
        bhi     LADL131
        cmp     r2, r1
        bne     LADL134
        cmp     r3, r0
        bls     LADL134
LADL131:
        sub     r11, r11, r12
        cmp     r11, #0x20
        bcs     LADL132
        rsb     lr, r11, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADL133
LADL132:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADL133:
        adds    r3, r3, r0
        adc     r2, r2, r11
        tst     r2, r2
        mov     r11, r12
        bpl     LADL137
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r11, r12, #1
        b       LADL137
LADL134:
        sub     r12, r12, r11
        cmp     r12, #0x20
        bcs     LADL135
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADL136
LADL135:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADL136:
        adds    r3, r0, r3
        adc     r2, r1, r12
        tst     r2, r2
        bpl     LADL137
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r11, r11, #1
LADL137:
        sub     r8, r8, #1
        cmp     r8, #0
        sub     r9, r9, #4
        sub     r10, r10, #8
        bgt     LADL122
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #8]
LADL138:
        ldr     lr, [pc, #-0x35C]
        ldr     r12, [sp, #0x3C]
        add     r1, lr, r12, lsl #3
        ldr     r1, [r1, #4]
        ldr     lr, [lr, +r12, lsl #3]
        orrs    r12, r1, lr
        bne     LADL139
        orrs    r6, r2, r3
        beq     LADL141
LADL139:
        cmp     r11, #0x3E
        beq     LADL344
LADL140:
        cmp     r12, #0
        beq     LADL143
        orrs    r12, r2, r3
        beq     LADL141
        cmp     r11, #0x3E
        ble     LADL142
LADL141:
        umull   r6, r12, r3, lr
        umull   r7, lr, lr, r2
        umull   r3, r6, r3, r1
        umull   r2, r1, r1, r2
        sub     r11, r11, #1
        adds    r12, r7, r12
        adc     lr, lr, #0
        adds    r6, r2, r6
        adc     r1, r1, #0
        adds    r12, r3, r12
        adc     lr, lr, #0
        adds    r6, lr, r6
        adc     r2, r1, #0
        mov     r1, r12, lsr #31
        mov     r12, r12, lsr #30
        orr     r1, r1, r6, lsl #1
        and     r12, r12, #1
        mov     r6, r6, lsr #31
        adds    r0, r1, r12
        orr     r2, r6, r2, lsl #1
        adc     r1, r2, #0
        b       LADL144
LADL142:
        cmp     r11, #0x3E
        beq     LADL217
LADL143:
        umull   r6, r12, r3, lr
        umull   r7, r3, r3, r1
        umull   lr, r6, r2, lr
        umull   r2, r1, r1, r2
        sub     r11, r11, #1
        adds    r12, r7, r12
        adc     r3, r3, #0
        adds    r6, r2, r6
        adc     r1, r1, #0
        adds    r12, lr, r12
        adc     r3, r3, #0
        adds    r6, r3, r6
        adc     r2, r1, #0
        mov     r1, r12, lsr #31
        mov     r12, r12, lsr #30
        orr     r1, r1, r6, lsl #1
        and     r12, r12, #1
        mov     r6, r6, lsr #31
        adds    r0, r1, r12
        orr     r2, r6, r2, lsl #1
        adc     r1, r2, #0
LADL144:
        tst     r1, #1, 2
        bne     LADL145
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r11, r11, r2
        bl      __ashldi3
LADL145:
        ldr     r2, [sp, #0x38]
        ldr     r3, [pc, #-0x47C]
        ldr     r6, [pc, #-0x47C]
        add     r12, r11, r2, lsr #7
        ldr     r2, [sp, #0x28]
        ldr     r11, [sp, #0x30]
        mov     r8, #0xE
        add     lr, r3, r2, lsl #7
        ldr     r3, [lr, #0x78]
        add     r10, r6, r2, lsl #6
        ldr     r9, [r10, #0x3C]
        ldr     r2, [lr, #0x7C]
        add     r7, r10, #0x38
        str     r10, [sp, #0x14]
        str     r5, [sp, #4]
        ldr     r10, [sp, #0x34]
        ldr     r5, [sp, #0x2C]
        add     r6, lr, #0x70
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x1C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
        str     r4, [sp, #8]
LADL146:
        cmp     r2, #0
        blt     LADL327
        cmp     r11, #0
        blt     LADL318
        orrs    r4, r11, r10
        bne     LADL147
        orrs    r0, r2, r3
        beq     LADL149
LADL147:
        cmp     r5, r9
        bne     LADL148
        cmp     r11, r2
        bne     LADL148
        cmp     r10, r3
        beq     LADL149
LADL148:
        cmp     r4, #0
        beq     LADL150
        orrs    r0, r2, r3
        beq     LADL149
        cmp     r5, r9
        blt     LADL149
        cmp     r5, r9
        bne     LADL150
        cmp     r11, r2
        bhi     LADL149
        cmp     r11, r2
        bne     LADL150
        cmp     r10, r3
        bls     LADL150
LADL149:
        umull   lr, r0, r3, r10
        umull   r1, r12, r10, r2
        umull   r3, lr, r3, r11
        add     r9, r5, r9
        str     lr, [sp, #0x40]
        umull   lr, r2, r11, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        sub     r9, r9, #0x3F
        str     lr, [sp, #0x3C]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
        adds    r0, r0, lr
        adc     r2, r2, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    r0, r12, r0
        mov     r3, r1, lsr #30
        mov     r12, r1, lsr #31
        mov     r1, r0, lsr #31
        adc     r2, r2, #0
        orr     r0, r12, r0, lsl #1
        and     r3, r3, #1
        orr     r2, r1, r2, lsl #1
        adds    r0, r0, r3
        adc     r1, r2, #0
        b       LADL151
LADL150:
        umull   r12, r0, r3, r11
        str     r0, [sp, #0x40]
        umull   r0, r3, r3, r10
        umull   r1, r0, r10, r2
        adds    r12, r12, r3
        ldr     r3, [sp, #0x40]
        add     r9, r5, r9
        str     r1, [sp, #0x3C]
        umull   r2, r1, r11, r2
        adc     r3, r3, #0
        sub     r9, r9, #0x3F
        adds    r0, r2, r0
        ldr     r2, [sp, #0x3C]
        adc     r1, r1, #0
        adds    r12, r2, r12
        adc     r3, r3, #0
        adds    r0, r3, r0
        mov     r3, r12, lsr #31
        adc     r1, r1, #0
        mov     r2, r0, lsr #31
        mov     r12, r12, lsr #30
        orr     r0, r3, r0, lsl #1
        and     r12, r12, #1
        orr     r1, r2, r1, lsl #1
        adds    r0, r0, r12
        adc     r1, r1, #0
LADL151:
        tst     r1, #1, 2
        bne     LADL154
        cmp     r1, #0
        beq     LADL152
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADL153
LADL152:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADL153:
        ldr     r2, [sp, #0x18]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        add     r9, r9, r2
LADL154:
        cmp     r1, #0
        blt     LADL292
        ldr     r2, [sp, #0x10]
        add     r2, r2, r8, lsl #3
        str     r2, [sp, #0x28]
        ldr     r2, [r2, #4]
        ldr     r12, [r6]
        cmp     r2, #0
        blt     LADL283
        orrs    r3, r2, r12
        str     r3, [sp, #0x18]
        bne     LADL155
        orrs    r3, r1, r0
        bne     LADL155
        ldr     lr, [sp, #0x14]
        ldr     r3, [r7]
        add     lr, lr, r8, lsl #2
        str     lr, [sp]
        b       LADL157
LADL155:
        ldr     lr, [sp, #0x14]
        ldr     r3, [r7]
        add     lr, lr, r8, lsl #2
        str     lr, [sp]
        cmp     r3, r9
        bne     LADL156
        cmp     r2, r1
        bne     LADL156
        cmp     r12, r0
        beq     LADL157
LADL156:
        ldr     lr, [sp, #0x18]
        cmp     lr, #0
        beq     LADL163
        orrs    lr, r1, r0
        beq     LADL157
        cmp     r3, r9
        blt     LADL157
        cmp     r3, r9
        bne     LADL163
        cmp     r2, r1
        bhi     LADL157
        cmp     r2, r1
        bne     LADL163
        cmp     r12, r0
        bls     LADL163
LADL157:
        sub     r9, r9, r3
        cmp     r9, #0x20
        str     r9, [sp, #0x18]
        bcs     LADL158
        ldr     lr, [sp, #0x18]
        rsb     r9, lr, #0x20
        mov     r9, r1, lsl r9
        orr     r0, r9, r0, lsr lr
        mov     lr, r1, asr lr
        b       LADL159
LADL158:
        ldr     r0, [sp, #0x18]
        cmp     r0, #0x40
        movcs   r0, #0x1F
        ldrcc   r0, [sp, #0x18]
        subcc   r0, r0, #0x20
        mov     r0, r1, asr r0
        mov     lr, r1, asr #31
LADL159:
        subs    r12, r12, r0
        sbc     r2, r2, lr
        tst     r2, #1, 2
        mov     r9, r3
        bne     LADL162
        cmp     r2, #0
        bne     LADL160
        cmp     r12, #0
        moveq   r0, #0
        beq     LADL161
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LADL161
LADL160:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r12, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r12, r12, lsl r0
LADL161:
        add     r9, r3, r0
LADL162:
        rsbs    r0, r12, #0
        rsc     r1, r2, #0
        b       LADL168
LADL163:
        sub     r3, r3, r9
        cmp     r3, #0x20
        str     r3, [sp, #0x18]
        bcs     LADL164
        ldr     r3, [sp, #0x18]
        rsb     lr, r3, #0x20
        mov     lr, r2, lsl lr
        orr     r12, lr, r12, lsr r3
        mov     r3, r2, asr r3
        b       LADL165
LADL164:
        ldr     r3, [sp, #0x18]
        cmp     r3, #0x40
        movcs   r3, #0x1F
        ldrcc   r3, [sp, #0x18]
        subcc   r3, r3, #0x20
        mov     r12, r2, asr r3
        mov     r3, r2, asr #31
LADL165:
        subs    r0, r0, r12
        sbc     r1, r1, r3
        tst     r1, #1, 2
        bne     LADL168
        cmp     r1, #0
        bne     LADL166
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL167
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL167
LADL166:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL167:
        add     r9, r9, r2
LADL168:
        cmp     r1, #0
        blt     LADL268
        cmp     r11, #0
        blt     LADL261
        cmp     r4, #0
        bne     LADL169
        orrs    r2, r1, r0
        beq     LADL171
LADL169:
        cmp     r5, r9
        bne     LADL170
        cmp     r11, r1
        bne     LADL170
        cmp     r10, r0
        beq     LADL171
LADL170:
        cmp     r4, #0
        beq     LADL172
        orrs    r2, r1, r0
        beq     LADL171
        cmp     r5, r9
        blt     LADL171
        cmp     r5, r9
        bne     LADL172
        cmp     r11, r1
        bhi     LADL171
        cmp     r11, r1
        bne     LADL172
        cmp     r10, r0
        bls     LADL172
LADL171:
        umull   r3, r2, r10, r1
        str     r2, [sp, #0x40]
        umull   r2, lr, r0, r10
        umull   r2, r0, r0, r11
        adds    r3, lr, r3
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r2, [sp, #0x3C]
        umull   r2, r12, r11, r1
        ldr     r1, [sp, #0x40]
        adc     r1, r1, #0
        adds    r0, r2, r0
        ldr     r2, [sp, #0x3C]
        adc     r12, r12, #0
        adds    r3, r2, r3
        adc     r1, r1, #0
        adds    r0, r1, r0
        mov     r2, r3, lsr #31
        mov     r3, r3, lsr #30
        mov     r1, r0, lsr #31
        adc     r12, r12, #0
        orr     r0, r2, r0, lsl #1
        and     r3, r3, #1
        orr     r12, r1, r12, lsl #1
        adds    r0, r0, r3
        adc     r1, r12, #0
        b       LADL173
LADL172:
        umull   r12, r2, r0, r11
        umull   r3, r0, r0, r10
        umull   r3, lr, r10, r1
        str     lr, [sp, #0x3C]
        adds    r0, r12, r0
        ldr     r12, [sp, #0x3C]
        adc     r2, r2, #0
        str     r3, [sp, #0x40]
        umull   r1, r3, r11, r1
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        adds    r1, r1, r12
        ldr     r12, [sp, #0x40]
        adc     r3, r3, #0
        adds    r0, r12, r0
        adc     r2, r2, #0
        adds    r1, r2, r1
        mov     r2, r0, lsr #30
        mov     r12, r0, lsr #31
        adc     r3, r3, #0
        mov     r0, r1, lsr #31
        orr     r1, r12, r1, lsl #1
        orr     r3, r0, r3, lsl #1
        and     r2, r2, #1
        adds    r0, r1, r2
        adc     r1, r3, #0
LADL173:
        tst     r1, #1, 2
        bne     LADL174
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r4, r2, #0x1F
        clzne   r2, r1
        subne   r4, r2, #1
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        add     r9, r9, r4
LADL174:
        cmp     r1, #0
        blt     LADL235
        ldr     r3, [sp, #0x28]
        ldr     r2, [r3, #-4]
        ldr     r3, [r3, #-8]
        cmp     r2, #0
        blt     LADL221
        orrs    lr, r2, r3
        bne     LADL175
        orrs    r12, r1, r0
        ldreq   r12, [sp]
        ldreq   r12, [r12, #-4]
        beq     LADL177
LADL175:
        ldr     r12, [sp]
        ldr     r12, [r12, #-4]
        cmp     r12, r9
        bne     LADL176
        cmp     r2, r1
        bne     LADL176
        cmp     r3, r0
        beq     LADL177
LADL176:
        cmp     lr, #0
        beq     LADL180
        orrs    lr, r1, r0
        beq     LADL177
        cmp     r12, r9
        blt     LADL177
        cmp     r12, r9
        bne     LADL180
        cmp     r2, r1
        bhi     LADL177
        cmp     r2, r1
        bne     LADL180
        cmp     r3, r0
        bls     LADL180
LADL177:
        sub     r9, r9, r12
        cmp     r9, #0x20
        bcs     LADL178
        rsb     lr, r9, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r9
        mov     r9, r1, asr r9
        b       LADL179
LADL178:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r0, r1, asr r9
        mov     r9, r1, asr #31
LADL179:
        adds    r3, r3, r0
        adc     r2, r2, r9
        tst     r2, r2
        mov     r9, r12
        bpl     LADL183
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r9, r12, #1
        b       LADL183
LADL180:
        sub     r12, r12, r9
        cmp     r12, #0x20
        bcs     LADL181
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADL182
LADL181:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADL182:
        adds    r3, r0, r3
        adc     r2, r1, r12
        tst     r2, r2
        bpl     LADL183
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r9, r9, #1
LADL183:
        sub     r8, r8, #2
        cmp     r8, #2
        sub     r6, r6, #0x10
        sub     r7, r7, #8
        bge     LADL146
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
        ldr     r12, [sp, #0x1C]
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #8]
        orrs    lr, r1, r0
        bne     LADL184
        orrs    r6, r2, r3
        beq     LADL186
LADL184:
        cmp     r12, r9
        bne     LADL185
        cmp     r1, r2
        bne     LADL185
        cmp     r0, r3
        beq     LADL186
LADL185:
        cmp     lr, #0
        beq     LADL187
        orrs    lr, r2, r3
        beq     LADL186
        cmp     r12, r9
        blt     LADL186
        cmp     r12, r9
        bne     LADL187
        cmp     r1, r2
        bhi     LADL186
        cmp     r1, r2
        bne     LADL187
        cmp     r0, r3
        bls     LADL187
LADL186:
        umull   r6, lr, r0, r3
        umull   r0, r6, r0, r2
        umull   r3, r7, r3, r1
        umull   r2, r1, r2, r1
        add     r9, r12, r9
        adds    lr, r0, lr
        adc     r6, r6, #0
        adds    r7, r2, r7
        adc     r1, r1, #0
        adds    lr, r3, lr
        adc     r6, r6, #0
        adds    r7, r6, r7
        mov     r2, lr, lsr #31
        adc     r1, r1, #0
        mov     lr, lr, lsr #30
        orr     r2, r2, r7, lsl #1
        mov     r7, r7, lsr #31
        and     lr, lr, #1
        orr     r1, r7, r1, lsl #1
        adds    r0, r2, lr
        adc     r1, r1, #0
        sub     r6, r9, #0x3F
        b       LADL188
LADL187:
        umull   r6, lr, r0, r3
        umull   r3, r6, r3, r1
        umull   r0, r7, r0, r2
        umull   r2, r1, r2, r1
        add     r9, r12, r9
        adds    r3, lr, r3
        adc     r6, r6, #0
        adds    r7, r2, r7
        adc     r1, r1, #0
        adds    r3, r0, r3
        adc     r6, r6, #0
        adds    r7, r6, r7
        mov     r2, r3, lsr #31
        adc     r1, r1, #0
        mov     r3, r3, lsr #30
        orr     r2, r2, r7, lsl #1
        mov     r7, r7, lsr #31
        and     r3, r3, #1
        orr     r1, r7, r1, lsl #1
        adds    r0, r2, r3
        adc     r1, r1, #0
        sub     r6, r9, #0x3F
LADL188:
        tst     r1, #1, 2
        bne     LADL189
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r7, r2, #0x1F
        clzne   r2, r1
        subne   r7, r2, #1
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashldi3
        add     r6, r6, r7
LADL189:
        cmp     r5, #2, 2
        bcc     LADL203
        cmp     r6, #0x3D
        beq     LADL219
LADL190:
        orrs    r2, r1, r0
        beq     LADL198
        cmp     r6, #0x3D
        bge     LADL197
LADL191:
        rsb     r2, r6, #0x3D
        cmp     r2, #0x20
        bcs     LADL192
        rsb     r12, r2, #0x20
        mov     r3, #1, 2
        mov     r12, r3, lsl r12
        mov     lr, #0
        orr     r12, r12, lr, lsr r2
        mov     r2, r3, asr r2
        b       LADL193
LADL192:
        cmp     r2, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x20
        mov     r3, #1, 2
        mov     r12, r3, asr r2
        mov     r2, #0
LADL193:
        subs    r0, r0, r12
        sbc     r1, r1, r2
        tst     r1, #1, 2
        bne     LADL196
        cmp     r1, #0
        bne     LADL194
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL195
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL195
LADL194:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL195:
        add     r6, r6, r2
LADL196:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL203
LADL197:
        cmp     r6, #0x3D
        beq     LADL218
LADL198:
        sub     r2, r6, #0x3D
        cmp     r2, #0x20
        bcs     LADL199
        rsb     r6, r6, #0x5D
        mov     r3, r1, lsl r6
        orr     r0, r3, r0, lsr r2
        mov     r2, r1, asr r2
        b       LADL200
LADL199:
        cmp     r2, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x5D
        mov     r0, r1, asr r6
        mov     r2, r1, asr #31
LADL200:
        mov     r1, #0
        subs    r0, r1, r0
        mov     r1, #1, 2
        sbc     r1, r1, r2
        tst     r1, #1, 2
        mov     r6, #0x3D
        bne     LADL203
        cmp     r1, #0
        bne     LADL201
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL202
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL202
LADL201:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL202:
        add     r6, r2, #0x3D
LADL203:
        mvn     r2, #2, 2
        bics    r2, r1, r2
        beq     LADL204
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADL204:
        mov     r3, #0x3C
        orr     r3, r3, #1, 22
        rsb     r6, r6, r3
        clz     r3, r1
        cmp     r3, #0x20
        beq     LADL220
LADL205:
        sub     r12, r3, #1
        rsb     r3, r12, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r12
        subs    r3, r6, r12
        mov     r0, r0, lsl r12
        bpl     LADL207
        rsb     r3, r3, #0
        cmp     r3, #0x20
        blt     LADL206
        mov     r0, r1
        mov     r1, r1, asr #31
        sub     r3, r3, #0x20
LADL206:
        cmp     r3, #0x20
        mov     r12, #0x20
        movgt   r3, r12
        mov     r0, r0, lsr r3
        rsb     r12, r3, #0x20
        orr     r0, r0, r1, lsl r12
        mov     r1, r1, asr r3
        mov     r3, #0
LADL207:
        mov     r12, r0, lsr #9
        mov     lr, r1, lsl #22
        orr     r0, lr, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r1, r1, lsr #10
        adc     r12, r1, r12, asr #31
        orrs    r1, r12, r12, asr #31
        moveq   r3, #0
        beq     LADL208
        mov     r1, #0xFE
        orr     r1, r1, #7, 24
        cmp     r1, r3
        bgt     LADL208
        mov     r0, #0
        mov     r1, #0xFF
        orr     r3, r1, #7, 24
        mov     r12, r0
LADL208:
        add     r3, r12, r3, lsl #20
        cmp     r5, #2, 2
        orr     r3, r3, r2
        bcs     LADL211
        ldr     r2, [pc, #-0xE98]
        cmp     r2, r5
        bcs     LADL210
LADL209:
        str     r0, [sp, #0x48]
        add     r1, sp, #0x50
        add     r2, sp, #0x48
        str     r3, [sp, #0x4C]
        add     r0, sp, #0x50
        mov     r3, #0xD0
        bl      __libm_error_support
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL210:
        ldr     r2, [pc, #-0xED0]
        cmp     r2, r5
        bne     LADL211
        ldr     r2, [pc, #-0xED8]
        cmp     r2, r4
        bls     LADL209
LADL211:
        mov     r1, r3
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL212:
        mov     r12, #0
        str     r12, [sp, #0x48]
        add     r1, sp, #0x50
        add     r2, sp, #0x48
        add     r0, sp, #0x50
        str     r12, [sp, #0x4C]
        mov     r3, #0xD0
        bl      __libm_error_support
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LADL213:
        mov     r2, r12, lsl #31
        orr     r1, r2, r1, lsr #1
        mov     r12, r12, lsr #1
        mov     lr, #0x3D
        b       LADL14
LADL214:
        cmp     r2, r7
        bhi     LADL43
        cmp     r2, r7
        bne     LADL45
        ldr     r12, [sp]
        cmp     r3, r12
        bhi     LADL43
        b       LADL45
LADL215:
        ldr     r3, [sp, #0x10]
        cmp     r2, r3
        bhi     LADL67
        ldr     r3, [sp, #0x10]
        cmp     r2, r3
        bne     LADL69
        cmp     r12, r10
        bhi     LADL67
        b       LADL69
LADL216:
        ldr     r12, [sp, #0x10]
        cmp     r2, r12
        bhi     LADL76
        ldr     r12, [sp, #0x10]
        cmp     r2, r12
        bne     LADL78
        cmp     r3, r10
        bhi     LADL76
        b       LADL78
LADL217:
        cmp     r1, r2
        bhi     LADL141
        cmp     r1, r2
        bne     LADL143
        cmp     lr, r3
        bhi     LADL141
        b       LADL143
LADL218:
        cmp     r1, #1, 2
        bhi     LADL191
        cmp     r1, #1, 2
        bne     LADL198
        cmp     r0, #0
        bhi     LADL191
        b       LADL198
LADL219:
        cmp     r1, #1, 2
        bne     LADL190
        cmp     r0, #0
        beq     LADL191
        b       LADL190
LADL220:
        clz     r12, r0
        cmp     r12, #0
        beq     LADL205
        mov     r1, r0
        sub     r6, r6, #0x20
        mov     r3, r12
        mov     r0, #0
        b       LADL205
LADL221:
        ldr     r12, [sp, #0x28]
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        orrs    lr, r2, r3
        str     r3, [r12, #-8]
        str     r2, [r12, #-4]
        bne     LADL222
        orrs    r12, r1, r0
        ldreq   r12, [sp]
        ldreq   r12, [r12, #-4]
        beq     LADL224
LADL222:
        ldr     r12, [sp]
        ldr     r12, [r12, #-4]
        cmp     r12, r9
        bne     LADL223
        cmp     r2, r1
        bne     LADL223
        cmp     r3, r0
        beq     LADL224
LADL223:
        cmp     lr, #0
        beq     LADL230
        orrs    lr, r1, r0
        beq     LADL224
        cmp     r12, r9
        blt     LADL224
        cmp     r12, r9
        bne     LADL230
        cmp     r2, r1
        bhi     LADL224
        cmp     r2, r1
        bne     LADL230
        cmp     r3, r0
        bls     LADL230
LADL224:
        sub     r9, r9, r12
        cmp     r9, #0x20
        bcs     LADL225
        rsb     lr, r9, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r9
        mov     r9, r1, asr r9
        b       LADL226
LADL225:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r0, r1, asr r9
        mov     r9, r1, asr #31
LADL226:
        subs    r3, r3, r0
        sbc     r2, r2, r9
        tst     r2, #1, 2
        mov     r9, r12
        bne     LADL229
        cmp     r2, #0
        bne     LADL227
        cmp     r3, #0
        moveq   r0, #0
        beq     LADL228
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADL228
LADL227:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r3, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r3, r3, lsl r0
LADL228:
        add     r9, r12, r0
LADL229:
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        b       LADL183
LADL230:
        sub     r12, r12, r9
        cmp     r12, #0x20
        bcs     LADL231
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADL232
LADL231:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADL232:
        subs    r3, r0, r3
        sbc     r2, r1, r12
        tst     r2, #1, 2
        bne     LADL183
        cmp     r2, #0
        bne     LADL233
        cmp     r3, #0
        moveq   r0, #0
        beq     LADL234
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADL234
LADL233:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r3, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r3, r3, lsl r0
LADL234:
        add     r9, r9, r0
        b       LADL183
LADL235:
        ldr     r3, [sp, #0x28]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        ldr     r2, [r3, #-4]
        ldr     r3, [r3, #-8]
        cmp     r2, #0
        blt     LADL249
        orrs    lr, r1, r0
        bne     LADL236
        orrs    r12, r2, r3
        ldreq   r12, [sp]
        ldreq   r12, [r12, #-4]
        beq     LADL238
LADL236:
        ldr     r12, [sp]
        ldr     r12, [r12, #-4]
        cmp     r9, r12
        bne     LADL237
        cmp     r1, r2
        bne     LADL237
        cmp     r0, r3
        beq     LADL238
LADL237:
        cmp     lr, #0
        beq     LADL244
        orrs    lr, r2, r3
        beq     LADL238
        cmp     r9, r12
        blt     LADL238
        cmp     r9, r12
        bne     LADL244
        cmp     r1, r2
        bhi     LADL238
        cmp     r1, r2
        bne     LADL244
        cmp     r0, r3
        bls     LADL244
LADL238:
        sub     r12, r12, r9
        cmp     r12, #0x20
        bcs     LADL239
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADL240
LADL239:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADL240:
        subs    r0, r0, r3
        sbc     r1, r1, r12
        tst     r1, #1, 2
        bne     LADL243
        cmp     r1, #0
        bne     LADL241
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL242
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL242
LADL241:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL242:
        add     r9, r9, r2
LADL243:
        rsbs    r3, r0, #0
        rsc     r2, r1, #0
        b       LADL183
LADL244:
        sub     r9, r9, r12
        cmp     r9, #0x20
        bcs     LADL245
        rsb     lr, r9, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r9
        mov     r9, r1, asr r9
        b       LADL246
LADL245:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r0, r1, asr r9
        mov     r9, r1, asr #31
LADL246:
        subs    r3, r3, r0
        sbc     r2, r2, r9
        tst     r2, #1, 2
        mov     r9, r12
        bne     LADL183
        cmp     r2, #0
        bne     LADL247
        cmp     r3, #0
        moveq   r0, #0
        beq     LADL248
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADL248
LADL247:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r3, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r3, r3, lsl r0
LADL248:
        add     r9, r12, r0
        b       LADL183
LADL249:
        ldr     r12, [sp, #0x28]
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        orrs    lr, r2, r3
        str     r3, [r12, #-8]
        str     r2, [r12, #-4]
        bne     LADL250
        orrs    r12, r1, r0
        ldreq   r12, [sp]
        ldreq   r12, [r12, #-4]
        beq     LADL252
LADL250:
        ldr     r12, [sp]
        ldr     r12, [r12, #-4]
        cmp     r12, r9
        bne     LADL251
        cmp     r2, r1
        bne     LADL251
        cmp     r3, r0
        beq     LADL252
LADL251:
        cmp     lr, #0
        beq     LADL255
        orrs    lr, r1, r0
        beq     LADL252
        cmp     r12, r9
        blt     LADL252
        cmp     r12, r9
        bne     LADL255
        cmp     r2, r1
        bhi     LADL252
        cmp     r2, r1
        bne     LADL255
        cmp     r3, r0
        bls     LADL255
LADL252:
        sub     r9, r9, r12
        cmp     r9, #0x20
        bcs     LADL253
        rsb     lr, r9, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r9
        mov     r9, r1, asr r9
        b       LADL254
LADL253:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r0, r1, asr r9
        mov     r9, r1, asr #31
LADL254:
        adds    r3, r3, r0
        adc     r2, r2, r9
        tst     r2, r2
        mov     r9, r12
        bmi     LADL259
        b       LADL258
LADL255:
        sub     r12, r12, r9
        cmp     r12, #0x20
        bcs     LADL256
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADL257
LADL256:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADL257:
        adds    r3, r0, r3
        adc     r2, r1, r12
        tst     r2, r2
        bmi     LADL260
LADL258:
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        b       LADL183
LADL259:
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r9, r12, #1
        b       LADL258
LADL260:
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r9, r9, #1
        b       LADL258
LADL261:
        rsbs    r10, r10, #0
        rsc     r11, r11, #0
        orrs    r3, r11, r10
        bne     LADL262
        orrs    r2, r1, r0
        beq     LADL264
LADL262:
        cmp     r5, r9
        bne     LADL263
        cmp     r11, r1
        bne     LADL263
        cmp     r10, r0
        beq     LADL264
LADL263:
        cmp     r3, #0
        beq     LADL265
        orrs    r2, r1, r0
        beq     LADL264
        cmp     r5, r9
        blt     LADL264
        cmp     r5, r9
        bne     LADL265
        cmp     r11, r1
        bhi     LADL264
        cmp     r11, r1
        bne     LADL265
        cmp     r10, r0
        bls     LADL265
LADL264:
        umull   r3, r2, r10, r1
        str     r2, [sp, #0x40]
        umull   r2, r12, r0, r10
        umull   r0, r2, r0, r11
        adds    r3, r12, r3
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r2, [sp, #0x3C]
        str     r0, [sp, #0x38]
        umull   r2, r1, r11, r1
        ldr     r0, [sp, #0x40]
        ldr     r12, [sp, #0x3C]
        adc     r0, r0, #0
        adds    r2, r2, r12
        ldr     r12, [sp, #0x38]
        adc     r1, r1, #0
        adds    r3, r12, r3
        adc     r0, r0, #0
        adds    r2, r0, r2
        adc     r1, r1, #0
        mov     r12, r3, lsr #31
        mov     r0, r2, lsr #31
        mov     r3, r3, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r2, r12, r2, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r1, #0
        b       LADL266
LADL265:
        umull   r12, r2, r0, r11
        umull   r3, r0, r0, r10
        umull   lr, r3, r10, r1
        add     r9, r5, r9
        adds    r0, r12, r0
        str     r3, [sp, #0x40]
        umull   r1, r3, r11, r1
        ldr     r12, [sp, #0x40]
        adc     r2, r2, #0
        str     lr, [sp, #0x3C]
        sub     r9, r9, #0x3F
        adds    r1, r1, r12
        ldr     r12, [sp, #0x3C]
        adc     r3, r3, #0
        adds    r0, r12, r0
        adc     r2, r2, #0
        adds    r1, r2, r1
        mov     r2, r0, lsr #30
        mov     r12, r0, lsr #31
        adc     r3, r3, #0
        mov     r0, r1, lsr #31
        orr     r1, r12, r1, lsl #1
        orr     r3, r0, r3, lsl #1
        and     r2, r2, #1
        adds    r0, r1, r2
        adc     r1, r3, #0
LADL266:
        tst     r1, #1, 2
        bne     LADL267
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r4, r2, #0x1F
        clzne   r2, r1
        subne   r4, r2, #1
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        add     r9, r9, r4
LADL267:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL174
LADL268:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        cmp     r11, #0
        blt     LADL275
        cmp     r4, #0
        bne     LADL269
        orrs    r2, r1, r0
        beq     LADL271
LADL269:
        cmp     r5, r9
        bne     LADL270
        cmp     r11, r1
        bne     LADL270
        cmp     r10, r0
        beq     LADL271
LADL270:
        cmp     r4, #0
        beq     LADL272
        orrs    r2, r1, r0
        beq     LADL271
        cmp     r5, r9
        blt     LADL271
        cmp     r5, r9
        bne     LADL272
        cmp     r11, r1
        bhi     LADL271
        cmp     r11, r1
        bne     LADL272
        cmp     r10, r0
        bls     LADL272
LADL271:
        umull   r3, r2, r10, r1
        str     r2, [sp, #0x40]
        umull   r2, r12, r0, r10
        umull   r0, r2, r0, r11
        adds    r3, r12, r3
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r2, [sp, #0x38]
        str     r0, [sp, #0x3C]
        umull   r2, r1, r11, r1
        ldr     r0, [sp, #0x40]
        ldr     r12, [sp, #0x38]
        adc     r0, r0, #0
        adds    r2, r2, r12
        ldr     r12, [sp, #0x3C]
        adc     r1, r1, #0
        adds    r3, r12, r3
        adc     r0, r0, #0
        adds    r2, r0, r2
        adc     r1, r1, #0
        mov     r12, r3, lsr #31
        mov     r0, r2, lsr #31
        mov     r3, r3, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r2, r12, r2, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r1, #0
        b       LADL273
LADL272:
        umull   r12, r2, r0, r11
        umull   r0, lr, r0, r10
        umull   r3, r0, r10, r1
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r0, [sp, #0x40]
        str     r3, [sp, #0x3C]
        umull   r0, r3, r11, r1
        adds    r1, r12, lr
        ldr     r12, [sp, #0x40]
        adc     r2, r2, #0
        adds    r0, r0, r12
        ldr     r12, [sp, #0x3C]
        adc     r3, r3, #0
        adds    r1, r12, r1
        adc     r2, r2, #0
        adds    r0, r2, r0
        mov     r2, r1, lsr #30
        mov     r12, r1, lsr #31
        mov     r1, r0, lsr #31
        adc     r3, r3, #0
        orr     r0, r12, r0, lsl #1
        and     r2, r2, #1
        orr     r3, r1, r3, lsl #1
        adds    r0, r0, r2
        adc     r1, r3, #0
LADL273:
        tst     r1, #1, 2
        bne     LADL274
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r4, r2, #0x1F
        clzne   r2, r1
        subne   r4, r2, #1
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        add     r9, r9, r4
LADL274:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL174
LADL275:
        rsbs    r10, r10, #0
        rsc     r11, r11, #0
        orrs    r3, r11, r10
        bne     LADL276
        orrs    r2, r1, r0
        beq     LADL278
LADL276:
        cmp     r5, r9
        bne     LADL277
        cmp     r11, r1
        bne     LADL277
        cmp     r10, r0
        beq     LADL278
LADL277:
        cmp     r3, #0
        beq     LADL279
        orrs    r2, r1, r0
        beq     LADL278
        cmp     r5, r9
        blt     LADL278
        cmp     r5, r9
        bne     LADL279
        cmp     r11, r1
        bhi     LADL278
        cmp     r11, r1
        bne     LADL279
        cmp     r10, r0
        bls     LADL279
LADL278:
        umull   r2, r3, r10, r1
        str     r3, [sp, #0x40]
        umull   r12, r3, r0, r10
        umull   r0, r12, r0, r11
        adds    r2, r3, r2
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r0, [sp, #0x38]
        umull   r1, r0, r11, r1
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x40]
        str     r12, [sp, #0x3C]
        ldr     r3, [sp, #0x3C]
        ldr     r12, [sp, #0x38]
        adc     r0, r0, #0
        adds    r3, r1, r3
        ldr     r1, [sp, #0x18]
        adc     r1, r1, #0
        adds    r2, r12, r2
        adc     r0, r0, #0
        adds    r3, r0, r3
        adc     r1, r1, #0
        str     r1, [sp, #0x40]
        mov     r1, r2, lsr #31
        mov     r0, r3, lsr #31
        orr     r3, r1, r3, lsl #1
        ldr     r1, [sp, #0x40]
        mov     r2, r2, lsr #30
        and     r2, r2, #1
        orr     r1, r0, r1, lsl #1
        adds    r0, r3, r2
        adc     r1, r1, #0
        b       LADL280
LADL279:
        umull   r2, r3, r0, r11
        str     r3, [sp, #0x40]
        umull   r3, r0, r0, r10
        umull   r12, r3, r10, r1
        adds    r2, r2, r0
        ldr     r0, [sp, #0x40]
        add     r9, r5, r9
        str     r3, [sp, #0x3C]
        umull   r1, r3, r11, r1
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x3C]
        adc     r0, r0, #0
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x38]
        adds    r3, r1, r3
        ldr     r1, [sp, #0x18]
        sub     r9, r9, #0x3F
        adc     r1, r1, #0
        adds    r2, r12, r2
        adc     r0, r0, #0
        adds    r3, r0, r3
        adc     r1, r1, #0
        str     r1, [sp, #0x40]
        mov     r1, r2, lsr #31
        mov     r0, r3, lsr #31
        orr     r3, r1, r3, lsl #1
        ldr     r1, [sp, #0x40]
        mov     r2, r2, lsr #30
        and     r2, r2, #1
        orr     r1, r0, r1, lsl #1
        adds    r0, r3, r2
        adc     r1, r1, #0
LADL280:
        tst     r1, #1, 2
        bne     LADL174
        cmp     r1, #0
        beq     LADL281
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADL282
LADL281:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADL282:
        ldr     r4, [sp, #0x18]
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        add     r9, r9, r4
        b       LADL174
LADL283:
        rsbs    r12, r12, #0
        rsc     r2, r2, #0
        str     r2, [sp, #0x18]
        orrs    r3, r2, r12
        str     r12, [r6]
        str     r2, [r6, #4]
        bne     LADL284
        orrs    r2, r1, r0
        bne     LADL284
        ldr     r2, [r7]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        add     r2, r2, r8, lsl #2
        str     r2, [sp]
        b       LADL286
LADL284:
        ldr     r2, [r7]
        ldr     lr, [sp, #0x14]
        cmp     r2, r9
        str     r2, [sp, #0xC]
        add     lr, lr, r8, lsl #2
        str     lr, [sp]
        bne     LADL285
        ldr     r2, [sp, #0x18]
        cmp     r2, r1
        bne     LADL285
        cmp     r12, r0
        beq     LADL286
LADL285:
        cmp     r3, #0
        beq     LADL289
        orrs    r2, r1, r0
        beq     LADL286
        ldr     r2, [sp, #0xC]
        cmp     r2, r9
        blt     LADL286
        ldr     r2, [sp, #0xC]
        cmp     r2, r9
        bne     LADL289
        ldr     r2, [sp, #0x18]
        cmp     r2, r1
        bhi     LADL286
        ldr     r2, [sp, #0x18]
        cmp     r2, r1
        bne     LADL289
        cmp     r12, r0
        bls     LADL289
LADL286:
        ldr     r2, [sp, #0xC]
        sub     r9, r9, r2
        cmp     r9, #0x20
        bcs     LADL287
        rsb     r2, r9, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r9
        mov     r9, r1, asr r9
        b       LADL288
LADL287:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r0, r1, asr r9
        mov     r9, r1, asr #31
LADL288:
        ldr     r1, [sp, #0x18]
        adds    r0, r12, r0
        adc     r1, r1, r9
        ldr     r9, [sp, #0xC]
        tst     r1, r1
        bpl     LADL168
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        ldr     r2, [sp, #0xC]
        mov     r1, r1, lsr #1
        sub     r9, r2, #1
        b       LADL168
LADL289:
        ldr     r2, [sp, #0xC]
        sub     r2, r2, r9
        cmp     r2, #0x20
        bcs     LADL290
        ldr     r3, [sp, #0x18]
        rsb     lr, r2, #0x20
        mov     lr, r3, lsl lr
        orr     r12, lr, r12, lsr r2
        mov     r2, r3, asr r2
        b       LADL291
LADL290:
        cmp     r2, #0x40
        movcs   r3, #0x1F
        subcc   r3, r2, #0x20
        ldr     r2, [sp, #0x18]
        mov     r12, r2, asr r3
        mov     r2, r2, asr #31
LADL291:
        adds    r0, r0, r12
        adc     r1, r1, r2
        tst     r1, r1
        bpl     LADL168
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r9, r9, #1
        b       LADL168
LADL292:
        ldr     r2, [r6]
        str     r2, [sp, #0x18]
        rsbs    r2, r0, #0
        ldr     r0, [sp, #0x10]
        rsc     r1, r1, #0
        orr     r3, r1, r2
        add     r0, r0, r8, lsl #3
        str     r0, [sp, #0x28]
        ldr     r0, [r0, #4]
        cmp     r0, #0
        blt     LADL304
        cmp     r3, #0
        bne     LADL293
        ldr     r12, [sp, #0x18]
        orrs    r12, r0, r12
        bne     LADL293
        ldr     r3, [sp, #0x14]
        ldr     r12, [r7]
        add     r3, r3, r8, lsl #2
        str     r3, [sp]
        b       LADL295
LADL293:
        ldr     lr, [sp, #0x14]
        ldr     r12, [r7]
        add     lr, lr, r8, lsl #2
        str     lr, [sp]
        cmp     r9, r12
        bne     LADL294
        cmp     r1, r0
        bne     LADL294
        ldr     lr, [sp, #0x18]
        cmp     r2, lr
        beq     LADL295
LADL294:
        cmp     r3, #0
        beq     LADL298
        ldr     r3, [sp, #0x18]
        orrs    r3, r0, r3
        beq     LADL295
        cmp     r9, r12
        blt     LADL295
        cmp     r9, r12
        bne     LADL298
        cmp     r1, r0
        bhi     LADL295
        cmp     r1, r0
        bne     LADL298
        ldr     r3, [sp, #0x18]
        cmp     r2, r3
        bls     LADL298
LADL295:
        sub     r12, r12, r9
        cmp     r12, #0x20
        bcs     LADL296
        ldr     lr, [sp, #0x18]
        rsb     r3, r12, #0x20
        mov     r3, r0, lsl r3
        orr     r3, r3, lr, lsr r12
        mov     r12, r0, asr r12
        b       LADL297
LADL296:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r0, asr r12
        mov     r12, r0, asr #31
LADL297:
        adds    r2, r2, r3
        adc     r1, r1, r12
        tst     r1, r1
        bmi     LADL302
        b       LADL301
LADL298:
        sub     r9, r9, r12
        cmp     r9, #0x20
        bcs     LADL299
        rsb     r3, r9, #0x20
        mov     r3, r1, lsl r3
        orr     r2, r3, r2, lsr r9
        mov     r9, r1, asr r9
        b       LADL300
LADL299:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r2, r1, asr r9
        mov     r9, r1, asr #31
LADL300:
        ldr     r1, [sp, #0x18]
        adds    r2, r1, r2
        adc     r1, r0, r9
        tst     r1, r1
        mov     r9, r12
        bmi     LADL303
LADL301:
        rsbs    r0, r2, #0
        rsc     r1, r1, #0
        b       LADL168
LADL302:
        mov     r0, r1, lsl #31
        orr     r2, r0, r2, lsr #1
        mov     r1, r1, lsr #1
        sub     r9, r9, #1
        b       LADL301
LADL303:
        mov     r0, r1, lsl #31
        orr     r2, r0, r2, lsr #1
        mov     r1, r1, lsr #1
        sub     r9, r12, #1
        b       LADL301
LADL304:
        ldr     r12, [sp, #0x18]
        rsbs    r12, r12, #0
        rsc     r0, r0, #0
        str     r0, [sp, #0xC]
        cmp     r3, #0
        str     r12, [r6]
        str     r0, [r6, #4]
        bne     LADL305
        ldr     r0, [sp, #0xC]
        orrs    r0, r0, r12
        bne     LADL305
        ldr     r0, [r7]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r0, r0, r8, lsl #2
        str     r0, [sp]
        b       LADL307
LADL305:
        ldr     r0, [r7]
        ldr     lr, [sp, #0x14]
        cmp     r9, r0
        str     r0, [sp, #0x18]
        add     lr, lr, r8, lsl #2
        str     lr, [sp]
        bne     LADL306
        ldr     r0, [sp, #0xC]
        cmp     r1, r0
        bne     LADL306
        cmp     r2, r12
        beq     LADL307
LADL306:
        cmp     r3, #0
        beq     LADL313
        ldr     r0, [sp, #0xC]
        orrs    r0, r0, r12
        beq     LADL307
        ldr     r0, [sp, #0x18]
        cmp     r9, r0
        blt     LADL307
        ldr     r0, [sp, #0x18]
        cmp     r9, r0
        bne     LADL313
        ldr     r0, [sp, #0xC]
        cmp     r1, r0
        bhi     LADL307
        ldr     r0, [sp, #0xC]
        cmp     r1, r0
        bne     LADL313
        cmp     r2, r12
        bls     LADL313
LADL307:
        ldr     r0, [sp, #0x18]
        sub     r0, r0, r9
        cmp     r0, #0x20
        bcs     LADL308
        ldr     r3, [sp, #0xC]
        rsb     lr, r0, #0x20
        mov     lr, r3, lsl lr
        orr     r12, lr, r12, lsr r0
        mov     r0, r3, asr r0
        b       LADL309
LADL308:
        cmp     r0, #0x40
        movcs   r3, #0x1F
        subcc   r3, r0, #0x20
        ldr     r0, [sp, #0xC]
        mov     r12, r0, asr r3
        mov     r0, r0, asr #31
LADL309:
        subs    r2, r2, r12
        sbc     r1, r1, r0
        tst     r1, #1, 2
        bne     LADL312
        cmp     r1, #0
        bne     LADL310
        cmp     r2, #0
        moveq   r0, #0
        beq     LADL311
        clz     r0, r2
        mov     r2, r2, lsl r0
        add     r0, r0, #0x1F
        mov     r1, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL311
LADL310:
        clz     r0, r1
        sub     r0, r0, #1
        rsb     r3, r0, #0x20
        mov     r3, r2, lsr r3
        orr     r1, r3, r1, lsl r0
        mov     r2, r2, lsl r0
LADL311:
        add     r9, r9, r0
LADL312:
        rsbs    r0, r2, #0
        rsc     r1, r1, #0
        b       LADL168
LADL313:
        ldr     r0, [sp, #0x18]
        sub     r9, r9, r0
        cmp     r9, #0x20
        bcs     LADL314
        rsb     r0, r9, #0x20
        mov     r0, r1, lsl r0
        orr     r2, r0, r2, lsr r9
        mov     r9, r1, asr r9
        b       LADL315
LADL314:
        cmp     r9, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x20
        mov     r2, r1, asr r9
        mov     r9, r1, asr #31
LADL315:
        ldr     r1, [sp, #0xC]
        subs    r0, r12, r2
        sbc     r1, r1, r9
        ldr     r9, [sp, #0x18]
        tst     r1, #1, 2
        bne     LADL168
        cmp     r1, #0
        bne     LADL316
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL317
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL317
LADL316:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL317:
        ldr     r3, [sp, #0x18]
        add     r9, r3, r2
        b       LADL168
LADL318:
        rsbs    r10, r10, #0
        rsc     r11, r11, #0
        orrs    r4, r11, r10
        bne     LADL319
        orrs    r0, r2, r3
        beq     LADL321
LADL319:
        cmp     r5, r9
        bne     LADL320
        cmp     r11, r2
        bne     LADL320
        cmp     r10, r3
        beq     LADL321
LADL320:
        cmp     r4, #0
        beq     LADL322
        orrs    r0, r2, r3
        beq     LADL321
        cmp     r5, r9
        blt     LADL321
        cmp     r5, r9
        bne     LADL322
        cmp     r11, r2
        bhi     LADL321
        cmp     r11, r2
        bne     LADL322
        cmp     r10, r3
        bls     LADL322
LADL321:
        umull   r0, r1, r10, r2
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r0, [sp, #0x40]
        umull   r0, r12, r3, r10
        umull   r3, r0, r3, r11
        ldr     lr, [sp, #0x40]
        str     r3, [sp, #0x3C]
        umull   r2, r3, r11, r2
        adds    r12, r12, lr
        adc     r1, r1, #0
        adds    r0, r2, r0
        ldr     r2, [sp, #0x3C]
        adc     r3, r3, #0
        adds    r12, r2, r12
        adc     r1, r1, #0
        adds    r0, r1, r0
        mov     r2, r12, lsr #31
        mov     r12, r12, lsr #30
        mov     r1, r0, lsr #31
        adc     r3, r3, #0
        orr     r0, r2, r0, lsl #1
        and     r12, r12, #1
        orr     r3, r1, r3, lsl #1
        adds    r0, r0, r12
        adc     r1, r3, #0
        b       LADL323
LADL322:
        umull   r1, r0, r3, r11
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r1, [sp, #0x40]
        umull   r1, r3, r3, r10
        umull   r1, r12, r10, r2
        ldr     lr, [sp, #0x40]
        str     r12, [sp, #0x3C]
        umull   r2, r12, r11, r2
        adds    r3, lr, r3
        ldr     lr, [sp, #0x3C]
        adc     r0, r0, #0
        adds    r2, r2, lr
        adc     r12, r12, #0
        adds    r3, r1, r3
        adc     r0, r0, #0
        adds    r2, r0, r2
        mov     r1, r3, lsr #31
        adc     r12, r12, #0
        mov     r0, r2, lsr #31
        mov     r3, r3, lsr #30
        orr     r2, r1, r2, lsl #1
        orr     r12, r0, r12, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r12, #0
LADL323:
        tst     r1, #1, 2
        bne     LADL326
        cmp     r1, #0
        beq     LADL324
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADL325
LADL324:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADL325:
        ldr     r2, [sp, #0x18]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        add     r9, r9, r2
LADL326:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL154
LADL327:
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        cmp     r11, #0
        blt     LADL336
        orrs    r4, r11, r10
        bne     LADL328
        orrs    r0, r2, r3
        beq     LADL330
LADL328:
        cmp     r5, r9
        bne     LADL329
        cmp     r11, r2
        bne     LADL329
        cmp     r10, r3
        beq     LADL330
LADL329:
        cmp     r4, #0
        beq     LADL331
        orrs    r0, r2, r3
        beq     LADL330
        cmp     r5, r9
        blt     LADL330
        cmp     r5, r9
        bne     LADL331
        cmp     r11, r2
        bhi     LADL330
        cmp     r11, r2
        bne     LADL331
        cmp     r10, r3
        bls     LADL331
LADL330:
        umull   lr, r0, r3, r10
        umull   r1, r12, r10, r2
        umull   r3, lr, r3, r11
        add     r9, r5, r9
        str     lr, [sp, #0x40]
        umull   lr, r2, r11, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        sub     r9, r9, #0x3F
        str     lr, [sp, #0x3C]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x40]
        adds    r0, r0, lr
        adc     r2, r2, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    r0, r12, r0
        mov     r3, r1, lsr #30
        mov     r12, r1, lsr #31
        mov     r1, r0, lsr #31
        adc     r2, r2, #0
        orr     r0, r12, r0, lsl #1
        and     r3, r3, #1
        orr     r2, r1, r2, lsl #1
        adds    r0, r0, r3
        adc     r1, r2, #0
        b       LADL332
LADL331:
        umull   r1, r0, r3, r11
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r1, [sp, #0x40]
        umull   r1, r3, r3, r10
        umull   r1, r12, r10, r2
        ldr     lr, [sp, #0x40]
        str     r12, [sp, #0x3C]
        umull   r2, r12, r11, r2
        adds    r3, lr, r3
        ldr     lr, [sp, #0x3C]
        adc     r0, r0, #0
        adds    r2, r2, lr
        adc     r12, r12, #0
        adds    r3, r1, r3
        adc     r0, r0, #0
        adds    r2, r0, r2
        mov     r1, r3, lsr #31
        adc     r12, r12, #0
        mov     r0, r2, lsr #31
        mov     r3, r3, lsr #30
        orr     r2, r1, r2, lsl #1
        orr     r12, r0, r12, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r12, #0
LADL332:
        tst     r1, #1, 2
        bne     LADL335
        cmp     r1, #0
        beq     LADL333
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADL334
LADL333:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADL334:
        ldr     r2, [sp, #0x18]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        add     r9, r9, r2
LADL335:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL154
LADL336:
        rsbs    r10, r10, #0
        rsc     r11, r11, #0
        orrs    r4, r11, r10
        bne     LADL337
        orrs    r0, r2, r3
        beq     LADL339
LADL337:
        cmp     r5, r9
        bne     LADL338
        cmp     r11, r2
        bne     LADL338
        cmp     r10, r3
        beq     LADL339
LADL338:
        cmp     r4, #0
        beq     LADL340
        orrs    r0, r2, r3
        beq     LADL339
        cmp     r5, r9
        blt     LADL339
        cmp     r5, r9
        bne     LADL340
        cmp     r11, r2
        bhi     LADL339
        cmp     r11, r2
        bne     LADL340
        cmp     r10, r3
        bls     LADL340
LADL339:
        umull   r0, r1, r10, r2
        str     r1, [sp, #0x40]
        umull   r12, r1, r3, r10
        umull   r3, r12, r3, r11
        adds    r1, r1, r0
        ldr     r0, [sp, #0x40]
        add     r9, r5, r9
        str     r3, [sp, #0x38]
        umull   r2, r3, r11, r2
        adc     r0, r0, #0
        str     r0, [sp, #0x40]
        str     r12, [sp, #0x3C]
        ldr     r0, [sp, #0x3C]
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x38]
        adds    r2, r2, r0
        ldr     r0, [sp, #0x28]
        sub     r9, r9, #0x3F
        adc     r0, r0, #0
        adds    r1, r3, r1
        ldr     r3, [sp, #0x40]
        mov     r12, r1, lsr #31
        adc     r3, r3, #0
        adds    r2, r3, r2
        mov     r3, r1, lsr #30
        adc     r0, r0, #0
        mov     r1, r2, lsr #31
        orr     r2, r12, r2, lsl #1
        orr     r1, r1, r0, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r1, #0
        b       LADL341
LADL340:
        umull   r0, r1, r3, r11
        str     r1, [sp, #0x40]
        umull   r3, r1, r3, r10
        umull   r12, r3, r10, r2
        add     r9, r5, r9
        sub     r9, r9, #0x3F
        str     r3, [sp, #0x3C]
        umull   r2, r3, r11, r2
        str     r3, [sp, #0x28]
        adds    r3, r0, r1
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x38]
        adc     r0, r0, #0
        adds    r2, r2, r1
        ldr     r1, [sp, #0x28]
        adc     r1, r1, #0
        adds    r3, r12, r3
        adc     r0, r0, #0
        adds    r2, r0, r2
        adc     r1, r1, #0
        mov     r12, r3, lsr #31
        mov     r0, r2, lsr #31
        mov     r3, r3, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r2, r12, r2, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r1, #0
LADL341:
        tst     r1, #1, 2
        bne     LADL154
        cmp     r1, #0
        beq     LADL342
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADL343
LADL342:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADL343:
        ldr     r2, [sp, #0x18]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        add     r9, r9, r2
        b       LADL154
LADL344:
        cmp     r1, r2
        bne     LADL140
        cmp     lr, r3
        beq     LADL141
        b       LADL140
LADL345:
        rsbs    r7, r0, #0
        rsc     r1, r1, #0
        str     r4, [sp, #8]
        mov     r8, #6
        str     r5, [sp, #4]
        mov     r4, r1
LADL346:
        cmp     r2, #0
        blt     LADL374
        cmp     r4, #0
        blt     LADL367
        orrs    r12, r4, r7
        bne     LADL347
        orrs    r0, r2, r3
        beq     LADL349
LADL347:
        cmp     r6, r11
        bne     LADL348
        cmp     r4, r2
        bne     LADL348
        cmp     r7, r3
        beq     LADL349
LADL348:
        cmp     r12, #0
        beq     LADL350
        orrs    r0, r2, r3
        beq     LADL349
        cmp     r6, r11
        blt     LADL349
        cmp     r6, r11
        bne     LADL350
        cmp     r4, r2
        bhi     LADL349
        cmp     r4, r2
        bne     LADL350
        cmp     r7, r3
        bls     LADL350
LADL349:
        umull   r1, r12, r7, r2
        umull   lr, r0, r3, r7
        umull   r3, lr, r3, r4
        umull   r2, r5, r4, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    lr, r2, lr
        adc     r5, r5, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r2, r1, lsr #31
        adc     r5, r5, #0
        mov     r0, lr, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r5, r0, r5, lsl #1
        orr     lr, r2, lr, lsl #1
        adds    r0, lr, r1
        adc     r1, r5, #0
        b       LADL351
LADL350:
        umull   r0, r1, r3, r4
        umull   r12, r3, r3, r7
        umull   lr, r12, r7, r2
        umull   r2, r5, r4, r2
        adds    r3, r0, r3
        adc     r1, r1, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    r12, r2, r12
        adc     r5, r5, #0
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r12, r1, r12
        mov     r1, r3, lsr #31
        adc     r5, r5, #0
        mov     r0, r12, lsr #31
        mov     r3, r3, lsr #30
        orr     r12, r1, r12, lsl #1
        orr     r5, r0, r5, lsl #1
        and     r3, r3, #1
        adds    r0, r12, r3
        adc     r1, r5, #0
LADL351:
        tst     r1, #1, 2
        bne     LADL352
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r5, r2, #0x1F
        clzne   r2, r1
        subne   r5, r2, #1
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        add     r11, r11, r5
LADL352:
        orrs    lr, r1, r0
        ldrne   r3, [r10, #-8]
        ldrne   r2, [r10, #-4]
        bne     LADL353
        ldr     r3, [r10, #-8]
        ldr     r2, [r10, #-4]
        orrs    r12, r2, r3
        ldreq   r12, [r9, #-4]
        beq     LADL355
LADL353:
        ldr     r12, [r9, #-4]
        cmp     r11, r12
        bne     LADL354
        cmp     r1, r2
        bne     LADL354
        cmp     r0, r3
        beq     LADL355
LADL354:
        cmp     lr, #0
        beq     LADL361
        orrs    lr, r2, r3
        beq     LADL355
        cmp     r11, r12
        blt     LADL355
        cmp     r11, r12
        bne     LADL361
        cmp     r1, r2
        bhi     LADL355
        cmp     r1, r2
        bne     LADL361
        cmp     r0, r3
        bls     LADL361
LADL355:
        sub     r12, r12, r11
        cmp     r12, #0x20
        bcs     LADL356
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADL357
LADL356:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADL357:
        subs    r0, r0, r3
        sbc     r1, r1, r12
        tst     r1, #1, 2
        bne     LADL360
        cmp     r1, #0
        bne     LADL358
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL359
        clz     r2, r0
        mov     r0, r0, lsl r2
        add     r2, r2, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL359
LADL358:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL359:
        add     r11, r11, r2
LADL360:
        rsbs    r3, r0, #0
        rsc     r2, r1, #0
        b       LADL366
LADL361:
        sub     r11, r11, r12
        cmp     r11, #0x20
        bcs     LADL362
        rsb     lr, r11, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADL363
LADL362:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADL363:
        subs    r3, r3, r0
        sbc     r2, r2, r11
        tst     r2, #1, 2
        mov     r11, r12
        bne     LADL366
        cmp     r2, #0
        bne     LADL364
        cmp     r3, #0
        moveq   r0, #0
        beq     LADL365
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADL365
LADL364:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     lr, r0, #0x20
        mov     lr, r3, lsr lr
        orr     r2, lr, r2, lsl r0
        mov     r3, r3, lsl r0
LADL365:
        add     r11, r12, r0
LADL366:
        sub     r8, r8, #1
        cmp     r8, #0
        sub     r9, r9, #4
        sub     r10, r10, #8
        bgt     LADL346
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #8]
        b       LADL138
LADL367:
        rsbs    r7, r7, #0
        rsc     r4, r4, #0
        orrs    r12, r4, r7
        bne     LADL368
        orrs    r0, r2, r3
        beq     LADL370
LADL368:
        cmp     r6, r11
        bne     LADL369
        cmp     r4, r2
        bne     LADL369
        cmp     r7, r3
        beq     LADL370
LADL369:
        cmp     r12, #0
        beq     LADL371
        orrs    r0, r2, r3
        beq     LADL370
        cmp     r6, r11
        blt     LADL370
        cmp     r6, r11
        bne     LADL371
        cmp     r4, r2
        bhi     LADL370
        cmp     r4, r2
        bne     LADL371
        cmp     r7, r3
        bls     LADL371
LADL370:
        umull   r1, r12, r7, r2
        umull   lr, r0, r3, r7
        umull   r3, lr, r3, r4
        umull   r2, r5, r4, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    lr, r2, lr
        adc     r5, r5, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r2, r1, lsr #31
        adc     r5, r5, #0
        mov     r0, lr, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r5, r0, r5, lsl #1
        orr     lr, r2, lr, lsl #1
        adds    r0, lr, r1
        adc     r1, r5, #0
        b       LADL372
LADL371:
        umull   r0, r1, r3, r4
        umull   r12, r3, r3, r7
        umull   lr, r12, r7, r2
        umull   r2, r5, r4, r2
        adds    r3, r0, r3
        adc     r1, r1, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    r12, r2, r12
        adc     r5, r5, #0
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r12, r1, r12
        mov     r1, r3, lsr #31
        adc     r5, r5, #0
        mov     r0, r12, lsr #31
        mov     r3, r3, lsr #30
        orr     r12, r1, r12, lsl #1
        orr     r5, r0, r5, lsl #1
        and     r3, r3, #1
        adds    r0, r12, r3
        adc     r1, r5, #0
LADL372:
        tst     r1, #1, 2
        bne     LADL373
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r5, r2, #0x1F
        clzne   r2, r1
        subne   r5, r2, #1
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        add     r11, r11, r5
LADL373:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL352
LADL374:
        rsbs    r0, r3, #0
        rsc     r2, r2, #0
        cmp     r4, #0
        blt     LADL381
        orrs    r12, r4, r7
        bne     LADL375
        orrs    r3, r2, r0
        beq     LADL377
LADL375:
        cmp     r6, r11
        bne     LADL376
        cmp     r4, r2
        bne     LADL376
        cmp     r7, r0
        beq     LADL377
LADL376:
        cmp     r12, #0
        beq     LADL378
        orrs    r3, r2, r0
        beq     LADL377
        cmp     r6, r11
        blt     LADL377
        cmp     r6, r11
        bne     LADL378
        cmp     r4, r2
        bhi     LADL377
        cmp     r4, r2
        bne     LADL378
        cmp     r7, r0
        bls     LADL378
LADL377:
        umull   r3, r12, r7, r2
        umull   lr, r1, r0, r7
        umull   r0, lr, r0, r4
        umull   r2, r5, r4, r2
        adds    r3, r1, r3
        adc     r12, r12, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    lr, r2, lr
        adc     r5, r5, #0
        adds    r3, r0, r3
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r1, r3, lsr #31
        adc     r5, r5, #0
        mov     r0, lr, lsr #31
        mov     r3, r3, lsr #30
        orr     lr, r1, lr, lsl #1
        orr     r5, r0, r5, lsl #1
        and     r3, r3, #1
        adds    r0, lr, r3
        adc     r1, r5, #0
        b       LADL379
LADL378:
        umull   r1, r3, r0, r4
        umull   r12, r0, r0, r7
        umull   lr, r12, r7, r2
        umull   r2, r5, r4, r2
        adds    r0, r1, r0
        adc     r3, r3, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    r12, r2, r12
        adc     r5, r5, #0
        adds    r0, lr, r0
        adc     r3, r3, #0
        adds    r12, r3, r12
        mov     r1, r0, lsr #30
        mov     r2, r0, lsr #31
        adc     r5, r5, #0
        mov     r0, r12, lsr #31
        and     r1, r1, #1
        orr     r5, r0, r5, lsl #1
        orr     r12, r2, r12, lsl #1
        adds    r0, r12, r1
        adc     r1, r5, #0
LADL379:
        tst     r1, #1, 2
        bne     LADL380
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r5, r2, #0x1F
        clzne   r2, r1
        subne   r5, r2, #1
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        add     r11, r11, r5
LADL380:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADL352
LADL381:
        rsbs    r7, r7, #0
        rsc     r4, r4, #0
        orrs    r12, r4, r7
        bne     LADL382
        orrs    r3, r2, r0
        beq     LADL384
LADL382:
        cmp     r6, r11
        bne     LADL383
        cmp     r4, r2
        bne     LADL383
        cmp     r7, r0
        beq     LADL384
LADL383:
        cmp     r12, #0
        beq     LADL385
        orrs    r3, r2, r0
        beq     LADL384
        cmp     r6, r11
        blt     LADL384
        cmp     r6, r11
        bne     LADL385
        cmp     r4, r2
        bhi     LADL384
        cmp     r4, r2
        bne     LADL385
        cmp     r7, r0
        bls     LADL385
LADL384:
        umull   r3, r12, r7, r2
        umull   lr, r1, r0, r7
        umull   r0, lr, r0, r4
        umull   r2, r5, r4, r2
        adds    r3, r1, r3
        adc     r12, r12, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    lr, r2, lr
        adc     r5, r5, #0
        adds    r3, r0, r3
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r1, r3, lsr #31
        adc     r5, r5, #0
        mov     r0, lr, lsr #31
        mov     r3, r3, lsr #30
        orr     lr, r1, lr, lsl #1
        orr     r5, r0, r5, lsl #1
        and     r3, r3, #1
        adds    r0, lr, r3
        adc     r1, r5, #0
        b       LADL386
LADL385:
        umull   r1, r3, r0, r4
        umull   r12, r0, r0, r7
        umull   lr, r12, r7, r2
        umull   r2, r5, r4, r2
        adds    r0, r1, r0
        adc     r3, r3, #0
        add     r11, r11, r6
        sub     r11, r11, #0x3F
        adds    r12, r2, r12
        adc     r5, r5, #0
        adds    r0, lr, r0
        adc     r3, r3, #0
        adds    r12, r3, r12
        mov     r1, r0, lsr #30
        mov     r2, r0, lsr #31
        adc     r5, r5, #0
        mov     r0, r12, lsr #31
        and     r1, r1, #1
        orr     r5, r0, r5, lsl #1
        orr     r12, r2, r12, lsl #1
        adds    r0, r12, r1
        adc     r1, r5, #0
LADL386:
        tst     r1, #1, 2
        bne     LADL352
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r5, r2, #0x1F
        clzne   r2, r1
        subne   r5, r2, #1
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        add     r11, r11, r5
        b       LADL352
LADL387:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        tst     r1, #1, 2
        bne     LADL121
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r6, r6, r2
        bl      __ashldi3
        b       LADL121
LADL388:
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x14]
        rsbs    r1, r1, #0
        rsc     r3, r3, #0
        orrs    r12, r3, r1
        bne     LADL389
        orrs    lr, r7, r2
        beq     LADL391
LADL389:
        ldr     lr, [sp, #0x20]
        cmp     lr, r6
        bne     LADL390
        cmp     r3, r7
        bne     LADL390
        cmp     r1, r2
        beq     LADL391
LADL390:
        cmp     r12, #0
        beq     LADL397
        orrs    r12, r7, r2
        beq     LADL391
        ldr     r12, [sp, #0x20]
        cmp     r12, r6
        blt     LADL391
        ldr     r12, [sp, #0x20]
        cmp     r12, r6
        bne     LADL397
        cmp     r3, r7
        bhi     LADL391
        cmp     r3, r7
        bne     LADL397
        cmp     r1, r2
        bls     LADL397
LADL391:
        ldr     r12, [sp, #0x20]
        sub     r6, r6, r12
        cmp     r6, #0x20
        bcs     LADL392
        rsb     r12, r6, #0x20
        mov     r12, r7, lsl r12
        orr     r2, r12, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL393
LADL392:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL393:
        subs    r1, r1, r2
        sbc     r3, r3, r6
        ldr     r6, [sp, #0x20]
        tst     r3, #1, 2
        bne     LADL396
        cmp     r3, #0
        bne     LADL394
        cmp     r1, #0
        moveq   r2, #0
        beq     LADL395
        clz     r2, r1
        mov     r1, r1, lsl r2
        add     r2, r2, #0x1F
        mov     r3, r1, lsr #1
        mov     r1, r1, lsl #31
        b       LADL395
LADL394:
        clz     r2, r3
        sub     r2, r2, #1
        rsb     r12, r2, #0x20
        mov     r12, r1, lsr r12
        orr     r3, r12, r3, lsl r2
        mov     r1, r1, lsl r2
LADL395:
        ldr     r12, [sp, #0x20]
        add     r6, r12, r2
LADL396:
        rsbs    r0, r1, #0
        rsc     r1, r3, #0
        b       LADL119
LADL397:
        ldr     r12, [sp, #0x20]
        sub     r12, r12, r6
        cmp     r12, #0x20
        bcs     LADL398
        rsb     lr, r12, #0x20
        mov     lr, r3, lsl lr
        orr     r1, lr, r1, lsr r12
        mov     r12, r3, asr r12
        b       LADL399
LADL398:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r1, r3, asr r12
        mov     r12, r3, asr #31
LADL399:
        subs    r0, r2, r1
        sbc     r1, r7, r12
        tst     r1, #1, 2
        bne     LADL119
        cmp     r1, #0
        bne     LADL400
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL401
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL401
LADL400:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL401:
        add     r6, r6, r2
        b       LADL119
LADL402:
        ldr     r1, [sp, #0x14]
        rsbs    r2, r2, #0
        rsc     r7, r7, #0
        cmp     r1, #0
        blt     LADL416
        orrs    r1, r7, r2
        bne     LADL403
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x14]
        orrs    r3, r12, r3
        beq     LADL405
LADL403:
        ldr     r3, [sp, #0x20]
        cmp     r6, r3
        bne     LADL404
        ldr     r3, [sp, #0x14]
        cmp     r7, r3
        bne     LADL404
        ldr     r3, [sp, #0x24]
        cmp     r2, r3
        beq     LADL405
LADL404:
        cmp     r1, #0
        beq     LADL411
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x14]
        orrs    r1, r3, r1
        beq     LADL405
        ldr     r1, [sp, #0x20]
        cmp     r6, r1
        blt     LADL405
        ldr     r1, [sp, #0x20]
        cmp     r6, r1
        bne     LADL411
        ldr     r1, [sp, #0x14]
        cmp     r7, r1
        bhi     LADL405
        ldr     r1, [sp, #0x14]
        cmp     r7, r1
        bne     LADL411
        ldr     r1, [sp, #0x24]
        cmp     r2, r1
        bls     LADL411
LADL405:
        ldr     r1, [sp, #0x20]
        sub     r1, r1, r6
        cmp     r1, #0x20
        bcs     LADL406
        ldr     r3, [sp, #0x14]
        ldr     lr, [sp, #0x24]
        rsb     r12, r1, #0x20
        mov     r12, r3, lsl r12
        orr     r12, r12, lr, lsr r1
        mov     r1, r3, asr r1
        b       LADL407
LADL406:
        cmp     r1, #0x40
        movcs   r3, #0x1F
        subcc   r3, r1, #0x20
        ldr     r1, [sp, #0x14]
        mov     r12, r1, asr r3
        mov     r1, r1, asr #31
LADL407:
        subs    r2, r2, r12
        sbc     r7, r7, r1
        tst     r7, #1, 2
        bne     LADL410
        cmp     r7, #0
        bne     LADL408
        cmp     r2, #0
        moveq   r1, #0
        beq     LADL409
        clz     r1, r2
        mov     r2, r2, lsl r1
        add     r1, r1, #0x1F
        mov     r7, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL409
LADL408:
        clz     r1, r7
        sub     r1, r1, #1
        rsb     r3, r1, #0x20
        mov     r3, r2, lsr r3
        orr     r7, r3, r7, lsl r1
        mov     r2, r2, lsl r1
LADL409:
        add     r6, r6, r1
LADL410:
        rsbs    r0, r2, #0
        rsc     r1, r7, #0
        b       LADL119
LADL411:
        ldr     r1, [sp, #0x20]
        sub     r6, r6, r1
        cmp     r6, #0x20
        bcs     LADL412
        rsb     r1, r6, #0x20
        mov     r1, r7, lsl r1
        orr     r2, r1, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL413
LADL412:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL413:
        ldr     r1, [sp, #0x24]
        subs    r0, r1, r2
        ldr     r1, [sp, #0x14]
        sbc     r1, r1, r6
        ldr     r6, [sp, #0x20]
        tst     r1, #1, 2
        bne     LADL119
        cmp     r1, #0
        bne     LADL414
        cmp     r0, #0
        moveq   r2, #0
        beq     LADL415
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADL415
LADL414:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADL415:
        ldr     r3, [sp, #0x20]
        add     r6, r3, r2
        b       LADL119
LADL416:
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x14]
        rsbs    r1, r1, #0
        rsc     r3, r3, #0
        orrs    r12, r3, r1
        bne     LADL417
        orrs    lr, r7, r2
        beq     LADL419
LADL417:
        ldr     lr, [sp, #0x20]
        cmp     lr, r6
        bne     LADL418
        cmp     r3, r7
        bne     LADL418
        cmp     r1, r2
        beq     LADL419
LADL418:
        cmp     r12, #0
        beq     LADL422
        orrs    r12, r7, r2
        beq     LADL419
        ldr     r12, [sp, #0x20]
        cmp     r12, r6
        blt     LADL419
        ldr     r12, [sp, #0x20]
        cmp     r12, r6
        bne     LADL422
        cmp     r3, r7
        bhi     LADL419
        cmp     r3, r7
        bne     LADL422
        cmp     r1, r2
        bls     LADL422
LADL419:
        ldr     r12, [sp, #0x20]
        sub     r6, r6, r12
        cmp     r6, #0x20
        bcs     LADL420
        rsb     r12, r6, #0x20
        mov     r12, r7, lsl r12
        orr     r2, r12, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL421
LADL420:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL421:
        adds    r1, r1, r2
        adc     r3, r3, r6
        ldr     r6, [sp, #0x20]
        tst     r3, r3
        bmi     LADL426
        b       LADL425
LADL422:
        ldr     r12, [sp, #0x20]
        sub     r12, r12, r6
        cmp     r12, #0x20
        bcs     LADL423
        rsb     lr, r12, #0x20
        mov     lr, r3, lsl lr
        orr     r1, lr, r1, lsr r12
        mov     r12, r3, asr r12
        b       LADL424
LADL423:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r1, r3, asr r12
        mov     r12, r3, asr #31
LADL424:
        adds    r1, r2, r1
        adc     r3, r7, r12
        tst     r3, r3
        bmi     LADL427
LADL425:
        rsbs    r0, r1, #0
        rsc     r1, r3, #0
        b       LADL119
LADL426:
        ldr     r2, [sp, #0x20]
        sub     r6, r2, #1
        mov     r2, r3, lsl #31
        orr     r1, r2, r1, lsr #1
        mov     r3, r3, lsr #1
        b       LADL425
LADL427:
        mov     r2, r3, lsl #31
        sub     r6, r6, #1
        orr     r1, r2, r1, lsr #1
        mov     r3, r3, lsr #1
        b       LADL425
LADL428:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        orrs    r3, r1, r0
        bne     LADL429
        orrs    r12, r7, r2
        beq     LADL431
LADL429:
        cmp     r11, r6
        bne     LADL430
        cmp     r1, r7
        bne     LADL430
        cmp     r0, r2
        beq     LADL431
LADL430:
        cmp     r3, #0
        beq     LADL434
        orrs    r3, r7, r2
        beq     LADL431
        cmp     r11, r6
        blt     LADL431
        cmp     r11, r6
        bne     LADL434
        cmp     r1, r7
        bhi     LADL431
        cmp     r1, r7
        bne     LADL434
        cmp     r0, r2
        bls     LADL434
LADL431:
        sub     r6, r6, r11
        cmp     r6, #0x20
        bcs     LADL432
        rsb     r3, r6, #0x20
        mov     r3, r7, lsl r3
        orr     r2, r3, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL433
LADL432:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL433:
        adds    r2, r0, r2
        adc     r7, r1, r6
        tst     r7, r7
        mov     r6, r11
        bpl     LADL110
        mov     r1, r7, lsl #31
        orr     r2, r1, r2, lsr #1
        mov     r7, r7, lsr #1
        sub     r6, r11, #1
        b       LADL110
LADL434:
        sub     r11, r11, r6
        cmp     r11, #0x20
        bcs     LADL435
        rsb     r3, r11, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADL436
LADL435:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADL436:
        adds    r2, r2, r0
        adc     r7, r7, r11
        tst     r7, r7
        bpl     LADL110
        mov     r1, r7, lsl #31
        orr     r2, r1, r2, lsr #1
        mov     r7, r7, lsr #1
        sub     r6, r6, #1
        b       LADL110
LADL437:
        rsbs    r2, r2, #0
        rsc     r7, r7, #0
        cmp     r1, #0
        orr     r3, r7, r2
        blt     LADL449
        cmp     r3, #0
        bne     LADL438
        orrs    r12, r1, r0
        beq     LADL440
LADL438:
        cmp     r6, r11
        bne     LADL439
        cmp     r7, r1
        bne     LADL439
        cmp     r2, r0
        beq     LADL440
LADL439:
        cmp     r3, #0
        beq     LADL443
        orrs    r3, r1, r0
        beq     LADL440
        cmp     r6, r11
        blt     LADL440
        cmp     r6, r11
        bne     LADL443
        cmp     r7, r1
        bhi     LADL440
        cmp     r7, r1
        bne     LADL443
        cmp     r2, r0
        bls     LADL443
LADL440:
        sub     r11, r11, r6
        cmp     r11, #0x20
        bcs     LADL441
        rsb     r3, r11, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADL442
LADL441:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADL442:
        adds    r2, r2, r0
        adc     r7, r7, r11
        tst     r7, r7
        bmi     LADL447
        b       LADL446
LADL443:
        sub     r6, r6, r11
        cmp     r6, #0x20
        bcs     LADL444
        rsb     r3, r6, #0x20
        mov     r3, r7, lsl r3
        orr     r2, r3, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL445
LADL444:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL445:
        adds    r2, r0, r2
        adc     r7, r1, r6
        tst     r7, r7
        mov     r6, r11
        bmi     LADL448
LADL446:
        rsbs    r2, r2, #0
        rsc     r7, r7, #0
        b       LADL110
LADL447:
        mov     r1, r7, lsl #31
        orr     r2, r1, r2, lsr #1
        mov     r7, r7, lsr #1
        sub     r6, r6, #1
        b       LADL446
LADL448:
        mov     r1, r7, lsl #31
        orr     r2, r1, r2, lsr #1
        mov     r7, r7, lsr #1
        sub     r6, r11, #1
        b       LADL446
LADL449:
        rsbs    r0, r0, #0
        str     r0, [sp, #0x1C]
        rsc     r1, r1, #0
        cmp     r3, #0
        bne     LADL450
        ldr     r12, [sp, #0x1C]
        orrs    r12, r1, r12
        beq     LADL452
LADL450:
        cmp     r6, r11
        bne     LADL451
        cmp     r7, r1
        bne     LADL451
        ldr     r12, [sp, #0x1C]
        cmp     r2, r12
        beq     LADL452
LADL451:
        cmp     r3, #0
        beq     LADL458
        ldr     r3, [sp, #0x1C]
        orrs    r3, r1, r3
        beq     LADL452
        cmp     r6, r11
        blt     LADL452
        cmp     r6, r11
        bne     LADL458
        cmp     r7, r1
        bhi     LADL452
        cmp     r7, r1
        bne     LADL458
        ldr     r3, [sp, #0x1C]
        cmp     r2, r3
        bls     LADL458
LADL452:
        sub     r11, r11, r6
        cmp     r11, #0x20
        bcs     LADL453
        ldr     r12, [sp, #0x1C]
        rsb     r3, r11, #0x20
        mov     r3, r1, lsl r3
        orr     r3, r3, r12, lsr r11
        mov     r11, r1, asr r11
        b       LADL454
LADL453:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r3, r1, asr r11
        mov     r11, r1, asr #31
LADL454:
        subs    r2, r2, r3
        sbc     r7, r7, r11
        tst     r7, #1, 2
        bne     LADL457
        cmp     r7, #0
        bne     LADL455
        cmp     r2, #0
        moveq   r1, #0
        beq     LADL456
        clz     r1, r2
        mov     r2, r2, lsl r1
        add     r1, r1, #0x1F
        mov     r7, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL456
LADL455:
        clz     r1, r7
        sub     r1, r1, #1
        rsb     r3, r1, #0x20
        mov     r3, r2, lsr r3
        orr     r7, r3, r7, lsl r1
        mov     r2, r2, lsl r1
LADL456:
        add     r6, r1, r6
LADL457:
        rsbs    r2, r2, #0
        rsc     r7, r7, #0
        b       LADL110
LADL458:
        sub     r6, r6, r11
        cmp     r6, #0x20
        bcs     LADL459
        rsb     r3, r6, #0x20
        mov     r3, r7, lsl r3
        orr     r2, r3, r2, lsr r6
        mov     r6, r7, asr r6
        b       LADL460
LADL459:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r6, #0x20
        mov     r2, r7, asr r6
        mov     r6, r7, asr #31
LADL460:
        ldr     r3, [sp, #0x1C]
        subs    r2, r3, r2
        sbc     r7, r1, r6
        tst     r7, #1, 2
        mov     r6, r11
        bne     LADL110
        cmp     r7, #0
        bne     LADL461
        cmp     r2, #0
        moveq   r1, #0
        beq     LADL462
        clz     r1, r2
        mov     r2, r2, lsl r1
        add     r1, r1, #0x1F
        mov     r7, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADL462
LADL461:
        clz     r1, r7
        sub     r1, r1, #1
        rsb     r3, r1, #0x20
        mov     r3, r2, lsr r3
        orr     r7, r3, r7, lsl r1
        mov     r2, r2, lsl r1
LADL462:
        add     r6, r11, r1
        b       LADL110
LADL463:
        ldr     lr, [sp, #0x10]
        cmp     r2, lr
        bne     LADL75
        cmp     r3, r10
        beq     LADL76
        b       LADL75
LADL464:
        ldr     lr, [sp, #0x10]
        cmp     r2, lr
        bne     LADL66
        cmp     r12, r10
        beq     LADL67
        b       LADL66
LADL465:
        cmp     r2, r7
        bne     LADL42
        ldr     lr, [sp]
        cmp     r3, lr
        beq     LADL43
        b       LADL42
LADL466:
        mov     r2, r12, lsl #31
        orr     r1, r2, r1, lsr #1
        mov     r12, r12, lsr #1
        add     lr, r10, #9
        b       LADL14
LADL467:
        cmp     r8, #1, 2
        bcc     LADL7
        cmp     r8, #1, 2
        bne     LADL11
        cmp     r6, #0
        bcc     LADL7
        b       LADL11
LADL468:
        cmp     r8, #1, 2
        bne     LADL6
        cmp     r6, #0
        beq     LADL7
        b       LADL6


        .data
        .align  4


LADL_qwXB_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xBD,0xA5,0xE2,0x36,0x46,0xC1,0xDF,0x60
        .byte   0x08,0xC9,0xBC,0xF3,0x67,0xE6,0x09,0x6A,0xF4,0x6A,0x9D,0xD6,0xCA,0xFC,0x44,0x57
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x6F,0xA9,0xB8,0x8D,0x51,0xF0,0x37,0x58
        .byte   0x84,0x64,0xDE,0xF9,0x33,0xF3,0x04,0x75,0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x4B
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x60,0x6F,0xA9,0xB8,0x8D,0x51,0xF0,0x37,0x78
        .byte   0x42,0x32,0xEF,0xFC,0x99,0x79,0x82,0x4A,0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x5B
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0xB7,0x54,0xDC,0xC6,0x28,0xF8,0x1B,0x44
        .byte   0x42,0x32,0xEF,0xFC,0x99,0x79,0x82,0x52,0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x63
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x78,0xB7,0x54,0xDC,0xC6,0x28,0xF8,0x1B,0x48
        .byte   0x42,0x32,0xEF,0xFC,0x99,0x79,0x82,0x56,0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x67
LADL_THE_128_LN2_DIV_M:
        .byte   0x5E,0xF8,0x0B,0xAE,0x94,0x1D,0x55,0x5C
LADL_THE_LN2_DIV_128_HI_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x08,0xB9,0x58
LADL_THE_LN2_DIV_128_LO_M:
        .byte   0x3B,0x9E,0xBC,0x9A,0xF7,0x1C,0x7D,0x7F
LADL_qwE_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
        .byte   0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
        .byte   0x05,0x5B,0xB0,0x05,0x5B,0xB0,0x05,0x5B
LADL_qwT_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x13,0xE2,0xE3,0x1E,0x57,0x84,0xA7,0x3F
        .byte   0x5D,0xB0,0x21,0x3D,0x03,0x83,0x4F,0x3F,0x12,0x27,0x7C,0x39,0x5B,0xFB,0xF7,0x3E
        .byte   0xCE,0x80,0x8A,0xDC,0xB6,0xEC,0xA0,0x3E,0x9D,0x2E,0x75,0xD7,0x6E,0x56,0x4A,0x3E
        .byte   0xEE,0x4E,0xB4,0xC2,0xDC,0x37,0xF4,0x3D,0x1B,0xE1,0xCF,0x1C,0x5B,0x90,0x9E,0x3D
        .byte   0x0B,0xB3,0x21,0x49,0x45,0x5F,0x49,0x3D,0x96,0x06,0x99,0x8E,0xF7,0xA3,0xF4,0x3C
        .byte   0x4E,0xEC,0x7F,0x16,0xCF,0x5D,0xA0,0x3C,0x42,0x51,0x42,0xEB,0x29,0x8C,0x4C,0x3C
        .byte   0x72,0xBD,0x36,0xF7,0x66,0x2E,0xF9,0x3B,0x96,0xC0,0x68,0x03,0xE6,0x43,0xA6,0x3B
        .byte   0xE1,0x0A,0x65,0xB6,0x07,0xCC,0x53,0x3B,0x77,0x2F,0x07,0x93,0x2D,0xC6,0x01,0x3B
        .byte   0x4B,0x0E,0x49,0xF7,0xB9,0x31,0xB0,0x3A,0x15,0xE3,0x13,0x1B,0x10,0x0E,0x5F,0x3A
        .byte   0x1A,0xF7,0x12,0x0F,0x94,0x5A,0x0E,0x3A,0x88,0xF3,0x87,0xBB,0xAA,0x16,0xBE,0x39
        .byte   0x2A,0xD2,0x20,0xDF,0xB9,0x41,0x6E,0x39,0x23,0x6A,0xCF,0x0D,0x28,0xDB,0x1E,0x39
        .byte   0x94,0x96,0xA2,0xAF,0x5C,0xE2,0xCF,0x38,0xDA,0xF4,0xA0,0xFF,0xBF,0x56,0x81,0x38
        .byte   0x44,0x38,0xA5,0x0A,0xBB,0x37,0x33,0x38,0x08,0x11,0x3C,0xAE,0xB7,0x84,0xE5,0x37
        .byte   0x49,0xA4,0x83,0x97,0x20,0x3D,0x98,0x37,0x08,0x93,0x0C,0x42,0x61,0x60,0x4B,0x37
        .byte   0xD5,0x8D,0xBC,0xF6,0xE5,0xED,0xFE,0x36,0x1C,0x73,0xB2,0xCA,0x1B,0xE5,0xB2,0x36
        .byte   0xED,0xF5,0x2B,0x9E,0x70,0x45,0x67,0x36,0x21,0xCB,0x6C,0x1B,0x53,0x0E,0x1C,0x36
        .byte   0xBD,0x5A,0xA7,0xB5,0x32,0x3F,0xD1,0x35,0x81,0xF3,0xE6,0xA7,0x7F,0xD7,0x86,0x35
        .byte   0x87,0x7E,0xFB,0xF3,0xAA,0xD6,0x3C,0x35,0xDE,0xB0,0x66,0x61,0x26,0x3C,0xF3,0x34
        .byte   0x16,0xB9,0x4A,0x7C,0x64,0x07,0xAA,0x34,0xB1,0x66,0x5A,0x94,0xD8,0x37,0x61,0x34
        .byte   0x65,0xC9,0xCA,0xBB,0xF6,0xCC,0x18,0x34,0x30,0x46,0x46,0xC6,0x33,0xC6,0xD0,0x33
        .byte   0x39,0x20,0xE1,0x47,0x05,0x23,0x89,0x33,0x74,0x73,0x0F,0x94,0xE1,0xE2,0x41,0x33
        .byte   0x17,0x9F,0x9C,0xBC,0x3F,0x05,0xFB,0x32,0xD3,0x1D,0xA4,0x90,0x97,0x89,0xB4,0x32
        .byte   0xE8,0xC9,0x8B,0x9B,0x61,0x6F,0x6E,0x32,0x11,0x8B,0xFF,0x23,0x17,0xB6,0x28,0x32
        .byte   0x57,0x6C,0xEE,0x2A,0x32,0x5D,0xE3,0x31,0xDE,0x17,0x89,0x6A,0x2D,0x64,0x9E,0x31
        .byte   0xB7,0xB6,0x41,0x55,0x84,0xCA,0x59,0x31,0xCC,0x32,0xCD,0x14,0xB3,0x8F,0x15,0x31
        .byte   0x01,0xD9,0x25,0x89,0x36,0xB3,0xD1,0x30,0x9C,0x59,0x8F,0x47,0x8C,0x34,0x8E,0x30
        .byte   0x15,0x25,0x9C,0x99,0x32,0x13,0x4B,0x30,0x6C,0x23,0x34,0x7C,0xA8,0x4E,0x08,0x30
        .byte   0x20,0xC4,0x9C,0x9E,0x6D,0xE6,0xC5,0x2F,0xF8,0x64,0x82,0x61,0x02,0xDA,0x83,0x2F
        .byte   0xAF,0x0D,0x03,0xD6,0xE7,0x28,0x42,0x2F,0xC3,0x7E,0xBA,0xBC,0x9F,0xD2,0x00,0x2F
        .byte   0x7E,0x91,0xCF,0x84,0xAC,0xD6,0xBF,0x2E,0x7A,0xE7,0x02,0x4B,0x91,0x34,0x7F,0x2E
        .byte   0xBA,0xE7,0xBE,0xD8,0xD1,0xEB,0x3E,0x2E,0x9F,0x07,0x29,0xA3,0xF2,0xFB,0xFE,0x2D
        .byte   0xE4,0x5D,0x34,0xCA,0x78,0x64,0xBF,0x2D,0xDB,0x7D,0xB5,0x17,0xEA,0x24,0x80,0x2D
        .byte   0x21,0x99,0x77,0xFE,0xCC,0x3C,0x41,0x2D,0x10,0xE6,0x52,0x99,0xA8,0xAB,0x02,0x2D
        .byte   0x22,0x49,0x44,0xAA,0x04,0x71,0xC4,0x2C,0x8E,0x3F,0x86,0x99,0x69,0x8C,0x86,0x2C
        .byte   0x64,0x09,0xAB,0x74,0x60,0xFD,0x48,0x2C,0x61,0x11,0xB8,0xED,0x72,0xC3,0x0B,0x2C
        .byte   0xDD,0x90,0x42,0x5A,0x2B,0xDE,0xCE,0x2B,0x03,0x6E,0x8D,0xB2,0x14,0x4D,0x92,0x2B
        .byte   0xB1,0x52,0xA8,0x90,0xBA,0x0F,0x56,0x2B,0x4A,0xFA,0x8F,0x2F,0xA9,0x25,0x1A,0x2B
        .byte   0xCD,0xB4,0x4F,0x6A,0x6D,0x8E,0xDE,0x2A,0x8A,0x1D,0x24,0xBB,0x94,0x49,0xA3,0x2A
        .byte   0xBE,0x03,0x9F,0x3A,0xAD,0x56,0x68,0x2A,0x82,0x83,0xCC,0x9E,0x45,0xB5,0x2D,0x2A
        .byte   0x5A,0x4D,0x59,0x3A,0xED,0x64,0xF3,0x29,0xC7,0x1A,0xBA,0xFB,0x33,0x65,0xB9,0x29
        .byte   0x3A,0x4E,0x54,0x6C,0xAA,0xB5,0x7F,0x29,0xCE,0xBC,0xA7,0xAF,0xE1,0x55,0x46,0x29
        .byte   0x27,0xA0,0x79,0x82,0x6B,0x45,0x0D,0x29,0xE4,0xAE,0x00,0x3A,0xDA,0x83,0xD4,0x28
        .byte   0x06,0x5A,0x12,0xC3,0xC0,0x10,0x9C,0x28,0xB9,0x2D,0x51,0xA1,0xB2,0xEB,0x63,0x28
        .byte   0xF0,0x53,0x5C,0xEE,0x43,0x14,0x2C,0x28,0x41,0x37,0x00,0x59,0x09,0x8A,0xF4,0x27
        .byte   0x6B,0x44,0x68,0x24,0x98,0x4C,0xBD,0x27,0x08,0xC9,0x51,0x27,0x86,0x5B,0x86,0x27
        .byte   0xD4,0xED,0x3F,0xCB,0x69,0xB6,0x4F,0x27,0x0B,0xCB,0xB0,0x0B,0xDA,0x5C,0x19,0x27
        .byte   0x4E,0x95,0x53,0x75,0x6E,0x4E,0xE3,0x26,0x92,0xE1,0x3F,0x25,0xBF,0x8A,0xAD,0x26
        .byte   0x99,0xFE,0x2D,0xC8,0x64,0x11,0x78,0x26,0x6A,0x62,0xB0,0x99,0xF8,0xE1,0x42,0x26
        .byte   0x5B,0x2A,0x6E,0x63,0x14,0xFC,0x0D,0x26,0x23,0xAC,0x5E,0x7C,0x52,0x5F,0xD9,0x25
        .byte   0x80,0x16,0x06,0xC8,0x4D,0x0B,0xA5,0x25,0xFB,0x1F,0xB3,0xB5,0xA1,0xFF,0x70,0x25
        .byte   0x58,0xC2,0xBD,0x3F,0xEA,0x3B,0x3D,0x25,0x2D,0x01,0xC7,0xEA,0xC3,0xBF,0x09,0x25
        .byte   0x4B,0xBA,0xF9,0xC4,0xCB,0x8A,0xD6,0x24,0x6B,0x7E,0x4C,0x65,0x9F,0x9C,0xA3,0x24
        .byte   0xCD,0x70,0xC4,0xEA,0xDC,0xF4,0x70,0x24,0x4A,0x2C,0xB9,0xFB,0x22,0x93,0x3E,0x24
        .byte   0x77,0xAC,0x19,0xC5,0x10,0x77,0x0C,0x24,0x71,0x39,0xB2,0xF9,0x45,0xA0,0xDA,0x23
        .byte   0xF0,0x54,0x73,0xD1,0x62,0x0E,0xA9,0x23,0x35,0xA7,0xB9,0x08,0x08,0xC1,0x77,0x23
        .byte   0x79,0xEA,0x96,0xDF,0xD6,0xB7,0x46,0x23,0x77,0xD3,0x1B,0x19,0x71,0xF2,0x15,0x23
        .byte   0xB9,0xF5,0xA2,0xFA,0x78,0x70,0xE5,0x22,0x49,0xA2,0x1C,0x4B,0x91,0x31,0xB5,0x22
        .byte   0x66,0xBF,0x5B,0x52,0x5D,0x35,0x85,0x22,0xF7,0x97,0x63,0xD8,0x80,0x7B,0x55,0x22
        .byte   0x49,0xA1,0xB6,0x24,0xA0,0x03,0x26,0x22,0xE4,0x35,0xA6,0xFD,0x5F,0xCD,0xF6,0x21
        .byte   0x04,0x44,0xA3,0xA7,0x65,0xD8,0xC7,0x21,0x81,0xEE,0x8F,0xE4,0x56,0x24,0x99,0x21
        .byte   0xC5,0x1E,0x12,0xF3,0xD9,0xB0,0x6A,0x21,0x8A,0x06,0xE7,0x8D,0x95,0x7D,0x3C,0x21
        .byte   0x11,0x90,0x37,0xEB,0x30,0x8A,0x0E,0x21,0x8D,0xBB,0xED,0xBB,0x53,0xD6,0xE0,0x20
        .byte   0x75,0xE8,0x0A,0x2B,0xA6,0x61,0xB3,0x20,0x7B,0x09,0xFF,0xDC,0xD0,0x2B,0x86,0x20
        .byte   0xDC,0xC1,0x00,0xEF,0x7C,0x34,0x59,0x20,0xDB,0x6A,0x66,0xF6,0x53,0x7B,0x2C,0x20
LADL_qwP_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
        .byte   0x46,0xB4,0x6D,0x0A,0x41,0x5D,0x37,0x48,0xF5,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x7F
        .byte   0x92,0x94,0xE7,0x0D,0xAC,0xD1,0x49,0x60,0xDE,0xE6,0xFB,0xFF,0xFF,0xFF,0xFF,0x7F
        .byte   0x7D,0x1F,0x57,0x0A,0xF0,0xDA,0x07,0x4D,0x5E,0x58,0x39,0x23,0x55,0x55,0x55,0x55
        .byte   0xE0,0x87,0xAC,0x4F,0x2E,0xFA,0x08,0x58,0x19,0x08,0x0B,0x3A,0x4A,0x54,0x55,0x55
        .byte   0x0A,0xA1,0xBE,0x71,0x16,0xC7,0x40,0x4E,0x50,0xBB,0xD5,0x8A,0x49,0xCB,0x42,0x44
        .byte   0x2D,0x8B,0x7A,0x43,0x53,0x89,0xB0,0x71,0x97,0x3E,0x98,0xD9,0x96,0xB5,0xEE,0x59
        .byte   0x13,0x69,0xFF,0x33,0xA1,0x51,0x0C,0x40,0xEC,0xD5,0xE9,0x75,0x3D,0x35,0xDD,0x7D
        .byte   0xBD,0xA5,0xE2,0x36,0x46,0xC1,0xDF,0x60,0x38,0x8F,0xDC,0x1D,0x78,0x0F,0xAD,0x68
        .byte   0x8C,0xB8,0x99,0x61,0xED,0x56,0xD2,0x68,0x58,0xC6,0x68,0x15,0xFD,0xCF,0xD7,0x54
        .byte   0xD9,0xA8,0x78,0x78,0x8A,0xBA,0x5B,0x76,0x75,0xAF,0xE6,0x52,0xAF,0x59,0xA5,0x49
        .byte   0x0E,0x79,0x0F,0x46,0x53,0x08,0x8A,0x53,0xA5,0x04,0x1C,0xA9,0x19,0x35,0xA8,0x57
        .byte   0xD3,0xB2,0x43,0xCB,0x3F,0xFB,0xFE,0x55,0x4C,0xE5,0x66,0xD3,0xB2,0x80,0x85,0x4F
        .byte   0xF5,0x66,0xA3,0xE1,0xDF,0xCB,0xC0,0x45,0x8F,0xD5,0x28,0xFF,0xB1,0x6B,0xA8,0x74
        .byte   0xD6,0xFD,0x02,0xFE,0x2C,0x0D,0x41,0x5D,0xC4,0x06,0x8D,0x70,0x21,0xA8,0xA9,0x46
        .byte   0x27,0x2B,0x93,0xED,0x23,0x4A,0x2C,0x5F,0x85,0xAD,0xB7,0xB1,0xF7,0x63,0xE4,0x55
        .byte   0x08,0xC9,0xBC,0xF3,0x67,0xE6,0x09,0x6A,0x59,0x4C,0x94,0x93,0x5D,0x9D,0xCB,0x54
        .byte   0x6E,0xD5,0xFB,0xC9,0x3C,0x8D,0x2F,0x4A,0x31,0x45,0x4D,0x30,0xE3,0x1C,0x22,0x6C
        .byte   0x29,0xC6,0xE5,0xF4,0x53,0xDD,0x0D,0x45,0xBA,0x34,0xA3,0x25,0x9B,0xB3,0x87,0x4F
        .byte   0xBF,0xD7,0x3E,0x14,0xC0,0xF8,0x21,0x54,0xA2,0x72,0x48,0xE3,0xDB,0xB8,0xCE,0x52
        .byte   0x3A,0xA4,0x63,0x8C,0x9A,0x39,0x8D,0x4C,0x69,0xFB,0x7C,0xA4,0x88,0xFC,0xF3,0x42
        .byte   0xBF,0x3B,0xEB,0x64,0x3E,0x30,0x70,0x6F,0x35,0x98,0x85,0x23,0x66,0xE9,0xA2,0x58
        .byte   0x7D,0x10,0xC5,0x21,0xDA,0x75,0x7D,0x43,0x2B,0x53,0x24,0x67,0x2B,0x1C,0x28,0x61
        .byte   0x2D,0x4B,0x13,0x15,0x79,0x21,0x93,0x7A,0xDE,0xFE,0xAF,0xD4,0x70,0xC4,0xC2,0x64
        .byte   0xF4,0x6A,0x9D,0xD6,0xCA,0xFC,0x44,0x57,0x5A,0xF1,0xD8,0x23,0x16,0x5D,0x3E,0x44
        .byte   0x47,0x19,0xCA,0x78,0x4E,0xC8,0xC0,0x66,0xB9,0x11,0x09,0x29,0xAE,0x50,0x6E,0x42
        .byte   0xAB,0x40,0x69,0xB5,0xE3,0x54,0x9D,0x4C,0xD2,0x6D,0x7D,0x4B,0xC5,0x66,0xA0,0x50
        .byte   0x75,0xB7,0x72,0x3B,0x2F,0x59,0x9B,0x4E,0x69,0x76,0x9B,0x02,0x16,0xE6,0xC5,0x47
        .byte   0x7C,0xBD,0xD0,0x25,0x32,0x6E,0xBF,0x7B,0xA8,0x08,0x9E,0x3C,0x3B,0x56,0x5C,0x65
        .byte   0xD7,0xAA,0xEA,0xC9,0xE3,0xE5,0x47,0x4F,0x3C,0x67,0x50,0x32,0x43,0x99,0xE0,0x76
        .byte   0xC8,0xBA,0x88,0xCE,0x55,0xE5,0x71,0x55,0x0C,0x06,0x84,0x51,0x83,0x26,0xB8,0x73
        .byte   0x82,0x79,0x88,0xF2,0xA9,0x2D,0xAD,0x43,0x21,0x4D,0xE6,0xDC,0x6E,0x86,0x78,0x64
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x60,0xC8,0x5A,0xE5,0x03,0x1E,0x76,0x6D
        .byte   0x56,0x40,0x01,0x5F,0xFC,0x38,0xF1,0x45,0x14,0x0A,0xB3,0x0C,0x0F,0xCA,0x09,0x4F
        .byte   0x4E,0xA2,0xBB,0x41,0xE2,0xDF,0x20,0x51,0xD7,0x68,0x80,0xD6,0x3B,0xB4,0xF2,0x4C
        .byte   0x40,0xBE,0xD2,0x1D,0x6D,0x3C,0x3F,0x44,0xEC,0xA7,0x6A,0xFA,0x54,0xE5,0x32,0x72
        .byte   0x53,0x6A,0x04,0x81,0x1B,0x98,0xBC,0x5A,0xAF,0x62,0x60,0xF8,0xAE,0x85,0xD4,0x44
        .byte   0xE3,0xC9,0x46,0xF8,0x33,0xDC,0x1E,0x64,0xFD,0x30,0x40,0xFE,0x89,0x48,0x06,0x46
        .byte   0x89,0x89,0x52,0x4E,0x9F,0xD3,0x0B,0x5E,0x56,0x26,0x72,0xE0,0x47,0x7F,0x88,0x76
        .byte   0xC0,0xB7,0x28,0x94,0x91,0xC8,0x24,0x7F,0x99,0x7E,0xED,0x12,0xBF,0x03,0x7B,0x54
        .byte   0x6F,0xA9,0xB8,0x8D,0x51,0xF0,0x37,0x58,0x88,0x6B,0xDF,0xC2,0x04,0x11,0xB9,0x57
        .byte   0x55,0x08,0x12,0x82,0xAC,0x5A,0x0E,0x5E,0x1E,0x1D,0x5B,0x70,0xB1,0x5F,0x98,0x5B
        .byte   0xA7,0xA9,0xD0,0xE8,0xD8,0x83,0x79,0x52,0xED,0x30,0xBC,0x88,0xFA,0x93,0x81,0x45
        .byte   0x0E,0x84,0x95,0x3D,0x98,0x2C,0xA0,0x6E,0x7B,0xF6,0xA7,0x4B,0x9C,0xEB,0xB0,0x53
        .byte   0x43,0x5A,0x7A,0x82,0x6B,0x7B,0x04,0x79,0x5C,0x08,0x76,0x9A,0xC6,0xB2,0xF9,0x53
        .byte   0x6B,0x73,0xEA,0x77,0xAE,0xE1,0x3C,0x70,0x97,0xEE,0xD9,0xCD,0xE8,0xE6,0x62,0x48
        .byte   0xFB,0x12,0x2C,0xB8,0x31,0x8C,0xC8,0x59,0x42,0xAB,0xC8,0x1F,0xAE,0xE7,0x11,0x68
        .byte   0x7A,0xC2,0xFA,0x6F,0x7D,0x0B,0x38,0x65,0xD8,0x95,0x0E,0x48,0x60,0xAE,0x5D,0x77
        .byte   0x84,0x64,0xDE,0xF9,0x33,0xF3,0x04,0x75,0x57,0xAA,0x53,0x93,0x01,0x8B,0x68,0x46
        .byte   0xC4,0xC9,0x88,0x2B,0x63,0x52,0x91,0x7D,0x74,0xBA,0x53,0x39,0x54,0x96,0x15,0x68
        .byte   0x03,0xF2,0x74,0xA3,0x70,0x81,0x19,0x51,0x4C,0xBE,0x11,0x6F,0x7F,0x8C,0xC4,0x77
        .byte   0x40,0x6C,0x10,0x7D,0xCC,0x5A,0x54,0x54,0x87,0xFA,0x5F,0xC4,0xCB,0x26,0xCB,0x71
        .byte   0x63,0x85,0x90,0x5B,0x08,0x1E,0xDC,0x49,0x21,0xB5,0x6A,0x58,0xA9,0xDB,0x89,0x5C
        .byte   0xF4,0x46,0x8F,0x05,0x7D,0x1F,0x31,0x70,0x97,0x0E,0xCF,0x00,0xD2,0x68,0xE2,0x41
        .byte   0x2F,0x09,0x6C,0xC0,0x2E,0x5D,0x86,0x4A,0x00,0xF4,0xD1,0x04,0x02,0x96,0x73,0x4E
        .byte   0x09,0xE1,0x68,0x00,0xD0,0x6B,0x66,0x44,0xE0,0xD8,0x49,0x78,0x42,0x76,0xFA,0x46
        .byte   0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x4B,0x17,0xDC,0xD8,0xA9,0x50,0xC1,0x5F,0x71
        .byte   0xEA,0x94,0xBF,0x5E,0x70,0x4D,0x95,0x53,0xDF,0xF6,0x44,0x91,0x94,0x9C,0xC4,0x74
        .byte   0x8B,0xCA,0x7F,0x77,0xF0,0xF2,0xC9,0x4D,0xDE,0x23,0x5E,0xD5,0x4B,0xCC,0x59,0x63
        .byte   0xF0,0xF8,0x6E,0xC2,0x3E,0x56,0x21,0x7A,0x1F,0xF9,0x0E,0x5A,0xFC,0xEC,0x7D,0x48
        .byte   0x1B,0x5A,0x3C,0xBE,0x83,0x2C,0x56,0x53,0xF4,0xF2,0x98,0xEA,0xD6,0x05,0xFE,0x5C
        .byte   0x2B,0x44,0xB2,0xC9,0x66,0xE4,0xE7,0x64,0x4A,0x92,0x4D,0x35,0xDC,0x28,0x7D,0x6A
        .byte   0x36,0x49,0x19,0x80,0x81,0x76,0x68,0x6C,0xB9,0xC4,0xF5,0x61,0x15,0xE5,0x50,0x66
        .byte   0xEF,0x1C,0xED,0x7C,0x40,0x50,0x13,0x4F,0x31,0x96,0x54,0xB2,0xC7,0xE2,0x9E,0x47
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x60,0x37,0xB3,0x74,0x8A,0xF4,0x09,0xA6,0x5B
        .byte   0x1D,0xBB,0xC5,0x52,0x34,0xB9,0x5A,0x6F,0x66,0xD2,0x02,0x63,0x6A,0xF8,0x0F,0x41
        .byte   0x92,0xDC,0x1E,0xA1,0x6E,0x18,0x64,0x49,0xDB,0xAD,0x04,0x3D,0xBB,0x30,0x27,0x50
        .byte   0xAC,0xA1,0x32,0x7B,0x70,0xB2,0xF7,0x54,0xF4,0xB1,0xE8,0x4D,0x4B,0xE4,0x9C,0x57
        .byte   0x86,0x99,0xCB,0xA0,0xD9,0x39,0x09,0x58,0xD6,0xF5,0xCC,0x05,0x41,0x26,0x57,0x56
        .byte   0x6F,0xC9,0x95,0x52,0x57,0xF9,0xBD,0x52,0x1C,0xD1,0x96,0x42,0x3D,0x7F,0x6B,0x4D
        .byte   0xB1,0x93,0xDC,0x6B,0xFE,0x4A,0xFF,0x45,0xC8,0x67,0xAC,0x3F,0x47,0xAE,0xF8,0x74
        .byte   0x5A,0x7C,0xFD,0x88,0x15,0x79,0x48,0x4F,0xDD,0x7D,0x9C,0xD0,0x78,0xBA,0x67,0x7C
        .byte   0x6F,0xA9,0xB8,0x8D,0x51,0xF0,0x37,0x78,0xAB,0xF6,0x18,0x54,0x3A,0x29,0x6A,0x4A
        .byte   0x34,0x25,0xCD,0xB4,0xC5,0x28,0x6A,0x4A,0x8B,0xD4,0x01,0xFA,0xCF,0xDA,0x61,0x48
        .byte   0x33,0xA4,0x4D,0x87,0xB6,0xBC,0x9D,0x44,0x75,0x5C,0xEE,0x81,0xA4,0xD4,0xFF,0x7E
        .byte   0x8B,0xE7,0x82,0x25,0x17,0x3E,0xE7,0x72,0xD7,0x7E,0xA3,0x88,0x47,0x66,0xC4,0x65
        .byte   0xE4,0x23,0x27,0x7A,0x63,0x29,0x55,0x58,0x5E,0xC7,0x87,0x8B,0x09,0xEC,0x36,0x4B
        .byte   0xBC,0x71,0x53,0xC4,0x13,0xBC,0xBA,0x7D,0x95,0xE7,0xFE,0x72,0xE2,0xC3,0xFB,0x66
        .byte   0x22,0x55,0x09,0xD6,0xEF,0x69,0xA6,0x51,0xA6,0x71,0xF0,0x2E,0xB2,0xA4,0x5D,0x77
        .byte   0xDD,0x67,0xF5,0xBE,0x33,0x6C,0x43,0x46,0xB5,0x3E,0x15,0x7F,0xE8,0x11,0xD9,0x5E
        .byte   0x42,0x32,0xEF,0xFC,0x99,0x79,0x82,0x4A,0x85,0x02,0xF2,0x8A,0x93,0xC0,0x60,0x79
        .byte   0x2B,0x77,0x6D,0x2D,0x2B,0x16,0xED,0x63,0xBE,0xB4,0x97,0xB1,0xFE,0x77,0xAE,0x50
        .byte   0xB4,0xC7,0x88,0xFD,0x69,0xFA,0xE7,0x7F,0x2B,0x36,0x91,0x97,0xBE,0xA1,0x9F,0x63
        .byte   0x08,0x2C,0x42,0xB0,0x0F,0xBF,0x4E,0x4C,0xF0,0x0D,0x9B,0x34,0xD3,0xD2,0x0A,0x73
        .byte   0x7C,0x38,0x31,0x5F,0x70,0x84,0x66,0x55,0x31,0x18,0x15,0xE0,0xE0,0x74,0xEF,0x7C
        .byte   0x01,0x18,0x45,0x28,0xB0,0x74,0x10,0x5A,0x63,0x58,0x4E,0x11,0x65,0x1F,0xAF,0x7F
        .byte   0x44,0xAF,0x69,0xBC,0x26,0x28,0xC3,0x57,0x82,0xEF,0xB6,0x6D,0xC5,0x73,0x0E,0x6F
        .byte   0xD2,0x80,0x39,0x13,0xD5,0x7F,0x92,0x70,0x69,0xB4,0xF0,0x7D,0x5F,0xDF,0xF8,0x40
        .byte   0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x5B,0x55,0x1F,0x10,0x8C,0xBE,0x2E,0x67,0x63
        .byte   0x44,0x1E,0x49,0x3B,0x85,0x51,0x74,0x43,0xC1,0xA0,0xB5,0xAB,0xDB,0xE5,0x50,0x5A
        .byte   0x95,0x9A,0x5D,0xE4,0x7D,0xC1,0x5B,0x77,0x1D,0xF3,0x63,0x00,0xE6,0x44,0xE2,0x4D
        .byte   0x8A,0xC2,0x53,0xF9,0x54,0x0C,0x6A,0x64,0xD4,0x32,0x43,0x77,0xEE,0x38,0xF3,0x7F
        .byte   0xB2,0xA9,0xF1,0xE9,0x23,0x99,0x98,0x50,0x58,0x89,0x83,0x4B,0x3E,0xD4,0x6A,0x64
        .byte   0x12,0xAF,0x33,0x7A,0x67,0x2C,0xB9,0x7B,0x13,0x9E,0x79,0xE0,0xBC,0x4E,0x2A,0x4B
        .byte   0x00,0x37,0xD7,0xD1,0x62,0x36,0xB5,0x58,0xCB,0x97,0xE2,0xA8,0x92,0x87,0x4B,0x60
        .byte   0x06,0xA8,0xDD,0xD9,0xD5,0x14,0x70,0x53,0x52,0xDB,0xE8,0x2B,0x9C,0x1F,0xF2,0x51
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0x32,0x9F,0x3D,0x40,0xFE,0x1A,0xB7,0x51
        .byte   0xA7,0x7C,0xE4,0x1B,0x49,0xD1,0x92,0x5B,0x93,0xF9,0x6A,0xF5,0x91,0xF7,0xA8,0x65
        .byte   0xD1,0x88,0x73,0x85,0x3B,0x1C,0xD4,0x6F,0x16,0x90,0x85,0xB9,0xBB,0xDB,0xEB,0x79
        .byte   0x6E,0xCB,0xAB,0xA3,0x86,0xFF,0xE2,0x41,0xEA,0x27,0x92,0xA2,0x09,0xDA,0x9B,0x46
        .byte   0xE6,0x0E,0x06,0xE2,0xF4,0x5B,0x0B,0x4B,0xCD,0x34,0x93,0x0D,0xFB,0x7E,0x1C,0x4F
        .byte   0xD0,0x01,0x75,0x3D,0xF1,0xEF,0xB2,0x52,0x09,0x64,0xBF,0xA4,0x7D,0xCF,0x75,0x55
        .byte   0x75,0xF5,0xA4,0xC1,0xD1,0x82,0xE9,0x55,0xEC,0x36,0xDB,0x26,0x08,0x80,0x6D,0x4F
        .byte   0x55,0x5C,0xF9,0x89,0x7A,0x05,0xFC,0x74,0xB3,0x58,0xCD,0xC2,0x61,0x20,0x5C,0x61
        .byte   0xB7,0x54,0xDC,0xC6,0x28,0xF8,0x1B,0x44,0x3D,0x20,0x8A,0x0C,0xF8,0x85,0x66,0x43
        .byte   0xE1,0x03,0x84,0xD3,0xBF,0x50,0xFA,0x7C,0xD5,0x76,0x10,0x6F,0x27,0xFC,0x1D,0x73
        .byte   0x3C,0xEC,0x9C,0x8D,0x00,0xA3,0x5B,0x69,0xBA,0xE4,0x11,0x30,0xFB,0x78,0xD2,0x5F
        .byte   0x47,0x75,0xF8,0xF8,0xF0,0x02,0x9D,0x56,0xA4,0x0D,0xDF,0xB6,0x72,0xF9,0xD0,0x4D
        .byte   0xD3,0xD7,0x3D,0xB1,0xD7,0x49,0x7F,0x45,0x3A,0x24,0x18,0x3C,0xB7,0x55,0x67,0x7B
        .byte   0x67,0x37,0x8B,0xEC,0x27,0xEB,0xDF,0x6C,0x9B,0x1B,0x20,0x75,0x45,0x16,0x24,0x5F
        .byte   0x27,0x15,0xF3,0x0C,0x7D,0xCC,0xFD,0x50,0x8F,0x56,0x0B,0xC8,0x2C,0x70,0xD9,0x7E
        .byte   0xA5,0x5F,0xEA,0xE6,0x4C,0xCD,0x0B,0x4F,0xDE,0xE3,0x83,0x53,0xC9,0xF4,0x26,0x6F
        .byte   0x42,0x32,0xEF,0xFC,0x99,0x79,0x82,0x52,0xB6,0x74,0x7B,0x06,0xF3,0x1C,0x83,0x6F
        .byte   0xE1,0xE8,0x2D,0x03,0xDB,0x9B,0xB3,0x55,0x13,0xCE,0xFE,0xB2,0x03,0x66,0x91,0x41
        .byte   0xDF,0xE4,0x55,0x3D,0x22,0xBE,0xE1,0x63,0xD9,0x84,0xEE,0x33,0x46,0x03,0xBE,0x4B
        .byte   0xB9,0x5E,0xA6,0x02,0x24,0x03,0x60,0x72,0xAA,0x07,0x36,0x21,0x96,0x81,0xFC,0x55
        .byte   0x86,0xDB,0x88,0xB8,0x0B,0xC1,0x5E,0x40,0x0B,0x57,0x25,0xFE,0x5D,0xD9,0xF7,0x5F
        .byte   0x12,0xB0,0x17,0x15,0x76,0x5E,0x34,0x47,0xC2,0xBA,0x0A,0x59,0xC9,0xF7,0xCF,0x68
        .byte   0x6C,0xC1,0x11,0x0A,0x66,0x07,0x3D,0x4B,0xC2,0x9C,0x89,0x2A,0x4C,0x43,0x6C,0x63
        .byte   0x66,0xE7,0x55,0x14,0x59,0x60,0x85,0x68,0xD1,0x43,0x12,0x29,0x5A,0x6F,0xE3,0x7B
        .byte   0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x63,0x2A,0xD9,0x61,0x7D,0xF6,0xBE,0x7A,0x5C
        .byte   0xB7,0x01,0x16,0x41,0x36,0xC5,0x0D,0x76,0x97,0xDB,0xA8,0x34,0xEB,0x36,0x1D,0x4B
        .byte   0x05,0x57,0xFA,0x06,0xF4,0xFC,0x49,0x5F,0x70,0x84,0x6C,0x08,0xFE,0xC4,0x82,0x78
        .byte   0xF7,0x3B,0x3C,0xAE,0x21,0xD1,0xF8,0x4B,0x93,0x49,0x07,0xF8,0xDA,0x97,0x7F,0x5F
        .byte   0xCC,0xF8,0xA6,0x38,0xEE,0x04,0xAF,0x77,0x52,0xB8,0x44,0xA0,0x5C,0x37,0xC5,0x4A
        .byte   0x88,0xAB,0x33,0xAA,0x04,0xFA,0x18,0x5D,0x73,0x78,0x26,0x6E,0x77,0xCE,0x1D,0x73
        .byte   0x76,0x96,0x69,0xFF,0xF1,0x78,0x7C,0x45,0xF5,0x15,0x42,0x04,0x9D,0x01,0x44,0x4D
        .byte   0x9C,0xD4,0xD9,0xDB,0xBA,0x7B,0x5E,0x44,0xAF,0x89,0xDB,0xD2,0xB1,0x3D,0x34,0x44
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x78,0xF3,0xF9,0x25,0x90,0x80,0x52,0xDC,0x4C
        .byte   0xCE,0xE3,0x33,0x94,0x06,0xD1,0x9F,0x51,0x14,0xAC,0x52,0x35,0x65,0x8A,0x7E,0x56
        .byte   0x84,0xC5,0x9B,0xCD,0x76,0xDA,0x74,0x5B,0x80,0x79,0x6E,0xC5,0xE9,0xCA,0x7E,0x60
        .byte   0x3A,0xD0,0xFF,0x57,0xBD,0x17,0x98,0x65,0x01,0xC2,0x0C,0xC4,0xA0,0x33,0xBC,0x6A
        .byte   0xE2,0x3F,0xCF,0x10,0x6A,0x37,0xE6,0x6F,0x54,0xF2,0xB9,0x51,0x45,0xA2,0x0F,0x75
        .byte   0xDA,0x9B,0x66,0x75,0x5C,0xC0,0x23,0x7A,0x77,0x9D,0x7A,0x49,0xA2,0xBC,0xAA,0x7E
        .byte   0x4C,0xD0,0xF3,0x10,0x02,0x02,0x2E,0x40,0xC7,0x09,0x9D,0xF4,0x06,0x69,0xE6,0x77
        .byte   0x40,0x90,0x39,0x33,0x22,0xBB,0x2C,0x59,0x72,0x18,0x7C,0xB5,0xED,0xE0,0xCB,0x4A
        .byte   0xB7,0x54,0xDC,0xC6,0x28,0xF8,0x1B,0x48,0x46,0x1B,0x52,0x5D,0xB3,0x5E,0xFE,0x7F
        .byte   0xCB,0x68,0xB1,0x1B,0x39,0xBA,0x40,0x71,0x62,0xCF,0x00,0x1B,0x94,0xC1,0x0E,0x64
        .byte   0xAD,0xD5,0xEB,0x63,0x98,0x2A,0x44,0x58,0x83,0x7E,0x7B,0xB1,0x27,0x53,0xBF,0x4D
        .byte   0xB3,0x10,0x82,0x54,0x65,0x25,0x61,0x44,0x11,0x94,0xBF,0xCD,0xE6,0xF2,0x19,0x78
        .byte   0xFF,0xFD,0xA6,0xFD,0xB0,0xD8,0x50,0x69,0x4E,0x0F,0xAD,0x5D,0xFE,0x93,0x35,0x5C
        .byte   0x84,0x72,0x84,0x1F,0x98,0x70,0x92,0x50,0x4B,0xE3,0x6B,0xA8,0x84,0x93,0x05,0x46
        .byte   0x6C,0xE9,0x32,0x86,0x1A,0xA7,0x01,0x77,0x82,0xA9,0x24,0x29,0x9F,0x23,0x4A,0x5D
        .byte   0x77,0x9E,0xC2,0x5D,0xA6,0xE9,0x89,0x74,0xAC,0x55,0x46,0x2F,0x54,0xBB,0x22,0x52
        .byte   0x42,0x32,0xEF,0xFC,0x99,0x79,0x82,0x56,0x69,0x6F,0x11,0x23,0xFF,0xD1,0xBC,0x6A
        .byte   0xE4,0xC4,0xE6,0x73,0xC2,0xF5,0xCB,0x4E,0x3D,0xE2,0x52,0x66,0xE1,0x7E,0x37,0x74
        .byte   0x8A,0xCD,0xF1,0x10,0x2B,0xFD,0x9C,0x55,0x4B,0xC0,0xC6,0xC7,0x7A,0x22,0x01,0x7E
        .byte   0xF1,0xA7,0xD8,0xB8,0x25,0xEA,0xA0,0x5C,0x80,0x64,0x79,0x5B,0x20,0xA5,0x05,0x44
        .byte   0x7E,0x6E,0x96,0xB2,0x72,0xC5,0xCC,0x63,0xCA,0xE6,0x8A,0x2C,0x52,0xC5,0x21,0x49
        .byte   0x73,0x75,0x9D,0xD6,0x21,0x39,0x03,0x6B,0x26,0x4F,0xB3,0x03,0x15,0x39,0xE8,0x4D
        .byte   0xE2,0x71,0xA8,0xCF,0xDB,0x78,0xFB,0x6E,0x65,0x4D,0x8D,0x1A,0xE0,0x41,0xF9,0x48
        .byte   0xA1,0x3A,0x4E,0x7D,0x7D,0xE2,0x85,0x4C,0x49,0xB4,0xB3,0xC4,0x2D,0x43,0x9B,0x5A
        .byte   0x7A,0xB5,0x4E,0x6B,0x65,0x7E,0xA2,0x67,0xF8,0xA9,0xE4,0xDB,0x58,0xE7,0x20,0x59
        .byte   0xF0,0xC2,0x8D,0xD8,0xD4,0x7D,0xEB,0x6D,0x20,0x12,0x84,0xD6,0xD8,0x02,0xBB,0x43
        .byte   0x88,0xE9,0xD2,0x33,0xE0,0x26,0x68,0x53,0x8A,0x09,0x0B,0x5E,0x39,0xC5,0xA2,0x66
        .byte   0x51,0x48,0xEF,0xDA,0x67,0x81,0x34,0x7E,0xAE,0x30,0xFF,0x3E,0x38,0x58,0x89,0x4D
        .byte   0xD7,0x72,0x47,0x96,0x97,0xCB,0x33,0x5F,0x01,0xFF,0x1F,0xCD,0x57,0xC6,0xCE,0x74
        .byte   0x4C,0x21,0xCF,0xF7,0xDD,0xFA,0x9A,0x47,0xBC,0xB8,0x8D,0xE4,0x61,0x31,0xB7,0x57
        .byte   0xB1,0x34,0xB2,0xE0,0x14,0xB1,0x31,0x6B,0x47,0x03,0x4F,0x94,0xDF,0x98,0x81,0x40
        .byte   0xC1,0x35,0xAA,0x2C,0xE5,0x83,0x1E,0x47,0xB0,0x9A,0x6B,0x8F,0x94,0x85,0xCB,0x6A
LADL_qwXB_SC:
        .byte   0xFF,0xFF,0xFF,0x7F,0x41,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x3F,0x00,0x00,0x00
        .byte   0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3D,0x00,0x00,0x00
        .byte   0x3D,0x00,0x00,0x00,0x3D,0x00,0x00,0x00,0x3C,0x00,0x00,0x00,0x3C,0x00,0x00,0x00
        .byte   0x3C,0x00,0x00,0x00,0x3B,0x00,0x00,0x00,0x3B,0x00,0x00,0x00,0x3B,0x00,0x00,0x00
        .byte   0x3B,0x00,0x00,0x00,0x3A,0x00,0x00,0x00,0x3A,0x00,0x00,0x00,0x3A,0x00,0x00,0x00
LADL_qwE_SC:
        .byte   0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x41,0x00,0x00,0x00
        .byte   0x43,0x00,0x00,0x00,0x45,0x00,0x00,0x00,0x48,0x00,0x00,0x00
LADL_qwP_SC:
        .byte   0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3F,0x00,0x00,0x00
        .byte   0x3F,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x41,0x00,0x00,0x00
        .byte   0x42,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x45,0x00,0x00,0x00
        .byte   0x47,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x4C,0x00,0x00,0x00
        .byte   0x41,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00
        .byte   0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x42,0x00,0x00,0x00
        .byte   0x43,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x45,0x00,0x00,0x00,0x47,0x00,0x00,0x00
        .byte   0x48,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x4B,0x00,0x00,0x00,0x4D,0x00,0x00,0x00
        .byte   0x40,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x40,0x00,0x00,0x00
        .byte   0x40,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x43,0x00,0x00,0x00
        .byte   0x44,0x00,0x00,0x00,0x45,0x00,0x00,0x00,0x47,0x00,0x00,0x00,0x48,0x00,0x00,0x00
        .byte   0x49,0x00,0x00,0x00,0x4B,0x00,0x00,0x00,0x4D,0x00,0x00,0x00,0x4F,0x00,0x00,0x00
        .byte   0x3F,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00
        .byte   0x41,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x44,0x00,0x00,0x00
        .byte   0x46,0x00,0x00,0x00,0x47,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x4A,0x00,0x00,0x00
        .byte   0x4B,0x00,0x00,0x00,0x4D,0x00,0x00,0x00,0x4E,0x00,0x00,0x00,0x51,0x00,0x00,0x00
        .byte   0x3E,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x41,0x00,0x00,0x00
        .byte   0x42,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x46,0x00,0x00,0x00
        .byte   0x47,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x4A,0x00,0x00,0x00,0x4B,0x00,0x00,0x00
        .byte   0x4D,0x00,0x00,0x00,0x4F,0x00,0x00,0x00,0x51,0x00,0x00,0x00,0x53,0x00,0x00,0x00
        .byte   0x3E,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x42,0x00,0x00,0x00
        .byte   0x43,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x46,0x00,0x00,0x00,0x47,0x00,0x00,0x00
        .byte   0x49,0x00,0x00,0x00,0x4A,0x00,0x00,0x00,0x4C,0x00,0x00,0x00,0x4D,0x00,0x00,0x00
        .byte   0x4F,0x00,0x00,0x00,0x51,0x00,0x00,0x00,0x53,0x00,0x00,0x00,0x56,0x00,0x00,0x00
        .byte   0x3E,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x43,0x00,0x00,0x00
        .byte   0x44,0x00,0x00,0x00,0x46,0x00,0x00,0x00,0x47,0x00,0x00,0x00,0x49,0x00,0x00,0x00
        .byte   0x4A,0x00,0x00,0x00,0x4C,0x00,0x00,0x00,0x4E,0x00,0x00,0x00,0x4F,0x00,0x00,0x00
        .byte   0x51,0x00,0x00,0x00,0x53,0x00,0x00,0x00,0x55,0x00,0x00,0x00,0x58,0x00,0x00,0x00
        .byte   0x3D,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x44,0x00,0x00,0x00
        .byte   0x45,0x00,0x00,0x00,0x47,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x4A,0x00,0x00,0x00
        .byte   0x4C,0x00,0x00,0x00,0x4E,0x00,0x00,0x00,0x50,0x00,0x00,0x00,0x52,0x00,0x00,0x00
        .byte   0x54,0x00,0x00,0x00,0x56,0x00,0x00,0x00,0x58,0x00,0x00,0x00,0x5B,0x00,0x00,0x00
        .byte   0x3D,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x44,0x00,0x00,0x00
        .byte   0x46,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x4A,0x00,0x00,0x00,0x4C,0x00,0x00,0x00
        .byte   0x4E,0x00,0x00,0x00,0x50,0x00,0x00,0x00,0x52,0x00,0x00,0x00,0x54,0x00,0x00,0x00
        .byte   0x56,0x00,0x00,0x00,0x59,0x00,0x00,0x00,0x5B,0x00,0x00,0x00,0x5F,0x00,0x00,0x00
        .byte   0x3D,0x00,0x00,0x00,0x41,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x45,0x00,0x00,0x00
        .byte   0x47,0x00,0x00,0x00,0x4A,0x00,0x00,0x00,0x4C,0x00,0x00,0x00,0x4E,0x00,0x00,0x00
        .byte   0x50,0x00,0x00,0x00,0x52,0x00,0x00,0x00,0x55,0x00,0x00,0x00,0x57,0x00,0x00,0x00
        .byte   0x59,0x00,0x00,0x00,0x5C,0x00,0x00,0x00,0x5E,0x00,0x00,0x00,0x62,0x00,0x00,0x00
        .byte   0x3C,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x46,0x00,0x00,0x00
        .byte   0x49,0x00,0x00,0x00,0x4B,0x00,0x00,0x00,0x4D,0x00,0x00,0x00,0x50,0x00,0x00,0x00
        .byte   0x52,0x00,0x00,0x00,0x55,0x00,0x00,0x00,0x57,0x00,0x00,0x00,0x5A,0x00,0x00,0x00
        .byte   0x5C,0x00,0x00,0x00,0x5F,0x00,0x00,0x00,0x62,0x00,0x00,0x00,0x65,0x00,0x00,0x00
        .byte   0x3C,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x47,0x00,0x00,0x00
        .byte   0x4A,0x00,0x00,0x00,0x4C,0x00,0x00,0x00,0x4F,0x00,0x00,0x00,0x52,0x00,0x00,0x00
        .byte   0x54,0x00,0x00,0x00,0x57,0x00,0x00,0x00,0x5A,0x00,0x00,0x00,0x5C,0x00,0x00,0x00
        .byte   0x5F,0x00,0x00,0x00,0x62,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x69,0x00,0x00,0x00
        .byte   0x3C,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x45,0x00,0x00,0x00,0x48,0x00,0x00,0x00
        .byte   0x4B,0x00,0x00,0x00,0x4E,0x00,0x00,0x00,0x50,0x00,0x00,0x00,0x53,0x00,0x00,0x00
        .byte   0x56,0x00,0x00,0x00,0x59,0x00,0x00,0x00,0x5C,0x00,0x00,0x00,0x5F,0x00,0x00,0x00
        .byte   0x62,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x69,0x00,0x00,0x00,0x6D,0x00,0x00,0x00
        .byte   0x3B,0x00,0x00,0x00,0x42,0x00,0x00,0x00,0x46,0x00,0x00,0x00,0x49,0x00,0x00,0x00
        .byte   0x4C,0x00,0x00,0x00,0x4F,0x00,0x00,0x00,0x52,0x00,0x00,0x00,0x55,0x00,0x00,0x00
        .byte   0x58,0x00,0x00,0x00,0x5C,0x00,0x00,0x00,0x5F,0x00,0x00,0x00,0x62,0x00,0x00,0x00
        .byte   0x65,0x00,0x00,0x00,0x69,0x00,0x00,0x00,0x6C,0x00,0x00,0x00,0x71,0x00,0x00,0x00
        .byte   0x3B,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x46,0x00,0x00,0x00,0x49,0x00,0x00,0x00
        .byte   0x4D,0x00,0x00,0x00,0x50,0x00,0x00,0x00,0x54,0x00,0x00,0x00,0x57,0x00,0x00,0x00
        .byte   0x5A,0x00,0x00,0x00,0x5E,0x00,0x00,0x00,0x61,0x00,0x00,0x00,0x65,0x00,0x00,0x00
        .byte   0x68,0x00,0x00,0x00,0x6C,0x00,0x00,0x00,0x70,0x00,0x00,0x00,0x75,0x00,0x00,0x00
        .byte   0x3B,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x47,0x00,0x00,0x00,0x4A,0x00,0x00,0x00
        .byte   0x4E,0x00,0x00,0x00,0x52,0x00,0x00,0x00,0x55,0x00,0x00,0x00,0x59,0x00,0x00,0x00
        .byte   0x5D,0x00,0x00,0x00,0x60,0x00,0x00,0x00,0x64,0x00,0x00,0x00,0x68,0x00,0x00,0x00
        .byte   0x6B,0x00,0x00,0x00,0x6F,0x00,0x00,0x00,0x73,0x00,0x00,0x00,0x78,0x00,0x00,0x00
        .byte   0x3B,0x00,0x00,0x00,0x43,0x00,0x00,0x00,0x47,0x00,0x00,0x00,0x4B,0x00,0x00,0x00
        .byte   0x4F,0x00,0x00,0x00,0x53,0x00,0x00,0x00,0x57,0x00,0x00,0x00,0x5B,0x00,0x00,0x00
        .byte   0x5F,0x00,0x00,0x00,0x63,0x00,0x00,0x00,0x67,0x00,0x00,0x00,0x6B,0x00,0x00,0x00
        .byte   0x6E,0x00,0x00,0x00,0x73,0x00,0x00,0x00,0x77,0x00,0x00,0x00,0x7C,0x00,0x00,0x00
        .byte   0x3A,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x4C,0x00,0x00,0x00
        .byte   0x50,0x00,0x00,0x00,0x54,0x00,0x00,0x00,0x58,0x00,0x00,0x00,0x5D,0x00,0x00,0x00
        .byte   0x61,0x00,0x00,0x00,0x65,0x00,0x00,0x00,0x69,0x00,0x00,0x00,0x6D,0x00,0x00,0x00
        .byte   0x72,0x00,0x00,0x00,0x76,0x00,0x00,0x00,0x7B,0x00,0x00,0x00,0x80,0x00,0x00,0x00
        .byte   0x3A,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x48,0x00,0x00,0x00,0x4D,0x00,0x00,0x00
        .byte   0x51,0x00,0x00,0x00,0x56,0x00,0x00,0x00,0x5A,0x00,0x00,0x00,0x5E,0x00,0x00,0x00
        .byte   0x63,0x00,0x00,0x00,0x67,0x00,0x00,0x00,0x6C,0x00,0x00,0x00,0x70,0x00,0x00,0x00
        .byte   0x75,0x00,0x00,0x00,0x79,0x00,0x00,0x00,0x7E,0x00,0x00,0x00,0x84,0x00,0x00,0x00
        .byte   0x3A,0x00,0x00,0x00,0x44,0x00,0x00,0x00,0x49,0x00,0x00,0x00,0x4D,0x00,0x00,0x00
        .byte   0x52,0x00,0x00,0x00,0x57,0x00,0x00,0x00,0x5C,0x00,0x00,0x00,0x60,0x00,0x00,0x00
        .byte   0x65,0x00,0x00,0x00,0x6A,0x00,0x00,0x00,0x6E,0x00,0x00,0x00,0x73,0x00,0x00,0x00
        .byte   0x78,0x00,0x00,0x00,0x7C,0x00,0x00,0x00,0x81,0x00,0x00,0x00,0x87,0x00,0x00,0x00


