        .text
        .align  4
        .globl  ownsFIROne64s_16s_Sfs


ownsFIROne64s_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r4, r2
        ldr     r5, [r4, #0x2C]
        ldr     r12, [r4, #4]
        ldr     r8, [r4, #8]
        ldr     lr, [r4, #0x28]
        ldr     r9, [r4]
        mov     r5, r5, lsl #1
        add     r7, r12, r8, lsl #1
        strh    r0, [r7, +r5]
        ldr     r5, [r4, #0x2C]
        mov     r6, r1
        mov     r5, r5, lsl #1
        strh    r0, [r12, +r5]
        ldr     r0, [r4, #0x2C]
        sub     r2, lr, r3
        mov     r7, #0
        add     r0, r0, #1
        cmp     r0, r8
        strlt   r0, [r4, #0x2C]
        movge   r0, r7
        strge   r0, [r4, #0x2C]
        cmp     r8, #0
        add     r10, r12, r0, lsl #1
        movle   r4, r7
        movle   r5, r4
        ble     LBVR3
        cmp     r8, #6
        movlt   r4, r7
        movlt   r5, r4
        blt     LBVR1
        mov     r4, r7
        mov     r5, r4
        sub     lr, r8, #6
        mov     r12, r10
        mov     r3, r9
        str     r10, [sp, #0xC]
        str     r9, [sp, #8]
        str     r8, [sp, #4]
        str     r6, [sp]
LBVR0:
        ldrsh   r6, [r12]
        ldrsh   r8, [r3]
        ldrsh   r11, [r3, #2]
        ldrsh   r9, [r12, #4]
        ldrsh   r10, [r3, #4]
        mul     r6, r8, r6
        ldrsh   r8, [r12, #2]
        mul     r9, r10, r9
        ldrsh   r10, [r3, #6]
        mul     r8, r11, r8
        ldrsh   r11, [r12, #6]
        adds    r4, r4, r6
        ldrsh   r0, [r12, #8]
        ldrsh   r1, [r3, #8]
        mul     r11, r10, r11
        adc     r6, r5, r6, asr #31
        mul     r0, r1, r0
        adds    r4, r4, r8
        adc     r8, r6, r8, asr #31
        adds    r4, r4, r9
        adc     r9, r8, r9, asr #31
        adds    r4, r4, r11
        adc     r11, r9, r11, asr #31
        adds    r4, r4, r0
        add     r7, r7, #5
        adc     r5, r11, r0, asr #31
        cmp     r7, lr
        add     r12, r12, #0xA
        add     r3, r3, #0xA
        ble     LBVR0
        ldr     r10, [sp, #0xC]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r6, [sp]
LBVR1:
        add     r3, r10, r7, lsl #1
        add     r9, r9, r7, lsl #1
LBVR2:
        ldrsh   lr, [r3], #2
        ldrsh   r12, [r9], #2
        add     r7, r7, #1
        mul     lr, r12, lr
        adds    r4, r4, lr
        adc     r5, r5, lr, asr #31
        cmp     r7, r8
        blt     LBVR2
LBVR3:
        cmp     r2, #0
        beq     LBVR5
        cmp     r2, #0x1F
        mov     r3, #0x1F
        movgt   r2, r3
        cmn     r2, #0x1F
        mvn     r3, #0x1E
        movlt   r2, r3
        cmp     r2, #0
        ble     LBVR4
        mov     r0, r4
        mov     r1, r5
        mov     r3, #0
        bl      __ashldi3
        mov     r4, r0
        mov     r5, r1
        b       LBVR5
LBVR4:
        rsb     r7, r2, #0
        sub     r12, r7, #1
        mov     lr, #1
        mov     r8, r7, asr #31
        mov     r9, lr, lsl r12
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        mov     r3, r8
        bl      __ashrdi3
        sub     r9, r9, #1
        adds    r4, r4, r9
        and     r0, r0, #1
        adc     r9, r5, r9, asr #31
        adds    r0, r4, r0
        adc     r1, r9, #0
        mov     r2, r7
        mov     r3, r8
        bl      __ashrdi3
        mov     r4, r0
        mov     r5, r1
LBVR5:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r3, r2
        subs    r3, r4, r3
        sbcs    r12, r5, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r3, r3, r12
        mov     r12, #0
        subne   r12, r12, #2, 18
        mvnne   r2, r12
        bne     LBVR6
        sub     r12, r12, #2, 18
        cmp     r4, r12
        mvn     r3, #0
        sbcs    r5, r5, r3
        movge   r4, r4, lsl #16
        movge   r2, r4, asr #16
LBVR6:
        strh    r2, [r6]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


