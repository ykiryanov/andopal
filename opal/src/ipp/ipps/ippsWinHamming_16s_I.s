        .text
        .align  4
        .globl  _ippsWinHamming_16s_I


_ippsWinHamming_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        beq     LALS4
        cmp     r6, #3
        blt     LALS3
        sub     r11, r6, #1
        mov     r0, r11
        mov     r5, #1, 2
        bl      __floatsidf
        sub     r10, r5, #1, 12
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r10
        bl      __divdf3
        ldr     r2, [pc, #0x1D8]
        ldr     r3, [pc, #0x1D8]
        bl      __muldf3
        bl      cos
        mov     r7, r0
        mov     r8, r1
        add     r9, r5, #0x1D, 12
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp]
        mov     r0, r7
        mov     r2, r7
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r10
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        mov     r3, r9
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        cmp     r11, #0
        mov     r2, #0
        mov     r3, r2
        mov     r12, #1
        movlt   r3, r12
        add     r3, r6, r3
        sub     r3, r3, #1
        mov     r1, #0x1E
        movs    r12, r3, asr #1
        add     r6, r4, r6, lsl #1
        orr     r3, r1, #0x45, 24
        sub     r1, r6, #2
        sub     r6, r12, #1
        beq     LALS1
        mov     r12, r0, asr #31
        rsbs    lr, r0, #0
        rsc     r12, r12, #0
        str     r12, [sp, #4]
        str     r0, [sp, #8]
        str     r3, [sp, #0xC]
LALS0:
        umull   r7, r12, r2, lr
        ldr     r3, [sp, #4]
        ldrsh   r10, [r4]
        sub     r6, r6, #1
        mla     r12, r2, r3, r12
        ldr     r3, [sp]
        smull   r3, r11, r3, r5
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #8]
        smull   r12, r9, r5, r12
        mov     r5, r5, asr #15
        str     r5, [sp, #0x18]
        ldr     r0, [sp, #0x18]
        mov     r5, #0xE1
        str     r12, [sp, #0x14]
        ldr     r12, [sp]
        orr     r5, r5, #0x3A, 24
        mul     r5, r0, r5
        smull   r12, r8, r12, r2
        ldr     r0, [sp, #0x10]
        adds    r7, r3, r7
        ldr     r3, [sp, #0xC]
        mov     r2, r2, asr #31
        mla     r2, r2, lr, r0
        add     r5, r5, #1, 18
        sub     r3, r3, r5, asr #15
        mul     r10, r10, r3
        ldr     r5, [sp, #0x14]
        adc     r2, r11, r2
        adds    r12, r5, r12
        adc     r8, r9, r8
        add     r10, r10, #1, 18
        mov     r2, r2, lsl #2
        orr     r5, r2, r7, lsr #30
        mov     r10, r10, asr #15
        strh    r10, [r4], #2
        mov     r8, r8, lsl #2
        orr     r2, r8, r12, lsr #30
        ldrsh   r12, [r1]
        cmn     r6, #1
        mul     r3, r12, r3
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r1], #-2
        bne     LALS0
        ldr     r3, [sp, #0xC]
LALS1:
        cmp     r4, r1
        beq     LALS2
        ldrsh   r2, [r4]
        mov     r12, #0xE1
        orr     r12, r12, #0x3A, 24
        mov     r5, r5, asr #15
        mul     r12, r5, r12
        add     r12, r12, #1, 18
        sub     r3, r3, r12, asr #15
        mul     r2, r2, r3
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r4]
        ldrsh   r0, [r1]
        mul     r3, r0, r3
        add     r0, r3, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r1]
LALS2:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALS3:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALS4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


