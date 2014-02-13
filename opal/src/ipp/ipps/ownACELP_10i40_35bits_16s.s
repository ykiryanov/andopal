        .text
        .align  4
        .globl  ownACELP_10i40_35bits_16s


ownACELP_10i40_35bits_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB1, 30
        sub     sp, sp, #1, 22
        ldr     r5, [sp, #0x6E8]
        add     lr, sp, #0xD9, 30
        and     lr, lr, #0x1F
        rsb     lr, lr, #0
        str     r5, [sp, #0x84]
        ldr     r5, [sp, #0x6EC]
        add     r12, sp, #0xD9, 30
        str     r5, [sp, #0x88]
        add     r9, sp, #1, 22
        and     lr, lr, #0x1F
        add     r7, r12, lr
        str     r3, [sp, #0x9C]
        add     r12, sp, #1, 22
        add     r3, sp, #1, 22
        add     r9, r9, #0x49, 30
        add     r12, r12, #0xC4
        add     r3, r3, #0x7D, 30
        and     r9, r9, #0xF
        and     r12, r12, #0xF
        and     r3, r3, #0xF
        add     r5, sp, #1, 22
        rsb     r9, r9, #0
        add     lr, sp, #1, 22
        rsb     r12, r12, #0
        rsb     r3, r3, #0
        add     r5, r5, #0x49, 30
        and     r9, r9, #0xF
        and     r10, r3, #0xF
        str     r10, [sp, #0x98]
        add     lr, lr, #0xC4
        and     r12, r12, #0xF
        mov     r6, r1
        mov     r8, r0
        add     r5, r5, r9
        mov     r0, r7
        add     r9, lr, r12
        mov     r1, #0xA0
        add     r11, sp, #0xC4
        mov     r4, r2
        bl      _ippsZero_16s
        add     r3, sp, #0x1B, 26
        mov     r2, #0
        mov     r1, #0x28
        mov     r0, r6
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     lr, [sp, #0x6C0]
        add     r3, sp, #1, 22
        add     r3, r3, #0x75, 30
        add     r12, sp, #0xC4
        and     r3, r3, #0xF
        and     r12, r12, #0x1F
        rsb     r0, r12, #0
        rsb     r3, r3, #0
        and     r12, r3, #0xF
        and     r3, r0, #0x1F
        add     r0, sp, #1, 22
        add     r0, r0, #0x7D, 30
        add     r10, r0, r10
        add     r3, r11, r3
        str     r10, [sp, #0x50]
        add     r10, sp, #1, 22
        str     r3, [sp, #0x90]
        add     r3, r7, #0x50
        str     r12, [sp, #0x8C]
        add     r10, r10, #0x75, 30
        add     r12, r10, r12
        add     r7, r7, #0xF0
        cmp     lr, #1, 24
        str     r12, [sp, #0x34]
        str     r3, [sp, #0x4C]
        str     r7, [sp, #0x94]
        movlt   r3, #2, 24
        strlt   r3, [sp, #0x6C0]
        bge     LDNN28
LDNN0:
        add     r0, sp, #0x1B, 26
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        ldr     r12, [sp, #0x6C0]
        add     r3, sp, #0x1B, 26
        mov     r2, #0
        mov     r12, r12, asr #11
        mov     r1, #0x28
        mov     r7, r12, lsl #16
        mov     r0, r8
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp, #0x6C0]
        mov     r7, r7, asr #16
        rsb     r7, r7, r7, lsl #15
        cmp     r3, #1, 24
        mov     r12, r7, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        str     r12, [sp, #0x80]
        movge   r3, r3, lsl #1
        movlt   r3, #2, 24
        add     r0, sp, #0x1B, 26
        str     r3, [sp, #0x6C0]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        ldr     r12, [sp, #0x6C0]
        mvn     r3, #0xFF
        mov     r7, #0
        mov     r12, r12, asr #11
        bic     r3, r3, #0x7F, 24
        mov     r1, r7
        mov     r12, r12, lsl #16
        sub     lr, r7, #2, 18
        mov     r0, r1
        mvn     r3, r3
        mov     r12, r12, asr #16
        str     lr, [sp, #0x10]
        str     r4, [sp, #0x20]
LDNN1:
        cmp     r0, #0x28
        mov     lr, r0
        mvnge   r11, #0
        bge     LDNN5
        mov     r10, r0
        mvn     r11, #0
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        str     r7, [sp, #0x1C]
LDNN2:
        mov     r0, r10, lsl #1
        ldrsh   r7, [r8, +r0]
        ldrsh   r1, [r6, +r0]
        ldr     r2, [sp, #0x80]
        mul     r4, r12, r7
        mlas    r4, r2, r1, r4
        bmi     LDNN27
        strh    r3, [r5, +r0]
        ldr     r1, [sp, #0x10]
        strh    r1, [r9, +r0]
LDNN3:
        cmp     r4, #0
        strh    r7, [r8, +r0]
        bge     LDNN4
        cmp     r4, #2, 2
        mvneq   r4, #2, 2
        rsbne   r4, r4, #0
LDNN4:
        cmp     r4, r11
        movgt   r11, r4
        strgt   lr, [sp, #0x14]
        add     r10, r10, #5
        mov     lr, r10, lsl #16
        mov     lr, lr, asr #16
        mov     r10, lr
        cmp     r10, #0x28
        blt     LDNN2
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r7, [sp, #0x1C]
        str     r4, [sp, #0x6C0]
LDNN5:
        add     lr, sp, #1, 22
        add     r4, sp, #1, 22
        add     lr, lr, #0xA6, 30
        str     r11, [lr, +r0, lsl #2]
        add     r4, r4, #0xA1, 30
        add     r0, r0, #1
        strh    r1, [r4, +r7]
        cmp     r0, #5
        add     r7, r7, #2
        blt     LDNN1
        ldr     r12, [sp, #0x90]
        ldr     r4, [sp, #0x20]
        add     r3, sp, #1, 22
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x94]
        add     r3, r3, #0x85, 30
        str     r3, [sp, #4]
        str     r12, [sp]
        ldr     r3, [sp, #0x4C]
        mov     r2, r9
        mov     r1, r5
        mov     r0, r4
        bl      _ippsToeplizMatrix_G729E_16s
        add     lr, sp, #1, 22
        add     r6, sp, #1, 22
        add     lr, lr, #0xA6, 30
        add     r6, r6, #0xA6, 30
        ldr     r2, [lr]
        ldr     r0, [r6, #8]
        add     r3, sp, #1, 22
        add     r7, sp, #1, 22
        add     lr, sp, #1, 22
        add     r6, sp, #1, 22
        add     r3, r3, #0xA6, 30
        ldr     r1, [r3, #4]
        add     r7, r7, #0xA6, 30
        ldr     r11, [r7, #0xC]
        add     lr, lr, #0xA6, 30
        ldr     lr, [lr]
        add     r6, r6, #0xA6, 30
        ldr     r6, [r6, #8]
        add     r3, sp, #1, 22
        add     r12, sp, #1, 22
        add     r12, r12, #0xA6, 30
        ldr     r12, [r12, #0x10]
        add     r6, r6, r11
        add     r11, sp, #1, 22
        add     r3, r3, #0xA6, 30
        ldr     r3, [r3, #4]
        add     lr, lr, r1
        add     r11, r11, #0xA6, 30
        str     lr, [r11]
        add     lr, sp, #1, 22
        add     lr, lr, #0xA6, 30
        add     r3, r3, r0
        str     r3, [lr, #4]
        add     r7, sp, #1, 22
        add     r10, sp, #1, 22
        add     lr, sp, #1, 22
        add     r7, r7, #0xA6, 30
        ldr     r7, [r7, #0xC]
        add     r10, r10, #0xA6, 30
        ldr     r10, [r10, #0x10]
        add     lr, lr, #0xA6, 30
        str     r6, [lr, #8]
        add     lr, sp, #1, 22
        add     lr, lr, #0xA6, 30
        add     r10, r7, r10
        str     r10, [lr, #0xC]
        add     lr, sp, #1, 22
        add     r12, r12, r2
        add     lr, lr, #0xA6, 30
        str     r12, [lr, #0x10]
        add     r11, sp, #1, 22
        add     r0, sp, #1, 22
        add     r1, sp, #1, 22
        add     r2, sp, #1, 22
        mov     r7, #0
        mov     lr, r7
        mvn     r12, #0
        str     r8, [sp, #0x24]
        add     r11, r11, #0xA6, 30
        add     r0, r0, #0xA6, 30
        add     r1, r1, #0xA6, 30
        add     r2, r2, #0xA6, 30
LDNN6:
        add     r8, sp, #1, 22
        add     r8, r8, #0xA6, 30
        ldr     r8, [r8]
        cmp     r3, r8
        movle   r3, #0
        movgt   r8, r3
        movgt   r3, #1
        cmp     r6, r8
        movgt   r8, r6
        movgt   r3, #2
        cmp     r10, r8
        movgt   r8, r10
        movgt   r3, #3
        ldr     r6, [r11, #0x10]
        cmp     r6, r8
        movgt   r3, #4
        mov     r7, r7, lsl #1
        add     r8, sp, #0x69, 28
        add     lr, lr, #1
        add     r6, sp, #1, 22
        mov     r10, lr, lsl #16
        strh    r3, [r8, +r7]
        mov     r7, r10, asr #16
        add     r6, r6, #0xA6, 30
        cmp     r7, #3
        str     r12, [r6, +r3, lsl #2]
        bge     LDNN7
        ldr     r3, [r2, #4]
        ldr     r6, [r1, #8]
        ldr     r10, [r0, #0xC]
        b       LDNN6
LDNN7:
        ldr     r8, [sp, #0x24]
        mvn     lr, #0xFF
        bic     r11, lr, #0x7F, 24
        add     r12, sp, #1, 22
        add     r10, r9, #2
        mvn     r11, r11
        mov     r0, #0
        mov     r1, #3
        add     r12, r12, #0xAB, 30
        add     r3, sp, #0x67, 28
        mvn     r7, #0
        mov     r6, #1
        mov     lr, #8
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        str     r11, [sp, #0x10]
        str     r10, [sp, #0x2C]
        str     r9, [sp, #0x28]
        str     r5, [sp, #0x30]
        str     r4, [sp, #0x20]
        str     r8, [sp, #0x24]
LDNN8:
        ldr     r0, [sp, #0x1C]
        add     r1, sp, #0x69, 28
        ldr     r2, [pc, #0xDB0]
        ldrsh   r1, [r1, +r0]
        ldr     r3, [pc, #0xDAC]
        add     r4, sp, #1, 22
        mov     r0, r1, lsl #1
        ldrsh   r0, [r2, +r0]
        add     r1, r2, r1, lsl #1
        str     r1, [sp, #0x14]
        ldrsh   r1, [r1, #2]
        mov     r5, r0, lsl #1
        add     r4, r4, #0xA1, 30
        ldrsh   r5, [r4, +r5]
        add     lr, sp, #1, 22
        mov     r4, r1, lsl #1
        add     lr, lr, #0xA1, 30
        ldrsh   r4, [lr, +r4]
        smull   r8, lr, r5, r3
        add     r2, sp, #1, 22
        add     r2, r2, #0xAB, 30
        strh    r5, [r2]
        smull   r3, r2, r4, r3
        mov     r3, r4, asr #31
        rsb     r2, r3, r2, asr #1
        add     r3, sp, #1, 22
        add     r3, r3, #0xAB, 30
        mov     r8, r5, asr #31
        rsb     lr, r8, lr, asr #1
        strh    r4, [r3, #2]
        mov     r3, r2, lsl #16
        mov     lr, lr, lsl #16
        ldr     r10, [sp, #0x90]
        mov     r2, lr, asr #16
        add     r12, sp, #1, 22
        mov     lr, r3, asr #16
        add     r12, r12, #0x85, 30
        add     r3, lr, r2, lsl #3
        add     r12, r12, r0, lsl #4
        mov     r2, r2, lsl #1
        ldrsh   r2, [r12, +r2]
        add     r12, sp, #1, 22
        add     r12, r12, #0x85, 30
        add     r1, r12, r1, lsl #4
        mov     lr, lr, lsl #1
        ldrsh   r1, [r1, +lr]
        mov     lr, r3, lsl #16
        ldr     r3, [sp, #0x24]
        mov     r9, r5, lsl #1
        mov     lr, lr, asr #15
        add     r0, r10, r0, lsl #7
        ldrsh   r12, [r3, +r9]
        ldrsh   lr, [r0, +lr]
        mov     r8, r4, lsl #1
        ldrsh   r3, [r3, +r8]
        ldr     r0, [sp, #0x28]
        add     r2, r2, r1
        add     lr, lr, r2
        add     r3, r12, r3
        mov     r1, #0x28
        mov     r11, r3, lsl #16
        mov     r10, lr, lsl #16
        bl      _ippsZero_16s
        mov     r11, r11, asr #16
        mov     r10, r10, asr #16
        str     r10, [sp, #0x60]
        str     r11, [sp, #0x54]
        str     r6, [sp, #0x70]
        str     r7, [sp, #0x6C]
        mov     r0, r9
        ldr     r6, [sp, #0x4C]
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x50]
        ldr     r7, [sp, #0x28]
        ldr     r11, [sp, #0x30]
        mov     r1, #2
        str     r1, [sp, #0x7C]
LDNN9:
        ldrsh   r0, [r11, +r0]
        cmp     r0, #0
        ldrlt   r2, [sp, #0x94]
        sublt   r0, r2, r5, lsl #1
        subge   r0, r6, r5, lsl #1
        ldrsh   r8, [r8, +r11]
        cmp     r8, #0
        ldrlt   r2, [sp, #0x94]
        sublt   r8, r2, r4, lsl #1
        subge   r8, r6, r4, lsl #1
        mov     r1, r7
        mov     r2, #0x28
        bl      _ippsAdd_16s_I
        mov     r0, r8
        mov     r2, #0x28
        mov     r1, r7
        bl      _ippsAdd_16s_I
        ldr     r2, [sp, #0x7C]
        ldr     r12, [sp, #0x14]
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x80]
        ldrsh   r3, [r12, +r2]
        add     r2, r12, r2
        str     r2, [sp, #0x78]
        str     r3, [sp, #0x68]
        ldrsh   lr, [r2, #2]
        mov     r12, r3, lsl #1
        str     r12, [sp, #0x64]
        cmp     r3, lr
        rsb     r2, r3, #0x28
        str     lr, [sp, #0x74]
        mov     r3, #0xF
        str     r3, [sp, #8]
        mov     r3, #8
        str     r3, [sp, #4]
        str     r10, [sp]
        add     r1, r12, r7
        add     r8, r11, r12
        bge     LDNN10
        ldr     r3, [sp, #0x68]
        mov     r3, r3, lsl #4
        str     r3, [sp, #0x74]
        mov     r3, #5
        mov     r0, r6
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r3, [sp, #0x64]
        ldr     r12, [sp, #0x2C]
        ldr     r2, [sp, #0x68]
        str     r9, [sp]
        mov     r0, r6
        add     r1, r3, r12
        mov     r3, #0xF
        str     r3, [sp, #8]
        mov     r3, #8
        str     r3, [sp, #4]
        rsb     r2, r2, #0x27
        mov     r3, #5
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r2, [sp, #0x64]
        ldr     r12, [sp, #0x98]
        ldr     r0, [sp, #0x74]
        ldrsh   r3, [r11, +r2]
        add     r2, sp, #1, 22
        add     r2, r2, #0x7D, 30
        ldrsh   lr, [r12, +r2]
        add     r2, sp, #1, 22
        add     r2, r2, #0x85, 30
        ldrsh   r2, [r2, +r0]
        ldr     r0, [sp, #0x8C]
        add     r1, sp, #1, 22
        add     r1, r1, #0x75, 30
        ldrsh   r1, [r0, +r1]
        ldr     r0, [sp, #0x68]
        str     r1, [sp, #0x64]
        mov     r1, r0, lsl #1
        mul     r0, lr, r3
        add     r1, r1, #2
        str     r1, [sp, #0x68]
        ldrsh   lr, [r11, +r1]
        ldrsh   r3, [r8, #0xA]
        ldrsh   r1, [r8, #0x14]
        add     r0, r2, r0, asr #15
        add     r2, sp, #1, 22
        add     r2, r2, #0x7D, 30
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x64]
        mul     lr, r1, lr
        str     lr, [sp, #0x64]
        ldrsh   lr, [r8, #0x1E]
        strh    r0, [r12, +r2]
        ldrsh   r0, [r10, #2]
        ldrsh   r12, [r10, #6]
        ldrsh   r2, [r10, #4]
        mul     r3, r0, r3
        mul     lr, r12, lr
        str     r3, [sp, #0x58]
        ldr     r3, [sp, #0x5C]
        str     lr, [sp, #0x48]
        mul     r3, r2, r3
        str     r3, [sp, #0x5C]
        ldrsh   r2, [r10, #8]
        ldrsh   r0, [r8, #0x28]
        ldrsh   r12, [r8, #0x32]
        ldrsh   lr, [r10, #0xA]
        mul     r0, r2, r0
        ldrsh   r3, [r8, #0x3C]
        mul     r12, lr, r12
        str     r0, [sp, #0x44]
        ldrsh   r2, [r10, #0xC]
        add     r0, sp, #1, 22
        add     r0, r0, #0x75, 30
        mul     r3, r2, r3
        str     r12, [sp, #0x40]
        ldrsh   r8, [r8, #0x46]
        ldrsh   lr, [r10, #0xE]
        add     r2, sp, #1, 22
        str     r3, [sp, #0xA0]
        ldr     r3, [sp, #0x74]
        mul     r8, lr, r8
        add     r2, r2, #0x85, 30
        add     r12, r2, r3
        ldr     lr, [sp, #0x64]
        ldrsh   r3, [r12, #0x10]
        ldr     r2, [sp, #0x68]
        str     r8, [sp, #0x74]
        add     r3, r3, lr, asr #15
        ldr     lr, [sp, #0x8C]
        add     r2, r11, r2
        ldrsh   r8, [r2, #0xA]
        strh    r3, [lr, +r0]
        ldrsh   r1, [r12, #2]
        ldrsh   r0, [r9, #2]
        ldrsh   r3, [r2, #0x14]
        ldrsh   lr, [r9, #4]
        mul     r0, r0, r8
        ldr     r8, [sp, #0x58]
        mul     r3, lr, r3
        ldrsh   lr, [r9, #6]
        add     r8, r1, r8, asr #15
        strh    r8, [r10, #2]
        ldrsh   r1, [r12, #0x12]
        ldrsh   r8, [r2, #0x1E]
        add     r0, r1, r0, asr #15
        strh    r0, [r9, #2]
        mul     r8, lr, r8
        ldrsh   r1, [r12, #4]
        ldrsh   r0, [r2, #0x28]
        str     r8, [sp, #0x68]
        ldr     r8, [sp, #0x5C]
        ldrsh   lr, [r9, #8]
        add     r8, r1, r8, asr #15
        strh    r8, [r10, #4]
        ldrsh   r1, [r12, #0x14]
        mul     r0, lr, r0
        add     r3, r1, r3, asr #15
        str     r0, [sp, #0x64]
        ldrsh   lr, [r2, #0x32]
        ldrsh   r8, [r9, #0xA]
        strh    r3, [r9, #4]
        ldrsh   r0, [r12, #6]
        ldrsh   r3, [r2, #0x3C]
        mul     lr, r8, lr
        ldrsh   r1, [r9, #0xC]
        ldr     r8, [sp, #0x48]
        ldrsh   r2, [r2, #0x46]
        mul     r3, r1, r3
        add     r8, r0, r8, asr #15
        ldrsh   r0, [r9, #0xE]
        strh    r8, [r10, #6]
        ldr     r1, [sp, #0x68]
        ldrsh   r8, [r12, #0x16]
        mul     r2, r0, r2
        add     r1, r8, r1, asr #15
        strh    r1, [r9, #6]
        ldr     r0, [sp, #0x44]
        ldrsh   r8, [r12, #8]
        add     r0, r8, r0, asr #15
        strh    r0, [r10, #8]
        ldr     r0, [sp, #0x64]
        ldrsh   r8, [r12, #0x18]
        add     r0, r8, r0, asr #15
        strh    r0, [r9, #8]
        ldr     r0, [sp, #0x40]
        ldrsh   r8, [r12, #0xA]
        add     r0, r8, r0, asr #15
        strh    r0, [r10, #0xA]
        ldrsh   r8, [r12, #0x1A]
        add     lr, r8, lr, asr #15
        strh    lr, [r9, #0xA]
        ldr     r8, [sp, #0xA0]
        ldrsh   lr, [r12, #0xC]
        add     r8, lr, r8, asr #15
        strh    r8, [r10, #0xC]
        ldrsh   lr, [r12, #0x1C]
        add     r3, lr, r3, asr #15
        strh    r3, [r9, #0xC]
        ldr     lr, [sp, #0x74]
        ldrsh   r3, [r12, #0xE]
        add     lr, r3, lr, asr #15
        strh    lr, [r10, #0xE]
        ldrsh   r12, [r12, #0x1E]
        add     r2, r12, r2, asr #15
        strh    r2, [r9, #0xE]
        b       LDNN11
LDNN10:
        ldr     r3, [sp, #0x74]
        mov     r3, r3, lsl #4
        str     r3, [sp, #0xA0]
        mov     r3, #5
        mov     r0, r6
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r2, [sp, #0x74]
        mov     r0, r6
        mov     r2, r2, lsl #1
        str     r2, [sp, #0x68]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x68]
        str     r9, [sp]
        rsb     r2, r2, #0x28
        add     r1, r7, r3
        mov     r3, #0xF
        str     r3, [sp, #8]
        mov     r3, #8
        str     r3, [sp, #4]
        mov     r3, #5
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r2, [sp, #0x68]
        ldr     r3, [sp, #0xA0]
        ldr     lr, [sp, #0x8C]
        ldrsh   r1, [r11, +r2]
        add     r2, sp, #1, 22
        add     r2, r2, #0x75, 30
        ldrsh   r0, [lr, +r2]
        add     r2, sp, #1, 22
        add     r2, r2, #0x85, 30
        ldrsh   r12, [r2, +r3]
        ldr     r2, [sp, #0x98]
        mul     r1, r0, r1
        ldrsh   r0, [r8, #0xA]
        add     r3, sp, #1, 22
        add     r3, r3, #0x7D, 30
        ldrsh   r3, [r2, +r3]
        ldr     r2, [sp, #0x64]
        add     r1, r12, r1, asr #15
        ldrsh   r2, [r11, +r2]
        str     r0, [sp, #0x74]
        mul     r2, r3, r2
        str     r2, [sp, #0x64]
        ldrsh   r2, [r8, #0x14]
        str     r2, [sp, #0x5C]
        ldrsh   r2, [r8, #0x1E]
        str     r2, [sp, #0x58]
        add     r2, sp, #1, 22
        add     r2, r2, #0x75, 30
        strh    r1, [lr, +r2]
        ldrsh   r2, [r9, #2]
        ldr     r3, [sp, #0xA0]
        str     r2, [sp, #0x48]
        ldrsh   r2, [r9, #4]
        ldr     r0, [sp, #0x48]
        str     r2, [sp, #0x44]
        ldrsh   r2, [r9, #6]
        str     r2, [sp, #0x40]
        ldrsh   r2, [r9, #8]
        str     r2, [sp, #0xA4]
        ldrsh   r2, [r8, #0x28]
        str     r2, [sp, #0xA8]
        ldrsh   r2, [r9, #0xA]
        str     r2, [sp, #0xAC]
        ldrsh   r2, [r8, #0x32]
        str     r2, [sp, #0xB0]
        ldrsh   r2, [r9, #0xC]
        str     r2, [sp, #0xB4]
        ldrsh   r2, [r8, #0x3C]
        str     r2, [sp, #0xB8]
        ldrsh   r2, [r9, #0xE]
        str     r2, [sp, #0xBC]
        ldrsh   r8, [r8, #0x46]
        add     r2, sp, #1, 22
        add     r2, r2, #0x85, 30
        str     r8, [sp, #0xC0]
        add     r3, r2, r3
        ldrsh   r2, [r3, #0x40]
        str     r2, [sp, #0xA0]
        ldr     r2, [sp, #0x68]
        add     r2, r11, r2
        ldrsh   r1, [r2, #0xA]
        ldrsh   lr, [r2, #0x1E]
        ldrsh   r12, [r2, #0x14]
        mul     r1, r0, r1
        ldrsh   r8, [r2, #0x28]
        ldr     r0, [sp, #0x44]
        mul     r12, r0, r12
        str     r1, [sp, #0x68]
        str     r12, [sp, #0x48]
        ldr     r12, [sp, #0x40]
        mul     lr, r12, lr
        ldr     r12, [sp, #0xA4]
        mul     r8, r12, r8
        ldr     r12, [sp, #0xA0]
        str     lr, [sp, #0x44]
        ldr     lr, [sp, #0x64]
        str     r8, [sp, #0xA4]
        add     r8, sp, #1, 22
        add     r8, r8, #0x7D, 30
        add     r12, r12, lr, asr #15
        ldr     lr, [sp, #0x98]
        strh    r12, [lr, +r8]
        ldrsh   r8, [r3, #2]
        ldr     r1, [sp, #0x74]
        ldrsh   r12, [r10, #2]
        ldrsh   lr, [r10, #4]
        ldrsh   r0, [r10, #6]
        mul     r12, r12, r1
        ldr     r1, [sp, #0x68]
        add     r1, r8, r1, asr #15
        strh    r1, [r9, #2]
        ldr     r1, [sp, #0x5C]
        ldrsh   r8, [r3, #0x42]
        mul     lr, lr, r1
        ldr     r1, [sp, #0x58]
        add     r12, r8, r12, asr #15
        mul     r1, r0, r1
        str     r1, [sp, #0xA0]
        ldrsh   r0, [r10, #8]
        strh    r12, [r10, #2]
        ldr     r12, [sp, #0xA8]
        ldrsh   r8, [r3, #4]
        ldrsh   r1, [r2, #0x32]
        mul     r12, r0, r12
        ldr     r0, [sp, #0xAC]
        mul     r1, r0, r1
        ldr     r0, [sp, #0x48]
        str     r12, [sp, #0xA8]
        ldrsh   r12, [r10, #0xA]
        add     r0, r8, r0, asr #15
        str     r1, [sp, #0xAC]
        strh    r0, [r9, #4]
        ldrsh   r8, [r3, #0x44]
        ldr     r0, [sp, #0xB0]
        add     lr, r8, lr, asr #15
        mul     r0, r12, r0
        str     r0, [sp, #0xB0]
        strh    lr, [r10, #4]
        ldrsh   r12, [r2, #0x3C]
        ldrsh   lr, [r3, #6]
        ldr     r8, [sp, #0xB4]
        ldrsh   r0, [r10, #0xC]
        ldrsh   r2, [r2, #0x46]
        mul     r12, r8, r12
        ldr     r8, [sp, #0x44]
        add     r8, lr, r8, asr #15
        strh    r8, [r9, #6]
        ldr     lr, [sp, #0xB8]
        ldr     r1, [sp, #0xA0]
        ldrsh   r8, [r3, #0x46]
        mul     lr, r0, lr
        ldr     r0, [sp, #0xBC]
        add     r1, r8, r1, asr #15
        strh    r1, [r10, #6]
        mul     r2, r0, r2
        ldr     r1, [sp, #0xC0]
        ldrsh   r0, [r10, #0xE]
        ldrsh   r8, [r3, #8]
        mul     r0, r0, r1
        ldr     r1, [sp, #0xA4]
        add     r1, r8, r1, asr #15
        strh    r1, [r9, #8]
        ldr     r1, [sp, #0xA8]
        ldrsh   r8, [r3, #0x48]
        add     r1, r8, r1, asr #15
        strh    r1, [r10, #8]
        ldr     r1, [sp, #0xAC]
        ldrsh   r8, [r3, #0xA]
        add     r1, r8, r1, asr #15
        strh    r1, [r9, #0xA]
        ldr     r1, [sp, #0xB0]
        ldrsh   r8, [r3, #0x4A]
        add     r1, r8, r1, asr #15
        strh    r1, [r10, #0xA]
        ldrsh   r8, [r3, #0xC]
        add     r12, r8, r12, asr #15
        strh    r12, [r9, #0xC]
        ldrsh   r12, [r3, #0x4C]
        add     lr, r12, lr, asr #15
        strh    lr, [r10, #0xC]
        ldrsh   r12, [r3, #0xE]
        add     r2, r12, r2, asr #15
        strh    r2, [r9, #0xE]
        ldrsh   r3, [r3, #0x4E]
        add     r0, r3, r0, asr #15
        strh    r0, [r10, #0xE]
LDNN11:
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x80]
        ldr     lr, [sp, #0x24]
        ldr     r11, [sp, #0x54]
        ldr     r9, [sp, #0x10]
        ldrsh   r1, [r2, +r3]
        ldr     r2, [sp, #0x78]
        mov     r3, #0
        ldrsh   r0, [r2, #2]
        mvn     r2, #0
        add     r8, lr, r1, lsl #1
        str     r2, [sp, #0x78]
        ldr     r2, [sp, #0x90]
        add     lr, lr, r0, lsl #1
        str     lr, [sp, #0x74]
        mov     lr, r10
        ldr     r10, [sp, #0x60]
        add     r12, r2, r1, lsl #7
        mov     r2, #1
        str     r0, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r4, [sp, #0x3C]
        str     r5, [sp, #0x38]
LDNN12:
        ldrsh   r0, [r8], #0xA
        add     r0, r11, r0
        cmp     r9, r0
        blt     LDNN13
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r5, r0, asr #16
        movlt   r0, #0
        sublt   r5, r0, #2, 18
        b       LDNN14
LDNN13:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r5, r0
LDNN14:
        ldrsh   r0, [lr], #2
        add     r0, r10, r0
        cmp     r9, r0
        blt     LDNN15
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r4, r0, asr #16
        movlt   r0, #0
        sublt   r4, r0, #2, 18
        b       LDNN16
LDNN15:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r4, r0
LDNN16:
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x74]
        mov     r6, r12
        str     r12, [sp, #0x68]
        str     lr, [sp, #0x64]
        ldr     r12, [sp, #0x44]
        ldr     lr, [sp, #0x78]
        mvn     r2, #0
        mov     r7, #0
        str     r8, [sp, #0x5C]
        str     r3, [sp, #0x58]
LDNN17:
        ldrsh   r3, [r1], #0xA
        add     r3, r5, r3
        cmp     r9, r3
        blt     LDNN18
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r8, r3, asr #16
        movlt   r3, #0
        sublt   r8, r3, #2, 18
        b       LDNN19
LDNN18:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r8, r3
LDNN19:
        ldrsh   r10, [r6], #2
        ldrsh   r3, [r0], #2
        add     r10, r3, r10
        mov     r3, r10, lsl #16
        add     r3, r4, r3, asr #16
        cmp     r9, r3
        blt     LDNN20
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNN21
LDNN20:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNN21:
        mul     r8, r8, r8
        rsb     r10, lr, #0
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mul     r11, r12, r8
        mla     r11, r10, r3, r11
        cmp     r11, #0
        ble     LDNN22
        mov     lr, r8
        mov     r12, r3
        mov     r2, r7
LDNN22:
        add     r7, r7, #1
        cmp     r7, #8
        blt     LDNN17
        ldr     r10, [sp, #0x60]
        ldr     r8, [sp, #0x5C]
        ldr     r3, [sp, #0x58]
        ldr     r11, [sp, #0x54]
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0x68]
        str     lr, [sp, #0x78]
        ldr     lr, [sp, #0x64]
        mov     r0, r2, lsl #16
        movs    r0, r0, asr #16
        strpl   r3, [sp, #0x38]
        strpl   r2, [sp, #0x3C]
        add     r3, r3, #1
        cmp     r3, #8
        add     r12, r12, #0x10
        blt     LDNN12
        ldr     r4, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        ldr     r5, [sp, #0x38]
        ldr     r1, [sp, #0x48]
        ldr     r2, [sp, #0x44]
        ldr     r6, [sp, #0x4C]
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x50]
        ldr     r7, [sp, #0x28]
        ldr     r11, [sp, #0x30]
        add     r4, r4, r4, lsl #2
        add     r4, r0, r4
        add     r5, r5, r5, lsl #2
        ldr     lr, [sp, #0x54]
        mov     r3, r4, lsl #16
        add     r5, r1, r5
        mov     r4, r3, asr #16
        ldr     r3, [sp, #0x24]
        mov     r5, r5, lsl #16
        mov     r8, r4, lsl #1
        mov     r5, r5, asr #16
        mov     r0, r5, lsl #1
        ldrsh   r12, [r3, +r0]
        ldrsh   r3, [r3, +r8]
        str     r2, [sp, #0x60]
        add     r12, lr, r12
        add     r3, r12, r3
        ldr     r12, [sp, #0x10]
        cmp     r12, r3
        blt     LDNN24
        cmn     r3, #2, 18
        bge     LDNN23
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        str     r3, [sp, #0x54]
        b       LDNN25
LDNN23:
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        str     r3, [sp, #0x54]
        b       LDNN25
LDNN24:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r3, r3
        str     r3, [sp, #0x54]
LDNN25:
        ldr     r12, [sp, #0x7C]
        add     r1, sp, #1, 22
        add     lr, sp, #1, 22
        add     r3, r12, #2
        mov     r12, r12, lsl #1
        add     r1, r1, #0xAB, 30
        strh    r5, [r1, +r12]
        ldr     r12, [sp, #0x80]
        mov     r3, r3, lsl #16
        add     lr, lr, #0xAB, 30
        add     lr, lr, r12
        mov     r3, r3, asr #16
        str     r3, [sp, #0x7C]
        cmp     r3, #0xA
        strh    r4, [lr, #2]
        blt     LDNN9
        ldr     r11, [sp, #0x54]
        ldr     r6, [sp, #0x70]
        ldr     r7, [sp, #0x6C]
        mul     r11, r11, r11
        rsb     r1, r7, #0
        mov     r0, r11, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        mul     r3, r6, r0
        mla     r3, r1, r2, r3
        cmp     r3, #0
        ble     LDNN26
        add     r1, sp, #1, 22
        add     r1, r1, #0xAB, 30
        ldrsh   r1, [r1]
        add     r3, sp, #1, 22
        mov     r7, r0
        add     r3, r3, #0xAB, 30
        ldrsh   r3, [r3, #2]
        add     r6, sp, #1, 22
        add     r0, sp, #0x67, 28
        add     r12, sp, #1, 22
        add     r6, r6, #0xAB, 30
        ldrsh   r8, [r6, #0xC]
        strh    r1, [r0]
        add     r12, r12, #0xAB, 30
        ldrsh   r12, [r12, #4]
        add     r0, sp, #0x67, 28
        add     lr, sp, #1, 22
        strh    r3, [r0, #2]
        add     lr, lr, #0xAB, 30
        ldrsh   lr, [lr, #6]
        add     r0, sp, #0x67, 28
        add     r6, sp, #1, 22
        add     r4, sp, #1, 22
        strh    r12, [r0, #4]
        add     r4, r4, #0xAB, 30
        ldrsh   r4, [r4, #8]
        add     r6, r6, #0xAB, 30
        ldrsh   r9, [r6, #0xE]
        add     r0, sp, #0x67, 28
        add     r5, sp, #1, 22
        strh    lr, [r0, #6]
        add     r5, r5, #0xAB, 30
        ldrsh   r5, [r5, #0xA]
        add     r0, sp, #0x67, 28
        add     r6, sp, #1, 22
        strh    r4, [r0, #8]
        add     r0, sp, #0x67, 28
        add     r6, r6, #0xAB, 30
        ldrsh   r10, [r6, #0x10]
        strh    r5, [r0, #0xA]
        add     r0, sp, #0x67, 28
        strh    r8, [r0, #0xC]
        add     r6, sp, #1, 22
        add     r0, sp, #0x67, 28
        add     r6, r6, #0xAB, 30
        ldrsh   r11, [r6, #0x12]
        strh    r9, [r0, #0xE]
        add     r0, sp, #0x67, 28
        strh    r10, [r0, #0x10]
        add     r0, sp, #0x67, 28
        mov     r6, r2
        strh    r11, [r0, #0x12]
LDNN26:
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        subs    r0, r0, #1
        str     r0, [sp, #0x18]
        add     r1, r1, #2
        str     r1, [sp, #0x1C]
        bne     LDNN8
        ldr     r4, [sp, #0x20]
        ldr     r5, [sp, #0x30]
        add     r2, sp, #1, 22
        add     r2, r2, #0x61, 30
        mov     r0, r4
        mov     r3, #0x28
        mov     r1, #1
        bl      _ippsRShiftC_16s
        ldr     r12, [sp, #0x84]
        add     r3, sp, #1, 22
        add     r3, r3, #0x61, 30
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x9C]
        add     r2, sp, #1, 22
        add     r2, r2, #0x99, 30
        str     r2, [sp, #8]
        add     r0, sp, #0x67, 28
        str     r12, [sp]
        mov     r1, r5
        mov     r2, #0xA
        bl      LDNN_ownBuildCode_G729E_16s
        add     r0, sp, #1, 22
        add     r1, sp, #1, 22
        add     r2, sp, #1, 22
        add     r3, sp, #1, 22
        add     r12, sp, #1, 22
        ldr     lr, [sp, #0x88]
        add     r0, r0, #0x99, 30
        add     r1, r1, #0x99, 30
        add     r2, r2, #0x99, 30
        add     r3, r3, #0x99, 30
        add     r12, r12, #0x99, 30
        ldrsh   r0, [r0]
        ldrsh   r1, [r1, #2]
        ldrsh   r2, [r2, #4]
        ldrsh   r3, [r3, #6]
        ldrsh   r12, [r12, #8]
        add     sp, sp, #0xB1, 30
        and     r0, r0, #0x7F
        and     r1, r1, #0x7F
        and     r2, r2, #0x7F
        and     r3, r3, #0x7F
        and     r12, r12, #0x7F
        strh    r0, [lr]
        strh    r1, [lr, #2]
        strh    r2, [lr, #4]
        strh    r3, [lr, #6]
        strh    r12, [lr, #8]
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDNN27:
        ldr     r1, [sp, #0x10]
        rsb     r7, r7, #0
        strh    r3, [r9, +r0]
        strh    r1, [r5, +r0]
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        b       LDNN3
LDNN28:
        cmn     lr, #7, 2
        mvngt   lr, #2, 2
        bgt     LDNN29
        cmp     lr, #3, 2
        movge   lr, lr, lsl #1
        movlt   lr, #2, 2
LDNN29:
        str     lr, [sp, #0x6C0]
        b       LDNN0
LDNN_ownBuildCode_G729E_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        ldr     r11, [sp, #0x34]
        mov     r4, r0
        mov     r9, r1
        mov     r1, #0x28
        mov     r0, r6
        mov     r7, r2
        mov     r8, r3
        bl      _ippsZero_16s
        mov     r1, #0x28
        mov     r0, r5
        bl      _ippsZero_16s
        mvn     r12, #0
        cmp     r7, #0
        strh    r12, [r11]
        strh    r12, [r11, #2]
        strh    r12, [r11, #4]
        strh    r12, [r11, #6]
        strh    r12, [r11, #8]
        ble     LDNN36
        ldr     r10, [pc, #0x11C]
        str     r8, [sp]
        str     r9, [sp, #4]
LDNN30:
        ldrsh   lr, [r4]
        smull   r12, r3, lr, r10
        mov     r1, lr, asr #31
        smull   r8, r12, lr, r10
        ldr     r8, [sp, #4]
        rsb     r3, r1, r3, asr #1
        rsb     r12, r1, r12, asr #1
        mov     r1, lr, lsl #1
        ldrsh   r8, [r8, +r1]
        add     r3, r3, r3, lsl #2
        sub     lr, lr, r3
        ldrsh   r3, [r6, +r1]
        cmp     r8, #0
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #16
        mov     r9, r12, asr #16
        mov     r8, lr, asr #15
        ble     LDNN37
        add     r3, r3, #1, 20
        strh    r3, [r6, +r1]
        ldrsh   r3, [r4]
        ldr     r0, [sp]
        add     r1, r5, r3, lsl #1
        rsb     r2, r3, #0x28
        bl      _ippsAdd_16s_I
LDNN31:
        ldrsh   r1, [r11, +r8]
        cmp     r1, #0
        strlth  r9, [r11, +r8]
        blt     LDNN35
        eor     r3, r9, r1
        tst     r3, #8
        bne     LDNN33
        cmp     r1, r9
        bgt     LDNN32
        add     r1, r9, r1, lsl #4
        orr     r1, r1, #1, 24
        strh    r1, [r11, +r8]
        b       LDNN35
LDNN32:
        add     r9, r1, r9, lsl #4
        orr     r1, r9, #1, 24
        strh    r1, [r11, +r8]
        b       LDNN35
LDNN33:
        and     r3, r1, #7
        and     r12, r9, #7
        cmp     r3, r12
        bgt     LDNN34
        add     r9, r1, r9, lsl #4
        orr     r1, r9, #1, 24
        strh    r1, [r11, +r8]
        b       LDNN35
LDNN34:
        add     r1, r9, r1, lsl #4
        orr     r1, r1, #1, 24
        strh    r1, [r11, +r8]
LDNN35:
        subs    r7, r7, #1
        add     r4, r4, #2
        bne     LDNN30
LDNN36:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDNN37:
        sub     r3, r3, #1, 20
        strh    r3, [r6, +r1]
        ldrsh   r12, [r4]
        ldr     r0, [sp]
        add     r9, r9, #8
        add     r1, r5, r12, lsl #1
        rsb     r2, r12, #0x28
        mov     r3, r9, lsl #16
        mov     r9, r3, asr #16
        bl      _ippsSub_16s_I
        b       LDNN31
        .long   LDNN_ipos
        .long   0x66666667


        .data
        .align  4


LDNN_ipos:
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00
        .byte   0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00


