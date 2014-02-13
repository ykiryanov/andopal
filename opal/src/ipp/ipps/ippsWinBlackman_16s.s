        .text
        .align  4
        .globl  _ippsWinBlackman_16s


_ippsWinBlackman_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r11, r2
        mov     r10, r3
        beq     LAMB11
        cmp     r4, #0
        beq     LAMB11
        cmp     r11, #3
        blt     LAMB8
        sub     r0, r11, #1
        str     r0, [sp, #8]
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r6, #1, 2
        sub     r1, r6, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x3A0]
        ldr     r3, [pc, #0x3A0]
        bl      __muldf3
        bl      cos
        add     lr, r5, r11, lsl #1
        sub     lr, lr, #2
        str     lr, [sp, #0x18]
        add     r12, r4, r11, lsl #1
        mov     lr, #0
        cmp     r11, #3
        mov     r8, r0
        mov     r9, r1
        sub     r7, r12, #2
        str     lr, [sp]
        beq     LAMB12
        mov     r0, r10
        bl      __extendsfdf2
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        sub     r3, r6, #1, 12
        str     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        sub     r3, r6, #2, 12
        mov     r2, #0
        bl      __muldf3
        add     r10, r6, #0x1D, 12
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
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #0x14]
        mov     r0, r8
        mov     r1, r9
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #4]
        mov     r2, r0
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        mov     r2, #0
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        ldr     r3, [sp, #8]
        ldr     r12, [sp]
        cmp     r3, #0
        mov     r3, #1
        movlt   r12, r3
        add     r12, r11, r12
        sub     r2, r12, #1
        movs    r2, r2, asr #1
        sub     lr, r2, #1
        beq     LAMB5
        mov     r3, r0, asr #31
        rsbs    r12, r0, #0
        rsc     r8, r3, #0
        ldr     r9, [sp, #0x18]
        mvn     r2, #0xFF
        str     r8, [sp, #8]
        ldr     r8, [sp, #0x14]
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
        mov     r3, #0
        str     r0, [sp, #4]
LAMB0:
        smull   r1, r10, r6, r6
        mov     r0, r10, lsl #2
        ldrsh   r11, [r5]
        ldr     r10, [sp, #0xC]
        orr     r1, r0, r1, lsr #30
        sub     r0, r1, #2, 4
        ldr     r1, [sp, #0x10]
        sub     r10, r10, r6, asr #1
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
        bge     LAMB10
        mvn     r11, #0xFF
        bic     r11, r11, #0x7F, 24
        mvn     r11, r11
LAMB1:
        strh    r11, [r4]
        ldrsh   r11, [r9]
        mul     r11, r10, r11
        add     r10, r11, #1, 18
        mov     r10, r10, asr #15
        cmp     r2, r10
        bge     LAMB2
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
        str     r10, [sp]
        b       LAMB4
LAMB2:
        cmn     r10, #2, 18
        bge     LAMB3
        mov     r10, #0
        sub     r10, r10, #2, 18
        str     r10, [sp]
        b       LAMB4
LAMB3:
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        str     r10, [sp]
LAMB4:
        smull   r1, r0, r8, r6
        umull   r10, r11, r3, r12
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #8]
        str     r1, [sp, #0x1C]
        add     r5, r5, #2
        sub     r9, r9, #2
        mla     r11, r3, r0, r11
        add     r4, r4, #2
        sub     lr, lr, #1
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #4]
        smull   r6, r0, r6, r11
        smull   r1, r11, r8, r3
        mov     r3, r3, asr #31
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x1C]
        adds    r10, r1, r10
        ldr     r1, [sp, #0x24]
        mla     r3, r3, r12, r1
        ldr     r1, [sp]
        strh    r1, [r7], #-2
        ldr     r1, [sp, #0x20]
        adc     r3, r1, r3
        ldr     r1, [sp, #0x28]
        mov     r3, r3, lsl #2
        adds    r1, r6, r1
        adc     r11, r0, r11
        orr     r6, r3, r10, lsr #30
        mov     r11, r11, lsl #2
        cmn     lr, #1
        orr     r3, r11, r1, lsr #30
        bne     LAMB0
        str     r9, [sp, #0x18]
LAMB5:
        cmp     r4, r7
        beq     LAMB9
        smull   r2, r3, r6, r6
        mov     r3, r3, lsl #2
        ldrsh   r5, [r5]
        orr     r2, r3, r2, lsr #30
        sub     r0, r2, #2, 4
        ldr     r2, [sp, #0x10]
        smull   r0, r2, r2, r0
        mov     r3, r2, lsl #2
        ldr     r2, [sp, #0xC]
        orr     r0, r3, r0, lsr #30
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        sub     r6, r2, r6, asr #1
        sub     r6, r6, r0
        add     r0, r6, #1, 18
        mov     r2, #0
        mov     r0, r0, asr #15
        mul     r5, r5, r0
        mvn     r12, r3
        add     r5, r5, #1, 18
        mov     r5, r5, asr #15
        cmp     r12, r5
        mvnlt   r5, r3
        blt     LAMB6
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        sublt   r5, r2, #2, 18
LAMB6:
        strh    r5, [r4]
        ldr     r1, [sp, #0x18]
        ldrsh   r12, [r1]
        mvn     r1, r3
        mul     r12, r0, r12
        add     r0, r12, #1, 18
        mov     r0, r0, asr #15
        cmp     r1, r0
        mvnlt   r3, r3
        blt     LAMB7
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r3, r0, asr #16
        sublt   r3, r2, #2, 18
LAMB7:
        strh    r3, [r7]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAMB8:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAMB9:
        ldrsh   r5, [r5]
        strh    r5, [r4]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAMB10:
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   r11, r11, asr #16
        movlt   r11, #0
        sublt   r11, r11, #2, 18
        b       LAMB1
LAMB11:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAMB12:
        ldr     r2, [sp]
        mov     r0, #0
        strh    r2, [r4]
        ldrsh   r5, [r5, #2]
        strh    r5, [r4, #2]
        strh    r2, [r12, #-2]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


