        .text
        .align  4
        .globl  _ippsWinHann_16sc_I


_ippsWinHann_16sc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r0
        cmp     r4, #0
        mov     r10, r1
        beq     LALI5
        cmp     r10, #3
        blt     LALI3
        sub     r11, r10, #1
        mov     r0, r11
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r6, #1, 2
        sub     r1, r6, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x23C]
        ldr     r3, [pc, #0x23C]
        bl      __muldf3
        bl      cos
        add     r12, r4, r10, lsl #2
        cmp     r10, #3
        mov     r8, r0
        mov     r9, r1
        sub     r7, r12, #4
        mov     r5, #0
        beq     LALI4
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
        beq     LALI1
        ldr     lr, [sp]
        mov     r1, r0, asr #31
        rsbs    r3, r0, #0
        rsc     r1, r1, #0
        str     r1, [sp, #4]
        str     r0, [sp, #8]
LALI0:
        rsb     r1, r6, #1, 2
        ldrsh   r2, [r4]
        ldrsh   r8, [r4, #2]
        mov     r1, r1, asr #1
        add     r1, r1, #1, 18
        sub     r12, r12, #1
        mov     r1, r1, asr #15
        mul     r11, r2, r1
        mul     r10, r8, r1
        umull   r8, r2, r5, r3
        add     r11, r11, #1, 18
        add     r10, r10, #1, 18
        mov     r11, r11, asr #15
        mov     r10, r10, asr #15
        str     r8, [sp, #0xC]
        smull   r9, r8, lr, r6
        str     r8, [sp, #0x10]
        ldr     r8, [sp, #4]
        str     r9, [sp, #0x14]
        smull   r0, r9, lr, r5
        mla     r2, r5, r8, r2
        ldr     r8, [sp, #8]
        mov     r5, r5, asr #31
        str     r0, [sp, #0x18]
        mla     r5, r5, r3, r2
        strh    r11, [r4]
        smull   r6, r8, r6, r8
        strh    r10, [r4, #2]
        ldrsh   r11, [r7]
        ldrsh   r10, [r7, #2]
        add     r4, r4, #4
        mul     r2, r11, r1
        ldr     r11, [sp, #0xC]
        mul     r10, r10, r1
        ldr     r1, [sp, #0x14]
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        adds    r1, r1, r11
        ldr     r11, [sp, #0x10]
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        adc     r5, r11, r5
        ldr     r11, [sp, #0x18]
        strh    r2, [r7]
        mov     r5, r5, lsl #2
        strh    r10, [r7, #2]
        adds    r11, r6, r11
        adc     r9, r8, r9
        orr     r6, r5, r1, lsr #30
        mov     r9, r9, lsl #2
        cmn     r12, #1
        orr     r5, r9, r11, lsr #30
        sub     r7, r7, #4
        bne     LALI0
LALI1:
        cmp     r4, r7
        beq     LALI2
        rsb     r6, r6, #1, 2
        ldrsh   r3, [r4]
        ldrsh   r2, [r4, #2]
        mov     r1, r6, asr #1
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        mul     r2, r2, r1
        mul     r3, r3, r1
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r4, #2]
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r4]
        ldrsh   r0, [r7]
        ldrsh   r2, [r7, #2]
        mul     r0, r0, r1
        mul     r1, r2, r1
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r7]
        add     r1, r1, #1, 18
        mov     r0, r1, asr #15
        strh    r0, [r7, #2]
LALI2:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALI3:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALI4:
        strh    r5, [r4, #2]
        strh    r5, [r4]
        mov     r0, #0
        strh    r5, [r12, #-2]
        strh    r5, [r12, #-4]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALI5:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


