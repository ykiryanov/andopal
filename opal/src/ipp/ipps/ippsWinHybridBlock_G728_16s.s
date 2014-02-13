        .text
        .align  4
        .globl  _ippsWinHybridBlock_G728_16s


_ippsWinHybridBlock_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2F, 28
        add     lr, sp, #2, 24
        ldr     r8, [sp, #0x314]
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        and     lr, lr, #0xF
        add     r12, sp, #2, 24
        add     lr, r12, lr
        cmp     r1, #0
        str     r1, [sp, #0x24]
        str     lr, [sp, #0x2C]
        str     r0, [sp, #0x38]
        str     r2, [sp, #0x34]
        str     r3, [sp, #0x30]
        beq     LDEP51
        ldr     r0, [sp, #0x34]
        cmp     r0, #0
        beq     LDEP51
        ldr     r0, [sp, #0x30]
        cmp     r0, #0
        beq     LDEP51
        cmp     r8, #0
        beq     LDEP51
        ldrsh   r0, [r8, #8]
        ldrsh   r7, [r8, #4]
        ldr     r6, [r8, #0x14]
        ldrsh   r11, [r8, #6]
        str     r0, [sp, #0x18]
        ldrsh   r1, [r8, #0xE]
        ldrsh   r9, [r8, #0xA]
        ldrsh   r10, [r8, #0xC]
        add     r2, r7, #2
        str     r1, [sp, #0x28]
        mov     r1, r7, lsl #1
        str     r1, [sp, #0xC]
        add     r1, r6, r2, lsl #1
        add     r2, r7, r0
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x1C]
        add     r0, r1, r11, lsl #1
        bl      _ippsMove_16s
        ldr     r0, [sp, #0xC]
        add     r4, r7, #1
        cmp     r11, #0
        add     r1, r0, #0xD6
        mov     r5, r4, lsl #1
        add     r0, r6, r1
        ble     LDEP3
        cmp     r11, #6
        blt     LDEP50
        ldr     r2, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        mov     r3, #0
        sub     lr, r11, #6
        str     r7, [sp, #4]
        add     r2, r2, r12, lsl #1
        ldr     r12, [sp, #0x24]
        str     r8, [sp]
        str     r12, [sp, #8]
        ldr     r7, [sp, #8]
        mov     r12, r2
LDEP0:
        ldrsh   r8, [r7]
        add     r3, r3, #5
        cmp     r3, lr
        strh    r8, [r12]
        ldrsh   r8, [r7, #2]
        strh    r8, [r12, #2]
        ldrsh   r8, [r7, #4]
        strh    r8, [r12, #4]
        ldrsh   r8, [r7, #6]
        strh    r8, [r12, #6]
        ldrsh   r8, [r7, #8]
        add     r7, r7, #0xA
        strh    r8, [r12, #8]
        add     r12, r12, #0xA
        ble     LDEP0
        ldr     r7, [sp, #4]
        ldr     r8, [sp]
LDEP1:
        ldr     r12, [sp, #0x24]
        mov     lr, r3, lsl #1
        str     r8, [sp]
        add     r12, r12, r3, lsl #1
LDEP2:
        ldrsh   r8, [r12], #2
        add     r3, r3, #1
        cmp     r3, r11
        strh    r8, [r2, +lr]
        add     lr, lr, #2
        blt     LDEP2
        ldr     r8, [sp]
LDEP3:
        cmp     r10, #0
        ble     LDEP7
        cmp     r10, #6
        movlt   r3, #0
        addlt   r2, r0, r9, lsl #1
        blt     LDEP5
        add     r2, r0, r9, lsl #1
        str     r2, [sp, #8]
        str     r7, [sp, #4]
        ldr     r7, [sp, #8]
        mov     r3, #0
        sub     lr, r10, #6
        mov     r12, r0
        str     r8, [sp]
LDEP4:
        ldrsh   r8, [r7]
        add     r3, r3, #5
        cmp     r3, lr
        strh    r8, [r12]
        ldrsh   r8, [r7, #2]
        strh    r8, [r12, #2]
        ldrsh   r8, [r7, #4]
        strh    r8, [r12, #4]
        ldrsh   r8, [r7, #6]
        strh    r8, [r12, #6]
        ldrsh   r8, [r7, #8]
        add     r7, r7, #0xA
        strh    r8, [r12, #8]
        add     r12, r12, #0xA
        ble     LDEP4
        ldr     r7, [sp, #4]
        ldr     r8, [sp]
LDEP5:
        mov     lr, r3, lsl #1
        add     r12, r0, r3, lsl #1
        str     r8, [sp]
LDEP6:
        ldrsh   r8, [r2, +lr]
        add     r3, r3, #1
        cmp     r3, r10
        strh    r8, [r12], #2
        add     lr, lr, #2
        blt     LDEP6
        ldr     r8, [sp]
LDEP7:
        cmp     r9, #0
        ble     LDEP11
        cmp     r9, #6
        movlt   r2, #0
        addlt   r10, r0, r10, lsl #1
        blt     LDEP9
        ldr     r12, [sp, #0x34]
        add     r10, r0, r10, lsl #1
        mov     r2, #0
        sub     r3, r9, #6
        mov     lr, r10
        str     r8, [sp]
LDEP8:
        ldrsh   r8, [r12]
        add     r2, r2, #5
        cmp     r2, r3
        strh    r8, [lr]
        ldrsh   r8, [r12, #2]
        strh    r8, [lr, #2]
        ldrsh   r8, [r12, #4]
        strh    r8, [lr, #4]
        ldrsh   r8, [r12, #6]
        strh    r8, [lr, #6]
        ldrsh   r8, [r12, #8]
        add     r12, r12, #0xA
        strh    r8, [lr, #8]
        add     lr, lr, #0xA
        ble     LDEP8
        ldr     r8, [sp]
LDEP9:
        ldr     lr, [sp, #0x34]
        mov     r12, r2, lsl #1
        add     lr, lr, r2, lsl #1
LDEP10:
        ldrsh   r3, [lr], #2
        add     r2, r2, #1
        cmp     r2, r9
        strh    r3, [r10, +r12]
        add     r12, r12, #2
        blt     LDEP10
LDEP11:
        ldr     r2, [sp, #0x28]
        ldrsh   r1, [r6, +r1]
        cmp     r2, #0
        ble     LDEP13
        mov     r2, r0
        ldr     r12, [sp, #0x28]
LDEP12:
        ldrsh   lr, [r2], #2
        cmp     lr, r1
        movlt   r1, lr
        subs    r12, r12, #1
        bne     LDEP12
LDEP13:
        ldr     r2, [sp, #0x28]
        cmp     r2, #0
        ble     LDEP49
        ldr     r2, [r8]
        ldr     r9, [sp, #0x18]
        add     r11, r7, r11
        str     r11, [sp, #8]
        ldr     r10, [sp, #0x28]
        add     r11, r9, r11
        str     r11, [sp, #0x1C]
        str     r8, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
        ldr     r11, [sp, #0x2C]
        mov     r12, #2, 2
        mov     lr, #0
        sub     r12, r12, #2, 18
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r7, [sp, #4]
LDEP14:
        ldrsh   r3, [r0], #2
        sub     r3, r3, r1
        sub     r3, r3, #1
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #0
        ble     LDEP43
        sub     r4, r8, lr
        mov     r5, lr, lsl #1
        mov     r6, r4, lsl #1
        sub     r6, r6, #2
        ldrsh   r6, [r2, +r6]
        ldrsh   r7, [r9, +r5]
        mul     r6, r7, r6
        mov     r6, r6, asr r3
        cmp     r12, r6
        mvnle   r6, #0
        addle   r6, r6, #2, 18
        ble     LDEP15
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEP15:
        strh    r6, [r11, +r5]
        mov     r6, r4, lsl #1
        mov     r5, lr, lsl #1
        sub     r6, r6, #4
        ldrsh   r6, [r2, +r6]
        add     r5, r5, #2
        ldrsh   r7, [r9, +r5]
        mul     r6, r7, r6
        mov     r6, r6, asr r3
        cmp     r12, r6
        mvnle   r6, #0
        addle   r6, r6, #2, 18
        ble     LDEP16
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEP16:
        strh    r6, [r5, +r11]
        mov     r6, r4, lsl #1
        mov     r5, lr, lsl #1
        sub     r6, r6, #6
        ldrsh   r6, [r2, +r6]
        add     r5, r5, #4
        ldrsh   r7, [r9, +r5]
        mul     r6, r7, r6
        mov     r6, r6, asr r3
        cmp     r12, r6
        mvnle   r6, #0
        addle   r6, r6, #2, 18
        ble     LDEP17
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEP17:
        strh    r6, [r5, +r11]
        mov     r6, r4, lsl #1
        mov     r5, lr, lsl #1
        sub     r6, r6, #8
        ldrsh   r6, [r2, +r6]
        add     r5, r5, #6
        ldrsh   r7, [r9, +r5]
        mul     r6, r7, r6
        mov     r6, r6, asr r3
        cmp     r12, r6
        mvnle   r6, #0
        addle   r6, r6, #2, 18
        ble     LDEP18
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEP18:
        strh    r6, [r5, +r11]
        mov     r5, r4, lsl #1
        mov     r4, lr, lsl #1
        sub     r5, r5, #0xA
        ldrsh   r5, [r2, +r5]
        add     r4, r4, #8
        ldrsh   r6, [r9, +r4]
        mul     r5, r6, r5
        mov     r3, r5, asr r3
        cmp     r12, r3
        mvnle   r3, #0
        addle   r3, r3, #2, 18
        ble     LDEP19
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDEP19:
        strh    r3, [r4, +r11]
        add     lr, lr, #5
LDEP20:
        subs    r10, r10, #1
        bne     LDEP14
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #4]
        ldr     r8, [sp]
LDEP21:
        add     r2, sp, #0x12, 28
        and     r2, r2, #0xF
        rsb     r2, r2, #0
        add     r0, sp, #0x12, 28
        and     r2, r2, #0xF
        add     r9, r0, r2
        ldrsh   r0, [r8, #0x10]
        mov     r1, r1, lsl #1
        mov     r3, r4
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #8]
        mov     r10, r1, lsl #16
        ldr     r11, [r8, #0x14]
        sub     r1, r0, r7
        ldr     r0, [sp, #0x2C]
        add     r8, sp, #0x40
        mov     r2, r9
        add     r0, r0, r7, lsl #1
        bl      _ippsAutoCorr_Inv_16s32s
        ldrsh   r12, [r6, +r5]
        add     r0, sp, #0x40
        and     r0, r0, #0xF
        rsb     r0, r0, #0
        and     r0, r0, #0xF
        cmp     r12, r10, asr #16
        str     r0, [sp, #0x24]
        add     r8, r8, r0
        ble     LDEP22
        sub     r12, r12, r10, asr #16
        add     r12, r12, #1
        mov     lr, #1
        b       LDEP23
LDEP22:
        cmp     r12, r10, asr #16
        moveq   r12, #1
        moveq   lr, r12
        beq     LDEP23
        rsb     r12, r12, r10, asr #16
        add     lr, r12, #1
        mov     r12, #1
LDEP23:
        cmp     lr, #0x1F
        mov     r0, #0x1F
        movgt   lr, r0
        cmp     r12, #0x1F
        movgt   r12, r0
        cmp     r4, #0
        ble     LDEP27
        cmp     r4, #4
        movlt   r0, #0
        blt     LDEP25
        sub     r3, r4, #4
        str     r9, [sp, #0x18]
        str     r3, [sp, #0x28]
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        mov     r0, #0
        mov     r2, r11
        mov     r1, r8
        str     r10, [sp, #0x34]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x14]
        str     r7, [sp, #4]
LDEP24:
        ldrsh   r7, [r2], #6
        ldr     r5, [r4], #0xC
        mov     r6, r7, lsl r3
        rsb     r7, r6, r7, lsl #16
        mov     r6, r7, asr r12
        add     r5, r6, r5, asr lr
        str     r5, [r1], #0xC
        add     r6, r0, #1
        ldr     r5, [r9, +r6, lsl #2]
        str     r5, [sp, #0x3C]
        mov     r5, r6, lsl #1
        ldrsh   r7, [r11, +r5]
        add     r5, r0, #2
        add     r0, r0, #3
        mov     r10, r7, lsl r3
        rsb     r7, r10, r7, lsl #16
        ldr     r10, [sp, #0x3C]
        mov     r7, r7, asr r12
        add     r10, r7, r10, asr lr
        str     r10, [r8, +r6, lsl #2]
        mov     r6, r5, lsl #1
        ldrsh   r7, [r11, +r6]
        ldr     r6, [r9, +r5, lsl #2]
        mov     r10, r7, lsl r3
        rsb     r7, r10, r7, lsl #16
        mov     r7, r7, asr r12
        add     r6, r7, r6, asr lr
        ldr     r7, [sp, #0x28]
        str     r6, [r8, +r5, lsl #2]
        cmp     r0, r7
        ble     LDEP24
        ldr     r10, [sp, #0x34]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #4]
LDEP25:
        str     r6, [sp, #0x14]
        ldr     r6, [sp, #0x20]
        add     r3, r11, r0, lsl #1
        add     r2, r9, r0, lsl #2
        add     r1, r8, r0, lsl #2
        str     r11, [sp]
        str     r5, [sp, #0xC]
        str     r7, [sp, #4]
LDEP26:
        ldrsh   r7, [r3], #2
        ldr     r5, [r2], #4
        mov     r11, r7, lsl r6
        rsb     r7, r11, r7, lsl #16
        mov     r7, r7, asr r12
        add     r5, r7, r5, asr lr
        add     r0, r0, #1
        str     r5, [r1], #4
        cmp     r0, r4
        blt     LDEP26
        ldr     r11, [sp]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #4]
LDEP27:
        add     r2, sp, #0xBB, 30
        mov     r1, r8
        mov     r0, r8
        bl      ownVscaleOne_Range30_32s
        ldrsh   r12, [r6, +r5]
        add     r3, sp, #2, 24
        ldrsh   r3, [r3, #0xEC]
        cmp     r12, r10, asr #16
        addle   r3, r3, r12
        addgt   r3, r3, r10, asr #16
        sub     r3, r3, #1
        strh    r3, [r6, +r5]
        ldr     r3, [sp, #0x24]
        add     r12, sp, #0x40
        ldr     r3, [r3, +r12]
        mov     r12, #2, 2
        sub     r12, r12, #2, 18
        cmp     r12, r3
        mvnle   r3, #0
        addle   r3, r3, #2, 18
        ble     LDEP28
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDEP28:
        cmp     r7, #0
        strh    r3, [r11]
        ble     LDEP31
        mov     r3, #2, 2
        add     r12, r8, #4
        add     r4, r11, #2
        sub     r3, r3, #2, 18
        mov     lr, r7
LDEP29:
        ldr     r1, [r12], #4
        add     r0, sp, #2, 24
        ldrsh   r0, [r0, #0xEC]
        mov     r0, r1, lsl r0
        cmp     r3, r0
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDEP30
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEP30:
        strh    r0, [r4], #2
        subs    lr, lr, #1
        bne     LDEP29
LDEP31:
        ldr     r3, [sp, #0x38]
        cmp     r3, #1
        moveq   r7, #0xA
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #8]
        add     r4, r7, #1
        mov     r2, r9
        sub     r1, r12, r3
        ldr     r12, [sp, #0x2C]
        add     r0, r12, r3, lsl #1
        mov     r3, r4
        bl      _ippsAutoCorr_Inv_16s32s
        ldrsh   r5, [r6, +r5]
        mov     lr, #1
        cmp     r5, r10, asr #16
        subgt   r5, r5, r10, asr #16
        rsbgt   r12, r5, #0xF
        bgt     LDEP32
        cmp     r5, r10, asr #16
        mov     r12, #0xF
        rsbne   r10, r5, r10, asr #16
        addne   lr, r10, #1
LDEP32:
        cmp     lr, #0x1F
        mov     r5, #0x1F
        movgt   lr, r5
        cmp     r12, #0
        blt     LDEP34
        cmp     r4, #0
        ble     LDEP36
        mov     r5, r8
LDEP33:
        ldrsh   r10, [r11], #2
        ldr     r6, [r9], #4
        mov     r10, r10, lsl r12
        subs    r4, r4, #1
        add     r6, r10, r6, asr lr
        str     r6, [r5], #4
        bne     LDEP33
        b       LDEP36
LDEP34:
        cmp     r4, #0
        rsb     r12, r12, #0
        ble     LDEP36
        mov     r5, r8
LDEP35:
        ldrsh   r10, [r11], #2
        ldr     r6, [r9], #4
        mov     r10, r10, asr r12
        subs    r4, r4, #1
        add     r6, r10, r6, asr lr
        str     r6, [r5], #4
        bne     LDEP35
LDEP36:
        ldr     r2, [sp, #0x24]
        add     r3, sp, #0x40
        mvn     r5, #0
        ldr     r12, [r2, +r3]
        mov     r4, #2, 2
        mov     r2, r12, asr #8
        adds    r3, r2, r12
        mov     r12, r12, asr #31
        adc     r2, r12, r2, asr #31
        mvn     r12, #2, 2
        subs    lr, r3, r12
        sbcs    r6, r2, #0
        movlt   lr, #0
        movlt   r6, #0
        orrs    r6, lr, r6
        movne   r3, r12
        bne     LDEP37
        cmp     r3, #2, 2
        sbcs    r2, r2, r5
        movlt   r3, #2, 2
LDEP37:
        add     r2, sp, #0xBA, 30
        add     r1, sp, #0xB9, 30
        add     r0, sp, #0xB9, 30
        str     r3, [sp, #0x2E4]
        bl      ownVscaleOne_Range30_32s
        ldr     r3, [sp, #0x2E4]
        sub     r2, r4, #2, 18
        cmp     r2, r3
        addle   r2, r5, #2, 18
        ble     LDEP38
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
LDEP38:
        ldr     r3, [sp, #0x30]
        cmp     r7, #0
        strh    r2, [r3]
        ble     LDEP41
        ldr     r2, [sp, #0x30]
        add     r3, sp, #2, 24
        ldrsh   r3, [r3, #0xE8]
        add     r2, r2, #2
        sub     r4, r4, #2, 18
        mov     lr, #0
        add     r12, r8, #4
LDEP39:
        ldr     r6, [r12], #4
        mov     r6, r6, lsl r3
        cmp     r4, r6
        addle   r6, r5, #2, 18
        ble     LDEP40
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDEP40:
        add     lr, lr, #1
        strh    r6, [r2], #2
        cmp     lr, r7
        blt     LDEP39
LDEP41:
        ldr     r7, [r8, +r7, lsl #2]
        cmp     r7, #0
        bne     LDEP42
        mov     r0, #0x11
        add     sp, sp, #0x2F, 28
        ldmia   sp!, {r4 - r11, pc}
LDEP42:
        mov     r0, #0
        add     sp, sp, #0x2F, 28
        ldmia   sp!, {r4 - r11, pc}
LDEP43:
        sub     r7, r8, lr
        mov     r6, lr, lsl #1
        mov     r4, r7, lsl #1
        sub     r4, r4, #2
        ldrsh   r4, [r2, +r4]
        ldrsh   r5, [r9, +r6]
        rsb     r3, r3, #0
        mul     r4, r5, r4
        mov     r4, r4, lsl r3
        cmp     r12, r4
        mvnle   r4, #0
        addle   r4, r4, #2, 18
        ble     LDEP44
        add     r4, r4, #2, 18
        mov     r4, r4, asr #16
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDEP44:
        strh    r4, [r11, +r6]
        mov     r5, r7, lsl #1
        mov     r4, lr, lsl #1
        sub     r5, r5, #4
        ldrsh   r5, [r2, +r5]
        add     r4, r4, #2
        ldrsh   r6, [r9, +r4]
        mul     r5, r6, r5
        mov     r5, r5, lsl r3
        cmp     r12, r5
        mvnle   r5, #0
        addle   r5, r5, #2, 18
        ble     LDEP45
        add     r5, r5, #2, 18
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDEP45:
        strh    r5, [r4, +r11]
        mov     r5, r7, lsl #1
        mov     r4, lr, lsl #1
        sub     r5, r5, #6
        ldrsh   r5, [r2, +r5]
        add     r4, r4, #4
        ldrsh   r6, [r9, +r4]
        mul     r5, r6, r5
        mov     r5, r5, lsl r3
        cmp     r12, r5
        mvnle   r5, #0
        addle   r5, r5, #2, 18
        ble     LDEP46
        add     r5, r5, #2, 18
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDEP46:
        strh    r5, [r4, +r11]
        mov     r5, r7, lsl #1
        mov     r4, lr, lsl #1
        sub     r5, r5, #8
        ldrsh   r5, [r2, +r5]
        add     r4, r4, #6
        ldrsh   r6, [r9, +r4]
        mul     r5, r6, r5
        mov     r5, r5, lsl r3
        cmp     r12, r5
        mvnle   r5, #0
        addle   r5, r5, #2, 18
        ble     LDEP47
        add     r5, r5, #2, 18
        mov     r5, r5, asr #16
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDEP47:
        strh    r5, [r4, +r11]
        mov     r7, r7, lsl #1
        mov     r4, lr, lsl #1
        sub     r5, r7, #0xA
        ldrsh   r5, [r2, +r5]
        add     r4, r4, #8
        ldrsh   r6, [r9, +r4]
        mul     r5, r6, r5
        mov     r3, r5, lsl r3
        cmp     r12, r3
        mvnle   r3, #0
        addle   r3, r3, #2, 18
        ble     LDEP48
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDEP48:
        strh    r3, [r4, +r11]
        add     lr, lr, #5
        b       LDEP20
LDEP49:
        ldr     r0, [sp, #0x18]
        add     r11, r7, r11
        str     r11, [sp, #8]
        add     r11, r0, r11
        str     r11, [sp, #0x1C]
        b       LDEP21
LDEP50:
        ldr     r2, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        mov     r3, #0
        add     r2, r2, r12, lsl #1
        b       LDEP1
LDEP51:
        mvn     r0, #7
        add     sp, sp, #0x2F, 28
        ldmia   sp!, {r4 - r11, pc}


