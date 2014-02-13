        .text
        .align  4
        .globl  ownsFIROne64sc_16sc_Sfs


ownsFIROne64sc_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r5, [r2, #0x2C]
        ldr     r4, [r2, #4]
        ldr     r12, [r2, #8]
        ldr     lr, [r2]
        mov     r7, r5, lsl #2
        mov     r6, r0, lsl #16
        add     r5, r4, r12, lsl #2
        str     r0, [sp, #8]
        mov     r6, r6, asr #16
        strh    r6, [r5, +r7]
        ldr     r7, [r2, #0x2C]
        mov     r9, r1
        mov     r0, r0, asr #16
        mov     r7, r7, lsl #2
        strh    r6, [r4, +r7]
        ldr     r6, [r2, #0x2C]
        add     r6, r5, r6, lsl #2
        strh    r0, [r6, #2]
        ldr     r5, [r2, #0x2C]
        add     r5, r4, r5, lsl #2
        strh    r0, [r5, #2]
        ldr     r0, [r2, #0x2C]
        add     r0, r0, #1
        cmp     r0, r12
        strlt   r0, [r2, #0x2C]
        movge   r0, #0
        strge   r0, [r2, #0x2C]
        ldr     r2, [r2, #0x28]
        cmp     r12, #0
        add     r6, r4, r0, lsl #2
        sub     r8, r2, r3
        ble     LBVQ9
        mov     r5, #0
        mov     r4, r5
        mov     r7, r4
        add     r3, r6, #2
        add     lr, lr, #2
        mov     r6, r7
LBVQ0:
        ldrsh   r10, [r3, #-2]
        ldrsh   r11, [lr, #-2]
        ldrsh   r2, [lr], #4
        ldrsh   r0, [r3], #4
        mul     r1, r11, r10
        mul     r10, r2, r10
        mul     r2, r0, r2
        mla     r10, r11, r0, r10
        sub     r1, r1, r2
        adds    r7, r7, r1
        adc     r6, r6, r1, asr #31
        adds    r5, r5, r10
        adc     r4, r4, r10, asr #31
        subs    r12, r12, #1
        bne     LBVQ0
LBVQ1:
        mvn     r3, #0x1E
        cmp     r8, #0
        str     r3, [sp]
        beq     LBVQ3
        cmp     r8, #0x1F
        mov     r2, r8
        mov     r3, #0x1F
        movgt   r2, r3
        ldr     r3, [sp]
        cmn     r2, #0x1F
        movlt   r2, r3
        cmp     r2, #0
        ble     LBVQ2
        mov     r0, r7
        mov     r1, r6
        mov     r3, #0
        bl      __ashldi3
        mov     r7, r0
        mov     r6, r1
        b       LBVQ3
LBVQ2:
        rsb     r10, r2, #0
        sub     r3, r10, #1
        mov     r12, #1
        mov     r3, r12, lsl r3
        sub     r3, r3, #1
        str     r3, [sp, #4]
        mov     r11, r10, asr #31
        mov     r0, r7
        mov     r1, r6
        mov     r2, r10
        mov     r3, r11
        bl      __ashrdi3
        ldr     lr, [sp, #4]
        and     r12, r0, #1
        adds    r7, r7, lr
        adc     lr, r6, lr, asr #31
        adds    r0, r7, r12
        adc     r1, lr, #0
        mov     r2, r10
        mov     r3, r11
        bl      __ashrdi3
        mov     r7, r0
        mov     r6, r1
LBVQ3:
        mvn     r3, #0xFF
        bic     r10, r3, #0x7F, 24
        mvn     r3, r10
        subs    r3, r7, r3
        sbcs    r12, r6, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r3, r3, r12
        mvn     r11, #0
        mvnne   r7, r10
        bne     LBVQ4
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r7, r3
        sbcs    r6, r6, r11
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        movlt   r3, #0
        sublt   r7, r3, #2, 18
LBVQ4:
        cmp     r8, #0
        strh    r7, [r9]
        beq     LBVQ6
        cmp     r8, #0x1F
        mov     r3, #0x1F
        movgt   r8, r3
        ldr     r3, [sp]
        cmn     r8, #0x1F
        movlt   r8, r3
        cmp     r8, #0
        ble     LBVQ5
        mov     r0, r5
        mov     r1, r4
        mov     r2, r8
        mov     r3, #0
        bl      __ashldi3
        mov     r5, r0
        mov     r4, r1
        b       LBVQ6
LBVQ5:
        rsb     r8, r8, #0
        mov     r12, #1
        sub     r3, r8, #1
        mov     r12, r12, lsl r3
        mov     r6, r8, asr #31
        mov     r0, r5
        mov     r1, r4
        mov     r2, r8
        mov     r3, r6
        sub     r7, r12, #1
        bl      __ashrdi3
        adds    r5, r5, r7
        and     r0, r0, #1
        adc     r7, r4, r7, asr #31
        adds    r0, r5, r0
        adc     r1, r7, #0
        mov     r2, r8
        mov     r3, r6
        bl      __ashrdi3
        mov     r5, r0
        mov     r4, r1
LBVQ6:
        mvn     r2, r10
        subs    r2, r5, r2
        sbcs    r3, r4, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBVQ7
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r5, r2
        sbcs    r4, r4, r11
        movge   r5, r5, lsl #16
        movge   r10, r5, asr #16
        b       LBVQ8
LBVQ7:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r10, r0
LBVQ8:
        strh    r10, [r9, #2]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBVQ9:
        mov     r5, #0
        mov     r4, r5
        mov     r7, r4
        mov     r6, r7
        b       LBVQ1


