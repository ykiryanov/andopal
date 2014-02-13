        .text
        .align  4
        .globl  _ippsSum_16s_Sfs


_ippsSum_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r7, r2
        mov     r6, r3
        beq     LAVD15
        cmp     r7, #0
        beq     LAVD15
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mov     lr, r1, asr #16
        bic     r1, r1, #0xFF, 8
        cmp     lr, #0
        bic     r12, r1, #0xFF, 16
        movle   r4, #0
        movle   r5, r4
        ble     LAVD2
        mov     r4, #0
        mov     r5, r4
LAVD0:
        mov     r1, #0
        mov     r9, r1
        mov     r8, r0
LAVD1:
        ldrsh   r2, [r8]
        ldrsh   r11, [r8, #2]
        ldrsh   r10, [r8, #4]
        add     r2, r1, r2
        add     r9, r9, #4
        add     r11, r2, r11
        add     r10, r11, r10
        ldrsh   r11, [r8, #6]
        cmp     r9, #1, 16
        add     r8, r8, #8
        add     r1, r10, r11
        blt     LAVD1
        adds    r4, r4, r1
        adc     r5, r5, r1, asr #31
        subs    lr, lr, #1
        bne     LAVD0
LAVD2:
        cmp     r12, #0
        beq     LAVD7
        cmp     r12, #0
        movle   r10, #0
        ble     LAVD6
        cmp     r12, #6
        movlt   r10, #0
        movlt   lr, r10
        blt     LAVD4
        mov     r10, #0
        mov     lr, r10
        sub     r9, r12, #6
        mov     r8, r0
LAVD3:
        ldrsh   r1, [r8]
        ldrsh   r11, [r8, #2]
        add     lr, lr, #5
        add     r1, r10, r1
        ldrsh   r10, [r8, #6]
        add     r11, r1, r11
        ldrsh   r1, [r8, #4]
        cmp     lr, r9
        add     r1, r11, r1
        ldrsh   r11, [r8, #8]
        add     r10, r1, r10
        add     r8, r8, #0xA
        add     r10, r10, r11
        ble     LAVD3
LAVD4:
        add     r0, r0, lr, lsl #1
LAVD5:
        ldrsh   r8, [r0], #2
        add     lr, lr, #1
        cmp     lr, r12
        add     r10, r10, r8
        blt     LAVD5
LAVD6:
        adds    r4, r4, r10
        adc     r5, r5, r10, asr #31
LAVD7:
        mvn     r12, #0xFF
        cmp     r6, #0
        bic     r10, r12, #0x7F, 24
        mvn     r11, #0
        bne     LAVD9
        mvn     r3, r10
        subs    r3, r4, r3
        sbcs    r12, r5, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r4, r10
        bne     LAVD8
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r4, r3
        sbcs    r5, r5, r11
        movlt   r0, #0
        sublt   r4, r0, #2, 18
LAVD8:
        strh    r4, [r7]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVD9:
        cmp     r6, #0
        ble     LAVD11
        sub     r2, r6, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r9, r0, r4
        mov     r0, r4
        adc     r4, r1, r5
        mov     r8, r6, asr #31
        mov     r1, r5
        mov     r2, r6
        mov     r3, r8
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r4, r4, #0
        adds    r0, r0, r11
        adc     r1, r4, r11
        mov     r2, r6
        mov     r3, r8
        bl      __ashrdi3
        mvn     r3, r10
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, r10
        bne     LAVD10
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r0, r3
        sbcs    r1, r1, r11
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LAVD10:
        strh    r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVD11:
        tst     r5, r5
        rsb     r2, r6, #0
        bmi     LAVD13
        mvn     r3, r10
        mov     r12, r3, asr r2
        subs    r3, r4, r12
        sbcs    r12, r5, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r0, r10
        bne     LAVD12
        mov     r0, r4
        mov     r1, r5
        mov     r3, r2, asr #31
        bl      __ashldi3
LAVD12:
        strh    r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVD13:
        mov     r3, #0
        sub     r3, r3, #2, 18
        mov     r3, r3, asr r2
        cmp     r4, r3
        sbcs    r3, r5, r3, asr #31
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        blt     LAVD14
        mov     r0, r4
        mov     r1, r5
        mov     r3, r2, asr #31
        bl      __ashldi3
LAVD14:
        strh    r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVD15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


