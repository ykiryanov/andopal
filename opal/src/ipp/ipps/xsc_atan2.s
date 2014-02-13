        .text
        .align  4
        .globl  atan2


atan2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        str     r2, [sp, #0x28]
        str     r3, [sp, #0x2C]
        mvn     r4, #2, 2
        and     r5, r3, r4
        add     r12, r5, #1, 12
        cmp     r12, #2, 12
        str     r0, [sp, #0x20]
        mov     r12, #0xDE
        str     r1, [sp, #0x24]
        orr     r6, r12, #3, 24
        bic     r12, r3, r4
        mov     lr, #0
        bic     r3, r1, r4
        and     r7, r1, r4
        blt     LAEB0
        add     r8, r7, #1, 12
        cmp     r8, #2, 12
        bge     LAEB54
LAEB0:
        mov     r8, #0xFF
        orr     r9, r8, #7, 24
        cmp     r7, r9, lsl #20
        bhi     LAEB1
        cmp     r7, r9, lsl #20
        bne     LAEB2
        cmp     r0, #0
        beq     LAEB2
LAEB1:
        orr     r7, r7, #2, 14
        orr     r1, r7, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB2:
        cmp     r5, r9, lsl #20
        bhi     LAEB3
        cmp     r5, r9, lsl #20
        bne     LAEB4
        cmp     r2, #0
        beq     LAEB4
LAEB3:
        orr     r5, r5, #2, 14
        orr     r1, r5, r12
        mov     r0, r2
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB4:
        mov     r8, #0xFE
        cmp     r7, #0
        orr     r8, r8, #7, 24
        bne     LAEB12
        cmp     r0, #0
        bne     LAEB12
        cmp     r12, #0
        mov     r12, #0
        moveq   r0, r12
        beq     LAEB10
        ldr     lr, [pc, #0xFD0]
        ldr     r7, [lr, #4]
        ldr     lr, [lr]
        bics    r4, r7, r4
        beq     LAEB5
        rsbs    lr, lr, #0
        rsc     r7, r7, #0
LAEB5:
        clz     r11, r7
        cmp     r11, #0x20
        add     r9, r6, #0x21
        beq     LAEB110
LAEB6:
        sub     r10, r11, #1
        rsb     r6, r10, #0x20
        mov     r6, lr, lsr r6
        subs    r9, r9, r10
        orr     r6, r6, r7, lsl r10
        mov     r10, lr, lsl r10
        bpl     LAEB8
        rsb     r9, r9, #0
        cmp     r9, #0x20
        blt     LAEB7
        mov     r10, r6
        mov     r6, r6, asr #31
        sub     r9, r9, #0x20
LAEB7:
        cmp     r9, #0x20
        mov     lr, #0x20
        movgt   r9, lr
        mov     r10, r10, lsr r9
        rsb     lr, r9, #0x20
        orr     r10, r10, r6, lsl lr
        mov     r6, r6, asr r9
        mov     r9, r12
LAEB8:
        mov     lr, r10, lsr #9
        and     lr, lr, #1
        mov     r7, r6, lsl #22
        orr     r10, r7, r10, lsr #10
        adds    r0, lr, r10
        mov     r6, r6, lsr #10
        adc     lr, r6, lr, asr #31
        orrs    r6, lr, lr, asr #31
        moveq   r9, r12
        beq     LAEB9
        mov     r6, #0x3E
        add     r6, r6, #0x1F, 26
        cmp     r6, r9
        bgt     LAEB9
        mov     r0, r12
        add     r9, r8, #1
        mov     lr, r0
LAEB9:
        add     r9, lr, r9, lsl #20
        orr     r4, r9, r4
        orr     r3, r4, r3
        mov     r12, r0
LAEB10:
        cmp     r5, #0
        bne     LAEB11
        cmp     r2, #0
        beq     LAEB109
LAEB11:
        mov     r1, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB12:
        cmp     r5, #0
        bne     LAEB18
        cmp     r2, #0
        bne     LAEB37
        ldr     r0, [pc, #0xED0]
        ldr     r2, [r0, #4]
        ldr     r0, [r0]
        bics    r4, r2, r4
        beq     LAEB13
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LAEB13:
        clz     r6, r2
        mov     lr, #0x3E
        cmp     r6, #0x20
        add     r5, lr, #0xF, 26
        beq     LAEB111
LAEB14:
        sub     r6, r6, #1
        rsb     r12, r6, #0x20
        mov     r12, r0, lsr r12
        orr     r12, r12, r2, lsl r6
        subs    r2, r5, r6
        mov     r6, r0, lsl r6
        bpl     LAEB16
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAEB15
        mov     r6, r12
        mov     r12, r12, asr #31
        sub     r2, r2, #0x20
LAEB15:
        cmp     r2, #0x20
        mov     r0, #0x20
        movgt   r2, r0
        mov     r6, r6, lsr r2
        rsb     r0, r2, #0x20
        orr     r6, r6, r12, lsl r0
        mov     r12, r12, asr r2
        mov     r2, #0
LAEB16:
        mov     r0, r6, lsr #9
        and     r5, r0, #1
        mov     r0, r12, lsl #22
        orr     r6, r0, r6, lsr #10
        adds    r0, r5, r6
        mov     r12, r12, lsr #10
        adc     r5, r12, r5, asr #31
        orrs    r12, r5, r5, asr #31
        moveq   r2, #0
        beq     LAEB17
        add     lr, lr, #0x1F, 26
        cmp     lr, r2
        bgt     LAEB17
        mov     r0, #0
        add     r2, r8, #1
        mov     r5, r0
LAEB17:
        add     r2, r5, r2, lsl #20
        orr     r4, r2, r4
        orr     r1, r4, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB18:
        cmp     r5, r9, lsl #20
        bne     LAEB37
        ldr     r5, [pc, #0xDF0]
        cmp     r12, #0
        mov     r0, #0x20
        mov     r2, #0x3E
        beq     LAEB30
        cmp     r7, r9, lsl #20
        bne     LAEB24
        ldr     r12, [pc, #0xDD8]
        ldr     lr, [r12, #4]
        ldr     r12, [r12]
        bics    r4, lr, r4
        beq     LAEB19
        rsbs    r12, r12, #0
        rsc     lr, lr, #0
LAEB19:
        clz     r9, lr
        cmp     r9, #0x20
        add     r5, r6, #0x21
        beq     LAEB112
LAEB20:
        sub     r6, r9, #1
        rsb     r7, r6, #0x20
        mov     r7, r12, lsr r7
        subs    r5, r5, r6
        orr     lr, r7, lr, lsl r6
        mov     r6, r12, lsl r6
        bpl     LAEB22
        rsb     r5, r5, #0
        cmp     r5, #0x20
        blt     LAEB21
        mov     r6, lr
        mov     lr, lr, asr #31
        sub     r5, r5, #0x20
LAEB21:
        cmp     r5, #0x20
        movgt   r5, r0
        mov     r6, r6, lsr r5
        rsb     r0, r5, #0x20
        orr     r6, r6, lr, lsl r0
        mov     lr, lr, asr r5
        mov     r5, #0
LAEB22:
        mov     r0, r6, lsr #9
        and     r12, r0, #1
        mov     r0, lr, lsl #22
        orr     r6, r0, r6, lsr #10
        adds    r0, r12, r6
        mov     lr, lr, lsr #10
        adc     r12, lr, r12, asr #31
        orrs    lr, r12, r12, asr #31
        moveq   r5, #0
        beq     LAEB23
        add     r2, r2, #0x1F, 26
        cmp     r2, r5
        bgt     LAEB23
        mov     r0, #0
        add     r5, r8, #1
        mov     r12, r0
LAEB23:
        add     r5, r12, r5, lsl #20
        orr     r4, r5, r4
        orr     r1, r4, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB24:
        ldr     lr, [r5, #4]
        ldr     r12, [r5]
        bics    r4, lr, r4
        beq     LAEB25
        rsbs    r12, r12, #0
        rsc     lr, lr, #0
LAEB25:
        clz     r9, lr
        cmp     r9, #0x20
        add     r5, r6, #0x21
        beq     LAEB113
LAEB26:
        sub     r6, r9, #1
        rsb     r7, r6, #0x20
        mov     r7, r12, lsr r7
        subs    r5, r5, r6
        orr     lr, r7, lr, lsl r6
        mov     r6, r12, lsl r6
        bpl     LAEB28
        rsb     r5, r5, #0
        cmp     r5, #0x20
        blt     LAEB27
        mov     r6, lr
        mov     lr, lr, asr #31
        sub     r5, r5, #0x20
LAEB27:
        cmp     r5, #0x20
        movgt   r5, r0
        mov     r6, r6, lsr r5
        rsb     r0, r5, #0x20
        orr     r6, r6, lr, lsl r0
        mov     lr, lr, asr r5
        mov     r5, #0
LAEB28:
        mov     r0, r6, lsr #9
        and     r12, r0, #1
        mov     r0, lr, lsl #22
        orr     r6, r0, r6, lsr #10
        adds    r0, r12, r6
        mov     lr, lr, lsr #10
        adc     r12, lr, r12, asr #31
        orrs    lr, r12, r12, asr #31
        moveq   r5, #0
        beq     LAEB29
        add     r2, r2, #0x1F, 26
        cmp     r2, r5
        bgt     LAEB29
        mov     r0, #0
        add     r5, r8, #1
        mov     r12, r0
LAEB29:
        add     r5, r12, r5, lsl #20
        orr     r4, r5, r4
        orr     r1, r4, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB30:
        cmp     r7, r9, lsl #20
        bne     LAEB36
        ldr     lr, [r5, #4]
        ldr     r12, [r5]
        bics    r4, lr, r4
        beq     LAEB31
        rsbs    r12, r12, #0
        rsc     lr, lr, #0
LAEB31:
        clz     r9, lr
        cmp     r9, #0x20
        add     r5, r6, #0x1F
        beq     LAEB114
LAEB32:
        sub     r6, r9, #1
        rsb     r7, r6, #0x20
        mov     r7, r12, lsr r7
        subs    r5, r5, r6
        orr     lr, r7, lr, lsl r6
        mov     r6, r12, lsl r6
        bpl     LAEB34
        rsb     r5, r5, #0
        cmp     r5, #0x20
        blt     LAEB33
        mov     r6, lr
        mov     lr, lr, asr #31
        sub     r5, r5, #0x20
LAEB33:
        cmp     r5, #0x20
        movgt   r5, r0
        mov     r6, r6, lsr r5
        rsb     r0, r5, #0x20
        orr     r6, r6, lr, lsl r0
        mov     lr, lr, asr r5
        mov     r5, #0
LAEB34:
        mov     r0, r6, lsr #9
        and     r12, r0, #1
        mov     r0, lr, lsl #22
        orr     r6, r0, r6, lsr #10
        adds    r0, r12, r6
        mov     lr, lr, lsr #10
        adc     r12, lr, r12, asr #31
        orrs    lr, r12, r12, asr #31
        moveq   r5, #0
        beq     LAEB35
        add     r2, r2, #0x1F, 26
        cmp     r2, r5
        bgt     LAEB35
        mov     r0, #0
        add     r5, r8, #1
        mov     r12, r0
LAEB35:
        add     r5, r12, r5, lsl #20
        orr     r4, r5, r4
        orr     r1, r4, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB36:
        mov     r1, r3
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB37:
        cmp     r7, r9, lsl #20
        mov     r9, #0x3E
        bne     LAEB43
        ldr     r0, [pc, #0xB48]
        ldr     r2, [r0, #4]
        ldr     r0, [r0]
        bics    r4, r2, r4
        beq     LAEB38
        rsbs    r0, r0, #0
        rsc     r2, r2, #0
LAEB38:
        clz     r5, r2
        cmp     r5, #0x20
        add     lr, r9, #0xF, 26
        beq     LAEB115
LAEB39:
        sub     r5, r5, #1
        rsb     r12, r5, #0x20
        mov     r12, r0, lsr r12
        orr     r12, r12, r2, lsl r5
        subs    r2, lr, r5
        mov     r5, r0, lsl r5
        bpl     LAEB41
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAEB40
        mov     r5, r12
        mov     r12, r12, asr #31
        sub     r2, r2, #0x20
LAEB40:
        cmp     r2, #0x20
        mov     r0, #0x20
        movgt   r2, r0
        mov     r5, r5, lsr r2
        rsb     r0, r2, #0x20
        orr     r5, r5, r12, lsl r0
        mov     r12, r12, asr r2
        mov     r2, #0
LAEB41:
        mov     r0, r5, lsr #9
        and     lr, r0, #1
        mov     r0, r12, lsl #22
        orr     r5, r0, r5, lsr #10
        adds    r0, lr, r5
        mov     r12, r12, lsr #10
        adc     lr, r12, lr, asr #31
        orrs    r12, lr, lr, asr #31
        moveq   r2, #0
        beq     LAEB42
        add     r9, r9, #0x1F, 26
        cmp     r9, r2
        bgt     LAEB42
        mov     r0, #0
        add     r2, r8, #1
        mov     lr, r0
LAEB42:
        add     r2, lr, r2, lsl #20
        orr     r4, r2, r4
        orr     r1, r4, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB43:
        cmp     r7, r5
        bhi     LAEB44
        cmp     r7, r5
        bne     LAEB45
        cmp     r0, r2
        bls     LAEB45
LAEB44:
        mov     lr, r5
        mov     r8, r2
        mov     r5, r7
        mov     r2, r0
        mov     r7, lr
        mov     r0, r8
        mov     lr, #1
LAEB45:
        cmp     r7, #1, 12
        bcc     LAEB47
        mvn     r8, #0xFF, 12
        bic     r8, r8, #0xF, 4
        movs    r9, r7, lsl #1
        and     r8, r7, r8
        moveq   r9, #2, 12
        orrne   r8, r8, #1, 12
        bics    r7, r7, r4
        beq     LAEB46
        rsbs    r0, r0, #0
        rsc     r8, r8, #0
LAEB46:
        add     r7, r6, #0x55
        sub     r7, r7, r9, lsr #21
        mov     r9, r0, lsr #21
        orr     r1, r9, r8, lsl #11
        sub     r7, r7, #0x35
        mov     r9, r0, lsl #11
        str     r7, [sp, #8]
        b       LAEB49
LAEB47:
        cmp     r7, #0
        add     r10, r9, #0xED, 30
        bne     LAEB48
        mov     r7, r0
        add     r10, r9, #0xF5, 30
        mov     r0, #0
LAEB48:
        clz     r8, r7
        rsb     r9, r8, #0x20
        mov     r9, r0, lsr r9
        add     r10, r10, r8
        orr     r1, r9, r7, lsl r8
        str     r10, [sp, #8]
        mov     r9, r0, lsl r8
LAEB49:
        cmp     r5, #1, 12
        bcc     LAEB51
        mvn     r6, #0xFF, 12
        bic     r6, r6, #0xF, 4
        movs    r7, r5, lsl #1
        and     r6, r5, r6
        moveq   r7, #2, 12
        orrne   r6, r6, #1, 12
        bics    r5, r5, r4
        beq     LAEB50
        rsbs    r2, r2, #0
        rsc     r6, r6, #0
LAEB50:
        mov     r5, #0xDE
        orr     r5, r5, #3, 24
        add     r5, r5, #0x55
        sub     r7, r5, r7, lsr #21
        mov     r5, r2, lsr #22
        orr     r5, r5, r6, lsl #10
        mov     r2, r2, lsl #10
        add     r8, r7, #0xA
        b       LAEB59
LAEB51:
        mov     r7, #0x3E
        cmp     r5, #0
        add     r7, r7, #0xFD, 30
        bne     LAEB53
        bics    r5, r2, r4
        bne     LAEB52
        mov     r5, r2
        add     r7, r6, #0x74
        mov     r2, #0
        b       LAEB53
LAEB52:
        mov     r5, r2, lsr #1
        mov     r2, r2, lsl #31
        add     r7, r6, #0x73
LAEB53:
        clz     r6, r5
        sub     r6, r6, #1
        add     r8, r7, r6
        rsb     r7, r6, #0x20
        mov     r7, r2, lsr r7
        orr     r5, r7, r5, lsl r6
        mov     r2, r2, lsl r6
        b       LAEB59
LAEB54:
        cmp     r7, r5
        bhi     LAEB55
        cmp     r7, r5
        bne     LAEB56
        cmp     r0, r2
        bls     LAEB56
LAEB55:
        mov     lr, r5
        mov     r8, r2
        mov     r5, r7
        mov     r2, r0
        mov     r7, lr
        mov     r0, r8
        mov     lr, #1
LAEB56:
        mvn     r8, #0xFF, 12
        bic     r8, r8, #0xF, 4
        movs    r9, r7, lsl #1
        and     r8, r7, r8
        moveq   r9, #2, 12
        orrne   r8, r8, #1, 12
        bics    r7, r7, r4
        beq     LAEB57
        rsbs    r0, r0, #0
        rsc     r8, r8, #0
LAEB57:
        add     r7, r6, #0x55
        mvn     r6, #0xFF, 12
        sub     r7, r7, r9, lsr #21
        sub     r7, r7, #0x35
        mov     r9, r0, lsr #21
        bic     r6, r6, #0xF, 4
        str     r7, [sp, #8]
        orr     r1, r9, r8, lsl #11
        movs    r7, r5, lsl #1
        mov     r9, r0, lsl #11
        and     r6, r5, r6
        moveq   r7, #2, 12
        orrne   r6, r6, #1, 12
        bics    r5, r5, r4
        beq     LAEB58
        rsbs    r2, r2, #0
        rsc     r6, r6, #0
LAEB58:
        mov     r5, #0xDE
        orr     r5, r5, #3, 24
        add     r5, r5, #0x55
        sub     r7, r5, r7, lsr #21
        mov     r5, r2, lsr #22
        orr     r5, r5, r6, lsl #10
        mov     r2, r2, lsl #10
        add     r8, r7, #0xA
LAEB59:
        mov     r0, r2, lsr #31
        bics    r4, r5, r4
        orr     r7, r0, r5, lsl #1
        mov     r6, r2, lsl #1
        beq     LAEB60
        rsbs    r6, r6, #0
        rsc     r7, r7, #0
LAEB60:
        ldr     r0, [pc, #0x840]
        mov     r2, r7, lsr #7
        mov     r10, #2, 2
        add     r0, r0, r7, lsr #26
        ldrsb   r0, [r0, #-0x20]
        mul     r2, r2, r0
        mov     r2, r2, lsr #7
        rsb     r2, r2, #0
        add     r2, r2, #2, 8
        mul     r2, r2, r0
        umull   r0, r5, r7, r2
        subs    r0, r10, r5
        mov     r5, #0
        umull   r0, r10, r2, r0
        sbc     r5, r5, #0
        mla     r10, r2, r5, r10
        mov     r2, r10, lsl #2
        mov     r10, #0
        orr     r0, r2, r0, lsr #30
        umull   r2, r5, r7, r0
        subs    r10, r10, r2
        umull   r10, r2, r0, r10
        mov     r10, #2, 2
        sbc     r10, r10, r5
        umull   r10, r0, r0, r10
        adds    r5, r2, r10
        adc     r10, r0, #0
        mov     r0, r5, lsl #2
        umull   r11, r2, r7, r0
        mov     r10, r10, lsl #2
        orr     r5, r10, r5, lsr #30
        umull   r6, r11, r5, r6
        umull   r6, r10, r7, r5
        adds    r11, r2, r11
        mov     r2, #0
        adc     r2, r2, #0
        adds    r6, r11, r6
        adc     r11, r2, r10
        mov     r2, #0
        subs    r2, r2, r6
        umull   r2, r10, r5, r2
        mov     r6, #2, 2
        sbc     r6, r6, r11
        umull   r0, r11, r6, r0
        umull   r6, r5, r5, r6
        adds    r2, r0, r2
        adc     r10, r11, r10
        and     r2, r2, #3
        adds    r6, r10, r6
        adc     r5, r5, #0
        orr     r2, r2, r6, lsl #2
        adds    r7, r2, r7, lsr #31
        mov     r6, r6, lsr #30
        orr     r5, r6, r5, lsl #2
        adc     r5, r5, #0
        cmp     r4, #0
        beq     LAEB61
        rsbs    r7, r7, #0
        rsc     r5, r5, #0
LAEB61:
        umull   r0, r4, r7, r9
        umull   r7, r0, r7, r1
        umull   r9, r2, r9, r5
        umull   r1, r5, r5, r1
        rsb     r8, r8, #0x7D
        adds    r4, r7, r4
        adc     r6, r0, #0
        ldr     r0, [sp, #8]
        adds    r2, r1, r2
        adc     r5, r5, #0
        adds    r4, r9, r4
        adc     r6, r6, #0
        adds    r7, r6, r2
        adc     r2, r5, #0
        cmp     r2, #1, 2
        add     r0, r0, r8
        bcs     LAEB62
        mov     r4, r7, lsr #31
        orr     r2, r4, r2, lsl #1
        mov     r7, r7, lsl #1
        add     r0, r0, #1
LAEB62:
        cmp     r0, #0x45
        ble     LAEB79
        cmp     r0, #0x5A
        bgt     LAEB67
        mov     r4, r2, lsl #31
        orr     r4, r4, r7, lsr #1
        mov     r2, r2, asr #1
        add     r5, r2, r4, lsr #31
        smull   r8, r9, r5, r5
        str     r5, [sp, #8]
        ldr     r5, [pc, #0x6DC]
        ldr     r7, [pc, #0x6DC]
        adds    r6, r9, r8, lsr #31
        sub     r0, r0, #1
        smull   r5, r10, r5, r6
        sub     r5, r0, #0x40
        mov     r5, r5, lsl #1
        sub     r7, r7, r10, asr r5
        smull   r7, r10, r6, r7
        cmp     r5, #0x20
        bge     LAEB63
        add     r11, r5, #1
        str     r11, [sp, #4]
        rsb     r11, r5, #0x1F
        str     r11, [sp]
        ldr     r11, [sp, #4]
        ldr     r1, [sp]
        mov     r11, r7, lsr r11
        str     r11, [sp, #0xC]
        ldr     r7, [sp, #4]
        ldr     r11, [sp, #0xC]
        mov     r7, r10, asr r7
        orr     r10, r11, r10, lsl r1
        b       LAEB64
LAEB63:
        cmp     r5, #0x40
        movge   r7, #0
        movge   r10, r7
        bge     LAEB64
        mov     r11, r10, asr #31
        sub     r7, r5, #0x1F
        str     r11, [sp, #0xC]
        mov     r10, r10, lsr r7
        rsb     r11, r5, #0x3F
        str     r10, [sp]
        str     r11, [sp, #4]
        ldr     r10, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r11, [sp]
        mov     r7, r10, asr r7
        orr     r10, r11, r10, lsl r1
LAEB64:
        smull   r6, r11, r4, r6
        str     r11, [sp, #0xC]
        ldr     r11, [pc, #0x63C]
        mov     r6, #0
        subs    r11, r11, r10
        umull   r10, r11, r11, r9
        ldr     r10, [pc, #0x62C]
        str     r11, [sp, #4]
        sbc     r10, r10, r7
        umull   r8, r7, r10, r8
        umull   r9, r8, r10, r9
        ldr     r10, [sp, #4]
        adds    r10, r7, r10
        adc     r7, r6, #0
        adds    r9, r9, r10
        ldr     r10, [sp, #8]
        adc     r7, r8, r7
        add     r8, r7, r9, lsr #31
        smull   r9, r7, r10, r9
        smull   r8, r9, r10, r8
        adds    r8, r8, r7
        adc     r7, r9, r7, asr #31
        ldr     r9, [sp, #0xC]
        adds    r8, r8, r9
        adc     r7, r7, r9, asr #31
        cmp     r5, #0x20
        bgt     LAEB65
        rsb     r6, r5, #0x20
        mov     r8, r8, lsr r5
        orr     r9, r8, r7, lsl r6
        mov     r6, r7, asr r5
        b       LAEB66
LAEB65:
        cmp     r5, #0x40
        movgt   r9, r6
        bgt     LAEB66
        sub     r8, r5, #0x20
        mov     r6, r7, asr #31
        rsb     r5, r5, #0x40
        mov     r7, r7, lsr r8
        orr     r9, r7, r6, lsl r5
        mov     r6, r6, asr r8
LAEB66:
        subs    r7, r4, r9
        sbc     r2, r2, r6
LAEB67:
        ldr     r4, [pc, #0x584]
        cmp     lr, #0
        mov     lr, #0x3E
        beq     LAEB70
        sub     r0, r0, #0x3E
        cmp     r0, #0x20
        bgt     LAEB68
        rsb     r5, r0, #0x20
        mov     r7, r7, lsr r0
        orr     r5, r7, r2, lsl r5
        mov     r2, r2, asr r0
        b       LAEB69
LAEB68:
        cmp     r0, #0x40
        movgt   r5, #0
        movgt   r2, r5
        bgt     LAEB69
        sub     r7, r0, #0x20
        mov     r6, r2, asr #31
        mov     r2, r2, lsr r7
        rsb     r0, r0, #0x40
        orr     r5, r2, r6, lsl r0
        mov     r2, r6, asr r7
LAEB69:
        ldr     r0, [r4]
        ldr     r6, [r4, #4]
        subs    r7, r0, r5
        mov     r0, #0x3E
        sbc     r2, r6, r2
LAEB70:
        cmp     r12, #0
        beq     LAEB73
        sub     r0, r0, #0x3D
        cmp     r0, #0x20
        bgt     LAEB71
        rsb     r12, r0, #0x20
        mov     r7, r7, lsr r0
        orr     r12, r7, r2, lsl r12
        mov     r2, r2, asr r0
        b       LAEB72
LAEB71:
        cmp     r0, #0x40
        movgt   r12, #0
        movgt   r2, r12
        bgt     LAEB72
        sub     r6, r0, #0x20
        mov     r5, r2, asr #31
        mov     r2, r2, lsr r6
        rsb     r0, r0, #0x40
        orr     r12, r2, r5, lsl r0
        mov     r2, r5, asr r6
LAEB72:
        ldr     r0, [r4]
        ldr     r4, [r4, #4]
        subs    r7, r0, r12
        mov     r0, #0x3D
        sbc     r2, r4, r2
LAEB73:
        mvn     r12, #2, 2
        bics    r12, r2, r12
        beq     LAEB74
        rsbs    r7, r7, #0
        rsc     r2, r2, #0
LAEB74:
        mov     r4, #0xDE
        orr     r4, r4, #3, 24
        clz     r5, r2
        add     r4, r4, #0x5E
        cmp     r5, #0x20
        rsb     r0, r0, r4
        beq     LAEB116
LAEB75:
        sub     r5, r5, #1
        rsb     r4, r5, #0x20
        mov     r4, r7, lsr r4
        orr     r4, r4, r2, lsl r5
        subs    r2, r0, r5
        mov     r7, r7, lsl r5
        bpl     LAEB77
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAEB76
        mov     r7, r4
        mov     r4, r4, asr #31
        sub     r2, r2, #0x20
LAEB76:
        cmp     r2, #0x20
        mov     r0, #0x20
        movgt   r2, r0
        mov     r7, r7, lsr r2
        rsb     r0, r2, #0x20
        orr     r7, r7, r4, lsl r0
        mov     r4, r4, asr r2
        mov     r2, #0
LAEB77:
        mov     r0, r7, lsr #9
        and     r5, r0, #1
        mov     r0, r4, lsl #22
        orr     r7, r0, r7, lsr #10
        adds    r0, r5, r7
        mov     r4, r4, lsr #10
        adc     r5, r4, r5, asr #31
        orrs    r4, r5, r5, asr #31
        moveq   r2, #0
        beq     LAEB78
        add     lr, lr, #0x1F, 26
        cmp     lr, r2
        bgt     LAEB78
        mov     r0, #0xFE
        orr     r2, r0, #7, 24
        mov     r0, #0
        add     r2, r2, #1
        mov     r5, r0
LAEB78:
        add     r2, r5, r2, lsl #20
        orr     r12, r2, r12
        orr     r1, r12, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB79:
        mov     r8, r2, lsr #25
        sub     r4, r2, r8, lsl #25
        sub     r6, r4, #1, 8
        sub     r4, r8, #0x20
        mov     r10, r6, asr #31
        str     r4, [sp]
        cmp     r6, r10
        mov     r9, r0
        mov     r4, r6
        mov     r5, r7
        bne     LAEB80
        cmp     r10, r7, asr #31
        bne     LAEB80
        mov     r4, r5
        add     r9, r0, #0x20
        mov     r5, #0
        mov     r6, r7
LAEB80:
        cmp     r10, #0
        rsbne   r6, r6, #0
        mov     r8, r8, lsl #1
        orr     r10, r8, #1
        umull   r7, r8, r7, r10
        clz     r6, r6
        sub     r6, r6, #1
        add     r9, r9, r6
        str     r7, [sp, #0xC]
        umull   r7, r2, r2, r10
        str     r9, [sp, #4]
        rsb     r11, r6, #0x20
        mov     r11, r5, lsr r11
        adds    r7, r7, r8
        adc     r9, r2, r8, asr #31
        clz     r2, r9
        sub     r8, r2, #1
        rsb     r10, r8, #0x20
        mov     r2, r0, lsl #1
        mov     r1, r7, lsr r10
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        sub     r2, r2, #0x58
        orr     r4, r11, r4, lsl r6
        mov     r6, r5, lsl r6
        ldr     r5, [sp, #0x10]
        add     r2, r8, r2
        mov     r10, r1, lsr r10
        cmp     r2, #0x3E
        orr     r9, r5, r9, lsl r8
        str     r6, [sp, #8]
        orr     r8, r10, r7, lsl r8
        ble     LAEB83
        sub     r5, r2, #0x3E
        cmp     r5, #0x20
        bgt     LAEB81
        rsb     r2, r2, #0x5E
        mov     r8, r8, lsr r5
        orr     r2, r8, r9, lsl r2
        mov     r6, r9, lsr r5
        b       LAEB82
LAEB81:
        cmp     r5, #0x40
        mov     r6, #0
        movgt   r2, r6
        bgt     LAEB82
        sub     r5, r2, #0x5E
        rsb     r2, r2, #0x7E
        mov     r9, r9, lsr r5
        orr     r2, r9, r6, lsl r2
        mov     r6, r6, lsr r5
LAEB82:
        adds    r5, r2, #0
        adc     r7, r6, #1, 2
        mov     r2, #0x3E
        b       LAEB86
LAEB83:
        cmp     r2, #0x20
        mov     r5, #0
        mov     r6, #1
        bgt     LAEB84
        rsb     r7, r2, #0x20
        mov     r7, r6, lsr r7
        orr     r7, r7, r5, lsl r2
        mov     r6, r6, lsl r2
        b       LAEB85
LAEB84:
        rsb     r7, r2, #0x40
        mov     r7, r5, lsr r7
        sub     r10, r2, #0x20
        orr     r7, r7, r6, lsl r10
        mov     r6, r5, lsl r10
LAEB85:
        adds    r5, r8, r6
        adc     r7, r9, r7
        cmp     r7, #0
        blt     LAEB119
LAEB86:
        mvn     r6, #2, 2
        mov     r8, r5, lsr #31
        bics    r6, r7, r6
        orr     r8, r8, r7, lsl #1
        mov     r7, r5, lsl #1
        beq     LAEB87
        rsbs    r7, r7, #0
        rsc     r8, r8, #0
LAEB87:
        ldr     r5, [pc, #0x258]
        mov     r9, r8, lsr #7
        add     r5, r5, r8, lsr #26
        ldrsb   r5, [r5, #-0x20]
        mul     r9, r9, r5
        mov     r9, r9, lsr #7
        rsb     r9, r9, #0
        add     r9, r9, #2, 8
        mul     r9, r9, r5
        umull   r10, r5, r8, r9
        mov     r10, #2, 2
        subs    r5, r10, r5
        umull   r5, r11, r9, r5
        mov     r10, #0
        sbc     r10, r10, #0
        mla     r11, r9, r10, r11
        mov     r9, r11, lsl #2
        orr     r5, r9, r5, lsr #30
        umull   r9, r10, r8, r5
        mov     r11, #0
        subs    r11, r11, r9
        umull   r11, r9, r5, r11
        mov     r11, #2, 2
        sbc     r11, r11, r10
        umull   r11, r5, r5, r11
        adds    r9, r9, r11
        adc     r11, r5, #0
        mov     r10, r9, lsl #2
        umull   r1, r5, r8, r10
        mov     r11, r11, lsl #2
        orr     r9, r11, r9, lsr #30
        umull   r7, r1, r9, r7
        umull   r7, r11, r8, r9
        adds    r1, r5, r1
        mov     r5, #0
        adc     r5, r5, #0
        adds    r7, r1, r7
        adc     r1, r5, r11
        mov     r5, #0
        subs    r5, r5, r7
        umull   r5, r11, r9, r5
        mov     r7, #2, 2
        sbc     r7, r7, r1
        umull   r10, r1, r7, r10
        umull   r7, r9, r9, r7
        adds    r5, r10, r5
        adc     r11, r1, r11
        and     r5, r5, #3
        adds    r7, r11, r7
        adc     r9, r9, #0
        orr     r5, r5, r7, lsl #2
        mov     r7, r7, lsr #30
        adds    r8, r5, r8, lsr #31
        orr     r9, r7, r9, lsl #2
        adc     r5, r9, #0
        cmp     r6, #0
        beq     LAEB88
        rsbs    r8, r8, #0
        rsc     r5, r5, #0
LAEB88:
        ldr     r6, [sp, #8]
        rsb     r2, r2, #0x7D
        umull   r7, r6, r6, r5
        umull   r7, r9, r4, r8
        umull   r10, r7, r4, r5
        adds    r6, r9, r6
        mov     r9, #0
        adc     r9, r9, #0
        adds    r6, r10, r6
        adc     r9, r7, r9
        cmp     r4, #0
        blt     LAEB118
LAEB89:
        adds    r5, r6, #0
        ldr     r6, [sp, #4]
        ldr     r8, [pc, #0x138]
        adc     r4, r9, #0
        add     r2, r6, r2
        add     r7, r4, r5, lsr #31
        smull   r10, r6, r7, r7
        sub     r2, r2, #0x40
        str     r2, [sp, #8]
        sub     r2, r2, #0x40
        adds    r9, r6, r10, lsr #31
        smull   r11, r8, r8, r9
        ldr     r11, [pc, #0x114]
        mov     r2, r2, lsl #1
        cmp     r2, #0x20
        sub     r11, r11, r8, asr r2
        smull   r11, r8, r9, r11
        bge     LAEB90
        add     r1, r2, #1
        str     r1, [sp, #0x10]
        rsb     r1, r2, #0x1F
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        mov     r11, r11, lsr r1
        str     r11, [sp, #0x14]
        mov     r1, r8, asr r1
        ldr     r11, [sp, #0x14]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0xC]
        orr     r11, r11, r8, lsl r1
        b       LAEB92
LAEB90:
        cmp     r2, #0x40
        bge     LAEB91
        mov     r1, r8, asr #31
        sub     r11, r2, #0x1F
        mov     r8, r8, lsr r11
        str     r1, [sp, #0x14]
        str     r8, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        rsb     r1, r2, #0x3F
        str     r1, [sp, #0x10]
        mov     r11, r8, asr r11
        str     r11, [sp, #4]
        ldr     r11, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        orr     r11, r11, r8, lsl r1
        b       LAEB92
LAEB91:
        mov     r11, #0
        str     r11, [sp, #4]
LAEB92:
        smull   r9, r8, r5, r9
        ldr     r9, [pc, #0x80]
        ldr     r1, [pc, #0x7C]
        str     r8, [sp, #0x14]
        subs    r9, r9, r11
        umull   r11, r9, r9, r6
        ldr     r11, [sp, #4]
        mov     r8, #0
        sbc     r11, r1, r11
        umull   r1, r10, r11, r10
        umull   r11, r6, r11, r6
        adds    r10, r10, r9
        adc     r9, r8, #0
        adds    r11, r11, r10
        smull   r1, r10, r7, r11
        adc     r9, r6, r9
        add     r11, r9, r11, lsr #31
        smull   r11, r7, r7, r11
        ldr     r9, [sp, #0x14]
        adds    r6, r11, r10
        adc     r10, r7, r10, asr #31
        adds    r7, r6, r9
        adc     r6, r10, r9, asr #31
        cmp     r2, #0x20
        bgt     LAEB93
        rsb     r8, r2, #0x20
        mov     r7, r7, lsr r2
        orr     r9, r7, r6, lsl r8
        mov     r8, r6, asr r2
        b       LAEB94
        .long   __intel_PI_over_2
        .long   LAEB_PI_34
        .long   LAEB_rcp63_table
        .long   0x49249249
        .long   0x66666666
        .long   0x55555555
        .long   __intel_sc_atan_tbl
        .long   __intel_atan_tbl
LAEB93:
        cmp     r2, #0x40
        movgt   r9, r8
        bgt     LAEB94
        sub     r7, r2, #0x20
        rsb     r8, r2, #0x40
        mov     r2, r6, asr #31
        mov     r6, r6, lsr r7
        orr     r9, r6, r2, lsl r8
        mov     r8, r2, asr r7
LAEB94:
        ldr     r6, [sp]
        ldr     r2, [pc, #-0x38]
        rsb     r0, r0, #0x45
        subs    r5, r5, r9
        add     r6, r6, r0, lsl #5
        sbc     r8, r4, r8
        ldr     r4, [pc, #-0x48]
        ldrsb   r0, [r6, +r2]
        add     r7, r4, r6, lsl #3
        ldr     r2, [r4, +r6, lsl #3]
        ldr     r6, [sp, #8]
        ldr     r4, [r7, #4]
        sub     r6, r6, r0
        cmp     r6, #0x20
        bgt     LAEB95
        mov     r5, r5, lsr r6
        rsb     r7, r6, #0x20
        orr     r9, r5, r8, lsl r7
        mov     r6, r8, asr r6
        b       LAEB96
LAEB95:
        cmp     r6, #0x40
        movgt   r9, #0
        movgt   r6, r9
        bgt     LAEB96
        sub     r7, r6, #0x20
        mov     r5, r8, asr #31
        rsb     r6, r6, #0x40
        mov     r8, r8, lsr r7
        orr     r9, r8, r5, lsl r6
        mov     r6, r5, asr r7
LAEB96:
        adds    r2, r2, r9
        adc     r4, r4, r6
        mvn     r6, #2, 2
        bic     r5, r4, r6
        orrs    r5, r5, #0
        beq     LAEB97
        mov     r5, r4, lsl #31
        orr     r2, r5, r2, lsr #1
        mov     r4, r4, lsr #1
        sub     r0, r0, #1
LAEB97:
        ldr     r5, [pc, #-0xEC]
        cmp     lr, #0
        mov     lr, #0x3E
        beq     LAEB100
        sub     r0, r0, #0x3E
        cmp     r0, #0x20
        bgt     LAEB98
        mov     r2, r2, lsr r0
        rsb     r7, r0, #0x20
        orr     r2, r2, r4, lsl r7
        mov     r4, r4, asr r0
        b       LAEB99
LAEB98:
        cmp     r0, #0x40
        movgt   r2, #0
        movgt   r4, r2
        bgt     LAEB99
        sub     r8, r0, #0x20
        mov     r7, r4, asr #31
        mov     r4, r4, lsr r8
        rsb     r0, r0, #0x40
        orr     r2, r4, r7, lsl r0
        mov     r4, r7, asr r8
LAEB99:
        ldr     r0, [r5]
        ldr     r7, [r5, #4]
        subs    r2, r0, r2
        mov     r0, #0x3E
        sbc     r4, r7, r4
LAEB100:
        cmp     r12, #0
        beq     LAEB103
        sub     r0, r0, #0x3D
        cmp     r0, #0x20
        bgt     LAEB101
        mov     r2, r2, lsr r0
        rsb     r12, r0, #0x20
        orr     r2, r2, r4, lsl r12
        mov     r4, r4, asr r0
        b       LAEB102
LAEB101:
        cmp     r0, #0x40
        movgt   r2, #0
        movgt   r4, r2
        bgt     LAEB102
        sub     r7, r0, #0x20
        mov     r12, r4, asr #31
        mov     r4, r4, lsr r7
        rsb     r0, r0, #0x40
        orr     r2, r4, r12, lsl r0
        mov     r4, r12, asr r7
LAEB102:
        ldr     r0, [r5]
        ldr     r5, [r5, #4]
        subs    r2, r0, r2
        mov     r0, #0x3D
        sbc     r4, r5, r4
LAEB103:
        bics    r12, r4, r6
        beq     LAEB104
        rsbs    r2, r2, #0
        rsc     r4, r4, #0
LAEB104:
        mov     r5, #0xDE
        orr     r5, r5, #3, 24
        clz     r6, r4
        add     r5, r5, #0x5E
        cmp     r6, #0x20
        rsb     r0, r0, r5
        beq     LAEB117
LAEB105:
        sub     r6, r6, #1
        rsb     r5, r6, #0x20
        mov     r5, r2, lsr r5
        orr     r4, r5, r4, lsl r6
        subs    r5, r0, r6
        mov     r6, r2, lsl r6
        bpl     LAEB107
        rsb     r5, r5, #0
        cmp     r5, #0x20
        blt     LAEB106
        mov     r6, r4
        mov     r4, r4, asr #31
        sub     r5, r5, #0x20
LAEB106:
        cmp     r5, #0x20
        mov     r0, #0x20
        movgt   r5, r0
        mov     r6, r6, lsr r5
        rsb     r0, r5, #0x20
        orr     r6, r6, r4, lsl r0
        mov     r4, r4, asr r5
        mov     r5, #0
LAEB107:
        mov     r0, r6, lsr #9
        and     r2, r0, #1
        mov     r0, r4, lsl #22
        orr     r6, r0, r6, lsr #10
        adds    r0, r2, r6
        mov     r4, r4, lsr #10
        adc     r2, r4, r2, asr #31
        orrs    r4, r2, r2, asr #31
        moveq   r5, #0
        beq     LAEB108
        mov     r4, #0xFE
        orr     r4, r4, #7, 24
        cmp     r4, r5
        bgt     LAEB108
        add     lr, lr, #0x1F, 26
        mov     r0, #0
        add     r5, lr, #1
        mov     r2, r0
LAEB108:
        add     r5, r2, r5, lsl #20
        orr     r12, r5, r12
        orr     r1, r12, r3
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAEB109:
        str     r12, [sp, #0x18]
        add     r2, sp, #0x18
        add     r1, sp, #0x28
        add     r0, sp, #0x20
        str     r3, [sp, #0x1C]
        mov     r3, #0x25
        bl      __libm_error_support
        ldr     r0, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        b       LAEB11
LAEB110:
        clz     r10, lr
        cmp     r10, #0
        beq     LAEB6
        mov     r7, lr
        add     r9, r6, #1
        mov     r11, r10
        mov     lr, r12
        b       LAEB6
LAEB111:
        clz     r12, r0
        cmp     r12, #0
        beq     LAEB14
        mov     r2, r0
        mov     r6, r12
        mov     r0, #0
        add     r5, lr, #0x3A, 28
        b       LAEB14
LAEB112:
        clz     r7, r12
        cmp     r7, #0
        beq     LAEB20
        mov     lr, r12
        add     r5, r6, #1
        mov     r9, r7
        mov     r12, #0
        b       LAEB20
LAEB113:
        clz     r7, r12
        cmp     r7, #0
        beq     LAEB26
        mov     lr, r12
        add     r5, r6, #1
        mov     r9, r7
        mov     r12, #0
        b       LAEB26
LAEB114:
        clz     r7, r12
        cmp     r7, #0
        beq     LAEB32
        mov     lr, r12
        sub     r5, r6, #1
        mov     r9, r7
        mov     r12, #0
        b       LAEB32
LAEB115:
        clz     r12, r0
        cmp     r12, #0
        beq     LAEB39
        mov     r2, r0
        mov     r5, r12
        mov     r0, #0
        add     lr, r9, #0x3A, 28
        b       LAEB39
LAEB116:
        clz     r4, r7
        cmp     r4, #0
        beq     LAEB75
        mov     r2, r7
        sub     r0, r0, #0x20
        mov     r5, r4
        mov     r7, #0
        b       LAEB75
LAEB117:
        clz     r5, r2
        cmp     r5, #0
        beq     LAEB105
        mov     r4, r2
        sub     r0, r0, #0x20
        mov     r6, r5
        mov     r2, #0
        b       LAEB105
LAEB118:
        subs    r6, r6, r8
        sbc     r9, r9, r5
        b       LAEB89
LAEB119:
        mov     r6, r7, lsl #31
        sub     r2, r2, #1
        orr     r5, r6, r5, lsr #1
        mov     r7, r7, lsr #1
        b       LAEB86


        .data
        .align  4


LAEB_PI_34:
        .byte   0xD4,0x48,0x87,0xCC,0xFC,0xF1,0x65,0x4B
LAEB_rcp63_table:
        .byte   0x7F,0x7B,0x77,0x73,0x71,0x6D,0x6B,0x67,0x65,0x63,0x61,0x5F,0x5D,0x5B,0x59,0x57
        .byte   0x55,0x53,0x51,0x4F,0x4F,0x4D,0x4B,0x49,0x49,0x47,0x47,0x45,0x43,0x43,0x41,0x41


