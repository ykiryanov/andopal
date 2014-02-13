        .text
        .align  4
        .globl  _ippsWinHamming_16sc_I


_ippsWinHamming_16sc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        beq     LALQ4
        cmp     r7, #3
        blt     LALQ3
        sub     r11, r7, #1
        mov     r0, r11
        bl      __floatsidf
        ldr     r6, [pc, #0x24C]
        ldr     r4, [pc, #0x24C]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, r6
        bl      __divdf3
        mov     r6, #1, 2
        bl      cos
        mov     r9, r0
        mov     r8, r1
        add     r10, r6, #0x1D, 12
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        mov     r4, r0
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
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
        mov     r2, #0
        mov     r3, r2
        mov     r12, #1
        movlt   r3, r12
        add     r3, r7, r3
        sub     r3, r3, #1
        mov     r1, #0x1E
        movs    r12, r3, asr #1
        add     r7, r5, r7, lsl #2
        orr     r3, r1, #0x45, 24
        sub     r1, r7, #4
        sub     lr, r12, #1
        beq     LALQ1
        mov     r7, r0, asr #31
        rsbs    r12, r0, #0
        rsc     r7, r7, #0
        str     r7, [sp]
        str     r0, [sp, #8]
        str     r3, [sp, #4]
LALQ0:
        ldrsh   r3, [r5]
        umull   r8, r10, r2, r12
        sub     lr, lr, #1
        str     r3, [sp, #0xC]
        smull   r7, r3, r4, r6
        ldrsh   r9, [r5, #2]
        str     r3, [sp, #0x10]
        ldr     r3, [sp]
        adds    r8, r7, r8
        ldr     r7, [sp, #4]
        mla     r10, r2, r3, r10
        ldr     r3, [sp, #8]
        str     r10, [sp, #0x14]
        smull   r3, r10, r6, r3
        mov     r6, r6, asr #15
        str     r6, [sp, #0x1C]
        ldr     r0, [sp, #0x1C]
        mov     r6, #0xE1
        orr     r6, r6, #0x3A, 24
        mul     r6, r0, r6
        str     r10, [sp, #0x18]
        smull   r11, r10, r4, r2
        ldr     r0, [sp, #0x14]
        mov     r2, r2, asr #31
        add     r6, r6, #1, 18
        mla     r2, r2, r12, r0
        sub     r7, r7, r6, asr #15
        ldr     r6, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        mul     r9, r9, r7
        mul     r6, r6, r7
        adc     r2, r0, r2
        adds    r11, r3, r11
        add     r9, r9, #1, 18
        mov     r3, r2, lsl #2
        add     r2, r6, #1, 18
        orr     r6, r3, r8, lsr #30
        ldr     r3, [sp, #0x18]
        mov     r2, r2, asr #15
        strh    r2, [r5]
        mov     r9, r9, asr #15
        strh    r9, [r5, #2]
        adc     r10, r3, r10
        ldrsh   r3, [r1]
        ldrsh   r2, [r1, #2]
        add     r5, r5, #4
        mul     r3, r3, r7
        mov     r10, r10, lsl #2
        mul     r7, r2, r7
        orr     r2, r10, r11, lsr #30
        cmn     lr, #1
        add     r3, r3, #1, 18
        add     r7, r7, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r1]
        mov     r7, r7, asr #15
        strh    r7, [r1, #2]
        sub     r1, r1, #4
        bne     LALQ0
        ldr     r3, [sp, #4]
LALQ1:
        cmp     r5, r1
        beq     LALQ2
        mov     r2, #0xE1
        mov     r6, r6, asr #15
        orr     r2, r2, #0x3A, 24
        mul     r6, r6, r2
        ldrsh   r2, [r5, #2]
        ldrsh   r12, [r5]
        add     lr, r6, #1, 18
        sub     r3, r3, lr, asr #15
        mul     r2, r2, r3
        mul     r12, r12, r3
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r5, #2]
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r5]
        ldrsh   r0, [r1]
        ldrsh   r2, [r1, #2]
        mul     r0, r0, r3
        mul     r3, r2, r3
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r1]
        add     r3, r3, #1, 18
        mov     r0, r3, asr #15
        strh    r0, [r1, #2]
LALQ2:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALQ3:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LALQ4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


