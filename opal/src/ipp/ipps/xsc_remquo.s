        .text
        .align  4
        .globl  remquo


remquo:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        str     r2, [sp, #0x38]
        ldr     r12, [sp, #0x64]
        mov     r4, r1
        str     r0, [sp, #0x30]
        str     r3, [sp, #0x3C]
        mov     lr, r4, lsl #1
        cmn     lr, #2, 12
        str     r1, [sp, #0x34]
        bcs     LAAW0
        mov     r5, r3, lsl #1
        cmn     r5, #2, 12
        bcs     LAAW0
        orrs    r5, r5, r2
        bne     LAAW8
LAAW0:
        cmn     lr, #2, 12
        bhi     LAAW1
        cmn     lr, #2, 12
        bne     LAAW2
        cmp     r0, #0
        beq     LAAW2
LAAW1:
        orr     r1, r4, #2, 14
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAAW2:
        mov     r5, r3, lsl #1
        cmn     r5, #2, 12
        bhi     LAAW3
        cmn     r5, #2, 12
        bne     LAAW4
        cmp     r2, #0
        beq     LAAW4
LAAW3:
        orr     r1, r3, #2, 14
        mov     r0, r2
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAAW4:
        orrs    r2, r5, r2
        mov     r3, #0
        beq     LAAW5
        cmn     lr, #2, 12
        bcc     LAAW6
LAAW5:
        sub     r4, r3, #2, 14
        mov     r0, #0
LAAW6:
        cmp     r2, #0
        str     r3, [r12]
        beq     LAAW38
LAAW7:
        mov     r1, r4
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAAW8:
        mvn     lr, #0xFF, 12
        mvn     r9, #2, 2
        and     r6, r4, r9
        bic     lr, lr, #0xF, 4
        and     r8, r6, lr
        mov     r5, r6, lsl #1
        eor     lr, r4, r3
        cmp     r5, #2, 12
        bic     r7, r4, r9
        and     r3, r3, r9
        movcc   r5, #2, 12
        orrcs   r8, r8, #1, 12
        mov     r1, #0xFF
        orr     r1, r1, #7, 24
        sub     r1, r1, #0xF3, 30
        cmp     r8, #1, 12
        sub     r5, r1, r5, lsr #21
        mov     r1, r0
        bcs     LAAW11
        cmp     r8, #0
        clz     r4, r8
        clzeq   r4, r0
        addeq   r4, r4, #0x20
        sub     r4, r4, #0xB
        cmp     r4, #0x20
        bgt     LAAW9
        rsb     r9, r4, #0x20
        mov     r9, r1, lsr r9
        orr     r8, r9, r8, lsl r4
        mov     r1, r1, lsl r4
        b       LAAW10
LAAW9:
        cmp     r4, #0x40
        mov     r8, #0
        movgt   r1, r8
        bgt     LAAW10
        mov     r9, r8
        rsb     r8, r4, #0x40
        mov     r8, r9, lsr r8
        sub     r10, r4, #0x20
        orr     r8, r8, r1, lsl r10
        mov     r1, r9, lsl r10
LAAW10:
        add     r5, r5, r4
LAAW11:
        mvn     r4, #0xFF, 12
        bic     r4, r4, #0xF, 4
        and     r4, r3, r4
        mov     r3, r3, lsl #1
        cmp     r3, #2, 12
        movcc   r3, #2, 12
        orrcs   r4, r4, #1, 12
        mov     r9, #0x33
        orr     r9, r9, #1, 22
        cmp     r4, #1, 12
        sub     r9, r9, r3, lsr #21
        bcs     LAAW14
        cmp     r4, #0
        clz     r3, r4
        clzeq   r3, r2
        addeq   r3, r3, #0x20
        sub     r3, r3, #0xB
        cmp     r3, #0x20
        bgt     LAAW12
        rsb     r10, r3, #0x20
        mov     r10, r2, lsr r10
        orr     r4, r10, r4, lsl r3
        mov     r2, r2, lsl r3
        b       LAAW13
LAAW12:
        cmp     r3, #0x40
        movgt   r4, #0
        movgt   r2, r4
        bgt     LAAW13
        rsb     r4, r3, #0x40
        mov     r10, #0
        mov     r4, r10, lsr r4
        sub     r11, r3, #0x20
        orr     r4, r4, r2, lsl r11
        mov     r2, r10, lsl r11
LAAW13:
        add     r9, r3, r9
LAAW14:
        subs    r3, r9, r5
        bmi     LAAW40
        mov     r9, r2, lsr #31
        mov     r6, r2, lsl #1
        orr     r4, r9, r4, lsl #1
        mov     r9, r1, lsr #31
        mov     r11, r6, lsr #30
        mov     r0, r2, lsl #2
        orr     r8, r9, r8, lsl #1
        orr     r11, r11, r4, lsl #2
        bic     r1, r1, #2, 2
        str     r0, [sp, #0x10]
        str     r11, [sp, #0x20]
        mov     r0, r2, lsl #3
        orr     r9, r1, r8, lsl #31
        mov     r11, r6, lsr #29
        mov     r2, r2, lsl #4
        mov     r10, r3, asr #2
        mov     r1, r6, lsr #31
        str     r2, [sp, #0x18]
        orr     r11, r11, r4, lsl #3
        cmp     r10, #8
        mov     r8, r8, asr #1
        orr     r1, r1, r4, lsl #1
        str     r0, [sp, #0x1C]
        str     r11, [sp, #0x14]
        sub     r2, r3, r10, lsl #2
        ble     LAAW20
        str     r5, [sp, #0xC]
        str     lr, [sp, #8]
        str     r7, [sp, #4]
        str     r12, [sp]
        ldr     r0, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
LAAW15:
        mov     r11, r9, lsr #28
        mov     r9, r9, lsl #4
        cmp     r9, r12
        orr     r8, r11, r8, lsl #4
        sbcs    r11, r8, r0
        blt     LAAW16
        subs    r9, r9, r12
        sbc     r8, r8, r0
LAAW16:
        cmp     r9, r5
        sbcs    r11, r8, lr
        blt     LAAW17
        subs    r9, r9, r5
        sbc     r8, r8, lr
LAAW17:
        cmp     r9, r7
        sbcs    r11, r8, r1
        blt     LAAW18
        subs    r9, r9, r7
        sbc     r8, r8, r1
LAAW18:
        cmp     r9, r6
        sbcs    r11, r8, r4
        blt     LAAW19
        subs    r9, r9, r6
        sbc     r8, r8, r4
LAAW19:
        sub     r10, r10, #1
        cmp     r10, #8
        bgt     LAAW15
        ldr     r5, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r12, [sp]
LAAW20:
        cmp     r10, #0
        mov     r0, #0
        beq     LAAW26
        str     r3, [sp, #0x24]
        str     r5, [sp, #0xC]
        str     lr, [sp, #8]
        str     r7, [sp, #4]
        str     r12, [sp]
        ldr     r3, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     lr, [sp, #0x20]
        ldr     r5, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
LAAW21:
        mov     r11, r9, lsr #28
        mov     r9, r9, lsl #4
        cmp     r9, r12
        orr     r8, r11, r8, lsl #4
        sbcs    r11, r8, r3
        mov     r0, r0, lsl #4
        blt     LAAW22
        subs    r9, r9, r12
        sbc     r8, r8, r3
        orr     r0, r0, #8
LAAW22:
        cmp     r9, r5
        sbcs    r11, r8, lr
        blt     LAAW23
        subs    r9, r9, r5
        sbc     r8, r8, lr
        orr     r0, r0, #4
LAAW23:
        cmp     r9, r7
        sbcs    r11, r8, r1
        blt     LAAW24
        subs    r9, r9, r7
        sbc     r8, r8, r1
        orr     r0, r0, #2
LAAW24:
        cmp     r9, r6
        sbcs    r11, r8, r4
        blt     LAAW25
        subs    r9, r9, r6
        sbc     r8, r8, r4
        orr     r0, r0, #1
LAAW25:
        subs    r10, r10, #1
        bne     LAAW21
        ldr     r3, [sp, #0x24]
        ldr     r5, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r12, [sp]
LAAW26:
        cmp     r2, #0
        beq     LAAW29
LAAW27:
        mov     r10, r9, lsr #31
        mov     r9, r9, lsl #1
        cmp     r9, r6
        orr     r8, r10, r8, lsl #1
        sbcs    r10, r8, r4
        mov     r0, r0, lsl #1
        blt     LAAW28
        subs    r9, r9, r6
        sbc     r8, r8, r4
        orr     r0, r0, #1
LAAW28:
        subs    r2, r2, #1
        bne     LAAW27
LAAW29:
        mov     r10, r9, lsl #1
        mov     r9, r9, lsr #31
        cmp     r10, r6
        mov     r2, r0, lsl #1
        orr     r8, r9, r8, lsl #1
        sbcs    r0, r8, r4
        blt     LAAW30
        subs    r10, r10, r6
        sbc     r8, r8, r4
        orr     r2, r2, #1
LAAW30:
        mov     r0, r10, lsl #1
        mov     r10, r10, lsr #31
        orr     r8, r10, r8, lsl #1
        subs    r10, r0, r6
        sbcs    r9, r8, r4
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        bne     LAAW31
        cmp     r8, r4
        cmpeq   r0, r6
        bne     LAAW32
        tst     r2, #1
        beq     LAAW32
LAAW31:
        ldr     r4, [sp, #0x10]
        add     r2, r2, #1
        subs    r0, r0, r4
        sbc     r8, r8, r1
LAAW32:
        mvn     r1, #2, 2
        cmp     lr, #0
        and     r2, r2, r1
        rsblt   r2, r2, #0
        add     r3, r5, r3
        str     r2, [r12]
        bics    r1, r8, r1
        add     r2, r3, #2
        beq     LAAW33
        rsbs    r0, r0, #0
        rsc     r8, r8, #0
LAAW33:
        mov     r3, #0x33
        orr     r3, r3, #1, 22
        add     r3, r3, #9
        rsb     r2, r2, r3
        clz     r3, r8
        cmp     r3, #0x20
        beq     LAAW39
LAAW34:
        sub     r3, r3, #1
        rsb     r12, r3, #0x20
        mov     r12, r0, lsr r12
        subs    r2, r2, r3
        orr     r8, r12, r8, lsl r3
        mov     r0, r0, lsl r3
        bpl     LAAW36
        rsb     r2, r2, #0
        cmp     r2, #0x20
        blt     LAAW35
        mov     r0, r8
        mov     r8, r8, asr #31
        sub     r2, r2, #0x20
LAAW35:
        cmp     r2, #0x20
        mov     r3, #0x20
        movgt   r2, r3
        mov     r0, r0, lsr r2
        rsb     r3, r2, #0x20
        orr     r0, r0, r8, lsl r3
        mov     r8, r8, asr r2
        mov     r2, #0
LAAW36:
        mov     r3, r0, lsr #9
        mov     r12, r8, lsl #22
        orr     r0, r12, r0, lsr #10
        and     r3, r3, #1
        adds    r0, r3, r0
        mov     r8, r8, lsr #10
        adc     r3, r8, r3, asr #31
        orrs    r12, r3, r3, asr #31
        moveq   r2, #0
        beq     LAAW37
        mov     r12, #0xFF
        orr     r12, r12, #7, 24
        sub     lr, r12, #1
        cmp     lr, r2
        bgt     LAAW37
        mov     r0, #0
        mov     r2, r12
        mov     r3, r0
LAAW37:
        add     r2, r3, r2, lsl #20
        orr     r1, r2, r1
        eor     r1, r7, r1
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAAW38:
        str     r0, [sp, #0x28]
        add     r3, sp, #0x30
        add     r2, sp, #0x28
        add     r1, sp, #0x38
        mov     r0, r3
        str     r4, [sp, #0x2C]
        mov     r3, #0xB5
        bl      __libm_error_support
        ldr     r0, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        b       LAAW7
LAAW39:
        clz     r12, r0
        cmp     r12, #0
        beq     LAAW34
        mov     r8, r0
        sub     r2, r2, #0x20
        mov     r3, r12
        mov     r0, #0
        b       LAAW34
LAAW40:
        cmn     r3, #1
        mov     r3, #0
        bne     LAAW46
        subs    r10, r1, r2
        sbcs    r9, r8, r4
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        beq     LAAW46
        subs    r1, r1, r2, lsl #1
        mov     lr, lr, asr #31
        mov     r2, r2, lsr #31
        orr     r4, r2, r4, lsl #1
        orr     lr, lr, #1
        sbc     r8, r8, r4
        str     lr, [r12]
        mvn     r0, #2, 2
        bics    r12, r8, r0
        beq     LAAW41
        rsbs    r1, r1, #0
        rsc     r8, r8, #0
LAAW41:
        mov     r0, #0xFF
        orr     r2, r0, #7, 24
        sub     r0, r2, #0xF3, 30
        add     r0, r0, #9
        rsb     r5, r5, r0
        clz     r0, r8
        cmp     r0, #0x20
        beq     LAAW47
LAAW42:
        sub     r0, r0, #1
        rsb     lr, r0, #0x20
        mov     lr, r1, lsr lr
        orr     r4, lr, r8, lsl r0
        subs    lr, r5, r0
        mov     r0, r1, lsl r0
        bpl     LAAW44
        rsb     lr, lr, #0
        cmp     lr, #0x20
        blt     LAAW43
        mov     r0, r4
        mov     r4, r4, asr #31
        sub     lr, lr, #0x20
LAAW43:
        cmp     lr, #0x20
        mov     r1, #0x20
        movgt   lr, r1
        mov     r0, r0, lsr lr
        rsb     r1, lr, #0x20
        orr     r0, r0, r4, lsl r1
        mov     r4, r4, asr lr
        mov     lr, r3
LAAW44:
        mov     r1, r0, lsr #9
        mov     r5, r4, lsl #22
        orr     r0, r5, r0, lsr #10
        and     r1, r1, #1
        adds    r0, r1, r0
        mov     r4, r4, lsr #10
        adc     r1, r4, r1, asr #31
        orrs    r4, r1, r1, asr #31
        moveq   lr, r3
        beq     LAAW45
        sub     r4, r2, #1
        cmp     r4, lr
        bgt     LAAW45
        mov     r0, r3
        mov     lr, r2
        mov     r1, r0
LAAW45:
        add     lr, r1, lr, lsl #20
        orr     r12, lr, r12
        eor     r1, r7, r12
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAAW46:
        orr     r1, r6, r7
        str     r3, [r12]
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAAW47:
        clz     lr, r1
        cmp     lr, #0
        beq     LAAW42
        mov     r8, r1
        sub     r5, r5, #0x20
        mov     r0, lr
        mov     r1, r3
        b       LAAW42


