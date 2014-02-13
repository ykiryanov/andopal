        .text
        .align  4
        .globl  tanh


tanh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r2, [pc, #0xC38]
        mvn     r4, #2, 2
        bic     r5, r1, r4
        eor     r12, r1, r5
        cmp     r2, r12
        mov     r2, #0
        bls     LAAF47
        mov     r3, #0xFF
        mvn     lr, #0xFF, 12
        cmp     r12, #0xFF, 10
        orr     r3, r3, #7, 24
        bic     lr, lr, #0xF, 4
        bcc     LAAF17
        movs    r1, r12, lsl #1
        and     r7, r12, lr
        moveq   r1, #2, 12
        orrne   r7, r7, #1, 12
        bics    r12, r12, r4
        beq     LAAF0
        rsbs    r0, r0, #0
        rsc     r7, r7, #0
LAAF0:
        ldr     r6, [pc, #0xBE8]
        sub     r3, r3, #0xF3, 30
        add     r12, r7, r0, lsr #31
        ldr     lr, [r6]
        sub     r1, r3, r1, lsr #21
        ldr     r3, [r6, #8]
        ldr     r11, [r6, #4]
        smull   r10, r6, lr, r0
        smull   lr, r9, lr, r12
        smull   r8, r7, r12, r11
        smull   r12, r3, r3, r12
        smull   r11, r0, r0, r11
        adds    lr, r6, lr
        adc     r6, r9, r6, asr #31
        adds    r12, lr, r7
        adc     r7, r6, r7, asr #31
        adds    r8, r10, r8
        adc     r6, r2, #0
        adds    lr, r8, r0
        adc     r0, r6, r0, asr #31
        adds    r8, lr, r3
        adc     r3, r0, r3, asr #31
        adds    r12, r3, r12
        sub     r0, r1, #0x2B
        adc     r7, r7, r3, asr #31
        mov     r3, r7, asr r0
        and     lr, r3, #1
        add     r0, r0, #1
        add     r6, lr, r3, asr #1
        ldr     r3, [pc, #0xB78]
        sub     lr, r7, r6, lsl r0
        ldr     r0, [r3, #0x20]
        str     r0, [sp, #8]
        ldr     r0, [r3, #0x1C]
        eor     r3, lr, lr, asr #31
        sub     r3, r3, lr, asr #31
        clz     r3, r3
        sub     r3, r3, #2
        rsb     r9, r3, #0x20
        mov     r10, r8, lsr r9
        orr     r10, r10, r12, lsl r3
        mov     r9, r12, lsr r9
        ldr     r12, [pc, #0xB48]
        add     r1, r1, r3
        orr     r3, r9, lr, lsl r3
        smull   r11, r12, r12, r10
        ldr     lr, [sp, #8]
        add     r10, r3, r10, lsr #31
        rsb     r3, r10, #0
        smull   lr, r9, r3, lr
        sub     r1, r1, #0x24
        sub     r7, r1, #0x20
        ldr     r1, [pc, #0xB1C]
        add     lr, r7, #3
        add     r9, r0, r9, asr lr
        smull   r9, r0, r3, r9
        ldr     r8, [r1, #0x18]
        str     r8, [sp, #4]
        ldr     r9, [sp, #4]
        ldr     r8, [r1, #0x14]
        ldr     r1, [r1, #0x10]
        add     lr, r9, r0, asr lr
        smull   r9, lr, r3, lr
        add     r0, r7, #2
        cmp     r0, #0x20
        bgt     LAAF1
        mov     r9, r9, lsr r0
        rsb     r2, r7, #0x1E
        orr     r9, r9, lr, lsl r2
        mov     r2, lr, asr r0
        b       LAAF2
LAAF1:
        cmp     r0, #0x40
        movgt   r9, r2
        bgt     LAAF2
        sub     r2, r7, #0x1E
        mov     r9, lr, asr #31
        mov     lr, lr, lsr r2
        mov     r2, r9, asr r2
        rsb     r10, r7, #0x3E
        orr     r9, lr, r9, lsl r10
LAAF2:
        adds    r1, r1, r9
        adc     r2, r8, r2
        adds    r2, r2, r1, lsr #31
        smull   lr, r1, r3, r1
        smull   r2, lr, r3, r2
        ldr     r9, [pc, #0xA98]
        adds    r2, r2, r1
        adc     r8, lr, r1, asr #31
        cmp     r0, #0x20
        ldr     lr, [r9, #0xC]
        ldr     r1, [r9, #8]
        bgt     LAAF3
        rsb     r9, r7, #0x1E
        mov     r2, r2, lsr r0
        orr     r9, r2, r8, lsl r9
        mov     r8, r8, asr r0
        b       LAAF4
LAAF3:
        cmp     r0, #0x40
        movgt   r8, #0
        movgt   r9, r8
        bgt     LAAF4
        sub     r10, r7, #0x1E
        mov     r2, r8, asr #31
        mov     r9, r8, lsr r10
        mov     r8, r2, asr r10
        rsb     r10, r7, #0x3E
        orr     r9, r9, r2, lsl r10
LAAF4:
        adds    r1, r1, r9
        adc     r8, lr, r8
        adds    r2, r8, r1, lsr #31
        smull   lr, r1, r3, r1
        smull   lr, r8, r3, r2
        ldr     r2, [pc, #0xA2C]
        adds    lr, lr, r1
        adc     r8, r8, r1, asr #31
        cmp     r0, #0x20
        ldr     r1, [r2, #4]
        ldr     r2, [r2]
        bgt     LAAF5
        mov     r9, lr, lsr r0
        mov     lr, r8, asr r0
        rsb     r0, r7, #0x1E
        orr     r0, r9, r8, lsl r0
        b       LAAF6
LAAF5:
        cmp     r0, #0x40
        movgt   lr, #0
        movgt   r0, lr
        bgt     LAAF6
        sub     lr, r7, #0x1E
        mov     r0, r8, asr #31
        mov     r8, r8, lsr lr
        mov     lr, r0, asr lr
        rsb     r9, r7, #0x3E
        orr     r0, r8, r0, lsl r9
LAAF6:
        adds    r2, r2, r0
        smull   r8, r0, r3, r2
        adc     lr, r1, lr
        adds    r2, lr, r2, lsr #31
        smull   r3, r1, r3, r2
        sub     r7, r7, #1
        mov     r2, r7
        mov     r8, r7, asr #31
        adds    lr, r3, r0
        adc     r10, r1, r0, asr #31
        smull   r1, r0, r12, r10
        mov     r1, r0, asr #31
        subs    r9, lr, r12
        mov     r3, r8
        sbc     r10, r10, r12, asr #31
        bl      __ashrdi3
        ldr     r12, [pc, #0x99C]
        subs    r0, r9, r0
        and     lr, r6, #0x3F
        sbc     r10, r10, r1
        rsb     lr, lr, #0x40
        add     r1, r10, r0, lsr #31
        and     r9, lr, #0x3F
        ldr     r10, [r12, +r9, lsl #3]
        mov     lr, lr, asr #6
        rsb     r6, lr, r6, asr #6
        add     lr, r12, r9, lsl #3
        ldr     r9, [lr, #4]
        mov     r2, r7
        mov     r3, r8
        add     r7, r6, #1
        smull   lr, r12, r1, r9
        add     lr, r10, r9, lsr #31
        smull   r11, r0, r0, lr
        smull   lr, r1, r1, lr
        mov     r6, #0
        adds    lr, lr, r0
        adc     r1, r1, r0, asr #31
        adds    r0, lr, r12
        adc     r1, r1, r12, asr #31
        bl      __ashrdi3
        adds    r0, r0, r9
        adc     r1, r1, r10
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashrdi3
        subs    lr, r6, r0
        mov     r2, #1, 2
        sbc     r3, r2, r1
        adds    r0, r0, #0
        adc     r2, r1, #1, 2
        tst     r3, #1, 2
        mov     r1, #0x3E
        bne     LAAF9
        cmp     r3, #0
        beq     LAAF7
        clz     r1, r3
        sub     r1, r1, #1
        rsb     r12, r1, #0x20
        mov     r12, lr, lsr r12
        orr     r3, r12, r3, lsl r1
        mov     lr, lr, lsl r1
        b       LAAF8
LAAF7:
        clz     r1, lr
        mov     r3, lr, lsr #1
        mov     r3, r3, lsl r1
        mov     lr, lr, lsl r1
        add     r1, r1, #0x1F
LAAF8:
        add     r1, r1, #0x3E
LAAF9:
        mov     r7, r0, lsr #31
        bics    r12, r2, r4
        orr     r2, r7, r2, lsl #1
        mov     r7, r0, lsl #1
        beq     LAAF10
        rsbs    r7, r7, #0
        rsc     r2, r2, #0
LAAF10:
        ldr     r0, [pc, #0x8B0]
        mov     r8, r2, lsr #7
        add     r0, r0, r2, lsr #26
        ldrsb   r0, [r0, #-0x20]
        mul     r8, r8, r0
        mov     r8, r8, lsr #7
        rsb     r8, r8, #0
        add     r8, r8, #2, 8
        mul     r8, r8, r0
        umull   r9, r0, r2, r8
        mov     r9, #2, 2
        subs    r0, r9, r0
        umull   r0, r10, r8, r0
        sbc     r9, r6, #0
        mla     r10, r8, r9, r10
        mov     r8, r10, lsl #2
        orr     r0, r8, r0, lsr #30
        umull   r9, r8, r2, r0
        subs    r9, r6, r9
        umull   r10, r9, r0, r9
        mov     r10, #2, 2
        sbc     r10, r10, r8
        umull   r10, r0, r0, r10
        adds    r8, r9, r10
        adc     r0, r0, #0
        mov     r0, r0, lsl #2
        orr     r0, r0, r8, lsr #30
        umull   r7, r9, r0, r7
        mov     r7, r8, lsl #2
        umull   r8, r10, r2, r7
        umull   r11, r8, r2, r0
        adds    r10, r10, r9
        adc     r9, r6, #0
        adds    r10, r10, r11
        adc     r8, r9, r8
        subs    r9, r6, r10
        mov     r6, #2, 2
        sbc     r6, r6, r8
        umull   r8, r10, r6, r7
        umull   r7, r9, r0, r9
        umull   r6, r0, r0, r6
        adds    r7, r8, r7
        adc     r9, r10, r9
        and     r7, r7, #3
        adds    r8, r9, r6
        adc     r0, r0, #0
        orr     r7, r7, r8, lsl #2
        adds    r6, r7, r2, lsr #31
        mov     r8, r8, lsr #30
        orr     r0, r8, r0, lsl #2
        adc     r2, r0, #0
        cmp     r12, #0
        beq     LAAF11
        rsbs    r6, r6, #0
        rsc     r2, r2, #0
LAAF11:
        umull   r12, r0, r6, lr
        umull   r7, r12, r6, r3
        umull   lr, r6, lr, r2
        umull   r3, r2, r2, r3
        adds    r0, r7, r0
        adc     r12, r12, #0
        adds    r6, r3, r6
        adc     r2, r2, #0
        adds    r0, lr, r0
        adc     r12, r12, #0
        adds    r3, r12, r6
        mov     r12, r0, lsr #31
        mov     r0, r0, lsr #30
        adc     r2, r2, #0
        orr     r12, r12, r3, lsl #1
        and     r0, r0, #1
        mov     r3, r3, lsr #31
        adds    r0, r12, r0
        orr     r2, r3, r2, lsl #1
        adc     r2, r2, #0
        bics    r4, r2, r4
        beq     LAAF12
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LAAF12:
        mov     r3, #0xFF
        orr     r3, r3, #3, 24
        clz     r12, r2
        add     r3, r3, #0x3D
        cmp     r12, #0x20
        rsb     r1, r1, r3
        beq     LAAF49
LAAF13:
        sub     r3, r12, #1
        rsb     r12, r3, #0x20
        mov     r12, r0, lsr r12
        subs    r1, r1, r3
        orr     r2, r12, r2, lsl r3
        mov     r0, r0, lsl r3
        bpl     LAAF15
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAAF14
        mov     r0, r2
        mov     r2, r2, asr #31
        sub     r1, r1, #0x20
LAAF14:
        cmp     r1, #0x20
        mov     r3, #0x20
        movgt   r1, r3
        mov     r0, r0, lsr r1
        rsb     r3, r1, #0x20
        orr     r0, r0, r2, lsl r3
        mov     r2, r2, asr r1
        mov     r1, #0
LAAF15:
        mov     r3, r0, lsr #9
        mov     r12, r2, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r2, r2, lsr #10
        adc     r3, r2, r3, asr #31
        orrs    r2, r3, r3, asr #31
        moveq   r1, #0
        beq     LAAF16
        mov     r2, #0xFF
        orr     r2, r2, #7, 24
        sub     r2, r2, #1
        cmp     r2, r1
        bgt     LAAF16
        mov     r1, #0x1F
        mov     r0, #0
        add     r1, r1, #0x7E, 28
        mov     r3, r0
LAAF16:
        add     r1, r3, r1, lsl #20
        orr     r4, r1, r4
        orr     r1, r4, r5
        b       LAAF48
LAAF17:
        cmp     r12, #0x3E, 8
        bcc     LAAF46
        movs    r2, r12, lsl #1
        and     lr, r12, lr
        moveq   r2, #2, 12
        orrne   lr, lr, #1, 12
        bics    r4, r12, r4
        beq     LAAF18
        rsbs    r0, r0, #0
        rsc     lr, lr, #0
LAAF18:
        ldr     r1, [pc, #0x684]
        sub     r4, r3, #0xF3, 30
        mov     r3, r0, lsr #22
        orr     r8, r3, lr, lsl #10
        mov     lr, r0, lsl #10
        umull   r0, r12, lr, lr
        umull   r3, r0, lr, r8
        sub     r4, r4, r2, lsr #21
        umull   r7, r2, r8, r8
        add     r4, r4, #0xA
        adds    r6, r3, r12
        adc     r12, r0, #0
        mov     r10, r4, lsl #1
        adds    r7, r7, r0
        adc     r0, r2, #0
        adds    r6, r3, r6
        adc     r12, r12, #0
        adds    r2, r12, r7
        mov     r3, r6, lsr #31
        mov     r6, r6, lsr #30
        orr     r3, r3, r2, lsl #1
        adc     r0, r0, #0
        mov     r2, r2, lsr #31
        and     r6, r6, #1
        adds    r7, r3, r6
        orr     r12, r2, r0, lsl #1
        umull   r0, r2, lr, r7
        umull   r3, r0, r7, r8
        adc     r12, r12, #0
        umull   r1, r6, r1, r12
        umull   r9, r11, lr, r12
        adds    r1, r3, r2
        umull   r2, r3, r8, r12
        adc     r0, r0, #0
        adds    r2, r2, r11
        adc     r11, r3, #0
        adds    r1, r9, r1
        adc     r0, r0, #0
        adds    r2, r0, r2
        mov     r0, r1, lsr #31
        mov     r1, r1, lsr #30
        orr     r0, r0, r2, lsl #1
        and     r1, r1, #1
        adc     r11, r11, #0
        adds    r1, r0, r1
        mov     r2, r2, lsr #31
        orr     r11, r2, r11, lsl #1
        adc     r0, r11, #0
        sub     r3, r10, #0x3F
        str     r1, [sp, #8]
        str     r0, [sp]
        ldr     r0, [pc, #0x5BC]
        sub     r1, r3, #0x3E
        sub     r1, r0, r6, asr r1
        umull   r2, r1, r12, r1
        add     r6, r4, r3
        sub     r0, r3, #0x3F
        sub     r6, r6, #0x3F
        cmp     r0, #0x20
        str     r6, [sp, #4]
        bcs     LAAF19
        rsb     r6, r3, #0x5F
        mov     r6, r1, lsl r6
        orr     r2, r6, r2, lsr r0
        mov     r0, r1, asr r0
        b       LAAF20
LAAF19:
        cmp     r0, #0x40
        movcs   r0, #0x1F
        subcc   r0, r3, #0x5F
        mov     r2, r1, asr r0
        mov     r0, r1, asr #31
LAAF20:
        ldr     r1, [pc, #0x570]
        mov     r10, #0x44
        subs    r2, r1, r2
        ldr     r1, [pc, #0x568]
        sbc     r0, r1, r0
        tst     r0, #1, 2
        bne     LAAF23
        cmp     r0, #0
        bne     LAAF21
        cmp     r2, #0
        moveq   r1, #0
        beq     LAAF22
        clz     r0, r2
        mov     r2, r2, lsl r0
        add     r1, r0, #0x1F
        mov     r0, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LAAF22
LAAF21:
        clz     r1, r0
        sub     r1, r1, #1
        rsb     r6, r1, #0x20
        mov     r6, r2, lsr r6
        orr     r0, r6, r0, lsl r1
        mov     r2, r2, lsl r1
LAAF22:
        add     r10, r1, #0x44
LAAF23:
        umull   r9, r11, r7, r2
        umull   r6, r1, r7, r0
        umull   r2, r9, r2, r12
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0xC]
        str     r9, [sp, #0x10]
        umull   r0, r9, r0, r12
        add     r10, r3, r10
        adds    r6, r6, r11
        ldr     r11, [sp, #0x10]
        adc     r1, r1, #0
        sub     r10, r10, #0x3F
        adds    r0, r0, r11
        adc     r9, r9, #0
        adds    r6, r2, r6
        adc     r1, r1, #0
        adds    r0, r1, r0
        mov     r1, r6, lsr #31
        mov     r6, r6, lsr #30
        orr     r1, r1, r0, lsl #1
        adc     r9, r9, #0
        mov     r2, r0, lsr #31
        and     r6, r6, #1
        adds    r0, r1, r6
        sub     r1, r10, #0x43
        orr     r9, r2, r9, lsl #1
        adc     r2, r9, #0
        cmp     r1, #0x20
        bcs     LAAF24
        rsb     r10, r10, #0x63
        mov     r10, r2, lsl r10
        orr     r0, r10, r0, lsr r1
        mov     r1, r2, asr r1
        b       LAAF25
LAAF24:
        cmp     r1, #0x40
        movcs   r10, #0x1F
        subcc   r10, r10, #0x63
        mov     r0, r2, asr r10
        mov     r1, r2, asr #31
LAAF25:
        ldr     r2, [pc, #0x478]
        mov     r11, #0x43
        subs    r2, r2, r0
        ldr     r0, [pc, #0x470]
        sbc     r0, r0, r1
        tst     r0, #1, 2
        bne     LAAF28
        cmp     r0, #0
        bne     LAAF26
        cmp     r2, #0
        moveq   r1, #0
        beq     LAAF27
        clz     r0, r2
        mov     r2, r2, lsl r0
        add     r1, r0, #0x1F
        mov     r0, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LAAF27
LAAF26:
        clz     r1, r0
        sub     r1, r1, #1
        rsb     r6, r1, #0x20
        mov     r6, r2, lsr r6
        orr     r0, r6, r0, lsl r1
        mov     r2, r2, lsl r1
LAAF27:
        add     r11, r1, #0x43
LAAF28:
        umull   r6, r1, r7, r0
        umull   r0, r10, r0, r12
        str     r1, [sp, #0x10]
        add     r11, r3, r11
        str     r6, [sp, #0xC]
        umull   r6, r1, r7, r2
        ldr     r6, [sp, #0xC]
        umull   r2, r9, r2, r12
        sub     r11, r11, #0x3F
        adds    r6, r6, r1
        ldr     r1, [sp, #0x10]
        adc     r1, r1, #0
        adds    r9, r0, r9
        adc     r10, r10, #0
        adds    r6, r2, r6
        adc     r1, r1, #0
        mov     r0, r6, lsr #31
        adds    r9, r1, r9
        mov     r6, r6, lsr #30
        orr     r0, r0, r9, lsl #1
        adc     r10, r10, #0
        and     r6, r6, #1
        mov     r9, r9, lsr #31
        adds    r0, r0, r6
        sub     r1, r11, #0x41
        orr     r10, r9, r10, lsl #1
        adc     r2, r10, #0
        cmp     r1, #0x20
        bcs     LAAF29
        rsb     r11, r11, #0x61
        mov     r11, r2, lsl r11
        orr     r0, r11, r0, lsr r1
        mov     r2, r2, asr r1
        b       LAAF30
LAAF29:
        cmp     r1, #0x40
        movcs   r11, #0x1F
        subcc   r11, r11, #0x61
        mov     r0, r2, asr r11
        mov     r2, r2, asr #31
LAAF30:
        ldr     r1, [pc, #0x380]
        subs    r1, r1, r0
        ldr     r0, [pc, #0x37C]
        sbc     r9, r0, r2
        tst     r9, #1, 2
        mov     r0, #0x41
        bne     LAAF33
        cmp     r9, #0
        bne     LAAF31
        cmp     r1, #0
        moveq   r0, #0
        beq     LAAF32
        clz     r0, r1
        mov     r1, r1, lsl r0
        add     r0, r0, #0x1F
        mov     r9, r1, lsr #1
        mov     r1, r1, lsl #31
        b       LAAF32
LAAF31:
        clz     r0, r9
        sub     r0, r0, #1
        rsb     r2, r0, #0x20
        mov     r2, r1, lsr r2
        orr     r9, r2, r9, lsl r0
        mov     r1, r1, lsl r0
LAAF32:
        add     r0, r0, #0x41
LAAF33:
        add     r3, r3, r0
        umull   r2, r0, r7, r1
        umull   r7, r2, r7, r9
        umull   r1, r6, r1, r12
        umull   r9, r12, r12, r9
        sub     r3, r3, #0x3F
        adds    r7, r7, r0
        adc     r2, r2, #0
        sub     r0, r3, #0x40
        adds    r6, r9, r6
        adc     r12, r12, #0
        adds    r7, r1, r7
        adc     r2, r2, #0
        adds    r2, r2, r6
        adc     r1, r12, #0
        mov     r12, r7, lsr #31
        orr     r12, r12, r2, lsl #1
        mov     r7, r7, lsr #30
        and     r7, r7, #1
        adds    r12, r12, r7
        mov     r2, r2, lsr #31
        orr     r1, r2, r1, lsl #1
        adc     r1, r1, #0
        cmp     r0, #0x20
        bcs     LAAF34
        rsb     r3, r3, #0x60
        mov     r3, r1, lsl r3
        orr     r12, r3, r12, lsr r0
        mov     r0, r1, asr r0
        b       LAAF35
LAAF34:
        cmp     r0, #0x40
        movcs   r3, #0x1F
        subcc   r3, r3, #0x60
        mov     r12, r1, asr r3
        mov     r0, r1, asr #31
LAAF35:
        ldr     r1, [pc, #0x298]
        ldr     r2, [pc, #0x298]
        subs    r1, r1, r12
        mov     r12, #0
        sbc     r2, r2, r0
        tst     r2, #1, 2
        mov     r0, #0x40
        bne     LAAF38
        cmp     r2, #0
        bne     LAAF36
        cmp     r1, #0
        moveq   r0, r12
        beq     LAAF37
        clz     r0, r1
        mov     r1, r1, lsl r0
        add     r0, r0, #0x1F
        mov     r2, r1, lsr #1
        mov     r1, r1, lsl #31
        b       LAAF37
LAAF36:
        clz     r0, r2
        sub     r0, r0, #1
        rsb     r3, r0, #0x20
        mov     r3, r1, lsr r3
        orr     r2, r3, r2, lsl r0
        mov     r1, r1, lsl r0
LAAF37:
        add     r0, r0, #0x40
LAAF38:
        ldr     r3, [sp, #4]
        ldr     r7, [sp, #8]
        add     r3, r0, r3
        sub     r3, r3, #0x3F
        umull   r0, r6, r1, r7
        umull   r0, r9, r7, r2
        ldr     r7, [sp]
        umull   r1, r10, r1, r7
        umull   r2, r7, r7, r2
        adds    r6, r0, r6
        adc     r9, r9, #0
        adds    r10, r2, r10
        adc     r7, r7, #0
        adds    r6, r1, r6
        adc     r9, r9, #0
        adds    r2, r9, r10
        mov     r1, r6, lsr #31
        adc     r0, r7, #0
        orr     r1, r1, r2, lsl #1
        mov     r6, r6, lsr #30
        mov     r2, r2, lsr #31
        and     r6, r6, #1
        orr     r2, r2, r0, lsl #1
        adds    r1, r1, r6
        sub     r0, r3, r4
        adc     r2, r2, #0
        cmp     r0, #0x20
        bcs     LAAF39
        rsb     r3, r0, #0x20
        mov     r3, r2, lsl r3
        orr     r1, r3, r1, lsr r0
        mov     r2, r2, asr r0
        b       LAAF40
LAAF39:
        cmp     r0, #0x40
        movcs   r0, #0x1F
        subcc   r0, r0, #0x20
        mov     r1, r2, asr r0
        mov     r2, r2, asr #31
LAAF40:
        subs    r0, lr, r1
        sbc     r1, r8, r2
        tst     r1, #1, 2
        bne     LAAF43
        cmp     r1, #0
        bne     LAAF41
        cmp     r0, #0
        beq     LAAF42
        clz     r1, r0
        mov     r0, r0, lsl r1
        add     r12, r1, #0x1F
        mov     r1, r0, lsr #1
        mov     r0, r0, lsl #31
        b       LAAF42
LAAF41:
        clz     r2, r1
        sub     r12, r2, #1
        rsb     r2, r12, #0x20
        mov     r2, r0, lsr r2
        orr     r1, r2, r1, lsl r12
        mov     r0, r0, lsl r12
LAAF42:
        add     r4, r4, r12
LAAF43:
        tst     r1, #1, 2
        bne     LAAF44
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r6, r2, #0x1F
        clzne   r2, r1
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        add     r4, r4, r6
LAAF44:
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r6, r2, #0x1F
        clzne   r2, r1
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        and     r3, r0, #2, 24
        mov     r2, #0xFF
        orr     r2, r2, #3, 24
        bic     r0, r0, r2
        mov     r3, r3, lsl #1
        adds    r0, r0, r3
        adc     r1, r1, r3, asr #31
        tst     r1, r1
        add     r4, r4, r6
        bmi     LAAF50
LAAF45:
        add     r2, r2, #0x3D
        rsb     r4, r4, r2
        mov     r2, #0xFF
        orr     r2, r2, #7, 24
        mov     r3, r1, asr #10
        and     r2, r4, r2
        mov     r1, r1, lsl #22
        add     r2, r3, r2, lsl #20
        orr     r0, r1, r0, lsr #10
        orr     r1, r5, r2
        b       LAAF48
LAAF46:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAAF47:
        rsb     r1, r0, #0
        orr     r3, r0, r1
        mov     r1, #0x1F
        orr     r3, r12, r3, lsr #31
        add     lr, r1, #0x7E, 28
        cmp     r3, lr, lsl #20
        orrhi   r5, r5, #2, 14
        orrhi   r1, r12, r5
        bhi     LAAF48
        add     r1, r1, #0x3E, 28
        mov     r0, r2
        orr     r1, r5, r1, lsl #20
LAAF48:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAAF49:
        clz     r3, r0
        cmp     r3, #0
        beq     LAAF13
        mov     r2, r0
        sub     r1, r1, #0x20
        mov     r12, r3
        mov     r0, #0
        b       LAAF13
LAAF50:
        mov     r3, r1, lsl #31
        orr     r0, r3, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r4, r4, #1
        b       LAAF45
        .long   0x40330fc2
        .long   LAAF_L2E
        .long   LAAF_exp_coeffs
        .long   0x58b90bfc
        .long   __intel_dbl_T_2f
        .long   LAAF_rcp63_table
        .long   0x732a496f
        .long   0x48982211
        .long   0xb986235f
        .long   0x5993cd97
        .long   0x7bad1a60
        .long   0x6e86e86b
        .long   0x43cbfbbd
        .long   0x44444444
        .long   0x555548f7
        .long   0x55555555


        .data
        .align  4


LAAF_L2E:
        .byte   0xCA,0x8E,0x2A,0x2E,0x2F,0xFC,0x05,0x57,0xB4,0xFF,0xA1,0xEF
LAAF_exp_coeffs:
        .byte   0xD6,0xBC,0xE7,0xE8,0xFB,0x0B,0xB9,0x58,0xA2,0x3A,0x16,0x0B,0xFE,0xF7,0xFE,0x7A
        .byte   0x2D,0xFE,0x82,0x12,0x5C,0x23,0xAC,0x71,0xBE,0xAD,0xCA,0x4E,0x94,0xFF,0x61,0x57
        .byte   0xBE,0x44,0xC2,0x50
LAAF_rcp63_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41


