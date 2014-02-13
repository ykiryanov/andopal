        .text
        .align  4
        .globl  _ippsAddC_32s_Sfs


_ippsAddC_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r4, [sp, #0x4C]
        mov     r8, r0
        mov     r7, r1
        cmp     r4, #0
        mov     r6, r2
        mov     r5, r3
        bne     LDCM0
        cmp     r7, #0
        bne     LDCM1
        mov     r0, r8
        mov     r2, r5
        mov     r1, r6
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsCopy_32s
LDCM0:
        cmp     r4, #0x20
        ble     LDCM1
        cmp     r8, #0
        beq     LDCM15
        mov     r0, r6
        mov     r1, r5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LDCM1:
        cmp     r8, #0
        beq     LDCM15
        cmp     r6, #0
        beq     LDCM15
        cmp     r5, #0
        ble     LDCM14
        cmn     r4, #0x1F
        mvn     r0, #2, 2
        mov     r9, #0
        bgt     LDCM4
        cmp     r5, #0
        ble     LDCM3
LDCM2:
        ldr     lr, [r8], #4
        adds    r12, r7, lr
        mov     lr, lr, asr #31
        adc     lr, lr, r7, asr #31
        orrs    r4, r12, lr, lsl #1
        tstcs   r4, #0
        movne   r12, r0
        movne   lr, r9
        tst     lr, lr
        movmi   r12, #2, 2
        str     r12, [r6], #4
        subs    r5, r5, #1
        bne     LDCM2
LDCM3:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCM4:
        cmp     r4, #0
        mvn     r10, #0
        bne     LDCM6
        cmp     r7, #0
        ble     LDCM13
LDCM5:
        ldr     lr, [r8], #4
        adds    r12, r7, lr
        mov     lr, lr, asr #31
        adc     lr, lr, r7, asr #31
        cmp     r12, r0
        sbcs    lr, lr, #0
        movge   r12, r0
        add     r9, r9, #1
        str     r12, [r6], #4
        cmp     r9, r5
        blt     LDCM5
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCM6:
        cmp     r4, #0
        ble     LDCM10
        sub     r2, r4, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r0, r0, r10
        adc     r1, r1, r10
        cmp     r5, #5
        movlt   r11, r7, asr #31
        movlt   r10, r4, asr #31
        blt     LDCM8
        sub     r12, r5, #5
        add     r2, r8, #4
        add     r3, r6, #4
        str     r8, [sp, #8]
        str     r9, [sp]
        str     r5, [sp, #0xC]
        str     r6, [sp, #0x10]
        mov     r11, r7, asr #31
        mov     r10, r4, asr #31
        str     r12, [sp, #4]
        mov     r6, r0
        mov     r5, r1
        mov     r9, r2
        mov     r8, r3
LDCM7:
        ldr     r12, [sp]
        mov     r2, r4
        mov     r3, r10
        add     r12, r12, #4
        str     r12, [sp]
        ldr     r12, [r9, #-4]
        adds    r0, r7, r12
        adc     r1, r11, r12, asr #31
        adds    r12, r6, r0
        str     r12, [sp, #0x20]
        adc     r12, r5, r1
        str     r12, [sp, #0x24]
        bl      __ashrdi3
        ldr     lr, [sp, #0x20]
        and     r12, r0, #1
        adds    r0, lr, r12
        ldr     r12, [sp, #0x24]
        mov     r2, r4
        mov     r3, r10
        adc     r1, r12, #0
        bl      __ashrdi3
        str     r0, [r8, #-4]
        ldr     r12, [r9]
        mov     r2, r4
        mov     r3, r10
        adds    r0, r7, r12
        adc     r1, r11, r12, asr #31
        adds    r12, r6, r0
        str     r12, [sp, #0x24]
        adc     r12, r5, r1
        str     r12, [sp, #0x20]
        bl      __ashrdi3
        ldr     lr, [sp, #0x24]
        and     r12, r0, #1
        adds    r0, lr, r12
        ldr     r12, [sp, #0x20]
        mov     r2, r4
        mov     r3, r10
        adc     r1, r12, #0
        bl      __ashrdi3
        str     r0, [r8]
        ldr     r12, [r9, #4]
        mov     r2, r4
        mov     r3, r10
        adds    lr, r7, r12
        str     lr, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        adc     r1, r11, r12, asr #31
        str     r1, [sp, #0x20]
        bl      __ashrdi3
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x20]
        adds    r12, r6, r12
        and     r0, r0, #1
        adc     lr, r5, lr
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        str     r0, [r8, #4]
        ldr     r12, [r9, #8]
        mov     r2, r4
        mov     r3, r10
        adds    lr, r7, r12
        str     lr, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        adc     r1, r11, r12, asr #31
        str     r1, [sp, #0x20]
        bl      __ashrdi3
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x20]
        adds    r12, r6, r12
        and     r0, r0, #1
        adc     lr, r5, lr
        adds    r0, r12, r0
        adc     r1, lr, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        str     r0, [r8, #8]
        ldr     r12, [sp, #4]
        ldr     lr, [sp]
        add     r9, r9, #0x10
        add     r8, r8, #0x10
        cmp     lr, r12
        ble     LDCM7
        mov     r1, r5
        mov     r0, r6
        ldr     r8, [sp, #8]
        ldr     r9, [sp]
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #0x10]
LDCM8:
        add     r8, r8, r9, lsl #2
        add     r6, r6, r9, lsl #2
        str     r11, [sp, #0x14]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r5, [sp, #0xC]
LDCM9:
        ldr     r12, [r8], #4
        ldr     lr, [sp, #0x14]
        adds    r0, r7, r12
        add     r9, r9, #1
        adc     r1, lr, r12, asr #31
        ldr     r12, [sp, #0x18]
        mov     r2, r4
        adds    r11, r12, r0
        ldr     r12, [sp, #0x1C]
        mov     r3, r10
        adc     r5, r12, r1
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r1, r5, #0
        mov     r2, r4
        mov     r3, r10
        bl      __ashrdi3
        str     r0, [r6], #4
        ldr     r0, [sp, #0xC]
        cmp     r9, r0
        blt     LDCM9
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCM10:
        cmp     r5, #0
        rsb     r2, r4, #0
        ble     LDCM12
        mov     r11, r9
        str     r10, [sp, #0x1C]
        str     r9, [sp]
        mov     r4, r2, asr #31
        mov     r10, r0
        mov     r9, r2
LDCM11:
        ldr     r12, [r8], #4
        mov     r3, r4
        adds    r0, r7, r12
        mov     r12, r12, asr #31
        adc     r1, r12, r7, asr #31
        mov     r2, r9
        bl      __ashldi3
        cmp     r0, r10
        sbcs    r12, r1, #0
        movge   r0, r10
        ldrge   r1, [sp]
        ldr     lr, [sp, #0x1C]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, lr
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        add     r11, r11, #1
        str     r0, [r6], #4
        cmp     r11, r5
        blt     LDCM11
LDCM12:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCM13:
        ldr     lr, [r8], #4
        adds    r12, r7, lr
        mov     lr, lr, asr #31
        adc     r4, lr, r7, asr #31
        subs    lr, r12, #2, 2
        sbcs    r4, r4, r10
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        moveq   r12, #2, 2
        add     r9, r9, #1
        str     r12, [r6], #4
        cmp     r9, r5
        blt     LDCM13
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCM14:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCM15:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


