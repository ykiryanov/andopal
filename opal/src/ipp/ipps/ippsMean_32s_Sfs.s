        .text
        .align  4
        .globl  _ippsMean_32s_Sfs


_ippsMean_32s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r7, r2
        mov     r10, r3
        beq     LBIB31
        cmp     r7, #0
        beq     LBIB31
        cmp     r4, #0
        ble     LBIB32
        cmp     r4, #6
        blt     LBIB30
        mov     r5, #0
        mov     r6, r5
        mov     r12, r6
        sub     lr, r4, #6
LBIB0:
        ldr     r8, [r0]
        ldr     r9, [r0, #4]
        ldr     r11, [r0, #8]
        adds    r5, r8, r5
        adc     r6, r6, r8, asr #31
        adds    r8, r9, r5
        ldr     r5, [r0, #0xC]
        adc     r9, r6, r9, asr #31
        ldr     r6, [r0, #0x10]
        adds    r8, r11, r8
        adc     r11, r9, r11, asr #31
        adds    r8, r5, r8
        adc     r11, r11, r5, asr #31
        adds    r5, r6, r8
        add     r12, r12, #5
        add     r0, r0, #0x14
        adc     r6, r11, r6, asr #31
        cmp     r12, lr
        ble     LBIB0
LBIB1:
        ldr     lr, [r0], #4
        add     r12, r12, #1
        adds    r5, lr, r5
        adc     r6, r6, lr, asr #31
        cmp     r12, r4
        blt     LBIB1
        cmp     r10, #0
        mvn     r8, #0
        mov     r9, #1
        beq     LBIB19
        cmp     r10, #0
        ble     LBIB5
        tst     r6, r6
        strpl   r9, [sp]
        bmi     LBIB23
LBIB2:
        mov     r11, r4, asr #31
        mov     r0, r5
        mov     r1, r6
        mov     r2, r4
        mov     r3, r11
        bl      __divdi3
        rsbs    lr, r4, #0
        umull   r12, r3, r0, lr
        rsc     r2, r11, #0
        mla     r2, r0, r2, r3
        adds    r12, r5, r12
        mla     r2, r1, lr, r2
        adc     r2, r6, r2
        adds    r12, r12, r12
        adc     lr, r2, r2
        cmp     r12, r4
        sbcs    r5, lr, r11
        blt     LBIB4
        subs    r12, r12, r4
        sbcs    lr, lr, r11
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LBIB3
        adds    r0, r0, #1
        adc     r1, r1, #0
        b       LBIB4
LBIB3:
        and     r12, r0, #1
        adds    r0, r0, r12
        adc     r1, r1, #0
LBIB4:
        ldr     r12, [sp]
        mov     r4, r10, asr #31
        mov     r3, r4
        umull   r2, lr, r12, r0
        mla     r1, r12, r1, lr
        mov     r12, r12, asr #31
        mla     r1, r12, r0, r1
        sub     r12, r10, #1
        mov     r9, r9, lsl r12
        mov     r0, r2
        adds    r5, r9, r2
        mov     r2, r10
        adc     r6, r1, r9, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r5, r0
        adc     r6, r6, #0
        adds    r0, r0, r8
        adc     r1, r6, r8
        mov     r2, r10
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB5:
        rsb     r10, r10, #0
        cmp     r10, #0x20
        str     r10, [sp]
        mvn     r11, #2, 2
        mov     r10, #2, 2
        bge     LBIB15
        subs    r3, r5, r11
        sbcs    r12, r6, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBIB10
        cmp     r5, #2, 2
        sbcs    r3, r6, r8
        blt     LBIB10
        mov     r0, r5
        mov     r1, r6
        ldr     r2, [sp]
        mov     r3, #0
        bl      __ashldi3
        mov     r6, r1
        tst     r6, r6
        mov     r5, r0
        bmi     LBIB24
LBIB6:
        mov     r10, r4, asr #31
        mov     r0, r5
        mov     r1, r6
        mov     r2, r4
        mov     r3, r10
        bl      __divdi3
        rsbs    lr, r4, #0
        umull   r12, r3, r0, lr
        rsc     r2, r10, #0
        mla     r2, r0, r2, r3
        adds    r12, r5, r12
        mla     r2, r1, lr, r2
        adc     r2, r6, r2
        adds    r12, r12, r12
        adc     lr, r2, r2
        cmp     r12, r4
        sbcs    r5, lr, r10
        blt     LBIB8
        subs    r12, r12, r4
        sbcs    lr, lr, r10
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LBIB7
        adds    r0, r0, #1
        adc     r1, r1, #0
        b       LBIB8
LBIB7:
        and     r3, r0, #1
        adds    r0, r0, r3
        adc     r1, r1, #0
LBIB8:
        umull   r3, r12, r9, r0
        mla     r1, r9, r1, r12
        mov     r9, r9, asr #31
        mla     r1, r9, r0, r1
        subs    r0, r3, r11
        sbcs    r12, r1, #0
        movlt   r0, #0
        movlt   r12, #0
        orrs    r12, r0, r12
        movne   r3, r11
        bne     LBIB9
        cmp     r3, #2, 2
        sbcs    r1, r1, r8
        movlt   r3, #2, 2
LBIB9:
        str     r3, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB10:
        tst     r6, r6
        bmi     LBIB25
LBIB11:
        mov     r10, r4, asr #31
        mov     r0, r5
        mov     r1, r6
        mov     r2, r4
        mov     r3, r10
        bl      __divdi3
        rsbs    lr, r4, #0
        umull   r12, r3, r0, lr
        rsc     r2, r10, #0
        mla     r2, r0, r2, r3
        adds    r12, r5, r12
        mla     r2, r1, lr, r2
        adc     r2, r6, r2
        adds    r12, r12, r12
        adc     lr, r2, r2
        cmp     r12, r4
        sbcs    r5, lr, r10
        blt     LBIB13
        subs    r12, r12, r4
        sbcs    lr, lr, r10
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LBIB12
        adds    r0, r0, #1
        adc     r1, r1, #0
        b       LBIB13
LBIB12:
        and     r3, r0, #1
        adds    r0, r0, r3
        adc     r1, r1, #0
LBIB13:
        umull   r3, r12, r9, r0
        mla     r1, r9, r1, r12
        mov     r9, r9, asr #31
        ldr     r2, [sp]
        mla     r1, r9, r0, r1
        mov     r0, r3
        mov     r3, #0
        bl      __ashldi3
        subs    r3, r0, r11
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r11
        bne     LBIB14
        cmp     r0, #2, 2
        sbcs    r1, r1, r8
        movlt   r0, #2, 2
LBIB14:
        str     r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB15:
        tst     r6, r6
        bmi     LBIB28
LBIB16:
        mov     r8, r4, asr #31
        mov     r0, r5
        mov     r1, r6
        mov     r2, r4
        mov     r3, r8
        bl      __divdi3
        rsbs    lr, r4, #0
        umull   r12, r3, r0, lr
        rsc     r2, r8, #0
        mla     r2, r0, r2, r3
        adds    r12, r5, r12
        mla     r2, r1, lr, r2
        adc     r2, r6, r2
        adds    r12, r12, r12
        adc     lr, r2, r2
        cmp     r12, r4
        sbcs    r5, lr, r8
        blt     LBIB18
        subs    r12, r12, r4
        sbcs    lr, lr, r8
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LBIB17
        adds    r0, r0, #1
        adc     r1, r1, #0
        b       LBIB18
LBIB17:
        and     r3, r0, #1
        adds    r0, r0, r3
        adc     r1, r1, #0
LBIB18:
        umull   r3, r12, r9, r0
        mla     r1, r9, r1, r12
        mov     r9, r9, asr #31
        mla     r1, r9, r0, r1
        orrs    r3, r3, r1, lsl #1
        tstcs   r3, #0
        beq     LBIB26
        str     r11, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB19:
        tst     r6, r6
        bmi     LBIB29
LBIB20:
        mov     r8, r4, asr #31
        mov     r1, r6
        mov     r0, r5
        mov     r2, r4
        mov     r3, r8
        bl      __divdi3
        rsbs    r12, r4, #0
        umull   lr, r10, r0, r12
        rsc     r11, r8, #0
        mla     r10, r0, r11, r10
        adds    lr, r5, lr
        mla     r10, r1, r12, r10
        adc     r6, r6, r10
        adds    lr, lr, lr
        adc     r12, r6, r6
        cmp     lr, r4
        sbcs    r5, r12, r8
        blt     LBIB22
        subs    lr, lr, r4
        sbcs    r12, r12, r8
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LBIB21
        adds    r0, r0, #1
        b       LBIB22
LBIB21:
        and     r1, r0, #1
        adds    r0, r0, r1
LBIB22:
        umull   r0, r1, r9, r0
        str     r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB23:
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
        str     r8, [sp]
        b       LBIB2
LBIB24:
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
        mov     r9, r8
        b       LBIB6
LBIB25:
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
        mov     r9, r8
        b       LBIB11
LBIB26:
        tst     r1, r1
        bmi     LBIB27
        mov     r0, #0
        str     r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB27:
        str     r10, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB28:
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
        mov     r9, r8
        b       LBIB16
LBIB29:
        rsbs    r5, r5, #0
        rsc     r6, r6, #0
        mov     r9, r8
        b       LBIB20
LBIB30:
        mov     r5, #0
        mov     r6, r5
        mov     r12, r6
        b       LBIB1
LBIB31:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBIB32:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


