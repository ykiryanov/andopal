        .text
        .align  4
        .globl  asin


asin:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mvn     r2, #0xFF, 12
        mvn     r6, #2, 2
        mov     r7, r1
        bic     r3, r2, #0xF, 4
        and     lr, r7, r6
        str     r0, [sp, #0x30]
        mov     r2, lr, lsl #1
        cmp     r2, #2, 12
        str     r1, [sp, #0x34]
        and     r3, lr, r3
        bic     r4, r7, r6
        movcc   r2, #2, 12
        orrcs   r3, r3, #1, 12
        mov     r12, #0x33
        sub     r5, lr, #0xF9, 10
        orr     r12, r12, #1, 22
        cmp     r5, #0x1B, 12
        mov     r5, #0xFF
        sub     r12, r12, r2, lsr #21
        orr     r5, r5, #7, 24
        mov     r2, #0
        bcc     LAEG9
        cmp     lr, #0xF9, 10
        bcc     LAEG8
        cmp     r0, #0
        bne     LAEG5
        mov     r1, #0xFE
        orr     r1, r1, #7, 24
        cmp     lr, r1, lsl #19
        bne     LAEG5
        ldr     r2, [pc, #0xF34]
        str     r0, [sp, #0x20]
        str     r3, [sp, #0x24]
        ldr     r12, [r2, #4]
        ldr     r2, [r2]
        bics    r6, r12, r6
        beq     LAEG0
        rsbs    r2, r2, #0
        rsc     r12, r12, #0
LAEG0:
        clz     lr, r12
        cmp     lr, #0x20
        sub     r0, r1, #1, 22
        beq     LAEG58
LAEG1:
        sub     r3, lr, #1
        rsb     r1, r3, #0x20
        mov     r1, r2, lsr r1
        orr     r12, r1, r12, lsl r3
        subs    r1, r0, r3
        mov     r3, r2, lsl r3
        bpl     LAEG3
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAEG2
        mov     r3, r12
        mov     r12, r12, asr #31
        sub     r1, r1, #0x20
LAEG2:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r3, r3, lsr r1
        rsb     r0, r1, #0x20
        orr     r3, r3, r12, lsl r0
        mov     r12, r12, asr r1
        mov     r1, #0
LAEG3:
        mov     r0, r3, lsr #9
        and     r2, r0, #1
        mov     r0, r12, lsl #22
        orr     r3, r0, r3, lsr #10
        adds    r0, r2, r3
        mov     r12, r12, lsr #10
        adc     r2, r12, r2, asr #31
        orrs    r3, r2, r2, asr #31
        moveq   r1, #0
        beq     LAEG4
        sub     r5, r5, #1
        cmp     r5, r1
        bgt     LAEG4
        mov     r1, #0x1F
        mov     r0, #0
        add     r1, r1, #0x7E, 28
        mov     r2, r0
LAEG4:
        add     r1, r2, r1, lsl #20
        orr     r6, r1, r6
        eor     r1, r6, r4
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAEG5:
        cmp     lr, r5, lsl #20
        bcc     LAEG6
        cmp     r0, #0
        bne     LAEG7
        cmp     lr, r5, lsl #20
        bhi     LAEG7
LAEG6:
        str     r2, [sp, #0x20]
        add     r1, sp, #0x30
        add     r0, sp, #0x30
        add     r2, sp, #0x20
        mov     r6, r6, lsl #19
        str     r6, [sp, #0x24]
        mov     r3, #0x3D
        bl      __libm_error_support
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAEG7:
        orr     lr, lr, #2, 14
        eor     r1, lr, r4
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAEG8:
        mov     r1, r7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAEG9:
        mov     r1, r0, lsr #22
        add     lr, r12, #0xA
        cmp     lr, #0x3F
        orr     r1, r1, r3, lsl #10
        mov     r0, r0, lsl #10
        ble     LAEG13
        str     r0, [sp, #0x20]
        cmp     lr, #0x45
        str     r1, [sp, #0x24]
        sub     r2, r12, #0x36
        ble     LAEG12
        umull   r3, r12, r0, r1
        umull   r3, r9, r1, r1
        mov     r7, r12, asr #31
        adds    lr, r12, r12
        ldr     r12, [pc, #0xDB8]
        adc     r7, r7, r7
        adds    r3, r3, lr
        umull   r10, lr, r0, r3
        ldr     r8, [r12, #0xC]
        umull   r3, r10, r3, r1
        adc     r7, r9, r7
        umull   r8, r9, r8, r7
        str     r10, [sp, #0xC]
        umull   r8, r10, r0, r7
        str     r9, [sp, #8]
        ldr     r9, [r12, #8]
        str     r10, [sp, #4]
        umull   r11, r10, r1, r7
        str     r10, [sp]
        ldr     r10, [sp, #8]
        str     r11, [sp, #0x10]
        mov     r11, r2, lsl #1
        add     r10, r9, r10, lsr r11
        umull   r7, r9, r7, r10
        str     r9, [sp, #8]
        ldr     r9, [r12]
        ldr     r10, [sp, #8]
        str     r9, [sp, #0x14]
        ldr     r12, [r12, #4]
        add     r9, r11, #2
        mov     r7, r7, lsr r9
        str     r12, [sp, #0x18]
        rsb     r12, r11, #0x1E
        orr     r12, r7, r10, lsl r12
        ldr     r7, [sp, #0x14]
        ldr     r10, [sp, #8]
        adds    r12, r12, r7
        ldr     r7, [sp, #0x18]
        adc     r7, r7, r10, lsr r9
        adds    r9, r8, lr
        ldr     lr, [sp, #4]
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        adc     lr, lr, #0
        adds    r8, r8, r10
        ldr     r10, [sp]
        adc     r10, r10, #0
        adds    r9, r3, r9
        adc     lr, lr, #0
        adds    r3, lr, r8
        umull   lr, r8, r12, r3
        umull   lr, r9, r3, r7
        adc     r3, r10, #0
        umull   r12, r10, r12, r3
        umull   r3, r7, r7, r3
        adds    r8, r12, r8
        adc     r10, r10, #0
        adds    r9, r3, r9
        adc     r7, r7, #0
        adds    r8, lr, r8
        adc     r10, r10, #0
        adds    r9, r10, r9
        adc     r7, r7, #0
        cmp     r11, #0x20
        bcc     LAEG10
        mov     r9, r7
        sub     r11, r11, #0x20
        mov     r7, #0
LAEG10:
        rsb     r12, r11, #0x20
        mov     r3, r9, lsr r11
        orr     r12, r3, r7, lsl r12
        adds    r0, r12, r0
        adc     r1, r1, r7, lsr r11
        cmp     r1, #0
        add     r3, r2, #0x20
        addge   r2, sp, #0x28
        strge   r3, [r2]
        blt     LAEG59
LAEG11:
        ldr     r2, [sp, #0x28]
        b       LAEG52
LAEG12:
        add     r3, sp, #0x28
        bl      LAEG_dbl_CM_asin_poly
        ldr     r2, [sp, #0x28]
        b       LAEG52
LAEG13:
        cmp     r1, #0x6E, 8
        bls     LAEG41
        subs    r3, r2, r0
        mov     r0, #2, 2
        sbc     r12, r0, r1
        cmp     r12, r3, asr #31
        mov     r0, #0x40
        strne   r3, [sp, #0x20]
        strne   r12, [sp, #0x24]
        bne     LAEG14
        str     r2, [sp, #0x20]
        mov     r12, r3
        str     r3, [sp, #0x24]
        mov     r0, #0x60
LAEG14:
        eor     r2, r12, r12, asr #31
        ldr     r1, [sp, #0x20]
        sub     r2, r2, r12, asr #31
        clz     r2, r2
        ldr     r12, [sp, #0x24]
        sub     lr, r2, #1
        rsb     r5, lr, #0x20
        mov     r5, r1, lsr r5
        orr     r12, r5, r12, lsl lr
        mov     r5, r1, lsl lr
        add     r0, r0, lr
        and     r1, r0, #1
        ldr     r3, [pc, #0xC14]
        mov     lr, r1, lsl #7
        str     r5, [sp, #0x20]
        mov     r2, r12
        mvn     r6, #0x7F
        adds    lr, lr, r2, lsr #23
        adds    r6, lr, r6
        ldrb    r3, [r6, +r3]
        cmp     r1, #0
        str     r12, [sp, #0x24]
        add     r1, r3, #1, 24
        beq     LAEG15
        mov     r3, r5, lsr #31
        orr     r12, r3, r12, lsl #1
        mov     r5, r5, lsl #1
LAEG15:
        mul     r6, r1, r1
        mov     lr, r12, lsr #12
        sub     r3, r5, #1
        mla     r6, r6, lr, r6
        mov     r6, r6, asr #14
        mla     r6, r1, r6, r1
        rsb     r1, r6, r1, lsl #23
        mov     r6, r1, lsr #19
        mul     lr, r6, lr
        umull   r7, r6, lr, lr
        subs    r7, r5, r7
        sbc     r6, r12, r6
        umull   r6, r7, r1, r6
        adds    lr, lr, r7
        umull   r7, r6, lr, lr
        subs    r5, r5, r7
        sbc     r6, r12, r6
        umull   r5, r12, r1, r5
        umull   r5, r6, r1, r6
        adds    r5, r5, #0
        adc     r6, r6, lr
        adds    lr, r12, r5
        adc     r12, r6, #0
        mul     r7, r12, r12
        umull   r6, r5, r12, lr
        sub     r7, r3, r7
        subs    r7, r7, r5, lsl #1
        movmi   r7, #0
        umull   r5, r6, r1, r7
        adds    lr, lr, r6
        adc     r12, r12, #0
        mul     r7, r12, r12
        umull   r6, r5, r12, lr
        sub     r3, r3, r7
        subs    r3, r3, r5, lsl #1
        movmi   r3, #0
        umull   r1, r3, r1, r3
        adds    lr, lr, r3
        adc     r12, r12, #0
        rsb     r0, r0, #0x3E
        mov     r1, r12, lsl #31
        orr     lr, r1, lr, lsr #1
        mov     r0, r0, asr #1
        rsb     r0, r0, #0x3E
        adds    r1, lr, r2, lsr #30
        sub     r0, r0, #0x40
        mov     r12, r12, lsr #1
        adc     r3, r12, #0
        cmp     r0, #5
        ble     LAEG17
        umull   r2, lr, r1, r3
        umull   r2, r12, r3, r3
        ldr     r9, [pc, #0xB04]
        adds    r5, lr, lr
        mov     r6, lr, asr #31
        ldr     lr, [r9, #0xC]
        adc     r6, r6, r6
        adds    r2, r2, r5
        adc     r12, r12, r6
        umull   r5, lr, lr, r12
        umull   r5, r6, r1, r2
        umull   r2, r5, r2, r3
        ldr     r10, [r9, #8]
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x14]
        umull   r6, r5, r1, r12
        mov     r8, r0, lsl #1
        add     lr, r10, lr, lsr r8
        rsb     r11, r8, #0x1E
        str     r6, [sp, #0x10]
        umull   r6, r7, r3, r12
        ldr     r10, [r9]
        umull   r12, lr, r12, lr
        str     r10, [sp, #0xC]
        ldr     r9, [r9, #4]
        add     r10, r8, #2
        mov     r12, r12, lsr r10
        orr     r11, r12, lr, lsl r11
        ldr     r12, [sp, #0xC]
        adds    r12, r11, r12
        adc     r10, r9, lr, lsr r10
        ldr     lr, [sp, #0x10]
        ldr     r9, [sp, #0x18]
        adds    lr, lr, r9
        ldr     r9, [sp, #0x14]
        adc     r5, r5, #0
        adds    r6, r6, r9
        adc     r7, r7, #0
        adds    lr, r2, lr
        adc     r5, r5, #0
        adds    r6, r5, r6
        umull   r5, r2, r12, r6
        umull   r5, r6, r6, r10
        adc     lr, r7, #0
        umull   r12, r7, r12, lr
        umull   r10, lr, r10, lr
        adds    r2, r12, r2
        adc     r7, r7, #0
        adds    r6, r10, r6
        adc     lr, lr, #0
        adds    r2, r5, r2
        adc     r7, r7, #0
        adds    r6, r7, r6
        adc     lr, lr, #0
        cmp     r8, #0x20
        bcc     LAEG16
        mov     r6, lr
        sub     r8, r8, #0x20
        mov     lr, #0
LAEG16:
        rsb     r12, r8, #0x20
        mov     r2, r6, lsr r8
        orr     r12, r2, lr, lsl r12
        adds    r1, r1, r12
        adc     r8, r3, lr, lsr r8
        cmp     r8, #0
        add     r2, r0, #0x20
        addge   r0, sp, #0x28
        strge   r2, [r0]
        blt     LAEG60
        b       LAEG35
LAEG17:
        add     r2, r0, #0x1B
        mov     r2, r3, asr r2
        add     r12, r0, #0x1A
        mov     lr, r2, lsl #1
        orr     lr, lr, #1
        sub     r3, r3, lr, lsl r12
        cmp     r3, r1, asr #31
        bne     LAEG18
        mov     r3, r1, asr #1
        mov     r1, r1, lsl #31
        add     r0, r0, #0x1F
LAEG18:
        eor     r12, r3, r3, asr #31
        cmp     r2, #0
        sub     r12, r12, r3, asr #31
        clz     r12, r12
        sub     r12, r12, #1
        beq     LAEG19
        cmp     r12, #0
        subne   r12, r12, #1
LAEG19:
        rsb     lr, r12, #0x20
        mov     lr, r1, lsr lr
        orr     r8, lr, r3, lsl r12
        mov     r1, r1, lsl r12
        cmn     r8, #6, 2
        str     r1, [sp, #8]
        add     r7, r0, r12
        bne     LAEG20
        ldr     r1, [sp, #8]
        mov     r0, r8, lsl #31
        mov     r8, r8, lsr #1
        orr     r1, r0, r1, lsr #1
        str     r1, [sp, #8]
        sub     r7, r7, #1
LAEG20:
        ldr     r1, [sp, #8]
        ldr     r11, [pc, #0x974]
        add     r0, r8, r1, lsr #31
        smull   r1, r12, r0, r1
        smull   r3, r1, r0, r0
        ldr     r0, [pc, #0x968]
        mov     lr, r12, asr #31
        adds    r12, r12, r12
        adc     lr, lr, lr
        adds    r6, r3, r12
        ldr     r12, [r0, +r2, lsl #6]
        adc     r5, r1, lr
        rsb     r1, r2, r2, lsl #2
        mov     r3, r5, lsl #2
        orr     r3, r3, r6, lsr #30
        umull   r12, lr, r12, r3
        rsb     r12, r2, r1, lsl #2
        ldr     r1, [pc, #0x934]
        str     lr, [sp, #0x18]
        add     lr, r0, r2, lsl #6
        ldrsb   r1, [r1, +r12]
        ldr     r10, [lr, #4]
        mov     r0, r7, lsl #1
        str     r0, [sp]
        add     r2, r0, #2
        ldr     r0, [lr, #8]
        ldr     r9, [lr, #0xC]
        add     r12, r11, r12
        ldr     r11, [sp, #0x18]
        add     r1, r1, r2
        str     r9, [sp, #4]
        ldr     r9, [lr, #0x10]
        add     r1, r10, r11, lsr r1
        umull   r10, r1, r3, r1
        ldrsb   r11, [r12, #1]
        ldrsb   r10, [r12, #2]
        add     r11, r11, r2
        add     r11, r0, r1, lsr r11
        umull   r0, r1, r3, r11
        add     r10, r10, r2
        cmp     r10, #0x20
        bhi     LAEG21
        rsb     r11, r10, #0x20
        str     r11, [sp, #0x18]
        mov     r0, r0, lsr r10
        mov     r11, r1, lsr r10
        ldr     r10, [sp, #0x18]
        orr     r10, r0, r1, lsl r10
        b       LAEG22
LAEG21:
        cmp     r10, #0x40
        movhi   r11, #0
        movhi   r10, r11
        bhi     LAEG22
        sub     r0, r10, #0x20
        str     r0, [sp, #0x18]
        ldr     r11, [sp, #0x18]
        rsb     r0, r10, #0x40
        mov     r10, #0
        mov     r1, r1, lsr r11
        mov     r11, r10, lsr r11
        orr     r10, r1, r10, lsl r0
LAEG22:
        adds    r10, r9, r10
        umull   r0, r9, r10, r5
        ldr     r0, [sp, #4]
        adc     r11, r0, r11
        umull   r0, r10, r6, r11
        umull   r0, r1, r11, r5
        str     r1, [sp, #0x18]
        ldrsb   r1, [r12, #3]
        adds    r10, r9, r10
        str     r10, [sp, #0x14]
        ldr     r9, [lr, #0x18]
        ldr     r10, [lr, #0x14]
        mov     r11, #0
        str     r9, [sp, #0xC]
        adc     r9, r11, #0
        ldr     r11, [sp, #0x14]
        adds    r11, r0, r11
        ldr     r0, [sp]
        str     r11, [sp, #4]
        add     r11, r0, r1
        ldr     r0, [sp, #0x18]
        adc     r1, r0, r9
        cmp     r11, #0x20
        bhi     LAEG23
        rsb     r0, r11, #0x20
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #4]
        mov     r9, r1, lsr r11
        mov     r0, r0, lsr r11
        ldr     r11, [sp, #0x18]
        orr     r11, r0, r1, lsl r11
        b       LAEG24
LAEG23:
        cmp     r11, #0x40
        movhi   r9, #0
        movhi   r11, r9
        bhi     LAEG24
        sub     r0, r11, #0x20
        str     r0, [sp, #0x18]
        ldr     r9, [sp, #0x18]
        rsb     r0, r11, #0x40
        mov     r11, #0
        mov     r1, r1, lsr r9
        mov     r9, r11, lsr r9
        orr     r11, r1, r11, lsl r0
LAEG24:
        ldr     r0, [sp, #0xC]
        adds    r0, r11, r0
        umull   r1, r0, r0, r5
        adc     r10, r9, r10
        umull   r1, r11, r6, r10
        umull   r10, r9, r10, r5
        ldrsb   r1, [r12, #4]
        adds    r11, r0, r11
        mov     r0, #0
        adc     r0, r0, #0
        adds    r10, r10, r11
        add     r1, r7, r1
        adc     r0, r9, r0
        cmp     r1, #0x20
        bhi     LAEG25
        rsb     r9, r1, #0x20
        mov     r10, r10, lsr r1
        mov     r1, r0, lsr r1
        orr     r9, r10, r0, lsl r9
        str     r1, [sp, #4]
        str     r9, [sp, #0xC]
        b       LAEG27
LAEG25:
        cmp     r1, #0x40
        bhi     LAEG26
        sub     r9, r1, #0x20
        rsb     r1, r1, #0x40
        mov     r0, r0, lsr r9
        mov     r10, #0
        mov     r9, r10, lsr r9
        orr     r1, r0, r10, lsl r1
        str     r9, [sp, #4]
        str     r1, [sp, #0xC]
        b       LAEG27
LAEG26:
        mov     r0, #0
        str     r0, [sp, #4]
        str     r0, [sp, #0xC]
LAEG27:
        ldr     r9, [lr, #0x1C]
        ldrsb   r0, [r12, #5]
        ldr     r1, [lr, #0x20]
        umull   r9, r10, r3, r9
        ldr     r9, [lr, #0x24]
        add     r0, r0, r2
        add     r0, r1, r10, lsr r0
        umull   r0, r1, r3, r0
        str     r1, [sp, #0x18]
        ldrsb   r10, [r12, #6]
        ldr     r11, [sp, #0x18]
        ldrsb   r0, [r12, #7]
        ldr     r1, [lr, #0x28]
        add     r10, r2, r10
        add     r10, r9, r11, lsr r10
        umull   r10, r3, r3, r10
        ldr     r9, [lr, #0x2C]
        add     r0, r2, r0
        cmp     r0, #0x20
        bhi     LAEG28
        rsb     r2, r0, #0x20
        str     r2, [sp, #0x18]
        mov     r10, r10, lsr r0
        mov     r2, r3, lsr r0
        ldr     r0, [sp, #0x18]
        orr     r0, r10, r3, lsl r0
        b       LAEG29
LAEG28:
        cmp     r0, #0x40
        movhi   r2, #0
        movhi   r0, r2
        bhi     LAEG29
        sub     r2, r0, #0x20
        rsb     r0, r0, #0x40
        str     r0, [sp, #0x18]
        ldr     r10, [sp, #0x18]
        mov     r0, #0
        mov     r3, r3, lsr r2
        mov     r2, r0, lsr r2
        orr     r0, r3, r0, lsl r10
LAEG29:
        adds    r0, r9, r0
        umull   r3, r0, r0, r5
        adc     r2, r1, r2
        umull   r6, r1, r6, r2
        umull   r5, r2, r5, r2
        ldrsb   r6, [r12, #8]
        adds    r9, r0, r1
        mov     r3, #0
        ldr     r1, [lr, #0x30]
        ldr     r0, [lr, #0x34]
        adc     r3, r3, #0
        adds    r5, r5, r9
        ldr     r9, [sp]
        adc     r3, r2, r3
        add     r6, r9, r6
        cmp     r6, #0x20
        bhi     LAEG30
        rsb     r2, r6, #0x20
        mov     r5, r5, lsr r6
        mov     r6, r3, lsr r6
        orr     r2, r5, r3, lsl r2
        b       LAEG31
LAEG30:
        cmp     r6, #0x40
        movhi   r6, #0
        movhi   r2, r6
        bhi     LAEG31
        sub     r5, r6, #0x20
        rsb     r2, r6, #0x40
        mov     r9, #0
        mov     r3, r3, lsr r5
        mov     r6, r9, lsr r5
        orr     r2, r3, r9, lsl r2
LAEG31:
        adds    r2, r2, r0
        ldr     r0, [sp, #8]
        adc     r1, r6, r1
        umull   r3, r0, r0, r1
        umull   r3, r5, r2, r8
        adds    r3, r5, r0
        umull   r6, r0, r8, r1
        mov     r5, #0
        adc     r5, r5, #0
        adds    r3, r6, r3
        adc     r0, r0, r5
        cmp     r8, #0
        blt     LAEG63
LAEG32:
        ldr     r1, [sp, #0xC]
        ldrsb   r2, [r12, #9]
        adds    r1, r1, r3, lsl #1
        mov     r3, r3, lsr #31
        orr     r0, r3, r0, lsl #1
        add     r7, r7, r2
        ldr     r2, [lr, #0x38]
        ldr     r3, [sp, #4]
        ldr     lr, [lr, #0x3C]
        adc     r0, r3, r0
        cmp     r7, #0x20
        bhi     LAEG33
        mov     r1, r1, lsr r7
        rsb     r3, r7, #0x20
        orr     r5, r1, r0, lsl r3
        mov     r7, r0, asr r7
        b       LAEG34
LAEG33:
        cmp     r7, #0x40
        movhi   r7, #0
        movhi   r5, r7
        bhi     LAEG34
        sub     r3, r7, #0x20
        mov     r1, r0, asr #31
        rsb     r7, r7, #0x40
        mov     r0, r0, lsr r3
        orr     r5, r0, r1, lsl r7
        mov     r7, r1, asr r3
LAEG34:
        ldrsb   r12, [r12, #0xA]
        adds    r1, r5, lr
        adc     r8, r7, r2
        cmp     r8, #0
        addge   r0, sp, #0x28
        strge   r12, [r0]
        blt     LAEG62
LAEG35:
        ldr     r0, [sp, #0x28]
        ldr     lr, [pc, #0x55C]
        sub     r3, r0, #0x1F
        mov     r12, r1, lsr r3
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        rsb     lr, r3, #0x20
        orr     lr, r12, r8, lsl lr
        subs    r0, r0, lr
        sbc     r3, r1, r8, asr r3
        mov     r1, #0x3E
        mvn     r12, #2, 2
        str     r1, [sp, #0x28]
        bics    r1, r3, r12
        beq     LAEG36
        rsbs    r0, r0, #0
        rsc     r3, r3, #0
LAEG36:
        mov     r2, #0xFE
        orr     r2, r2, #7, 24
        clz     r5, r3
        sub     lr, r2, #1, 22
        cmp     r5, #0x20
        mov     r2, #0x1F
        beq     LAEG61
LAEG37:
        sub     r5, r5, #1
        rsb     r12, r5, #0x20
        mov     r12, r0, lsr r12
        orr     r12, r12, r3, lsl r5
        subs    r3, lr, r5
        mov     r5, r0, lsl r5
        bpl     LAEG39
        rsb     r3, r3, #0
        cmp     r3, #0x20
        blt     LAEG38
        mov     r5, r12
        mov     r12, r12, asr #31
        sub     r3, r3, #0x20
LAEG38:
        cmp     r3, #0x20
        mov     r0, #0x20
        movgt   r3, r0
        mov     r5, r5, lsr r3
        rsb     r0, r3, #0x20
        orr     r5, r5, r12, lsl r0
        mov     r12, r12, asr r3
        mov     r3, #0
LAEG39:
        mov     r0, r5, lsr #9
        and     lr, r0, #1
        mov     r0, r12, lsl #22
        orr     r5, r0, r5, lsr #10
        adds    r0, lr, r5
        mov     r12, r12, lsr #10
        adc     lr, r12, lr, asr #31
        orrs    r12, lr, lr, asr #31
        moveq   r3, #0
        beq     LAEG40
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        sub     r12, r12, #1
        cmp     r12, r3
        bgt     LAEG40
        mov     r0, #0
        add     r3, r2, #0x7E, 28
        mov     lr, r0
LAEG40:
        add     r3, lr, r3, lsl #20
        orr     r1, r3, r1
        eor     r1, r1, r4
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAEG41:
        umull   r2, r11, r1, r0
        umull   r3, r12, r1, r1
        umull   r8, r9, r0, r0
        str     r0, [sp, #0x20]
        mov     r10, r2, lsr #31
        orr     r11, r10, r11, lsl #1
        adds    r3, r3, r11
        adc     r12, r12, #0
        adds    r8, r8, #0
        str     r1, [sp, #0x24]
        adc     r9, r9, r2, lsl #1
        cmp     r8, r2, lsl #1
        bcs     LAEG42
        adds    r3, r3, #1
        adc     r12, r12, #0
LAEG42:
        adds    r3, r3, #0
        adc     r0, r12, #0xE, 4
        cmp     r0, #0
        mvn     r1, #2
        movge   r7, #0
        blt     LAEG67
LAEG43:
        cmp     r0, r3, asr #31
        mov     r2, r0
        bne     LAEG44
        mov     r2, r3
        mov     r0, r3
        mov     r3, r9
        mov     r9, r8
        mov     r1, #0x1D
LAEG44:
        eor     r12, r2, r2, asr #31
        sub     r12, r12, r2, asr #31
        clz     r2, r12
        sub     r12, r2, #1
        add     r2, r1, r12
        rsb     r1, r12, #0x20
        mov     r9, r9, lsr r1
        mov     r1, r3, lsr r1
        orr     r1, r1, r0, lsl r12
        cmp     r2, #5
        orr     r0, r9, r3, lsl r12
        bgt     LAEG46
        cmp     r2, #0
        blt     LAEG45
        add     r3, sp, #0x28
        bl      LAEG_dbl_CM_asin_poly
        ldr     r2, [sp, #0x28]
        b       LAEG49
LAEG45:
        ldr     r0, [pc, #0x3A8]
        ldr     r1, [pc, #0x3A8]
        mov     r2, #0x1F
        b       LAEG49
LAEG46:
        umull   r12, r3, r0, r1
        umull   r8, r9, r1, r1
        mov     r12, r3, asr #31
        ldr     lr, [pc, #0x37C]
        adds    r10, r3, r3
        adc     r12, r12, r12
        ldr     r3, [lr, #0xC]
        adds    r10, r8, r10
        umull   r8, r11, r0, r10
        umull   r10, r8, r10, r1
        str     r11, [sp, #0x18]
        adc     r12, r9, r12
        str     r8, [sp, #0x14]
        umull   r3, r8, r3, r12
        str     r10, [sp, #0x10]
        umull   r10, r3, r0, r12
        ldr     r9, [lr, #8]
        str     r3, [sp, #0xC]
        str     r10, [sp, #8]
        umull   r3, r10, r1, r12
        str     r10, [sp]
        str     r3, [sp, #4]
        mov     r3, r2, lsl #1
        add     r8, r9, r8, lsr r3
        umull   r8, r12, r12, r8
        ldr     r9, [lr]
        ldr     lr, [lr, #4]
        add     r10, r3, #2
        rsb     r11, r3, #0x1E
        mov     r8, r8, lsr r10
        orr     r11, r8, r12, lsl r11
        adds    r8, r11, r9
        adc     r10, lr, r12, lsr r10
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #8]
        ldr     r9, [sp, #0x14]
        adds    lr, r12, lr
        ldr     r12, [sp, #0xC]
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #4]
        ldr     r11, [sp, #0x18]
        adc     r12, r12, #0
        adds    lr, lr, r9
        ldr     r9, [sp]
        adc     r9, r9, #0
        str     r9, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        adds    r11, r9, r11
        adc     r12, r12, #0
        adds    lr, r12, lr
        umull   r9, r12, r8, lr
        umull   r9, lr, lr, r10
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        adc     r11, r9, #0
        umull   r8, r9, r8, r11
        str     r8, [sp, #0x14]
        umull   r8, r10, r10, r11
        ldr     r11, [sp, #0x14]
        adds    r12, r11, r12
        adc     r9, r9, #0
        adds    lr, r8, lr
        ldr     r8, [sp, #0x18]
        adc     r10, r10, #0
        adds    r12, r8, r12
        adc     r9, r9, #0
        adds    lr, r9, lr
        adc     r10, r10, #0
        cmp     r3, #0x20
        bcc     LAEG47
        mov     lr, r10
        sub     r3, r3, #0x20
        mov     r10, #0
LAEG47:
        mov     r12, lr, lsr r3
        rsb     lr, r3, #0x20
        orr     lr, r12, r10, lsl lr
        adds    r0, lr, r0
        adc     r1, r1, r10, lsr r3
        cmp     r1, #0
        add     r3, r2, #0x20
        addge   r2, sp, #0x28
        strge   r3, [r2]
        blt     LAEG66
LAEG48:
        ldr     r2, [sp, #0x28]
        cmp     r2, #0x3E
        ble     LAEG49
        mov     r0, r1
        sub     r2, r2, #0x20
        mov     r1, #0
LAEG49:
        ldr     r3, [pc, #0x220]
        sub     r2, r2, #0x1E
        cmp     r7, #0
        ldr     r12, [r3]
        ldr     r3, [r3, #4]
        rsb     lr, r2, #0x20
        mov     r0, r0, lsr r2
        orr     lr, r0, r1, lsl lr
        bne     LAEG50
        adds    r0, r12, lr
        adc     r1, r3, r1, asr r2
        b       LAEG51
LAEG50:
        subs    r0, r12, lr
        sbc     r1, r3, r1, asr r2
LAEG51:
        cmp     r1, #0
        mov     r2, #0x1F
        strge   r2, [sp, #0x28]
        blt     LAEG65
LAEG52:
        bics    r6, r1, r6
        beq     LAEG53
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAEG53:
        sub     r3, r5, #0xF3, 30
        sub     r3, r3, #0x17
        clz     r12, r1
        cmp     r12, #0x20
        rsb     r3, r2, r3
        beq     LAEG64
LAEG54:
        sub     r12, r12, #1
        rsb     r2, r12, #0x20
        mov     r2, r0, lsr r2
        orr     r2, r2, r1, lsl r12
        subs    r1, r3, r12
        mov     r12, r0, lsl r12
        bpl     LAEG56
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAEG55
        mov     r12, r2
        mov     r2, r2, asr #31
        sub     r1, r1, #0x20
LAEG55:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r12, r12, lsr r1
        rsb     r0, r1, #0x20
        orr     r12, r12, r2, lsl r0
        mov     r2, r2, asr r1
        mov     r1, #0
LAEG56:
        mov     r0, r12, lsr #9
        and     r3, r0, #1
        mov     r0, r2, lsl #22
        orr     r12, r0, r12, lsr #10
        adds    r0, r3, r12
        mov     r2, r2, lsr #10
        adc     r3, r2, r3, asr #31
        orrs    r2, r3, r3, asr #31
        moveq   r1, #0
        beq     LAEG57
        mov     r2, #0xFE
        orr     r2, r2, #7, 24
        cmp     r2, r1
        bgt     LAEG57
        mov     r0, #0
        mov     r1, r5
        mov     r3, r0
LAEG57:
        add     r1, r3, r1, lsl #20
        orr     r6, r1, r6
        eor     r1, r6, r4
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LAEG58:
        clz     r3, r2
        cmp     r3, #0
        beq     LAEG1
        mov     r12, r2
        sub     r0, r1, #0x42, 28
        mov     lr, r3
        mov     r2, #0
        b       LAEG1
LAEG59:
        mov     r3, r1, lsl #31
        add     r2, r2, #0x1F
        add     r12, sp, #0x28
        str     r2, [r12]
        orr     r0, r3, r0, lsr #1
        mov     r1, r1, lsr #1
        b       LAEG11
LAEG60:
        mov     r2, r8, lsl #31
        add     r0, r0, #0x1F
        add     r3, sp, #0x28
        str     r0, [r3]
        orr     r1, r2, r1, lsr #1
        mov     r8, r8, lsr #1
        b       LAEG35
LAEG61:
        clz     r12, r0
        cmp     r12, #0
        beq     LAEG37
        add     r3, r2, #0x7E, 28
        sub     lr, r3, #1
        mov     r3, r0
        sub     lr, lr, #0x42, 28
        mov     r5, r12
        mov     r0, #0
        b       LAEG37
LAEG62:
        mov     r0, r8, lsl #31
        sub     r12, r12, #1
        add     r2, sp, #0x28
        str     r12, [r2]
        orr     r1, r0, r1, lsr #1
        mov     r8, r8, lsr #1
        b       LAEG35
LAEG63:
        subs    r3, r3, r2
        sbc     r0, r0, r1
        b       LAEG32
LAEG64:
        clz     r2, r0
        cmp     r2, #0
        beq     LAEG54
        mov     r1, r0
        sub     r3, r3, #0x20
        mov     r12, r2
        mov     r0, #0
        b       LAEG54
LAEG65:
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r2, #0x1E
        str     r2, [sp, #0x28]
        mov     r1, r1, lsr #1
        b       LAEG52
LAEG66:
        mov     r3, r1, lsl #31
        add     r2, r2, #0x1F
        add     r12, sp, #0x28
        str     r2, [r12]
        orr     r0, r3, r0, lsr #1
        mov     r1, r1, lsr #1
        b       LAEG48
LAEG67:
        rsbs    r3, r3, #0
        rsc     r0, r0, #0
        mov     r7, #1
        b       LAEG43
        .long   LAEG_pi4
        .long   LAEG_asin_near_zero_coeff
        .long   LAEG_rsqrt_table
        .long   LAEG_sc_dbl_asin_coeff
        .long   LAEG_dbl_asin_coeff
        .long   0xb5cd9612
        .long   0x430548e0
LAEG_dbl_CM_asin_poly:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        str     r3, [sp]
        add     r3, r2, #0x1B
        mov     r3, r1, asr r3
        add     r12, r2, #0x1A
        mov     lr, r3, lsl #1
        orr     lr, lr, #1
        sub     r1, r1, lr, lsl r12
        cmp     r1, r0, asr #31
        bne     LAEG68
        mov     r1, r0, asr #1
        mov     r0, r0, lsl #31
        add     r2, r2, #0x1F
LAEG68:
        eor     r12, r1, r1, asr #31
        cmp     r3, #0
        sub     r12, r12, r1, asr #31
        clz     r12, r12
        sub     lr, r12, #1
        beq     LAEG69
        cmp     lr, #0
        subne   lr, lr, #1
LAEG69:
        rsb     r12, lr, #0x20
        mov     r12, r0, lsr r12
        orr     r8, r12, r1, lsl lr
        cmn     r8, #6, 2
        mov     r12, r0, lsl lr
        add     r7, r2, lr
        bne     LAEG70
        mov     r0, r8, lsl #31
        orr     r12, r0, r12, lsr #1
        mov     r8, r8, lsr #1
        sub     r7, r7, #1
LAEG70:
        add     r1, r8, r12, lsr #31
        smull   r0, lr, r1, r12
        smull   r2, r1, r1, r1
        ldr     r0, [pc, #-0xA4]
        mov     r4, lr, asr #31
        adds    lr, lr, lr
        adc     r4, r4, r4
        adds    r6, r2, lr
        ldr     r2, [r0, +r3, lsl #6]
        adc     r5, r1, r4
        add     r1, r0, r3, lsl #6
        ldr     r10, [r1, #0x10]
        ldr     r0, [r1, #4]
        ldr     lr, [r1, #8]
        ldr     r9, [r1, #0xC]
        rsb     r4, r3, r3, lsl #2
        str     r10, [sp, #8]
        mov     r10, r5, lsl #2
        rsb     r4, r3, r4, lsl #2
        orr     r3, r10, r6, lsr #30
        umull   r2, r10, r2, r3
        ldr     r2, [pc, #-0xF0]
        ldr     r11, [pc, #-0xF4]
        ldrsb   r2, [r2, +r4]
        str     r2, [sp, #0xC]
        mov     r2, r7, lsl #1
        add     r4, r11, r4
        ldr     r11, [sp, #0xC]
        str     r2, [sp, #4]
        add     r2, r2, #2
        add     r11, r11, r2
        add     r11, r0, r10, lsr r11
        umull   r0, r10, r3, r11
        ldrsb   r11, [r4, #1]
        ldrsb   r0, [r4, #2]
        add     r11, r11, r2
        add     r11, lr, r10, lsr r11
        umull   r10, lr, r3, r11
        add     r11, r0, r2
        cmp     r11, #0x20
        bhi     LAEG71
        rsb     r0, r11, #0x20
        str     r0, [sp, #0xC]
        mov     r0, r10, lsr r11
        ldr     r10, [sp, #0xC]
        mov     r11, lr, lsr r11
        orr     r10, r0, lr, lsl r10
        b       LAEG72
LAEG71:
        cmp     r11, #0x40
        movhi   r11, #0
        movhi   r10, r11
        bhi     LAEG72
        sub     r0, r11, #0x20
        str     r0, [sp, #0xC]
        rsb     r0, r11, #0x40
        ldr     r11, [sp, #0xC]
        mov     r10, #0
        mov     lr, lr, lsr r11
        mov     r11, r10, lsr r11
        orr     r10, lr, r10, lsl r0
LAEG72:
        ldr     r0, [sp, #8]
        adds    r10, r0, r10
        umull   lr, r0, r5, r10
        adc     r11, r9, r11
        umull   lr, r10, r6, r11
        umull   r9, lr, r11, r5
        ldrsb   r11, [r4, #3]
        str     r11, [sp, #0x10]
        adds    r11, r0, r10
        ldr     r10, [r1, #0x18]
        ldr     r0, [r1, #0x14]
        str     r10, [sp, #8]
        mov     r10, #0
        adc     r10, r10, #0
        adds    r11, r9, r11
        ldr     r9, [sp, #4]
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        add     r9, r9, r11
        adc     r11, lr, r10
        cmp     r9, #0x20
        bhi     LAEG73
        rsb     lr, r9, #0x20
        str     lr, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        mov     r10, lr, lsr r9
        mov     lr, r11, lsr r9
        ldr     r9, [sp, #0x10]
        orr     r11, r10, r11, lsl r9
        b       LAEG74
LAEG73:
        cmp     r9, #0x40
        movhi   lr, #0
        movhi   r11, lr
        bhi     LAEG74
        sub     lr, r9, #0x20
        str     lr, [sp, #0x10]
        rsb     r9, r9, #0x40
        ldr     lr, [sp, #0x10]
        str     r9, [sp, #0xC]
        ldr     r10, [sp, #0xC]
        mov     r11, r11, lsr lr
        mov     r9, #0
        mov     lr, r9, lsr lr
        orr     r11, r11, r9, lsl r10
LAEG74:
        ldr     r9, [sp, #8]
        adds    r9, r11, r9
        umull   r10, r9, r5, r9
        adc     r0, lr, r0
        umull   lr, r11, r6, r0
        umull   r10, lr, r0, r5
        ldrsb   r0, [r4, #4]
        adds    r11, r9, r11
        mov     r9, #0
        adc     r9, r9, #0
        adds    r10, r10, r11
        add     r0, r7, r0
        adc     r9, lr, r9
        cmp     r0, #0x20
        bhi     LAEG75
        rsb     lr, r0, #0x20
        mov     r10, r10, lsr r0
        orr     lr, r10, r9, lsl lr
        mov     r0, r9, lsr r0
        str     lr, [sp, #8]
        b       LAEG77
LAEG75:
        cmp     r0, #0x40
        bhi     LAEG76
        sub     r10, r0, #0x20
        rsb     lr, r0, #0x40
        mov     r11, #0
        mov     r9, r9, lsr r10
        orr     lr, r9, r11, lsl lr
        mov     r0, r11, lsr r10
        str     lr, [sp, #8]
        b       LAEG77
LAEG76:
        mov     r0, #0
        str     r0, [sp, #8]
LAEG77:
        ldr     r9, [r1, #0x1C]
        ldrsb   lr, [r4, #5]
        ldr     r10, [r1, #0x20]
        umull   r11, r9, r3, r9
        ldr     r11, [r1, #0x24]
        add     lr, lr, r2
        add     lr, r10, r9, lsr lr
        umull   lr, r9, r3, lr
        str     r11, [sp, #0x10]
        ldr     r10, [r1, #0x28]
        ldrsb   r11, [r4, #6]
        ldrsb   lr, [r4, #7]
        str     r10, [sp, #0xC]
        add     r10, r2, r11
        ldr     r11, [sp, #0x10]
        add     lr, r2, lr
        cmp     lr, #0x20
        add     r10, r11, r9, lsr r10
        umull   r10, r9, r3, r10
        ldr     r3, [r1, #0x2C]
        bhi     LAEG78
        rsb     r2, lr, #0x20
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x10]
        mov     r10, r10, lsr lr
        mov     lr, r9, lsr lr
        orr     r2, r10, r9, lsl r2
        b       LAEG79
LAEG78:
        cmp     lr, #0x40
        movhi   lr, #0
        movhi   r2, lr
        bhi     LAEG79
        sub     r10, lr, #0x20
        rsb     r2, lr, #0x40
        mov     r11, #0
        mov     r9, r9, lsr r10
        mov     lr, r11, lsr r10
        orr     r2, r9, r11, lsl r2
LAEG79:
        adds    r2, r3, r2
        umull   r3, r2, r5, r2
        ldr     r3, [sp, #0xC]
        adc     lr, r3, lr
        umull   r6, r3, r6, lr
        umull   r5, lr, r5, lr
        adds    r3, r2, r3
        ldr     r2, [sp, #4]
        ldrsb   r6, [r4, #8]
        add     r2, r2, r6
        mov     r6, #0
        adc     r9, r6, #0
        adds    r6, r5, r3
        ldr     r3, [r1, #0x30]
        ldr     r5, [r1, #0x34]
        adc     lr, lr, r9
        cmp     r2, #0x20
        bhi     LAEG80
        rsb     r9, r2, #0x20
        mov     r6, r6, lsr r2
        mov     r2, lr, lsr r2
        orr     r9, r6, lr, lsl r9
        b       LAEG81
LAEG80:
        cmp     r2, #0x40
        movhi   r2, #0
        movhi   r9, r2
        bhi     LAEG81
        sub     r9, r2, #0x20
        rsb     r6, r2, #0x40
        mov     r10, #0
        mov     lr, lr, lsr r9
        mov     r2, r10, lsr r9
        orr     r9, lr, r10, lsl r6
LAEG81:
        adds    lr, r9, r5
        adc     r5, r2, r3
        umull   r12, r2, r12, r5
        umull   r3, r12, r8, lr
        adds    r3, r12, r2
        umull   r6, r2, r8, r5
        mov     r12, #0
        adc     r12, r12, #0
        adds    r3, r6, r3
        adc     r2, r2, r12
        cmp     r8, #0
        blt     LAEG87
LAEG82:
        ldrsb   lr, [r4, #9]
        ldr     r12, [r1, #0x38]
        ldr     r1, [r1, #0x3C]
        add     r7, r7, lr
        ldr     lr, [sp, #8]
        adds    lr, lr, r3, lsl #1
        mov     r3, r3, lsr #31
        orr     r2, r3, r2, lsl #1
        adc     r0, r0, r2
        cmp     r7, #0x20
        bhi     LAEG83
        mov     lr, lr, lsr r7
        rsb     r2, r7, #0x20
        orr     lr, lr, r0, lsl r2
        mov     r7, r0, asr r7
        b       LAEG84
LAEG83:
        cmp     r7, #0x40
        movhi   r7, #0
        movhi   lr, r7
        bhi     LAEG84
        sub     r3, r7, #0x20
        mov     r2, r0, asr #31
        rsb     r7, r7, #0x40
        mov     r0, r0, lsr r3
        orr     lr, r0, r2, lsl r7
        mov     r7, r2, asr r3
LAEG84:
        ldrsb   r4, [r4, #0xA]
        adds    r0, lr, r1
        adc     r1, r7, r12
        cmp     r1, #0
        ldrge   r2, [sp]
        strge   r4, [r2]
        blt     LAEG86
LAEG85:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAEG86:
        ldr     r3, [sp]
        mov     r2, r1, lsl #31
        sub     r4, r4, #1
        str     r4, [r3]
        orr     r0, r2, r0, lsr #1
        mov     r1, r1, lsr #1
        b       LAEG85
LAEG87:
        subs    r3, r3, lr
        sbc     r2, r2, r5
        b       LAEG82


        .data
        .align  4


LAEG_pi4:
        .byte   0x1A,0x61,0xB4,0x10,0x51,0xED,0x87,0x64
LAEG_asin_near_zero_coeff:
        .byte   0xAB,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0x2A,0xCD,0xCC,0xCC,0x4C,0x6E,0xDB,0xB6,0x2D
LAEG_rsqrt_table:
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
LAEG_dbl_asin_coeff:
        .byte   0xFC,0x23,0x9F,0x7E,0x5B,0x26,0x3B,0x46,0xAD,0xDF,0x28,0x50,0xD4,0x03,0x19,0x60
        .byte   0x71,0x69,0x2C,0x76,0x78,0x00,0x06,0x40,0x8B,0x9D,0xC0,0x08,0xE6,0x8D,0xAD,0x7D
        .byte   0xFA,0xF1,0xF9,0x5B,0x1F,0xDC,0x08,0x4D,0x75,0x58,0x6D,0x55,0x9F,0x62,0x07,0xA7
        .byte   0x18,0x00,0x02,0x40,0x81,0x11,0x40,0x01,0x57,0x55,0x00,0x20,0x23,0x98,0xD2,0xBB
        .byte   0xC9,0x1F,0xC4,0x62,0x9E,0x09,0x28,0x6C,0xCF,0x2F,0x2C,0x7A,0x8C,0xA9,0xA9,0x48
        .byte   0x10,0x9E,0x23,0x38,0x19,0x39,0x51,0x60,0x9D,0x7F,0xD5,0x77,0xD7,0x2F,0xE2,0x43
        .byte   0x9A,0x91,0x6C,0x60,0x82,0xAC,0xED,0x4E,0x5E,0x53,0x2E,0x56,0x62,0x76,0x1B,0xA2
        .byte   0x9B,0x07,0x12,0x40,0x04,0x65,0x01,0x91,0x23,0x81,0x04,0x30,0x60,0x52,0x61,0xFB
        .byte   0xDF,0xB6,0xF5,0x58,0x79,0x90,0xFB,0x5E,0xAB,0x25,0x1C,0x69,0x4A,0x12,0x19,0x7B
        .byte   0xD8,0xA6,0xB1,0x89,0xD6,0xF0,0xBC,0x50,0x99,0xBA,0xD5,0x2F,0x09,0x42,0x95,0x4E
        .byte   0xA6,0x86,0xAD,0x69,0xEE,0xCE,0xCE,0x52,0x1A,0x0A,0xB5,0x57,0xF9,0x5E,0x72,0x3D
        .byte   0xE4,0x3A,0x32,0x40,0xB8,0x63,0x22,0xB4,0x09,0xE4,0x14,0x50,0x1F,0xF5,0x9B,0x03
        .byte   0x96,0xDA,0xDB,0x45,0x86,0xBE,0xE4,0x47,0x1A,0x8F,0x2E,0x4D,0xC2,0x07,0x50,0x58
        .byte   0x6E,0x29,0x05,0xD2,0x6F,0x4D,0x0A,0x72,0xE6,0x47,0x97,0x14,0xA5,0x30,0x43,0x60
        .byte   0xDD,0x60,0x7F,0x78,0x06,0x2D,0xDD,0x58,0xA4,0x39,0x0B,0x5A,0xD4,0xCF,0x34,0x9E
        .byte   0x5C,0xE3,0x62,0x40,0x58,0x20,0x60,0x89,0x03,0x7A,0x39,0x70,0xD9,0xB5,0x5C,0xDC
        .byte   0x20,0xFD,0x67,0x68,0x62,0x90,0x80,0x66,0x81,0xBF,0xC4,0x69,0x6E,0xDA,0x58,0x75
        .byte   0xD8,0x83,0xC4,0xA3,0x8A,0x95,0x30,0x4A,0x02,0xE0,0x6E,0xC7,0x22,0xAD,0x31,0x7B
        .byte   0xE6,0xDD,0x11,0x47,0x54,0x20,0x67,0x61,0x2A,0x16,0x40,0x5D,0x88,0x23,0xDE,0x27
        .byte   0x68,0x71,0xA4,0x40,0x67,0xE2,0x52,0xA4,0x0C,0x4C,0x3D,0x48,0x13,0x7E,0x30,0x23
        .byte   0x57,0xAB,0xB5,0x4C,0x4C,0x31,0x32,0x47,0x7C,0x5C,0x00,0x46,0x25,0x3A,0xBF,0x4A
        .byte   0x7D,0xDC,0xE4,0x42,0xFB,0x6C,0x0C,0x5C,0xF2,0xA7,0xB1,0x08,0x0F,0xBA,0x81,0x51
        .byte   0x9D,0x61,0x42,0x56,0xBC,0x1C,0xDF,0x6C,0x48,0x10,0x69,0x61,0x8C,0xC7,0xFA,0x96
        .byte   0x47,0x7F,0xF7,0x40,0xF2,0x4B,0x74,0xE7,0xE7,0x6A,0x70,0x58,0x6A,0xBE,0x74,0x55
        .byte   0xE1,0x9B,0x89,0x70,0x45,0x14,0xF7,0x61,0x50,0xFF,0x0A,0x5B,0xB8,0x7A,0xE1,0x5C
        .byte   0xE0,0x4B,0x6A,0xBB,0x98,0x05,0xC9,0x6E,0xC3,0x9A,0x13,0xCE,0xB6,0x35,0xB6,0x6E
        .byte   0x90,0xD7,0x3B,0x6B,0xB3,0xDA,0xE5,0x7B,0x4B,0xF5,0xA2,0x66,0x19,0x3E,0xF3,0x41
        .byte   0x1C,0xD5,0x5C,0x41,0x59,0x7D,0x95,0x1D,0x8A,0x91,0xBA,0x68,0xAE,0x36,0x66,0xD2
        .byte   0x2B,0x1D,0x18,0x53,0xE8,0x8D,0x60,0x43,0xBB,0xBE,0x7C,0x75,0xDD,0xE9,0xB1,0x71
        .byte   0xD6,0x7F,0x32,0x92,0xD8,0x76,0x4E,0x41,0xB8,0xAD,0x18,0x9E,0x32,0xC0,0xD7,0x4C
        .byte   0xF2,0x49,0x09,0x44,0xEE,0xB1,0xAC,0x47,0x15,0x84,0x13,0x6D,0x57,0x04,0xD5,0x34
        .byte   0x56,0x6E,0xD5,0x41,0x0E,0x36,0x2C,0xC4,0x3F,0x70,0x20,0x79,0x0E,0xD0,0xC4,0x39
        .byte   0xCF,0x02,0x21,0x7C,0x33,0x83,0x2D,0x5D,0x4B,0x18,0xAF,0x4B,0xFC,0x0F,0xFC,0x44
        .byte   0xD0,0xC9,0x15,0x3B,0x23,0x64,0xE3,0x4B,0xEC,0x61,0x12,0xA6,0x87,0x11,0xC2,0x6C
        .byte   0x20,0x50,0xEB,0x57,0xB8,0x97,0x35,0x54,0xCB,0x9C,0xEB,0x74,0x3C,0x5F,0x10,0xA3
        .byte   0xD5,0x80,0x62,0x42,0x21,0x9C,0x91,0x89,0xA6,0x7E,0xD3,0x44,0x44,0x1A,0x45,0x01
        .byte   0xFC,0x8F,0x1A,0x5E,0x6C,0x02,0x07,0x41,0x9B,0x1C,0xC5,0x61,0xBF,0xFE,0x59,0x53
        .byte   0x42,0x85,0xDD,0x5D,0xD8,0xD3,0x47,0x57,0x6B,0xC7,0xD7,0xA3,0x48,0xC8,0x66,0x4E
        .byte   0xF6,0xE9,0x8A,0x73,0x95,0x5D,0x60,0x64,0x3C,0x43,0x6A,0x7E,0xC7,0x90,0x29,0x65
        .byte   0x18,0x86,0x05,0x43,0xD1,0x45,0x64,0x4D,0x56,0xC2,0x29,0x4D,0x8F,0xC2,0xAA,0x5E
        .byte   0x1D,0x2F,0x9A,0x48,0x2B,0xD5,0xDF,0x5B,0x5F,0x52,0x0B,0x7F,0xAB,0xAA,0x99,0x64
        .byte   0x94,0xD4,0x3B,0x34,0x4D,0x09,0xA7,0x63,0xB3,0x08,0xEE,0x83,0xED,0x25,0x29,0x73
        .byte   0xDE,0x5C,0x2B,0x4D,0xDB,0x08,0x52,0x79,0x4E,0x63,0xF0,0x44,0xBA,0xE6,0xEF,0xCC
        .byte   0x22,0x47,0xC0,0x43,0x88,0x67,0x07,0x5E,0x32,0xDD,0x95,0x55,0x3B,0x06,0xBC,0xD9
        .byte   0xFB,0x49,0x47,0x72,0xD6,0xA5,0xDB,0x41,0xFF,0x00,0x3E,0x53,0xC7,0x7A,0x98,0x79
        .byte   0x64,0xDC,0x75,0x1A,0x98,0xFA,0x34,0x71,0x18,0x5F,0x20,0xCE,0xB5,0x56,0x3D,0x56
        .byte   0x91,0x99,0xC8,0x68,0xC4,0x41,0x53,0x4A,0xE2,0x44,0xDC,0x4B,0x58,0x91,0xE2,0x7F
        .byte   0xD0,0xEB,0x94,0x44,0x0B,0xD4,0x4E,0x4F,0x1D,0xE8,0x1A,0x5E,0x8C,0x4A,0xBE,0x3F
        .byte   0x9E,0xF8,0xF6,0x5B,0xEB,0x34,0x06,0x60,0x6F,0xFE,0x41,0x6E,0xDF,0x7C,0xC0,0x49
        .byte   0x56,0x92,0x2B,0x1C,0x32,0x77,0x18,0x40,0x91,0x0B,0xA2,0x09,0xAA,0x54,0xF1,0x41
        .byte   0xDB,0x58,0x5C,0x48,0x74,0x67,0x54,0x5C,0xF2,0x92,0x3D,0x54,0xC1,0x86,0xEC,0xF7
        .byte   0xBA,0x0E,0x86,0x45,0x63,0x0C,0xCF,0xD5,0xE2,0x47,0xBC,0x66,0xA9,0x71,0x98,0x6E
        .byte   0x1E,0x4B,0xDE,0x4B,0x96,0x7C,0x5B,0x47,0x91,0x5B,0xF6,0x49,0x34,0x45,0xF6,0x59
        .byte   0x94,0xC5,0xA6,0xFD,0xF2,0x81,0x74,0x48,0x37,0x77,0x29,0x93,0x47,0xEE,0x29,0x67
        .byte   0x1E,0xD8,0xC4,0x65,0x6E,0x78,0x55,0x74,0xE7,0x02,0x6F,0x5E,0xD2,0xB2,0xF7,0xC4
        .byte   0x31,0xD7,0x96,0x46,0x25,0xCE,0x55,0x96,0x1E,0xBD,0x7D,0x6F,0xE8,0x11,0xA4,0xB9
        .byte   0xF9,0xE4,0x58,0x40,0x24,0x2E,0x5E,0x6C,0xD2,0x25,0xB9,0x64,0x0E,0x4E,0x8B,0x6E
        .byte   0x7C,0x7B,0xB5,0x52,0xD9,0x85,0xDF,0x51,0x58,0xD6,0x4E,0x29,0x69,0xD4,0xBE,0x52
        .byte   0x35,0x9E,0xFC,0x48,0xFC,0xA2,0x64,0x4A,0xF0,0x9C,0xE9,0x6A,0xAD,0xB2,0x31,0xE9
        .byte   0x81,0x1B,0xCB,0x47,0xF4,0x0F,0x65,0xF1,0xDF,0x77,0x63,0x78,0xAA,0xAB,0x41,0x68
        .byte   0x6B,0x2F,0x97,0x70,0x4A,0x06,0x50,0x54,0x1C,0xCD,0xC5,0x45,0xC5,0x0D,0x8B,0x44
        .byte   0x49,0x68,0xBF,0xA7,0xDC,0xA6,0x97,0x5C,0x59,0x8D,0x27,0xED,0xA4,0x24,0x3F,0x44
        .byte   0xAD,0x13,0xFC,0x6A,0xE9,0xCD,0xAF,0x60,0x6E,0x29,0x51,0x7A,0x1F,0x38,0xAC,0x98
        .byte   0xBC,0x8E,0x27,0x49,0x9C,0xBB,0xA8,0x9C,0x1D,0x18,0xB9,0x40,0xE9,0x84,0x16,0x5E
LAEG_sc_dbl_asin_coeff:
        .byte   0x01,0x00,0x00,0x01,0x06,0x01,0x01,0x01,0x03,0xFC,0x23,0x00,0x00,0x01,0x00,0x05
        .byte   0x00,0x01,0x01,0x03,0xFD,0x22,0x00,0x00,0x00,0x01,0x04,0x00,0x01,0x01,0x03,0xFD
        .byte   0x22,0x00,0x00,0x00,0x00,0x04,0x00,0x01,0x01,0x03,0xFD,0x22,0x00,0x00,0x00,0x01
        .byte   0x03,0x01,0x00,0x01,0x03,0xFE,0x21,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x01,0x03
        .byte   0xFE,0x21,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x01,0x03,0xFE,0x21,0x00,0xFF,0x00
        .byte   0x01,0x02,0x00,0x00,0x00,0x03,0xFE,0x21,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00
        .byte   0x03,0xFF,0x20,0x00,0xFF,0x00,0x00,0x02,0xFF,0x00,0x00,0x03,0xFF,0x20,0xFF,0xFF
        .byte   0x00,0x00,0x02,0x00,0xFF,0x01,0x02,0xFF,0x20,0x00,0xFF,0xFF,0x00,0x02,0xFF,0x00
        .byte   0x00,0x02,0xFF,0x20,0xFF,0xFF,0x00,0x00,0x01,0xFF,0xFF,0x00,0x02,0xFF,0x20,0xFF
        .byte   0xFF,0xFF,0x00,0x01,0xFF,0xFF,0x00,0x02,0xFF,0x20,0xFE,0xFF,0xFF,0x00,0x01,0xFF
        .byte   0xFF,0xFF,0x02,0xFF,0x20,0xFF,0xFF,0xFF,0xFF,0x01,0xFE,0xFF,0xFF,0x02,0x00,0x1F


