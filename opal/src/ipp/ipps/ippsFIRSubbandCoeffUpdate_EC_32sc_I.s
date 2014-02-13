        .text
        .align  4
        .globl  _ippsFIRSubbandCoeffUpdate_EC_32sc_I


_ippsFIRSubbandCoeffUpdate_EC_32sc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r11, [sp, #0x74]
        ldr     r10, [sp, #0x78]
        ldr     r12, [sp, #0x7C]
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r2
        beq     LDKT19
        cmp     r1, #0
        beq     LDKT19
        cmp     r7, #0
        beq     LDKT19
        cmp     r3, #0
        beq     LDKT19
        cmp     r10, #1
        blt     LDKT18
        mov     lr, #1
        orr     lr, lr, #1, 20
        cmp     lr, r10
        blt     LDKT18
        cmp     r11, #1
        blt     LDKT17
        cmp     r11, #0xFF
        bgt     LDKT17
        cmp     r12, #0
        blt     LDKT17
        cmp     r12, #0x1F
        bgt     LDKT17
        cmp     r10, #0
        ble     LDKT1
        mov     r5, r6
        mov     r4, r10
LDKT0:
        ldr     lr, [r5], #8
        cmp     lr, #0
        blt     LDKT20
        subs    r4, r4, #1
        bne     LDKT0
LDKT1:
        cmp     r10, #0
        ble     LDKT16
        mvn     r4, #2, 2
        mvn     r5, #0
        mov     lr, #2, 2
        mov     r9, #0
        str     r5, [sp, #0x44]
        str     r4, [sp, #0x34]
        str     r12, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r1, [sp, #0x38]
LDKT2:
        ldr     r1, [r7]
        ldr     r4, [r6]
        ldr     lr, [r7, #4]
        ldr     r12, [r6, #4]
        ldr     r5, [sp, #0x40]
        smull   r1, r3, r4, r1
        smull   r4, lr, r4, lr
        sub     r12, r12, r5
        adds    r1, r1, #1, 2
        adc     r5, r3, #0
        adds    r3, r4, #1, 2
        adc     r4, lr, #0
        mov     lr, r5, lsl #1
        orr     r1, lr, r1, lsr #31
        mov     r4, r4, lsl #1
        subs    r5, r12, #0x1F
        str     r1, [sp, #0x28]
        orr     r8, r4, r3, lsr #31
        bmi     LDKT7
        cmp     r5, #1
        movle   r1, #0
        strle   r1, [sp, #0x14]
        ble     LDKT3
        sub     r2, r5, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        str     r0, [sp, #0x14]
LDKT3:
        cmp     r11, #0
        ble     LDKT15
        ldr     lr, [sp, #0x38]
        ldr     r4, [sp, #0x3C]
        mov     r3, r8, asr #31
        rsbs    r0, r8, #0
        str     r8, [sp, #0x10]
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x34]
        mov     r12, r5, asr #31
        rsc     r3, r3, #0
        mov     r2, r11
        str     r5, [sp, #4]
        str     lr, [sp, #0xC]
        str     r2, [sp, #0x2C]
        str     r3, [sp, #0x30]
        str     r12, [sp]
        str     r1, [sp, #8]
        str     r6, [sp, #0x18]
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x24]
        mov     r5, r0
LDKT4:
        ldr     r2, [sp, #0xC]
        ldr     r1, [r2], #4
        str     r2, [sp, #0xC]
        add     r2, r9, r1
        ldr     r2, [r2, #4]
        ldr     r12, [r1, +r9]
        cmp     r2, #2, 2
        mvneq   r1, #2, 2
        rsbne   r1, r2, #0
        smull   r2, r6, r7, r12
        umull   r0, r3, r5, r1
        ldr     lr, [sp, #0x10]
        ldr     r11, [sp, #0x30]
        adds    r0, r2, r0
        ldr     r2, [sp, #4]
        smull   lr, r12, lr, r12
        str     r12, [sp, #0x48]
        smull   r10, r12, r7, r1
        str     r12, [sp, #0x4C]
        mov     r12, r1, asr #31
        mla     r12, r5, r12, r3
        ldr     r3, [sp]
        mla     r12, r11, r1, r12
        ldr     r11, [sp, #8]
        adc     r1, r6, r12
        adds    r6, lr, r10
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x48]
        ldr     r10, [sp, #0x14]
        adc     lr, r12, lr
        str     lr, [sp, #0x4C]
        adds    r0, r10, r0
        adc     r1, r11, r1
        bl      __ashrdi3
        ldr     r2, [sp, #0x4C]
        adds    r10, r10, r6
        mov     r6, r1
        adc     r1, r11, r2
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        str     r0, [sp, #0x48]
        mov     r0, r10
        bl      __ashrdi3
        ldr     r2, [r4]
        ldr     r3, [sp, #0x48]
        ldr     r12, [r2, +r9]
        adds    r3, r12, r3
        adc     r6, r6, r12, asr #31
        subs    r12, r3, r8
        sbcs    lr, r6, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        strne   r8, [r2, +r9]
        bne     LDKT5
        ldr     r12, [sp, #0x44]
        cmp     r3, #2, 2
        sbcs    r6, r6, r12
        strge   r3, [r2, +r9]
        movlt   r3, #2, 2
        strlt   r3, [r2, +r9]
LDKT5:
        ldr     r2, [r4], #4
        add     r3, r9, r2
        ldr     r3, [r3, #4]
        adds    r0, r3, r0
        adc     r1, r1, r3, asr #31
        subs    r3, r0, r8
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        addne   r2, r9, r2
        strne   r8, [r2, #4]
        bne     LDKT6
        ldr     r3, [sp, #0x44]
        cmp     r0, #2, 2
        sbcs    r1, r1, r3
        addge   r2, r9, r2
        strge   r0, [r2, #4]
        bge     LDKT6
        add     r2, r9, r2
        mov     r1, #2, 2
        str     r1, [r2, #4]
LDKT6:
        ldr     r1, [sp, #0x2C]
        subs    r1, r1, #1
        str     r1, [sp, #0x2C]
        bne     LDKT4
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x24]
        b       LDKT15
LDKT7:
        rsb     r2, r5, #0
        str     r2, [sp, #0x2C]
        mov     r3, r2, asr #31
        str     r3, [sp, #0x30]
        mvn     r0, #0
        mvn     r1, #2, 2
        bl      __ashrdi3
        cmp     r11, #0
        mov     r4, r1
        ble     LDKT15
        ldr     lr, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        mov     r3, r8, asr #31
        str     r7, [sp, #0x1C]
        ldr     r7, [sp, #0x34]
        rsbs    r12, r8, #0
        rsc     r3, r3, #0
        mov     r1, r11
        str     r6, [sp, #0x18]
        str     lr, [sp, #8]
        str     r1, [sp, #0xC]
        str     r3, [sp, #0x14]
        str     r12, [sp, #4]
        str     r8, [sp, #0x10]
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x24]
        mov     r6, r0
LDKT8:
        ldr     r3, [sp, #8]
        ldr     r2, [r3], #4
        str     r3, [sp, #8]
        add     r3, r9, r2
        ldr     r12, [r3, #4]
        ldr     r3, [r2, +r9]
        cmp     r12, #2, 2
        mvneq   r12, #2, 2
        rsbne   r12, r12, #0
        ldr     r10, [sp, #4]
        ldr     r2, [sp, #0x28]
        ldr     r8, [sp, #0x14]
        umull   r0, lr, r12, r10
        mla     lr, r12, r8, lr
        smull   r1, r11, r2, r3
        ldr     r8, [sp, #0x10]
        smull   r8, r3, r3, r8
        str     r3, [sp, #0x4C]
        smull   r3, r2, r2, r12
        mov     r12, r12, asr #31
        mla     lr, r12, r10, lr
        adds    r0, r1, r0
        adc     r1, r11, lr
        adds    r8, r8, r3
        ldr     r3, [sp, #0x4C]
        adc     r10, r3, r2
        cmp     r0, r6
        sbcs    r2, r1, r4
        blt     LDKT9
        mvn     r2, #1
        str     r2, [sp]
        mov     r11, #0
        b       LDKT11
LDKT9:
        rsbs    r2, r6, #0
        rsc     r3, r4, #0
        subs    r2, r0, r2
        sbcs    r3, r1, r3
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LDKT10
        mov     r2, #0
        str     r2, [sp]
        mvn     r11, #0
        b       LDKT11
LDKT10:
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __ashldi3
        str     r0, [sp]
        mov     r11, r1
LDKT11:
        cmp     r8, r6
        sbcs    r2, r10, r4
        mvnge   r0, #1
        movge   r1, #0
        bge     LDKT12
        rsbs    r2, r6, #0
        rsc     r3, r4, #0
        subs    r2, r8, r2
        sbcs    r3, r10, r3
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        moveq   r0, #0
        mvneq   r1, #0
        beq     LDKT12
        mov     r0, r8
        mov     r1, r10
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __ashldi3
LDKT12:
        ldr     r3, [r5]
        ldr     r2, [sp]
        ldr     r12, [r3, +r9]
        adds    r2, r12, r2
        adc     r11, r11, r12, asr #31
        subs    lr, r2, r7
        sbcs    r12, r11, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        strne   r7, [r3, +r9]
        bne     LDKT13
        ldr     r12, [sp, #0x44]
        cmp     r2, #2, 2
        sbcs    r11, r11, r12
        strge   r2, [r3, +r9]
        movlt   r2, #2, 2
        strlt   r2, [r3, +r9]
LDKT13:
        ldr     r2, [r5], #4
        add     r3, r9, r2
        ldr     r3, [r3, #4]
        adds    r0, r3, r0
        adc     r1, r1, r3, asr #31
        subs    r12, r0, r7
        sbcs    r3, r1, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        addne   r2, r9, r2
        strne   r7, [r2, #4]
        bne     LDKT14
        ldr     r3, [sp, #0x44]
        cmp     r0, #2, 2
        sbcs    r1, r1, r3
        addge   r2, r9, r2
        strge   r0, [r2, #4]
        bge     LDKT14
        add     r2, r9, r2
        mov     r3, #2, 2
        str     r3, [r2, #4]
LDKT14:
        ldr     r2, [sp, #0xC]
        subs    r2, r2, #1
        str     r2, [sp, #0xC]
        bne     LDKT8
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x24]
LDKT15:
        subs    r10, r10, #1
        add     r9, r9, #8
        add     r6, r6, #8
        add     r7, r7, #8
        bne     LDKT2
LDKT16:
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKT17:
        mvn     r0, #6
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKT18:
        mvn     r0, #0x76
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKT19:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDKT20:
        mvn     r0, #5
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


