        .text
        .align  4
        .globl  _ippsResamplePolyphase_AMRWBE_16s


_ippsResamplePolyphase_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5E, 30
        sub     sp, sp, #0xF, 22
        add     r7, sp, #3, 20
        ldr     r7, [r7, #0xD9C]
        add     r8, sp, #3, 20
        ldr     r8, [r8, #0xDA0]
        add     r4, sp, #3, 20
        ldr     r4, [r4, #0xDA4]
        add     r6, sp, #3, 20
        ldr     r6, [r6, #0xDA8]
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r11, r3
        beq     LDEA49
        cmp     r7, #0
        beq     LDEA49
        cmp     r8, #0
        beq     LDEA49
        cmp     r4, #0
        beq     LDEA49
        cmp     r9, #0
        ble     LDEA48
        cmp     r6, #0
        ble     LDEA48
        mov     r5, r2
        cmp     r5, #0xC
        blt     LDEA0
        cmp     r11, #0xC
        blt     LDEA0
        add     sp, sp, #0x5E, 30
        mov     r0, #0
        add     sp, sp, #0xF, 22
        ldmia   sp!, {r4 - r11, pc}
LDEA0:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        str     lr, [sp, #0x54]
        mov     lr, #0
        cmp     r11, #0xC
        str     lr, [sp, #0x50]
        beq     LDEA12
        add     r1, sp, #0x58
        mov     r2, #0x18
        mov     r0, r8
        bl      _ippsCopy_16s
        add     r1, sp, #0x88
        mov     r0, r10
        mov     r2, r9
        bl      _ippsCopy_16s
        add     lr, sp, #0x58
        add     r0, lr, r9, lsl #1
        mov     r1, r8
        mov     r2, #0x18
        bl      _ippsCopy_16s
        cmp     r11, r5
        mov     r0, r11
        blt     LDEA2
        ldr     r1, [sp, #0x50]
LDEA1:
        sub     r0, r0, r5
        cmp     r0, r5
        add     r1, r1, #1
        bge     LDEA1
        str     r1, [sp, #0x50]
LDEA2:
        ldr     r1, [sp, #0x50]
        rsb     r0, r5, #0
        cmp     r6, #0
        mla     r11, r1, r0, r11
        ldrsh   r0, [r7]
        add     lr, r1, #1
        sub     r8, r5, r11
        ble     LDEA11
        ldr     r2, [sp, #0x54]
        ldr     r1, [pc, #0x964]
        mov     r10, #0
        sub     r3, r2, #2, 2
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r9, r2, #1, 18
        mov     r2, r5, lsl #1
        str     r4, [sp, #0x48]
        str     r9, [sp, #0x34]
        str     r3, [sp, #0x38]
        str     r10, [sp, #0x40]
        str     r8, [sp, #0x3C]
        str     r11, [sp, #0x30]
        str     lr, [sp, #0x2C]
        str     r5, [sp, #0x4C]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0xC]
LDEA3:
        ldr     r3, [sp, #0x40]
        add     lr, sp, #0x6E
        mov     r4, r0, lsl #1
        mov     r3, r3, lsl #1
        ldrsh   r6, [lr, +r3]
        add     lr, lr, r3
        ldr     r3, [sp, #0x4C]
        ldrsh   r7, [r1, +r4]
        ldrsh   r5, [lr, #2]
        ldrsh   r11, [lr, #-6]
        mul     r6, r7, r6
        sub     r3, r3, r0
        ldrsh   r7, [lr, #-2]
        mov     r3, r3, lsl #1
        ldrsh   r8, [r1, +r3]
        add     r4, r1, r4
        ldrsh   r9, [r4, +r2]
        add     r3, r1, r3
        mla     r10, r8, r5, r6
        ldrsh   r6, [lr, #4]
        ldrsh   r5, [r3, +r2]
        ldrsh   r8, [lr, #-4]
        add     r3, r2, r3
        mla     r10, r7, r9, r10
        add     r7, r2, r4
        ldrsh   r9, [r7, +r2]
        ldrsh   r4, [lr, #6]
        str     r11, [sp, #0x54]
        mla     r10, r6, r5, r10
        ldrsh   r11, [lr, #-8]
        ldrsh   r5, [r3, +r2]
        ldrsh   r6, [lr, #8]
        str     r11, [sp, #0x28]
        mla     r10, r8, r9, r10
        ldrsh   r9, [lr, #0xA]
        ldr     r11, [sp, #0x54]
        add     r7, r2, r7
        ldrsh   r8, [r7, +r2]
        mla     r10, r4, r5, r10
        str     r9, [sp, #0x24]
        ldrsh   r9, [lr, #-0xA]
        add     r5, r2, r3
        ldrsh   r3, [r5, +r2]
        mla     r10, r11, r8, r10
        add     r7, r2, r7
        add     r5, r2, r5
        str     r3, [sp, #0x20]
        ldrsh   r8, [r7, +r2]
        ldrsh   r11, [lr, #0xE]
        ldrsh   r4, [lr, #0xC]
        ldrsh   r3, [lr, #-0xC]
        str     r11, [sp, #0x54]
        ldrsh   r11, [lr, #-0xE]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x20]
        mla     r6, r6, r11, r10
        ldrsh   r10, [r5, +r2]
        ldrsh   r11, [lr, #0x10]
        add     r5, r2, r5
        str     r11, [sp, #0x20]
        ldrsh   r11, [lr, #-0x10]
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x28]
        mla     r11, r11, r8, r6
        add     r6, r2, r7
        ldrsh   r7, [lr, #0x12]
        ldrsh   r8, [r6, +r2]
        add     r6, r2, r6
        str     r7, [sp, #0x28]
        ldrsh   r7, [lr, #-0x12]
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #0x24]
        mla     r11, r7, r10, r11
        ldrsh   r10, [lr, #0x14]
        ldrsh   r7, [r5, +r2]
        str     r10, [sp, #0x24]
        ldrsh   r10, [lr, #-0x14]
        mla     r11, r9, r8, r11
        str     r10, [sp, #8]
        ldrsh   r9, [lr, #0x16]
        ldrsh   r8, [r6, +r2]
        ldr     r10, [sp, #0x1C]
        mla     r11, r4, r7, r11
        str     r9, [sp, #4]
        ldrsh   r9, [lr, #-0x16]
        add     r4, r2, r5
        str     r9, [sp]
        mla     r8, r3, r8, r11
        ldrsh   r5, [r4, +r2]
        ldrsh   lr, [lr, #0x18]
        add     r9, r2, r6
        ldrsh   r7, [r9, +r2]
        add     r3, r2, r9
        ldr     r9, [sp, #0x54]
        ldr     r11, [sp, #0x18]
        add     r6, r2, r4
        ldrsh   r4, [r6, +r2]
        mla     r9, r9, r5, r8
        ldrsh   r5, [r3, +r2]
        add     r8, r2, r6
        ldrsh   r6, [r8, +r2]
        mla     r9, r10, r7, r9
        add     r8, r2, r8
        ldrsh   r10, [r8, +r2]
        add     r3, r2, r3
        ldrsh   r7, [r3, +r2]
        add     r3, r2, r3
        str     r10, [sp, #0x54]
        ldr     r10, [sp, #0x20]
        add     r8, r2, r8
        mla     r4, r10, r4, r9
        ldrsh   r10, [r8, +r2]
        ldrsh   r9, [r3, +r2]
        add     r3, r2, r3
        ldrsh   r3, [r3, +r2]
        mla     r4, r11, r5, r4
        add     r8, r2, r8
        ldrsh   r5, [r8, +r2]
        ldr     r8, [sp, #0x28]
        mla     r4, r8, r6, r4
        ldr     r6, [sp, #0x10]
        mla     r7, r6, r7, r4
        ldr     r4, [sp, #0x54]
        ldr     r6, [sp, #0x24]
        mla     r7, r6, r4, r7
        ldr     r4, [sp, #8]
        mla     r7, r4, r9, r7
        ldr     r4, [sp, #4]
        mla     r7, r4, r10, r7
        ldr     r4, [sp]
        mla     r7, r4, r3, r7
        mla     r7, lr, r5, r7
        cmn     r7, #7, 2
        mvngt   r3, #2, 2
        bgt     LDEA4
        cmp     r7, #3, 2
        movge   r3, r7, lsl #1
        movlt   r3, #2, 2
LDEA4:
        ldr     lr, [sp, #0x38]
        cmp     lr, r3
        ble     LDEA5
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDEA6
LDEA5:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDEA6:
        rsb     r3, r3, r3, lsl #15
        add     r3, r3, #1, 18
        ldr     lr, [sp, #0x34]
        mov     r3, r3, asr #15
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     lr, r3
        blt     LDEA7
        cmn     r3, #1, 18
        movlt   r3, #0
        sublt   lr, r3, #2, 18
        blt     LDEA8
        mov     r3, r3, lsl #1
        mov     r3, r3, lsl #16
        mov     lr, r3, asr #16
        b       LDEA8
LDEA7:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     lr, r3
LDEA8:
        ldr     r3, [sp, #0x48]
        strh    lr, [r3], #2
        ldr     lr, [sp, #0x3C]
        str     r3, [sp, #0x48]
        cmp     r0, lr
        blt     LDEA9
        ldr     r3, [sp, #0x2C]
        ldr     lr, [sp, #0x40]
        add     r3, lr, r3
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        sub     r0, r0, r3
        b       LDEA10
LDEA9:
        ldr     r3, [sp, #0x40]
        ldr     lr, [sp, #0x50]
        add     r3, lr, r3
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #0x30]
        add     r0, r3, r0
LDEA10:
        ldr     r3, [sp, #0x14]
        subs    r3, r3, #1
        str     r3, [sp, #0x14]
        bne     LDEA3
        ldr     r7, [sp, #0xC]
LDEA11:
        add     sp, sp, #0x5E, 30
        strh    r0, [r7]
        mov     r0, #0
        add     sp, sp, #0xF, 22
        ldmia   sp!, {r4 - r11, pc}
LDEA12:
        cmn     r5, #1
        moveq   lr, #0xF
        beq     LDEA15
        cmp     r5, #0
        ldreq   lr, [sp, #0x50]
        beq     LDEA15
        cmp     r5, #0
        blt     LDEA47
LDEA13:
        bic     r2, r2, #0xFF, 8
        bic     lr, r2, #0xFF, 16
        movs    r0, lr, asr #8
        bne     LDEA14
        ldr     r0, [pc, #0x5E0]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        b       LDEA15
LDEA14:
        ldr     lr, [pc, #0x5D4]
        mov     r0, r0, lsl #1
        ldrsh   lr, [lr, +r0]
LDEA15:
        mov     r0, r5, lsl lr
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, #9, 22
        bge     LDEA16
        b       LDEA22
LDEA16:
        cmp     r0, #0
        blt     LDEA22
        cmp     r0, #0
        moveq   r1, #0
        streq   r1, [sp, #0x50]
        beq     LDEA22
        cmp     r0, #9, 22
        bne     LDEA17
        ldr     r1, [sp, #0x54]
        mvn     r1, r1
        str     r1, [sp, #0x50]
        b       LDEA22
LDEA17:
        ldr     r1, [sp, #0x54]
        mvn     r3, #2, 2
        mvn     r2, #0
        mvn     r1, r1
        str     r1, [sp, #0x40]
        mov     r1, #0
        str     r1, [sp, #0x50]
        str     r2, [sp, #0x44]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r9, [sp, #4]
        ldr     r8, [sp, #0x40]
        ldr     r9, [sp, #0x44]
        ldr     r7, [sp, #0x50]
        mov     r1, #9, 22
        mov     r2, #0xF
        str     r6, [sp, #0x14]
        str     r11, [sp, #8]
        str     r10, [sp]
LDEA18:
        mov     r7, r7, lsl #1
        mov     r1, r1, lsl #1
        mov     r7, r7, lsl #16
        cmp     r1, r0
        mov     r7, r7, asr #16
        blt     LDEA21
        mov     r6, r1, asr #31
        subs    r1, r1, r0
        sbc     r6, r6, r0, asr #31
        subs    r10, r1, r3
        sbcs    r11, r6, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r1, #2, 2
        bne     LDEA19
        cmp     r1, #2, 2
        sbcs    r6, r6, r9
        movlt   r1, #2, 2
LDEA19:
        add     r7, r7, #1
        cmp     r8, r7
        blt     LDEA20
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        movlt   r6, #0
        sublt   r7, r6, #2, 18
        b       LDEA21
LDEA20:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r7, r6
LDEA21:
        subs    r2, r2, #1
        bne     LDEA18
        str     r7, [sp, #0x50]
        ldr     r6, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r10, [sp]
LDEA22:
        ldr     r1, [sp, #0x50]
        rsb     r2, lr, #0x15
        cmp     r0, #6, 20
        mov     r2, r1, asr r2
        str     r2, [sp, #0x40]
        ble     LDEA24
LDEA23:
        mov     r3, #0
        b       LDEA30
LDEA24:
        cmp     r0, #0
        blt     LDEA23
        cmp     r0, #0
        moveq   r3, #0
        beq     LDEA30
        cmp     r0, #6, 20
        bne     LDEA25
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r3, r0
        b       LDEA30
LDEA25:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        str     r1, [sp, #0x44]
        mvn     r1, #0
        str     r1, [sp, #0x3C]
        str     r8, [sp, #0x10]
        str     r7, [sp, #0xC]
        ldr     r7, [sp, #0x44]
        ldr     r8, [sp, #0x3C]
        mov     r3, #0
        mvn     r2, #2, 2
        mov     r1, #0xF
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp]
LDEA26:
        mov     r3, r3, lsl #1
        mov     r0, r0, lsl #1
        mov     r3, r3, lsl #16
        cmp     r0, #6, 20
        mov     r3, r3, asr #16
        blt     LDEA29
        mov     r10, #0
        mov     r9, r0, asr #31
        sub     r10, r10, #6, 20
        adds    r0, r0, r10
        mvn     r10, #0
        adc     r9, r9, r10
        subs    r11, r0, r2
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r0, #2, 2
        bne     LDEA27
        cmp     r0, #2, 2
        sbcs    r9, r9, r8
        movlt   r0, #2, 2
LDEA27:
        add     r3, r3, #1
        cmp     r7, r3
        blt     LDEA28
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDEA29
LDEA28:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDEA29:
        subs    r1, r1, #1
        bne     LDEA26
        ldr     r8, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r11, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r10, [sp]
LDEA30:
        rsb     r0, lr, #0xB
        cmp     r0, #0
        ble     LDEA32
        mvn     lr, #0xFF
        bic     r0, r0, #0xFF, 8
        bic     lr, lr, #0x7F, 24
        mvn     r1, lr
        bic     r0, r0, #0xFF, 16
        cmp     r3, r1, asr r0
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvngt   lr, lr
        strgt   lr, [sp, #0x50]
        bgt     LDEA33
        cmp     r3, r1, asr r0
        bge     LDEA31
        mov     lr, #0
        sub     lr, lr, #2, 18
        str     lr, [sp, #0x50]
        b       LDEA33
LDEA31:
        mov     r0, r3, lsl r0
        mov     lr, r0, lsl #16
        mov     lr, lr, asr #16
        str     lr, [sp, #0x50]
        b       LDEA33
LDEA32:
        sub     lr, lr, #0xB
        mov     lr, r3, asr lr
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        str     lr, [sp, #0x50]
LDEA33:
        add     r1, sp, #0x58
        mov     r2, #0x90
        mov     r0, r8
        bl      _ippsCopy_16s
        add     r1, sp, #0x5E, 30
        mov     r0, r10
        mov     r2, r9
        bl      _ippsCopy_16s
        add     lr, sp, #0x58
        add     r0, lr, r9, lsl #1
        mov     r1, r8
        mov     r2, #0x90
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x40]
        add     r0, sp, #0x58
        cmp     r11, r5
        add     r1, r0, r1, lsl #1
        sub     r0, r1, #2
        str     r0, [sp, #0x38]
        mov     lr, #0
        mov     r0, r11
        blt     LDEA35
LDEA34:
        sub     r0, r0, r5
        cmp     r0, r5
        add     lr, lr, #1
        bge     LDEA34
LDEA35:
        rsb     r0, r5, #0
        mla     r11, lr, r0, r11
        ldrsh   r0, [r7]
        cmp     r6, #0
        add     r8, lr, #1
        sub     r3, r5, r11
        ble     LDEA11
        mov     r9, #0
        str     r9, [sp, #0x28]
        mvn     r9, #2, 2
        str     r9, [sp, #0x54]
        mvn     r9, #0
        ldr     r10, [sp, #0x38]
        mvn     r2, #0xFF
        mov     r1, #0xFF
        str     r9, [sp, #0x10]
        str     r8, [sp, #0x34]
        str     r7, [sp, #0xC]
        ldr     r8, [pc, #0x234]
        ldr     r9, [sp, #0x28]
        ldr     r7, [sp, #0x40]
        bic     r2, r2, #0x7F, 24
        orr     r1, r1, #0x7F, 24
        sub     r2, r2, #2, 2
        sub     r1, r1, #1, 18
        str     r11, [sp, #0x30]
        str     lr, [sp, #0x3C]
LDEA36:
        add     r11, r10, r9, lsl #1
        str     r11, [sp]
        add     r11, r11, #2
        sub     lr, r5, r0
        str     r11, [sp, #4]
        add     r11, r8, r0, lsl #1
        add     lr, r8, lr, lsl #1
        cmp     r7, #0
        str     r11, [sp, #8]
        str     lr, [sp, #0x1C]
        movle   lr, #0
        ble     LDEA40
        str     r7, [sp, #0x18]
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x24]
        str     r3, [sp, #0x2C]
        str     r0, [sp, #0x44]
        str     r6, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r6, [sp]
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #0x54]
        mov     lr, #0
        str     r9, [sp, #0x28]
LDEA37:
        ldrsh   r9, [r2]
        ldrsh   r10, [r6], #-2
        mul     r9, r10, r9
        cmp     r9, #1, 2
        mvneq   r10, #2, 2
        movne   r10, r9, lsl #1
        adds    r9, lr, r10
        mov     r10, r10, asr #31
        adc     lr, r10, lr, asr #31
        subs    r11, r9, r8
        sbcs    r10, lr, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r9, #2, 2
        bne     LDEA38
        cmp     r9, #2, 2
        sbcs    lr, lr, r7
        movlt   r9, #2, 2
LDEA38:
        ldrsh   lr, [r3], #2
        ldrsh   r10, [r1]
        mul     lr, r10, lr
        cmp     lr, #1, 2
        mvneq   r10, #2, 2
        movne   r10, lr, lsl #1
        adds    lr, r9, r10
        mov     r10, r10, asr #31
        adc     r9, r10, r9, asr #31
        subs    r11, lr, r8
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   lr, #2, 2
        bne     LDEA39
        cmp     lr, #2, 2
        sbcs    r9, r9, r7
        movlt   lr, #2, 2
LDEA39:
        subs    r0, r0, #1
        add     r2, r2, r5, lsl #1
        add     r1, r1, r5, lsl #1
        bne     LDEA37
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        ldr     r8, [pc, #0xF4]
        ldr     r9, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        ldr     r6, [sp, #0x14]
LDEA40:
        cmp     r2, lr
        ble     LDEA41
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDEA42
LDEA41:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LDEA42:
        ldr     r11, [sp, #0x50]
        mul     lr, r11, lr
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     r1, lr
        blt     LDEA43
        cmn     lr, #1, 18
        mvnlt   lr, #0xFF
        biclt   lr, lr, #0x7F, 24
        blt     LDEA44
        mov     lr, lr, lsl #1
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDEA44
LDEA43:
        mov     lr, #0
        sub     lr, lr, #2, 18
        mvn     lr, lr
LDEA44:
        strh    lr, [r4], #2
        cmp     r0, r3
        blt     LDEA45
        ldr     lr, [sp, #0x34]
        sub     r0, r0, r3
        add     r9, r9, lr
        b       LDEA46
LDEA45:
        ldr     lr, [sp, #0x3C]
        add     r9, lr, r9
        ldr     lr, [sp, #0x30]
        add     r0, lr, r0
LDEA46:
        subs    r6, r6, #1
        bne     LDEA36
        ldr     r7, [sp, #0xC]
        b       LDEA11
LDEA47:
        mvn     lr, r5
        mov     lr, lr, lsl #16
        mov     r2, lr, asr #16
        b       LDEA13
LDEA48:
        add     sp, sp, #0x5E, 30
        mvn     r0, #5
        add     sp, sp, #0xF, 22
        ldmia   sp!, {r4 - r11, pc}
LDEA49:
        add     sp, sp, #0x5E, 30
        mvn     r0, #7
        add     sp, sp, #0xF, 22
        ldmia   sp!, {r4 - r11, pc}
        .long   LDEA_Filter_LP12
        .long   NormTable2
        .long   NormTable


        .data
        .align  4


LDEA_Filter_LP12:
        .byte   0x00,0x40,0x44,0x3F,0x16,0x3D,0x8F,0x39,0xD4,0x34,0x16,0x2F,0x92,0x28,0x89,0x21
        .byte   0x43,0x1A,0x06,0x13,0x14,0x0C,0xAB,0x05,0x00,0x00,0x3B,0xFB,0x79,0xF7,0xC8,0xF4
        .byte   0x2B,0xF3,0x95,0xF2,0xF0,0xF2,0x19,0xF4,0xE9,0xF5,0x31,0xF8,0xC2,0xFA,0x6B,0xFD
        .byte   0x00,0x00,0x59,0x02,0x55,0x04,0xDD,0x05,0xE1,0x06,0x5B,0x07,0x4F,0x07,0xC7,0x06
        .byte   0xD8,0x05,0x97,0x04,0x1F,0x03,0x8F,0x01,0x00,0x00,0x8E,0xFE,0x4E,0xFD,0x53,0xFC
        .byte   0xA7,0xFB,0x51,0xFB,0x51,0xFB,0xA1,0xFB,0x37,0xFC,0x03,0xFD,0xF5,0xFD,0xFA,0xFE
        .byte   0x00,0x00,0xF5,0x00,0xC9,0x01,0x72,0x02,0xE5,0x02,0x20,0x03,0x21,0x03,0xED,0x02
        .byte   0x89,0x02,0x01,0x02,0x5F,0x01,0xB0,0x00,0x00,0x00,0x5C,0xFF,0xCD,0xFE,0x5C,0xFE
        .byte   0x0F,0xFE,0xE8,0xFD,0xE8,0xFD,0x0C,0xFE,0x4F,0xFE,0xAA,0xFE,0x17,0xFF,0x8B,0xFF
        .byte   0x00,0x00,0x6D,0x00,0xCA,0x00,0x14,0x01,0x45,0x01,0x5E,0x01,0x5D,0x01,0x44,0x01
        .byte   0x18,0x01,0xDC,0x00,0x96,0x00,0x4A,0x00,0x00,0x00,0xBB,0xFF,0x81,0xFF,0x53,0xFF
        .byte   0x35,0xFF,0x27,0xFF,0x29,0xFF,0x3A,0xFF,0x56,0xFF,0x7B,0xFF,0xA6,0xFF,0xD4,0xFF
        .byte   0x00,0x00,0x28,0x00,0x4A,0x00,0x63,0x00,0x74,0x00,0x7A,0x00,0x78,0x00,0x6E,0x00
        .byte   0x5D,0x00,0x48,0x00,0x30,0x00,0x17,0x00,0x00,0x00,0xEB,0xFF,0xDB,0xFF,0xCF,0xFF
        .byte   0xC7,0xFF,0xC5,0xFF,0xC7,0xFF,0xCD,0xFF,0xD6,0xFF,0xE0,0xFF,0xEB,0xFF,0xF6,0xFF
        .byte   0x00,0x00,0x08,0x00,0x0E,0x00,0x13,0x00,0x14,0x00,0x14,0x00,0x13,0x00,0x10,0x00
        .byte   0x0D,0x00,0x09,0x00,0x06,0x00,0x02,0x00,0x00,0x00,0xFE,0xFF,0xFD,0xFF,0xFD,0xFF
        .byte   0xFD,0xFF,0xFD,0xFF,0xFE,0xFF,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00


