        .text
        .align  4
        .globl  acosh


acosh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        str     r0, [sp, #0x28]
        mov     r12, #0xFF
        str     r1, [sp, #0x2C]
        orr     r2, r12, #3, 24
        sub     r3, r1, r2, lsl #20
        cmp     r3, #1, 2
        mvn     r5, #2, 2
        mov     r3, #0
        mov     r12, #0x1F
        bcs     LAEI38
        ldr     r8, [pc, #0xBC0]
        mov     lr, #0xFF, 12
        orr     lr, lr, #3, 4
        add     r4, lr, #9, 24
        cmp     r4, r1
        mov     r4, #0xFF
        mvn     r6, #0xFF, 12
        orr     r4, r4, #7, 24
        bic     r6, r6, #0xF, 4
        bhi     LAEI22
        and     r2, r1, r6
        movs    r6, r1, lsl #1
        moveq   r6, #2, 12
        orrne   r2, r2, #1, 12
        bics    r5, r1, r5
        beq     LAEI0
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LAEI0:
        add     lr, lr, #0x3F, 12
        cmp     lr, r1
        sub     r4, r4, #0xF3, 30
        mov     r1, r0, lsr #22
        sub     r6, r4, r6, lsr #21
        orr     r5, r1, r2, lsl #10
        mov     r4, r0, lsl #10
        addls   r7, r6, #9
        bls     LAEI14
        add     r7, r6, #0xA
        rsb     r10, r7, #0x3E
        cmp     r10, #0x20
        mov     r2, #1, 2
        bcs     LAEI1
        rsb     lr, r10, #0x20
        mov     lr, r2, lsl lr
        orr     lr, lr, r3, lsr r10
        mov     r2, r2, asr r10
        b       LAEI2
LAEI1:
        cmp     r10, #0x40
        movcs   lr, r12
        subcc   lr, r10, #0x20
        mov     lr, r2, asr lr
        mov     r2, r3
LAEI2:
        subs    r9, r4, lr
        sbc     r2, r5, r2
        tst     r2, #1, 2
        mov     lr, r7
        bne     LAEI5
        cmp     r2, #0
        bne     LAEI3
        cmp     r9, #0
        moveq   lr, r3
        beq     LAEI4
        clz     r2, r9
        mov     r9, r9, lsl r2
        add     lr, r2, #0x1F
        mov     r2, r9, lsr #1
        mov     r9, r9, lsl #31
        b       LAEI4
LAEI3:
        clz     lr, r2
        sub     lr, lr, #1
        rsb     r11, lr, #0x20
        mov     r11, r9, lsr r11
        orr     r2, r11, r2, lsl lr
        mov     r9, r9, lsl lr
LAEI4:
        add     lr, r7, lr
LAEI5:
        cmp     r10, #0x20
        bcs     LAEI6
        rsb     r11, r10, #0x20
        mov     r12, #1, 2
        mov     r11, r12, lsl r11
        orr     r11, r11, r3, lsr r10
        mov     r3, r12, asr r10
        b       LAEI7
LAEI6:
        cmp     r10, #0x40
        subcc   r12, r10, #0x20
        mov     r10, #1, 2
        mov     r11, r10, asr r12
LAEI7:
        adds    r12, r4, r11
        adc     r0, r5, r3
        tst     r0, r0
        mov     r3, r7
        bpl     LAEI8
        mov     r3, r0, lsl #31
        orr     r12, r3, r12, lsr #1
        mov     r0, r0, lsr #1
        add     r3, r6, #9
LAEI8:
        add     lr, lr, r3
        umull   r3, r10, r12, r9
        umull   r12, r11, r12, r2
        umull   r3, r9, r9, r0
        umull   r2, r0, r0, r2
        adds    r10, r12, r10
        adc     r11, r11, #0
        adds    r9, r2, r9
        adc     r0, r0, #0
        adds    r10, r3, r10
        adc     r11, r11, #0
        adds    r2, r11, r9
        mov     r9, r10, lsr #31
        adc     r12, r0, #0
        mov     r10, r10, lsr #30
        orr     r9, r9, r2, lsl #1
        and     r10, r10, #1
        adds    r0, r9, r10
        mov     r2, r2, lsr #31
        orr     r12, r2, r12, lsl #1
        str     r0, [sp, #0x20]
        adc     r1, r12, #0
        tst     r1, #1, 2
        str     r1, [sp, #0x24]
        sub     r9, lr, #0x3F
        bne     LAEI9
        cmp     r1, #0
        clzeq   r0, r0
        addeq   r10, r0, #0x1F
        clzne   r1, r1
        subne   r10, r1, #1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        mov     r3, r10, asr #31
        mov     r2, r10
        bl      __ashldi3
        str     r0, [sp, #0x20]
        add     r9, r9, r10
        str     r1, [sp, #0x24]
LAEI9:
        mov     r2, r1, asr #31
        mov     r3, r1
        mov     lr, r2, lsl #9
        orr     lr, lr, r3, lsr #23
        and     r12, r9, #1
        mvn     r10, #0x7F
        adds    lr, lr, r12, lsl #7
        adds    r10, lr, r10
        ldrb    r8, [r10, +r8]
        cmp     r12, #0
        add     r12, r8, #1, 24
        beq     LAEI10
        mov     lr, r0, lsr #31
        orr     r1, lr, r1, lsl #1
        mov     r0, r0, lsl #1
LAEI10:
        mul     r10, r12, r12
        mov     r8, r1, lsr #12
        sub     lr, r0, #1
        mla     r10, r10, r8, r10
        mov     r10, r10, asr #14
        mla     r10, r12, r10, r12
        rsb     r12, r10, r12, lsl #23
        mov     r10, r12, lsr #19
        mul     r8, r10, r8
        umull   r11, r10, r8, r8
        subs    r11, r0, r11
        sbc     r10, r1, r10
        umull   r10, r11, r12, r10
        adds    r8, r8, r11
        umull   r11, r10, r8, r8
        subs    r0, r0, r11
        umull   r0, r11, r12, r0
        sbc     r1, r1, r10
        umull   r10, r0, r12, r1
        adds    r10, r10, #0
        adc     r8, r0, r8
        adds    r11, r11, r10
        adc     r8, r8, #0
        mul     r1, r8, r8
        umull   r0, r10, r8, r11
        sub     r1, lr, r1
        subs    r1, r1, r10, lsl #1
        movmi   r1, #0
        umull   r10, r0, r12, r1
        adds    r10, r11, r0
        adc     r8, r8, #0
        mul     r1, r8, r8
        umull   r0, r11, r8, r10
        sub     lr, lr, r1
        subs    lr, lr, r11, lsl #1
        movmi   lr, #0
        umull   r12, lr, r12, lr
        adds    r10, r10, lr
        mov     r12, r2, lsl #2
        orr     r3, r12, r3, lsr #30
        adc     r8, r8, #0
        rsb     r9, r9, #0x3E
        mov     r12, r8, lsl #31
        orr     r10, r12, r10, lsr #1
        mov     r9, r9, asr #1
        adds    r3, r3, r10
        rsb     r9, r9, #0x3E
        sub     r12, r9, r7
        mov     r8, r8, lsr #1
        adc     r2, r8, r2, asr #30
        cmp     r12, #0x20
        bcs     LAEI11
        rsb     lr, r12, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r12
        mov     r12, r2, asr r12
        b       LAEI12
LAEI11:
        cmp     r12, #0x40
        movcs   r12, #0x1F
        subcc   r12, r12, #0x20
        mov     r3, r2, asr r12
        mov     r12, r2, asr #31
LAEI12:
        adds    r4, r4, r3
        adc     r5, r5, r12
        tst     r5, r5
        bpl     LAEI13
        mov     r2, r5, lsl #31
        orr     r4, r2, r4, lsr #1
        mov     r5, r5, lsr #1
        add     r7, r6, #9
LAEI13:
        tst     r5, #1, 2
        bne     LAEI14
        cmp     r5, #0
        clzeq   r2, r4
        addeq   r6, r2, #0x1F
        clzne   r2, r5
        subne   r6, r2, #1
        mov     r3, r6, asr #31
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        bl      __ashldi3
        add     r7, r7, r6
        mov     r4, r0
        mov     r5, r1
LAEI14:
        ldr     r2, [pc, #0x840]
        mov     r3, r5, lsr #25
        sub     r12, r3, #0x20
        ldrb    lr, [r12, +r2]
        ldr     r2, [pc, #0x834]
        ldr     r8, [pc, #0x834]
        ldr     r6, [pc, #0x834]
        umull   r4, r3, r4, lr
        umull   r5, lr, r5, lr
        ldrb    r0, [r12, +r2]
        ldr     r2, [r8, +r12, lsl #3]
        mov     r1, r3, lsl #22
        orr     r1, r1, r4, lsr #10
        sub     r7, r7, r12, asr #4
        adds    r1, r1, r5, lsl #22
        add     r12, r8, r12, lsl #3
        ldr     r12, [r12, #4]
        mov     r5, r5, lsr #10
        orr     lr, r5, lr, lsl #22
        ldr     r5, [pc, #0x804]
        adc     r8, lr, r3, lsr #10
        ldr     r3, [pc, #0x800]
        sub     r7, r7, #0xA
        str     r7, [sp, #0xC]
        mov     lr, r8, lsr #17
        sub     r7, lr, #2, 24
        ldr     lr, [r5, +r7, lsl #3]
        ldrb    r3, [r7, +r3]
        add     r5, r5, r7, lsl #3
        mov     r7, r7, lsl #1
        ldrh    r6, [r6, +r7]
        ldr     r5, [r5, #4]
        mov     r7, #0x1F
        add     r7, r7, #0x3E, 28
        umull   r9, r1, r6, r1
        and     r4, r4, r7
        umull   r8, r7, r8, r6
        mul     r4, r4, r6
        sub     r6, r0, #0x2B
        rsb     r7, r0, #0x4B
        adds    r0, r9, #0
        adc     r8, r1, r8
        adds    r0, r0, r4, lsr #10
        adc     r1, r8, #0
        sub     r9, r3, #0x2B
        mov     r8, r12, lsr r6
        mov     r10, r5, lsr r9
        rsb     r3, r3, #0x4B
        orr     r8, r8, r2, lsl r7
        orr     r10, r10, lr, lsl r3
        adds    r8, r8, r10
        mov     r9, lr, lsr r9
        adc     r6, r9, r2, asr r6
        mov     r3, r5, lsl r3
        mov     r2, #0
        adds    r7, r3, r12, lsl r7
        adc     r2, r2, #0
        adds    r8, r8, r2
        mov     r3, r1
        adc     r2, r6, r2, asr #31
        cmp     r3, #0
        str     r7, [sp]
        str     r8, [sp, #4]
        str     r2, [sp, #8]
        rsblt   r3, r3, #0
        clz     r3, r3
        subs    r5, r3, #1
        subne   r5, r5, #1
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        ldr     r3, [pc, #0x73C]
        mov     r12, #0x1F
        add     r12, r12, #0x3E, 28
        and     r12, r4, r12
        rsb     lr, r5, #0xA
        orr     r7, r0, r12, lsr lr
        ldr     r0, [pc, #0x728]
        add     r6, r1, r7, lsr #31
        smull   r8, r9, r6, r6
        rsb     r0, r0, #0
        smull   r1, r0, r0, r6
        smull   r1, r12, r6, r7
        add     r4, r5, #7
        adds    r11, r9, r8, lsr #31
        add     r0, r3, r0, asr r4
        smull   r1, r0, r0, r11
        str     r12, [sp, #0x10]
        add     r2, r5, #9
        add     r10, r5, #6
        rsb     r3, r4, #0x21
        rsb     r1, r6, r0, asr r10
        mov     r0, r0, lsl r3
        mov     r3, r2, asr #31
        bl      __ashrdi3
        ldr     r12, [pc, #0x6E0]
        mov     r2, r10
        adds    r3, r0, r12
        smull   lr, r0, r3, r11
        adc     r12, r1, r12
        adds    r3, r12, r3, lsr #31
        smull   r11, r12, r3, r11
        smull   r3, r1, r3, r8
        mov     r3, r10, asr #31
        mov     r10, r4, asr #31
        adds    r11, r11, r1
        adc     lr, r12, r1, asr #31
        adds    r12, r11, r0
        smull   r11, r1, r6, r12
        adc     r0, lr, r0, asr #31
        add     r11, r5, #8
        adds    r12, r0, r12, lsr #31
        smull   r0, r12, r6, r12
        mov     lr, r11, asr #31
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        mov     lr, lr, asr #31
        str     lr, [sp, #0x18]
        bl      __ashrdi3
        ldr     r3, [sp, #0x14]
        subs    r0, r0, r8
        sbc     r1, r1, r9
        mov     r2, r11
        bl      __ashrdi3
        mov     r9, r0
        mov     r11, r1
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x18]
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        mov     r8, r0
        smull   r12, r0, r6, r8
        adds    r9, r9, #0
        adc     r11, r11, r6
        mov     r1, r0, asr #31
        adds    r6, r9, r7
        mov     r2, r4
        mov     r3, r10
        adc     r7, r11, r7, asr #31
        bl      __ashrdi3
        subs    r6, r6, r8
        sbc     r7, r7, r8, asr #31
        adds    r0, r6, r0
        adc     r1, r7, r1
        cmp     r4, #0xB
        blt     LAEI15
        sub     r2, r5, #4
        mov     r3, #0
        bl      __ashrdi3
        mov     r4, r1, asr #31
        b       LAEI16
LAEI15:
        rsb     r2, r4, #0xB
        add     r5, r5, #0x1C
        mov     r4, r1, asr r5
        mov     r3, #0
        bl      __ashldi3
LAEI16:
        ldr     r2, [sp, #4]
        ldr     r3, [pc, #0x5E0]
        adds    r12, r2, r1
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     lr, [r3]
        ldr     r7, [r3, #4]
        adc     r5, r1, r4
        ldr     r1, [sp]
        ldr     r3, [r3, #8]
        rsb     r2, r2, #0x34
        smull   lr, r4, lr, r2
        adds    r1, r1, r0
        mov     r0, #0
        adc     r6, r0, #0
        adds    r12, r12, r6
        adc     r5, r5, r6, asr #31
        smull   r7, r6, r7, r2
        mul     r2, r3, r2
        mov     r3, #0
        adds    r7, r4, r7
        adc     r4, r6, r4, asr #31
        adds    r7, r7, #0
        adc     r2, r4, r2
        adds    r7, r12, r7
        adc     r2, r5, r2
        adds    r5, r1, lr
        adc     r1, r0, #0
        adds    r0, r7, r1
        adc     r1, r2, r1, asr #31
        eor     r2, r1, r1, asr #31
        sub     r2, r2, r1, asr #31
        clz     r4, r2
        sub     r2, r4, #1
        bl      __ashldi3
        mvn     r2, #2, 2
        rsb     r3, r4, #0x21
        bics    r2, r1, r2
        orr     r5, r0, r5, lsr r3
        add     r4, r4, #0x2A
        beq     LAEI17
        rsbs    r5, r5, #0
        rsc     r1, r1, #0
LAEI17:
        mov     r0, #0xFF
        orr     r0, r0, #3, 24
        add     r0, r0, #0x3D
        clz     r12, r1
        cmp     r12, #0x20
        rsb     r0, r4, r0
        beq     LAEI41
LAEI18:
        sub     r12, r12, #1
        rsb     r3, r12, #0x20
        mov     r3, r5, lsr r3
        orr     r3, r3, r1, lsl r12
        subs    r1, r0, r12
        mov     r5, r5, lsl r12
        bpl     LAEI20
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAEI19
        mov     r5, r3
        mov     r3, r3, asr #31
        sub     r1, r1, #0x20
LAEI19:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r5, r5, lsr r1
        rsb     r0, r1, #0x20
        orr     r5, r5, r3, lsl r0
        mov     r3, r3, asr r1
        mov     r1, #0
LAEI20:
        mov     r0, r5, lsr #9
        and     r12, r0, #1
        mov     r0, r3, lsl #22
        orr     r5, r0, r5, lsr #10
        adds    r0, r12, r5
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r1, #0
        beq     LAEI21
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        sub     r3, r3, #1
        cmp     r3, r1
        bgt     LAEI21
        mov     r1, #0x1F
        mov     r0, #0
        add     r1, r1, #0x7E, 28
        mov     r12, r0
LAEI21:
        add     r1, r12, r1, lsl #20
        orr     r1, r1, r2
        b       LAEI40
LAEI22:
        cmp     r1, r2, lsl #20
        bne     LAEI23
        cmp     r0, #0
        bne     LAEI23
        mov     r0, #0
        mov     r1, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEI23:
        movs    lr, r1, lsl #1
        and     r2, r1, r6
        moveq   lr, #2, 12
        orrne   r2, r2, #1, 12
        bics    r5, r1, r5
        beq     LAEI24
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LAEI24:
        sub     r1, r4, #0xF3, 30
        subs    r2, r2, #1, 12
        sub     r1, r1, lr, lsr #21
        beq     LAEI25
        clz     r5, r2
        rsb     lr, r5, #0x20
        mov     lr, r0, lsr lr
        orr     lr, lr, r2, lsl r5
        sub     r5, r5, #1
        mov     r0, r0, lsl r5
        mov     r2, lr, lsr #1
        b       LAEI26
LAEI25:
        clz     r2, r0
        mov     lr, r0, lsl r2
        mov     r0, r0, lsl #31
        mov     r0, r0, lsl r2
        add     r5, r2, #0x1F
        mov     r2, lr, lsr #1
LAEI26:
        ldr     r6, [pc, #0x3EC]
        add     r1, r1, r5
        ldr     r5, [pc, #0x3E8]
        umull   r7, r6, r6, lr
        sub     r7, r1, #0x3D
        sub     r7, r5, r6, asr r7
        umull   r6, r5, lr, r7
        sub     lr, r1, #0x3E
        cmp     lr, #0x20
        bcs     LAEI27
        rsb     r12, r1, #0x5E
        mov     r12, r5, lsl r12
        orr     r6, r12, r6, lsr lr
        mov     lr, r5, asr lr
        b       LAEI28
LAEI27:
        cmp     lr, #0x40
        subcc   r12, r1, #0x5E
        mov     r6, r5, asr r12
        mov     lr, r5, asr #31
LAEI28:
        ldr     r12, [pc, #0x3A8]
        ldr     r5, [pc, #0x3A8]
        subs    r6, r12, r6
        mov     r12, r2
        sbc     lr, r5, lr
        umull   r7, r5, r12, r6
        umull   r7, r9, r0, lr
        adds    r9, r5, r9
        umull   r10, r5, lr, r12
        adc     r7, r3, #0
        adds    r3, r10, r9
        adc     r7, r5, r7
        cmp     r12, #0
        mov     r5, r2, asr #31
        blt     LAEI45
LAEI29:
        mov     lr, r3, lsr #31
        sub     r6, r1, #0x3D
        orr     lr, lr, r7, lsl #1
        cmp     r6, #0x20
        mov     r3, r3, lsl #1
        add     r7, r1, #5
        bcs     LAEI30
        rsb     r7, r7, #0x62
        mov     r7, lr, lsl r7
        orr     r3, r7, r3, lsr r6
        mov     lr, lr, asr r6
        b       LAEI31
LAEI30:
        cmp     r6, #0x40
        movcs   r3, #0x1F
        subcc   r3, r1, #0x5D
        mov     r3, lr, asr r3
        mov     lr, lr, asr #31
LAEI31:
        ldr     r6, [pc, #0x330]
        ldr     r7, [pc, #0x330]
        subs    r6, r6, r3
        umull   r9, r3, r12, r6
        sbc     lr, r7, lr
        umull   r7, r9, r0, lr
        umull   r10, r7, r12, lr
        adds    r3, r3, r9
        mov     r9, #0
        adc     r9, r9, #0
        adds    r3, r10, r3
        adc     r9, r7, r9
        cmp     r12, #0
        blt     LAEI44
LAEI32:
        mov     lr, r3, lsr #31
        sub     r6, r1, #0x3B
        cmp     r6, #0x20
        orr     lr, lr, r9, lsl #1
        mov     r3, r3, lsl #1
        add     r7, r1, #3
        bcs     LAEI33
        rsb     r7, r7, #0x5E
        mov     r7, lr, lsl r7
        orr     r3, r7, r3, lsr r6
        mov     r7, lr, asr r6
        b       LAEI34
LAEI33:
        cmp     r6, #0x40
        movcs   r3, #0x1F
        subcc   r3, r1, #0x5B
        mov     r3, lr, asr r3
        mov     r7, lr, asr #31
LAEI34:
        ldr     lr, [pc, #0x2BC]
        ldr     r9, [pc, #0x2BC]
        and     r6, r1, #1
        subs    lr, lr, r3
        sbc     r3, r9, r7
        mov     r7, r5, lsl #9
        orr     r7, r7, r12, lsr #23
        mvn     r9, #0x7F
        adds    r7, r7, r6, lsl #7
        adds    r9, r7, r9
        ldrb    r8, [r9, +r8]
        cmp     r6, #0
        add     r6, r8, #1, 24
        beq     LAEI35
        mov     r7, r0, lsr #31
        orr     r2, r7, r2, lsl #1
        mov     r0, r0, lsl #1
LAEI35:
        mul     r9, r6, r6
        mov     r8, r2, lsr #12
        sub     r7, r0, #1
        mla     r9, r9, r8, r9
        mov     r9, r9, asr #14
        mla     r9, r6, r9, r6
        rsb     r6, r9, r6, lsl #23
        mov     r9, r6, lsr #19
        mul     r8, r9, r8
        umull   r10, r9, r8, r8
        subs    r10, r0, r10
        sbc     r9, r2, r9
        umull   r9, r10, r6, r9
        adds    r8, r8, r10
        umull   r10, r9, r8, r8
        subs    r0, r0, r10
        umull   r10, r0, r6, r0
        sbc     r2, r2, r9
        umull   r2, r9, r6, r2
        adds    r2, r2, #0
        adc     r8, r9, r8
        adds    r2, r0, r2
        adc     r0, r8, #0
        mul     r10, r0, r0
        umull   r9, r8, r0, r2
        sub     r10, r7, r10
        subs    r10, r10, r8, lsl #1
        movmi   r10, #0
        umull   r8, r9, r6, r10
        adds    r2, r2, r9
        adc     r0, r0, #0
        mul     r10, r0, r0
        umull   r9, r8, r0, r2
        sub     r7, r7, r10
        subs    r7, r7, r8, lsl #1
        movmi   r7, #0
        umull   r6, r7, r6, r7
        adds    r2, r2, r7
        mov     r6, r5, lsl #2
        adc     r0, r0, #0
        orr     r12, r6, r12, lsr #30
        mov     r6, r0, lsl #31
        orr     r2, r6, r2, lsr #1
        adds    r2, r12, r2
        umull   r12, r2, r2, r3
        mov     r0, r0, lsr #1
        adc     r5, r0, r5, asr #30
        umull   r0, r12, r5, lr
        adds    r0, r12, r2
        umull   r7, r2, r5, r3
        mov     r12, #0
        adc     r12, r12, #0
        rsb     r6, r1, #0x3E
        adds    r0, r7, r0
        adc     r1, r2, r12
        mov     r6, r6, asr #1
        cmp     r5, #0
        rsb     r2, r6, #0x3E
        blt     LAEI43
LAEI36:
        mov     lr, r0, lsr #31
        orr     r1, lr, r1, lsl #1
        mov     r0, r0, lsl #1
        str     r0, [sp, #0x20]
        cmp     r1, #0
        str     r1, [sp, #0x24]
        sub     r5, r2, #1
        clzeq   r0, r0
        addeq   r6, r0, #0x1F
        clzne   r1, r1
        subne   r6, r1, #1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        mov     r3, #0xFF
        orr     r3, r3, #3, 24
        and     r2, r0, #2, 24
        bic     r3, r0, r3
        add     r5, r5, r6
        mov     r2, r2, lsl #1
        adds    r0, r3, r2
        adc     r1, r1, r2, asr #31
        tst     r1, r1
        bmi     LAEI42
LAEI37:
        mov     r2, #0x1F
        add     r2, r2, #0x3E, 28
        add     r2, r2, #0x3D
        rsb     r2, r5, r2
        and     r4, r2, r4
        mov     r2, r1, lsl #22
        mov     r1, r1, asr #10
        orr     r0, r2, r0, lsr #10
        add     r1, r1, r4, lsl #20
        b       LAEI40
LAEI38:
        add     r12, r12, #0x7E, 28
        cmp     r1, r12, lsl #20
        bne     LAEI39
        cmp     r0, #0
        bne     LAEI39
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEI39:
        rsb     r2, r0, #0
        orr     r2, r0, r2
        mov     r2, r2, lsr #12
        orr     r2, r2, r1, lsl #1
        cmn     r2, #2, 12
        orrhi   r1, r1, #2, 14
        bls     LAEI46
LAEI40:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEI41:
        clz     r3, r5
        cmp     r3, #0
        beq     LAEI18
        mov     r1, r5
        sub     r0, r0, #0x20
        mov     r12, r3
        mov     r5, #0
        b       LAEI18
LAEI42:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r5, r5, #1
        b       LAEI37
LAEI43:
        subs    r0, r0, lr
        sbc     r1, r1, r3
        b       LAEI36
LAEI44:
        subs    r3, r3, r6
        sbc     r9, r9, lr
        b       LAEI32
LAEI45:
        subs    r3, r3, r6
        sbc     r7, r7, lr
        b       LAEI29
LAEI46:
        str     r3, [sp, #0x20]
        add     r2, sp, #0x20
        add     r1, sp, #0x28
        add     r0, sp, #0x28
        mov     r5, r5, lsl #19
        str     r5, [sp, #0x24]
        mov     r3, #0x88
        bl      __libm_error_support
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        b       LAEI40
        .long   LAEI_rsqrt_table
        .long   LAEI_r1_tbl
        .long   LAEI_log_r1_scale
        .long   LAEI_log_r1_tbl
        .long   LAEI_r2_tbl
        .long   LAEI_log_r2_tbl
        .long   LAEI_log_r2_scale
        .long   0x66666666
        .long   0x55555555
        .long   LAEI_LOG_2
        .long   0x57d6675c
        .long   0x40a6526f
        .long   0x97453399
        .long   0x6c9c91eb
        .long   0xfbe80433
        .long   0x78adf777
        .long   0xfcef3242
        .long   0x5a827999


        .data
        .align  4


LAEI_rsqrt_table:
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
LAEI_r1_tbl:
        .byte   0x40,0x3F,0x3D,0x3B,0x39,0x38,0x36,0x35,0x34,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2C
        .byte   0x2B,0x2A,0x29,0x29,0x28,0x27,0x26,0x26,0x25,0x24,0x24,0x23,0x23,0x22,0x22,0x21
LAEI_log_r1_scale:
        .byte   0x45,0x44,0x43,0x42,0x42,0x41,0x41,0x41,0x41,0x41,0x40,0x40,0x40,0x40,0x40,0x40
        .byte   0x40,0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x42,0x42,0x42,0x42,0x43,0x43,0x44
LAEI_log_r1_tbl:
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
LAEI_r2_tbl:
        .byte   0xF8,0x1F,0xE8,0x1F,0xD8,0x1F,0xC8,0x1F,0xB9,0x1F,0xA9,0x1F,0x99,0x1F,0x8A,0x1F
        .byte   0x7A,0x1F,0x6B,0x1F,0x5B,0x1F,0x4C,0x1F,0x3D,0x1F,0x2E,0x1F,0x1E,0x1F,0x0F,0x1F
        .byte   0x00,0x1F,0xF1,0x1E,0xE2,0x1E,0xD3,0x1E,0xC5,0x1E,0xB6,0x1E,0xA7,0x1E,0x99,0x1E
        .byte   0x8A,0x1E,0x7B,0x1E,0x6D,0x1E,0x5E,0x1E,0x50,0x1E,0x42,0x1E,0x33,0x1E,0x25,0x1E
LAEI_log_r2_scale:
        .byte   0x48,0x47,0x46,0x46,0x45,0x45,0x45,0x45,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44
        .byte   0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x43
LAEI_log_r2_tbl:
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
LAEI_LOG_2:
        .byte   0x4F,0x5E,0xCD,0x7B,0x8E,0xBE,0xBF,0x90,0x8C,0x05,0x00,0x00


