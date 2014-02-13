        .text
        .align  4
        .globl  cos


cos:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mvn     r2, #0xFF, 12
        mvn     r6, #2, 2
        and     r5, r1, r6
        bic     r2, r2, #0xF, 4
        movs    r3, r5, lsl #1
        and     r2, r5, r2
        mov     r4, #0
        moveq   r3, #2, 12
        orrne   r2, r2, #1, 12
        bics    lr, r5, r6
        mov     r12, r0
        beq     LADQ0
        rsbs    r12, r12, #0
        rsc     r2, r2, #0
LADQ0:
        mov     r7, #0xDE
        mov     lr, #0xFF, 12
        orr     r7, r7, #3, 24
        add     r8, r7, #0x55
        orr     lr, lr, #3, 4
        sub     r7, lr, #0x16, 14
        sub     r7, r5, r7
        cmp     r7, #0x4A, 14
        sub     r3, r8, r3, lsr #21
        bcc     LADQ13
        add     lr, lr, #0xD, 12
        cmp     lr, r5
        bhi     LADQ7
        mov     lr, #0xFF
        orr     lr, lr, #7, 24
        cmp     r5, lr, lsl #20
        bcc     LADQ3
        cmp     r5, lr, lsl #20
        bne     LADQ1
        cmp     r0, #0
        subeq   r1, r4, #2, 14
        beq     LADQ2
LADQ1:
        orr     r1, r1, #2, 14
LADQ2:
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LADQ3:
        ldr     r0, [pc, #0xDC4]
        rsb     r3, r3, #0x34
        add     r1, r3, #9
        mov     lr, r1, lsr #5
        ldr     r1, [r0, +lr, lsl #2]
        sub     r3, r3, lr, lsl #5
        add     r0, r0, lr, lsl #2
        ldr     lr, [r0, #0x14]
        umull   r1, r5, r12, r1
        umull   r7, r8, r12, lr
        str     r1, [sp, #4]
        ldr     r1, [r0, #0x10]
        ldr     r5, [r0, #0x18]
        str     r7, [sp]
        umull   r7, lr, lr, r2
        str     lr, [sp, #8]
        umull   r5, r9, r2, r5
        umull   lr, r10, r12, r1
        str     r10, [sp, #0xC]
        adds    r8, r8, r7
        str     lr, [sp, #0x10]
        umull   lr, r1, r1, r2
        str     r1, [sp, #0x14]
        ldr     r1, [r0, #0xC]
        ldr     r7, [r0, #8]
        umull   r10, r11, r12, r1
        str     r11, [sp, #0x18]
        str     r10, [sp, #0x1C]
        umull   r1, r10, r1, r2
        str     r1, [sp, #0x20]
        ldr     r11, [r0, #4]
        umull   r0, r1, r7, r2
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x28]
        umull   r0, r1, r12, r7
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #8]
        adc     r7, r1, #0
        umull   r1, r12, r12, r11
        umull   r2, r11, r11, r2
        ldr     r11, [sp]
        adds    r5, r11, r5
        str     r5, [sp, #8]
        ldr     r5, [sp, #0xC]
        adc     r9, r9, #0
        adds    r8, r8, r9
        adc     r7, r7, #0
        adds    r5, r5, lr
        ldr     lr, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        add     r11, r3, #0x12
        adc     lr, lr, #0
        adds    r8, r9, r8
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        adc     r7, r7, #0
        adds    r5, r7, r5
        ldr     r7, [sp, #0x20]
        adc     lr, lr, #0
        adds    r2, r12, r2
        adds    r7, r8, r7
        ldr     r8, [sp, #0x1C]
        adc     r10, r10, #0
        adds    r5, r8, r5
        ldr     r8, [sp, #0x2C]
        adc     lr, lr, #0
        adds    r7, lr, r7
        ldr     lr, [sp, #0x28]
        adc     r10, r10, #0
        adds    r8, r8, lr
        ldr     lr, [sp, #0x24]
        adc     lr, lr, #0
        adds    r7, r0, r7
        adc     r10, r10, #0
        adds    r8, r10, r8
        adc     lr, lr, #0
        adds    r8, r1, r8
        ldr     r1, [sp, #4]
        adc     lr, lr, #0
        adds    lr, lr, r2
        add     r2, r3, #0xA
        adds    r1, r1, lr
        mov     r1, r1, lsl r2
        mov     r10, r1, lsr r2
        rsb     r2, r2, #0x38
        mov     r0, r8
        mov     r1, r10
        mov     r3, #0
        bl      __lshrdi3
        mov     r9, r0
        mov     r0, r8
        mov     r1, r10
        mov     r2, r11
        mov     r3, #0
        bl      __ashldi3
        mov     r2, r11
        mov     r3, #0
        bl      __ashrdi3
        add     r2, sp, #0x30
        str     r1, [r2]
        add     r3, sp, #0x30
        str     r0, [r3, #4]
        add     r12, sp, #0x30
        add     r3, sp, #0x30
        str     r7, [r3, #8]
        mov     r2, r1, asr #31
        ldr     r1, [r12]
        ldr     r12, [r12, #4]
        add     r3, sp, #0x30
        str     r5, [r3, #0xC]
        ldr     r3, [sp, #0x14]
        cmp     r1, r12, asr #31
        add     r12, sp, #0x30
        str     r3, [r12, #0x10]
        ldr     r3, [sp, #8]
        add     r1, sp, #0x30
        rsb     r8, r11, #0x40
        str     r3, [r1, #0x14]
        mov     r12, r4
        addne   r1, sp, #0x30
        ldrne   r5, [r1]
        bne     LADQ5
        mov     r3, r4
LADQ4:
        add     lr, sp, #0x30
        add     r3, r3, #4
        add     r12, r12, #1
        ldr     r5, [lr, +r12, lsl #2]
        add     r1, lr, r3
        ldr     lr, [r1, #4]
        add     r8, r8, #0x20
        cmp     r5, lr, asr #31
        bne     LADQ5
        cmp     r12, #5
        bcc     LADQ4
LADQ5:
        cmp     r2, #0
        rsbne   r5, r5, #0
        ldr     lr, [r1, #4]
        ldr     r1, [pc, #0xBA4]
        clz     r5, r5
        add     r3, sp, #0x30
        sub     r0, r9, r2
        sub     r2, r5, #1
        ldr     r5, [r3, +r12, lsl #2]
        add     r12, r3, r12, lsl #2
        ldr     r3, [r12, #8]
        ldr     r12, [r1]
        ldr     r1, [r1, #4]
        rsb     r9, r2, #0x20
        mov     r7, r3, lsr r9
        mov     r9, lr, lsr r9
        orr     r3, r9, r5, lsl r2
        orr     r5, r7, lr, lsl r2
        umull   lr, r10, r12, r5
        umull   r9, r7, r12, r3
        umull   r11, r5, r5, r1
        adds    r10, r10, r9
        adc     r9, r7, #0
        umull   r7, r11, r3, r1
        adds    r10, r11, r10
        adc     r9, r9, #0
        adds    r7, r7, lr
        adc     lr, r4, #0
        adds    r7, r5, r7
        adc     lr, lr, #0
        adds    r10, lr, r10
        adc     r9, r9, #0
        cmp     r3, #0
        blt     LADQ41
LADQ6:
        add     r8, r2, r8
        add     r5, r8, #5
        b       LADQ18
LADQ7:
        cmp     r5, #0xF9, 10
        mov     r5, #0x3E
        bcc     LADQ45
        ldr     r0, [pc, #0xB14]
        ldr     r1, [pc, #0xB14]
        mov     r7, r12, lsr #24
        mov     lr, r12, lsl #8
        orr     r2, r7, r2, lsl #8
        mov     r3, r3, lsl #1
        add     r2, r2, lr, lsr #31
        smull   r7, r12, r2, r2
        umull   r8, r9, r1, r12
        smull   r2, lr, r2, lr
        sub     r1, r3, #0x70
        smull   r2, r3, lr, r0
        add     r10, r1, #5
        rsb     r11, r1, #0x1B
        mov     r8, r8, lsr r10
        orr     r11, r8, r9, lsl r11
        subs    r8, r0, r11
        umull   r11, r8, r12, r8
        sbc     r10, r0, r9, lsr r10
        umull   r9, r0, r7, r10
        adds    r8, r8, r0
        umull   r0, r9, r10, r12
        adc     r10, r4, #0
        mov     r11, r3, lsl #2
        mov     lr, lr, lsl #1
        orr     r2, r11, r2, lsr #30
        adds    r8, r0, r8
        adc     r10, r9, r10
        adds    r8, r2, r8
        umull   r8, r0, r12, r8
        adc     r3, r10, r3, asr #30
        umull   r8, r2, r7, r3
        umull   r3, r8, r12, r3
        adds    r0, r0, r2
        adc     r2, r4, #0
        adds    r3, r3, r0
        adc     r0, r8, r2
        add     r2, r1, #2
        rsb     r8, r1, #0x1E
        mov     r3, r3, lsr r2
        orr     r8, r3, r0, lsl r8
        subs    r7, r7, r8
        sbc     r12, r12, r0, lsr r2
        add     r2, r1, #3
        adds    r0, lr, r7
        adc     r1, r12, lr, asr #31
        mov     r3, r2, asr #31
        bl      __lshrdi3
        subs    r0, r4, r0
        mov     r2, #1, 2
        sbc     r1, r2, r1
        bics    r6, r1, r6
        beq     LADQ8
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADQ8:
        clz     r2, r1
        cmp     r2, #0x20
        add     r3, r5, #0xF, 26
        beq     LADQ42
LADQ9:
        sub     r12, r2, #1
        rsb     r2, r12, #0x20
        mov     r2, r0, lsr r2
        orr     r2, r2, r1, lsl r12
        subs    r1, r3, r12
        mov     r12, r0, lsl r12
        bpl     LADQ11
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADQ10
        mov     r12, r2
        mov     r2, r2, asr #31
        sub     r1, r1, #0x20
LADQ10:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r12, r12, lsr r1
        rsb     r0, r1, #0x20
        orr     r12, r12, r2, lsl r0
        mov     r2, r2, asr r1
        mov     r1, r4
LADQ11:
        mov     r0, r12, lsr #9
        and     r3, r0, #1
        mov     r0, r2, lsl #22
        orr     r12, r0, r12, lsr #10
        adds    r0, r3, r12
        mov     r2, r2, lsr #10
        adc     r3, r2, r3, asr #31
        orrs    r2, r3, r3, asr #31
        moveq   r1, r4
        beq     LADQ12
        add     r5, r5, #0x1F, 26
        cmp     r5, r1
        bgt     LADQ12
        mov     r1, #0xFE
        mov     r0, r4
        orr     r1, r1, #7, 24
        add     r1, r1, #1
        mov     r3, r0
LADQ12:
        add     r1, r3, r1, lsl #20
        orr     r6, r1, r6
        eor     r1, r6, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LADQ13:
        ldr     r0, [pc, #0x980]
        ldr     r1, [pc, #0x980]
        ldr     lr, [r0]
        sub     r0, r3, #0x28
        umull   lr, r5, lr, r2
        mov     r0, r5, lsr r0
        ldr     lr, [r1, #0xC]
        ldr     r5, [r1, #8]
        ldr     r7, [r1, #4]
        add     r0, r0, #1
        ldr     r1, [r1]
        mov     r0, r0, lsr #1
        umull   r8, r5, r5, r0
        umull   lr, r9, lr, r0
        umull   r10, r7, r7, r0
        mul     r1, r1, r0
        adds    r9, r8, r9
        adc     r5, r5, #0
        adds    r10, r10, r5
        adc     r7, r7, #0
        adds    r1, r1, r7
        cmp     r3, #0x31
        bgt     LADQ14
        sub     r7, r3, #0x11
        rsb     r5, r3, #0x31
        mov     r7, r12, lsr r7
        orr     r3, r7, r2, lsl r5
        mov     r2, r12, lsl r5
        mov     r5, r4
        b       LADQ15
LADQ14:
        sub     r8, r3, #0x31
        rsb     r5, r3, #0x51
        mov     r7, r12, lsr r8
        mov     r3, r2, lsr r8
        orr     r2, r7, r2, lsl r5
        mov     r5, r12, lsl r5
LADQ15:
        cmp     r9, r5
        cmpeq   lr, r4
        bls     LADQ16
        adds    r10, r10, #1
        adc     r1, r1, #0
LADQ16:
        subs    lr, r4, lr
        sbc     r9, r5, r9
        subs    r10, r2, r10
        sbc     r3, r3, r1
        cmp     r3, r10, asr #31
        mov     r2, r9
        mov     r1, #0x31
        and     r12, r3, #2, 2
        bne     LADQ17
        ldr     r2, [pc, #0x8BC]
        mov     r1, #0x51
        mov     r3, r10
        ldr     r2, [r2, #0x10]
        umull   r5, r2, r2, r0
        adds    r2, lr, r2
        adc     r10, r9, #0
        cmp     r3, r10, asr #31
        bne     LADQ17
        mov     r3, r10
        mov     r10, r2
        mov     r2, r5
        mov     r1, #0x71
LADQ17:
        cmp     r12, #0
        moveq   r12, r3
        rsbne   r12, r3, #0
        clz     r12, r12
        cmp     r12, #0
        subne   r12, r12, #1
        rsb     lr, r12, #0x20
        mov     r2, r2, lsr lr
        mov     lr, r10, lsr lr
        orr     r9, lr, r3, lsl r12
        orr     r10, r2, r10, lsl r12
        add     r5, r1, r12
LADQ18:
        tst     r0, #0x80
        movne   r4, #2, 2
        ands    r1, r0, #0x40
        moveq   r2, #0
        streq   r2, [sp, #4]
        movne   r2, #1
        strne   r2, [sp, #4]
        cmp     r1, #0
        eorne   r4, r4, #2, 2
        and     r8, r0, #0x3F
        tst     r8, #0x20
        beq     LADQ19
        ldr     r0, [sp, #4]
        rsbs    r10, r10, #0
        rsb     r8, r8, #0x40
        rsb     r0, r0, #1
        rsc     r9, r9, #0
        str     r0, [sp, #4]
LADQ19:
        ldr     r0, [pc, #0x804]
        cmp     r8, #0
        bne     LADQ28
        add     r3, r9, r10, lsr #31
        mov     r1, r5, lsl #1
        cmp     r3, #2, 2
        sub     r1, r1, #0x80
        bne     LADQ20
        mov     r2, r9, lsl #31
        orr     r10, r2, r10, lsr #1
        mov     r9, r9, asr #1
        sub     r1, r1, #2
        sub     r5, r5, #1
        add     r3, r9, r10, lsr #31
LADQ20:
        ldr     r2, [sp, #4]
        add     r12, r1, #2
        cmp     r2, #0
        beq     LADQ21
        smull   r2, r11, r3, r3
        smull   r8, r7, r3, r10
        str     r7, [sp, #0x28]
        smull   r7, r8, r7, r0
        str     r2, [sp, #0x2C]
        ldr     r2, [pc, #0x7B8]
        str     r8, [sp, #0x24]
        add     r7, r1, #6
        add     r8, r1, #4
        umull   r2, lr, r2, r11
        ldr     r2, [pc, #0x7A8]
        sub     r7, r2, lr, lsr r7
        umull   lr, r2, r11, r7
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        rsb     r7, r1, #0x1C
        mov     r12, r2, asr r12
        add     r2, r1, #1
        ldr     r1, [sp, #0x20]
        mov     lr, lr, lsr r8
        orr     r7, lr, r1, lsl r7
        ldr     lr, [sp, #0x20]
        subs    r1, r0, r7
        sbc     r8, r0, lr, lsr r8
        subs    r1, r1, r12
        umull   r1, r0, r11, r1
        ldr     r1, [sp, #0x2C]
        sbc     r12, r8, r12, asr #31
        umull   r1, lr, r1, r12
        umull   r11, r1, r11, r12
        mov     r12, #0
        adds    r0, r0, lr
        adc     r12, r12, #0
        adds    r0, r11, r0
        adc     r12, r1, r12
        ldr     r1, [sp, #0x28]
        adds    r0, r0, r1
        adc     r12, r12, r1, asr #31
        smull   lr, r1, r3, r0
        add     r0, r12, r0, lsr #31
        smull   r0, r12, r3, r0
        mov     r3, r2, asr #31
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        subs    r10, r10, r0
        sbc     r9, r9, r1
        b       LADQ22
LADQ21:
        smull   lr, r5, r3, r3
        smull   r10, r3, r3, r10
        ldr     r2, [pc, #0x6F8]
        add     r9, r1, #5
        rsb     r11, r1, #0x1B
        umull   r7, r10, r2, r5
        smull   r8, r2, r3, r0
        mov     r3, r3, lsl #1
        mov     r7, r7, lsr r9
        orr     r11, r7, r10, lsl r11
        subs    r7, r0, r11
        umull   r11, r7, r5, r7
        sbc     r9, r0, r10, lsr r9
        umull   r0, r10, lr, r9
        umull   r0, r9, r9, r5
        adds    r11, r7, r10
        mov     r7, #0
        str     r8, [sp, #0x2C]
        adc     r10, r7, #0
        ldr     r7, [sp, #0x2C]
        adds    r11, r0, r11
        mov     r8, r2, lsl #2
        adc     r10, r9, r10
        orr     r8, r8, r7, lsr #30
        adds    r11, r8, r11
        umull   r11, r0, r5, r11
        adc     r2, r10, r2, asr #30
        umull   r9, r8, lr, r2
        umull   r9, r10, r2, r5
        rsb     r7, r1, #0x1E
        adds    r0, r0, r8
        add     r2, r1, #3
        mov     r1, #0
        adc     r1, r1, #0
        adds    r0, r9, r0
        adc     r1, r10, r1
        mov     r0, r0, lsr r12
        orr     r7, r0, r1, lsl r7
        subs    lr, lr, r7
        sbc     r12, r5, r1, lsr r12
        adds    r0, r3, lr
        adc     r1, r12, r3, asr #31
        mov     r3, r2, asr #31
        bl      __lshrdi3
        mov     r2, #0
        mov     r8, #1, 2
        subs    r10, r2, r0
        sbc     r9, r8, r1
        mov     r5, #0x3E
LADQ22:
        bics    r6, r9, r6
        beq     LADQ23
        rsbs    r10, r10, #0
        rsc     r9, r9, #0
LADQ23:
        mov     r0, #0xDE
        orr     r0, r0, #3, 24
        add     r0, r0, #0x5E
        rsb     r5, r5, r0
        clz     r0, r9
        cmp     r0, #0x20
        beq     LADQ43
LADQ24:
        sub     r0, r0, #1
        rsb     r1, r0, #0x20
        mov     r1, r10, lsr r1
        subs    r2, r5, r0
        orr     r1, r1, r9, lsl r0
        mov     r0, r10, lsl r0
        bpl     LADQ26
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LADQ25
        mov     r0, r1
        mov     r1, r1, asr #31
        sub     r2, r2, #0x20
LADQ25:
        cmp     r2, #0x20
        mov     r3, #0x20
        movgt   r2, r3
        mov     r0, r0, lsr r2
        rsb     r3, r2, #0x20
        orr     r0, r0, r1, lsl r3
        mov     r1, r1, asr r2
        mov     r2, #0
LADQ26:
        mov     r3, r0, lsr #9
        mov     r12, r1, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r1, r1, lsr #10
        adc     r3, r1, r3, asr #31
        orrs    r1, r3, r3, asr #31
        moveq   r2, #0
        beq     LADQ27
        mov     r1, #0x3E
        add     r1, r1, #0x1F, 26
        cmp     r1, r2
        bgt     LADQ27
        mov     r0, #0xFE
        orr     r1, r0, #7, 24
        mov     r0, #0
        add     r2, r1, #1
        mov     r3, r0
LADQ27:
        add     r2, r3, r2, lsl #20
        orr     r6, r2, r6
        eor     r1, r6, r4
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LADQ28:
        add     r12, r9, r10, lsr #31
        mov     r1, r5, lsl #1
        cmp     r12, #2, 2
        sub     r6, r1, #0x80
        bne     LADQ29
        mov     r1, r9, lsl #31
        orr     r10, r1, r10, lsr #1
        mov     r9, r9, asr #1
        sub     r6, r6, #2
        sub     r5, r5, #1
        add     r12, r9, r10, lsr #31
LADQ29:
        smull   r2, r1, r12, r10
        ldr     r2, [pc, #0x538]
        str     r1, [sp, #0x2C]
        smull   r1, r3, r12, r12
        umull   r2, lr, r2, r3
        ldr     r2, [sp, #0x2C]
        smull   r2, r7, r2, r0
        str     r7, [sp, #0x28]
        ldr     r7, [pc, #0x510]
        str     r2, [sp, #0x24]
        ldr     r2, [pc, #0x518]
        umull   r7, r11, r7, r3
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x28]
        str     r7, [sp, #0x20]
        add     r7, r6, #6
        sub     r7, r2, lr, lsr r7
        umull   r2, lr, r3, r7
        rsb     r7, r6, #0x1C
        str     lr, [sp, #0x18]
        str     r7, [sp, #0x14]
        add     lr, r6, #4
        add     r7, r6, #2
        str     r7, [sp, #0x10]
        mov     r7, r11, asr r7
        str     r7, [sp, #0xC]
        ldr     r11, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        mov     r2, r2, lsr lr
        orr     r7, r2, r11, lsl r7
        subs    r2, r0, r7
        ldr     r7, [sp, #0x18]
        sbc     lr, r0, r7, lsr lr
        ldr     r7, [sp, #0xC]
        subs    r2, r2, r7
        umull   r2, r7, r3, r2
        ldr     r2, [sp, #0xC]
        str     r7, [sp, #0x18]
        sbc     lr, lr, r2, asr #31
        umull   r7, r2, r1, lr
        umull   lr, r7, lr, r3
        str     r7, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        adds    r7, r7, r2
        mov     r2, #0
        adc     r2, r2, #0
        str     r2, [sp, #0x18]
        adds    r7, lr, r7
        ldr     lr, [sp, #0x18]
        add     r2, r6, #5
        adc     lr, r11, lr
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x2C]
        adds    r7, lr, r7
        str     r7, [sp, #0x14]
        smull   r7, r11, r12, r7
        ldr     r7, [sp, #0x18]
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x1C]
        adc     lr, r7, lr, asr #31
        ldr     r7, [sp, #0x14]
        add     r7, lr, r7, lsr #31
        smull   lr, r12, r12, r7
        ldr     r7, [sp, #0x20]
        str     lr, [sp, #0x18]
        rsb     lr, r6, #0x1B
        mov     r7, r7, lsr r2
        orr     lr, r7, r11, lsl lr
        ldr     r7, [sp, #0x28]
        ldr     r11, [sp, #0x18]
        mov     r7, r7, lsl #2
        str     r7, [sp, #0x20]
        ldr     r7, [sp, #0xC]
        adds    r7, r11, r7
        ldr     r11, [sp, #0x20]
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0xC]
        adc     r7, r12, r7, asr #31
        str     r7, [sp, #0x14]
        subs    lr, r0, lr
        umull   r12, lr, r3, lr
        ldr     r12, [sp, #0x1C]
        sbc     r0, r0, r12, lsr r2
        umull   r12, r2, r1, r0
        umull   r0, r12, r0, r3
        adds    r7, lr, r2
        mov     r2, #0
        adc     lr, r2, #0
        ldr     r2, [sp, #0x24]
        adds    r7, r0, r7
        adc     lr, r12, lr
        orr     r2, r11, r2, lsr #30
        rsb     r11, r6, #0x1E
        adds    r7, r2, r7
        umull   r0, r2, r3, r7
        ldr     r0, [sp, #0x28]
        str     r11, [sp, #0x24]
        adc     lr, lr, r0, asr #30
        umull   r0, r12, r1, lr
        umull   r0, r7, r3, lr
        adds    r11, r2, r12
        mov     r2, #0
        adc     r12, r2, #0
        ldr     r2, [sp, #0x2C]
        adds    r11, r0, r11
        ldr     r0, [sp, #0x10]
        adc     r12, r7, r12
        mov     lr, r2, lsl #1
        add     r2, r6, #3
        mov     r11, r11, lsr r0
        ldr     r0, [sp, #0x24]
        orr     r0, r11, r12, lsl r0
        subs    r1, r1, r0
        ldr     r0, [sp, #0x10]
        sbc     r3, r3, r12, lsr r0
        adds    r0, lr, r1
        adc     r1, r3, lr, asr #31
        mov     r3, r2, asr #31
        bl      __lshrdi3
        mov     r2, #0
        subs    r2, r2, r0
        str     r2, [sp]
        ldr     r0, [sp, #0x18]
        mov     r7, r1
        ldr     r1, [sp, #0x14]
        add     r2, r6, #1
        mov     r12, #1, 2
        mov     r3, r2, asr #31
        sbc     r7, r12, r7
        bl      __ashrdi3
        ldr     r12, [pc, #0x338]
        subs    r3, r10, r0
        ldr     r0, [sp, #4]
        ldr     r2, [pc, #0x330]
        sbc     r9, r9, r1
        cmp     r0, #0
        add     r0, r12, r8, lsl #4
        ldr     r12, [r12, +r8, lsl #4]
        ldr     lr, [r0, #4]
        ldr     r1, [r0, #8]
        ldr     r0, [r0, #0xC]
        add     r6, r2, r8, lsl #3
        ldr     r8, [r2, +r8, lsl #3]
        ldr     r6, [r6, #4]
        mov     r2, r9, lsr #31
        beq     LADQ32
        cmp     r2, #0
        beq     LADQ30
        rsbs    r3, r3, #0
        rsc     r9, r9, #0
LADQ30:
        umull   r11, r10, r12, r7
        str     r10, [sp, #0x28]
        ldr     r10, [sp]
        str     r11, [sp, #0x2C]
        umull   r12, r11, r10, r12
        str     r11, [sp, #0x24]
        umull   r10, r12, r10, lr
        umull   r7, lr, lr, r7
        str     r10, [sp, #0x20]
        umull   r11, r10, r1, r3
        str     r10, [sp, #0x1C]
        umull   r3, r10, r3, r0
        ldr     r11, [sp, #0x2C]
        str     r10, [sp, #0x18]
        umull   r0, r10, r0, r9
        str     r3, [sp, #0x14]
        umull   r1, r3, r1, r9
        ldr     r9, [sp, #0x24]
        adds    r11, r11, r9
        ldr     r9, [sp, #0x28]
        adc     r9, r9, #0
        adds    r12, r7, r12
        ldr     r7, [sp, #0x20]
        adc     lr, lr, #0
        adds    r11, r7, r11
        adc     r9, r9, #0
        adds    r9, r9, r12
        ldr     r12, [sp, #0x1C]
        adc     r7, lr, #0
        adds    r1, r1, r12
        ldr     r12, [sp, #0x18]
        adc     r3, r3, #0
        adds    r0, r0, r12
        ldr     r12, [sp, #0x14]
        adc     r10, r10, #0
        adds    r1, r12, r1
        adc     r3, r3, #0
        adds    r0, r3, r0
        adc     r1, r10, #0
        cmp     r2, #0
        beq     LADQ31
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADQ31:
        sub     r5, r5, r8
        add     r6, r5, r6
        sub     r2, r6, #0x3E
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r9, r9, r0
        adc     r7, r7, r1
        add     r8, r8, #0x1E
        b       LADQ35
LADQ32:
        cmp     r2, #0
        beq     LADQ33
        rsbs    r3, r3, #0
        rsc     r9, r9, #0
LADQ33:
        umull   r3, r10, lr, r3
        umull   r12, r3, r12, r9
        ldr     r11, [sp]
        str     r10, [sp, #0x2C]
        str     r3, [sp, #0x28]
        umull   r3, r12, r9, lr
        umull   r9, lr, r1, r7
        umull   r1, r10, r1, r11
        umull   r1, r11, r11, r0
        umull   r0, r7, r7, r0
        adds    r10, r9, r10
        adc     lr, lr, #0
        adds    r11, r0, r11
        adc     r7, r7, #0
        adds    r10, r1, r10
        ldr     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        adc     lr, lr, #0
        adds    r9, lr, r11
        adc     r7, r7, #0
        adds    r0, r1, r0
        mov     r1, #0
        adc     r1, r1, #0
        adds    r0, r3, r0
        adc     r1, r12, r1
        cmp     r2, #0
        beq     LADQ34
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADQ34:
        add     r8, r5, r8
        sub     r2, r8, r6
        sub     r2, r2, #0x3E
        mov     r3, r2, asr #31
        bl      __ashrdi3
        subs    r9, r9, r0
        sbc     r7, r7, r1
        add     r8, r6, #0x1E
LADQ35:
        mvn     r0, #2, 2
        bics    r1, r7, r0
        beq     LADQ36
        rsbs    r9, r9, #0
        rsc     r7, r7, #0
LADQ36:
        mov     r0, #0xDE
        orr     r0, r0, #3, 24
        add     r0, r0, #0x5E
        clz     r2, r7
        cmp     r2, #0x20
        rsb     r0, r8, r0
        beq     LADQ44
LADQ37:
        sub     r3, r2, #1
        rsb     r2, r3, #0x20
        mov     r2, r9, lsr r2
        orr     r7, r2, r7, lsl r3
        subs    r2, r0, r3
        mov     r9, r9, lsl r3
        bpl     LADQ39
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LADQ38
        mov     r9, r7
        mov     r7, r7, asr #31
        sub     r2, r2, #0x20
LADQ38:
        cmp     r2, #0x20
        mov     r0, #0x20
        movgt   r2, r0
        mov     r9, r9, lsr r2
        rsb     r0, r2, #0x20
        orr     r9, r9, r7, lsl r0
        mov     r7, r7, asr r2
        mov     r2, #0
LADQ39:
        mov     r0, r9, lsr #9
        and     r3, r0, #1
        mov     r0, r7, lsl #22
        orr     r9, r0, r9, lsr #10
        adds    r0, r3, r9
        mov     r7, r7, lsr #10
        adc     r3, r7, r3, asr #31
        orrs    r12, r3, r3, asr #31
        moveq   r2, #0
        beq     LADQ40
        mov     r12, #0xFE
        orr     r12, r12, #7, 24
        cmp     r12, r2
        bgt     LADQ40
        mov     r0, #0
        add     r2, r12, #1
        mov     r3, r0
LADQ40:
        add     r2, r3, r2, lsl #20
        orr     r1, r2, r1
        eor     r1, r1, r4
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LADQ41:
        subs    r10, r10, r1
        sbc     r9, r9, r12
        b       LADQ6
LADQ42:
        clz     r12, r0
        cmp     r12, #0
        beq     LADQ9
        mov     r1, r0
        mov     r2, r12
        mov     r0, r4
        add     r3, r5, #0x3A, 28
        b       LADQ9
LADQ43:
        clz     r1, r10
        cmp     r1, #0
        beq     LADQ24
        mov     r9, r10
        sub     r5, r5, #0x20
        mov     r0, r1
        mov     r10, #0
        b       LADQ24
LADQ44:
        clz     r3, r9
        cmp     r3, #0
        beq     LADQ37
        mov     r7, r9
        sub     r0, r0, #0x20
        mov     r2, r3
        mov     r9, #0
        b       LADQ37
LADQ45:
        add     r5, r5, #0x1F, 26
        mov     r0, #0
        mov     r1, r5, lsl #19
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
        .long   LADQ_inv2p7_pi_long
        .long   LADQ_pi_over_2p7_long
        .long   0x55555555
        .long   0x5b05b05b
        .long   LADQ_inv2p7_pi_short
        .long   LADQ_pi_over_2p7
        .long   0x68068068
        .long   0x44444444
        .long   LADQ_sincos_table1
        .long   LADQ_sc_sincos_tbl1


        .data
        .align  4


LADQ_sincos_table1:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80
        .byte   0xCA,0xEF,0x33,0x1B,0xBD,0xAF,0x0A,0xC9,0xD9,0x65,0x68,0x26,0x04,0x43,0xEC,0xFF
        .byte   0x37,0x9F,0xC0,0x6E,0x88,0x2F,0xFB,0xC8,0x1D,0xEF,0x6B,0xCB,0x1B,0x0F,0xB1,0xFF
        .byte   0x66,0xAE,0xCF,0x70,0x96,0x04,0xA9,0x96,0xA9,0xD0,0x41,0x0C,0x68,0x6D,0x4E,0xFF
        .byte   0x0F,0x5F,0xA1,0x4D,0xE1,0x35,0xBD,0xC8,0xF0,0x2C,0x29,0x89,0x1E,0x6D,0xC4,0xFE
        .byte   0xA2,0x71,0x98,0x4B,0xB5,0x72,0xB2,0xFA,0x3E,0x9A,0xFE,0x0C,0x87,0x23,0x13,0xFE
        .byte   0x13,0xD1,0x09,0x73,0x74,0x83,0x40,0x96,0x0C,0xB5,0x28,0x45,0xF8,0xAB,0x3A,0xFD
        .byte   0xA6,0x32,0xFE,0x59,0x24,0xA2,0x10,0xAF,0xAB,0x49,0x5D,0x8A,0xD3,0x27,0x3B,0xFC
        .byte   0xB2,0x55,0x30,0x4D,0xE3,0xC1,0xC5,0xC7,0x56,0x81,0xE5,0xBA,0x7F,0xBE,0x14,0xFB
        .byte   0xE5,0x17,0x7B,0xF2,0x53,0x13,0x5C,0xE0,0x28,0x46,0x2C,0x27,0x63,0x9D,0xC7,0xF9
        .byte   0x7A,0xD5,0xF8,0x0A,0xD9,0xCB,0xCF,0xF8,0x53,0xB9,0x86,0x91,0xDC,0xF7,0x53,0xF8
        .byte   0x05,0xBB,0xB3,0x8F,0x15,0x93,0x8E,0x88,0xE8,0x19,0x4B,0x42,0x3B,0x07,0xBA,0xF6
        .byte   0x46,0x2D,0xF8,0xAC,0x76,0x31,0xA0,0x94,0xEC,0xD2,0x6E,0x31,0xB6,0x0A,0xFA,0xF4
        .byte   0x19,0x0A,0x30,0xBB,0xA0,0xE4,0x9A,0xA0,0x75,0x8F,0x08,0x47,0x62,0x47,0x14,0xF3
        .byte   0xF1,0xE7,0xFE,0x58,0xAD,0xD3,0x7C,0xAC,0xFD,0x25,0x37,0xB4,0x27,0x08,0x09,0xF1
        .byte   0x77,0xF5,0x2C,0xD2,0x87,0x29,0x44,0xB8,0x08,0xE3,0x11,0x66,0xB6,0x9D,0xD8,0xEE
        .byte   0x8D,0x16,0x4B,0x75,0x35,0x15,0xEF,0xC3,0x45,0x31,0x6A,0x94,0x79,0x5E,0x83,0xEC
        .byte   0x6E,0x51,0x6C,0x47,0x1D,0xCA,0x7B,0xCF,0x62,0xCD,0x49,0x6E,0x8A,0xA6,0x09,0xEA
        .byte   0x5B,0x01,0xE6,0x0A,0x4F,0x80,0xE8,0xDA,0x86,0x97,0x3B,0xE6,0xA1,0xD7,0x6B,0xE7
        .byte   0xB4,0xF0,0x22,0x8E,0xC9,0x74,0x33,0xE6,0xB4,0xA7,0x8F,0xA0,0x09,0x59,0xAA,0xE4
        .byte   0xF0,0xD8,0xB1,0x37,0xC0,0xE9,0x5A,0xF1,0x92,0x86,0xED,0x05,0x8C,0x97,0xC5,0xE1
        .byte   0xDA,0xCF,0xD5,0xC4,0xDF,0x26,0x5D,0xFC,0xFB,0x4C,0xA9,0x7C,0x63,0x05,0xBE,0xDE
        .byte   0xB5,0x6C,0xFF,0x17,0xC9,0x3C,0x9C,0x83,0x87,0xEC,0x71,0xCB,0x28,0x1A,0x94,0xDB
        .byte   0x22,0x14,0x59,0xDA,0xA0,0x9A,0xF5,0x88,0xDB,0xFC,0x0F,0xA8,0xC0,0x52,0x48,0xD8
        .byte   0x65,0x43,0x46,0x73,0xCD,0xD9,0x39,0x8E,0x1A,0x18,0x0D,0x75,0x48,0x31,0xDB,0xD4
        .byte   0x45,0xF5,0x96,0xE8,0x66,0x2A,0x68,0x93,0xED,0x0E,0x3C,0x31,0x02,0x3D,0x4D,0xD1
        .byte   0x08,0xA7,0x81,0x0B,0xE7,0xBF,0x7F,0x98,0x9E,0x05,0x3A,0x9C,0x3F,0x02,0x9F,0xCD
        .byte   0xE4,0xC9,0x85,0x02,0x49,0xD1,0x7F,0x9D,0x7B,0xDA,0x1F,0x93,0x4C,0x12,0xD1,0xC9
        .byte   0xC0,0xB0,0xEE,0x48,0x28,0x99,0x67,0xA2,0xA7,0x05,0xBA,0xA8,0x58,0x03,0xE4,0xC5
        .byte   0x9E,0x48,0x2F,0x1F,0xDF,0x55,0x36,0xA7,0x91,0x6E,0xBB,0xFC,0x5F,0x70,0xD8,0xC1
        .byte   0x15,0xFD,0x64,0x67,0xA4,0x49,0xEB,0xAB,0xF1,0x76,0x7D,0x55,0x13,0xF9,0xAE,0xBD
        .byte   0xDB,0xF6,0x66,0xE9,0xA8,0xBA,0x85,0xB0,0x1B,0xB2,0xFC,0x7F,0xBF,0x41,0x68,0xB9
        .byte   0x84,0x64,0xDE,0xF9,0x33,0xF3,0x04,0xB5,0x84,0x64,0xDE,0xF9,0x33,0xF3,0x04,0xB5
LADQ_inv2p7_pi_short:
        .byte   0xB7,0xC1,0x7C,0x51
LADQ_pi_over_2p7:
        .byte   0x90,0x0C,0x00,0x00,0x16,0x22,0xAA,0xFD,0x4C,0x4C,0x23,0x8C,0x0E,0xB8,0x28,0x66
        .byte   0x70,0xED,0x32,0x3E
LADQ_sc_sincos_tbl1:
        .byte   0x2D,0x00,0x00,0x00,0x1F,0x00,0x00,0x00,0x25,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x24,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x23,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x23,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x23,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x22,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x22,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x22,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x22,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x22,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x21,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
        .byte   0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x00
LADQ_inv2p7_pi_long:
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
LADQ_pi_over_2p7_long:
        .byte   0xA2,0xDA,0x0F,0xC9,0x35,0xC2,0x68,0x21


