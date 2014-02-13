        .text
        .align  4
        .globl  _ippsVAD_AMRWB_16s


_ippsVAD_AMRWB_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        add     lr, sp, #8
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        mov     r5, r0
        add     r12, sp, #8
        and     lr, lr, #0xF
        cmp     r5, #0
        add     r6, r12, lr
        mov     r4, r1
        mov     r9, r2
        mov     r8, r3
        beq     LDGR3
        cmp     r4, #0
        beq     LDGR3
        cmp     r9, #0
        beq     LDGR3
        cmp     r8, #0
        beq     LDGR3
        add     r3, sp, #0x30
        mvn     r10, #0
        str     r10, [sp]
        mov     r2, #1, 24
        mov     r1, r5
        mov     r0, r5
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r7, [r4, #0x90]
        ldr     r12, [sp, #0x30]
        mvn     r11, #2, 2
        mov     lr, r7, asr #31
        adds    r7, r12, r7
        adc     lr, lr, r12, asr #31
        subs    r0, r7, r11
        sbcs    r1, lr, #0
        movlt   r0, #0
        movlt   r1, #0
        orrs    r1, r0, r1
        movne   r7, r11
        bne     LDGR0
        cmp     r7, #2, 2
        sbcs    lr, lr, r10
        movlt   r7, #2, 2
LDGR0:
        str     r12, [r4, #0x90]
        mov     r12, #0x9E, 22
        orr     r12, r12, #2, 14
        cmp     r12, r7
        ble     LDGR1
        ldrsh   r12, [r9]
        add     lr, r10, #2, 20
        and     lr, r12, lr
        strh    lr, [r9]
LDGR1:
        mov     r1, r5
        mov     r0, r4
        mov     r2, r6
        bl      LDGR_ownFilterBank
        ldrsh   r1, [r9]
        mov     r3, r7
        mov     r0, r4
        mov     r2, r6
        bl      LDGR_ownVadDecision
        strh    r0, [r8]
        add     r2, sp, #0x30
        add     r0, r6, #2
        mov     r3, #0
        mov     r1, #0xB
        bl      _ippsSum_16s32s_Sfs
        ldr     r2, [sp, #0x30]
        add     r10, r10, #2, 14
        cmp     r10, r2
        blt     LDGR2
        cmn     r2, #2, 14
        movge   r11, r2, lsl #12
        movlt   r11, #2, 2
LDGR2:
        mov     r11, r11, asr #16
        mov     r0, r4
        mov     r11, r11, lsl #16
        mov     r1, r11, asr #16
        bl      LDGR_ownEstimateSpeech
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDGR3:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDGR_ownFilterBank:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x97, 30
        add     r12, sp, #0x4C
        and     r12, r12, #0xF
        rsb     r12, r12, #0
        add     r3, sp, #0x4C
        and     r12, r12, #0xF
        mov     r6, r0
        add     r4, r3, r12
        mov     r0, r1
        mov     r5, r2
        mov     r3, #1, 24
        mov     r2, r4
        mov     r1, #1
        bl      _ippsRShiftC_16s
        ldrsh   r12, [r6, #0x60]
        ldrsh   r3, [r6, #0x62]
        mov     lr, #0xF6
        mov     r1, #0xC3
        orr     r9, lr, #6, 22
        orr     lr, r1, #0x55, 24
        add     r7, r6, #0x94
        mov     r8, #0
        mov     r1, #0x80
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x28]
LDGR4:
        mov     r6, r3
        mul     r3, r6, r9
        mov     r5, r8, lsl #1
        ldrsh   r0, [r4, +r5]
        mov     r10, r12
        mul     r2, r10, lr
        add     r11, r5, #2
        ldrsh   r12, [r4, +r11]
        subs    r1, r1, #1
        add     r8, r8, #2
        sub     r3, r12, r3, asr #15
        sub     r0, r0, r2, asr #15
        mov     r3, r3, lsl #16
        mov     r12, r0, lsl #16
        mov     r3, r3, asr #16
        mul     r0, r3, r9
        mov     r12, r12, asr #16
        mul     r2, r12, lr
        add     r0, r6, r0, asr #15
        mov     r6, r0, lsl #16
        mov     r0, r6, asr #16
        add     r2, r10, r2, asr #15
        mov     r10, r2, lsl #16
        add     r6, r0, r10, asr #16
        rsb     r10, r0, r10, asr #16
        mov     r6, r6, asr #1
        strh    r6, [r4, +r5]
        mov     r10, r10, asr #1
        strh    r10, [r11, +r4]
        bne     LDGR4
        ldr     r6, [sp, #0x28]
        ldr     r5, [sp, #0x24]
        mov     r11, r4
        strh    r3, [r6, #0x62]
        strh    r12, [r6, #0x60]
        ldrsh   r8, [r6, #0x64]
        ldrsh   r1, [r6, #0x66]
        ldrsh   r3, [r6, #0x68]
        ldrsh   r12, [r6, #0x6A]
        mov     r10, #0x40
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x28]
LDGR5:
        ldrsh   r5, [r11, #4]
        ldrsh   r4, [r11]
        mov     r0, r1
        ldrsh   r1, [r11, #2]
        mul     r6, r0, r9
        str     r12, [sp, #0x18]
        mul     r12, r12, r9
        str     r3, [sp, #0x2C]
        mul     r3, r3, lr
        mov     r2, r8
        mul     r7, r2, lr
        ldrsh   r8, [r11, #6]
        sub     r5, r5, r6, asr #15
        subs    r10, r10, #1
        sub     r4, r4, r7, asr #15
        sub     r8, r8, r12, asr #15
        mov     r5, r5, lsl #16
        sub     r3, r1, r3, asr #15
        mov     r4, r4, lsl #16
        mov     r12, r8, lsl #16
        mov     r1, r5, asr #16
        mul     r6, r1, r9
        mov     r8, r4, asr #16
        mul     r5, r8, lr
        mov     r3, r3, lsl #16
        mov     r12, r12, asr #16
        mul     r7, r12, r9
        add     r6, r0, r6, asr #15
        ldr     r0, [sp, #0x18]
        add     r5, r2, r5, asr #15
        mov     r3, r3, asr #16
        mul     r4, r3, lr
        mov     r2, r6, lsl #16
        ldr     r6, [sp, #0x2C]
        add     r0, r0, r7, asr #15
        mov     r5, r5, lsl #16
        add     r4, r6, r4, asr #15
        mov     r2, r2, asr #16
        mov     r0, r0, lsl #16
        add     r6, r2, r5, asr #16
        mov     r4, r4, lsl #16
        mov     r0, r0, asr #16
        rsb     r5, r2, r5, asr #16
        add     r2, r0, r4, asr #16
        rsb     r4, r0, r4, asr #16
        mov     r6, r6, asr #1
        mov     r5, r5, asr #1
        mov     r2, r2, asr #1
        mov     r4, r4, asr #1
        strh    r6, [r11]
        strh    r5, [r11, #4]
        strh    r2, [r11, #2]
        strh    r4, [r11, #6]
        add     r11, r11, #8
        bne     LDGR5
        ldr     r6, [sp, #0x28]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        strh    r12, [r6, #0x6A]
        strh    r3, [r6, #0x68]
        strh    r1, [r6, #0x66]
        ldrsh   r9, [r6, #0x6E]
        ldrsh   lr, [r6, #0x6C]
        ldrsh   r12, [r6, #0x70]
        ldrsh   r3, [r6, #0x72]
        ldrsh   r1, [r6, #0x74]
        strh    r8, [r6, #0x64]
        mov     r8, #0x33
        orr     r8, r8, #0xD, 22
        mov     r11, r4
        mov     r10, #0x20
        str     r9, [sp, #0x18]
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x28]
LDGR6:
        ldrsh   r6, [r11]
        ldrsh   r0, [r11, #8]
        subs    r10, r10, #1
        str     r0, [sp, #0x2C]
        mov     r0, #0xF6
        orr     r2, r0, #6, 22
        ldrsh   r0, [r11, #6]
        ldrsh   r5, [r11, #0xC]
        ldrsh   r9, [r11, #4]
        ldrsh   r7, [r11, #0xE]
        str     r0, [sp, #0x30]
        ldrsh   r0, [r11, #6]
        str     r3, [sp, #0x3C]
        mul     r3, r3, r2
        str     lr, [sp, #0x40]
        str     r0, [sp, #0x34]
        mov     r0, #0xC3
        orr     r4, r0, #0x55, 24
        ldr     r0, [sp, #0x18]
        mul     lr, lr, r4
        str     r12, [sp, #0x44]
        mul     r12, r12, r4
        str     r0, [sp, #0x38]
        mul     r0, r0, r2
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0x2C]
        str     r1, [sp, #0x48]
        mul     r1, r1, r8
        sub     r5, r5, r3, asr #15
        ldr     r3, [sp, #0x18]
        sub     r0, r12, r0, asr #15
        sub     r6, r6, lr, asr #15
        sub     r9, r9, r3, asr #15
        mov     r0, r0, lsl #16
        mov     r5, r5, lsl #16
        sub     r7, r7, r1, asr #15
        mov     r6, r6, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x18]
        mul     r0, r0, r2
        mov     r9, r9, lsl #16
        mov     r3, r5, asr #16
        mul     r2, r3, r2
        mov     r1, r7, lsl #16
        mov     lr, r6, asr #16
        mul     r7, lr, r4
        mov     r12, r9, asr #16
        mul     r5, r12, r4
        ldr     r4, [sp, #0x38]
        ldr     r9, [sp, #0x34]
        mov     r1, r1, asr #16
        mul     r6, r1, r8
        add     r4, r4, r0, asr #15
        ldr     r0, [sp, #0x3C]
        mov     r4, r4, lsl #16
        add     r0, r0, r2, asr #15
        ldr     r2, [sp, #0x40]
        mov     r4, r4, asr #16
        mov     r0, r0, lsl #16
        add     r2, r2, r7, asr #15
        ldr     r7, [sp, #0x44]
        mov     r0, r0, asr #16
        mov     r2, r2, lsl #16
        add     r5, r7, r5, asr #15
        ldr     r7, [sp, #0x48]
        mov     r5, r5, lsl #16
        add     r6, r7, r6, asr #15
        add     r7, r4, r2, asr #16
        rsb     r2, r4, r2, asr #16
        add     r4, r0, r5, asr #16
        rsb     r5, r0, r5, asr #16
        ldr     r0, [sp, #0x30]
        mov     r6, r6, lsl #16
        mov     r7, r7, asr #1
        mov     r2, r2, asr #1
        sub     r0, r0, r6, asr #16
        add     r6, r9, r6, asr #16
        mov     r4, r4, asr #1
        mov     r5, r5, asr #1
        mov     r0, r0, asr #1
        mov     r6, r6, asr #1
        strh    r7, [r11]
        strh    r2, [r11, #8]
        strh    r4, [r11, #4]
        strh    r5, [r11, #0xC]
        strh    r0, [r11, #0xE]
        strh    r6, [r11, #6]
        add     r11, r11, #0x10
        bne     LDGR6
        ldr     r6, [sp, #0x28]
        ldr     r9, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        strh    r1, [r6, #0x74]
        strh    r3, [r6, #0x72]
        strh    r12, [r6, #0x70]
        ldrsh   r1, [r6, #0x76]
        ldrsh   r3, [r6, #0x78]
        ldrsh   r12, [r6, #0x7A]
        strh    r9, [r6, #0x6E]
        strh    lr, [r6, #0x6C]
        mov     r10, r4
        mov     r9, #0x10
        mov     lr, #0x10
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x28]
LDGR7:
        ldrsh   r0, [r10]
        ldrsh   r2, [r10, #0x10]
        subs    lr, lr, #1
        str     r0, [sp, #0x48]
        ldrsh   r0, [r10]
        mov     r5, r1
        mul     r1, r5, r8
        str     r0, [sp, #0x44]
        ldrsh   r0, [r10, #8]
        ldrsh   r4, [r10, #0x18]
        mov     r7, r3
        mul     r3, r7, r8
        mov     r6, r12
        mul     r12, r6, r8
        str     r0, [sp, #0x40]
        ldrsh   r9, [r10, #0x1C]
        ldrsh   r0, [r10, #8]
        sub     r1, r2, r1, asr #15
        ldrsh   r2, [r10, #0xC]
        sub     r4, r4, r3, asr #15
        sub     r9, r9, r12, asr #15
        mov     r1, r1, lsl #16
        mov     r3, r4, lsl #16
        mov     r12, r9, lsl #16
        mov     r1, r1, asr #16
        mul     r9, r1, r8
        mov     r3, r3, asr #16
        mul     r4, r3, r8
        mov     r12, r12, asr #16
        mul     r11, r12, r8
        add     r9, r5, r9, asr #15
        str     r4, [sp, #0x3C]
        ldr     r5, [sp, #0x3C]
        ldrsh   r4, [r10, #0xC]
        add     r7, r7, r5, asr #15
        add     r5, r6, r11, asr #15
        mov     r6, r9, lsl #16
        mov     r11, r7, lsl #16
        ldr     r7, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        mov     r5, r5, lsl #16
        add     r0, r0, r11, asr #16
        sub     r7, r7, r6, asr #16
        add     r9, r9, r6, asr #16
        ldr     r6, [sp, #0x40]
        sub     r2, r2, r5, asr #16
        add     r5, r4, r5, asr #16
        mov     r7, r7, asr #1
        sub     r6, r6, r11, asr #16
        mov     r9, r9, asr #1
        mov     r0, r0, asr #1
        mov     r6, r6, asr #1
        mov     r2, r2, asr #1
        mov     r5, r5, asr #1
        strh    r7, [r10, #0x10]
        strh    r9, [r10]
        strh    r6, [r10, #0x18]
        strh    r0, [r10, #8]
        strh    r2, [r10, #0x1C]
        strh    r5, [r10, #0xC]
        add     r10, r10, #0x20
        bne     LDGR7
        ldr     r6, [sp, #0x28]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x24]
        strh    r12, [r6, #0x7A]
        ldrsh   lr, [r6, #0x7C]
        ldrsh   r12, [r6, #0x7E]
        strh    r3, [r6, #0x78]
        strh    r1, [r6, #0x76]
        mov     r9, #0x10
        mov     r3, r4
        mov     r10, #8
        mov     r1, #8
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x28]
LDGR8:
        ldrsh   r0, [r3, #0x20]
        mov     r7, lr
        mul     r2, r7, r8
        ldrsh   r4, [r3]
        ldrsh   r5, [r3]
        ldrsh   r9, [r3, #0x30]
        mov     r6, r12
        mul     r11, r6, r8
        sub     r0, r0, r2, asr #15
        ldrsh   r2, [r3, #0x10]
        mov     r0, r0, lsl #16
        subs    r1, r1, #1
        sub     r9, r9, r11, asr #15
        mov     lr, r0, asr #16
        mul     r12, lr, r8
        ldrsh   r0, [r3, #0x10]
        mov     r9, r9, lsl #16
        add     r11, r7, r12, asr #15
        mov     r12, r9, asr #16
        mul     r7, r12, r8
        mov     r9, r11, lsl #16
        sub     r4, r4, r9, asr #16
        add     r9, r5, r9, asr #16
        mov     r4, r4, asr #1
        add     r7, r6, r7, asr #15
        strh    r4, [r3, #0x20]
        mov     r4, r9, asr #1
        mov     r7, r7, lsl #16
        sub     r0, r0, r7, asr #16
        add     r7, r2, r7, asr #16
        mov     r0, r0, asr #1
        mov     r7, r7, asr #1
        strh    r4, [r3]
        strh    r0, [r3, #0x30]
        strh    r7, [r3, #0x10]
        add     r3, r3, #0x40
        bne     LDGR8
        ldr     r7, [sp, #0x20]
        ldr     r6, [sp, #0x28]
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x24]
        mov     r1, #0xB
        strh    r12, [r6, #0x7E]
        strh    lr, [r6, #0x7C]
        str     r1, [sp, #0x10]
        add     r1, r6, #0xAA
        str     r1, [sp, #0xC]
        mov     r1, #0xE
        str     r1, [sp, #8]
        mov     r1, #1
        str     r1, [sp, #4]
        mov     r11, #4
        str     r11, [sp]
        add     r1, r6, #0x5E
        mov     r3, #0x40
        mov     r2, #0x10
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        mov     r9, #0x10
        strh    r0, [r5, #0x16]
        str     r10, [sp]
        mov     r1, #0xA
        str     r1, [sp, #0x10]
        add     r1, r6, #0xA8
        str     r1, [sp, #0xC]
        mov     r8, #0xF
        str     r8, [sp, #8]
        mov     r1, #7
        str     r1, [sp, #4]
        add     r1, r6, #0x5C
        mov     r3, #0x20
        mov     r2, #8
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #0x14]
        str     r8, [sp, #8]
        str     r10, [sp]
        mov     r1, #9
        str     r1, [sp, #0x10]
        add     r1, r6, #0xA6
        str     r1, [sp, #0xC]
        mov     r1, #3
        str     r1, [sp, #4]
        add     r1, r6, #0x5A
        mov     r3, #0x20
        mov     r2, #8
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #0x12]
        add     r1, r6, #0xA4
        str     r1, [sp, #0xC]
        str     r8, [sp, #8]
        str     r10, [sp]
        str     r10, [sp, #0x10]
        mov     r1, #2
        str     r1, [sp, #4]
        add     r1, r6, #0x58
        mov     r3, #0x20
        mov     r2, #8
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #0x10]
        str     r9, [sp, #8]
        str     r9, [sp]
        mov     r1, #7
        str     r1, [sp, #0x10]
        mov     r1, #0xE
        str     r1, [sp, #4]
        add     r1, r6, #0xA2
        str     r1, [sp, #0xC]
        add     r1, r6, #0x56
        mov     r3, #0x10
        mov     r2, #4
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #0xE]
        mov     r3, #6
        str     r3, [sp, #0x10]
        str     r3, [sp, #4]
        add     r3, r6, #0xA0
        str     r3, [sp, #0xC]
        str     r9, [sp, #8]
        str     r9, [sp]
        add     r1, r6, #0x54
        mov     r3, #0x10
        mov     r2, #4
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #0xC]
        mov     r1, #5
        str     r1, [sp, #0x10]
        str     r9, [sp, #8]
        str     r11, [sp, #4]
        str     r9, [sp]
        add     r1, r6, #0x9E
        str     r1, [sp, #0xC]
        add     r1, r6, #0x52
        mov     r3, #0x10
        mov     r2, #4
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #0xA]
        str     r11, [sp, #0x10]
        str     r9, [sp, #8]
        str     r9, [sp]
        add     r1, r6, #0x50
        add     r3, r6, #0x9C
        str     r3, [sp, #0xC]
        mov     r3, #0xC
        str     r3, [sp, #4]
        mov     r3, #0x10
        mov     r2, #4
        mov     r0, r4
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #8]
        mov     r1, #3
        str     r1, [sp, #0x10]
        add     r1, r6, #0x9A
        str     r1, [sp, #0xC]
        str     r10, [sp, #4]
        add     r1, r6, #0x4E
        mov     r8, #0x11
        mov     r10, #0x20
        str     r8, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #8
        mov     r2, #2
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #6]
        mov     r1, #2
        str     r1, [sp, #0x10]
        add     r1, r6, #0x98
        str     r1, [sp, #0xC]
        mov     r1, #0x18
        str     r1, [sp, #4]
        add     r1, r6, #0x4C
        str     r8, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #8
        mov     r2, #2
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #4]
        mov     r1, #1
        str     r1, [sp, #0x10]
        add     r1, r6, #0x96
        str     r1, [sp, #0xC]
        add     r1, r6, #0x4A
        str     r9, [sp, #4]
        str     r8, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #8
        mov     r2, #2
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5, #2]
        mov     r1, #0
        str     r1, [sp, #0x10]
        str     r1, [sp, #4]
        add     r1, r6, #0x48
        str     r7, [sp, #0xC]
        str     r8, [sp, #8]
        str     r10, [sp]
        mov     r0, r4
        mov     r3, #8
        mov     r2, #2
        bl      ownSignalLevel_GSMAMR_16s
        strh    r0, [r5]
        add     sp, sp, #0x97, 30
        ldmia   sp!, {r4 - r11, pc}
LDGR_ownVadDecision:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [pc, #0x7B8]
        mvn     lr, #0xFF
        mov     r4, r0
        mov     r5, r2
        bic     lr, lr, #0x7F, 24
        mov     r6, r3
        mov     r7, r1
        mvn     r0, lr
        mov     r8, #0
        mvn     r2, #0
        mvn     r1, #2, 2
        sub     lr, r8, #2, 18
        mov     r9, r4
        mov     r11, r5
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r4, [sp, #0x30]
        mov     r3, #2, 2
        mov     r10, #0xC
        str     lr, [sp, #0x20]
        str     r7, [sp, #0x2C]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
LDGR9:
        ldrsh   r3, [r9], #2
        mov     r0, r3
        cmn     r0, #1
        moveq   r7, #0xF
        beq     LDGR12
        cmp     r0, #0
        moveq   r7, #0
        beq     LDGR12
        cmp     r0, #0
        blt     LDGR29
LDGR10:
        bic     r3, r3, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        movs    r12, r3, asr #8
        bne     LDGR11
        ldr     r12, [pc, #0x720]
        mov     r3, r3, lsl #1
        ldrsh   r7, [r12, +r3]
        b       LDGR12
LDGR11:
        mov     r3, r12, lsl #1
        ldr     r12, [pc, #0x710]
        ldrsh   r7, [r12, +r3]
LDGR12:
        bic     r3, r7, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        cmp     r0, r5, asr r3
        mvngt   r3, #2, 2
        bgt     LDGR13
        mov     r12, #2, 2
        cmp     r0, r12, asr r3
        movge   r3, r0, lsl r3
        movlt   r3, #2, 2
LDGR13:
        mov     r3, r3, lsl #16
        mov     r1, r3, asr #16
        cmp     r1, #0
        ble     LDGR30
        ldrsh   r3, [r11]
        mvn     r12, #0xFF, 14
        bic     r12, r12, #0x7F, 6
        and     r12, r3, r12
        mov     r0, r12, lsl #14
        bl      __intel_idiv
LDGR14:
        sub     r12, r7, #6
        mov     r0, r0, lsl #16
        cmp     r12, #0
        mov     r3, r0, asr #16
        ble     LDGR16
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        cmp     r3, r4, asr r12
        bgt     LDGR15
        ldr     lr, [sp, #0x20]
        cmp     r3, lr, asr r12
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        blt     LDGR17
        mov     r12, r3, lsl r12
        mov     r3, r12, lsl #16
        mov     r3, r3, asr #16
        b       LDGR17
LDGR15:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        b       LDGR17
LDGR16:
        rsb     r7, r7, #6
        mov     r7, r3, asr r7
        mov     r3, r7, lsl #16
        mov     r3, r3, asr #16
LDGR17:
        mov     r12, r3, lsl #1
        mul     r3, r12, r3
        mov     r12, r8, asr #31
        adds    r8, r8, r3
        adc     r3, r12, r3, asr #31
        subs    lr, r8, r5
        sbcs    r12, r3, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        mvnne   r8, #2, 2
        bne     LDGR18
        cmp     r8, #2, 2
        sbcs    r3, r3, r6
        movlt   r8, #2, 2
LDGR18:
        subs    r10, r10, #1
        add     r11, r11, #2
        bne     LDGR9
        ldr     r4, [sp, #0x30]
        ldr     r6, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        add     r2, sp, #0x34
        add     r0, r4, #2
        mov     r3, #0
        mov     r1, #0xB
        bl      _ippsSum_16s32s_Sfs
        ldr     r12, [sp, #0x34]
        ldrsh   r9, [r4, #0x8E]
        mov     r12, r12, asr #4
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mov     lr, r12, lsl #12
        mov     lr, lr, asr #15
        mov     lr, lr, lsl #3
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     r9, lr
        mov     r10, lr
        movgt   r10, r9
        cmp     r12, #0
        strh    r10, [r4, #0x8E]
        movle   r12, #1
        ldr     r9, [pc, #0x5A4]
        ldr     r0, [pc, #0x5A4]
        bic     r11, r12, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        movs    r1, r11, asr #8
        movne   r11, r1, lsl #1
        movne   r1, r0
        moveq   r11, r11, lsl #1
        moveq   r1, r9
        ldrsh   r11, [r1, +r11]
        mov     r12, r12, lsl r11
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        muls    r12, r12, r12
        mov     r2, r12
        moveq   r0, #0
        beq     LDGR21
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   r0, #0x1F
        beq     LDGR21
        cmp     r12, #0
        mvnlt   r2, r12
        cmp     r2, #0
        moveq   r0, #0
        beq     LDGR20
        movs    r1, r2, lsr #16
        bne     LDGR19
        bic     r2, r2, #0xFF, 8
        bic     r1, r2, #0xFF, 16
        movs    r2, r1, asr #8
        movne   r1, r2, lsl #1
        moveq   r1, r1, lsl #1
        moveq   r0, r9
        ldrsh   r1, [r0, +r1]
        add     r0, r1, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDGR20
LDGR19:
        movs    r0, r2, lsr #24
        moveq   r1, r1, lsl #1
        ldreqsh r0, [r9, +r1]
        beq     LDGR20
        ldr     r1, [pc, #0x4CC]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r1, +r0]
LDGR20:
        mov     r12, r12, lsl r0
LDGR21:
        sub     r0, r0, #1
        add     r11, r11, #0x10
        mov     r1, r0, lsl #6
        mov     r0, r11, lsl #10
        mov     r1, r1, lsl #16
        mov     r11, r12, asr #24
        mov     r1, r1, asr #16
        mov     r0, r0, lsl #16
        mvn     r12, #0xFF
        add     r1, r1, r0, asr #16
        bic     r12, r12, #0x7F, 24
        mvn     r0, r12
        cmp     r0, r1
        mov     r0, #0
        mvnlt   r1, r12
        blt     LDGR22
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        sublt   r1, r0, #2, 18
LDGR22:
        add     r1, r1, #0x7F
        mvn     r2, r12
        cmp     r2, r1
        mvnlt   r0, r12
        blt     LDGR23
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r0, r1, asr #16
        sublt   r0, r0, #2, 18
LDGR23:
        sub     r10, r10, lr
        sub     lr, r0, r11
        mov     r10, r10, lsl #16
        mov     r0, r10, asr #16
        cmp     r0, #0
        movle   r0, #1
        ldr     r11, [pc, #0x430]
        bic     r10, r0, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        movs    r1, r10, asr #8
        movne   r10, r1, lsl #1
        movne   r1, r11
        moveq   r10, r10, lsl #1
        moveq   r1, r9
        ldrsh   r10, [r1, +r10]
        mov     r0, r0, lsl r10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r0, r0, r0
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r0, r0, r0
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r0, r0, r0
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        muls    r0, r0, r0
        mov     r2, r0
        moveq   r9, #0
        beq     LDGR26
        cmn     r0, #1
        moveq   r0, #2, 2
        moveq   r9, #0x1F
        beq     LDGR26
        cmp     r0, #0
        mvnlt   r2, r0
        cmp     r2, #0
        moveq   r9, #0
        beq     LDGR25
        movs    r1, r2, lsr #16
        bne     LDGR24
        bic     r2, r2, #0xFF, 8
        bic     r1, r2, #0xFF, 16
        movs    r2, r1, asr #8
        movne   r1, r2, lsl #1
        movne   r9, r11
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r9, +r1]
        add     r9, r1, #0x10
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        b       LDGR25
LDGR24:
        movs    r11, r2, lsr #24
        moveq   r1, r1, lsl #1
        ldreqsh r9, [r9, +r1]
        beq     LDGR25
        ldr     r9, [pc, #0x358]
        mov     r11, r11, lsl #1
        ldrsh   r9, [r9, +r11]
LDGR25:
        mov     r0, r0, lsl r9
LDGR26:
        sub     r9, r9, #1
        add     r10, r10, #0x10
        mov     r9, r9, lsl #6
        mov     r10, r10, lsl #10
        mov     r9, r9, lsl #16
        mov     r10, r10, lsl #16
        mov     r9, r9, asr #16
        add     r9, r9, r10, asr #16
        mvn     r10, r12
        cmp     r10, r9
        mov     r0, r0, asr #24
        mov     r11, #0
        mvnlt   r9, r12
        blt     LDGR27
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        sublt   r9, r11, #2, 18
LDGR27:
        add     r9, r9, #0x7F
        mvn     r10, r12
        cmp     r10, r9
        mvnlt   r12, r12
        blt     LDGR28
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r12, r9, asr #16
LDGR28:
        mov     r9, #0xFF
        sub     r12, r12, r0
        orr     r9, r9, #0x57, 24
        sub     r12, r12, r9
        mvn     r9, #0x55
        mov     r12, r12, lsl #16
        bic     r9, r9, #1, 22
        sub     r10, r9, #0xE5
        mov     r12, r12, asr #16
        mul     r10, r12, r10
        sub     r12, lr, #0x1F, 22
        ldrsh   lr, [r4, #0x86]
        mov     r12, r12, lsl #16
        mov     r10, r10, asr #15
        sub     r10, r10, #0x60
        mov     r0, lr, lsl #16
        mov     r10, r10, lsl #16
        mvn     lr, #0x5F
        mov     r10, r10, asr #16
        cmp     r10, lr
        mov     r0, r0, asr #17
        movgt   lr, r10
        mov     r12, r12, asr #16
        mov     r10, r0, lsl #16
        rsb     r0, r12, r12, lsl #6
        cmp     lr, #0x60
        rsb     r0, r12, r0, lsl #3
        mov     r12, r10, asr #16
        mov     r10, #0x60
        movlt   r10, lr
        rsb     r0, r0, r0, lsl #2
        mov     lr, r0, asr #15
        add     lr, lr, #3, 24
        add     r10, lr, r10
        mov     lr, r10, lsl #16
        mov     r10, #0xCC
        mov     lr, lr, asr #16
        cmp     lr, #0xCC
        movgt   r10, lr
        mov     lr, r10, lsl #12
        sub     lr, lr, r10, lsl #10
        cmp     r8, lr, lsl #2
        strleh  r12, [r4, #0x86]
        orrgt   r12, r12, #1, 18
        strgth  r12, [r4, #0x86]
        mov     lr, #0x53, 28
        orr     lr, lr, #7, 20
        cmp     lr, r6
        movle   r6, #0
        movgt   r6, #1
        str     r12, [sp, #8]
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        sub     r12, r12, #0xA, 22
        sub     r12, r12, #9, 24
        sub     r12, r12, #0xDF
        str     r12, [sp, #0x18]
        mov     r12, #0xC
        str     r12, [sp, #0x1C]
        add     r12, r4, #0x84
        str     r12, [sp]
        add     r2, r4, #0x30
        add     r1, r4, #0x18
        str     r7, [sp, #4]
        str     r11, [sp, #0x14]
        str     r11, [sp, #0x10]
        str     r11, [sp, #0xC]
        mov     r0, r5
        mov     r3, r4
        bl      ownNoiseEstimateUpdate
        sub     r2, r10, #0xD9
        sub     r10, r10, #3, 24
        mov     r12, r2, lsl #16
        mov     r2, r10, lsl #16
        mov     r12, r12, asr #16
        mul     r9, r12, r9
        mov     r2, r2, asr #16
        mov     r1, r6
        add     r12, r2, r2, lsl #3
        mov     r9, r9, asr #15
        add     r2, r9, #0xC
        add     r12, r12, r12, lsl #5
        mov     r0, r4
        mov     r2, r2, lsl #16
        mov     r12, r12, asr #15
        add     r12, r12, #8
        mov     lr, r2, asr #16
        mov     r2, #2
        cmp     lr, #2
        mov     r12, r12, lsl #16
        movgt   r2, lr
        mov     r3, r12, asr #16
        bl      LDGR_ownHangoverAddition
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDGR29:
        mvn     r3, r0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDGR10
LDGR30:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r0, r3
        b       LDGR14
LDGR_ownHangoverAddition:
        cmp     r1, #0
        mov     r12, #0
        bne     LDGR32
        ldrsh   r1, [r0, #0x86]
        tst     r1, #1, 18
        beq     LDGR31
        ldrsh   r1, [r0, #0x80]
        add     r1, r1, #1
        strh    r1, [r0, #0x80]
        mov     r1, r1, lsl #16
        cmp     r3, r1, asr #16
        strleh  r2, [r0, #0x82]
        mov     r0, #1
        bx      lr
LDGR31:
        ldrsh   r1, [r0, #0x82]
        strh    r12, [r0, #0x80]
        cmp     r1, #0
        movle   r0, #0
        bxle    lr
        sub     r1, r1, #1
        strh    r1, [r0, #0x82]
        mov     r0, #1
        bx      lr
LDGR32:
        strh    r12, [r0, #0x80]
        strh    r12, [r0, #0x82]
        mov     r0, #0
        bx      lr
LDGR_ownEstimateSpeech:
        stmdb   sp!, {lr}
        ldrsh   r12, [r0, #0x88]
        ldrsh   r3, [r0, #0x8C]
        mov     r2, #0
        sub     lr, r12, r3
        cmp     lr, #0x37
        ble     LDGR33
        mov     r3, #0
        strh    r3, [r0, #0x8A]
        strh    r3, [r0, #0x8C]
        mov     r12, r3
LDGR33:
        add     lr, r12, #1
        ldrsh   r12, [r0, #0x86]
        mov     lr, lr, lsl #16
        tst     r12, #1, 18
        mov     r12, lr, asr #16
        bne     LDGR34
        ldrsh   lr, [r0, #0x8E]
        cmp     r1, lr
        strleh  r12, [r0, #0x88]
        ldrle   pc, [sp], #4
LDGR34:
        cmp     r1, #0x81
        strleh  r12, [r0, #0x88]
        ldrle   pc, [sp], #4
        ldrsh   lr, [r0, #0x8A]
        add     r3, r3, #1
        cmp     lr, r1
        movgt   r1, lr
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        cmp     r3, #0x19
        bge     LDGR35
        strh    r3, [r0, #0x8C]
        strh    r1, [r0, #0x8A]
        strh    r12, [r0, #0x88]
        ldr     pc, [sp], #4
LDGR35:
        mov     r3, #0x9A
        mov     r1, r1, lsl #16
        orr     r12, r3, #1, 24
        mov     r1, r1, asr #17
        mov     r3, r1, lsl #16
        cmp     r12, r3, asr #16
        bge     LDGR36
        ldrsh   r1, [r0, #0x8E]
        mov     r12, #0x33
        orr     r12, r12, #0x13, 24
        rsb     r3, r1, r3, asr #16
        mul     r12, r3, r12
        add     r3, r12, #1, 18
        add     r3, r1, r3, asr #15
        strh    r3, [r0, #0x8E]
LDGR36:
        strh    r2, [r0, #0x8A]
        strh    r2, [r0, #0x8C]
        strh    r2, [r0, #0x88]
        ldr     pc, [sp], #4
        .long   NormTable2
        .long   NormTable


