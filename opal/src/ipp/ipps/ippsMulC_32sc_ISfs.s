        .text
        .align  4
        .globl  _ippsMulC_32sc_ISfs


_ippsMulC_32sc_ISfs:
        mov     r12, sp
        stmdb   sp!, {r4 - r7, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x44
        str     r0, [r11, #-0x30]
        str     r1, [r11, #-0x2C]
        str     r2, [r11, #-0x28]
        str     r3, [r11, #-0x24]
        ldr     r0, [r11]
        cmp     r0, #0x3F
        ble     LBDT0
        ldr     r1, [r11, #-0x24]
        ldr     r0, [r11, #-0x28]
        bl      _ippsZero_32sc
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDT0:
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        bne     LBDT1
        mvn     r0, #7
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDT1:
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        bgt     LBDT2
        mvn     r0, #5
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDT2:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDT6
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        beq     LBDT4
        mov     r0, #0
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        bge     LBDT14
LBDT3:
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x60]
        str     r3, [r11, #-0x5C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x58]
        str     r2, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        blt     LBDT3
        b       LBDT14
LBDT4:
        mov     r0, #0
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        bge     LBDT14
LBDT5:
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x60]
        str     r3, [r11, #-0x5C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x58]
        str     r2, [r11, #-0x54]
        mov     r3, #0
        mov     r1, #2, 2
        ldr     r2, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        cmp     r0, r1
        cmpeq   r2, r3
        ldrne   r1, [r11, #-0x58]
        ldrne   r0, [r11, #-0x54]
        mvneq   r1, #0
        mvneq   r0, #2, 2
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        blt     LBDT5
        b       LBDT14
LBDT6:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDT10
        ldr     r0, [r11]
        sub     r2, r0, #1
        mov     r3, r2, asr #31
        mov     r0, #1
        mov     r1, #0
        bl      __ashldi3
        mvn     r2, #0
        adds    r0, r0, r2
        mvn     r2, #0
        adc     r1, r1, r2
        str     r0, [r11, #-0x40]
        str     r1, [r11, #-0x3C]
        ldr     r0, [r11]
        sub     r0, r0, #1
        str     r0, [r11]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        beq     LBDT8
        mov     r0, #0
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        bge     LBDT14
LBDT7:
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x60]
        str     r3, [r11, #-0x5C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x58]
        str     r2, [r11, #-0x54]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r7, r1, r2
        mov     r4, r0, asr #1
        ldr     r0, [r11, #-0x60]
        and     r2, r0, #1
        mov     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        adds    r5, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x5C]
        mov     r0, r0, lsr #1
        mov     r2, r1, lsl #31
        orr     r0, r0, r2
        mov     r1, r1, asr #1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r1, r0, #1
        mov     r0, #0
        adds    r1, r5, r1
        adc     r6, r6, r0
        mov     r1, r1, lsr #1
        mov     r0, r6, lsl #31
        orr     r1, r1, r0
        mov     r6, r6, asr #1
        adds    r0, r7, r1
        adc     r1, r4, r6
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x5C]
        ldr     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r7, r1, r2
        mov     r4, r0, asr #1
        ldr     r0, [r11, #-0x58]
        and     r2, r0, #1
        mov     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        adds    r5, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        mov     r0, r0, lsr #1
        mov     r2, r1, lsl #31
        orr     r0, r0, r2
        mov     r1, r1, asr #1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r1, r0, #1
        mov     r0, #0
        adds    r1, r5, r1
        adc     r6, r6, r0
        mov     r1, r1, lsr #1
        mov     r0, r6, lsl #31
        orr     r1, r1, r0
        mov     r6, r6, asr #1
        adds    r0, r7, r1
        adc     r1, r4, r6
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        blt     LBDT7
        b       LBDT14
LBDT8:
        mov     r0, #0
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        bge     LBDT14
LBDT9:
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x60]
        str     r3, [r11, #-0x5C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x58]
        str     r2, [r11, #-0x54]
        mov     r3, #0
        mov     r1, #2, 2
        ldr     r2, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        cmp     r0, r1
        cmpeq   r2, r3
        ldrne   r1, [r11, #-0x58]
        ldrne   r0, [r11, #-0x54]
        mvneq   r1, #0
        mvneq   r0, #2, 2
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r7, r1, r2
        mov     r4, r0, asr #1
        ldr     r0, [r11, #-0x60]
        and     r2, r0, #1
        mov     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        adds    r5, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x5C]
        mov     r0, r0, lsr #1
        mov     r2, r1, lsl #31
        orr     r0, r0, r2
        mov     r1, r1, asr #1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r1, r0, #1
        mov     r0, #0
        adds    r1, r5, r1
        adc     r6, r6, r0
        mov     r1, r1, lsr #1
        mov     r0, r6, lsl #31
        orr     r1, r1, r0
        mov     r6, r6, asr #1
        adds    r0, r7, r1
        adc     r1, r4, r6
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x5C]
        ldr     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r7, r1, r2
        mov     r4, r0, asr #1
        ldr     r0, [r11, #-0x58]
        and     r2, r0, #1
        mov     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        adds    r5, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        mov     r0, r0, lsr #1
        mov     r2, r1, lsl #31
        orr     r0, r0, r2
        mov     r1, r1, asr #1
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        and     r1, r0, #1
        mov     r0, #0
        adds    r1, r5, r1
        adc     r6, r6, r0
        mov     r1, r1, lsr #1
        mov     r0, r6, lsl #31
        orr     r1, r1, r0
        mov     r6, r6, asr #1
        adds    r0, r7, r1
        adc     r1, r4, r6
        ldr     r2, [r11]
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        blt     LBDT9
        b       LBDT14
LBDT10:
        ldr     r0, [r11]
        mov     r1, #0
        sub     r0, r1, r0
        str     r0, [r11]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 2
        beq     LBDT12
        mov     r0, #0
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        bge     LBDT14
LBDT11:
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x60]
        str     r3, [r11, #-0x5C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x58]
        str     r2, [r11, #-0x54]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x60]
        ldr     r1, [r11, #-0x5C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x60]
        ldrne   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x60]
        str     r0, [r11, #-0x5C]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x58]
        ldrne   r0, [r11, #-0x54]
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x60]
        str     r0, [r11, #-0x5C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x5C]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x5C]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        blt     LBDT11
        b       LBDT14
LBDT12:
        mov     r0, #0
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        bge     LBDT14
LBDT13:
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x2C]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r1, r2
        adc     r3, r0, r3
        str     r2, [r11, #-0x60]
        str     r3, [r11, #-0x5C]
        ldr     r0, [r11, #-0x2C]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x28]
        ldr     lr, [r11, #-0x38]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x58]
        str     r2, [r11, #-0x54]
        mov     r3, #0
        mov     r1, #2, 2
        ldr     r2, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        cmp     r0, r1
        cmpeq   r2, r3
        ldrne   r1, [r11, #-0x58]
        ldrne   r0, [r11, #-0x54]
        mvneq   r1, #0
        mvneq   r0, #2, 2
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x60]
        ldr     r1, [r11, #-0x5C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x60]
        ldrne   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x60]
        str     r0, [r11, #-0x5C]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x58]
        ldrne   r0, [r11, #-0x54]
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x60]
        str     r0, [r11, #-0x5C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x5C]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x5C]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x5C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x60]
        ldrlt   r0, [r11, #-0x5C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        mov     r1, #0
        ldr     r0, [r11, #-0x58]
        ldr     r2, [r11, #-0x54]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x58]
        ldrlt   r0, [r11, #-0x54]
        str     r1, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x48]
        ldr     r1, [r11, #-0x44]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x28]
        ldr     r2, [r11, #-0x38]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x24]
        cmp     r0, r1
        blt     LBDT13
LBDT14:
        mov     r0, #0
        ldmdb   r11, {r4 - r7, r11, sp, pc}


