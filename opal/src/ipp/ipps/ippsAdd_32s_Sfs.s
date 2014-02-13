        .text
        .align  4
        .globl  _ippsAdd_32s_Sfs


_ippsAdd_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r5, [sp, #0x48]
        mov     r8, r0
        mov     r9, r1
        cmp     r5, #0x20
        mov     r7, r2
        mov     r6, r3
        ble     LDBY0
        cmp     r8, #0
        beq     LDBY12
        cmp     r9, #0
        beq     LDBY12
        mov     r0, r7
        mov     r1, r6
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LDBY0:
        cmp     r8, #0
        beq     LDBY12
        cmp     r9, #0
        beq     LDBY12
        cmp     r7, #0
        beq     LDBY12
        cmp     r6, #0
        ble     LDBY13
        cmn     r5, #0x1F
        mvn     r0, #2, 2
        mov     r11, #0
        bgt     LDBY3
        cmp     r6, #0
        ble     LDBY2
LDBY1:
        ldr     r12, [r9], #4
        ldr     r4, [r8], #4
        mov     lr, r12, asr #31
        adds    r12, r4, r12
        adc     r4, lr, r4, asr #31
        orrs    lr, r12, r4, lsl #1
        tstcs   lr, #0
        movne   r12, r0
        movne   r4, r11
        tst     r4, r4
        movmi   r12, #2, 2
        str     r12, [r7], #4
        subs    r6, r6, #1
        bne     LDBY1
LDBY2:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDBY3:
        cmp     r5, #0
        mvn     r4, #0
        bne     LDBY5
        cmp     r6, #0
        ble     LDBY11
        mov     lr, r11
LDBY4:
        ldr     r12, [r9], #4
        ldr     r10, [r8], #4
        mov     r5, r12, asr #31
        adds    r12, r10, r12
        adc     r5, r5, r10, asr #31
        cmp     r12, r0
        sbcs    r10, r5, #0
        movge   r12, r0
        movge   r5, r11
        subs    r10, r12, #2, 2
        sbcs    r5, r5, r4
        movlt   r10, #0
        movlt   r5, #0
        orrs    r5, r10, r5
        moveq   r12, #2, 2
        add     lr, lr, #1
        str     r12, [r7], #4
        cmp     lr, r6
        blt     LDBY4
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDBY5:
        cmp     r5, #0
        ble     LDBY9
        sub     r2, r5, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r0, r0, r4
        adc     r10, r1, r4
        cmp     r6, #5
        movlt   r4, r5, asr #31
        blt     LDBY7
        sub     r12, r6, #5
        add     r3, r8, #4
        add     r2, r9, #4
        add     r1, r7, #4
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x14]
        str     r6, [sp, #8]
        str     r7, [sp, #0x10]
        mov     r4, r5, asr #31
        str     r12, [sp, #0x1C]
        str     r11, [sp, #4]
        mov     r6, r0
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
LDBY6:
        ldr     r12, [sp, #4]
        mov     r2, r5
        mov     r3, r4
        add     r12, r12, #4
        str     r12, [sp, #4]
        ldr     r11, [r8, #-4]
        ldr     lr, [r9, #-4]
        mov     r12, r11, asr #31
        adds    r0, lr, r11
        adc     r1, r12, lr, asr #31
        adds    r12, r6, r0
        str     r12, [sp, #0x20]
        adc     r11, r10, r1
        bl      __ashrdi3
        ldr     lr, [sp, #0x20]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r11, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r7, #-4]
        ldr     r11, [r8]
        ldr     lr, [r9]
        mov     r2, r5
        mov     r12, r11, asr #31
        mov     r3, r4
        adds    r0, lr, r11
        adc     r1, r12, lr, asr #31
        adds    r12, r6, r0
        str     r12, [sp, #0x20]
        adc     r11, r10, r1
        bl      __ashrdi3
        ldr     lr, [sp, #0x20]
        and     r12, r0, #1
        adds    r0, lr, r12
        adc     r1, r11, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r7]
        ldr     r11, [r8, #4]
        ldr     lr, [r9, #4]
        mov     r2, r5
        mov     r12, r11, asr #31
        mov     r3, r4
        adds    r11, lr, r11
        adc     r1, r12, lr, asr #31
        str     r1, [sp, #0x20]
        mov     r0, r11
        bl      __ashrdi3
        ldr     r12, [sp, #0x20]
        adds    r11, r6, r11
        and     r0, r0, #1
        adc     r12, r10, r12
        adds    r0, r11, r0
        adc     r1, r12, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r7, #4]
        ldr     r11, [r8, #8]
        ldr     lr, [r9, #8]
        mov     r2, r5
        mov     r12, r11, asr #31
        mov     r3, r4
        adds    r11, lr, r11
        adc     r1, r12, lr, asr #31
        str     r1, [sp, #0x20]
        mov     r0, r11
        bl      __ashrdi3
        ldr     r12, [sp, #0x20]
        adds    r11, r6, r11
        and     r0, r0, #1
        adc     r12, r10, r12
        adds    r0, r11, r0
        adc     r1, r12, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r7, #8]
        ldr     lr, [sp, #0x1C]
        ldr     r12, [sp, #4]
        add     r9, r9, #0x10
        add     r8, r8, #0x10
        add     r7, r7, #0x10
        cmp     r12, lr
        ble     LDBY6
        mov     r0, r6
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r11, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0x10]
LDBY7:
        add     r8, r8, r11, lsl #2
        add     r9, r9, r11, lsl #2
        add     r7, r7, r11, lsl #2
        str     r10, [sp]
        str     r0, [sp, #0xC]
        str     r6, [sp, #8]
LDBY8:
        ldr     r0, [r9], #4
        ldr     r12, [r8], #4
        mov     r1, r0, asr #31
        adds    r0, r12, r0
        adc     r1, r1, r12, asr #31
        ldr     r12, [sp, #0xC]
        add     r11, r11, #1
        adds    r10, r12, r0
        ldr     r12, [sp]
        mov     r2, r5
        mov     r3, r4
        adc     r6, r12, r1
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r6, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        str     r0, [r7], #4
        ldr     r0, [sp, #8]
        cmp     r11, r0
        blt     LDBY8
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDBY9:
        cmp     r6, #0
        rsb     r5, r5, #0
        ble     LDBY11
        mov     r10, r11
        mov     r12, r5, asr #31
        str     r11, [sp, #4]
        str     r12, [sp]
        mov     r11, r0
LDBY10:
        ldr     lr, [r9], #4
        ldr     r12, [r8], #4
        ldr     r3, [sp]
        adds    r0, r12, lr
        mov     lr, lr, asr #31
        adc     r1, lr, r12, asr #31
        mov     r2, r5
        bl      __ashldi3
        cmp     r0, r11
        sbcs    r12, r1, #0
        movge   r0, r11
        ldrge   r1, [sp, #4]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, r4
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r10, r10, #1
        str     r0, [r7], #4
        cmp     r10, r6
        blt     LDBY10
LDBY11:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDBY12:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LDBY13:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


