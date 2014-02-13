        .text
        .align  4
        .globl  _ippsLongTermPostFilter_G729_16s


_ippsLongTermPostFilter_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        sub     sp, sp, #1, 22
        add     lr, sp, #0x4C
        and     r8, lr, #0xF
        add     r5, sp, #0xA7, 30
        and     r5, r5, #0xF
        rsb     r8, r8, #0
        ldr     r10, [sp, #0x470]
        add     r12, sp, #0x4C
        rsb     r5, r5, #0
        and     r8, r8, #0xF
        mov     r6, r2
        add     r12, r12, r8
        add     lr, sp, #0xA7, 30
        and     r5, r5, #0xF
        cmp     r6, #0
        add     r11, lr, r5
        mov     r7, r0
        mov     r9, r1
        mov     r4, r3
        add     r8, r12, #2
        beq     LDQO36
        cmp     r4, #0
        beq     LDQO36
        cmp     r10, #0
        beq     LDQO36
        cmp     r9, #0x12
        blt     LDQO0
        cmp     r9, #0x8F
        bgt     LDQO0
        cmp     r7, #0
        blt     LDQO0
        cmp     r7, #1, 18
        ble     LDQO1
LDQO0:
        add     sp, sp, #0x4C
        mvn     r0, #6
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDQO1:
        sub     r0, r6, #0x13, 28
        mov     lr, #0
        mov     r5, lr
        mov     r12, r0
LDQO2:
        ldrsh   r1, [r12]
        cmp     r1, #0
        bge     LDQO3
        cmn     r1, #2, 18
        moveq   r1, #0xFF
        orreq   r1, r1, #0x7F, 24
        beq     LDQO3
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDQO3:
        orr     r5, r5, r1
        ldrsh   r1, [r12, #2]
        cmp     r1, #0
        bge     LDQO4
        cmn     r1, #2, 18
        moveq   r1, #0xFF
        orreq   r1, r1, #0x7F, 24
        beq     LDQO4
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDQO4:
        orr     r1, r5, r1
        add     lr, lr, #2
        mov     r5, r1, lsl #16
        cmp     lr, #0xC0
        mov     r5, r5, asr #16
        add     r12, r12, #4
        blt     LDQO2
        ldr     r12, [pc, #0xDD4]
        cmn     r5, #1
        str     r12, [sp, #0x28]
        moveq   r12, #0xF
        beq     LDQO7
        cmp     r5, #0
        moveq   r12, #0
        beq     LDQO7
        cmp     r5, #0
        blt     LDQO33
LDQO5:
        bic     r5, r5, #0xFF, 8
        bic     r12, r5, #0xFF, 16
        movs    lr, r12, asr #8
        bne     LDQO6
        ldr     lr, [sp, #0x28]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        b       LDQO7
LDQO6:
        mov     r12, lr, lsl #1
        ldr     lr, [pc, #0xD8C]
        ldrsh   r12, [lr, +r12]
LDQO7:
        rsb     r12, r12, #3
        mov     r12, r12, lsl #16
        mov     r5, r12, asr #16
        cmp     r5, #0
        ble     LDQO8
        mov     r2, r11
        mov     r1, r5
        mov     r3, #0xC0
        bl      _ippsRShiftC_16s
        b       LDQO9
LDQO8:
        cmp     r5, #0
        blt     LDQO35
        mov     r1, r11
        mov     r2, #0xC0
        bl      _ippsCopy_16s
LDQO9:
        add     r12, sp, #0x43, 28
        str     r12, [sp, #0x14]
        add     r12, sp, #1, 22
        add     r12, r12, #0x3C
        str     r12, [sp, #0xC]
        add     r12, sp, #1, 22
        add     r12, r12, #0x38
        str     r12, [sp, #8]
        add     r12, sp, #1, 22
        add     r12, r12, #0x44
        str     r12, [sp, #4]
        add     r12, sp, #1, 22
        add     r3, sp, #1, 22
        str     r8, [sp, #0x10]
        mov     r9, r9, lsl #16
        add     r12, r12, #0x48
        add     r2, sp, #0x11, 26
        str     r12, [sp]
        add     r3, r3, #0x34
        mov     r0, r9, asr #16
        add     r11, r11, #0x13, 28
        mov     r1, r11
        bl      LDQO_ownSearchDel
        add     r12, sp, #1, 22
        ldrsh   r12, [r12, #0x48]
        add     lr, sp, #1, 22
        ldrsh   lr, [lr, #0x40]
        cmp     r12, #0
        strh    lr, [r10]
        beq     LDQO31
        add     r9, sp, #1, 22
        ldrsh   r9, [r9, #0x34]
        cmp     r9, #0
        subeq   r8, r6, lr, lsl #1
        beq     LDQO22
        ldr     r12, [pc, #0xCC0]
        sub     lr, r11, lr, lsl #1
        sub     r1, lr, #0xE
        sub     r12, r12, r9, lsl #5
        add     r0, r12, #0xE0
        mov     r12, #0x28
        str     r12, [sp]
        mov     r3, r4
        mov     r2, #0x10
        bl      _ippsCrossCorr_NR_16s
        add     r3, sp, #1, 22
        add     r3, r3, #0x2C
        mov     r1, r11
        mov     r2, #0x28
        mov     r0, r4
        bl      _ippsDotProd_16s32s
        ldr     r12, [sp, #0x42C]
        cmn     r12, #7, 2
        mvngt   r12, #2, 2
        bgt     LDQO10
        cmp     r12, #3, 2
        movge   r12, r12, lsl #1
        movlt   r12, #2, 2
LDQO10:
        cmp     r12, #0
        mov     r9, #0
        movlt   r10, r9
        movlt   r11, r10
        blt     LDQO14
        cmp     r12, #0
        mov     r10, r12
        moveq   lr, r9
        beq     LDQO13
        cmn     r12, #1
        moveq   lr, #0x1F
        beq     LDQO13
        cmp     r12, #0
        mvnlt   r10, r12
        cmp     r10, #0
        moveq   lr, r9
        beq     LDQO13
        movs    lr, r10, lsr #16
        bne     LDQO11
        bic     r10, r10, #0xFF, 8
        bic     lr, r10, #0xFF, 16
        movs    r10, lr, asr #8
        movne   lr, r10, lsl #1
        ldrne   r10, [pc, #0xC04]
        ldreq   r10, [sp, #0x28]
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r10, +lr]
        add     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDQO13
LDQO11:
        movs    r10, r10, lsr #24
        bne     LDQO12
        ldr     r10, [sp, #0x28]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r10, +lr]
        b       LDQO13
LDQO12:
        ldr     lr, [pc, #0xBCC]
        mov     r10, r10, lsl #1
        ldrsh   lr, [lr, +r10]
LDQO13:
        rsb     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
        cmp     r11, #0
        movlt   r11, r9
        movge   r12, r12, asr r11
        mov     lr, r12, lsl #16
        mov     r10, lr, asr #16
LDQO14:
        add     r3, sp, #1, 22
        str     r12, [sp, #0x42C]
        add     r3, r3, #0x2C
        mov     r2, #0
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x42C]
        movs    lr, r12, lsl #1
        mov     r12, lr
        beq     LDQO18
        cmn     lr, #1
        moveq   r9, #0x1F
        beq     LDQO18
        cmp     lr, #0
        mvnlt   r12, lr
        cmp     r12, #0
        moveq   r9, #0
        beq     LDQO18
        movs    r9, r12, lsr #16
        bne     LDQO16
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    r9, r12, asr #8
        moveq   r12, r12, lsl #1
        beq     LDQO15
        mov     r12, r9, lsl #1
        ldr     r9, [pc, #0xB34]
        str     r9, [sp, #0x28]
LDQO15:
        ldr     r9, [sp, #0x28]
        ldrsh   r12, [r9, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r9, r12, asr #16
        b       LDQO18
LDQO16:
        movs    r12, r12, lsr #24
        bne     LDQO17
        ldr     r12, [sp, #0x28]
        mov     r9, r9, lsl #1
        ldrsh   r9, [r12, +r9]
        b       LDQO18
LDQO17:
        ldr     r9, [pc, #0xAFC]
        mov     r12, r12, lsl #1
        ldrsh   r9, [r9, +r12]
LDQO18:
        add     r12, sp, #1, 22
        ldrsh   r12, [r12, #0x34]
        rsb     r9, r9, #0x10
        mov     r2, #0
        sub     r12, r12, #1
        mov     r1, r9, lsl #16
        add     r9, sp, #1, 22
        ldrsh   r9, [r9, #0x30]
        movs    r1, r1, asr #16
        add     r0, r12, r12, lsl #2
        movmi   r1, r2
        str     r1, [sp, #0x24]
        add     r0, r12, r0, lsl #3
        mov     r1, lr, asr r1
        mov     r12, r0, lsl #16
        mov     lr, r9, lsl #1
        mov     r12, r12, asr #16
        str     r1, [sp, #0x42C]
        mov     r1, r1, lsl #16
        add     r12, lr, r12, lsl #1
        movs    r9, r1, asr #16
        add     r8, r12, r8
        beq     LDQO21
        add     r12, sp, #1, 22
        ldrsh   r12, [r12, #0x38]
        add     r0, sp, #1, 22
        ldrsh   r0, [r0, #0x48]
        str     r12, [sp, #0x28]
        add     lr, sp, #1, 22
        ldrsh   lr, [lr, #0x44]
        mov     r12, r0, lsl #1
        str     r12, [sp, #0x20]
        umull   r12, r1, r12, r0
        add     r2, sp, #1, 22
        ldrsh   r2, [r2, #0x3C]
        str     r1, [sp, #0x2C]
        str     r12, [sp, #0x30]
        mov     r12, r10, lsl #1
        str     r2, [sp, #0x3C]
        ldr     r2, [sp, #0x30]
        str     r12, [sp, #0x34]
        umull   r12, r1, lr, r12
        umull   r2, r3, r2, r9
        str     r3, [sp, #0x40]
        str     r1, [sp, #0x38]
        mov     r1, r10, asr #31
        str     r2, [sp, #0x1C]
        umull   r2, r3, r12, r10
        mla     r3, r12, r1, r3
        ldr     r12, [sp, #0x20]
        str     r2, [sp, #0x18]
        mov     r2, r0, asr #31
        str     r3, [sp, #0x44]
        ldr     r3, [sp, #0x2C]
        str     r2, [sp, #0x48]
        mla     r3, r12, r2, r3
        mov     r12, r10, lsr #31
        orr     r1, r12, r1, lsl #1
        ldr     r12, [sp, #0x38]
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x40]
        mov     r2, r9, asr #31
        mla     r12, lr, r1, r12
        mov     r1, r0, lsr #31
        mov     lr, lr, asr #31
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x30]
        mla     r12, r12, r2, r3
        ldr     r2, [sp, #0x48]
        orr     r1, r1, r2, lsl #1
        ldr     r2, [sp, #0x2C]
        mla     r0, r1, r0, r2
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x38]
        mla     r12, r0, r9, r12
        ldr     r0, [sp, #0x44]
        mla     r1, lr, r1, r2
        ldr     r2, [sp, #0x28]
        ldr     lr, [sp, #0x24]
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0x3C]
        mla     r0, r1, r10, r0
        add     lr, lr, r2, lsl #1
        add     r12, r12, r11, lsl #1
        cmp     r12, lr
        str     r0, [sp, #0x20]
        ble     LDQO19
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x28]
        sub     r2, r12, lr
        mov     r3, #0
        bl      __ashrdi3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x28]
        b       LDQO20
LDQO19:
        cmp     lr, r12
        ble     LDQO20
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        sub     r2, lr, r12
        mov     r3, #0
        bl      __ashrdi3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x20]
LDQO20:
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        subs    r12, lr, r12
        ldr     lr, [sp, #0x28]
        sbcs    r0, r0, lr
        movlt   r12, #0
        movlt   r0, #0
        orrs    r0, r12, r0
        beq     LDQO21
        add     r12, sp, #1, 22
        add     r8, sp, #1, 22
        strh    r9, [r12, #0x44]
        strh    r10, [r8, #0x48]
        add     lr, sp, #1, 22
        strh    r11, [lr, #0x38]
        ldr     r12, [sp, #0x24]
        add     r8, sp, #1, 22
        strh    r12, [r8, #0x3C]
        mov     r8, r4
LDQO21:
        cmp     r5, #0
        blt     LDQO34
        cmp     r5, #0
        addle   r12, sp, #1, 22
        ldrlesh r12, [r12, #0x48]
        ble     LDQO22
        mov     r0, r5
        mov     r1, r8
        mov     r2, #0x28
        bl      _ippsLShiftC_16s_I
        add     r12, sp, #1, 22
        ldrsh   r12, [r12, #0x48]
LDQO22:
        add     r5, sp, #1, 22
        ldrsh   r5, [r5, #0x38]
        add     r9, sp, #1, 22
        ldrsh   r9, [r9, #0x3C]
        cmp     r5, r9
        blt     LDQO23
        add     lr, sp, #1, 22
        ldrsh   lr, [lr, #0x44]
        sub     r9, r5, r9
        add     r5, sp, #1, 22
        mov     r9, lr, asr r9
        mov     lr, r9, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r5, #0x44]
        b       LDQO24
LDQO23:
        sub     r9, r9, r5
        mov     r12, r12, asr r9
        add     lr, sp, #1, 22
        ldrsh   lr, [lr, #0x44]
        mov     r12, r12, lsl #16
        add     r5, sp, #1, 22
        mov     r12, r12, asr #16
        strh    r12, [r5, #0x48]
LDQO24:
        mov     r5, #0xFF
        cmp     r12, lr
        orr     r0, r5, #0x7F, 24
        blt     LDQO26
        cmp     r7, #1, 18
        moveq   r12, #0x55
        orreq   r0, r12, #0x55, 24
        beq     LDQO29
        mul     r7, r7, lr
        mov     lr, lr, asr #1
        add     r5, sp, #1, 22
        strh    lr, [r5, #0x44]
        add     r7, r7, #1, 18
        add     r12, sp, #1, 22
        mov     r7, r7, asr #15
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #17
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        strh    r7, [r12, #0x48]
        add     r7, r7, lr
        mov     r7, r7, lsl #16
        mov     r1, r7, asr #16
        cmp     r1, lr
        beq     LDQO29
        cmp     r1, #0
        ble     LDQO25
        mov     r0, lr, lsl #15
        bl      __intel_idiv
LDQO25:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDQO29
LDQO26:
        cmp     r7, #1, 18
        moveq   r12, r12, asr #2
        beq     LDQO27
        mul     r7, r12, r7
        add     r12, r7, #1, 18
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #17
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDQO27:
        mov     lr, lr, asr #1
        add     r9, r12, lr
        add     r7, sp, #1, 22
        mov     r9, r9, lsl #16
        add     r5, sp, #1, 22
        mov     r1, r9, asr #16
        cmp     r1, lr
        strh    r12, [r7, #0x48]
        strh    lr, [r5, #0x44]
        beq     LDQO29
        cmp     r1, #0
        ble     LDQO28
        mov     r0, lr, lsl #15
        bl      __intel_idiv
LDQO28:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDQO29:
        rsb     r12, r0, #2, 18
        mov     r7, #0
        mov     r12, r12, lsl #16
        mov     r5, r7
        mov     r12, r12, asr #16
        mov     lr, #2
LDQO30:
        ldrsh   r10, [r8, +r7]
        ldrsh   r9, [r6]
        add     r7, r7, #4
        mul     r10, r12, r10
        add     r5, r5, #2
        cmp     r5, #0x28
        mla     r10, r0, r9, r10
        add     r9, r10, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r4]
        ldrsh   r10, [lr, +r8]
        ldrsh   r9, [r6, #2]
        add     lr, lr, #4
        mul     r10, r12, r10
        add     r6, r6, #4
        mla     r10, r0, r9, r10
        add     r9, r10, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r4, #2]
        add     r4, r4, #4
        blt     LDQO30
        b       LDQO32
LDQO31:
        mov     r1, r4
        mov     r0, r6
        mov     r2, #0x28
        bl      _ippsCopy_16s
LDQO32:
        add     sp, sp, #0x4C
        mov     r0, #0
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDQO33:
        mvn     r5, r5
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        b       LDQO5
LDQO34:
        rsb     r0, r5, #0
        mov     r2, #0x28
        mov     r1, r8
        bl      _ippsRShiftC_16s_I
        add     r12, sp, #1, 22
        ldrsh   r12, [r12, #0x48]
        b       LDQO22
LDQO35:
        rsb     r1, r5, #0
        mov     r3, #0xC0
        mov     r2, r11
        bl      _ippsLShiftC_16s
        b       LDQO9
LDQO36:
        add     sp, sp, #0x4C
        mvn     r0, #7
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDQO_ownSearchDel:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA4
        ldr     r12, [sp, #0xD0]
        ldr     r9, [sp, #0xC8]
        ldr     r8, [sp, #0xCC]
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0xD4]
        ldr     r5, [sp, #0xD8]
        mov     r10, r0
        mov     r4, r1
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0xDC]
        mov     r11, #0
        mov     r6, r2
        str     r12, [sp, #0x44]
        strh    r11, [r9]
        mov     r12, #1
        strh    r12, [r8]
        mov     r7, r3
        add     r3, sp, #0xA0
        strh    r11, [r6]
        strh    r11, [r7]
        mov     r2, #0
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0xA0]
        movs    r12, r12, lsl #1
        addeq   sp, sp, #0xA4
        ldmeqia sp!, {r4 - r11, pc}
        cmp     r12, #0
        str     r12, [sp, #0xA0]
        mov     lr, r12
        beq     LDQO39
        cmn     r12, #1
        moveq   r11, #0x1F
        beq     LDQO39
        cmp     r12, #0
        mvnlt   lr, r12
        cmp     lr, #0
        moveq   r11, #0
        beq     LDQO39
        movs    r11, lr, lsr #16
        bne     LDQO37
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r11, lr, asr #8
        movne   lr, r11, lsl #1
        ldrne   r11, [pc, #0x5EC]
        ldreq   r11, [pc, #0x5E4]
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r11, +lr]
        add     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
        b       LDQO39
LDQO37:
        movs    lr, lr, lsr #24
        bne     LDQO38
        ldr     lr, [pc, #0x5C0]
        mov     r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        b       LDQO39
LDQO38:
        ldr     r11, [pc, #0x5B4]
        mov     lr, lr, lsl #1
        ldrsh   r11, [r11, +lr]
LDQO39:
        rsb     r11, r11, #0x10
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        cmp     r11, #0
        ble     LDQO50
        mov     r12, r12, asr r11
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #0x38]
LDQO40:
        add     r12, sp, #0x98
        str     r12, [sp, #4]
        add     r12, sp, #0x94
        str     r12, [sp]
        add     r3, r10, #1
        sub     r2, r10, #1
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsAutoCorrLagMax_Inv_16s
        ldr     r12, [sp, #0x94]
        cmp     r12, #0
        ble     LDQO49
        ldr     r12, [sp, #0x98]
        add     r3, sp, #0x4C
        sub     r0, r4, r12, lsl #1
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r12, sp, #0x4C
        ldr     r12, [r12]
        mov     r12, r12, lsl #1
        cmp     r12, #0
        ble     LDQO49
        ldr     r0, [pc, #0x530]
        add     lr, sp, #0x4C
        str     r12, [lr]
        mov     r3, r5
        mov     r1, #1
        str     r9, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r6, [sp, #0x24]
        mov     r10, #4
        mov     r6, r0
        mov     r9, r1
        mov     r7, r3
LDQO41:
        mov     r2, #0x29
        str     r2, [sp]
        ldr     r12, [sp, #0x98]
        mov     r3, r7
        mov     r2, #4
        rsb     r12, r12, #0
        mov     r0, r6
        mov     r12, r12, lsl #1
        sub     r12, r12, #4
        add     r1, r12, r4
        bl      _ippsCrossCorr_NR_16s
        add     r3, sp, #0x9C
        add     r0, r7, #2
        mov     r2, #0
        mov     r1, #0x27
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldrsh   r12, [r7]
        ldr     r2, [sp, #0x9C]
        ldrsh   lr, [r7, #0x50]
        mov     r1, r12, lsl #1
        add     r0, sp, #0x4C
        mov     r2, r2, lsl #1
        mla     r12, r1, r12, r2
        mov     r1, lr, lsl #1
        mla     lr, r1, lr, r2
        add     r1, r0, r10
        add     r7, r7, #0x52
        str     r12, [r0, +r9, lsl #2]
        add     r9, r9, #1
        cmp     r9, #8
        str     lr, [r1, #0x1C]
        sub     r6, r6, #8
        add     r10, r10, #4
        strlt   r2, [sp, #0x9C]
        blt     LDQO41
        str     r2, [sp, #0x34]
        ldr     r9, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        add     lr, sp, #0x4C
        ldr     r3, [lr]
        ldr     r10, [lr, #4]
        ldr     r12, [lr, #8]
        cmp     r3, #0
        str     r12, [sp, #0x3C]
        ldr     r2, [lr, #0x20]
        ldr     r0, [lr, #0x14]
        ldr     r1, [lr, #0x1C]
        ldr     r12, [lr, #0x18]
        str     r12, [sp, #0x30]
        ldr     r12, [lr, #0x10]
        str     r12, [sp, #0x2C]
        mov     r12, #0
        movgt   r12, r3
        ldr     r3, [lr, #0xC]
        cmp     r10, r12
        movgt   r12, r10
        ldr     r10, [sp, #0x3C]
        cmp     r10, r12
        movgt   r12, r10
        ldr     r10, [sp, #0x2C]
        cmp     r3, r12
        movgt   r12, r3
        cmp     r10, r12
        movgt   r12, r10
        ldr     r10, [sp, #0x30]
        cmp     r0, r12
        movgt   r12, r0
        ldr     r0, [lr, #0x28]
        cmp     r10, r12
        movgt   r12, r10
        cmp     r1, r12
        ldr     r10, [lr, #0x24]
        movgt   r12, r1
        cmp     r2, r12
        movgt   r12, r2
        cmp     r10, r12
        ldr     r1, [lr, #0x2C]
        movgt   r12, r10
        cmp     r0, r12
        ldr     r10, [lr, #0x30]
        movgt   r12, r0
        ldr     r0, [lr, #0x34]
        cmp     r1, r12
        movgt   r12, r1
        cmp     r10, r12
        ldr     lr, [lr, #0x38]
        movgt   r12, r10
        cmp     r0, r12
        movgt   r12, r0
        cmp     lr, r12
        movgt   r12, lr
        cmp     r12, #2, 18
        addlt   sp, sp, #0xA4
        ldmltia sp!, {r4 - r11, pc}
        ldr     lr, [sp, #0x34]
        cmp     r12, #0
        str     r12, [sp, #0xA0]
        str     lr, [sp, #0x9C]
        moveq   r12, #0
        beq     LDQO44
        cmn     r12, #1
        moveq   r12, #0x1F
        beq     LDQO44
        cmp     r12, #0
        mvnlt   r12, r12
        cmp     r12, #0
        moveq   r12, #0
        beq     LDQO44
        movs    lr, r12, lsr #16
        bne     LDQO42
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        ldrne   lr, [pc, #0x32C]
        ldreq   lr, [pc, #0x324]
        moveq   r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDQO44
LDQO42:
        movs    r12, r12, lsr #24
        bne     LDQO43
        ldr     r12, [pc, #0x300]
        mov     lr, lr, lsl #1
        ldrsh   r12, [r12, +lr]
        b       LDQO44
LDQO43:
        ldr     lr, [pc, #0x2F4]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
LDQO44:
        rsb     r12, r12, #0x10
        add     r1, sp, #0x4C
        mov     r12, r12, lsl #16
        mov     r10, r12, asr #16
        cmp     r10, r11
        mov     r12, r11
        movgt   r12, r10
        str     r12, [sp, #0x3C]
        mov     r0, r10
        mov     r2, #0xF
        bl      _ippsRShiftC_32s_I
        ldr     lr, [sp, #0x94]
        ldr     r0, [sp, #0x3C]
        add     r12, sp, #0x4C
        mov     r1, lr, asr r0
        ldr     r0, [r12]
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        mov     r12, r1, lsl #16
        str     lr, [sp, #0x30]
        ldr     r3, [sp, #0x30]
        mov     r12, r12, asr #16
        mul     lr, r12, r12
        mov     r0, r0, lsl #16
        mov     r1, #0
        str     r1, [sp, #0x28]
        mov     r0, r0, asr #16
        mov     r2, lr, lsl #1
        mov     r1, #1
        and     r3, r3, r2, asr #1
        str     r3, [sp, #0x2C]
        mov     r3, #4
        mov     lr, r2, asr #16
        str     r3, [sp, #0x30]
        str     r7, [sp, #0x20]
        str     r6, [sp, #0x24]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        mov     lr, lr, lsl #16
        mov     r3, lr, asr #16
        str     r10, [sp, #0x10]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0xC]
        str     r1, [sp, #0x34]
        str     r12, [sp, #8]
        str     r11, [sp, #0x14]
        mov     r9, r0
        mov     r4, r1
        mov     r8, r2
        mov     r10, r3
LDQO45:
        mov     r12, #2
        str     r12, [sp]
        ldr     r0, [sp, #0xC]
        add     r3, sp, #0x8C
        add     r1, r5, #2
        mov     r2, #0x28
        bl      _ippsCrossCorr_Inv_16s32s
        add     r12, sp, #0x8C
        ldr     lr, [r12, #4]
        cmp     lr, #0
        ble     LDQO46
        ldr     r11, [sp, #0x3C]
        add     r12, sp, #0x4C
        mov     r0, lr, asr r11
        mul     r3, r0, r0
        ldr     lr, [r12, +r4, lsl #2]
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        mov     r11, lr, lsl #16
        mov     lr, r3, lsl #1
        mov     r3, r11, asr #16
        mul     r2, r3, r7
        and     r12, r12, lr, asr #1
        mul     r11, r12, r9
        mov     r1, lr, asr #16
        mov     r2, r2, asr #15
        mla     r2, r3, r10, r2
        mov     r1, r1, lsl #16
        mov     r11, r11, asr #15
        mov     r1, r1, asr #16
        mla     r11, r1, r9, r11
        mov     r2, r2, lsl #1
        cmp     r2, r11, lsl #1
        bge     LDQO46
        mov     r7, r12
        mov     r12, #0
        str     r4, [sp, #0x28]
        str     r0, [sp, #8]
        mov     r8, lr
        mov     r10, r1
        mov     r9, r3
        str     r12, [sp, #0x34]
LDQO46:
        add     r12, sp, #0x8C
        ldr     lr, [r12]
        cmp     lr, #0
        ble     LDQO47
        ldr     r11, [sp, #0x3C]
        add     r12, sp, #0x4C
        add     r12, r12, r6
        mov     r0, lr, asr r11
        mul     r3, r0, r0
        ldr     r11, [r12, #0x1C]
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        mov     lr, r3, lsl #1
        mov     r11, r11, lsl #16
        and     r12, r12, lr, asr #1
        mov     r3, r11, asr #16
        mul     r2, r3, r7
        mul     r11, r12, r9
        mov     r1, lr, asr #16
        mov     r2, r2, asr #15
        mla     r2, r3, r10, r2
        mov     r1, r1, lsl #16
        mov     r11, r11, asr #15
        mov     r1, r1, asr #16
        mla     r11, r1, r9, r11
        mov     r2, r2, lsl #1
        cmp     r2, r11, lsl #1
        bge     LDQO47
        mov     r7, r12
        mov     r12, #1
        str     r4, [sp, #0x28]
        str     r0, [sp, #8]
        mov     r8, lr
        mov     r10, r1
        mov     r9, r3
        str     r12, [sp, #0x34]
LDQO47:
        add     r4, r4, #1
        cmp     r4, #8
        add     r5, r5, #0x52
        add     r6, r6, #4
        blt     LDQO45
        mov     r2, r8
        mov     r0, r9
        ldr     r12, [sp, #8]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        cmp     r12, #0
        beq     LDQO49
        cmp     r0, #1
        ble     LDQO49
        ldr     r1, [sp, #0x38]
        rsb     lr, r10, #0
        sub     r11, lr, r11
        ldr     lr, [sp, #0x3C]
        mul     r1, r1, r0
        add     lr, r11, lr, lsl #1
        add     lr, lr, #1
        mov     lr, lr, lsl #16
        movs    lr, lr, asr #16
        mov     r1, r1, lsl #1
        rsbmi   lr, lr, #0
        movmi   r2, r2, asr lr
        bmi     LDQO48
        cmp     lr, #0
        movgt   r1, r1, asr lr
LDQO48:
        cmp     r2, r1
        blt     LDQO49
        ldr     lr, [sp, #0x98]
        ldr     r1, [sp, #0x34]
        sub     lr, lr, r1
        add     lr, lr, #1
        strh    lr, [r6]
        ldr     r2, [sp, #0x44]
        strh    r1, [r2]
        ldr     r1, [sp, #0x28]
        strh    r1, [r7]
        strh    r12, [r9]
        strh    r0, [r8]
        ldr     r1, [sp, #0x48]
        strh    r10, [r1]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x40]
        strh    r0, [r1]
LDQO49:
        add     sp, sp, #0xA4
        ldmia   sp!, {r4 - r11, pc}
LDQO50:
        mov     r12, r12, lsl #16
        mov     r11, #0
        mov     r12, r12, asr #16
        str     r12, [sp, #0x38]
        b       LDQO40
        .long   NormTable2
        .long   NormTable
        .long   LDQO_tab_hup_l
        .long   LDQO_tab_hup_s


        .data
        .align  4


LDQO_tab_hup_l:
        .byte   0xD8,0xFF,0x48,0x00,0x64,0xFF,0x3B,0x01,0xBD,0xFD,0xFF,0x03,0xAE,0xF8,0x57,0x11
        .byte   0xAB,0x7C,0xC2,0xF2,0x3B,0x06,0x89,0xFC,0xF5,0x01,0xF6,0xFE,0x82,0x00,0xC5,0xFF
        .byte   0xB3,0xFF,0x93,0x00,0xC3,0xFE,0x77,0x02,0x82,0xFB,0xEE,0x07,0x43,0xF1,0xA7,0x25
        .byte   0xFC,0x72,0x35,0xEA,0xA7,0x0A,0x09,0xFA,0x5B,0x03,0x3B,0xFE,0xDA,0x00,0x9B,0xFF
        .byte   0x96,0xFF,0xD4,0x00,0x39,0xFE,0x7C,0x03,0xB2,0xF9,0x22,0x0B,0xF0,0xEA,0x66,0x3B
        .byte   0xE1,0x63,0x6B,0xE6,0xE7,0x0C,0xBC,0xF8,0x11,0x04,0xE1,0xFD,0x02,0x01,0x86,0xFF
        .byte   0x85,0xFF,0xFD,0x00,0xE6,0xFD,0x14,0x04,0xAC,0xF8,0xF7,0x0C,0xF2,0xE6,0xC4,0x50
        .byte   0xC4,0x50,0xF2,0xE6,0xF7,0x0C,0xAC,0xF8,0x14,0x04,0xE6,0xFD,0xFD,0x00,0x85,0xFF
        .byte   0x86,0xFF,0x02,0x01,0xE1,0xFD,0x11,0x04,0xBC,0xF8,0xE7,0x0C,0x6B,0xE6,0xE1,0x63
        .byte   0x66,0x3B,0xF0,0xEA,0x22,0x0B,0xB2,0xF9,0x7C,0x03,0x39,0xFE,0xD4,0x00,0x96,0xFF
        .byte   0x9B,0xFF,0xDA,0x00,0x3B,0xFE,0x5B,0x03,0x09,0xFA,0xA7,0x0A,0x35,0xEA,0xFC,0x72
        .byte   0xA7,0x25,0x43,0xF1,0xEE,0x07,0x82,0xFB,0x77,0x02,0xC3,0xFE,0x93,0x00,0xB3,0xFF
        .byte   0xC5,0xFF,0x82,0x00,0xF6,0xFE,0xF5,0x01,0x89,0xFC,0x3B,0x06,0xC2,0xF2,0xAB,0x7C
        .byte   0x57,0x11,0xAE,0xF8,0xFF,0x03,0xBD,0xFD,0x3B,0x01,0x64,0xFF,0x48,0x00,0xD8,0xFF
LDQO_tab_hup_s:
        .byte   0x44,0xFF,0x39,0x0B,0xA2,0x7B,0xC3,0xF9,0x1C,0xFE,0x81,0x1B,0x35,0x6F,0x9D,0xF7
        .byte   0x5B,0xFC,0xEA,0x2F,0x99,0x5C,0x38,0xF8,0x2C,0xFA,0x82,0x46,0x82,0x46,0x2C,0xFA
        .byte   0x38,0xF8,0x99,0x5C,0xEA,0x2F,0x5B,0xFC,0x9D,0xF7,0x35,0x6F,0x81,0x1B,0x1C,0xFE
        .byte   0xC3,0xF9,0xA2,0x7B,0x39,0x0B,0x44,0xFF


