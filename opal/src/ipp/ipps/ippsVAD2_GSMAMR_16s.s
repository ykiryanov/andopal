        .text
        .align  4
        .globl  _ippsVAD2_GSMAMR_16s


_ippsVAD2_GSMAMR_16s:
        stmdb   sp!, {r1, r4 - r8, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r6, r1
        mov     r4, r2
        mov     r7, r3
        beq     LDOM2
        cmp     r6, #0
        beq     LDOM2
        cmp     r4, #0
        beq     LDOM2
        mov     r2, sp
        mov     r3, r7
        mov     r1, r6
        mov     r0, r8
        bl      LDOM_ownVAD2_GSMAMR_16s
        mov     r5, sp
        add     r0, r8, #0xA0
        add     r2, r5, #2
        mov     r3, r7
        mov     r1, r6
        bl      LDOM_ownVAD2_GSMAMR_16s
        mov     r0, sp
        ldrsh   r0, [r0]
        cmp     r0, #1
        beq     LDOM1
        ldrsh   r5, [r5, #2]
        cmp     r5, #1
        movne   r0, #0
        beq     LDOM1
LDOM0:
        strh    r0, [r4]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r8, pc}
LDOM1:
        mov     r0, #1
        b       LDOM0
LDOM2:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r8, pc}
LDOM_ownVAD2_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xAC
        sub     sp, sp, #1, 22
        add     r7, sp, #0x35, 28
        and     r7, r7, #0x1F
        add     r8, sp, #0x45, 28
        rsb     r7, r7, #0
        and     r8, r8, #0x1F
        add     r6, sp, #0x35, 28
        and     r7, r7, #0x1F
        add     r9, sp, #0x41, 28
        rsb     r8, r8, #0
        add     r6, r6, r7
        and     r9, r9, #0x1F
        add     r5, sp, #0x23, 28
        add     r7, sp, #0x45, 28
        and     r8, r8, #0x1F
        rsb     r9, r9, #0
        and     r5, r5, #0x1F
        add     r8, r7, r8
        add     r7, sp, #0x41, 28
        and     r9, r9, #0x1F
        rsb     r5, r5, #0
        add     r9, r7, r9
        mov     r4, r1
        ldr     lr, [r4, #0xB8]
        add     r7, sp, #0x23, 28
        and     r5, r5, #0x1F
        add     r5, r7, r5
        add     r7, sp, #0x10
        and     r7, r7, #0x1F
        add     lr, lr, #1
        str     lr, [r4, #0xB8]
        rsb     r7, r7, #0
        add     lr, sp, #0x10
        and     r7, r7, #0x1F
        mov     r10, r3
        add     r3, sp, #1, 22
        add     r7, lr, r7
        mov     lr, #2
        str     lr, [sp, #0x494]
        add     r3, r3, #0x94
        mov     r11, r2
        mov     r1, r6
        mov     r2, #0x50
        bl      _ippsAutoScale_16s
        mov     r1, #0x80
        mov     r0, r5
        bl      _ippsZero_16s
        ldrsh   r12, [r4, #0xA8]
        ldr     r0, [sp, #0x494]
        ldrsh   lr, [r4, #0xA0]
        sub     r12, r12, r0
        cmp     r12, #0
        movgt   r12, lr, asr r12
        strgth  r12, [r4, #0xA0]
        ble     LDOM4
LDOM3:
        strh    r0, [r4, #0xA8]
        add     r12, r4, #0xA0
        str     r12, [sp]
        mvn     r12, #0x65
        add     r2, r5, #0x30
        mov     r1, r6
        bic     r0, r12, #0x66, 24
        mov     r3, #0x50
        bl      _ippsPreemphasize_GSMAMR_16s
        mov     r0, r5
        bl      _ippsFFTFwd_RToPerm_GSMAMR_16s_I
        mov     r12, #0
        str     r12, [sp]
        mov     r3, #0x80
        mov     r2, r7
        mov     r1, r5
        mov     r0, r5
        bl      _ippsMul_16s32s_Sfs
        ldr     r2, [sp, #0x494]
        mov     r1, r7
        mov     r0, r4
        bl      ownVad2ChEnergyEstimator_GSMAMR_16s
        add     r3, sp, #1, 22
        add     r2, sp, #1, 22
        add     r1, sp, #0x49, 28
        str     r8, [sp, #4]
        str     r9, [sp]
        add     r3, r3, #0xA8
        add     r2, r2, #0xA4
        mov     r0, r4
        bl      ownVad2SnrEstimatorAndSumVocieMetric_GSMAMR_16s
        add     r2, sp, #1, 22
        add     r3, sp, #0x4A, 28
        add     r2, r2, #0x9C
        mov     r1, r8
        mov     r0, r4
        bl      ownVad2DecisionCalibrate_GSMAMR_16s
        add     r12, sp, #1, 22
        add     r12, r12, #0x98
        str     r12, [sp, #8]
        str     r11, [sp, #4]
        add     r2, sp, #1, 22
        ldrsh   r2, [r2, #0x9C]
        mov     r1, r9
        add     r3, sp, #1, 22
        str     r2, [sp]
        ldrsh   r3, [r3, #0xA0]
        add     r2, sp, #1, 22
        ldrsh   r2, [r2, #0xA8]
        mov     r0, r4
        bl      ownVad2DetermineVADAndSpectrDeviation_GSMAMR_16s
        str     r10, [sp, #4]
        add     r2, sp, #1, 22
        ldrsh   r2, [r2, #0xA4]
        add     r3, sp, #1, 22
        add     r1, sp, #1, 22
        str     r2, [sp]
        ldr     r2, [sp, #0x490]
        ldrsh   r3, [r3, #0x98]
        ldrsh   r1, [r1, #0xA8]
        mov     r0, r4
        bl      ownVad2BackgroundNoiseUpdate_GSMAMR_16s
        add     sp, sp, #0xAC
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDOM4:
        mvn     r1, #0xFF
        rsb     r12, r12, #0
        bic     r1, r1, #0x7F, 24
        bic     r12, r12, #0xFF, 8
        mvn     r1, r1
        bic     r12, r12, #0xFF, 16
        cmp     lr, r1, asr r12
        mov     r2, #0
        sub     r1, r2, #2, 18
        subgt   r2, r2, #2, 18
        mvngt   r12, r2
        bgt     LDOM5
        cmp     lr, r1, asr r12
        mvnlt   r12, #0xFF
        biclt   r12, r12, #0x7F, 24
        blt     LDOM5
        mov     r12, lr, lsl r12
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDOM5:
        strh    r12, [r4, #0xA0]
        b       LDOM3


