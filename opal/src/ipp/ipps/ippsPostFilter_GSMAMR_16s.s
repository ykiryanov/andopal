        .text
        .align  4
        .globl  _ippsPostFilter_GSMAMR_16s


_ippsPostFilter_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC3, 30
        add     lr, sp, #9, 26
        add     r12, sp, #0xB1, 30
        and     lr, lr, #0x1F
        add     r4, sp, #0x5C
        and     r11, r12, #0x1F
        rsb     lr, lr, #0
        and     r4, r4, #0x1F
        rsb     r9, r11, #0
        and     lr, lr, #0x1F
        add     r11, sp, #9, 26
        rsb     r4, r4, #0
        add     r6, sp, #0x1D, 28
        add     lr, r11, lr
        and     r4, r4, #0x1F
        and     r6, r6, #0x1F
        add     r11, sp, #0x5C
        add     r10, sp, #0xA3, 30
        add     r4, r11, r4
        rsb     r6, r6, #0
        ldr     r11, [sp, #0x33C]
        add     r12, sp, #0xB1, 30
        str     lr, [sp, #0xC]
        and     lr, r6, #0x1F
        ldr     r6, [sp, #0x330]
        and     r10, r10, #0x1F
        str     r4, [sp, #0x38]
        add     r4, sp, #0x1D, 28
        and     r9, r9, #0x1F
        add     lr, r4, lr
        ldr     r4, [sp, #0x338]
        add     r12, r12, r9
        rsb     r10, r10, #0
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0x334]
        str     r12, [sp, #0x14]
        add     r12, sp, #0xA3, 30
        mov     r5, r0
        and     r10, r10, #0x1F
        add     r12, r12, r10
        cmp     r5, #0
        mov     r0, r1
        mov     r7, r2
        mov     r8, r3
        str     lr, [sp, #8]
        str     r12, [sp, #0x10]
        beq     LDON12
        cmp     r0, #0
        beq     LDON12
        cmp     r7, #0
        beq     LDON12
        cmp     r8, #0
        beq     LDON12
        cmp     r6, #0
        beq     LDON12
        ldr     r12, [sp, #8]
        cmp     r12, #0
        beq     LDON12
        cmp     r4, #0
        beq     LDON12
        cmp     r11, #0
        beq     LDON0
        cmp     r11, #1
        beq     LDON0
        cmp     r11, #3
        beq     LDON0
        cmp     r11, #6
        beq     LDON0
        cmp     r11, #7
        beq     LDON0
        cmp     r11, #8
        beq     LDON0
        cmp     r11, #0xB
        beq     LDON0
        cmp     r11, #0xC
        beq     LDON0
        cmp     r11, #0x19
        beq     LDON0
        mvn     r0, #6
        add     sp, sp, #0xC3, 30
        ldmia   sp!, {r4 - r11, pc}
LDON0:
        ldr     r12, [sp, #0x38]
        mov     r2, #0xA0
        add     r1, r12, #0x14
        str     r1, [sp, #0x24]
        bl      _ippsCopy_16s
        ldr     r1, [sp, #0x38]
        mov     r0, r6
        mov     r2, #0xA
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x10]
        ldr     lr, [pc, #0x3D0]
        ldr     r12, [sp, #0x14]
        add     r0, r0, #2
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0xC]
        str     r9, [sp, #0x30]
        mov     r1, #0
        add     r3, r0, #0x16
        add     r0, r0, #2
        str     r11, [sp, #0x50]
        str     r6, [sp, #0x28]
        str     r8, [sp, #0x34]
        mov     r9, r5
        ldr     r11, [sp, #0x24]
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        sub     r2, lr, #0x28
        str     r0, [sp, #0x1C]
        add     r12, r12, #2
        add     r0, r4, #0x3C
        sub     lr, lr, #0x14
        str     r10, [sp, #0x48]
        str     r7, [sp, #0x40]
        str     lr, [sp, #0x44]
        str     r2, [sp, #0x2C]
        str     r3, [sp, #0x58]
        str     r12, [sp, #0x3C]
        mov     r7, r0
        mov     r10, r1
LDON1:
        ldr     r3, [sp, #0x50]
        cmp     r3, #0xC
        beq     LDON11
        ldr     r3, [sp, #0x50]
        cmp     r3, #0xB
        beq     LDON11
        ldrsh   r12, [r9]
        ldr     lr, [sp, #0x30]
        add     r1, r9, #2
        str     r1, [sp, #0x4C]
        add     r0, sp, #0xB1, 30
        strh    r12, [lr, +r0]
        mov     r12, #0xF
        str     r12, [sp]
        ldr     r2, [sp, #0x3C]
        ldr     r0, [sp, #0x2C]
        mov     r3, #0xA
        bl      _ippsMul_NR_16s_Sfs
        ldr     lr, [sp, #0x48]
        ldrsh   r12, [r9]
        ldr     r2, [sp, #0x20]
        add     r0, sp, #0xA3, 30
        mov     r3, #0xA
        strh    r12, [lr, +r0]
        mov     r12, #0xF
        str     r12, [sp]
        ldr     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x44]
        bl      _ippsMul_NR_16s_Sfs
LDON2:
        ldr     r1, [sp, #0x14]
        mov     r0, r11
        mov     r2, r6
        bl      _ippsResidualFilter_G729_16s
        ldr     r0, [sp, #0x14]
        mov     r1, r5
        mov     r2, #0xB
        bl      _ippsCopy_16s
        ldr     r0, [sp, #0x58]
        mov     r1, #0xB
        bl      _ippsZero_16s
        ldr     r3, [sp, #0x58]
        mov     r2, #0x16
        mov     r1, r5
        str     r3, [sp]
        mov     r3, #0xC
        mov     r0, r8
        bl      _ippsSynthesisFilterLow_NR_16s_ISfs
        add     r3, sp, #0xC1, 30
        mov     r2, #0
        mov     r1, #0x16
        mov     r0, r5
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x304]
        ldr     r1, [sp, #0x1C]
        add     r3, sp, #0xC1, 30
        str     r12, [sp, #0x54]
        mov     r2, #0x15
        mov     r0, r5
        bl      _ippsDotProd_16s32s
        ldr     r12, [sp, #0x304]
        ldr     r3, [sp, #0x54]
        mov     r12, r12, asr #15
        mov     r12, r12, lsl #16
        mov     r3, r3, asr #15
        mov     lr, r3, lsl #16
        mov     r3, r12, asr #16
        cmp     r3, #0
        mov     r1, lr, asr #16
        movle   r0, #0
        ble     LDON4
        mov     r12, #0x66
        orr     r12, r12, #0x66, 24
        mul     r12, r3, r12
        cmp     r1, #0
        mov     r3, r12, asr #15
        mov     r3, r3, lsl #16
        mov     r0, r3, asr #1
        movle   r3, #0xFF
        orrle   r0, r3, #0x7F, 24
        ble     LDON3
        bl      __intel_idiv
LDON3:
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDON4:
        mov     r1, r6
        ldr     r3, [sp, #0x40]
        mov     r2, #0x28
        bl      _ippsPreemphasize_G729A_16s_I
        ldr     r3, [sp, #8]
        mov     r2, r4
        mov     r1, r6
        str     r3, [sp, #4]
        mov     r3, #0xC
        str     r3, [sp]
        mov     r0, r8
        mov     r3, #0x28
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        ldr     r1, [sp, #8]
        mov     r2, #0xA
        mov     r0, r7
        bl      _ippsCopy_16s
        mov     r12, #0
        add     r3, sp, #0xC2, 30
        str     r12, [sp]
        mov     r2, #0x28
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x38]
        ldr     r3, [sp, #0x308]
        add     lr, r10, #0xA
        add     lr, r12, lr, lsl #1
        str     lr, [sp, #0x4C]
        cmn     r3, #7, 2
        movlt   r3, r3, asr #3
        strlt   r3, [sp, #0x54]
        bge     LDON10
LDON5:
        ldr     r3, [sp, #0x54]
        cmp     r3, #0
        str     r3, [sp, #0x308]
        bne     LDON6
        ldr     r12, [sp, #0x34]
        mov     r3, #0
        strh    r3, [r12]
        b       LDON8
LDON6:
        mov     r12, #0
        str     r12, [sp]
        ldr     r0, [sp, #0x4C]
        add     r3, sp, #0xBF, 30
        mov     r2, #0x28
        mov     r1, r0
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r3, [sp, #0x2FC]
        cmn     r3, #7, 2
        movlt   r1, r3, asr #3
        bge     LDON9
LDON7:
        ldr     r0, [sp, #0x54]
        add     r2, sp, #3, 24
        str     r1, [sp, #0x2FC]
        bl      ownCalcG0_G729A_16s
        add     r1, sp, #3, 24
        ldr     r2, [sp, #0x34]
        ldrsh   r1, [r1]
        mov     r0, r4
        bl      ownCalcGain_G729A_16s
LDON8:
        add     r10, r10, #0x28
        cmp     r10, #0xA0
        add     r9, r9, #0x16
        add     r7, r7, #0x50
        add     r4, r4, #0x50
        add     r11, r11, #0x50
        blt     LDON1
        ldr     r2, [sp, #0x38]
        ldr     r6, [sp, #0x28]
        add     r0, r2, #5, 26
        mov     r2, #0xA
        mov     r1, r6
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0xC3, 30
        ldmia   sp!, {r4 - r11, pc}
LDON9:
        ldr     r0, [sp, #0x4C]
        add     r3, sp, #0xBF, 30
        mov     r2, #2
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp, #0x2FC]
        cmn     r3, #7, 2
        mvngt   r1, #2, 2
        bgt     LDON7
        cmp     r3, #3, 2
        movge   r1, r3, lsl #1
        movlt   r1, #2, 2
        b       LDON7
LDON10:
        add     r3, sp, #0xC2, 30
        mov     r2, #2
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp, #0x308]
        cmn     r3, #7, 2
        mvngt   r3, #2, 2
        strgt   r3, [sp, #0x54]
        bgt     LDON5
        cmp     r3, #3, 2
        movge   r3, r3, lsl #1
        strge   r3, [sp, #0x54]
        movlt   r3, #2, 2
        strlt   r3, [sp, #0x54]
        b       LDON5
LDON11:
        ldrsh   r12, [r9]
        ldr     lr, [sp, #0x30]
        add     r1, r9, #2
        str     r1, [sp, #0x4C]
        add     r0, sp, #0xB1, 30
        strh    r12, [lr, +r0]
        mov     r12, #0xF
        str     r12, [sp]
        ldr     r2, [sp, #0x3C]
        ldr     r0, [sp, #0x44]
        mov     r3, #0xA
        bl      _ippsMul_NR_16s_Sfs
        ldr     lr, [sp, #0x48]
        ldrsh   r12, [r9]
        ldr     r2, [sp, #0x20]
        add     r0, sp, #0xA3, 30
        mov     r3, #0xA
        strh    r12, [lr, +r0]
        mov     r12, #0xF
        str     r12, [sp]
        ldr     r1, [sp, #0x4C]
        ldr     r0, [pc, #0x10]
        bl      _ippsMul_NR_16s_Sfs
        b       LDON2
LDON12:
        mvn     r0, #7
        add     sp, sp, #0xC3, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDON_gamma4_MR122


        .data
        .align  4


LDON_gamma3:
        .byte   0x66,0x46,0xB8,0x26,0x4B,0x15,0xB6,0x0B,0x71,0x06,0x8B,0x03,0xF3,0x01,0x12,0x01
        .byte   0x97,0x00,0x53,0x00
LDON_gamma3_MR122:
        .byte   0x9A,0x59,0xB9,0x3E,0xE8,0x2B,0xBC,0x1E,0x84,0x15,0x10,0x0F,0x8B,0x0A,0x61,0x07
        .byte   0x2A,0x05,0x9D,0x03
LDON_gamma4_MR122:
        .byte   0x00,0x60,0x00,0x48,0x00,0x36,0x80,0x28,0x60,0x1E,0xC8,0x16,0x16,0x11,0xD1,0x0C
        .byte   0x9D,0x09,0x36,0x07


