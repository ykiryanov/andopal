        .text
        .align  4
        .globl  _ippsStdDev_16s_Sfs


_ippsStdDev_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LAVF10
        cmp     r5, #0
        beq     LAVF10
        cmp     r1, #2
        blt     LAVF7
        cmp     r4, #0x1F
        mov     r6, #0
        ble     LAVF0
        strh    r6, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVF0:
        cmn     r4, #0x1E
        bge     LAVF1
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        strh    r0, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVF1:
        cmp     r1, #6
        blt     LAVF9
        mov     r9, r6
        mov     r11, r9
        mov     r7, r11
        mov     r8, r7
        sub     lr, r1, #6
        mov     r12, r0
        str     r1, [sp, #4]
        str     r0, [sp]
LAVF2:
        ldrsh   r1, [r12]
        ldrsh   r2, [r12, #2]
        add     r6, r6, #5
        mul     r10, r1, r1
        adds    r0, r9, r1
        adc     r1, r11, r1, asr #31
        mul     r11, r2, r2
        adds    r9, r7, r10
        ldrsh   r7, [r12, #4]
        adc     r10, r8, r10, asr #31
        adds    r0, r0, r2
        mul     r8, r7, r7
        adc     r1, r1, r2, asr #31
        adds    r9, r9, r11
        ldrsh   r2, [r12, #6]
        adc     r11, r10, r11, asr #31
        adds    r0, r0, r7
        adc     r7, r1, r7, asr #31
        mul     r1, r2, r2
        adds    r9, r9, r8
        ldrsh   r10, [r12, #8]
        adc     r8, r11, r8, asr #31
        adds    r11, r0, r2
        mul     r0, r10, r10
        adc     r2, r7, r2, asr #31
        adds    r7, r9, r1
        adc     r1, r8, r1, asr #31
        adds    r9, r11, r10
        adc     r11, r2, r10, asr #31
        adds    r7, r7, r0
        adc     r8, r1, r0, asr #31
        cmp     r6, lr
        add     r12, r12, #0xA
        ble     LAVF2
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAVF3:
        add     r0, r0, r6, lsl #1
LAVF4:
        ldrsh   lr, [r0], #2
        add     r6, r6, #1
        mul     r12, lr, lr
        adds    r9, r9, lr
        adc     r11, r11, lr, asr #31
        adds    r7, r7, r12
        adc     r8, r8, r12, asr #31
        cmp     r6, r1
        blt     LAVF4
        umull   r0, r12, r1, r7
        mla     r8, r1, r8, r12
        umull   r12, lr, r9, r9
        mla     lr, r9, r11, lr
        mov     r6, r1, asr #31
        mla     r7, r6, r7, r8
        rsb     r6, r1, #0
        mla     r2, r1, r1, r6
        mla     lr, r11, r9, lr
        subs    r0, r0, r12
        mov     r1, #0xFE, 12
        orr     r6, r1, #3, 4
        mov     r12, r2, asr #1
        sbc     r7, r7, lr
        adds    r0, r12, r0
        mov     r3, r2, asr #31
        adc     r1, r7, r12, asr #31
        bl      __divdi3
        bl      __floatdidf
        bl      sqrt
        cmp     r4, #0
        mov     r7, r0
        mov     r8, r1
        bne     LAVF5
        mov     r1, r6
        mov     r2, r7
        mov     r3, r8
        mov     r0, #0
        bl      __adddf3
        mov     r4, r0
        mov     r6, r1
        b       LAVF6
LAVF5:
        cmp     r4, #0
        mov     r12, #1
        ble     LAVF8
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __divdf3
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        mov     r4, r0
        mov     r6, r1
LAVF6:
        ldr     r7, [pc, #0x98]
        mov     r2, r4
        mov     r3, r6
        mov     r0, #0
        mov     r1, r7
        bl      __ltdf2
        cmp     r0, #0
        mov     r12, #0
        movlt   r4, r12
        movlt   r6, r7
        mov     r0, r4
        mov     r1, r6
        bl      __fixdfsi
        strh    r0, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVF7:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVF8:
        rsb     r4, r4, #0
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        mov     r4, r0
        mov     r6, r1
        b       LAVF6
LAVF9:
        mov     r9, r6
        mov     r11, r9
        mov     r7, r11
        mov     r8, r7
        b       LAVF3
LAVF10:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   0x40dfffc0


