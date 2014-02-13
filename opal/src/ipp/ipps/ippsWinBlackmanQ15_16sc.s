        .text
        .align  4
        .globl  _ippsWinBlackmanQ15_16sc


_ippsWinBlackmanQ15_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r11, r2
        mov     r10, r3
        beq     LAML17
        cmp     r4, #0
        beq     LAML17
        cmp     r11, #3
        blt     LAML14
        sub     r0, r11, #1
        str     r0, [sp, #8]
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r7, #1, 2
        sub     r1, r7, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x4A0]
        ldr     r3, [pc, #0x4A0]
        bl      __muldf3
        bl      cos
        add     lr, r5, r11, lsl #2
        sub     r6, lr, #4
        add     r12, r4, r11, lsl #2
        mov     lr, #0
        cmp     r11, #3
        str     r0, [sp]
        mov     r9, r1
        sub     r8, r12, #4
        str     lr, [sp, #4]
        beq     LAML18
        mov     r0, r10
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0x10]
        sub     r3, r7, #1, 12
        str     r3, [sp, #0x18]
        mov     r2, #0
        bl      __adddf3
        sub     r3, r7, #2, 12
        mov     r2, #0
        bl      __muldf3
        add     r10, r7, #0x1D, 12
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x14]
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        mov     r1, r9
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        ldr     r2, [sp]
        str     r0, [sp, #0x14]
        mov     r0, r2
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r0
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        ldr     r3, [sp, #8]
        ldr     r12, [sp, #4]
        cmp     r3, #0
        mov     r3, #1
        movlt   r12, r3
        add     r12, r11, r12
        sub     r2, r12, #1
        movs    r2, r2, asr #1
        sub     lr, r2, #1
        beq     LAML9
        mov     r3, r0, asr #31
        rsbs    r12, r0, #0
        rsc     r9, r3, #0
        mvn     r2, #0xFF
        str     r9, [sp, #4]
        ldr     r9, [sp, #0x14]
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
        mov     r3, #0
        str     r0, [sp, #8]
LAML0:
        smull   r1, r10, r7, r7
        mov     r0, r10, lsl #2
        ldrsh   r11, [r5]
        ldr     r10, [sp, #0xC]
        orr     r1, r0, r1, lsr #30
        sub     r0, r1, #2, 4
        ldr     r1, [sp, #0x10]
        sub     r10, r10, r7, asr #1
        smull   r0, r1, r1, r0
        mov     r1, r1, lsl #2
        orr     r0, r1, r0, lsr #30
        sub     r10, r10, r0
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        mul     r11, r11, r10
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        cmp     r2, r11
        bge     LAML16
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LAML1:
        strh    r11, [r4]
        ldrsh   r11, [r5, #2]
        mul     r11, r10, r11
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        cmp     r2, r11
        bge     LAML2
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
        b       LAML3
LAML2:
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
LAML3:
        strh    r11, [r4, #2]
        ldrsh   r11, [r6]
        mul     r11, r10, r11
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        cmp     r2, r11
        bge     LAML4
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
        b       LAML5
LAML4:
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
LAML5:
        strh    r11, [r8]
        ldrsh   r11, [r6, #2]
        mul     r11, r10, r11
        add     r10, r11, #1, 18
        mov     r10, r10, asr #15
        cmp     r2, r10
        bge     LAML6
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
        str     r10, [sp]
        b       LAML8
LAML6:
        cmn     r10, #2, 18
        bge     LAML7
        mov     r10, #0
        sub     r10, r10, #2, 18
        str     r10, [sp]
        b       LAML8
LAML7:
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        str     r10, [sp]
LAML8:
        smull   r1, r0, r9, r7
        umull   r10, r11, r3, r12
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x18]
        add     r5, r5, #4
        mla     r11, r3, r0, r11
        sub     r6, r6, #4
        adds    r10, r1, r10
        add     r4, r4, #4
        sub     lr, lr, #1
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #8]
        ldr     r1, [sp, #0x20]
        smull   r7, r11, r7, r11
        str     r7, [sp, #0x24]
        smull   r0, r7, r9, r3
        mov     r3, r3, asr #31
        mla     r3, r3, r12, r1
        ldr     r1, [sp]
        strh    r1, [r8, #2]
        ldr     r1, [sp, #0x1C]
        sub     r8, r8, #4
        adc     r3, r1, r3
        ldr     r1, [sp, #0x24]
        mov     r3, r3, lsl #2
        adds    r0, r1, r0
        adc     r11, r11, r7
        orr     r7, r3, r10, lsr #30
        cmn     lr, #1
        mov     r11, r11, lsl #2
        orr     r3, r11, r0, lsr #30
        bne     LAML0
LAML9:
        cmp     r4, r8
        beq     LAML15
        smull   r2, r3, r7, r7
        mov     r12, r3, lsl #2
        ldrsh   r3, [r5]
        orr     r2, r12, r2, lsr #30
        ldr     r12, [sp, #0x10]
        sub     r2, r2, #2, 4
        smull   r2, r12, r12, r2
        mov     lr, r12, lsl #2
        ldr     r12, [sp, #0xC]
        sub     r7, r12, r7, asr #1
        mov     r12, #0
        orr     r2, lr, r2, lsr #30
        sub     r7, r7, r2
        add     r2, r7, #1, 18
        mov     r2, r2, asr #15
        mul     r7, r3, r2
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     lr, r3
        add     r7, r7, #1, 18
        mov     r7, r7, asr #15
        cmp     lr, r7
        mvnlt   r7, r3
        blt     LAML10
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        sublt   r7, r12, #2, 18
LAML10:
        strh    r7, [r4]
        ldrsh   r5, [r5, #2]
        mvn     r0, r3
        mul     r5, r2, r5
        add     r5, r5, #1, 18
        mov     r5, r5, asr #15
        cmp     r0, r5
        mvnlt   r5, r3
        blt     LAML11
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        sublt   r5, r12, #2, 18
LAML11:
        strh    r5, [r4, #2]
        ldrsh   r1, [r6]
        mvn     r0, r3
        mul     r1, r2, r1
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        cmp     r0, r1
        mvnlt   r1, r3
        blt     LAML12
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        sublt   r1, r12, #2, 18
LAML12:
        strh    r1, [r8]
        ldrsh   r6, [r6, #2]
        mvn     r0, r3
        mul     r6, r2, r6
        add     r1, r6, #1, 18
        mov     r1, r1, asr #15
        cmp     r0, r1
        mvnlt   r3, r3
        blt     LAML13
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r3, r1, asr #16
        sublt   r3, r12, #2, 18
LAML13:
        strh    r3, [r8, #2]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAML14:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAML15:
        ldrsh   r2, [r5]
        strh    r2, [r4]
        ldrsh   r5, [r5, #2]
        strh    r5, [r4, #2]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAML16:
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LAML1
LAML17:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LAML18:
        ldr     r2, [sp, #4]
        mov     r0, #0
        strh    r2, [r4, #2]
        strh    r2, [r4]
        ldrsh   r3, [r5, #4]
        strh    r3, [r4, #4]
        ldrsh   r5, [r5, #6]
        strh    r5, [r4, #6]
        strh    r2, [r12, #-2]
        strh    r2, [r12, #-4]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


