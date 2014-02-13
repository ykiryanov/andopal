        .text
        .align  4
        .globl  atanh


atanh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r2, r1
        mvn     r6, #2, 2
        mov     lr, #0xFF
        bic     r5, r2, r6
        str     r0, [sp, #0x38]
        eor     r3, r2, r5
        orr     r12, lr, #3, 24
        str     r1, [sp, #0x3C]
        cmp     r3, r12, lsl #20
        orr     r4, lr, #7, 24
        bcs     LADY40
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r12, r12, #2, 12
        cmp     r12, r3
        mvn     r12, #0xFF, 12
        bic     r12, r12, #0xF, 4
        bhi     LADY16
        movs    r2, r3, lsl #1
        and     r1, r3, r12
        moveq   r2, #2, 12
        orrne   r1, r1, #1, 12
        bics    r3, r3, r6
        beq     LADY0
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADY0:
        sub     r3, r4, #0xF3, 30
        eor     r5, r5, #2, 2
        sub     r2, r3, r2, lsr #21
        mov     r3, r0, lsr #22
        orr     r1, r3, r1, lsl #10
        rsb     r12, r2, #0x54
        mov     lr, r1, lsl r12
        sub     r3, r2, #0x34
        mov     r0, r0, lsl #10
        str     r12, [sp, #0x10]
        orr     lr, lr, r0, lsr r3
        mov     r12, r1, lsr r3
        str     r5, [sp]
        mov     r5, lr, lsr #31
        orr     r12, r12, #1, 2
        mov     r7, lr, lsl #1
        orr     lr, r5, r12, lsl #1
        bics    r5, r12, r6
        beq     LADY1
        rsbs    r7, r7, #0
        rsc     lr, lr, #0
LADY1:
        ldr     r12, [pc, #0xC4C]
        mov     r8, lr, lsr #7
        add     r12, r12, lr, lsr #26
        ldrsb   r12, [r12, #-0x20]
        mul     r8, r8, r12
        mov     r8, r8, lsr #7
        rsb     r8, r8, #0
        add     r8, r8, #2, 8
        mul     r8, r8, r12
        umull   r9, r12, lr, r8
        mov     r9, #2, 2
        subs    r12, r9, r12
        umull   r12, r10, r8, r12
        mov     r9, #0
        sbc     r9, r9, #0
        mla     r10, r8, r9, r10
        mov     r8, r10, lsl #2
        orr     r12, r8, r12, lsr #30
        umull   r8, r9, lr, r12
        mov     r10, #0
        subs    r10, r10, r8
        umull   r10, r8, r12, r10
        mov     r10, #2, 2
        sbc     r10, r10, r9
        umull   r10, r12, r12, r10
        adds    r8, r8, r10
        adc     r10, r12, #0
        mov     r9, r8, lsl #2
        umull   r11, r12, lr, r9
        mov     r10, r10, lsl #2
        orr     r8, r10, r8, lsr #30
        umull   r7, r11, r8, r7
        umull   r7, r10, lr, r8
        adds    r11, r12, r11
        mov     r12, #0
        adc     r12, r12, #0
        adds    r7, r11, r7
        adc     r11, r12, r10
        mov     r12, #0
        subs    r12, r12, r7
        umull   r12, r10, r8, r12
        mov     r7, #2, 2
        sbc     r7, r7, r11
        umull   r9, r11, r7, r9
        umull   r7, r8, r8, r7
        adds    r12, r9, r12
        adc     r10, r11, r10
        and     r12, r12, #3
        adds    r7, r10, r7
        adc     r8, r8, #0
        orr     r12, r12, r7, lsl #2
        adds    lr, r12, lr, lsr #31
        mov     r7, r7, lsr #30
        orr     r8, r7, r8, lsl #2
        adc     r12, r8, #0
        cmp     r5, #0
        streq   lr, [sp, #0x30]
        streq   r12, [sp, #0x34]
        beq     LADY2
        rsbs    lr, lr, #0
        str     lr, [sp, #0x30]
        rsc     r12, r12, #0
        str     r12, [sp, #0x34]
LADY2:
        cmp     r3, #0x20
        mov     r5, #0x1F
        bcs     LADY3
        ldr     r2, [sp, #0x10]
        mov     r2, r1, lsl r2
        orr     r0, r2, r0, lsr r3
        mov     r3, r1, asr r3
        b       LADY4
LADY3:
        cmp     r3, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x54
        mov     r0, r1, asr r2
        mov     r3, r1, asr #31
LADY4:
        mov     r1, #0
        subs    r2, r1, r0
        mov     r0, #1, 2
        sbc     r0, r0, r3
        tst     r0, #1, 2
        mov     r7, #0x3E
        bne     LADY7
        cmp     r0, #0
        bne     LADY5
        cmp     r2, #0
        moveq   r1, #0
        beq     LADY6
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        clz     r0, r2
        mov     r2, r2, lsl r0
        add     r1, r0, #0x1F
        mov     r0, r2, lsr #1
        mov     r2, r2, lsl #31
        b       LADY6
LADY5:
        clz     r1, r0
        sub     r1, r1, #1
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x34]
        rsb     r3, r1, #0x20
        mov     r3, r2, lsr r3
        orr     r0, r3, r0, lsl r1
        mov     r2, r2, lsl r1
LADY6:
        add     r7, r1, #0x3E
LADY7:
        umull   r3, r1, r2, lr
        umull   r8, r2, r2, r12
        umull   lr, r3, lr, r0
        umull   r12, r0, r0, r12
        adds    r1, r8, r1
        adc     r2, r2, #0
        adds    r3, r12, r3
        adc     r0, r0, #0
        adds    lr, lr, r1
        adc     r2, r2, #0
        adds    r2, r2, r3
        adc     r1, r0, #0
        mov     r0, lr, lsr #31
        orr     r0, r0, r2, lsl #1
        mov     lr, lr, lsr #30
        and     lr, lr, #1
        mov     r2, r2, lsr #31
        adds    r0, r0, lr
        orr     r1, r2, r1, lsl #1
        adc     r1, r1, #0
        tst     r1, #1, 2
        bne     LADY8
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r7, r7, r2
        bl      __ashldi3
LADY8:
        ldr     r3, [pc, #0xA34]
        ldr     r8, [pc, #0xA34]
        mov     r2, r1, lsr #25
        sub     r2, r2, #0x20
        ldrb    lr, [r2, +r3]
        sub     r7, r7, r2, asr #4
        sub     r7, r7, #0xA
        str     r7, [sp, #4]
        umull   r12, r3, r0, lr
        umull   r1, r7, r1, lr
        ldrb    lr, [r2, +r8]
        add     r5, r5, #0x3E, 28
        ldr     r0, [pc, #0xA0C]
        mov     r8, r3, lsl #22
        and     r5, r12, r5
        orr     r12, r8, r12, lsr #10
        adds    r12, r12, r1, lsl #22
        mov     r1, r1, lsr #10
        orr     r7, r1, r7, lsl #22
        adc     r1, r7, r3, lsr #10
        ldr     r7, [r0, +r2, lsl #3]
        ldr     r3, [pc, #0x9EC]
        add     r2, r0, r2, lsl #3
        ldr     r0, [r2, #4]
        mov     r2, r1, lsr #17
        sub     r2, r2, #2, 24
        ldr     r8, [pc, #0x9DC]
        mov     r9, r2, lsl #1
        ldrh    r10, [r3, +r9]
        ldr     r3, [pc, #0x9D4]
        ldrb    r8, [r2, +r8]
        umull   r9, r12, r10, r12
        umull   r1, r11, r1, r10
        mul     r5, r5, r10
        ldr     r10, [pc, #0x9C0]
        str     r8, [sp, #0x14]
        ldr     r3, [r3, +r2, lsl #3]
        sub     r8, lr, #0x2B
        add     r2, r10, r2, lsl #3
        ldr     r2, [r2, #4]
        adds    r10, r9, #0
        adc     r1, r12, r1
        ldr     r12, [sp, #0x14]
        adds    r10, r10, r5, lsr #10
        str     r10, [sp, #0x14]
        rsb     lr, lr, #0x4B
        sub     r9, r12, #0x2B
        mov     r10, r0, lsr r8
        mov     r11, r2, lsr r9
        rsb     r12, r12, #0x4B
        orr     r10, r10, r7, lsl lr
        orr     r11, r11, r3, lsl r12
        adc     r1, r1, #0
        adds    r10, r10, r11
        mov     r9, r3, lsr r9
        adc     r8, r9, r7, asr r8
        mov     r12, r2, lsl r12
        adds    lr, r12, r0, lsl lr
        mov     r0, #0
        adc     r0, r0, #0
        adds    r10, r10, r0
        adc     r0, r8, r0, asr #31
        str     r0, [sp, #0x10]
        mov     r0, r1
        cmp     r0, #0
        str     lr, [sp, #8]
        str     r10, [sp, #0xC]
        rsblt   r0, r0, #0
        clz     r0, r0
        subs    r7, r0, #1
        subne   r7, r7, #1
        ldr     r0, [sp, #0x14]
        mov     r2, r7
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [pc, #0x920]
        mov     r12, #0x1F
        add     r12, r12, #0x3E, 28
        rsb     lr, r7, #0xA
        and     r12, r5, r12
        orr     r0, r0, r12, lsr lr
        str     r0, [sp, #0x14]
        add     r9, r1, r0, lsr #31
        smull   r10, r1, r9, r9
        str     r1, [sp, #0x18]
        smull   r0, r1, r9, r0
        ldr     r0, [pc, #0x8F8]
        str     r1, [sp, #0x1C]
        add     r8, r7, #7
        rsb     r0, r0, #0
        smull   r1, r0, r0, r9
        add     r3, r3, r0, asr r8
        ldr     r0, [sp, #0x18]
        add     r2, r7, #9
        add     r5, r7, #6
        adds    r11, r0, r10, lsr #31
        smull   r1, r0, r3, r11
        rsb     r1, r9, r0, asr r5
        rsb     r3, r8, #0x21
        mov     r0, r0, lsl r3
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r3, [pc, #0x8B8]
        mov     r2, r5
        adds    r0, r0, r3
        smull   r12, lr, r0, r11
        str     lr, [sp, #0x20]
        ldr     lr, [sp, #0x20]
        adc     r3, r1, r3
        adds    r0, r3, r0, lsr #31
        smull   r11, r1, r0, r11
        smull   r3, r0, r0, r10
        mov     r3, r5, asr #31
        mov     r5, r8, asr #31
        adds    r11, r11, r0
        adc     r1, r1, r0, asr #31
        adds    r0, r11, lr
        smull   r11, r12, r9, r0
        adc     lr, r1, lr, asr #31
        adds    r0, lr, r0, lsr #31
        smull   r0, r1, r9, r0
        add     lr, r7, #8
        str     lr, [sp, #0x20]
        mov     lr, lr, asr #31
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x1C]
        adds    r0, r0, r12
        adc     r1, r1, r12, asr #31
        mov     lr, lr, asr #31
        str     lr, [sp, #0x28]
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        subs    r0, r0, r10
        sbc     r1, r1, r12
        bl      __ashrdi3
        str     r0, [sp, #0x24]
        mov     r11, r1
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x28]
        mov     r2, r8
        mov     r3, r5
        bl      __ashrdi3
        mov     r10, r0
        smull   r12, r0, r9, r10
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x14]
        mov     r1, r0, asr #31
        adds    r12, r12, #0
        adc     r11, r11, r9
        adds    r9, r12, lr
        ldr     r12, [sp, #0x14]
        mov     r2, r8
        mov     r3, r5
        adc     r11, r11, r12, asr #31
        bl      __ashrdi3
        subs    r9, r9, r10
        sbc     r11, r11, r10, asr #31
        adds    r0, r9, r0
        adc     r1, r11, r1
        cmp     r8, #0xB
        blt     LADY9
        sub     r2, r7, #4
        mov     r3, #0
        bl      __ashrdi3
        mov     r5, r1, asr #31
        b       LADY10
LADY9:
        rsb     r2, r8, #0xB
        add     r7, r7, #0x1C
        mov     r5, r1, asr r7
        mov     r3, #0
        bl      __ashldi3
LADY10:
        ldr     r2, [sp, #0xC]
        ldr     r12, [pc, #0x79C]
        ldr     r3, [sp, #4]
        adds    r2, r2, r1
        ldr     r1, [sp, #0x10]
        ldr     r7, [r12]
        rsb     r3, r3, #0x34
        adc     r5, r1, r5
        ldr     r1, [sp, #8]
        adds    r1, r1, r0
        mov     r0, #0
        adc     r8, r0, #0
        adds    lr, r2, r8
        adc     r5, r5, r8, asr #31
        ldr     r8, [r12, #4]
        ldr     r2, [r12, #8]
        smull   r12, r7, r7, r3
        smull   r8, r9, r8, r3
        mul     r2, r2, r3
        mov     r3, #0
        adds    r8, r7, r8
        adc     r7, r9, r7, asr #31
        adds    r8, r8, #0
        adc     r2, r7, r2
        adds    r8, lr, r8
        adc     r2, r5, r2
        adds    r7, r1, r12
        adc     r1, r0, #0
        adds    r0, r8, r1
        adc     r1, r2, r1, asr #31
        eor     r2, r1, r1, asr #31
        sub     r2, r2, r1, asr #31
        clz     r5, r2
        sub     r2, r5, #1
        bl      __ashldi3
        rsb     r2, r5, #0x21
        bics    r6, r1, r6
        orr     r7, r0, r7, lsr r2
        add     r5, r5, #0x2B
        beq     LADY11
        rsbs    r7, r7, #0
        rsc     r1, r1, #0
LADY11:
        mov     r0, #0xFF
        orr     r0, r0, #3, 24
        add     r0, r0, #0x3D
        clz     r3, r1
        cmp     r3, #0x20
        rsb     r0, r5, r0
        beq     LADY43
LADY12:
        sub     r3, r3, #1
        rsb     r2, r3, #0x20
        mov     r2, r7, lsr r2
        orr     r2, r2, r1, lsl r3
        subs    r1, r0, r3
        mov     r7, r7, lsl r3
        bpl     LADY14
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADY13
        mov     r7, r2
        mov     r2, r2, asr #31
        sub     r1, r1, #0x20
LADY13:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r7, r7, lsr r1
        rsb     r0, r1, #0x20
        orr     r7, r7, r2, lsl r0
        mov     r2, r2, asr r1
        mov     r1, #0
LADY14:
        mov     r0, r7, lsr #9
        and     r3, r0, #1
        mov     r0, r2, lsl #22
        orr     r7, r0, r7, lsr #10
        adds    r0, r3, r7
        mov     r2, r2, lsr #10
        adc     r3, r2, r3, asr #31
        orrs    r2, r3, r3, asr #31
        moveq   r1, #0
        beq     LADY15
        sub     r4, r4, #1
        cmp     r4, r1
        bgt     LADY15
        mov     r1, #0x1F
        mov     r0, #0
        add     r1, r1, #0x7E, 28
        mov     r3, r0
LADY15:
        add     r1, r3, r1, lsl #20
        orr     r6, r1, r6
        ldr     r1, [sp]
        eor     r1, r6, r1
        b       LADY42
LADY16:
        cmp     r3, #0xF, 6
        bcc     LADY39
        movs    r1, r3, lsl #1
        and     r2, r3, r12
        moveq   r1, #2, 12
        orrne   r2, r2, #1, 12
        bics    r6, r3, r6
        beq     LADY17
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LADY17:
        ldr     lr, [pc, #0x60C]
        sub     r4, r4, #0xF3, 30
        mov     r3, r0, lsr #22
        orr     r12, r3, r2, lsl #10
        umull   r7, r8, r12, r12
        mov     r2, r0, lsl #10
        umull   r0, r6, r2, r2
        umull   r0, r3, r2, r12
        sub     r1, r4, r1, lsr #21
        str     r1, [sp, #8]
        adds    r6, r0, r6
        adc     r4, r3, #0
        adds    r7, r7, r3
        adc     r3, r8, #0
        adds    r6, r0, r6
        adc     r4, r4, #0
        adds    r4, r4, r7
        adc     r0, r3, #0
        mov     r3, r6, lsr #31
        orr     r3, r3, r4, lsl #1
        mov     r6, r6, lsr #30
        mov     r4, r4, lsr #31
        and     r6, r6, #1
        orr     r0, r4, r0, lsl #1
        adds    r3, r3, r6
        adc     r0, r0, #0
        umull   lr, r7, lr, r0
        umull   lr, r4, r2, r3
        umull   r9, lr, r3, r12
        str     r4, [sp, #0x28]
        umull   r10, r4, r2, r0
        ldr     r11, [sp, #0x28]
        umull   r6, r8, r12, r0
        str     r4, [sp, #0x24]
        add     r4, r1, #0xA
        adds    r9, r9, r11
        ldr     r11, [sp, #0x24]
        adc     lr, lr, #0
        mov     r1, r4, lsl #1
        sub     r1, r1, #0x3F
        adds    r6, r6, r11
        adc     r8, r8, #0
        adds    r9, r10, r9
        adc     lr, lr, #0
        adds    r6, lr, r6
        mov     lr, r9, lsr #31
        ldr     r11, [pc, #0x558]
        adc     r8, r8, #0
        orr     lr, lr, r6, lsl #1
        mov     r9, r9, lsr #30
        mov     r6, r6, lsr #31
        and     r9, r9, #1
        orr     r8, r6, r8, lsl #1
        sub     r10, r1, #0x41
        adds    lr, lr, r9
        adc     r6, r8, #0
        add     r10, r11, r7, asr r10
        umull   r10, r7, r0, r10
        str     r6, [sp]
        ldr     r6, [pc, #0x528]
        sub     r8, r1, #0x3F
        add     r9, r4, r1
        sub     r9, r9, #0x3F
        add     r8, r6, r7, asr r8
        umull   r6, r8, r0, r8
        sub     r7, r1, #0x40
        cmp     r7, #0x20
        str     r9, [sp, #4]
        bcs     LADY18
        rsb     r9, r1, #0x60
        mov     r9, r8, lsl r9
        orr     r6, r9, r6, lsr r7
        mov     r7, r8, asr r7
        b       LADY19
LADY18:
        cmp     r7, #0x40
        movcs   r6, #0x1F
        subcc   r6, r1, #0x60
        mov     r6, r8, asr r6
        mov     r7, r8, asr #31
LADY19:
        ldr     r8, [pc, #0x4DC]
        adds    r6, r6, r8
        umull   r8, r9, r0, r6
        ldr     r8, [pc, #0x4D4]
        adc     r7, r7, r8
        umull   r8, r11, r3, r7
        umull   r10, r8, r7, r0
        adds    r11, r9, r11
        mov     r9, #0
        adc     r9, r9, #0
        adds    r10, r10, r11
        adc     r9, r8, r9
        cmp     r0, #0
        blt     LADY49
LADY20:
        mov     r6, r10, lsr #31
        sub     r7, r1, #0x3F
        orr     r9, r6, r9, lsl #1
        cmp     r7, #0x20
        mov     r10, r10, lsl #1
        add     r6, r1, #3
        bcs     LADY21
        rsb     r8, r6, #0x62
        mov     r8, r9, lsl r8
        orr     r10, r8, r10, lsr r7
        mov     r8, r9, asr r7
        b       LADY22
LADY21:
        cmp     r7, #0x40
        movcs   r8, #0x1F
        subcc   r8, r1, #0x5F
        mov     r10, r9, asr r8
        mov     r8, r9, asr #31
LADY22:
        ldr     r9, [pc, #0x468]
        adds    r9, r10, r9
        str     r9, [sp, #0x10]
        umull   r9, r10, r0, r9
        ldr     r9, [pc, #0x45C]
        adc     r8, r8, r9
        umull   r9, r11, r3, r8
        str     r8, [sp, #0xC]
        umull   r8, r9, r8, r0
        adds    r11, r10, r11
        mov     r10, #0
        adc     r10, r10, #0
        adds    r8, r8, r11
        adc     r10, r9, r10
        cmp     r0, #0
        blt     LADY48
LADY23:
        mov     r9, r8, lsr #31
        cmp     r7, #0x20
        mov     r8, r8, lsl #1
        orr     r10, r9, r10, lsl #1
        bcs     LADY24
        rsb     r9, r6, #0x62
        mov     r9, r10, lsl r9
        orr     r8, r9, r8, lsr r7
        mov     r7, r10, asr r7
        b       LADY25
LADY24:
        cmp     r7, #0x40
        movcs   r7, #0x1F
        subcc   r7, r1, #0x5F
        mov     r8, r10, asr r7
        mov     r7, r10, asr #31
LADY25:
        ldr     r9, [pc, #0x3F4]
        adds    r9, r8, r9
        str     r9, [sp, #0x10]
        umull   r8, r9, r0, r9
        ldr     r8, [pc, #0x3E8]
        adc     r7, r7, r8
        umull   r8, r11, r3, r7
        umull   r10, r8, r7, r0
        adds    r11, r9, r11
        mov     r9, #0
        adc     r9, r9, #0
        adds    r10, r10, r11
        adc     r9, r8, r9
        cmp     r0, #0
        blt     LADY47
LADY26:
        sub     r7, r1, #0x3E
        mov     r8, r10, lsr #31
        cmp     r7, #0x20
        mov     r10, r10, lsl #1
        orr     r9, r8, r9, lsl #1
        bcs     LADY27
        rsb     r6, r6, #0x61
        mov     r6, r9, lsl r6
        orr     r10, r6, r10, lsr r7
        mov     r7, r9, asr r7
        b       LADY28
LADY27:
        cmp     r7, #0x40
        movcs   r6, #0x1F
        subcc   r6, r1, #0x5E
        mov     r10, r9, asr r6
        mov     r7, r9, asr #31
LADY28:
        ldr     r6, [pc, #0x380]
        adds    r6, r10, r6
        umull   r8, r9, r0, r6
        ldr     r8, [pc, #0x378]
        adc     r7, r7, r8
        umull   r8, r11, r3, r7
        umull   r10, r8, r7, r0
        adds    r11, r9, r11
        mov     r9, #0
        adc     r9, r9, #0
        adds    r10, r10, r11
        adc     r9, r8, r9
        cmp     r0, #0
        blt     LADY46
LADY29:
        sub     r6, r1, #0x3F
        mov     r7, r10, lsr #31
        cmp     r6, #0x20
        mov     r10, r10, lsl #1
        orr     r9, r7, r9, lsl #1
        add     r8, r1, #2
        bcs     LADY30
        rsb     r7, r8, #0x61
        mov     r7, r9, lsl r7
        orr     r10, r7, r10, lsr r6
        mov     r9, r9, asr r6
        b       LADY31
LADY30:
        cmp     r6, #0x40
        movcs   r6, #0x1F
        subcc   r6, r1, #0x5F
        mov     r10, r9, asr r6
        mov     r9, r9, asr #31
LADY31:
        ldr     r6, [pc, #0x30C]
        adds    r6, r10, r6
        umull   r7, r10, r0, r6
        ldr     r7, [pc, #0x2C8]
        adc     r7, r9, r7
        umull   r3, r11, r3, r7
        umull   r3, r9, r0, r7
        adds    r11, r10, r11
        mov     r10, #0
        adc     r10, r10, #0
        adds    r3, r3, r11
        adc     r10, r9, r10
        cmp     r0, #0
        blt     LADY45
LADY32:
        sub     r6, r1, #0x3E
        mov     r7, r3, lsr #31
        cmp     r6, #0x20
        mov     r0, #0x1F
        mov     r3, r3, lsl #1
        orr     r10, r7, r10, lsl #1
        bcs     LADY33
        rsb     r8, r8, #0x60
        mov     r8, r10, lsl r8
        orr     r3, r8, r3, lsr r6
        mov     r6, r10, asr r6
        b       LADY34
LADY33:
        cmp     r6, #0x40
        movcs   r1, r0
        subcc   r1, r1, #0x5E
        mov     r3, r10, asr r1
        mov     r6, r10, asr #31
LADY34:
        ldr     r7, [pc, #0x294]
        ldr     r1, [sp, #4]
        ldr     r9, [sp]
        adds    r3, r3, r7
        ldr     r7, [pc, #0x24C]
        add     r1, r1, #1
        sub     r1, r1, r4
        adc     r7, r6, r7
        umull   r6, r8, lr, r3
        umull   lr, r6, lr, r7
        adds    lr, lr, r8
        umull   r7, r8, r9, r7
        umull   r3, r9, r3, r9
        adc     r6, r6, #0
        adds    r7, r7, r9
        adc     r8, r8, #0
        adds    r9, r3, lr
        adc     r6, r6, #0
        adds    lr, r6, r7
        mov     r6, r9, lsr #31
        mov     r9, r9, lsr #30
        orr     r6, r6, lr, lsl #1
        adc     r3, r8, #0
        and     r9, r9, #1
        adds    r6, r6, r9
        mov     lr, lr, lsr #31
        orr     r3, lr, r3, lsl #1
        adc     r3, r3, #0
        cmp     r1, #0x20
        bcs     LADY35
        rsb     r0, r1, #0x20
        mov     r0, r3, lsl r0
        orr     r6, r0, r6, lsr r1
        mov     r1, r3, asr r1
        b       LADY36
LADY35:
        cmp     r1, #0x40
        subcc   r0, r1, #0x20
        mov     r6, r3, asr r0
        mov     r1, r3, asr #31
LADY36:
        adds    r2, r2, r6
        adc     r12, r12, r1
        tst     r12, r12
        strpl   r2, [sp, #0x30]
        strpl   r12, [sp, #0x34]
        bpl     LADY37
        mov     r0, r12, lsl #31
        orr     r2, r0, r2, lsr #1
        str     r2, [sp, #0x30]
        mov     r12, r12, lsr #1
        str     r12, [sp, #0x34]
        ldr     r0, [sp, #8]
        add     r4, r0, #9
LADY37:
        cmp     r12, #0
        clzeq   r2, r2
        addeq   r6, r2, #0x1F
        clzne   r12, r12
        subne   r6, r12, #1
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
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
        bmi     LADY44
LADY38:
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
        b       LADY42
LADY39:
        mov     r1, r2
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADY40:
        rsb     r1, r0, #0
        orr     r1, r0, r1
        orr     r1, r3, r1, lsr #31
        cmp     r1, r4, lsl #20
        orrhi   r5, r5, #2, 14
        orrhi   r1, r3, r5
        bhi     LADY42
        mov     r1, #0x1F
        add     r2, r1, #0x3E, 28
        sub     r3, r3, r2, lsl #20
        orrs    r3, r3, r0
        mov     r0, #0
        subne   r5, r0, #2, 14
        movne   r3, #0x83
        bne     LADY41
        add     r1, r1, #0x7E, 28
        mov     r3, #0x84
        orr     r5, r5, r1, lsl #20
LADY41:
        str     r0, [sp, #0x30]
        add     r2, sp, #0x30
        add     r1, sp, #0x38
        add     r0, sp, #0x38
        str     r5, [sp, #0x34]
        bl      __libm_error_support
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
LADY42:
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LADY43:
        clz     r2, r7
        cmp     r2, #0
        beq     LADY12
        mov     r1, r7
        sub     r0, r0, #0x20
        mov     r3, r2
        mov     r7, #0
        b       LADY12
LADY44:
        mov     r3, r1, lsl #31
        orr     r0, r3, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r4, r4, #1
        b       LADY38
LADY45:
        subs    r3, r3, r6
        sbc     r10, r10, r7
        b       LADY32
LADY46:
        subs    r10, r10, r6
        sbc     r9, r9, r7
        b       LADY29
LADY47:
        ldr     r8, [sp, #0x10]
        subs    r10, r10, r8
        sbc     r9, r9, r7
        b       LADY26
LADY48:
        ldr     r9, [sp, #0x10]
        subs    r8, r8, r9
        ldr     r9, [sp, #0xC]
        sbc     r10, r10, r9
        b       LADY23
LADY49:
        subs    r10, r10, r6
        sbc     r9, r9, r7
        b       LADY20
        .long   LADY_rcp63_table
        .long   LADY_r1_tbl
        .long   LADY_log_r1_scale
        .long   LADY_log_r1_tbl
        .long   LADY_r2_tbl
        .long   LADY_log_r2_scale
        .long   LADY_log_r2_tbl
        .long   0x66666666
        .long   0x55555555
        .long   LADY_LOG_2
        .long   0x47df84b9
        .long   0x73772618
        .long   0x44743632
        .long   0x789bbeed
        .long   0x4ec2c8da
        .long   0x46aa81df
        .long   0x5d1754c7
        .long   0xc4bc4d45
        .long   0x71c71c32
        .long   0x6f7c7835
        .long   0x49249249
        .long   0x660f2cdc
        .long   0x555566ce


        .data
        .align  4


LADY_rcp63_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41
LADY_r1_tbl:
        .byte   0x40,0x3F,0x3D,0x3B,0x39,0x38,0x36,0x35,0x34,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2C
        .byte   0x2B,0x2A,0x29,0x29,0x28,0x27,0x26,0x26,0x25,0x24,0x24,0x23,0x23,0x22,0x22,0x21
LADY_log_r1_scale:
        .byte   0x45,0x44,0x43,0x42,0x42,0x41,0x41,0x41,0x41,0x41,0x40,0x40,0x40,0x40,0x40,0x40
        .byte   0x40,0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x42,0x42,0x42,0x42,0x43,0x43,0x44
LADY_log_r1_tbl:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x62,0x59,0x81,0x40,0x28,0x1D,0x61,0x4D
        .byte   0x52,0xA8,0x52,0x62,0xD4,0x0C,0xCD,0x7E,0x74,0x45,0x4C,0x53,0x77,0xB1,0xFA,0x81
        .byte   0x8E,0x9D,0x9C,0x76,0x40,0x89,0x1A,0x11,0x08,0x3A,0x5E,0x44,0x79,0xEF,0x91,0x9F
        .byte   0xAD,0x01,0xFD,0x56,0xEE,0xC7,0xF6,0x50,0x95,0x05,0x8F,0x60,0xEE,0x06,0x8F,0x46
        .byte   0xF2,0xB4,0x4F,0x6A,0xBD,0x8D,0x67,0x2B,0xB2,0x71,0x64,0x7E,0xF6,0xE5,0xCD,0xCE
        .byte   0x08,0x3A,0x5E,0x44,0x79,0xEF,0x91,0x9F,0x44,0x88,0xA5,0x49,0xE1,0x49,0x6E,0xD3
        .byte   0xDC,0x49,0x09,0x4F,0xD5,0x0E,0xC6,0xCC,0x1C,0xB8,0x8A,0x54,0x38,0x5F,0x8F,0xE2
        .byte   0xFA,0x20,0x2B,0x5A,0x6A,0x50,0xA8,0x71,0xEF,0xE8,0xEB,0x5F,0xB8,0x6F,0x54,0x60
        .byte   0x14,0x75,0x5C,0xB4,0x8F,0x3D,0x8B,0x7B,0x51,0x8D,0x62,0xBA,0xF2,0xC7,0x67,0x51
        .byte   0x4A,0x9E,0x1B,0x81,0xCB,0x55,0x07,0x87,0x4A,0x9E,0x1B,0x81,0xCB,0x55,0x07,0x87
        .byte   0xE1,0x20,0xC0,0x8D,0x4F,0x79,0x97,0x95,0x8C,0x95,0xB6,0x9A,0x27,0x2E,0xA5,0x2E
        .byte   0x3D,0x3E,0x03,0xA8,0xDE,0xB0,0xB0,0x61,0x3D,0x3E,0x03,0xA8,0xDE,0xB0,0xB0,0x61
        .byte   0x1F,0xB4,0xAA,0xB5,0xD0,0x72,0x2B,0x80,0x47,0xE2,0x63,0x87,0x58,0x68,0x34,0x54
        .byte   0x47,0xE2,0x63,0x87,0x58,0x68,0x34,0x54,0xD4,0xB5,0x3C,0xA4,0x90,0xD1,0x52,0x6A
        .byte   0xD4,0xB5,0x3C,0xA4,0x90,0xD1,0x52,0x6A,0xFF,0x3C,0xD7,0x83,0x7A,0x66,0x75,0xBA
        .byte   0xFF,0x3C,0xD7,0x83,0x7A,0x66,0x75,0xBA,0xC6,0x93,0xF5,0x81,0xCC,0xFE,0x33,0x1F
LADY_r2_tbl:
        .byte   0xF8,0x1F,0xE8,0x1F,0xD8,0x1F,0xC8,0x1F,0xB9,0x1F,0xA9,0x1F,0x99,0x1F,0x8A,0x1F
        .byte   0x7A,0x1F,0x6B,0x1F,0x5B,0x1F,0x4C,0x1F,0x3D,0x1F,0x2E,0x1F,0x1E,0x1F,0x0F,0x1F
        .byte   0x00,0x1F,0xF1,0x1E,0xE2,0x1E,0xD3,0x1E,0xC5,0x1E,0xB6,0x1E,0xA7,0x1E,0x99,0x1E
        .byte   0x8A,0x1E,0x7B,0x1E,0x6D,0x1E,0x5E,0x1E,0x50,0x1E,0x42,0x1E,0x33,0x1E,0x25,0x1E
LADY_log_r2_scale:
        .byte   0x48,0x47,0x46,0x46,0x45,0x45,0x45,0x45,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
        .byte   0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43
LADY_log_r2_tbl:
        .byte   0x55,0x01,0x08,0x40,0xCD,0x24,0x62,0x95,0x0A,0x12,0x24,0x60,0xA6,0x01,0x17,0x26
        .byte   0xD1,0x29,0x32,0x50,0x1E,0x87,0xE3,0xE1,0xEC,0x72,0x62,0x70,0xBB,0xEA,0x9F,0x38
        .byte   0x45,0x39,0x4F,0x47,0xCE,0x58,0x7D,0x25,0x14,0x1C,0x77,0x57,0xA1,0xB9,0x37,0x15
        .byte   0x18,0x2B,0xA7,0x67,0xAD,0x2D,0xD5,0x01,0xAF,0xAC,0xDB,0x76,0x20,0x0C,0x73,0xC1
        .byte   0x7C,0xD4,0x8D,0x43,0xE9,0x0F,0xD1,0x93,0xDB,0x93,0x2F,0x4B,0xED,0x72,0x5B,0x31
        .byte   0x5D,0x98,0x57,0x53,0xB6,0x11,0x32,0xAB,0x24,0xE5,0x00,0x5B,0x34,0x7B,0xDF,0x38
        .byte   0xCF,0xDE,0xAD,0x62,0x5E,0xD2,0xBA,0xF5,0xE9,0x88,0x5E,0x6A,0xAF,0xD4,0x47,0x54
        .byte   0x86,0x86,0x96,0x72,0x6E,0x97,0x4F,0x18,0xB9,0xDB,0x4E,0x7A,0x6E,0x6F,0xD9,0x07
        .byte   0x27,0x76,0x05,0x41,0xC0,0x11,0x11,0x9D,0xF3,0x5D,0xE5,0x44,0xEC,0x8A,0x70,0x10
        .byte   0x10,0x27,0xC7,0x48,0xD4,0x71,0x81,0x38,0x53,0xD3,0xAA,0x4C,0x97,0xA3,0x72,0x16
        .byte   0x4B,0xD4,0x4D,0x50,0x85,0x57,0x1B,0xDF,0xDD,0x2B,0x35,0x54,0xDF,0xBE,0xA1,0x72
        .byte   0x01,0x6C,0x1E,0x58,0x49,0xE4,0xFF,0x08,0x94,0xA6,0xC6,0x5B,0x34,0x56,0x27,0xFF
        .byte   0x99,0x9C,0xB3,0x5F,0x9D,0x6B,0x44,0xF3,0xB4,0x80,0xA2,0x63,0xAC,0xEC,0xC5,0xB8
        .byte   0xFD,0x03,0x50,0x67,0x22,0x04,0x96,0x20,0xB9,0xA8,0x42,0x6B,0x49,0x9A,0x3B,0xE1
        .byte   0xF1,0xAF,0xF3,0x6E,0xF3,0x80,0xD0,0xA3,0x05,0x6C,0xA6,0x72,0xB4,0x48,0x22,0xCD
        .byte   0x66,0xAE,0x9E,0x76,0x6F,0xDC,0xDF,0x2D,0x71,0xF8,0x54,0x7A,0xA1,0xC2,0x80,0x21
LADY_LOG_2:
        .byte   0x4F,0x5E,0xCD,0x7B,0x8E,0xBE,0xBF,0x90,0x8C,0x05,0x00,0x00


