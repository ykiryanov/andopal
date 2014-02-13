        .text
        .align  4
        .globl  _ippsWinHann_16s_I


_ippsWinHann_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r0
        cmp     r4, #0
        mov     r10, r1
        beq     LALK5
        cmp     r10, #3
        blt     LALK3
        sub     r11, r10, #1
        mov     r0, r11
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r6, #1, 2
        sub     r1, r6, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x1D0]
        ldr     r3, [pc, #0x1D0]
        bl      __muldf3
        bl      cos
        add     r12, r4, r10, lsl #1
        cmp     r10, #3
        mov     r8, r0
        mov     r9, r1
        sub     r7, r12, #2
        mov     r5, #0
        beq     LALK4
        mov     r0, r8
        mov     r1, r9
        add     r3, r6, #0x1D, 12
        str     r3, [sp, #8]
        mov     r2, #0
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
        ldr     r3, [sp, #8]
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        cmp     r11, #0
        mov     r2, r5
        mov     r3, #1
        movlt   r2, r3
        add     r2, r10, r2
        sub     r1, r2, #1
        movs    r1, r1, asr #1
        sub     r12, r1, #1
        beq     LALK1
        mov     r1, r0, asr #31
        rsbs    r3, r0, #0
        rsc     r1, r1, #0
        str     r1, [sp, #4]
        str     r0, [sp, #8]
LALK0:
        umull   lr, r2, r5, r3
        ldr     r1, [sp, #4]
        ldrsh   r10, [r4]
        ldr     r9, [sp, #8]
        mla     r2, r5, r1, r2
        rsb     r1, r6, #1, 2
        sub     r12, r12, #1
        mov     r1, r1, asr #1
        add     r0, r1, #1, 18
        ldr     r1, [sp]
        smull   r1, r8, r1, r6
        smull   r6, r11, r6, r9
        adds    lr, r1, lr
        str     r6, [sp, #0xC]
        ldr     r6, [sp]
        smull   r9, r6, r6, r5
        mov     r5, r5, asr #31
        str     r6, [sp, #0x10]
        mla     r2, r5, r3, r2
        mov     r6, r0, asr #15
        mul     r10, r10, r6
        adc     r2, r8, r2
        mov     r2, r2, lsl #2
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        strh    r10, [r4], #2
        ldrsh   r1, [r7]
        ldr     r5, [sp, #0xC]
        mul     r1, r1, r6
        orr     r6, r2, lr, lsr #30
        adds    r9, r5, r9
        ldr     r5, [sp, #0x10]
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r7], #-2
        adc     r11, r11, r5
        cmn     r12, #1
        mov     r11, r11, lsl #2
        orr     r5, r11, r9, lsr #30
        bne     LALK0
LALK1:
        cmp     r4, r7
        beq     LALK2
        ldrsh   r2, [r4]
        rsb     r6, r6, #1, 2
        mov     r1, r6, asr #1
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        mul     r2, r2, r1
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r4]
        ldrsh   r0, [r7]
        mul     r1, r0, r1
        add     r0, r1, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r7]
LALK2:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LALK3:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LALK4:
        strh    r5, [r4]
        mov     r0, #0
        strh    r5, [r12, #-2]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LALK5:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


