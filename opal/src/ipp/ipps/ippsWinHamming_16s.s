        .text
        .align  4
        .globl  _ippsWinHamming_16s


_ippsWinHamming_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        beq     LALT4
        cmp     r4, #0
        beq     LALT4
        cmp     r7, #3
        blt     LALT2
        sub     r11, r7, #1
        mov     r0, r11
        bl      __floatsidf
        ldr     r8, [pc, #0x218]
        ldr     r6, [pc, #0x218]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r8
        bl      __divdf3
        bl      cos
        mov     r6, #1, 2
        mov     r8, r0
        mov     r9, r1
        add     r10, r6, #0x1D, 12
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
        mov     r12, #0
        mov     r3, r12
        mov     lr, #1
        movlt   r3, lr
        add     r3, r7, r3
        sub     lr, r3, #1
        add     r3, r5, r7, lsl #1
        add     r7, r4, r7, lsl #1
        movs    lr, lr, asr #1
        sub     r2, r7, #2
        sub     r3, r3, #2
        sub     r7, lr, #1
        beq     LALT1
        ldr     r9, [sp]
        mov     r8, r0, asr #31
        rsbs    lr, r0, #0
        rsc     r8, r8, #0
        str     r8, [sp, #8]
        str     r0, [sp, #4]
LALT0:
        ldrsh   r8, [r5], #2
        smull   r10, r0, r9, r6
        str     r0, [sp, #0x14]
        str     r8, [sp, #0xC]
        umull   r11, r8, r12, lr
        sub     r7, r7, #1
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #8]
        mov     r0, #0xE1
        orr     r0, r0, #0x3A, 24
        mla     r8, r12, r10, r8
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #4]
        smull   r8, r10, r6, r8
        mov     r6, r6, asr #15
        mul     r1, r6, r0
        ldr     r0, [sp, #0x18]
        str     r8, [sp, #0x1C]
        str     r10, [sp, #0x20]
        smull   r8, r10, r9, r12
        mov     r12, r12, asr #31
        mla     r0, r12, lr, r0
        mov     r6, #0x1E
        add     r1, r1, #1, 18
        orr     r6, r6, #0x45, 24
        sub     r12, r6, r1, asr #15
        ldr     r1, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        adds    r11, r1, r11
        ldr     r1, [sp, #0x14]
        mul     r6, r6, r12
        adc     r0, r1, r0
        ldr     r1, [sp, #0x1C]
        adds    r8, r1, r8
        mov     r1, r0, lsl #2
        add     r0, r6, #1, 18
        orr     r6, r1, r11, lsr #30
        ldr     r11, [sp, #0x20]
        mov     r0, r0, asr #15
        strh    r0, [r4], #2
        adc     r10, r11, r10
        ldrsh   r11, [r3], #-2
        mul     r11, r11, r12
        mov     r10, r10, lsl #2
        orr     r12, r10, r8, lsr #30
        cmn     r7, #1
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        strh    r11, [r2], #-2
        bne     LALT0
LALT1:
        cmp     r4, r2
        beq     LALT3
        ldrsh   r5, [r5]
        mov     r0, #0xE1
        mov     r6, r6, asr #15
        orr     r0, r0, #0x3A, 24
        mul     r6, r6, r0
        mov     r0, #0x1E
        orr     r0, r0, #0x45, 24
        add     r6, r6, #1, 18
        sub     r0, r0, r6, asr #15
        mul     r5, r5, r0
        add     r12, r5, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r4]
        ldrsh   r3, [r3]
        mul     r0, r3, r0
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r2]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALT2:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALT3:
        ldrsh   r5, [r5]
        strh    r5, [r4]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALT4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


