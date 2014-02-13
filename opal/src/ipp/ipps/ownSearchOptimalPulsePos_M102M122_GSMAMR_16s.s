        .text
        .align  4
        .globl  ownSearchOptimalPulsePos_M102M122_GSMAMR_16s


ownSearchOptimalPulsePos_M102M122_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB3, 30
        ldr     r11, [sp, #0x2F0]
        ldr     r9, [sp, #0x2F4]
        ldr     r8, [sp, #0x2F8]
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x2FC]
        add     lr, sp, #0xA5, 30
        add     r6, sp, #0x97, 30
        str     r3, [sp]
        and     r3, lr, #0xF
        add     r7, sp, #0x6B, 30
        add     r12, sp, #0xFC
        and     r6, r6, #0xF
        rsb     r3, r3, #0
        and     lr, r12, #0xF
        and     r7, r7, #0xF
        and     r12, r3, #0xF
        rsb     r6, r6, #0
        rsb     r7, r7, #0
        and     r3, r6, #0xF
        and     r6, r7, #0xF
        add     r7, sp, #0xA5, 30
        add     r12, r7, r12
        str     r12, [sp, #0x24]
        add     r12, sp, #0x97, 30
        add     r3, r12, r3
        str     r3, [sp, #0x2C]
        rsb     lr, lr, #0
        add     r3, sp, #0x6B, 30
        and     lr, lr, #0xF
        add     r7, r3, r6
        add     r3, sp, #0xFC
        str     r1, [sp, #4]
        add     lr, r3, lr
        mov     r4, r0
        str     lr, [sp, #0x30]
        mov     r0, #0x28
        mov     r5, r2
        bl      __intel_idiv
        cmp     r4, #0xA
        str     r0, [sp, #0x20]
        beq     LDMR48
        mov     r0, #0
        mov     r10, r0
        add     r6, r7, #0x28
        add     lr, r7, #0x50
        add     r12, r7, #0x78
        mov     r3, r7
        mov     r1, r11
        str     r11, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r4, [sp, #0x40]
LDMR0:
        ldr     r5, [r1, +r10, lsl #2]
        add     r11, r1, r0
        ldr     r2, [r11, #0xA4]
        ldr     r4, [r11, #0x148]
        str     r5, [r3], #4
        ldr     r11, [r11, #0x1EC]
        str     r2, [r6], #4
        str     r4, [lr], #4
        add     r10, r10, #4
        str     r11, [r12], #4
        cmp     r10, #0x28
        add     r1, r1, #0xA, 26
        add     r0, r0, #0x10
        blt     LDMR0
        ldr     r11, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        mov     r10, #0
LDMR1:
        ldrsh   r1, [r9]
        ldr     r0, [pc, #0xF18]
        mov     r2, r4
        mov     r1, r1, lsl #1
        ldrsh   r6, [r8, +r1]
        ldr     r1, [sp]
        bl      _ippsCopy_16s
        cmp     r5, #1
        ble     LDMR44
        mov     r1, r4, lsl #1
        sub     r0, r4, #2
        add     lr, r6, r6, lsl #2
        sub     r1, r1, #2
        mvn     r12, #0
        mvn     r3, #0xFF
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x10]
        str     r12, [sp, #0x18]
        add     r1, r11, lr, lsl #5
        mov     r0, r6, lsl #1
        sub     r5, r5, #1
        mov     r12, #1
        add     lr, r11, r6, lsl #2
        bic     r3, r3, #0x7F, 24
        str     r5, [sp, #0x70]
        str     r6, [sp, #0x84]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x28]
        str     r12, [sp, #0x14]
        str     r0, [sp, #0xC]
        sub     r12, r4, #6
        sub     r0, r9, #2
        mvn     r3, r3
        str     r0, [sp, #8]
        str     r10, [sp, #0x50]
        str     r3, [sp, #0x74]
        str     lr, [sp, #0x78]
        str     r12, [sp, #0x80]
        str     r7, [sp, #0x88]
        str     r8, [sp, #0x8C]
        str     r11, [sp, #0x38]
        str     r4, [sp, #0x40]
LDMR2:
        ldrsh   r0, [r9, #2]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x78]
        str     r0, [sp, #0x6C]
        mov     r0, r0, lsl #1
        ldrsh   r10, [r6, +r2]
        ldr     r2, [sp, #0x84]
        ldr     r4, [r1, +r2, lsl #2]
        ldr     r2, [sp, #0x8C]
        ldrsh   r12, [r2, +r0]
        str     r12, [sp, #0x68]
        ldrsh   r0, [r9, #6]
        add     lr, r12, r12, lsl #2
        str     r0, [sp, #0x60]
        ldrsh   r2, [r9, #4]
        mul     r7, r5, r0
        str     r2, [sp, #0x64]
        ldr     r3, [r3, +lr, lsl #5]
        mul     r8, r2, r5
        str     r7, [sp, #0xDC]
        mov     r7, r12, lsl #1
        ldrsh   r11, [r6, +r7]
        ldr     r7, [sp, #0x38]
        mov     r3, r3, lsl #13
        cmp     r0, #0x28
        add     lr, r7, lr, lsl #5
        ldr     r12, [lr, +r12, lsl #2]
        sub     r7, r2, r0
        add     r11, r10, r11
        mov     r7, r7, lsl #16
        add     r12, r4, r12
        mov     r11, r11, lsl #16
        str     r11, [sp, #0xA4]
        add     r12, r3, r12, lsl #12
        str     r12, [sp, #0xAC]
        ldr     r3, [sp, #0x88]
        ldr     r12, [sp, #0xDC]
        mov     r7, r7, asr #16
        add     r8, r3, r8, lsl #2
        str     r8, [sp, #0xB0]
        add     r12, r3, r12, lsl #2
        str     r12, [sp, #0xB4]
        bge     LDMR4
        ldr     r3, [sp, #0x60]
        add     r8, r1, r7, lsl #2
        str     r8, [sp, #0xD0]
        ldr     r8, [sp, #0xB0]
        add     r4, r6, r7, lsl #1
        add     r7, lr, r7, lsl #2
        mov     r12, #0
        str     r7, [sp, #0xD4]
        str     r4, [sp, #0xCC]
        str     r0, [sp, #0x94]
        str     r2, [sp, #0x98]
        str     r9, [sp, #0x34]
LDMR3:
        ldr     r2, [sp, #0xD4]
        ldr     r6, [lr, +r3, lsl #2]
        mov     r0, r12, lsl #16
        ldr     r5, [r1, +r3, lsl #2]
        ldr     r9, [r2, +r3, lsl #2]
        mov     r4, r0, asr #16
        ldr     r0, [sp, #0xD0]
        ldr     r7, [r8, +r4, lsl #2]
        mov     r10, r6, lsl #13
        ldr     r6, [sp, #0xCC]
        ldr     r2, [r0, +r3, lsl #2]
        ldr     r0, [sp, #0xB4]
        add     r5, r10, r5, lsl #13
        mvn     r10, #0xFF
        mov     r11, r3, lsl #1
        ldr     r0, [r0, +r4, lsl #2]
        ldrsh   r6, [r6, +r11]
        ldr     r11, [sp, #4]
        bic     r10, r10, #0x7F, 24
        add     r0, r5, r0, lsl #12
        mvn     r10, r10
        add     r0, r0, #1, 18
        mov     r9, r9, lsl #13
        add     r2, r9, r2, lsl #13
        add     r7, r2, r7, lsl #12
        ldr     r2, [sp, #0xA4]
        bic     r10, r0, r10
        ldr     r0, [sp, #0xAC]
        add     r3, r11, r3
        add     r6, r6, r2, asr #16
        mov     r3, r3, lsl #16
        add     r7, r0, r7
        ldr     r0, [sp, #0x30]
        mov     r3, r3, asr #16
        cmp     r3, #0x28
        add     r12, r12, #1
        str     r6, [r0, +r4, lsl #2]
        ldr     r0, [sp, #0x24]
        str     r10, [r0, +r4, lsl #2]
        ldr     r0, [sp, #0x2C]
        str     r7, [r0, +r4, lsl #2]
        blt     LDMR3
        ldr     r0, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
        ldr     r6, [sp, #0x28]
LDMR4:
        cmp     r2, #0x28
        bge     LDMR47
        mov     r3, #0
        str     r3, [sp, #0xA4]
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x30]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        ldr     r8, [sp, #4]
        mvn     r7, #0
        mov     r4, #1
        str     r4, [sp, #0xA0]
        str     r7, [sp, #0x9C]
        str     lr, [sp, #0xA8]
        str     r1, [sp, #0x7C]
        str     r9, [sp, #0x34]
LDMR5:
        add     r1, r2, r2, lsl #2
        cmp     r0, #0x28
        add     lr, r11, r1, lsl #5
        mov     r1, r0
        bge     LDMR10
        ldr     r7, [r3]
        ldr     r5, [r12]
        str     r3, [sp, #0x5C]
        str     r0, [sp, #0x94]
        str     r2, [sp, #0x98]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x74]
        mvn     r9, #0
        mov     r4, r10
        str     r9, [sp, #0x58]
        str     r12, [sp, #0x90]
LDMR6:
        ldr     r10, [r4], #4
        ldr     r9, [lr, +r1, lsl #2]
        mov     r12, r1, lsl #1
        ldrsh   r12, [r6, +r12]
        add     r10, r7, r10
        add     r10, r9, r10, asr #13
        add     r9, r10, #4
        add     r10, r5, r12
        mov     r12, r9, asr #3
        cmp     r3, r12
        mov     r10, r10, lsl #16
        mov     r9, r10, asr #16
        blt     LDMR7
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDMR8
LDMR7:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDMR8:
        mul     r9, r9, r9
        rsb     r10, r2, #0
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mul     r11, r0, r9
        mla     r11, r10, r12, r11
        cmp     r11, #0
        ble     LDMR9
        mov     r2, r9
        str     r1, [sp, #0x58]
        mov     r0, r12
LDMR9:
        add     r1, r8, r1
        cmp     r1, #0x28
        blt     LDMR6
        ldr     r9, [sp, #0x58]
        str     r0, [sp, #0xA0]
        str     r2, [sp, #0x9C]
        ldr     r3, [sp, #0x5C]
        ldr     r12, [sp, #0x90]
        ldr     r0, [sp, #0x94]
        ldr     r2, [sp, #0x98]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        cmp     r9, #0
        blt     LDMR10
        mov     r1, r9, lsl #1
        ldrsh   lr, [r6, +r1]
        mov     r1, r2, lsl #16
        mov     r9, r9, lsl #16
        add     lr, r5, lr
        mov     r1, r1, asr #16
        str     r1, [sp, #0x64]
        mov     lr, lr, lsl #16
        mov     r9, r9, asr #16
        mov     r1, lr, asr #16
        str     r9, [sp, #0x60]
        str     r1, [sp, #0xA4]
LDMR10:
        add     r2, r8, r2
        cmp     r2, #0x28
        add     r3, r3, #4
        add     r12, r12, #4
        blt     LDMR5
        ldr     r4, [sp, #0xA0]
        ldr     lr, [sp, #0xA8]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
LDMR11:
        ldrsh   r7, [r9, #0xA]
        ldrsh   r8, [r9, #8]
        ldr     r12, [sp, #0x64]
        mov     r0, r7
        mul     r2, r5, r0
        ldr     r11, [sp, #0x88]
        mov     r4, r4, lsl #15
        str     r4, [sp, #0xBC]
        ldr     r4, [sp, #0x60]
        str     r2, [sp, #0xDC]
        mov     r2, r8
        mul     r10, r5, r2
        sub     r3, r2, r0
        add     r12, r12, r12, lsl #2
        add     r4, r4, r4, lsl #2
        add     r10, r11, r10, lsl #2
        str     r10, [sp, #0xB8]
        ldr     r10, [sp, #0xDC]
        mov     r3, r3, lsl #16
        cmp     r0, #0x28
        add     r10, r11, r10, lsl #2
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x38]
        add     r12, r10, r12, lsl #5
        add     r4, r10, r4, lsl #5
        mov     r10, r3, asr #16
        bge     LDMR13
        add     r11, r6, r10, lsl #1
        str     r11, [sp, #0x94]
        add     r11, r12, r10, lsl #2
        str     r11, [sp, #0x90]
        add     r11, r4, r10, lsl #2
        mov     r3, #0
        str     r3, [sp, #0x98]
        str     r11, [sp, #0x54]
        str     r8, [sp, #0x5C]
        ldr     r8, [sp, #0x98]
        add     r11, r1, r10, lsl #2
        add     r10, lr, r10, lsl #2
        mov     r3, r7
        str     r11, [sp, #0x4C]
        str     r7, [sp, #0x58]
        str     r10, [sp, #0xB4]
        str     r4, [sp, #0xAC]
        str     r0, [sp, #0xA0]
        str     r2, [sp, #0x9C]
        str     lr, [sp, #0xA8]
        str     r1, [sp, #0x7C]
        str     r9, [sp, #0x34]
LDMR12:
        ldr     r1, [sp, #0x7C]
        mov     r0, r8, lsl #16
        ldr     r7, [r12, +r3, lsl #2]
        ldr     r11, [r1, +r3, lsl #2]
        mov     r6, r0, asr #16
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x4C]
        ldr     r2, [sp, #0x90]
        ldr     lr, [sp, #0xB8]
        ldr     r9, [r0, +r6, lsl #2]
        ldr     r5, [r1, +r3, lsl #2]
        ldr     r4, [r2, +r3, lsl #2]
        ldr     r0, [sp, #0xA8]
        ldr     r1, [sp, #0xB4]
        ldr     r2, [sp, #0x54]
        ldr     r10, [r0, +r3, lsl #2]
        ldr     r0, [sp, #0xAC]
        ldr     r1, [r1, +r3, lsl #2]
        ldr     r2, [r2, +r3, lsl #2]
        ldr     lr, [lr, +r6, lsl #2]
        ldr     r0, [r0, +r3, lsl #2]
        add     r5, r5, r1
        add     r2, r4, r2
        ldr     r4, [sp, #4]
        add     r9, r11, r9, asr #1
        add     r10, r9, r10
        ldr     r9, [sp, #0x94]
        mvn     r1, #0xFF, 12
        add     r5, r5, r2
        add     r7, r7, r0
        add     r10, r10, r7
        bic     r2, r1, #0x3F, 4
        mov     lr, lr, lsl #11
        add     r1, lr, r5, lsl #12
        ldr     lr, [sp, #0xBC]
        add     r10, r10, #2
        and     r10, r10, r2
        ldr     r2, [sp, #0xA4]
        mov     r0, r3, lsl #1
        ldrsh   r0, [r9, +r0]
        add     r1, lr, r1
        ldr     lr, [sp, #0x30]
        add     r3, r4, r3
        add     r2, r2, r0
        mov     r3, r3, lsl #16
        str     r2, [lr, +r6, lsl #2]
        ldr     r2, [sp, #0x24]
        mov     r0, r10, lsl #12
        mov     r3, r3, asr #16
        str     r0, [r2, +r6, lsl #2]
        ldr     r0, [sp, #0x2C]
        cmp     r3, #0x28
        add     r8, r8, #1
        str     r1, [r0, +r6, lsl #2]
        blt     LDMR12
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r4, [sp, #0xAC]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0x9C]
        ldr     lr, [sp, #0xA8]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
        ldr     r6, [sp, #0x28]
LDMR13:
        cmp     r2, #0x28
        bge     LDMR46
        ldr     r10, [sp, #0x2C]
        ldr     r5, [sp, #4]
        mvn     r11, #0
        str     r10, [sp, #0xB4]
        ldr     r10, [sp, #0x30]
        mov     r3, #0
        str     r8, [sp, #0x5C]
        str     r11, [sp, #0xCC]
        str     r9, [sp, #0x34]
        ldr     r8, [sp, #0xB4]
        ldr     r9, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        str     r3, [sp, #0xD8]
        mov     r3, #1
        str     r3, [sp, #0xC8]
        str     r7, [sp, #0x58]
        str     r4, [sp, #0xAC]
        str     r12, [sp, #0xB0]
        str     lr, [sp, #0xA8]
        str     r1, [sp, #0x7C]
LDMR14:
        add     r1, r2, r2, lsl #2
        cmp     r0, #0x28
        add     r3, r11, r1, lsl #5
        mov     r1, r0
        bge     LDMR19
        ldr     r4, [r8]
        ldr     lr, [r10]
        mvn     r7, #0
        str     r7, [sp, #0xD4]
        str     r0, [sp, #0xA0]
        str     r2, [sp, #0x9C]
        ldr     r0, [sp, #0xC8]
        ldr     r2, [sp, #0xCC]
        ldr     r7, [sp, #0x74]
        mov     r12, r9
        str     r8, [sp, #0xB4]
        str     r10, [sp, #0xD0]
LDMR15:
        ldr     r10, [r12], #4
        ldr     r9, [r3, +r1, lsl #2]
        mov     r8, r1, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r10, r4, r10
        add     r10, r9, r10, asr #12
        add     r9, lr, r8
        add     r10, r10, #8
        mov     r8, r10, asr #4
        mov     r9, r9, lsl #16
        cmp     r7, r8
        mov     r9, r9, asr #16
        blt     LDMR16
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDMR17
LDMR16:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDMR17:
        mul     r9, r9, r9
        rsb     r10, r2, #0
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mul     r11, r0, r9
        mla     r11, r10, r8, r11
        cmp     r11, #0
        ble     LDMR18
        mov     r2, r9
        str     r1, [sp, #0xD4]
        mov     r0, r8
LDMR18:
        add     r1, r5, r1
        cmp     r1, #0x28
        blt     LDMR15
        ldr     r7, [sp, #0xD4]
        str     r0, [sp, #0xC8]
        str     r2, [sp, #0xCC]
        ldr     r8, [sp, #0xB4]
        ldr     r10, [sp, #0xD0]
        ldr     r0, [sp, #0xA0]
        ldr     r2, [sp, #0x9C]
        ldr     r9, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        cmp     r7, #0
        blt     LDMR19
        mov     r1, r7, lsl #1
        ldrsh   r3, [r6, +r1]
        mov     r1, r2, lsl #16
        mov     r7, r7, lsl #16
        add     r3, lr, r3
        mov     r1, r1, asr #16
        str     r1, [sp, #0x5C]
        mov     r3, r3, lsl #16
        mov     r7, r7, asr #16
        mov     r3, r3, asr #16
        str     r7, [sp, #0x58]
        str     r3, [sp, #0xD8]
LDMR19:
        add     r2, r5, r2
        cmp     r2, #0x28
        add     r8, r8, #4
        add     r10, r10, #4
        blt     LDMR14
        ldr     r3, [sp, #0xC8]
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r4, [sp, #0xAC]
        ldr     r12, [sp, #0xB0]
        ldr     lr, [sp, #0xA8]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
LDMR20:
        ldrsh   r0, [r9, #0xE]
        ldrsh   r2, [r9, #0xC]
        mov     r3, r3, lsl #15
        str     r3, [sp, #0xC4]
        mul     r3, r5, r0
        add     r10, r8, r8, lsl #2
        str     r10, [sp, #0xD0]
        str     r3, [sp, #0xDC]
        mul     r3, r5, r2
        add     r10, r7, r7, lsl #2
        str     r10, [sp, #0xCC]
        ldr     r10, [sp, #0x88]
        str     r3, [sp, #0xD4]
        ldr     r11, [sp, #0xD4]
        str     r0, [sp, #0x94]
        str     r2, [sp, #0x98]
        add     r11, r10, r11, lsl #2
        str     r11, [sp, #0xC0]
        ldr     r11, [sp, #0xDC]
        sub     r3, r2, r0
        cmp     r0, #0x28
        add     r11, r10, r11, lsl #2
        str     r11, [sp, #0xBC]
        ldr     r11, [sp, #0xD0]
        ldr     r10, [sp, #0x38]
        mov     r3, r3, lsl #16
        add     r11, r10, r11, lsl #5
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #0xCC]
        add     r11, r10, r11, lsl #5
        str     r11, [sp, #0xA0]
        mov     r10, r3, asr #16
        bge     LDMR22
        add     r11, r6, r10, lsl #1
        str     r11, [sp, #0xA4]
        ldr     r11, [sp, #0x9C]
        str     r0, [sp, #0xB4]
        mov     r3, #0
        add     r11, r11, r10, lsl #2
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0xA0]
        str     r0, [sp, #0x90]
        str     r2, [sp, #0x3C]
        add     r11, r11, r10, lsl #2
        str     r11, [sp, #0x4C]
        add     r11, r12, r10, lsl #2
        str     r11, [sp, #0x48]
        add     r11, r4, r10, lsl #2
        str     r11, [sp, #0x44]
        ldr     r2, [sp, #0xB4]
        add     r11, r1, r10, lsl #2
        add     r10, lr, r10, lsl #2
        str     r11, [sp, #0xB8]
        str     r10, [sp, #0xD4]
        str     r7, [sp, #0x58]
        str     r8, [sp, #0x5C]
        str     r4, [sp, #0xAC]
        str     r12, [sp, #0xB0]
        str     lr, [sp, #0xA8]
        str     r1, [sp, #0x7C]
        str     r9, [sp, #0x34]
LDMR21:
        ldr     r0, [sp, #0x7C]
        ldr     lr, [sp, #0xAC]
        ldr     r12, [sp, #0xB0]
        ldr     r1, [r0, +r2, lsl #2]
        ldr     r0, [sp, #0xA8]
        ldr     lr, [lr, +r2, lsl #2]
        ldr     r12, [r12, +r2, lsl #2]
        ldr     r0, [r0, +r2, lsl #2]
        ldr     r4, [sp, #0xB8]
        str     lr, [sp, #0xDC]
        ldr     lr, [sp, #0x9C]
        ldr     r5, [sp, #0xD4]
        ldr     r6, [sp, #0x48]
        ldr     r7, [sp, #0x44]
        ldr     lr, [lr, +r2, lsl #2]
        ldr     r8, [sp, #0x54]
        ldr     r9, [sp, #0x4C]
        mov     r11, r3, lsl #16
        str     lr, [sp, #0xD0]
        ldr     lr, [sp, #0xA0]
        ldr     r4, [r4, +r2, lsl #2]
        ldr     r5, [r5, +r2, lsl #2]
        ldr     lr, [lr, +r2, lsl #2]
        ldr     r6, [r6, +r2, lsl #2]
        ldr     r7, [r7, +r2, lsl #2]
        ldr     r8, [r8, +r2, lsl #2]
        ldr     r9, [r9, +r2, lsl #2]
        add     r10, r1, r0
        mov     r1, r11, asr #16
        ldr     r11, [sp, #0xC0]
        ldr     r0, [sp, #0xBC]
        add     r5, r4, r5
        add     r7, r6, r7
        ldr     r11, [r11, +r1, lsl #2]
        ldr     r0, [r0, +r1, lsl #2]
        mov     r4, r2, lsl #1
        add     r5, r5, r7
        str     r11, [sp, #0xCC]
        ldr     r11, [sp, #0xDC]
        add     r9, r8, r9
        add     r5, r5, r9
        add     r11, r12, r11
        ldr     r12, [sp, #0xD0]
        add     r10, r10, r11
        add     r3, r3, #1
        add     lr, r12, lr
        add     r12, r10, lr
        ldr     lr, [sp, #0xA4]
        add     r12, r12, r0, asr #1
        mvn     r0, #0xFE, 12
        add     r12, r12, #4
        ldrsh   lr, [lr, +r4]
        ldr     r4, [sp, #4]
        bic     r0, r0, #0x7F, 4
        and     r12, r12, r0
        ldr     r0, [sp, #0xD8]
        add     r2, r4, r2
        ldr     r4, [sp, #0xCC]
        mov     r2, r2, lsl #16
        add     lr, r0, lr
        ldr     r0, [sp, #0xC4]
        mov     r4, r4, lsl #10
        add     r5, r4, r5, lsl #11
        mov     r2, r2, asr #16
        add     r5, r0, r5
        ldr     r0, [sp, #0x30]
        mov     r12, r12, lsl #11
        cmp     r2, #0x28
        str     lr, [r0, +r1, lsl #2]
        ldr     r0, [sp, #0x24]
        str     r12, [r0, +r1, lsl #2]
        ldr     r0, [sp, #0x2C]
        str     r5, [r0, +r1, lsl #2]
        blt     LDMR21
        ldr     r0, [sp, #0x90]
        ldr     r2, [sp, #0x3C]
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r4, [sp, #0xAC]
        ldr     r12, [sp, #0xB0]
        ldr     lr, [sp, #0xA8]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
        ldr     r6, [sp, #0x28]
LDMR22:
        ldr     r3, [sp, #0x98]
        cmp     r3, #0x28
        bge     LDMR45
        mov     r3, #0
        str     r3, [sp, #0xA4]
        ldr     r3, [sp, #0x2C]
        mvn     r11, #0
        mov     r10, #1
        str     r3, [sp, #0x48]
        ldr     r3, [sp, #0x30]
        str     r10, [sp, #0x44]
        str     r11, [sp, #0x54]
        str     r7, [sp, #0x58]
        str     r8, [sp, #0x5C]
        str     r4, [sp, #0xAC]
        str     r9, [sp, #0x34]
        ldr     r7, [sp, #0x48]
        ldr     r8, [sp, #0x94]
        ldr     r9, [sp, #0x98]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        ldr     r4, [sp, #4]
        str     r0, [sp, #0x90]
        str     r2, [sp, #0x3C]
        str     r12, [sp, #0xB0]
        str     lr, [sp, #0xA8]
        str     r1, [sp, #0x7C]
LDMR23:
        add     r0, r9, r9, lsl #2
        cmp     r8, #0x28
        add     r1, r11, r0, lsl #5
        mov     r0, r8
        bge     LDMR28
        ldr     lr, [r7]
        ldr     r12, [r3]
        mvn     r5, #0
        str     r5, [sp, #0xB4]
        str     r7, [sp, #0x48]
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x44]
        ldr     r5, [sp, #0x54]
        ldr     r7, [sp, #0x74]
        mov     r2, r10
        str     r9, [sp, #0x98]
LDMR24:
        ldr     r10, [r2], #4
        ldr     r9, [r1, +r0, lsl #2]
        mov     r8, r0, lsl #1
        ldrsh   r8, [r6, +r8]
        add     r10, lr, r10
        add     r10, r9, r10, asr #11
        add     r9, r10, #0x10
        add     r10, r12, r8
        mov     r8, r9, asr #5
        cmp     r7, r8
        mov     r10, r10, lsl #16
        mov     r9, r10, asr #16
        blt     LDMR25
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
        b       LDMR26
LDMR25:
        mvn     r8, #0xFF
        bic     r8, r8, #0x7F, 24
        mvn     r8, r8
LDMR26:
        mul     r9, r9, r9
        rsb     r10, r5, #0
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mul     r11, r3, r9
        mla     r11, r10, r8, r11
        cmp     r11, #0
        ble     LDMR27
        mov     r5, r9
        mov     r3, r8
        str     r0, [sp, #0xB4]
LDMR27:
        add     r0, r4, r0
        cmp     r0, #0x28
        blt     LDMR24
        str     r5, [sp, #0x54]
        ldr     r5, [sp, #0xB4]
        str     r3, [sp, #0x44]
        ldr     r7, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        ldr     r8, [sp, #0x94]
        ldr     r9, [sp, #0x98]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        cmp     r5, #0
        blt     LDMR28
        mov     r0, r5, lsl #1
        ldrsh   r1, [r6, +r0]
        mov     r0, r9, lsl #16
        mov     r5, r5, lsl #16
        add     r1, r12, r1
        mov     r0, r0, asr #16
        str     r0, [sp, #0x3C]
        mov     r1, r1, lsl #16
        mov     r5, r5, asr #16
        mov     r0, r1, asr #16
        str     r5, [sp, #0x90]
        str     r0, [sp, #0xA4]
LDMR28:
        add     r9, r4, r9
        cmp     r9, #0x28
        add     r7, r7, #4
        add     r3, r3, #4
        blt     LDMR23
        ldr     r10, [sp, #0x44]
        ldr     r0, [sp, #0x90]
        ldr     r2, [sp, #0x3C]
        ldr     r11, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r4, [sp, #0xAC]
        ldr     r12, [sp, #0xB0]
        ldr     lr, [sp, #0xA8]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
LDMR29:
        ldr     r3, [sp, #0x50]
        cmp     r3, #0
        str     r2, [sp, #0x4C]
        str     r0, [sp, #0x48]
        beq     LDMR38
        ldrsh   r11, [r9, #0x10]
        ldrsh   r3, [r9, #0x12]
        add     r2, r2, r2, lsl #2
        str     r2, [sp, #0xD8]
        mul     r2, r5, r11
        mov     r10, r10, lsl #15
        str     r10, [sp, #0xD4]
        mul     r10, r5, r3
        str     r2, [sp, #0xD0]
        str     r11, [sp, #0x94]
        sub     r11, r11, r3
        add     r2, r0, r0, lsl #2
        str     r10, [sp, #0xDC]
        mov     r0, r11, lsl #16
        ldr     r11, [sp, #0xD0]
        ldr     r10, [sp, #0x88]
        cmp     r3, #0x28
        add     r11, r10, r11, lsl #2
        str     r11, [sp, #0xD0]
        ldr     r11, [sp, #0xDC]
        add     r11, r10, r11, lsl #2
        str     r11, [sp, #0xCC]
        ldr     r11, [sp, #0xD8]
        ldr     r10, [sp, #0x38]
        add     r11, r10, r11, lsl #5
        str     r11, [sp, #0xB4]
        add     r2, r10, r2, lsl #5
        mov     r10, r0, asr #16
        bge     LDMR31
        add     r11, r6, r10, lsl #1
        str     r11, [sp, #0xC0]
        ldr     r11, [sp, #0xB4]
        str     r3, [sp, #0xC4]
        mov     r0, #0
        add     r11, r11, r10, lsl #2
        str     r11, [sp, #0xBC]
        add     r11, r2, r10, lsl #2
        str     r11, [sp, #0xB8]
        ldr     r11, [sp, #0x9C]
        str     r2, [sp, #0xDC]
        str     r3, [sp, #0x98]
        add     r11, r11, r10, lsl #2
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0xA0]
        str     r7, [sp, #0x58]
        str     r8, [sp, #0x5C]
        add     r11, r11, r10, lsl #2
        str     r11, [sp, #0x54]
        add     r11, r12, r10, lsl #2
        str     r11, [sp, #0x44]
        add     r11, r4, r10, lsl #2
        str     r11, [sp, #0x3C]
        add     r11, r1, r10, lsl #2
        add     r10, lr, r10, lsl #2
        str     lr, [sp, #0xA8]
        ldr     lr, [sp, #0xC4]
        str     r11, [sp, #0xC8]
        str     r10, [sp, #0xD8]
        str     r4, [sp, #0xAC]
        str     r12, [sp, #0xB0]
        str     r1, [sp, #0x7C]
        str     r9, [sp, #0x34]
LDMR30:
        ldr     r1, [sp, #0x7C]
        mov     r11, r0, lsl #16
        add     r0, r0, #1
        ldr     r6, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xA8]
        ldr     r5, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xB0]
        ldr     r7, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xAC]
        add     r10, r6, r5
        ldr     r6, [sp, #0xCC]
        ldr     r1, [r1, +lr, lsl #2]
        mov     r5, r11, asr #16
        ldr     r11, [sp, #0xD0]
        str     r1, [sp, #0xE0]
        ldr     r1, [sp, #0x9C]
        ldr     r1, [r1, +lr, lsl #2]
        str     r1, [sp, #0xE4]
        ldr     r1, [sp, #0xA0]
        ldr     r8, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xB4]
        ldr     r1, [r1, +lr, lsl #2]
        str     r1, [sp, #0xE8]
        ldr     r1, [sp, #0xDC]
        ldr     r9, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xC8]
        ldr     r1, [r1, +lr, lsl #2]
        str     r1, [sp, #0xEC]
        ldr     r1, [sp, #0xD8]
        ldr     r1, [r1, +lr, lsl #2]
        str     r1, [sp, #0xF0]
        ldr     r1, [sp, #0x44]
        ldr     r1, [r1, +lr, lsl #2]
        str     r1, [sp, #0xF4]
        ldr     r1, [sp, #0x3C]
        ldr     r6, [r6, +r5, lsl #2]
        ldr     r11, [r11, +r5, lsl #2]
        ldr     r12, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0x90]
        ldr     r2, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0x54]
        ldr     r3, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xBC]
        ldr     r4, [r1, +lr, lsl #2]
        ldr     r1, [sp, #0xB8]
        add     r3, r2, r3
        ldr     r2, [sp, #0xC0]
        ldr     r1, [r1, +lr, lsl #2]
        str     r11, [sp, #0xF8]
        ldr     r11, [sp, #0xE0]
        add     r1, r4, r1
        mov     r4, lr, lsl #1
        ldrsh   r2, [r2, +r4]
        add     r7, r7, r11
        ldr     r11, [sp, #0xE4]
        add     r7, r10, r7
        ldr     r10, [sp, #0xF0]
        add     r1, r3, r1
        add     r8, r11, r8
        ldr     r11, [sp, #0xE8]
        ldr     r3, [sp, #4]
        add     r9, r11, r9
        add     r8, r8, r9
        add     r7, r7, r8
        ldr     r8, [sp, #0xEC]
        mvn     r9, #0xFF, 12
        bic     r9, r9, #0x3F, 4
        add     r6, r7, r6, asr #1
        add     r8, r8, r10
        ldr     r10, [sp, #0xF4]
        add     lr, r3, lr
        ldr     r3, [sp, #0xF8]
        mov     r9, r9, lsl #1
        add     r12, r10, r12
        add     r12, r8, r12
        add     r1, r12, r1
        mov     r3, r3, lsl #9
        add     r1, r3, r1, lsl #10
        ldr     r3, [sp, #0xA4]
        add     r6, r6, #4
        add     r9, r9, #2, 12
        add     r2, r3, r2
        ldr     r3, [sp, #0xD4]
        mov     lr, lr, lsl #16
        and     r6, r6, r9
        mov     lr, lr, asr #16
        add     r1, r3, r1
        ldr     r3, [sp, #0x30]
        mov     r6, r6, lsl #10
        cmp     lr, #0x28
        str     r2, [r3, +r5, lsl #2]
        ldr     r2, [sp, #0x24]
        str     r6, [r2, +r5, lsl #2]
        ldr     r2, [sp, #0x2C]
        str     r1, [r2, +r5, lsl #2]
        blt     LDMR30
        ldr     r3, [sp, #0x98]
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
        ldr     r6, [sp, #0x28]
LDMR31:
        ldr     r2, [sp, #0x94]
        mov     r0, r3
        cmp     r2, #0x28
        mvnge   r11, #0
        movge   r10, #1
        bge     LDMR38
        mvn     r11, #0
        mov     r10, #1
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
        str     r10, [sp, #0x44]
        str     r11, [sp, #0x54]
        str     r7, [sp, #0x58]
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x94]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        ldr     r7, [sp, #4]
        str     r2, [sp, #0x3C]
        str     r8, [sp, #0x5C]
        str     r1, [sp, #0x7C]
LDMR32:
        add     r1, r9, r9, lsl #2
        cmp     r3, #0x28
        add     r2, r11, r1, lsl #5
        mov     r1, r3
        bge     LDMR37
        ldr     r6, [r12]
        ldr     r5, [lr]
        str     r12, [sp, #0xA0]
        str     lr, [sp, #0x9C]
        str     r3, [sp, #0x98]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x44]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x74]
        ldr     lr, [sp, #0x28]
        mvn     r8, #0
        mov     r4, r10
        str     r8, [sp, #0xA4]
        str     r9, [sp, #0x94]
LDMR33:
        ldr     r10, [r4], #4
        ldr     r9, [r2, +r1, lsl #2]
        mov     r8, r1, lsl #1
        ldrsh   r8, [lr, +r8]
        add     r10, r5, r10
        add     r10, r9, r10, asr #10
        add     r9, r10, #0x20
        add     r10, r6, r8
        mov     r8, r9, asr #6
        cmp     r12, r8
        mov     r10, r10, lsl #16
        mov     r9, r10, asr #16
        blt     LDMR34
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        mvnlt   r8, #0xFF
        biclt   r8, r8, #0x7F, 24
        b       LDMR35
        .long   LDMR_ArithProg
LDMR34:
        mov     r8, #0
        sub     r8, r8, #2, 18
        mvn     r8, r8
LDMR35:
        mul     r9, r9, r9
        rsb     r10, r3, #0
        mov     r9, r9, asr #15
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mul     r11, r0, r9
        mla     r11, r10, r8, r11
        cmp     r11, #0
        ble     LDMR36
        mov     r3, r9
        mov     r0, r8
        str     r1, [sp, #0xA4]
LDMR36:
        add     r1, r7, r1
        cmp     r1, #0x28
        blt     LDMR33
        ldr     r8, [sp, #0xA4]
        str     r0, [sp, #0x44]
        str     r3, [sp, #0x54]
        ldr     r12, [sp, #0xA0]
        ldr     lr, [sp, #0x9C]
        ldr     r3, [sp, #0x98]
        ldr     r9, [sp, #0x94]
        ldr     r0, [sp, #0x90]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        cmp     r8, #0
        blt     LDMR37
        mov     r0, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     r0, r0, asr #16
        str     r0, [sp, #0x3C]
        mov     r0, r8, asr #16
LDMR37:
        add     r9, r7, r9
        cmp     r9, #0x28
        add     r12, r12, #4
        add     lr, lr, #4
        blt     LDMR32
        ldr     r10, [sp, #0x44]
        ldr     r2, [sp, #0x3C]
        ldr     r11, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r1, [sp, #0x7C]
        ldr     r5, [sp, #0x20]
        ldr     r9, [sp, #0x34]
        ldr     r6, [sp, #0x28]
LDMR38:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        rsb     r3, r3, #0
        mul     r3, r3, r10
        mla     r3, r12, r11, r3
        cmp     r3, #0
        ble     LDMR39
        ldr     r3, [sp, #0x50]
        ldr     r12, [sp, #0x84]
        cmp     r3, #0
        ldr     r3, [sp]
        str     r11, [sp, #0x18]
        str     r10, [sp, #0x14]
        strh    r12, [r3]
        ldr     r12, [sp, #0x68]
        strh    r12, [r3, #2]
        ldr     r12, [sp, #0x64]
        strh    r12, [r3, #4]
        ldr     r12, [sp, #0x60]
        strh    r8, [r3, #8]
        strh    r7, [r3, #0xA]
        strh    r12, [r3, #6]
        ldr     r12, [sp, #0x4C]
        strh    r12, [r3, #0xC]
        ldr     r12, [sp, #0x48]
        strh    r12, [r3, #0xE]
        ldreqsh r0, [r9, #2]
        streq   r0, [sp, #0x6C]
        beq     LDMR39
        ldr     r3, [sp]
        strh    r0, [r3, #0x12]
        strh    r2, [r3, #0x10]
        ldrsh   r0, [r9, #2]
        str     r0, [sp, #0x6C]
LDMR39:
        ldr     r0, [sp, #0x40]
        cmp     r0, #2
        ble     LDMR43
        ldr     r0, [sp, #0x1C]
        cmp     r0, #6
        movlt   r12, #2
        movlt   r0, r12
        blt     LDMR41
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x80]
        mov     r12, #2
        mov     r0, r12
LDMR40:
        mov     lr, r12, lsl #1
        ldrsh   r7, [r9, +lr]
        add     r4, r0, #1
        add     r12, r0, #2
        strh    r7, [r2, +lr]
        mov     r4, r4, lsl #16
        mov     r12, r12, lsl #16
        mov     lr, r4, asr #15
        ldrsh   r4, [r9, +lr]
        mov     r12, r12, asr #15
        add     r7, r0, #3
        strh    r4, [r2, +lr]
        ldrsh   r4, [r9, +r12]
        mov     r7, r7, lsl #16
        add     lr, r0, #4
        strh    r4, [r2, +r12]
        mov     r12, r7, asr #15
        ldrsh   r4, [r9, +r12]
        mov     lr, lr, lsl #16
        add     r0, r0, #5
        strh    r4, [r2, +r12]
        mov     lr, lr, asr #15
        ldrsh   r4, [r9, +lr]
        mov     r12, r0, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, r3
        strh    r4, [r2, +lr]
        ble     LDMR40
LDMR41:
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x40]
LDMR42:
        mov     r12, r12, lsl #1
        ldrsh   lr, [r9, +r12]
        add     r0, r0, #1
        mov     r4, r0, lsl #16
        strh    lr, [r2, +r12]
        mov     r12, r4, asr #16
        cmp     r12, r3
        blt     LDMR42
LDMR43:
        ldr     r0, [sp, #0x70]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x6C]
        subs    r0, r0, #1
        str     r0, [sp, #0x70]
        strh    r3, [r2, +r9]
        bne     LDMR2
LDMR44:
        add     sp, sp, #0xB3, 30
        ldmia   sp!, {r4 - r11, pc}
LDMR45:
        mov     r3, #0
        mvn     r11, #0
        mov     r10, #1
        str     r3, [sp, #0xA4]
        b       LDMR29
LDMR46:
        mov     r0, #0
        str     r0, [sp, #0xD8]
        mov     r3, #1
        b       LDMR20
LDMR47:
        mov     r0, #0
        str     r0, [sp, #0xA4]
        mov     r4, #1
        b       LDMR11
LDMR48:
        mov     r2, #0
        mov     r0, r2
        add     r10, r7, #0x20
        add     r6, r7, #0x40
        add     lr, r7, #0x60
        add     r12, r7, #0x80
        mov     r3, r7
        mov     r1, r11
        str     r9, [sp, #0x34]
        str     r11, [sp, #0x38]
        str     r5, [sp, #0x3C]
        str     r4, [sp, #0x40]
LDMR49:
        ldr     r4, [r1, +r0, lsl #2]
        add     r5, r1, r2
        ldr     r9, [r5, #0xA4]
        str     r4, [r3], #4
        ldr     r11, [r5, #0x148]
        ldr     r4, [r5, #0x1EC]
        str     r9, [r10], #4
        ldr     r5, [r5, #0x290]
        str     r11, [r6], #4
        str     r4, [lr], #4
        add     r0, r0, #5
        str     r5, [r12], #4
        cmp     r0, #0x28
        add     r1, r1, #0x32, 28
        add     r2, r2, #0x14
        blt     LDMR49
        ldr     r9, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        mov     r10, #1
        b       LDMR1


        .data
        .align  4


LDMR_ArithProg:
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x05,0x00,0x06,0x00,0x07,0x00
        .byte   0x08,0x00,0x09,0x00


