        .text
        .align  4
        .globl  _ippsSum_32s_Sfs


_ippsSum_32s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        mov     r10, r2
        mov     r6, r3
        beq     LAVA11
        cmp     r10, #0
        beq     LAVA11
        cmp     r1, #0
        ble     LAVA6
        cmp     r1, #6
        mov     r7, #0
        movlt   r4, r7
        movlt   r5, r4
        blt     LAVA1
        mov     r4, r7
        mov     r5, r4
        sub     lr, r1, #6
        add     r12, r0, #4
LAVA0:
        ldr     r8, [r12, #-4]
        ldr     r9, [r12]
        ldr     r11, [r12, #4]
        adds    r4, r4, r8
        adc     r5, r5, r8, asr #31
        adds    r8, r4, r9
        ldr     r4, [r12, #8]
        adc     r9, r5, r9, asr #31
        ldr     r5, [r12, #0xC]
        adds    r8, r8, r11
        adc     r11, r9, r11, asr #31
        adds    r8, r8, r4
        adc     r11, r11, r4, asr #31
        adds    r4, r8, r5
        add     r7, r7, #5
        add     r12, r12, #0x14
        adc     r5, r11, r5, asr #31
        cmp     r7, lr
        ble     LAVA0
LAVA1:
        add     r0, r0, r7, lsl #2
LAVA2:
        ldr     r12, [r0], #4
        add     r7, r7, #1
        adds    r4, r4, r12
        adc     r5, r5, r12, asr #31
        cmp     r7, r1
        blt     LAVA2
        cmp     r6, #0
        mvn     r9, #2, 2
        mvn     r11, #0
        mov     r8, #2, 2
        bne     LAVA4
        subs    r3, r4, r9
        sbcs    r12, r5, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r4, r9
        bne     LAVA3
        cmp     r4, #2, 2
        sbcs    r5, r5, r11
        movlt   r4, r8
LAVA3:
        str     r4, [r10]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVA4:
        cmp     r6, #0
        ble     LAVA7
        sub     r2, r6, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r0, r0, r4
        str     r0, [sp]
        mov     r0, r4
        adc     r4, r1, r5
        mov     r7, r6, asr #31
        mov     r1, r5
        mov     r2, r6
        mov     r3, r7
        bl      __ashrdi3
        ldr     r12, [sp]
        and     r1, r0, #1
        adds    r1, r12, r1
        adc     r4, r4, #0
        adds    r0, r1, r11
        adc     r1, r4, r11
        mov     r2, r6
        mov     r3, r7
        bl      __ashrdi3
        subs    r3, r0, r9
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r9
        bne     LAVA5
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, r8
LAVA5:
        str     r0, [r10]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVA6:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LAVA7:
        tst     r5, r5
        rsb     r2, r6, #0
        bmi     LAVA9
        mov     r12, r9, asr r2
        subs    r3, r4, r12
        sbcs    r12, r5, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LAVA8
        mov     r0, r4
        mov     r1, r5
        mov     r3, r2, asr #31
        bl      __ashldi3
        mov     r9, r0
LAVA8:
        str     r9, [r10]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVA9:
        mov     r3, r8, asr r2
        cmp     r4, r3
        sbcs    r3, r5, r3, asr #31
        blt     LAVA10
        mov     r0, r4
        mov     r1, r5
        mov     r3, r2, asr #31
        bl      __ashldi3
        mov     r8, r0
LAVA10:
        str     r8, [r10]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LAVA11:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


