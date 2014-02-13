        .text
        .align  4
        .globl  _ippsSubC_32sc_ISfs


_ippsSubC_32sc_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r5, [sp, #0x44]
        str     r0, [sp, #0x18]
        mov     r0, r2
        cmp     r5, #0x20
        str     r1, [sp, #0x1C]
        bgt     LATH11
        cmp     r0, #0
        beq     LATH15
        cmp     r3, #0
        ble     LATH14
        cmn     r5, #0x1F
        mvn     lr, #2, 2
        mov     r12, #0
        bgt     LATH2
        cmp     r3, #0
        ble     LATH1
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        sub     r0, r0, #4
LATH0:
        ldr     r6, [r0, #4]
        ldr     r8, [r0, #8]
        subs    r2, r6, r5
        mov     r6, r6, asr #31
        sbc     r6, r6, r5, asr #31
        subs    r7, r8, r4
        mov     r8, r8, asr #31
        sbc     r8, r8, r4, asr #31
        orrs    r9, r2, r6, lsl #1
        tstcs   r9, #0
        movne   r2, lr
        movne   r6, r12
        orrs    r9, r7, r8, lsl #1
        tstcs   r9, #0
        movne   r7, lr
        movne   r8, r12
        tst     r6, r6
        movmi   r2, #2, 2
        tst     r8, r8
        str     r2, [r0, #4]
        movmi   r7, #2, 2
        str     r7, [r0, #8]!
        subs    r3, r3, #1
        bne     LATH0
LATH1:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATH2:
        cmp     r5, #0
        mvn     r4, #0
        bne     LATH6
        cmp     r3, #0
        ble     LATH10
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        sub     r2, r0, #4
LATH3:
        ldr     r8, [r2, #4]
        ldr     r0, [r2, #8]
        subs    r7, r8, r6
        mov     r8, r8, asr #31
        sbc     r9, r8, r6, asr #31
        subs    r8, r0, r5
        mov     r0, r0, asr #31
        sbc     r0, r0, r5, asr #31
        cmp     r6, #0
        blt     LATH13
        subs    r10, r7, #2, 2
        sbcs    r9, r9, r4
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        moveq   r7, #2, 2
LATH4:
        cmp     r5, #0
        str     r7, [r2, #4]
        blt     LATH12
        subs    r7, r8, #2, 2
        sbcs    r0, r0, r4
        movlt   r7, #0
        movlt   r0, #0
        orrs    r0, r7, r0
        moveq   r8, #2, 2
LATH5:
        add     r12, r12, #1
        str     r8, [r2, #8]!
        cmp     r12, r3
        blt     LATH3
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATH6:
        cmp     r5, #0
        ble     LATH8
        sub     r6, r5, #1
        mov     r4, #1
        mov     r6, r4, lsl r6
        cmp     r3, #0
        sub     r7, r6, #1
        ble     LATH10
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        sub     r6, r0, #4
        mov     r4, r5, asr #31
        str     r9, [sp, #0xC]
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
LATH7:
        ldr     r1, [r6, #4]
        ldr     r10, [r6, #8]
        ldr     lr, [sp, #0xC]
        subs    r11, r1, r8
        mov     r1, r1, asr #31
        mov     r12, r10, asr #31
        mov     r2, r5
        sbc     r9, r1, r8, asr #31
        subs    r10, r10, lr
        sbc     r12, r12, lr, asr #31
        str     r12, [sp, #0x10]
        mov     r0, r11
        mov     r1, r9
        mov     r3, r4
        bl      __ashrdi3
        adds    r11, r7, r11
        and     r0, r0, #1
        adc     r9, r9, r7, asr #31
        adds    r0, r11, r0
        adc     r1, r9, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        mov     r11, r1
        ldr     r1, [sp, #0x10]
        mov     r9, r0
        mov     r0, r10
        adds    r10, r7, r10
        adc     r12, r1, r7, asr #31
        str     r12, [sp, #0x14]
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x14]
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r12, #0
        mov     r3, r4
        mov     r2, r5
        bl      __ashrdi3
        ldr     r12, [sp, #4]
        cmp     r9, r12
        sbcs    r11, r11, #0
        ldrge   r9, [sp, #4]
        mvn     r12, #2, 2
        cmp     r0, r12
        sbcs    r1, r1, #0
        str     r9, [r6, #4]
        movge   r0, r12
        str     r0, [r6, #8]!
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        add     r0, r0, #1
        str     r0, [sp]
        cmp     r0, r1
        blt     LATH7
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATH8:
        cmp     r3, #0
        rsb     r5, r5, #0
        ble     LATH10
        ldr     r9, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        sub     r7, r0, #4
        mov     r6, r5, asr #31
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
LATH9:
        ldr     r1, [r7, #4]
        mov     r2, r5
        mov     r3, r6
        subs    r0, r1, r9
        mov     r1, r1, asr #31
        sbc     r1, r1, r9, asr #31
        bl      __ashldi3
        ldr     r12, [r7, #8]
        mov     r10, r0
        mov     r11, r1
        subs    r0, r12, r8
        mov     r12, r12, asr #31
        mov     r3, r6
        sbc     r1, r12, r8, asr #31
        mov     r2, r5
        bl      __ashldi3
        ldr     r12, [sp, #4]
        cmp     r10, r12
        sbcs    r12, r11, #0
        ldrge   r10, [sp, #4]
        movge   r11, #0
        mvn     r12, #2, 2
        cmp     r0, r12
        sbcs    r12, r1, #0
        mvnge   r0, #2, 2
        movge   r1, #0
        subs    r12, r10, #2, 2
        sbcs    r11, r11, r4
        movlt   r12, #0
        movlt   r11, #0
        orrs    r11, r12, r11
        moveq   r10, #2, 2
        subs    r12, r0, #2, 2
        sbcs    r1, r1, r4
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        str     r10, [r7, #4]
        moveq   r0, #2, 2
        str     r0, [r7, #8]!
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        add     r0, r0, #1
        str     r0, [sp]
        cmp     r0, r1
        blt     LATH9
LATH10:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATH11:
        mov     r1, r3
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32sc
LATH12:
        cmp     r8, lr
        sbcs    r0, r0, #0
        movge   r8, lr
        b       LATH5
LATH13:
        cmp     r7, lr
        sbcs    r9, r9, #0
        movge   r7, lr
        b       LATH4
LATH14:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATH15:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


