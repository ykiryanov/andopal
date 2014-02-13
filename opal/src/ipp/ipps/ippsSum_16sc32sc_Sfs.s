        .text
        .align  4
        .globl  _ippsSum_16sc32sc_Sfs


_ippsSum_16sc32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        mov     r9, r2
        mov     r4, r3
        beq     LAVC22
        cmp     r9, #0
        beq     LAVC22
        cmp     r1, #0
        ble     LAVC23
        mov     r10, r1, asr #16
        bic     r1, r1, #0xFF, 8
        cmp     r10, #0
        bic     r2, r1, #0xFF, 16
        ble     LAVC21
        mov     r5, #0
        mov     r7, r5
        mov     r6, r7
        mov     r8, r6
        str     r2, [sp, #0xC]
        str     r4, [sp, #8]
        str     r9, [sp, #4]
LAVC0:
        mov     r3, #0
        mov     r2, r3
        mov     lr, r2
        sub     r12, r0, #2
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r10, [sp, #0x1C]
        str     r0, [sp]
LAVC1:
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
        blt     LAVC1
        ldr     r6, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x1C]
        ldr     r0, [sp]
        adds    r5, r5, r3
        adc     r7, r7, r3, asr #31
        adds    r6, r6, r2
        adc     r8, r8, r2, asr #31
        subs    r10, r10, #1
        bne     LAVC0
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r9, [sp, #4]
LAVC2:
        cmp     r2, #0
        beq     LAVC7
        cmp     r2, #0
        mov     r1, #0
        movle   r12, r1
        movle   lr, r12
        ble     LAVC6
        cmp     r2, #6
        movlt   r12, r1
        movlt   lr, r12
        blt     LAVC4
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
LAVC3:
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
        ble     LAVC3
        ldr     r5, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r0, [sp]
LAVC4:
        mov     r10, r1, lsl #2
        sub     r10, r10, #2
        add     r0, r10, r0
LAVC5:
        ldrsh   r10, [r0, #2]
        ldrsh   r11, [r0, #4]!
        add     r1, r1, #1
        cmp     r1, r2
        add     r12, r12, r10
        add     lr, r11, lr
        blt     LAVC5
LAVC6:
        adds    r5, r5, r12
        adc     r7, r7, r12, asr #31
        adds    r6, r6, lr
        adc     r8, r8, lr, asr #31
LAVC7:
        mov     r12, #2, 2
        cmp     r4, #0
        mvn     r10, #2, 2
        mvn     r11, #0
        str     r12, [sp, #0x1C]
        bne     LAVC10
        subs    r3, r5, r10
        sbcs    r12, r7, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r5, r10
        bne     LAVC8
        cmp     r5, #2, 2
        sbcs    r7, r7, r11
        ldrlt   r5, [sp, #0x1C]
LAVC8:
        subs    r3, r6, r10
        sbcs    r12, r8, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        str     r5, [r9]
        movne   r6, r10
        bne     LAVC9
        cmp     r6, #2, 2
        sbcs    r8, r8, r11
        ldrlt   r6, [sp, #0x1C]
LAVC9:
        str     r6, [r9, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVC10:
        cmp     r4, #0
        ble     LAVC13
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
        subs    r12, r0, r10
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r0, r10
        bne     LAVC11
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, #2, 2
LAVC11:
        str     r0, [r9]
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
        subs    r3, r0, r10
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r10
        bne     LAVC12
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, #2, 2
LAVC12:
        str     r0, [r9, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVC13:
        tst     r7, r7
        bmi     LAVC19
        rsb     r4, r4, #0
        mov     r12, r10, asr r4
        subs    r3, r5, r12
        sbcs    r12, r7, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r10
        bne     LAVC14
        mov     r0, r5
        mov     r1, r7
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LAVC14:
        str     r0, [r9]
LAVC15:
        tst     r8, r8
        bmi     LAVC17
        mov     r12, r10, asr r4
        subs    r3, r6, r12
        sbcs    r12, r8, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LAVC16
        mov     r0, r6
        mov     r1, r8
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        mov     r10, r0
LAVC16:
        str     r10, [r9, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVC17:
        ldr     r3, [sp, #0x1C]
        mov     r3, r3, asr r4
        cmp     r6, r3
        sbcs    r3, r8, r3, asr #31
        blt     LAVC18
        mov     r0, r6
        mov     r1, r8
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
        str     r0, [sp, #0x1C]
LAVC18:
        ldr     r0, [sp, #0x1C]
        str     r0, [r9, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVC19:
        ldr     r3, [sp, #0x1C]
        rsb     r4, r4, #0
        mov     r3, r3, asr r4
        cmp     r5, r3
        sbcs    r3, r7, r3, asr #31
        ldrlt   r0, [sp, #0x1C]
        blt     LAVC20
        mov     r0, r5
        mov     r1, r7
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LAVC20:
        str     r0, [r9]
        b       LAVC15
LAVC21:
        mov     r5, #0
        mov     r7, r5
        mov     r6, r7
        mov     r8, r6
        b       LAVC2
LAVC22:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVC23:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


