        .text
        .align  4
        .globl  _ippsFIRSubbandLowCoeffUpdate_EC_32sc_I


_ippsFIRSubbandLowCoeffUpdate_EC_32sc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r6, [sp, #0x78]
        ldr     r12, [sp, #0x74]
        ldr     r5, [sp, #0x7C]
        ldr     r4, [sp, #0x80]
        ldr     lr, [sp, #0x84]
        cmp     r6, #0
        beq     LDKR15
        cmp     r0, #0
        beq     LDKR15
        cmp     r1, #0
        beq     LDKR15
        cmp     r2, #0
        beq     LDKR15
        cmp     r12, #0
        beq     LDKR15
        cmp     r3, #1
        blt     LDKR10
        cmp     r3, #0xFF
        bgt     LDKR10
        cmp     r5, #0
        blt     LDKR10
        cmp     r5, r4
        bgt     LDKR10
        cmp     r4, #1
        blt     LDKR9
        mov     r7, #1
        orr     r7, r7, #1, 20
        cmp     r7, r4
        blt     LDKR9
        cmp     lr, #0
        blt     LDKR10
        cmp     lr, #0x1F
        bgt     LDKR10
        cmp     r5, r4
        bge     LDKR13
        add     r7, r1, r5, lsl #3
        sub     r9, r4, r5
        mvn     r1, #2, 2
        mvn     r8, #0
        add     r6, r6, r5, lsl #3
        mov     r11, #2, 2
        mov     r4, r5, lsl #3
        add     r10, r12, r5, lsl #3
        str     r8, [sp, #0x28]
        str     r1, [sp, #0x24]
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x20]
        str     r3, [sp, #0x40]
        str     r2, [sp, #0x34]
        str     r0, [sp, #0x38]
LDKR0:
        ldr     r1, [r7]
        ldr     r0, [r6]
        smull   r0, r1, r0, r1
        adds    r0, r0, #1, 2
        adc     r1, r1, #0
        mov     r1, r1, lsl #1
        orr     r11, r1, r0, lsr #31
        str     r11, [r10]
        ldr     r1, [r7, #4]
        ldr     r0, [r6]
        smull   r0, r1, r0, r1
        adds    r0, r0, #1, 2
        adc     r1, r1, #0
        mov     r1, r1, lsl #1
        orr     r5, r1, r0, lsr #31
        str     r5, [r10, #4]
        ldr     r1, [r6, #4]
        ldr     r0, [sp, #0x3C]
        sub     r1, r1, r0
        subs    r8, r1, #0x1F
        bmi     LDKR3
        cmp     r8, #1
        movle   r2, #0
        movle   r0, r2
        ble     LDKR1
        sub     r2, r8, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mov     r2, r1
LDKR1:
        ldr     r3, [sp, #0x40]
        cmp     r3, #0
        ble     LDKR12
        ldr     r1, [sp, #0x38]
        ldr     lr, [sp, #0x34]
        mov     r12, r8, asr #31
        mov     r3, #0
        str     r8, [sp, #4]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r12, [sp, #8]
        str     r0, [sp, #0xC]
        str     r10, [sp, #0x10]
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
        mov     r6, lr
LDKR2:
        ldr     r1, [r7], #4
        ldr     r10, [r6]
        rsbs    r12, r5, #0
        add     r0, r4, r1
        ldr     r0, [r0, #4]
        ldr     r2, [r10, +r4]
        ldr     r1, [r1, +r4]
        rsb     r0, r0, #0
        str     r2, [sp, #0x30]
        smull   r2, r3, r11, r1
        str     r3, [sp, #0x2C]
        smull   r1, r3, r5, r1
        str     r3, [sp, #0x44]
        umull   r3, lr, r12, r0
        mov     r5, r5, asr #31
        add     r9, r9, #1
        str     r1, [sp]
        smull   r11, r1, r11, r0
        str     r1, [sp, #0x4C]
        str     r11, [sp, #0x48]
        mov     r11, r0, asr #31
        mla     lr, r12, r11, lr
        rsc     r12, r5, #0
        ldr     r5, [sp, #8]
        ldr     r11, [sp]
        mla     lr, r12, r0, lr
        ldr     r0, [sp, #0x2C]
        adds    r1, r2, r3
        ldr     r2, [sp, #4]
        mov     r3, r5
        adc     r12, r0, lr
        ldr     r0, [sp, #0x48]
        adds    r0, r11, r0
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        ldr     r11, [sp, #0x44]
        adc     r0, r11, r0
        ldr     r11, [sp, #0xC]
        str     r0, [sp, #0x4C]
        adds    r0, r11, r1
        adc     r1, r8, r12
        bl      __ashrdi3
        ldr     r12, [sp, #0x30]
        mov     r3, r5
        add     r0, r12, r0
        str     r0, [r10, +r4]
        ldr     r0, [sp, #0x48]
        ldr     r10, [sp, #0x4C]
        ldr     r12, [r6], #4
        adds    r0, r11, r0
        ldr     r2, [sp, #4]
        adc     r1, r8, r10
        add     r10, r4, r12
        ldr     r11, [r10, #4]
        bl      __ashrdi3
        ldr     r12, [sp, #0x40]
        add     r0, r11, r0
        cmp     r9, r12
        str     r0, [r10, #4]
        bge     LDKR11
        ldr     r0, [sp, #0x20]
        add     r12, r0, r4
        ldr     r5, [r12, #4]
        ldr     r11, [r0, +r4]
        b       LDKR2
LDKR3:
        rsb     r2, r8, #0
        str     r2, [sp, #0x30]
        mov     r3, r2, asr #31
        str     r3, [sp, #0x2C]
        mvn     r0, #0
        mvn     r1, #2, 2
        bl      __ashrdi3
        ldr     r2, [sp, #0x40]
        cmp     r2, #0
        ble     LDKR12
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0x24]
        rsbs    r2, r0, #0
        rsc     r3, r1, #0
        mov     r8, #0
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp]
        str     r0, [sp, #4]
        str     r10, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r9, [sp, #0x1C]
LDKR4:
        ldr     r0, [sp, #0x38]
        mov     r6, r8, lsl #2
        ldr     r1, [r0, +r8, lsl #2]
        rsbs    r0, r5, #0
        add     r2, r4, r1
        ldr     r12, [r2, #4]
        ldr     r3, [r1, +r4]
        mov     r1, r5, asr #31
        rsc     r1, r1, #0
        smull   lr, r2, r3, r11
        smull   r5, r3, r5, r3
        rsb     r12, r12, #0
        str     lr, [sp, #0x4C]
        umull   r9, lr, r0, r12
        str     lr, [sp, #0x44]
        smull   r11, lr, r11, r12
        mov     r10, r12, asr #31
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        mla     r9, r0, r10, r9
        ldr     r0, [sp, #0x48]
        ldr     r10, [sp, #0x4C]
        mla     r9, r1, r12, r9
        adds    r0, r10, r0
        adc     r1, r2, r9
        ldr     r2, [sp, #4]
        adds    r5, r5, r11
        adc     r9, r3, lr
        cmp     r0, r2
        ldr     r2, [sp]
        sbcs    r2, r1, r2
        mvnge   r11, #1
        movge   r10, #0
        bge     LDKR5
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        subs    r2, r0, r2
        sbcs    r3, r1, r3
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        moveq   r11, #0
        mvneq   r10, #0
        beq     LDKR5
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __ashldi3
        mov     r11, r0
        mov     r10, r1
LDKR5:
        ldr     r2, [sp, #4]
        cmp     r5, r2
        ldr     r2, [sp]
        sbcs    r2, r9, r2
        mvnge   r0, #1
        movge   r1, #0
        bge     LDKR6
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        subs    r2, r5, r2
        sbcs    r3, r9, r3
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        moveq   r0, #0
        mvneq   r1, #0
        beq     LDKR6
        mov     r0, r5
        mov     r1, r9
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __ashldi3
LDKR6:
        ldr     r2, [sp, #0x34]
        ldr     r2, [r2, +r6]
        ldr     r3, [r2, +r4]
        adds    r11, r3, r11
        adc     r10, r10, r3, asr #31
        subs    r12, r11, r7
        sbcs    r3, r10, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        strne   r7, [r2, +r4]
        bne     LDKR7
        ldr     r3, [sp, #0x28]
        cmp     r11, #2, 2
        sbcs    r10, r10, r3
        strge   r11, [r2, +r4]
        movlt   r3, #2, 2
        strlt   r3, [r2, +r4]
LDKR7:
        ldr     r2, [sp, #0x34]
        ldr     r6, [r2, +r6]
        add     r2, r4, r6
        ldr     r2, [r2, #4]
        adds    r0, r2, r0
        adc     r1, r1, r2, asr #31
        subs    r3, r0, r7
        sbcs    r2, r1, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        addne   r6, r4, r6
        strne   r7, [r6, #4]
        bne     LDKR8
        ldr     r2, [sp, #0x28]
        cmp     r0, #2, 2
        sbcs    r1, r1, r2
        addge   r6, r4, r6
        strge   r0, [r6, #4]
        bge     LDKR8
        add     r6, r4, r6
        mov     r0, #2, 2
        str     r0, [r6, #4]
LDKR8:
        ldr     r0, [sp, #0x40]
        add     r8, r8, #1
        cmp     r8, r0
        bge     LDKR14
        ldr     r0, [sp, #0x20]
        add     r1, r0, r4
        ldr     r5, [r1, #4]
        ldr     r11, [r0, +r4]
        b       LDKR4
LDKR9:
        mvn     r0, #0x76
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKR10:
        mvn     r0, #6
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKR11:
        ldr     r10, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
LDKR12:
        subs    r9, r9, #1
        add     r4, r4, #8
        add     r10, r10, #8
        add     r6, r6, #8
        add     r7, r7, #8
        bne     LDKR0
LDKR13:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKR14:
        ldr     r10, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        b       LDKR12
LDKR15:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


