        .text
        .align  4
        .globl  _ippsFullbandControllerUpdate_EC_16s


_ippsFullbandControllerUpdate_EC_16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r8, r2
        beq     LDKL12
        cmp     r5, #0
        beq     LDKL12
        cmp     r8, #0
        beq     LDKL12
        cmp     r3, #0
        beq     LDKL12
        and     r12, r3, #0xF
        rsb     r12, r12, #0
        and     r12, r12, #0xF
        add     r9, r3, r12
        ldr     r7, [r9, #0x34]
        mov     r11, #0
        cmp     r7, #0
        movle   r4, r11
        ble     LDKL2
        mov     r4, r11
        sub     r10, r6, #2
        mvn     lr, #2, 2
        mvn     r12, #0
LDKL0:
        rsb     r3, r11, #0
        mov     r3, r3, lsl #1
        ldrsh   r0, [r10, +r3]
        mov     r3, r4, asr #31
        mul     r0, r0, r0
        add     r0, r0, #0x80
        mov     r0, r0, asr #8
        adds    r4, r0, r4
        adc     r3, r3, r0, asr #31
        subs    r1, r4, lr
        sbcs    r0, r3, #0
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        movne   r4, lr
        bne     LDKL1
        cmp     r4, #2, 2
        sbcs    r3, r3, r12
        movlt   r4, #2, 2
LDKL1:
        add     r11, r11, #1
        cmp     r11, r7
        blt     LDKL0
LDKL2:
        ldr     r3, [r9, #0x40]
        cmp     r4, r3
        ldrle   r0, [r9, #0x44]
        ble     LDKL3
        mov     r1, r4
        mov     r0, #1, 2
        bl      __intel_idiv
LDKL3:
        str     r0, [r8]
        ldr     r3, [r9, #0x30]
        mvn     r10, #2, 2
        cmp     r3, #1
        ble     LDKL7
        rsb     r7, r7, #0
        sub     r3, r6, #2
        add     r7, r6, r7, lsl #1
        mov     r0, #1
        str     r5, [sp]
        add     r6, r3, #2
        add     r7, r7, #2
        add     r8, r8, #4
        mvn     r11, #0
        mov     r5, r0
LDKL4:
        ldrsh   r2, [r7], #2
        ldrsh   r0, [r6], #2
        mul     r2, r2, r2
        mul     r3, r0, r0
        mov     r0, r4, asr #31
        add     r2, r2, #0x80
        add     r3, r3, #0x80
        mov     r2, r2, asr #8
        rsb     r3, r2, r3, asr #8
        adds    r4, r4, r3
        adc     r0, r0, r3, asr #31
        subs    r2, r4, r10
        sbcs    r3, r0, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        movne   r4, r10
        bne     LDKL5
        cmp     r4, #2, 2
        sbcs    r0, r0, r11
        movlt   r4, #2, 2
LDKL5:
        ldr     r2, [r9, #0x40]
        cmp     r4, r2
        ldrle   r0, [r9, #0x44]
        ble     LDKL6
        mov     r1, r4
        mov     r0, #1, 2
        bl      __intel_idiv
LDKL6:
        str     r0, [r8], #4
        ldr     r3, [r9, #0x30]
        add     r5, r5, #1
        cmp     r5, r3
        blt     LDKL4
        ldr     r5, [sp]
LDKL7:
        cmp     r3, #0
        mvn     r12, #0
        mov     r2, #0
        movle   r0, #0
        ble     LDKL10
        mov     r0, #0
        mov     lr, r0
LDKL8:
        ldrsh   r6, [r5], #2
        mov     r4, r0, asr #31
        mul     r6, r6, r6
        add     r6, r6, #8
        mov     r6, r6, asr #4
        adds    r0, r6, r0
        adc     r4, r4, r6, asr #31
        subs    r6, r0, r10
        sbcs    r7, r4, #0
        movlt   r6, #0
        movlt   r7, #0
        orrs    r7, r6, r7
        movne   r0, r10
        bne     LDKL9
        cmp     r0, #2, 2
        sbcs    r4, r4, r12
        movlt   r0, #2, 2
LDKL9:
        add     lr, lr, #1
        cmp     lr, r3
        blt     LDKL8
LDKL10:
        ldr     r6, [r9, #0x18]
        ldr     lr, [r9, #0xC]
        mov     r1, #1, 18
        subs    r1, r1, r6
        umull   r3, r5, r0, r1
        smull   r4, lr, lr, r6
        sbc     r6, r2, r6, asr #31
        mla     r5, r0, r6, r5
        mov     r0, r0, asr #31
        adds    r3, r4, r3
        mla     r5, r0, r1, r5
        adc     lr, lr, r5
        adds    r3, r3, #2, 20
        adc     r0, lr, #0
        mov     r1, r0, lsl #18
        orr     r1, r1, r3, lsr #14
        subs    r3, r1, r10
        rscs    r2, r2, r0, asr #14
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        movne   r1, r10
        bne     LDKL11
        cmp     r1, #2, 2
        rscs    r0, r12, r0, asr #14
        movlt   r1, #2, 2
LDKL11:
        mov     r0, #0
        str     r1, [r9, #0xC]
        ldmia   sp!, {r1, r4 - r11, pc}
LDKL12:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


