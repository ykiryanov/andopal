        .text
        .align  4
        .globl  _ippsWinHann_16sc


_ippsWinHann_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r11, r2
        beq     LALJ4
        cmp     r4, #0
        beq     LALJ4
        cmp     r11, #3
        blt     LALJ2
        sub     r0, r11, #1
        str     r0, [sp, #4]
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r7, #1, 2
        sub     r1, r7, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x298]
        ldr     r3, [pc, #0x298]
        bl      __muldf3
        bl      cos
        add     lr, r5, r11, lsl #2
        sub     r6, lr, #4
        add     r12, r4, r11, lsl #2
        mov     lr, #0
        cmp     r11, #3
        mov     r9, r0
        mov     r10, r1
        sub     r8, r12, #4
        str     lr, [sp]
        beq     LALJ5
        mov     r0, r9
        mov     r1, r10
        add     r3, r7, #0x1D, 12
        str     r3, [sp, #0xC]
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [sp, #8]
        mov     r0, r9
        mov     r2, r9
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        sub     r1, r7, #1, 12
        mov     r0, #0
        bl      __subdf3
        bl      sqrt
        ldr     r3, [sp, #0xC]
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        ldr     r3, [sp, #4]
        ldr     r12, [sp]
        cmp     r3, #0
        mov     r3, #1
        movlt   r12, r3
        add     r12, r11, r12
        sub     r2, r12, #1
        movs    r2, r2, asr #1
        sub     lr, r2, #1
        beq     LALJ1
        mov     r2, r0, asr #31
        rsbs    r12, r0, #0
        str     r0, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r0, [sp]
        rsc     r2, r2, #0
        str     r2, [sp, #4]
LALJ0:
        ldrsh   r3, [r5]
        rsb     r2, r7, #1, 2
        sub     lr, lr, #1
        mov     r2, r2, asr #1
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        mul     r11, r3, r2
        smull   r10, r3, r9, r7
        add     r11, r11, #1, 18
        mov     r11, r11, asr #15
        str     r10, [sp, #0x10]
        umull   r1, r10, r0, r12
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #4]
        mla     r10, r0, r1, r10
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        smull   r7, r10, r7, r10
        str     r10, [sp, #0x1C]
        smull   r10, r1, r9, r0
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        strh    r11, [r4]
        ldrsh   r11, [r5, #2]
        mov     r0, r0, asr #31
        mla     r0, r0, r12, r1
        ldr     r1, [sp, #0x14]
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x10]
        add     r5, r5, #4
        adds    r11, r11, r1
        adc     r0, r3, r0
        ldr     r3, [sp, #0x18]
        adds    r10, r7, r10
        mov     r0, r0, lsl #2
        mul     r3, r3, r2
        orr     r7, r0, r11, lsr #30
        ldr     r11, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r4, #2]
        ldrsh   r3, [r6]
        adc     r11, r11, r0
        cmn     lr, #1
        mul     r3, r3, r2
        mov     r11, r11, lsl #2
        orr     r0, r11, r10, lsr #30
        add     r4, r4, #4
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r8]
        ldrsh   r3, [r6, #2]
        sub     r6, r6, #4
        mul     r2, r3, r2
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r8, #2]
        sub     r8, r8, #4
        bne     LALJ0
LALJ1:
        cmp     r4, r8
        beq     LALJ3
        ldrsh   r3, [r5]
        rsb     r7, r7, #1, 2
        mov     r2, r7, asr #1
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        mul     r3, r3, r2
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r4]
        ldrsh   r5, [r5, #2]
        mul     r0, r5, r2
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r4, #2]
        ldrsh   r0, [r6]
        mul     r0, r0, r2
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r8]
        ldrsh   r6, [r6, #2]
        mul     r2, r6, r2
        add     r0, r2, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r8, #2]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALJ2:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALJ3:
        ldrsh   r2, [r5]
        strh    r2, [r4]
        ldrsh   r5, [r5, #2]
        strh    r5, [r4, #2]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALJ4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LALJ5:
        ldr     r2, [sp]
        mov     r0, #0
        strh    r2, [r4, #2]
        strh    r2, [r4]
        ldrsh   r3, [r5, #4]
        strh    r3, [r4, #4]
        ldrsh   r5, [r5, #6]
        strh    r5, [r4, #6]
        strh    r2, [r12, #-2]
        strh    r2, [r12, #-4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


