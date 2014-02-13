        .text
        .align  4
        .globl  sin


sin:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mvn     r7, #2, 2
        mvn     r2, #0xFF, 12
        and     r12, r1, r7
        bic     r2, r2, #0xF, 4
        mov     r3, r12, lsl #1
        bic     lr, r1, r7
        cmp     r3, #2, 12
        and     r2, r12, r2
        str     lr, [sp, #4]
        movcc   r3, #2, 12
        orrcs   r2, r2, #1, 12
        mov     lr, #1, 2
        sub     lr, lr, #0x77, 16
        mov     r4, #0x37, 16
        sub     lr, r12, lr
        orr     r4, r4, #1, 8
        cmp     r4, lr
        mov     lr, #0x33
        orr     r5, lr, #1, 22
        mov     r8, #0
        sub     r3, r5, r3, lsr #21
        bhi     LAAL11
        mov     lr, #0xDF, 12
        orr     lr, lr, #3, 4
        add     lr, lr, #0x2D, 12
        cmp     lr, r12
        mov     lr, #0xFF
        orr     r4, lr, #7, 24
        bhi     LAAL5
        cmp     r12, r4, lsl #20
        bcc     LAAL1
        mov     r1, #0xFF, 12
        orr     r1, r1, #7, 4
        cmp     r1, r12
        bne     LAAL0
        cmp     r0, #0
        subeq   r12, r8, #2, 14
LAAL0:
        ldr     r1, [sp, #4]
        orr     r12, r12, #2, 14
        orr     r1, r12, r1
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LAAL1:
        ldr     r1, [pc, #0xDA8]
        rsb     r3, r3, #0x34
        add     r12, r3, #9
        mov     lr, r12, lsr #5
        ldr     r12, [r1, +lr, lsl #2]
        sub     r3, r3, lr, lsl #5
        add     r1, r1, lr, lsl #2
        ldr     lr, [r1, #0x14]
        umull   r12, r4, r0, r12
        umull   r5, r6, r0, lr
        umull   r7, r9, lr, r2
        str     r12, [sp, #8]
        ldr     r4, [r1, #0x18]
        ldr     r12, [r1, #8]
        str     r5, [sp, #0xC]
        ldr     r11, [sp, #0xC]
        umull   r4, lr, r2, r4
        str     r6, [sp]
        str     lr, [sp, #0x10]
        umull   lr, r5, r0, r12
        ldr     r10, [sp]
        str     r4, [sp, #0x14]
        ldr     r4, [r1, #0x10]
        str     r5, [sp, #0x18]
        str     lr, [sp, #0x1C]
        umull   r12, lr, r12, r2
        str     lr, [sp, #0x24]
        umull   lr, r5, r4, r2
        adds    r7, r10, r7
        str     r12, [sp, #0x20]
        ldr     r10, [sp, #0x14]
        ldr     r12, [r1, #0xC]
        adc     r9, r9, #0
        str     r5, [sp, #0x28]
        umull   r5, r4, r0, r4
        adds    r10, r11, r10
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        str     r5, [sp, #0x2C]
        umull   r6, r5, r12, r2
        adc     r10, r10, #0
        adds    r7, r7, r10
        ldr     r10, [sp, #0x2C]
        str     r6, [sp, #0x30]
        umull   r12, r6, r0, r12
        adc     r9, r9, #0
        adds    r4, r4, lr
        ldr     lr, [sp, #0x28]
        adc     lr, lr, #0
        adds    r7, r10, r7
        str     r7, [sp, #0x2C]
        adc     r9, r9, #0
        adds    r4, r9, r4
        adc     r7, lr, #0
        ldr     lr, [sp, #0x30]
        add     r10, r3, #0x12
        adds    r6, r6, lr
        adc     lr, r5, #0
        adds    r4, r12, r4
        adc     r7, r7, #0
        adds    r5, r7, r6
        ldr     r6, [r1, #4]
        ldr     r1, [sp, #0x20]
        adc     r12, lr, #0
        ldr     lr, [sp, #0x18]
        umull   r0, r7, r0, r6
        umull   r2, r6, r6, r2
        ldr     r6, [sp, #0x1C]
        adds    lr, lr, r1
        ldr     r1, [sp, #0x24]
        adc     r1, r1, #0
        adds    r6, r6, r5
        adc     r12, r12, #0
        adds    lr, r12, lr
        adc     r1, r1, #0
        adds    r5, r0, lr
        adc     r1, r1, #0
        adds    r2, r7, r2
        adds    r1, r1, r2
        ldr     r2, [sp, #8]
        mov     r0, r5
        adds    r1, r2, r1
        add     r2, r3, #0xA
        mov     r1, r1, lsl r2
        mov     r9, r1, lsr r2
        rsb     r2, r2, #0x38
        mov     r1, r9
        mov     r3, #0
        bl      __lshrdi3
        mov     r7, r0
        mov     r2, r10
        mov     r1, r9
        mov     r0, r5
        mov     r3, #0
        bl      __ashldi3
        mov     r2, r10
        rsb     r10, r10, #0x40
        str     r10, [sp, #8]
        mov     r3, #0
        bl      __ashrdi3
        add     r3, sp, #0x34
        add     r2, sp, #0x34
        str     r1, [r3]
        str     r0, [r2, #4]
        add     r2, sp, #0x34
        add     r3, sp, #0x34
        str     r6, [r3, #8]
        ldr     r12, [r2, #4]
        ldr     r3, [r2]
        add     r2, sp, #0x34
        str     r4, [r2, #0xC]
        mov     r1, r1, asr #31
        cmp     r3, r12, asr #31
        ldr     r12, [sp, #0x2C]
        add     r3, sp, #0x34
        add     r2, sp, #0x34
        str     r12, [r3, #0x10]
        ldr     r12, [sp, #0x14]
        mov     r3, r8
        str     r12, [r2, #0x14]
        addne   r12, sp, #0x34
        ldrne   r2, [r12]
        bne     LAAL3
        mov     lr, r8
        ldr     r4, [sp, #8]
LAAL2:
        add     r2, sp, #0x34
        add     lr, lr, #4
        add     r12, r2, lr
        add     r3, r3, #1
        ldr     r2, [r2, +r3, lsl #2]
        ldr     r5, [r12, #4]
        add     r4, r4, #0x20
        cmp     r2, r5, asr #31
        bne     LAAL41
        cmp     r3, #5
        bcc     LAAL2
        str     r4, [sp, #8]
LAAL3:
        cmp     r1, #0
        rsbne   r2, r2, #0
        ldr     r12, [r12, #4]
        ldr     lr, [pc, #0xB7C]
        clz     r2, r2
        add     r4, sp, #0x34
        sub     r0, r2, #1
        ldr     r2, [r4, +r3, lsl #2]
        add     r3, r4, r3, lsl #2
        ldr     r5, [r3, #8]
        ldr     r3, [lr]
        ldr     r4, [lr, #4]
        rsb     r6, r0, #0x20
        mov     lr, r5, lsr r6
        mov     r6, r12, lsr r6
        orr     r2, r6, r2, lsl r0
        umull   r6, r5, r3, r2
        orr     r10, lr, r12, lsl r0
        umull   lr, r9, r2, r4
        sub     r1, r7, r1
        umull   r12, r7, r3, r10
        adds    r6, r7, r6
        adc     r5, r5, #0
        str     r4, [sp]
        umull   r10, r4, r10, r4
        adds    r9, r9, r6
        adc     r5, r5, #0
        adds    r12, lr, r12
        adc     r8, r8, #0
        adds    r12, r4, r12
        adc     r8, r8, #0
        adds    r8, r8, r9
        adc     r7, r5, #0
        cmp     r2, #0
        blt     LAAL40
LAAL4:
        ldr     r2, [sp, #8]
        add     r2, r0, r2
        add     r6, r2, #5
        b       LAAL16
LAAL5:
        mov     lr, r4, lsl #20
        sub     lr, lr, #0x42, 8
        cmp     lr, r12
        bhi     LAAL47
        ldr     lr, [pc, #0xAE0]
        mov     r9, r0, lsl #8
        ldr     r10, [pc, #0xADC]
        mov     r1, r0, lsr #24
        orr     r6, r1, r2, lsl #8
        mov     r0, r3, lsl #1
        sub     r1, r0, #0x70
        add     r0, r6, r9, lsr #31
        smull   r2, r12, r0, r0
        add     r3, r3, #8
        str     r3, [sp, #8]
        str     r2, [sp, #0x30]
        umull   lr, r2, lr, r12
        smull   lr, r3, r0, r9
        ldr     lr, [pc, #0xAB0]
        str     r3, [sp, #0x2C]
        smull   lr, r3, r3, lr
        add     lr, r1, #6
        sub     lr, r10, r2, lsr lr
        umull   lr, r2, r12, lr
        str     r2, [sp, #0x28]
        ldr     r11, [sp, #0x28]
        add     r2, r1, #4
        rsb     r10, r1, #0x1C
        str     r10, [sp, #0x24]
        add     r10, r1, #2
        mov     r3, r3, asr r10
        ldr     r10, [sp, #0x24]
        mov     lr, lr, lsr r2
        orr     r11, lr, r11, lsl r10
        ldr     r10, [pc, #0xA70]
        subs    lr, r10, r11
        ldr     r11, [sp, #0x28]
        sbc     r10, r10, r11, lsr r2
        subs    lr, lr, r3
        umull   lr, r2, r12, lr
        sbc     r10, r10, r3, asr #31
        ldr     r3, [sp, #0x30]
        umull   r3, lr, r3, r10
        umull   r3, r12, r12, r10
        adds    r10, r2, lr
        adc     lr, r8, #0
        add     r2, r1, #1
        adds    r3, r3, r10
        adc     r12, r12, lr
        ldr     lr, [sp, #0x2C]
        adds    r3, r3, lr
        smull   r10, r1, r0, r3
        adc     lr, r12, lr, asr #31
        add     r3, lr, r3, lsr #31
        smull   r0, r12, r0, r3
        mov     r3, r2, asr #31
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        subs    r9, r9, r0
        sbc     r6, r6, r1
        bics    r7, r6, r7
        beq     LAAL6
        rsbs    r9, r9, #0
        rsc     r6, r6, #0
LAAL6:
        ldr     r0, [sp, #8]
        clz     r1, r6
        add     r5, r5, #9
        cmp     r1, #0x20
        rsb     r0, r0, r5
        beq     LAAL42
LAAL7:
        sub     r2, r1, #1
        rsb     r1, r2, #0x20
        mov     r1, r9, lsr r1
        orr     r6, r1, r6, lsl r2
        subs    r1, r0, r2
        mov     r9, r9, lsl r2
        bpl     LAAL9
        rsb     r1, r1, #0
        cmp     r1, #0x20
        blt     LAAL8
        mov     r9, r6
        mov     r6, r6, asr #31
        sub     r1, r1, #0x20
LAAL8:
        cmp     r1, #0x20
        mov     r0, #0x20
        movgt   r1, r0
        mov     r9, r9, lsr r1
        rsb     r0, r1, #0x20
        orr     r9, r9, r6, lsl r0
        mov     r6, r6, asr r1
        mov     r1, r8
LAAL9:
        mov     r0, r9, lsr #9
        and     r2, r0, #1
        mov     r0, r6, lsl #22
        orr     r9, r0, r9, lsr #10
        adds    r0, r2, r9
        mov     r6, r6, lsr #10
        adc     r2, r6, r2, asr #31
        orrs    r3, r2, r2, asr #31
        moveq   r1, r8
        beq     LAAL10
        sub     r3, r4, #1
        cmp     r3, r1
        bgt     LAAL10
        mov     r0, r8
        mov     r1, r4
        mov     r2, r0
LAAL10:
        add     r1, r2, r1, lsl #20
        orr     r7, r1, r7
        ldr     r1, [sp, #4]
        eor     r1, r7, r1
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LAAL11:
        ldr     r1, [pc, #0x934]
        ldr     r12, [pc, #0x934]
        ldr     lr, [r1]
        sub     r1, r3, #0x28
        umull   lr, r4, lr, r2
        mov     r1, r4, lsr r1
        ldr     lr, [r12, #0xC]
        ldr     r4, [r12, #8]
        ldr     r6, [r12, #4]
        ldr     r5, [r12]
        add     r1, r1, #1
        mov     r1, r1, lsr #1
        umull   r7, r4, r4, r1
        umull   lr, r12, lr, r1
        mul     r5, r5, r1
        adds    r12, r7, r12
        umull   r7, r6, r6, r1
        adc     r4, r4, #0
        adds    r4, r7, r4
        adc     r6, r6, #0
        adds    r5, r5, r6
        cmp     r3, #0x31
        bgt     LAAL12
        sub     r7, r3, #0x11
        rsb     r6, r3, #0x31
        mov     r7, r0, lsr r7
        orr     r3, r7, r2, lsl r6
        mov     r2, r0, lsl r6
        mov     r6, r8
        b       LAAL13
LAAL12:
        sub     r9, r3, #0x31
        rsb     r6, r3, #0x51
        mov     r7, r0, lsr r9
        mov     r3, r2, lsr r9
        orr     r2, r7, r2, lsl r6
        mov     r6, r0, lsl r6
LAAL13:
        cmp     r12, r6
        cmpeq   lr, r8
        bls     LAAL14
        adds    r4, r4, #1
        adc     r5, r5, #0
LAAL14:
        subs    r8, r8, lr
        sbc     r12, r6, r12
        subs    r4, r2, r4
        sbc     r3, r3, r5
        cmp     r3, r4, asr #31
        mov     r2, r12
        mov     r0, #0x31
        and     lr, r3, #2, 2
        bne     LAAL15
        ldr     r2, [pc, #0x870]
        mov     r0, #0x51
        mov     r3, r4
        ldr     r2, [r2, #0x10]
        umull   r5, r2, r2, r1
        adds    r2, r8, r2
        adc     r4, r12, #0
        cmp     r3, r4, asr #31
        bne     LAAL15
        mov     r3, r4
        mov     r4, r2
        mov     r2, r5
        mov     r0, #0x71
LAAL15:
        cmp     lr, #0
        moveq   r12, r3
        rsbne   r12, r3, #0
        clz     r12, r12
        cmp     r12, #0
        subne   r12, r12, #1
        rsb     lr, r12, #0x20
        mov     r2, r2, lsr lr
        mov     lr, r4, lsr lr
        orr     r7, lr, r3, lsl r12
        orr     r8, r2, r4, lsl r12
        add     r6, r0, r12
LAAL16:
        tst     r1, #0x80
        beq     LAAL17
        ldr     r0, [sp, #4]
        eor     r0, r0, #2, 2
        str     r0, [sp, #4]
LAAL17:
        tst     r1, #0x40
        moveq   r5, #1
        movne   r5, #0
        and     r4, r1, #0x3F
        tst     r4, #0x20
        beq     LAAL18
        rsbs    r8, r8, #0
        rsb     r4, r4, #0x40
        rsc     r7, r7, #0
        rsb     r5, r5, #1
LAAL18:
        cmp     r4, #0
        bne     LAAL27
        cmn     r7, #6, 2
        beq     LAAL44
LAAL19:
        add     r0, r7, r8, lsr #31
        smull   r2, r1, r0, r8
        smull   r12, lr, r0, r0
        mov     r2, r6, lsl #1
        sub     r2, r2, #0x80
        cmp     r5, #0
        add     r3, r2, #2
        beq     LAAL20
        ldr     r5, [pc, #0x798]
        ldr     r4, [pc, #0x78C]
        smull   r5, r9, r1, r5
        str     r9, [sp, #0x30]
        ldr     r9, [pc, #0x784]
        umull   r5, r4, r4, lr
        add     r5, r2, #6
        sub     r5, r9, r4, lsr r5
        umull   r4, r10, lr, r5
        add     r9, r2, #4
        ldr     r11, [sp, #0x30]
        rsb     r5, r2, #0x1C
        mov     r4, r4, lsr r9
        orr     r4, r4, r10, lsl r5
        ldr     r5, [pc, #0x760]
        mov     r3, r11, asr r3
        add     r2, r2, #1
        subs    r4, r5, r4
        sbc     r9, r5, r10, lsr r9
        subs    r4, r4, r3
        umull   r5, r4, lr, r4
        sbc     r3, r9, r3, asr #31
        umull   r12, r5, r12, r3
        adds    r12, r4, r5
        umull   r5, lr, lr, r3
        mov     r3, #0
        adc     r4, r3, #0
        mov     r3, r2, asr #31
        adds    r12, r5, r12
        adc     r4, lr, r4
        adds    r12, r12, r1
        adc     lr, r4, r1, asr #31
        smull   r4, r1, r0, r12
        add     r12, lr, r12, lsr #31
        smull   r0, r12, r0, r12
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashrdi3
        subs    r8, r8, r0
        sbc     r7, r7, r1
        b       LAAL21
LAAL20:
        ldr     r0, [pc, #0x700]
        ldr     r8, [pc, #0x6F0]
        rsb     r4, r2, #0x1B
        umull   r9, r6, r0, lr
        add     r7, r2, #5
        smull   r5, r0, r1, r8
        mov     r1, r1, lsl #1
        mov     r10, r0, lsl #2
        mov     r9, r9, lsr r7
        orr     r4, r9, r6, lsl r4
        subs    r4, r8, r4
        umull   r9, r4, lr, r4
        sbc     r8, r8, r6, lsr r7
        umull   r7, r6, r12, r8
        adds    r7, r4, r6
        umull   r6, r8, r8, lr
        mov     r4, #0
        adc     r9, r4, #0
        orr     r5, r10, r5, lsr #30
        adds    r7, r6, r7
        adc     r9, r8, r9
        adds    r7, r5, r7
        umull   r7, r5, lr, r7
        adc     r0, r9, r0, asr #30
        umull   r7, r6, r12, r0
        adds    r5, r5, r6
        umull   r7, r6, r0, lr
        adc     r0, r4, #0
        adds    r5, r7, r5
        adc     r0, r6, r0
        rsb     r6, r2, #0x1E
        mov     r5, r5, lsr r3
        orr     r6, r5, r0, lsl r6
        subs    r12, r12, r6
        sbc     r3, lr, r0, lsr r3
        adds    r0, r1, r12
        adc     r1, r3, r1, asr #31
        add     r2, r2, #3
        mov     r3, r2, asr #31
        bl      __lshrdi3
        subs    r8, r4, r0
        mov     r0, #1, 2
        sbc     r7, r0, r1
        mov     r6, #0x3E
LAAL21:
        mvn     r0, #2, 2
        bics    r1, r7, r0
        beq     LAAL22
        rsbs    r8, r8, #0
        rsc     r7, r7, #0
LAAL22:
        mov     r0, #0x33
        orr     r0, r0, #1, 22
        add     r0, r0, #9
        rsb     r6, r6, r0
        clz     r0, r7
        cmp     r0, #0x20
        beq     LAAL43
LAAL23:
        sub     r0, r0, #1
        rsb     r2, r0, #0x20
        mov     r2, r8, lsr r2
        orr     r3, r2, r7, lsl r0
        subs    r2, r6, r0
        mov     r0, r8, lsl r0
        bpl     LAAL25
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAAL24
        mov     r0, r3
        mov     r3, r3, asr #31
        sub     r2, r2, #0x20
LAAL24:
        cmp     r2, #0x20
        mov     r12, #0x20
        movgt   r2, r12
        mov     r0, r0, lsr r2
        rsb     r12, r2, #0x20
        orr     r0, r0, r3, lsl r12
        mov     r3, r3, asr r2
        mov     r2, #0
LAAL25:
        mov     r12, r0, lsr #9
        mov     lr, r3, lsl #22
        orr     r0, lr, r0, lsr #10
        and     r12, r12, #1
        adds    r0, r12, r0
        mov     r3, r3, lsr #10
        adc     r12, r3, r12, asr #31
        orrs    r3, r12, r12, asr #31
        moveq   r2, #0
        beq     LAAL26
        mov     r3, #0xFF
        orr     r3, r3, #7, 24
        sub     lr, r3, #1
        cmp     lr, r2
        bgt     LAAL26
        mov     r0, #0
        mov     r2, r3
        mov     r12, r0
LAAL26:
        add     r2, r12, r2, lsl #20
        orr     r1, r2, r1
        ldr     r2, [sp, #4]
        eor     r1, r1, r2
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LAAL27:
        cmn     r7, #6, 2
        beq     LAAL46
LAAL28:
        ldr     r0, [pc, #0x550]
        add     r2, r7, r8, lsr #31
        smull   lr, r11, r2, r2
        umull   r0, r1, r0, r11
        smull   r3, r0, r2, r8
        ldr     r3, [pc, #0x544]
        str     r0, [sp, #0x30]
        smull   r3, r0, r0, r3
        str     r3, [sp, #0x2C]
        ldr     r3, [pc, #0x540]
        umull   r3, r12, r3, r11
        str     r12, [sp, #0x24]
        ldr     r12, [pc, #0x524]
        str     r3, [sp, #0x28]
        mov     r3, r6, lsl #1
        sub     r9, r3, #0x80
        add     r3, r9, #6
        sub     r3, r12, r1, lsr r3
        umull   r1, r3, r11, r3
        rsb     r12, r9, #0x1C
        str     r12, [sp, #0x1C]
        add     r12, r9, #2
        str     r12, [sp, #0x18]
        mov     r12, r0, asr r12
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        str     r3, [sp, #0x20]
        ldr     r10, [sp, #0x20]
        add     r3, r9, #4
        mov     r1, r1, lsr r3
        orr     r10, r1, r10, lsl r12
        ldr     r12, [pc, #0x4DC]
        subs    r1, r12, r10
        ldr     r10, [sp, #0x20]
        sbc     r3, r12, r10, lsr r3
        ldr     r12, [sp, #0x14]
        rsb     r10, r9, #0x1B
        subs    r1, r1, r12
        umull   r1, r12, r11, r1
        ldr     r1, [sp, #0x14]
        str     r12, [sp, #0x20]
        str     r10, [sp, #0x14]
        sbc     r3, r3, r1, asr #31
        umull   r12, r1, lr, r3
        umull   r3, r12, r3, r11
        str     r12, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        ldr     r10, [sp, #0x1C]
        adds    r12, r12, r1
        mov     r1, #0
        adc     r1, r1, #0
        str     r1, [sp, #0x20]
        adds    r12, r3, r12
        ldr     r3, [sp, #0x20]
        add     r1, r9, #5
        adc     r3, r10, r3
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x30]
        adds    r12, r3, r12
        str     r12, [sp, #0x1C]
        smull   r12, r10, r2, r12
        ldr     r12, [sp, #0x20]
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x24]
        adc     r3, r12, r3, asr #31
        ldr     r12, [sp, #0x1C]
        add     r12, r3, r12, lsr #31
        smull   r2, r3, r2, r12
        ldr     r12, [sp, #0x14]
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x28]
        mov     r2, r2, lsr r1
        orr     r2, r2, r10, lsl r12
        ldr     r12, [sp, #0x2C]
        mov     r10, r0, lsl #2
        orr     r12, r10, r12, lsr #30
        ldr     r10, [sp, #0x20]
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0x10]
        adds    r12, r10, r12
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0x10]
        adc     r12, r3, r12, asr #31
        ldr     r3, [pc, #0x40C]
        str     r12, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        subs    r3, r3, r2
        umull   r2, r3, r11, r3
        ldr     r2, [pc, #0x3F8]
        sbc     r2, r2, r12, lsr r1
        umull   r12, r1, lr, r2
        umull   r2, r12, r2, r11
        adds    r10, r3, r1
        mov     r1, #0
        adc     r3, r1, #0
        adds    r2, r2, r10
        rsb     r1, r9, #0x1E
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x30]
        adc     r3, r12, r3
        ldr     r12, [sp, #0x2C]
        mov     r1, r1, lsl #1
        adds    r2, r12, r2
        umull   r12, r2, r11, r2
        adc     r3, r3, r0, asr #30
        umull   r12, r0, lr, r3
        umull   r3, r10, r11, r3
        adds    r12, r2, r0
        mov     r0, #0
        adc     r0, r0, #0
        add     r2, r9, #3
        adds    r12, r3, r12
        ldr     r3, [sp, #0x18]
        adc     r0, r10, r0
        mov     r12, r12, lsr r3
        ldr     r3, [sp, #0x24]
        orr     r3, r12, r0, lsl r3
        subs    lr, lr, r3
        ldr     r3, [sp, #0x18]
        sbc     r3, r11, r0, lsr r3
        adds    r0, r1, lr
        adc     r1, r3, r1, asr #31
        mov     r3, r2, asr #31
        bl      __lshrdi3
        mov     r10, r1
        ldr     r1, [sp, #0x20]
        mov     r11, r0
        ldr     r0, [sp, #0x28]
        add     r2, r9, #1
        mov     r3, r2, asr #31
        bl      __ashrdi3
        mov     r2, #0
        ldr     r12, [pc, #0x358]
        mov     r3, #1, 2
        subs    r2, r2, r11
        sbc     r3, r3, r10
        subs    r0, r8, r0
        ldr     r8, [r12, +r4, lsl #4]
        add     r12, r12, r4, lsl #4
        sbc     lr, r7, r1
        cmp     r5, #0
        ldr     r5, [pc, #0x338]
        ldr     r9, [r12, #4]
        ldr     r7, [r12, #8]
        ldr     r1, [r12, #0xC]
        mov     r4, r4, lsl #1
        add     r12, r5, r4
        ldrsb   r5, [r5, +r4]
        ldrsb   r4, [r12, #1]
        mov     r12, lr, lsr #31
        beq     LAAL31
        cmp     r12, #0
        beq     LAAL29
        rsbs    r0, r0, #0
        rsc     lr, lr, #0
LAAL29:
        umull   r11, r10, r8, r3
        str     r10, [sp, #0x2C]
        umull   r8, r10, r2, r8
        umull   r8, r2, r2, r9
        str     r10, [sp, #0x28]
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x30]
        str     r8, [sp, #0x24]
        umull   r8, r9, r9, r3
        umull   r10, r3, r7, r0
        str     r3, [sp, #0x20]
        umull   r0, r3, r0, r1
        str     r3, [sp, #0x1C]
        umull   r3, r10, r7, lr
        ldr     r7, [sp, #0x28]
        umull   lr, r1, r1, lr
        adds    r11, r11, r7
        ldr     r7, [sp, #0x2C]
        adc     r7, r7, #0
        adds    r2, r8, r2
        ldr     r8, [sp, #0x24]
        adc     r9, r9, #0
        adds    r11, r8, r11
        adc     r7, r7, #0
        adds    r8, r7, r2
        ldr     r2, [sp, #0x20]
        adc     r7, r9, #0
        adds    r3, r3, r2
        ldr     r2, [sp, #0x1C]
        adc     r10, r10, #0
        adds    lr, lr, r2
        adc     r1, r1, #0
        adds    r3, r0, r3
        adc     r10, r10, #0
        adds    r0, r10, lr
        adc     r1, r1, #0
        cmp     r12, #0
        beq     LAAL30
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAAL30:
        sub     r6, r6, r5
        add     r4, r6, r4
        sub     r2, r4, #0x3E
        mov     r3, r2, asr #31
        bl      __ashrdi3
        adds    r8, r8, r0
        adc     r7, r7, r1
        add     r5, r5, #0x1E
        b       LAAL34
LAAL31:
        cmp     r12, #0
        beq     LAAL32
        rsbs    r0, r0, #0
        rsc     lr, lr, #0
LAAL32:
        umull   r0, r10, r9, r0
        umull   r8, r0, r8, lr
        str     r10, [sp, #0x30]
        umull   r10, r8, r7, r3
        umull   r11, r7, r7, r2
        umull   r2, r11, r2, r1
        umull   r1, r3, r3, r1
        umull   lr, r9, lr, r9
        adds    r7, r10, r7
        adc     r8, r8, #0
        adds    r11, r1, r11
        adc     r3, r3, #0
        adds    r7, r2, r7
        ldr     r1, [sp, #0x30]
        adc     r8, r8, #0
        adds    r8, r8, r11
        adc     r7, r3, #0
        adds    r0, r1, r0
        mov     r1, #0
        adc     r1, r1, #0
        adds    r0, lr, r0
        adc     r1, r9, r1
        cmp     r12, #0
        beq     LAAL33
        rsbs    r0, r0, #0
        rsc     r1, r1, #0
LAAL33:
        add     r5, r6, r5
        sub     r2, r5, r4
        sub     r2, r2, #0x3E
        mov     r3, r2, asr #31
        bl      __ashrdi3
        subs    r8, r8, r0
        sbc     r7, r7, r1
        add     r5, r4, #0x1E
LAAL34:
        mvn     r0, #2, 2
        bics    r2, r7, r0
        beq     LAAL35
        rsbs    r8, r8, #0
        rsc     r7, r7, #0
LAAL35:
        mov     r0, #0xFF
        orr     r1, r0, #7, 24
        sub     r0, r1, #0xF3, 30
        add     r0, r0, #9
        clz     r3, r7
        cmp     r3, #0x20
        rsb     r0, r5, r0
        beq     LAAL45
LAAL36:
        sub     r12, r3, #1
        rsb     r3, r12, #0x20
        mov     r3, r8, lsr r3
        orr     r7, r3, r7, lsl r12
        subs    r3, r0, r12
        mov     r8, r8, lsl r12
        bpl     LAAL38
        rsb     r3, r3, #0
        cmp     r3, #0x20
        blt     LAAL37
        mov     r8, r7
        mov     r7, r7, asr #31
        sub     r3, r3, #0x20
LAAL37:
        cmp     r3, #0x20
        mov     r0, #0x20
        movgt   r3, r0
        mov     r8, r8, lsr r3
        rsb     r0, r3, #0x20
        orr     r8, r8, r7, lsl r0
        mov     r7, r7, asr r3
        mov     r3, #0
LAAL38:
        mov     r0, r8, lsr #9
        and     r12, r0, #1
        mov     r0, r7, lsl #22
        orr     r8, r0, r8, lsr #10
        adds    r0, r12, r8
        mov     r7, r7, lsr #10
        adc     r12, r7, r12, asr #31
        orrs    lr, r12, r12, asr #31
        moveq   r3, #0
        beq     LAAL39
        sub     lr, r1, #1
        cmp     lr, r3
        bgt     LAAL39
        mov     r0, #0
        mov     r3, r1
        mov     r12, r0
LAAL39:
        ldr     r1, [sp, #4]
        add     r3, r12, r3, lsl #20
        orr     r2, r3, r2
        eor     r1, r2, r1
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LAAL40:
        ldr     r2, [sp]
        subs    r8, r8, r2
        sbc     r7, r7, r3
        b       LAAL4
LAAL41:
        str     r4, [sp, #8]
        b       LAAL3
LAAL42:
        clz     r2, r9
        cmp     r2, #0
        beq     LAAL7
        mov     r6, r9
        sub     r0, r0, #0x20
        mov     r1, r2
        mov     r9, r8
        b       LAAL7
LAAL43:
        clz     r2, r8
        cmp     r2, #0
        beq     LAAL23
        mov     r7, r8
        sub     r6, r6, #0x20
        mov     r0, r2
        mov     r8, #0
        b       LAAL23
LAAL44:
        mov     r0, r7, lsl #31
        orr     r8, r0, r8, lsr #1
        mov     r7, r7, asr #1
        sub     r6, r6, #1
        b       LAAL19
LAAL45:
        clz     r12, r8
        cmp     r12, #0
        beq     LAAL36
        mov     r7, r8
        sub     r0, r0, #0x20
        mov     r3, r12
        mov     r8, #0
        b       LAAL36
LAAL46:
        mov     r0, r7, lsl #31
        orr     r8, r0, r8, lsr #1
        mov     r7, r7, asr #1
        sub     r6, r6, #1
        b       LAAL28
LAAL47:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   LAAL_inv2p7_pi_long
        .long   LAAL_pi_over_2p7_long
        .long   0x68068068
        .long   0x44444444
        .long   0x55555555
        .long   LAAL_inv2p7_pi_short
        .long   LAAL_pi_over_2p7
        .long   0x5b05b05b
        .long   LAAL_sincos_table1
        .long   LAAL_sc_sincos_tbl1


        .data
        .align  4


LAAL_sincos_table1:
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
LAAL_inv2p7_pi_short:
        .byte   0xB7,0xC1,0x7C,0x51
LAAL_pi_over_2p7:
        .byte   0x90,0x0C,0x00,0x00,0x16,0x22,0xAA,0xFD,0x4C,0x4C,0x23,0x8C,0x0E,0xB8,0x28,0x66
        .byte   0x70,0xED,0x32,0x3E
LAAL_sc_sincos_tbl1:
        .byte   0x2D,0x1F,0x25,0x20,0x24,0x20,0x23,0x20,0x23,0x20,0x23,0x20,0x22,0x20,0x22,0x20
        .byte   0x22,0x20,0x22,0x20,0x22,0x20,0x21,0x20,0x21,0x20,0x21,0x20,0x21,0x20,0x21,0x20
        .byte   0x21,0x20,0x21,0x20,0x21,0x20,0x21,0x20,0x21,0x20,0x21,0x20,0x20,0x20,0x20,0x20
        .byte   0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20
        .byte   0x20,0x20,0x00,0x00
LAAL_inv2p7_pi_long:
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
LAAL_pi_over_2p7_long:
        .byte   0xA2,0xDA,0x0F,0xC9,0x35,0xC2,0x68,0x21


