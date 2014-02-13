        .text
        .align  4
        .globl  _ippsLSPQuant_GSMAMR_16s


_ippsLSPQuant_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x89, 30
        add     r6, sp, #0x77, 30
        str     r2, [sp, #0x5C]
        add     r2, sp, #2, 24
        and     r2, r2, #0xF
        rsb     r2, r2, #0
        and     r6, r6, #0xF
        add     r10, sp, #0x6E, 30
        mov     r8, r3
        and     r4, r2, #0xF
        rsb     r6, r6, #0
        str     r4, [sp, #0x48]
        and     r10, r10, #0xF
        and     r6, r6, #0xF
        add     r3, sp, #2, 24
        rsb     r10, r10, #0
        add     r5, sp, #0x17, 28
        add     r11, sp, #0x65, 30
        add     r4, r3, r4
        str     r6, [sp, #0x50]
        add     r3, sp, #0x77, 30
        add     r6, r3, r6
        and     r10, r10, #0xF
        add     lr, sp, #0x53, 30
        and     r11, r11, #0xF
        and     r5, r5, #0xF
        add     r2, sp, #0x41, 30
        str     r6, [sp, #0x58]
        add     r6, sp, #0x6E, 30
        add     r12, sp, #0x4A, 30
        mov     r7, r0
        str     r10, [sp, #0x44]
        rsb     r11, r11, #0
        and     r0, r11, #0xF
        ldr     r11, [sp, #0x248]
        and     lr, lr, #0xF
        rsb     r5, r5, #0
        add     r10, r6, r10
        str     r0, [sp, #0x4C]
        and     r2, r2, #0xF
        and     r12, r12, #0xF
        rsb     lr, lr, #0
        add     r6, sp, #0x65, 30
        mov     r9, r1
        and     r1, r5, #0xF
        and     r5, lr, #0xF
        rsb     r2, r2, #0
        rsb     r12, r12, #0
        add     r0, r6, r0
        add     r6, sp, #0x17, 28
        and     lr, r2, #0xF
        add     r2, sp, #0xE0
        and     r12, r12, #0xF
        str     r10, [sp, #0x70]
        add     r10, r6, r1
        add     r6, sp, #0x53, 30
        str     r5, [sp, #0x68]
        and     r2, r2, #0xF
        add     r6, r6, r5
        add     r5, sp, #0x4A, 30
        str     r12, [sp, #0x78]
        add     r12, r5, r12
        rsb     r2, r2, #0
        str     r12, [sp, #0x7C]
        add     r12, sp, #0x41, 30
        and     r2, r2, #0xF
        add     r5, r12, lr
        str     r2, [sp, #0x54]
        add     r12, sp, #0xE0
        add     r2, r12, r2
        cmp     r7, #0
        str     r1, [sp, #0x64]
        str     lr, [sp, #0x60]
        str     r0, [sp, #0x6C]
        str     r2, [sp, #0x74]
        beq     LDOT10
        cmp     r9, #0
        beq     LDOT10
        ldr     r2, [sp, #0x5C]
        cmp     r2, #0
        beq     LDOT10
        cmp     r8, #0
        beq     LDOT10
        cmp     r11, #0
        beq     LDOT0
        cmp     r11, #1
        beq     LDOT0
        cmp     r11, #3
        beq     LDOT0
        cmp     r11, #6
        beq     LDOT0
        cmp     r11, #7
        beq     LDOT0
        cmp     r11, #8
        beq     LDOT0
        cmp     r11, #0xB
        beq     LDOT0
        cmp     r11, #0xC
        beq     LDOT4
        cmp     r11, #0x19
        beq     LDOT0
        mvn     r0, #6
        add     sp, sp, #0x89, 30
        ldmia   sp!, {r4 - r11, pc}
LDOT0:
        mov     r1, r4
        mov     r0, r7
        bl      _ippsLSPToLSF_Norm_G729_16s
        ldr     r1, [sp, #0x70]
        mov     r0, r4
        bl      LsfWeight
        ldr     r2, [pc, #0x534]
        ldrsh   r12, [r9]
        cmp     r11, #0
        str     r12, [sp, #0x7C]
        ldrsh   r7, [r9, #6]
        ldrsh   r1, [r9, #2]
        ldrsh   r3, [r2, #2]
        ldrsh   r12, [r9, #4]
        ldrsh   lr, [r2, #4]
        mul     r3, r1, r3
        ldrsh   r0, [r2, #6]
        mul     lr, r12, lr
        mul     r0, r7, r0
        str     r3, [sp, #0x78]
        str     lr, [sp, #0x74]
        str     r0, [sp, #0x6C]
        ldrsh   r1, [r2, #8]
        ldrsh   r12, [r9, #8]
        ldrsh   r0, [r9, #0xA]
        ldrsh   r7, [r2, #0xA]
        ldrsh   lr, [r2, #0xC]
        mul     r1, r12, r1
        mul     r7, r0, r7
        str     r1, [sp, #0x58]
        ldrsh   r12, [r9, #0xC]
        str     r7, [sp, #0x54]
        ldrsh   r7, [r9, #0xE]
        ldrsh   r0, [r2, #0xE]
        mul     lr, r12, lr
        mul     r0, r7, r0
        str     lr, [sp, #0x50]
        ldrsh   r12, [r9, #0x10]
        ldrsh   lr, [r2, #0x10]
        str     r0, [sp, #0x4C]
        ldrsh   r2, [r2, #0x12]
        ldrsh   r7, [r9, #0x12]
        mul     lr, r12, lr
        ldr     r12, [pc, #0x4A4]
        mul     r2, r7, r2
        str     lr, [sp, #0x44]
        ldrsh   r12, [r12]
        mov     lr, #0x55, 30
        orr     lr, lr, #9, 22
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x7C]
        mul     r1, r2, lr
        ldr     r2, [pc, #0x480]
        ldrsh   r0, [r2, #2]
        ldrsh   r7, [r2, #6]
        ldrsh   lr, [r2, #4]
        ldrsh   r3, [r2, #8]
        add     r1, r12, r1, asr #15
        mov     r1, r1, lsl #16
        str     r3, [sp, #0x7C]
        ldrsh   r3, [r2, #0xA]
        mov     r1, r1, asr #16
        str     r3, [sp, #0x3C]
        ldrsh   r3, [r2, #0xC]
        str     r3, [sp, #0x38]
        ldrsh   r3, [r2, #0xE]
        str     r3, [sp, #0x34]
        ldrsh   r3, [r2, #0x10]
        str     r3, [sp, #0x30]
        ldrsh   r2, [r2, #0x12]
        add     r3, sp, #2, 24
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #0x48]
        ldrsh   r12, [r4, #2]
        ldrsh   r2, [r2, +r3]
        str     r12, [sp, #0x48]
        ldrsh   r12, [r4, #4]
        sub     r2, r2, r1
        str     r12, [sp, #0x28]
        ldrsh   r12, [r4, #6]
        str     r12, [sp, #0x24]
        ldrsh   r12, [r4, #8]
        str     r12, [sp, #0x20]
        ldrsh   r12, [r4, #0xA]
        str     r12, [sp, #8]
        ldrsh   r12, [r4, #0xC]
        str     r12, [sp, #0x80]
        ldrsh   r12, [r4, #0xE]
        str     r12, [sp, #0x84]
        ldrsh   r12, [r4, #0x10]
        str     r12, [sp, #0x88]
        ldrsh   r4, [r4, #0x12]
        ldr     r12, [sp, #0x78]
        str     r4, [sp, #0x8C]
        ldr     r4, [sp, #0x64]
        add     r12, r0, r12, asr #15
        add     r0, sp, #0x17, 28
        mov     r12, r12, lsl #16
        strh    r1, [r4, +r0]
        ldr     r4, [sp, #0x68]
        add     r0, sp, #0x53, 30
        mov     r12, r12, asr #16
        strh    r2, [r4, +r0]
        ldr     r2, [sp, #0x74]
        ldr     r1, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        add     lr, lr, r2, asr #15
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x4C]
        mov     lr, lr, lsl #16
        add     r4, r7, r2, asr #15
        ldr     r7, [sp, #0x58]
        ldr     r2, [sp, #0x7C]
        mov     r4, r4, lsl #16
        mov     lr, lr, asr #16
        add     r7, r2, r7, asr #15
        ldr     r2, [sp, #0x3C]
        str     lr, [sp, #0x6C]
        mov     r4, r4, asr #16
        mov     r7, r7, lsl #16
        add     r2, r2, r0, asr #15
        ldr     r0, [sp, #0x38]
        mov     r7, r7, asr #16
        mov     r2, r2, lsl #16
        add     r0, r0, r1, asr #15
        ldr     r1, [sp, #0x34]
        mov     r2, r2, asr #16
        mov     r0, r0, lsl #16
        add     r3, r1, r3, asr #15
        str     r3, [sp, #0x7C]
        ldr     r3, [sp, #0x44]
        ldr     r1, [sp, #0x30]
        mov     r0, r0, asr #16
        add     r3, r1, r3, asr #15
        ldr     r1, [sp, #0x2C]
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x40]
        add     r3, r1, r3, asr #15
        ldr     r1, [sp, #0x7C]
        str     r3, [sp, #0x74]
        ldr     r3, [sp, #0x28]
        mov     r1, r1, lsl #16
        str     r1, [sp, #0x7C]
        ldr     r1, [sp, #0x78]
        ldr     lr, [sp, #0x7C]
        mov     r1, r1, lsl #16
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        mov     lr, lr, asr #16
        str     lr, [sp, #0x7C]
        ldr     lr, [sp, #0x78]
        mov     r1, r1, lsl #16
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x74]
        mov     lr, lr, asr #16
        mov     r1, r1, asr #16
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x48]
        sub     r1, r1, r12
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x6C]
        sub     r3, r3, r1
        ldr     r1, [sp, #0x24]
        str     r3, [sp, #0x58]
        ldr     r3, [sp, #0x84]
        sub     r1, r1, r4
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x20]
        sub     r1, r1, r7
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #8]
        sub     r1, r1, r2
        str     r1, [sp, #0x4C]
        ldr     r1, [sp, #0x80]
        sub     r1, r1, r0
        str     r1, [sp, #0x80]
        ldr     r1, [sp, #0x7C]
        sub     r3, r3, r1
        ldr     r1, [sp, #0x88]
        str     r3, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        sub     r1, r1, lr
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0x78]
        sub     r3, r3, r1
        str     r3, [sp, #0x8C]
        strh    r12, [r10, #2]
        ldr     r12, [sp, #0x74]
        strh    r12, [r6, #2]
        ldr     r12, [sp, #0x6C]
        strh    r12, [r10, #4]
        ldr     r12, [sp, #0x58]
        strh    r4, [r10, #6]
        strh    r12, [r6, #4]
        add     r12, r6, #6
        str     r12, [sp, #0x58]
        ldr     r12, [sp, #0x54]
        strh    r7, [r10, #8]
        strh    r12, [r6, #6]
        ldr     r12, [sp, #0x50]
        strh    r2, [r10, #0xA]
        strh    r12, [r6, #8]
        ldr     r2, [sp, #0x4C]
        strh    r0, [r10, #0xC]
        strh    r2, [r6, #0xA]
        add     r2, r6, #0xC
        str     r2, [sp, #0x6C]
        ldr     r2, [sp, #0x80]
        strh    r2, [r6, #0xC]
        ldr     r2, [sp, #0x7C]
        strh    r2, [r10, #0xE]
        ldr     r2, [sp, #0x84]
        strh    lr, [r10, #0x10]
        strh    r2, [r6, #0xE]
        ldr     r2, [sp, #0x88]
        strh    r2, [r6, #0x10]
        ldr     r2, [sp, #0x78]
        strh    r2, [r10, #0x12]
        ldr     r2, [sp, #0x8C]
        strh    r2, [r6, #0x12]
        bne     LDOT2
LDOT1:
        ldr     r1, [pc, #0x1E0]
        mov     r2, #0
        str     r2, [sp]
        ldr     r4, [sp, #0x70]
        mov     r0, r6
        mov     r3, #1, 24
        mov     r2, r4
        bl      ownQuantDim3SubVeq
        ldr     r1, [pc, #0x1C4]
        strh    r0, [r8]
        mov     r12, #1
        str     r12, [sp]
        ldr     r0, [sp, #0x58]
        add     r2, r4, #6
        mov     r3, #1, 24
        bl      ownQuantDim3SubVeq
        ldr     r1, [pc, #0x1A8]
        strh    r0, [r8, #2]
        ldr     r0, [sp, #0x6C]
        add     r2, r4, #0xC
        mov     r3, #0x80
        bl      ownQuantDim4SubVeq
        strh    r0, [r8, #4]
        b       LDOT3
LDOT2:
        cmp     r11, #1
        beq     LDOT1
        ldr     lr, [sp, #0x70]
        mov     r12, #0
        cmp     r11, #8
        add     r7, lr, #6
        add     r4, lr, #0xC
        str     r12, [sp]
        beq     LDOT9
        ldr     r2, [sp, #0x70]
        ldr     r1, [pc, #0x158]
        mov     r0, r6
        mov     r3, #1, 24
        bl      ownQuantDim3SubVeq
        strh    r0, [r8]
        mov     r12, #0
        str     r12, [sp]
        ldr     r0, [sp, #0x58]
        ldr     r1, [pc, #0x13C]
        mov     r3, #2, 24
        mov     r2, r7
        bl      ownQuantDim3SubVeq
        strh    r0, [r8, #2]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [pc, #0x12C]
        mov     r3, #2, 24
        mov     r2, r4
        bl      ownQuantDim4SubVeq
        strh    r0, [r8, #4]
LDOT3:
        ldr     r2, [sp, #0x68]
        add     r3, sp, #0x53, 30
        ldrsh   r4, [r6, #2]
        ldrsh   r2, [r2, +r3]
        ldr     r3, [sp, #0x64]
        add     r12, sp, #0x17, 28
        ldrsh   r7, [r10, #2]
        ldrsh   lr, [r6, #0xA]
        ldrsh   r3, [r3, +r12]
        strh    r2, [r9]
        ldrsh   r8, [r6, #0x10]
        ldrsh   r11, [r10, #4]
        add     r2, r2, r3
        ldr     r3, [sp, #0x60]
        add     r12, sp, #0x41, 30
        ldrsh   r1, [r10, #8]
        strh    r4, [r9, #2]
        strh    r2, [r3, +r12]
        ldrsh   r2, [r6, #4]
        ldrsh   r3, [r6, #6]
        ldrsh   r12, [r6, #8]
        strh    r2, [r9, #4]
        add     r11, r2, r11
        ldrsh   r2, [r10, #6]
        strh    r3, [r9, #6]
        strh    r12, [r9, #8]
        strh    lr, [r9, #0xA]
        add     r2, r3, r2
        strh    r2, [r5, #6]
        ldrsh   r2, [r10, #0xA]
        add     r7, r4, r7
        ldrsh   r4, [r6, #0xC]
        add     r1, r12, r1
        strh    r7, [r5, #2]
        ldrsh   r7, [r6, #0xE]
        ldrsh   r6, [r6, #0x12]
        strh    r1, [r5, #8]
        ldrsh   r1, [r10, #0xC]
        add     lr, lr, r2
        ldrsh   r2, [r10, #0xE]
        ldrsh   r3, [r10, #0x10]
        ldrsh   r10, [r10, #0x12]
        add     r1, r4, r1
        add     r2, r7, r2
        strh    r1, [r5, #0xC]
        strh    r2, [r5, #0xE]
        add     r3, r8, r3
        strh    lr, [r5, #0xA]
        strh    r3, [r5, #0x10]
        add     r10, r6, r10
        strh    r4, [r9, #0xC]
        strh    r7, [r9, #0xE]
        strh    r8, [r9, #0x10]
        strh    r11, [r5, #4]
        strh    r6, [r9, #0x12]
        strh    r10, [r5, #0x12]
        mov     r1, #0xCD
        mov     r0, r5
        mov     r2, #0xA
        bl      ReorderLsf
        ldr     r1, [sp, #0x5C]
        mov     r0, r5
        bl      _ippsLSFToLSP_GSMAMR_16s
        mov     r0, #0
        add     sp, sp, #0x89, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea00000c
        .long   LDOT_TablePredFac
        .long   TableMeanLsf2
        .long   dico1_lsf2
        .long   dico2_lsf2
        .long   mr515_3_lsf
        .long   dico3_lsf2
        .long   LDOT_TableMeanLsf1
        .long   dico1_lsf1
        .long   dico2_lsf1
        .long   dico3_lsf1
        .long   dico4_lsf1
        .long   dico5_lsf1
        .long   mr795_1_lsf
LDOT4:
        mov     r1, r4
        mov     r0, r7
        bl      _ippsLSPToLSF_Norm_G729_16s
        add     r0, r7, #0x14
        ldr     r7, [sp, #0x58]
        mov     r1, r7
        bl      _ippsLSPToLSF_Norm_G729_16s
        ldr     r1, [sp, #0x70]
        mov     r0, r4
        bl      LsfWeight
        ldr     r1, [sp, #0x6C]
        mov     r0, r7
        bl      LsfWeight
        ldrsh   r12, [r9]
        mov     r2, #0x33
        orr     r2, r2, #0x53, 24
        mul     r12, r12, r2
        str     r12, [sp, #0x8C]
        ldrsh   r11, [r9, #8]
        ldrsh   r0, [r9, #6]
        ldrsh   lr, [r9, #0xA]
        ldrsh   r12, [r9, #0xC]
        mul     r0, r0, r2
        mul     r11, r11, r2
        mul     lr, lr, r2
        mul     r12, r12, r2
        str     r0, [sp, #0x88]
        str     r11, [sp, #0x84]
        str     lr, [sp, #0x80]
        str     r12, [sp, #0x40]
        ldrsh   r1, [r9, #0xE]
        ldrsh   lr, [r9, #4]
        ldrsh   r0, [r9, #0x10]
        ldrsh   r12, [r9, #2]
        mul     r1, r1, r2
        mul     lr, lr, r2
        mul     r0, r0, r2
        mul     r12, r12, r2
        ldrsh   r11, [r9, #0x12]
        str     r1, [sp, #0x3C]
        str     lr, [sp, #0x30]
        str     r0, [sp, #0x38]
        mul     r2, r11, r2
        str     r12, [sp, #0x34]
        add     r12, sp, #2, 24
        add     r11, sp, #0x77, 30
        str     r2, [sp, #0x2C]
        mov     r2, #0x5A, 30
        orr     lr, r2, #1, 22
        ldr     r2, [sp, #0x48]
        ldrsh   r2, [r2, +r12]
        ldr     r12, [sp, #0x50]
        ldrsh   r12, [r12, +r11]
        ldr     r11, [pc, #-0xF8]
        ldrsh   r0, [r11, #6]
        str     r0, [sp, #0x50]
        ldrsh   r0, [r11, #8]
        str     r0, [sp, #0x48]
        ldrsh   r0, [r11, #0xA]
        str     r0, [sp, #0x28]
        ldrsh   r0, [r11, #0xC]
        str     r0, [sp, #0x24]
        ldrsh   r0, [r11, #0xE]
        str     r0, [sp, #0x20]
        ldrsh   r0, [r11, #0x10]
        str     r0, [sp, #8]
        ldrsh   r11, [r11, #0x12]
        ldr     r0, [pc, #-0x130]
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x8C]
        add     lr, lr, r11, asr #15
        ldrsh   r11, [r0, #2]
        mov     lr, lr, lsl #16
        str     r11, [sp, #0x8C]
        ldrsh   r0, [r0, #4]
        mov     lr, lr, asr #16
        sub     r2, r2, lr
        str     r0, [sp, #0x94]
        ldrsh   r11, [r4, #2]
        add     r0, sp, #0x53, 30
        str     r11, [sp, #0x98]
        ldrsh   r11, [r7, #2]
        str     r11, [sp, #0x9C]
        ldrsh   r11, [r4, #6]
        str     r11, [sp, #0xA0]
        ldrsh   r11, [r7, #6]
        str     r11, [sp, #0xA4]
        ldrsh   r11, [r4, #8]
        str     r11, [sp, #0xA8]
        ldrsh   r11, [r7, #8]
        str     r11, [sp, #0xAC]
        ldrsh   r11, [r4, #0xA]
        str     r11, [sp, #0xB0]
        ldrsh   r11, [r7, #0xA]
        str     r11, [sp, #0xB4]
        ldrsh   r11, [r4, #0xC]
        str     r11, [sp, #0xB8]
        ldrsh   r11, [r7, #0xC]
        str     r11, [sp, #0xBC]
        ldrsh   r11, [r4, #0xE]
        str     r11, [sp, #0xC0]
        ldrsh   r11, [r7, #0xE]
        str     r11, [sp, #0xC4]
        ldrsh   r11, [r4, #0x10]
        str     r11, [sp, #0xC8]
        ldrsh   r11, [r7, #0x10]
        str     r11, [sp, #0xCC]
        ldrsh   r11, [r4, #0x12]
        str     r11, [sp, #0xD0]
        ldrsh   r11, [r7, #0x12]
        str     r11, [sp, #0xD4]
        sub     r11, r12, lr
        ldr     r12, [sp, #0x68]
        ldrsh   r4, [r4, #4]
        strh    r2, [r12, +r0]
        ldr     r2, [sp, #0x78]
        add     r0, sp, #0x4A, 30
        strh    r11, [r2, +r0]
        ldr     r11, [sp, #0x64]
        add     r0, sp, #0x17, 28
        strh    lr, [r11, +r0]
        ldr     r3, [sp, #0x38]
        ldr     r11, [sp, #0x40]
        ldr     lr, [sp, #0x50]
        ldr     r1, [sp, #0x3C]
        str     r4, [sp, #0xD8]
        ldrsh   r7, [r7, #4]
        ldr     r4, [sp, #0x88]
        add     r0, lr, r4, asr #15
        ldr     lr, [sp, #0x48]
        ldr     r4, [sp, #0x84]
        str     r7, [sp, #0xDC]
        ldr     r7, [sp, #0x80]
        mov     r0, r0, lsl #16
        add     r4, lr, r4, asr #15
        ldr     lr, [sp, #0x28]
        mov     r0, r0, asr #16
        mov     r4, r4, lsl #16
        add     r7, lr, r7, asr #15
        ldr     lr, [sp, #0x24]
        mov     r4, r4, asr #16
        mov     r7, r7, lsl #16
        add     r11, lr, r11, asr #15
        ldr     lr, [sp, #0x20]
        mov     r7, r7, asr #16
        mov     r11, r11, lsl #16
        add     lr, lr, r1, asr #15
        ldr     r1, [sp, #8]
        mov     r11, r11, asr #16
        mov     lr, lr, lsl #16
        add     r3, r1, r3, asr #15
        ldr     r1, [sp, #0x90]
        str     r3, [sp, #0x88]
        ldr     r3, [sp, #0x2C]
        mov     lr, lr, asr #16
        add     r3, r1, r3, asr #15
        ldr     r1, [pc, #-0x290]
        str     r3, [sp, #0x90]
        ldr     r3, [sp, #0x34]
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x88]
        mov     r1, r1, lsl #16
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0x90]
        mov     r1, r1, lsl #16
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x8C]
        add     r3, r1, r3, asr #15
        str     r3, [sp, #0x8C]
        ldr     r3, [sp, #0x30]
        ldr     r1, [sp, #0x94]
        add     r3, r1, r3, asr #15
        str     r3, [sp, #0x94]
        ldr     r3, [sp, #0xD0]
        add     r1, sp, #0x53, 30
        ldrsh   r1, [r12, +r1]
        ldr     r12, [sp, #0x44]
        str     r1, [sp, #0x20]
        add     r1, sp, #0x6E, 30
        ldrsh   r1, [r12, +r1]
        ldr     r12, [sp, #0x70]
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0xA0]
        ldrsh   r12, [r12, #2]
        str     r12, [sp, #0x28]
        add     r12, sp, #0x4A, 30
        ldrsh   r12, [r2, +r12]
        ldr     r2, [sp, #0x4C]
        sub     r1, r1, r0
        str     r12, [sp, #0x24]
        add     r12, sp, #0x65, 30
        ldrsh   r12, [r2, +r12]
        ldr     r2, [sp, #0x6C]
        str     r12, [sp, #0x34]
        ldr     r12, [sp, #0x90]
        ldrsh   r2, [r2, #2]
        str     r1, [sp, #0xA0]
        mov     r12, r12, asr #16
        str     r12, [sp, #0x90]
        ldr     r12, [sp, #0x8C]
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x88]
        mov     r12, r12, lsl #16
        str     r12, [sp, #0x8C]
        ldr     r1, [sp, #0x8C]
        ldr     r12, [sp, #0x94]
        mov     r2, r2, asr #16
        mov     r1, r1, asr #16
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0xA4]
        mov     r12, r12, lsl #16
        sub     r1, r1, r0
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0xA8]
        mov     r12, r12, asr #16
        sub     r1, r1, r4
        str     r1, [sp, #0xA8]
        ldr     r1, [sp, #0xAC]
        sub     r1, r1, r4
        str     r1, [sp, #0xAC]
        ldr     r1, [sp, #0xB0]
        sub     r1, r1, r7
        str     r1, [sp, #0xB0]
        ldr     r1, [sp, #0xB4]
        sub     r1, r1, r7
        str     r1, [sp, #0xB4]
        ldr     r1, [sp, #0xB8]
        sub     r1, r1, r11
        str     r1, [sp, #0xB8]
        ldr     r1, [sp, #0xBC]
        sub     r1, r1, r11
        str     r1, [sp, #0xBC]
        ldr     r1, [sp, #0xC0]
        sub     r1, r1, lr
        str     r1, [sp, #0xC0]
        ldr     r1, [sp, #0xC4]
        sub     r1, r1, lr
        str     r1, [sp, #0xC4]
        ldr     r1, [sp, #0xC8]
        sub     r1, r1, r2
        str     r1, [sp, #0xC8]
        ldr     r1, [sp, #0xCC]
        sub     r1, r1, r2
        str     r1, [sp, #0xCC]
        ldr     r1, [sp, #0x90]
        sub     r3, r3, r1
        ldr     r1, [sp, #0x90]
        str     r3, [sp, #0xD0]
        ldr     r3, [sp, #0xD4]
        sub     r3, r3, r1
        str     r3, [sp, #0xD4]
        mov     r1, #0
        str     r1, [sp, #0x58]
        ldr     r1, [sp, #0x94]
        strh    r1, [r10, #2]
        ldr     r3, [sp, #0x98]
        sub     r3, r3, r1
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #0x9C]
        ldr     r1, [sp, #0x94]
        sub     r3, r3, r1
        str     r3, [sp, #0x44]
        strh    r12, [r10, #4]
        ldr     r1, [sp, #0xD8]
        sub     r1, r1, r12
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0xDC]
        sub     r1, r1, r12
        str     r1, [sp, #0x3C]
        strh    r0, [r10, #6]
        ldr     r12, [sp, #0xA0]
        strh    r12, [r6, #6]
        ldr     r12, [sp, #0x7C]
        ldr     r0, [sp, #0xA4]
        strh    r4, [r10, #8]
        add     r4, r6, #8
        strh    r0, [r12, #6]
        str     r4, [sp, #0x50]
        ldr     r4, [sp, #0xA8]
        strh    r4, [r6, #8]
        add     r4, r12, #8
        str     r4, [sp, #0x4C]
        ldr     r4, [sp, #0xAC]
        strh    r7, [r10, #0xA]
        strh    r4, [r12, #8]
        ldr     r4, [sp, #0xB0]
        strh    r4, [r6, #0xA]
        ldr     r4, [sp, #0xB4]
        strh    r11, [r10, #0xC]
        strh    r4, [r12, #0xA]
        ldr     r4, [sp, #0xB8]
        strh    r4, [r6, #0xC]
        ldr     r4, [sp, #0xBC]
        strh    lr, [r10, #0xE]
        strh    r4, [r12, #0xC]
        ldr     lr, [sp, #0xC0]
        mvn     r4, #2, 2
        strh    lr, [r6, #0xE]
        ldr     lr, [sp, #0xC4]
        strh    r2, [r10, #0x10]
        strh    lr, [r12, #0xE]
        ldr     r2, [sp, #0xC8]
        strh    r2, [r6, #0x10]
        ldr     r2, [sp, #0xCC]
        strh    r2, [r12, #0x10]
        ldr     r2, [sp, #0x90]
        strh    r2, [r10, #0x12]
        ldr     r2, [sp, #0xD0]
        strh    r2, [r6, #0x12]
        ldr     r2, [sp, #0xD4]
        strh    r2, [r12, #0x12]
        ldr     r7, [sp, #0x58]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x48]
        str     r7, [sp, #8]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x10]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x2C]
        ldr     r7, [sp, #0x20]
        ldr     r0, [sp, #0x58]
        add     r12, r2, #2
        add     lr, r2, #4
        add     r2, r2, #6
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
LDOT5:
        ldrsh   r1, [r3], #8
        ldrsh   r10, [r12], #8
        ldr     r11, [sp, #0x40]
        ldrsh   r8, [lr], #8
        sub     r9, r7, r1
        ldrsh   r1, [r2], #8
        mov     r9, r9, lsl #16
        sub     r11, r11, r10
        mov     r9, r9, asr #16
        mul     r10, r6, r9
        mov     r11, r11, lsl #16
        mov     r9, r11, asr #16
        ldr     r11, [sp, #0x28]
        mov     r10, r10, asr #15
        mul     r9, r11, r9
        ldr     r11, [sp, #0x24]
        sub     r8, r11, r8
        mov     r11, r10, lsl #16
        mov     r10, r9, asr #15
        mov     r8, r8, lsl #16
        mov     r11, r11, asr #16
        mul     r9, r11, r11
        mov     r10, r10, lsl #16
        mov     r8, r8, asr #16
        mul     r8, r5, r8
        mov     r10, r10, asr #16
        mla     r9, r10, r10, r9
        ldr     r10, [sp, #0x44]
        sub     r10, r10, r1
        mov     r1, r8, asr #15
        mov     r8, r10, lsl #16
        ldr     r10, [sp, #0x30]
        mov     r1, r1, lsl #16
        mov     r8, r8, asr #16
        mov     r1, r1, asr #16
        mul     r8, r10, r8
        mla     r9, r1, r1, r9
        mov     r8, r8, asr #15
        mov     r1, r8, lsl #16
        mov     r1, r1, asr #16
        mla     r9, r1, r1, r9
        cmp     r9, r4
        movlt   r4, r9
        strlt   r0, [sp, #8]
        add     r0, r0, #1
        cmp     r0, #0x80
        blt     LDOT5
        ldr     r2, [sp, #0x70]
        ldr     r7, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldrsh   r4, [r2, #4]
        ldr     r6, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        str     r4, [sp, #0x40]
        ldrsh   r4, [r6, #6]
        ldr     r9, [sp, #0x1C]
        ldr     lr, [pc, #-0x620]
        mov     r12, r7, lsl #16
        str     r4, [sp, #0x44]
        mov     r4, r12, asr #13
        ldr     r12, [pc, #-0x62C]
        add     r0, lr, r4
        add     r3, sp, #0x53, 30
        str     r12, [sp, #0x58]
        ldrsh   lr, [lr, +r4]
        ldrsh   r4, [r0, #2]
        ldrsh   r11, [r0, #4]
        ldrsh   r0, [r0, #6]
        str     r0, [sp, #0xDC]
        ldrsh   r2, [r2, #6]
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x6C]
        ldrsh   r0, [r2, #4]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x7C]
        ldrsh   r1, [r0, #6]
        str     r1, [sp, #0x30]
        ldrsh   r2, [r2, #6]
        ldr     r1, [sp, #0x68]
        str     r2, [sp, #0x34]
        strh    r4, [r6, #2]
        mov     r2, #0
        strh    lr, [r1, +r3]
        ldr     lr, [sp, #0x78]
        add     r4, sp, #0x4A, 30
        strh    r11, [lr, +r4]
        ldr     lr, [sp, #0xDC]
        strh    r7, [r8]
        mov     r11, r2
        strh    lr, [r0, #2]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x10]
        ldr     r1, [sp, #0x58]
        ldr     r3, [sp, #0x30]
        ldr     r5, [sp, #0x44]
        ldr     r6, [sp, #0x40]
        add     lr, r12, #2
        add     r4, r12, #4
        mvn     r7, #2, 2
        add     r12, r12, #6
        str     r11, [sp, #8]
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
LDOT6:
        ldrsh   r10, [r1], #8
        ldrsh   r9, [lr], #8
        ldr     r0, [sp, #0x38]
        ldr     r11, [sp, #0x28]
        ldrsh   r8, [r4], #8
        sub     r10, r0, r10
        ldrsh   r0, [r12], #8
        sub     r9, r5, r9
        mov     r10, r10, lsl #16
        mov     r9, r9, lsl #16
        mov     r10, r10, asr #16
        mul     r10, r6, r10
        mov     r9, r9, asr #16
        mul     r9, r11, r9
        ldr     r11, [sp, #0x3C]
        mov     r10, r10, asr #15
        sub     r8, r11, r8
        mov     r11, r10, lsl #16
        mov     r10, r9, asr #15
        mov     r11, r11, asr #16
        mul     r9, r11, r11
        ldr     r11, [sp, #0x2C]
        mov     r10, r10, lsl #16
        mov     r8, r8, lsl #16
        mov     r10, r10, asr #16
        mla     r9, r10, r10, r9
        mov     r8, r8, asr #16
        mul     r8, r11, r8
        sub     r10, r3, r0
        mov     r0, r8, asr #15
        mov     r8, r10, lsl #16
        ldr     r10, [sp, #0x34]
        mov     r0, r0, lsl #16
        mov     r8, r8, asr #16
        mov     r0, r0, asr #16
        mul     r8, r10, r8
        mla     r9, r0, r0, r9
        mov     r8, r8, asr #15
        mov     r0, r8, lsl #16
        mov     r0, r0, asr #16
        mla     r9, r0, r0, r9
        cmp     r9, r7
        movlt   r7, r9
        strlt   r2, [sp, #8]
        add     r2, r2, #1
        cmp     r2, #1, 24
        blt     LDOT6
        ldr     r11, [sp, #8]
        ldr     r6, [sp, #0x10]
        ldr     r12, [pc, #-0x7A0]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        mov     r2, r11, lsl #16
        mov     lr, r2, asr #13
        add     r2, r12, lr
        ldrsh   lr, [r12, +lr]
        ldrsh   r4, [r2, #2]
        ldrsh   r12, [r2, #4]
        ldrsh   r2, [r2, #6]
        strh    r4, [r6, #6]
        strh    lr, [r6, #4]
        ldr     r7, [sp, #0x7C]
        strh    r11, [r8, #2]
        strh    r2, [r7, #6]
        strh    r12, [r7, #4]
        mov     r2, #1, 24
        str     r2, [sp, #4]
        ldr     r11, [sp, #0x6C]
        add     r2, r11, #8
        str     r2, [sp]
        ldr     r4, [sp, #0x70]
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x4C]
        ldr     r2, [pc, #-0x804]
        add     r3, r4, #8
        bl      LDOT_ownQuantDim4SigSubVeq
        ldrsh   r12, [r6, #0xC]
        ldr     r2, [pc, #-0x810]
        mov     lr, #0
        str     r12, [sp, #0x34]
        ldrsh   r12, [r7, #0xC]
        str     r12, [sp, #0x2C]
        ldrsh   r12, [r4, #0xC]
        str     r12, [sp, #0x44]
        ldrsh   r12, [r6, #0xE]
        str     r12, [sp, #0x38]
        ldrsh   r4, [r4, #0xE]
        str     r4, [sp, #0x30]
        ldrsh   r12, [r11, #0xC]
        add     r4, r2, #2
        str     r12, [sp, #0x28]
        ldrsh   r7, [r7, #0xE]
        mov     r12, lr
        str     r7, [sp, #0x3C]
        ldrsh   r11, [r11, #0xE]
        add     r7, r2, #4
        str     r11, [sp, #0x40]
        strh    r0, [r8, #4]
        str     r12, [sp, #8]
        str     r5, [sp, #0xC]
        ldr     r3, [sp, #0x38]
        ldr     r12, [sp, #0x44]
        ldr     r5, [sp, #0x2C]
        mvn     r0, #2, 2
        add     r11, r2, #6
        str     r6, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
LDOT7:
        ldrsh   r9, [r2], #8
        ldrsh   r8, [r4], #8
        ldr     r1, [sp, #0x34]
        ldrsh   r6, [r7], #8
        ldr     r10, [sp, #0x30]
        sub     r9, r1, r9
        ldrsh   r1, [r11], #8
        sub     r8, r3, r8
        mov     r9, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     r9, r9, asr #16
        mul     r9, r12, r9
        mov     r8, r8, asr #16
        mul     r8, r10, r8
        mov     r9, r9, asr #15
        mov     r10, r9, lsl #16
        mov     r9, r8, asr #15
        sub     r6, r5, r6
        mov     r10, r10, asr #16
        mul     r8, r10, r10
        mov     r9, r9, lsl #16
        ldr     r10, [sp, #0x28]
        mov     r9, r9, asr #16
        mov     r6, r6, lsl #16
        mla     r8, r9, r9, r8
        ldr     r9, [sp, #0x3C]
        mov     r6, r6, asr #16
        mul     r6, r10, r6
        sub     r9, r9, r1
        mov     r1, r6, asr #15
        mov     r6, r9, lsl #16
        ldr     r9, [sp, #0x40]
        mov     r1, r1, lsl #16
        mov     r6, r6, asr #16
        mov     r1, r1, asr #16
        mul     r6, r9, r6
        mla     r8, r1, r1, r8
        mov     r6, r6, asr #15
        mov     r1, r6, lsl #16
        mov     r1, r1, asr #16
        mla     r8, r1, r1, r8
        cmp     r8, r0
        movlt   r0, r8
        strlt   lr, [sp, #8]
        add     lr, lr, #1
        cmp     lr, #1, 24
        blt     LDOT7
        ldr     r6, [sp, #0x10]
        ldr     r12, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldrsh   r4, [r6, #0x10]
        ldr     r1, [sp, #0x7C]
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        str     r4, [sp, #0x40]
        ldrsh   r4, [r1, #0x10]
        ldr     r2, [pc, #-0x970]
        ldr     r9, [sp, #0x1C]
        mov     lr, r12, lsl #16
        str     r4, [sp, #0x44]
        mov     r7, lr, asr #13
        ldrsh   r11, [r2, +r7]
        add     lr, r2, r7
        ldr     r4, [pc, #-0x988]
        str     r11, [sp, #0x50]
        ldrsh   r2, [lr, #4]
        ldrsh   r0, [lr, #2]
        ldrsh   r7, [lr, #6]
        ldr     lr, [sp, #0x70]
        ldrsh   r3, [lr, #0x10]
        str     r3, [sp, #0x38]
        ldrsh   r3, [r6, #0x12]
        str     r3, [sp, #0x3C]
        ldrsh   lr, [lr, #0x12]
        str     lr, [sp, #0x2C]
        ldr     lr, [sp, #0x6C]
        ldrsh   r3, [lr, #0x10]
        str     r3, [sp, #0x30]
        ldrsh   r3, [r1, #0x12]
        str     r3, [sp, #0x34]
        ldrsh   lr, [lr, #0x12]
        str     lr, [sp, #0x28]
        strh    r2, [r1, #0xC]
        strh    r11, [r6, #0xC]
        strh    r0, [r6, #0xE]
        strh    r7, [r1, #0xE]
        strh    r12, [r8, #6]
        ldr     r3, [sp, #0x38]
        mov     lr, #0
        str     r2, [sp, #0x20]
        str     r5, [sp, #0xC]
        ldr     r2, [sp, #0x3C]
        ldr     r5, [sp, #0x44]
        str     lr, [sp, #0x58]
        mvn     r0, #2, 2
        add     r12, r4, #2
        add     r7, r4, #4
        add     r11, r4, #6
        str     r6, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x1C]
LDOT8:
        ldrsh   r9, [r4], #8
        ldrsh   r8, [r12], #8
        ldr     r1, [sp, #0x40]
        ldrsh   r6, [r7], #8
        ldr     r10, [sp, #0x2C]
        sub     r9, r1, r9
        ldrsh   r1, [r11], #8
        sub     r8, r2, r8
        mov     r9, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     r9, r9, asr #16
        mul     r9, r3, r9
        mov     r8, r8, asr #16
        mul     r8, r10, r8
        mov     r9, r9, asr #15
        mov     r10, r9, lsl #16
        mov     r9, r8, asr #15
        sub     r6, r5, r6
        mov     r10, r10, asr #16
        mul     r8, r10, r10
        mov     r9, r9, lsl #16
        ldr     r10, [sp, #0x30]
        mov     r9, r9, asr #16
        mov     r6, r6, lsl #16
        mla     r8, r9, r9, r8
        ldr     r9, [sp, #0x34]
        mov     r6, r6, asr #16
        mul     r6, r10, r6
        sub     r9, r9, r1
        mov     r1, r6, asr #15
        mov     r6, r9, lsl #16
        ldr     r9, [sp, #0x28]
        mov     r1, r1, lsl #16
        mov     r6, r6, asr #16
        mov     r1, r1, asr #16
        mul     r6, r9, r6
        mla     r8, r1, r1, r8
        mov     r6, r6, asr #15
        mov     r1, r6, lsl #16
        mov     r1, r1, asr #16
        mla     r8, r1, r1, r8
        cmp     r8, r0
        movlt   r0, r8
        strlt   lr, [sp, #0x58]
        add     lr, lr, #1
        cmp     lr, #0x40
        blt     LDOT8
        ldr     r2, [sp, #0x20]
        ldr     r4, [sp, #0x64]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r12, [pc, #-0xAFC]
        ldr     r0, [sp, #0x58]
        add     r7, sp, #0x17, 28
        ldrsh   r7, [r4, +r7]
        ldr     r1, [sp, #0x7C]
        mov     lr, r0, lsl #16
        str     r7, [sp, #0xDC]
        ldrsh   r4, [r10, #2]
        mov     lr, lr, asr #13
        str     r4, [sp, #0xD8]
        add     r4, r12, lr
        ldrsh   r7, [r4, #6]
        str     r7, [sp, #0xD4]
        ldrsh   r7, [r4, #4]
        ldrsh   r4, [r4, #2]
        str     r4, [sp, #0xD0]
        ldrsh   lr, [r12, +lr]
        str     lr, [sp, #0xCC]
        strh    r7, [r1, #0x10]
        ldr     r12, [sp, #0xD4]
        strh    r12, [r1, #0x12]
        ldr     r12, [sp, #0xD0]
        strh    lr, [r6, #0x10]
        add     lr, sp, #0x4A, 30
        strh    r12, [r6, #0x12]
        ldr     r12, [sp, #0x78]
        ldrsh   r4, [r12, +lr]
        ldr     r12, [sp, #0x68]
        add     lr, sp, #0x53, 30
        ldrsh   lr, [r12, +lr]
        str     lr, [sp, #0xC8]
        ldrsh   r12, [r6, #2]
        str     r12, [sp, #0xC4]
        ldrsh   r11, [r1, #2]
        ldrsh   r12, [r10, #4]
        str     r12, [sp, #0xC0]
        ldrsh   r12, [r6, #4]
        str     r12, [sp, #0xBC]
        ldrsh   r12, [r1, #4]
        str     r12, [sp, #0xB8]
        ldrsh   r12, [r10, #6]
        str     r12, [sp, #0xB4]
        ldrsh   r12, [r6, #6]
        str     r12, [sp, #0xB0]
        ldrsh   r12, [r1, #6]
        str     r12, [sp, #0xAC]
        ldrsh   r12, [r10, #8]
        str     r12, [sp, #0xA8]
        ldrsh   r12, [r6, #8]
        str     r12, [sp, #0xA4]
        ldrsh   r12, [r1, #8]
        str     r12, [sp, #0xA0]
        ldrsh   lr, [r6, #0xA]
        ldrsh   r12, [r10, #0xA]
        str     lr, [sp, #0x9C]
        ldrsh   lr, [r1, #0xA]
        str     lr, [sp, #0x98]
        ldrsh   lr, [r10, #0xC]
        str     lr, [sp, #0x94]
        ldrsh   lr, [r10, #0xE]
        ldrsh   r6, [r6, #0xE]
        str     r6, [sp, #0x90]
        ldrsh   r6, [r1, #0xE]
        ldrsh   r1, [r10, #0x10]
        ldrsh   r10, [r10, #0x12]
        strh    r0, [r8, #8]
        ldr     r3, [sp, #0xD4]
        ldr     r8, [sp, #0xC8]
        add     r0, sp, #0x41, 30
        mov     r3, r3, lsl #16
        str     r3, [sp, #0xD4]
        ldr     r3, [sp, #0xDC]
        add     r8, r8, r3
        str     r8, [sp, #0xC8]
        ldr     r8, [sp, #0x60]
        add     r3, r4, r3
        str     r3, [sp, #0xDC]
        ldr     r3, [sp, #0xC8]
        strh    r3, [r8, +r0]
        ldr     r3, [sp, #0xDC]
        ldr     r8, [sp, #0x54]
        add     r0, sp, #0xE0
        strh    r3, [r8, +r0]
        ldr     r3, [sp, #0xD0]
        mov     r0, r5
        mov     r3, r3, lsl #16
        str     r3, [sp, #0xDC]
        ldr     r3, [sp, #0xD4]
        strh    r4, [r9]
        ldr     r4, [sp, #0xC4]
        ldr     r8, [sp, #0xD8]
        mov     r3, r3, asr #16
        add     r8, r4, r8
        strh    r8, [r5, #2]
        ldr     r4, [sp, #0xD8]
        add     r8, r11, r4
        ldr     r4, [sp, #0x74]
        strh    r11, [r9, #2]
        strh    r8, [r4, #2]
        ldr     r11, [sp, #0xC0]
        ldr     r8, [sp, #0xBC]
        add     r11, r8, r11
        strh    r11, [r5, #4]
        ldr     r11, [sp, #0xC0]
        ldr     r8, [sp, #0xB8]
        add     r11, r8, r11
        strh    r11, [r4, #4]
        ldr     r8, [sp, #0xB8]
        strh    r8, [r9, #4]
        ldr     r11, [sp, #0xB4]
        ldr     r8, [sp, #0xB0]
        add     r11, r8, r11
        strh    r11, [r5, #6]
        ldr     r11, [sp, #0xB4]
        ldr     r8, [sp, #0xAC]
        add     r11, r8, r11
        strh    r11, [r4, #6]
        ldr     r8, [sp, #0xAC]
        strh    r8, [r9, #6]
        ldr     r11, [sp, #0xA8]
        ldr     r8, [sp, #0xA4]
        add     r11, r8, r11
        strh    r11, [r5, #8]
        ldr     r8, [sp, #0xA0]
        ldr     r11, [sp, #0xA8]
        add     r11, r8, r11
        strh    r11, [r4, #8]
        ldr     r8, [sp, #0xA0]
        strh    r8, [r9, #8]
        ldr     r8, [sp, #0x9C]
        add     r8, r8, r12
        strh    r8, [r5, #0xA]
        ldr     r8, [sp, #0x98]
        add     r12, r8, r12
        strh    r12, [r4, #0xA]
        ldr     r12, [sp, #0x98]
        strh    r12, [r9, #0xA]
        ldr     r12, [sp, #0x50]
        ldr     r8, [sp, #0x94]
        add     r8, r12, r8
        strh    r8, [r5, #0xC]
        ldr     r12, [sp, #0x94]
        strh    r2, [r9, #0xC]
        add     r12, r2, r12
        strh    r12, [r4, #0xC]
        ldr     r2, [sp, #0x90]
        strh    r6, [r9, #0xE]
        add     r2, r2, lr
        strh    r2, [r5, #0xE]
        add     lr, r6, lr
        strh    lr, [r4, #0xE]
        ldr     r2, [sp, #0xCC]
        strh    r7, [r9, #0x10]
        add     r2, r2, r1
        strh    r2, [r5, #0x10]
        add     r1, r7, r1
        strh    r1, [r4, #0x10]
        ldr     r2, [sp, #0xDC]
        strh    r3, [r9, #0x12]
        mov     r1, #0xCD
        add     r2, r10, r2, asr #16
        strh    r2, [r5, #0x12]
        add     r10, r3, r10
        strh    r10, [r4, #0x12]
        mov     r2, #0xA
        bl      ReorderLsf
        mov     r1, #0xCD
        mov     r0, r4
        mov     r2, #0xA
        bl      ReorderLsf
        ldr     r6, [sp, #0x5C]
        mov     r0, r5
        mov     r1, r6
        bl      _ippsLSFToLSP_GSMAMR_16s
        add     r1, r6, #0x14
        mov     r0, r4
        bl      _ippsLSFToLSP_GSMAMR_16s
        mov     r0, #0
        add     sp, sp, #0x89, 30
        ldmia   sp!, {r4 - r11, pc}
LDOT9:
        ldr     r2, [sp, #0x70]
        ldr     r1, [pc, #-0xDCC]
        mov     r0, r6
        mov     r3, #2, 24
        bl      ownQuantDim3SubVeq
        strh    r0, [r8]
        mov     r12, #0
        str     r12, [sp]
        ldr     r0, [sp, #0x58]
        ldr     r1, [pc, #-0xE10]
        mov     r3, #2, 24
        mov     r2, r7
        bl      ownQuantDim3SubVeq
        strh    r0, [r8, #2]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [pc, #-0xE20]
        mov     r3, #2, 24
        mov     r2, r4
        bl      ownQuantDim4SubVeq
        strh    r0, [r8, #4]
        b       LDOT3
LDOT10:
        mvn     r0, #7
        add     sp, sp, #0x89, 30
        ldmia   sp!, {r4 - r11, pc}
LDOT_ownQuantDim4SigSubVeq:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r7, [sp, #0x64]
        ldr     lr, [sp, #0x60]
        cmp     r7, #0
        mov     r12, #0
        movle   r10, r12
        movle   r8, r10
        ble     LDOT14
        ldrsh   r4, [r0]
        mov     r10, r12
        mov     r8, r10
        str     r4, [sp, #8]
        ldrsh   r4, [r0, #2]
        mvn     r6, #2, 2
        add     r5, r2, #6
        str     r4, [sp, #4]
        ldrsh   r4, [r1]
        mov     r11, r2
        str     r4, [sp]
        ldrsh   r4, [r3]
        ldrsh   r9, [r1, #2]
        str     r4, [sp, #0xC]
        ldrsh   r3, [r3, #2]
        add     r4, r2, #4
        str     r3, [sp, #0x10]
        ldrsh   r3, [lr]
        str     r3, [sp, #0x14]
        ldrsh   r3, [lr, #2]
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x30]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #8]
        add     lr, r2, #2
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x34]
        str     r7, [sp, #0x2C]
        str     r2, [sp, #0x20]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
LDOT11:
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0xC]
        ldrsh   r0, [r1], #8
        str     r0, [sp, #0x38]
        ldrsh   r9, [lr], #8
        ldrsh   r8, [r4], #8
        ldrsh   r7, [r5], #8
        sub     r0, r11, r0
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #4]
        mov     r0, r0, lsl #16
        sub     r1, r1, r9
        mov     r0, r0, asr #16
        mul     r0, r2, r0
        ldr     r2, [sp, #0x10]
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mul     r1, r2, r1
        mov     r2, r0, asr #15
        ldr     r0, [sp]
        mov     r2, r2, lsl #16
        mov     r1, r1, asr #15
        mov     r2, r2, asr #16
        mul     r2, r2, r2
        mov     r1, r1, lsl #16
        sub     r0, r0, r8
        mov     r1, r1, asr #16
        mla     r2, r1, r1, r2
        ldr     r1, [sp, #0x34]
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r0, r10, r0
        sub     r1, r1, r7
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mul     r1, r3, r1
        mov     r0, r0, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mla     r2, r0, r0, r2
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mla     r2, r1, r1, r2
        cmp     r2, r6
        bge     LDOT12
        mov     r6, r2
        mov     r0, #0
        str     r12, [sp, #0x24]
        str     r0, [sp, #0x28]
LDOT12:
        ldr     r0, [sp, #0x38]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #4]
        add     r0, r11, r0
        mov     r0, r0, lsl #16
        add     r9, r1, r9
        mov     r0, r0, asr #16
        mul     r0, r2, r0
        ldr     r2, [sp, #0x10]
        mov     r1, r9, lsl #16
        mov     r1, r1, asr #16
        mul     r2, r2, r1
        ldr     r1, [sp]
        add     r8, r1, r8
        mov     r1, r0, asr #15
        mov     r2, r2, asr #15
        mov     r0, r8, lsl #16
        mov     r1, r1, lsl #16
        ldr     r8, [sp, #0x34]
        mov     r0, r0, asr #16
        mul     r0, r10, r0
        mov     r1, r1, asr #16
        mul     r1, r1, r1
        mov     r2, r2, lsl #16
        add     r7, r8, r7
        mov     r0, r0, asr #15
        mov     r2, r2, asr #16
        mla     r1, r2, r2, r1
        mov     r7, r7, lsl #16
        mov     r0, r0, lsl #16
        mov     r7, r7, asr #16
        mul     r2, r3, r7
        mov     r0, r0, asr #16
        mla     r1, r0, r0, r1
        mov     r2, r2, asr #15
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        mla     r1, r2, r2, r1
        cmp     r1, r6
        bge     LDOT13
        mov     r6, r1
        mov     r0, #1
        str     r12, [sp, #0x24]
        str     r0, [sp, #0x28]
LDOT13:
        ldr     r0, [sp, #0x2C]
        add     r12, r12, #1
        cmp     r12, r0
        blt     LDOT11
        ldr     r10, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r2, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
LDOT14:
        mov     r10, r10, lsl #16
        cmp     r8, #0
        mov     r3, r10, asr #16
        mov     lr, r3, lsl #3
        ldrsh   r12, [r2, +lr]
        add     r2, r2, lr
        bne     LDOT15
        strh    r12, [r0]
        ldrsh   r12, [r2, #2]
        strh    r12, [r0, #2]
        ldrsh   r0, [r2, #4]
        strh    r0, [r1]
        ldrsh   r2, [r2, #6]
        b       LDOT16
LDOT15:
        rsb     r12, r12, #0
        strh    r12, [r0]
        ldrsh   r12, [r2, #2]
        rsb     r12, r12, #0
        strh    r12, [r0, #2]
        ldrsh   r0, [r2, #4]
        rsb     r0, r0, #0
        strh    r0, [r1]
        ldrsh   r2, [r2, #6]
        rsb     r2, r2, #0
LDOT16:
        add     r3, r8, r3, lsl #1
        strh    r2, [r1, #2]
        mov     r3, r3, lsl #16
        mov     r0, r3, asr #16
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LDOT_TablePredFac:
        .byte   0x54,0x25,0x11,0x2A,0x1B,0x31,0xEC,0x33,0x2D,0x38,0x83,0x2D,0x5C,0x29,0x27,0x26
        .byte   0x91,0x21,0x54,0x19
LDOT_TableMeanLsf1:
        .byte   0x68,0x05,0x1D,0x08,0x5C,0x0D,0xF4,0x13,0x56,0x1A,0xBA,0x1F,0x87,0x26,0x54,0x2B
        .byte   0xAA,0x31,0x85,0x35


