        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearchDTXVAD2_GSMAMR_16s32s


_ippsOpenLoopPitchSearchDTXVAD2_GSMAMR_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2D, 28
        ldr     r4, [sp, #0x304]
        add     lr, sp, #0x5C
        ldr     r7, [sp, #0x2F4]
        and     lr, lr, #0xF
        ldr     r11, [sp, #0x2F8]
        ldr     r5, [sp, #0x2FC]
        ldr     r10, [sp, #0x300]
        rsb     lr, lr, #0
        str     r4, [sp, #0x54]
        ldr     r4, [sp, #0x308]
        and     lr, lr, #0xF
        add     r12, sp, #0x5C
        add     lr, r12, lr
        ldr     r12, [sp, #0x30C]
        str     r4, [sp, #0x50]
        ldr     r4, [sp, #0x310]
        mov     r9, r0
        cmp     r9, #0
        str     lr, [sp, #0x44]
        str     r12, [sp, #0x40]
        mov     r8, r1
        mov     r6, r3
        beq     LDRE14
        cmp     r8, #0
        beq     LDRE14
        cmp     r2, #0
        beq     LDRE14
        cmp     r6, #0
        beq     LDRE14
        cmp     r7, #0
        beq     LDRE14
        cmp     r11, #0
        beq     LDRE14
        cmp     r5, #0
        beq     LDRE14
        cmp     r10, #0
        beq     LDRE14
        ldr     r12, [sp, #0x54]
        cmp     r12, #0
        beq     LDRE14
        ldr     r12, [sp, #0x50]
        cmp     r12, #0
        beq     LDRE14
        ldr     r12, [sp, #0x40]
        cmp     r12, #0
        beq     LDRE14
        cmp     r4, #0
        beq     LDRE0
        cmp     r4, #1
        beq     LDRE0
        cmp     r4, #3
        beq     LDRE0
        cmp     r4, #6
        beq     LDRE0
        cmp     r4, #7
        beq     LDRE0
        cmp     r4, #8
        beq     LDRE0
        cmp     r4, #0xB
        beq     LDRE0
        cmp     r4, #0xC
        beq     LDRE0
        cmp     r4, #0x19
        beq     LDRE0
        mvn     r0, #6
        add     sp, sp, #0x2D, 28
        ldmia   sp!, {r4 - r11, pc}
LDRE0:
        ldr     r1, [sp, #0x44]
        mov     r12, #2
        add     lr, r12, #0x47, 30
        add     r2, r2, #0x14
        str     r2, [sp, #0x48]
        add     lr, r1, lr
        add     r12, r12, #0x42, 30
        str     r12, [sp, #0x58]
        str     lr, [sp, #0x4C]
        mov     r0, r5
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        ldr     r2, [sp, #0x44]
        ldr     r12, [sp, #0x58]
        mov     r0, #0
        str     r5, [sp, #0x3C]
        str     r11, [sp, #0x38]
        add     r1, r2, r12
        ldr     r2, [sp, #0x4C]
        ldr     r11, [sp, #0x48]
        str     r7, [sp, #0x34]
        str     r6, [sp, #0x30]
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
LDRE1:
        mov     r2, r5
        mov     r1, r9
        mov     r0, r11
        bl      _ippsResidualFilter_G729_16s
        str     r6, [sp]
        mov     r3, #0xC
        mov     r2, #0x28
        mov     r1, r5
        mov     r0, r8
        bl      _ippsSynthesisFilterLow_NR_16s_ISfs
        add     r7, r7, #0xB
        cmp     r7, #0x2C
        add     r6, r6, #0x50
        add     r11, r11, #0x50
        add     r5, r5, #0x50
        add     r8, r8, #0x16
        add     r9, r9, #0x16
        blt     LDRE1
        ldr     r5, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        cmp     r4, #0xB
        beq     LDRE13
        str     r11, [sp, #0x38]
        str     r7, [sp, #0x34]
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x4C]
        ldr     r7, [sp, #0x50]
        ldr     r11, [sp, #0x54]
        mov     r9, #0
        mov     r0, #0
        str     r5, [sp, #0x3C]
        mov     r8, r9
        mov     r2, #0x50
        mov     r12, #2
        mov     r5, r0
LDRE2:
        ldr     r1, [sp, #0x40]
        mov     r2, #0
        cmp     r4, #0
        strh    r2, [r1]
        strh    r2, [r1, #2]
        beq     LDRE12
        cmp     r4, #1
        beq     LDRE11
        cmp     r4, #8
        ble     LDRE9
        cmp     r4, #0xB
        beq     LDRE3
        mov     r2, #2
        str     r2, [sp, #8]
        mov     r2, r9, lsl #16
        str     r11, [sp, #0x18]
        mov     r2, r2, asr #16
        str     r2, [sp, #4]
        add     r1, r8, r8, lsl #2
        mov     r2, #0x50
        str     r2, [sp]
        add     r1, r6, r1, lsl #5
        str     r10, [sp, #0x14]
        str     r5, [sp, #0x10]
        str     r5, [sp, #0xC]
        mov     r0, r4
        mov     r3, #0x8F
        mov     r2, #0x12
        bl      LDRE_ownPitchOL
        mov     r8, r8, lsl #1
        add     r9, r9, #1
        strh    r0, [r7, +r8]
        mov     r1, r9, lsl #16
        mov     r8, r1, asr #16
        cmp     r8, #2
        blt     LDRE2
        b       LDRE10
LDRE3:
        ldr     r5, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x4C]
LDRE4:
        ldrsh   r2, [r7]
        mov     r12, #0x66
        orr     r12, r12, #0x26, 24
        cmp     r12, r2
        movgt   lr, #0
        movle   lr, #1
        add     r12, sp, #2, 24
        strh    lr, [r12, #0xCC]
        ldr     r12, [sp, #0x54]
        str     r10, [sp, #0x24]
        add     r2, r8, r8, lsl #2
        str     r12, [sp, #0x28]
        mov     r12, #0
        str     r12, [sp, #0x20]
        str     r12, [sp, #0x1C]
        add     r3, r5, r2, lsl #5
        mov     r12, r9, lsl #16
        mov     r2, #2
        str     r2, [sp, #0x18]
        mov     r12, r12, asr #16
        str     r12, [sp, #0x14]
        ldr     r2, [sp, #0x40]
        str     r11, [sp, #0xC]
        mov     r0, r6
        str     r2, [sp, #0x10]
        mov     r2, #0x50
        str     r2, [sp, #8]
        mov     r2, #0x8F
        str     r2, [sp, #4]
        mov     r2, #0x14
        str     r2, [sp]
        add     r2, sp, #0xB3, 30
        mov     r1, r7
        bl      LDRE_ownPitchOLWgh
        ldr     r12, [sp, #0x50]
        mov     r8, r8, lsl #1
        add     r9, r9, #1
        strh    r0, [r12, +r8]
        mov     r2, r9, lsl #16
        mov     r8, r2, asr #16
        cmp     r8, #2
        bge     LDRE7
LDRE5:
        cmp     r4, #0
        bne     LDRE4
        ldr     r5, [sp, #0x3C]
LDRE6:
        ldr     r2, [sp, #0x54]
        str     r10, [sp, #0x14]
        mov     r0, r4
        str     r2, [sp, #0x18]
        mov     r2, #0
        str     r2, [sp, #0x10]
        str     r2, [sp, #0xC]
        ldr     r3, [sp, #0x4C]
        mov     r2, #2
        str     r2, [sp, #8]
        mov     r2, #1
        str     r2, [sp, #4]
        mov     r2, #0xA0
        add     r8, r8, r8, lsl #2
        str     r2, [sp]
        add     r1, r3, r8, lsl #5
        mov     r2, #0x14
        mov     r3, #0x8F
        bl      LDRE_ownPitchOL
        ldr     r2, [sp, #0x44]
        add     r1, r2, #5, 26
        ldr     r2, [sp, #0x50]
        strh    r0, [r2]
        strh    r0, [r2, #2]
        mov     r0, r1
        mov     r1, r5
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x2D, 28
        ldmia   sp!, {r4 - r11, pc}
LDRE7:
        ldr     r5, [sp, #0x3C]
LDRE8:
        ldr     r2, [sp, #0x44]
        mov     r1, r5
        add     r0, r2, #5, 26
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x2D, 28
        ldmia   sp!, {r4 - r11, pc}
LDRE9:
        mov     r2, #2
        str     r2, [sp, #8]
        mov     r2, r9, lsl #16
        str     r11, [sp, #0x18]
        mov     r2, r2, asr #16
        str     r2, [sp, #4]
        add     r1, r8, r8, lsl #2
        mov     r2, #0x50
        str     r2, [sp]
        add     r1, r6, r1, lsl #5
        str     r10, [sp, #0x14]
        str     r5, [sp, #0x10]
        str     r5, [sp, #0xC]
        mov     r0, r4
        mov     r3, #0x8F
        mov     r2, #0x14
        bl      LDRE_ownPitchOL
        mov     r8, r8, lsl #1
        add     r9, r9, #1
        strh    r0, [r7, +r8]
        mov     r1, r9, lsl #16
        mov     r8, r1, asr #16
        cmp     r8, #2
        blt     LDRE2
        ldr     r5, [sp, #0x3C]
        b       LDRE8
LDRE10:
        ldr     r5, [sp, #0x3C]
        b       LDRE8
LDRE11:
        ldr     r5, [sp, #0x3C]
        b       LDRE6
LDRE12:
        ldr     r5, [sp, #0x3C]
        b       LDRE6
LDRE13:
        str     r5, [sp, #0x3C]
        ldr     r5, [sp, #0x4C]
        mov     r8, #0
        mov     r9, r8
        b       LDRE5
LDRE14:
        mvn     r0, #7
        add     sp, sp, #0x2D, 28
        ldmia   sp!, {r4 - r11, pc}
LDRE_ownPitchOL:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x41, 30
        sub     sp, sp, #1, 22
        ldr     lr, [sp, #0x53C]
        ldr     r4, [sp, #0x528]
        ldr     r9, [sp, #0x540]
        add     r8, sp, #0xA9, 30
        str     r0, [sp, #0xC]
        and     r8, r8, #0xF
        rsb     r0, r8, #0
        str     lr, [sp, #0x20]
        add     r8, sp, #0x34
        and     r0, r0, #0xF
        add     lr, sp, #0xA9, 30
        and     r8, r8, #0xF
        add     r0, lr, r0
        add     r6, sp, #5, 24
        mov     r5, r3
        str     r0, [sp, #8]
        add     lr, sp, #0x34
        rsb     r8, r8, #0
        mov     r3, r6
        and     r8, r8, #0xF
        add     r6, lr, r8
        mov     lr, #0
        str     lr, [sp, #0x500]
        mov     r7, r2
        sub     r10, r1, r5, lsl #1
        str     lr, [sp]
        add     r11, r5, r4
        mov     r2, r11
        mov     r1, r10
        mov     r0, r10
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x500]
        mov     r8, r5, lsl #1
        add     r6, r8, r6
        cmn     r12, #7, 2
        bge     LDRE37
        cmp     r12, #2, 14
        sub     r1, r6, r5, lsl #1
        bge     LDRE15
        mov     r3, r11
        mov     r2, r1
        mov     r0, r10
        mov     r1, #3
        bl      _ippsLShiftC_16s
        mvn     r12, #2
        str     r12, [sp, #0x10]
        b       LDRE16
LDRE15:
        mov     r2, r11
        mov     r0, r10
        bl      _ippsCopy_16s
        mov     r12, #0
        str     r12, [sp, #0x10]
LDRE16:
        ldr     r12, [sp, #8]
        sub     r1, r6, r8
        add     r10, r12, r5, lsl #2
        sub     r12, r5, r7
        add     r12, r12, #1
        str     r12, [sp]
        sub     r3, r10, r5, lsl #2
        mov     r2, r4
        mov     r0, r6
        bl      _ippsCrossCorr_Fwd_Low_16s32s
        ldr     r12, [sp, #0xC]
        cmp     r12, #0xC
        moveq   r11, #1
        movne   r11, #0
        mov     r12, r7, lsl #2
        add     lr, r5, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, lr
        str     r12, [sp, #0x1C]
        movge   r12, #2, 2
        strge   r12, [sp, #0x14]
        bge     LDRE18
        mov     r8, #2, 2
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #0x14]
        mov     r0, r12
LDRE17:
        mov     r1, r0, lsl #2
        rsb     r1, r1, #0
        ldr     r1, [r10, +r1]
        cmp     r1, r8
        movgt   r8, r1
        movgt   r5, r0
        add     r12, r12, #1
        mov     r0, r12, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, lr
        blt     LDRE17
        str     r8, [sp, #0x14]
LDRE18:
        add     r3, sp, #1, 22
        add     r3, r3, #0xF8
        sub     r0, r6, r5, lsl #1
        mov     r1, r4
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x4F8]
        add     r0, sp, #1, 22
        add     r0, r0, #0xF8
        mov     lr, lr, lsl #1
        str     lr, [sp, #0x2C]
        str     lr, [sp, #0x4F8]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r11, #0
        ldreq   r12, [sp, #0x4F8]
        ldrne   r12, [sp, #0x4F8]
        movne   r12, r12, lsl #1
        ldr     r1, [sp, #0x14]
        mvn     lr, #0
        cmp     r11, #0
        mov     r8, r1, asr #16
        add     lr, lr, #2, 18
        and     r1, lr, r1, asr #1
        mov     r0, r8, lsl #16
        and     r8, lr, r12, asr #1
        mov     r12, r12, asr #16
        mov     r0, r0, asr #16
        mul     r8, r8, r0
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mul     r12, lr, r1
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mla     r8, r0, lr, r8
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        add     r12, r8, r12, asr #16
        mov     r12, r12, lsl #1
        beq     LDRE20
        ldr     lr, [sp, #0x10]
        cmp     lr, #0
        ldrge   lr, [sp, #0x10]
        movge   r12, r12, asr lr
        blt     LDRE34
LDRE19:
        mov     r8, r12, asr #1
        str     r12, [sp, #0x4F8]
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        str     r8, [sp, #0xC]
        b       LDRE21
LDRE20:
        mov     lr, r12, lsl #16
        str     r12, [sp, #0x4F8]
        mov     lr, lr, asr #16
        str     lr, [sp, #0xC]
LDRE21:
        ldr     r12, [sp, #0x1C]
        sub     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mov     r12, r7, lsl #1
        str     lr, [sp, #0x28]
        mov     r12, r12, lsl #16
        add     r8, lr, #1
        mov     r12, r12, asr #16
        cmp     r12, r8
        str     r12, [sp, #0x24]
        movge   r12, #2, 2
        strge   r12, [sp, #0x18]
        bge     LDRE23
        mov     lr, #2, 2
        str     lr, [sp, #0x18]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x28]
        mov     lr, r12
LDRE22:
        mov     r2, lr, lsl #2
        rsb     r2, r2, #0
        ldr     r2, [r10, +r2]
        cmp     r2, r0
        movgt   r0, r2
        movgt   r1, lr
        add     r12, r12, #1
        mov     lr, r12, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, r8
        blt     LDRE22
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x28]
LDRE23:
        ldr     r12, [sp, #0x28]
        add     r3, sp, #1, 22
        add     r3, r3, #0xFC
        sub     r0, r6, r12, lsl #1
        mov     r1, r4
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x4FC]
        add     r0, sp, #1, 22
        add     r0, r0, #0xFC
        mov     lr, lr, lsl #1
        str     lr, [sp, #0x30]
        str     lr, [sp, #0x4FC]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r11, #0
        ldreq   r12, [sp, #0x4FC]
        ldrne   r12, [sp, #0x4FC]
        movne   r12, r12, lsl #1
        ldr     r8, [sp, #0x18]
        mvn     lr, #0
        add     lr, lr, #2, 18
        mov     r0, r8, asr #16
        and     r8, lr, r8, asr #1
        mov     r1, r0, lsl #16
        and     r0, lr, r12, asr #1
        mov     r12, r12, asr #16
        mov     r1, r1, asr #16
        mul     r0, r0, r1
        mov     r12, r12, lsl #16
        str     r1, [sp, #0x1C]
        mov     lr, r12, asr #16
        mul     r12, lr, r8
        mov     r0, r0, asr #15
        cmp     r11, #0
        mov     r0, r0, lsl #16
        mov     r12, r12, asr #15
        mov     r8, r0, asr #16
        ldr     r0, [sp, #0x1C]
        mov     r12, r12, lsl #16
        mla     r8, r0, lr, r8
        add     r12, r8, r12, asr #16
        mov     r12, r12, lsl #1
        beq     LDRE25
        ldr     lr, [sp, #0x10]
        cmp     lr, #0
        ldrge   lr, [sp, #0x10]
        movge   r12, r12, asr lr
        blt     LDRE35
LDRE24:
        mov     r8, r12, asr #1
        str     r12, [sp, #0x4FC]
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        b       LDRE26
LDRE25:
        mov     lr, r12, lsl #16
        str     r12, [sp, #0x4FC]
        mov     r8, lr, asr #16
LDRE26:
        ldr     r12, [sp, #0x24]
        sub     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        add     lr, r12, #1
        cmp     r7, lr
        str     r12, [sp, #0x1C]
        movge   r12, #2, 2
        strge   r12, [sp, #8]
        bge     LDRE28
        mov     r12, #2, 2
        str     r12, [sp, #8]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x1C]
        mov     r12, r7
LDRE27:
        mov     r2, r12, lsl #2
        rsb     r2, r2, #0
        ldr     r2, [r10, +r2]
        cmp     r2, r0
        movgt   r0, r2
        movgt   r1, r12
        add     r7, r7, #1
        mov     r12, r7, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, lr
        blt     LDRE27
        str     r0, [sp, #8]
        str     r1, [sp, #0x1C]
LDRE28:
        ldr     r12, [sp, #0x1C]
        add     r3, sp, #1, 22
        add     r3, r3, #0xF4
        sub     r0, r6, r12, lsl #1
        mov     r1, r4
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r1, [sp, #0x4F4]
        add     r0, sp, #1, 22
        add     r0, r0, #0xF4
        mov     r12, r1, lsl #1
        str     r12, [sp, #0x24]
        str     r12, [sp, #0x4F4]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r11, #0
        ldreq   r12, [sp, #0x4F4]
        ldrne   r0, [sp, #0x4F4]
        movne   r12, r0, lsl #1
        ldr     r1, [sp, #8]
        mvn     r2, #0
        add     r2, r2, #2, 18
        mov     r0, r1, asr #16
        and     lr, r2, r12, asr #1
        mov     r0, r0, lsl #16
        mov     r12, r12, asr #16
        mov     r0, r0, asr #16
        mul     lr, lr, r0
        and     r1, r2, r1, asr #1
        mov     r12, r12, lsl #16
        cmp     r11, #0
        mov     lr, lr, asr #15
        mov     r2, r12, asr #16
        mul     r1, r2, r1
        mov     lr, lr, lsl #16
        mov     r12, lr, asr #16
        mla     r12, r0, r2, r12
        mov     r1, r1, asr #15
        mov     r0, r1, lsl #16
        add     r0, r12, r0, asr #16
        mov     r0, r0, lsl #1
        moveq   r0, r0, lsl #16
        moveq   r0, r0, asr #16
        beq     LDRE30
        ldr     r1, [sp, #0x10]
        cmp     r1, #0
        ldrge   r1, [sp, #0x10]
        movge   r1, r0, asr r1
        blt     LDRE36
LDRE29:
        mov     r0, r1, asr #1
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDRE30:
        ldr     r2, [sp, #0xC]
        mov     r1, #0xCD
        orr     r1, r1, #0x1B, 22
        mul     r2, r2, r1
        mov     r2, r2, asr #15
        cmp     r2, r8
        bge     LDRE31
        mul     r8, r8, r1
        ldr     r1, [sp, #0x18]
        ldr     r5, [sp, #0x28]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x30]
        mov     r2, r8, asr #15
        str     r1, [sp, #0x2C]
LDRE31:
        cmp     r2, r0
        bge     LDRE32
        ldr     r0, [sp, #8]
        ldr     r5, [sp, #0x1C]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x24]
        str     r0, [sp, #0x2C]
LDRE32:
        ldr     r1, [sp, #0x20]
        ldr     r12, [sp, #0x14]
        ldr     r0, [sp, #0x2C]
        ldr     lr, [r1]
        mov     r2, r0, asr #31
        add     r12, lr, r12
        str     r12, [r1]
        ldr     r12, [r9]
        mvn     r1, #2, 2
        adds    r0, r12, r0
        adc     r2, r2, r12, asr #31
        subs    lr, r0, r1
        sbcs    r12, r2, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        movne   r0, r1
        bne     LDRE33
        cmp     r0, #2, 2
        mvn     r1, #0
        sbcs    r2, r2, r1
        movlt   r0, #2, 2
LDRE33:
        str     r0, [r9]
        mov     r5, r5, lsl #16
        add     sp, sp, #0x41, 30
        mov     r0, r5, asr #16
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDRE34:
        ldr     lr, [sp, #0x10]
        rsb     lr, lr, #0
        mov     r12, r12, lsl lr
        b       LDRE19
LDRE35:
        ldr     lr, [sp, #0x10]
        rsb     lr, lr, #0
        mov     r12, r12, lsl lr
        b       LDRE24
LDRE36:
        ldr     r1, [sp, #0x10]
        rsb     r1, r1, #0
        mov     r1, r0, lsl r1
        b       LDRE29
LDRE37:
        mov     r3, r11
        mov     r0, r10
        sub     r2, r6, r5, lsl #1
        mov     r1, #3
        bl      _ippsRShiftC_16s
        mov     r12, #3
        str     r12, [sp, #0x10]
        b       LDRE16
LDRE_ownHpMax:
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
LDRE38:
        .long   0xe41e0004
        .long   0xe3700107
        .long   0xc1a00009
        .long   0xca000002
        .long   0xe3500103
        .long   0xa1a00080
        .long   0xb3a00102
LDRE39:
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
LDRE40:
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
LDRE41:
        .long   0xe3500000
        .long   0xaa000002
        .long   0xe3500102
        .long   0x03e00102
        .long   0x12600000
LDRE42:
        .long   0xe1500006
        .long   0xc1a06000
        .long   0xe28cc001
        .long   0xe15c0003
        .long   0xbaffffd1
        .long   0xe59d4004
        .long   0xe59d5000
        .long   0xe58d000c
LDRE43:
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
LDRE44:
        .long   0xe59d1008
        .long   0xe371021e
        .long   0xc1a02005
        .long   0xca000002
        .long   0xe351020e
        .long   0xa1a02101
        .long   0xb3a02102
LDRE45:
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
LDRE46:
        .long   0xe3510000
        .long   0xaa000002
        .long   0xe3510102
        .long   0x01a01005
        .long   0x12611000
LDRE47:
        .long   0xe59f2574
        .long   0xe59f3574
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
LDRE48:
        .long   0xe3ccc4ff
        .long   0xe3ccc8ff
        .long   0xe1b0e44c
        .long   0x11a0e08e
        .long   0x1193c0fe
        .long   0x01a0c08c
        .long   0x0192c0fc
LDRE49:
        .long   0xe1a06c16
LDRE50:
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
LDRE51:
        .long   0xe3ccc4ff
        .long   0xe3ccc8ff
        .long   0xe1b0e44c
        .long   0x11a0e08e
        .long   0x119380fe
        .long   0x01a0c08c
        .long   0x019280fc
LDRE52:
        .long   0xe1a01811
LDRE53:
        .long   0xe1a01841
        .long   0xe1a01801
        .long   0xe1b01841
        .long   0x0a000003
        .long   0xe1a00146
        .long   0xeb000000
        .long   0xe1a00800
        .long   0xe1a00840
LDRE54:
        .long   0xe0444008
        .long   0xe1a01804
        .long   0xe1b01841
        .long   0x51a01150
        .long   0x51c710b0
        .long   0x4a000002
        .long   0xe3a00000
        .long   0xe28dd010
        .long   0xe8bd8ff0
LDRE55:
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
LDRE56:
        .long   0xe1c710b0
        .long   0xe3a00000
        .long   0xe28dd010
        .long   0xe8bd8ff0
LDRE_ownPitchOLWgh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xFC
        sub     sp, sp, #1, 22
        ldr     r12, [sp, #0x520]
        ldr     r11, [sp, #0x524]
        ldr     r4, [sp, #0x528]
        str     r12, [sp, #0x1C]
        ldr     r12, [sp, #0x530]
        ldr     r6, [sp, #0x52C]
        ldr     r10, [sp, #0x544]
        str     r12, [sp, #0x20]
        ldr     r12, [sp, #0x534]
        sub     r8, r3, r11, lsl #1
        ldr     r3, [sp, #0x548]
        str     r12, [sp, #0x10]
        str     r0, [sp, #8]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0xC]
        mov     lr, #0
        str     lr, [sp, #0x4F0]
        add     r3, sp, #0x4F, 28
        str     lr, [sp]
        add     r12, sp, #0x30
        mov     r7, r2
        add     r9, r11, r4
        mov     r2, r9
        mov     r1, r8
        mov     r0, r8
        and     r5, r12, #0xF
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x4F0]
        add     lr, sp, #0x2A, 28
        and     r0, lr, #0xF
        rsb     r5, r5, #0
        and     lr, r5, #0xF
        rsb     r5, r0, #0
        add     r0, sp, #0x30
        add     r0, r0, lr
        and     lr, r5, #0xF
        add     r5, r0, r11, lsl #1
        add     r0, sp, #0x2A, 28
        add     lr, r0, lr
        cmn     r12, #7, 2
        str     lr, [sp, #0x14]
        sub     r1, r5, r11, lsl #1
        bge     LDRE66
        cmp     r12, #2, 14
        bge     LDRE57
        mov     r3, r9
        mov     r2, r1
        mov     r0, r8
        mov     r1, #3
        bl      _ippsLShiftC_16s
        b       LDRE58
LDRE57:
        mov     r2, r9
        mov     r0, r8
        bl      _ippsCopy_16s
LDRE58:
        ldr     r3, [sp, #0x14]
        sub     r1, r5, r11, lsl #1
        mov     r2, r4
        add     r8, r3, r11, lsl #2
        ldr     r3, [sp, #0x10]
        mov     r0, r5
        mov     r3, r3, lsl #1
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x1C]
        sub     r12, r11, r3
        add     r12, r12, #1
        str     r12, [sp]
        sub     r3, r8, r11, lsl #2
        bl      _ippsCrossCorr_Fwd_Low_16s32s
        ldr     r3, [sp, #8]
        ldrsh   lr, [r7]
        ldrsh   r12, [r3]
        ldr     r3, [pc, #0x2EC]
        rsb     r9, r12, r11
        mov     r12, #0xF6
        cmp     lr, #0
        add     r9, r3, r9, lsl #1
        add     r12, r12, r9
        add     r3, r3, #0x7D, 30
        mov     r9, r11
        ble     LDRE64
        ldr     lr, [sp, #0x1C]
        cmp     r11, lr
        blt     LDRE60
        mov     r2, r11
        ldr     r0, [sp, #0x1C]
        mov     lr, #2, 2
        str     r6, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     r7, [sp, #0x2C]
LDRE59:
        mov     r2, r2, lsl #2
        rsb     r1, r2, #0
        ldr     r2, [r8, +r1]
        ldrsh   r6, [r3], #-2
        mvn     r1, #0
        add     r4, r1, #2, 18
        and     r1, r4, r2, asr #1
        mul     r1, r1, r6
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r1, r1, asr #15
        mov     r2, r2, asr #16
        mla     r1, r2, r6, r1
        str     r1, [sp, #0x4F8]
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
        movge   r9, r11
        sub     r11, r11, #1
        mov     r2, r11, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, r0
        bge     LDRE59
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        str     r1, [sp, #0x4F8]
LDRE60:
        add     r3, sp, #1, 22
        mov     r12, r9, lsl #16
        add     r3, r3, #0xF8
        mov     r12, r12, asr #16
        sub     r8, r5, r12, lsl #1
        mov     r2, r4
        mov     r0, r5
        mov     r1, r8
        bl      _ippsDotProd_16s32s
        add     r3, sp, #1, 22
        add     r3, r3, #0xF4
        mov     r1, r4
        mov     r0, r8
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r1, [sp, #0x4F8]
        ldr     r12, [r10]
        ldr     r3, [sp, #0x4F4]
        mov     r1, r1, lsl #1
        mvn     lr, #2, 2
        add     r12, r1, r12
        str     r12, [r10]
        ldr     r12, [sp, #0x18]
        mov     r3, r3, lsl #1
        ldr     r4, [r12]
        mov     r5, r3, asr #31
        adds    r12, r4, r3
        adc     r4, r5, r4, asr #31
        subs    r5, r12, lr
        sbcs    r8, r4, #0
        movlt   r5, #0
        movlt   r8, #0
        orrs    r8, r5, r8
        movne   r12, lr
        bne     LDRE61
        cmp     r12, #2, 2
        mvn     lr, #0
        sbcs    r4, r4, lr
        movlt   r12, #2, 2
LDRE61:
        ldr     lr, [sp, #0x18]
        add     r3, r3, #2, 18
        str     r12, [lr]
        mov     r12, #0x66
        orr     r4, r12, #0x26, 24
        add     r12, r4, #1, 18
        mov     r3, r3, asr #16
        mul     r12, r3, r12
        ldr     lr, [sp, #0x20]
        ldr     r5, [sp, #0x14]
        sub     r12, r1, r12
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0
        strh    r12, [lr, +r5]
        ble     LDRE63
        ldrsh   r5, [r6, #6]
        ldrsh   r12, [r6, #4]
        ldrsh   lr, [r6, #2]
        strh    r5, [r6, #8]
        ldrsh   r5, [r6]
        str     r1, [sp, #0x4F8]
        str     r3, [sp, #0x4F4]
        strh    r12, [r6, #6]
        strh    lr, [r6, #4]
        strh    r5, [r6, #2]
        strh    r9, [r6]
        mov     r0, r6
        mov     r1, #5
        bl      ownGmed_n
        ldr     r1, [sp, #8]
        strh    r0, [r1]
        ldr     r1, [sp, #0xC]
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        strh    r0, [r1]
        mvn     r0, #0
        add     r1, r0, #2, 18
LDRE62:
        cmp     r4, r1
        movle   r0, #1
        movgt   r0, #0
        strh    r0, [r7]
        mov     r9, r9, lsl #16
        add     sp, sp, #0xFC
        mov     r0, r9, asr #16
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDRE63:
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
        b       LDRE62
LDRE64:
        ldr     r12, [sp, #0x1C]
        cmp     r11, r12
        blt     LDRE60
        mov     r12, r11
        ldr     r0, [sp, #0x1C]
        mov     lr, #2, 2
LDRE65:
        mov     r12, r12, lsl #2
        rsb     r12, r12, #0
        ldr     r2, [r8, +r12]
        ldrsh   r1, [r3], #-2
        mvn     r12, #0
        add     r12, r12, #2, 18
        and     r12, r12, r2, asr #1
        mul     r12, r12, r1
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r12, r12, asr #15
        mov     r2, r2, asr #16
        mla     r1, r2, r1, r12
        cmp     r1, lr
        movge   lr, r1
        movge   r9, r11
        sub     r11, r11, #1
        mov     r12, r11, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r0
        bge     LDRE65
        str     r1, [sp, #0x4F8]
        b       LDRE60
LDRE66:
        mov     r3, r9
        mov     r2, r1
        mov     r0, r8
        mov     r1, #3
        bl      _ippsRShiftC_16s
        b       LDRE58
        .long   NormTable2
        .long   NormTable
        .long   LDRE_corrweight


        .data
        .align  4


LDRE_corrweight:
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


