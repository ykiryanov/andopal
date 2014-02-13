        .text
        .align  4
        .globl  _ippsGainQuant_G729D_16s


_ippsGainQuant_G729D_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA4
        add     lr, sp, #0x14
        ldr     r11, [sp, #0xC8]
        and     lr, lr, #0xF
        ldr     r7, [sp, #0xCC]
        ldr     r10, [sp, #0xD0]
        ldr     r9, [sp, #0xD4]
        rsb     lr, lr, #0
        mov     r6, r0
        add     r12, sp, #0x14
        and     lr, lr, #0xF
        cmp     r6, #0
        add     r4, r12, lr
        mov     r5, r1
        str     r2, [sp, #0x10]
        mov     r8, r3
        beq     LDTL26
        cmp     r5, #0
        beq     LDTL26
        cmp     r8, #0
        beq     LDTL26
        cmp     r11, #0
        beq     LDTL26
        cmp     r7, #0
        beq     LDTL26
        cmp     r10, #0
        beq     LDTL26
        ldr     r12, [sp, #0x10]
        cmp     r12, #0
        beq     LDTL26
        cmp     r9, #0
        blt     LDTL0
        cmp     r9, #1
        ble     LDTL1
LDTL0:
        mvn     r0, #6
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LDTL1:
        add     r12, sp, #0x94
        add     r3, sp, #0x8C
        str     r12, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, #0
        bl      _ippsComputeAdaptiveCodebookGain_16s
        ldrsh   lr, [sp, #0x94]
        add     r12, sp, #0x8C
        cmp     lr, #0
        mvneq   lr, #0xE
        streqh  lr, [r12, #6]
        add     r0, sp, #0x8C
        add     r1, sp, #0x8C
        ldrsh   r0, [r0, #2]
        ldrsh   r1, [r1]
        add     lr, sp, #0x80
        cmn     r0, #2, 18
        strh    r1, [lr]
        moveq   lr, #0xFF
        orreq   lr, lr, #0x7F, 24
        beq     LDTL2
        rsb     r0, r0, #0
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
LDTL2:
        add     r1, sp, #0x8C
        ldrsh   r1, [r1, #4]
        add     r0, sp, #0x74
        strh    lr, [r0]
        cmn     r1, #2, 18
        moveq   lr, #0xFF
        orreq   lr, lr, #0x7F, 24
        beq     LDTL3
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     lr, r1, asr #16
LDTL3:
        ldrsh   r12, [r12, #6]
        add     r0, sp, #0x80
        strh    lr, [r0, #2]
        add     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmn     r12, #2, 18
        moveq   r12, #0xFF
        orreq   r12, r12, #0x7F, 24
        beq     LDTL4
        rsb     r12, r12, #0
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDTL4:
        add     lr, sp, #0x74
        strh    r12, [lr, #2]
        mov     r0, r8
        mov     r2, r4
        mov     r3, #0x28
        mov     r1, #3
        bl      _ippsRShiftC_16s
        add     r3, sp, #0x98
        mov     r0, r4
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r8, sp, #0x98
        add     r3, r8, #4
        mov     r0, r6
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsDotProd_16s32s
        add     r6, sp, #0x98
        add     r3, r6, #8
        mov     r1, r4
        mov     r0, r5
        mov     r2, #0x28
        bl      _ippsDotProd_16s32s
        add     r0, sp, #0x98
        ldr     r1, [r6, #8]
        ldr     r0, [r0]
        ldr     r8, [r8, #4]
        mov     r1, r1, lsl #1
        add     r2, r1, #1
        mov     r0, r0, lsl #1
        adds    r4, r0, #1
        mov     r8, r8, lsl #1
        add     lr, r8, #1
        mov     r1, r4
        beq     LDTL8
        cmn     r4, #1
        beq     LDTL23
        cmp     r4, #0
        mvnlt   r1, r4
        cmp     r1, #0
        moveq   r1, #0
        beq     LDTL7
        movs    r0, r1, lsr #16
        bne     LDTL5
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    r12, r1, asr #8
        ldrne   r0, [pc, #0xF94]
        movne   r1, r12, lsl #1
        ldreq   r0, [pc, #0xF90]
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        add     r0, r1, #0x10
        mov     r0, r0, lsl #16
        mov     r1, r0, asr #16
        b       LDTL7
LDTL5:
        movs    r1, r1, lsr #24
        bne     LDTL6
        ldr     r1, [pc, #0xF6C]
        mov     r0, r0, lsl #1
        ldrsh   r1, [r1, +r0]
        b       LDTL7
LDTL6:
        ldr     r0, [pc, #0xF58]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
LDTL7:
        add     r0, sp, #0x98
        mov     r4, r4, lsl r1
        str     r4, [r0]
        b       LDTL9
LDTL8:
        add     r0, sp, #0x98
        str     r4, [r0]
        mov     r1, #0
LDTL9:
        cmp     lr, #0
        mov     r12, lr
        beq     LDTL13
        cmn     lr, #1
        beq     LDTL24
        cmp     lr, #0
        mvnlt   r12, lr
        cmp     r12, #0
        moveq   r0, #0
        beq     LDTL12
        movs    r0, r12, lsr #16
        bne     LDTL10
        bic     r12, r12, #0xFF, 8
        bic     r0, r12, #0xFF, 16
        movs    r12, r0, asr #8
        movne   r0, r12, lsl #1
        ldrne   r12, [pc, #0xEF0]
        ldreq   r12, [pc, #0xEF0]
        moveq   r0, r0, lsl #1
        ldrsh   r0, [r12, +r0]
        add     r0, r0, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDTL12
LDTL10:
        movs    r12, r12, lsr #24
        bne     LDTL11
        ldr     r12, [pc, #0xECC]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r12, +r0]
        b       LDTL12
LDTL11:
        ldr     r0, [pc, #0xEB8]
        mov     r12, r12, lsl #1
        ldrsh   r0, [r0, +r12]
LDTL12:
        mov     lr, lr, lsl r0
        add     r12, sp, #0x98
        str     lr, [r12, #4]
        b       LDTL14
LDTL13:
        add     r0, sp, #0x98
        str     lr, [r0, #4]
        mov     r0, #0
LDTL14:
        cmp     r2, #0
        mov     r5, r2
        streq   r2, [r6, #8]
        moveq   r12, #0
        beq     LDTL18
        cmn     r2, #1
        beq     LDTL25
        cmp     r2, #0
        mvnlt   r5, r2
        cmp     r5, #0
        moveq   r12, #0
        beq     LDTL17
        movs    r12, r5, lsr #16
        bne     LDTL15
        bic     r5, r5, #0xFF, 8
        bic     r12, r5, #0xFF, 16
        movs    r5, r12, asr #8
        movne   r12, r5, lsl #1
        ldrne   r5, [pc, #0xE48]
        ldreq   r5, [pc, #0xE48]
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r5, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDTL17
LDTL15:
        movs    r5, r5, lsr #24
        bne     LDTL16
        ldr     r5, [pc, #0xE24]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r5, +r12]
        b       LDTL17
LDTL16:
        ldr     r12, [pc, #0xE10]
        mov     r5, r5, lsl #1
        ldrsh   r12, [r12, +r5]
LDTL17:
        mov     r2, r2, lsl r12
        str     r2, [r6, #8]
LDTL18:
        mov     r5, #2, 2
        sub     r5, r5, #2, 18
        cmp     r5, r4
        movle   r4, #0xFF
        orrle   r4, r4, #0x7F, 24
        ble     LDTL19
        add     r4, r4, #2, 18
        mov     r4, r4, asr #16
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDTL19:
        add     r5, sp, #0x80
        strh    r4, [r5, #4]
        mov     r4, #2, 2
        sub     r4, r4, #2, 18
        cmp     r4, lr
        movle   lr, #0xFF
        orrle   r4, lr, #0x7F, 24
        ble     LDTL20
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     r4, lr, asr #16
LDTL20:
        mov     lr, #0xFF
        cmn     r4, #2, 18
        orr     lr, lr, #0x7F, 24
        moveq   r4, lr
        beq     LDTL21
        rsb     r4, r4, #0
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
LDTL21:
        add     r5, sp, #0x80
        strh    r4, [r5, #6]
        mov     r4, #2, 2
        sub     r4, r4, #2, 18
        cmp     r4, r2
        ble     LDTL22
        add     r2, r2, #2, 18
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     lr, r2, asr #16
LDTL22:
        add     r4, sp, #0x80
        strh    lr, [r4, #8]
        add     r2, sp, #0x74
        add     r1, r1, #3
        sub     r0, r0, #7
        strh    r1, [r2, #4]
        add     r4, sp, #0x74
        strh    r0, [r4, #6]
        add     lr, sp, #0x74
        sub     r12, r12, #7
        strh    r12, [lr, #8]
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #0x10]
        add     r2, sp, #0x74
        add     r1, sp, #0x80
        mov     r3, r7
        bl      LDTL_Qua_gain_6k
        mov     r0, #0
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LDTL23:
        add     r0, sp, #0x98
        mov     r4, #2, 2
        str     r4, [r0]
        mov     r1, #0x1F
        b       LDTL9
LDTL24:
        add     r0, sp, #0x98
        mov     lr, #2, 2
        str     lr, [r0, #4]
        mov     r0, #0x1F
        b       LDTL14
LDTL25:
        mov     r2, #2, 2
        str     r2, [r6, #8]
        mov     r12, #0x1F
        b       LDTL18
LDTL26:
        mvn     r0, #7
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LDTL_Qua_gain_6k:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x94
        ldr     r12, [sp, #0xB8]
        ldr     r6, [sp, #0xC0]
        add     r7, sp, #0x70
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0xBC]
        str     r3, [sp, #0x18]
        str     r12, [sp, #0x1C]
        str     r6, [sp, #0x20]
        mov     r4, r2
        mov     r5, r1
        mov     r3, r7
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r1, [sp, #0x70]
        add     r3, sp, #0x90
        add     r2, sp, #0x84
        mov     r0, r6
        bl      ownGainPredict
        ldrsh   r0, [r4, #4]
        ldrsh   r9, [r4]
        str     r0, [sp, #0x2C]
        ldrsh   r7, [r4, #8]
        ldrsh   r6, [r5]
        ldrsh   r10, [r5, #4]
        add     r0, r9, r0
        ldrsh   r8, [r5, #8]
        mov     r3, r7, lsl #1
        mul     lr, r6, r10
        sub     r0, r0, #1
        mul     r12, r8, r8
        add     r3, r3, #1
        mov     r0, r0, lsl #16
        mov     r3, r3, lsl #16
        mov     r0, r0, asr #16
        mov     r3, r3, asr #16
        sub     r11, r0, r3
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        cmp     r11, #0
        ble     LDTL73
        cmp     r11, #0x1F
        mov     r0, #0x1F
        movlt   r0, r11
        rsb     lr, r12, lr, asr r0
LDTL27:
        cmp     lr, #0
        moveq   r0, #0
        beq     LDTL31
        movs    r0, lr, asr #16
        bne     LDTL28
        bic     r0, lr, #0xFF, 8
        bic     r12, r0, #0xFF, 16
        movs    r11, r12, asr #8
        ldrne   r0, [pc, #0xBE4]
        movne   r12, r11, lsl #1
        ldreq   r0, [pc, #0xBE0]
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r0, +r12]
        add     r0, r12, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDTL30
LDTL28:
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r12, r0, asr #8
        bne     LDTL29
        ldr     r12, [pc, #0xBB4]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r12, +r0]
        b       LDTL30
LDTL29:
        ldr     r0, [pc, #0xBA0]
        mov     r12, r12, lsl #1
        ldrsh   r0, [r0, +r12]
LDTL30:
        mov     lr, lr, lsl r0
LDTL31:
        mov     lr, lr, asr #16
        add     r0, r3, r0
        mov     lr, lr, lsl #16
        sub     r0, r0, #0x11
        mov     r1, lr, asr #16
        cmp     r1, #1, 18
        str     r0, [sp, #0x30]
        beq     LDTL72
        cmp     r1, #0
        ble     LDTL71
        mov     r0, #0xE, 4
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDTL32:
        ldrsh   r3, [r4, #6]
        ldrsh   r2, [r5, #2]
        ldrsh   r4, [r4, #2]
        add     r11, r7, r3
        mov     r1, #0x1F
        str     r2, [sp, #0x28]
        ldrsh   r12, [r5, #6]
        mul     lr, r10, r2
        ldr     r2, [sp, #0x2C]
        str     r12, [sp, #0x24]
        mul     r12, r8, r12
        add     r2, r2, r4
        str     r12, [sp, #0x14]
        add     r12, r11, #1
        mov     r11, r2, lsl #16
        ldr     r2, [sp, #0x30]
        mov     r12, r12, lsl #16
        mov     r11, r11, asr #16
        rsb     r2, r2, #0x1D
        mov     r12, r12, asr #16
        cmp     r11, r12
        mov     r2, r2, lsl #16
        ble     LDTL33
        sub     r11, r11, r12
        add     r11, r11, #1
        cmp     r11, #0x1F
        movlt   r1, r11
        ldr     r11, [sp, #0x14]
        mov     lr, lr, asr r1
        sub     r12, r12, #1
        mov     r1, r11, asr #1
        b       LDTL34
LDTL33:
        sub     r12, r12, r11
        add     r12, r12, #1
        cmp     r12, #0x1F
        movlt   r1, r12
        ldr     r12, [sp, #0x14]
        mov     lr, lr, asr #1
        mov     r1, r12, asr r1
        sub     r12, r11, #1
LDTL34:
        subs    lr, lr, r1
        mov     r12, r12, lsl #16
        mov     r1, lr
        moveq   r11, #0
        beq     LDTL39
        cmn     lr, #1
        moveq   lr, #2, 2
        moveq   r11, #0x1F
        beq     LDTL39
        cmp     lr, #0
        mvnlt   r1, lr
        cmp     r1, #0
        moveq   r11, #0
        beq     LDTL38
        movs    r11, r1, lsr #16
        bne     LDTL36
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        str     r1, [sp, #0x14]
        movs    r1, r1, asr #8
        ldrne   r11, [pc, #0xA68]
        movne   r1, r1, lsl #1
        bne     LDTL35
        ldr     r1, [sp, #0x14]
        ldr     r11, [pc, #0xA5C]
        mov     r1, r1, lsl #1
LDTL35:
        ldrsh   r1, [r11, +r1]
        add     r11, r1, #0x10
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        b       LDTL38
LDTL36:
        movs    r1, r1, lsr #24
        bne     LDTL37
        ldr     r1, [pc, #0xA38]
        mov     r11, r11, lsl #1
        ldrsh   r11, [r1, +r11]
        b       LDTL38
LDTL37:
        ldr     r11, [pc, #0xA24]
        mov     r1, r1, lsl #1
        ldrsh   r11, [r11, +r1]
LDTL38:
        mov     lr, lr, lsl r11
LDTL39:
        add     r12, r11, r12, asr #16
        sub     r12, r12, #0x11
        add     r12, r12, r2, asr #16
        sub     r12, r12, #0x18
        mov     lr, lr, asr #16
        mov     r12, r12, lsl #16
        mov     r11, lr, lsl #16
        mov     lr, r12, asr #16
        subs    r12, lr, #1
        mov     r11, r11, asr #16
        bmi     LDTL70
        mul     lr, r0, r11
        cmp     r12, #0x1F
        mov     r11, #0x1F
        movlt   r11, r12
        mov     r11, lr, asr r11
LDTL40:
        ldr     lr, [sp, #0x1C]
        mov     r12, r11, asr #16
        mov     r12, r12, lsl #16
        cmp     lr, #1
        mov     r12, r12, asr #16
        str     r12, [sp, #0x14]
        beq     LDTL69
        ldr     r12, [sp, #0x14]
        add     lr, sp, #0x74
        strh    r12, [lr]
LDTL41:
        ldr     r12, [sp, #0x24]
        mov     r1, #0x1F
        mul     r11, r6, r12
        ldr     r12, [sp, #0x28]
        add     r6, r9, r3
        mul     lr, r8, r12
        add     r12, r7, r4
        add     r12, r12, #1
        mov     r6, r6, lsl #16
        mov     r12, r12, lsl #16
        mov     r6, r6, asr #16
        mov     r12, r12, asr #16
        cmp     r6, r12
        ble     LDTL42
        sub     r6, r6, r12
        cmp     r6, #0x1F
        movlt   r1, r6
        rsb     r1, lr, r11, asr r1
        sub     r12, r12, #1
        b       LDTL43
LDTL42:
        sub     r12, r12, r6
        cmp     r12, #0x1F
        movlt   r1, r12
        sub     r1, r11, lr, asr r1
        sub     r12, r6, #1
LDTL43:
        cmp     r1, #0
        mov     r12, r12, lsl #16
        mov     r6, r1
        moveq   lr, #0
        beq     LDTL47
        cmn     r1, #1
        moveq   r1, #2, 2
        moveq   lr, #0x1F
        beq     LDTL47
        cmp     r1, #0
        mvnlt   r6, r1
        cmp     r6, #0
        moveq   lr, #0
        beq     LDTL46
        movs    lr, r6, lsr #16
        bne     LDTL44
        bic     r6, r6, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        movs    r11, r6, asr #8
        ldrne   lr, [pc, #0x8FC]
        movne   r6, r11, lsl #1
        ldreq   lr, [pc, #0x8F8]
        moveq   r6, r6, lsl #1
        ldrsh   r6, [lr, +r6]
        add     lr, r6, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDTL46
LDTL44:
        movs    r6, r6, lsr #24
        bne     LDTL45
        ldr     r6, [pc, #0x8D4]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r6, +lr]
        b       LDTL46
LDTL45:
        ldr     lr, [pc, #0x8C0]
        mov     r6, r6, lsl #1
        ldrsh   lr, [lr, +r6]
LDTL46:
        mov     r1, r1, lsl lr
LDTL47:
        mov     r1, r1, asr #16
        add     r12, lr, r12, asr #16
        mov     r1, r1, lsl #16
        sub     r12, r12, #0x10
        mov     r1, r1, asr #15
        mul     r0, r0, r1
        add     r2, r12, r2, asr #16
        sub     r2, r2, #0x11
        mov     r2, r2, lsl #16
        movs    r2, r2, asr #16
        bmi     LDTL68
        cmp     r2, #0x1F
        mov     r12, #0x1F
        movlt   r12, r2
        mov     r12, r0, asr r12
LDTL48:
        add     r0, sp, #0x74
        mov     r2, r12, asr #16
        strh    r2, [r0, #2]
        ldrsh   lr, [sp, #0x90]
        ldrsh   r0, [sp, #0x84]
        cmp     lr, #4
        str     r0, [sp, #0x30]
        blt     LDTL49
        ldr     r0, [sp, #0x30]
        sub     r2, lr, #4
        mov     r2, r0, asr r2
        mov     r0, r2, lsl #16
        mov     r12, r0, asr #16
        b       LDTL51
LDTL49:
        ldr     r12, [sp, #0x30]
        rsb     r0, lr, #4
        mvn     r2, #0xFF
        bic     r0, r0, #0xFF, 8
        bic     r2, r2, #0x7F, 24
        bic     r0, r0, #0xFF, 16
        mvn     r2, r2
        mov     r6, #0
        cmp     r12, r2, asr r0
        sub     r6, r6, #2, 18
        bgt     LDTL50
        ldr     r2, [sp, #0x30]
        cmp     r2, r6, asr r0
        mvnlt   r0, #0xFF
        biclt   r12, r0, #0x7F, 24
        blt     LDTL51
        ldr     r2, [sp, #0x30]
        mov     r0, r2, lsl r0
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        b       LDTL51
LDTL50:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r12, r0
LDTL51:
        ldr     r0, [pc, #0x7E4]
        mvn     r6, #0xB
        str     r6, [sp, #0x34]
        ldr     r6, [r0, #-8]
        ldrsh   r11, [r0, #-0x1C]
        ldr     r1, [sp, #0x14]
        str     r6, [sp, #0x38]
        add     r2, sp, #0x74
        ldrsh   r2, [r2, #2]
        mul     r1, r11, r1
        ldr     r6, [r0, #-0x10]
        mul     r11, r11, r2
        cmp     r12, #0
        str     r1, [sp, #0x14]
        ldrsh   r1, [r0, #-0x18]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x14]
        str     r1, [sp, #0x3C]
        ldrsh   r0, [r0, #-4]
        ldr     r1, [sp, #0x38]
        sub     r6, r11, r6, asr #11
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x34]
        add     r11, r11, r1, asr #16
        ldr     r1, [sp, #0x44]
        mov     r6, r6, asr #15
        bic     r0, r0, #0x71, 24
        mov     r6, r6, lsl #16
        mul     r1, r1, r12
        mov     r11, r11, asr #15
        mov     r6, r6, asr #16
        mul     r6, r12, r6
        mov     r11, r11, lsl #16
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x3C]
        mov     r11, r11, asr #16
        mul     r11, r12, r11
        mov     r6, r6, asr #15
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        mul     r6, r1, r6
        rsb     r2, r11, r2, lsl #5
        ldr     r11, [sp, #0x40]
        mov     r2, r2, asr #13
        mov     r2, r2, lsl #16
        sub     r6, r6, r11, asr #3
        mov     r11, r6, asr #13
        mov     r2, r2, asr #16
        mul     r6, r2, r0
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        mul     r2, r11, r0
        ble     LDTL64
        ldr     r0, [sp, #0x14]
        cmp     r2, r0, asr #2
        movle   r0, #0
        ble     LDTL53
        ldr     r11, [pc, #0x700]
        mov     r0, #0
        sub     r11, r11, #4
LDTL52:
        add     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #2
        bge     LDTL53
        mov     r1, r0, lsl #1
        ldrsh   r1, [r11, +r1]
        mul     r1, r12, r1
        cmp     r2, r1, asr #2
        bgt     LDTL52
LDTL53:
        ldr     r2, [pc, #0x6CC]
        ldrsh   r2, [r2]
        mul     r2, r12, r2
        cmp     r6, r2, asr #5
        movle   r2, #0
        ble     LDTL55
        ldr     r11, [pc, #0x6B4]
        mov     r2, #0
LDTL54:
        add     r2, r2, #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, #2
        bge     LDTL55
        mov     r1, r2, lsl #1
        ldrsh   r1, [r11, +r1]
        mul     r1, r12, r1
        cmp     r6, r1, asr #5
        bgt     LDTL54
LDTL55:
        ldr     r12, [sp, #0x2C]
        add     r9, r9, #0xD
        add     r3, r3, lr
        add     r11, r12, lr, lsl #1
        add     r12, r4, #0xE
        mov     r6, r9, lsl #16
        sub     r11, r11, #0x13
        add     r4, sp, #0x78
        strh    r11, [r4, #4]
        mov     r12, r12, lsl #16
        mov     r6, r6, asr #16
        mov     r12, r12, asr #16
        add     r11, sp, #0x78
        strh    r12, [r11, #2]
        add     r4, sp, #0x78
        ldrsh   r4, [r4, #4]
        sub     r3, r3, #2
        add     r11, sp, #0x78
        strh    r3, [r11, #6]
        add     r9, sp, #0x78
        strh    r6, [r9]
        cmp     r12, r6
        add     lr, r7, lr
        add     r3, sp, #0x78
        ldrsh   r3, [r3, #6]
        movlt   r6, r12
        sub     lr, lr, #3
        add     r7, sp, #0x78
        strh    lr, [r7, #8]
        cmp     r4, r6
        ldrsh   r5, [r5]
        add     lr, sp, #0x78
        ldrsh   lr, [lr, #8]
        movlt   r6, r4
        cmp     r3, r6
        add     r9, sp, #0x78
        ldrsh   r9, [r9]
        movlt   r6, r3
        cmp     lr, r6
        movlt   r6, lr
        sub     r9, r9, r6
        mov     r9, r9, lsl #16
        mov     r7, r9, asr #16
        cmp     r7, #0x1F
        movlt   r5, r5, lsl #16
        movlt   r5, r5, asr r7
        blt     LDTL56
        cmp     r5, #0
        moveq   r5, #0
        mvnne   r5, #0
LDTL56:
        mvn     r7, #0xFF
        sub     r12, r12, r6
        bic     r7, r7, #0x7F, 24
        mov     r9, r12, lsl #16
        mvn     r7, r7
        mov     r12, r5, asr #16
        and     r7, r7, r5, asr #1
        mov     r5, r9, asr #16
        add     r9, sp, #0x5C
        str     r12, [r9]
        add     r12, sp, #0x48
        cmp     r5, #0x1F
        str     r7, [r12]
        blt     LDTL57
        ldr     r12, [sp, #0x28]
        cmp     r12, #0
        moveq   r5, #0
        mvnne   r5, #0
        b       LDTL58
LDTL57:
        ldr     r12, [sp, #0x28]
        mov     r12, r12, lsl #16
        mov     r5, r12, asr r5
LDTL58:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r7, r12
        sub     r4, r4, r6
        mov     r12, r5, asr #16
        mov     r4, r4, lsl #16
        and     r5, r7, r5, asr #1
        add     r7, sp, #0x5C
        str     r12, [r7, #4]
        mov     r4, r4, asr #16
        add     r12, sp, #0x48
        cmp     r4, #0x1F
        str     r5, [r12, #4]
        movlt   r10, r10, lsl #16
        movlt   r12, r10, asr r4
        blt     LDTL59
        cmp     r10, #0
        moveq   r12, #0
        mvnne   r12, #0
LDTL59:
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r5, r4
        sub     r3, r3, r6
        mov     r4, r12, asr #16
        mov     r3, r3, lsl #16
        and     r12, r5, r12, asr #1
        add     r5, sp, #0x5C
        str     r4, [r5, #8]
        mov     r3, r3, asr #16
        add     r4, sp, #0x48
        cmp     r3, #0x1F
        str     r12, [r4, #8]
        blt     LDTL60
        ldr     r3, [sp, #0x24]
        cmp     r3, #0
        moveq   r3, #0
        mvnne   r3, #0
        b       LDTL61
LDTL60:
        ldr     r12, [sp, #0x24]
        mov     r12, r12, lsl #16
        mov     r3, r12, asr r3
LDTL61:
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
        sub     lr, lr, r6
        and     r4, r4, r3, asr #1
        add     r12, sp, #0x5C
        mov     lr, lr, lsl #16
        mov     r3, r3, asr #16
        str     r3, [r12, #0xC]
        mov     lr, lr, asr #16
        add     r3, sp, #0x48
        cmp     lr, #0x1F
        str     r4, [r3, #0xC]
        movlt   r8, r8, lsl #16
        movlt   lr, r8, asr lr
        blt     LDTL62
        cmp     r8, #0
        moveq   lr, #0
        mvnne   lr, #0
LDTL62:
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
        and     r4, r4, lr, asr #1
        add     r12, sp, #0x48
        str     r4, [r12, #0x10]
        mov     lr, lr, asr #16
        add     r3, sp, #0x5C
        str     lr, [r3, #0x10]
        strh    r0, [sp, #0x8C]
        strh    r2, [sp, #0x88]
        ldr     r4, [sp, #0x1C]
        add     r12, sp, #0x88
        str     r12, [sp, #8]
        str     r4, [sp, #0xC]
        add     lr, sp, #0x8C
        add     r4, sp, #0x48
        str     lr, [sp, #4]
        str     r4, [sp]
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        add     r3, sp, #0x5C
        bl      LDTL_ownWeightedMSE_G729D
        ldr     r0, [pc, #0x418]
        ldrsh   r3, [sp, #0x8C]
        ldrsh   r2, [sp, #0x88]
        add     r1, r0, #4
        add     r0, r0, #0x24
        mov     lr, r2, lsl #2
        mov     r12, r3, lsl #2
        ldrsh   r3, [r0, +lr]
        ldrsh   r2, [r1, +r12]
        add     lr, r0, lr
        ldr     r0, [sp, #0x18]
        add     r3, r2, r3
        ldrsh   r2, [sp, #0x90]
        add     r1, r1, r12
        strh    r3, [r0]
        ldrsh   lr, [lr, #2]
        ldrsh   r1, [r1, #2]
        ldrsh   r0, [sp, #0x84]
        add     lr, r1, lr
        mov     r1, lr, asr #1
        mov     r3, r1, lsl #1
        mul     r0, r0, r3
        rsb     r3, r2, #3
        cmp     r3, #0
        suble   r2, r2, #3
        movle   r3, r0, asr r2
        ble     LDTL63
        bic     r3, r3, #0xFF, 8
        bic     r2, r3, #0xFF, 16
        mvn     r12, #2, 2
        cmp     r0, r12, asr r2
        mov     r3, #2, 2
        movgt   r3, r12
        bgt     LDTL63
        cmp     r0, r3, asr r2
        movge   r3, r0, lsl r2
LDTL63:
        ldr     r0, [sp, #0x18]
        mov     r3, r3, asr #16
        strh    r3, [r0, #2]
        ldr     r0, [sp, #0x20]
        bl      ownGainUpdate
        ldr     r2, [sp, #0x10]
        ldrsh   r0, [sp, #0x8C]
        ldrsh   r1, [sp, #0x88]
        strh    r0, [r2]
        strh    r1, [r2, #2]
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
LDTL64:
        ldr     r0, [sp, #0x14]
        cmp     r2, r0, asr #2
        movge   r0, #0
        bge     LDTL66
        ldr     r11, [pc, #0x348]
        mov     r0, #0
        sub     r11, r11, #4
LDTL65:
        add     r0, r0, #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        subs    r1, r0, #2
        beq     LDTL66
        mov     r1, r0, lsl #1
        ldrsh   r1, [r11, +r1]
        mul     r1, r12, r1
        cmp     r2, r1, asr #2
        blt     LDTL65
LDTL66:
        ldr     r2, [pc, #0x314]
        ldrsh   r2, [r2]
        mul     r2, r12, r2
        cmp     r6, r2, asr #5
        movge   r2, #0
        bge     LDTL55
        ldr     r11, [pc, #0x2FC]
        mov     r2, #0
LDTL67:
        add     r2, r2, #1
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        subs    r1, r2, #2
        beq     LDTL55
        mov     r1, r2, lsl #1
        ldrsh   r1, [r11, +r1]
        mul     r1, r12, r1
        cmp     r6, r1, asr #5
        blt     LDTL67
        b       LDTL55
LDTL68:
        rsb     r2, r2, #0
        bic     r2, r2, #0xFF, 8
        mvn     r12, #2, 2
        bic     r2, r2, #0xFF, 16
        cmp     r0, r12, asr r2
        mov     r12, #2, 2
        mvngt   r12, #2, 2
        bgt     LDTL48
        cmp     r0, r12, asr r2
        movge   r12, r0, lsl r2
        movlt   r12, #2, 2
        b       LDTL48
LDTL69:
        ldr     lr, [sp, #0x14]
        mvn     r12, #0x1E
        add     r12, r12, #2, 24
        cmp     lr, r12
        movlt   r12, lr
        str     r12, [sp, #0x14]
        add     lr, sp, #0x74
        strh    r12, [lr]
        b       LDTL41
LDTL70:
        mul     r12, r0, r11
        rsb     lr, lr, #1
        bic     lr, lr, #0xFF, 8
        mvn     r11, #2, 2
        bic     lr, lr, #0xFF, 16
        cmp     r12, r11, asr lr
        str     r12, [sp, #0x14]
        mov     r11, #2, 2
        mvngt   r11, #2, 2
        bgt     LDTL40
        ldr     r12, [sp, #0x14]
        cmp     r12, r11, asr lr
        ldrge   r12, [sp, #0x14]
        movge   r11, r12, lsl lr
        movlt   r11, #2, 2
        b       LDTL40
LDTL71:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        add     r0, r0, #1
        b       LDTL32
LDTL72:
        mov     r0, #0
        sub     r0, r0, #2, 18
        add     r0, r0, #1
        b       LDTL32
LDTL73:
        mvn     r3, #0x1E
        cmp     r11, r3
        movgt   r3, r11
        rsb     r3, r3, #0
        sub     lr, lr, r12, asr r3
        mov     r3, r0
        b       LDTL27
LDTL_ownWeightedMSE_G729D:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        ldr     r4, [sp, #0x84]
        ldr     lr, [pc, #0x1F0]
        ldr     r12, [sp, #0x78]
        ldr     r6, [sp, #0x7C]
        ldr     r5, [sp, #0x80]
        cmp     r4, #1
        sub     r4, lr, #0x20
        add     r9, r4, r1, lsl #2
        add     lr, lr, r2, lsl #2
        mvn     r10, #2, 2
        mov     r4, #0
        beq     LDTL77
        mov     r7, r9
        str     r9, [sp, #0x10]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r0, [sp, #0xC]
        str     r10, [sp, #4]
LDTL74:
        mov     r5, r2
        mov     r0, lr
        mov     r6, #6
        str     r1, [sp, #0x20]
        str     r6, [sp]
        str     r7, [sp, #0x14]
        str     lr, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r4, [sp, #8]
LDTL75:
        ldr     r1, [sp, #0x14]
        ldrsh   r4, [r0, #2]
        ldr     r2, [sp, #0x10]
        ldrsh   lr, [r1, #2]
        ldr     r1, [sp, #8]
        ldr     r8, [r3, #4]
        ldr     r6, [sp, #0xC]
        mov     r1, r1, lsl #2
        ldrsh   r1, [r2, +r1]
        ldrsh   r2, [r0]
        add     lr, lr, r4
        ldr     r4, [r12, #4]
        mov     lr, lr, asr #1
        mul     lr, r6, lr
        add     r2, r1, r2
        ldr     r1, [r3, #0xC]
        str     r1, [sp, #0x2C]
        mov     r1, r2, lsl #16
        ldr     r2, [r12, #0xC]
        mov     r7, lr, asr #15
        mul     r6, r7, r7
        mul     r2, r2, r7
        mov     r1, r1, asr #16
        mul     r4, r4, r1
        mul     lr, r1, r1
        mul     r9, r7, r1
        str     r2, [sp, #0x34]
        mov     r6, r6, asr #15
        str     r4, [sp, #0x30]
        ldr     r4, [r12]
        ldr     r10, [r3]
        ldr     r2, [r12, #8]
        mov     lr, lr, asr #15
        mov     r11, r6, lsl #16
        str     r10, [sp, #0x38]
        mov     lr, lr, lsl #16
        ldr     r10, [r12, #0x10]
        mov     lr, lr, asr #16
        mul     r6, r4, lr
        mov     r4, r11, asr #16
        ldr     r11, [r3, #8]
        mul     r2, r2, r4
        mov     r9, r9, asr #15
        str     r11, [sp, #0x3C]
        ldr     r11, [r3, #0x10]
        mov     r9, r9, lsl #16
        mov     r6, r6, asr #15
        mov     r2, r2, asr #15
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x30]
        mov     r11, r11, asr #15
        mla     r8, r8, r1, r11
        mov     r1, r9, asr #16
        ldr     r9, [sp, #0x34]
        mul     r10, r10, r1
        ldr     r11, [sp, #0x2C]
        mov     r9, r9, asr #15
        mov     r10, r10, asr #15
        mla     r7, r11, r7, r9
        ldr     r9, [sp, #0x38]
        mla     lr, r9, lr, r6
        ldr     r6, [sp, #0x3C]
        add     r7, r8, r7
        mla     r4, r6, r4, r2
        ldr     r2, [sp, #0x40]
        mla     r1, r2, r1, r10
        ldr     r2, [sp, #4]
        add     r4, lr, r4
        add     r4, r7, r4
        add     r1, r4, r1
        cmp     r1, r2
        bge     LDTL76
        ldr     lr, [sp, #0x20]
        ldr     r2, [sp, #0x18]
        strh    lr, [r2]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x1C]
        strh    r5, [r1]
LDTL76:
        ldr     r1, [sp]
        add     r5, r5, #1
        add     r0, r0, #4
        subs    r1, r1, #1
        str     r1, [sp]
        bne     LDTL75
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #0x20]
        ldr     r7, [sp, #0x14]
        ldr     lr, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        add     r4, r4, #1
        cmp     r4, #6
        add     r7, r7, #4
        add     r1, r1, #1
        blt     LDTL74
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000003
        .long   NormTable
        .long   NormTable2
        .long   LDTL_thr2_6k
        .long   LDTL_gbk2_6k
LDTL77:
        mov     r7, #0xFF
        orr     r7, r7, #0x3F, 24
        mov     r8, r9
        str     r9, [sp, #0x10]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r0, [sp, #0xC]
        str     r10, [sp, #4]
LDTL78:
        mov     r6, r2
        mov     r5, lr
        mov     r0, #6
        str     r1, [sp, #0x20]
        str     r8, [sp, #0x14]
        str     lr, [sp, #0x24]
        str     r2, [sp, #0x28]
LDTL79:
        ldr     r1, [sp, #0x10]
        mov     r2, r4, lsl #2
        ldrsh   r1, [r1, +r2]
        ldrsh   r2, [r5]
        add     r2, r1, r2
        mov     r1, r2, lsl #16
        mov     r2, r1, asr #16
        cmp     r7, r2
        ble     LDTL80
        ldr     r1, [sp, #0x14]
        ldrsh   r9, [r5, #2]
        ldr     lr, [r3, #4]
        ldrsh   r8, [r1, #2]
        mul     r1, r2, r2
        str     lr, [sp, #0x40]
        ldr     lr, [r12, #4]
        add     r8, r8, r9
        ldr     r9, [r3, #0xC]
        mul     lr, lr, r2
        mov     r8, r8, asr #1
        str     r9, [sp, #0x3C]
        ldr     r9, [r12, #0xC]
        str     lr, [sp, #0x38]
        ldr     lr, [sp, #0xC]
        mul     r8, lr, r8
        ldr     lr, [r3]
        str     lr, [sp, #0x34]
        ldr     lr, [r12]
        ldr     r10, [r3, #8]
        mov     r11, r8, asr #15
        mul     r8, r11, r2
        str     r10, [sp, #0x30]
        mul     r10, r11, r11
        str     r11, [sp, #0x2C]
        mul     r11, r9, r11
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        str     r11, [sp]
        ldr     r9, [r12, #8]
        mov     r8, r8, asr #16
        str     r9, [sp, #0x44]
        mov     r9, r1, asr #15
        mov     r1, r10, asr #15
        mov     r10, r9, lsl #16
        ldr     r9, [r3, #0x10]
        mov     r10, r10, asr #16
        mul     lr, lr, r10
        str     r9, [sp, #0x48]
        mov     r9, r1, lsl #16
        ldr     r1, [r12, #0x10]
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x44]
        mov     r9, r9, asr #16
        str     r9, [sp, #0x50]
        mul     r1, r1, r8
        mul     r9, r10, r9
        ldr     r10, [sp, #0x40]
        ldr     r11, [sp, #0x50]
        mov     lr, lr, asr #15
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x38]
        mov     r1, r1, asr #15
        mov     r9, r9, asr #15
        mla     r9, r10, r2, r9
        ldr     r2, [sp]
        ldr     r10, [sp, #0x2C]
        str     r9, [sp, #0x40]
        ldr     r9, [sp, #0x3C]
        mov     r2, r2, asr #15
        mla     r2, r9, r10, r2
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x4C]
        mla     r9, r9, r10, lr
        ldr     lr, [sp, #0x44]
        ldr     r10, [sp, #0x30]
        mov     lr, lr, asr #15
        mla     lr, r10, r11, lr
        ldr     r10, [sp, #0x48]
        mla     r8, r10, r8, r1
        ldr     r1, [sp, #0x40]
        add     lr, r9, lr
        add     r2, r1, r2
        ldr     r1, [sp, #4]
        add     lr, r2, lr
        add     r8, lr, r8
        cmp     r8, r1
        bge     LDTL80
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x18]
        strh    r1, [r2]
        ldr     r1, [sp, #0x1C]
        str     r8, [sp, #4]
        strh    r6, [r1]
LDTL80:
        subs    r0, r0, #1
        add     r6, r6, #1
        add     r5, r5, #4
        bne     LDTL79
        ldr     r1, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     lr, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        add     r4, r4, #1
        cmp     r4, #6
        add     r8, r8, #4
        add     r1, r1, #1
        blt     LDTL78
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDTL_coef_6k:
        .byte   0x44,0x49,0x74,0x50,0x36,0x66,0x7A,0x4B
LDTL_L_coef_6k:
        .byte   0xF5,0xD7,0x43,0x49,0xBE,0x16,0x74,0x50,0x7B,0xD6,0x35,0x66,0x42,0x5F,0x7A,0x4B
LDTL_thr1_6k:
        .byte   0xBF,0x26,0xDB,0x4C
LDTL_thr2_6k:
        .byte   0x51,0x43,0x38,0x62
LDTL_gbk1_6k:
        .byte   0xD9,0x16,0x00,0x00,0x71,0x0B,0x36,0x04,0xD1,0x24,0xAB,0x0A,0xB4,0x17,0xCD,0x17
        .byte   0x21,0x0E,0x5B,0x1A,0x63,0x0C,0x40,0x24,0x4B,0x0F,0x48,0x32,0x7B,0x13,0x16,0x57
LDTL_gbk2_6k:
        .byte   0x00,0x00,0x4F,0x10,0x94,0x0F,0x00,0x00,0x7E,0x11,0x9C,0x1C,0xC4,0x1E,0x8D,0x1E
        .byte   0x33,0x28,0x79,0x2C,0x4C,0x2A,0xD2,0x6B,0xB4,0x2E,0xEF,0x29,0x27,0x40,0x6C,0x3D


