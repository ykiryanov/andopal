        .text
        .align  4
        .globl  _ippsMul_32sc_Sfs


_ippsMul_32sc_Sfs:
        mov     r12, sp
        stmdb   sp!, {r4 - r7, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x3C
        str     r0, [r11, #-0x2C]
        str     r1, [r11, #-0x28]
        str     r2, [r11, #-0x24]
        str     r3, [r11, #-0x20]
        ldr     r0, [r11]
        cmp     r0, #0x3F
        ble     LBDC2
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        beq     LBDC0
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        bne     LBDC1
LBDC0:
        mvn     r0, #7
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDC1:
        ldr     r1, [r11, #-0x20]
        ldr     r0, [r11, #-0x24]
        bl      _ippsZero_32sc
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDC2:
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0
        beq     LBDC3
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        beq     LBDC3
        ldr     r0, [r11, #-0x24]
        cmp     r0, #0
        bne     LBDC4
LBDC3:
        mvn     r0, #7
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDC4:
        ldr     r0, [r11, #-0x20]
        cmp     r0, #0
        bgt     LBDC5
        mvn     r0, #5
        ldmdb   r11, {r4 - r7, r11, sp, pc}
LBDC5:
        ldr     r0, [r11]
        cmp     r0, #0
        bne     LBDC7
        mov     r0, #0
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        cmp     r0, r1
        bge     LBDC11
LBDC6:
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        ldr     r0, [r0, +r1, lsl #3]
        ldr     r1, [r11, #-0x2C]
        ldr     r2, [r11, #-0x30]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r0, r1, r2, r0
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x30]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldr     r2, [r3, #4]
        ldr     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x30]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r0, r2
        adc     r3, r1, r3
        str     r2, [r11, #-0x58]
        str     r3, [r11, #-0x54]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        ldr     r0, [r1, #4]
        ldr     r1, [r11, #-0x2C]
        ldr     r2, [r11, #-0x30]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x30]
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x30]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x50]
        str     r2, [r11, #-0x4C]
        mov     r3, #0
        mov     r1, #2, 2
        ldr     r2, [r11, #-0x50]
        ldr     r0, [r11, #-0x4C]
        cmp     r0, r1
        cmpeq   r2, r3
        ldrne   r1, [r11, #-0x50]
        ldrne   r0, [r11, #-0x4C]
        mvneq   r1, #0
        mvneq   r0, #2, 2
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
        mov     r1, #0
        ldr     r0, [r11, #-0x50]
        ldr     r2, [r11, #-0x4C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x50]
        ldrlt   r0, [r11, #-0x4C]
        str     r1, [r11, #-0x40]
        str     r0, [r11, #-0x3C]
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
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x30]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x40]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x30]
        add     r0, r0, #1
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        cmp     r0, r1
        blt     LBDC6
        b       LBDC11
LBDC7:
        ldr     r0, [r11]
        cmp     r0, #0
        ble     LBDC9
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
        str     r0, [r11, #-0x38]
        str     r1, [r11, #-0x34]
        ldr     r0, [r11]
        sub     r0, r0, #1
        str     r0, [r11]
        mov     r0, #0
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        cmp     r0, r1
        bge     LBDC11
LBDC8:
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        ldr     r0, [r0, +r1, lsl #3]
        ldr     r1, [r11, #-0x2C]
        ldr     r2, [r11, #-0x30]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r0, r1, r2, r0
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x30]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldr     r2, [r3, #4]
        ldr     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x30]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r0, r2
        adc     r3, r1, r3
        str     r2, [r11, #-0x58]
        str     r3, [r11, #-0x54]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        ldr     r0, [r1, #4]
        ldr     r1, [r11, #-0x2C]
        ldr     r2, [r11, #-0x30]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x30]
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x30]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x50]
        str     r2, [r11, #-0x4C]
        mov     r3, #0
        mov     r1, #2, 2
        ldr     r2, [r11, #-0x50]
        ldr     r0, [r11, #-0x4C]
        cmp     r0, r1
        cmpeq   r2, r3
        ldrne   r1, [r11, #-0x50]
        ldrne   r0, [r11, #-0x4C]
        mvneq   r1, #0
        mvneq   r0, #2, 2
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r7, r1, r2
        mov     r4, r0, asr #1
        ldr     r0, [r11, #-0x58]
        and     r2, r0, #1
        mov     r0, #0
        ldr     r3, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
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
        ldr     r1, [r11, #-0x50]
        ldr     r0, [r11, #-0x4C]
        mov     r1, r1, lsr #1
        mov     r2, r0, lsl #31
        orr     r7, r1, r2
        mov     r4, r0, asr #1
        ldr     r0, [r11, #-0x50]
        and     r2, r0, #1
        mov     r0, #0
        ldr     r3, [r11, #-0x38]
        ldr     r1, [r11, #-0x34]
        adds    r5, r2, r3
        adc     r6, r0, r1
        ldr     r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
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
        str     r0, [r11, #-0x50]
        str     r1, [r11, #-0x4C]
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
        mov     r1, #0
        ldr     r0, [r11, #-0x50]
        ldr     r2, [r11, #-0x4C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x50]
        ldrlt   r0, [r11, #-0x4C]
        str     r1, [r11, #-0x40]
        str     r0, [r11, #-0x3C]
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
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x30]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x40]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x30]
        add     r0, r0, #1
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        cmp     r0, r1
        blt     LBDC8
        b       LBDC11
LBDC9:
        ldr     r1, [r11]
        mov     r0, #0
        sub     r1, r0, r1
        str     r1, [r11]
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        cmp     r0, r1
        bge     LBDC11
LBDC10:
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        ldr     r0, [r0, +r1, lsl #3]
        ldr     r1, [r11, #-0x2C]
        ldr     r2, [r11, #-0x30]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r0, r1, r2, r0
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x30]
        mov     r3, r3, lsl #3
        add     r3, r2, r3
        ldr     r2, [r3, #4]
        ldr     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x30]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r2, r3, r3, r2
        rsbs    r2, r2, #0
        rsc     r3, r3, #0
        adds    r2, r0, r2
        adc     r3, r1, r3
        str     r2, [r11, #-0x58]
        str     r3, [r11, #-0x54]
        ldr     r0, [r11, #-0x28]
        ldr     r1, [r11, #-0x30]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        ldr     r0, [r1, #4]
        ldr     r1, [r11, #-0x2C]
        ldr     r2, [r11, #-0x30]
        ldr     r2, [r1, +r2, lsl #3]
        smull   r1, r0, r2, r0
        ldr     r2, [r11, #-0x28]
        ldr     r3, [r11, #-0x30]
        ldr     r2, [r2, +r3, lsl #3]
        ldr     r3, [r11, #-0x2C]
        ldr     lr, [r11, #-0x30]
        mov     lr, lr, lsl #3
        add     lr, r3, lr
        ldr     r3, [lr, #4]
        smull   r3, r2, r3, r2
        adds    r1, r1, r3
        adc     r2, r0, r2
        str     r1, [r11, #-0x50]
        str     r2, [r11, #-0x4C]
        mov     r3, #0
        mov     r1, #2, 2
        ldr     r2, [r11, #-0x50]
        ldr     r0, [r11, #-0x4C]
        cmp     r0, r1
        cmpeq   r2, r3
        ldrne   r1, [r11, #-0x50]
        ldrne   r0, [r11, #-0x4C]
        mvneq   r1, #0
        mvneq   r0, #2, 2
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
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
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r1, #2, 2
        mvneq   r0, #0
        ldrne   r1, [r11, #-0x50]
        ldrne   r0, [r11, #-0x4C]
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
        str     r1, [r11, #-0x58]
        str     r0, [r11, #-0x54]
        mov     r1, #0
        ldr     r0, [r11, #-0x50]
        ldr     r2, [r11, #-0x4C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x50]
        ldrlt   r0, [r11, #-0x4C]
        str     r1, [r11, #-0x50]
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x58]
        str     r1, [r11, #-0x54]
        ldr     r0, [r11, #-0x50]
        ldr     r1, [r11, #-0x4C]
        ldr     r2, [r11]
        mov     r3, #0
        bl      __ashldi3
        str     r0, [r11, #-0x50]
        str     r1, [r11, #-0x4C]
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
        mov     r1, #0
        ldr     r0, [r11, #-0x50]
        ldr     r2, [r11, #-0x4C]
        cmn     r0, #6, 2
        sbcs    r2, r2, r1
        mvnge   r1, #2, 2
        movge   r0, #0
        ldrlt   r1, [r11, #-0x50]
        ldrlt   r0, [r11, #-0x4C]
        str     r1, [r11, #-0x40]
        str     r0, [r11, #-0x3C]
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
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x30]
        str     r0, [r1, +r2, lsl #3]
        mov     r2, #2, 2
        mvn     r0, #0
        ldr     r3, [r11, #-0x40]
        ldr     r1, [r11, #-0x3C]
        subs    r2, r3, r2
        sbcs    r1, r1, r0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        moveq   r0, #2, 2
        ldrne   r0, [r11, #-0x40]
        ldr     r1, [r11, #-0x24]
        ldr     r2, [r11, #-0x30]
        mov     r2, r2, lsl #3
        add     r2, r1, r2
        str     r0, [r2, #4]
        ldr     r0, [r11, #-0x30]
        add     r0, r0, #1
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x20]
        cmp     r0, r1
        blt     LBDC10
LBDC11:
        mov     r0, #0
        ldmdb   r11, {r4 - r7, r11, sp, pc}


