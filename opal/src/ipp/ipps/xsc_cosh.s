        .text
        .align  4
        .globl  cosh


cosh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r12, [pc, #0x9A4]
        mvn     r2, #2, 2
        bic     r6, r1, r2
        str     r0, [sp, #0x48]
        eor     r5, r1, r6
        mov     r3, #0xFF
        mvn     lr, #0xFF, 12
        cmp     r12, r5
        str     r1, [sp, #0x4C]
        orr     r3, r3, #7, 24
        bic     lr, lr, #0xF, 4
        mov     r4, #0
        bls     LADO12
        ldr     r12, [pc, #0x974]
        cmp     r12, r5
        bls     LADO13
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r6, r12, #0x36, 12
        cmp     r6, r5
        movhi   r5, r12
        movhi   r0, #0
        bhi     LADO35
        movs    r12, r5, lsl #1
        and     lr, r5, lr
        moveq   r12, #2, 12
        orrne   lr, lr, #1, 12
        bics    r5, r5, r2
        beq     LADO0
        rsbs    r0, r0, #0
        rsc     lr, lr, #0
LADO0:
        mov     r1, r0, lsr #22
        orr     r1, r1, lr, lsl #10
        mov     lr, r0, lsl #10
        umull   r0, r6, r1, lr
        umull   r0, r5, r1, r1
        adds    r7, r6, r6
        adc     r6, r4, #0
        adds    r0, r0, r7
        adc     r6, r5, r6
        sub     r5, r3, #0xF3, 30
        cmp     r1, #0
        sub     r5, r5, r12, lsr #21
        add     r12, r5, #0xA
        blt     LADO38
LADO1:
        ldr     r5, [pc, #0x8F8]
        mov     r1, r0, lsr #31
        orr     r1, r1, r6, lsl #1
        mvn     r7, r5
        umull   r6, lr, r7, r1
        mov     r0, r0, lsl #1
        umull   r7, r8, r7, r0
        adds    r7, lr, r8
        adc     r4, r4, #0
        mov     r8, r12, lsl #1
        adds    r12, r6, r7
        adc     r6, lr, r4
        cmp     r1, #0
        sub     lr, r8, #0x3F
        blt     LADO37
LADO2:
        mov     r5, r12, lsr #31
        orr     r5, r5, r6, lsl #1
        sub     r4, lr, #0x3B
        mov     r6, r12, lsl #1
        cmp     r4, #0x20
        mov     r12, #0x1F
        bcs     LADO3
        rsb     r7, lr, #0x5B
        mov     r7, r5, lsl r7
        orr     r6, r7, r6, lsr r4
        mov     r7, r5, asr r4
        b       LADO4
LADO3:
        cmp     r4, #0x40
        movcs   r4, #0x1F
        subcc   r4, lr, #0x5B
        mov     r6, r5, asr r4
        mov     r7, r5, asr #31
LADO4:
        adds    r4, r6, #0
        umull   r6, r5, r0, r4
        umull   r4, r6, r4, r1
        adc     r8, r7, #1, 2
        umull   r0, r7, r0, r8
        umull   r8, r1, r8, r1
        adds    r5, r4, r5
        adc     r6, r6, #0
        adds    r7, r8, r7
        adc     r4, r1, #0
        adds    r5, r0, r5
        adc     r6, r6, #0
        adds    r1, r6, r7
        adc     r0, r4, #0
        mov     r4, r5, lsr #31
        orr     r4, r4, r1, lsl #1
        mov     r5, r5, lsr #30
        mov     r1, r1, lsr #31
        and     r5, r5, #1
        orr     r0, r1, r0, lsl #1
        adds    r4, r4, r5
        sub     r1, lr, #0x3E
        adc     r0, r0, #0
        cmp     r1, #0x20
        bcs     LADO5
        rsb     lr, lr, #0x5E
        mov     lr, r0, lsl lr
        orr     r4, lr, r4, lsr r1
        mov     r1, r0, asr r1
        b       LADO6
LADO5:
        cmp     r1, #0x40
        movcs   lr, #0x1F
        subcc   lr, lr, #0x5E
        mov     r4, r0, asr lr
        mov     r1, r0, asr #31
LADO6:
        adds    r0, r4, #0
        str     r0, [sp, #0x40]
        adc     r1, r1, #1, 2
        bics    r2, r1, r2
        str     r1, [sp, #0x44]
        beq     LADO7
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LADO7:
        mov     lr, #0xFE
        clz     r5, r1
        orr     lr, lr, #7, 24
        cmp     r5, #0x20
        sub     r4, lr, #1, 22
        beq     LADO36
LADO8:
        sub     r5, r5, #1
        rsb     lr, r5, #0x20
        mov     lr, r0, lsr lr
        orr     lr, lr, r1, lsl r5
        subs    r1, r4, r5
        mov     r5, r0, lsl r5
        bpl     LADO10
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LADO9
        mov     r5, lr
        mov     lr, lr, asr #31
        sub     r1, r1, #0x20
LADO9:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r5, r5, lsr r1
        rsb     r0, r1, #0x20
        orr     r5, r5, lr, lsl r0
        mov     lr, lr, asr r1
        mov     r1, #0
LADO10:
        mov     r0, r5, lsr #9
        and     r4, r0, #1
        mov     r0, lr, lsl #22
        orr     r5, r0, r5, lsr #10
        adds    r0, r4, r5
        mov     lr, lr, lsr #10
        adc     r4, lr, r4, asr #31
        orrs    lr, r4, r4, asr #31
        moveq   r1, #0
        beq     LADO11
        sub     r3, r3, #1
        cmp     r3, r1
        bgt     LADO11
        mov     r0, #0
        add     r1, r12, #0x7E, 28
        mov     r4, r0
LADO11:
        add     r1, r4, r1, lsl #20
        orr     r5, r1, r2
        b       LADO35
LADO12:
        cmp     r12, r5
        bne     LADO34
        ldr     r12, [pc, #0x710]
        cmp     r12, r0
        bls     LADO33
LADO13:
        movs    r8, r5, lsl #1
        and     lr, r5, lr
        moveq   r8, #2, 12
        orrne   lr, lr, #1, 12
        bics    r2, r5, r2
        beq     LADO14
        rsbs    r0, r0, #0
        rsc     lr, lr, #0
LADO14:
        ldr     r6, [pc, #0x6E8]
        ldr     r3, [pc, #0x6E8]
        ldr     r2, [pc, #0x6E8]
        ldr     r12, [r6]
        ldr     r1, [r6, #8]
        add     r9, lr, r0, lsr #31
        ldr     r10, [r6, #4]
        smull   r7, lr, r12, r0
        smull   r12, r6, r12, r9
        smull   r0, r11, r0, r10
        smull   r1, r0, r1, r9
        smull   r10, r9, r9, r10
        adds    r12, lr, r12
        adc     r6, r6, lr, asr #31
        adds    lr, r12, r9
        adc     r9, r6, r9, asr #31
        adds    r10, r7, r10
        adc     r4, r4, #0
        adds    r12, r10, r11
        adc     r11, r4, r11, asr #31
        adds    r12, r12, r0
        adc     r0, r11, r0, asr #31
        adds    r7, r0, lr
        mov     lr, #0x33
        orr     lr, lr, #1, 22
        adc     r9, r9, r0, asr #31
        ldr     r0, [r2, #0x20]
        sub     r6, lr, r8, lsr #21
        sub     lr, r6, #0x2A
        mov     r8, r9, asr lr
        and     r4, r8, #1
        add     lr, lr, #1
        add     r8, r4, r8, asr #1
        sub     r10, r9, r8, lsl lr
        str     r0, [sp, #0x20]
        ldr     lr, [r2, #0x1C]
        eor     r9, r10, r10, asr #31
        sub     r9, r9, r10, asr #31
        clz     r9, r9
        sub     r9, r9, #2
        rsb     r11, r9, #0x20
        mov     r12, r12, lsr r11
        mov     r11, r7, lsr r11
        orr     r7, r12, r7, lsl r9
        add     r6, r6, r9
        orr     r9, r11, r10, lsl r9
        smull   r3, r10, r3, r7
        add     r7, r9, r7, lsr #31
        smull   r0, r3, r7, r0
        sub     r6, r6, #0x23
        sub     r6, r6, #0x20
        add     r0, r6, #3
        str     lr, [sp, #0x1C]
        ldr     r4, [r2, #0x18]
        add     r3, lr, r3, asr r0
        smull   r3, r12, r7, r3
        str     r0, [sp, #0x30]
        str     r4, [sp, #0x18]
        add     r0, r4, r12, asr r0
        ldr     r12, [r2, #0x14]
        smull   r0, r3, r7, r0
        add     r11, r6, #2
        str     r12, [sp, #4]
        ldr     r2, [r2, #0x10]
        cmp     r11, #0x20
        str     r2, [sp, #0x10]
        bgt     LADO15
        mov     r12, r0, lsr r11
        rsb     r2, r6, #0x1E
        mov     r0, r3, asr r11
        orr     r3, r12, r3, lsl r2
        b       LADO16
LADO15:
        cmp     r11, #0x40
        movgt   r0, #0
        movgt   r3, r0
        bgt     LADO16
        sub     r0, r6, #0x1E
        mov     r2, r3, asr #31
        mov     r3, r3, lsr r0
        rsb     r12, r6, #0x3E
        mov     r0, r2, asr r0
        orr     r3, r3, r2, lsl r12
LADO16:
        ldr     r2, [sp, #0x10]
        ldr     lr, [pc, #0x5A4]
        adds    r3, r2, r3
        smull   r12, r2, r7, r3
        ldr     r12, [sp, #4]
        adc     r0, r12, r0
        ldr     r12, [lr, #0xC]
        adds    r3, r0, r3, lsr #31
        smull   r3, r0, r7, r3
        str     r12, [sp]
        ldr     lr, [lr, #8]
        adds    r3, r3, r2
        adc     r2, r0, r2, asr #31
        cmp     r11, #0x20
        str     lr, [sp, #8]
        bgt     LADO17
        rsb     r12, r6, #0x1E
        mov     r3, r3, lsr r11
        mov     r0, r2, asr r11
        orr     r12, r3, r2, lsl r12
        b       LADO18
LADO17:
        cmp     r11, #0x40
        movgt   r0, #0
        movgt   r12, r0
        bgt     LADO18
        sub     r0, r6, #0x1E
        mov     r3, r2, asr #31
        rsb     r12, r6, #0x3E
        mov     r2, r2, lsr r0
        mov     r0, r3, asr r0
        orr     r12, r2, r3, lsl r12
LADO18:
        ldr     r2, [sp, #8]
        ldr     lr, [pc, #0x528]
        adds    r3, r2, r12
        smull   r12, r2, r7, r3
        ldr     r12, [sp]
        adc     r0, r12, r0
        ldr     r12, [lr, #4]
        adds    r3, r0, r3, lsr #31
        smull   r3, r0, r7, r3
        str     r12, [sp, #0xC]
        ldr     lr, [lr]
        adds    r3, r3, r2
        adc     r0, r0, r2, asr #31
        cmp     r11, #0x20
        str     lr, [sp, #0x14]
        bgt     LADO19
        rsb     r12, r6, #0x1E
        mov     r3, r3, lsr r11
        mov     r2, r0, asr r11
        orr     r12, r3, r0, lsl r12
        b       LADO20
LADO19:
        cmp     r11, #0x40
        movgt   r2, #0
        movgt   r12, r2
        bgt     LADO20
        sub     r2, r6, #0x1E
        mov     r3, r0, asr #31
        rsb     r12, r6, #0x3E
        mov     r0, r0, lsr r2
        mov     r2, r3, asr r2
        orr     r12, r0, r3, lsl r12
LADO20:
        ldr     r0, [sp, #0x14]
        sub     r4, r6, #1
        adds    r3, r0, r12
        smull   r12, r0, r7, r3
        ldr     r12, [sp, #0xC]
        adc     r2, r12, r2
        adds    r3, r2, r3, lsr #31
        smull   lr, r12, r7, r3
        mov     r2, r4
        mov     r3, r4, asr #31
        str     r3, [sp, #0x2C]
        adds    lr, lr, r0
        adc     r9, r12, r0, asr #31
        smull   r12, r0, r10, r9
        str     lr, [sp, #0x28]
        mov     r1, r0, asr #31
        bl      __ashrdi3
        ldr     r3, [sp, #0x28]
        ldr     lr, [pc, #0x46C]
        adds    r12, r3, r10
        adc     r3, r9, r10, asr #31
        adds    r0, r12, r0
        and     r12, r8, #0x3F
        str     r12, [sp, #0x24]
        ldr     lr, [lr, +r12, lsl #3]
        adc     r1, r3, r1
        add     r3, r1, r0, lsr #31
        str     lr, [sp, #0x34]
        ldr     lr, [pc, #0x444]
        mov     r8, r8, asr #6
        mov     r2, r4
        add     r12, lr, r12, lsl #3
        ldr     r9, [r12, #4]
        str     r8, [sp, #0x28]
        smull   r12, lr, r3, r9
        ldr     r12, [sp, #0x34]
        str     lr, [sp, #0x38]
        add     r8, r12, r9, lsr #31
        smull   r12, lr, r3, r8
        smull   r8, r0, r8, r0
        ldr     r8, [sp, #0x38]
        ldr     r3, [sp, #0x2C]
        adds    r12, r12, r0
        adc     lr, lr, r0, asr #31
        adds    r0, r12, r8
        adc     r1, lr, r8, asr #31
        bl      __ashrdi3
        adds    r8, r0, r9
        mov     r0, #0xFE
        orr     r0, r0, #7, 24
        ldr     r3, [sp, #0x34]
        mov     r0, r0, lsl #19
        add     r0, r0, #0x46, 16
        adc     r9, r1, r3
        cmp     r0, r5
        ldr     r0, [sp, #0x28]
        rsb     r5, r0, #0x3F
        bls     LADO27
        ldr     r0, [sp, #0x20]
        rsb     r7, r7, #0
        ldr     r3, [sp, #0x1C]
        smull   r0, r1, r7, r0
        ldr     r0, [sp, #0x30]
        cmp     r11, #0x20
        add     r1, r3, r1, asr r0
        smull   r3, r1, r7, r1
        ldr     r3, [sp, #0x18]
        add     r0, r3, r1, asr r0
        smull   r0, r1, r7, r0
        bgt     LADO21
        rsb     r3, r6, #0x1E
        mov     r12, r0, lsr r11
        mov     r0, r1, asr r11
        orr     r3, r12, r1, lsl r3
        b       LADO22
LADO21:
        cmp     r11, #0x40
        movgt   r0, #0
        movgt   r3, r0
        bgt     LADO22
        sub     r0, r6, #0x1E
        mov     r3, r1, asr #31
        mov     r1, r1, lsr r0
        rsb     r12, r6, #0x3E
        mov     r0, r3, asr r0
        orr     r3, r1, r3, lsl r12
LADO22:
        ldr     r1, [sp, #0x10]
        adds    r3, r1, r3
        smull   r12, r1, r7, r3
        ldr     r12, [sp, #4]
        adc     r0, r12, r0
        adds    r3, r0, r3, lsr #31
        smull   r0, r3, r7, r3
        adds    r0, r0, r1
        adc     r1, r3, r1, asr #31
        cmp     r11, #0x20
        bgt     LADO23
        rsb     r3, r6, #0x1E
        mov     r12, r0, lsr r11
        mov     r0, r1, asr r11
        orr     r3, r12, r1, lsl r3
        b       LADO24
LADO23:
        cmp     r11, #0x40
        movgt   r0, #0
        movgt   r3, r0
        bgt     LADO24
        sub     r0, r6, #0x1E
        mov     r3, r1, asr #31
        mov     r1, r1, lsr r0
        rsb     r12, r6, #0x3E
        mov     r0, r3, asr r0
        orr     r3, r1, r3, lsl r12
LADO24:
        ldr     r1, [sp, #8]
        adds    r3, r1, r3
        smull   r12, r1, r7, r3
        ldr     r12, [sp]
        adc     r0, r12, r0
        adds    r3, r0, r3, lsr #31
        smull   r3, r0, r7, r3
        adds    r3, r3, r1
        adc     r0, r0, r1, asr #31
        cmp     r11, #0x20
        bgt     LADO25
        rsb     r6, r6, #0x1E
        mov     r3, r3, lsr r11
        mov     r11, r0, asr r11
        orr     r6, r3, r0, lsl r6
        b       LADO26
LADO25:
        cmp     r11, #0x40
        movgt   r11, #0
        movgt   r6, r11
        bgt     LADO26
        sub     r3, r6, #0x1E
        mov     r1, r0, asr #31
        rsb     r6, r6, #0x3E
        mov     r0, r0, lsr r3
        mov     r11, r1, asr r3
        orr     r6, r0, r1, lsl r6
LADO26:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        mov     r2, r4
        adds    r0, r0, r6
        adc     r11, r1, r11
        adds    r1, r11, r0, lsr #31
        smull   r3, r0, r7, r0
        smull   r7, r1, r7, r1
        ldr     r3, [sp, #0x24]
        rsb     r12, r3, #0x40
        ldr     r3, [sp, #0x28]
        and     r6, r12, #0x3F
        sub     r3, r3, r12, asr #6
        adds    r12, r7, r0
        ldr     r7, [sp, #0x2C]
        adc     r1, r1, r0, asr #31
        smull   lr, r0, r10, r1
        subs    r12, r12, r10
        add     r3, r3, #0x40
        str     r12, [sp, #0x38]
        sbc     r11, r1, r10, asr #31
        sub     r10, r3, r5
        mov     r1, r0, asr #31
        mov     r3, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0x38]
        subs    r0, r12, r0
        ldr     r12, [pc, #0x224]
        sbc     r11, r11, r1
        add     r1, r11, r0, lsr #31
        mov     r2, r4
        ldr     r11, [r12, +r6, lsl #3]
        add     lr, r12, r6, lsl #3
        ldr     r6, [lr, #4]
        mov     r3, r7
        smull   lr, r12, r1, r6
        add     lr, r11, r6, lsr #31
        smull   r4, r0, lr, r0
        smull   r1, lr, r1, lr
        mov     r4, r10, asr #31
        adds    r1, r1, r0
        adc     lr, lr, r0, asr #31
        adds    r0, r1, r12
        adc     r1, lr, r12, asr #31
        bl      __ashrdi3
        adds    r0, r0, r6
        str     r0, [sp, #0x40]
        adc     r1, r1, r11
        str     r1, [sp, #0x44]
        mov     r2, r10
        mov     r3, r4
        bl      __ashrdi3
        adds    r8, r8, r0
        adc     r9, r9, r1
        tst     r9, r9
        bpl     LADO27
        mov     r0, r9, lsl #31
        orr     r8, r0, r8, lsr #1
        mov     r9, r9, lsr #1
        sub     r5, r5, #1
LADO27:
        mvn     r0, #2, 2
        bics    r2, r9, r0
        beq     LADO28
        rsbs    r8, r8, #0
        rsc     r9, r9, #0
LADO28:
        mov     r0, #0xFF
        orr     r1, r0, #7, 24
        sub     r0, r1, #0xF3, 30
        clz     r3, r9
        add     r0, r0, #9
        cmp     r3, #0x20
        rsb     r5, r5, r0
        beq     LADO39
LADO29:
        sub     r0, r3, #1
        rsb     r3, r0, #0x20
        mov     r3, r8, lsr r3
        orr     r9, r3, r9, lsl r0
        subs    r3, r5, r0
        mov     r0, r8, lsl r0
        bpl     LADO31
        rsb     r3, r3, #0
        cmp     r3, #0x20
        blt     LADO30
        mov     r0, r9
        mov     r9, r9, asr #31
        sub     r3, r3, #0x20
LADO30:
        cmp     r3, #0x20
        mov     r12, #0x20
        movgt   r3, r12
        mov     r0, r0, lsr r3
        rsb     r12, r3, #0x20
        orr     r0, r0, r9, lsl r12
        mov     r9, r9, asr r3
        mov     r3, #0
LADO31:
        mov     r12, r0, lsr #9
        mov     lr, r9, lsl #22
        orr     r0, lr, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r9, r9, lsr #10
        adc     r12, r9, r12, asr #31
        orrs    lr, r12, r12, asr #31
        moveq   r3, #0
        beq     LADO32
        mov     lr, #0xFE
        orr     lr, lr, #7, 24
        cmp     lr, r3
        bgt     LADO32
        mov     r0, #0
        mov     r3, r1
        mov     r12, r0
LADO32:
        add     r3, r12, r3, lsl #20
        orr     r5, r3, r2
        b       LADO35
LADO33:
        str     r4, [sp, #0x40]
        add     r2, sp, #0x40
        add     r1, sp, #0x48
        add     r0, sp, #0x48
        mov     r3, r3, lsl #20
        str     r3, [sp, #0x44]
        mov     r3, #0x40
        bl      __libm_error_support
        ldr     r0, [sp, #0x40]
        ldr     r5, [sp, #0x44]
        b       LADO35
LADO34:
        cmp     r5, r3, lsl #20
        bcc     LADO33
        and     lr, r5, lr
        orrs    lr, lr, r0
        orrne   r6, r6, #2, 14
        orrne   r5, r5, r6
LADO35:
        mov     r1, r5
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LADO36:
        clz     lr, r0
        cmp     lr, #0
        beq     LADO8
        add     r1, r12, #0x7E, 28
        sub     r4, r1, #1
        mov     r1, r0
        sub     r4, r4, #0x42, 28
        mov     r5, lr
        mov     r0, #0
        b       LADO8
LADO37:
        add     r4, r5, #1
        adds    r12, r12, r4
        adc     r6, r6, r5
        b       LADO2
LADO38:
        subs    r0, r0, lr
        sbc     r6, r6, r1
        b       LADO1
LADO39:
        clz     r0, r8
        cmp     r0, #0
        beq     LADO29
        mov     r9, r8
        sub     r5, r5, #0x20
        mov     r3, r0
        mov     r8, #0
        b       LADO29
        .long   0x408633ce
        .long   0x3f544511
        .long   0xaaaaaaaa
        .long   0x8fb9f87e
        .long   LADO_L2E
        .long   0x58b90bfc
        .long   LADO_exp_coeffs
        .long   __intel_dbl_T_2f


        .data
        .align  4


LADO_L2E:
        .byte   0xCA,0x8E,0x2A,0x2E,0x2F,0xFC,0x05,0x57,0xB4,0xFF,0xA1,0xEF
LADO_exp_coeffs:
        .byte   0xD6,0xBC,0xE7,0xE8,0xFB,0x0B,0xB9,0x58,0xA2,0x3A,0x16,0x0B,0xFE,0xF7,0xFE,0x7A
        .byte   0x2D,0xFE,0x82,0x12,0x5C,0x23,0xAC,0x71,0xBE,0xAD,0xCA,0x4E,0x94,0xFF,0x61,0x57
        .byte   0xBE,0x44,0xC2,0x50


