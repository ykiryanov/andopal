        .text
        .align  4
        .globl  _ippsSubC_32sc_Sfs


_ippsSubC_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r5, [sp, #0x50]
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x4C]
        mov     r4, r0
        cmp     r5, #0x20
        str     r2, [sp, #0x24]
        mov     r0, r3
        ble     LATG0
        cmp     r4, #0
        beq     LATG15
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32sc
LATG0:
        cmp     r4, #0
        beq     LATG15
        cmp     r0, #0
        beq     LATG15
        cmp     r1, #0
        ble     LATG14
        cmn     r5, #0x1F
        mvn     lr, #2, 2
        mov     r12, #0
        bgt     LATG3
        cmp     r1, #0
        ble     LATG2
        ldr     r5, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        sub     r0, r0, #4
LATG1:
        ldr     r3, [r4]
        ldr     r8, [r4, #4]
        subs    r7, r3, r5
        mov     r3, r3, asr #31
        sbc     r3, r3, r5, asr #31
        subs    r6, r8, r2
        mov     r8, r8, asr #31
        sbc     r8, r8, r2, asr #31
        orrs    r9, r7, r3, lsl #1
        tstcs   r9, #0
        movne   r7, lr
        movne   r3, r12
        orrs    r9, r6, r8, lsl #1
        tstcs   r9, #0
        movne   r6, lr
        movne   r8, r12
        tst     r3, r3
        movmi   r7, #2, 2
        tst     r8, r8
        str     r7, [r0, #4]
        movmi   r6, #2, 2
        str     r6, [r0, #8]!
        subs    r1, r1, #1
        add     r4, r4, #8
        bne     LATG1
LATG2:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LATG3:
        cmp     r5, #0
        mvn     r6, #0
        bne     LATG7
        cmp     r1, #0
        ble     LATG11
        ldr     lr, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        sub     r0, r0, #4
LATG4:
        ldr     r3, [r4]
        ldr     r5, [r4, #4]
        subs    r8, r3, lr
        mov     r3, r3, asr #31
        sbc     r3, r3, lr, asr #31
        subs    r7, r5, r2
        mov     r5, r5, asr #31
        sbc     r5, r5, r2, asr #31
        cmp     lr, #0
        blt     LATG13
        subs    r9, r8, #2, 2
        sbcs    r3, r3, r6
        movlt   r9, #0
        movlt   r3, #0
        orrs    r3, r9, r3
        moveq   r8, #2, 2
LATG5:
        cmp     r2, #0
        str     r8, [r0, #4]
        blt     LATG12
        subs    r3, r7, #2, 2
        sbcs    r5, r5, r6
        movlt   r3, #0
        movlt   r5, #0
        orrs    r5, r3, r5
        moveq   r7, #2, 2
LATG6:
        add     r12, r12, #1
        str     r7, [r0, #8]!
        cmp     r12, r1
        add     r4, r4, #8
        blt     LATG4
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LATG7:
        cmp     r5, #0
        ble     LATG9
        sub     r7, r5, #1
        mov     r6, #1
        mov     r7, r6, lsl r7
        cmp     r1, #0
        sub     r8, r7, #1
        ble     LATG11
        ldr     r10, [sp, #0x24]
        ldr     r9, [sp, #0x20]
        sub     r7, r0, #4
        mov     r6, r5, asr #31
        str     r10, [sp, #8]
        str     r12, [sp]
        str     lr, [sp, #0xC]
        str     r1, [sp, #4]
LATG8:
        ldr     r1, [r4]
        ldr     r12, [r4, #4]
        ldr     lr, [sp, #8]
        subs    r10, r1, r9
        mov     r1, r1, asr #31
        mov     r11, r12, asr #31
        mov     r2, r5
        sbc     r1, r1, r9, asr #31
        mov     r0, r10
        subs    r12, r12, lr
        str     r1, [sp, #0x10]
        str     r12, [sp, #0x14]
        mov     r3, r6
        sbc     r11, r11, lr, asr #31
        str     r11, [sp, #0x18]
        bl      __ashrdi3
        ldr     r1, [sp, #0x10]
        adds    r10, r8, r10
        and     r0, r0, #1
        adc     r1, r1, r8, asr #31
        adds    r0, r10, r0
        adc     r1, r1, #0
        mov     r2, r5
        mov     r3, r6
        bl      __ashrdi3
        mov     r10, r0
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r2, r5
        adds    r1, r8, r0
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        mov     r3, r6
        adc     r11, r1, r8, asr #31
        bl      __ashrdi3
        ldr     r12, [sp, #0x14]
        and     r1, r0, #1
        mov     r3, r6
        adds    r0, r12, r1
        adc     r1, r11, #0
        mov     r2, r5
        bl      __ashrdi3
        ldr     r12, [sp, #0xC]
        cmp     r10, r12
        ldr     r12, [sp, #0x10]
        sbcs    r12, r12, #0
        mvnge   r10, #2, 2
        mvn     r12, #2, 2
        cmp     r0, r12
        sbcs    r1, r1, #0
        str     r10, [r7, #4]
        movge   r0, r12
        str     r0, [r7, #8]!
        ldr     r1, [sp]
        ldr     r12, [sp, #4]
        add     r1, r1, #1
        str     r1, [sp]
        cmp     r1, r12
        add     r4, r4, #8
        blt     LATG8
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LATG9:
        cmp     r1, #0
        rsb     r5, r5, #0
        ble     LATG11
        ldr     r9, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        mov     r3, r5, asr #31
        sub     r7, r0, #4
        str     r3, [sp, #8]
        str     r12, [sp]
        str     lr, [sp, #0xC]
        str     r1, [sp, #4]
LATG10:
        ldr     r1, [r4]
        ldr     r3, [sp, #8]
        mov     r2, r5
        subs    r0, r1, r9
        mov     r1, r1, asr #31
        sbc     r1, r1, r9, asr #31
        bl      __ashldi3
        ldr     r12, [r4, #4]
        mov     r11, r0
        ldr     r3, [sp, #8]
        subs    r0, r12, r8
        mov     r12, r12, asr #31
        mov     r10, r1
        sbc     r1, r12, r8, asr #31
        mov     r2, r5
        bl      __ashldi3
        ldr     r3, [sp, #0xC]
        cmp     r11, r3
        sbcs    r3, r10, #0
        mvnge   r11, #2, 2
        movge   r10, #0
        mvn     r3, #2, 2
        cmp     r0, r3
        sbcs    r3, r1, #0
        mvnge   r0, #2, 2
        movge   r1, #0
        subs    r3, r11, #2, 2
        sbcs    r10, r10, r6
        movlt   r3, #0
        movlt   r10, #0
        orrs    r10, r3, r10
        moveq   r11, #2, 2
        subs    r3, r0, #2, 2
        sbcs    r1, r1, r6
        movlt   r3, #0
        movlt   r1, #0
        orrs    r1, r3, r1
        str     r11, [r7, #4]
        moveq   r0, #2, 2
        str     r0, [r7, #8]!
        ldr     r1, [sp]
        ldr     r3, [sp, #4]
        add     r1, r1, #1
        str     r1, [sp]
        cmp     r1, r3
        add     r4, r4, #8
        blt     LATG10
LATG11:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LATG12:
        mvn     r3, #2, 2
        cmp     r7, r3
        sbcs    r5, r5, #0
        movge   r7, r3
        b       LATG6
LATG13:
        mvn     r9, #2, 2
        cmp     r8, r9
        sbcs    r3, r3, #0
        movge   r8, r9
        b       LATG5
LATG14:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LATG15:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


