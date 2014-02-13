        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearchDTXVAD1_GSMAMR_16s


_ippsOpenLoopPitchSearchDTXVAD1_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB5, 30
        ldr     r4, [sp, #0x308]
        add     lr, sp, #0x60
        ldr     r8, [sp, #0x2F8]
        and     lr, lr, #0xF
        ldr     r7, [sp, #0x2FC]
        ldr     r11, [sp, #0x300]
        ldr     r5, [sp, #0x304]
        rsb     lr, lr, #0
        str     r4, [sp, #0x58]
        ldr     r4, [sp, #0x30C]
        and     lr, lr, #0xF
        add     r12, sp, #0x60
        add     lr, r12, lr
        ldr     r12, [sp, #0x310]
        str     r4, [sp, #0x54]
        ldr     r4, [sp, #0x314]
        mov     r10, r0
        cmp     r10, #0
        str     lr, [sp, #0x44]
        str     r12, [sp, #0x40]
        mov     r9, r1
        mov     r6, r3
        beq     LDRF14
        cmp     r9, #0
        beq     LDRF14
        cmp     r2, #0
        beq     LDRF14
        cmp     r6, #0
        beq     LDRF14
        cmp     r8, #0
        beq     LDRF14
        cmp     r7, #0
        beq     LDRF14
        cmp     r11, #0
        beq     LDRF14
        cmp     r5, #0
        beq     LDRF14
        ldr     r12, [sp, #0x58]
        cmp     r12, #0
        beq     LDRF14
        ldr     r12, [sp, #0x54]
        cmp     r12, #0
        beq     LDRF14
        ldr     r12, [sp, #0x40]
        cmp     r12, #0
        beq     LDRF14
        cmp     r4, #0
        beq     LDRF0
        cmp     r4, #1
        beq     LDRF0
        cmp     r4, #3
        beq     LDRF0
        cmp     r4, #6
        beq     LDRF0
        cmp     r4, #7
        beq     LDRF0
        cmp     r4, #8
        beq     LDRF0
        cmp     r4, #0xB
        beq     LDRF0
        cmp     r4, #0xC
        beq     LDRF0
        cmp     r4, #0x19
        beq     LDRF0
        mvn     r0, #6
        add     sp, sp, #0xB5, 30
        ldmia   sp!, {r4 - r11, pc}
LDRF0:
        ldr     r1, [sp, #0x44]
        mov     r12, #0x50
        add     lr, r12, #0xCE
        add     r2, r2, #0x14
        str     r2, [sp, #0x4C]
        add     lr, r1, lr
        add     r12, r12, #0xBA
        str     r12, [sp, #0x5C]
        str     lr, [sp, #0x50]
        mov     r2, #0x8F
        mov     r0, r5
        bl      _ippsCopy_16s
        ldr     r2, [sp, #0x44]
        ldr     r12, [sp, #0x5C]
        mov     r0, #0
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x4C]
        add     r1, r2, r12
        ldr     r2, [sp, #0x50]
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x34]
        str     r6, [sp, #0x30]
        mov     r8, r0
        mov     r7, r1
        mov     r6, r2
LDRF1:
        mov     r2, r6
        mov     r1, r10
        mov     r0, r11
        bl      _ippsResidualFilter_G729_16s
        str     r7, [sp]
        mov     r3, #0xC
        mov     r2, #0x28
        mov     r1, r6
        mov     r0, r9
        bl      _ippsSynthesisFilterLow_NR_16s_ISfs
        add     r8, r8, #0xB
        cmp     r8, #0x2C
        add     r7, r7, #0x50
        add     r11, r11, #0x50
        add     r6, r6, #0x50
        add     r9, r9, #0x16
        add     r10, r10, #0x16
        blt     LDRF1
        ldr     r11, [sp, #0x3C]
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        cmp     r4, #0xB
        beq     LDRF13
        str     r11, [sp, #0x3C]
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x34]
        ldr     r7, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        ldr     r11, [sp, #0x58]
        mov     r10, #0
        mov     r0, #0
        str     r5, [sp, #0x48]
        mov     r9, r10
        mov     r2, #1
        mov     r12, #0x50
        mov     r5, r0
LDRF2:
        ldr     r1, [sp, #0x40]
        mov     r2, #0
        cmp     r4, #0
        strh    r2, [r1]
        strh    r2, [r1, #2]
        beq     LDRF12
        cmp     r4, #1
        beq     LDRF11
        cmp     r4, #8
        ble     LDRF9
        cmp     r4, #0xB
        beq     LDRF3
        mov     r2, #1
        str     r2, [sp, #8]
        mov     r2, r10, lsl #16
        str     r5, [sp, #0x18]
        mov     r2, r2, asr #16
        str     r2, [sp, #4]
        add     r1, r9, r9, lsl #2
        mov     r2, #0x50
        str     r2, [sp]
        add     r1, r7, r1, lsl #5
        str     r5, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r6, [sp, #0xC]
        mov     r0, r4
        mov     r3, #0x8F
        mov     r2, #0x12
        bl      LDRF_ownPitchOL
        mov     r9, r9, lsl #1
        add     r10, r10, #1
        strh    r0, [r8, +r9]
        mov     r1, r10, lsl #16
        mov     r9, r1, asr #16
        cmp     r9, #2
        blt     LDRF2
        b       LDRF10
LDRF3:
        ldr     r5, [sp, #0x48]
        ldr     r11, [sp, #0x3C]
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        str     r5, [sp, #0x48]
        ldr     r5, [sp, #0x50]
LDRF4:
        ldrsh   r2, [r7]
        mov     r12, #0x66
        orr     r12, r12, #0x26, 24
        cmp     r12, r2
        movgt   lr, #0
        movle   lr, #1
        add     r12, sp, #2, 24
        strh    lr, [r12, #0xD0]
        mov     r12, #0
        str     r12, [sp, #0x28]
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x58]
        add     r2, r9, r9, lsl #2
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0x20]
        add     r3, r5, r2, lsl #5
        mov     r12, r10, lsl #16
        mov     r2, #1
        str     r2, [sp, #0x18]
        mov     r12, r12, asr #16
        str     r12, [sp, #0x14]
        ldr     r2, [sp, #0x40]
        str     r11, [sp, #0xC]
        mov     r0, r8
        str     r2, [sp, #0x10]
        mov     r2, #0x50
        str     r2, [sp, #8]
        mov     r2, #0x8F
        str     r2, [sp, #4]
        mov     r2, #0x14
        str     r2, [sp]
        add     r2, sp, #0x2D, 28
        mov     r1, r7
        bl      LDRF_ownPitchOLWgh
        ldr     r12, [sp, #0x54]
        mov     r9, r9, lsl #1
        add     r10, r10, #1
        strh    r0, [r12, +r9]
        mov     r2, r10, lsl #16
        mov     r9, r2, asr #16
        cmp     r9, #2
        bge     LDRF7
LDRF5:
        cmp     r4, #0
        bne     LDRF4
        ldr     r5, [sp, #0x48]
LDRF6:
        ldr     r2, [sp, #0x58]
        str     r6, [sp, #0xC]
        mov     r0, r4
        str     r2, [sp, #0x10]
        mov     r2, #0
        str     r2, [sp, #0x18]
        str     r2, [sp, #0x14]
        mov     r2, #1
        str     r2, [sp, #8]
        str     r2, [sp, #4]
        ldr     r3, [sp, #0x50]
        mov     r2, #0xA0
        add     r9, r9, r9, lsl #2
        str     r2, [sp]
        mov     r2, #0x14
        add     r1, r3, r9, lsl #5
        mov     r3, #0x8F
        bl      LDRF_ownPitchOL
        ldr     r2, [sp, #0x44]
        add     r1, r2, #5, 26
        ldr     r2, [sp, #0x54]
        strh    r0, [r2]
        strh    r0, [r2, #2]
        mov     r0, r1
        mov     r1, r5
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xB5, 30
        ldmia   sp!, {r4 - r11, pc}
LDRF7:
        ldr     r5, [sp, #0x48]
LDRF8:
        ldr     r2, [sp, #0x44]
        mov     r1, r5
        add     r0, r2, #5, 26
        mov     r2, #0x8F
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xB5, 30
        ldmia   sp!, {r4 - r11, pc}
LDRF9:
        mov     r2, #1
        str     r2, [sp, #8]
        mov     r2, r10, lsl #16
        str     r5, [sp, #0x18]
        mov     r2, r2, asr #16
        str     r2, [sp, #4]
        add     r1, r9, r9, lsl #2
        mov     r2, #0x50
        str     r2, [sp]
        add     r1, r7, r1, lsl #5
        str     r5, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r6, [sp, #0xC]
        mov     r0, r4
        mov     r3, #0x8F
        mov     r2, #0x14
        bl      LDRF_ownPitchOL
        mov     r9, r9, lsl #1
        add     r10, r10, #1
        strh    r0, [r8, +r9]
        mov     r1, r10, lsl #16
        mov     r9, r1, asr #16
        cmp     r9, #2
        blt     LDRF2
        ldr     r5, [sp, #0x48]
        b       LDRF8
LDRF10:
        ldr     r5, [sp, #0x48]
        b       LDRF8
LDRF11:
        ldr     r5, [sp, #0x48]
        b       LDRF6
LDRF12:
        ldr     r5, [sp, #0x48]
        b       LDRF6
LDRF13:
        str     r5, [sp, #0x48]
        ldr     r5, [sp, #0x50]
        mov     r9, #0
        mov     r10, r9
        b       LDRF5
LDRF14:
        mvn     r0, #7
        add     sp, sp, #0xB5, 30
        ldmia   sp!, {r4 - r11, pc}
LDRF_ownPitchOL:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xFC
        sub     sp, sp, #1, 22
        ldr     r10, [sp, #0x524]
        add     r12, sp, #0xA6, 30
        add     r4, sp, #0x28
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x52C]
        and     r9, r12, #0xF
        and     r5, r4, #0xF
        ldr     r4, [sp, #0x520]
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0x530]
        rsb     r9, r9, #0
        rsb     r5, r5, #0
        add     r12, sp, #0x28
        mov     r7, r0
        add     lr, sp, #0xA6, 30
        str     r10, [sp, #0x24]
        and     r9, r9, #0xF
        and     r5, r5, #0xF
        cmp     r7, #0
        add     r10, lr, r9
        add     r12, r12, r5
        mov     r8, r2
        mov     r6, r3
        beq     LDRF15
        cmp     r7, #1
        beq     LDRF15
        ldr     lr, [sp, #0x18]
        ldrsh   lr, [lr]
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #17
        b       LDRF16
LDRF15:
        ldr     lr, [sp, #0x18]
        ldrsh   lr, [lr]
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #18
        orr     lr, lr, #2, 20
LDRF16:
        ldr     r5, [sp, #0x18]
        sub     r9, r1, r6, lsl #1
        add     r3, sp, #1, 22
        strh    lr, [r5]
        add     r5, r12, r6, lsl #1
        mov     r12, #0
        str     r12, [sp, #0x4EC]
        str     r12, [sp]
        add     r3, r3, #0xEC
        add     r11, r6, r4
        mov     r2, r11
        mov     r1, r9
        mov     r0, r9
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x4EC]
        cmn     r12, #7, 2
        bge     LDRF36
        cmp     r12, #2, 14
        sub     r1, r5, r6, lsl #1
        bge     LDRF17
        mov     r3, r11
        mov     r2, r1
        mov     r0, r9
        mov     r1, #3
        bl      _ippsLShiftC_16s
        mvn     r9, #2
        b       LDRF18
LDRF17:
        mov     r2, r11
        mov     r0, r9
        bl      _ippsCopy_16s
        mov     r9, #0
LDRF18:
        add     r10, r10, r6, lsl #2
        sub     r12, r6, r8
        str     r10, [sp, #0x10]
        add     r12, r12, #1
        sub     r3, r10, r6, lsl #2
        sub     r1, r5, r6, lsl #1
        str     r12, [sp]
        mov     r2, r4
        mov     r0, r5
        bl      _ippsCrossCorr_Fwd_Low_16s32s
        cmp     r7, #0xC
        moveq   r10, #1
        movne   r10, #0
        mov     r12, r8, lsl #2
        add     lr, r6, #1
        mov     r12, r12, lsl #16
        mov     r7, r6
        mov     r12, r12, asr #16
        cmp     r12, lr
        str     r12, [sp, #0xC]
        movge   r11, #2, 2
        bge     LDRF20
        mov     r1, r12
        ldr     r0, [sp, #0x10]
        mov     r11, #2, 2
LDRF19:
        mov     r1, r1, lsl #2
        rsb     r1, r1, #0
        ldr     r1, [r0, +r1]
        cmp     r1, r11
        movgt   r11, r1
        movgt   r7, r12
        add     r12, r12, #1
        mov     r1, r12, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, lr
        blt     LDRF19
LDRF20:
        mov     r12, r7, lsl #16
        add     r3, sp, #1, 22
        mov     r12, r12, asr #16
        sub     r0, r5, r12, lsl #1
        add     r3, r3, #0xF8
        mov     r2, #0
        mov     r1, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x4F8]
        add     lr, r12, #1, 18
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, #0
        ble     LDRF21
        mov     r0, #0x32
        orr     r0, r0, #0x53, 24
        mov     lr, lr, lsl #1
        mul     r0, lr, r0
        cmp     r11, r0
        ble     LDRF21
        ldr     lr, [sp, #0x18]
        ldrsh   r0, [lr]
        orr     r0, r0, #1, 18
        strh    r0, [lr]
LDRF21:
        add     r0, sp, #1, 22
        mov     r12, r12, lsl #1
        add     r0, r0, #0xF8
        str     r12, [sp, #0x4F8]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r10, #0
        ldreq   r12, [sp, #0x4F8]
        ldrne   r12, [sp, #0x4F8]
        movne   r12, r12, lsl #1
        mov     lr, #0xFF
        mov     r0, r11, asr #16
        orr     lr, lr, #0x7F, 24
        mov     r1, r0, lsl #16
        and     r0, lr, r12, asr #1
        mov     r12, r12, asr #16
        mov     r1, r1, asr #16
        mul     r0, r0, r1
        and     r11, lr, r11, asr #1
        mov     r12, r12, lsl #16
        cmp     r10, #0
        mov     r0, r0, asr #15
        mov     lr, r12, asr #16
        mul     r12, lr, r11
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        mla     r11, r1, lr, r11
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        add     r12, r11, r12, asr #16
        mov     r12, r12, lsl #1
        beq     LDRF22
        cmp     r9, #0
        rsblt   lr, r9, #0
        movlt   r12, r12, lsl lr
        movge   r12, r12, asr r9
        mov     r11, r12, asr #1
        str     r12, [sp, #0x4F8]
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        str     r11, [sp, #0x1C]
        b       LDRF23
LDRF22:
        mov     lr, r12, lsl #16
        str     r12, [sp, #0x4F8]
        mov     lr, lr, asr #16
        str     lr, [sp, #0x1C]
LDRF23:
        ldr     r12, [sp, #0xC]
        sub     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        mov     r12, r8, lsl #1
        str     lr, [sp, #0x14]
        mov     r12, r12, lsl #16
        add     lr, lr, #1
        mov     r12, r12, asr #16
        cmp     r12, lr
        str     r12, [sp, #8]
        movge   r11, #2, 2
        bge     LDRF25
        mov     r2, r12
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r11, #2, 2
LDRF24:
        mov     r2, r2, lsl #2
        rsb     r2, r2, #0
        ldr     r2, [r1, +r2]
        cmp     r2, r11
        movgt   r11, r2
        movgt   r0, r12
        add     r12, r12, #1
        mov     r2, r12, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, lr
        blt     LDRF24
        str     r0, [sp, #0x14]
LDRF25:
        ldr     r12, [sp, #0x14]
        add     r3, sp, #1, 22
        add     r3, r3, #0xF4
        mov     r12, r12, lsl #16
        mov     r2, #0
        mov     r12, r12, asr #16
        sub     r0, r5, r12, lsl #1
        mov     r1, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x4F4]
        add     lr, r12, #1, 18
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, #0
        ble     LDRF26
        mov     r0, #0x32
        orr     r0, r0, #0x53, 24
        mov     lr, lr, lsl #1
        mul     r0, lr, r0
        cmp     r11, r0
        ble     LDRF26
        ldr     lr, [sp, #0x18]
        ldrsh   r0, [lr]
        orr     r0, r0, #1, 18
        strh    r0, [lr]
LDRF26:
        add     r0, sp, #1, 22
        mov     r12, r12, lsl #1
        add     r0, r0, #0xF4
        str     r12, [sp, #0x4F4]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r10, #0
        ldreq   r12, [sp, #0x4F4]
        ldrne   r12, [sp, #0x4F4]
        movne   r12, r12, lsl #1
        mov     lr, #0xFF
        mov     r0, r11, asr #16
        orr     lr, lr, #0x7F, 24
        mov     r1, r0, lsl #16
        and     r0, lr, r12, asr #1
        mov     r12, r12, asr #16
        mov     r1, r1, asr #16
        mul     r0, r0, r1
        and     r11, lr, r11, asr #1
        mov     r12, r12, lsl #16
        cmp     r10, #0
        mov     r0, r0, asr #15
        mov     lr, r12, asr #16
        mul     r12, lr, r11
        mov     r0, r0, lsl #16
        mov     r11, r0, asr #16
        mla     r11, r1, lr, r11
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        add     r12, r11, r12, asr #16
        mov     r12, r12, lsl #1
        beq     LDRF27
        cmp     r9, #0
        rsblt   lr, r9, #0
        movlt   r12, r12, lsl lr
        movge   r12, r12, asr r9
        mov     r11, r12, asr #1
        str     r12, [sp, #0x4F4]
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        str     r11, [sp, #0xC]
        b       LDRF28
LDRF27:
        mov     lr, r12, lsl #16
        str     r12, [sp, #0x4F4]
        mov     lr, lr, asr #16
        str     lr, [sp, #0xC]
LDRF28:
        ldr     r12, [sp, #8]
        mov     lr, r8
        sub     r12, r12, #1
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #8]
        add     r12, r12, #1
        cmp     r8, r12
        movge   r11, #2, 2
        bge     LDRF30
        mov     r2, r8
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x10]
        mov     r11, #2, 2
LDRF29:
        mov     r2, r2, lsl #2
        rsb     r2, r2, #0
        ldr     r2, [r1, +r2]
        cmp     r2, r11
        movgt   r11, r2
        movgt   r0, lr
        add     lr, lr, #1
        mov     r2, lr, lsl #16
        mov     r2, r2, asr #16
        cmp     r2, r12
        blt     LDRF29
        str     r0, [sp, #8]
LDRF30:
        ldr     r12, [sp, #8]
        add     r3, sp, #0x4F, 28
        mov     r2, #0
        mov     r12, r12, lsl #16
        mov     r1, r4
        mov     r12, r12, asr #16
        sub     r0, r5, r12, lsl #1
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x4F0]
        add     lr, r12, #1, 18
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, #0
        ble     LDRF31
        mov     r0, #0x32
        orr     r0, r0, #0x53, 24
        mov     lr, lr, lsl #1
        mul     r0, lr, r0
        cmp     r11, r0
        ble     LDRF31
        ldr     lr, [sp, #0x18]
        ldrsh   r0, [lr]
        orr     r0, r0, #1, 18
        strh    r0, [lr]
LDRF31:
        add     r0, sp, #0x4F, 28
        mov     r12, r12, lsl #1
        str     r12, [sp, #0x4F0]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        cmp     r10, #0
        ldreq   r12, [sp, #0x4F0]
        ldrne   r12, [sp, #0x4F0]
        movne   r12, r12, lsl #1
        mov     r0, r11, asr #16
        mov     lr, #0xFF
        mov     r1, r0, lsl #16
        orr     lr, lr, #0x7F, 24
        and     r0, lr, r12, asr #1
        mov     r1, r1, asr #16
        mul     r0, r0, r1
        mov     r12, r12, asr #16
        and     r11, lr, r11, asr #1
        mov     r12, r12, lsl #16
        mov     r0, r0, asr #15
        cmp     r10, #0
        mov     r12, r12, asr #16
        mul     r11, r12, r11
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
        mla     lr, r1, r12, lr
        mov     r11, r11, asr #15
        mov     r12, r11, lsl #16
        add     r12, lr, r12, asr #16
        mov     r12, r12, lsl #1
        moveq   lr, r12, lsl #16
        moveq   r9, lr, asr #16
        beq     LDRF32
        cmp     r9, #0
        rsblt   r9, r9, #0
        movlt   r12, r12, lsl r9
        movge   r12, r12, asr r9
        mov     lr, r12, asr #1
        mov     lr, lr, lsl #16
        mov     r9, lr, asr #16
LDRF32:
        ldr     lr, [sp, #0x20]
        cmp     lr, #1
        beq     LDRF35
LDRF33:
        ldr     r1, [sp, #0x1C]
        mov     r0, #0xCD
        orr     r0, r0, #0x1B, 22
        mul     r1, r1, r0
        ldr     r2, [sp, #0xC]
        mov     r1, r1, asr #15
        cmp     r1, r2
        bge     LDRF34
        ldr     r1, [sp, #0xC]
        ldr     r7, [sp, #0x14]
        mul     r0, r1, r0
        mov     r1, r0, asr #15
LDRF34:
        cmp     r1, r9
        ldrlt   r7, [sp, #8]
        mov     r7, r7, lsl #16
        add     sp, sp, #0xFC
        mov     r0, r7, asr #16
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDRF35:
        mov     r3, r6
        mov     r2, r4
        mov     r1, r5
        ldr     r0, [sp, #0x10]
        str     r12, [sp, #0x4F0]
        add     lr, sp, #1, 22
        add     lr, lr, #0xE8
        str     lr, [sp, #4]
        str     r8, [sp]
        bl      LDRF_ownHpMax
        add     r1, sp, #1, 22
        ldr     r0, [sp, #0x24]
        ldrsh   r1, [r1, #0xE8]
        strh    r1, [r0]
        b       LDRF33
LDRF36:
        mov     r3, r11
        mov     r0, r9
        sub     r2, r5, r6, lsl #1
        mov     r1, #3
        bl      _ippsRShiftC_16s
        mov     r9, #3
        b       LDRF18
LDRF_ownHpMax:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x34]
        ldr     r7, [sp, #0x38]
        add     r12, r12, #1
        cmp     r12, r3
        mov     r5, r1
        mov     r4, r2
        mov     r6, #2, 2
        bge     LDRF42
        sub     r11, r0, #4
        add     r10, r0, #4
        sub     lr, r0, r12, lsl #2
        mvn     r9, #2, 2
        mvn     r8, #0
        str     r4, [sp, #4]
        str     r5, [sp]
LDRF37:
        ldr     r0, [lr], #-4
        cmn     r0, #7, 2
        movgt   r0, r9
        bgt     LDRF38
        cmp     r0, #3, 2
        movge   r0, r0, lsl #1
        movlt   r0, #2, 2
LDRF38:
        rsb     r2, r12, #0
        ldr     r4, [r11, +r2, lsl #2]
        subs    r1, r0, r4
        mov     r4, r4, asr #31
        rsc     r0, r4, r0, asr #31
        subs    r4, r1, r9
        sbcs    r5, r0, #0
        movlt   r4, #0
        movlt   r5, #0
        orrs    r5, r4, r5
        mvnne   r1, #2, 2
        bne     LDRF39
        cmp     r1, #2, 2
        sbcs    r0, r0, r8
        movlt   r1, #2, 2
LDRF39:
        ldr     r2, [r10, +r2, lsl #2]
        subs    r0, r1, r2
        mov     r2, r2, asr #31
        rsc     r1, r2, r1, asr #31
        subs    r2, r0, r9
        sbcs    r4, r1, #0
        movlt   r2, #0
        movlt   r4, #0
        orrs    r4, r2, r4
        mvnne   r0, #2, 2
        bne     LDRF40
        cmp     r0, #2, 2
        sbcs    r1, r1, r8
        movlt   r0, #2, 2
LDRF40:
        cmp     r0, #0
        bge     LDRF41
        cmp     r0, #2, 2
        mvneq   r0, #2, 2
        rsbne   r0, r0, #0
LDRF41:
        cmp     r0, r6
        movgt   r6, r0
        add     r12, r12, #1
        cmp     r12, r3
        blt     LDRF37
        ldr     r4, [sp, #4]
        ldr     r5, [sp]
        str     r0, [sp, #0xC]
LDRF42:
        add     r3, sp, #0xC
        mov     r0, r5
        mov     r2, #0
        mov     r1, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r3, sp, #8
        sub     r1, r5, #2
        mov     r0, r5
        mov     r2, r4
        bl      _ippsDotProd_16s32s
        ldr     r0, [sp, #0xC]
        mvn     r5, #2, 2
        cmn     r0, #0x1E, 4
        movgt   r0, r5
        bgt     LDRF43
        cmp     r0, #0xE, 4
        movge   r0, r0, lsl #2
        movlt   r0, #2, 2
LDRF43:
        ldr     r1, [sp, #8]
        cmn     r1, #0x1E, 4
        movgt   r2, r5
        bgt     LDRF44
        cmp     r1, #0xE, 4
        movge   r2, r1, lsl #2
        movlt   r2, #2, 2
LDRF44:
        subs    r1, r0, r2
        mov     r2, r2, asr #31
        rsc     r0, r2, r0, asr #31
        subs    r3, r1, r5
        sbcs    r2, r0, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        movne   r1, r5
        bne     LDRF45
        cmp     r1, #2, 2
        mvn     r2, #0
        sbcs    r0, r0, r2
        movlt   r1, #2, 2
LDRF45:
        cmp     r1, #0
        bge     LDRF46
        cmp     r1, #2, 2
        moveq   r1, r5
        rsbne   r1, r1, #0
LDRF46:
        ldr     r2, [pc, #0x5A0]
        ldr     r3, [pc, #0x5A0]
        cmp     r6, #0
        mov     r0, #0
        moveq   r12, r0
        beq     LDRF49
        movs    r12, r6, asr #16
        bne     LDRF47
        bic     r12, r6, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        movne   lr, r3
        moveq   r12, r12, lsl #1
        moveq   lr, r2
        ldrsh   r12, [lr, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDRF48
LDRF47:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   lr, lr, lsl #1
        ldrnesh r12, [r3, +lr]
        moveq   r12, r12, lsl #1
        ldreqsh r12, [r2, +r12]
LDRF48:
        mov     r6, r6, lsl r12
LDRF49:
        cmp     r1, #0
        sub     r4, r12, #1
        moveq   r8, r0
        beq     LDRF52
        movs    r12, r1, asr #16
        bne     LDRF50
        bic     r12, r1, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        movne   r2, r3
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r2, +r12]
        add     r2, r12, #0x10
        mov     r2, r2, lsl #16
        mov     r8, r2, asr #16
        b       LDRF51
LDRF50:
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   lr, lr, lsl #1
        ldrnesh r8, [r3, +lr]
        moveq   r12, r12, lsl #1
        ldreqsh r8, [r2, +r12]
LDRF51:
        mov     r1, r1, lsl r8
LDRF52:
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        movs    r1, r1, asr #16
        beq     LDRF53
        mov     r0, r6, asr #2
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDRF53:
        sub     r4, r4, r8
        mov     r1, r4, lsl #16
        movs    r1, r1, asr #16
        movpl   r1, r0, asr r1
        strplh  r1, [r7]
        bmi     LDRF54
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDRF54:
        rsb     r2, r1, #0
        mvn     r1, #0xFF
        bic     r2, r2, #0xFF, 8
        bic     r1, r1, #0x7F, 24
        mvn     r3, r1
        bic     r2, r2, #0xFF, 16
        cmp     r0, r3, asr r2
        mov     r3, r5, lsl #15
        movgt   r5, r5, lsl #15
        mvngt   r1, r5
        bgt     LDRF55
        cmp     r0, r3, asr r2
        blt     LDRF55
        mov     r2, r0, lsl r2
        mov     r0, r2, lsl #16
        mov     r1, r0, asr #16
LDRF55:
        strh    r1, [r7]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDRF_ownPitchOLWgh:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x41, 30
        sub     sp, sp, #1, 22
        ldr     lr, [sp, #0x534]
        ldr     r6, [sp, #0x52C]
        ldr     r4, [sp, #0x530]
        str     lr, [sp, #0x1C]
        ldr     lr, [sp, #0x538]
        ldr     r10, [sp, #0x528]
        mov     r7, r0
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x53C]
        str     r1, [sp, #0x2C]
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x544]
        str     r2, [sp, #0x28]
        str     lr, [sp, #0x10]
        ldr     lr, [sp, #0x548]
        sub     r8, r3, r6, lsl #1
        mov     r5, #0
        str     lr, [sp, #0xC]
        add     r3, sp, #1, 22
        str     r5, [sp, #0x4F8]
        str     r5, [sp]
        add     r3, r3, #0xF8
        add     lr, sp, #0x34
        add     r9, r6, r4
        mov     r2, r9
        mov     r1, r8
        mov     r0, r8
        and     r5, lr, #0xF
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x4F8]
        add     lr, sp, #0xA9, 30
        and     r11, lr, #0xF
        rsb     r5, r5, #0
        and     lr, r5, #0xF
        rsb     r5, r11, #0
        add     r11, sp, #0x34
        add     r11, r11, lr
        and     lr, r5, #0xF
        add     r5, r11, r6, lsl #1
        add     r11, sp, #0xA9, 30
        cmn     r12, #7, 2
        add     r11, r11, lr
        sub     r1, r5, r6, lsl #1
        bge     LDRF67
        cmp     r12, #2, 14
        bge     LDRF56
        mov     r3, r9
        mov     r2, r1
        mov     r0, r8
        mov     r1, #3
        bl      _ippsLShiftC_16s
        b       LDRF57
LDRF56:
        mov     r2, r9
        mov     r0, r8
        bl      _ippsCopy_16s
LDRF57:
        add     r11, r11, r6, lsl #2
        sub     r12, r6, r10
        str     r11, [sp, #8]
        add     r12, r12, #1
        str     r12, [sp]
        sub     r3, r11, r6, lsl #2
        sub     r1, r5, r6, lsl #1
        mov     r2, r4
        mov     r0, r5
        bl      _ippsCrossCorr_Fwd_Low_16s32s
        ldr     r8, [sp, #0x28]
        ldrsh   lr, [r7]
        ldr     r12, [pc, #0x328]
        ldrsh   r8, [r8]
        mov     r9, r6
        rsb     r11, lr, r6
        mov     lr, #0xF6
        cmp     r8, #0
        ldr     r8, [sp, #0x14]
        add     r11, r12, r11, lsl #1
        add     r12, r12, #0x7D, 30
        add     lr, lr, r11
        mov     r8, r8, lsl #1
        mov     r0, r9
        ble     LDRF65
        cmp     r6, r10
        blt     LDRF59
        mov     r3, r6
        ldr     r1, [sp, #8]
        mov     r11, #2, 2
        str     r4, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r7, [sp, #0x30]
LDRF58:
        mov     r3, r3, lsl #2
        rsb     r2, r3, #0
        ldr     r3, [r1, +r2]
        ldrsh   r6, [r12], #-2
        mov     r2, #0xFF
        orr     r4, r2, #0x7F, 24
        and     r2, r4, r3, asr #1
        mul     r2, r2, r6
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r2, r2, asr #15
        mov     r3, r3, asr #16
        mla     r2, r3, r6, r2
        str     r2, [sp, #0x500]
        ldrsh   r3, [lr], #-2
        and     r4, r2, r4
        mul     r4, r4, r3
        mov     r2, r2, asr #15
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mov     r4, r4, asr #15
        mla     r2, r2, r3, r4
        cmp     r2, r11
        movge   r11, r2
        movge   r9, r0
        sub     r0, r0, #1
        mov     r3, r0, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, r10
        bge     LDRF58
        ldr     r4, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r7, [sp, #0x30]
        str     r2, [sp, #0x500]
LDRF59:
        mov     r12, r9, lsl #16
        add     r3, sp, #5, 24
        mov     r12, r12, asr #16
        sub     r11, r5, r12, lsl #1
        mov     r1, r11
        mov     r2, r4
        mov     r0, r5
        bl      _ippsDotProd_16s32s
        add     r3, sp, #1, 22
        add     r3, r3, #0xFC
        mov     r0, r11
        mov     r2, #0
        mov     r1, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x10]
        ldr     r11, [sp, #0x4FC]
        ldrsh   lr, [r12]
        ldr     r12, [sp, #0x500]
        mov     r11, r11, lsl #1
        mov     r0, lr, lsl #16
        add     r11, r11, #2, 18
        mov     lr, r12, lsl #1
        mov     r0, r0, asr #17
        mov     r12, r11, asr #16
        str     lr, [sp, #0x500]
        mov     r11, r0, lsl #16
        mov     r1, r12, lsl #16
        mov     r11, r11, asr #16
        mov     r0, r1, asr #16
        cmp     r0, #0
        ldrle   r0, [sp, #0x10]
        strleh  r11, [r0]
        ble     LDRF60
        mov     r1, #0x32
        orr     r1, r1, #0x53, 24
        mov     r0, r0, lsl #1
        mul     r1, r0, r1
        cmp     lr, r1
        ldrle   r0, [sp, #0x10]
        strleh  r11, [r0]
        ble     LDRF60
        ldr     r0, [sp, #0x10]
        orr     r11, r11, #1, 18
        strh    r11, [r0]
LDRF60:
        mov     r11, #0x66
        orr     r11, r11, #0x26, 24
        add     r1, r11, #1, 18
        mul     r1, r12, r1
        str     r12, [sp, #0x4FC]
        sub     lr, lr, r1
        add     r12, lr, #2, 18
        ldr     lr, [sp, #0x18]
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0
        strh    r12, [lr, +r8]
        ble     LDRF64
        ldr     r0, [sp, #0x1C]
        ldrsh   r1, [r0]
        ldrsh   r12, [r0, #6]
        ldrsh   r8, [r0, #2]
        ldrsh   lr, [r0, #4]
        strh    r1, [r0, #2]
        strh    r12, [r0, #8]
        strh    r8, [r0, #4]
        strh    lr, [r0, #6]
        strh    r9, [r0]
        mov     r1, #5
        bl      ownGmed_n
        mov     r12, #0xFF
        strh    r0, [r7]
        orr     lr, r12, #0x7F, 24
        ldr     r12, [sp, #0x2C]
        strh    lr, [r12]
LDRF61:
        cmp     r11, lr
        movle   r12, #1
        movgt   r12, #0
        ldr     lr, [sp, #0x28]
        strh    r12, [lr]
        ldr     r12, [sp, #0x14]
        cmp     r12, #1
        beq     LDRF63
LDRF62:
        mov     r9, r9, lsl #16
        add     sp, sp, #0x41, 30
        mov     r0, r9, asr #16
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDRF63:
        add     r12, sp, #1, 22
        add     r12, r12, #0xF4
        str     r12, [sp, #4]
        str     r10, [sp]
        ldr     r0, [sp, #8]
        mov     r3, r6
        mov     r2, r4
        mov     r1, r5
        bl      LDRF_ownHpMax
        add     r0, sp, #1, 22
        ldr     r1, [sp, #0xC]
        ldrsh   r0, [r0, #0xF4]
        strh    r0, [r1]
        b       LDRF62
LDRF64:
        strh    r9, [r7]
        ldr     r12, [sp, #0x2C]
        mov     r7, #0x33
        orr     r7, r7, #0x73, 24
        ldrsh   lr, [r12]
        mul     r7, lr, r7
        mov     lr, r7, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r12]
        b       LDRF61
LDRF65:
        cmp     r6, r10
        blt     LDRF59
        mov     lr, r6
        ldr     r1, [sp, #8]
        mov     r11, #2, 2
LDRF66:
        mov     lr, lr, lsl #2
        rsb     lr, lr, #0
        ldr     r3, [r1, +lr]
        ldrsh   r2, [r12], #-2
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        and     lr, lr, r3, asr #1
        mul     lr, lr, r2
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     lr, lr, asr #15
        mov     r3, r3, asr #16
        mla     r2, r3, r2, lr
        cmp     r2, r11
        movge   r11, r2
        movge   r9, r0
        sub     r0, r0, #1
        mov     lr, r0, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, r10
        bge     LDRF66
        str     r2, [sp, #0x500]
        b       LDRF59
LDRF67:
        mov     r3, r9
        mov     r2, r1
        mov     r0, r8
        mov     r1, #3
        bl      _ippsRShiftC_16s
        b       LDRF57
        .long   NormTable2
        .long   NormTable
        .long   LDRF_corrweight


        .data
        .align  4


LDRF_corrweight:
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


