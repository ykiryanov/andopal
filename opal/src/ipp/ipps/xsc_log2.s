        .text
        .align  4
        .globl  log2


log2:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r2, #0xFE
        orr     r3, r2, #7, 24
        mov     r2, r1
        add     lr, r2, #1, 22
        mov     r12, r3, lsl #9
        rsb     lr, r12, lr, lsr #10
        str     r0, [sp, #0x38]
        mov     r12, #0xFF, 12
        cmp     lr, #1
        str     r1, [sp, #0x3C]
        orr     r12, r12, #3, 4
        mov     r5, #0
        bhi     LABR14
        subs    r1, r2, r12
        movpl   r2, r0
        movpl   r3, r1
        bmi     LABR37
LABR0:
        clz     r3, r3
        cmp     r3, #0x20
        clzge   r2, r2
        addge   r3, r2, #0x20
        sub     r3, r3, #2
        cmp     r3, #0x20
        bgt     LABR1
        rsb     r2, r3, #0x20
        mov     r2, r0, lsr r2
        orr     r12, r2, r1, lsl r3
        mov     r2, r0, lsl r3
        b       LABR2
LABR1:
        cmp     r3, #0x40
        movgt   r2, r5
        movgt   r12, r2
        bgt     LABR2
        rsb     r12, r3, #0x40
        sub     r2, r3, #0x20
        mov     r12, r5, lsr r12
        orr     r12, r12, r0, lsl r2
        mov     r2, r5, lsl r2
LABR2:
        add     r1, r3, r1, lsr #31
        ldr     r3, [pc, #0x8F4]
        add     r0, r12, r2, lsr #31
        smull   r6, r4, r0, r0
        rsb     r3, r3, #0
        smull   r12, r3, r3, r0
        ldr     r12, [pc, #0x8E4]
        sub     r1, r1, #0xC
        adds    r7, r4, r6, lsr #31
        add     r8, r1, #2
        add     r3, r12, r3, asr r1
        smull   r3, r9, r3, r7
        sub     lr, r1, #1
        rsb     r12, r1, #0x21
        rsb     r3, r0, r9, asr lr
        cmp     r8, #0x20
        mov     r9, r9, lsl r12
        bgt     LABR3
        mov     r9, r9, lsr r8
        mov     r5, r3, asr r8
        rsb     r8, r1, #0x1E
        orr     r8, r9, r3, lsl r8
        b       LABR4
LABR3:
        cmp     r8, #0x40
        movgt   r8, r5
        bgt     LABR4
        sub     r5, r1, #0x1E
        mov     r8, r3, asr #31
        mov     r3, r3, lsr r5
        mov     r5, r8, asr r5
        rsb     r9, r1, #0x3E
        orr     r8, r3, r8, lsl r9
LABR4:
        ldr     r9, [pc, #0x878]
        mov     r3, #0
        adds    r8, r8, r9
        adc     r9, r5, r9
        smull   r10, r5, r7, r8
        adds    r9, r9, r8, lsr #31
        smull   r8, r7, r7, r9
        smull   r10, r9, r6, r9
        adds    r8, r8, r9
        adc     r9, r7, r9, asr #31
        adds    r7, r8, r5
        adc     r9, r9, r5, asr #31
        smull   r8, r5, r0, r7
        adds    r7, r9, r7, lsr #31
        smull   r7, r8, r0, r7
        adds    r7, r7, r5
        adc     r5, r8, r5, asr #31
        cmp     lr, #0x20
        bgt     LABR5
        mov     r7, r7, lsr lr
        orr     r12, r7, r5, lsl r12
        mov     lr, r5, asr lr
        b       LABR6
LABR5:
        cmp     lr, #0x40
        movgt   r12, #0
        movgt   lr, r12
        bgt     LABR6
        mov     lr, r5, asr #31
        sub     r7, r1, #0x21
        rsb     r12, r1, #0x41
        mov     r5, r5, lsr r7
        orr     r12, r5, lr, lsl r12
        mov     lr, lr, asr r7
LABR6:
        subs    r12, r12, r6
        sbc     r4, lr, r4
        cmp     r1, #0x20
        bge     LABR7
        add     lr, r1, #1
        mov     r12, r12, lsr lr
        rsb     r5, r1, #0x1F
        orr     r12, r12, r4, lsl r5
        mov     r4, r4, asr lr
        b       LABR8
LABR7:
        cmp     r1, #0x40
        movge   r12, #0
        movge   r4, r12
        bge     LABR8
        mov     lr, r4, asr #31
        sub     r5, r1, #0x1F
        rsb     r12, r1, #0x3F
        mov     r4, r4, lsr r5
        orr     r12, r4, lr, lsl r12
        mov     r4, lr, asr r5
LABR8:
        smull   r5, lr, r0, r2
        adds    r12, r12, #0
        adc     r5, r4, r0
        adds    r12, r12, r2
        mov     lr, lr, asr r1
        smull   r0, r4, r0, lr
        ldr     r0, [pc, #0x794]
        adc     r2, r5, r2, asr #31
        subs    r12, r12, lr
        mov     r4, r4, asr r1
        sbc     r5, r2, lr, asr #31
        ldr     r2, [r0]
        adds    lr, r12, r4
        adc     r4, r5, r4, asr #31
        ldr     r12, [r0, #4]
        add     r5, r4, lr, lsr #31
        smull   r6, r4, r2, r5
        smull   r0, lr, r2, lr
        smull   r12, r5, r12, r5
        add     r2, r1, #0x3E
        adds    r6, lr, r6
        adc     lr, r4, lr, asr #31
        adds    r1, r6, r5
        adc     r5, lr, r5, asr #31
        adds    r12, r0, r12
        adc     r3, r3, #0
        adds    r0, r1, r3
        mvn     r1, #2, 2
        adc     r3, r5, r3, asr #31
        bics    r1, r3, r1
        beq     LABR9
        rsbs    r0, r0, #0
        rsc     r3, r3, #0
LABR9:
        mov     r12, #0x33
        orr     r12, r12, #1, 22
        clz     lr, r3
        add     r12, r12, #9
        cmp     lr, #0x20
        rsb     r2, r2, r12
        beq     LABR36
LABR10:
        sub     r12, lr, #1
        rsb     lr, r12, #0x20
        mov     lr, r0, lsr lr
        subs    r2, r2, r12
        orr     r3, lr, r3, lsl r12
        mov     r0, r0, lsl r12
        bpl     LABR12
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LABR11
        mov     r0, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LABR11:
        cmp     r2, #0x20
        mov     r12, #0x20
        movgt   r2, r12
        mov     r0, r0, lsr r2
        rsb     r12, r2, #0x20
        orr     r0, r0, r3, lsl r12
        mov     r3, r3, asr r2
        mov     r2, #0
LABR12:
        mov     r12, r0, lsr #9
        mov     lr, r3, lsl #22
        orr     r0, lr, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r2, #0
        beq     LABR13
        mov     r3, #0xFE
        orr     r3, r3, #7, 24
        cmp     r3, r2
        bgt     LABR13
        mov     r0, #0
        add     r2, r3, #1
        mov     r12, r0
LABR13:
        add     r2, r12, r2, lsl #20
        orr     r1, r2, r1
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LABR14:
        sub     lr, r2, #1, 12
        cmp     lr, r3, lsl #20
        mov     lr, #0xFF, 12
        orr     lr, lr, #0xF, 4
        bcc     LABR20
        cmp     r2, #1, 12
        bcc     LABR17
        cmp     r0, #0
        bne     LABR15
        cmp     r2, #2, 2
        beq     LABR38
LABR15:
        cmp     r2, #0
        blt     LABR39
LABR16:
        orrs    r3, r0, r2, lsl #12
        orrne   r2, r2, #2, 14
        mov     r1, r2
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LABR17:
        clz     lr, r2
        cmp     lr, #0x20
        clzge   r12, r0
        addge   lr, r12, #0x20
        sub     r4, lr, #0xB
        cmp     r4, #0x20
        bgt     LABR18
        rsb     r12, lr, #0x2B
        mov     r12, r0, lsr r12
        orr     r12, r12, r2, lsl r4
        mov     r0, r0, lsl r4
        b       LABR19
LABR18:
        cmp     r4, #0x40
        movgt   r0, r5
        movgt   r12, r0
        bgt     LABR19
        rsb     r2, lr, #0x4B
        sub     r1, lr, #0x2B
        mov     r2, r5, lsr r2
        orr     r12, r2, r0, lsl r1
        mov     r0, r5, lsl r1
LABR19:
        mov     r1, #0xFF
        orr     r1, r1, #7, 24
        sub     r1, r1, #0xF6, 30
        cmp     r12, #0
        add     r1, lr, r1
        bne     LABR22
        b       LABR42
LABR20:
        mvn     lr, lr
        and     r12, r2, lr
        movs    lr, r2, lsl #1
        moveq   lr, #2, 12
        orrne   r12, r12, #1, 12
        mvn     r4, #2, 2
        bics    r4, r2, r4
        beq     LABR21
        rsbs    r0, r0, #0
        rsc     r12, r12, #0
LABR21:
        mov     r1, #0x33
        orr     r1, r1, #1, 22
        sub     r1, r1, lr, lsr #21
LABR22:
        ldr     lr, [pc, #0x57C]
        mov     r2, r12, lsr #15
        sub     r2, r2, #0x20
        ldrb    r6, [r2, +lr]
        ldr     lr, [pc, #0x570]
        sub     r1, r1, r2, asr #4
        str     r1, [sp]
        umull   r1, r12, r12, r6
        umull   r6, r8, r0, r6
        ldr     r4, [pc, #0x560]
        ldrb    r12, [r2, +lr]
        ldr     lr, [pc, #0x55C]
        ldr     r9, [pc, #0x55C]
        ldr     r7, [r4, +r2, lsl #3]
        adds    r6, r6, #0
        adc     r8, r8, r1
        add     r2, r4, r2, lsl #3
        ldr     r0, [r2, #4]
        ldr     r2, [pc, #0x548]
        mov     r1, r8, lsr #17
        sub     r1, r1, #2, 24
        ldrb    r2, [r1, +r2]
        mov     r4, r1, lsl #1
        ldrh    lr, [lr, +r4]
        ldr     r4, [r9, +r1, lsl #3]
        add     r1, r9, r1, lsl #3
        ldr     r1, [r1, #4]
        umull   r10, r6, lr, r6
        umull   lr, r8, r8, lr
        sub     r9, r12, #0x2B
        mov     r11, r0, lsr r9
        str     r11, [sp, #0xC]
        sub     r8, r2, #0x2B
        adds    r10, r10, #0
        adc     lr, r6, lr
        ldr     r6, [sp, #0xC]
        mov     r11, r1, lsr r8
        rsb     r12, r12, #0x4B
        rsb     r2, r2, #0x4B
        orr     r6, r6, r7, lsl r12
        orr     r11, r11, r4, lsl r2
        adds    r6, r6, r11
        mov     r8, r4, lsr r8
        adc     r9, r8, r7, asr r9
        mov     r2, r1, lsl r2
        adds    r12, r2, r0, lsl r12
        adc     r0, r5, #0
        adds    r6, r6, r0
        str     r12, [sp, #8]
        adc     r0, r9, r0, asr #31
        cmp     lr, #0
        str     r6, [sp, #4]
        str     r0, [sp, #0xC]
        rsblt   r0, lr, #0
        movge   r0, lr
        clz     r0, r0
        subs    r0, r0, #1
        beq     LABR23
        sub     r0, r0, #1
        cmp     r0, #0x20
        bgt     LABR43
LABR23:
        rsb     r1, r0, #0x20
        mov     r1, r10, lsr r1
        orr     lr, r1, lr, lsl r0
        mov     r10, r10, lsl r0
LABR24:
        add     r2, lr, r10, lsr #31
        smull   r1, r12, r2, r10
        smull   r6, r1, r2, r2
        ldr     lr, [pc, #0x464]
        str     r12, [sp, #0x10]
        str     r1, [sp, #0x14]
        ldr     r1, [pc, #0x454]
        add     r7, r0, #7
        rsb     r9, r7, #0x21
        rsb     r1, r1, #0
        smull   r1, r12, r1, r2
        ldr     r1, [sp, #0x14]
        add     r12, lr, r12, asr r7
        ldr     lr, [pc, #0x440]
        adds    r1, r1, r6, lsr #31
        smull   r12, r8, r12, r1
        add     r4, r0, #6
        ldr     r12, [lr]
        str     r12, [sp, #0x18]
        ldr     lr, [lr, #4]
        str     r9, [sp, #0x20]
        rsb     r12, r2, r8, asr r4
        str     lr, [sp, #0x1C]
        add     lr, r0, #9
        mov     r9, r8, lsl r9
        rsb     r8, r7, #0x1E
        mov     r9, r9, lsr lr
        orr     r8, r9, r12, lsl r8
        ldr     r9, [pc, #0x3FC]
        adds    r8, r8, r9
        smull   r9, r11, r8, r1
        ldr     r9, [pc, #0x3F0]
        str     r11, [sp, #0x24]
        adc     lr, r9, r12, asr lr
        rsb     r9, r7, #0x1F
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x10]
        adds    r12, lr, r8, lsr #31
        smull   r1, r8, r12, r1
        smull   lr, r12, r12, r6
        mov     r9, r9, asr r7
        str     r9, [sp, #0x10]
        smull   r9, r11, r2, r9
        ldr     r9, [sp, #0x24]
        str     r11, [sp, #0x2C]
        adds    r1, r1, r12
        adc     r8, r8, r12, asr #31
        adds    r1, r1, r9
        smull   r11, r12, r2, r1
        adc     r9, r8, r9, asr #31
        adds    r1, r9, r1, lsr #31
        smull   r9, r8, r2, r1
        ldr     r1, [sp, #0x2C]
        add     lr, r0, #8
        mov     r1, r1, asr r7
        adds    r9, r9, r12
        adc     r12, r8, r12, asr #31
        ldr     r8, [sp, #0x20]
        mov     r9, r9, lsr r4
        orr     r8, r9, r12, lsl r8
        subs    r6, r8, r6
        ldr     r8, [sp, #0x14]
        mov     r6, r6, lsr lr
        rsc     r4, r8, r12, asr r4
        ldr     r12, [sp, #0x28]
        orr     r12, r6, r4, lsl r12
        adds    r12, r12, #0
        adc     lr, r2, r4, asr lr
        ldr     r2, [sp, #0x10]
        adds    r12, r12, r10
        adc     r10, lr, r10, asr #31
        subs    r12, r12, r2
        sbc     r4, r10, r2, asr #31
        ldr     r2, [sp, #0x18]
        adds    lr, r1, r12
        adc     r1, r4, r1, asr #31
        ldr     r4, [sp, #0x1C]
        smull   r2, r12, r2, lr
        add     r1, r1, lr, lsr #31
        ldr     lr, [sp, #0x18]
        smull   r6, lr, lr, r1
        smull   r1, r4, r4, r1
        adds    r6, r12, r6
        adc     r12, lr, r12, asr #31
        adds    lr, r6, r4
        adc     r4, r12, r4, asr #31
        adds    r12, r2, r1
        adc     r2, r5, #0
        adds    r1, lr, r2
        adc     r2, r4, r2, asr #31
        cmp     r7, #0xD
        ble     LABR27
        sub     r12, r0, #6
        cmp     r12, #0x20
        bgt     LABR25
        rsb     r7, r7, #0x2D
        mov     r1, r1, lsr r12
        orr     r0, r1, r2, lsl r7
        mov     r5, r2, asr r12
        b       LABR26
LABR25:
        cmp     r12, #0x40
        movgt   r0, r5
        bgt     LABR26
        sub     r12, r7, #0x2D
        mov     r1, r2, asr #31
        rsb     r7, r7, #0x4D
        mov     r2, r2, lsr r12
        orr     r0, r2, r1, lsl r7
        mov     r5, r1, asr r12
LABR26:
        mov     lr, r5, asr #31
        b       LABR30
LABR27:
        rsb     r4, r7, #0xD
        add     r0, r0, #0x1A
        cmp     r4, #0x20
        mov     lr, r2, asr r0
        bgt     LABR28
        mov     r5, r1, lsr r0
        orr     r5, r5, r2, lsl r4
        mov     r4, r1, lsl r4
        b       LABR29
LABR28:
        cmp     r4, #0x40
        mov     r5, #0
        movgt   r4, r5
        bgt     LABR29
        mov     r2, r5
        mvn     r4, #0x12
        rsb     r4, r7, r4
        add     r7, r7, #0x33
        mov     r7, r2, lsr r7
        orr     r5, r7, r1, lsl r4
        mov     r4, r2, lsl r4
LABR29:
        orr     r0, r4, r12, lsr r0
LABR30:
        ldr     r1, [sp, #4]
        ldr     r12, [sp]
        adds    r5, r1, r5
        ldr     r1, [sp, #0xC]
        rsb     r12, r12, #0x34
        adc     lr, r1, lr
        ldr     r1, [sp, #8]
        adds    r2, r1, r0
        mov     r0, #0
        adc     r1, r0, #0
        adds    r5, r5, r1
        adc     lr, lr, r1, asr #31
        adds    r1, r5, #0
        adc     r12, lr, r12, lsl #11
        adds    r1, r1, #0
        adc     r0, r12, r0, asr #31
        mvn     r12, #2, 2
        eor     lr, r0, r0, asr #31
        sub     lr, lr, r0, asr #31
        clz     lr, lr
        rsb     r5, lr, #0x21
        mov     r6, r1, lsr r5
        sub     r4, lr, #1
        mov     r5, r2, lsr r5
        orr     r0, r6, r0, lsl r4
        orr     r2, r5, r1, lsl r4
        bics    r1, r0, r12
        add     lr, lr, #0x2A
        beq     LABR31
        rsbs    r2, r2, #0
        rsc     r0, r0, #0
LABR31:
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        sub     r12, r12, #0xF3, 30
        add     r12, r12, #9
        clz     r4, r0
        cmp     r4, #0x20
        rsb     r12, lr, r12
        beq     LABR44
LABR32:
        sub     lr, r4, #1
        rsb     r4, lr, #0x20
        mov     r4, r2, lsr r4
        subs    r12, r12, lr
        orr     r0, r4, r0, lsl lr
        mov     r2, r2, lsl lr
        bpl     LABR34
        rsb     r12, r12, #0
        cmp     r12, #0x20
        blt     LABR33
        mov     r2, r0
        mov     r0, r0, asr #31
        sub     r12, r12, #0x20
LABR33:
        cmp     r12, #0x20
        mov     lr, #0x20
        movgt   r12, lr
        mov     r2, r2, lsr r12
        rsb     lr, r12, #0x20
        orr     r2, r2, r0, lsl lr
        mov     r0, r0, asr r12
        mov     r12, #0
LABR34:
        mov     lr, r2, lsr #9
        mov     r4, r0, lsl #22
        orr     r2, r4, r2, lsr #10
        and     lr, lr, #1
        adds    r2, lr, r2
        mov     r0, r0, lsr #10
        adc     lr, r0, lr, asr #31
        orrs    r4, lr, lr, asr #31
        moveq   r12, #0
        beq     LABR35
        cmp     r3, r12
        bgt     LABR35
        mov     r2, #0
        add     r12, r3, #1
        mov     lr, r2
LABR35:
        add     r12, lr, r12, lsl #20
        orr     r1, r12, r1
        mov     r0, r2
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LABR36:
        clz     r12, r0
        cmp     r12, #0
        beq     LABR10
        mov     r3, r0
        sub     r2, r2, #0x20
        mov     lr, r12
        mov     r0, #0
        b       LABR10
LABR37:
        rsbs    r2, r0, #0
        rsc     r3, r1, #0
        b       LABR0
LABR38:
        str     r5, [sp, #0x30]
        add     r1, sp, #0x38
        add     r0, sp, #0x38
        add     r2, sp, #0x30
        orr     r12, r12, #3, 2
        str     r12, [sp, #0x34]
        mov     r3, #0xAA
        bl      __libm_error_support
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LABR39:
        cmn     r2, #1, 12
        bcs     LABR41
LABR40:
        str     r5, [sp, #0x30]
        add     r1, sp, #0x38
        add     r0, sp, #0x38
        add     r2, sp, #0x30
        orr     lr, lr, #2, 14
        str     lr, [sp, #0x34]
        mov     r3, #0xAB
        bl      __libm_error_support
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LABR41:
        cmn     r2, #1, 12
        bne     LABR16
        cmp     r0, #0
        beq     LABR40
        b       LABR16
LABR42:
        mov     r3, r3, lsl #19
        str     r5, [sp, #0x30]
        add     r1, sp, #0x38
        add     r0, sp, #0x38
        add     r2, sp, #0x30
        orr     r3, r3, #3, 2
        str     r3, [sp, #0x34]
        mov     r3, #0xAA
        bl      __libm_error_support
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LABR43:
        cmp     r0, #0x40
        movgt   r10, r5
        movgt   lr, r10
        bgt     LABR24
        rsb     r1, r0, #0x40
        mov     r2, r5, lsr r1
        sub     r1, r0, #0x20
        orr     lr, r2, r10, lsl r1
        mov     r10, r5, lsl r1
        b       LABR24
LABR44:
        clz     lr, r2
        cmp     lr, #0
        beq     LABR32
        mov     r0, r2
        sub     r12, r12, #0x20
        mov     r4, lr
        mov     r2, #0
        b       LABR32
        .long   0x55555555
        .long   0x66666666
        .long   LABR_L2_E
        .long   LABR_r1_tbl
        .long   LABR_log_r1_scale
        .long   LABR_log_r1_tbl
        .long   LABR_r2_tbl
        .long   LABR_log_r2_tbl
        .long   LABR_log_r2_scale


        .data
        .align  4


LABR_r1_tbl:
        .byte   0x40,0x3F,0x3D,0x3B,0x39,0x38,0x36,0x35,0x34,0x32,0x31,0x30,0x2F,0x2E,0x2D,0x2C
        .byte   0x2B,0x2A,0x29,0x29,0x28,0x27,0x26,0x26,0x25,0x24,0x24,0x23,0x23,0x22,0x22,0x21
LABR_log_r1_scale:
        .byte   0x49,0x44,0x42,0x42,0x41,0x41,0x41,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x3F,0x3F
        .byte   0x40,0x40,0x40,0x40,0x40,0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x42,0x42,0x43
LABR_log_r1_tbl:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0xBA,0x0F,0x5D,0xD9,0x58,0xD5,0x7C
        .byte   0x98,0xCA,0xEC,0x46,0x33,0x74,0x52,0x01,0xA3,0x6B,0x2C,0x78,0x93,0x59,0xF5,0xCB
        .byte   0xA7,0x70,0x8F,0x55,0x32,0xC8,0xB2,0xFE,0x2A,0x60,0xA2,0x62,0x9A,0xC9,0xF4,0xFE
        .byte   0xA4,0x62,0x7F,0x7D,0x42,0xD2,0xF8,0x18,0x4D,0x01,0xA7,0x45,0xC9,0x61,0xC5,0x8F
        .byte   0x8D,0xFB,0xAF,0x4C,0x97,0xA1,0xB9,0xC3,0xA1,0x3D,0x2C,0x5B,0x0E,0xA8,0x23,0x97
        .byte   0x2A,0x60,0xA2,0x62,0x9A,0xC9,0xF4,0xFE,0xC6,0xE5,0x3F,0x6A,0x60,0x78,0x29,0x04
        .byte   0x0B,0x77,0x06,0x72,0xE2,0x90,0x7F,0x51,0xF9,0xD7,0xF7,0x79,0x3C,0xCD,0x2A,0x4E
        .byte   0x2E,0xF5,0x0A,0x41,0x64,0x62,0xF2,0x69,0x3F,0x58,0x31,0x45,0x04,0xE2,0x2B,0x9A
        .byte   0x23,0x50,0xE0,0x92,0x70,0x7D,0xF5,0x1D,0xDB,0x15,0x91,0x9B,0x2D,0xDD,0xA3,0x83
        .byte   0xC9,0x78,0x77,0xA4,0xA2,0x86,0xCC,0x8B,0xC9,0x78,0x77,0xA4,0xA2,0x86,0xCC,0x8B
        .byte   0xD0,0x1E,0x96,0xAD,0x07,0xD4,0x91,0xCB,0x53,0xE1,0xEF,0xB6,0xF7,0x19,0xE3,0xC7
        .byte   0x1B,0xA5,0x0F,0x81,0x71,0xD7,0x5F,0xF6,0x1B,0xA5,0x0F,0x81,0x71,0xD7,0x5F,0xF6
        .byte   0x49,0x87,0xC2,0x94,0x40,0xB0,0x4D,0x2C,0x18,0x97,0xFF,0xA8,0x81,0xE1,0xA5,0x10
        .byte   0x18,0x97,0xFF,0xA8,0x81,0xE1,0xA5,0x10,0xCC,0x9D,0xCE,0xBD,0xA7,0x71,0x18,0x96
        .byte   0xCC,0x9D,0xCE,0xBD,0xA7,0x71,0x18,0x96,0x14,0x24,0x70,0xA6,0x0D,0xA6,0xB3,0xDB
        .byte   0x14,0x24,0x70,0xA6,0x0D,0xA6,0xB3,0xDB,0x29,0xB2,0x14,0xA5,0x3B,0xE3,0x09,0xC4
LABR_r2_tbl:
        .byte   0xF8,0x1F,0xE8,0x1F,0xD8,0x1F,0xC8,0x1F,0xB9,0x1F,0xA9,0x1F,0x99,0x1F,0x8A,0x1F
        .byte   0x7A,0x1F,0x6B,0x1F,0x5B,0x1F,0x4C,0x1F,0x3D,0x1F,0x2E,0x1F,0x1E,0x1F,0x0F,0x1F
        .byte   0x00,0x1F,0xF1,0x1E,0xE2,0x1E,0xD3,0x1E,0xC5,0x1E,0xB6,0x1E,0xA7,0x1E,0x99,0x1E
        .byte   0x8A,0x1E,0x7B,0x1E,0x6D,0x1E,0x5E,0x1E,0x50,0x1E,0x42,0x1E,0x33,0x1E,0x25,0x1E
LABR_log_r2_scale:
        .byte   0x48,0x46,0x46,0x45,0x45,0x45,0x44,0x44,0x44,0x44,0x44,0x43,0x43,0x43,0x43,0x43
        .byte   0x43,0x43,0x43,0x43,0x43,0x43,0x43,0x42,0x42,0x42,0x42,0x42,0x42,0x42,0x42,0x42
LABR_log_r2_tbl:
        .byte   0x25,0xAA,0x60,0x5C,0x58,0x16,0xA7,0x2D,0x23,0xDB,0x59,0x45,0xFF,0x02,0xA3,0x1E
        .byte   0xCE,0xC3,0xB2,0x73,0xAA,0x45,0x82,0x48,0xF2,0x7D,0x11,0x51,0x9E,0x47,0x3F,0xF2
        .byte   0x81,0xB8,0xE0,0x66,0x14,0x79,0xCE,0x04,0xFB,0x8A,0x2F,0x7E,0x25,0x81,0x32,0x53
        .byte   0xF0,0x13,0xC5,0x4A,0xA3,0xA4,0x40,0x25,0x76,0xED,0xBC,0x55,0x6A,0x60,0x7E,0xD4
        .byte   0x0A,0xB9,0x75,0x61,0xD5,0xE7,0xEA,0x7D,0x7B,0x62,0x78,0x6C,0xD9,0xA9,0x8D,0xAF
        .byte   0xE2,0xC1,0x3C,0x78,0xDF,0xDE,0xBF,0x50,0x52,0x28,0xA5,0x41,0xDF,0x45,0x9F,0x1B
        .byte   0x69,0x96,0x2E,0x47,0xB1,0xC8,0x69,0x72,0xC3,0xAD,0xBA,0x4C,0x15,0x38,0x7B,0x98
        .byte   0x20,0x63,0xA8,0x52,0x65,0x9C,0xDA,0xEA,0x8E,0x02,0x3A,0x58,0xFC,0x1A,0xC8,0xD5
        .byte   0x27,0x53,0xCE,0x5D,0x78,0x55,0x63,0x65,0x86,0x57,0x65,0x63,0xEC,0x7C,0xCB,0x2A
        .byte   0x4A,0x12,0xFF,0x68,0x87,0xDD,0xED,0x82,0x17,0x86,0x9B,0x6E,0x27,0xB7,0xE7,0x9D
        .byte   0xA8,0xAD,0xDA,0x73,0xDE,0x8C,0x0B,0xD8,0x98,0x6C,0x7C,0x79,0x6B,0xD8,0xBA,0x4E
        .byte   0x63,0xEC,0x20,0x7F,0x52,0x37,0x3D,0x6D,0xDB,0xCE,0x33,0x42,0xC3,0xB3,0x8E,0x52
        .byte   0xF2,0xBB,0x08,0x45,0xEA,0xC7,0x5D,0x80,0x71,0x0D,0xDF,0x47,0x9E,0xF0,0x58,0xE9
        .byte   0xE0,0x35,0x86,0x4A,0x6A,0xDB,0x69,0xB7,0x53,0x3C,0x5F,0x4D,0xA4,0x41,0x78,0x56
        .byte   0xEC,0xED,0x08,0x50,0x0E,0x77,0xB2,0x9A,0xA6,0xDA,0xB3,0x52,0xD1,0x07,0x16,0xC8
        .byte   0x22,0xEE,0x90,0x55,0x82,0xF6,0x1A,0xFD,0x43,0x6B,0x3E,0x58,0x31,0xA2,0x14,0xA4
LABR_L2_E:
        .byte   0x95,0x1D,0x55,0x5C,0x5E,0xF8,0x0B,0xAE


