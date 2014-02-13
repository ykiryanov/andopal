        .text
        .align  4
        .globl  ownAdaptiveCodebookDecode_WB_WBE


ownAdaptiveCodebookDecode_WB_WBE:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r9, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        ldr     r8, [sp, #0x34]
        str     r9, [sp, #8]
        ldr     r9, [sp, #0x48]
        ldr     r7, [sp, #0x38]
        ldr     lr, [sp, #0x3C]
        mov     r5, r2
        str     r9, [sp, #0xC]
        ldrsh   r10, [r5]
        ldr     r9, [sp, #0x4C]
        cmp     r12, #0x1A
        str     r10, [sp, #4]
        mov     r4, r1
        mov     r6, r3
        beq     LDLZ18
        cmp     r12, #5
        beq     LDLZ17
        cmp     r12, #9
        beq     LDLZ17
        cmp     r12, #0x19
        beq     LDLZ17
        mov     r2, #0
        mov     r9, #0x22
        mov     r11, #0xE7
        mov     r10, #0x80
        mov     r1, #0xA0
LDLZ0:
        mov     r3, r7, lsl #16
        cmp     r7, #2
        mov     r3, r3, asr #16
        beq     LDLZ16
LDLZ1:
        cmp     r2, #0
        beq     LDLZ3
        cmp     lr, #0
        beq     LDLZ3
        ldrsh   r0, [r6]
        add     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #3
        strleh  r0, [r6]
        ldrlesh r0, [r5]
        ble     LDLZ2
        sub     r0, r0, #4
        strh    r0, [r6]
        ldrsh   r0, [r5]
        add     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        strh    r0, [r5]
LDLZ2:
        cmp     r0, r11
        ldrltsh r12, [r6]
        blt     LDLZ9
        sub     r11, r11, #5
        mov     r11, r11, lsl #16
        mov     r0, r11, asr #16
        strh    r0, [r5]
        ldrsh   r12, [r6]
        b       LDLZ9
LDLZ3:
        cmp     r3, #0
        bne     LDLZ7
        cmp     r12, #5
        beq     LDLZ13
        cmp     r12, #9
        beq     LDLZ13
        cmp     r12, #0x19
        beq     LDLZ13
        sub     r12, r10, r9
        cmp     r0, r12, lsl #2
        bge     LDLZ4
        add     r12, r9, r0, asr #2
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5]
        sub     r12, r12, r9
        sub     r0, r0, r12, lsl #2
        strh    r0, [r6]
        b       LDLZ6
LDLZ4:
        sub     r7, r0, r12, lsl #2
        sub     r3, r1, r10
        str     r7, [sp]
        mov     r7, r3, lsl #1
        add     r12, r7, r12, lsl #2
        cmp     r0, r12
        bge     LDLZ5
        ldr     r0, [sp]
        add     r12, r10, r0, asr #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        sub     r10, r12, r10
        sub     r0, r0, r10, lsl #1
        strh    r12, [r5]
        mov     r0, r0, lsl #1
        strh    r0, [r6]
        b       LDLZ6
LDLZ5:
        ldr     r0, [sp]
        sub     r1, r1, r7
        add     r1, r0, r1
        strh    r1, [r5]
        mov     r0, #0
        strh    r0, [r6]
LDLZ6:
        ldrsh   r0, [r5]
        sub     r0, r0, #8
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r9
        movgt   r9, r0
        add     r0, r9, #0xF
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r11
        strleh  r0, [r8, #2]
        strleh  r9, [r8]
        ble     LDLZ8
        strh    r11, [r8, #2]
        sub     r11, r11, #0xF
        strh    r11, [r8]
        b       LDLZ8
LDLZ7:
        cmp     r12, #5
        beq     LDLZ15
        cmp     r12, #9
        beq     LDLZ15
        cmp     r12, #0x19
        beq     LDLZ15
        ldrsh   r12, [r8]
        add     r12, r12, r0, asr #2
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5]
        ldrsh   r8, [r8]
        sub     r12, r12, r8
        sub     r0, r0, r12, lsl #2
        strh    r0, [r6]
LDLZ8:
        cmp     r2, #0
        ldrnesh r0, [r5]
        ldrnesh r12, [r6]
        bne     LDLZ9
        cmp     lr, #0
        ldreqsh r0, [r5]
        ldreqsh r12, [r6]
        beq     LDLZ9
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r5
        mov     r0, r0, lsl #16
        mov     r3, r0, asr #16
        ldr     r0, [sp, #0xC]
        bl      LDLZ_ownLagConcealment
        mov     r12, #0
        strh    r12, [r6]
        ldrsh   r0, [r5]
LDLZ9:
        cmp     r12, #0
        sub     r0, r4, r0, lsl #1
        ble     LDLZ10
        rsb     r12, r12, #4
        sub     r0, r0, #2
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDLZ10:
        ldr     r6, [pc, #0x868]
        rsb     r12, r12, #3
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mov     r3, r12, lsl #6
        sub     r0, r0, #0x1E
        mov     r7, #0
        add     r5, r6, r3
        mvn     lr, r2
        mov     r12, #0x41
LDLZ11:
        ldrsh   r11, [r6, +r3]
        ldrsh   r8, [r0]
        ldrsh   r10, [r5, #2]
        ldrsh   r9, [r0, #2]
        mul     r11, r11, r8
        ldrsh   r8, [r0, #4]
        mla     r11, r10, r9, r11
        ldrsh   r10, [r5, #4]
        ldrsh   r9, [r0, #6]
        mla     r10, r10, r8, r11
        ldrsh   r11, [r5, #6]
        ldrsh   r8, [r0, #8]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #8]
        ldrsh   r9, [r0, #0xA]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0xA]
        ldrsh   r8, [r0, #0xC]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0xC]
        ldrsh   r9, [r0, #0xE]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0xE]
        ldrsh   r8, [r0, #0x10]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x10]
        ldrsh   r9, [r0, #0x12]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x12]
        ldrsh   r8, [r0, #0x14]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x14]
        ldrsh   r9, [r0, #0x16]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x16]
        ldrsh   r8, [r0, #0x18]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x18]
        ldrsh   r9, [r0, #0x1A]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x1A]
        ldrsh   r8, [r0, #0x1C]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x1C]
        ldrsh   r9, [r0, #0x1E]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x1E]
        ldrsh   r8, [r0, #0x20]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x20]
        ldrsh   r9, [r0, #0x22]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x22]
        ldrsh   r8, [r0, #0x24]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x24]
        ldrsh   r9, [r0, #0x26]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x26]
        ldrsh   r8, [r0, #0x28]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x28]
        ldrsh   r9, [r0, #0x2A]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x2A]
        ldrsh   r8, [r0, #0x2C]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x2C]
        ldrsh   r9, [r0, #0x2E]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x2E]
        ldrsh   r8, [r0, #0x30]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x30]
        ldrsh   r9, [r0, #0x32]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x32]
        ldrsh   r8, [r0, #0x34]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x34]
        ldrsh   r9, [r0, #0x36]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x36]
        ldrsh   r8, [r0, #0x38]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x38]
        ldrsh   r9, [r0, #0x3A]
        mla     r10, r11, r8, r10
        ldrsh   r11, [r5, #0x3A]
        ldrsh   r8, [r0, #0x3C]
        mla     r10, r11, r9, r10
        ldrsh   r11, [r5, #0x3C]
        ldrsh   r9, [r5, #0x3E]
        mla     r10, r11, r8, r10
        ldrsh   r8, [r0, #0x3E]
        mla     r10, r9, r8, r10
        add     r8, r10, #2, 20
        mov     r8, r8, asr #14
        cmp     lr, r8
        sublt   r8, r7, #2, 18
        mvnlt   r8, r8
        blt     LDLZ12
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, r2
LDLZ12:
        strh    r8, [r4], #2
        subs    r12, r12, #1
        add     r0, r0, #2
        bne     LDLZ11
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDLZ13:
        sub     r12, r1, r9
        cmp     r0, r12, lsl #1
        bge     LDLZ14
        add     r12, r9, r0, asr #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5]
        sub     r12, r12, r9
        sub     r0, r0, r12, lsl #1
        mov     r0, r0, lsl #1
        strh    r0, [r6]
        b       LDLZ6
LDLZ14:
        add     r0, r0, r9, lsl #1
        sub     r0, r0, r1
        strh    r0, [r5]
        mov     r0, #0
        strh    r0, [r6]
        b       LDLZ6
LDLZ15:
        ldrsh   r12, [r8]
        add     r12, r12, r0, asr #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r5]
        ldrsh   r8, [r8]
        sub     r12, r12, r8
        sub     r0, r0, r12, lsl #1
        mov     r0, r0, lsl #1
        strh    r0, [r6]
        b       LDLZ8
LDLZ16:
        cmp     r12, #5
        beq     LDLZ1
        cmp     r12, #0x19
        movne   r3, #0
        b       LDLZ1
LDLZ17:
        mov     r2, #0
        mov     r9, #0x22
        mov     r11, #0xE7
        mov     r10, #0x80
        mov     r1, #0x5C
        b       LDLZ0
LDLZ18:
        add     r10, r9, r9, lsl #2
        add     r10, r9, r10
        add     r11, r9, #0x22
        rsb     r9, r9, #0x80
        add     r10, r10, #0xE7
        mov     r11, r11, lsl #16
        mov     r1, r9, lsl #16
        mov     r10, r10, lsl #16
        mov     r9, r11, asr #16
        mov     r11, r10, asr #16
        mov     r10, r1, asr #16
        mov     r1, #0xA0
        mov     r2, #1
        b       LDLZ0
LDLZ_ownLagConcealment:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r5, r0
        ldrsh   lr, [r5, #0xC]
        ldrsh   r10, [r5, #8]
        ldrsh   r9, [r5, #6]
        str     lr, [sp]
        add     r0, sp, #0x10
        mov     r6, r2
        mov     lr, #0
        strh    lr, [sp, #8]
        mov     r2, r0
        add     r4, r5, #0xC
        mov     r11, r1
        mov     r1, #5
        mov     r0, r4
        mov     r7, r3
        bl      _ippsMin_16s
        add     r2, sp, #0x14
        mov     r1, #5
        mov     r0, r4
        bl      _ippsMax_16s
        add     r2, sp, #0xC
        mov     r1, #5
        mov     r0, r5
        bl      _ippsMin_16s
        ldrsh   lr, [sp, #0x14]
        ldrsh   r12, [sp, #0x10]
        mov     r3, #0xAB
        cmp     r7, #0
        orr     r7, r3, #0x2A, 24
        mov     r3, #0x19
        orr     r3, r3, #0x36, 24
        str     r3, [sp, #4]
        sub     r3, lr, r12
        mov     r8, r3, lsl #16
        beq     LDLZ27
        ldrsh   r3, [sp, #0xC]
        cmp     r3, #2, 20
        ble     LDLZ19
        cmp     r8, #0xA, 16
        blt     LDLZ26
LDLZ19:
        cmp     r10, #2, 20
        ble     LDLZ20
        cmp     r9, #2, 20
        ldrgtsh r11, [r5, #0xC]
        bgt     LDLZ26
LDLZ20:
        add     r1, sp, #0x18
        mov     r0, r4
        mov     r2, #5
        bl      _ippsCopy_16s
        mov     r12, #1
        mov     r3, #2
LDLZ21:
        add     r1, sp, #0x18
        ldrsh   r1, [r1, +r3]
        subs    lr, r12, #1
        bmi     LDLZ25
        cmp     lr, #6
        blt     LDLZ23
LDLZ22:
        mov     r8, lr, lsl #1
        add     r4, sp, #0x18
        ldrsh   r8, [r4, +r8]
        cmp     r1, r8
        bge     LDLZ25
        add     r9, sp, #0x18
        add     r9, r9, lr, lsl #1
        strh    r8, [r9, #2]
        sub     lr, lr, #1
        add     r4, sp, #0x18
        mov     r8, lr, lsl #1
        ldrsh   r8, [r4, +r8]
        cmp     r1, r8
        bge     LDLZ25
        add     r9, sp, #0x18
        add     r9, r9, lr, lsl #1
        strh    r8, [r9, #2]
        sub     lr, lr, #1
        add     r4, sp, #0x18
        mov     r8, lr, lsl #1
        ldrsh   r8, [r4, +r8]
        cmp     r1, r8
        bge     LDLZ25
        add     r9, sp, #0x18
        add     r9, r9, lr, lsl #1
        strh    r8, [r9, #2]
        sub     lr, lr, #1
        add     r4, sp, #0x18
        mov     r8, lr, lsl #1
        ldrsh   r8, [r4, +r8]
        cmp     r1, r8
        bge     LDLZ25
        add     r9, sp, #0x18
        add     r9, r9, lr, lsl #1
        strh    r8, [r9, #2]
        add     r4, sp, #0x18
        sub     lr, lr, #1
        mov     r8, lr, lsl #1
        ldrsh   r4, [r4, +r8]
        cmp     r1, r4
        bge     LDLZ25
        add     r8, sp, #0x18
        add     r8, r8, lr, lsl #1
        sub     lr, lr, #1
        cmp     lr, #6
        strh    r4, [r8, #2]
        bge     LDLZ22
LDLZ23:
        mov     r4, lr, lsl #1
LDLZ24:
        add     r8, sp, #0x18
        ldrsh   r8, [r8, +r4]
        cmp     r1, r8
        bge     LDLZ25
        add     r9, sp, #0x18
        add     r9, r9, r4
        subs    lr, lr, #1
        strh    r8, [r9, #2]
        sub     r4, r4, #2
        bpl     LDLZ24
LDLZ25:
        add     r4, sp, #0x18
        add     r12, r12, #1
        add     lr, r4, lr, lsl #1
        cmp     r12, #5
        strh    r1, [lr, #2]
        add     r3, r3, #2
        blt     LDLZ21
        add     r1, sp, #0x18
        ldrsh   r1, [r1, #4]
        add     lr, sp, #0x18
        ldrsh   r4, [lr, #8]
        ldrsh   r3, [r5, #0xA]
        add     r12, sp, #0x18
        ldrsh   r9, [r12, #6]
        ldrsh   lr, [sp, #0x14]
        ldrsh   r12, [sp, #0x10]
        sub     r8, r4, r1
        add     r9, r1, r9
        add     r1, r9, r4
        mov     r4, #0x4D
        orr     r4, r4, #0x1F, 22
        mul     r4, r3, r4
        mov     r8, r8, lsl #16
        mov     r3, #0x28
        mov     r8, r8, asr #16
        cmp     r8, #0x28
        movlt   r3, r8
        ldr     r8, [sp, #4]
        mov     r3, r3, lsl #16
        add     r8, r4, r8
        mov     r4, r1, lsl #16
        mov     r3, r3, asr #17
        mov     r1, r8, lsl #16
        mov     r4, r4, asr #16
        mul     r7, r4, r7
        mov     r1, r1, asr #16
        mov     r3, r3, lsl #16
        strh    r1, [r5, #0xA]
        mov     r3, r3, asr #16
        mul     r1, r3, r1
        mov     r7, r7, asr #15
        add     r1, r7, r1, asr #15
        mov     r0, r1, lsl #16
        mov     r11, r0, asr #16
LDLZ26:
        cmp     r11, lr
        movlt   lr, r11
        cmp     lr, r12
        movgt   r12, lr
        b       LDLZ40
LDLZ27:
        add     r2, sp, #8
        mov     r3, #0
        mov     r1, #5
        mov     r0, r4
        bl      _ippsSum_16s_Sfs
        ldrsh   r1, [sp, #8]
        mov     r3, #0x9A
        orr     r3, r3, #0x19, 24
        mul     lr, r1, r3
        ldr     r3, [sp]
        ldrsh   r12, [r6]
        ldrsh   r1, [sp, #0x14]
        mov     lr, lr, asr #15
        cmp     r8, #0xA, 16
        sub     r3, r12, r3
        mov     lr, lr, lsl #16
        sub     r11, r12, r1
        mov     r0, r3, lsl #16
        mov     r3, lr, asr #16
        mov     r11, r11, lsl #16
        mov     lr, r0, asr #16
        bge     LDLZ28
        ldrsh   r0, [sp, #0x10]
        sub     r0, r0, #5
        cmp     r12, r0
        ble     LDLZ28
        cmp     r11, #5, 16
        addlt   sp, sp, #0x24
        ldmltia sp!, {r4 - r11, pc}
LDLZ28:
        cmp     r10, #2, 20
        ble     LDLZ29
        cmp     r9, #2, 20
        ble     LDLZ29
        add     r11, lr, #0xA
        cmp     r11, #0
        ble     LDLZ29
        cmp     lr, #0xA
        addlt   sp, sp, #0x24
        ldmltia sp!, {r4 - r11, pc}
LDLZ29:
        ldrsh   lr, [sp, #0xC]
        mov     r11, #0x9A
        orr     r11, r11, #0x19, 24
        cmp     r11, lr
        ble     LDLZ30
        cmp     r10, lr
        bne     LDLZ30
        ldrsh   r11, [sp, #0x10]
        cmp     r12, r11
        ble     LDLZ30
        cmp     r12, r1
        addlt   sp, sp, #0x24
        ldmltia sp!, {r4 - r11, pc}
LDLZ30:
        cmp     r8, #0x46, 16
        bge     LDLZ31
        ldrsh   r11, [sp, #0x10]
        cmp     r12, r11
        ble     LDLZ31
        cmp     r12, r1
        addlt   sp, sp, #0x24
        ldmltia sp!, {r4 - r11, pc}
LDLZ31:
        cmp     r12, r3
        ble     LDLZ32
        cmp     r12, r1
        addlt   sp, sp, #0x24
        ldmltia sp!, {r4 - r11, pc}
LDLZ32:
        cmp     lr, #2, 20
        mov     lr, #0
        mov     r12, lr
        mov     r11, #1
        movgt   r12, r11
        cmp     r8, #0xA, 16
        movlt   lr, r11
        tst     r12, lr
        ldrnesh r5, [r5, #0xC]
        bne     LDLZ39
        cmp     r10, #2, 20
        ble     LDLZ33
        cmp     r9, #2, 20
        ldrgtsh r5, [r5, #0xC]
        bgt     LDLZ39
LDLZ33:
        add     r1, sp, #0x18
        strh    r3, [sp, #8]
        mov     r0, r4
        mov     r2, #5
        bl      _ippsCopy_16s
        mov     r3, #2
LDLZ34:
        add     r1, sp, #0x18
        ldrsh   r1, [r1, +r3]
        subs    r12, r11, #1
        bmi     LDLZ38
        cmp     r12, #6
        blt     LDLZ36
LDLZ35:
        mov     r4, r12, lsl #1
        add     lr, sp, #0x18
        ldrsh   r4, [lr, +r4]
        cmp     r1, r4
        bge     LDLZ38
        add     r8, sp, #0x18
        add     r8, r8, r12, lsl #1
        strh    r4, [r8, #2]
        sub     r12, r12, #1
        add     lr, sp, #0x18
        mov     r4, r12, lsl #1
        ldrsh   r4, [lr, +r4]
        cmp     r1, r4
        bge     LDLZ38
        add     r8, sp, #0x18
        add     r8, r8, r12, lsl #1
        strh    r4, [r8, #2]
        sub     r12, r12, #1
        add     lr, sp, #0x18
        mov     r4, r12, lsl #1
        ldrsh   r4, [lr, +r4]
        cmp     r1, r4
        bge     LDLZ38
        add     r8, sp, #0x18
        add     r8, r8, r12, lsl #1
        strh    r4, [r8, #2]
        sub     r12, r12, #1
        add     lr, sp, #0x18
        mov     r4, r12, lsl #1
        ldrsh   r4, [lr, +r4]
        cmp     r1, r4
        bge     LDLZ38
        add     r8, sp, #0x18
        add     r8, r8, r12, lsl #1
        strh    r4, [r8, #2]
        add     lr, sp, #0x18
        sub     r12, r12, #1
        mov     r4, r12, lsl #1
        ldrsh   lr, [lr, +r4]
        cmp     r1, lr
        bge     LDLZ38
        add     r4, sp, #0x18
        add     r4, r4, r12, lsl #1
        sub     r12, r12, #1
        cmp     r12, #6
        strh    lr, [r4, #2]
        bge     LDLZ35
LDLZ36:
        mov     lr, r12, lsl #1
LDLZ37:
        add     r4, sp, #0x18
        ldrsh   r4, [r4, +lr]
        cmp     r1, r4
        bge     LDLZ38
        add     r8, sp, #0x18
        add     r8, r8, lr
        subs    r12, r12, #1
        strh    r4, [r8, #2]
        sub     lr, lr, #2
        bpl     LDLZ37
LDLZ38:
        add     lr, sp, #0x18
        add     r11, r11, #1
        add     r12, lr, r12, lsl #1
        cmp     r11, #5
        strh    r1, [r12, #2]
        add     r3, r3, #2
        blt     LDLZ34
        ldrsh   lr, [r5, #0xA]
        mov     r8, #0x4D
        add     r12, sp, #0x18
        ldrsh   r12, [r12, #4]
        add     r3, sp, #0x18
        ldrsh   r3, [r3, #8]
        orr     r8, r8, #0x1F, 22
        mul     lr, lr, r8
        add     r1, sp, #0x18
        ldrsh   r4, [r1, #6]
        ldrsh   r1, [sp, #0x14]
        sub     r8, r3, r12
        add     r4, r12, r4
        add     r3, r4, r3
        ldr     r4, [sp, #4]
        mov     r12, r8, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0x28
        add     lr, lr, r4
        mov     r4, r3, lsl #16
        mov     r3, #0x28
        movlt   r3, r12
        mov     lr, lr, lsl #16
        mov     r4, r4, asr #16
        mul     r7, r4, r7
        mov     r3, r3, asr #1
        mov     lr, lr, asr #16
        mul     r3, r3, lr
        mov     r7, r7, asr #15
        strh    lr, [r5, #0xA]
        add     r3, r7, r3, asr #15
        mov     r0, r3, lsl #16
        mov     r5, r0, asr #16
LDLZ39:
        ldrsh   r12, [sp, #0x10]
        cmp     r5, r1
        movlt   r1, r5
        cmp     r1, r12
        movgt   r12, r1
LDLZ40:
        strh    r12, [r6]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   inter4_2Tbl


