        .text
        .align  4
        .globl  _ippsFIRLMSOne_DirectQ15_16s


_ippsFIRLMSOne_DirectQ15_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r7, [sp, #0x44]
        ldr     r12, [sp, #0x48]
        ldr     r4, [sp, #0x4C]
        ldr     lr, [sp, #0x50]
        mov     r5, r3
        cmp     r5, #0
        beq     LBKT11
        cmp     r4, #0
        beq     LBKT11
        cmp     lr, #0
        beq     LBKT11
        cmp     r2, #0
        beq     LBKT11
        cmp     r7, #0
        ble     LBKT10
        ldr     r6, [lr]
        cmp     r6, r7
        blt     LBKT1
LBKT0:
        mvn     r0, #0x17
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBKT1:
        cmp     r6, #0
        blt     LBKT0
        mov     r6, r6, lsl #1
        add     r8, r4, r7, lsl #1
        strh    r0, [r8, +r6]
        ldr     r6, [lr]
        mov     r11, #0
        mov     r6, r6, lsl #1
        strh    r0, [r4, +r6]
        ldr     r0, [lr]
        add     r0, r0, #1
        cmp     r0, r7
        strlt   r0, [lr]
        movge   r0, r11
        strge   r0, [lr]
        cmp     r7, #5
        add     r6, r4, r0, lsl #1
        blt     LBKT9
        mov     lr, r11
        mov     r4, lr
        mov     r0, r4
        sub     r3, r7, #5
        mov     r8, r0
        mov     r10, r6
        mov     r9, r5
        str     r3, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
LBKT2:
        ldrsh   r3, [r10], #8
        ldr     r7, [r9], #0x10
        add     r1, r11, #1
        ldr     r2, [r5, +r1, lsl #2]
        mul     r12, r3, r3
        mov     r1, r1, lsl #1
        str     r2, [sp, #0x18]
        mul     r2, r7, r3
        ldrsh   r1, [r6, +r1]
        add     r7, r11, #2
        ldr     r3, [r5, +r7, lsl #2]
        mov     r7, r7, lsl #1
        str     r3, [sp, #0x1C]
        adds    r3, r0, r2
        ldr     r0, [sp, #0x18]
        adc     r2, r8, r2, asr #31
        adds    lr, lr, r12
        mul     r0, r0, r1
        mul     r1, r1, r1
        adc     r12, r4, r12, asr #31
        ldrsh   r4, [r6, +r7]
        add     r7, r11, #3
        adds    r3, r3, r0
        adc     r0, r2, r0, asr #31
        ldr     r2, [sp, #0x1C]
        ldr     r8, [r5, +r7, lsl #2]
        adds    lr, lr, r1
        adc     r1, r12, r1, asr #31
        mul     r2, r2, r4
        mul     r4, r4, r4
        mov     r7, r7, lsl #1
        ldrsh   r12, [r6, +r7]
        add     r11, r11, #4
        adds    r3, r3, r2
        adc     r2, r0, r2, asr #31
        mul     r8, r8, r12
        mul     r12, r12, r12
        adds    lr, lr, r4
        adc     r4, r1, r4, asr #31
        ldr     r1, [sp, #0x14]
        adds    r0, r3, r8
        adc     r8, r2, r8, asr #31
        adds    lr, lr, r12
        adc     r4, r4, r12, asr #31
        cmp     r11, r1
        ble     LBKT2
        ldr     r12, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
LBKT3:
        add     r10, r6, r11, lsl #1
        add     r9, r5, r11, lsl #2
        str     r2, [sp, #8]
        str     r1, [sp, #4]
LBKT4:
        ldrsh   r2, [r10], #2
        ldr     r3, [r9], #4
        add     r11, r11, #1
        mul     r1, r2, r2
        mul     r2, r3, r2
        adds    r0, r0, r2
        adc     r8, r8, r2, asr #31
        adds    lr, lr, r1
        adc     r4, r4, r1, asr #31
        cmp     r11, r7
        blt     LBKT4
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r9, r0, lsr #15
        and     r9, r9, #1
        adds    r0, r0, r9
        mov     r9, #0xFF
        orr     r9, r9, #0x7F, 24
        sub     r9, r9, #1, 18
        adc     r8, r8, #0
        adds    r9, r0, r9
        adc     r0, r8, #0
        mvn     r8, #0xFF
        mov     r10, r0, lsl #17
        orr     r9, r10, r9, lsr #15
        bic     r8, r8, #0x7F, 24
        mvn     r10, r8
        subs    r11, r9, r10
        mov     r10, #0
        rscs    r3, r10, r0, asr #15
        movlt   r11, #0
        movlt   r3, #0
        orrs    r3, r11, r3
        mvnne   r8, r8
        bne     LBKT5
        sub     r8, r10, #2, 18
        cmp     r9, r8
        mvn     r8, #0
        rscs    r8, r8, r0, asr #15
        movge   r8, r9
        sublt   r8, r10, #2, 18
LBKT5:
        strh    r8, [r2]
        orrs    r2, lr, r4
        beq     LBKT8
        subs    r9, r1, r9
        umull   r8, r2, r12, r9
        mov     r1, r1, asr #31
        sbc     r1, r1, r0, asr #15
        mla     r2, r12, r1, r2
        mov     r12, r12, asr #31
        cmp     r7, #0
        mla     r9, r12, r9, r2
        ble     LBKT8
        mvn     r0, #0
        mvn     r10, #2, 2
        str     r0, [sp, #4]
        str     lr, [sp]
LBKT6:
        ldrsh   r1, [r6], #2
        ldr     r11, [r5]
        umull   r0, r2, r8, r1
        mov     r12, r1, asr #31
        mla     r2, r8, r12, r2
        mov     r3, r4
        mla     r1, r9, r1, r2
        ldr     r2, [sp]
        bl      __divdi3
        adds    r0, r11, r0
        adc     r11, r1, r11, asr #31
        subs    r2, r0, r10
        sbcs    r1, r11, #0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        movne   r0, r10
        bne     LBKT7
        ldr     r1, [sp, #4]
        cmp     r0, #2, 2
        sbcs    r11, r11, r1
        movlt   r0, #2, 2
LBKT7:
        str     r0, [r5], #4
        subs    r7, r7, #1
        bne     LBKT6
LBKT8:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBKT9:
        mov     lr, r11
        mov     r4, lr
        mov     r0, r4
        mov     r8, r0
        b       LBKT3
LBKT10:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBKT11:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


