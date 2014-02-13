        .text
        .align  4
        .globl  _ippsWinHamming_16sc


_ippsWinHamming_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        beq     LALR4
        cmp     r4, #0
        beq     LALR4
        cmp     r7, #3
        blt     LALR2
        sub     r11, r7, #1
        mov     r0, r11
        bl      __floatsidf
        ldr     r8, [pc, #0x280]
        ldr     r6, [pc, #0x280]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r8
        bl      __divdf3
        bl      cos
        mov     r6, #1, 2
        add     r10, r6, #0x1D, 12
        mov     r8, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp]
        mov     r0, r8
        mov     r2, r8
        mov     r1, r9
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        sub     r1, r6, #1, 12
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        mov     r3, r10
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        cmp     r11, #0
        mov     r11, #0
        mov     r3, r11
        mov     r12, #1
        movlt   r3, r12
        add     r3, r7, r3
        sub     r12, r3, #1
        add     r3, r5, r7, lsl #2
        movs    r12, r12, asr #1
        add     r7, r4, r7, lsl #2
        sub     r3, r3, #4
        sub     r2, r7, #4
        sub     r8, r12, #1
        beq     LALR1
        ldr     r9, [sp]
        mov     r12, r0, asr #31
        rsbs    r7, r0, #0
        rsc     r12, r12, #0
        str     r12, [sp, #4]
        str     r0, [sp, #8]
LALR0:
        ldrsh   r12, [r5]
        sub     r8, r8, #1
        str     r12, [sp, #0xC]
        smull   r12, lr, r9, r6
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x10]
        umull   lr, r12, r11, r7
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #4]
        ldr     r1, [sp, #0x18]
        mla     r0, r11, lr, r12
        ldr     r12, [sp, #8]
        smull   r12, lr, r6, r12
        str     lr, [sp, #0x1C]
        smull   lr, r10, r9, r11
        mov     r11, r11, asr #31
        mla     r0, r11, r7, r0
        ldr     r11, [sp, #0x10]
        mov     r6, r6, asr #15
        str     lr, [sp, #0x20]
        mov     lr, #0xE1
        orr     lr, lr, #0x3A, 24
        mul     r6, r6, lr
        adds    r11, r11, r1
        mov     lr, #0x1E
        ldr     r1, [sp, #0x14]
        orr     lr, lr, #0x45, 24
        add     r6, r6, #1, 18
        sub     lr, lr, r6, asr #15
        ldr     r6, [sp, #0xC]
        adc     r0, r1, r0
        ldr     r1, [sp, #0x20]
        mul     r6, r6, lr
        adds    r12, r12, r1
        mov     r1, r0, lsl #2
        add     r0, r6, #1, 18
        orr     r6, r1, r11, lsr #30
        ldr     r11, [sp, #0x1C]
        mov     r0, r0, asr #15
        strh    r0, [r4]
        adc     r10, r11, r10
        ldrsh   r11, [r5, #2]
        add     r5, r5, #4
        mov     r10, r10, lsl #2
        mul     r0, r11, lr
        orr     r11, r10, r12, lsr #30
        cmn     r8, #1
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r4, #2]
        ldrsh   r12, [r3]
        add     r4, r4, #4
        mul     r12, r12, lr
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r2]
        ldrsh   r12, [r3, #2]
        sub     r3, r3, #4
        mul     lr, r12, lr
        add     r12, lr, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r2, #2]
        sub     r2, r2, #4
        bne     LALR0
LALR1:
        cmp     r4, r2
        beq     LALR3
        ldrsh   lr, [r5]
        mov     r12, #0xE1
        mov     r6, r6, asr #15
        orr     r12, r12, #0x3A, 24
        mul     r6, r6, r12
        mov     r12, #0x1E
        orr     r12, r12, #0x45, 24
        add     r6, r6, #1, 18
        sub     r12, r12, r6, asr #15
        mul     lr, lr, r12
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r4]
        ldrsh   r5, [r5, #2]
        mul     r0, r5, r12
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r4, #2]
        ldrsh   r0, [r3]
        mul     r0, r0, r12
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r2]
        ldrsh   r3, [r3, #2]
        mul     r12, r3, r12
        add     r0, r12, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r2, #2]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALR2:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALR3:
        ldrsh   r2, [r5]
        strh    r2, [r4]
        ldrsh   r5, [r5, #2]
        strh    r5, [r4, #2]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALR4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


