        .text
        .align  4
        .globl  _ippsPostFilterLowBand_AMRWBE_16s


_ippsPostFilterLowBand_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4E, 30
        sub     sp, sp, #3, 22
        ldr     r7, [sp, #0xD5C]
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0xD64]
        add     r12, sp, #0x70
        and     r4, r12, #0xF
        add     lr, sp, #0xC7, 28
        str     r2, [sp, #0x54]
        mov     r2, #0xF7
        and     lr, lr, #0xF
        rsb     r4, r4, #0
        add     r5, sp, #0x70
        orr     r2, r2, #1, 24
        rsb     lr, lr, #0
        and     r4, r4, #0xF
        str     r7, [sp, #0x4C]
        ldr     r7, [sp, #0xD60]
        add     r5, r5, r4
        add     r2, r2, #0xF7
        and     lr, lr, #0xF
        add     r12, sp, #0xC7, 28
        add     r9, r5, r2
        add     r4, r12, lr
        add     r2, r4, #0x18
        cmp     r0, #0
        str     r7, [sp, #0x50]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        mov     r6, r3
        str     lr, [sp, #0x58]
        str     r2, [sp, #0x5C]
        beq     LDMI137
        ldr     r2, [sp, #0x44]
        cmp     r2, #0
        beq     LDMI137
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        beq     LDMI137
        cmp     r6, #0
        beq     LDMI137
        ldr     r2, [sp, #0x4C]
        cmp     r2, #0
        beq     LDMI137
        ldr     r2, [sp, #0x50]
        cmp     r2, #0
        beq     LDMI137
        ldr     r2, [sp, #0x54]
        add     r8, r5, #2, 22
        cmp     r2, #0
        mov     r2, #0xF7
        orr     r2, r2, #1, 24
        add     r2, r2, #0xDF
        add     r7, r5, r2
        beq     LDMI0
        mov     r2, #0xF
        add     r10, r2, #0x7A, 30
        mov     r0, r6
        mov     r2, r10
        mov     r1, r5
        bl      _ippsCopy_16s
        ldr     r11, [sp, #0x48]
        mov     r12, #0xF7
        orr     r12, r12, #1, 24
        mov     r2, #1, 22
        add     r1, r5, r12, lsl #1
        mov     r0, r11
        bl      _ippsCopy_16s
        mov     r1, r6
        mov     r2, r10
        mov     r0, r8
        bl      _ippsCopy_16s
        mov     r3, #0xB7
        mov     r1, r11
        mov     r0, r7
        mov     r2, #1, 22
        orr     r6, r3, #1, 24
        bl      _ippsCopy_16s
        add     r11, r6, #0x11, 26
        b       LDMI1
LDMI0:
        mov     r2, #0xF
        add     r11, r2, #0x6A, 30
        mov     r2, r11
        mov     r1, r5
        mov     r0, r6
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x48]
        mov     r12, #0xB7
        orr     r10, r12, #1, 24
        mov     r2, #1, 22
        add     r1, r5, r10, lsl #1
        bl      _ippsCopy_16s
        mov     r2, r10
        mov     r1, r6
        mov     r0, r8
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x48]
        mov     r2, #1, 22
        mov     r0, r7
        bl      _ippsCopy_16s
        add     r11, r11, #1, 22
LDMI1:
        cmp     r11, #0
        movle   r3, #0
        ble     LDMI6
        mov     r0, r5
        mov     r3, #0
        mov     r2, r11
LDMI2:
        ldrsh   r12, [r0], #2
        cmp     r12, #0
        mov     lr, r12
        bge     LDMI3
        cmn     r12, #2, 18
        beq     LDMI70
        rsb     lr, r12, #0
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDMI3:
        cmp     lr, r3
        ble     LDMI5
        cmp     r12, #0
        bge     LDMI4
        cmn     r12, #2, 18
        beq     LDMI71
        rsb     r12, r12, #0
        mov     r3, r12, lsl #16
        mov     r12, r3, asr #16
LDMI4:
        mov     r3, r12
LDMI5:
        subs    r2, r2, #1
        bne     LDMI2
LDMI6:
        cmn     r3, #1
        moveq   r0, #0xF
        beq     LDMI9
        cmp     r3, #0
        moveq   r0, #0
        beq     LDMI9
        cmp     r3, #0
        blt     LDMI72
LDMI7:
        bic     r3, r3, #0xFF, 8
        bic     r0, r3, #0xFF, 16
        movs    r2, r0, asr #8
        bne     LDMI8
        ldr     r2, [pc, #0xFDC]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r2, +r0]
        b       LDMI9
LDMI8:
        ldr     r0, [pc, #0xFD0]
        mov     r2, r2, lsl #1
        ldrsh   r0, [r0, +r2]
LDMI9:
        sub     r0, r0, #3
        mov     r0, r0, lsl #16
        mov     r8, r0, asr #16
        cmp     r8, #0
        ble     LDMI133
        cmp     r11, #0
        ble     LDMI13
        mvn     r0, #0xFF
        bic     r2, r0, #0x7F, 24
        bic     r3, r8, #0xFF, 8
        mov     r0, #0
        bic     r3, r3, #0xFF, 16
        mvn     r2, r2
        sub     r0, r0, #2, 18
LDMI10:
        ldrsh   r12, [r5]
        cmp     r12, r2, asr r3
        bgt     LDMI11
        cmp     r12, r0, asr r3
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        blt     LDMI12
        mov     r12, r12, lsl r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDMI12
LDMI11:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDMI12:
        strh    r12, [r5], #2
        subs    r11, r11, #1
        bne     LDMI10
LDMI13:
        mvn     r3, #0xFF
        rsb     r2, r8, #0
        bic     r3, r3, #0x7F, 24
        mov     r0, #0
        bic     r2, r2, #0xFF, 8
        sub     r11, r3, #2, 2
        bic     r2, r2, #0xFF, 16
        add     r12, r4, #0x80
        mvn     lr, #2, 2
        add     r5, r4, #0x30
        mvn     r6, #0
        mvn     r3, r3
        sub     r7, r0, #2, 18
        mov     r10, r0
        str     r7, [sp, #0x6C]
        str     r3, [sp, #0x2C]
        str     r6, [sp, #0x34]
        str     r5, [sp, #0x68]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x64]
        str     r2, [sp, #0x30]
        str     r0, [sp, #0x60]
LDMI14:
        ldr     r0, [sp, #0x60]
        ldr     r2, [sp, #0x44]
        mov     r0, r0, lsl #1
        ldrsh   r7, [r2, +r0]
        ldr     r2, [sp, #0x40]
        ldrsh   r1, [r2, +r0]
        cmp     r7, #1, 18
        movgt   r7, #1, 18
        cmp     r7, #0
        movlt   r7, #0
        mov     r0, r10, lsl #1
        str     r0, [sp, #0x28]
        add     r0, r9, r0
        str     r0, [sp, #0x24]
        bl      LDMI__ownShort_pitch_tracker
        mov     r5, r0
        ldr     r2, [sp, #0x54]
        cmp     r2, #0
        add     r2, r10, r5
        rsbne   r2, r2, #0x12, 26
        rsbeq   r2, r2, #0x11, 26
        mov     r2, r2, lsl #16
        mov     r6, r2, asr #16
        cmp     r6, #0
        movlt   r6, #0
        cmp     r6, #0x40
        movgt   r6, #0x40
        cmp     r6, #0
        ble     LDMI41
        cmp     r6, #0
        mov     r12, #0
        ble     LDMI17
        ldr     r2, [sp, #0x24]
        str     r4, [sp]
        ldr     lr, [sp, #0x34]
        ldr     r4, [sp, #0x3C]
        mov     r3, #0
        str     r9, [sp, #4]
LDMI15:
        ldrsh   r1, [r2], #2
        mul     r1, r1, r1
        cmp     r1, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r1, lsl #1
        mov     r9, r12, asr #31
        adds    r12, r12, r1
        adc     r1, r9, r1, asr #31
        subs    r9, r12, r4
        sbcs    r0, r1, #0
        movlt   r9, #0
        movlt   r0, #0
        orrs    r0, r9, r0
        mvnne   r12, #2, 2
        bne     LDMI16
        cmp     r12, #2, 2
        sbcs    r1, r1, lr
        movlt   r12, #2, 2
LDMI16:
        add     r3, r3, #1
        cmp     r3, r6
        blt     LDMI15
        str     r4, [sp, #0x3C]
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
        str     lr, [sp, #0x34]
LDMI17:
        cmp     r6, #0
        mov     r0, #0
        movle   r3, r0
        ble     LDMI20
        mov     r3, r0
        str     r8, [sp, #8]
        str     r4, [sp]
        ldr     r4, [sp, #0x34]
        ldr     r8, [sp, #0x3C]
        add     lr, r9, r5, lsl #1
        mov     r2, r10
        str     r10, [sp, #0xC]
        str     r9, [sp, #4]
LDMI18:
        mov     r1, r2, lsl #1
        ldrsh   r1, [lr, +r1]
        mul     r1, r1, r1
        cmp     r1, #1, 2
        mvneq   r1, #2, 2
        movne   r1, r1, lsl #1
        mov     r9, r3, asr #31
        adds    r3, r3, r1
        adc     r1, r9, r1, asr #31
        subs    r9, r3, r8
        sbcs    r10, r1, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        mvnne   r3, #2, 2
        bne     LDMI19
        cmp     r3, #2, 2
        sbcs    r1, r1, r4
        movlt   r3, #2, 2
LDMI19:
        add     r0, r0, #1
        cmp     r0, r6
        add     r2, r2, #1
        blt     LDMI18
        str     r4, [sp, #0x34]
        str     r8, [sp, #0x3C]
        ldr     r10, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
LDMI20:
        cmp     r12, #0
        moveq   r12, #1
        cmp     r12, #0
        mov     lr, r12
        moveq   r2, #0
        beq     LDMI24
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   r2, #0x1F
        beq     LDMI24
        cmp     r12, #0
        mvnlt   lr, r12
        cmp     lr, #0
        moveq   r2, #0
        beq     LDMI23
        movs    r2, lr, lsr #16
        bne     LDMI21
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r0, lr, asr #8
        ldrne   r2, [pc, #0xCFC]
        movne   lr, r0, lsl #1
        ldreq   r2, [pc, #0xCF0]
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r2, +lr]
        add     r2, lr, #0x10
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDMI23
LDMI21:
        movs    lr, lr, lsr #24
        bne     LDMI22
        ldr     lr, [pc, #0xCCC]
        mov     r2, r2, lsl #1
        ldrsh   r2, [lr, +r2]
        b       LDMI23
LDMI22:
        ldr     r2, [pc, #0xCC0]
        mov     lr, lr, lsl #1
        ldrsh   r2, [r2, +lr]
LDMI23:
        mov     r12, r12, lsl r2
LDMI24:
        mov     r12, r12, asr #16
        cmp     r3, #0
        mov     r12, r12, lsl #16
        mov     r0, r3
        mov     r12, r12, asr #16
        moveq   lr, #0
        beq     LDMI28
        cmn     r3, #1
        moveq   r3, #2, 2
        moveq   lr, #0x1F
        beq     LDMI28
        cmp     r3, #0
        mvnlt   r0, r3
        cmp     r0, #0
        moveq   lr, #0
        beq     LDMI27
        movs    lr, r0, lsr #16
        bne     LDMI25
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        movs    r1, r0, asr #8
        ldrne   lr, [pc, #0xC5C]
        movne   r0, r1, lsl #1
        ldreq   lr, [pc, #0xC50]
        moveq   r0, r0, lsl #1
        ldrsh   r0, [lr, +r0]
        add     lr, r0, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDMI27
LDMI25:
        movs    r0, r0, lsr #24
        bne     LDMI26
        ldr     r0, [pc, #0xC2C]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        b       LDMI27
LDMI26:
        ldr     lr, [pc, #0xC20]
        mov     r0, r0, lsl #1
        ldrsh   lr, [lr, +r0]
LDMI27:
        mov     r3, r3, lsl lr
LDMI28:
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, r12
        ble     LDMI29
        sub     lr, lr, #1
        mov     r3, r3, asr #1
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDMI29:
        cmp     r3, r12
        ble     LDMI31
LDMI30:
        mov     r3, #0
        str     r3, [sp, #0x38]
        b       LDMI37
LDMI31:
        cmp     r3, #0
        blt     LDMI30
        cmp     r12, #0
        blt     LDMI30
        cmp     r12, #0
        moveq   r3, #0
        streq   r3, [sp, #0x38]
        beq     LDMI37
        cmp     r3, #0
        moveq   r3, #0
        streq   r3, [sp, #0x38]
        beq     LDMI37
        cmp     r3, r12
        bne     LDMI32
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        str     r3, [sp, #0x38]
        b       LDMI37
LDMI32:
        mov     r0, #0
        str     r0, [sp, #0x38]
        str     r8, [sp, #8]
        str     r9, [sp, #4]
        str     r4, [sp]
        ldr     r4, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        ldr     r9, [sp, #0x3C]
        mov     r0, #0xF
        str     r11, [sp, #0x10]
        str     r10, [sp, #0xC]
LDMI33:
        mov     r4, r4, lsl #1
        mov     r3, r3, lsl #1
        mov     r1, r4, lsl #16
        cmp     r3, r12
        mov     r4, r1, asr #16
        blt     LDMI36
        mov     r1, r3, asr #31
        subs    r3, r3, r12
        sbc     r1, r1, r12, asr #31
        subs    r11, r3, r9
        sbcs    r10, r1, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r3, #2, 2
        bne     LDMI34
        cmp     r3, #2, 2
        sbcs    r1, r1, r8
        movlt   r3, #2, 2
LDMI34:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        add     r4, r4, #1
        mvn     r1, r1
        cmp     r1, r4
        blt     LDMI35
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        movlt   r1, #0
        sublt   r4, r1, #2, 18
        b       LDMI36
LDMI35:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r4, r1
LDMI36:
        subs    r0, r0, #1
        bne     LDMI33
        str     r4, [sp, #0x38]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x3C]
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
LDMI37:
        sub     lr, lr, r2
        ldr     r2, [sp, #0x38]
        mov     r3, lr, lsl #16
        add     r1, sp, #0xD3, 28
        add     r0, sp, #3, 22
        mov     r3, r3, asr #16
        str     r3, [sp, #0x38]
        add     r12, sp, #0xD, 24
        add     r3, r3, #0x10
        mov     r2, r2, lsl #16
        strh    r3, [r12, #0x30]
        str     r2, [sp, #0xD34]
        add     r0, r0, #0x4D, 30
        bl      ownInvSqrt_32s16s_I
        add     r12, sp, #0xD, 24
        ldr     r3, [sp, #0x38]
        ldrsh   r12, [r12, #0x30]
        ldr     r2, [sp, #0xD34]
        add     r3, r3, r12
        add     r12, r3, #7
        cmp     r12, #0
        ble     LDMI39
        bic     r12, r12, #0xFF, 8
        bic     r3, r12, #0xFF, 16
        ldr     r12, [sp, #0x3C]
        cmp     r2, r12, asr r3
        mvngt   r3, #2, 2
        bgt     LDMI38
        mov     r12, #2, 2
        cmp     r2, r12, asr r3
        movge   r3, r2, lsl r3
        movlt   r3, #2, 2
LDMI38:
        mov     r3, r3, asr #16
        b       LDMI40
LDMI39:
        mvn     r12, #6
        rsb     r12, r3, r12
        mov     r12, r2, asr r12
        mov     r3, r12, asr #16
LDMI40:
        mov     r2, r3, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, r7
        movlt   r7, r2
LDMI41:
        add     r2, sp, #0xD, 24
        cmp     r6, #0
        mov     r0, r7, asr #1
        strh    r7, [r2, #0x30]
        ble     LDMI47
        rsb     r2, r5, #0
        mov     lr, #0
        add     r3, r9, r2, lsl #1
        ldr     r2, [sp, #0x24]
        add     r1, r9, r5, lsl #1
        mov     r12, r10
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x68]
        str     r5, [sp, #0x20]
        str     r7, [sp, #0x14]
        str     r4, [sp]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r7, [sp, #0x3C]
        str     r3, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r10, [sp, #0xC]
        str     r8, [sp, #8]
        str     r9, [sp, #4]
LDMI42:
        ldrsh   r1, [r4], #2
        ldr     r3, [sp, #0x14]
        mul     r1, r3, r1
        cmp     r1, #1, 2
        mvneq   r8, #2, 2
        movne   r8, r1, lsl #1
        ldr     r1, [sp, #0x1C]
        mov     r3, r12, lsl #1
        ldrsh   r1, [r1, +r3]
        mul     r1, r0, r1
        cmp     r1, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r1, lsl #1
        subs    r1, r8, r9
        mov     r9, r9, asr #31
        rsc     r8, r9, r8, asr #31
        subs    r10, r1, r7
        sbcs    r9, r8, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r1, #2, 2
        bne     LDMI43
        cmp     r1, #2, 2
        sbcs    r8, r8, r5
        movlt   r1, #2, 2
LDMI43:
        ldr     r8, [sp, #0x18]
        ldrsh   r3, [r8, +r3]
        mul     r3, r0, r3
        cmp     r3, #1, 2
        mvneq   r8, #2, 2
        movne   r8, r3, lsl #1
        subs    r3, r1, r8
        mov     r8, r8, asr #31
        rsc     r1, r8, r1, asr #31
        subs    r9, r3, r7
        sbcs    r8, r1, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        mvnne   r3, #2, 2
        bne     LDMI44
        cmp     r3, #2, 2
        sbcs    r1, r1, r5
        movlt   r3, #2, 2
LDMI44:
        cmp     r11, r3
        ble     LDMI45
        add     r1, r3, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDMI46
LDMI45:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDMI46:
        add     lr, lr, #1
        strh    r1, [r2], #2
        cmp     lr, r6
        add     r12, r12, #1
        blt     LDMI42
        str     r5, [sp, #0x34]
        str     r7, [sp, #0x3C]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x14]
        ldr     r10, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
        str     r3, [sp, #0xD34]
LDMI47:
        cmp     r6, #0x40
        bge     LDMI53
        rsb     r5, r5, #0
        ldr     lr, [sp, #0x24]
        add     r2, r9, r5, lsl #1
        ldr     r5, [sp, #0x2C]
        ldr     r1, [sp, #0x68]
        mov     r0, r6
LDMI48:
        add     r12, r10, r0
        mov     r0, r0, lsl #1
        ldrsh   r3, [lr, +r0]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r2, +r12]
        sub     r3, r3, r12
        cmp     r5, r3
        blt     LDMI49
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDMI50
LDMI49:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDMI50:
        mul     r3, r7, r3
        cmp     r3, #1, 2
        mvneq   r3, #2, 2
        movne   r3, r3, lsl #1
        cmp     r11, r3
        ble     LDMI51
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDMI52
LDMI51:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDMI52:
        add     r6, r6, #1
        strh    r3, [r1, +r0]
        mov     r0, r6, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #0x40
        blt     LDMI48
        str     r5, [sp, #0x2C]
        str     r1, [sp, #0x68]
LDMI53:
        mov     r1, r4
        ldr     r0, [sp, #0x4C]
        mov     r2, #0x18
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x50]
        ldr     r2, [sp, #0x2C]
        ldrsh   r0, [r0]
        sub     r0, r8, r0
        cmp     r2, r0
        blt     LDMI54
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDMI55
LDMI54:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDMI55:
        cmp     r0, #0
        ble     LDMI84
        ldr     r12, [sp, #0x6C]
        ldr     lr, [sp, #0x2C]
        bic     r0, r0, #0xFF, 8
        bic     r0, r0, #0xFF, 16
        mov     r2, r4
        mov     r3, #0x18
LDMI56:
        ldrsh   r5, [r2]
        cmp     r5, lr, asr r0
        bgt     LDMI57
        cmp     r5, r12, asr r0
        movlt   r5, #0
        sublt   r5, r5, #2, 18
        blt     LDMI58
        mov     r5, r5, lsl r0
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        b       LDMI58
LDMI57:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
LDMI58:
        strh    r5, [r2], #2
        subs    r3, r3, #1
        bne     LDMI56
        str     r12, [sp, #0x6C]
        str     lr, [sp, #0x2C]
LDMI59:
        ldr     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x64]
        mov     r2, #0x18
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x48]
        cmp     r8, #0
        mov     r3, #0x40
        add     r0, r0, r2
        blt     LDMI73
        ldr     r12, [sp, #0x5C]
        str     r9, [sp, #4]
        ldr     r5, [pc, #0x6F4]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x34]
        ldr     r9, [sp, #0x3C]
        str     r10, [sp, #0xC]
        str     r4, [sp]
LDMI60:
        ldrsh   r1, [r12]
        mov     r2, #0xD3, 30
        orr     r2, r2, #2, 22
        mul     r2, r1, r2
        cmp     r2, #1, 2
        mvneq   r2, #2, 2
        movne   r2, r2, lsl #1
        mov     r4, #1
        add     r1, r5, #2
        add     lr, r12, #2
        str     r11, [sp, #0x10]
        str     r8, [sp, #8]
LDMI61:
        rsb     r10, r4, #0
        ldrsh   r8, [lr], #2
        mov     r10, r10, lsl #1
        ldrsh   r10, [r12, +r10]
        add     r8, r10, r8
        cmp     r6, r8
        blt     LDMI62
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDMI63
LDMI62:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDMI63:
        ldrsh   r10, [r1], #2
        mul     r8, r10, r8
        cmp     r8, #1, 2
        mvneq   r8, #2, 2
        movne   r8, r8, lsl #1
        mov     r10, r2, asr #31
        adds    r2, r2, r8
        adc     r8, r10, r8, asr #31
        subs    r11, r2, r9
        sbcs    r10, r8, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r2, #2, 2
        bne     LDMI64
        cmp     r2, #2, 2
        sbcs    r8, r8, r7
        movlt   r2, #2, 2
LDMI64:
        add     r4, r4, #1
        cmp     r4, #0xC
        ble     LDMI61
        ldr     r8, [sp, #8]
        ldr     r11, [sp, #0x10]
        mov     r1, r2, asr r8
        cmp     r11, r1
        ble     LDMI65
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDMI66
LDMI65:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDMI66:
        ldrsh   lr, [r0]
        sub     lr, lr, r1
        cmp     r6, lr
        blt     LDMI67
        cmn     lr, #2, 18
        movge   r1, lr, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDMI68
LDMI67:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDMI68:
        strh    r1, [r0], #2
        subs    r3, r3, #1
        add     r12, r12, #2
        bne     LDMI60
        str     r9, [sp, #0x3C]
        ldr     r10, [sp, #0xC]
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x34]
LDMI69:
        ldr     r0, [sp, #0x50]
        add     r10, r10, #0x40
        strh    r8, [r0]
        ldr     r3, [sp, #0x60]
        mov     r0, r10, lsl #16
        mov     r10, r0, asr #16
        add     r3, r3, #1
        cmp     r10, #1, 22
        str     r3, [sp, #0x60]
        strlt   r2, [sp, #0xD34]
        blt     LDMI14
        b       LDMI138
LDMI70:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        b       LDMI3
LDMI71:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r12, r3
        b       LDMI4
LDMI72:
        mvn     r3, r3
        mov     r0, r3, lsl #16
        mov     r3, r0, asr #16
        b       LDMI7
LDMI73:
        ldr     r12, [sp, #0x5C]
        str     r10, [sp, #0xC]
        str     r8, [sp, #8]
        ldr     r5, [pc, #0x51C]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x3C]
        ldr     r10, [sp, #0x30]
        str     r9, [sp, #4]
        str     r4, [sp]
        mov     r9, #2, 2
LDMI74:
        ldrsh   r1, [r12]
        mov     r2, #0xD3, 30
        orr     r2, r2, #2, 22
        mul     r2, r1, r2
        cmp     r2, #1, 2
        mvneq   r2, #2, 2
        movne   r2, r2, lsl #1
        mov     r4, #1
        add     r1, r5, #2
        add     lr, r12, #2
        str     r11, [sp, #0x10]
        str     r10, [sp, #0x30]
LDMI75:
        rsb     r10, r4, #0
        ldrsh   r9, [lr], #2
        mov     r10, r10, lsl #1
        ldrsh   r10, [r12, +r10]
        add     r9, r10, r9
        cmp     r6, r9
        blt     LDMI76
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        b       LDMI77
LDMI76:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LDMI77:
        ldrsh   r10, [r1], #2
        mul     r9, r10, r9
        cmp     r9, #1, 2
        mvneq   r9, #2, 2
        movne   r9, r9, lsl #1
        mov     r10, r2, asr #31
        adds    r2, r2, r9
        adc     r9, r10, r9, asr #31
        subs    r11, r2, r8
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r2, #2, 2
        bne     LDMI78
        cmp     r2, #2, 2
        sbcs    r9, r9, r7
        movlt   r2, #2, 2
LDMI78:
        add     r4, r4, #1
        cmp     r4, #0xC
        ble     LDMI75
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x10]
        mov     r9, #2, 2
        cmp     r2, r8, asr r10
        mvngt   r1, #2, 2
        bgt     LDMI79
        cmp     r2, r9, asr r10
        movge   r1, r2, lsl r10
        movlt   r1, #2, 2
LDMI79:
        cmp     r11, r1
        ble     LDMI80
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDMI81
LDMI80:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDMI81:
        ldrsh   lr, [r0]
        sub     lr, lr, r1
        cmp     r6, lr
        blt     LDMI82
        cmn     lr, #2, 18
        movge   r1, lr, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, #0xFF
        biclt   r1, r1, #0x7F, 24
        b       LDMI83
LDMI82:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDMI83:
        strh    r1, [r0], #2
        subs    r3, r3, #1
        add     r12, r12, #2
        bne     LDMI74
        str     r8, [sp, #0x3C]
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0xC]
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x34]
        b       LDMI69
LDMI84:
        ldr     r2, [sp, #0x58]
        rsb     r0, r0, #0
        add     r3, sp, #0xC7, 28
        ldrsh   r2, [r2, +r3]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        rsb     r0, r0, #0x10
        mov     r2, r2, lsl r0
        cmp     r11, r2
        ble     LDMI85
        add     r2, r2, #2, 18
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDMI86
LDMI85:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI86:
        ldr     r3, [sp, #0x58]
        add     r12, sp, #0xC7, 28
        strh    r2, [r3, +r12]
        ldrsh   r2, [r4, #2]
        mov     r2, r2, lsl r0
        cmp     r11, r2
        ble     LDMI87
        add     r2, r2, #2, 18
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        b       LDMI88
LDMI87:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI88:
        ldrsh   r3, [r4, #4]
        strh    r2, [r4, #2]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI89
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI90
LDMI89:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI90:
        ldrsh   r3, [r4, #6]
        strh    r2, [r4, #4]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI91
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI92
LDMI91:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI92:
        ldrsh   r3, [r4, #8]
        strh    r2, [r4, #6]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI93
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI94
LDMI93:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI94:
        ldrsh   r3, [r4, #0xA]
        strh    r2, [r4, #8]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI95
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI96
LDMI95:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI96:
        ldrsh   r3, [r4, #0xC]
        strh    r2, [r4, #0xA]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI97
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI98
LDMI97:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI98:
        ldrsh   r3, [r4, #0xE]
        strh    r2, [r4, #0xC]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI99
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI100
LDMI99:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI100:
        ldrsh   r3, [r4, #0x10]
        strh    r2, [r4, #0xE]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI101
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI102
LDMI101:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI102:
        ldrsh   r3, [r4, #0x12]
        strh    r2, [r4, #0x10]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI103
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI104
LDMI103:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI104:
        ldrsh   r3, [r4, #0x14]
        strh    r2, [r4, #0x12]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI105
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI106
LDMI105:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI106:
        ldrsh   r3, [r4, #0x16]
        strh    r2, [r4, #0x14]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI107
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI108
LDMI107:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI108:
        ldrsh   r3, [r4, #0x18]
        strh    r2, [r4, #0x16]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI109
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI110
LDMI109:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI110:
        ldrsh   r3, [r4, #0x1A]
        strh    r2, [r4, #0x18]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI111
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI112
LDMI111:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI112:
        ldrsh   r3, [r4, #0x1C]
        strh    r2, [r4, #0x1A]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI113
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI114
LDMI113:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI114:
        ldrsh   r3, [r4, #0x1E]
        strh    r2, [r4, #0x1C]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI115
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI116
LDMI115:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI116:
        ldrsh   r3, [r4, #0x20]
        strh    r2, [r4, #0x1E]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI117
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI118
        .long   NormTable2
        .long   NormTable
        .long   LDMI_Filt_lp
LDMI117:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI118:
        ldrsh   r3, [r4, #0x22]
        strh    r2, [r4, #0x20]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI119
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI120
LDMI119:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI120:
        ldrsh   r3, [r4, #0x24]
        strh    r2, [r4, #0x22]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI121
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI122
LDMI121:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI122:
        ldrsh   r3, [r4, #0x26]
        strh    r2, [r4, #0x24]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI123
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI124
LDMI123:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI124:
        ldrsh   r3, [r4, #0x28]
        strh    r2, [r4, #0x26]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI125
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI126
LDMI125:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI126:
        ldrsh   r3, [r4, #0x2A]
        strh    r2, [r4, #0x28]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI127
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI128
LDMI127:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI128:
        ldrsh   r3, [r4, #0x2C]
        strh    r2, [r4, #0x2A]
        mov     r3, r3, lsl r0
        cmp     r11, r3
        ble     LDMI129
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r3, asr #16
        b       LDMI130
LDMI129:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LDMI130:
        ldrsh   r3, [r4, #0x2E]
        strh    r2, [r4, #0x2C]
        mov     r0, r3, lsl r0
        cmp     r11, r0
        ble     LDMI131
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDMI132
LDMI131:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDMI132:
        strh    r0, [r4, #0x2E]
        b       LDMI59
LDMI133:
        cmp     r11, #0
        rsb     r2, r8, #0
        ble     LDMI13
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        rsb     r2, r2, #0x10
        sub     r0, r0, #2, 2
LDMI134:
        ldrsh   r3, [r5]
        mov     r3, r3, lsl r2
        cmp     r0, r3
        ble     LDMI135
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDMI136
LDMI135:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r3, r3
LDMI136:
        strh    r3, [r5], #2
        subs    r11, r11, #1
        bne     LDMI134
        b       LDMI13
LDMI137:
        add     sp, sp, #0x4E, 30
        mvn     r0, #7
        add     sp, sp, #3, 22
        ldmia   sp!, {r4 - r11, pc}
LDMI138:
        add     sp, sp, #0x4E, 30
        mov     r0, #0
        add     sp, sp, #3, 22
        ldmia   sp!, {r4 - r11, pc}
LDMI__ownShort_pitch_tracker:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r4, r1
        mov     r2, r4, lsl #16
        mov     r12, #1
        mov     r2, r2, asr #17
        mov     lr, r12
        mov     r3, r2, lsl #16
        mvn     r2, #0x5F
        mov     r5, r3, asr #16
        rsb     r2, r5, r2
        sub     r3, r0, #0xC0
        add     r2, r0, r2, lsl #1
        mov     r8, lr
        mov     r10, #0
        mvn     r9, #2, 2
LDMI139:
        mov     r6, r3
        mov     r7, #0
        mov     r11, #0x28
        str     r4, [sp]
LDMI140:
        ldrsh   r0, [r6], #2
        mul     r0, r0, r0
        cmp     r0, #1, 2
        mvneq   r0, #2, 2
        movne   r0, r0, lsl #1
        mov     r1, r7, asr #31
        adds    r7, r7, r0
        adc     r0, r1, r0, asr #31
        subs    r4, r7, r9
        sbcs    r1, r0, #0
        movlt   r4, #0
        movlt   r1, #0
        orrs    r1, r4, r1
        mvnne   r7, #2, 2
        bne     LDMI141
        cmp     r7, #2, 2
        mvn     r1, #0
        sbcs    r0, r0, r1
        movlt   r7, #2, 2
LDMI141:
        subs    r11, r11, #1
        bne     LDMI140
        ldr     r4, [sp]
        mov     r11, #0
        mov     r6, r3
        mov     r0, r2
        mov     r1, #0x28
        str     r10, [sp, #8]
        str     r5, [sp, #4]
        str     r4, [sp]
LDMI142:
        ldrsh   r4, [r0], #2
        ldrsh   r5, [r6], #2
        mul     r4, r5, r4
        cmp     r4, #1, 2
        mvneq   r4, #2, 2
        movne   r4, r4, lsl #1
        mov     r5, r11, asr #31
        adds    r11, r11, r4
        adc     r4, r5, r4, asr #31
        subs    r10, r11, r9
        sbcs    r5, r4, #0
        movlt   r10, #0
        movlt   r5, #0
        orrs    r5, r10, r5
        mvnne   r11, #2, 2
        bne     LDMI143
        cmp     r11, #2, 2
        mvn     r5, #0
        sbcs    r4, r4, r5
        movlt   r11, #2, 2
LDMI143:
        subs    r1, r1, #1
        bne     LDMI142
        ldr     r10, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
        mov     r6, #0
        mov     r0, r2
        mov     r1, #0x28
        str     r10, [sp, #8]
        str     r5, [sp, #4]
        str     r4, [sp]
LDMI144:
        ldrsh   r4, [r0], #2
        mul     r4, r4, r4
        cmp     r4, #1, 2
        mvneq   r4, #2, 2
        movne   r4, r4, lsl #1
        mov     r5, r6, asr #31
        adds    r6, r6, r4
        adc     r4, r5, r4, asr #31
        subs    r10, r6, r9
        sbcs    r5, r4, #0
        movlt   r10, #0
        movlt   r5, #0
        orrs    r5, r10, r5
        mvnne   r6, #2, 2
        bne     LDMI145
        cmp     r6, #2, 2
        mvn     r5, #0
        sbcs    r4, r4, r5
        movlt   r6, #2, 2
LDMI145:
        subs    r1, r1, #1
        bne     LDMI144
        ldr     r10, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
        mov     r7, r7, asr #1
        mov     r0, lr, asr #31
        adds    lr, lr, r7
        adc     r7, r0, r7, asr #31
        subs    r1, lr, r9
        sbcs    r0, r7, #0
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        mvnne   lr, #2, 2
        bne     LDMI146
        cmp     lr, #2, 2
        mvn     r0, #0
        sbcs    r7, r7, r0
        movlt   lr, #2, 2
LDMI146:
        mov     r11, r11, asr #1
        mov     r7, r8, asr #31
        adds    r8, r8, r11
        adc     r11, r7, r11, asr #31
        subs    r0, r8, r9
        sbcs    r7, r11, #0
        movlt   r0, #0
        movlt   r7, #0
        orrs    r0, r0, r7
        mvn     r7, #2, 2
        movne   r8, r7
        bne     LDMI147
        cmp     r8, #2, 2
        mvn     r0, #0
        sbcs    r11, r11, r0
        movlt   r8, #2, 2
LDMI147:
        mov     r11, r12, asr #31
        mov     r6, r6, asr #1
        adds    r12, r12, r6
        adc     r11, r11, r6, asr #31
        subs    r0, r12, r9
        sbcs    r6, r11, #0
        movlt   r0, #0
        movlt   r6, #0
        orrs    r0, r0, r6
        mvn     r6, #0
        movne   r12, r7
        bne     LDMI148
        cmp     r12, #2, 2
        sbcs    r11, r11, r6
        movlt   r12, #2, 2
LDMI148:
        add     r10, r10, #0x28
        cmp     r10, #0xA0
        add     r2, r2, #0x50
        add     r3, r3, #0x50
        blt     LDMI139
        mov     r2, lr, asr #16
        mov     r3, r12, asr #16
        mov     r2, r2, lsl #16
        mov     r9, r3, lsl #16
        mov     r3, r2, asr #16
        mov     r2, r9, asr #16
        mul     r9, r3, r2
        add     r10, r6, #2, 18
        and     lr, r10, lr, asr #1
        and     r10, r10, r12, asr #1
        cmp     r9, #1, 2
        moveq   r12, r7
        movne   r12, r9, lsl #1
        mul     r10, r3, r10
        mov     r3, r10, asr #15
        cmp     r3, #1, 2
        moveq   r9, r7
        movne   r9, r3, lsl #1
        adds    r3, r12, r9
        mov     r9, r9, asr #31
        adc     r12, r9, r12, asr #31
        subs    r9, r3, r7
        sbcs    r10, r12, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        movne   r3, r7
        bne     LDMI149
        cmp     r3, #2, 2
        sbcs    r12, r12, r6
        movlt   r3, #2, 2
LDMI149:
        mul     r2, lr, r2
        mov     r2, r2, asr #15
        cmp     r2, #1, 2
        moveq   r12, r7
        movne   r12, r2, lsl #1
        adds    r2, r3, r12
        mov     r12, r12, asr #31
        adc     r3, r12, r3, asr #31
        subs    r12, r2, r7
        sbcs    lr, r3, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r2, r7
        bne     LDMI150
        cmp     r2, #2, 2
        sbcs    r3, r3, r6
        movlt   r2, #2, 2
LDMI150:
        mov     r0, r2, asr #1
        bl      _ownIsqrt
        mov     r2, r8, asr #17
        mov     r3, r0, asr #16
        mov     r2, r2, lsl #16
        mov     r12, r3, lsl #16
        mov     r3, r2, asr #16
        mov     r2, r12, asr #16
        mul     r12, r3, r2
        add     lr, r6, #2, 18
        and     r0, lr, r0, asr #1
        and     r8, lr, r8, asr #2
        cmp     r12, #1, 2
        moveq   r12, r7
        movne   r12, r12, lsl #1
        mul     r0, r3, r0
        mov     r3, r0, asr #15
        cmp     r3, #1, 2
        moveq   lr, r7
        movne   lr, r3, lsl #1
        adds    r3, r12, lr
        mov     lr, lr, asr #31
        adc     r12, lr, r12, asr #31
        subs    lr, r3, r7
        sbcs    r9, r12, #0
        movlt   lr, #0
        movlt   r9, #0
        orrs    r9, lr, r9
        movne   r3, r7
        bne     LDMI151
        cmp     r3, #2, 2
        sbcs    r12, r12, r6
        movlt   r3, #2, 2
LDMI151:
        mul     r2, r8, r2
        mov     r2, r2, asr #15
        cmp     r2, #1, 2
        moveq   r12, r7
        movne   r12, r2, lsl #1
        adds    r2, r3, r12
        mov     r12, r12, asr #31
        adc     r3, r12, r3, asr #31
        subs    r12, r2, r7
        sbcs    lr, r3, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r2, r7
        bne     LDMI152
        cmp     r2, #2, 2
        sbcs    r3, r3, r6
        movlt   r2, #2, 2
LDMI152:
        mov     r3, #0x9A
        orr     r3, r3, #0x79, 24
        cmp     r3, r2
        movlt   r4, r5
        mov     r0, r4
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDMI_Filt_lp:
        .byte   0x4C,0x0B,0x0F,0x0B,0x61,0x0A,0x50,0x09,0xF9,0x07,0x7B,0x06,0xF7,0x04,0x8B,0x03
        .byte   0x52,0x02,0x5B,0x01,0xAB,0x00,0x40,0x00,0x0D,0x00


