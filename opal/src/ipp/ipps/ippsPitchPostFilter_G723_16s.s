        .text
        .align  4
        .globl  _ippsPitchPostFilter_G723_16s


_ippsPitchPostFilter_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r11, [sp, #0x64]
        ldr     r9, [sp, #0x68]
        ldr     r12, [sp, #0x6C]
        cmp     r1, #0
        mov     r7, r2
        mov     r6, r3
        beq     LDUL23
        cmp     r7, #0
        beq     LDUL23
        cmp     r6, #0
        beq     LDUL23
        cmp     r11, #0
        beq     LDUL23
        cmp     r12, #2
        beq     LDUL1
        cmp     r12, #4
        beq     LDUL1
LDUL0:
        mvn     r0, #6
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDUL1:
        cmp     r9, #0
        blt     LDUL0
        cmp     r9, #3
        bgt     LDUL0
        cmp     r0, #0x12
        blt     LDUL0
        cmp     r0, #0x91
        bgt     LDUL0
        mov     r5, #0
        strh    r5, [r7]
        mov     r4, #0xFF
        mov     lr, r9, lsl #7
        cmp     r12, #2
        strh    r5, [r6]
        orr     r12, r4, #0x7F, 24
        sub     lr, lr, r9, lsl #3
        strh    r12, [r11]
        add     r4, r1, lr
        moveq   r1, #1
        streq   r1, [sp, #8]
        strne   r5, [sp, #8]
        cmp     r0, #0x8E
        mov     r1, #0x8E
        movgt   r0, r1
        add     r12, sp, #0x38
        add     lr, sp, #0x3C
        str     r12, [sp, #4]
        str     lr, [sp]
        sub     r2, r0, #3
        str     r2, [sp, #0xC]
        add     r8, r0, #3
        mov     r3, r8
        mov     r1, #0x3C
        mov     r0, r4
        bl      _ippsAutoCorrLagMax_Inv_16s
        ldr     r1, [sp, #0x3C]
        cmp     r1, #0
        movle   r10, r5
        ble     LDUL2
        ldr     r1, [sp, #0x38]
        rsb     r1, r1, #0
        mov     r1, r1, lsl #16
        mov     r10, r1, asr #16
LDUL2:
        mov     r1, r9, lsl #6
        rsb     r9, r1, r9, lsl #2
        add     r1, r9, #0xB4
        cmp     r8, r1
        movge   r8, r1
        ldr     r1, [sp, #0xC]
        cmp     r8, r1
        movlt   r9, r5
        blt     LDUL3
        add     r12, sp, #0x38
        str     r12, [sp, #4]
        ldr     r2, [sp, #0xC]
        add     r1, sp, #0x28
        str     r1, [sp]
        mov     r3, r8
        mov     r1, #0x3C
        mov     r0, r4
        bl      _ippsAutoCorrLagMax_Fwd_16s
        ldr     r1, [sp, #0x28]
        cmp     r1, #0
        movle   r9, r5
        ble     LDUL3
        ldr     r1, [sp, #0x38]
        mov     r1, r1, lsl #16
        mov     r9, r1, asr #16
LDUL3:
        cmp     r10, #0
        bne     LDUL4
        cmp     r9, #0
        beq     LDUL21
LDUL4:
        add     r3, sp, #0x14
        mov     r2, #0
        mov     r1, #0x3C
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r1, sp, #0x14
        ldr     r8, [r1]
        cmp     r10, #0
        bne     LDUL5
        mov     r1, r5
        add     r12, sp, #0x14
        str     r1, [r12, #4]
        add     r12, sp, #0x14
        str     r1, [r12, #8]
        mov     r12, #1
        str     r12, [sp, #0x10]
        b       LDUL6
LDUL5:
        ldr     r1, [sp, #0x3C]
        add     r5, sp, #0x14
        add     r12, sp, #0x14
        mov     r1, r1, asr #1
        str     r1, [r12, #4]
        add     r3, r5, #8
        add     r0, r4, r10, lsl #1
        mov     r2, #0
        mov     r1, #0x3C
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r1, sp, #0x14
        ldr     r1, [r1, #4]
        ldr     r5, [r5, #8]
        cmp     r1, r5
        movle   lr, r5
        movgt   lr, r1
        cmp     r8, lr
        str     lr, [sp, #0x3C]
        movle   r8, lr
        mvn     r12, #0
        str     r12, [sp, #0x10]
LDUL6:
        ldr     r12, [pc, #0x4D0]
        cmp     r9, #0
        str     r12, [sp, #0xC]
        beq     LDUL11
        ldr     r1, [sp, #0x28]
        add     r0, r4, r9, lsl #1
        add     r12, sp, #0x14
        mov     r1, r1, asr #1
        add     r4, sp, #0x14
        add     r3, r12, #0x10
        str     r1, [r4, #0xC]
        mov     r2, #0
        mov     r1, #0x3C
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r4, [r4, #0xC]
        add     r0, sp, #0x14
        ldr     r0, [r0, #0x10]
        cmp     r4, r0
        movle   r4, r0
        cmp     r8, r4
        str     r4, [sp, #0x3C]
        movle   r8, r4
        cmp     r8, #0
        moveq   r8, #0
        beq     LDUL10
        movs    r0, r8, lsr #16
        bne     LDUL8
        bic     r8, r8, #0xFF, 8
        bic     r0, r8, #0xFF, 16
        movs    r1, r0, asr #8
        moveq   r0, r0, lsl #1
        beq     LDUL7
        mov     r0, r1, lsl #1
        ldr     r1, [pc, #0x450]
        str     r1, [sp, #0xC]
LDUL7:
        ldr     r1, [sp, #0xC]
        ldrsh   r0, [r1, +r0]
        add     r0, r0, #0x10
        mov     r0, r0, lsl #16
        mov     r8, r0, asr #16
        b       LDUL10
LDUL8:
        movs    r8, r8, lsr #24
        bne     LDUL9
        ldr     r1, [sp, #0xC]
        mov     r0, r0, lsl #1
        ldrsh   r8, [r1, +r0]
        b       LDUL10
LDUL9:
        ldr     r0, [pc, #0x418]
        mov     r8, r8, lsl #1
        ldrsh   r8, [r0, +r8]
LDUL10:
        add     lr, sp, #0x14
        ldr     r0, [lr]
        ldr     r12, [lr, #4]
        ldr     r4, [lr, #0xC]
        ldr     r5, [lr, #0x10]
        mov     r0, r0, lsl r8
        ldr     lr, [lr, #8]
        mov     r0, r0, asr #16
        add     r1, sp, #0x2C
        strh    r0, [r1]
        add     r0, sp, #0x2C
        ldrsh   r0, [r0]
        mov     r12, r12, lsl r8
        mov     r4, r4, lsl r8
        mov     r5, r5, lsl r8
        mov     r12, r12, asr #16
        mov     r4, r4, asr #16
        mov     r5, r5, asr #16
        strh    r12, [r1, #2]
        mov     r8, lr, lsl r8
        strh    r4, [r1, #6]
        strh    r5, [r1, #8]
        b       LDUL16
LDUL11:
        cmp     r8, #0
        moveq   lr, #0
        beq     LDUL15
        movs    r0, r8, lsr #16
        bne     LDUL13
        bic     r8, r8, #0xFF, 8
        bic     r0, r8, #0xFF, 16
        movs    r12, r0, asr #8
        moveq   r0, r0, lsl #1
        beq     LDUL12
        mov     r0, r12, lsl #1
        ldr     r12, [pc, #0x384]
        str     r12, [sp, #0xC]
LDUL12:
        ldr     r12, [sp, #0xC]
        ldrsh   r0, [r12, +r0]
        add     r0, r0, #0x10
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
        b       LDUL15
LDUL13:
        movs    r8, r8, lsr #24
        bne     LDUL14
        ldr     r12, [sp, #0xC]
        mov     r0, r0, lsl #1
        ldrsh   lr, [r12, +r0]
        b       LDUL15
LDUL14:
        ldr     r0, [pc, #0x34C]
        mov     r8, r8, lsl #1
        ldrsh   lr, [r0, +r8]
LDUL15:
        mov     r0, r1, lsl lr
        add     r4, sp, #0x14
        ldr     r1, [r4]
        mov     r8, r5, lsl lr
        add     r12, sp, #0x2C
        mov     r1, r1, lsl lr
        mov     r0, r0, asr #16
        add     lr, sp, #0x2C
        mov     r4, r1, asr #16
        strh    r0, [lr, #2]
        add     r1, sp, #0x2C
        mov     r4, r4, lsl #16
        mov     r0, r4, asr #16
        strh    r0, [r12]
        mov     r12, #0
        str     r12, [sp, #0x10]
LDUL16:
        mov     r8, r8, asr #16
        strh    r8, [r1, #4]
        ldr     r1, [sp, #0x10]
        mov     r12, #0
        cmn     r1, #1
        beq     LDUL22
LDUL17:
        ldr     lr, [sp, #0x10]
        add     r1, sp, #0x2C
        add     r4, sp, #0x2C
        cmp     lr, #0
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        bne     LDUL19
        ldrsh   r2, [r4, #4]
        ldrsh   r1, [r1, #2]
        mul     r5, r0, r2
        mul     r4, r1, r1
        cmp     r4, r5, asr #2
        strleh  r12, [r6]
        strleh  lr, [r11]
        ble     LDUL18
        str     r11, [sp, #4]
        str     r6, [sp]
        ldr     r3, [sp, #8]
        bl      LDUL_ownGetInd
LDUL18:
        strh    r10, [r7]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDUL19:
        ldrsh   r2, [r4, #8]
        ldrsh   r1, [r1, #6]
        mul     r5, r0, r2
        mul     r4, r1, r1
        cmp     r4, r5, asr #2
        strleh  r12, [r6]
        strleh  lr, [r11]
        ble     LDUL20
        str     r11, [sp, #4]
        str     r6, [sp]
        ldr     r3, [sp, #8]
        bl      LDUL_ownGetInd
LDUL20:
        strh    r9, [r7]
LDUL21:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDUL22:
        add     r1, sp, #0x2C
        ldrsh   r1, [r1, #2]
        add     r4, sp, #0x2C
        ldrsh   r4, [r4, #6]
        mul     r5, r1, r1
        add     lr, sp, #0x2C
        mul     r4, r4, r4
        ldrsh   lr, [lr, #8]
        add     r8, sp, #0x2C
        ldrsh   r1, [r8, #4]
        add     r4, r4, #1, 18
        add     r5, r5, #1, 18
        mov     r4, r4, asr #15
        mul     r4, r1, r4
        mov     r5, r5, asr #15
        mul     lr, lr, r5
        cmp     lr, r4
        movle   r1, #1
        strle   r1, [sp, #0x10]
        movgt   r1, #0
        strgt   r1, [sp, #0x10]
        b       LDUL17
LDUL23:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LDUL_ownGetInd:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r11, [pc, #0x1E8]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x28]
        mov     r6, r1
        mov     r4, r2
        mov     r12, #0xFF
        cmp     r6, r4
        orr     r5, r12, #0x7F, 24
        mov     r7, r0
        mov     r8, r3
        movge   r8, r8, lsl #1
        ldrgesh r8, [r11, +r8]
        bge     LDUL25
        cmp     r4, #0
        movle   r0, r5
        ble     LDUL24
        mov     r0, r6, lsl #15
        mov     r1, r4
        bl      __intel_idiv
LDUL24:
        mov     r8, r8, lsl #1
        ldrsh   r11, [r11, +r8]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r0, r11, r0
        mov     r3, r0, asr #15
        mov     r3, r3, lsl #16
        mov     r8, r3, asr #16
LDUL25:
        mul     r12, r8, r8
        mov     r6, r6, lsl #1
        mov     r3, r7, lsl #15
        mla     r3, r6, r8, r3
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mla     r3, r4, r12, r3
        add     r1, r3, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r7, r1, lsl #1
        bge     LDUL27
        cmp     r1, #0
        ble     LDUL26
        mov     r0, r7, lsl #14
        bl      __intel_idiv
        mov     r5, r0
LDUL26:
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDUL27:
        mov     r5, r5, lsl #15
        cmp     r5, #1, 4
        movlt   r0, #0
        movge   r0, #1, 18
        add     r2, r0, #2, 20
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r0, r2
        add     r2, r0, #1, 20
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r0, r2
        add     r2, r0, #2, 22
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #1, 22
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #2, 24
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #1, 24
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #0x80
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #0x40
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #0x20
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #0x10
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #8
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #4
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        add     r2, r0, #2
        mul     r1, r2, r2
        cmp     r5, r1
        movge   r2, r2, lsl #16
        movge   r0, r2, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r8, r8, r0
        strh    r0, [r10]
        mov     r8, r8, asr #15
        strh    r8, [r9]
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable
        .long   LDUL_PPF_Tbl


        .data
        .align  4


LDUL_PPF_Tbl:
        .byte   0x00,0x18,0x00,0x20


