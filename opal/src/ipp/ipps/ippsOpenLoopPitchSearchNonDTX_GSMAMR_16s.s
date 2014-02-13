        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearchNonDTX_GSMAMR_16s


_ippsOpenLoopPitchSearchNonDTX_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB3, 30
        ldr     r4, [sp, #0x2F4]
        ldr     r5, [sp, #0x300]
        add     lr, sp, #0x58
        ldr     r8, [sp, #0x2F0]
        and     lr, lr, #0xF
        ldr     r11, [sp, #0x2FC]
        str     r4, [sp, #0x38]
        ldr     r4, [sp, #0x2F8]
        rsb     lr, lr, #0
        str     r5, [sp, #0x44]
        ldr     r5, [sp, #0x304]
        mov     r9, r0
        add     r12, sp, #0x58
        and     lr, lr, #0xF
        cmp     r9, #0
        add     r7, r12, lr
        mov     r10, r1
        mov     r6, r3
        beq     LDRD14
        cmp     r10, #0
        beq     LDRD14
        cmp     r2, #0
        beq     LDRD14
        cmp     r6, #0
        beq     LDRD14
        cmp     r8, #0
        beq     LDRD14
        ldr     r12, [sp, #0x38]
        cmp     r12, #0
        beq     LDRD14
        cmp     r4, #0
        beq     LDRD14
        cmp     r11, #0
        beq     LDRD14
        ldr     r12, [sp, #0x44]
        cmp     r12, #0
        beq     LDRD14
        cmp     r5, #0
        beq     LDRD0
        cmp     r5, #1
        beq     LDRD0
        cmp     r5, #3
        beq     LDRD0
        cmp     r5, #6
        beq     LDRD0
        cmp     r5, #7
        beq     LDRD0
        cmp     r5, #8
        beq     LDRD0
        cmp     r5, #0xB
        beq     LDRD0
        cmp     r5, #0xC
        beq     LDRD0
        cmp     r5, #0x19
        beq     LDRD0
        mvn     r0, #6
        add     sp, sp, #0xB3, 30
        ldmia   sp!, {r4 - r11, pc}
LDRD0:
        add     r2, r2, #0x14
        str     r2, [sp, #0x50]
        mov     r2, #0x50
        add     r12, r2, #0xCE
        add     r2, r2, #0xBA
        add     r2, r7, r2
        add     r12, r7, r12
        str     r2, [sp, #0x4C]
        str     r12, [sp, #0x54]
        mov     r0, r4
        mov     r2, #0x8F
        mov     r1, r7
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x54]
        str     r11, [sp, #0x40]
        str     r8, [sp, #0x34]
        ldr     r11, [sp, #0x4C]
        ldr     r8, [sp, #0x50]
        mov     r0, #0
        str     r4, [sp, #0x3C]
        str     r6, [sp, #0x30]
        mov     r6, r0
        mov     r4, r1
LDRD1:
        mov     r2, r4
        mov     r1, r9
        mov     r0, r8
        bl      _ippsResidualFilter_G729_16s
        str     r11, [sp]
        mov     r3, #0xC
        mov     r2, #0x28
        mov     r1, r4
        mov     r0, r10
        bl      _ippsSynthesisFilterLow_NR_16s_ISfs
        add     r6, r6, #0xB
        cmp     r6, #0x2C
        add     r11, r11, #0x50
        add     r8, r8, #0x50
        add     r4, r4, #0x50
        add     r10, r10, #0x16
        add     r9, r9, #0x16
        blt     LDRD1
        ldr     r11, [sp, #0x40]
        ldr     r4, [sp, #0x3C]
        ldr     r8, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        cmp     r5, #0xB
        mov     r2, #0
        beq     LDRD13
        mov     r10, #0
        str     r7, [sp, #0x48]
        str     r8, [sp, #0x34]
        ldr     r7, [sp, #0x54]
        ldr     r8, [sp, #0x44]
        mov     r9, r10
        mov     r1, #0x50
        mov     r0, r9
        str     r4, [sp, #0x3C]
        str     r6, [sp, #0x30]
        mov     r4, r0
        mov     r6, r1
LDRD2:
        mov     r2, #0
        cmp     r5, #0
        strh    r2, [r8]
        strh    r2, [r8, #2]
        beq     LDRD12
        cmp     r5, #1
        beq     LDRD11
        cmp     r5, #8
        ble     LDRD9
        cmp     r5, #0xB
        beq     LDRD3
        mov     r2, r10, lsl #16
        add     r3, r9, r9, lsl #2
        mov     r2, r2, asr #16
        add     r1, r7, r3, lsl #5
        str     r2, [sp, #4]
        str     r4, [sp, #0x18]
        str     r4, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r4, [sp, #8]
        str     r6, [sp]
        mov     r0, r5
        mov     r3, #0x8F
        mov     r2, #0x12
        bl      LDRD_ownPitchOL
        mov     r9, r9, lsl #1
        add     r10, r10, #1
        strh    r0, [r11, +r9]
        mov     r2, r10, lsl #16
        mov     r9, r2, asr #16
        cmp     r9, #2
        blt     LDRD2
        b       LDRD10
LDRD3:
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        ldr     r8, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        str     r7, [sp, #0x48]
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x54]
        ldr     r7, [sp, #0x44]
        mov     r2, #0
LDRD4:
        ldrsh   r2, [r8]
        mov     r12, #0x66
        orr     r12, r12, #0x26, 24
        cmp     r12, r2
        movgt   lr, #0
        movle   lr, #1
        add     r0, sp, #2, 24
        strh    lr, [r0, #0xC8]
        mov     lr, #0
        str     lr, [sp, #0x28]
        str     lr, [sp, #0x24]
        str     lr, [sp, #0x20]
        str     lr, [sp, #0x1C]
        str     lr, [sp, #0x18]
        mov     lr, r10, lsl #16
        add     r12, r9, r9, lsl #2
        mov     lr, lr, asr #16
        add     r3, r4, r12, lsl #5
        str     lr, [sp, #0x14]
        str     r7, [sp, #0x10]
        ldr     r12, [sp, #0x38]
        add     r2, sp, #0xB2, 30
        mov     r0, r6
        str     r12, [sp, #0xC]
        mov     r12, #0x50
        str     r12, [sp, #8]
        mov     r12, #0x8F
        str     r12, [sp, #4]
        mov     r12, #0x14
        str     r12, [sp]
        mov     r1, r8
        bl      LDRD_ownPitchOLWgh
        mov     r9, r9, lsl #1
        add     r10, r10, #1
        strh    r0, [r11, +r9]
        mov     r2, r10, lsl #16
        mov     r9, r2, asr #16
        cmp     r9, #2
        bge     LDRD7
LDRD5:
        cmp     r5, #0
        bne     LDRD4
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        mov     r2, #0
LDRD6:
        str     r2, [sp, #0x18]
        str     r2, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r2, [sp, #8]
        ldr     r3, [sp, #0x54]
        mov     r2, #1
        str     r2, [sp, #4]
        mov     r2, #0xA0
        add     r9, r9, r9, lsl #2
        str     r2, [sp]
        add     r1, r3, r9, lsl #5
        mov     r0, r5
        mov     r2, #0x14
        mov     r3, #0x8F
        bl      LDRD_ownPitchOL
        strh    r0, [r11]
        strh    r0, [r11, #2]
        add     r7, r7, #5, 26
        mov     r0, r7
        mov     r1, r4
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xB3, 30
        ldmia   sp!, {r4 - r11, pc}
LDRD7:
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
LDRD8:
        add     r0, r7, #5, 26
        mov     r1, r4
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xB3, 30
        ldmia   sp!, {r4 - r11, pc}
LDRD9:
        mov     r2, r10, lsl #16
        add     r3, r9, r9, lsl #2
        mov     r2, r2, asr #16
        add     r1, r7, r3, lsl #5
        str     r2, [sp, #4]
        str     r4, [sp, #0x18]
        str     r4, [sp, #0x14]
        str     r4, [sp, #0x10]
        str     r4, [sp, #0xC]
        str     r4, [sp, #8]
        str     r6, [sp]
        mov     r0, r5
        mov     r3, #0x8F
        mov     r2, #0x14
        bl      LDRD_ownPitchOL
        mov     r9, r9, lsl #1
        add     r10, r10, #1
        strh    r0, [r11, +r9]
        mov     r2, r10, lsl #16
        mov     r9, r2, asr #16
        cmp     r9, #2
        blt     LDRD2
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        b       LDRD8
LDRD10:
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        b       LDRD8
LDRD11:
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        mov     r2, #0
        b       LDRD6
LDRD12:
        ldr     r7, [sp, #0x48]
        ldr     r4, [sp, #0x3C]
        mov     r2, #0
        b       LDRD6
LDRD13:
        str     r7, [sp, #0x48]
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x54]
        ldr     r7, [sp, #0x44]
        mov     r10, #0
        mov     r9, r10
        b       LDRD5
LDRD14:
        mvn     r0, #7
        add     sp, sp, #0xB3, 30
        ldmia   sp!, {r4 - r11, pc}
LDRD_ownPitchOL:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE8
        sub     sp, sp, #1, 22
        ldr     r4, [sp, #0x50C]
        add     r9, sp, #0xA2, 30
        add     lr, sp, #0x18
        str     r0, [sp, #0xC]
        and     r9, r9, #0xF
        and     lr, lr, #0xF
        rsb     r0, r9, #0
        rsb     r12, lr, #0
        add     r5, sp, #1, 22
        mov     r7, r3
        add     r11, sp, #0x18
        mov     r9, #0
        and     r12, r12, #0xF
        str     r9, [sp, #0x4D8]
        add     r5, r5, #0xD8
        add     r8, sp, #0xA2, 30
        and     r0, r0, #0xF
        sub     r10, r1, r7, lsl #1
        add     r12, r11, r12
        str     r9, [sp]
        mov     r3, r5
        mov     r6, r2
        add     r8, r8, r0
        add     r11, r7, r4
        mov     r2, r11
        mov     r1, r10
        mov     r0, r10
        add     r5, r12, r7, lsl #1
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x4D8]
        cmn     r12, #7, 2
        bge     LDRD29
        cmp     r12, #2, 14
        sub     r1, r5, r7, lsl #1
        bge     LDRD15
        mov     r3, r11
        mov     r2, r1
        mov     r0, r10
        mov     r1, #3
        bl      _ippsLShiftC_16s
        mvn     r10, #2
        b       LDRD16
LDRD15:
        mov     r2, r11
        mov     r0, r10
        bl      _ippsCopy_16s
        mov     r10, r9
LDRD16:
        add     r8, r8, r7, lsl #2
        sub     r12, r7, r6
        str     r8, [sp, #0x14]
        add     r12, r12, #1
        str     r12, [sp]
        sub     r3, r8, r7, lsl #2
        sub     r1, r5, r7, lsl #1
        mov     r2, r4
        mov     r0, r5
        bl      _ippsCrossCorr_Fwd_Low_16s32s
        ldr     r12, [sp, #0xC]
        cmp     r12, #0xC
        moveq   r9, #1
        mov     r12, r6, lsl #2
        mov     r8, #2, 2
        mov     r12, r12, lsl #16
        add     lr, r7, #1
        mov     r12, r12, asr #16
        mov     r11, r12
        cmp     r11, lr
        bge     LDRD18
        mov     r1, r12
        ldr     r0, [sp, #0x14]
LDRD17:
        mov     r1, r1, lsl #2
        rsb     r1, r1, #0
        ldr     r1, [r0, +r1]
        cmp     r1, r8
        movgt   r8, r1
        movgt   r7, r12
        add     r12, r12, #1
        mov     r1, r12, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, lr
        blt     LDRD17
LDRD18:
        mov     r12, r7, lsl #16
        add     r3, sp, #1, 22
        mov     r12, r12, asr #16
        sub     r0, r5, r12, lsl #1
        add     r3, r3, #0xE4
        mov     r1, r4
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x4E4]
        add     r0, sp, #1, 22
        add     r0, r0, #0xE4
        mov     lr, lr, lsl #1
        str     lr, [sp, #0x4E4]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r9, #0
        ldreq   r1, [sp, #0x4E4]
        ldrne   r12, [sp, #0x4E4]
        movne   r1, r12, lsl #1
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        mov     lr, r8, asr #16
        and     r0, r12, r8, asr #1
        mov     lr, lr, lsl #16
        and     r12, r12, r1, asr #1
        mov     lr, lr, asr #16
        mul     r12, r12, lr
        mov     r1, r1, asr #16
        cmp     r9, #0
        mov     r8, r1, lsl #16
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r8, r8, asr #16
        mul     r0, r8, r0
        mov     r12, r12, asr #16
        mla     r12, lr, r8, r12
        mov     r0, r0, asr #15
        mov     lr, r0, lsl #16
        add     lr, r12, lr, asr #16
        mov     r12, lr, lsl #1
        beq     LDRD19
        cmp     r10, #0
        rsblt   lr, r10, #0
        movlt   r12, r12, lsl lr
        movge   r12, r12, asr r10
        mov     lr, r12, asr #1
        str     r12, [sp, #0x4E4]
        mov     lr, lr, lsl #16
        mov     r12, lr, asr #16
        str     r12, [sp, #0x10]
        b       LDRD20
LDRD19:
        mov     lr, r12, lsl #16
        str     r12, [sp, #0x4E4]
        mov     lr, lr, asr #16
        str     lr, [sp, #0x10]
LDRD20:
        mov     r12, r6, lsl #1
        sub     r11, r11, #1
        mov     r12, r12, lsl #16
        mov     lr, r11, lsl #16
        mov     r12, r12, asr #16
        mov     r8, lr, asr #16
        add     lr, r8, #1
        cmp     r12, lr
        str     r12, [sp, #8]
        movge   r11, #2, 2
        bge     LDRD22
        mov     r1, r12
        ldr     r0, [sp, #0x14]
        mov     r11, #2, 2
LDRD21:
        mov     r1, r1, lsl #2
        rsb     r1, r1, #0
        ldr     r1, [r0, +r1]
        cmp     r1, r11
        movgt   r11, r1
        movgt   r8, r12
        add     r12, r12, #1
        mov     r1, r12, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, lr
        blt     LDRD21
LDRD22:
        mov     r12, r8, lsl #16
        add     r3, sp, #0x4E, 28
        mov     r12, r12, asr #16
        sub     r0, r5, r12, lsl #1
        mov     r1, r4
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x4E0]
        add     r0, sp, #0x4E, 28
        mov     r1, #1
        mov     lr, lr, lsl #1
        str     lr, [sp, #0x4E0]
        bl      _ippsInvSqrt_32s_I
        cmp     r9, #0
        ldreq   r12, [sp, #0x4E0]
        ldrne   r12, [sp, #0x4E0]
        movne   r12, r12, lsl #1
        mov     lr, #0xFF
        orr     r0, lr, #0x7F, 24
        mov     lr, r11, asr #16
        cmp     r9, #0
        mov     r2, lr, lsl #16
        and     lr, r0, r12, asr #1
        mov     r1, r12, asr #16
        mov     r12, r2, asr #16
        mul     lr, lr, r12
        mov     r1, r1, lsl #16
        and     r11, r0, r11, asr #1
        mov     r0, r1, asr #16
        mul     r11, r0, r11
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mla     lr, r12, r0, lr
        mov     r11, r11, asr #15
        mov     r12, r11, lsl #16
        add     r12, lr, r12, asr #16
        mov     r12, r12, lsl #1
        beq     LDRD23
        cmp     r10, #0
        rsblt   lr, r10, #0
        movlt   r12, r12, lsl lr
        movge   r12, r12, asr r10
        str     r12, [sp, #0x4E0]
        mov     r12, r12, asr #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #0xC]
        b       LDRD24
LDRD23:
        str     r12, [sp, #0x4E0]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #0xC]
LDRD24:
        ldr     r12, [sp, #8]
        sub     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     r11, r12, asr #16
        add     r12, r11, #1
        cmp     r6, r12
        movge   r12, #2, 2
        strge   r12, [sp, #8]
        bge     LDRD26
        mov     lr, #2, 2
        str     lr, [sp, #8]
        ldr     lr, [sp, #8]
        ldr     r0, [sp, #0x14]
        mov     r1, r6
LDRD25:
        mov     r1, r1, lsl #2
        rsb     r1, r1, #0
        ldr     r1, [r0, +r1]
        cmp     r1, lr
        movgt   lr, r1
        movgt   r11, r6
        add     r6, r6, #1
        mov     r1, r6, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, r12
        blt     LDRD25
        str     lr, [sp, #8]
LDRD26:
        mov     r12, r11, lsl #16
        add     r3, sp, #1, 22
        mov     r12, r12, asr #16
        sub     r0, r5, r12, lsl #1
        add     r3, r3, #0xDC
        mov     r1, r4
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r2, [sp, #0x4DC]
        add     r0, sp, #1, 22
        add     r0, r0, #0xDC
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x4DC]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r9, #0
        ldreq   r0, [sp, #0x4DC]
        ldrne   r0, [sp, #0x4DC]
        movne   r0, r0, lsl #1
        mov     r1, #0xFF
        orr     r2, r1, #0x7F, 24
        ldr     r1, [sp, #8]
        cmp     r9, #0
        mov     r12, r1, asr #16
        and     r1, r2, r1, asr #1
        mov     lr, r12, lsl #16
        and     r12, r2, r0, asr #1
        mov     r0, r0, asr #16
        mov     r2, lr, asr #16
        mul     r12, r12, r2
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r1, r0, r1
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mla     r12, r2, r0, r12
        mov     r1, r1, asr #15
        mov     r0, r1, lsl #16
        add     r0, r12, r0, asr #16
        mov     r0, r0, lsl #1
        moveq   r0, r0, lsl #16
        moveq   r0, r0, asr #16
        beq     LDRD27
        cmp     r10, #0
        rsblt   r10, r10, #0
        movlt   r10, r0, lsl r10
        movge   r10, r0, asr r10
        mov     r0, r10, asr #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDRD27:
        ldr     r2, [sp, #0x10]
        mov     r1, #0xCD
        orr     r1, r1, #0x1B, 22
        mul     r2, r2, r1
        ldr     r12, [sp, #0xC]
        mov     r2, r2, asr #15
        cmp     r2, r12
        bge     LDRD28
        ldr     r2, [sp, #0xC]
        mov     r7, r8
        mul     r1, r2, r1
        mov     r2, r1, asr #15
LDRD28:
        cmp     r2, r0
        movlt   r7, r11
        mov     r7, r7, lsl #16
        add     sp, sp, #0xE8
        mov     r0, r7, asr #16
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDRD29:
        sub     r2, r5, r7, lsl #1
        mov     r0, r10
        mov     r3, r11
        mov     r1, #3
        bl      _ippsRShiftC_16s
        mov     r10, #3
        b       LDRD16
LDRD_ownHpMax:
        .long   0xe92d4ff0
        .long   0xe24dd010
        .long   0xe59dc034
        .long   0xe59d7038
        .long   0xe28cc001
        .long   0xe15c0003
        .long   0xe1a05001
        .long   0xe1a04002
        .long   0xe3a06102
        .long   0xaa000037
        .long   0xe240b004
        .long   0xe280a004
        .long   0xe040e10c
        .long   0xe3e09102
        .long   0xe3e08000
        .long   0xe58d4004
        .long   0xe58d5000
LDRD30:
        .long   0xe41e0004
        .long   0xe3700107
        .long   0xc1a00009
        .long   0xca000002
        .long   0xe3500103
        .long   0xa1a00080
        .long   0xb3a00102
LDRD31:
        .long   0xe26c2000
        .long   0xe79b4102
        .long   0xe0501004
        .long   0xe1a04fc4
        .long   0xe0e40fc0
        .long   0xe0514009
        .long   0xe2d05000
        .long   0xb3a04000
        .long   0xb3a05000
        .long   0xe1945005
        .long   0x13e01102
        .long   0x1a000002
        .long   0xe3510102
        .long   0xe0d00008
        .long   0xb3a01102
LDRD32:
        .long   0xe79a2102
        .long   0xe0510002
        .long   0xe1a02fc2
        .long   0xe0e21fc1
        .long   0xe0502009
        .long   0xe2d14000
        .long   0xb3a02000
        .long   0xb3a04000
        .long   0xe1924004
        .long   0x13e00102
        .long   0x1a000002
        .long   0xe3500102
        .long   0xe0d11008
        .long   0xb3a00102
LDRD33:
        .long   0xe3500000
        .long   0xaa000002
        .long   0xe3500102
        .long   0x03e00102
        .long   0x12600000
LDRD34:
        .long   0xe1500006
        .long   0xc1a06000
        .long   0xe28cc001
        .long   0xe15c0003
        .long   0xbaffffd1
        .long   0xe59d4004
        .long   0xe59d5000
        .long   0xe58d000c
LDRD35:
        .long   0xe28d300c
        .long   0xe1a00005
        .long   0xe3a02000
        .long   0xe1a01004
        .long   0xeb000000
        .long   0xe28d3008
        .long   0xe2451002
        .long   0xe1a00005
        .long   0xe1a02004
        .long   0xeb000000
        .long   0xe59d000c
        .long   0xe3e05102
        .long   0xe370021e
        .long   0xc1a00005
        .long   0xca000002
        .long   0xe350020e
        .long   0xa1a00100
        .long   0xb3a00102
LDRD36:
        .long   0xe59d1008
        .long   0xe371021e
        .long   0xc1a02005
        .long   0xca000002
        .long   0xe351020e
        .long   0xa1a02101
        .long   0xb3a02102
LDRD37:
        .long   0xe0501002
        .long   0xe1a02fc2
        .long   0xe0e20fc0
        .long   0xe0513005
        .long   0xe2d02000
        .long   0xb3a03000
        .long   0xb3a02000
        .long   0xe1932002
        .long   0x11a01005
        .long   0x1a000003
        .long   0xe3510102
        .long   0xe3e02000
        .long   0xe0d00002
        .long   0xb3a01102
LDRD38:
        .long   0xe3510000
        .long   0xaa000002
        .long   0xe3510102
        .long   0x01a01005
        .long   0x12611000
LDRD39:
        .long   0xe59f24f4
        .long   0xe59f34f4
        .long   0xe3560000
        .long   0xe3a00000
        .long   0x01a0c000
        .long   0x0a000015
        .long   0xe1b0c846
        .long   0x1a00000b
        .long   0xe3c6c4ff
        .long   0xe3ccc8ff
        .long   0xe1b0e44c
        .long   0x11a0c08e
        .long   0x11a0e003
        .long   0x01a0c08c
        .long   0x01a0e002
        .long   0xe19ec0fc
        .long   0xe28cc010
        .long   0xe1a0c80c
        .long   0xe1a0c84c
        .long   0xea000006
LDRD40:
        .long   0xe3ccc4ff
        .long   0xe3ccc8ff
        .long   0xe1b0e44c
        .long   0x11a0e08e
        .long   0x1193c0fe
        .long   0x01a0c08c
        .long   0x0192c0fc
LDRD41:
        .long   0xe1a06c16
LDRD42:
        .long   0xe3510000
        .long   0xe24c4001
        .long   0x01a08000
        .long   0x0a000014
        .long   0xe1b0c841
        .long   0x1a00000a
        .long   0xe3c1c4ff
        .long   0xe3ccc8ff
        .long   0xe1b0e44c
        .long   0x11a0c08e
        .long   0x11a02003
        .long   0x01a0c08c
        .long   0xe192c0fc
        .long   0xe28c2010
        .long   0xe1a02802
        .long   0xe1a08842
        .long   0xea000006
LDRD43:
        .long   0xe3ccc4ff
        .long   0xe3ccc8ff
        .long   0xe1b0e44c
        .long   0x11a0e08e
        .long   0x119380fe
        .long   0x01a0c08c
        .long   0x019280fc
LDRD44:
        .long   0xe1a01811
LDRD45:
        .long   0xe1a01841
        .long   0xe1a01801
        .long   0xe1b01841
        .long   0x0a000003
        .long   0xe1a00146
        .long   0xeb000000
        .long   0xe1a00800
        .long   0xe1a00840
LDRD46:
        .long   0xe0444008
        .long   0xe1a01804
        .long   0xe1b01841
        .long   0x51a01150
        .long   0x51c710b0
        .long   0x4a000002
        .long   0xe3a00000
        .long   0xe28dd010
        .long   0xe8bd8ff0
LDRD47:
        .long   0xe2612000
        .long   0xe3e010ff
        .long   0xe3c224ff
        .long   0xe3c11c7f
        .long   0xe1e03001
        .long   0xe3c228ff
        .long   0xe1500253
        .long   0xe1a03785
        .long   0xc1a05785
        .long   0xc1e01005
        .long   0xca000004
        .long   0xe1500253
        .long   0xba000002
        .long   0xe1a02210
        .long   0xe1a00802
        .long   0xe1a01840
LDRD48:
        .long   0xe1c710b0
        .long   0xe3a00000
        .long   0xe28dd010
        .long   0xe8bd8ff0
LDRD_ownPitchOLWgh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xF4
        sub     sp, sp, #1, 22
        ldr     r12, [sp, #0x528]
        ldr     r10, [sp, #0x51C]
        ldr     r4, [sp, #0x520]
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0x52C]
        ldr     r11, [sp, #0x518]
        ldr     r6, [sp, #0x524]
        str     r12, [sp, #0x10]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        sub     r8, r3, r10, lsl #1
        mov     lr, #0
        add     r3, sp, #1, 22
        str     lr, [sp, #0x4E8]
        str     lr, [sp]
        add     r3, r3, #0xE8
        add     r12, sp, #0x28
        mov     r7, r2
        add     r9, r10, r4
        mov     r2, r9
        mov     r1, r8
        mov     r0, r8
        and     r5, r12, #0xF
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x4E8]
        add     lr, sp, #0xA6, 30
        and     r0, lr, #0xF
        rsb     r5, r5, #0
        and     lr, r5, #0xF
        rsb     r5, r0, #0
        add     r0, sp, #0x28
        add     r0, r0, lr
        and     lr, r5, #0xF
        add     r5, r0, r10, lsl #1
        add     r0, sp, #0xA6, 30
        add     lr, r0, lr
        cmn     r12, #7, 2
        str     lr, [sp, #0x14]
        sub     r1, r5, r10, lsl #1
        bge     LDRD57
        cmp     r12, #2, 14
        bge     LDRD49
        mov     r3, r9
        mov     r2, r1
        mov     r0, r8
        mov     r1, #3
        bl      _ippsLShiftC_16s
        b       LDRD50
LDRD49:
        mov     r2, r9
        mov     r0, r8
        bl      _ippsCopy_16s
LDRD50:
        ldr     r3, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        sub     r1, r5, r10, lsl #1
        add     r3, r3, r10, lsl #2
        str     r3, [sp, #0x14]
        mov     r8, r12, lsl #1
        sub     r12, r10, r11
        add     r12, r12, #1
        str     r12, [sp]
        sub     r3, r3, r10, lsl #2
        mov     r2, r4
        mov     r0, r5
        bl      _ippsCrossCorr_Fwd_Low_16s32s
        ldr     r3, [sp, #8]
        ldrsh   lr, [r7]
        ldrsh   r12, [r3]
        ldr     r3, [pc, #0x27C]
        rsb     r9, r12, r10
        mov     r12, #0xF6
        cmp     lr, #0
        add     r9, r3, r9, lsl #1
        add     r12, r12, r9
        add     r3, r3, #0x7D, 30
        mov     r9, r10
        ble     LDRD55
        cmp     r10, r11
        blt     LDRD52
        mov     r2, r10
        ldr     r0, [sp, #0x14]
        mov     lr, #2, 2
        str     r6, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     r7, [sp, #0x24]
LDRD51:
        mov     r2, r2, lsl #2
        rsb     r1, r2, #0
        ldr     r2, [r0, +r1]
        ldrsh   r6, [r3], #-2
        mov     r1, #0xFF
        orr     r4, r1, #0x7F, 24
        and     r1, r4, r2, asr #1
        mul     r1, r1, r6
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r1, r1, asr #15
        mov     r2, r2, asr #16
        mla     r1, r2, r6, r1
        str     r1, [sp, #0x4F0]
        ldrsh   r2, [r12], #-2
        and     r4, r1, r4
        mul     r4, r4, r2
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mov     r4, r4, asr #15
        mla     r1, r1, r2, r4
        cmp     r1, lr
        movge   lr, r1
        movge   r9, r10
        sub     r10, r10, #1
        mov     r2, r10, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, r11
        bge     LDRD51
        ldr     r6, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        str     r1, [sp, #0x4F0]
LDRD52:
        mov     r12, r9, lsl #16
        add     r3, sp, #0x4F, 28
        mov     r12, r12, asr #16
        sub     r10, r5, r12, lsl #1
        mov     r2, r4
        mov     r0, r5
        mov     r1, r10
        bl      _ippsDotProd_16s32s
        add     r3, sp, #1, 22
        add     r3, r3, #0xEC
        mov     r1, r4
        mov     r0, r10
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x4EC]
        ldr     r1, [sp, #0x4F0]
        ldr     lr, [sp, #0x18]
        mov     r3, #0x66
        mov     r12, r12, lsl #1
        orr     r4, r3, #0x26, 24
        add     r12, r12, #2, 18
        mov     r3, r1, lsl #1
        mov     r1, r12, asr #16
        add     r12, r4, #1, 18
        mul     r12, r1, r12
        sub     r12, r3, r12
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0
        strh    r12, [lr, +r8]
        ble     LDRD54
        ldrsh   r5, [r6, #6]
        ldrsh   r12, [r6, #4]
        ldrsh   lr, [r6, #2]
        strh    r5, [r6, #8]
        ldrsh   r5, [r6]
        str     r1, [sp, #0x4EC]
        str     r3, [sp, #0x4F0]
        strh    r12, [r6, #6]
        strh    lr, [r6, #4]
        strh    r5, [r6, #2]
        strh    r9, [r6]
        mov     r0, r6
        mov     r1, #5
        bl      ownGmed_n
        ldr     r1, [sp, #8]
        strh    r0, [r1]
        mov     r0, #0xFF
        orr     r1, r0, #0x7F, 24
        ldr     r0, [sp, #0xC]
        strh    r1, [r0]
LDRD53:
        cmp     r4, r1
        movle   r0, #1
        movgt   r0, #0
        strh    r0, [r7]
        mov     r9, r9, lsl #16
        add     sp, sp, #0xF4
        mov     r0, r9, asr #16
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDRD54:
        ldr     r0, [sp, #8]
        mov     r3, #0x33
        orr     r3, r3, #0x73, 24
        strh    r9, [r0]
        ldr     r0, [sp, #0xC]
        ldrsh   r1, [r0]
        mul     r3, r1, r3
        mov     r1, r3, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r0]
        b       LDRD53
LDRD55:
        cmp     r10, r11
        blt     LDRD52
        mov     r12, r10
        ldr     r0, [sp, #0x14]
        mov     lr, #2, 2
LDRD56:
        mov     r12, r12, lsl #2
        rsb     r12, r12, #0
        ldr     r2, [r0, +r12]
        ldrsh   r1, [r3], #-2
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        and     r12, r12, r2, asr #1
        mul     r12, r12, r1
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r12, r12, asr #15
        mov     r2, r2, asr #16
        mla     r1, r2, r1, r12
        cmp     r1, lr
        movge   lr, r1
        movge   r9, r10
        sub     r10, r10, #1
        mov     r12, r10, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r11
        bge     LDRD56
        str     r1, [sp, #0x4F0]
        b       LDRD52
LDRD57:
        mov     r3, r9
        mov     r2, r1
        mov     r0, r8
        mov     r1, #3
        bl      _ippsRShiftC_16s
        b       LDRD50
        .long   NormTable2
        .long   NormTable
        .long   LDRD_corrweight


        .data
        .align  4


LDRD_corrweight:
        .byte   0xF9,0x4F,0x1A,0x50,0x3B,0x50,0x5C,0x50,0x7D,0x50,0xA4,0x50,0xC5,0x50,0xEC,0x50
        .byte   0x0D,0x51,0x34,0x51,0x55,0x51,0x7C,0x51,0x9D,0x51,0xC4,0x51,0xEC,0x51,0x13,0x52
        .byte   0x3A,0x52,0x61,0x52,0x89,0x52,0xB0,0x52,0xD7,0x52,0xFF,0x52,0x26,0x53,0x54,0x53
        .byte   0x7B,0x53,0xA9,0x53,0xD0,0x53,0xFE,0x53,0x26,0x54,0x54,0x54,0x81,0x54,0xAF,0x54
        .byte   0xDD,0x54,0x0B,0x55,0x39,0x55,0x67,0x55,0x95,0x55,0xC9,0x55,0xF7,0x55,0x2B,0x56
        .byte   0x59,0x56,0x8E,0x56,0xC2,0x56,0xF7,0x56,0x2B,0x57,0x5F,0x57,0x94,0x57,0xC8,0x57
        .byte   0x03,0x58,0x38,0x58,0x73,0x58,0xAE,0x58,0xE9,0x58,0x24,0x59,0x5F,0x59,0x9A,0x59
        .byte   0xDB,0x59,0x16,0x5A,0x58,0x5A,0x99,0x5A,0xD4,0x5A,0x1C,0x5B,0x5E,0x5B,0x9F,0x5B
        .byte   0xE7,0x5B,0x30,0x5C,0x71,0x5C,0xC0,0x5C,0x08,0x5D,0x50,0x5D,0x9F,0x5D,0xED,0x5D
        .byte   0x3C,0x5E,0x8A,0x5E,0xE0,0x5E,0x2E,0x5F,0x83,0x5F,0xD9,0x5F,0x34,0x60,0x8A,0x60
        .byte   0xE5,0x60,0x48,0x61,0xA3,0x61,0x06,0x62,0x68,0x62,0xD1,0x62,0x33,0x63,0x9C,0x63
        .byte   0x0B,0x64,0x7B,0x64,0xEA,0x64,0x60,0x65,0xD6,0x65,0x4C,0x66,0xC9,0x66,0x4C,0x67
        .byte   0xCF,0x67,0x52,0x68,0xDC,0x68,0x6C,0x69,0xFC,0x69,0x93,0x6A,0x30,0x6B,0xCD,0x6B
        .byte   0x71,0x6C,0x1B,0x6D,0xCC,0x6D,0x7D,0x6E,0x3B,0x6F,0xF9,0x6F,0xC5,0x70,0x96,0x71
        .byte   0x6F,0x72,0x54,0x73,0x40,0x74,0x32,0x75,0x32,0x76,0x3F,0x77,0x58,0x78,0xE1,0x7A
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xE1,0x7A
        .byte   0x58,0x78,0x3F,0x77,0x32,0x76,0x32,0x75,0x40,0x74,0x54,0x73,0x6F,0x72,0x96,0x71
        .byte   0xC5,0x70,0xF9,0x6F,0x3B,0x6F,0x7D,0x6E,0xCC,0x6D,0x1B,0x6D,0x71,0x6C,0xCD,0x6B
        .byte   0x30,0x6B,0x93,0x6A,0xFC,0x69,0x6C,0x69,0xDC,0x68,0x52,0x68,0xCF,0x67,0x4C,0x67
        .byte   0xC9,0x66,0x4C,0x66,0xD6,0x65,0x60,0x65,0xEA,0x64,0x7B,0x64,0x0B,0x64,0x9C,0x63
        .byte   0x33,0x63,0xD1,0x62,0x68,0x62,0x06,0x62,0xA3,0x61,0x48,0x61,0xE5,0x60,0x8A,0x60
        .byte   0x34,0x60,0xD9,0x5F,0x83,0x5F,0x2E,0x5F,0xE0,0x5E,0x8A,0x5E,0x3C,0x5E,0xED,0x5D
        .byte   0x9F,0x5D,0x50,0x5D,0x08,0x5D,0xC0,0x5C,0x71,0x5C,0x30,0x5C,0xE7,0x5B,0x9F,0x5B
        .byte   0x5E,0x5B,0x1C,0x5B,0xD4,0x5A,0x99,0x5A,0x58,0x5A,0x16,0x5A,0xDB,0x59,0x9A,0x59
        .byte   0x5F,0x59,0x24,0x59,0xE9,0x58,0xAE,0x58,0x73,0x58,0x38,0x58,0x03,0x58,0xC8,0x57
        .byte   0x94,0x57,0x5F,0x57,0x2B,0x57,0xF7,0x56,0xC2,0x56,0x8E,0x56,0x59,0x56,0x2B,0x56
        .byte   0xF7,0x55,0xC9,0x55,0x95,0x55,0x67,0x55,0x39,0x55,0x0B,0x55,0xDD,0x54,0xAF,0x54
        .byte   0x81,0x54,0x54,0x54,0x26,0x54,0xFE,0x53,0xD0,0x53,0xA9,0x53,0x7B,0x53,0x54,0x53
        .byte   0x26,0x53,0xFF,0x52,0xD7,0x52,0xB0,0x52,0x89,0x52,0x61,0x52,0x3A,0x52,0x13,0x52
        .byte   0xEC,0x51,0xC4,0x51,0x9D,0x51,0x7C,0x51,0x55,0x51,0x34,0x51,0x0D,0x51,0xEC,0x50
        .byte   0xC5,0x50,0xA4,0x50,0x7D,0x50,0x5C,0x50,0x3B,0x50,0x1A,0x50,0xF9,0x4F,0xD2,0x4F
        .byte   0xB1,0x4F,0x91,0x4F,0x70,0x4F


