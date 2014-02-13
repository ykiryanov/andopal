        .text
        .align  4
        .globl  _ippsAdd_32s_ISfs


_ippsAdd_32s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r4, r3
        cmp     r4, #0x20
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
        ble     LDBZ0
        cmp     r7, #0
        beq     LDBZ12
        mov     r0, r6
        mov     r1, r5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LDBZ0:
        cmp     r7, #0
        beq     LDBZ12
        cmp     r6, #0
        beq     LDBZ12
        cmp     r5, #0
        ble     LDBZ13
        cmn     r4, #0x1F
        mvn     r0, #2, 2
        mov     r9, #0
        bgt     LDBZ3
        cmp     r5, #0
        ble     LDBZ2
LDBZ1:
        ldr     lr, [r6]
        ldr     r12, [r7], #4
        adds    r3, r12, lr
        mov     lr, lr, asr #31
        adc     r12, lr, r12, asr #31
        orrs    lr, r3, r12, lsl #1
        tstcs   lr, #0
        movne   r3, r0
        movne   r12, r9
        tst     r12, r12
        movmi   r3, #2, 2
        str     r3, [r6], #4
        subs    r5, r5, #1
        bne     LDBZ1
LDBZ2:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDBZ3:
        cmp     r4, #0
        mvn     r10, #0
        bne     LDBZ5
        cmp     r5, #0
        ble     LDBZ11
        mov     r3, r9
LDBZ4:
        ldr     r4, [r6]
        ldr     lr, [r7], #4
        adds    r12, lr, r4
        mov     r4, r4, asr #31
        adc     lr, r4, lr, asr #31
        cmp     r12, r0
        sbcs    r4, lr, #0
        movge   r12, r0
        movge   lr, r9
        subs    r4, r12, #2, 2
        sbcs    lr, lr, r10
        movlt   r4, #0
        movlt   lr, #0
        orrs    lr, r4, lr
        moveq   r12, #2, 2
        add     r3, r3, #1
        str     r12, [r6], #4
        cmp     r3, r5
        blt     LDBZ4
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDBZ5:
        cmp     r4, #0
        ble     LDBZ9
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r8, r0, r10
        adc     r11, r1, r10
        cmp     r5, #5
        movlt   r10, r4, asr #31
        blt     LDBZ7
        sub     r12, r5, #5
        add     r0, r6, #4
        add     r1, r7, #4
        str     r6, [sp, #0x10]
        str     r5, [sp, #8]
        mov     r10, r4, asr #31
        str     r7, [sp, #0xC]
        str     r12, [sp, #0x14]
        mov     r5, r0
        mov     r6, r1
LDBZ6:
        ldr     r0, [r5, #-4]
        ldr     r12, [r6, #-4]
        add     r9, r9, #4
        mov     r1, r0, asr #31
        mov     r2, r4
        mov     r3, r10
        adds    r0, r12, r0
        adc     r1, r1, r12, asr #31
        adds    r12, r8, r0
        str     r12, [sp, #0x18]
        adc     r7, r11, r1
        bl      __ashrdi3
        ldr     lr, [sp, #0x18]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r7, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        str     r0, [r5, #-4]
        ldr     r0, [r5]
        ldr     r12, [r6]
        mov     r2, r4
        mov     r1, r0, asr #31
        mov     r3, r10
        adds    r7, r12, r0
        adc     r1, r1, r12, asr #31
        str     r1, [sp, #0x18]
        mov     r0, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        adds    r7, r8, r7
        adc     r1, r11, r12
        and     r0, r0, #1
        adds    r0, r7, r0
        adc     r1, r1, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [r5, #4]
        str     r0, [r5]
        ldr     r1, [r6, #4]
        mov     r2, r4
        mov     r3, r10
        adds    r7, r1, r12
        mov     r12, r12, asr #31
        adc     r1, r12, r1, asr #31
        str     r1, [sp, #0x18]
        mov     r0, r7
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        adds    r7, r8, r7
        adc     r1, r11, r12
        and     r0, r0, #1
        adds    r0, r7, r0
        adc     r1, r1, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        str     r0, [r5, #4]
        ldr     r7, [r5, #8]
        ldr     lr, [r6, #8]
        add     r6, r6, #0x10
        mov     r12, r7, asr #31
        mov     r2, r4
        adds    r0, lr, r7
        adc     r1, r12, lr, asr #31
        adds    r7, r8, r0
        adc     r12, r11, r1
        str     r12, [sp, #0x18]
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [sp, #0x18]
        and     r0, r0, #1
        adds    r0, r7, r0
        adc     r1, r12, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        ldr     r12, [sp, #0x14]
        str     r0, [r5, #8]
        cmp     r9, r12
        add     r5, r5, #0x10
        ble     LDBZ6
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r5, [sp, #8]
LDBZ7:
        add     r7, r7, r9, lsl #2
        add     r6, r6, r9, lsl #2
        str     r11, [sp, #4]
        str     r5, [sp, #8]
LDBZ8:
        ldr     r0, [r6]
        ldr     r12, [r7], #4
        mov     r1, r0, asr #31
        add     r9, r9, #1
        adds    r0, r12, r0
        adc     r1, r1, r12, asr #31
        ldr     r12, [sp, #4]
        adds    r5, r8, r0
        adc     r11, r12, r1
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r5, r0
        adc     r1, r11, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        str     r0, [r6], #4
        ldr     r0, [sp, #8]
        cmp     r9, r0
        blt     LDBZ8
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDBZ9:
        cmp     r5, #0
        rsb     r4, r4, #0
        ble     LDBZ11
        mov     r11, r9
        str     r9, [sp]
        mov     r8, r4, asr #31
        mov     r9, r0
LDBZ10:
        ldr     lr, [r6]
        ldr     r12, [r7], #4
        mov     r3, r8
        mov     r2, r4
        adds    r0, r12, lr
        mov     lr, lr, asr #31
        adc     r1, lr, r12, asr #31
        bl      __ashldi3
        cmp     r0, r9
        sbcs    r12, r1, #0
        movge   r0, r9
        ldrge   r1, [sp]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, r10
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r11, r11, #1
        str     r0, [r6], #4
        cmp     r11, r5
        blt     LDBZ10
LDBZ11:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDBZ12:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDBZ13:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


