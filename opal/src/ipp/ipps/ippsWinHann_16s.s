        .text
        .align  4
        .globl  _ippsWinHann_16s


_ippsWinHann_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r11, r2
        beq     LALL4
        cmp     r4, #0
        beq     LALL4
        cmp     r11, #3
        blt     LALL2
        sub     r0, r11, #1
        str     r0, [sp]
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r8, #1, 2
        sub     r1, r8, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x210]
        ldr     r3, [pc, #0x210]
        bl      __muldf3
        bl      cos
        add     lr, r5, r11, lsl #1
        add     r12, r4, r11, lsl #1
        sub     r6, lr, #2
        sub     lr, r12, #2
        cmp     r11, #3
        mov     r9, r0
        mov     r10, r1
        str     lr, [sp, #0xC]
        mov     r7, #0
        beq     LALL5
        mov     r0, r9
        mov     r1, r10
        add     r3, r8, #0x1D, 12
        str     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #4]
        mov     r0, r9
        mov     r2, r9
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        sub     r1, r8, #1, 12
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        ldr     r3, [sp]
        mov     r12, #1
        cmp     r3, #0
        mov     r3, r7
        movlt   r3, r12
        add     r3, r11, r3
        sub     r2, r3, #1
        movs    r2, r2, asr #1
        sub     r12, r2, #1
        beq     LALL1
        mov     r2, r0, asr #31
        rsbs    r3, r0, #0
        str     r0, [sp]
        ldr     r0, [sp, #4]
        rsc     r2, r2, #0
        str     r2, [sp, #8]
LALL0:
        smull   r9, r11, r0, r8
        umull   lr, r2, r7, r3
        ldrsh   r10, [r5], #2
        str     r11, [sp, #0x14]
        str     r9, [sp, #0x10]
        ldr     r9, [sp, #8]
        sub     r12, r12, #1
        mla     r2, r7, r9, r2
        ldr     r9, [sp]
        smull   r9, r1, r8, r9
        rsb     r8, r8, #1, 2
        mov     r8, r8, asr #1
        add     r8, r8, #1, 18
        str     r9, [sp, #0x18]
        smull   r11, r9, r0, r7
        mov     r7, r7, asr #31
        mla     r2, r7, r3, r2
        ldr     r7, [sp, #0x10]
        adds    r7, r7, lr
        mov     lr, r8, asr #15
        ldr     r8, [sp, #0x14]
        mul     r10, r10, lr
        adc     r2, r8, r2
        ldr     r8, [sp, #0x18]
        add     r10, r10, #1, 18
        mov     r2, r2, lsl #2
        mov     r10, r10, asr #15
        strh    r10, [r4], #2
        adds    r11, r8, r11
        orr     r8, r2, r7, lsr #30
        ldrsh   r2, [r6], #-2
        adc     r9, r1, r9
        cmn     r12, #1
        mul     lr, r2, lr
        mov     r9, r9, lsl #2
        orr     r7, r9, r11, lsr #30
        add     lr, lr, #1, 18
        mov     r2, lr, asr #15
        ldr     lr, [sp, #0xC]
        strh    r2, [lr], #-2
        str     lr, [sp, #0xC]
        bne     LALL0
LALL1:
        ldr     r2, [sp, #0xC]
        cmp     r4, r2
        beq     LALL3
        ldrsh   r5, [r5]
        rsb     r8, r8, #1, 2
        mov     r0, r8, asr #1
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        mul     r5, r5, r0
        add     r2, r5, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r4]
        ldrsh   r6, [r6]
        ldr     r1, [sp, #0xC]
        mul     r0, r6, r0
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r1]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALL2:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALL3:
        ldrsh   r5, [r5]
        strh    r5, [r4]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALL4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALL5:
        strh    r7, [r4]
        ldrsh   r5, [r5, #2]
        mov     r0, #0
        strh    r5, [r4, #2]
        strh    r7, [r12, #-2]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


