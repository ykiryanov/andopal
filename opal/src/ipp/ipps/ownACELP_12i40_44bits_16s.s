        .text
        .align  4
        .globl  ownACELP_12i40_44bits_16s


ownACELP_12i40_44bits_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6A, 28
        add     r12, sp, #0xCE, 30
        ldr     r11, [sp, #0x6C8]
        and     r12, r12, #0x1F
        rsb     r4, r12, #0
        ldr     r12, [sp, #0x6C4]
        add     r7, sp, #1, 22
        add     r7, r7, #0xF8
        add     lr, sp, #0xCE, 30
        str     r12, [sp, #0x90]
        and     r4, r4, #0x1F
        and     r7, r7, #0xF
        add     r12, sp, #1, 22
        add     r5, lr, r4
        rsb     r7, r7, #0
        add     lr, sp, #1, 22
        and     r7, r7, #0xF
        add     r12, r12, #0xF8
        add     lr, lr, #0x98
        add     r7, r12, r7
        add     r12, sp, #1, 22
        and     lr, lr, #0xF
        add     r4, sp, #1, 22
        add     r12, r12, #0x5E, 30
        rsb     lr, lr, #0
        add     r4, r4, #0x98
        and     lr, lr, #0xF
        and     r12, r12, #0xF
        add     r4, r4, lr
        rsb     r12, r12, #0
        add     lr, sp, #1, 22
        and     r12, r12, #0xF
        add     lr, lr, #0x5E, 30
        str     r0, [sp, #0x8C]
        add     r12, lr, r12
        mov     r8, r1
        str     r12, [sp, #0x58]
        str     r8, [sp, #0x80]
        mov     r0, r5
        mov     r1, #0xA0
        add     r10, sp, #0x98
        mov     r6, r2
        mov     r9, r3
        bl      _ippsZero_16s
        add     r3, sp, #1, 22
        add     r3, r3, #0xA7, 30
        mov     r0, r8
        mov     r2, #0
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x69C]
        add     lr, sp, #1, 22
        add     r8, sp, #0x98
        add     lr, lr, #0x56, 30
        and     r8, r8, #0x1F
        and     lr, lr, #0xF
        rsb     r8, r8, #0
        rsb     lr, lr, #0
        and     r8, r8, #0x1F
        add     r0, sp, #1, 22
        and     lr, lr, #0xF
        add     r10, r10, r8
        add     r0, r0, #0x56, 30
        add     r8, r5, #0x50
        add     lr, r0, lr
        add     r5, r5, #0xF0
        cmp     r12, #1, 24
        str     lr, [sp, #0x88]
        str     r5, [sp, #0x94]
        movlt   r12, #2, 24
        strlt   r12, [sp, #0x69C]
        bge     LDNM37
LDNM0:
        add     r0, sp, #1, 22
        add     r0, r0, #0xA7, 30
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        ldr     r12, [sp, #0x69C]
        ldr     r0, [sp, #0x8C]
        add     r3, sp, #1, 22
        add     r3, r3, #0xA7, 30
        mov     r12, r12, asr #11
        mov     r2, #0
        mov     r1, #0x28
        mov     r5, r12, lsl #16
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x69C]
        mov     r5, r5, asr #16
        rsb     r5, r5, r5, lsl #15
        cmp     r12, #1, 24
        mov     lr, r5, asr #15
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        str     lr, [sp, #0x84]
        movge   r12, r12, lsl #1
        movlt   r12, #2, 24
        add     r0, sp, #1, 22
        str     r12, [sp, #0x69C]
        add     r0, r0, #0xA7, 30
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        mov     r5, #0
        ldr     r0, [sp, #0x69C]
        mov     r12, r5
        sub     r1, r5, #2, 18
        mvn     lr, #0xFF
        mov     r0, r0, asr #11
        str     r12, [sp, #0x18]
        str     r1, [sp, #0x10]
        str     r10, [sp, #0x24]
        str     r11, [sp, #0x28]
        ldr     r1, [sp, #0x18]
        ldr     r10, [sp, #0x80]
        ldr     r11, [sp, #0x8C]
        bic     lr, lr, #0x7F, 24
        mov     r0, r0, lsl #16
        mvn     lr, lr
        str     r8, [sp, #0x20]
        mov     r0, r0, asr #16
        str     r9, [sp, #0x2C]
        str     r6, [sp, #0x30]
LDNM1:
        cmp     r1, #0x28
        mov     r3, r1
        mvnge   r9, #0
        bge     LDNM5
        mov     r8, r1
        mvn     r9, #0
        str     r1, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r5, [sp, #0x1C]
LDNM2:
        mov     r5, r8, lsl #1
        ldrsh   r12, [r11, +r5]
        ldrsh   r1, [r10, +r5]
        ldr     r2, [sp, #0x84]
        mul     r6, r0, r12
        mlas    r6, r2, r1, r6
        bmi     LDNM36
        strh    lr, [r7, +r5]
        ldr     r1, [sp, #0x10]
        strh    r1, [r4, +r5]
LDNM3:
        cmp     r6, #0
        strh    r12, [r11, +r5]
        bge     LDNM4
        cmp     r6, #2, 2
        mvneq   r6, #2, 2
        rsbne   r6, r6, #0
LDNM4:
        cmp     r6, r9
        movgt   r9, r6
        strgt   r3, [sp, #0x14]
        add     r8, r8, #5
        mov     r3, r8, lsl #16
        mov     r3, r3, asr #16
        mov     r8, r3
        cmp     r8, #0x28
        blt     LDNM2
        ldr     r1, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     r5, [sp, #0x1C]
        str     r6, [sp, #0x69C]
LDNM5:
        add     r3, sp, #0x67, 28
        str     r9, [r3, +r1, lsl #2]
        add     r6, sp, #0x65, 28
        add     r1, r1, #1
        strh    r12, [r6, +r5]
        cmp     r1, #5
        add     r5, r5, #2
        blt     LDNM1
        ldr     r10, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        ldr     r6, [sp, #0x30]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        str     r10, [sp, #8]
        ldr     r12, [sp, #0x94]
        mov     r3, r8
        mov     r2, r4
        mov     r1, r7
        str     r12, [sp]
        add     r12, sp, #1, 22
        add     r12, r12, #0x7A, 30
        str     r12, [sp, #4]
        mov     r0, r6
        bl      _ippsToeplizMatrix_G729E_16s
        add     r1, sp, #0x67, 28
        add     r0, sp, #0x67, 28
        ldr     r12, [r0, #0x10]
        ldr     r1, [r1]
        mov     r5, #0
        mov     lr, r5
        add     r12, r12, r1
LDNM6:
        add     r3, sp, #0x67, 28
        add     r3, r3, r5
        add     r1, sp, #0x67, 28
        ldr     r3, [r3, #4]
        ldr     r2, [r1, +lr, lsl #2]
        add     r5, r5, #4
        add     r3, r2, r3
        str     r3, [r1, +lr, lsl #2]
        add     lr, lr, #1
        cmp     lr, #4
        blt     LDNM6
        str     r12, [r0, #0x10]
        mvn     r5, #0
        mov     lr, #0
        mov     r12, #3
LDNM7:
        add     r1, sp, #0x67, 28
        ldr     r1, [r1]
        mov     r0, #0
        mov     r2, #1
LDNM8:
        add     r3, sp, #0x67, 28
        ldr     r3, [r3, +r2, lsl #2]
        cmp     r3, r1
        movgt   r1, r3
        movgt   r0, r2
        add     r2, r2, #1
        cmp     r2, #5
        blt     LDNM8
        add     r3, sp, #1, 22
        mov     r2, r0, lsl #16
        add     r3, r3, #0x9A, 30
        add     r1, sp, #0x67, 28
        strh    r0, [r3, +lr]
        mov     r2, r2, asr #16
        subs    r12, r12, #1
        str     r5, [r1, +r2, lsl #2]
        add     lr, lr, #2
        bne     LDNM7
        mvn     r12, #0xFF
        bic     r5, r12, #0x7F, 24
        mvn     r1, r5
        mvn     r0, #0
        mov     lr, #1
        add     r12, r4, #2
        mov     r2, #3
        mov     r5, #0
        str     r2, [sp, #0x84]
        str     r1, [sp, #0x74]
        str     r12, [sp, #0x70]
        str     lr, [sp, #0x7C]
        str     r0, [sp, #0x80]
        str     r8, [sp, #0x20]
        str     r10, [sp, #0x24]
        str     r7, [sp, #0x50]
        str     r11, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r6, [sp, #0x30]
LDNM9:
        add     r3, sp, #1, 22
        add     r3, r3, #0x9A, 30
        ldrsh   r12, [r3, +r5]
        ldr     lr, [pc, #0xAA8]
        ldr     r8, [pc, #0xAA8]
        mov     r3, r12, lsl #1
        add     r7, sp, #0x65, 28
        ldrsh   r3, [lr, +r3]
        add     r12, lr, r12, lsl #1
        str     r12, [sp, #0x78]
        ldrsh   r12, [r12, #2]
        mov     r10, r3, lsl #1
        ldrsh   r7, [r7, +r10]
        add     r6, sp, #0x65, 28
        mov     r10, r12, lsl #1
        ldrsh   r6, [r6, +r10]
        smull   r11, r10, r7, r8
        add     lr, sp, #1, 22
        add     lr, lr, #0xA1, 30
        strh    r7, [lr]
        smull   r8, lr, r6, r8
        mov     r8, r6, asr #31
        rsb     lr, r8, lr, asr #1
        add     r8, sp, #1, 22
        add     r8, r8, #0xA1, 30
        mov     r11, r7, asr #31
        rsb     r10, r11, r10, asr #1
        strh    r6, [r8, #2]
        mov     r8, lr, lsl #16
        mov     r10, r10, lsl #16
        ldr     r1, [sp, #0x24]
        mov     lr, r10, asr #16
        add     r9, sp, #1, 22
        mov     r10, r8, asr #16
        add     r9, r9, #0x7A, 30
        add     r8, r10, lr, lsl #3
        mov     lr, lr, lsl #1
        add     r9, r9, r3, lsl #4
        ldrsh   lr, [r9, +lr]
        add     r9, sp, #1, 22
        add     r9, r9, #0x7A, 30
        add     r12, r9, r12, lsl #4
        mov     r10, r10, lsl #1
        ldrsh   r12, [r12, +r10]
        mov     r0, r8, lsl #16
        ldr     r8, [sp, #0x8C]
        mov     r10, r7, lsl #1
        mov     r0, r0, asr #15
        add     r3, r1, r3, lsl #7
        ldrsh   r11, [r8, +r10]
        ldrsh   r0, [r3, +r0]
        mov     r9, r6, lsl #1
        ldrsh   r8, [r8, +r9]
        add     r12, lr, r12
        add     r12, r0, r12
        mov     r1, #0x28
        add     r8, r11, r8
        mov     r0, r4
        mov     r11, r12, lsl #16
        bl      _ippsZero_16s
        mov     r8, r8, lsl #16
        mov     r11, r11, asr #16
        str     r11, [sp, #0x38]
        str     r5, [sp, #0x40]
        mov     r0, r10
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x58]
        ldr     r11, [sp, #0x50]
        mov     r3, #2
        mov     r8, r8, asr #16
        str     r3, [sp, #0x1C]
LDNM10:
        ldrsh   r0, [r0, +r11]
        cmp     r0, #0
        ldrlt   r3, [sp, #0x94]
        sublt   r0, r3, r7, lsl #1
        subge   r0, r5, r7, lsl #1
        ldrsh   r9, [r9, +r11]
        cmp     r9, #0
        ldrlt   r3, [sp, #0x94]
        sublt   r9, r3, r6, lsl #1
        subge   r9, r5, r6, lsl #1
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsAdd_16s_I
        mov     r0, r9
        mov     r2, #0x28
        mov     r1, r4
        bl      _ippsAdd_16s_I
        ldr     r3, [sp, #0x1C]
        ldr     lr, [sp, #0x78]
        mov     r12, r3, lsl #1
        str     r12, [sp, #0x18]
        ldrsh   r3, [lr, +r12]
        add     r12, lr, r12
        str     r12, [sp, #0x10]
        str     r3, [sp, #0x14]
        ldrsh   r9, [r12, #2]
        mov     r12, #0xF
        str     r12, [sp, #8]
        cmp     r3, r9
        rsb     r2, r3, #0x28
        mov     r12, #8
        add     r1, r4, r3, lsl #1
        str     r12, [sp, #4]
        str     r10, [sp]
        add     r3, r11, r3, lsl #1
        str     r3, [sp, #0x3C]
        bge     LDNM12
        mov     r0, r5
        mov     r3, #5
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r3, [sp, #0x70]
        ldr     r12, [sp, #0x14]
        mov     r0, r5
        add     lr, sp, #1, 22
        add     lr, lr, #0x7A, 30
        add     r1, r3, r12, lsl #1
        mov     r3, #0xF
        str     r3, [sp, #8]
        mov     r3, #8
        str     r3, [sp, #4]
        ldr     r9, [sp, #0x88]
        rsb     r2, r12, #0x27
        add     lr, lr, r12, lsl #4
        str     r9, [sp]
        add     r12, r12, #1
        str     r12, [sp, #0x64]
        str     lr, [sp, #0x34]
        mov     r3, #5
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r3, [sp, #0x64]
        ldr     r5, [sp, #0x3C]
        mov     lr, r10
        add     r12, r11, r3, lsl #1
        ldr     r3, [sp, #0x34]
        str     r4, [sp, #0x54]
        ldr     r4, [sp, #0x34]
        add     r3, r3, #0x10
        mov     r0, #8
        str     r8, [sp, #0x4C]
LDNM11:
        ldrsh   r10, [lr]
        ldrsh   r11, [r5], #0xA
        ldrsh   r8, [r4], #2
        ldrsh   r1, [r12], #0xA
        ldrsh   r2, [r9]
        mul     r10, r10, r11
        mul     r1, r2, r1
        add     r10, r8, r10, asr #15
        strh    r10, [lr], #2
        ldrsh   r2, [r3], #2
        add     r1, r2, r1, asr #15
        strh    r1, [r9], #2
        subs    r0, r0, #1
        bne     LDNM11
        ldr     r8, [sp, #0x4C]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x58]
        ldr     r4, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        b       LDNM14
LDNM12:
        mov     r0, r5
        mov     r3, #5
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        mov     r3, #0xF
        str     r3, [sp, #8]
        mov     r3, #8
        str     r3, [sp, #4]
        ldr     r3, [sp, #0x88]
        add     r12, sp, #1, 22
        add     r12, r12, #0x7A, 30
        str     r3, [sp]
        add     r12, r12, r9, lsl #4
        str     r12, [sp, #0x14]
        add     r1, r4, r9, lsl #1
        rsb     r2, r9, #0x28
        mov     r0, r5
        mov     r3, #5
        bl      _ippsCrossCorr_Step_NR_Sfs_16s
        ldr     r3, [sp, #0x14]
        ldr     r5, [sp, #0x3C]
        add     r9, r11, r9, lsl #1
        add     r12, r3, #0x40
        ldr     r3, [sp, #0x88]
        str     r4, [sp, #0x54]
        ldr     r4, [sp, #0x14]
        mov     r0, r10
        mov     lr, #8
        str     r8, [sp, #0x4C]
LDNM13:
        ldrsh   r10, [r3]
        ldrsh   r11, [r9], #0xA
        ldrsh   r8, [r4], #2
        ldrsh   r1, [r5], #0xA
        ldrsh   r2, [r0]
        mul     r10, r10, r11
        mul     r1, r2, r1
        add     r10, r8, r10, asr #15
        strh    r10, [r3], #2
        ldrsh   r2, [r12], #2
        add     r1, r2, r1, asr #15
        strh    r1, [r0], #2
        subs    lr, lr, #1
        bne     LDNM13
        ldr     r8, [sp, #0x4C]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x58]
        ldr     r4, [sp, #0x54]
        ldr     r11, [sp, #0x50]
LDNM14:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x78]
        ldr     lr, [sp, #0x8C]
        ldr     r11, [sp, #0x38]
        mvn     r2, #0
        ldrsh   r1, [r12, +r3]
        ldr     r3, [sp, #0x10]
        ldrsh   r0, [r3, #2]
        ldr     r3, [sp, #0x24]
        add     r9, lr, r1, lsl #1
        str     r2, [sp, #0x60]
        add     lr, lr, r0, lsl #1
        str     lr, [sp, #0x3C]
        add     r12, r3, r1, lsl #7
        mov     lr, r10
        ldr     r10, [sp, #0x74]
        mov     r3, #1
        str     r3, [sp, #0x14]
        mov     r3, #0
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x5C]
        str     r6, [sp, #0x68]
        str     r7, [sp, #0x6C]
        str     r4, [sp, #0x54]
LDNM15:
        ldrsh   r0, [r9], #0xA
        add     r0, r8, r0
        cmp     r10, r0
        blt     LDNM16
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r5, r0, asr #16
        movlt   r0, #0
        sublt   r5, r0, #2, 18
        b       LDNM17
LDNM16:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r5, r0
LDNM17:
        ldrsh   r0, [lr], #2
        add     r0, r11, r0
        cmp     r10, r0
        blt     LDNM18
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r4, r0, asr #16
        movlt   r0, #0
        sublt   r4, r0, #2, 18
        b       LDNM19
LDNM18:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r4, r0
LDNM19:
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x3C]
        mov     r6, r12
        str     r12, [sp, #0x34]
        str     lr, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x60]
        mvn     r2, #0
        mov     r7, #0
        str     r9, [sp, #0x44]
        str     r3, [sp, #0x48]
        str     r8, [sp, #0x4C]
LDNM20:
        ldrsh   r3, [r1], #0xA
        add     r3, r5, r3
        cmp     r10, r3
        blt     LDNM21
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r8, r3, asr #16
        movlt   r3, #0
        sublt   r8, r3, #2, 18
        b       LDNM22
LDNM21:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r8, r3
LDNM22:
        ldrsh   r3, [r6], #2
        ldrsh   r9, [r0], #2
        add     r3, r9, r3
        mov     r3, r3, lsl #16
        add     r3, r4, r3, asr #16
        cmp     r10, r3
        blt     LDNM23
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNM24
LDNM23:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNM24:
        mul     r8, r8, r8
        rsb     r9, lr, #0
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mul     r11, r12, r8
        mla     r11, r9, r3, r11
        cmp     r11, #0
        ble     LDNM25
        mov     lr, r8
        mov     r12, r3
        mov     r2, r7
LDNM25:
        add     r7, r7, #1
        cmp     r7, #8
        blt     LDNM20
        ldr     r11, [sp, #0x38]
        ldr     r9, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        ldr     r8, [sp, #0x4C]
        str     r12, [sp, #0x14]
        ldr     r12, [sp, #0x34]
        str     lr, [sp, #0x60]
        ldr     lr, [sp, #0x10]
        mov     r0, r2, lsl #16
        movs    r0, r0, asr #16
        strpl   r3, [sp, #0x6C]
        strpl   r2, [sp, #0x68]
        add     r3, r3, #1
        cmp     r3, #8
        add     r12, r12, #0x10
        blt     LDNM15
        ldr     r6, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        ldr     r7, [sp, #0x6C]
        ldr     r1, [sp, #0x5C]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x58]
        ldr     r4, [sp, #0x54]
        ldr     r11, [sp, #0x50]
        add     r6, r6, r6, lsl #2
        add     r7, r7, r7, lsl #2
        add     r6, r0, r6
        add     r7, r1, r7
        mov     r3, r6, lsl #16
        mov     r7, r7, lsl #16
        mov     r6, r3, asr #16
        ldr     r3, [sp, #0x8C]
        mov     r7, r7, asr #16
        mov     r9, r6, lsl #1
        mov     r0, r7, lsl #1
        ldrsh   r12, [r3, +r0]
        ldrsh   r3, [r3, +r9]
        add     r8, r8, r12
        ldr     r12, [sp, #0x14]
        add     r3, r8, r3
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x74]
        cmp     r12, r3
        blt     LDNM26
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r8, r3, asr #16
        mvnlt   r3, #0xFF
        biclt   r8, r3, #0x7F, 24
        b       LDNM27
LDNM26:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mvn     r8, r3
LDNM27:
        ldr     r1, [sp, #0x1C]
        add     lr, sp, #1, 22
        add     lr, lr, #0xA1, 30
        add     r3, r1, #2
        mov     r1, r1, lsl #1
        strh    r7, [lr, +r1]
        ldr     lr, [sp, #0x18]
        add     r12, sp, #1, 22
        mov     r3, r3, lsl #16
        add     r12, r12, #0xA1, 30
        add     r12, r12, lr
        mov     r3, r3, asr #16
        str     r3, [sp, #0x1C]
        cmp     r3, #0xC
        strh    r6, [r12, #2]
        blt     LDNM10
        mul     r8, r8, r8
        ldr     r6, [sp, #0x7C]
        ldr     r3, [sp, #0x14]
        ldr     r5, [sp, #0x40]
        ldr     r12, [sp, #0x80]
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     lr, r8, asr #16
        mul     r6, r6, lr
        rsb     r12, r12, #0
        mla     r6, r12, r3, r6
        cmp     r6, #0
        ble     LDNM29
        str     lr, [sp, #0x80]
        str     r3, [sp, #0x7C]
        mov     r12, #0
        mov     lr, #0xC
LDNM28:
        add     r6, sp, #1, 22
        add     r6, r6, #0xA1, 30
        ldrsh   r6, [r6, +r12]
        add     r3, sp, #1, 22
        add     r3, r3, #0x8E, 30
        strh    r6, [r3, +r12]
        subs    lr, lr, #1
        add     r12, r12, #2
        bne     LDNM28
LDNM29:
        ldr     r3, [sp, #0x84]
        add     r5, r5, #2
        subs    r3, r3, #1
        str     r3, [sp, #0x84]
        bne     LDNM9
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x50]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        add     r2, sp, #1, 22
        add     r2, r2, #0x66, 30
        mov     r0, r6
        mov     r3, #0x28
        mov     r1, #1
        bl      _ippsRShiftC_16s
        ldr     r12, [sp, #0x90]
        add     r2, sp, #1, 22
        add     r3, sp, #1, 22
        add     r0, sp, #1, 22
        add     r2, r2, #0x97, 30
        str     r2, [sp, #8]
        str     r12, [sp, #4]
        add     r3, r3, #0x66, 30
        add     r0, r0, #0x8F, 30
        str     r9, [sp]
        mov     r2, #0xA
        mov     r1, r7
        bl      LDNM_ownBuildCode_G729E_16s
        mov     r5, r11
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x90]
        mov     r8, #0
        mov     r6, r8
LDNM30:
        add     r2, sp, #1, 22
        add     r2, r2, #0x8E, 30
        ldrsh   lr, [r2, +r8]
        ldr     r4, [pc, #0x3C8]
        add     r0, sp, #1, 22
        add     r0, r0, #0x66, 30
        mov     r12, lr, asr #31
        smull   r10, r2, lr, r4
        smull   r4, r10, lr, r4
        rsb     r2, r12, r2, asr #1
        add     r2, r2, r2, lsl #2
        rsb     r10, r12, r10, asr #1
        mov     r12, lr, lsl #1
        ldrsh   r4, [r7, +r12]
        mov     r10, r10, lsl #16
        add     r1, r11, r12
        mov     r10, r10, asr #16
        cmp     r4, #0
        sub     r4, lr, r2
        rsb     r2, lr, #0x28
        ldrsh   lr, [r9, +r12]
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        ble     LDNM35
        add     lr, lr, #1, 20
        strh    lr, [r9, +r12]
        bl      _ippsAdd_16s_I
LDNM31:
        add     r2, sp, #1, 22
        mov     r0, r4, lsl #1
        add     r2, r2, #0x97, 30
        ldrsh   r0, [r2, +r0]
        mov     r2, r10
        mov     r12, r0, asr #4
        and     lr, r12, #0xF
        and     r0, r0, #0xF
        and     r12, r0, #7
        and     r1, lr, #7
        cmp     r1, r12
        mov     r12, lr
        movgt   r12, r0
        movgt   r0, lr
        and     r1, r12, #7
        and     lr, r10, #7
        cmp     r1, lr
        movgt   r2, r12
        movgt   r12, r10
        mov     lr, r0
        and     r1, lr, #7
        and     r10, r2, #7
        cmp     r1, r10
        movgt   lr, r2
        movgt   r2, r0
        mov     r0, r12, asr #1
        mov     r10, lr, asr #2
        and     r0, r0, #4
        and     r10, r10, #2
        add     r0, r0, r10
        mov     r10, r2, asr #3
        and     r10, r10, #1
        add     r10, r0, r10
        mov     r0, r10, lsl #16
        ldr     r10, [pc, #0x2E4]
        mov     r0, r0, asr #16
        sub     r0, r0, #8
        cmn     r0, #8
        ldrcsb  r0, [r10, +r0]
        addcs   pc, pc, r0
        mov     r0, #0
LDNM_.Lpc1:
        b       LDNM32
LDNM_bd.1.1:
        .long   0xe20ee007
        .long   0xe20cc007
        .long   0xe1a0e20e
        .long   0xe08ec38c
        .long   0xe08c2002
        .long   0xe1a00802
        .long   0xe1a00840
        .long   0xea000014
LDNM_bd.1.2:
        .long   0xe20cc007
        .long   0xe2022007
        .long   0xe08ec20c
        .long   0xe08c2382
        .long   0xe1a00802
        .long   0xe1a00840
        .long   0xea00000d
LDNM_bd.1.3:
        .long   0xe20ee007
        .long   0xe20cc007
        .long   0xe1a0e38e
        .long   0xe08ec20c
        .long   0xe08c2002
        .long   0xe1a00802
        .long   0xe1a00840
        .long   0xea000005
LDNM_bd.1.4:
        .long   0xe20ee007
        .long   0xe2022007
        .long   0xe08ce38e
        .long   0xe08e2202
        .long   0xe1a00802
        .long   0xe1a00840
LDNM32:
        cmp     r6, #0
        bne     LDNM33
        add     r0, r0, r4, lsl #10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDNM33:
        add     r6, r6, #1
        strh    r0, [r5], #2
        cmp     r6, #2
        add     r8, r8, #2
        blt     LDNM30
        ldr     r11, [sp, #0x28]
        mov     r0, #3
        add     r11, r11, #4
LDNM34:
        add     r4, r4, #1
        mov     r1, r4, lsl #16
        mov     r2, r1, asr #16
        cmp     r2, #5
        movge   r4, #0
        movge   r2, r4
        add     r1, sp, #1, 22
        mov     r2, r2, lsl #1
        add     r1, r1, #0x97, 30
        ldrsh   r2, [r1, +r2]
        subs    r0, r0, #1
        and     r1, r2, #0x7F
        strh    r1, [r11], #2
        bne     LDNM34
        add     sp, sp, #0x6A, 28
        ldmia   sp!, {r4 - r11, pc}
LDNM35:
        sub     lr, lr, #1, 20
        strh    lr, [r9, +r12]
        add     r10, r10, #8
        bl      _ippsSub_16s_I
        mov     r0, r10, lsl #16
        mov     r10, r0, asr #16
        b       LDNM31
LDNM36:
        ldr     r1, [sp, #0x10]
        rsb     r12, r12, #0
        strh    lr, [r4, +r5]
        strh    r1, [r7, +r5]
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDNM3
LDNM37:
        cmn     r12, #7, 2
        mvngt   r12, #2, 2
        bgt     LDNM38
        cmp     r12, #3, 2
        movge   r12, r12, lsl #1
        movlt   r12, #2, 2
LDNM38:
        str     r12, [sp, #0x69C]
        b       LDNM0
LDNM_bt.1:
        .long   0x60402404
        .long   0x04244060
LDNM_ownBuildCode_G729E_16s:
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
        ble     LDNM45
        ldr     r10, [pc, #0x11C]
        str     r8, [sp]
        str     r9, [sp, #4]
LDNM39:
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
        ble     LDNM46
        add     r3, r3, #1, 20
        strh    r3, [r6, +r1]
        ldrsh   r3, [r4]
        ldr     r0, [sp]
        add     r1, r5, r3, lsl #1
        rsb     r2, r3, #0x28
        bl      _ippsAdd_16s_I
LDNM40:
        ldrsh   r1, [r11, +r8]
        cmp     r1, #0
        strlth  r9, [r11, +r8]
        blt     LDNM44
        eor     r3, r9, r1
        tst     r3, #8
        bne     LDNM42
        cmp     r1, r9
        bgt     LDNM41
        add     r1, r9, r1, lsl #4
        orr     r1, r1, #1, 24
        strh    r1, [r11, +r8]
        b       LDNM44
LDNM41:
        add     r9, r1, r9, lsl #4
        orr     r1, r9, #1, 24
        strh    r1, [r11, +r8]
        b       LDNM44
LDNM42:
        and     r3, r1, #7
        and     r12, r9, #7
        cmp     r3, r12
        bgt     LDNM43
        add     r9, r1, r9, lsl #4
        orr     r1, r9, #1, 24
        strh    r1, [r11, +r8]
        b       LDNM44
LDNM43:
        add     r1, r9, r1, lsl #4
        orr     r1, r1, #1, 24
        strh    r1, [r11, +r8]
LDNM44:
        subs    r7, r7, #1
        add     r4, r4, #2
        bne     LDNM39
LDNM45:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDNM46:
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
        b       LDNM40
        .long   LDNM_ipos
        .long   0x66666667
        .long   LDNM_bt.1


        .data
        .align  4


LDNM_ipos:
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00
        .byte   0x03,0x00,0x04,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x00,0x00


