        .text
        .align  4
        .globl  erfcf


erfcf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r1, r0
        bics    r2, r1, #2, 2
        str     r0, [sp, #0x3C]
        beq     LADK194
        mov     r3, #0xFE, 10
        orr     r3, r3, #1, 2
        cmp     r3, r2
        bhi     LADK2
        mov     r2, #0xFE, 10
        orr     r2, r2, #1, 2
        cmp     r2, r1
        beq     LADK465
        cmn     r1, #2, 10
        bne     LADK1
LADK0:
        mov     r0, #1, 2
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADK1:
        mov     r0, r1
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADK2:
        ldr     r3, [pc, #0xFBC]
        cmp     r3, r2
        bhi     LADK3
        cmp     r1, #0
        ble     LADK0
        add     r0, sp, #0x3C
        add     r2, sp, #0x38
        add     r1, sp, #0x3C
        mov     r12, #0
        str     r12, [sp, #0x38]
        mov     r3, #0xD1
        bl      __libm_error_support
        ldr     r0, [sp, #0x38]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADK3:
        mvn     r3, #0xFE, 10
        bic     r3, r3, #3, 2
        cmp     r3, r2
        bcs     LADK4
        mov     r1, r1, lsl #7
        sub     r2, r2, #0xFE, 10
        bic     r1, r1, #3, 2
        mov     r0, r2, asr #23
        orr     r6, r1, #1, 2
        rsb     r5, r0, #0x3E
        mov     r7, #0
        mov     r4, r6
        b       LADK5
LADK4:
        mov     r6, r1, lsl #7
        mov     r4, r6
        tst     r4, #1, 2
        mov     r5, #0xBC
        mov     r7, #0
        bne     LADK5
        cmp     r4, #0
        clzeq   r7, r7
        addeq   r5, r7, #0x1F
        clzne   r0, r4
        subne   r5, r0, #1
        mov     r3, r5, asr #31
        mov     r1, r4
        mov     r2, r5
        mov     r0, #0
        bl      __ashldi3
        mov     r7, r0
        mov     r4, r1
        add     r5, r5, #0xBC
LADK5:
        ldr     r2, [pc, #0xF04]
        ldr     r3, [r2]
        ldr     r2, [r2, #4]
        orrs    r12, r2, r3
        bne     LADK6
        orrs    lr, r4, r7
        beq     LADK8
LADK6:
        cmp     r5, #0x3E
        beq     LADK464
LADK7:
        cmp     r12, #0
        beq     LADK12
        orrs    r12, r4, r7
        beq     LADK8
        cmp     r5, #0x3E
        ble     LADK11
LADK8:
        sub     r12, r5, #0x3E
        cmp     r12, #0x20
        bcs     LADK9
        rsb     lr, r5, #0x5E
        mov     lr, r4, lsl lr
        orr     r8, lr, r7, lsr r12
        mov     lr, r4, asr r12
        b       LADK10
LADK9:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r5, #0x5E
        mov     r8, r4, asr r12
        mov     lr, r4, asr #31
LADK10:
        adds    r12, r3, r8
        adc     lr, r2, lr
        tst     lr, lr
        mov     r8, #0x3E
        bmi     LADK195
        b       LADK15
LADK11:
        cmp     r5, #0x3E
        beq     LADK196
LADK12:
        rsb     r12, r5, #0x3E
        cmp     r12, #0x20
        bcs     LADK13
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r2, r2, asr r12
        b       LADK14
LADK13:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r2, r2, asr #31
LADK14:
        adds    r12, r7, r3
        adc     lr, r4, r2
        tst     lr, lr
        mov     r8, r5
        bmi     LADK463
LADK15:
        umull   r2, r3, r12, r12
        umull   r2, r12, r12, lr
        umull   r9, lr, lr, lr
        mov     r8, r8, lsl #1
        sub     r8, r8, #0x3F
        adds    r10, r2, r3
        adc     r3, r12, #0
        adds    r12, r9, r12
        adc     lr, lr, #0
        adds    r10, r2, r10
        adc     r3, r3, #0
        adds    r3, r3, r12
        mov     r12, r10, lsr #31
        mov     r10, r10, lsr #30
        adc     r2, lr, #0
        orr     r12, r12, r3, lsl #1
        and     r10, r10, #1
        adds    r0, r12, r10
        mov     r3, r3, lsr #31
        orr     r2, r3, r2, lsl #1
        adc     r1, r2, #0
        tst     r1, #1, 2
        bne     LADK16
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r8, r8, r2
        bl      __ashldi3
LADK16:
        umull   r3, r2, r0, r0
        umull   r3, r12, r0, r1
        umull   r1, lr, r1, r1
        mov     r8, r8, lsl #1
        sub     r8, r8, #0x3F
        adds    r9, r3, r2
        adc     r2, r12, #0
        adds    r12, r1, r12
        adc     lr, lr, #0
        adds    r9, r3, r9
        adc     r2, r2, #0
        adds    r3, r2, r12
        mov     r12, r9, lsr #31
        mov     r9, r9, lsr #30
        orr     r12, r12, r3, lsl #1
        adc     r2, lr, #0
        and     r9, r9, #1
        mov     r3, r3, lsr #31
        adds    r12, r12, r9
        orr     r2, r3, r2, lsl #1
        adc     r2, r2, #0
        tst     r2, #1, 2
        bne     LADK17
        cmp     r2, #0
        clzeq   r12, r12
        addeq   r2, r12, #0x1F
        clzne   r2, r2
        subne   r2, r2, #1
        add     r8, r8, r2
LADK17:
        ldr     r3, [pc, #0xD40]
        rsb     r8, r8, #0x3E
        str     r8, [sp, #0x20]
        add     r2, r3, r8, lsl #3
        ldr     r3, [r3, +r8, lsl #3]
        ldr     r2, [r2, #4]
        orrs    r12, r2, r3
        bne     LADK18
        orrs    lr, r4, r7
        bne     LADK18
        ldr     r12, [sp, #0x20]
        ldr     lr, [pc, #0xD18]
        ldr     r12, [lr, +r12, lsl #2]
        str     r12, [sp, #0x24]
        b       LADK20
LADK18:
        ldr     lr, [sp, #0x20]
        ldr     r8, [pc, #0xD04]
        ldr     lr, [r8, +lr, lsl #2]
        cmp     lr, r5
        str     lr, [sp, #0x24]
        bne     LADK19
        cmp     r2, r4
        bne     LADK19
        cmp     r3, r7
        beq     LADK20
LADK19:
        cmp     r12, #0
        beq     LADK26
        orrs    r12, r4, r7
        beq     LADK20
        ldr     r12, [sp, #0x24]
        cmp     r12, r5
        blt     LADK20
        ldr     r12, [sp, #0x24]
        cmp     r12, r5
        bne     LADK26
        cmp     r2, r4
        bhi     LADK20
        cmp     r2, r4
        bne     LADK26
        cmp     r3, r7
        bls     LADK26
LADK20:
        ldr     r12, [sp, #0x24]
        sub     r12, r5, r12
        cmp     r12, #0x20
        bcs     LADK21
        rsb     lr, r12, #0x20
        mov     lr, r4, lsl lr
        orr     r7, lr, r7, lsr r12
        mov     r12, r4, asr r12
        b       LADK22
LADK21:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r7, r4, asr r12
        mov     r12, r4, asr #31
LADK22:
        subs    r3, r3, r7
        sbc     r2, r2, r12
        tst     r2, #1, 2
        bne     LADK25
        cmp     r2, #0
        bne     LADK23
        cmp     r3, #0
        moveq   r0, #0
        beq     LADK24
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADK24
LADK23:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r3, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r3, r3, lsl r0
LADK24:
        ldr     r1, [sp, #0x24]
        add     r0, r1, r0
        str     r0, [sp, #0x24]
LADK25:
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x28]
        b       LADK31
LADK26:
        ldr     r12, [sp, #0x24]
        sub     r12, r12, r5
        cmp     r12, #0x20
        bcs     LADK27
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADK28
LADK27:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADK28:
        subs    r7, r7, r3
        sbc     r4, r4, r12
        tst     r4, #1, 2
        str     r7, [sp, #0x2C]
        str     r4, [sp, #0x28]
        str     r5, [sp, #0x24]
        bne     LADK31
        ldr     r0, [sp, #0x28]
        cmp     r0, #0
        bne     LADK29
        ldr     r0, [sp, #0x2C]
        cmp     r0, #0
        moveq   r0, #0
        beq     LADK30
        ldr     r1, [sp, #0x2C]
        clz     r0, r1
        mov     r1, r1, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r1, lsr #1
        mov     r1, r1, lsl #31
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x2C]
        b       LADK30
LADK29:
        ldr     r2, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r3, r0, #0x20
        mov     r3, r1, lsr r3
        orr     r2, r3, r2, lsl r0
        mov     r1, r1, lsl r0
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x2C]
LADK30:
        add     r0, r5, r0
        str     r0, [sp, #0x24]
LADK31:
        mov     r0, #0xFF
        orr     r0, r0, #0xF, 24
        and     r4, r6, r0
        bic     r6, r6, #0xF, 24
        tst     r4, #1, 2
        bic     r6, r6, #0xFF
        mov     r10, #0
        mov     r11, r5
        bne     LADK33
        cmp     r4, #0
        clzne   r0, r4
        subne   r7, r0, #1
        bne     LADK32
        mov     r0, #0
        clz     r0, r0
        add     r7, r0, #0x1F
LADK32:
        mov     r3, r7, asr #31
        mov     r1, r4
        mov     r0, #0
        mov     r2, r7
        bl      __ashldi3
        mov     r10, r0
        mov     r4, r1
        add     r11, r5, r7
LADK33:
        mov     r2, #0
        umull   r9, r0, r2, r4
        umull   r3, r8, r2, r10
        umull   lr, r2, r10, r6
        umull   r3, r12, r4, r6
        adds    r9, r9, r8
        adc     r8, r0, #0
        add     r7, r5, r11
        adds    r2, r3, r2
        adc     r12, r12, #0
        adds    r9, lr, r9
        adc     r8, r8, #0
        adds    r3, r8, r2
        adc     r2, r12, #0
        mov     r12, r9, lsr #31
        mov     r9, r9, lsr #30
        orr     r12, r12, r3, lsl #1
        and     lr, r9, #1
        mov     r3, r3, lsr #31
        adds    r9, r12, lr
        orr     r2, r3, r2, lsl #1
        adc     r8, r2, #0
        tst     r8, #1, 2
        sub     r7, r7, #0x3F
        bne     LADK36
        cmp     r8, #0
        beq     LADK34
        clz     r2, r8
        sub     r2, r2, #1
        str     r2, [sp, #0xC]
        b       LADK35
LADK34:
        clz     r2, r9
        add     r2, r2, #0x1F
        str     r2, [sp, #0xC]
LADK35:
        ldr     r2, [sp, #0xC]
        mov     r0, r9
        mov     r1, r8
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0xC]
        mov     r9, r0
        mov     r8, r1
        add     r7, r7, r2
LADK36:
        mov     r12, #0
        umull   r3, r2, r12, r6
        umull   r12, lr, r12, r12
        umull   r6, r12, r6, r6
        sub     r7, r7, #1
        str     r7, [sp, #0xC]
        adds    lr, r3, lr
        mov     r7, r5, lsl #1
        adc     r5, r2, #0
        adds    r2, r6, r2
        adc     r12, r12, #0
        adds    lr, r3, lr
        adc     r5, r5, #0
        adds    r3, r5, r2
        adc     r2, r12, #0
        mov     r12, lr, lsr #31
        mov     lr, lr, lsr #30
        orr     r12, r12, r3, lsl #1
        and     lr, lr, #1
        mov     r3, r3, lsr #31
        adds    r6, r12, lr
        orr     r2, r3, r2, lsl #1
        adc     r5, r2, #0
        tst     r5, #1, 2
        sub     r7, r7, #0x3F
        bne     LADK39
        cmp     r5, #0
        beq     LADK37
        clz     r2, r5
        sub     r2, r2, #1
        str     r2, [sp, #8]
        b       LADK38
LADK37:
        clz     r2, r6
        add     r2, r2, #0x1F
        str     r2, [sp, #8]
LADK38:
        ldr     r2, [sp, #8]
        mov     r0, r6
        mov     r1, r5
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #8]
        mov     r6, r0
        mov     r5, r1
        add     r7, r7, r2
LADK39:
        umull   r3, r2, r10, r4
        umull   r12, r10, r10, r10
        umull   r12, lr, r4, r4
        mov     r4, r11, lsl #1
        adds    r10, r3, r10
        adc     r11, r2, #0
        sub     r4, r4, #0x3F
        adds    r2, r12, r2
        adc     lr, lr, #0
        adds    r10, r3, r10
        adc     r11, r11, #0
        adds    r3, r11, r2
        mov     r12, r10, lsr #31
        adc     r2, lr, #0
        orr     r12, r12, r3, lsl #1
        mov     r10, r10, lsr #30
        and     lr, r10, #1
        mov     r3, r3, lsr #31
        adds    r0, r12, lr
        orr     r2, r3, r2, lsl #1
        adc     r1, r2, #0
        tst     r1, #1, 2
        bne     LADK40
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r10, r2, #0x1F
        clzne   r2, r1
        subne   r10, r2, #1
        mov     r3, r10, asr #31
        mov     r2, r10
        bl      __ashldi3
        add     r4, r4, r10
LADK40:
        ldr     r2, [sp, #0xC]
        sub     r4, r4, r2
        cmp     r4, #0x20
        bcs     LADK41
        rsb     r2, r4, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r4
        mov     r4, r1, asr r4
        b       LADK42
LADK41:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r0, r1, asr r4
        mov     r4, r1, asr #31
LADK42:
        adds    r0, r9, r0
        adc     r4, r8, r4
        tst     r4, r4
        str     r0, [sp, #0x14]
        str     r4, [sp]
        bpl     LADK43
        ldr     r2, [sp]
        ldr     r3, [sp, #0x14]
        mov     r12, r2, lsl #31
        mov     r2, r2, lsr #1
        str     r2, [sp]
        ldr     r2, [sp, #0xC]
        orr     r3, r12, r3, lsr #1
        str     r3, [sp, #0x14]
        sub     r2, r2, #1
        str     r2, [sp, #0xC]
LADK43:
        ldr     r2, [pc, #0x880]
        ldr     r3, [r2]
        ldr     r2, [r2, #4]
        orrs    r12, r2, r3
        bne     LADK44
        orrs    lr, r5, r6
        beq     LADK46
LADK44:
        cmp     r7, #0x37
        beq     LADK462
LADK45:
        cmp     r12, #0
        beq     LADK48
        orrs    r12, r5, r6
        beq     LADK46
        cmp     r7, #0x37
        ble     LADK47
LADK46:
        umull   r8, r10, r3, r5
        umull   r12, lr, r6, r3
        umull   r3, r12, r6, r2
        umull   r4, r2, r2, r5
        adds    r8, r8, lr
        adc     lr, r10, #0
        sub     r11, r7, #8
        adds    r12, r4, r12
        adc     r2, r2, #0
        adds    r8, r3, r8
        adc     lr, lr, #0
        adds    r12, lr, r12
        mov     lr, r8, lsr #31
        mov     r8, r8, lsr #30
        adc     r2, r2, #0
        mov     r3, r12, lsr #31
        orr     r12, lr, r12, lsl #1
        and     r8, r8, #1
        orr     r2, r3, r2, lsl #1
        adds    r0, r12, r8
        adc     r1, r2, #0
        b       LADK49
LADK47:
        cmp     r7, #0x37
        beq     LADK197
LADK48:
        umull   r12, r4, r6, r3
        umull   r10, lr, r6, r2
        umull   r3, r12, r3, r5
        umull   r8, r2, r2, r5
        sub     r11, r7, #8
        adds    r4, r10, r4
        adc     lr, lr, #0
        adds    r12, r8, r12
        adc     r2, r2, #0
        adds    r4, r3, r4
        adc     lr, lr, #0
        adds    r12, lr, r12
        mov     lr, r4, lsr #31
        mov     r4, r4, lsr #30
        adc     r2, r2, #0
        mov     r3, r12, lsr #31
        orr     r12, lr, r12, lsl #1
        and     r4, r4, #1
        orr     r2, r3, r2, lsl #1
        adds    r0, r12, r4
        adc     r1, r2, #0
LADK49:
        tst     r1, #1, 2
        bne     LADK50
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r4, r2, #0x1F
        clzne   r2, r1
        subne   r4, r2, #1
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        add     r11, r11, r4
LADK50:
        cmp     r11, #0x3F
        ble     LADK51
        mov     r8, #0
        mov     r11, r8
        mov     r9, r11
        str     r9, [sp, #4]
        b       LADK63
LADK51:
        cmp     r11, #0x20
        bcs     LADK52
        rsb     r2, r11, #0x20
        mov     r2, r1, lsl r2
        orr     r2, r2, r0, lsr r11
        mov     r3, r1, asr r11
        b       LADK53
LADK52:
        cmp     r11, #0x40
        movcs   r2, #0x1F
        subcc   r2, r11, #0x20
        mov     r2, r1, asr r2
        mov     r3, r1, asr #31
LADK53:
        cmp     r11, #0x20
        bcs     LADK54
        rsb     r12, r11, #0x20
        mov     r12, r2, lsr r12
        orr     r8, r12, r3, lsl r11
        mov     r9, r2, lsl r11
        b       LADK55
LADK54:
        cmp     r11, #0x40
        movcs   r8, #0
        subcc   r3, r11, #0x20
        movcc   r8, r2, lsl r3
        mov     r9, #0
LADK55:
        mov     r2, #0
        cmp     r2, #0x20
        str     r8, [sp, #4]
        bcs     LADK56
        ldr     r3, [sp, #4]
        orr     r2, r9, r3
        b       LADK57
LADK56:
        cmp     r2, #0x40
        movcs   r2, #0x1F
        mvncc   r2, #0x1F
        ldr     r3, [sp, #4]
        mov     r2, r3, asr r2
        mov     r3, r3, asr #31
LADK57:
        subs    r0, r0, r2
        sbc     r1, r1, r3
        tst     r1, #1, 2
        bne     LADK59
        cmp     r1, #0
        clzne   r1, r1
        subne   r0, r1, #1
        bne     LADK58
        cmp     r0, #0
        clzne   r0, r0
        addne   r0, r0, #0x1F
        moveq   r0, #0
LADK58:
        add     r2, r11, r0
        cmp     r2, #0x3F
        bgt     LADK63
LADK59:
        ldr     r3, [sp, #4]
        ldr     r2, [pc, #0x668]
        orrs    r3, r3, r9
        bne     LADK60
        ldr     r8, [r2, #4]
        ldr     r9, [r2]
        mov     r11, #0x3E
        str     r8, [sp, #4]
        b       LADK63
LADK60:
        ldr     r12, [r2]
        ldr     r2, [r2, #4]
        rsb     r3, r11, #0x3E
        cmp     r3, #0x20
        bcs     LADK61
        rsb     lr, r3, #0x20
        mov     lr, r2, lsl lr
        orr     r12, lr, r12, lsr r3
        mov     r3, r2, asr r3
        b       LADK62
LADK61:
        cmp     r3, #0x40
        movcs   r3, #0x1F
        subcc   r3, r3, #0x20
        mov     r12, r2, asr r3
        mov     r3, r2, asr #31
LADK62:
        adds    r9, r9, r12
        adc     r8, r8, r3
        tst     r8, r8
        strpl   r8, [sp, #4]
        bpl     LADK63
        mov     r2, r8, lsl #31
        mov     r8, r8, lsr #1
        sub     r11, r11, #1
        orr     r9, r2, r9, lsr #1
        str     r8, [sp, #4]
LADK63:
        cmp     r11, #0x20
        bcs     LADK64
        ldr     r3, [sp, #4]
        rsb     r2, r11, #0x20
        mov     r2, r3, lsl r2
        orr     r2, r2, r9, lsr r11
        str     r2, [sp, #0x1C]
        b       LADK65
LADK64:
        cmp     r11, #0x40
        movcs   r2, #0x1F
        subcc   r2, r11, #0x20
        ldr     r3, [sp, #4]
        mov     r2, r3, asr r2
        str     r2, [sp, #0x1C]
LADK65:
        ldr     r2, [sp, #0x1C]
        ldr     r3, [pc, #0x5B8]
        and     r2, r2, #0x7F
        str     r2, [sp, #0x18]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        orrs    r12, r3, r2
        bne     LADK66
        ldr     lr, [sp, #4]
        orrs    lr, lr, r9
        beq     LADK68
LADK66:
        cmp     r11, #0x46
        beq     LADK461
LADK67:
        cmp     r12, #0
        beq     LADK70
        ldr     r12, [sp, #4]
        orrs    r12, r12, r9
        beq     LADK68
        cmp     r11, #0x46
        ble     LADK69
LADK68:
        umull   lr, r12, r2, r8
        umull   r2, r4, r9, r2
        umull   r10, r2, r3, r9
        adds    lr, lr, r4
        adc     r12, r12, #0
        add     r4, r11, #7
        str     r10, [sp, #0x10]
        umull   r3, r10, r3, r8
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x10]
        adds    r3, r3, r2
        ldr     r2, [sp, #8]
        adc     r2, r2, #0
        adds    lr, r10, lr
        adc     r12, r12, #0
        adds    r3, r12, r3
        mov     r10, lr, lsr #31
        mov     lr, lr, lsr #30
        mov     r12, r3, lsr #31
        adc     r2, r2, #0
        and     lr, lr, #1
        orr     r3, r10, r3, lsl #1
        adds    lr, r3, lr
        orr     r2, r12, r2, lsl #1
        str     lr, [sp, #8]
        adc     r10, r2, #0
        b       LADK71
LADK69:
        cmp     r11, #0x46
        beq     LADK198
LADK70:
        umull   r4, r12, r3, r9
        str     r12, [sp, #0x10]
        umull   r12, lr, r9, r2
        umull   r2, r12, r2, r8
        adds    lr, r4, lr
        add     r4, r11, #7
        str     r12, [sp, #8]
        str     r2, [sp, #0x30]
        umull   r12, r3, r3, r8
        ldr     r2, [sp, #0x10]
        ldr     r10, [sp, #8]
        adc     r2, r2, #0
        adds    r12, r12, r10
        ldr     r10, [sp, #0x30]
        adc     r3, r3, #0
        adds    lr, r10, lr
        adc     r2, r2, #0
        adds    r12, r2, r12
        mov     r10, lr, lsr #31
        mov     lr, lr, lsr #30
        mov     r2, r12, lsr #31
        adc     r3, r3, #0
        and     lr, lr, #1
        orr     r12, r10, r12, lsl #1
        adds    lr, r12, lr
        orr     r3, r2, r3, lsl #1
        str     lr, [sp, #8]
        adc     r10, r3, #0
LADK71:
        tst     r10, #1, 2
        bne     LADK74
        cmp     r10, #0
        beq     LADK72
        clz     r2, r10
        sub     r2, r2, #1
        str     r2, [sp, #0x10]
        b       LADK73
LADK72:
        ldr     r2, [sp, #8]
        clz     r2, r2
        add     r2, r2, #0x1F
        str     r2, [sp, #0x10]
LADK73:
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #8]
        mov     r1, r10
        mov     r3, r2, asr #31
        ldr     r2, [sp, #0x10]
        bl      __ashldi3
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #8]
        mov     r10, r1
        add     r4, r4, r2
LADK74:
        ldr     r2, [pc, #0x434]
        ldr     lr, [r2]
        ldr     r3, [r2, #4]
        orrs    r2, r3, lr
        bne     LADK75
        ldr     r12, [sp, #4]
        orrs    r12, r12, r9
        beq     LADK77
LADK75:
        cmp     r11, #0x5B
        beq     LADK460
LADK76:
        cmp     r2, #0
        beq     LADK79
        ldr     r2, [sp, #4]
        orrs    r2, r2, r9
        beq     LADK77
        cmp     r11, #0x5B
        ble     LADK78
LADK77:
        umull   r12, r2, lr, r8
        str     r2, [sp, #0x10]
        add     r11, r11, #0x1C
        str     r12, [sp, #0x30]
        umull   lr, r12, r9, lr
        umull   r9, r2, r9, r3
        str     r2, [sp, #0x34]
        umull   r8, r2, r3, r8
        ldr     r3, [sp, #0x30]
        ldr     lr, [sp, #0x34]
        str     r9, [sp, #4]
        adds    r12, r3, r12
        ldr     r3, [sp, #0x10]
        adc     r3, r3, #0
        adds    r8, r8, lr
        ldr     lr, [sp, #4]
        adc     r2, r2, #0
        adds    r12, lr, r12
        adc     r3, r3, #0
        adds    r8, r3, r8
        mov     lr, r12, lsr #31
        mov     r12, r12, lsr #30
        adc     r2, r2, #0
        mov     r3, r8, lsr #31
        orr     r8, lr, r8, lsl #1
        and     r12, r12, #1
        orr     r2, r3, r2, lsl #1
        adds    r0, r8, r12
        adc     r1, r2, #0
        b       LADK80
LADK78:
        cmp     r11, #0x5B
        beq     LADK199
LADK79:
        umull   r2, r12, r9, r3
        str     r12, [sp, #0x34]
        umull   r9, r12, r9, lr
        umull   lr, r0, lr, r8
        umull   r8, r3, r3, r8
        adds    r12, r2, r12
        ldr     r2, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r0, [sp, #0x10]
        ldr     lr, [sp, #0x10]
        adc     r2, r2, #0
        add     r11, r11, #0x1C
        adds    r8, r8, lr
        ldr     lr, [sp, #0x30]
        adc     r3, r3, #0
        adds    r12, lr, r12
        adc     r2, r2, #0
        adds    r8, r2, r8
        adc     r2, r3, #0
        mov     lr, r12, lsr #31
        mov     r12, r12, lsr #30
        mov     r3, r8, lsr #31
        orr     r8, lr, r8, lsl #1
        and     r12, r12, #1
        orr     r2, r3, r2, lsl #1
        adds    r0, r8, r12
        adc     r1, r2, #0
LADK80:
        tst     r1, #1, 2
        bne     LADK81
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r8, r2, #0x1F
        clzne   r2, r1
        subne   r8, r2, #1
        mov     r3, r8, asr #31
        mov     r2, r8
        bl      __ashldi3
        add     r11, r11, r8
LADK81:
        ldr     r2, [sp, #8]
        orrs    r2, r10, r2
        bne     LADK82
        orrs    r3, r5, r6
        beq     LADK84
LADK82:
        cmp     r4, r7
        bne     LADK83
        cmp     r10, r5
        bne     LADK83
        ldr     r3, [sp, #8]
        cmp     r3, r6
        beq     LADK84
LADK83:
        cmp     r2, #0
        beq     LADK90
        orrs    r2, r5, r6
        beq     LADK84
        cmp     r4, r7
        blt     LADK84
        cmp     r4, r7
        bne     LADK90
        cmp     r10, r5
        bhi     LADK84
        cmp     r10, r5
        bne     LADK90
        ldr     r2, [sp, #8]
        cmp     r2, r6
        bls     LADK90
LADK84:
        sub     r7, r7, r4
        cmp     r7, #0x20
        bcs     LADK85
        rsb     r2, r7, #0x20
        mov     r2, r5, lsl r2
        orr     r6, r2, r6, lsr r7
        mov     r7, r5, asr r7
        b       LADK86
LADK85:
        cmp     r7, #0x40
        movcs   r7, #0x1F
        subcc   r7, r7, #0x20
        mov     r6, r5, asr r7
        mov     r7, r5, asr #31
LADK86:
        ldr     r2, [sp, #8]
        subs    r2, r2, r6
        sbc     r10, r10, r7
        tst     r10, #1, 2
        bne     LADK89
        cmp     r10, #0
        bne     LADK87
        cmp     r2, #0
        moveq   r3, #0
        beq     LADK88
        clz     r3, r2
        mov     r2, r2, lsl r3
        add     r3, r3, #0x1F
        mov     r10, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADK88
LADK87:
        clz     r3, r10
        sub     r3, r3, #1
        rsb     r12, r3, #0x20
        mov     r12, r2, lsr r12
        orr     r10, r12, r10, lsl r3
        mov     r2, r2, lsl r3
LADK88:
        add     r4, r4, r3
LADK89:
        rsbs    r6, r2, #0
        rsc     r5, r10, #0
        b       LADK95
LADK90:
        sub     r4, r4, r7
        cmp     r4, #0x20
        bcs     LADK91
        ldr     r3, [sp, #8]
        rsb     r2, r4, #0x20
        mov     r2, r10, lsl r2
        orr     r2, r2, r3, lsr r4
        mov     r4, r10, asr r4
        b       LADK92
LADK91:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r2, r10, asr r4
        mov     r4, r10, asr #31
LADK92:
        subs    r6, r6, r2
        sbc     r5, r5, r4
        tst     r5, #1, 2
        mov     r4, r7
        bne     LADK95
        cmp     r5, #0
        bne     LADK93
        cmp     r6, #0
        moveq   r2, #0
        beq     LADK94
        clz     r2, r6
        mov     r6, r6, lsl r2
        add     r2, r2, #0x1F
        mov     r5, r6, lsr #1
        mov     r6, r6, lsl #31
        b       LADK94
LADK93:
        clz     r2, r5
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r6, lsr r3
        orr     r5, r3, r5, lsl r2
        mov     r6, r6, lsl r2
LADK94:
        add     r4, r7, r2
LADK95:
        cmp     r5, #0
        blt     LADK434
        cmp     r1, #0
        blt     LADK425
        orrs    r2, r1, r0
        bne     LADK96
        orrs    r3, r5, r6
        beq     LADK98
LADK96:
        cmp     r11, r4
        bne     LADK97
        cmp     r1, r5
        bne     LADK97
        cmp     r0, r6
        beq     LADK98
LADK97:
        cmp     r2, #0
        beq     LADK104
        orrs    r2, r5, r6
        beq     LADK98
        cmp     r11, r4
        blt     LADK98
        cmp     r11, r4
        bne     LADK104
        cmp     r1, r5
        bhi     LADK98
        cmp     r1, r5
        bne     LADK104
        cmp     r0, r6
        bls     LADK104
LADK98:
        sub     r4, r4, r11
        cmp     r4, #0x20
        bcs     LADK99
        rsb     r2, r4, #0x20
        mov     r2, r5, lsl r2
        orr     r6, r2, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK100
LADK99:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK100:
        subs    r0, r0, r6
        sbc     r1, r1, r4
        tst     r1, #1, 2
        mov     r4, r11
        bne     LADK103
        cmp     r1, #0
        bne     LADK101
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK102
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK102
LADK101:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK102:
        add     r4, r11, r2
LADK103:
        rsbs    r6, r0, #0
        rsc     r5, r1, #0
        b       LADK109
LADK104:
        sub     r11, r11, r4
        cmp     r11, #0x20
        bcs     LADK105
        rsb     r2, r11, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK106
        .long   0x4120ddfc
        .long   LADK_s_qw4000000000000000
        .long   LADK_qwXB_M
        .long   LADK_qwXB_SC
        .long   LADK_THE_128_LN2_DIV_M
        .long   LADK_THE_LN2_DIV_128_HI_M
        .long   LADK_THE_LN2_DIV_128_LO_M
        .long   LADK_qwE_M
        .long   LADK_qwE_SC
        .long   LADK_qwE_M
        .long   LADK_qwE_SC
        .long   LADK_qwT_M
        .long   LADK_qwP_M
        .long   LADK_qwP_SC
        .long   LADK_s_qw0000000080000000
LADK105:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK106:
        subs    r6, r6, r0
        sbc     r5, r5, r11
        tst     r5, #1, 2
        bne     LADK109
        cmp     r5, #0
        bne     LADK107
        cmp     r6, #0
        moveq   r0, #0
        beq     LADK108
        clz     r0, r6
        mov     r6, r6, lsl r0
        add     r0, r0, #0x1F
        mov     r5, r6, lsr #1
        mov     r6, r6, lsl #31
        b       LADK108
LADK107:
        clz     r0, r5
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r6, lsr r1
        orr     r5, r1, r5, lsl r0
        mov     r6, r6, lsl r0
LADK108:
        add     r4, r4, r0
LADK109:
        cmp     r5, #0
        blt     LADK399
        ldr     r0, [sp]
        cmp     r0, #0
        blt     LADK385
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp]
        orrs    r0, r1, r0
        bne     LADK110
        orrs    r1, r5, r6
        beq     LADK112
LADK110:
        ldr     r1, [sp, #0xC]
        cmp     r1, r4
        bne     LADK111
        ldr     r1, [sp]
        cmp     r1, r5
        bne     LADK111
        ldr     r1, [sp, #0x14]
        cmp     r1, r6
        beq     LADK112
LADK111:
        cmp     r0, #0
        beq     LADK115
        orrs    r0, r5, r6
        beq     LADK112
        ldr     r0, [sp, #0xC]
        cmp     r0, r4
        blt     LADK112
        ldr     r0, [sp, #0xC]
        cmp     r0, r4
        bne     LADK115
        ldr     r0, [sp]
        cmp     r0, r5
        bhi     LADK112
        ldr     r0, [sp]
        cmp     r0, r5
        bne     LADK115
        ldr     r0, [sp, #0x14]
        cmp     r0, r6
        bls     LADK115
LADK112:
        ldr     r0, [sp, #0xC]
        sub     r4, r4, r0
        cmp     r4, #0x20
        bcs     LADK113
        rsb     r0, r4, #0x20
        mov     r0, r5, lsl r0
        orr     r6, r0, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK114
LADK113:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK114:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp]
        adds    r0, r0, r6
        adc     r1, r1, r4
        ldr     r4, [sp, #0xC]
        tst     r1, r1
        bpl     LADK118
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        ldr     r2, [sp, #0xC]
        mov     r1, r1, lsr #1
        sub     r4, r2, #1
        b       LADK118
LADK115:
        ldr     r0, [sp, #0xC]
        sub     r0, r0, r4
        cmp     r0, #0x20
        bcs     LADK116
        ldr     r1, [sp]
        ldr     r3, [sp, #0x14]
        rsb     r2, r0, #0x20
        mov     r2, r1, lsl r2
        mov     r1, r1, asr r0
        orr     r2, r2, r3, lsr r0
        b       LADK117
LADK116:
        cmp     r0, #0x40
        movcs   r1, #0x1F
        subcc   r1, r0, #0x20
        ldr     r0, [sp]
        mov     r2, r0, asr r1
        mov     r1, r0, asr #31
LADK117:
        adds    r0, r6, r2
        adc     r1, r5, r1
        tst     r1, r1
        bpl     LADK118
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r4, r4, #1
LADK118:
        cmp     r1, #0
        blt     LADK384
        tst     r1, #1, 2
        bne     LADK119
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r4, r4, r2
        bl      __ashldi3
LADK119:
        rsbs    r0, r0, #0
        rsc     r8, r1, #0
LADK120:
        ldr     r2, [pc, #-0x238]
        ldr     r12, [pc, #-0x238]
        ldr     r6, [pc, #-0x238]
        ldr     r3, [r2, #0x30]
        ldr     r2, [r2, #0x34]
        ldr     r7, [r12, #0x18]
        ldr     r5, [pc, #-0x244]
        cmp     r8, #0
        blt     LADK342
        mov     r10, #6
        orr     r9, r8, r0
        str     r0, [sp]
LADK121:
        cmp     r9, #0
        bne     LADK122
        orrs    r0, r2, r3
        beq     LADK124
LADK122:
        cmp     r4, r7
        bne     LADK123
        cmp     r8, r2
        bne     LADK123
        ldr     r0, [sp]
        cmp     r0, r3
        beq     LADK124
LADK123:
        cmp     r9, #0
        beq     LADK125
        orrs    r0, r2, r3
        beq     LADK124
        cmp     r4, r7
        blt     LADK124
        cmp     r4, r7
        bne     LADK125
        cmp     r8, r2
        bhi     LADK124
        cmp     r8, r2
        bne     LADK125
        ldr     r0, [sp]
        cmp     r0, r3
        bls     LADK125
LADK124:
        ldr     r0, [sp]
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        umull   r12, lr, r0, r2
        umull   r11, r0, r3, r0
        umull   r3, r11, r3, r8
        umull   r2, r1, r8, r2
        adds    r12, r0, r12
        adc     lr, lr, #0
        adds    r11, r2, r11
        adc     r1, r1, #0
        adds    r12, r3, r12
        adc     lr, lr, #0
        adds    r11, lr, r11
        adc     r1, r1, #0
        mov     r2, r12, lsr #31
        mov     r0, r11, lsr #31
        mov     r12, r12, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r11, r2, r11, lsl #1
        and     r12, r12, #1
        adds    r0, r11, r12
        adc     r1, r1, #0
        b       LADK126
LADK125:
        umull   r12, r0, r3, r8
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        str     r12, [sp, #0x34]
        ldr     r12, [sp]
        ldr     r1, [sp, #0x34]
        umull   r3, lr, r3, r12
        umull   r3, r12, r12, r2
        umull   r2, r11, r8, r2
        adds    lr, r1, lr
        adc     r0, r0, #0
        adds    r12, r2, r12
        adc     r11, r11, #0
        adds    lr, r3, lr
        adc     r0, r0, #0
        adds    r12, r0, r12
        mov     r2, lr, lsr #31
        adc     r11, r11, #0
        mov     r0, r12, lsr #31
        mov     lr, lr, lsr #30
        orr     r11, r0, r11, lsl #1
        orr     r12, r2, r12, lsl #1
        and     lr, lr, #1
        adds    r0, r12, lr
        adc     r1, r11, #0
LADK126:
        tst     r1, #1, 2
        bne     LADK127
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r11, r2, #0x1F
        clzne   r2, r1
        subne   r11, r2, #1
        mov     r3, r11, asr #31
        mov     r2, r11
        bl      __ashldi3
        add     r7, r7, r11
LADK127:
        ldr     r3, [r6, #-8]
        ldr     r2, [r6, #-4]
        orrs    lr, r2, r3
        bne     LADK128
        orrs    r12, r1, r0
        ldreq   r12, [r5, #-4]
        beq     LADK130
LADK128:
        ldr     r12, [r5, #-4]
        cmp     r12, r7
        bne     LADK129
        cmp     r2, r1
        bne     LADK129
        cmp     r3, r0
        beq     LADK130
LADK129:
        cmp     lr, #0
        beq     LADK133
        orrs    lr, r1, r0
        beq     LADK130
        cmp     r12, r7
        blt     LADK130
        cmp     r12, r7
        bne     LADK133
        cmp     r2, r1
        bhi     LADK130
        cmp     r2, r1
        bne     LADK133
        cmp     r3, r0
        bls     LADK133
LADK130:
        sub     r7, r7, r12
        cmp     r7, #0x20
        bcs     LADK131
        rsb     lr, r7, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r7
        mov     r7, r1, asr r7
        b       LADK132
LADK131:
        cmp     r7, #0x40
        movcs   r7, #0x1F
        subcc   r7, r7, #0x20
        mov     r0, r1, asr r7
        mov     r7, r1, asr #31
LADK132:
        adds    r3, r3, r0
        adc     r2, r2, r7
        tst     r2, r2
        mov     r7, r12
        bpl     LADK136
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r7, r12, #1
        b       LADK136
LADK133:
        sub     r12, r12, r7
        cmp     r12, #0x20
        bcs     LADK134
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADK135
LADK134:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADK135:
        adds    r3, r0, r3
        adc     r2, r1, r12
        tst     r2, r2
        bpl     LADK136
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r7, r7, #1
LADK136:
        sub     r10, r10, #1
        cmp     r10, #0
        sub     r5, r5, #4
        sub     r6, r6, #8
        bgt     LADK121
LADK137:
        ldr     r1, [sp, #0x18]
        ldr     r12, [pc, #-0x4E8]
        add     r0, r12, r1, lsl #3
        ldr     r0, [r0, #4]
        ldr     r1, [r12, +r1, lsl #3]
        orrs    r12, r0, r1
        bne     LADK138
        orrs    lr, r2, r3
        beq     LADK140
LADK138:
        cmp     r7, #0x3E
        beq     LADK341
LADK139:
        cmp     r12, #0
        beq     LADK142
        orrs    r12, r2, r3
        beq     LADK140
        cmp     r7, #0x3E
        ble     LADK141
LADK140:
        umull   lr, r12, r3, r1
        umull   r4, lr, r1, r2
        umull   r3, r1, r3, r0
        umull   r2, r0, r0, r2
        sub     r7, r7, #1
        adds    r12, r4, r12
        adc     lr, lr, #0
        adds    r1, r2, r1
        adc     r0, r0, #0
        adds    r12, r3, r12
        adc     lr, lr, #0
        adds    r2, lr, r1
        adc     r1, r0, #0
        mov     r0, r12, lsr #31
        orr     r0, r0, r2, lsl #1
        mov     r12, r12, lsr #30
        mov     r2, r2, lsr #31
        and     r12, r12, #1
        orr     r1, r2, r1, lsl #1
        adds    r0, r0, r12
        adc     r1, r1, #0
        b       LADK143
LADK141:
        cmp     r7, #0x3E
        beq     LADK200
LADK142:
        umull   lr, r12, r3, r1
        umull   r4, lr, r3, r0
        umull   r1, r3, r2, r1
        umull   r2, r0, r0, r2
        sub     r7, r7, #1
        adds    r12, r4, r12
        adc     lr, lr, #0
        adds    r3, r2, r3
        adc     r0, r0, #0
        adds    r12, r1, r12
        adc     lr, lr, #0
        adds    r3, lr, r3
        adc     r1, r0, #0
        mov     r0, r12, lsr #31
        orr     r0, r0, r3, lsl #1
        mov     r12, r12, lsr #30
        mov     r3, r3, lsr #31
        and     r12, r12, #1
        orr     r1, r3, r1, lsl #1
        adds    r0, r0, r12
        adc     r1, r1, #0
LADK143:
        tst     r1, #1, 2
        bne     LADK144
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r7, r7, r2
        bl      __ashldi3
LADK144:
        ldr     r3, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r12, [pc, #-0x608]
        ldr     r2, [pc, #-0x608]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        ldr     r8, [sp, #0x24]
        add     r3, r7, r3, lsr #7
        add     lr, r12, r4, lsl #7
        ldr     r12, [lr, #0x78]
        add     r7, r2, r4, lsl #6
        ldr     r2, [lr, #0x7C]
        ldr     r11, [r7, #0x3C]
        mov     r6, #0xE
        add     r4, lr, #0x70
        add     r5, r7, #0x38
        str     r7, [sp, #8]
        str     lr, [sp]
        str     r3, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
LADK145:
        cmp     r2, #0
        blt     LADK324
        cmp     r10, #0
        blt     LADK315
        orrs    r7, r10, r9
        bne     LADK146
        orrs    r0, r2, r12
        beq     LADK148
LADK146:
        cmp     r8, r11
        bne     LADK147
        cmp     r10, r2
        bne     LADK147
        cmp     r9, r12
        beq     LADK148
LADK147:
        cmp     r7, #0
        beq     LADK149
        orrs    r0, r2, r12
        beq     LADK148
        cmp     r8, r11
        blt     LADK148
        cmp     r8, r11
        bne     LADK149
        cmp     r10, r2
        bhi     LADK148
        cmp     r10, r2
        bne     LADK149
        cmp     r9, r12
        bls     LADK149
LADK148:
        umull   lr, r0, r12, r9
        umull   r1, r3, r9, r2
        umull   lr, r12, r12, r10
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        adds    r1, r0, r1
        str     lr, [sp, #0x34]
        umull   lr, r2, r10, r2
        adc     r3, r3, #0
        str     lr, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        adds    r12, r0, r12
        ldr     r0, [sp, #0x34]
        adc     r2, r2, #0
        adds    r1, r0, r1
        adc     r3, r3, #0
        adds    r12, r3, r12
        mov     r3, r1, lsr #31
        adc     r2, r2, #0
        mov     r0, r12, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r2, r0, r2, lsl #1
        orr     r12, r3, r12, lsl #1
        adds    r0, r12, r1
        adc     r1, r2, #0
        b       LADK150
LADK149:
        umull   r0, r1, r12, r10
        umull   r12, r3, r12, r9
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r0, [sp, #0x34]
        umull   r12, r0, r9, r2
        ldr     lr, [sp, #0x34]
        str     r12, [sp, #0x30]
        umull   r2, r12, r10, r2
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r0, r2, r0
        ldr     r2, [sp, #0x30]
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
LADK150:
        tst     r1, #1, 2
        bne     LADK153
        cmp     r1, #0
        beq     LADK151
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x1C]
        b       LADK152
LADK151:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x1C]
LADK152:
        ldr     r2, [sp, #0x1C]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x1C]
        add     r11, r11, r2
LADK153:
        cmp     r1, #0
        blt     LADK289
        ldr     r2, [sp]
        add     r2, r2, r6, lsl #3
        str     r2, [sp, #0x20]
        ldr     r2, [r2, #4]
        ldr     r12, [r4]
        cmp     r2, #0
        blt     LADK280
        orrs    r3, r2, r12
        str     r3, [sp, #0x18]
        bne     LADK154
        orrs    r3, r1, r0
        bne     LADK154
        ldr     lr, [sp, #8]
        ldr     r3, [r5]
        add     lr, lr, r6, lsl #2
        str     lr, [sp, #0x1C]
        b       LADK156
LADK154:
        ldr     lr, [sp, #8]
        ldr     r3, [r5]
        add     lr, lr, r6, lsl #2
        str     lr, [sp, #0x1C]
        cmp     r3, r11
        bne     LADK155
        cmp     r2, r1
        bne     LADK155
        cmp     r12, r0
        beq     LADK156
LADK155:
        ldr     lr, [sp, #0x18]
        cmp     lr, #0
        beq     LADK162
        orrs    lr, r1, r0
        beq     LADK156
        cmp     r3, r11
        blt     LADK156
        cmp     r3, r11
        bne     LADK162
        cmp     r2, r1
        bhi     LADK156
        cmp     r2, r1
        bne     LADK162
        cmp     r12, r0
        bls     LADK162
LADK156:
        sub     r11, r11, r3
        cmp     r11, #0x20
        str     r11, [sp, #0x18]
        bcs     LADK157
        ldr     lr, [sp, #0x18]
        rsb     r11, lr, #0x20
        mov     r11, r1, lsl r11
        orr     r0, r11, r0, lsr lr
        mov     lr, r1, asr lr
        b       LADK158
LADK157:
        ldr     r0, [sp, #0x18]
        cmp     r0, #0x40
        movcs   r0, #0x1F
        ldrcc   r0, [sp, #0x18]
        subcc   r0, r0, #0x20
        mov     r0, r1, asr r0
        mov     lr, r1, asr #31
LADK158:
        subs    r12, r12, r0
        sbc     r2, r2, lr
        tst     r2, #1, 2
        mov     r11, r3
        bne     LADK161
        cmp     r2, #0
        bne     LADK159
        cmp     r12, #0
        moveq   r0, #0
        beq     LADK160
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LADK160
LADK159:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r12, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r12, r12, lsl r0
LADK160:
        add     r11, r3, r0
LADK161:
        rsbs    r0, r12, #0
        rsc     r1, r2, #0
        b       LADK167
LADK162:
        sub     r3, r3, r11
        cmp     r3, #0x20
        str     r3, [sp, #0x18]
        bcs     LADK163
        ldr     r3, [sp, #0x18]
        rsb     lr, r3, #0x20
        mov     lr, r2, lsl lr
        orr     r12, lr, r12, lsr r3
        mov     r3, r2, asr r3
        b       LADK164
LADK163:
        ldr     r3, [sp, #0x18]
        cmp     r3, #0x40
        movcs   r3, #0x1F
        ldrcc   r3, [sp, #0x18]
        subcc   r3, r3, #0x20
        mov     r12, r2, asr r3
        mov     r3, r2, asr #31
LADK164:
        subs    r0, r0, r12
        sbc     r1, r1, r3
        tst     r1, #1, 2
        bne     LADK167
        cmp     r1, #0
        bne     LADK165
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK166
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK166
LADK165:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK166:
        add     r11, r11, r2
LADK167:
        cmp     r1, #0
        blt     LADK265
        cmp     r10, #0
        blt     LADK258
        cmp     r7, #0
        bne     LADK168
        orrs    r2, r1, r0
        beq     LADK170
LADK168:
        cmp     r8, r11
        bne     LADK169
        cmp     r10, r1
        bne     LADK169
        cmp     r9, r0
        beq     LADK170
LADK169:
        cmp     r7, #0
        beq     LADK171
        orrs    r2, r1, r0
        beq     LADK170
        cmp     r8, r11
        blt     LADK170
        cmp     r8, r11
        bne     LADK171
        cmp     r10, r1
        bhi     LADK170
        cmp     r10, r1
        bne     LADK171
        cmp     r9, r0
        bls     LADK171
LADK170:
        umull   r12, lr, r0, r9
        umull   r2, r3, r9, r1
        umull   r0, r12, r0, r10
        str     lr, [sp, #0x34]
        ldr     lr, [sp, #0x34]
        str     r12, [sp, #0x30]
        umull   r1, r12, r10, r1
        add     r11, r11, r8
        adds    r2, lr, r2
        ldr     lr, [sp, #0x30]
        adc     r3, r3, #0
        sub     r11, r11, #0x3F
        adds    r1, r1, lr
        adc     r12, r12, #0
        adds    r2, r0, r2
        adc     r3, r3, #0
        adds    r1, r3, r1
        mov     r3, r2, lsr #31
        adc     r12, r12, #0
        mov     r0, r1, lsr #31
        mov     r2, r2, lsr #30
        orr     r1, r3, r1, lsl #1
        orr     r12, r0, r12, lsl #1
        and     r2, r2, #1
        adds    r0, r1, r2
        adc     r1, r12, #0
        b       LADK172
LADK171:
        umull   r12, r2, r0, r10
        umull   r3, r0, r0, r9
        umull   lr, r3, r9, r1
        add     r11, r11, r8
        adds    r0, r12, r0
        str     r3, [sp, #0x34]
        umull   r1, r3, r10, r1
        ldr     r12, [sp, #0x34]
        adc     r2, r2, #0
        str     lr, [sp, #0x30]
        sub     r11, r11, #0x3F
        adds    r1, r1, r12
        ldr     r12, [sp, #0x30]
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
LADK172:
        tst     r1, #1, 2
        bne     LADK173
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r7, r2, #0x1F
        clzne   r2, r1
        subne   r7, r2, #1
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashldi3
        add     r11, r11, r7
LADK173:
        cmp     r1, #0
        blt     LADK232
        ldr     r3, [sp, #0x20]
        ldr     r2, [r3, #-4]
        ldr     r12, [r3, #-8]
        cmp     r2, #0
        blt     LADK218
        orrs    lr, r2, r12
        bne     LADK174
        orrs    r3, r1, r0
        ldreq   r3, [sp, #0x1C]
        ldreq   r3, [r3, #-4]
        beq     LADK176
LADK174:
        ldr     r3, [sp, #0x1C]
        ldr     r3, [r3, #-4]
        cmp     r3, r11
        bne     LADK175
        cmp     r2, r1
        bne     LADK175
        cmp     r12, r0
        beq     LADK176
LADK175:
        cmp     lr, #0
        beq     LADK179
        orrs    lr, r1, r0
        beq     LADK176
        cmp     r3, r11
        blt     LADK176
        cmp     r3, r11
        bne     LADK179
        cmp     r2, r1
        bhi     LADK176
        cmp     r2, r1
        bne     LADK179
        cmp     r12, r0
        bls     LADK179
LADK176:
        sub     r11, r11, r3
        cmp     r11, #0x20
        bcs     LADK177
        rsb     lr, r11, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK178
LADK177:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK178:
        adds    r12, r12, r0
        adc     r2, r2, r11
        tst     r2, r2
        mov     r11, r3
        bpl     LADK182
        mov     r0, r2, lsl #31
        orr     r12, r0, r12, lsr #1
        mov     r2, r2, lsr #1
        sub     r11, r3, #1
        b       LADK182
LADK179:
        sub     r3, r3, r11
        cmp     r3, #0x20
        bcs     LADK180
        rsb     lr, r3, #0x20
        mov     lr, r2, lsl lr
        orr     r12, lr, r12, lsr r3
        mov     r3, r2, asr r3
        b       LADK181
LADK180:
        cmp     r3, #0x40
        movcs   r3, #0x1F
        subcc   r3, r3, #0x20
        mov     r12, r2, asr r3
        mov     r3, r2, asr #31
LADK181:
        adds    r12, r0, r12
        adc     r2, r1, r3
        tst     r2, r2
        bpl     LADK182
        mov     r0, r2, lsl #31
        orr     r12, r0, r12, lsr #1
        mov     r2, r2, lsr #1
        sub     r11, r11, #1
LADK182:
        sub     r6, r6, #2
        cmp     r6, #2
        sub     r4, r4, #0x10
        sub     r5, r5, #8
        bge     LADK145
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        orrs    lr, r1, r0
        bne     LADK183
        orrs    r4, r2, r12
        beq     LADK185
LADK183:
        cmp     r3, r11
        bne     LADK184
        cmp     r1, r2
        bne     LADK184
        cmp     r0, r12
        beq     LADK185
LADK184:
        cmp     lr, #0
        beq     LADK186
        orrs    lr, r2, r12
        beq     LADK185
        cmp     r3, r11
        blt     LADK185
        cmp     r3, r11
        bne     LADK186
        cmp     r1, r2
        bhi     LADK185
        cmp     r1, r2
        bne     LADK186
        cmp     r0, r12
        bls     LADK186
LADK185:
        umull   r4, lr, r0, r12
        umull   r5, r4, r0, r2
        umull   r12, r0, r12, r1
        umull   r2, r1, r2, r1
        add     r11, r3, r11
        adds    lr, r5, lr
        adc     r4, r4, #0
        adds    r0, r2, r0
        adc     r1, r1, #0
        adds    lr, r12, lr
        adc     r4, r4, #0
        adds    r2, r4, r0
        adc     r0, r1, #0
        mov     r1, lr, lsr #31
        orr     r1, r1, r2, lsl #1
        mov     r2, r2, lsr #31
        mov     lr, lr, lsr #30
        orr     r2, r2, r0, lsl #1
        and     lr, lr, #1
        adds    r0, r1, lr
        adc     r1, r2, #0
        sub     r4, r11, #0x3F
        b       LADK187
LADK186:
        umull   r4, lr, r0, r12
        umull   r5, r4, r12, r1
        umull   r0, r12, r0, r2
        umull   r2, r1, r2, r1
        add     r11, r3, r11
        adds    r5, lr, r5
        adc     r4, r4, #0
        adds    r12, r2, r12
        adc     r1, r1, #0
        adds    r5, r0, r5
        adc     r4, r4, #0
        adds    r12, r4, r12
        adc     r0, r1, #0
        mov     r1, r5, lsr #31
        orr     r1, r1, r12, lsl #1
        mov     r12, r12, lsr #31
        mov     r5, r5, lsr #30
        orr     r12, r12, r0, lsl #1
        and     r5, r5, #1
        adds    r0, r1, r5
        adc     r1, r12, #0
        sub     r4, r11, #0x3F
LADK187:
        tst     r1, #1, 2
        bne     LADK188
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r5, r2, #0x1F
        clzne   r2, r1
        subne   r5, r2, #1
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        add     r4, r4, r5
LADK188:
        ldr     r2, [sp, #0x3C]
        cmp     r2, #0
        blt     LADK201
LADK189:
        cmp     r4, #0xBC
        bgt     LADK191
LADK190:
        mov     r0, r1, lsr #7
        rsb     r4, r4, #0x3E
        bic     r0, r0, #0xFE, 10
        mov     r2, r4, lsl #23
        bic     r0, r0, #3, 2
        add     r2, r2, #0xFE, 10
        tst     r1, #0x40
        orr     r0, r0, r2
        addne   r0, r0, #1
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADK191:
        sub     r2, r4, #0xB5
        cmp     r2, #0x20
        bcs     LADK192
        rsb     r4, r4, #0xD5
        mov     r3, r1, lsl r4
        orr     r3, r3, r0, lsr r2
        mov     r12, r1, lsr r2
        b       LADK193
LADK192:
        cmp     r2, #0x40
        movcs   r3, #0
        subcc   r4, r4, #0xD5
        movcc   r3, r1, lsr r4
        mov     r12, #0
LADK193:
        ldr     r1, [pc, #-0xE48]
        add     r0, sp, #0x3C
        add     r2, sp, #0x38
        ldr     r5, [r1]
        ldr     r4, [r1, #4]
        add     r1, sp, #0x3C
        adds    r3, r5, r3
        adc     r12, r4, r12
        str     r12, [sp, #0x38]
        mov     r3, #0xD1
        bl      __libm_error_support
        ldr     r0, [sp, #0x38]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADK194:
        mov     r0, #0xFE, 10
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADK195:
        mov     r2, lr, lsl #31
        orr     r12, r2, r12, lsr #1
        mov     lr, lr, lsr #1
        mov     r8, #0x3D
        b       LADK15
LADK196:
        cmp     r2, r4
        bhi     LADK8
        cmp     r2, r4
        bne     LADK12
        cmp     r3, r7
        bhi     LADK8
        b       LADK12
LADK197:
        cmp     r2, r5
        bhi     LADK46
        cmp     r2, r5
        bne     LADK48
        cmp     r3, r6
        bhi     LADK46
        b       LADK48
LADK198:
        ldr     r12, [sp, #4]
        cmp     r3, r12
        bhi     LADK68
        ldr     r12, [sp, #4]
        cmp     r3, r12
        bne     LADK70
        cmp     r2, r9
        bhi     LADK68
        b       LADK70
LADK199:
        ldr     r2, [sp, #4]
        cmp     r3, r2
        bhi     LADK77
        ldr     r2, [sp, #4]
        cmp     r3, r2
        bne     LADK79
        cmp     lr, r9
        bhi     LADK77
        b       LADK79
LADK200:
        cmp     r0, r2
        bhi     LADK140
        cmp     r0, r2
        bne     LADK142
        cmp     r1, r3
        bhi     LADK140
        b       LADK142
LADK201:
        ldr     r2, [pc, #-0xF70]
        orrs    r12, r1, r0
        ldrne   r3, [r2]
        ldrne   r2, [r2, #4]
        bne     LADK202
        ldr     r3, [r2]
        ldr     r2, [r2, #4]
        orrs    lr, r2, r3
        beq     LADK204
LADK202:
        cmp     r4, #0x3D
        beq     LADK217
LADK203:
        cmp     r12, #0
        beq     LADK211
        orrs    r12, r2, r3
        beq     LADK204
        cmp     r4, #0x3D
        bge     LADK210
LADK204:
        rsb     r12, r4, #0x3D
        cmp     r12, #0x20
        bcs     LADK205
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADK206
LADK205:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADK206:
        subs    r0, r0, r3
        sbc     r1, r1, r12
        tst     r1, #1, 2
        bne     LADK209
        cmp     r1, #0
        bne     LADK207
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK208
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK208
LADK207:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK208:
        add     r4, r4, r2
LADK209:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK189
LADK210:
        cmp     r4, #0x3D
        beq     LADK215
LADK211:
        sub     r12, r4, #0x3D
        cmp     r12, #0x20
        bcs     LADK212
        rsb     r4, r4, #0x5D
        mov     lr, r1, lsl r4
        orr     r0, lr, r0, lsr r12
        mov     r12, r1, asr r12
        b       LADK213
LADK212:
        cmp     r12, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x5D
        mov     r0, r1, asr r4
        mov     r12, r1, asr #31
LADK213:
        subs    r0, r3, r0
        sbc     r1, r2, r12
        tst     r1, #1, 2
        mov     r4, #0x3D
        bne     LADK190
        cmp     r1, #0
        bne     LADK216
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK214
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
LADK214:
        add     r4, r2, #0x3D
        b       LADK189
LADK215:
        cmp     r1, r2
        bhi     LADK204
        cmp     r1, r2
        bne     LADK211
        cmp     r0, r3
        bhi     LADK204
        b       LADK211
LADK216:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
        b       LADK214
LADK217:
        cmp     r1, r2
        bne     LADK203
        cmp     r0, r3
        beq     LADK204
        b       LADK203
LADK218:
        rsbs    r3, r12, #0
        ldr     r12, [sp, #0x20]
        rsc     r2, r2, #0
        orrs    lr, r2, r3
        str     r3, [r12, #-8]
        str     r2, [r12, #-4]
        bne     LADK219
        orrs    r12, r1, r0
        ldreq   r12, [sp, #0x1C]
        ldreq   r12, [r12, #-4]
        beq     LADK221
LADK219:
        ldr     r12, [sp, #0x1C]
        ldr     r12, [r12, #-4]
        cmp     r12, r11
        bne     LADK220
        cmp     r2, r1
        bne     LADK220
        cmp     r3, r0
        beq     LADK221
LADK220:
        cmp     lr, #0
        beq     LADK227
        orrs    lr, r1, r0
        beq     LADK221
        cmp     r12, r11
        blt     LADK221
        cmp     r12, r11
        bne     LADK227
        cmp     r2, r1
        bhi     LADK221
        cmp     r2, r1
        bne     LADK227
        cmp     r3, r0
        bls     LADK227
LADK221:
        sub     r11, r11, r12
        cmp     r11, #0x20
        bcs     LADK222
        rsb     lr, r11, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK223
LADK222:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK223:
        subs    r3, r3, r0
        sbc     r2, r2, r11
        tst     r2, #1, 2
        mov     r11, r12
        bne     LADK226
        cmp     r2, #0
        bne     LADK224
        cmp     r3, #0
        moveq   r0, #0
        beq     LADK225
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADK225
LADK224:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r3, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r3, r3, lsl r0
LADK225:
        add     r11, r12, r0
LADK226:
        rsbs    r12, r3, #0
        rsc     r2, r2, #0
        b       LADK182
LADK227:
        sub     r12, r12, r11
        cmp     r12, #0x20
        bcs     LADK228
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r2, r2, asr r12
        b       LADK229
LADK228:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r2, r2, asr #31
LADK229:
        subs    r12, r0, r3
        sbc     r2, r1, r2
        tst     r2, #1, 2
        bne     LADK182
        cmp     r2, #0
        bne     LADK230
        cmp     r12, #0
        moveq   r0, #0
        beq     LADK231
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LADK231
LADK230:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r12, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r12, r12, lsl r0
LADK231:
        add     r11, r11, r0
        b       LADK182
LADK232:
        ldr     r3, [sp, #0x20]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        ldr     r2, [r3, #-4]
        ldr     r3, [r3, #-8]
        cmp     r2, #0
        blt     LADK246
        orrs    r12, r1, r0
        bne     LADK233
        orrs    lr, r2, r3
        ldreq   r12, [sp, #0x1C]
        ldreq   lr, [r12, #-4]
        beq     LADK235
LADK233:
        ldr     lr, [sp, #0x1C]
        ldr     lr, [lr, #-4]
        cmp     r11, lr
        bne     LADK234
        cmp     r1, r2
        bne     LADK234
        cmp     r0, r3
        beq     LADK235
LADK234:
        cmp     r12, #0
        beq     LADK241
        orrs    r12, r2, r3
        beq     LADK235
        cmp     r11, lr
        blt     LADK235
        cmp     r11, lr
        bne     LADK241
        cmp     r1, r2
        bhi     LADK235
        cmp     r1, r2
        bne     LADK241
        cmp     r0, r3
        bls     LADK241
LADK235:
        sub     lr, lr, r11
        cmp     lr, #0x20
        bcs     LADK236
        rsb     r12, lr, #0x20
        mov     r12, r2, lsl r12
        orr     r3, r12, r3, lsr lr
        mov     lr, r2, asr lr
        b       LADK237
LADK236:
        cmp     lr, #0x40
        movcs   lr, #0x1F
        subcc   lr, lr, #0x20
        mov     r3, r2, asr lr
        mov     lr, r2, asr #31
LADK237:
        subs    r0, r0, r3
        sbc     r1, r1, lr
        tst     r1, #1, 2
        bne     LADK240
        cmp     r1, #0
        bne     LADK238
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK239
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK239
LADK238:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK239:
        add     r11, r11, r2
LADK240:
        rsbs    r12, r0, #0
        rsc     r2, r1, #0
        b       LADK182
LADK241:
        sub     r11, r11, lr
        cmp     r11, #0x20
        bcs     LADK242
        rsb     r12, r11, #0x20
        mov     r12, r1, lsl r12
        orr     r0, r12, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK243
LADK242:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK243:
        subs    r12, r3, r0
        sbc     r2, r2, r11
        tst     r2, #1, 2
        mov     r11, lr
        bne     LADK182
        cmp     r2, #0
        bne     LADK244
        cmp     r12, #0
        moveq   r0, #0
        beq     LADK245
        clz     r0, r12
        mov     r12, r12, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r12, lsr #1
        mov     r12, r12, lsl #31
        b       LADK245
LADK244:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r12, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r12, r12, lsl r0
LADK245:
        add     r11, lr, r0
        b       LADK182
LADK246:
        ldr     r12, [sp, #0x20]
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        orrs    lr, r2, r3
        str     r3, [r12, #-8]
        str     r2, [r12, #-4]
        bne     LADK247
        orrs    r12, r1, r0
        ldreq   r12, [sp, #0x1C]
        ldreq   r12, [r12, #-4]
        beq     LADK249
LADK247:
        ldr     r12, [sp, #0x1C]
        ldr     r12, [r12, #-4]
        cmp     r12, r11
        bne     LADK248
        cmp     r2, r1
        bne     LADK248
        cmp     r3, r0
        beq     LADK249
LADK248:
        cmp     lr, #0
        beq     LADK252
        orrs    lr, r1, r0
        beq     LADK249
        cmp     r12, r11
        blt     LADK249
        cmp     r12, r11
        bne     LADK252
        cmp     r2, r1
        bhi     LADK249
        cmp     r2, r1
        bne     LADK252
        cmp     r3, r0
        bls     LADK252
LADK249:
        sub     r11, r11, r12
        cmp     r11, #0x20
        bcs     LADK250
        rsb     lr, r11, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK251
LADK250:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK251:
        adds    r3, r3, r0
        adc     r2, r2, r11
        tst     r2, r2
        mov     r11, r12
        bmi     LADK256
        b       LADK255
LADK252:
        sub     r12, r12, r11
        cmp     r12, #0x20
        bcs     LADK253
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADK254
LADK253:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADK254:
        adds    r3, r0, r3
        adc     r2, r1, r12
        tst     r2, r2
        bmi     LADK257
LADK255:
        rsbs    r12, r3, #0
        rsc     r2, r2, #0
        b       LADK182
LADK256:
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r11, r12, #1
        b       LADK255
LADK257:
        mov     r0, r2, lsl #31
        orr     r3, r0, r3, lsr #1
        mov     r2, r2, lsr #1
        sub     r11, r11, #1
        b       LADK255
LADK258:
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
        orrs    r3, r10, r9
        bne     LADK259
        orrs    r2, r1, r0
        beq     LADK261
LADK259:
        cmp     r8, r11
        bne     LADK260
        cmp     r10, r1
        bne     LADK260
        cmp     r9, r0
        beq     LADK261
LADK260:
        cmp     r3, #0
        beq     LADK262
        orrs    r2, r1, r0
        beq     LADK261
        cmp     r8, r11
        blt     LADK261
        cmp     r8, r11
        bne     LADK262
        cmp     r10, r1
        bhi     LADK261
        cmp     r10, r1
        bne     LADK262
        cmp     r9, r0
        bls     LADK262
LADK261:
        umull   r3, r2, r9, r1
        str     r2, [sp, #0x34]
        umull   r2, r12, r0, r9
        umull   r0, r2, r0, r10
        adds    r3, r12, r3
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r2, [sp, #0x18]
        str     r0, [sp, #0x30]
        umull   r2, r1, r10, r1
        ldr     r0, [sp, #0x34]
        ldr     r12, [sp, #0x18]
        adc     r0, r0, #0
        adds    r2, r2, r12
        ldr     r12, [sp, #0x30]
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
        b       LADK263
LADK262:
        umull   r12, r2, r0, r10
        umull   r3, r0, r0, r9
        umull   lr, r3, r9, r1
        add     r11, r11, r8
        adds    r0, r12, r0
        str     r3, [sp, #0x34]
        umull   r1, r3, r10, r1
        ldr     r12, [sp, #0x34]
        adc     r2, r2, #0
        str     lr, [sp, #0x30]
        sub     r11, r11, #0x3F
        adds    r1, r1, r12
        ldr     r12, [sp, #0x30]
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
LADK263:
        tst     r1, #1, 2
        bne     LADK264
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r7, r2, #0x1F
        clzne   r2, r1
        subne   r7, r2, #1
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashldi3
        add     r11, r11, r7
LADK264:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK173
LADK265:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        cmp     r10, #0
        blt     LADK272
        cmp     r7, #0
        bne     LADK266
        orrs    r2, r1, r0
        beq     LADK268
LADK266:
        cmp     r8, r11
        bne     LADK267
        cmp     r10, r1
        bne     LADK267
        cmp     r9, r0
        beq     LADK268
LADK267:
        cmp     r7, #0
        beq     LADK269
        orrs    r2, r1, r0
        beq     LADK268
        cmp     r8, r11
        blt     LADK268
        cmp     r8, r11
        bne     LADK269
        cmp     r10, r1
        bhi     LADK268
        cmp     r10, r1
        bne     LADK269
        cmp     r9, r0
        bls     LADK269
LADK268:
        umull   r3, r2, r9, r1
        str     r2, [sp, #0x34]
        umull   r2, r12, r0, r9
        umull   r0, r2, r0, r10
        adds    r3, r12, r3
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r2, [sp, #0x18]
        str     r0, [sp, #0x30]
        umull   r2, r1, r10, r1
        ldr     r0, [sp, #0x34]
        ldr     r12, [sp, #0x18]
        adc     r0, r0, #0
        adds    r2, r2, r12
        ldr     r12, [sp, #0x30]
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
        b       LADK270
LADK269:
        umull   r12, r2, r0, r10
        umull   r0, lr, r0, r9
        umull   r3, r0, r9, r1
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r0, [sp, #0x34]
        str     r3, [sp, #0x30]
        umull   r0, r3, r10, r1
        adds    r1, r12, lr
        ldr     r12, [sp, #0x34]
        adc     r2, r2, #0
        adds    r0, r0, r12
        ldr     r12, [sp, #0x30]
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
LADK270:
        tst     r1, #1, 2
        bne     LADK271
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r7, r2, #0x1F
        clzne   r2, r1
        subne   r7, r2, #1
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashldi3
        add     r11, r11, r7
LADK271:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK173
LADK272:
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
        orrs    r3, r10, r9
        bne     LADK273
        orrs    r2, r1, r0
        beq     LADK275
LADK273:
        cmp     r8, r11
        bne     LADK274
        cmp     r10, r1
        bne     LADK274
        cmp     r9, r0
        beq     LADK275
LADK274:
        cmp     r3, #0
        beq     LADK276
        orrs    r2, r1, r0
        beq     LADK275
        cmp     r8, r11
        blt     LADK275
        cmp     r8, r11
        bne     LADK276
        cmp     r10, r1
        bhi     LADK275
        cmp     r10, r1
        bne     LADK276
        cmp     r9, r0
        bls     LADK276
LADK275:
        umull   r2, r3, r9, r1
        str     r3, [sp, #0x34]
        umull   r12, r3, r0, r9
        umull   r0, r12, r0, r10
        adds    r2, r3, r2
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r0, [sp, #0x18]
        umull   r1, r0, r10, r1
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x34]
        str     r12, [sp, #0x30]
        ldr     r3, [sp, #0x30]
        ldr     r12, [sp, #0x18]
        adc     r0, r0, #0
        adds    r3, r1, r3
        ldr     r1, [sp, #4]
        adc     r1, r1, #0
        adds    r2, r12, r2
        adc     r0, r0, #0
        adds    r3, r0, r3
        adc     r1, r1, #0
        str     r1, [sp, #0x34]
        mov     r1, r2, lsr #31
        mov     r0, r3, lsr #31
        orr     r3, r1, r3, lsl #1
        ldr     r1, [sp, #0x34]
        mov     r2, r2, lsr #30
        and     r2, r2, #1
        orr     r1, r0, r1, lsl #1
        adds    r0, r3, r2
        adc     r1, r1, #0
        b       LADK277
LADK276:
        umull   r2, r3, r0, r10
        str     r3, [sp, #0x34]
        umull   r3, r0, r0, r9
        umull   r12, r3, r9, r1
        adds    r2, r2, r0
        ldr     r0, [sp, #0x34]
        add     r11, r11, r8
        str     r3, [sp, #0x30]
        umull   r1, r3, r10, r1
        str     r3, [sp, #4]
        ldr     r3, [sp, #0x30]
        adc     r0, r0, #0
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0x18]
        adds    r3, r1, r3
        ldr     r1, [sp, #4]
        sub     r11, r11, #0x3F
        adc     r1, r1, #0
        adds    r2, r12, r2
        adc     r0, r0, #0
        adds    r3, r0, r3
        adc     r1, r1, #0
        str     r1, [sp, #0x34]
        mov     r1, r2, lsr #31
        mov     r0, r3, lsr #31
        orr     r3, r1, r3, lsl #1
        ldr     r1, [sp, #0x34]
        mov     r2, r2, lsr #30
        and     r2, r2, #1
        orr     r1, r0, r1, lsl #1
        adds    r0, r3, r2
        adc     r1, r1, #0
LADK277:
        tst     r1, #1, 2
        bne     LADK173
        cmp     r1, #0
        beq     LADK278
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #4]
        b       LADK279
LADK278:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #4]
LADK279:
        ldr     r7, [sp, #4]
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashldi3
        add     r11, r11, r7
        b       LADK173
LADK280:
        rsbs    r12, r12, #0
        rsc     r2, r2, #0
        str     r2, [sp, #0x18]
        orrs    r3, r2, r12
        str     r12, [r4]
        str     r2, [r4, #4]
        bne     LADK281
        orrs    r2, r1, r0
        bne     LADK281
        ldr     r2, [r5]
        str     r2, [sp, #4]
        ldr     r2, [sp, #8]
        add     r2, r2, r6, lsl #2
        str     r2, [sp, #0x1C]
        b       LADK283
LADK281:
        ldr     r2, [r5]
        ldr     lr, [sp, #8]
        cmp     r2, r11
        str     r2, [sp, #4]
        add     lr, lr, r6, lsl #2
        str     lr, [sp, #0x1C]
        bne     LADK282
        ldr     r2, [sp, #0x18]
        cmp     r2, r1
        bne     LADK282
        cmp     r12, r0
        beq     LADK283
LADK282:
        cmp     r3, #0
        beq     LADK286
        orrs    r2, r1, r0
        beq     LADK283
        ldr     r2, [sp, #4]
        cmp     r2, r11
        blt     LADK283
        ldr     r2, [sp, #4]
        cmp     r2, r11
        bne     LADK286
        ldr     r2, [sp, #0x18]
        cmp     r2, r1
        bhi     LADK283
        ldr     r2, [sp, #0x18]
        cmp     r2, r1
        bne     LADK286
        cmp     r12, r0
        bls     LADK286
LADK283:
        ldr     r2, [sp, #4]
        sub     r11, r11, r2
        cmp     r11, #0x20
        bcs     LADK284
        rsb     r2, r11, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK285
LADK284:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK285:
        ldr     r1, [sp, #0x18]
        adds    r0, r12, r0
        adc     r1, r1, r11
        ldr     r11, [sp, #4]
        tst     r1, r1
        bpl     LADK167
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        ldr     r2, [sp, #4]
        mov     r1, r1, lsr #1
        sub     r11, r2, #1
        b       LADK167
LADK286:
        ldr     r2, [sp, #4]
        sub     r2, r2, r11
        cmp     r2, #0x20
        bcs     LADK287
        ldr     r3, [sp, #0x18]
        rsb     lr, r2, #0x20
        mov     lr, r3, lsl lr
        orr     r12, lr, r12, lsr r2
        mov     r2, r3, asr r2
        b       LADK288
LADK287:
        cmp     r2, #0x40
        movcs   r3, #0x1F
        subcc   r3, r2, #0x20
        ldr     r2, [sp, #0x18]
        mov     r12, r2, asr r3
        mov     r2, r2, asr #31
LADK288:
        adds    r0, r0, r12
        adc     r1, r1, r2
        tst     r1, r1
        bpl     LADK167
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r11, r11, #1
        b       LADK167
LADK289:
        ldr     r2, [r4]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        str     r2, [sp, #0x18]
        ldr     r2, [sp]
        orr     r3, r1, r0
        add     r2, r2, r6, lsl #3
        str     r2, [sp, #0x20]
        ldr     r2, [r2, #4]
        cmp     r2, #0
        blt     LADK301
        cmp     r3, #0
        bne     LADK290
        ldr     r12, [sp, #0x18]
        orrs    r12, r2, r12
        bne     LADK290
        ldr     r3, [sp, #8]
        ldr     r12, [r5]
        add     r3, r3, r6, lsl #2
        str     r3, [sp, #0x1C]
        b       LADK292
LADK290:
        ldr     lr, [sp, #8]
        ldr     r12, [r5]
        add     lr, lr, r6, lsl #2
        str     lr, [sp, #0x1C]
        cmp     r11, r12
        bne     LADK291
        cmp     r1, r2
        bne     LADK291
        ldr     lr, [sp, #0x18]
        cmp     r0, lr
        beq     LADK292
LADK291:
        cmp     r3, #0
        beq     LADK295
        ldr     r3, [sp, #0x18]
        orrs    r3, r2, r3
        beq     LADK292
        cmp     r11, r12
        blt     LADK292
        cmp     r11, r12
        bne     LADK295
        cmp     r1, r2
        bhi     LADK292
        cmp     r1, r2
        bne     LADK295
        ldr     r3, [sp, #0x18]
        cmp     r0, r3
        bls     LADK295
LADK292:
        sub     r12, r12, r11
        cmp     r12, #0x20
        bcs     LADK293
        ldr     lr, [sp, #0x18]
        rsb     r3, r12, #0x20
        mov     r3, r2, lsl r3
        orr     r3, r3, lr, lsr r12
        mov     r12, r2, asr r12
        b       LADK294
LADK293:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADK294:
        adds    r0, r0, r3
        adc     r1, r1, r12
        tst     r1, r1
        bmi     LADK299
        b       LADK298
LADK295:
        sub     r11, r11, r12
        cmp     r11, #0x20
        bcs     LADK296
        rsb     r3, r11, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK297
LADK296:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK297:
        ldr     r1, [sp, #0x18]
        adds    r0, r1, r0
        adc     r1, r2, r11
        tst     r1, r1
        mov     r11, r12
        bmi     LADK300
LADK298:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK167
LADK299:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r11, r11, #1
        b       LADK298
LADK300:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r11, r12, #1
        b       LADK298
LADK301:
        ldr     r12, [sp, #0x18]
        rsbs    r12, r12, #0
        str     r12, [sp, #0x18]
        rsc     r2, r2, #0
        cmp     r3, #0
        str     r12, [r4]
        str     r2, [r4, #4]
        bne     LADK302
        ldr     r12, [sp, #0x18]
        orrs    r12, r2, r12
        bne     LADK302
        ldr     r3, [r5]
        str     r3, [sp, #4]
        ldr     r3, [sp, #8]
        add     r3, r3, r6, lsl #2
        str     r3, [sp, #0x1C]
        b       LADK304
LADK302:
        ldr     r12, [r5]
        ldr     lr, [sp, #8]
        cmp     r11, r12
        str     r12, [sp, #4]
        add     lr, lr, r6, lsl #2
        str     lr, [sp, #0x1C]
        bne     LADK303
        cmp     r1, r2
        bne     LADK303
        ldr     r12, [sp, #0x18]
        cmp     r0, r12
        beq     LADK304
LADK303:
        cmp     r3, #0
        beq     LADK310
        ldr     r3, [sp, #0x18]
        orrs    r3, r2, r3
        beq     LADK304
        ldr     r3, [sp, #4]
        cmp     r11, r3
        blt     LADK304
        ldr     r3, [sp, #4]
        cmp     r11, r3
        bne     LADK310
        cmp     r1, r2
        bhi     LADK304
        cmp     r1, r2
        bne     LADK310
        ldr     r3, [sp, #0x18]
        cmp     r0, r3
        bls     LADK310
LADK304:
        ldr     r3, [sp, #4]
        sub     r3, r3, r11
        cmp     r3, #0x20
        bcs     LADK305
        ldr     lr, [sp, #0x18]
        rsb     r12, r3, #0x20
        mov     r12, r2, lsl r12
        orr     r12, r12, lr, lsr r3
        mov     r3, r2, asr r3
        b       LADK306
LADK305:
        cmp     r3, #0x40
        movcs   r3, #0x1F
        subcc   r3, r3, #0x20
        mov     r12, r2, asr r3
        mov     r3, r2, asr #31
LADK306:
        subs    r0, r0, r12
        sbc     r1, r1, r3
        tst     r1, #1, 2
        bne     LADK309
        cmp     r1, #0
        bne     LADK307
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK308
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK308
LADK307:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK308:
        add     r11, r11, r2
LADK309:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK167
LADK310:
        ldr     r3, [sp, #4]
        sub     r11, r11, r3
        cmp     r11, #0x20
        bcs     LADK311
        rsb     r3, r11, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK312
LADK311:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK312:
        ldr     r1, [sp, #0x18]
        subs    r0, r1, r0
        sbc     r1, r2, r11
        ldr     r11, [sp, #4]
        tst     r1, #1, 2
        bne     LADK167
        cmp     r1, #0
        bne     LADK313
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK314
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK314
LADK313:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK314:
        ldr     r3, [sp, #4]
        add     r11, r3, r2
        b       LADK167
LADK315:
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
        orrs    r7, r10, r9
        bne     LADK316
        orrs    r0, r2, r12
        beq     LADK318
LADK316:
        cmp     r8, r11
        bne     LADK317
        cmp     r10, r2
        bne     LADK317
        cmp     r9, r12
        beq     LADK318
LADK317:
        cmp     r7, #0
        beq     LADK319
        orrs    r0, r2, r12
        beq     LADK318
        cmp     r8, r11
        blt     LADK318
        cmp     r8, r11
        bne     LADK319
        cmp     r10, r2
        bhi     LADK318
        cmp     r10, r2
        bne     LADK319
        cmp     r9, r12
        bls     LADK319
LADK318:
        umull   r0, r1, r9, r2
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r0, [sp, #0x34]
        umull   r0, r3, r12, r9
        umull   r12, r0, r12, r10
        ldr     lr, [sp, #0x34]
        str     r12, [sp, #0x30]
        umull   r2, r12, r10, r2
        adds    r3, r3, lr
        adc     r1, r1, #0
        adds    r0, r2, r0
        ldr     r2, [sp, #0x30]
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
        b       LADK320
LADK319:
        umull   r1, r0, r12, r10
        umull   r12, r3, r12, r9
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r1, [sp, #0x34]
        umull   r1, r12, r9, r2
        ldr     lr, [sp, #0x34]
        str     r12, [sp, #0x30]
        umull   r2, r12, r10, r2
        adds    r3, lr, r3
        ldr     lr, [sp, #0x30]
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
LADK320:
        tst     r1, #1, 2
        bne     LADK323
        cmp     r1, #0
        beq     LADK321
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADK322
LADK321:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADK322:
        ldr     r2, [sp, #0x18]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        add     r11, r11, r2
LADK323:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK153
LADK324:
        rsbs    r0, r12, #0
        rsc     r1, r2, #0
        cmp     r10, #0
        blt     LADK333
        orrs    r7, r10, r9
        bne     LADK325
        orrs    r2, r1, r0
        beq     LADK327
LADK325:
        cmp     r8, r11
        bne     LADK326
        cmp     r10, r1
        bne     LADK326
        cmp     r9, r0
        beq     LADK327
LADK326:
        cmp     r7, #0
        beq     LADK328
        orrs    r2, r1, r0
        beq     LADK327
        cmp     r8, r11
        blt     LADK327
        cmp     r8, r11
        bne     LADK328
        cmp     r10, r1
        bhi     LADK327
        cmp     r10, r1
        bne     LADK328
        cmp     r9, r0
        bls     LADK328
LADK327:
        umull   lr, r2, r0, r9
        umull   r3, r12, r9, r1
        umull   r0, lr, r0, r10
        add     r11, r11, r8
        str     lr, [sp, #0x34]
        umull   lr, r1, r10, r1
        adds    r3, r2, r3
        adc     r12, r12, #0
        sub     r11, r11, #0x3F
        str     lr, [sp, #0x30]
        ldr     r2, [sp, #0x30]
        ldr     lr, [sp, #0x34]
        adds    r2, r2, lr
        adc     r1, r1, #0
        adds    r3, r0, r3
        adc     r12, r12, #0
        adds    r2, r12, r2
        adc     r1, r1, #0
        mov     r12, r3, lsr #31
        mov     r0, r2, lsr #31
        mov     r3, r3, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r2, r12, r2, lsl #1
        and     r3, r3, #1
        adds    r0, r2, r3
        adc     r1, r1, #0
        b       LADK329
LADK328:
        umull   r3, r2, r0, r10
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r3, [sp, #0x34]
        umull   r0, r3, r0, r9
        umull   r0, r12, r9, r1
        ldr     lr, [sp, #0x34]
        str     r12, [sp, #0x30]
        umull   r1, r12, r10, r1
        adds    r3, lr, r3
        ldr     lr, [sp, #0x30]
        adc     r2, r2, #0
        adds    r1, r1, lr
        adc     r12, r12, #0
        adds    r3, r0, r3
        adc     r2, r2, #0
        adds    r1, r2, r1
        mov     r2, r3, lsr #31
        adc     r12, r12, #0
        mov     r0, r1, lsr #31
        mov     r3, r3, lsr #30
        orr     r1, r2, r1, lsl #1
        orr     r12, r0, r12, lsl #1
        and     r3, r3, #1
        adds    r0, r1, r3
        adc     r1, r12, #0
LADK329:
        tst     r1, #1, 2
        bne     LADK332
        cmp     r1, #0
        beq     LADK330
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #0x18]
        b       LADK331
LADK330:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #0x18]
LADK331:
        ldr     r2, [sp, #0x18]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #0x18]
        add     r11, r11, r2
LADK332:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK153
LADK333:
        rsbs    r9, r9, #0
        rsc     r10, r10, #0
        orrs    r7, r10, r9
        bne     LADK334
        orrs    r2, r1, r0
        beq     LADK336
LADK334:
        cmp     r8, r11
        bne     LADK335
        cmp     r10, r1
        bne     LADK335
        cmp     r9, r0
        beq     LADK336
LADK335:
        cmp     r7, #0
        beq     LADK337
        orrs    r2, r1, r0
        beq     LADK336
        cmp     r8, r11
        blt     LADK336
        cmp     r8, r11
        bne     LADK337
        cmp     r10, r1
        bhi     LADK336
        cmp     r10, r1
        bne     LADK337
        cmp     r9, r0
        bls     LADK337
LADK336:
        umull   r2, r3, r9, r1
        str     r3, [sp, #0x34]
        umull   r12, r3, r0, r9
        umull   r0, r12, r0, r10
        adds    r2, r3, r2
        add     r11, r11, r8
        sub     r11, r11, #0x3F
        str     r0, [sp, #0x20]
        umull   r1, r0, r10, r1
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x34]
        ldr     r3, [sp, #0x20]
        str     r12, [sp, #0x30]
        adc     r0, r0, #0
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x30]
        adds    r1, r1, r0
        ldr     r0, [sp, #0x1C]
        adc     r0, r0, #0
        adds    r2, r3, r2
        ldr     r3, [sp, #0x34]
        mov     r12, r2, lsr #31
        adc     r3, r3, #0
        adds    r1, r3, r1
        mov     r3, r2, lsr #30
        adc     r0, r0, #0
        mov     r2, r1, lsr #31
        orr     r1, r12, r1, lsl #1
        orr     r2, r2, r0, lsl #1
        and     r3, r3, #1
        adds    r0, r1, r3
        adc     r1, r2, #0
        b       LADK338
LADK337:
        umull   r2, r3, r0, r10
        str     r3, [sp, #0x34]
        umull   r3, r0, r0, r9
        umull   r12, r3, r9, r1
        adds    r2, r2, r0
        ldr     r0, [sp, #0x34]
        add     r11, r11, r8
        str     r3, [sp, #0x30]
        umull   r1, r3, r10, r1
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0x30]
        adc     r0, r0, #0
        str     r12, [sp, #0x20]
        ldr     r12, [sp, #0x20]
        adds    r3, r1, r3
        ldr     r1, [sp, #0x1C]
        sub     r11, r11, #0x3F
        adc     r1, r1, #0
        adds    r2, r12, r2
        adc     r0, r0, #0
        adds    r3, r0, r3
        adc     r1, r1, #0
        mov     r12, r2, lsr #31
        mov     r0, r3, lsr #31
        mov     r2, r2, lsr #30
        orr     r1, r0, r1, lsl #1
        orr     r3, r12, r3, lsl #1
        and     r2, r2, #1
        adds    r0, r3, r2
        adc     r1, r1, #0
LADK338:
        tst     r1, #1, 2
        bne     LADK153
        cmp     r1, #0
        beq     LADK339
        clz     r2, r1
        sub     r2, r2, #1
        str     r2, [sp, #4]
        b       LADK340
LADK339:
        clz     r2, r0
        add     r2, r2, #0x1F
        str     r2, [sp, #4]
LADK340:
        ldr     r2, [sp, #4]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r2, [sp, #4]
        add     r11, r11, r2
        b       LADK153
LADK341:
        cmp     r0, r2
        bne     LADK139
        cmp     r1, r3
        beq     LADK140
        b       LADK139
LADK342:
        rsbs    r9, r0, #0
        rsc     r8, r8, #0
        mov     r10, #6
LADK343:
        cmp     r2, #0
        blt     LADK371
        cmp     r8, #0
        blt     LADK364
        orrs    r1, r8, r9
        bne     LADK344
        orrs    r0, r2, r3
        beq     LADK346
LADK344:
        cmp     r4, r7
        bne     LADK345
        cmp     r8, r2
        bne     LADK345
        cmp     r9, r3
        beq     LADK346
LADK345:
        cmp     r1, #0
        beq     LADK347
        orrs    r0, r2, r3
        beq     LADK346
        cmp     r4, r7
        blt     LADK346
        cmp     r4, r7
        bne     LADK347
        cmp     r8, r2
        bhi     LADK346
        cmp     r8, r2
        bne     LADK347
        cmp     r9, r3
        bls     LADK347
LADK346:
        umull   r1, r12, r9, r2
        umull   lr, r0, r3, r9
        umull   r3, lr, r3, r8
        umull   r2, r11, r8, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    lr, r2, lr
        adc     r11, r11, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r2, r1, lsr #31
        adc     r11, r11, #0
        mov     r0, lr, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r11, r0, r11, lsl #1
        orr     lr, r2, lr, lsl #1
        adds    r0, lr, r1
        adc     r1, r11, #0
        b       LADK348
LADK347:
        umull   r0, r1, r3, r8
        umull   r12, r3, r3, r9
        umull   lr, r12, r9, r2
        umull   r2, r11, r8, r2
        adds    r3, r0, r3
        adc     r1, r1, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    r12, r2, r12
        adc     r11, r11, #0
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r12, r1, r12
        mov     r1, r3, lsr #31
        adc     r11, r11, #0
        mov     r0, r12, lsr #31
        mov     r3, r3, lsr #30
        orr     r12, r1, r12, lsl #1
        orr     r11, r0, r11, lsl #1
        and     r3, r3, #1
        adds    r0, r12, r3
        adc     r1, r11, #0
LADK348:
        tst     r1, #1, 2
        bne     LADK349
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r11, r2, #0x1F
        clzne   r2, r1
        subne   r11, r2, #1
        mov     r3, r11, asr #31
        mov     r2, r11
        bl      __ashldi3
        add     r7, r7, r11
LADK349:
        orrs    lr, r1, r0
        ldrne   r3, [r6, #-8]
        ldrne   r2, [r6, #-4]
        bne     LADK350
        ldr     r3, [r6, #-8]
        ldr     r2, [r6, #-4]
        orrs    r12, r2, r3
        ldreq   r12, [r5, #-4]
        beq     LADK352
LADK350:
        ldr     r12, [r5, #-4]
        cmp     r7, r12
        bne     LADK351
        cmp     r1, r2
        bne     LADK351
        cmp     r0, r3
        beq     LADK352
LADK351:
        cmp     lr, #0
        beq     LADK358
        orrs    lr, r2, r3
        beq     LADK352
        cmp     r7, r12
        blt     LADK352
        cmp     r7, r12
        bne     LADK358
        cmp     r1, r2
        bhi     LADK352
        cmp     r1, r2
        bne     LADK358
        cmp     r0, r3
        bls     LADK358
LADK352:
        sub     r12, r12, r7
        cmp     r12, #0x20
        bcs     LADK353
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LADK354
LADK353:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LADK354:
        subs    r0, r0, r3
        sbc     r1, r1, r12
        tst     r1, #1, 2
        bne     LADK357
        cmp     r1, #0
        bne     LADK355
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK356
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK356
LADK355:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK356:
        add     r7, r7, r2
LADK357:
        rsbs    r3, r0, #0
        rsc     r2, r1, #0
        b       LADK363
LADK358:
        sub     r7, r7, r12
        cmp     r7, #0x20
        bcs     LADK359
        rsb     lr, r7, #0x20
        mov     lr, r1, lsl lr
        orr     r0, lr, r0, lsr r7
        mov     r7, r1, asr r7
        b       LADK360
LADK359:
        cmp     r7, #0x40
        movcs   r7, #0x1F
        subcc   r7, r7, #0x20
        mov     r0, r1, asr r7
        mov     r7, r1, asr #31
LADK360:
        subs    r3, r3, r0
        sbc     r2, r2, r7
        tst     r2, #1, 2
        mov     r7, r12
        bne     LADK363
        cmp     r2, #0
        bne     LADK361
        cmp     r3, #0
        moveq   r0, #0
        beq     LADK362
        clz     r0, r3
        mov     r3, r3, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r3, lsr #1
        mov     r3, r3, lsl #31
        b       LADK362
LADK361:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r3, lsr r1
        orr     r2, r1, r2, lsl r0
        mov     r3, r3, lsl r0
LADK362:
        add     r7, r12, r0
LADK363:
        sub     r10, r10, #1
        cmp     r10, #0
        sub     r5, r5, #4
        sub     r6, r6, #8
        bgt     LADK343
        b       LADK137
LADK364:
        rsbs    r9, r9, #0
        rsc     r8, r8, #0
        orrs    r1, r8, r9
        bne     LADK365
        orrs    r0, r2, r3
        beq     LADK367
LADK365:
        cmp     r4, r7
        bne     LADK366
        cmp     r8, r2
        bne     LADK366
        cmp     r9, r3
        beq     LADK367
LADK366:
        cmp     r1, #0
        beq     LADK368
        orrs    r0, r2, r3
        beq     LADK367
        cmp     r4, r7
        blt     LADK367
        cmp     r4, r7
        bne     LADK368
        cmp     r8, r2
        bhi     LADK367
        cmp     r8, r2
        bne     LADK368
        cmp     r9, r3
        bls     LADK368
LADK367:
        umull   r1, r12, r9, r2
        umull   lr, r0, r3, r9
        umull   r3, lr, r3, r8
        umull   r2, r11, r8, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    lr, r2, lr
        adc     r11, r11, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r2, r1, lsr #31
        adc     r11, r11, #0
        mov     r0, lr, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r11, r0, r11, lsl #1
        orr     lr, r2, lr, lsl #1
        adds    r0, lr, r1
        adc     r1, r11, #0
        b       LADK369
LADK368:
        umull   r0, r1, r3, r8
        umull   r12, r3, r3, r9
        umull   lr, r12, r9, r2
        umull   r2, r11, r8, r2
        adds    r3, r0, r3
        adc     r1, r1, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    r12, r2, r12
        adc     r11, r11, #0
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r12, r1, r12
        mov     r1, r3, lsr #31
        adc     r11, r11, #0
        mov     r0, r12, lsr #31
        mov     r3, r3, lsr #30
        orr     r12, r1, r12, lsl #1
        orr     r11, r0, r11, lsl #1
        and     r3, r3, #1
        adds    r0, r12, r3
        adc     r1, r11, #0
LADK369:
        tst     r1, #1, 2
        bne     LADK370
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r11, r2, #0x1F
        clzne   r2, r1
        subne   r11, r2, #1
        mov     r3, r11, asr #31
        mov     r2, r11
        bl      __ashldi3
        add     r7, r7, r11
LADK370:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK349
LADK371:
        rsbs    r3, r3, #0
        rsc     r2, r2, #0
        cmp     r8, #0
        blt     LADK378
        orrs    r1, r8, r9
        bne     LADK372
        orrs    r0, r2, r3
        beq     LADK374
LADK372:
        cmp     r4, r7
        bne     LADK373
        cmp     r8, r2
        bne     LADK373
        cmp     r9, r3
        beq     LADK374
LADK373:
        cmp     r1, #0
        beq     LADK375
        orrs    r0, r2, r3
        beq     LADK374
        cmp     r4, r7
        blt     LADK374
        cmp     r4, r7
        bne     LADK375
        cmp     r8, r2
        bhi     LADK374
        cmp     r8, r2
        bne     LADK375
        cmp     r9, r3
        bls     LADK375
LADK374:
        umull   r1, r12, r9, r2
        umull   lr, r0, r3, r9
        umull   r3, lr, r3, r8
        umull   r2, r11, r8, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    lr, r2, lr
        adc     r11, r11, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r2, r1, lsr #31
        adc     r11, r11, #0
        mov     r0, lr, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r11, r0, r11, lsl #1
        orr     lr, r2, lr, lsl #1
        adds    r0, lr, r1
        adc     r1, r11, #0
        b       LADK376
LADK375:
        umull   r0, r1, r3, r8
        umull   r12, r3, r3, r9
        umull   lr, r12, r9, r2
        umull   r2, r11, r8, r2
        adds    r3, r0, r3
        adc     r1, r1, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    r12, r2, r12
        adc     r11, r11, #0
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r12, r1, r12
        mov     r1, r3, lsr #31
        adc     r11, r11, #0
        mov     r0, r12, lsr #31
        mov     r3, r3, lsr #30
        orr     r12, r1, r12, lsl #1
        orr     r11, r0, r11, lsl #1
        and     r3, r3, #1
        adds    r0, r12, r3
        adc     r1, r11, #0
LADK376:
        tst     r1, #1, 2
        bne     LADK377
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r11, r2, #0x1F
        clzne   r2, r1
        subne   r11, r2, #1
        mov     r3, r11, asr #31
        mov     r2, r11
        bl      __ashldi3
        add     r7, r7, r11
LADK377:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK349
LADK378:
        rsbs    r9, r9, #0
        rsc     r8, r8, #0
        orrs    r1, r8, r9
        bne     LADK379
        orrs    r0, r2, r3
        beq     LADK381
LADK379:
        cmp     r4, r7
        bne     LADK380
        cmp     r8, r2
        bne     LADK380
        cmp     r9, r3
        beq     LADK381
LADK380:
        cmp     r1, #0
        beq     LADK382
        orrs    r0, r2, r3
        beq     LADK381
        cmp     r4, r7
        blt     LADK381
        cmp     r4, r7
        bne     LADK382
        cmp     r8, r2
        bhi     LADK381
        cmp     r8, r2
        bne     LADK382
        cmp     r9, r3
        bls     LADK382
LADK381:
        umull   r1, r12, r9, r2
        umull   lr, r0, r3, r9
        umull   r3, lr, r3, r8
        umull   r2, r11, r8, r2
        adds    r1, r0, r1
        adc     r12, r12, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    lr, r2, lr
        adc     r11, r11, #0
        adds    r1, r3, r1
        adc     r12, r12, #0
        adds    lr, r12, lr
        mov     r2, r1, lsr #31
        adc     r11, r11, #0
        mov     r0, lr, lsr #31
        mov     r1, r1, lsr #30
        and     r1, r1, #1
        orr     r11, r0, r11, lsl #1
        orr     lr, r2, lr, lsl #1
        adds    r0, lr, r1
        adc     r1, r11, #0
        b       LADK383
LADK382:
        umull   r0, r1, r3, r8
        umull   r12, r3, r3, r9
        umull   lr, r12, r9, r2
        umull   r2, r11, r8, r2
        adds    r3, r0, r3
        adc     r1, r1, #0
        add     r7, r7, r4
        sub     r7, r7, #0x3F
        adds    r12, r2, r12
        adc     r11, r11, #0
        adds    r3, lr, r3
        adc     r1, r1, #0
        adds    r12, r1, r12
        mov     r1, r3, lsr #31
        adc     r11, r11, #0
        mov     r0, r12, lsr #31
        mov     r3, r3, lsr #30
        orr     r12, r1, r12, lsl #1
        orr     r11, r0, r11, lsl #1
        and     r3, r3, #1
        adds    r0, r12, r3
        adc     r1, r11, #0
LADK383:
        tst     r1, #1, 2
        bne     LADK349
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r11, r2, #0x1F
        clzne   r2, r1
        subne   r11, r2, #1
        mov     r3, r11, asr #31
        mov     r2, r11
        bl      __ashldi3
        add     r7, r7, r11
        b       LADK349
LADK384:
        rsbs    r0, r0, #0
        rsc     r8, r1, #0
        tst     r8, #1, 2
        bne     LADK120
        cmp     r8, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r8
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r4, r4, r2
        mov     r1, r8
        bl      __ashldi3
        mov     r8, r1
        b       LADK120
LADK385:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        orrs    r2, r1, r0
        bne     LADK386
        orrs    r3, r5, r6
        beq     LADK388
LADK386:
        ldr     r3, [sp, #0xC]
        cmp     r3, r4
        bne     LADK387
        cmp     r1, r5
        bne     LADK387
        cmp     r0, r6
        beq     LADK388
LADK387:
        cmp     r2, #0
        beq     LADK394
        orrs    r2, r5, r6
        beq     LADK388
        ldr     r2, [sp, #0xC]
        cmp     r2, r4
        blt     LADK388
        ldr     r2, [sp, #0xC]
        cmp     r2, r4
        bne     LADK394
        cmp     r1, r5
        bhi     LADK388
        cmp     r1, r5
        bne     LADK394
        cmp     r0, r6
        bls     LADK394
LADK388:
        ldr     r2, [sp, #0xC]
        sub     r4, r4, r2
        cmp     r4, #0x20
        bcs     LADK389
        rsb     r2, r4, #0x20
        mov     r2, r5, lsl r2
        orr     r6, r2, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK390
LADK389:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK390:
        subs    r0, r0, r6
        sbc     r1, r1, r4
        ldr     r4, [sp, #0xC]
        tst     r1, #1, 2
        bne     LADK393
        cmp     r1, #0
        bne     LADK391
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK392
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK392
LADK391:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK392:
        ldr     r3, [sp, #0xC]
        add     r4, r3, r2
LADK393:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK118
LADK394:
        ldr     r2, [sp, #0xC]
        sub     r2, r2, r4
        cmp     r2, #0x20
        bcs     LADK395
        rsb     r3, r2, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r2
        mov     r2, r1, asr r2
        b       LADK396
LADK395:
        cmp     r2, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x20
        mov     r0, r1, asr r2
        mov     r2, r1, asr #31
LADK396:
        subs    r0, r6, r0
        sbc     r1, r5, r2
        tst     r1, #1, 2
        bne     LADK118
        cmp     r1, #0
        bne     LADK397
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK398
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK398
LADK397:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK398:
        add     r4, r4, r2
        b       LADK118
LADK399:
        ldr     r0, [sp]
        rsbs    r6, r6, #0
        rsc     r5, r5, #0
        cmp     r0, #0
        blt     LADK413
        orrs    r0, r5, r6
        bne     LADK400
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp]
        orrs    r1, r2, r1
        beq     LADK402
LADK400:
        ldr     r1, [sp, #0xC]
        cmp     r4, r1
        bne     LADK401
        ldr     r1, [sp]
        cmp     r5, r1
        bne     LADK401
        ldr     r1, [sp, #0x14]
        cmp     r6, r1
        beq     LADK402
LADK401:
        cmp     r0, #0
        beq     LADK408
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp]
        orrs    r0, r1, r0
        beq     LADK402
        ldr     r0, [sp, #0xC]
        cmp     r4, r0
        blt     LADK402
        ldr     r0, [sp, #0xC]
        cmp     r4, r0
        bne     LADK408
        ldr     r0, [sp]
        cmp     r5, r0
        bhi     LADK402
        ldr     r0, [sp]
        cmp     r5, r0
        bne     LADK408
        ldr     r0, [sp, #0x14]
        cmp     r6, r0
        bls     LADK408
LADK402:
        ldr     r0, [sp, #0xC]
        sub     r0, r0, r4
        cmp     r0, #0x20
        bcs     LADK403
        ldr     r1, [sp]
        ldr     r3, [sp, #0x14]
        rsb     r2, r0, #0x20
        mov     r2, r1, lsl r2
        orr     r2, r2, r3, lsr r0
        mov     r0, r1, asr r0
        b       LADK404
LADK403:
        cmp     r0, #0x40
        movcs   r1, #0x1F
        subcc   r1, r0, #0x20
        ldr     r0, [sp]
        mov     r2, r0, asr r1
        mov     r0, r0, asr #31
LADK404:
        subs    r6, r6, r2
        sbc     r5, r5, r0
        tst     r5, #1, 2
        bne     LADK407
        cmp     r5, #0
        bne     LADK405
        cmp     r6, #0
        moveq   r0, #0
        beq     LADK406
        clz     r0, r6
        mov     r6, r6, lsl r0
        add     r0, r0, #0x1F
        mov     r5, r6, lsr #1
        mov     r6, r6, lsl #31
        b       LADK406
LADK405:
        clz     r0, r5
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r6, lsr r1
        orr     r5, r1, r5, lsl r0
        mov     r6, r6, lsl r0
LADK406:
        add     r4, r4, r0
LADK407:
        rsbs    r0, r6, #0
        rsc     r1, r5, #0
        b       LADK118
LADK408:
        ldr     r0, [sp, #0xC]
        sub     r4, r4, r0
        cmp     r4, #0x20
        bcs     LADK409
        rsb     r0, r4, #0x20
        mov     r0, r5, lsl r0
        orr     r6, r0, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK410
LADK409:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK410:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp]
        subs    r0, r0, r6
        sbc     r1, r1, r4
        ldr     r4, [sp, #0xC]
        tst     r1, #1, 2
        bne     LADK118
        cmp     r1, #0
        bne     LADK411
        cmp     r0, #0
        moveq   r2, #0
        beq     LADK412
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r2, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LADK412
LADK411:
        clz     r2, r1
        sub     r2, r2, #1
        rsb     r3, r2, #0x20
        mov     r3, r0, lsr r3
        orr     r1, r3, r1, lsl r2
        mov     r0, r0, lsl r2
LADK412:
        ldr     r3, [sp, #0xC]
        add     r4, r3, r2
        b       LADK118
LADK413:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp]
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        orrs    r2, r1, r0
        bne     LADK414
        orrs    r3, r5, r6
        beq     LADK416
LADK414:
        ldr     r3, [sp, #0xC]
        cmp     r3, r4
        bne     LADK415
        cmp     r1, r5
        bne     LADK415
        cmp     r0, r6
        beq     LADK416
LADK415:
        cmp     r2, #0
        beq     LADK419
        orrs    r2, r5, r6
        beq     LADK416
        ldr     r2, [sp, #0xC]
        cmp     r2, r4
        blt     LADK416
        ldr     r2, [sp, #0xC]
        cmp     r2, r4
        bne     LADK419
        cmp     r1, r5
        bhi     LADK416
        cmp     r1, r5
        bne     LADK419
        cmp     r0, r6
        bls     LADK419
LADK416:
        ldr     r2, [sp, #0xC]
        sub     r4, r4, r2
        cmp     r4, #0x20
        bcs     LADK417
        rsb     r2, r4, #0x20
        mov     r2, r5, lsl r2
        orr     r6, r2, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK418
LADK417:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK418:
        adds    r0, r0, r6
        adc     r1, r1, r4
        ldr     r4, [sp, #0xC]
        tst     r1, r1
        bmi     LADK423
        b       LADK422
LADK419:
        ldr     r2, [sp, #0xC]
        sub     r2, r2, r4
        cmp     r2, #0x20
        bcs     LADK420
        rsb     r3, r2, #0x20
        mov     r3, r1, lsl r3
        orr     r0, r3, r0, lsr r2
        mov     r2, r1, asr r2
        b       LADK421
LADK420:
        cmp     r2, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x20
        mov     r0, r1, asr r2
        mov     r2, r1, asr #31
LADK421:
        adds    r0, r6, r0
        adc     r1, r5, r2
        tst     r1, r1
        bmi     LADK424
LADK422:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        b       LADK118
LADK423:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        ldr     r2, [sp, #0xC]
        mov     r1, r1, lsr #1
        sub     r4, r2, #1
        b       LADK422
LADK424:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r4, r4, #1
        b       LADK422
LADK425:
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
        orrs    r2, r1, r0
        bne     LADK426
        orrs    r3, r5, r6
        beq     LADK428
LADK426:
        cmp     r11, r4
        bne     LADK427
        cmp     r1, r5
        bne     LADK427
        cmp     r0, r6
        beq     LADK428
LADK427:
        cmp     r2, #0
        beq     LADK431
        orrs    r2, r5, r6
        beq     LADK428
        cmp     r11, r4
        blt     LADK428
        cmp     r11, r4
        bne     LADK431
        cmp     r1, r5
        bhi     LADK428
        cmp     r1, r5
        bne     LADK431
        cmp     r0, r6
        bls     LADK431
LADK428:
        sub     r4, r4, r11
        cmp     r4, #0x20
        bcs     LADK429
        rsb     r2, r4, #0x20
        mov     r2, r5, lsl r2
        orr     r6, r2, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK430
LADK429:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK430:
        adds    r6, r0, r6
        adc     r5, r1, r4
        tst     r5, r5
        mov     r4, r11
        bpl     LADK109
        mov     r0, r5, lsl #31
        sub     r4, r11, #1
        orr     r6, r0, r6, lsr #1
        mov     r5, r5, lsr #1
        b       LADK109
LADK431:
        sub     r11, r11, r4
        cmp     r11, #0x20
        bcs     LADK432
        rsb     r2, r11, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK433
LADK432:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK433:
        adds    r6, r6, r0
        adc     r5, r5, r11
        tst     r5, r5
        bpl     LADK109
        mov     r0, r5, lsl #31
        sub     r4, r4, #1
        orr     r6, r0, r6, lsr #1
        mov     r5, r5, lsr #1
        b       LADK109
LADK434:
        rsbs    r6, r6, #0
        rsc     r5, r5, #0
        cmp     r1, #0
        orr     r2, r5, r6
        blt     LADK446
        cmp     r2, #0
        bne     LADK435
        orrs    r3, r1, r0
        beq     LADK437
LADK435:
        cmp     r4, r11
        bne     LADK436
        cmp     r5, r1
        bne     LADK436
        cmp     r6, r0
        beq     LADK437
LADK436:
        cmp     r2, #0
        beq     LADK440
        orrs    r2, r1, r0
        beq     LADK437
        cmp     r4, r11
        blt     LADK437
        cmp     r4, r11
        bne     LADK440
        cmp     r5, r1
        bhi     LADK437
        cmp     r5, r1
        bne     LADK440
        cmp     r6, r0
        bls     LADK440
LADK437:
        sub     r11, r11, r4
        cmp     r11, #0x20
        bcs     LADK438
        rsb     r2, r11, #0x20
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r11
        mov     r11, r1, asr r11
        b       LADK439
LADK438:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK439:
        adds    r6, r6, r0
        adc     r5, r5, r11
        tst     r5, r5
        bmi     LADK444
        b       LADK443
LADK440:
        sub     r4, r4, r11
        cmp     r4, #0x20
        bcs     LADK441
        rsb     r2, r4, #0x20
        mov     r2, r5, lsl r2
        orr     r6, r2, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK442
LADK441:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK442:
        adds    r6, r0, r6
        adc     r5, r1, r4
        tst     r5, r5
        mov     r4, r11
        bmi     LADK445
LADK443:
        rsbs    r6, r6, #0
        rsc     r5, r5, #0
        b       LADK109
LADK444:
        mov     r0, r5, lsl #31
        sub     r4, r4, #1
        orr     r6, r0, r6, lsr #1
        mov     r5, r5, lsr #1
        b       LADK443
LADK445:
        mov     r0, r5, lsl #31
        sub     r4, r11, #1
        orr     r6, r0, r6, lsr #1
        mov     r5, r5, lsr #1
        b       LADK443
LADK446:
        rsbs    r0, r0, #0
        str     r0, [sp, #0x10]
        rsc     r1, r1, #0
        cmp     r2, #0
        bne     LADK447
        ldr     r0, [sp, #0x10]
        orrs    r0, r1, r0
        beq     LADK449
LADK447:
        cmp     r4, r11
        bne     LADK448
        cmp     r5, r1
        bne     LADK448
        ldr     r0, [sp, #0x10]
        cmp     r6, r0
        beq     LADK449
LADK448:
        cmp     r2, #0
        beq     LADK455
        ldr     r0, [sp, #0x10]
        orrs    r0, r1, r0
        beq     LADK449
        cmp     r4, r11
        blt     LADK449
        cmp     r4, r11
        bne     LADK455
        cmp     r5, r1
        bhi     LADK449
        cmp     r5, r1
        bne     LADK455
        ldr     r0, [sp, #0x10]
        cmp     r6, r0
        bls     LADK455
LADK449:
        sub     r11, r11, r4
        cmp     r11, #0x20
        bcs     LADK450
        ldr     r2, [sp, #0x10]
        rsb     r0, r11, #0x20
        mov     r0, r1, lsl r0
        orr     r0, r0, r2, lsr r11
        mov     r11, r1, asr r11
        b       LADK451
LADK450:
        cmp     r11, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x20
        mov     r0, r1, asr r11
        mov     r11, r1, asr #31
LADK451:
        subs    r6, r6, r0
        sbc     r5, r5, r11
        tst     r5, #1, 2
        bne     LADK454
        cmp     r5, #0
        bne     LADK452
        cmp     r6, #0
        moveq   r0, #0
        beq     LADK453
        clz     r0, r6
        mov     r6, r6, lsl r0
        add     r0, r0, #0x1F
        mov     r5, r6, lsr #1
        mov     r6, r6, lsl #31
        b       LADK453
LADK452:
        clz     r0, r5
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r6, lsr r1
        orr     r5, r1, r5, lsl r0
        mov     r6, r6, lsl r0
LADK453:
        add     r4, r0, r4
LADK454:
        rsbs    r6, r6, #0
        rsc     r5, r5, #0
        b       LADK109
LADK455:
        sub     r4, r4, r11
        cmp     r4, #0x20
        bcs     LADK456
        rsb     r0, r4, #0x20
        mov     r0, r5, lsl r0
        orr     r6, r0, r6, lsr r4
        mov     r4, r5, asr r4
        b       LADK457
LADK456:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, r4, #0x20
        mov     r6, r5, asr r4
        mov     r4, r5, asr #31
LADK457:
        ldr     r0, [sp, #0x10]
        subs    r6, r0, r6
        sbc     r5, r1, r4
        tst     r5, #1, 2
        mov     r4, r11
        bne     LADK109
        cmp     r5, #0
        bne     LADK458
        cmp     r6, #0
        moveq   r0, #0
        beq     LADK459
        clz     r0, r6
        mov     r6, r6, lsl r0
        add     r0, r0, #0x1F
        mov     r5, r6, lsr #1
        mov     r6, r6, lsl #31
        b       LADK459
LADK458:
        clz     r0, r5
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r6, lsr r1
        orr     r5, r1, r5, lsl r0
        mov     r6, r6, lsl r0
LADK459:
        add     r4, r11, r0
        b       LADK109
LADK460:
        ldr     r12, [sp, #4]
        cmp     r3, r12
        bne     LADK76
        cmp     lr, r9
        beq     LADK77
        b       LADK76
LADK461:
        ldr     lr, [sp, #4]
        cmp     r3, lr
        bne     LADK67
        cmp     r2, r9
        beq     LADK68
        b       LADK67
LADK462:
        cmp     r2, r5
        bne     LADK45
        cmp     r3, r6
        beq     LADK46
        b       LADK45
LADK463:
        mov     r2, lr, lsl #31
        orr     r12, r2, r12, lsr #1
        mov     lr, lr, lsr #1
        sub     r8, r5, #1
        b       LADK15
LADK464:
        cmp     r2, r4
        bne     LADK7
        cmp     r3, r7
        beq     LADK8
        b       LADK7
LADK465:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LADK_s_qw4000000000000000:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
LADK_qwXB_M:
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
LADK_THE_128_LN2_DIV_M:
        .byte   0x5E,0xF8,0x0B,0xAE,0x94,0x1D,0x55,0x5C
LADK_THE_LN2_DIV_128_HI_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x08,0xB9,0x58
LADK_THE_LN2_DIV_128_LO_M:
        .byte   0x3B,0x9E,0xBC,0x9A,0xF7,0x1C,0x7D,0x7F
LADK_qwE_M:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55
        .byte   0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
        .byte   0x05,0x5B,0xB0,0x05,0x5B,0xB0,0x05,0x5B
LADK_qwT_M:
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
LADK_qwP_M:
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
LADK_s_qw0000000080000000:
        .byte   0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x00
LADK_qwXB_SC:
        .byte   0xFF,0xFF,0xFF,0x7F,0x41,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x3F,0x00,0x00,0x00
        .byte   0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3D,0x00,0x00,0x00
        .byte   0x3D,0x00,0x00,0x00,0x3D,0x00,0x00,0x00,0x3C,0x00,0x00,0x00,0x3C,0x00,0x00,0x00
        .byte   0x3C,0x00,0x00,0x00,0x3B,0x00,0x00,0x00,0x3B,0x00,0x00,0x00,0x3B,0x00,0x00,0x00
        .byte   0x3B,0x00,0x00,0x00,0x3A,0x00,0x00,0x00,0x3A,0x00,0x00,0x00,0x3A,0x00,0x00,0x00
LADK_qwE_SC:
        .byte   0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x41,0x00,0x00,0x00
        .byte   0x43,0x00,0x00,0x00,0x45,0x00,0x00,0x00,0x48,0x00,0x00,0x00
LADK_qwP_SC:
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


