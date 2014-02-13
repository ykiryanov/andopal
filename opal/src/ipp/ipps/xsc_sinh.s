        .text
        .align  4
        .globl  sinh


sinh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r12, [pc, #0xC30]
        mov     r4, r1
        mvn     r2, #2, 2
        bic     r8, r4, r2
        str     r0, [sp, #0x48]
        eor     r11, r4, r8
        mov     r3, #0xFF
        mvn     lr, #0xFF, 12
        cmp     r12, r11
        str     r1, [sp, #0x4C]
        orr     r3, r3, #7, 24
        bic     lr, lr, #0xF, 4
        bls     LAAJ23
        cmp     r11, #0xFF, 10
        bcs     LAAJ24
        ldr     r12, [pc, #0xBF8]
        cmp     r12, r11
        bhi     LAAJ22
        and     r1, r11, lr
        movs    lr, r11, lsl #1
        moveq   lr, #2, 12
        orrne   r1, r1, #1, 12
        bics    r2, r11, r2
        beq     LAAJ0
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAAJ0:
        ldr     r2, [pc, #0xBD0]
        sub     r4, r3, #0xF3, 30
        mov     r3, r0, lsr #22
        orr     r12, r3, r1, lsl #10
        umull   r6, r7, r12, r12
        mov     r1, r0, lsl #10
        umull   r0, r5, r1, r1
        umull   r0, r3, r1, r12
        sub     r4, r4, lr, lsr #21
        str     r4, [sp, #0x1C]
        add     r4, r4, #0xA
        adds    r5, r0, r5
        adc     lr, r3, #0
        adds    r6, r6, r3
        adc     r3, r7, #0
        adds    r5, r0, r5
        adc     lr, lr, #0
        adds    lr, lr, r6
        adc     r0, r3, #0
        mov     r3, r5, lsr #31
        orr     r3, r3, lr, lsl #1
        mov     r5, r5, lsr #30
        and     r5, r5, #1
        adds    r3, r3, r5
        mov     lr, lr, lsr #31
        orr     r0, lr, r0, lsl #1
        umull   lr, r5, r1, r3
        umull   r7, lr, r3, r12
        adc     r0, r0, #0
        umull   r2, r6, r2, r0
        umull   r9, r2, r12, r0
        adds    r5, r7, r5
        umull   r7, r10, r1, r0
        adc     lr, lr, #0
        adds    r9, r9, r10
        adc     r10, r2, #0
        mov     r2, r4, lsl #1
        adds    r5, r7, r5
        adc     lr, lr, #0
        adds    r9, lr, r9
        mov     lr, r5, lsr #31
        mov     r5, r5, lsr #30
        and     r7, r5, #1
        orr     lr, lr, r9, lsl #1
        adc     r10, r10, #0
        adds    r7, lr, r7
        ldr     lr, [pc, #0xB1C]
        sub     r2, r2, #0x3F
        sub     r5, r2, #0x39
        mov     r9, r9, lsr #31
        sub     r6, lr, r6, asr r5
        str     r7, [sp, #0x14]
        umull   r6, r7, r0, r6
        orr     r10, r9, r10, lsl #1
        add     r9, r4, r2
        sub     r9, r9, #0x3F
        adc     lr, r10, #0
        cmp     r5, #0x20
        str     r9, [sp]
        bcs     LAAJ1
        rsb     r9, r2, #0x59
        mov     r9, r7, lsl r9
        orr     r6, r9, r6, lsr r5
        mov     r5, r7, asr r5
        b       LAAJ2
LAAJ1:
        cmp     r5, #0x40
        movcs   r5, #0x1F
        subcc   r5, r2, #0x59
        mov     r6, r7, asr r5
        mov     r5, r7, asr #31
LAAJ2:
        ldr     r9, [pc, #0xAC0]
        ldr     r7, [pc, #0xAC0]
        mov     r10, #0x51
        adds    r9, r6, r9
        adc     r7, r5, r7
        tst     r7, r7
        bpl     LAAJ3
        mov     r5, r7, lsl #31
        orr     r9, r5, r9, lsr #1
        mov     r7, r7, lsr #1
        mov     r10, #0x50
LAAJ3:
        umull   r5, r6, r0, r9
        str     r6, [sp, #0x34]
        umull   r6, r5, r3, r7
        umull   r11, r6, r7, r0
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x2C]
        adds    r6, r6, r5
        mov     r5, #0
        adc     r5, r5, #0
        adds    r6, r11, r6
        ldr     r11, [sp, #0x30]
        adc     r5, r11, r5
        cmp     r0, #0
        blt     LAAJ51
LAAJ4:
        add     r10, r10, r2
        sub     r9, r10, #0x3F
        sub     r7, r9, #0x4B
        mov     r10, r6, lsr #31
        cmp     r7, #0x20
        mov     r6, r6, lsl #1
        orr     r5, r10, r5, lsl #1
        bcs     LAAJ5
        rsb     r9, r9, #0x6B
        mov     r9, r5, lsl r9
        orr     r6, r9, r6, lsr r7
        mov     r7, r5, asr r7
        b       LAAJ6
LAAJ5:
        cmp     r7, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x6B
        mov     r6, r5, asr r9
        mov     r7, r5, asr #31
LAAJ6:
        ldr     r9, [pc, #0xA14]
        ldr     r5, [pc, #0xA14]
        mov     r10, #0x4B
        adds    r9, r6, r9
        adc     r7, r7, r5
        tst     r7, r7
        bpl     LAAJ7
        mov     r5, r7, lsl #31
        orr     r9, r5, r9, lsr #1
        mov     r7, r7, lsr #1
        mov     r10, #0x4A
LAAJ7:
        umull   r6, r5, r0, r9
        umull   r6, r11, r3, r7
        str     r11, [sp, #0x34]
        umull   r11, r6, r7, r0
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x34]
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x2C]
        adds    r6, r5, r6
        mov     r5, #0
        adc     r5, r5, #0
        adds    r6, r11, r6
        ldr     r11, [sp, #0x30]
        adc     r5, r11, r5
        cmp     r0, #0
        blt     LAAJ50
LAAJ8:
        add     r10, r10, r2
        sub     r9, r10, #0x3F
        sub     r7, r9, #0x45
        mov     r10, r6, lsr #31
        cmp     r7, #0x20
        mov     r6, r6, lsl #1
        orr     r5, r10, r5, lsl #1
        bcs     LAAJ9
        rsb     r9, r9, #0x65
        mov     r9, r5, lsl r9
        orr     r6, r9, r6, lsr r7
        mov     r5, r5, asr r7
        b       LAAJ10
LAAJ9:
        cmp     r7, #0x40
        movcs   r9, #0x1F
        subcc   r9, r9, #0x65
        mov     r6, r5, asr r9
        mov     r5, r5, asr #31
LAAJ10:
        ldr     r9, [pc, #0x968]
        mov     r7, #0x45
        add     r10, r9, #0x45
        adds    r6, r6, r10
        adc     r5, r5, r9
        tst     r5, r5
        bpl     LAAJ11
        mov     r7, r5, lsl #31
        orr     r6, r7, r6, lsr #1
        mov     r5, r5, lsr #1
        mov     r7, #0x44
LAAJ11:
        umull   r3, r11, r3, r5
        umull   r10, r9, r0, r6
        umull   r10, r3, r0, r5
        adds    r11, r9, r11
        mov     r9, #0
        adc     r9, r9, #0
        adds    r10, r10, r11
        adc     r9, r3, r9
        cmp     r0, #0
        blt     LAAJ49
LAAJ12:
        add     r2, r7, r2
        sub     r2, r2, #0x3F
        sub     r0, r2, #0x41
        mov     r3, r10, lsr #31
        cmp     r0, #0x20
        orr     r9, r3, r9, lsl #1
        mov     r10, r10, lsl #1
        bcs     LAAJ13
        rsb     r2, r2, #0x61
        mov     r2, r9, lsl r2
        orr     r10, r2, r10, lsr r0
        mov     r9, r9, asr r0
        b       LAAJ14
LAAJ13:
        cmp     r0, #0x40
        movcs   r2, #0x1F
        subcc   r2, r2, #0x61
        mov     r10, r9, asr r2
        mov     r9, r9, asr #31
LAAJ14:
        ldr     r2, [pc, #0x8D0]
        mov     r6, #0x41
        adds    r0, r10, r2
        adc     r5, r9, r2
        tst     r5, r5
        bpl     LAAJ15
        mov     r2, r5, lsl #31
        orr     r0, r2, r0, lsr #1
        mov     r5, r5, lsr #1
        mov     r6, #0x40
LAAJ15:
        ldr     r2, [sp, #0x14]
        umull   r3, r2, r2, r5
        umull   r3, r7, lr, r0
        adds    r3, r7, r2
        umull   r9, r2, lr, r5
        mov     r7, #0
        adc     r7, r7, #0
        adds    r3, r9, r3
        adc     r2, r2, r7
        cmp     lr, #0
        blt     LAAJ48
LAAJ16:
        ldr     r0, [sp]
        mov     lr, r3, lsr #31
        orr     r2, lr, r2, lsl #1
        add     r0, r6, r0
        sub     r0, r0, #0x3F
        sub     r0, r0, r4
        cmp     r0, #0x20
        mov     r3, r3, lsl #1
        mov     r5, #0x1F
        bcs     LAAJ17
        rsb     lr, r0, #0x20
        mov     lr, r2, lsl lr
        orr     r3, lr, r3, lsr r0
        mov     r2, r2, asr r0
        b       LAAJ18
LAAJ17:
        cmp     r0, #0x40
        movcs   r0, #0x1F
        subcc   r0, r0, #0x20
        mov     r3, r2, asr r0
        mov     r2, r2, asr #31
LAAJ18:
        adds    r0, r1, r3
        adc     r1, r12, r2
        tst     r1, r1
        strpl   r0, [sp, #0x40]
        strpl   r1, [sp, #0x44]
        bpl     LAAJ19
        mov     r2, r1, lsl #31
        orr     r0, r2, r0, lsr #1
        str     r0, [sp, #0x40]
        mov     r1, r1, lsr #1
        str     r1, [sp, #0x44]
        ldr     r2, [sp, #0x1C]
        add     r4, r2, #9
LAAJ19:
        tst     r1, #1, 2
        bne     LAAJ20
        cmp     r1, #0
        clzeq   r0, r0
        addeq   r6, r0, #0x1F
        clzne   r1, r1
        subne   r6, r1, #1
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x44]
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashldi3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        add     r4, r4, r6
LAAJ20:
        cmp     r1, #0
        clzeq   r0, r0
        addeq   r6, r0, #0x1F
        clzne   r1, r1
        subne   r6, r1, #1
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x44]
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
        bmi     LAAJ47
LAAJ21:
        add     r2, r2, #0x3D
        add     r5, r5, #0x7E, 28
        rsb     r2, r4, r2
        and     r5, r2, r5
        mov     r2, r1, asr #10
        mov     r1, r1, lsl #22
        add     r2, r2, r5, lsl #20
        orr     r0, r1, r0, lsr #10
        orr     r1, r8, r2
        b       LAAJ46
LAAJ22:
        mov     r1, r4
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAAJ23:
        cmp     r12, r11
        bne     LAAJ45
        ldr     r1, [pc, #0x734]
        cmp     r1, r0
        bls     LAAJ44
LAAJ24:
        movs    r5, r11, lsl #1
        and     r12, r11, lr
        moveq   r5, #2, 12
        orrne   r12, r12, #1, 12
        bics    r2, r11, r2
        beq     LAAJ25
        rsbs    r0, r0, #0
        rsc     r12, r12, #0
LAAJ25:
        ldr     r4, [pc, #0x70C]
        ldr     r1, [pc, #0x70C]
        sub     r3, r3, #0xF3, 30
        ldr     r10, [r4, #4]
        ldr     lr, [r4]
        sub     r2, r3, r5, lsr #21
        ldr     r3, [r4, #8]
        smull   r9, r4, lr, r0
        add     r12, r12, r0, lsr #31
        smull   lr, r7, lr, r12
        smull   r6, r5, r12, r10
        smull   r12, r3, r3, r12
        smull   r10, r0, r0, r10
        mov     r12, #0
        adds    lr, r4, lr
        adc     r4, r7, r4, asr #31
        adds    lr, lr, r5
        adc     r5, r4, r5, asr #31
        adds    r6, r9, r6
        adc     r12, r12, #0
        adds    r4, r6, r0
        adc     r0, r12, r0, asr #31
        adds    r12, r4, r3
        adc     r3, r0, r3, asr #31
        adds    lr, r3, lr
        sub     r0, r2, #0x2A
        adc     r5, r5, r3, asr #31
        mov     r4, r5, asr r0
        and     r3, r4, #1
        add     r0, r0, #1
        add     r6, r3, r4, asr #1
        sub     r7, r5, r6, lsl r0
        ldr     r3, [r1, #0x20]
        eor     r4, r7, r7, asr #31
        sub     r4, r4, r7, asr #31
        clz     r4, r4
        sub     r5, r4, #2
        add     r2, r2, r5
        sub     r2, r2, #0x23
        sub     r4, r2, #0x20
        rsb     r2, r5, #0x20
        mov     r12, r12, lsr r2
        mov     r2, lr, lsr r2
        orr     lr, r12, lr, lsl r5
        orr     r5, r2, r7, lsl r5
        ldr     r2, [pc, #0x660]
        str     r3, [sp, #0x28]
        ldr     r0, [r1, #0x1C]
        smull   r2, r9, r2, lr
        add     r5, r5, lr, lsr #31
        smull   r2, r3, r5, r3
        add     r2, r4, #3
        str     r0, [sp, #0x20]
        add     r3, r0, r3, asr r2
        smull   r3, r0, r5, r3
        str     r2, [sp, #0x30]
        ldr     r3, [r1, #0x18]
        add     r10, r4, #2
        cmp     r10, #0x20
        str     r3, [sp, #0x18]
        ldr     r12, [r1, #0x14]
        add     r2, r3, r0, asr r2
        str     r12, [sp]
        ldr     r1, [r1, #0x10]
        str     r1, [sp, #0xC]
        smull   r0, r1, r5, r2
        bgt     LAAJ26
        rsb     r2, r4, #0x1E
        mov     r3, r0, lsr r10
        mov     r0, r1, asr r10
        orr     r2, r3, r1, lsl r2
        b       LAAJ27
LAAJ26:
        cmp     r10, #0x40
        movgt   r0, #0
        movgt   r2, r0
        bgt     LAAJ27
        sub     r0, r4, #0x1E
        mov     r2, r1, asr #31
        mov     r1, r1, lsr r0
        rsb     r3, r4, #0x3E
        mov     r0, r2, asr r0
        orr     r2, r1, r2, lsl r3
LAAJ27:
        ldr     r1, [sp, #0xC]
        ldr     r12, [pc, #0x5C4]
        adds    r2, r1, r2
        smull   r3, r1, r5, r2
        ldr     r3, [sp]
        adc     r0, r3, r0
        ldr     r3, [r12, #0xC]
        adds    r2, r0, r2, lsr #31
        smull   r2, r0, r5, r2
        str     r3, [sp, #4]
        ldr     r12, [r12, #8]
        adds    r2, r2, r1
        adc     r1, r0, r1, asr #31
        cmp     r10, #0x20
        str     r12, [sp, #8]
        bgt     LAAJ28
        rsb     r3, r4, #0x1E
        mov     r2, r2, lsr r10
        mov     r0, r1, asr r10
        orr     r3, r2, r1, lsl r3
        b       LAAJ29
LAAJ28:
        cmp     r10, #0x40
        movgt   r0, #0
        movgt   r3, r0
        bgt     LAAJ29
        sub     r0, r4, #0x1E
        mov     r2, r1, asr #31
        rsb     r3, r4, #0x3E
        mov     r1, r1, lsr r0
        mov     r0, r2, asr r0
        orr     r3, r1, r2, lsl r3
LAAJ29:
        ldr     r1, [sp, #8]
        ldr     r12, [pc, #0x548]
        adds    r2, r1, r3
        smull   r3, r1, r5, r2
        ldr     r3, [sp, #4]
        adc     r0, r3, r0
        ldr     r3, [r12, #4]
        adds    r2, r0, r2, lsr #31
        smull   r2, r0, r5, r2
        str     r3, [sp, #0x10]
        ldr     r12, [r12]
        adds    r2, r2, r1
        adc     r0, r0, r1, asr #31
        cmp     r10, #0x20
        str     r12, [sp, #0x14]
        bgt     LAAJ30
        rsb     r3, r4, #0x1E
        mov     r2, r2, lsr r10
        mov     r1, r0, asr r10
        orr     r3, r2, r0, lsl r3
        b       LAAJ31
LAAJ30:
        cmp     r10, #0x40
        movgt   r1, #0
        movgt   r3, r1
        bgt     LAAJ31
        sub     r1, r4, #0x1E
        mov     r2, r0, asr #31
        rsb     r3, r4, #0x3E
        mov     r0, r0, lsr r1
        mov     r1, r2, asr r1
        orr     r3, r0, r2, lsl r3
LAAJ31:
        ldr     r0, [sp, #0x14]
        adds    r2, r0, r3
        smull   r3, r0, r5, r2
        ldr     r3, [sp, #0x10]
        adc     r1, r3, r1
        adds    r2, r1, r2, lsr #31
        smull   r12, r1, r5, r2
        sub     r2, r4, #1
        str     r2, [sp, #0x34]
        mov     r3, r2, asr #31
        str     r3, [sp, #0x24]
        adds    r12, r12, r0
        adc     r7, r1, r0, asr #31
        smull   r1, r0, r9, r7
        mov     r1, r0, asr #31
        str     r12, [sp, #0x2C]
        bl      __ashrdi3
        ldr     r2, [sp, #0x2C]
        ldr     r12, [pc, #0x490]
        adds    r3, r2, r9
        adc     r2, r7, r9, asr #31
        adds    r0, r3, r0
        and     r3, r6, #0x3F
        str     r3, [sp, #0x1C]
        ldr     r12, [r12, +r3, lsl #3]
        adc     r1, r2, r1
        str     r12, [sp, #0x38]
        ldr     r12, [pc, #0x46C]
        add     r1, r1, r0, lsr #31
        mov     r6, r6, asr #6
        add     r3, r12, r3, lsl #3
        ldr     r7, [r3, #4]
        str     r6, [sp, #0x2C]
        smull   r2, r3, r1, r7
        ldr     r2, [sp, #0x38]
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x24]
        add     r2, r2, r7, lsr #31
        smull   r1, r12, r1, r2
        smull   r2, r0, r2, r0
        ldr     lr, [sp, #0x3C]
        ldr     r2, [sp, #0x34]
        adds    r1, r1, r0
        adc     r12, r12, r0, asr #31
        adds    r0, r1, lr
        adc     r1, r12, lr, asr #31
        bl      __ashrdi3
        adds    r6, r0, r7
        mov     r0, #0x36, 16
        orr     r0, r0, #1, 2
        ldr     r2, [sp, #0x38]
        adc     r7, r1, r2
        cmp     r0, r11
        ldr     r0, [sp, #0x2C]
        rsb     r11, r0, #0x3F
        bls     LAAJ38
        ldr     r0, [sp, #0x28]
        rsb     r5, r5, #0
        ldr     r2, [sp, #0x20]
        smull   r0, r1, r5, r0
        ldr     r0, [sp, #0x30]
        cmp     r10, #0x20
        add     r1, r2, r1, asr r0
        smull   r2, r1, r5, r1
        ldr     r2, [sp, #0x18]
        add     r0, r2, r1, asr r0
        smull   r0, r1, r5, r0
        bgt     LAAJ32
        rsb     r2, r4, #0x1E
        mov     r3, r0, lsr r10
        mov     r0, r1, asr r10
        orr     r2, r3, r1, lsl r2
        b       LAAJ33
LAAJ32:
        cmp     r10, #0x40
        movgt   r0, #0
        movgt   r2, r0
        bgt     LAAJ33
        sub     r0, r4, #0x1E
        mov     r2, r1, asr #31
        mov     r1, r1, lsr r0
        rsb     r3, r4, #0x3E
        mov     r0, r2, asr r0
        orr     r2, r1, r2, lsl r3
LAAJ33:
        ldr     r1, [sp, #0xC]
        adds    r2, r1, r2
        smull   r3, r1, r5, r2
        ldr     r3, [sp]
        adc     r0, r3, r0
        adds    r2, r0, r2, lsr #31
        smull   r0, r2, r5, r2
        adds    r0, r0, r1
        adc     r1, r2, r1, asr #31
        cmp     r10, #0x20
        bgt     LAAJ34
        rsb     r2, r4, #0x1E
        mov     r3, r0, lsr r10
        mov     r0, r1, asr r10
        orr     r2, r3, r1, lsl r2
        b       LAAJ35
LAAJ34:
        cmp     r10, #0x40
        movgt   r0, #0
        movgt   r2, r0
        bgt     LAAJ35
        sub     r0, r4, #0x1E
        mov     r2, r1, asr #31
        mov     r1, r1, lsr r0
        rsb     r3, r4, #0x3E
        mov     r0, r2, asr r0
        orr     r2, r1, r2, lsl r3
LAAJ35:
        ldr     r1, [sp, #8]
        adds    r2, r1, r2
        smull   r3, r1, r5, r2
        ldr     r3, [sp, #4]
        adc     r0, r3, r0
        adds    r2, r0, r2, lsr #31
        smull   r2, r0, r5, r2
        adds    r2, r2, r1
        adc     r0, r0, r1, asr #31
        cmp     r10, #0x20
        bgt     LAAJ36
        rsb     r4, r4, #0x1E
        mov     r2, r2, lsr r10
        mov     r10, r0, asr r10
        orr     r4, r2, r0, lsl r4
        b       LAAJ37
LAAJ36:
        cmp     r10, #0x40
        movgt   r10, #0
        movgt   r4, r10
        bgt     LAAJ37
        sub     r2, r4, #0x1E
        mov     r1, r0, asr #31
        rsb     r4, r4, #0x3E
        mov     r0, r0, lsr r2
        mov     r10, r1, asr r2
        orr     r4, r0, r1, lsl r4
LAAJ37:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        adds    r0, r0, r4
        ldr     r4, [sp, #0x24]
        adc     r10, r1, r10
        adds    r1, r10, r0, lsr #31
        smull   r2, r0, r5, r0
        smull   r5, r2, r5, r1
        ldr     r1, [sp, #0x1C]
        rsb     r3, r1, #0x40
        ldr     r1, [sp, #0x2C]
        adds    r5, r5, r0
        adc     r2, r2, r0, asr #31
        subs    r5, r5, r9
        sub     r1, r1, r3, asr #6
        and     r3, r3, #0x3F
        str     r3, [sp, #0x3C]
        smull   r3, r0, r9, r2
        str     r5, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        add     r1, r1, #0x40
        sbc     r10, r2, r9, asr #31
        sub     r9, r1, r11
        mov     r1, r0, asr #31
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x38]
        mov     r2, r5
        subs    r0, r12, r0
        ldr     r12, [pc, #0x244]
        sbc     r10, r10, r1
        add     r1, r10, r0, lsr #31
        ldr     r10, [sp, #0x3C]
        mov     r3, r4
        add     lr, r12, r10, lsl #3
        ldr     r4, [r12, +r10, lsl #3]
        ldr     r10, [lr, #4]
        mov     r12, r9, asr #31
        str     r12, [sp, #0x3C]
        add     lr, r4, r10, lsr #31
        smull   r0, r12, lr, r0
        smull   r0, lr, r1, lr
        smull   r5, r1, r1, r10
        adds    r0, r0, r12
        adc     r12, lr, r12, asr #31
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        adds    r0, r0, r10
        adc     r1, r1, r4
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        ldr     r3, [sp, #0x3C]
        mov     r2, r9
        bl      __ashrdi3
        subs    r6, r6, r0
        sbc     r7, r7, r1
LAAJ38:
        mvn     r0, #2, 2
        bics    r1, r7, r0
        beq     LAAJ39
        rsbs    r6, r6, #0
        rsc     r7, r7, #0
LAAJ39:
        mov     r0, #0x1F
        add     r0, r0, #0x3E, 28
        clz     r2, r7
        add     r0, r0, #0x3D
        cmp     r2, #0x20
        rsb     r11, r11, r0
        beq     LAAJ52
LAAJ40:
        sub     r0, r2, #1
        rsb     r2, r0, #0x20
        mov     r2, r6, lsr r2
        orr     r7, r2, r7, lsl r0
        subs    r2, r11, r0
        mov     r0, r6, lsl r0
        bpl     LAAJ42
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAAJ41
        mov     r0, r7
        mov     r7, r7, asr #31
        sub     r2, r2, #0x20
LAAJ41:
        cmp     r2, #0x20
        mov     r3, #0x20
        movgt   r2, r3
        mov     r0, r0, lsr r2
        rsb     r3, r2, #0x20
        orr     r0, r0, r7, lsl r3
        mov     r7, r7, asr r2
        mov     r2, #0
LAAJ42:
        mov     r3, r0, lsr #9
        mov     r12, r7, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r7, r7, lsr #10
        adc     r3, r7, r3, asr #31
        orrs    r12, r3, r3, asr #31
        moveq   r2, #0
        beq     LAAJ43
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        sub     lr, r12, #1
        cmp     lr, r2
        bgt     LAAJ43
        mov     r0, #0
        mov     r2, r12
        mov     r3, r0
LAAJ43:
        add     r2, r3, r2, lsl #20
        orr     r1, r2, r1
        orr     r1, r1, r8
        b       LAAJ46
LAAJ44:
        mov     r0, #0
        str     r0, [sp, #0x40]
        add     r2, sp, #0x40
        add     r1, sp, #0x48
        add     r0, sp, #0x48
        orr     r3, r8, r3, lsl #20
        str     r3, [sp, #0x44]
        mov     r3, #0x7F
        bl      __libm_error_support
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x44]
        b       LAAJ46
LAAJ45:
        mov     r1, #0x1F
        add     r1, r1, #0x7E, 28
        cmp     r11, r1, lsl #20
        bcc     LAAJ44
        orr     r1, r0, r11, lsl #12
        rsb     r2, r1, #0
        orr     r2, r1, r2
        mov     r1, r2, asr #12
        and     r1, r1, #2, 14
        orr     r1, r8, r1
        orr     r1, r11, r1
LAAJ46:
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAAJ47:
        mov     r3, r1, lsl #31
        orr     r0, r3, r0, lsr #1
        mov     r1, r1, lsr #1
        sub     r4, r4, #1
        b       LAAJ21
LAAJ48:
        subs    r3, r3, r0
        sbc     r2, r2, r5
        b       LAAJ16
LAAJ49:
        subs    r10, r10, r6
        sbc     r9, r9, r5
        b       LAAJ12
LAAJ50:
        subs    r6, r6, r9
        sbc     r5, r5, r7
        b       LAAJ8
LAAJ51:
        subs    r6, r6, r9
        sbc     r5, r5, r7
        b       LAAJ4
LAAJ52:
        clz     r0, r6
        cmp     r0, #0
        beq     LAAJ40
        mov     r7, r6
        sub     r11, r11, #0x20
        mov     r2, r0
        mov     r6, #0
        b       LAAJ40
        .long   0x408633ce
        .long   0x3e571374
        .long   0x5860577f
        .long   0x6b9911b3
        .long   0xae8e0865
        .long   0x5c778e95
        .long   0x067966b1
        .long   0x68068068
        .long   0x44444444
        .long   0x55555555
        .long   0x8fb9f87e
        .long   LAAJ_L2E
        .long   LAAJ_exp_coeffs
        .long   0x58b90bfc
        .long   __intel_dbl_T_2f


        .data
        .align  4


LAAJ_L2E:
        .byte   0xCA,0x8E,0x2A,0x2E,0x2F,0xFC,0x05,0x57,0xB4,0xFF,0xA1,0xEF
LAAJ_exp_coeffs:
        .byte   0xD6,0xBC,0xE7,0xE8,0xFB,0x0B,0xB9,0x58,0xA2,0x3A,0x16,0x0B,0xFE,0xF7,0xFE,0x7A
        .byte   0x2D,0xFE,0x82,0x12,0x5C,0x23,0xAC,0x71,0xBE,0xAD,0xCA,0x4E,0x94,0xFF,0x61,0x57
        .byte   0xBE,0x44,0xC2,0x50


