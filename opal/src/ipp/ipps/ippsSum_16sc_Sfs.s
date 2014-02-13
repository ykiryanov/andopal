        .text
        .align  4
        .globl  _ippsSum_16sc_Sfs


_ippsSum_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        mov     r9, r2
        mov     r4, r3
        beq     LAVB20
        cmp     r9, #0
        beq     LAVB20
        cmp     r1, #0
        ble     LAVB21
        mov     r10, r1, asr #16
        bic     r1, r1, #0xFF, 8
        cmp     r10, #0
        bic     r2, r1, #0xFF, 16
        ble     LAVB19
        mov     r5, #0
        mov     r7, r5
        mov     r6, r7
        mov     r8, r6
        str     r2, [sp, #0xC]
        str     r4, [sp, #8]
        str     r9, [sp, #4]
LAVB0:
        mov     r3, #0
        mov     r2, r3
        mov     lr, r2
        sub     r12, r0, #2
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r10, [sp, #0x1C]
        str     r0, [sp]
LAVB1:
        ldrsh   r4, [r12, #4]
        ldrsh   r1, [r12, #2]
        ldrsh   r6, [r12, #6]
        ldrsh   r8, [r12, #8]
        ldrsh   r9, [r12, #0xA]
        ldrsh   r10, [r12, #0xC]
        ldrsh   r11, [r12, #0xE]
        ldrsh   r0, [r12, #0x10]!
        add     r3, r3, r1
        add     r4, r2, r4
        add     r6, r3, r6
        add     r8, r4, r8
        add     lr, lr, #4
        add     r9, r6, r9
        add     r10, r8, r10
        cmp     lr, #1, 16
        add     r3, r9, r11
        add     r2, r10, r0
        blt     LAVB1
        ldr     r6, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r0, [sp]
        adds    r5, r5, r3
        adc     r7, r7, r3, asr #31
        adds    r6, r6, r2
        adc     r8, r8, r2, asr #31
        subs    r10, r10, #1
        bne     LAVB0
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r9, [sp, #4]
LAVB2:
        cmp     r2, #0
        beq     LAVB7
        cmp     r2, #0
        mov     r1, #0
        movle   r12, r1
        movle   lr, r12
        ble     LAVB6
        cmp     r2, #6
        movlt   r12, r1
        movlt   lr, r12
        blt     LAVB4
        mov     r12, r1
        mov     lr, r12
        sub     r11, r2, #6
        sub     r10, r0, #2
        str     r5, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r2, [sp, #0xC]
        str     r4, [sp, #8]
        str     r9, [sp, #4]
        str     r0, [sp]
LAVB3:
        ldrsh   r8, [r10, #4]
        ldrsh   r9, [r10, #2]
        ldrsh   r5, [r10, #6]
        ldrsh   r2, [r10, #8]
        ldrsh   r0, [r10, #0xA]
        ldrsh   r4, [r10, #0xC]
        ldrsh   r3, [r10, #0xE]
        ldrsh   r6, [r10, #0x10]
        add     r8, r8, lr
        add     r12, r12, r9
        ldrsh   r9, [r10, #0x12]
        ldrsh   lr, [r10, #0x14]!
        add     r8, r2, r8
        add     r5, r12, r5
        add     r8, r4, r8
        add     r0, r5, r0
        add     r1, r1, #5
        add     r3, r0, r3
        add     r8, r6, r8
        cmp     r1, r11
        add     r12, r3, r9
        add     lr, lr, r8
        ble     LAVB3
        ldr     r5, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r0, [sp]
LAVB4:
        mov     r10, r1, lsl #2
        sub     r10, r10, #2
        add     r0, r10, r0
LAVB5:
        ldrsh   r10, [r0, #2]
        ldrsh   r11, [r0, #4]!
        add     r1, r1, #1
        cmp     r1, r2
        add     r12, r12, r10
        add     lr, r11, lr
        blt     LAVB5
LAVB6:
        adds    r5, r5, r12
        adc     r7, r7, r12, asr #31
        adds    r6, r6, lr
        adc     r8, r8, lr, asr #31
LAVB7:
        mvn     r12, #0xFF
        cmp     r4, #0
        bic     r10, r12, #0x7F, 24
        mvn     r11, #0
        bne     LAVB10
        mvn     r3, r10
        subs    r3, r5, r3
        sbcs    r12, r7, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r5, r10
        bne     LAVB8
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r5, r3
        sbcs    r7, r7, r11
        movlt   r3, #0
        sublt   r5, r3, #2, 18
LAVB8:
        mvn     r3, r10
        subs    r3, r6, r3
        sbcs    r12, r8, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        strh    r5, [r9]
        mvnne   r6, r10
        bne     LAVB9
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r6, r3
        sbcs    r8, r8, r11
        movlt   r0, #0
        sublt   r6, r0, #2, 18
LAVB9:
        strh    r6, [r9, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVB10:
        cmp     r4, #0
        ble     LAVB13
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mov     r3, r0
        mov     r0, r5
        str     r3, [sp, #0x1C]
        mov     r2, r1
        str     r2, [sp, #0xC]
        mov     r12, r4, asr #31
        str     r12, [sp]
        adds    r5, r3, r5
        ldr     r3, [sp]
        mov     r1, r7
        str     r5, [sp, #0x18]
        adc     r7, r2, r7
        mov     r2, r4
        bl      __ashrdi3
        ldr     lr, [sp, #0x18]
        and     r12, r0, #1
        adds    r12, lr, r12
        ldr     r3, [sp]
        adc     r7, r7, #0
        adds    r0, r12, r11
        adc     r1, r7, r11
        mov     r2, r4
        bl      __ashrdi3
        mvn     r12, r10
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r0, r10
        bne     LAVB11
        mov     r12, #0
        sub     lr, r12, #2, 18
        cmp     r0, lr
        sbcs    r1, r1, r11
        sublt   r0, r12, #2, 18
LAVB11:
        strh    r0, [r9]
        ldr     r12, [sp, #0x1C]
        mov     r0, r6
        ldr     r5, [sp]
        adds    r6, r12, r6
        ldr     r12, [sp, #0xC]
        mov     r1, r8
        mov     r2, r4
        mov     r3, r5
        adc     r8, r12, r8
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r8, r8, #0
        adds    r0, r0, r11
        adc     r1, r8, r11
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        mvn     r3, r10
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, r10
        bne     LAVB12
        mov     r3, #0
        sub     r12, r3, #2, 18
        cmp     r0, r12
        sbcs    r1, r1, r11
        sublt   r0, r3, #2, 18
LAVB12:
        strh    r0, [r9, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVB13:
        tst     r7, r7
        bmi     LAVB18
        mvn     r3, r10
        rsb     r4, r4, #0
        mov     r12, r3, asr r4
        subs    r3, r5, r12
        sbcs    r12, r7, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, r10
        bne     LAVB14
        mov     r0, r5
        mov     r1, r7
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LAVB14:
        tst     r8, r8
        strh    r0, [r9]
        bmi     LAVB16
        mvn     r3, r10
        mov     r12, r3, asr r4
        subs    r3, r6, r12
        sbcs    r12, r8, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, r10
        bne     LAVB15
        mov     r0, r6
        mov     r1, r8
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LAVB15:
        strh    r0, [r9, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVB16:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mov     r3, r3, asr r4
        cmp     r6, r3
        sbcs    r3, r8, r3, asr #31
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LAVB17
        mov     r0, r6
        mov     r1, r8
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LAVB17:
        strh    r0, [r9, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVB18:
        mov     r3, #0
        sub     r3, r3, #2, 18
        rsb     r4, r4, #0
        mov     r3, r3, asr r4
        cmp     r5, r3
        sbcs    r3, r7, r3, asr #31
        movlt   r3, #0
        sublt   r0, r3, #2, 18
        blt     LAVB14
        mov     r0, r5
        mov     r1, r7
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        b       LAVB14
LAVB19:
        mov     r5, #0
        mov     r7, r5
        mov     r6, r7
        mov     r8, r6
        b       LAVB2
LAVB20:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVB21:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


