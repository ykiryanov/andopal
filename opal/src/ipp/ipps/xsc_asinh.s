        .text
        .align  4
        .globl  asinh


asinh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r2, #0xFF
        mvn     lr, #2, 2
        orr     r3, r2, #7, 24
        bic     r5, r1, lr
        eor     r2, r1, r5
        cmp     r2, r3, lsl #20
        bcs     LAEE39
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r4, r12, #0xB, 14
        cmp     r4, r2
        mvn     r4, #0xFF, 12
        bic     r4, r4, #0xF, 4
        bhi     LAEE20
        and     r1, r2, r4
        movs    r4, r2, lsl #1
        moveq   r4, #2, 12
        orrne   r1, r1, #1, 12
        bics    lr, r2, lr
        beq     LAEE0
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAEE0:
        add     r12, r12, #0x3F, 12
        cmp     r12, r2
        sub     r12, r3, #0xF3, 30
        mov     r3, r0, lsr #22
        sub     r12, r12, r4, lsr #21
        orr     r4, r3, r1, lsl #10
        mov     r7, r0, lsl #10
        addls   r6, r12, #9
        bls     LAEE12
        umull   r3, r6, r7, r7
        umull   r3, r10, r7, r4
        umull   r9, lr, r4, r4
        add     r8, r12, #0xA
        adds    r6, r3, r6
        adc     r12, r10, #0
        adds    r10, r9, r10
        adc     r9, lr, #0
        adds    r6, r3, r6
        adc     r12, r12, #0
        adds    lr, r12, r10
        mov     r12, r6, lsr #31
        adc     r3, r9, #0
        orr     r12, r12, lr, lsl #1
        mov     r6, r6, lsr #30
        mov     lr, lr, lsr #31
        and     r6, r6, #1
        orr     r3, lr, r3, lsl #1
        adds    r12, r12, r6
        mov     lr, #0xFF
        orr     lr, lr, #3, 24
        mov     r6, r8, lsl #1
        adc     r3, r3, #0
        cmp     r2, lr, lsl #20
        sub     r6, r6, #0x3F
        mov     r10, #0x1F
        bcs     LAEE3
        sub     r2, r6, #0x3E
        cmp     r2, #0x20
        bcs     LAEE1
        rsb     r6, r6, #0x5E
        mov     r6, r3, lsl r6
        orr     r12, r6, r12, lsr r2
        mov     r2, r3, asr r2
        b       LAEE2
LAEE1:
        cmp     r2, #0x40
        subcc   r10, r6, #0x5E
        mov     r12, r3, asr r10
        mov     r2, r3, asr #31
LAEE2:
        adds    r0, r12, #0
        adc     r1, r2, #1, 2
        tst     r1, r1
        mov     r6, #0x3E
        bpl     LAEE6
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        mov     r6, #0x3D
        b       LAEE6
LAEE3:
        rsb     lr, r6, #0x3E
        cmp     lr, #0x20
        mov     r2, #0
        mov     r9, #1, 2
        bcs     LAEE4
        rsb     r10, lr, #0x20
        mov     r10, r9, lsl r10
        orr     r10, r10, r2, lsr lr
        mov     r2, r9, asr lr
        b       LAEE5
LAEE4:
        cmp     lr, #0x40
        subcc   r10, lr, #0x20
        mov     r10, r9, asr r10
LAEE5:
        adds    r0, r12, r10
        adc     r1, r3, r2
        tst     r1, r1
        bpl     LAEE6
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r6, r6, #1
LAEE6:
        tst     r1, #1, 2
        bne     LAEE7
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r2, r2, #0x1F
        clzne   r2, r1
        subne   r2, r2, #1
        mov     r3, r2, asr #31
        add     r6, r6, r2
        bl      __ashldi3
LAEE7:
        ldr     r3, [pc, #0xA30]
        mov     r2, r1, asr #31
        mov     lr, r1
        and     r12, r6, #1
        mov     r9, r2, lsl #9
        orr     r9, r9, lr, lsr #23
        mvn     r10, #0x7F
        adds    r9, r9, r12, lsl #7
        adds    r10, r9, r10
        ldrb    r3, [r10, +r3]
        cmp     r12, #0
        add     r3, r3, #1, 24
        beq     LAEE8
        mov     r12, r0, lsr #31
        orr     r1, r12, r1, lsl #1
        mov     r0, r0, lsl #1
LAEE8:
        mul     r10, r3, r3
        mov     r9, r1, lsr #12
        sub     r12, r0, #1
        mla     r10, r10, r9, r10
        mov     r10, r10, asr #14
        mla     r10, r3, r10, r3
        rsb     r3, r10, r3, lsl #23
        mov     r10, r3, lsr #19
        mul     r9, r10, r9
        umull   r11, r10, r9, r9
        subs    r11, r0, r11
        sbc     r10, r1, r10
        umull   r10, r11, r3, r10
        adds    r9, r9, r11
        umull   r11, r10, r9, r9
        subs    r0, r0, r11
        umull   r0, r11, r3, r0
        sbc     r1, r1, r10
        umull   r10, r0, r3, r1
        adds    r10, r10, #0
        adc     r9, r0, r9
        adds    r11, r11, r10
        adc     r9, r9, #0
        mul     r1, r9, r9
        umull   r0, r10, r9, r11
        sub     r1, r12, r1
        subs    r1, r1, r10, lsl #1
        movmi   r1, #0
        umull   r10, r0, r3, r1
        adds    r10, r11, r0
        adc     r9, r9, #0
        mul     r1, r9, r9
        umull   r0, r11, r9, r10
        sub     r12, r12, r1
        subs    r12, r12, r11, lsl #1
        movmi   r12, #0
        umull   r3, r12, r3, r12
        adds    r10, r10, r12
        mov     r3, r2, lsl #2
        adc     r9, r9, #0
        orr     lr, r3, lr, lsr #30
        rsb     r6, r6, #0x3E
        mov     r3, r9, lsl #31
        orr     r10, r3, r10, lsr #1
        mov     r6, r6, asr #1
        adds    r3, lr, r10
        rsb     r6, r6, #0x3E
        sub     r8, r8, r6
        mov     r9, r9, lsr #1
        adc     r2, r9, r2, asr #30
        cmp     r8, #0x20
        bcs     LAEE9
        rsb     r12, r8, #0x20
        mov     r12, r4, lsl r12
        orr     r7, r12, r7, lsr r8
        mov     r8, r4, asr r8
        b       LAEE10
LAEE9:
        cmp     r8, #0x40
        movcs   r8, #0x1F
        subcc   r8, r8, #0x20
        mov     r7, r4, asr r8
        mov     r8, r4, asr #31
LAEE10:
        adds    r7, r3, r7
        adc     r4, r2, r8
        tst     r4, r4
        bpl     LAEE11
        mov     r2, r4, lsl #31
        orr     r7, r2, r7, lsr #1
        mov     r4, r4, lsr #1
        sub     r6, r6, #1
LAEE11:
        tst     r4, #1, 2
        bne     LAEE12
        cmp     r4, #0
        clzeq   r2, r7
        addeq   r8, r2, #0x1F
        clzne   r2, r4
        subne   r8, r2, #1
        mov     r3, r8, asr #31
        mov     r0, r7
        mov     r1, r4
        mov     r2, r8
        bl      __ashldi3
        add     r6, r6, r8
        mov     r7, r0
        mov     r4, r1
LAEE12:
        ldr     r2, [pc, #0x8A0]
        mov     r3, r4, lsr #25
        sub     r3, r3, #0x20
        ldrb    lr, [r3, +r2]
        ldr     r2, [pc, #0x894]
        ldr     r9, [pc, #0x894]
        umull   r7, r0, r7, lr
        umull   lr, r8, r4, lr
        ldrb    r2, [r3, +r2]
        ldr     r12, [pc, #0x888]
        sub     r6, r6, r3, asr #4
        sub     r6, r6, #0xA
        str     r6, [sp]
        ldr     r4, [r9, +r3, lsl #3]
        mov     r1, r0, lsl #22
        orr     r1, r1, r7, lsr #10
        adds    r1, r1, lr, lsl #22
        mov     lr, lr, lsr #10
        orr     r8, lr, r8, lsl #22
        add     r3, r9, r3, lsl #3
        ldr     r9, [pc, #0x860]
        ldr     r3, [r3, #4]
        adc     r8, r8, r0, lsr #10
        ldr     r0, [pc, #0x858]
        mov     lr, r8, lsr #17
        sub     r6, lr, #2, 24
        ldr     lr, [r9, +r6, lsl #3]
        ldrb    r0, [r6, +r0]
        add     r9, r9, r6, lsl #3
        mov     r6, r6, lsl #1
        ldrh    r6, [r12, +r6]
        ldr     r12, [r9, #4]
        mov     r9, #0x1F
        umull   r8, r10, r8, r6
        umull   r1, r10, r6, r1
        add     r9, r9, #0x3E, 28
        and     r9, r7, r9
        mul     r6, r9, r6
        adds    r1, r1, #0
        adc     r10, r10, r8
        sub     r7, r0, #0x2B
        rsb     r8, r0, #0x4B
        adds    r0, r1, r6, lsr #10
        sub     r9, r2, #0x2B
        adc     r1, r10, #0
        mov     r10, r3, lsr r9
        mov     r11, r12, lsr r7
        rsb     r2, r2, #0x4B
        orr     r10, r10, r4, lsl r2
        orr     r11, r11, lr, lsl r8
        adds    r10, r10, r11
        mov     r7, lr, lsr r7
        adc     r9, r7, r4, asr r9
        mov     r8, r12, lsl r8
        adds    r2, r8, r3, lsl r2
        str     r2, [sp, #0xC]
        mov     r2, #0
        adc     r2, r2, #0
        adds    r10, r10, r2
        adc     r2, r9, r2, asr #31
        str     r2, [sp, #4]
        mov     r2, r1
        cmp     r2, #0
        str     r10, [sp, #8]
        rsblt   r2, r2, #0
        clz     r2, r2
        subs    r4, r2, #1
        subne   r4, r4, #1
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [pc, #0x79C]
        mov     r12, #0x1F
        add     r12, r12, #0x3E, 28
        and     r12, r6, r12
        rsb     lr, r4, #0xA
        orr     r9, r0, r12, lsr lr
        add     r7, r4, #7
        add     r8, r1, r9, lsr #31
        smull   r10, r0, r8, r8
        str     r0, [sp, #0x10]
        smull   r0, r1, r8, r9
        ldr     r0, [pc, #0x774]
        str     r1, [sp, #0x14]
        add     r6, r4, #6
        rsb     r0, r0, #0
        smull   r1, r0, r0, r8
        add     r3, r3, r0, asr r7
        ldr     r0, [sp, #0x10]
        add     r2, r4, #9
        adds    r11, r0, r10, lsr #31
        smull   r1, r0, r3, r11
        rsb     r3, r7, #0x21
        rsb     r1, r8, r0, asr r6
        mov     r0, r0, lsl r3
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r3, [pc, #0x738]
        adds    r0, r0, r3
        smull   r12, lr, r0, r11
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x18]
        adc     r3, r1, r3
        adds    r0, r3, r0, lsr #31
        smull   r11, r1, r0, r11
        smull   r3, r0, r0, r10
        mov     r3, r6, asr #31
        mov     r2, r6
        adds    r11, r11, r0
        adc     r1, r1, r0, asr #31
        adds    r0, r11, lr
        smull   r11, r12, r8, r0
        adc     lr, r1, lr, asr #31
        adds    r0, lr, r0, lsr #31
        smull   r0, r1, r8, r0
        add     lr, r4, #8
        str     lr, [sp, #0x18]
        mov     lr, lr, asr #31
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x14]
        adds    r0, r0, r12
        adc     r1, r1, r12, asr #31
        mov     lr, lr, asr #31
        str     lr, [sp, #0x20]
        bl      __ashrdi3
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        subs    r0, r0, r10
        sbc     r1, r1, r12
        bl      __ashrdi3
        str     r1, [sp, #0x1C]
        mov     r11, r0
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x20]
        mov     r6, r7, asr #31
        mov     r2, r7
        mov     r3, r6
        bl      __ashrdi3
        mov     r10, r0
        smull   r1, r0, r8, r10
        ldr     r1, [sp, #0x1C]
        adds    r11, r11, #0
        mov     r2, r7
        adc     r12, r1, r8
        mov     r1, r0, asr #31
        adds    r8, r11, r9
        mov     r3, r6
        adc     r9, r12, r9, asr #31
        bl      __ashrdi3
        subs    r8, r8, r10
        sbc     r9, r9, r10, asr #31
        adds    r0, r8, r0
        adc     r1, r9, r1
        cmp     r7, #0xB
        blt     LAEE13
        sub     r2, r4, #4
        mov     r3, #0
        bl      __ashrdi3
        mov     r4, r1, asr #31
        b       LAEE14
LAEE13:
        add     r4, r4, #0x1C
        rsb     r2, r7, #0xB
        mov     r4, r1, asr r4
        mov     r3, #0
        bl      __ashldi3
LAEE14:
        ldr     r2, [sp, #8]
        ldr     r6, [pc, #0x624]
        adds    r12, r2, r1
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
        ldr     r7, [r6]
        ldr     r3, [r6, #4]
        adc     lr, r1, r4
        ldr     r1, [sp, #0xC]
        ldr     r8, [r6, #8]
        rsb     r2, r2, #0x34
        adds    r1, r1, r0
        mov     r0, #0
        adc     r4, r0, #0
        adds    r12, r12, r4
        adc     r6, lr, r4, asr #31
        mul     lr, r8, r2
        smull   r4, r7, r7, r2
        smull   r2, r8, r3, r2
        mov     r3, #0
        adds    r2, r7, r2
        adc     r7, r8, r7, asr #31
        adds    r2, r2, #0
        adc     lr, r7, lr
        adds    r2, r12, r2
        adc     lr, r6, lr
        adds    r6, r1, r4
        adc     r1, r0, #0
        adds    r0, r2, r1
        adc     r1, lr, r1, asr #31
        eor     r2, r1, r1, asr #31
        sub     r2, r2, r1, asr #31
        clz     r4, r2
        sub     r2, r4, #1
        bl      __ashldi3
        mvn     r2, #2, 2
        rsb     r3, r4, #0x21
        bics    r2, r1, r2
        orr     r6, r0, r6, lsr r3
        add     r4, r4, #0x2A
        beq     LAEE15
        rsbs    r6, r6, #0
        rsc     r1, r1, #0
LAEE15:
        mov     r0, #0xFF
        orr     r0, r0, #3, 24
        add     r0, r0, #0x3D
        clz     r12, r1
        cmp     r12, #0x20
        rsb     r0, r4, r0
        beq     LAEE41
LAEE16:
        sub     r12, r12, #1
        rsb     r3, r12, #0x20
        mov     r3, r6, lsr r3
        orr     r1, r3, r1, lsl r12
        subs    r3, r0, r12
        mov     r6, r6, lsl r12
        bpl     LAEE18
        rsb     r3, r3, #0
        cmp     r3, #0x20
        blt     LAEE17
        mov     r6, r1
        mov     r1, r1, asr #31
        sub     r3, r3, #0x20
LAEE17:
        cmp     r3, #0x20
        mov     r0, #0x20
        movgt   r3, r0
        mov     r6, r6, lsr r3
        rsb     r0, r3, #0x20
        orr     r6, r6, r1, lsl r0
        mov     r1, r1, asr r3
        mov     r3, #0
LAEE18:
        mov     r0, r6, lsr #9
        and     r12, r0, #1
        mov     r0, r1, lsl #22
        orr     r6, r0, r6, lsr #10
        adds    r0, r12, r6
        mov     r1, r1, lsr #10
        adc     r12, r1, r12, asr #31
        orrs    r1, r12, r12, asr #31
        moveq   r3, #0
        beq     LAEE19
        mov     r1, #0xFF
        orr     r1, r1, #7, 24
        sub     r1, r1, #1
        cmp     r1, r3
        bgt     LAEE19
        mov     r0, #0
        mov     r1, #0x1F
        add     r3, r1, #0x7E, 28
        mov     r12, r0
LAEE19:
        add     r3, r12, r3, lsl #20
        orr     r2, r3, r2
        orr     r1, r5, r2
        b       LAEE40
LAEE20:
        ldr     r12, [pc, #0x4B4]
        cmp     r12, r2
        bhi     LAEE38
        movs    r12, r2, lsl #1
        and     r6, r2, r4
        moveq   r12, #2, 12
        orrne   r6, r6, #1, 12
        bics    lr, r2, lr
        beq     LAEE21
        rsbs    r0, r0, #0
        rsc     r6, r6, #0
LAEE21:
        ldr     r1, [pc, #0x48C]
        sub     r4, r3, #0xF3, 30
        mov     r2, r0, lsr #22
        orr     r6, r2, r6, lsl #10
        umull   r7, r8, r6, r6
        mov     r3, r0, lsl #10
        umull   r0, lr, r3, r3
        umull   r2, r0, r3, r6
        sub     r4, r4, r12, lsr #21
        add     r4, r4, #0xA
        adds    lr, r2, lr
        adc     r12, r0, #0
        adds    r7, r7, r0
        adc     r0, r8, #0
        adds    lr, r2, lr
        adc     r12, r12, #0
        adds    r2, r12, r7
        mov     r12, lr, lsr #31
        adc     r0, r0, #0
        mov     lr, lr, lsr #30
        orr     r12, r12, r2, lsl #1
        mov     r2, r2, lsr #31
        and     lr, lr, #1
        orr     r0, r2, r0, lsl #1
        adds    lr, r12, lr
        adc     r2, r0, #0
        umull   r1, r0, r1, r2
        str     r0, [sp, #0x20]
        umull   r0, r12, r3, lr
        umull   r11, r0, lr, r6
        umull   r10, r7, r3, r2
        umull   r8, r9, r2, r6
        mov     r1, r4, lsl #1
        sub     r1, r1, #0x3F
        adds    r12, r11, r12
        adc     r0, r0, #0
        adds    r7, r8, r7
        adc     r9, r9, #0
        adds    r12, r10, r12
        adc     r0, r0, #0
        adds    r7, r0, r7
        ldr     r11, [pc, #0x3EC]
        ldr     r10, [sp, #0x20]
        adc     r0, r9, #0
        mov     r9, r12, lsr #31
        sub     r8, r1, #0x3F
        mov     r12, r12, lsr #30
        orr     r9, r9, r7, lsl #1
        sub     r8, r11, r10, asr r8
        umull   r10, r8, r2, r8
        and     r12, r12, #1
        adds    r12, r9, r12
        ldr     r9, [pc, #0x3C4]
        mov     r7, r7, lsr #31
        orr     r0, r7, r0, lsl #1
        sub     r7, r1, #0x40
        sub     r9, r9, r8, asr r7
        umull   r8, r9, r2, r9
        add     r10, r4, r1
        sub     r10, r10, #0x3F
        adc     r0, r0, #0
        cmp     r7, #0x20
        str     r10, [sp, #0xC]
        bcs     LAEE22
        rsb     r10, r1, #0x60
        mov     r10, r9, lsl r10
        orr     r8, r10, r8, lsr r7
        mov     r7, r9, asr r7
        b       LAEE23
LAEE22:
        cmp     r7, #0x40
        movcs   r7, #0x1F
        subcc   r7, r1, #0x60
        mov     r8, r9, asr r7
        mov     r7, r9, asr #31
LAEE23:
        ldr     r9, [pc, #0x370]
        subs    r8, r9, r8
        ldr     r9, [pc, #0x36C]
        sbc     r7, r9, r7
        umull   r9, r10, r2, r8
        umull   r9, r11, lr, r7
        str     r7, [sp, #4]
        umull   r7, r9, r7, r2
        adds    r11, r10, r11
        mov     r10, #0
        adc     r10, r10, #0
        adds    r7, r7, r11
        adc     r10, r9, r10
        cmp     r2, #0
        blt     LAEE46
LAEE24:
        mov     r9, r7, lsr #31
        sub     r8, r1, #0x3E
        orr     r10, r9, r10, lsl #1
        cmp     r8, #0x20
        mov     r7, r7, lsl #1
        add     r9, r1, #5
        bcs     LAEE25
        rsb     r9, r9, #0x63
        mov     r9, r10, lsl r9
        orr     r7, r9, r7, lsr r8
        mov     r10, r10, asr r8
        b       LAEE26
LAEE25:
        cmp     r8, #0x40
        movcs   r7, #0x1F
        subcc   r7, r1, #0x5E
        mov     r7, r10, asr r7
        mov     r10, r10, asr #31
LAEE26:
        ldr     r8, [pc, #0x2F8]
        subs    r8, r8, r7
        ldr     r7, [pc, #0x2F4]
        sbc     r7, r7, r10
        umull   r9, r10, r2, r8
        umull   r9, r11, lr, r7
        str     r7, [sp, #4]
        umull   r7, r9, r7, r2
        adds    r11, r10, r11
        mov     r10, #0
        adc     r10, r10, #0
        adds    r7, r7, r11
        adc     r10, r9, r10
        cmp     r2, #0
        blt     LAEE45
LAEE27:
        mov     r9, r7, lsr #31
        sub     r8, r1, #0x3E
        orr     r10, r9, r10, lsl #1
        cmp     r8, #0x20
        mov     r7, r7, lsl #1
        add     r9, r1, #4
        bcs     LAEE28
        rsb     r9, r9, #0x62
        mov     r9, r10, lsl r9
        orr     r7, r9, r7, lsr r8
        mov     r10, r10, asr r8
        b       LAEE29
LAEE28:
        cmp     r8, #0x40
        movcs   r7, #0x1F
        subcc   r7, r1, #0x5E
        mov     r7, r10, asr r7
        mov     r10, r10, asr #31
LAEE29:
        ldr     r8, [pc, #0x280]
        subs    r8, r8, r7
        ldr     r7, [pc, #0x27C]
        sbc     r7, r7, r10
        umull   r9, lr, lr, r7
        umull   r9, r10, r2, r8
        adds    r9, r10, lr
        umull   r11, r10, r2, r7
        mov     lr, #0
        adc     lr, lr, #0
        adds    r9, r11, r9
        adc     r10, r10, lr
        cmp     r2, #0
        blt     LAEE44
LAEE30:
        mov     r2, r9, lsr #31
        sub     lr, r1, #0x3E
        cmp     lr, #0x20
        orr     r2, r2, r10, lsl #1
        mov     r9, r9, lsl #1
        mov     r7, #0x1F
        add     r8, r1, #3
        bcs     LAEE31
        rsb     r8, r8, #0x61
        mov     r8, r2, lsl r8
        orr     r9, r8, r9, lsr lr
        mov     r1, r2, asr lr
        b       LAEE32
LAEE31:
        cmp     lr, #0x40
        movcs   r1, #0x1F
        subcc   r1, r1, #0x5E
        mov     r9, r2, asr r1
        mov     r1, r2, asr #31
LAEE32:
        ldr     r2, [pc, #0x208]
        ldr     r8, [pc, #0x1D4]
        subs    r2, r2, r9
        umull   r9, lr, r0, r2
        sbc     r1, r8, r1
        umull   r12, r8, r12, r1
        adds    r12, lr, r8
        umull   r9, lr, r0, r1
        mov     r8, #0
        adc     r8, r8, #0
        adds    r12, r9, r12
        adc     lr, lr, r8
        cmp     r0, #0
        blt     LAEE43
LAEE33:
        ldr     r0, [sp, #0xC]
        mov     r1, r12, lsr #31
        orr     lr, r1, lr, lsl #1
        add     r0, r0, #2
        sub     r0, r0, r4
        cmp     r0, #0x20
        mov     r12, r12, lsl #1
        bcs     LAEE34
        rsb     r1, r0, #0x20
        mov     r1, lr, lsl r1
        orr     r12, r1, r12, lsr r0
        mov     lr, lr, asr r0
        b       LAEE35
LAEE34:
        cmp     r0, #0x40
        movcs   r0, #0x1F
        subcc   r0, r0, #0x20
        mov     r12, lr, asr r0
        mov     lr, lr, asr #31
LAEE35:
        subs    r0, r3, r12
        sbc     r1, r6, lr
        tst     r1, #1, 2
        bne     LAEE36
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r6, r2, #0x1F
        clzne   r2, r1
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        add     r4, r4, r6
LAEE36:
        cmp     r1, #0
        clzeq   r2, r0
        addeq   r6, r2, #0x1F
        clzne   r2, r1
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        mov     r3, #0xFF
        orr     r3, r3, #3, 24
        and     r2, r0, #2, 24
        bic     r3, r0, r3
        mov     r2, r2, lsl #1
        adds    r0, r3, r2
        adc     r1, r1, r2, asr #31
        tst     r1, r1
        add     r4, r4, r6
        bmi     LAEE42
LAEE37:
        add     r2, r7, #0x3E, 28
        add     r2, r2, #0x3D
        add     r7, r7, #0x7E, 28
        rsb     r2, r4, r2
        and     r7, r2, r7
        mov     r2, r1, asr #10
        mov     r1, r1, lsl #22
        add     r2, r2, r7, lsl #20
        orr     r0, r1, r0, lsr #10
        orr     r1, r2, r5
        b       LAEE40
LAEE38:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LAEE39:
        orr     r1, r0, r2, lsl #12
        rsb     r3, r1, #0
        orr     r3, r1, r3
        mov     r1, r3, asr #12
        and     r1, r1, #2, 14
        orr     r1, r5, r1
        orr     r1, r2, r1
LAEE40:
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LAEE41:
        clz     r3, r6
        cmp     r3, #0
        beq     LAEE16
        mov     r1, r6
        sub     r0, r0, #0x20
        mov     r12, r3
        mov     r6, #0
        b       LAEE16
LAEE42:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r4, r4, #1
        b       LAEE37
LAEE43:
        subs    r12, r12, r2
        sbc     lr, lr, r1
        b       LAEE33
LAEE44:
        subs    r9, r9, r8
        sbc     r10, r10, r7
        b       LAEE30
LAEE45:
        subs    r7, r7, r8
        ldr     r8, [sp, #4]
        sbc     r10, r10, r8
        b       LAEE27
LAEE46:
        subs    r7, r7, r8
        ldr     r8, [sp, #4]
        sbc     r10, r10, r8
        b       LAEE24
        .long   LAEE_rsqrt_table
        .long   LAEE_r1_tbl
        .long   LAEE_log_r1_scale
        .long   LAEE_log_r1_tbl
        .long   LAEE_r2_tbl
        .long   LAEE_log_r2_tbl
        .long   LAEE_log_r2_scale
        .long   0x66666666
        .long   0x55555555
        .long   LAEE_LOG_2
        .long   0x3e571374
        .long   0x69ae4e58
        .long   0x46e8b1c0
        .long   0x5ba20b29
        .long   0xfdd47424
        .long   0x7c71c4a6
        .long   0x8eca75ec
        .long   0x5b6db6d9
        .long   0xcc1fe593
        .long   0x4ccccccc
        .long   0x55554036


        .data
        .align  4


LAEE_rsqrt_table:
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
LAEE_r1_tbl:
        .byte   0x40,0x3F,0x3D,0x3B,0x39,0x38,0x36,0x35,0x34,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2C
        .byte   0x2B,0x2A,0x29,0x29,0x28,0x27,0x26,0x26,0x25,0x24,0x24,0x23,0x23,0x22,0x22,0x21
LAEE_log_r1_scale:
        .byte   0x45,0x44,0x43,0x42,0x42,0x41,0x41,0x41,0x41,0x41,0x40,0x40,0x40,0x40,0x40,0x40
        .byte   0x40,0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x42,0x42,0x42,0x42,0x43,0x43,0x44
LAEE_log_r1_tbl:
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
LAEE_r2_tbl:
        .byte   0xF8,0x1F,0xE8,0x1F,0xD8,0x1F,0xC8,0x1F,0xB9,0x1F,0xA9,0x1F,0x99,0x1F,0x8A,0x1F
        .byte   0x7A,0x1F,0x6B,0x1F,0x5B,0x1F,0x4C,0x1F,0x3D,0x1F,0x2E,0x1F,0x1E,0x1F,0x0F,0x1F
        .byte   0x00,0x1F,0xF1,0x1E,0xE2,0x1E,0xD3,0x1E,0xC5,0x1E,0xB6,0x1E,0xA7,0x1E,0x99,0x1E
        .byte   0x8A,0x1E,0x7B,0x1E,0x6D,0x1E,0x5E,0x1E,0x50,0x1E,0x42,0x1E,0x33,0x1E,0x25,0x1E
LAEE_log_r2_scale:
        .byte   0x48,0x47,0x46,0x46,0x45,0x45,0x45,0x45,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
        .byte   0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43
LAEE_log_r2_tbl:
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
LAEE_LOG_2:
        .byte   0x4F,0x5E,0xCD,0x7B,0x8E,0xBE,0xBF,0x90,0x8C,0x05,0x00,0x00


