        .text
        .align  4
        .globl  _ippsSum_16s32s_Sfs


_ippsSum_16s32s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r7, r2
        mov     r6, r3
        beq     LAVE15
        cmp     r7, #0
        beq     LAVE15
        cmp     r1, #0
        ble     LAVE16
        mov     r8, r1, asr #16
        bic     r1, r1, #0xFF, 8
        cmp     r8, #0
        bic     r12, r1, #0xFF, 16
        mov     lr, #0
        movle   r5, lr
        movle   r4, r5
        ble     LAVE2
        mov     r5, lr
        mov     r4, r5
LAVE0:
        mov     r2, lr
        mov     r10, r2
        mov     r9, r0
LAVE1:
        ldrsh   r3, [r9]
        ldrsh   r11, [r9, #2]
        ldrsh   r1, [r9, #4]
        add     r3, r2, r3
        add     r10, r10, #4
        add     r11, r3, r11
        add     r1, r11, r1
        ldrsh   r11, [r9, #6]
        cmp     r10, #1, 16
        add     r9, r9, #8
        add     r2, r1, r11
        blt     LAVE1
        adds    r5, r5, r2
        adc     r4, r4, r2, asr #31
        subs    r8, r8, #1
        bne     LAVE0
LAVE2:
        cmp     r12, #0
        beq     LAVE7
        cmp     r12, #0
        movle   r8, lr
        ble     LAVE6
        cmp     r12, #6
        movlt   r8, lr
        blt     LAVE4
        mov     r8, lr
        sub     r11, r12, #6
        mov     r10, r0
LAVE3:
        ldrsh   r2, [r10]
        ldrsh   r1, [r10, #2]
        ldrsh   r9, [r10, #4]
        add     r2, r8, r2
        ldrsh   r8, [r10, #8]
        add     r1, r2, r1
        add     r9, r1, r9
        ldrsh   r1, [r10, #6]
        add     lr, lr, #5
        cmp     lr, r11
        add     r10, r10, #0xA
        add     r1, r9, r1
        add     r8, r1, r8
        ble     LAVE3
LAVE4:
        add     r0, r0, lr, lsl #1
LAVE5:
        ldrsh   r9, [r0], #2
        add     lr, lr, #1
        cmp     lr, r12
        add     r8, r8, r9
        blt     LAVE5
LAVE6:
        adds    r5, r5, r8
        adc     r4, r4, r8, asr #31
LAVE7:
        cmp     r6, #0
        mvn     r10, #2, 2
        mvn     r11, #0
        mov     r9, #2, 2
        bne     LAVE9
        subs    r3, r5, r10
        sbcs    r12, r4, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r5, r10
        bne     LAVE8
        cmp     r5, #2, 2
        sbcs    r4, r4, r11
        movlt   r5, r9
LAVE8:
        str     r5, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVE9:
        cmp     r6, #0
        ble     LAVE11
        sub     r2, r6, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r0, r0, r5
        str     r0, [sp]
        mov     r0, r5
        adc     r5, r1, r4
        mov     r8, r6, asr #31
        mov     r1, r4
        mov     r2, r6
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [sp]
        and     r1, r0, #1
        adds    r1, r12, r1
        adc     r5, r5, #0
        adds    r0, r1, r11
        adc     r1, r5, r11
        mov     r2, r6
        mov     r3, r8
        bl      __ashrdi3
        subs    r3, r0, r10
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r10
        bne     LAVE10
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, r9
LAVE10:
        str     r0, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVE11:
        tst     r4, r4
        rsb     r2, r6, #0
        bmi     LAVE13
        mov     r12, r10, asr r2
        subs    r3, r5, r12
        sbcs    r12, r4, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LAVE12
        mov     r0, r5
        mov     r1, r4
        mov     r3, r2, asr #31
        bl      __ashldi3
        mov     r10, r0
LAVE12:
        str     r10, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVE13:
        mov     r3, r9, asr r2
        cmp     r5, r3
        sbcs    r3, r4, r3, asr #31
        blt     LAVE14
        mov     r0, r5
        mov     r1, r4
        mov     r3, r2, asr #31
        bl      __ashldi3
        mov     r9, r0
LAVE14:
        str     r9, [r7]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVE15:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LAVE16:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}


