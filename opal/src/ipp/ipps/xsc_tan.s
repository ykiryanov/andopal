        .text
        .align  4
        .globl  tan


tan:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mvn     r8, #2, 2
        mvn     r2, #0xFF, 12
        and     r3, r1, r8
        bic     r2, r2, #0xF, 4
        mov     r12, r3, lsl #1
        bic     lr, r1, r8
        cmp     r12, #2, 12
        and     r2, r3, r2
        str     lr, [sp]
        movcc   r12, #2, 12
        orrcs   r2, r2, #1, 12
        mov     lr, #0xDF, 12
        orr     lr, lr, #3, 4
        add     r4, lr, #0x6A, 14
        sub     r4, r3, r4
        cmp     r4, #0x4A, 14
        mov     r4, #0x33
        orr     r6, r4, #1, 22
        mov     r4, #0
        sub     r7, r6, r12, lsr #21
        bcc     LAAH13
        add     lr, lr, #0x2D, 12
        mov     r12, #0xFF
        cmp     lr, r3
        orr     r5, r12, #7, 24
        bhi     LAAH5
        cmp     r3, r5, lsl #20
        bcc     LAAH1
        mov     r1, #0xFF, 12
        orr     r1, r1, #7, 4
        cmp     r1, r3
        bne     LAAH0
        cmp     r0, #0
        subeq   r3, r4, #2, 14
LAAH0:
        ldr     r1, [sp]
        orr     r3, r3, #2, 14
        orr     r1, r3, r1
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAAH1:
        ldr     r1, [pc, #0xC00]
        rsb     r7, r7, #0x34
        add     r3, r7, #9
        mov     lr, r3, lsr #5
        ldr     r12, [r1, +lr, lsl #2]
        sub     r3, r7, lr, lsl #5
        add     r7, r1, lr, lsl #2
        ldr     r1, [r7, #0x14]
        umull   r12, lr, r0, r12
        umull   lr, r9, r0, r1
        str     r12, [sp, #8]
        umull   r12, r8, r1, r2
        ldr     r6, [r7, #0x10]
        ldr     r5, [r7, #0x18]
        adds    r12, r9, r12
        adc     r8, r8, #0
        umull   r10, r11, r0, r6
        umull   r1, r5, r2, r5
        str     r11, [sp, #4]
        str     r10, [sp, #0xC]
        umull   r6, r10, r6, r2
        str     r10, [sp, #0x14]
        adds    r1, lr, r1
        ldr     lr, [sp, #4]
        adc     r5, r5, #0
        str     r6, [sp, #0x10]
        ldr     r6, [r7, #0xC]
        ldr     r10, [r7, #8]
        adds    r12, r12, r5
        umull   r9, r11, r0, r6
        str     r11, [sp, #0x18]
        ldr     r5, [sp, #0xC]
        adc     r8, r8, #0
        str     r9, [sp, #0x1C]
        umull   r9, r6, r6, r2
        str     r9, [sp, #0x20]
        ldr     r9, [r7, #4]
        umull   r11, r7, r10, r2
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x10]
        str     r7, [sp, #0x28]
        umull   r10, r7, r0, r10
        str     r11, [sp, #0x24]
        adds    lr, lr, r1
        ldr     r1, [sp, #0x14]
        str     r10, [sp, #0x2C]
        umull   r0, r10, r0, r9
        umull   r2, r9, r9, r2
        adc     r1, r1, #0
        adds    r12, r5, r12
        str     r12, [sp, #0x14]
        adc     r8, r8, #0
        ldr     r5, [sp, #0x18]
        adds    r12, r8, lr
        ldr     lr, [sp, #0x20]
        adc     r1, r1, #0
        str     r10, [sp, #0x30]
        add     r9, r3, #0x12
        adds    lr, r5, lr
        ldr     r5, [sp, #0x1C]
        adc     r6, r6, #0
        adds    r12, r5, r12
        ldr     r5, [sp, #0x2C]
        str     r12, [sp, #0x20]
        adc     r1, r1, #0
        adds    r12, r1, lr
        ldr     lr, [sp, #0x24]
        adc     r1, r6, #0
        adds    r7, r7, lr
        ldr     lr, [sp, #0x28]
        adc     lr, lr, #0
        adds    r5, r5, r12
        ldr     r12, [sp, #0x30]
        adc     r1, r1, #0
        adds    r7, r1, r7
        adc     lr, lr, #0
        adds    r7, r0, r7
        adc     r1, lr, #0
        adds    r2, r12, r2
        adds    r1, r1, r2
        ldr     r2, [sp, #8]
        mov     r0, r7
        adds    r1, r2, r1
        add     r2, r3, #0xA
        mov     r1, r1, lsl r2
        mov     r8, r1, lsr r2
        rsb     r2, r2, #0x38
        mov     r1, r8
        mov     r3, #0
        bl      __lshrdi3
        mov     r6, r0
        mov     r2, r9
        mov     r0, r7
        mov     r1, r8
        mov     r3, #0
        bl      __ashldi3
        mov     r2, r9
        rsb     r9, r9, #0x40
        str     r9, [sp, #8]
        mov     r3, #0
        bl      __ashrdi3
        add     r3, sp, #0x38
        add     r2, sp, #0x38
        str     r1, [r3]
        str     r0, [r2, #4]
        add     r2, sp, #0x38
        add     r3, sp, #0x38
        str     r5, [r3, #8]
        ldr     r12, [r2, #4]
        ldr     r3, [r2]
        mov     r1, r1, asr #31
        add     r2, sp, #0x38
        mov     lr, r4
        cmp     r3, r12, asr #31
        ldr     r12, [sp, #0x20]
        add     r3, sp, #0x38
        str     r12, [r2, #0xC]
        ldr     r12, [sp, #0x14]
        add     r2, sp, #0x38
        str     r12, [r3, #0x10]
        ldr     r3, [sp, #0x34]
        str     r3, [r2, #0x14]
        addne   r3, sp, #0x38
        ldrne   r2, [r3]
        bne     LAAH3
        mov     r12, r4
        ldr     r5, [sp, #8]
LAAH2:
        add     r2, sp, #0x38
        add     r12, r12, #4
        add     r3, r2, r12
        add     lr, lr, #1
        ldr     r2, [r2, +lr, lsl #2]
        ldr     r7, [r3, #4]
        add     r5, r5, #0x20
        cmp     r2, r7, asr #31
        bne     LAAH42
        cmp     lr, #5
        bcc     LAAH2
        str     r5, [sp, #8]
LAAH3:
        cmp     r1, #0
        rsbne   r2, r2, #0
        ldr     r12, [r3, #4]
        add     r5, sp, #0x38
        ldr     r3, [r5, +lr, lsl #2]
        ldr     r0, [pc, #0x9C4]
        clz     r2, r2
        add     lr, r5, lr, lsl #2
        ldr     r5, [lr, #8]
        ldr     lr, [r0]
        sub     r2, r2, #1
        sub     r1, r6, r1
        rsb     r6, r2, #0x20
        mov     r5, r5, lsr r6
        str     lr, [sp, #4]
        ldr     r0, [r0, #4]
        mov     r6, r12, lsr r6
        orr     r3, r6, r3, lsl r2
        umull   r7, r6, lr, r3
        orr     r10, r5, r12, lsl r2
        umull   r12, r9, lr, r10
        umull   r5, r8, r3, r0
        umull   r10, lr, r10, r0
        adds    r7, r9, r7
        adc     r6, r6, #0
        adds    r8, r8, r7
        adc     r6, r6, #0
        adds    r12, r5, r12
        adc     r4, r4, #0
        adds    r12, lr, r12
        adc     r4, r4, #0
        adds    r7, r4, r8
        adc     r6, r6, #0
        cmp     r3, #0
        blt     LAAH41
LAAH4:
        ldr     r0, [sp, #8]
        add     r0, r2, r0
        add     r11, r0, #5
        b       LAAH18
LAAH5:
        mov     r12, r5, lsl #20
        sub     r12, r12, #0x42, 8
        cmp     r12, r3
        bhi     LAAH12
        ldr     r9, [pc, #0x930]
        ldr     r1, [pc, #0x930]
        mov     r3, r0, lsr #24
        orr     r2, r3, r2, lsl #8
        str     r2, [sp, #0x34]
        ldr     r3, [sp, #0x34]
        mov     r0, r0, lsl #8
        str     r0, [sp, #0x30]
        add     r2, r7, #8
        str     r2, [sp, #4]
        add     r0, r3, r0, lsr #31
        smull   r3, r12, r0, r0
        umull   r1, lr, r1, r12
        ldr     r1, [sp, #0x30]
        mov     r2, r2, lsl #1
        str     r3, [sp, #0x2C]
        sub     r2, r2, #0x80
        smull   r3, r1, r0, r1
        ldr     r3, [pc, #0x8F0]
        str     r1, [sp, #0x28]
        rsb     r10, r2, #0x1E
        smull   r3, r1, r1, r3
        add     r3, r2, #1
        add     lr, r9, lr, lsr r3
        umull   lr, r9, r12, lr
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x20]
        sub     r10, r2, #1
        mov     r1, r1, asr r10
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        add     r9, r2, #2
        mov     lr, lr, lsr r9
        orr     r10, lr, r11, lsl r10
        ldr     lr, [pc, #0x8B4]
        rsb     r11, r2, #0x1F
        adds    lr, r10, lr
        umull   lr, r10, r12, lr
        ldr     lr, [sp, #0x24]
        str     r10, [sp, #0x20]
        ldr     r10, [pc, #0x89C]
        adc     lr, r10, lr, lsr r9
        ldr     r9, [sp, #0x2C]
        umull   r10, r9, r9, lr
        umull   lr, r10, lr, r12
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        str     r11, [sp, #0x20]
        mov     r11, r2, asr #31
        str     r11, [sp, #0x1C]
        adds    r9, r10, r9
        adc     r10, r4, #0
        adds    r9, lr, r9
        ldr     lr, [sp, #0x24]
        mov     r9, r9, lsr r3
        adc     r10, lr, r10
        ldr     lr, [sp, #0x20]
        orr     r9, r9, r10, lsl lr
        ldr     lr, [pc, #0x850]
        adds    lr, r9, lr
        ldr     r9, [pc, #0x848]
        adc     r10, r9, r10, lsr r3
        adds    lr, r1, lr
        umull   lr, r3, r12, lr
        ldr     lr, [sp, #0x2C]
        adc     r1, r10, r1, asr #31
        umull   r9, lr, lr, r1
        umull   r12, r1, r12, r1
        adds    r9, r3, lr
        adc     lr, r4, #0
        ldr     r3, [sp, #0x1C]
        adds    r12, r12, r9
        ldr     r9, [sp, #0x28]
        adc     lr, r1, lr
        adds    r12, r12, r9
        smull   r10, r1, r0, r12
        adc     r9, lr, r9, asr #31
        add     r12, r9, r12, lsr #31
        smull   r0, r12, r0, r12
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        ldr     r2, [sp, #0x30]
        adds    r0, r2, r0
        ldr     r2, [sp, #0x34]
        adc     r1, r2, r1
        cmp     r1, #0
        blt     LAAH44
LAAH6:
        bics    r8, r1, r8
        beq     LAAH7
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAAH7:
        ldr     r2, [sp, #4]
        add     r6, r6, #9
        rsb     r3, r2, r6
        clz     r2, r1
        cmp     r2, #0x20
        beq     LAAH43
LAAH8:
        sub     r12, r2, #1
        rsb     r2, r12, #0x20
        mov     r2, r0, lsr r2
        orr     r2, r2, r1, lsl r12
        subs    r1, r3, r12
        mov     r12, r0, lsl r12
        bpl     LAAH10
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAAH9
        mov     r12, r2
        mov     r2, r2, asr #31
        sub     r1, r1, #0x20
LAAH9:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r12, r12, lsr r1
        rsb     r0, r1, #0x20
        orr     r12, r12, r2, lsl r0
        mov     r2, r2, asr r1
        mov     r1, r4
LAAH10:
        mov     r0, r12, lsr #9
        and     r3, r0, #1
        mov     r0, r2, lsl #22
        orr     r12, r0, r12, lsr #10
        adds    r0, r3, r12
        mov     r2, r2, lsr #10
        adc     r3, r2, r3, asr #31
        orrs    r2, r3, r3, asr #31
        moveq   r1, r4
        beq     LAAH11
        sub     r5, r5, #1
        cmp     r5, r1
        bgt     LAAH11
        mov     r0, r4
        mov     r1, #0x3F
        add     r1, r1, #0x1F, 26
        mov     r3, r0
LAAH11:
        add     r1, r3, r1, lsl #20
        orr     r8, r1, r8
        ldr     r1, [sp]
        eor     r1, r8, r1
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAAH12:
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAAH13:
        ldr     r1, [pc, #0x700]
        ldr     r3, [pc, #0x700]
        ldr     r12, [r1]
        sub     r1, r7, #0x28
        umull   r12, lr, r12, r2
        mov     r1, lr, lsr r1
        ldr     r12, [r3, #0xC]
        ldr     lr, [r3, #8]
        ldr     r6, [r3, #4]
        ldr     r5, [r3]
        add     r1, r1, #1
        mov     r1, r1, lsr #1
        umull   r8, lr, lr, r1
        umull   r12, r3, r12, r1
        mul     r5, r5, r1
        adds    r3, r8, r3
        umull   r8, r6, r6, r1
        adc     lr, lr, #0
        adds    lr, r8, lr
        adc     r6, r6, #0
        adds    r5, r5, r6
        cmp     r7, #0x31
        bgt     LAAH14
        sub     r6, r7, #0x11
        mov     r6, r0, lsr r6
        rsb     r7, r7, #0x31
        orr     r6, r6, r2, lsl r7
        mov     r2, r0, lsl r7
        mov     r7, r4
        b       LAAH15
LAAH14:
        sub     r6, r7, #0x31
        mov     r8, r0, lsr r6
        rsb     r7, r7, #0x51
        mov     r6, r2, lsr r6
        orr     r2, r8, r2, lsl r7
        mov     r7, r0, lsl r7
LAAH15:
        cmp     r3, r7
        cmpeq   r12, r4
        bls     LAAH16
        adds    lr, lr, #1
        adc     r5, r5, #0
LAAH16:
        subs    r4, r4, r12
        sbc     r3, r7, r3
        subs    lr, r2, lr
        sbc     r6, r6, r5
        cmp     r6, lr, asr #31
        mov     r2, r3
        mov     r0, #0x31
        and     r12, r6, #2, 2
        bne     LAAH17
        ldr     r2, [pc, #0x63C]
        mov     r0, #0x51
        mov     r6, lr
        ldr     r2, [r2, #0x10]
        umull   r5, r2, r2, r1
        adds    r2, r4, r2
        adc     lr, r3, #0
        cmp     r6, lr, asr #31
        bne     LAAH17
        mov     r6, lr
        mov     lr, r2
        mov     r2, r5
        mov     r0, #0x71
LAAH17:
        cmp     r12, #0
        moveq   r3, r6
        rsbne   r3, r6, #0
        clz     r3, r3
        cmp     r3, #0
        subne   r3, r3, #1
        rsb     r12, r3, #0x20
        mov     r2, r2, lsr r12
        mov     r12, lr, lsr r12
        orr     r6, r12, r6, lsl r3
        orr     r7, r2, lr, lsl r3
        add     r11, r0, r3
LAAH18:
        mov     r0, #1
        str     r0, [sp, #8]
        tst     r1, #0x40
        mov     r4, #0
        str     r0, [sp, #4]
        beq     LAAH19
        ldr     r0, [sp]
        str     r4, [sp, #4]
        eor     r0, r0, #2, 2
        str     r0, [sp]
LAAH19:
        and     r5, r1, #0x3F
        tst     r5, #0x20
        beq     LAAH20
        ldr     r0, [sp, #4]
        rsbs    r7, r7, #0
        rsb     r5, r5, #0x40
        rsb     r0, r0, #1
        rsc     r6, r6, #0
        str     r0, [sp, #4]
LAAH20:
        cmn     r6, #6, 2
        beq     LAAH49
LAAH21:
        ldr     r8, [pc, #0x570]
        ldr     r1, [pc, #0x570]
        add     r0, r6, r7, lsr #31
        smull   lr, r2, r0, r7
        ldr     lr, [pc, #0x568]
        smull   r3, r12, r0, r0
        str     r2, [sp, #0x34]
        smull   r2, lr, r2, lr
        str     lr, [sp, #0x30]
        umull   r1, lr, r1, r12
        mov     r1, r11, lsl #1
        sub     r2, r1, #0x80
        add     r1, r2, #1
        add     r9, r2, #2
        add     lr, r8, lr, lsr r1
        umull   r8, lr, r12, lr
        rsb     r10, r2, #0x1E
        str     r10, [sp, #0x2C]
        sub     r10, r2, #1
        str     r10, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        mov     r8, r8, lsr r9
        orr     r8, r8, lr, lsl r10
        ldr     r10, [pc, #0x520]
        adds    r10, r8, r10
        umull   r10, r8, r12, r10
        ldr     r10, [pc, #0x514]
        adc     lr, r10, lr, lsr r9
        umull   r10, r9, r3, lr
        umull   lr, r10, lr, r12
        adds    r9, r8, r9
        adc     r8, r4, #0
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        adds    r9, lr, r9
        ldr     lr, [sp, #0x24]
        mov     r8, r10, asr r8
        rsb     r10, r2, #0x1F
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        mov     r9, r9, lsr r1
        adc     lr, r10, lr
        ldr     r10, [sp, #0x30]
        orr     r9, r9, lr, lsl r10
        ldr     r10, [pc, #0x4C0]
        adds    r9, r9, r10
        ldr     r10, [pc, #0x4B8]
        adc     lr, r10, lr, lsr r1
        adds    r9, r8, r9
        umull   r9, r1, r12, r9
        adc     r8, lr, r8, asr #31
        umull   lr, r3, r3, r8
        umull   r12, lr, r12, r8
        adds    r8, r1, r3
        adc     r1, r4, #0
        mov     r3, r2, asr #31
        adds    r12, r12, r8
        ldr     r8, [sp, #0x34]
        adc     lr, lr, r1
        adds    r12, r12, r8
        smull   r9, r1, r0, r12
        adc     r8, lr, r8, asr #31
        add     r12, r8, r12, lsr #31
        smull   r0, r12, r0, r12
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        adds    r0, r7, r0
        adc     r1, r6, r1
        eor     r6, r1, r6
        cmp     r6, #0
        blt     LAAH48
LAAH22:
        cmp     r5, #0
        bne     LAAH25
        ldr     r2, [sp, #4]
        cmp     r2, #0
        bne     LAAH35
        mov     r2, r1
        cmp     r2, r0, asr #31
        bne     LAAH23
        mov     r2, r0
        mov     r1, r0
        add     r11, r11, #0x20
        mov     r0, r4
LAAH23:
        cmp     r0, #0
        streq   r4, [sp, #8]
        cmp     r2, #0
        bge     LAAH24
        ldr     r3, [sp, #8]
        add     r3, r2, r3
        rsb     r2, r3, #0
LAAH24:
        clz     r2, r2
        sub     r5, r2, #1
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        add     r7, r5, r11
        mov     r5, r0
        mov     r6, r1
        mov     r2, #1, 2
        mov     r10, #0x3E
        b       LAAH31
LAAH25:
        ldr     r3, [pc, #0x3E8]
        ldr     r2, [pc, #0x3E8]
        add     r12, r3, r5, lsl #3
        ldr     r9, [r3, +r5, lsl #3]
        ldr     r8, [r12, #4]
        ldrsb   r10, [r5, +r2]
        umull   r3, r2, r1, r9
        umull   r12, r3, r0, r8
        adds    r3, r2, r3
        umull   r12, r2, r1, r8
        adc     r4, r4, #0
        adds    r12, r12, r3
        adc     r3, r2, r4
        cmp     r1, #0
        blt     LAAH47
LAAH26:
        add     r2, r11, r10
        sub     r2, r2, #0x7E
        cmp     r2, #0x20
        blt     LAAH27
        mov     r12, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LAAH27:
        mov     r12, r12, lsr r2
        rsb     lr, r2, #0x20
        orr     r12, r12, r3, lsl lr
        mov     lr, #0
        subs    r5, lr, r12
        mov     r12, #1, 2
        sbc     r6, r12, r3, asr r2
        cmp     r6, #1, 2
        mov     r7, #0x3E
        bge     LAAH28
        mov     r2, r5, lsr #31
        orr     r6, r2, r6, lsl #1
        mov     r5, r5, lsl #1
        mov     r7, #0x3F
LAAH28:
        sub     r2, r11, r10
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r9, r0, r9
        adc     r8, r1, r8
        cmp     r8, #0
        bge     LAAH29
        mov     r2, r8, lsl #31
        orr     r4, r2, r9, lsr #1
        mov     r2, r8, lsr #1
        sub     r10, r10, #1
        b       LAAH30
LAAH29:
        clz     r2, r8
        sub     r3, r2, #1
        rsb     r2, r3, #0x20
        mov     r2, r9, lsr r2
        orr     r2, r2, r8, lsl r3
        add     r10, r10, r3
        mov     r4, r9, lsl r3
LAAH30:
        ldr     r3, [sp, #4]
        cmp     r3, #0
        bne     LAAH31
        mov     lr, r4
        mov     r12, r2
        mov     r3, r7
        mov     r4, r5
        mov     r2, r6
        mov     r7, r10
        mov     r5, lr
        mov     r6, r12
        mov     r10, r3
LAAH31:
        mvn     r3, #2, 2
        bics    r3, r6, r3
        mov     r12, r5, lsr #31
        orr     r6, r12, r6, lsl #1
        mov     r5, r5, lsl #1
        beq     LAAH32
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
LAAH32:
        ldr     r0, [pc, #0x2C4]
        mov     r12, #2, 2
        mov     lr, r6, lsr #7
        add     r0, r0, r6, lsr #26
        ldrsb   r0, [r0, #-0x20]
        mov     r1, #0
        mul     lr, lr, r0
        mov     lr, lr, lsr #7
        rsb     lr, lr, #0
        add     lr, lr, #2, 8
        mul     lr, lr, r0
        umull   r8, r0, r6, lr
        subs    r0, r12, r0
        sbc     r8, r1, #0
        umull   r0, r9, lr, r0
        mla     r9, lr, r8, r9
        mov     lr, r9, lsl #2
        orr     r0, lr, r0, lsr #30
        umull   r8, lr, r6, r0
        subs    r8, r1, r8
        umull   r9, r8, r0, r8
        sbc     lr, r12, lr
        umull   lr, r0, r0, lr
        adds    lr, r8, lr
        adc     r0, r0, #0
        mov     r0, r0, lsl #2
        orr     r0, r0, lr, lsr #30
        umull   r8, r5, r0, r5
        mov     lr, lr, lsl #2
        umull   r9, r8, r6, lr
        adds    r9, r8, r5
        umull   r11, r5, r6, r0
        adc     r8, r1, #0
        adds    r9, r9, r11
        adc     r5, r8, r5
        subs    r8, r1, r9
        sbc     r12, r12, r5
        umull   r5, r9, r12, lr
        umull   lr, r8, r0, r8
        umull   r12, r0, r0, r12
        adds    lr, r5, lr
        adc     r8, r9, r8
        and     lr, lr, #3
        adds    r12, r8, r12
        adc     r0, r0, #0
        orr     lr, lr, r12, lsl #2
        adds    r6, lr, r6, lsr #31
        mov     r12, r12, lsr #30
        orr     r0, r12, r0, lsl #2
        adc     r12, r0, #0
        cmp     r3, #0
        beq     LAAH33
        rsbs    r6, r6, #0
        rsc     r12, r12, #0
LAAH33:
        umull   r6, r0, r6, r2
        umull   lr, r3, r12, r4
        adds    r0, r3, r0
        umull   lr, r3, r12, r2
        adc     r1, r1, #0
        rsb     r7, r7, #0x7D
        adds    r0, lr, r0
        adc     r1, r3, r1
        cmp     r12, #0
        blt     LAAH46
LAAH34:
        add     r7, r10, r7
        sub     r11, r7, #0x40
LAAH35:
        mvn     r2, #2, 2
        bics    r2, r1, r2
        beq     LAAH36
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAAH36:
        mov     r3, #0x3F
        add     r12, r3, #0xFD, 30
        add     r12, r12, #9
        rsb     r11, r11, r12
        clz     r12, r1
        cmp     r12, #0x20
        beq     LAAH45
LAAH37:
        sub     lr, r12, #1
        rsb     r12, lr, #0x20
        mov     r12, r0, lsr r12
        orr     r12, r12, r1, lsl lr
        subs    r1, r11, lr
        mov     r0, r0, lsl lr
        bpl     LAAH39
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAAH38
        mov     r0, r12
        mov     r12, r12, asr #31
        sub     r1, r1, #0x20
LAAH38:
        cmp     r1, #0x20
        mov     lr, #0x20
        movgt   r1, lr
        mov     r0, r0, lsr r1
        rsb     lr, r1, #0x20
        orr     r0, r0, r12, lsl lr
        mov     r12, r12, asr r1
        mov     r1, #0
LAAH39:
        mov     lr, r0, lsr #9
        mov     r4, r12, lsl #22
        orr     r0, r4, r0, lsr #10
        and     lr, lr, #1
        adds    r0, lr, r0
        mov     r12, r12, lsr #10
        adc     lr, r12, lr, asr #31
        orrs    r12, lr, lr, asr #31
        moveq   r1, #0
        beq     LAAH40
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        sub     r12, r12, #1
        cmp     r12, r1
        bgt     LAAH40
        mov     r0, #0
        add     r1, r3, #0x1F, 26
        mov     lr, r0
LAAH40:
        add     r1, lr, r1, lsl #20
        orr     r2, r1, r2
        ldr     r1, [sp]
        eor     r1, r2, r1
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAAH41:
        subs    r7, r7, r0
        ldr     r0, [sp, #4]
        sbc     r6, r6, r0
        b       LAAH4
LAAH42:
        str     r5, [sp, #8]
        b       LAAH3
LAAH43:
        clz     r12, r0
        cmp     r12, #0
        beq     LAAH8
        mov     r1, r0
        sub     r3, r3, #0x20
        mov     r2, r12
        mov     r0, r4
        b       LAAH8
LAAH44:
        mov     r2, r1, lsl #31
        add     r7, r7, #7
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        str     r7, [sp, #4]
        b       LAAH6
LAAH45:
        clz     lr, r0
        cmp     lr, #0
        beq     LAAH37
        mov     r1, r0
        sub     r11, r11, #0x20
        mov     r12, lr
        mov     r0, #0
        b       LAAH37
LAAH46:
        subs    r0, r0, r4
        sbc     r1, r1, r2
        b       LAAH34
LAAH47:
        subs    r12, r12, r9
        sbc     r3, r3, r8
        b       LAAH26
LAAH48:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, asr #1
        eor     r0, r0, #0
        eor     r1, r1, #2, 2
        sub     r11, r11, #1
        b       LAAH22
LAAH49:
        mov     r0, r6, lsl #31
        orr     r7, r0, r7, lsr #1
        mov     r6, r6, asr #1
        sub     r11, r11, #1
        b       LAAH21
        .long   LAAH_inv2p7_pi_long
        .long   LAAH_pi_over_2p7_long
        .long   0x6e86e86f
        .long   0x5993d221
        .long   0x55555555
        .long   0x44444444
        .long   LAAH_inv2p7_pi_short
        .long   LAAH_pi_over_2p7
        .long   LAAH_tan_table
        .long   LAAH_sc_tan_tbl
        .long   LAAH_rcp63_table


        .data
        .align  4


LAAH_tan_table:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xEF,0xBF,0x47,0xEA,0x91,0x18,0x8D,0x64
        .byte   0x0D,0x88,0x45,0xEC,0x28,0x9E,0x9C,0x64,0x88,0xC5,0xE0,0xFC,0x33,0xE7,0x88,0x4B
        .byte   0x88,0x89,0xB6,0x6C,0x31,0xEE,0xDA,0x64,0x77,0xA3,0xE7,0x36,0xEA,0x60,0x4C,0x7E
        .byte   0x96,0x00,0x19,0x98,0xCE,0xB1,0xF2,0x4B,0x31,0xD7,0x34,0x38,0x43,0x26,0xD7,0x58
        .byte   0x1F,0x60,0xC5,0x54,0x81,0xD7,0xD7,0x65,0x4A,0xC9,0x33,0x2D,0xAD,0x33,0xF9,0x72
        .byte   0xAD,0xB8,0x9A,0x18,0xD6,0xE9,0x1F,0x40,0xE6,0xA4,0x5F,0xD6,0xF4,0x40,0xD8,0x46
        .byte   0x14,0x6F,0x8F,0x71,0xD5,0x20,0xA8,0x4D,0xBF,0x5D,0x6C,0xC0,0x85,0x2B,0x92,0x54
        .byte   0xBC,0x24,0x19,0x5E,0xDF,0x27,0x99,0x5B,0x46,0x87,0x40,0xCF,0x5A,0x06,0xC0,0x62
        .byte   0x09,0xC9,0xBC,0xF3,0x67,0xE6,0x09,0x6A,0x40,0xD8,0x9E,0x79,0x61,0x1C,0x7A,0x71
        .byte   0x41,0xE9,0xF9,0x9C,0x34,0x38,0x14,0x79,0x0C,0xDD,0xF3,0x69,0x6D,0x06,0x6E,0x40
        .byte   0x1B,0xAE,0xD3,0x20,0x64,0xDC,0x6A,0x44,0x36,0x94,0xE0,0x11,0xBC,0xD7,0x82,0x48
        .byte   0xEF,0xF2,0xFF,0x11,0x24,0x62,0xB8,0x4C,0x58,0x6A,0x97,0x73,0x6E,0x1B,0x0E,0x51
        .byte   0x7B,0x41,0xE6,0xDF,0xAA,0xE0,0x86,0x55,0xA2,0xD8,0x76,0xD4,0x51,0xD4,0x25,0x5A
        .byte   0x56,0x3A,0x43,0xA6,0xB4,0x67,0xEE,0x5E,0x44,0xAB,0x7B,0xE1,0xEF,0x65,0xE4,0x63
        .byte   0x2D,0x3F,0xA1,0x90,0xAB,0x00,0x0C,0x69,0xB8,0xC8,0x6B,0x30,0x06,0xDF,0x69,0x6E
        .byte   0xC7,0xB8,0x34,0xE1,0x1C,0x2F,0x03,0x74,0x91,0x19,0x5C,0x24,0xBF,0xBA,0xDD,0x79
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x40
LAAH_inv2p7_pi_short:
        .byte   0xB7,0xC1,0x7C,0x51
LAAH_pi_over_2p7:
        .byte   0x90,0x0C,0x00,0x00,0x16,0x22,0xAA,0xFD,0x4C,0x4C,0x23,0x8C,0x0E,0xB8,0x28,0x66
        .byte   0x70,0xED,0x32,0x3E
LAAH_sc_tan_tbl:
        .byte   0x48,0x44,0x43,0x42,0x42,0x42,0x41,0x41,0x41,0x41,0x40,0x40,0x40,0x40,0x40,0x40
        .byte   0x40,0x40,0x40,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F
        .byte   0x3E,0x00,0x00,0x00
LAAH_rcp63_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41
LAAH_inv2p7_pi_long:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x6E,0x83,0xF9,0xA2,0x29,0x15,0x44,0x4E
        .byte   0xD1,0x57,0x27,0xFC,0xC0,0xDD,0x34,0xF5,0x99,0x95,0x62,0xDB,0x41,0x90,0x43,0x3C
        .byte   0xAB,0x63,0x51,0xFE,0x61,0xC5,0xBB,0xDE,0x3A,0x6E,0x24,0xB7,0xE0,0xD2,0x4D,0x42
        .byte   0xEA,0x2E,0x49,0x06,0x1C,0x92,0xD1,0x09,0x1C,0xEB,0x1D,0xFE,0x3E,0xA7,0x29,0xB1
        .byte   0xF5,0x35,0x82,0xE8,0x84,0x44,0xBB,0x2E,0x26,0x70,0x9C,0xE9,0x41,0x7E,0x5F,0xB4
        .byte   0x39,0xD6,0x91,0x39,0xF4,0x39,0x53,0x83,0x8B,0x5F,0x84,0x9C,0x3B,0x28,0xF9,0xBD
        .byte   0xFF,0x97,0xF8,0x1F,0x0F,0x98,0x05,0xDE,0x8B,0x11,0x2F,0xEF,0x1F,0x6D,0x0A,0x5A
        .byte   0xCF,0x7E,0x36,0x6D,0xB7,0x09,0xCB,0x27,0x66,0x3F,0x46,0x4F,0x2D,0xEA,0x5F,0x9E
        .byte   0xC7,0xBA,0x27,0x75,0x7B,0xF1,0xE5,0xEB,0xF7,0x39,0x07,0x3D,0xEA,0x92,0x52,0x8A
        .byte   0xB1,0x5F,0xFB,0x6B,0x08,0x5D,0x8D,0x1F,0x46,0x30,0x03,0x56,0xAB,0x6B,0x7B,0xFC
        .byte   0x21,0xBC,0xCF,0xF0
LAAH_pi_over_2p7_long:
        .byte   0xA2,0xDA,0x0F,0xC9,0x35,0xC2,0x68,0x21


