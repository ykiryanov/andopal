        .text
        .align  4
        .globl  _ippsMulPowerC_NR_16s_Sfs


_ippsMulPowerC_NR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        cmp     r0, #0
        beq     LDRL15
        cmp     r2, #0
        beq     LDRL15
        cmp     r12, #0
        blt     LDRL14
        cmp     r3, #0
        ble     LDRL16
        ldrsh   lr, [r0]
        cmp     r12, #0xF
        mov     r4, #1
        strh    lr, [r2]
        sub     lr, r3, #1
        beq     LDRL9
        cmp     lr, #1
        ble     LDRL5
        mov     r8, r4
        mov     r7, r1
        mvn     r6, #2, 2
        mvn     r5, #0
        str     r3, [sp, #4]
LDRL0:
        mov     r3, r8, lsl #1
        ldrsh   r9, [r0, +r3]
        cmp     r12, #0
        mul     r10, r1, r9
        movle   r10, r10, lsl #16
        movle   r9, r10, asr #16
        ble     LDRL2
        sub     r9, r12, #1
        mov     r11, r4, lsl r9
        adds    r9, r10, r11
        mov     r11, r11, asr #31
        adc     r11, r11, r10, asr #31
        subs    r10, r9, r6
        str     r11, [sp]
        sbcs    r11, r11, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r9, #2, 2
        bne     LDRL1
        ldr     r10, [sp]
        cmp     r9, #2, 2
        sbcs    r10, r10, r5
        movlt   r9, #2, 2
LDRL1:
        mov     r9, r9, asr r12
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDRL2:
        mul     r1, r7, r1
        cmp     r12, #0
        strh    r9, [r2, +r3]
        ble     LDRL4
        sub     r3, r12, #1
        mov     r9, r4, lsl r3
        adds    r3, r1, r9
        mov     r9, r9, asr #31
        adc     r1, r9, r1, asr #31
        subs    r10, r3, r6
        sbcs    r9, r1, #0
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        mvnne   r3, #2, 2
        bne     LDRL3
        cmp     r3, #2, 2
        sbcs    r1, r1, r5
        movlt   r3, #2, 2
LDRL3:
        mov     r3, r3, asr r12
        add     r8, r8, #1
        mov     r1, r3, lsl #16
        cmp     r8, lr
        mov     r1, r1, asr #16
        blt     LDRL0
        b       LDRL8
LDRL4:
        add     r8, r8, #1
        mov     r1, r1, lsl #16
        cmp     r8, lr
        mov     r1, r1, asr #16
        blt     LDRL0
        ldr     r3, [sp, #4]
LDRL5:
        sub     r0, r0, #2
        mov     r3, r3, lsl #1
        ldrsh   r0, [r0, +r3]
        cmp     r12, #0
        mul     r1, r0, r1
        movle   r1, r1, lsl #16
        movle   r0, r1, asr #16
        ble     LDRL7
        sub     lr, r12, #1
        mov     r0, #1
        mov     lr, r0, lsl lr
        adds    r0, r1, lr
        mov     lr, lr, asr #31
        adc     r1, lr, r1, asr #31
        mvn     lr, #2, 2
        subs    r4, r0, lr
        sbcs    r5, r1, #0
        movlt   r4, #0
        movlt   r5, #0
        orrs    r5, r4, r5
        movne   r0, lr
        bne     LDRL6
        cmp     r0, #2, 2
        mvn     lr, #0
        sbcs    r1, r1, lr
        movlt   r0, #2, 2
LDRL6:
        mov     r12, r0, asr r12
        mov     r0, r12, lsl #16
        mov     r0, r0, asr #16
LDRL7:
        sub     r2, r2, #2
        strh    r0, [r2, +r3]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRL8:
        ldr     r3, [sp, #4]
        b       LDRL5
LDRL9:
        cmp     lr, #1
        ble     LDRL13
        sub     r12, r3, #1
        sub     r12, r12, #1
        cmp     r12, #5
        movlt   r12, r1
        blt     LDRL11
        mov     r12, r1
        sub     r7, r3, #6
        add     r6, r0, #2
        add     r5, r2, #2
LDRL10:
        ldrsh   r9, [r6]
        mul     r8, r12, r1
        add     r4, r4, #4
        mul     r9, r1, r9
        cmp     r4, r7
        add     r1, r8, #1, 18
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r5]
        ldrsh   r8, [r6, #2]
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mul     r8, r1, r8
        mul     r1, r12, r1
        add     r8, r8, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [r5, #2]
        add     r8, r1, #1, 18
        ldrsh   r1, [r6, #4]
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mul     r9, r8, r1
        mul     r1, r12, r8
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r5, #4]
        add     r8, r1, #1, 18
        ldrsh   r1, [r6, #6]
        mov     r8, r8, asr #15
        add     r6, r6, #8
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        mul     r9, r8, r1
        mul     r1, r12, r8
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r5, #6]
        add     r5, r5, #8
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        ble     LDRL10
LDRL11:
        add     r6, r0, r4, lsl #1
        add     r5, r2, r4, lsl #1
LDRL12:
        ldrsh   r8, [r6], #2
        mul     r7, r12, r1
        mul     r8, r1, r8
        add     r4, r4, #1
        cmp     r4, lr
        add     r1, r7, #1, 18
        add     r8, r8, #1, 18
        mov     r1, r1, asr #15
        mov     r7, r8, asr #15
        strh    r7, [r5], #2
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        blt     LDRL12
LDRL13:
        sub     r0, r0, #2
        mov     r3, r3, lsl #1
        ldrsh   r0, [r0, +r3]
        sub     r2, r2, #2
        mul     r1, r0, r1
        add     r0, r1, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r2, +r3]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRL14:
        mvn     r0, #0xC
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRL15:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRL16:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


