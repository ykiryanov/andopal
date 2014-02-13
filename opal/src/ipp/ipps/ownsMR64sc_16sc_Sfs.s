        .text
        .align  4
        .globl  ownsMR64sc_16sc_Sfs


ownsMR64sc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     lr, [sp, #0x7C]
        ldr     r12, [sp, #0x78]
        ldr     r6, [sp, #0x88]
        str     lr, [sp, #0x38]
        ldr     lr, [sp, #0x80]
        cmp     r2, #0
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x84]
        str     r0, [sp, #0x10]
        str     lr, [sp, #0x18]
        mov     r7, r12
        mov     lr, r3
        ble     LBVI42
        cmp     r6, #0x1F
        mov     r4, r6
        mov     r0, #0x1F
        movgt   r4, r0
        cmn     r4, #0x1F
        mvn     r0, #0x1E
        movlt   r4, r0
        add     r11, r1, #8
        rsb     r0, r4, #0
        str     r11, [sp, #8]
        add     r11, r1, #0xC
        sub     r8, r0, #1
        mov     r9, #1
        mov     r10, r9, lsl r8
        str     r11, [sp, #0xC]
        mvn     r5, #0xFF
        mov     r11, r0, asr #31
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x14]
        str     r11, [sp]
        bic     r5, r5, #0x7F, 24
        mov     r8, #0
        add     r9, r1, #4
        sub     r10, r10, #1
        mvn     r11, #0
        mvn     r5, r5
        str     r11, [sp, #4]
        str     r10, [sp, #0x4C]
        str     r0, [sp, #0x48]
        str     r9, [sp, #0x40]
        str     r8, [sp, #0x3C]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x34]
        str     r3, [sp, #0x30]
        str     r2, [sp, #0x2C]
        str     r1, [sp, #0x28]
LBVI0:
        ldr     r1, [sp, #0x24]
        cmp     r7, #0
        ldr     r0, [r1], #4
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x38]
        add     r3, r0, r1
        ble     LBVI46
        ldr     r12, [sp, #0x10]
        mov     r0, #0
        mov     r9, r0
        add     r3, r12, r3, lsl #2
        ldr     r12, [sp, #0x20]
        str     r4, [sp, #0x44]
        ldr     r4, [sp, #0x20]
        mov     r8, r9
        mov     r11, r8
        mov     r10, r11
        sub     r12, r12, #2
        add     r3, r3, #2
        mov     lr, r7
        str     r5, [sp, #0x50]
        str     r6, [sp, #0x1C]
LBVI1:
        ldrsh   r2, [r4, +r0]
        ldrsh   r5, [r3, #-2]
        ldrsh   r1, [r3], #4
        ldrsh   r6, [r12, #4]!
        add     r0, r0, #4
        mul     r7, r5, r2
        mul     r2, r1, r2
        mul     r1, r6, r1
        mla     r2, r5, r6, r2
        sub     r7, r7, r1
        adds    r11, r7, r11
        adc     r10, r10, r7, asr #31
        adds    r9, r2, r9
        adc     r8, r8, r2, asr #31
        subs    lr, lr, #1
        bne     LBVI1
        ldr     r5, [sp, #0x50]
        ldr     r4, [sp, #0x44]
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
LBVI2:
        cmp     r6, #0
        beq     LBVI4
        cmp     r4, #0
        ble     LBVI3
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r11, r0
        mov     r10, r1
        b       LBVI4
LBVI3:
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp]
        bl      __ashrdi3
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        adds    r11, r3, r11
        adc     r3, r10, r3, asr #31
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r1, r3, #0
        ldr     r3, [sp]
        bl      __ashrdi3
        mov     r11, r0
        mov     r10, r1
LBVI4:
        subs    r3, r11, r5
        sbcs    r12, r10, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI5
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r11, r3
        ldr     r3, [sp, #4]
        sbcs    r10, r10, r3
        movge   r11, r11, lsl #16
        movge   r3, r11, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVI6
LBVI5:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVI6:
        ldr     r12, [sp, #0x28]
        cmp     r6, #0
        strh    r3, [r12]
        beq     LBVI8
        cmp     r4, #0
        ble     LBVI7
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        mov     r8, r1
        b       LBVI8
LBVI7:
        mov     r0, r9
        mov     r1, r8
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp]
        mov     r2, r11
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [sp, #0x4C]
        and     r0, r0, #1
        mov     r2, r11
        adds    r9, r9, r12
        adc     r12, r8, r12, asr #31
        adds    r0, r9, r0
        adc     r1, r12, #0
        mov     r3, r10
        bl      __ashrdi3
        mov     r9, r0
        mov     r8, r1
LBVI8:
        subs    r3, r9, r5
        sbcs    r12, r8, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI9
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r9, r3
        ldr     r3, [sp, #4]
        sbcs    r8, r8, r3
        movge   r9, r9, lsl #16
        movge   r0, r9, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVI10
LBVI9:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVI10:
        ldr     r1, [sp, #0x28]
        cmp     r7, #0
        strh    r0, [r1, #2]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r0, [r0]
        add     r1, r1, r7, lsl #2
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x38]
        add     r3, r1, r0
        ble     LBVI45
        ldr     r12, [sp, #0x10]
        mov     r10, #0
        mov     r9, r10
        add     r3, r12, r3, lsl #2
        ldr     r12, [sp, #0x20]
        mov     r8, r9
        mov     r11, r8
        add     r3, r3, #2
        add     r12, r12, #2
        mov     lr, r7
        str     r6, [sp, #0x1C]
LBVI11:
        ldrsh   r6, [r12, #-2]
        ldrsh   r7, [r3, #-2]
        ldrsh   r2, [r3], #4
        ldrsh   r0, [r12], #4
        mul     r1, r7, r6
        mul     r6, r2, r6
        mul     r2, r0, r2
        mla     r6, r7, r0, r6
        sub     r1, r1, r2
        adds    r11, r1, r11
        adc     r10, r10, r1, asr #31
        adds    r9, r6, r9
        adc     r8, r8, r6, asr #31
        subs    lr, lr, #1
        bne     LBVI11
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
LBVI12:
        cmp     r6, #0
        beq     LBVI14
        cmp     r4, #0
        ble     LBVI13
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r11, r0
        mov     r10, r1
        b       LBVI14
LBVI13:
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp]
        bl      __ashrdi3
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        adds    r11, r3, r11
        adc     r3, r10, r3, asr #31
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r1, r3, #0
        ldr     r3, [sp]
        bl      __ashrdi3
        mov     r11, r0
        mov     r10, r1
LBVI14:
        subs    r3, r11, r5
        sbcs    r12, r10, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI15
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r11, r3
        ldr     r3, [sp, #4]
        sbcs    r10, r10, r3
        movge   r11, r11, lsl #16
        movge   r3, r11, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVI16
LBVI15:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVI16:
        ldr     r12, [sp, #0x40]
        cmp     r6, #0
        strh    r3, [r12]
        beq     LBVI18
        cmp     r4, #0
        ble     LBVI17
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        mov     r8, r1
        b       LBVI18
LBVI17:
        mov     r0, r9
        mov     r1, r8
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp]
        mov     r2, r11
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [sp, #0x4C]
        and     r0, r0, #1
        mov     r2, r11
        adds    r9, r9, r12
        adc     r12, r8, r12, asr #31
        adds    r0, r9, r0
        adc     r1, r12, #0
        mov     r3, r10
        bl      __ashrdi3
        mov     r9, r0
        mov     r8, r1
LBVI18:
        subs    r3, r9, r5
        sbcs    r12, r8, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI19
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r9, r3
        ldr     r3, [sp, #4]
        sbcs    r8, r8, r3
        movge   r9, r9, lsl #16
        movge   r0, r9, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVI20
LBVI19:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVI20:
        ldr     r1, [sp, #0x40]
        cmp     r7, #0
        strh    r0, [r1, #2]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r0, [r0, #4]
        add     r1, r1, r7, lsl #2
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x38]
        add     r3, r1, r0
        ble     LBVI44
        ldr     r12, [sp, #0x10]
        mov     r10, #0
        mov     r9, r10
        add     r3, r12, r3, lsl #2
        ldr     r12, [sp, #0x20]
        mov     r8, r9
        mov     r11, r8
        add     r3, r3, #2
        add     r12, r12, #2
        mov     lr, r7
        str     r6, [sp, #0x1C]
LBVI21:
        ldrsh   r6, [r12, #-2]
        ldrsh   r7, [r3, #-2]
        ldrsh   r2, [r3], #4
        ldrsh   r0, [r12], #4
        mul     r1, r7, r6
        mul     r6, r2, r6
        mul     r2, r0, r2
        mla     r6, r7, r0, r6
        sub     r1, r1, r2
        adds    r11, r1, r11
        adc     r10, r10, r1, asr #31
        adds    r9, r6, r9
        adc     r8, r8, r6, asr #31
        subs    lr, lr, #1
        bne     LBVI21
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
LBVI22:
        cmp     r6, #0
        beq     LBVI24
        cmp     r4, #0
        ble     LBVI23
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r11, r0
        mov     r10, r1
        b       LBVI24
LBVI23:
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp]
        bl      __ashrdi3
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        adds    r11, r3, r11
        adc     r3, r10, r3, asr #31
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r1, r3, #0
        ldr     r3, [sp]
        bl      __ashrdi3
        mov     r11, r0
        mov     r10, r1
LBVI24:
        subs    r3, r11, r5
        sbcs    r12, r10, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI25
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r11, r3
        ldr     r3, [sp, #4]
        sbcs    r10, r10, r3
        movge   r11, r11, lsl #16
        movge   r3, r11, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVI26
LBVI25:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVI26:
        ldr     r12, [sp, #8]
        cmp     r6, #0
        strh    r3, [r12]
        beq     LBVI28
        cmp     r4, #0
        ble     LBVI27
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        mov     r8, r1
        b       LBVI28
LBVI27:
        mov     r0, r9
        mov     r1, r8
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp]
        mov     r2, r11
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [sp, #0x4C]
        and     r0, r0, #1
        mov     r2, r11
        adds    r9, r9, r12
        adc     r12, r8, r12, asr #31
        adds    r0, r9, r0
        adc     r1, r12, #0
        mov     r3, r10
        bl      __ashrdi3
        mov     r9, r0
        mov     r8, r1
LBVI28:
        subs    r3, r9, r5
        sbcs    r12, r8, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI29
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r9, r3
        ldr     r3, [sp, #4]
        sbcs    r8, r8, r3
        movge   r9, r9, lsl #16
        movge   r0, r9, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVI30
LBVI29:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVI30:
        ldr     r1, [sp, #8]
        cmp     r7, #0
        strh    r0, [r1, #2]
        ldr     r0, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        ldr     r1, [r0, #8]
        add     r0, r0, #0xC
        str     r0, [sp, #0x24]
        add     r3, r3, r7, lsl #2
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x38]
        add     r3, r3, r1
        ble     LBVI43
        ldr     r12, [sp, #0x10]
        mov     r10, #0
        mov     r9, r10
        add     r3, r12, r3, lsl #2
        ldr     r12, [sp, #0x20]
        mov     r8, r9
        mov     r11, r8
        add     r3, r3, #2
        add     r12, r12, #2
        mov     lr, r7
        str     r6, [sp, #0x1C]
LBVI31:
        ldrsh   r6, [r12, #-2]
        ldrsh   r7, [r3, #-2]
        ldrsh   r2, [r3], #4
        ldrsh   r0, [r12], #4
        mul     r1, r7, r6
        mul     r6, r2, r6
        mul     r2, r0, r2
        mla     r6, r7, r0, r6
        sub     r1, r1, r2
        adds    r11, r1, r11
        adc     r10, r10, r1, asr #31
        adds    r9, r6, r9
        adc     r8, r8, r6, asr #31
        subs    lr, lr, #1
        bne     LBVI31
        ldr     r6, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
LBVI32:
        cmp     r6, #0
        beq     LBVI34
        cmp     r4, #0
        ble     LBVI33
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r11, r0
        mov     r10, r1
        b       LBVI34
LBVI33:
        mov     r0, r11
        mov     r1, r10
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp]
        bl      __ashrdi3
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        adds    r11, r3, r11
        adc     r3, r10, r3, asr #31
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r1, r3, #0
        ldr     r3, [sp]
        bl      __ashrdi3
        mov     r11, r0
        mov     r10, r1
LBVI34:
        subs    r3, r11, r5
        sbcs    r12, r10, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI35
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r11, r3
        ldr     r3, [sp, #4]
        sbcs    r10, r10, r3
        movge   r11, r11, lsl #16
        movge   r3, r11, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LBVI36
LBVI35:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LBVI36:
        ldr     r12, [sp, #0xC]
        cmp     r6, #0
        strh    r3, [r12]
        beq     LBVI38
        cmp     r4, #0
        ble     LBVI37
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        mov     r8, r1
        b       LBVI38
LBVI37:
        mov     r0, r9
        mov     r1, r8
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp]
        mov     r2, r11
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [sp, #0x4C]
        and     r0, r0, #1
        mov     r2, r11
        adds    r9, r9, r12
        adc     r12, r8, r12, asr #31
        adds    r0, r9, r0
        adc     r1, r12, #0
        mov     r3, r10
        bl      __ashrdi3
        mov     r9, r0
        mov     r8, r1
LBVI38:
        subs    r3, r9, r5
        sbcs    r12, r8, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVI39
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r9, r3
        ldr     r3, [sp, #4]
        sbcs    r8, r8, r3
        movge   r9, r9, lsl #16
        movge   r0, r9, asr #16
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
        b       LBVI40
LBVI39:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LBVI40:
        ldr     r1, [sp, #0x24]
        ldr     r3, [sp, #0x18]
        cmp     r1, r3
        ldr     r1, [sp, #0xC]
        strh    r0, [r1, #2]
        ldr     r0, [sp, #0x20]
        add     r0, r0, r7, lsl #2
        str     r0, [sp, #0x20]
        bcc     LBVI41
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x30]
        ldr     r0, [r0]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x34]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x38]
        add     r1, r0, r1
        str     r1, [sp, #0x38]
LBVI41:
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x2C]
        add     r0, r0, #4
        str     r0, [sp, #0x3C]
        cmp     r0, r1
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        add     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #0x10
        str     r0, [sp, #0x28]
        blt     LBVI0
LBVI42:
        ldr     r0, [sp, #0x38]
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LBVI43:
        mov     r10, #0
        mov     r9, r10
        mov     r8, r9
        mov     r11, r8
        b       LBVI32
LBVI44:
        mov     r10, #0
        mov     r9, r10
        mov     r8, r9
        mov     r11, r8
        b       LBVI22
LBVI45:
        mov     r10, #0
        mov     r9, r10
        mov     r8, r9
        mov     r11, r8
        b       LBVI12
LBVI46:
        mov     r10, #0
        mov     r9, r10
        mov     r8, r9
        mov     r11, r8
        b       LBVI2


