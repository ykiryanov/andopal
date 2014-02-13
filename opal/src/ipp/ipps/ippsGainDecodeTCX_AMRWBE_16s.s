        .text
        .align  4
        .globl  _ippsGainDecodeTCX_AMRWBE_16s


_ippsGainDecodeTCX_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r8, [sp, #0x38]
        ldr     r9, [sp, #0x3C]
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LDES61
        cmp     r8, #0
        beq     LDES61
        cmp     r9, #0
        beq     LDES61
        cmp     r1, #0
        ble     LDES55
        mov     r12, r1, lsl #16
        mov     r11, #0
        mov     r12, r12, asr #16
        cmn     r12, #1
        moveq   lr, #0xF
        beq     LDES2
        cmp     r12, #0
        moveq   lr, r11
        beq     LDES2
        cmp     r12, #0
        blt     LDES56
LDES0:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        bne     LDES1
        ldr     lr, [pc, #0x98C]
        mov     r12, r12, lsl #1
        ldrsh   lr, [lr, +r12]
        b       LDES2
LDES1:
        ldr     r12, [pc, #0x980]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r12, +lr]
LDES2:
        mov     r12, r1, lsl lr
        rsb     lr, lr, #0xF
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #16
        cmp     r1, #0
        mov     r12, r12, asr #16
        mov     lr, lr, asr #16
        ble     LDES7
        mov     r6, r11
        mvn     r10, #2, 2
        mvn     r7, #0
        str     r8, [sp, #8]
        str     r4, [sp, #4]
        str     r5, [sp]
LDES3:
        mov     r3, #0
        mov     r4, #0x10
LDES4:
        ldrsh   r2, [r0]
        mov     r2, r2, lsl #13
        mov     r2, r2, asr #15
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mul     r2, r2, r2
        cmp     r2, #1, 2
        mvneq   r2, #2, 2
        movne   r2, r2, lsl #1
        mov     r5, r3, asr #31
        adds    r3, r3, r2
        adc     r2, r5, r2, asr #31
        subs    r8, r3, r10
        sbcs    r5, r2, #0
        movlt   r8, #0
        movlt   r5, #0
        orrs    r5, r8, r5
        mvnne   r3, #2, 2
        bne     LDES5
        cmp     r3, #2, 2
        sbcs    r2, r2, r7
        movlt   r3, #2, 2
LDES5:
        subs    r4, r4, #1
        add     r0, r0, #2
        bne     LDES4
        mov     r2, r6, asr #31
        mov     r3, r3, asr #5
        adds    r6, r6, r3
        adc     r2, r2, r3, asr #31
        subs    r3, r6, r10
        sbcs    r4, r2, #0
        movlt   r3, #0
        movlt   r4, #0
        orrs    r4, r3, r4
        mvnne   r6, #2, 2
        bne     LDES6
        cmp     r6, #2, 2
        sbcs    r2, r2, r7
        movlt   r6, #2, 2
LDES6:
        add     r11, r11, #0x10
        cmp     r11, r1
        blt     LDES3
        ldr     r8, [sp, #8]
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
        cmp     r6, #0
        bne     LDES8
LDES7:
        mov     r6, #1
LDES8:
        cmp     r6, #0
        mov     r0, #0
        mov     r10, r6
        beq     LDES11
        cmn     r6, #1
        moveq   r6, #2, 2
        moveq   r0, #0x1F
        beq     LDES11
        cmp     r6, #0
        mvnlt   r10, r6
        cmp     r10, #0
        beq     LDES10
        ldr     r0, [pc, #0x840]
        ldr     r1, [pc, #0x840]
        movs    r7, r10, lsr #16
        bne     LDES9
        bic     r10, r10, #0xFF, 8
        bic     r7, r10, #0xFF, 16
        movs    r10, r7, asr #8
        movne   r7, r10, lsl #1
        movne   r0, r1
        moveq   r7, r7, lsl #1
        ldrsh   r7, [r0, +r7]
        add     r0, r7, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDES10
LDES9:
        movs    r10, r10, lsr #24
        movne   r10, r10, lsl #1
        ldrnesh r0, [r1, +r10]
        moveq   r7, r7, lsl #1
        ldreqsh r0, [r0, +r7]
LDES10:
        mov     r6, r6, lsl r0
LDES11:
        mvn     r1, #0xFF
        bic     r7, r1, #0x7F, 24
        mov     r1, r6, asr #16
        sub     r6, r0, #9
        mov     r0, r1, lsl #16
        mvn     r1, r7
        cmp     r1, r6
        mov     r1, r0, asr #16
        mov     r0, #0
        mvnlt   r6, r7
        blt     LDES12
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        sublt   r6, r0, #2, 18
LDES12:
        rsb     r6, r6, #0x1E
        mvn     r10, r7
        cmp     r10, r6
        mvnlt   r6, r7
        blt     LDES13
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        sublt   r6, r0, #2, 18
LDES13:
        cmp     r12, r1
        ble     LDES14
        add     lr, lr, #1
        mvn     r10, r7
        cmp     r10, lr
        mov     r12, r12, asr #1
        mvnlt   lr, r7
        blt     LDES14
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        sublt   lr, r0, #2, 18
LDES14:
        cmp     r12, r1
        bgt     LDES19
        cmp     r12, #0
        blt     LDES19
        cmp     r1, #0
        blt     LDES19
        cmp     r1, #0
        beq     LDES19
        cmp     r12, #0
        beq     LDES19
        cmp     r12, r1
        mvneq   r0, r7
        beq     LDES19
        mvn     r7, r7
        mvn     r2, #2, 2
        mvn     r11, #0
        mov     r10, #0xF
        str     r4, [sp, #4]
        str     r5, [sp]
LDES15:
        mov     r0, r0, lsl #1
        mov     r12, r12, lsl #1
        mov     r0, r0, lsl #16
        cmp     r12, r1
        mov     r0, r0, asr #16
        blt     LDES18
        mov     r3, r12, asr #31
        subs    r12, r12, r1
        sbc     r3, r3, r1, asr #31
        subs    r4, r12, r2
        sbcs    r5, r3, #0
        movlt   r4, #0
        movlt   r5, #0
        orrs    r5, r4, r5
        mvnne   r12, #2, 2
        bne     LDES16
        cmp     r12, #2, 2
        sbcs    r3, r3, r11
        movlt   r12, #2, 2
LDES16:
        add     r0, r0, #1
        cmp     r7, r0
        blt     LDES17
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDES18
LDES17:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDES18:
        subs    r10, r10, #1
        bne     LDES15
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
LDES19:
        mvn     r1, #0xFF
        bic     r7, r1, #0x7F, 24
        sub     lr, lr, r6
        mvn     r1, r7
        cmp     r1, lr
        mov     r10, #0
        mvnlt   r12, r7
        blt     LDES20
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        sublt   r12, r10, #2, 18
LDES20:
        ldr     r6, [pc, #0x654]
        mov     lr, r0
        cmn     lr, #1
        moveq   r0, #0xF
        beq     LDES22
        cmp     lr, #0
        moveq   r0, r10
        beq     LDES22
        cmp     lr, #0
        blt     LDES57
LDES21:
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r1, r0, asr #8
        moveq   r0, r0, lsl #1
        ldreqsh r0, [r6, +r0]
        beq     LDES22
        mov     r0, r1, lsl #1
        ldr     r1, [pc, #0x614]
        ldrsh   r0, [r1, +r0]
LDES22:
        add     r12, r12, r0
        add     r0, r0, #0x10
        mov     lr, lr, lsl r0
        add     r1, sp, #0x10
        add     r0, sp, #0xC
        str     lr, [sp, #0xC]
        strh    r12, [sp, #0x10]
        bl      ownInvSqrt_32s16s_I
        cmp     r4, #0
        mvn     r0, #2, 2
        bne     LDES42
        ldrsh   r12, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        sub     r3, r7, #2, 2
        add     r12, r12, #2
        cmp     r3, r1
        mov     r11, r12, lsl #16
        mvnle   r4, r7
        ble     LDES23
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r4, r1, asr #16
LDES23:
        mov     r1, #0xF3, 28
        mul     r1, r5, r1
        cmp     r1, #1, 2
        movne   r0, r1, lsl #1
        mvn     r1, r7
        and     r1, r1, r0, asr #1
        mov     r5, r0, asr #16
        mov     r0, #0xE
        bl      ownPow2
        mov     r5, r5, lsl #16
        cmp     r0, #0
        mov     r1, r5, asr #16
        mov     r3, r0
        beq     LDES26
        cmn     r0, #1
        moveq   r0, #2, 2
        moveq   r10, #0x1F
        beq     LDES26
        cmp     r0, #0
        mvnlt   r3, r0
        cmp     r3, #0
        beq     LDES25
        movs    r2, r3, lsr #16
        bne     LDES24
        bic     r3, r3, #0xFF, 8
        bic     r2, r3, #0xFF, 16
        movs    r3, r2, asr #8
        ldrne   r6, [pc, #0x544]
        movne   r2, r3, lsl #1
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r6, +r2]
        add     r2, r2, #0x10
        mov     r2, r2, lsl #16
        mov     r10, r2, asr #16
        b       LDES25
LDES24:
        movs    r3, r3, lsr #24
        moveq   r2, r2, lsl #1
        ldreqsh r10, [r6, +r2]
        beq     LDES25
        ldr     r2, [pc, #0x514]
        mov     r3, r3, lsl #1
        ldrsh   r10, [r2, +r3]
LDES25:
        mov     r0, r0, lsl r10
LDES26:
        sub     r2, r1, #0xE
        mov     r0, r0, asr #16
        mvn     r1, r7
        mov     r0, r0, lsl #16
        cmp     r1, r2
        mov     r1, r0, asr #16
        mov     r0, #0
        mvnlt   r2, r7
        blt     LDES27
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        sublt   r2, r0, #2, 18
LDES27:
        add     r10, r2, r10
        mvn     r2, r7
        cmp     r2, r10
        mvnlt   r2, r7
        blt     LDES28
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r2, r10, asr #16
        sublt   r2, r0, #2, 18
LDES28:
        rsb     r2, r2, #0x1F
        mvn     r3, r7
        cmp     r3, r2
        mvnlt   r2, r7
        blt     LDES29
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        sublt   r2, r0, #2, 18
LDES29:
        cmp     r1, r4
        ble     LDES30
        sub     r2, r2, #1
        mvn     r3, r7
        cmp     r3, r2
        mov     r1, r1, asr #1
        mvnlt   r2, r7
        blt     LDES30
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        sublt   r2, r0, #2, 18
LDES30:
        cmp     r1, r4
        bgt     LDES35
        cmp     r1, #0
        blt     LDES35
        cmp     r4, #0
        blt     LDES35
        cmp     r4, #0
        beq     LDES35
        cmp     r1, #0
        beq     LDES35
        cmp     r1, r4
        mvneq   r0, r7
        beq     LDES35
        mvn     r7, r7
        mvn     r5, #2, 2
        mvn     lr, #0
        mov     r12, #0xF
LDES31:
        mov     r0, r0, lsl #1
        mov     r1, r1, lsl #1
        mov     r0, r0, lsl #16
        cmp     r1, r4
        mov     r0, r0, asr #16
        blt     LDES34
        mov     r3, r1, asr #31
        subs    r1, r1, r4
        sbc     r3, r3, r4, asr #31
        subs    r6, r1, r5
        sbcs    r10, r3, #0
        movlt   r6, #0
        movlt   r10, #0
        orrs    r10, r6, r10
        mvnne   r1, #2, 2
        bne     LDES32
        cmp     r1, #2, 2
        sbcs    r3, r3, lr
        movlt   r1, #2, 2
LDES32:
        add     r0, r0, #1
        cmp     r7, r0
        blt     LDES33
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDES34
LDES33:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDES34:
        subs    r12, r12, #1
        bne     LDES31
LDES35:
        mvn     r1, #0xFF
        bic     r3, r1, #0x7F, 24
        add     r11, r2, r11, asr #16
        mvn     r1, r3
        cmp     r1, r11
        mov     r5, #0
        mvnlt   r1, r3
        blt     LDES36
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r1, r11, asr #16
        sublt   r1, r5, #2, 18
LDES36:
        rsb     r1, r1, #0x1F
        mvn     r2, r3
        cmp     r2, r1
        mvnlt   r2, r3
        blt     LDES37
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r2, r1, asr #16
        sublt   r2, r5, #2, 18
LDES37:
        cmp     r2, #0
        mvn     r4, #2, 2
        mov     r12, #2, 2
        rsble   r1, r2, #0
        movle   r1, r0, asr r1
        ble     LDES38
        bic     r1, r2, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        cmp     r0, r4, asr r1
        movgt   r1, r4
        bgt     LDES38
        cmp     r0, r12, asr r1
        movge   r1, r0, lsl r1
        movlt   r1, r12
LDES38:
        ldrsh   r6, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        rsbs    r7, r6, #0x10
        movpl   r7, lr, asr r7
        movpl   r12, r7, asr #16
        bmi     LDES58
LDES39:
        mov     r12, r12, lsl #16
        cmp     r2, #0
        mov     r12, r12, asr #16
        ble     LDES41
        mul     r12, r0, r12
        bic     r2, r2, #0xFF, 8
        bic     r0, r2, #0xFF, 16
        mov     r12, r12, asr #15
        mov     r2, r12, lsl #16
        mvn     r12, r3
        mov     r2, r2, asr #16
        cmp     r2, r12, asr r0
        sub     r12, r5, #2, 18
        mvngt   r5, r3
        bgt     LDES40
        cmp     r2, r12, asr r0
        sublt   r5, r5, #2, 18
        blt     LDES40
        mov     r0, r2, lsl r0
        mov     r0, r0, lsl #16
        mov     r5, r0, asr #16
LDES40:
        strh    r5, [r8]
        b       LDES54
LDES41:
        mul     r12, r0, r12
        rsb     r2, r2, #0
        mov     r12, r12, asr #15
        mov     r2, r12, asr r2
        strh    r2, [r8]
        b       LDES54
LDES42:
        ldrsh   r1, [r8]
        mov     r2, #0x9A
        orr     r2, r2, #0x59, 24
        mul     r2, r1, r2
        add     r1, r2, #1, 18
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r3, r1, asr #16
        mov     r2, r3
        cmp     r2, #0
        strneh  r3, [r8]
        bne     LDES43
        mov     r2, #1
        mov     r3, r2
        strh    r3, [r8]
LDES43:
        cmn     r2, #1
        mov     r1, #0xF
        moveq   r6, r1
        beq     LDES45
        cmp     r2, #0
        moveq   r6, r10
        beq     LDES45
        cmp     r2, #0
        blt     LDES60
LDES44:
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    r12, r3, asr #8
        moveq   r3, r3, lsl #1
        ldreqsh r6, [r6, +r3]
        beq     LDES45
        ldr     r3, [pc, #0x200]
        mov     r12, r12, lsl #1
        ldrsh   r6, [r3, +r12]
LDES45:
        ldr     r3, [sp, #0xC]
        mov     r12, r2, lsl r6
        sub     lr, r7, #2, 2
        cmp     lr, r3
        mov     lr, r12, lsl #16
        rsb     r2, r6, #0xF
        mov     r12, r2, lsl #16
        mov     r2, lr, asr #16
        mov     lr, r12, asr #16
        mvnle   r12, r7
        ble     LDES46
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r12, r3, asr #16
LDES46:
        cmp     r2, r12
        ble     LDES47
        add     lr, lr, #1
        mvn     r3, r7
        cmp     r3, lr
        mov     r2, r2, asr #1
        mvnlt   lr, r7
        blt     LDES47
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        sublt   lr, r10, #2, 18
LDES47:
        ldrsh   r3, [sp, #0x10]
        cmp     r2, r12
        sub     lr, lr, r3
        mov     r3, lr, lsl #16
        mov     r3, r3, asr #16
        bgt     LDES52
        cmp     r2, #0
        blt     LDES52
        cmp     r12, #0
        blt     LDES52
        cmp     r12, #0
        beq     LDES52
        cmp     r2, #0
        beq     LDES52
        cmp     r2, r12
        mvneq   r10, r7
        beq     LDES52
        mvn     r4, #0
        mvn     lr, r7
LDES48:
        mov     r10, r10, lsl #1
        mov     r2, r2, lsl #1
        mov     r5, r10, lsl #16
        cmp     r2, r12
        mov     r10, r5, asr #16
        blt     LDES51
        mov     r5, r2, asr #31
        subs    r2, r2, r12
        sbc     r5, r5, r12, asr #31
        subs    r8, r2, r0
        sbcs    r6, r5, #0
        movlt   r8, #0
        movlt   r6, #0
        orrs    r6, r8, r6
        movne   r2, r0
        bne     LDES49
        cmp     r2, #2, 2
        sbcs    r5, r5, r4
        movlt   r2, #2, 2
LDES49:
        add     r10, r10, #1
        cmp     lr, r10
        blt     LDES50
        cmn     r10, #2, 18
        movge   r5, r10, lsl #16
        movge   r10, r5, asr #16
        movlt   r10, r7
        b       LDES51
LDES50:
        mov     r5, #0
        sub     r5, r5, #2, 18
        mvn     r10, r5
LDES51:
        subs    r1, r1, #1
        bne     LDES48
LDES52:
        add     r0, r3, #1
        cmp     r0, #0
        ble     LDES53
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        mvn     r2, #2, 2
        cmp     r10, r2, asr r0
        mov     r1, #2, 2
        movgt   r1, r2
        bgt     LDES54
        cmp     r10, r1, asr r0
        movge   r1, r10, lsl r0
        b       LDES54
LDES53:
        mvn     r0, #0
        rsb     r0, r3, r0
        mov     r1, r10, asr r0
LDES54:
        mov     r0, #0
        str     r1, [r9]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDES55:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDES56:
        mvn     r12, r12
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDES0
LDES57:
        mvn     r0, lr
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDES21
LDES58:
        sub     r6, r6, #0x10
        bic     r6, r6, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        cmp     lr, r4, asr r6
        movgt   r12, r4
        bgt     LDES59
        cmp     lr, r12, asr r6
        movge   r12, lr, lsl r6
LDES59:
        mov     r12, r12, asr #16
        b       LDES39
LDES60:
        mvn     r3, r2
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDES44
LDES61:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable


