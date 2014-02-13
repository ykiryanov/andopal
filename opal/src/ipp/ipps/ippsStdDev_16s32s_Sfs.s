        .text
        .align  4
        .globl  _ippsStdDev_16s32s_Sfs


_ippsStdDev_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r0, #0
        mov     r5, r2
        mov     r4, r3
        beq     LAVG12
        cmp     r5, #0
        beq     LAVG12
        cmp     r1, #2
        blt     LAVG9
        cmp     r4, #0x1F
        mov     r6, #0
        ble     LAVG0
        str     r6, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVG0:
        cmn     r4, #0x1E
        bge     LAVG1
        mvn     r0, #2, 2
        str     r0, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVG1:
        cmp     r1, #6
        blt     LAVG11
        mov     r9, r6
        mov     r11, r9
        mov     r7, r11
        mov     r8, r7
        sub     lr, r1, #6
        mov     r12, r0
        str     r1, [sp, #4]
        str     r0, [sp]
LAVG2:
        ldrsh   r1, [r12]
        ldrsh   r2, [r12, #2]
        add     r6, r6, #5
        mul     r10, r1, r1
        adds    r0, r9, r1
        adc     r1, r11, r1, asr #31
        mul     r11, r2, r2
        adds    r9, r7, r10
        ldrsh   r7, [r12, #4]
        adc     r10, r8, r10, asr #31
        adds    r0, r0, r2
        mul     r8, r7, r7
        adc     r1, r1, r2, asr #31
        adds    r9, r9, r11
        ldrsh   r2, [r12, #6]
        adc     r11, r10, r11, asr #31
        adds    r0, r0, r7
        adc     r7, r1, r7, asr #31
        mul     r1, r2, r2
        adds    r9, r9, r8
        ldrsh   r10, [r12, #8]
        adc     r8, r11, r8, asr #31
        adds    r11, r0, r2
        mul     r0, r10, r10
        adc     r2, r7, r2, asr #31
        adds    r7, r9, r1
        adc     r1, r8, r1, asr #31
        adds    r9, r11, r10
        adc     r11, r2, r10, asr #31
        adds    r7, r7, r0
        adc     r8, r1, r0, asr #31
        cmp     r6, lr
        add     r12, r12, #0xA
        ble     LAVG2
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAVG3:
        add     r0, r0, r6, lsl #1
LAVG4:
        ldrsh   lr, [r0], #2
        add     r6, r6, #1
        mul     r12, lr, lr
        adds    r9, r9, lr
        adc     r11, r11, lr, asr #31
        adds    r7, r7, r12
        adc     r8, r8, r12, asr #31
        cmp     r6, r1
        blt     LAVG4
        umull   r0, r12, r1, r7
        mla     r8, r1, r8, r12
        umull   lr, r12, r9, r9
        mla     r12, r9, r11, r12
        mov     r6, r1, asr #31
        mla     r7, r6, r7, r8
        mov     r6, #0xFE, 12
        subs    r0, r0, lr
        mla     r12, r11, r9, r12
        sub     lr, r1, #1
        mul     r8, lr, r1
        orr     r6, r6, #3, 4
        sbc     r1, r7, r12
        bl      __floatdidf
        mov     r7, r0
        mov     r0, r8
        mov     r8, r1
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __divdf3
        bl      sqrt
        cmp     r4, #0
        mov     r7, r0
        mov     r8, r1
        bne     LAVG5
        mov     r1, r6
        mov     r2, r7
        mov     r3, r8
        mov     r0, #0
        bl      __adddf3
        mov     r6, r0
        mov     r4, r1
        b       LAVG6
LAVG5:
        cmp     r4, #0
        mov     r12, #1
        ble     LAVG10
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __divdf3
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        mov     r6, r0
        mov     r4, r1
LAVG6:
        mov     r0, r6
        mov     lr, #0
        mvn     r12, #0xE2, 12
        sub     r2, lr, #1, 10
        bic     r3, r12, #0xB, 4
        mov     r1, r4
        bl      __ltdf2
        cmp     r0, #0
        mvnge   r0, #2, 2
        strge   r0, [r5]
        bge     LAVG8
        mov     r0, r6
        mov     r1, r4
        bl      __fixdfsi
        mov     r7, r0
        tst     r7, #1
        beq     LAVG7
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r4
        bl      __eqdf2
        cmp     r0, #0
        subeq   r7, r7, #1
LAVG7:
        str     r7, [r5]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVG8:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVG9:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAVG10:
        rsb     r4, r4, #0
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        mov     r6, r0
        mov     r4, r1
        b       LAVG6
LAVG11:
        mov     r9, r6
        mov     r11, r9
        mov     r7, r11
        mov     r8, r7
        b       LAVG3
LAVG12:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


