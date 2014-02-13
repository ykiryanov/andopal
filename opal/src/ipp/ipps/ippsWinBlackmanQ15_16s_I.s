        .text
        .align  4
        .globl  _ippsWinBlackmanQ15_16s_I


_ippsWinBlackmanQ15_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r4, r0
        cmp     r4, #0
        mov     r11, r1
        mov     r7, r2
        beq     LAMN11
        cmp     r11, #3
        blt     LAMN8
        sub     r0, r11, #1
        str     r0, [sp, #4]
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r5, #1, 2
        sub     r1, r5, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x338]
        ldr     r3, [pc, #0x338]
        bl      __muldf3
        bl      cos
        add     r12, r4, r11, lsl #1
        mov     lr, #0
        cmp     r11, #3
        mov     r8, r0
        mov     r9, r1
        sub     r6, r12, #2
        str     lr, [sp]
        beq     LAMN10
        mov     r0, r7
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x14]
        sub     r3, r5, #1, 12
        mov     r7, r0
        str     r3, [sp, #0xC]
        mov     r2, #0
        bl      __adddf3
        sub     r3, r5, #2, 12
        mov     r2, #0
        bl      __muldf3
        add     r10, r5, #0x1D, 12
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        ldr     r1, [sp, #0x14]
        str     r0, [sp, #8]
        mov     r0, r7
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #0x10]
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0xC]
        mov     r2, r0
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        mov     r3, r10
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        cmp     r2, #0
        mov     r2, #1
        movlt   r3, r2
        add     r3, r11, r3
        sub     r1, r3, #1
        movs    r1, r1, asr #1
        sub     r3, r1, #1
        beq     LAMN4
        mov     r12, r0, asr #31
        rsbs    r2, r0, #0
        rsc     r12, r12, #0
        mvn     r1, #0xFF
        str     r12, [sp, #0xC]
        ldr     r12, [sp]
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        str     r0, [sp, #4]
        str     r7, [sp, #0x14]
LAMN0:
        smull   r8, lr, r5, r5
        mov     r9, lr, lsl #2
        ldrsh   lr, [r4]
        ldr     r7, [sp, #8]
        orr     r8, r9, r8, lsr #30
        ldr     r9, [sp, #0x10]
        sub     r8, r8, #2, 4
        sub     r7, r7, r5, asr #1
        smull   r8, r9, r9, r8
        mov     r9, r9, lsl #2
        orr     r8, r9, r8, lsr #30
        sub     r7, r7, r8
        add     r7, r7, #1, 18
        mov     r7, r7, asr #15
        mul     lr, r7, lr
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        cmp     r1, lr
        bge     LAMN9
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LAMN1:
        strh    lr, [r4]
        ldrsh   lr, [r6]
        mul     lr, r7, lr
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        cmp     r1, lr
        bge     LAMN2
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        b       LAMN3
LAMN2:
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
LAMN3:
        umull   r7, r8, r12, r2
        strh    lr, [r6], #-2
        ldr     lr, [sp, #0xC]
        ldr     r11, [sp, #0x14]
        ldr     r10, [sp, #4]
        sub     r3, r3, #1
        mla     lr, r12, lr, r8
        smull   r8, r9, r11, r5
        smull   r10, r0, r5, r10
        smull   r5, r11, r11, r12
        mov     r12, r12, asr #31
        mla     lr, r12, r2, lr
        adds    r7, r8, r7
        add     r4, r4, #2
        adc     lr, r9, lr
        adds    r10, r10, r5
        adc     r11, r0, r11
        mov     lr, lr, lsl #2
        cmn     r3, #1
        mov     r11, r11, lsl #2
        orr     r5, lr, r7, lsr #30
        orr     r12, r11, r10, lsr #30
        bne     LAMN0
LAMN4:
        cmp     r4, r6
        beq     LAMN7
        smull   r1, r2, r5, r5
        mov     r3, r2, lsl #2
        ldrsh   r2, [r4]
        orr     r1, r3, r1, lsr #30
        ldr     r3, [sp, #0x10]
        sub     r1, r1, #2, 4
        smull   r1, r3, r3, r1
        mov     r12, r3, lsl #2
        ldr     r3, [sp, #8]
        sub     r5, r3, r5, asr #1
        mov     r3, #0
        orr     r1, r12, r1, lsr #30
        sub     r5, r5, r1
        add     r1, r5, #1, 18
        mov     r1, r1, asr #15
        mul     lr, r1, r2
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r12, r2
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        cmp     r12, lr
        mvnlt   r12, r2
        blt     LAMN5
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   r12, lr, asr #16
        sublt   r12, r3, #2, 18
LAMN5:
        strh    r12, [r4]
        ldrsh   r12, [r6]
        mvn     r0, r2
        mul     r12, r1, r12
        add     r1, r12, #1, 18
        mov     r1, r1, asr #15
        cmp     r0, r1
        mvnlt   r2, r2
        blt     LAMN6
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r2, r1, asr #16
        sublt   r2, r3, #2, 18
LAMN6:
        strh    r2, [r6]
LAMN7:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAMN8:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAMN9:
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LAMN1
LAMN10:
        ldr     r1, [sp]
        mov     r0, #0
        strh    r1, [r4]
        strh    r1, [r12, #-2]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAMN11:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


