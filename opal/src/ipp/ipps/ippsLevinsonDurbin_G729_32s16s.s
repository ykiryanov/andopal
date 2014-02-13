        .text
        .align  4
        .globl  _ippsLevinsonDurbin_G729_32s16s


_ippsLevinsonDurbin_G729_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #6, 26
        add     r6, sp, #0x34
        add     lr, sp, #0xBC
        and     r6, r6, #0xF
        and     r8, lr, #0xF
        ldr     r10, [sp, #0x1A4]
        rsb     r6, r6, #0
        rsb     r8, r8, #0
        and     r6, r6, #0xF
        add     r12, sp, #0xBC
        add     lr, sp, #0x34
        and     r8, r8, #0xF
        cmp     r0, #0
        add     r6, lr, r6
        mov     r5, r1
        mov     r7, r2
        mov     r4, r3
        add     r9, r12, r8
        beq     LDSP34
        cmp     r7, #0
        beq     LDSP34
        cmp     r4, #0
        beq     LDSP34
        cmp     r10, #0
        beq     LDSP34
        cmp     r5, #0
        ble     LDSP0
        cmp     r5, #0x1E
        ble     LDSP1
LDSP0:
        mvn     r0, #6
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LDSP1:
        ldr     r11, [r0]
        cmp     r11, #0
        mov     r12, r11
        bge     LDSP2
        cmp     r11, #2, 2
        rsbne   r12, r11, #0
        beq     LDSP3
LDSP2:
        cmp     r12, #1, 16
        bge     LDSP3
        mov     r0, #0xC
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LDSP3:
        ldr     r12, [r0, #4]!
        str     r0, [sp, #0x10]
        cmp     r12, #0
        str     r12, [sp]
        str     r12, [sp, #4]
        bge     LDSP4
        ldr     r0, [sp]
        cmp     r0, #2, 2
        mvneq   r0, #2, 2
        streq   r0, [sp, #4]
        beq     LDSP4
        ldr     r0, [sp]
        rsb     r0, r0, #0
        str     r0, [sp, #4]
LDSP4:
        mvn     r0, #0xFF
        mov     r12, r11, asr #16
        bic     r0, r0, #0x7F, 24
        mov     r12, r12, lsl #16
        str     r0, [sp, #8]
        mov     r1, r12, asr #16
        add     r0, r0, #2, 4
        str     r1, [sp, #0x18]
        bl      __intel_idiv
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #0x18]
        mvn     r1, r12
        mov     r12, r0, lsl #16
        and     r0, r1, r11, asr #1
        str     r0, [sp, #0xC]
        mov     lr, r12, asr #16
        mul     r0, r0, lr
        mov     r12, lr, lsl #1
        mul     r12, r2, r12
        bic     r2, r0, r1
        ldr     r0, [sp, #4]
        mov     r2, r2, asr #14
        rsb     r2, r2, #0
        mov     r3, r0, asr #16
        str     r12, [sp, #0x18]
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x18]
        mvn     r12, #2, 2
        and     r0, r1, r0, asr #1
        sub     r2, r2, r3
        add     r2, r2, r12
        ldr     r12, [sp, #0x30]
        str     r0, [sp, #0x30]
        and     r0, r1, r2, asr #1
        mul     r0, r0, lr
        mov     r2, r2, asr #16
        ldr     r3, [sp]
        mov     r2, r2, lsl #16
        mov     r0, r0, asr #15
        mov     r2, r2, asr #16
        mla     r2, r2, lr, r0
        mov     r12, r12, lsl #16
        cmp     r3, #0
        mov     r12, r12, asr #16
        mov     r0, r2, asr #15
        and     r1, r2, r1
        mul     r1, r12, r1
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
        ldr     r0, [sp, #0x30]
        mov     r1, r1, asr #15
        mla     r1, r12, lr, r1
        mul     r0, r0, lr
        add     r0, r1, r0, asr #15
        mov     lr, r0, lsl #3
        rsbgt   lr, lr, #0
        ldr     r0, [sp, #8]
        mov     r3, lr, asr #16
        mov     r1, r11, asr #16
        mvn     r12, r0
        mov     r11, r3, lsl #16
        and     r2, r12, lr, asr #1
        mov     r0, #0
        mov     r11, r11, asr #16
        mul     r2, r2, r11
        mov     lr, lr, asr #4
        mov     r1, r1, lsl #16
        str     r2, [sp, #0x30]
        add     r2, sp, #0x51, 30
        strh    r3, [r2]
        add     r2, sp, #0xBC
        str     lr, [r8, +r2]
        ldr     lr, [sp, #0x30]
        mov     r8, lr, asr #15
        mov     lr, r1, asr #16
        mov     r8, r8, lsl #16
        mov     r1, r8, asr #16
        mla     r11, r11, r11, r1
        mvn     r8, #2, 2
        add     r1, r11, r1
        mov     r11, r1, lsl #1
        eor     r1, r11, r11, asr #31
        sub     r1, r1, r11, asr #31
        rsb     r11, r1, r8
        mov     r8, r11, asr #16
        and     r11, r12, r11, asr #1
        mul     r11, r11, lr
        mov     r8, r8, lsl #16
        mov     r12, r8, asr #16
        ldr     r8, [sp, #0xC]
        mov     r11, r11, asr #15
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        mul     r8, r8, r12
        mla     r11, r12, lr, r11
        mov     r8, r8, asr #15
        mov     r12, r8, lsl #16
        add     r12, r11, r12, asr #16
        movs    r11, r12, lsl #1
        mov     lr, r11
        beq     LDSP7
        cmn     r11, #1
        moveq   r11, #2, 2
        moveq   r0, #0x1F
        beq     LDSP7
        cmp     r11, #0
        mvnlt   lr, r11
        cmp     lr, #0
        beq     LDSP6
        ldr     r0, [pc, #0x5D0]
        movs    r12, lr, lsr #16
        bne     LDSP5
        bic     lr, lr, #0xFF, 8
        bic     r12, lr, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        ldreq   r0, [pc, #0x5B8]
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r0, +r12]
        add     r0, r12, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDSP6
LDSP5:
        movs    lr, lr, lsr #24
        movne   lr, lr, lsl #1
        ldrnesh r0, [r0, +lr]
        bne     LDSP6
        ldr     r0, [pc, #0x58C]
        mov     r12, r12, lsl #1
        ldrsh   r0, [r0, +r12]
LDSP6:
        mov     r11, r11, lsl r0
LDSP7:
        cmp     r5, #1
        ble     LDSP27
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        sub     r12, r12, #0x11
        sub     r1, r9, #4
        mvn     lr, #2, 2
        str     r4, [sp, #0x24]
        mov     r8, #1
        mov     r2, #2, 2
        str     r9, [sp, #0x14]
        str     r12, [sp, #4]
        str     lr, [sp]
        str     r1, [sp, #0xC]
        str     r10, [sp, #0x20]
        str     r7, [sp, #0x28]
        str     r5, [sp, #0x2C]
        mov     r4, r0
LDSP8:
        cmp     r11, #0
        mov     r1, r11
        bge     LDSP9
        cmp     r11, #2, 2
        rsbne   r1, r11, #0
        beq     LDSP10
LDSP9:
        cmp     r1, #1, 16
        blt     LDSP33
LDSP10:
        cmp     r8, #0
        movle   lr, #0
        ble     LDSP12
        ldr     r1, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        mov     r12, #0
        mov     lr, r12
LDSP11:
        ldr     r5, [r1], #4
        sub     r2, r8, r12
        ldr     r2, [r7, +r2, lsl #2]
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     r9, r5, asr #16
        mvn     r3, r3
        mov     r0, r9, lsl #16
        and     r9, r3, r2, asr #1
        mov     r10, r2, asr #16
        mov     r2, r0, asr #16
        mul     r9, r9, r2
        and     r5, r3, r5, asr #1
        mov     r10, r10, lsl #16
        mov     r9, r9, asr #15
        mov     r3, r10, asr #16
        mul     r5, r3, r5
        mov     r9, r9, lsl #16
        add     r12, r12, #1
        mov     r9, r9, asr #16
        mla     r9, r2, r3, r9
        mov     r5, r5, asr #15
        cmp     r12, r8
        mov     r5, r5, lsl #16
        add     r5, r9, r5, asr #16
        add     lr, lr, r5, lsl #1
        blt     LDSP11
LDSP12:
        ldr     r1, [sp, #0x10]
        mov     r2, r8, lsl #2
        ldr     r1, [r1, +r8, lsl #2]
        str     r2, [sp, #8]
        adds    r7, r1, lr, lsl #4
        mov     r9, r7
        bpl     LDSP13
        cmp     r7, #2, 2
        mvneq   r9, #2, 2
        rsbne   r9, r7, #0
LDSP13:
        mov     r1, r11, asr #16
        mvn     r2, #0xFF
        mov     r1, r1, lsl #16
        bic     r10, r2, #0x7F, 24
        mov     r5, r1, asr #16
        add     r0, r10, #2, 4
        mov     r1, r5
        bl      __intel_idiv
        mov     r2, r11, asr #1
        mov     r0, r0, lsl #16
        mvn     r10, r10
        mov     r3, r0, asr #16
        and     r0, r2, r10
        mul     r12, r0, r3
        mov     lr, r3, lsl #1
        mul     r5, r5, lr
        mvn     r1, #2, 2
        bic     lr, r12, r10
        mov     r12, r9, asr #16
        mov     lr, lr, asr #14
        rsb     lr, lr, #0
        sub     lr, lr, r5
        add     r1, lr, r1
        mov     r12, r12, lsl #16
        and     lr, r10, r1, asr #1
        mul     lr, lr, r3
        mov     r1, r1, asr #16
        and     r9, r10, r9, asr #1
        mov     r1, r1, lsl #16
        mov     lr, lr, asr #15
        mov     r12, r12, asr #16
        mov     r1, r1, asr #16
        mla     r3, r1, r3, lr
        cmp     r7, #0
        mov     r1, r3, asr #15
        mov     r1, r1, lsl #16
        and     r10, r3, r10
        mul     r3, r12, r10
        mov     r1, r1, asr #16
        mul     r9, r9, r1
        mov     r3, r3, asr #15
        mla     r3, r12, r1, r3
        add     r9, r3, r9, asr #15
        mov     r1, r9, lsl #3
        rsbgt   r1, r1, #0
        ldr     r12, [sp]
        bic     r3, r4, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r1, r12, asr r3
        mvngt   r1, #2, 2
        bgt     LDSP14
        mov     r12, #2, 2
        cmp     r1, r12, asr r3
        movge   r1, r1, lsl r3
        movlt   r1, #2, 2
LDSP14:
        mov     lr, r1, asr #16
        add     r12, sp, #0x51, 30
        mov     lr, lr, lsl #16
        mov     r3, r8, lsl #1
        mov     lr, lr, asr #16
        cmp     lr, #0
        strh    lr, [r12, +r3]
        bge     LDSP15
        cmn     lr, #2, 18
        beq     LDSP31
        rsb     lr, lr, #0
        mov     r3, lr, lsl #16
        mov     lr, r3, asr #16
LDSP15:
        ldr     r3, [sp, #4]
        cmp     r3, lr
        blt     LDSP35
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        mov     r7, r1, asr #1
        cmp     r8, #0
        and     r3, r7, r3
        ble     LDSP32
        mov     r1, r1, asr #16
        ldr     r10, [sp, #0xC]
        mov     r12, r1, lsl #16
        ldr     r1, [sp, #0x14]
        mov     r5, #0
        mov     r12, r12, asr #16
        mov     lr, r6
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x1C]
LDSP16:
        sub     r4, r8, r5
        ldr     r6, [r10, +r4, lsl #2]
        ldr     r9, [r1], #4
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mov     r4, r6, asr #16
        mvn     r11, r11
        and     r6, r11, r6, asr #1
        mul     r11, r6, r12
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        mul     r6, r3, r4
        mov     r11, r11, asr #15
        add     r5, r5, #1
        mov     r11, r11, lsl #16
        cmp     r5, r8
        mov     r6, r6, asr #15
        mov     r11, r11, asr #16
        mla     r11, r12, r4, r11
        mov     r6, r6, lsl #16
        add     r6, r11, r6, asr #16
        add     r6, r9, r6, lsl #1
        str     r6, [lr], #4
        blt     LDSP16
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
LDSP17:
        mul     r3, r3, r12
        ldr     r1, [sp, #8]
        mov     r7, r7, asr #3
        str     r7, [r6, +r1]
        mov     r3, r3, asr #15
        mov     r1, r3, lsl #16
        mov     r1, r1, asr #16
        mla     r12, r12, r12, r1
        add     r1, r12, r1
        movs    r1, r1, lsl #1
        bpl     LDSP18
        cmp     r1, #2, 2
        mvneq   r1, #2, 2
        rsbne   r1, r1, #0
LDSP18:
        mvn     r3, #2, 2
        rsb     r3, r1, r3
        mov     r1, r2, asr #15
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mov     lr, r3, asr #16
        mvn     r12, r2
        mov     r1, r1, lsl #16
        and     r3, r12, r3, asr #1
        mov     r1, r1, asr #16
        mul     r3, r3, r1
        mov     r2, lr, lsl #16
        mov     r2, r2, asr #16
        mul     r0, r2, r0
        mov     r3, r3, asr #15
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        mla     r3, r2, r1, r3
        mov     r0, r0, asr #15
        mov     r1, r0, lsl #16
        add     r1, r3, r1, asr #16
        movs    r11, r1, lsl #1
        mov     r2, r11
        moveq   r1, #0
        beq     LDSP22
        cmn     r11, #1
        moveq   r11, #2, 2
        moveq   r1, #0x1F
        beq     LDSP22
        cmp     r11, #0
        mvnlt   r2, r11
        cmp     r2, #0
        moveq   r1, #0
        beq     LDSP21
        movs    r1, r2, lsr #16
        bne     LDSP19
        bic     r2, r2, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        movs    r3, r2, asr #8
        ldrne   r1, [pc, #0x1C8]
        movne   r2, r3, lsl #1
        ldreq   r1, [pc, #0x1C4]
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r1, r2, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDSP21
LDSP19:
        movs    r2, r2, lsr #24
        bne     LDSP20
        ldr     r2, [pc, #0x1A0]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r2, +r1]
        b       LDSP21
LDSP20:
        ldr     r1, [pc, #0x18C]
        mov     r2, r2, lsl #1
        ldrsh   r1, [r1, +r2]
LDSP21:
        mov     r11, r11, lsl r1
LDSP22:
        add     r4, r4, r1
        add     r2, r8, #1
        mov     r0, r4, lsl #16
        cmp     r2, #0
        mov     r4, r0, asr #16
        ble     LDSP26
        add     r1, r8, #1
        cmp     r1, #6
        movlt   r1, #0
        blt     LDSP24
        ldr     r12, [sp, #0x14]
        mov     r1, #0
        sub     r8, r8, #5
        add     r3, r6, #4
        add     r12, r12, #4
LDSP23:
        ldr     r10, [r3, #-4]
        ldr     r9, [r3]
        ldr     r7, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     lr, [r3, #0xC]
        add     r1, r1, #5
        str     r10, [r12, #-4]
        str     r9, [r12]
        str     r7, [r12, #4]
        str     r5, [r12, #8]
        str     lr, [r12, #0xC]
        cmp     r1, r8
        add     r3, r3, #0x14
        add     r12, r12, #0x14
        ble     LDSP23
LDSP24:
        ldr     r12, [sp, #0x14]
        add     r3, r6, r1, lsl #2
        add     r12, r12, r1, lsl #2
LDSP25:
        ldr     lr, [r3], #4
        add     r1, r1, #1
        cmp     r1, r2
        str     lr, [r12], #4
        blt     LDSP25
LDSP26:
        ldr     r1, [sp, #0x2C]
        mov     r8, r2
        cmp     r2, r1
        blt     LDSP8
        mov     r0, r4
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x20]
        ldr     r4, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r5, [sp, #0x2C]
LDSP27:
        add     r0, r0, #0x10
        mov     r0, r11, asr r0
        strh    r0, [r10]
        mov     r0, #1, 20
        cmp     r5, #0
        strh    r0, [r7]
        ble     LDSP30
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        add     r7, r7, #2
        mvn     lr, r0
        mov     r12, r5
LDSP28:
        ldr     r6, [r9], #4
        add     r6, r6, #1, 18
        mov     r6, r6, asr #15
        cmp     lr, r6
        mvnlt   r6, r0
        blt     LDSP29
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, r0
LDSP29:
        strh    r6, [r7], #2
        subs    r12, r12, #1
        bne     LDSP28
LDSP30:
        add     r0, sp, #0x51, 30
        mov     r2, r5
        mov     r1, r4
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LDSP31:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     lr, r3
        b       LDSP15
LDSP32:
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r12, r1, asr #16
        b       LDSP17
LDSP33:
        mov     r0, #0xC
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LDSP34:
        mvn     r0, #7
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
LDSP35:
        mov     r0, #0xC
        add     sp, sp, #6, 26
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


