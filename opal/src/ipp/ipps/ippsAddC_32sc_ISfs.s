        .text
        .align  4
        .globl  _ippsAddC_32sc_ISfs


_ippsAddC_32sc_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r4, [sp, #0x44]
        str     r0, [sp, #0x18]
        mov     r5, r2
        cmp     r4, #0x20
        str     r1, [sp, #0x1C]
        mov     r6, r3
        bgt     LDCL13
        cmp     r5, #0
        beq     LDCL17
        cmp     r6, #0
        ble     LDCL16
        cmp     r4, #0
        mvn     r12, #2, 2
        mvn     r10, #0
        mov     r9, #0
        bne     LDCL0
        ldr     lr, [sp, #0x18]
        cmp     lr, #0
        bne     LDCL4
        ldr     lr, [sp, #0x1C]
        cmp     lr, #0
        bne     LDCL4
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDCL0:
        cmn     r4, #0x1F
        bgt     LDCL3
        cmp     r6, #0
        ble     LDCL2
        ldr     r4, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        sub     r5, r5, #4
LDCL1:
        ldr     r2, [r5, #4]
        ldr     r8, [r5, #8]
        adds    r0, r4, r2
        mov     r2, r2, asr #31
        adc     r2, r2, r4, asr #31
        adds    r7, lr, r8
        mov     r8, r8, asr #31
        adc     r8, r8, lr, asr #31
        orrs    r10, r0, r2, lsl #1
        tstcs   r10, #0
        movne   r0, r12
        movne   r2, r9
        orrs    r10, r7, r8, lsl #1
        tstcs   r10, #0
        movne   r7, r12
        movne   r8, r9
        tst     r2, r2
        movmi   r0, #2, 2
        tst     r8, r8
        str     r0, [r5, #4]
        movmi   r7, #2, 2
        str     r7, [r5, #8]!
        subs    r6, r6, #1
        bne     LDCL1
LDCL2:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDCL3:
        cmp     r4, #0
        bne     LDCL8
LDCL4:
        cmp     r6, #0
        ble     LDCL12
        ldr     r4, [sp, #0x18]
        ldr     lr, [sp, #0x1C]
        sub     r5, r5, #4
LDCL5:
        ldr     r2, [r5, #4]
        ldr     r0, [r5, #8]
        adds    r7, r4, r2
        mov     r2, r2, asr #31
        adc     r8, r2, r4, asr #31
        adds    r2, lr, r0
        mov     r0, r0, asr #31
        adc     r0, r0, lr, asr #31
        cmp     r4, #0
        ble     LDCL15
        cmp     r7, r12
        sbcs    r8, r8, #0
        movge   r7, r12
LDCL6:
        cmp     lr, #0
        str     r7, [r5, #4]
        ble     LDCL14
        cmp     r2, r12
        sbcs    r0, r0, #0
        movge   r2, r12
LDCL7:
        add     r9, r9, #1
        str     r2, [r5, #8]!
        cmp     r9, r6
        blt     LDCL5
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDCL8:
        cmp     r4, #0
        ble     LDCL10
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r12, r0, r10
        adc     r10, r1, r10
        cmp     r6, #0
        ble     LDCL12
        ldr     lr, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        sub     r7, r5, #4
        mov     r5, r4, asr #31
        str     lr, [sp, #4]
        str     r8, [sp, #8]
        str     r12, [sp]
        str     r6, [sp, #0xC]
LDCL9:
        ldr     r1, [r7, #4]
        ldr     r0, [sp, #4]
        ldr     lr, [sp, #4]
        ldr     r12, [r7, #8]
        mov     r2, r4
        adds    r6, r0, r1
        mov     r1, r1, asr #31
        adc     r1, r1, lr, asr #31
        ldr     lr, [sp, #8]
        str     r1, [sp, #0x14]
        mov     r0, r6
        mov     r3, r5
        mov     r11, r12, asr #31
        adds    r8, lr, r12
        adc     r11, r11, lr, asr #31
        bl      __ashrdi3
        ldr     r12, [sp]
        add     r9, r9, #1
        adds    r6, r12, r6
        ldr     r12, [sp, #0x14]
        and     r0, r0, #1
        mov     r2, r4
        mov     r3, r5
        adc     r12, r10, r12
        adds    r0, r6, r0
        adc     r1, r12, #0
        ldr     r12, [sp]
        adds    r6, r12, r8
        adc     r12, r10, r11
        str     r12, [sp, #0x14]
        bl      __ashrdi3
        str     r0, [r7, #4]
        mov     r0, r8
        mov     r1, r11
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r1, [sp, #0x14]
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r1, #0
        mov     r3, r5
        mov     r2, r4
        bl      __ashrdi3
        str     r0, [r7, #8]!
        ldr     r0, [sp, #0xC]
        cmp     r9, r0
        blt     LDCL9
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDCL10:
        cmp     r6, #0
        rsb     r4, r4, #0
        ble     LDCL12
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        sub     r11, r5, #4
        mov     r5, r4, asr #31
        str     r9, [sp, #0x10]
        str     r12, [sp, #8]
        str     r6, [sp, #0xC]
LDCL11:
        ldr     r1, [r11, #4]
        mov     r2, r4
        mov     r3, r5
        adds    r0, r8, r1
        mov     r1, r1, asr #31
        adc     r1, r1, r8, asr #31
        bl      __ashldi3
        ldr     r12, [r11, #8]
        mov     r6, r0
        mov     r9, r1
        adds    r0, r7, r12
        mov     r12, r12, asr #31
        adc     r1, r12, r7, asr #31
        mov     r3, r5
        mov     r2, r4
        bl      __ashldi3
        ldr     r12, [sp, #8]
        cmp     r6, r12
        sbcs    r12, r9, #0
        ldrge   r6, [sp, #8]
        movge   r9, #0
        mvn     r12, #2, 2
        cmp     r0, r12
        sbcs    r12, r1, #0
        mvnge   r0, #2, 2
        movge   r1, #0
        subs    r12, r6, #2, 2
        sbcs    r9, r9, r10
        movlt   r12, #0
        movlt   r9, #0
        orrs    r9, r12, r9
        moveq   r6, #2, 2
        subs    r12, r0, #2, 2
        sbcs    r1, r1, r10
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        str     r6, [r11, #4]
        moveq   r0, #2, 2
        str     r0, [r11, #8]!
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0xC]
        add     r0, r0, #1
        str     r0, [sp, #0x10]
        cmp     r0, r1
        blt     LDCL11
LDCL12:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDCL13:
        mov     r0, r5
        mov     r1, r6
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32sc
LDCL14:
        subs    r7, r2, #2, 2
        sbcs    r0, r0, r10
        movlt   r7, #0
        movlt   r0, #0
        orrs    r0, r7, r0
        moveq   r2, #2, 2
        b       LDCL7
LDCL15:
        subs    r11, r7, #2, 2
        sbcs    r8, r8, r10
        movlt   r11, #0
        movlt   r8, #0
        orrs    r8, r11, r8
        moveq   r7, #2, 2
        b       LDCL6
LDCL16:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDCL17:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


