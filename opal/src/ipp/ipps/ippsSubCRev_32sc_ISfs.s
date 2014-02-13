        .text
        .align  4
        .globl  _ippsSubCRev_32sc_ISfs


_ippsSubCRev_32sc_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r5, [sp, #0x44]
        str     r0, [sp, #0x18]
        mov     r0, r2
        cmp     r5, #0x20
        str     r1, [sp, #0x1C]
        bgt     LATS13
        cmp     r0, #0
        beq     LATS17
        cmp     r3, #0
        ble     LATS16
        cmp     r5, #0
        mvn     lr, #2, 2
        mvn     r4, #0
        mov     r12, #0
        bne     LATS0
        ldr     r5, [sp, #0x18]
        cmp     r5, #0
        bne     LATS4
        ldr     r5, [sp, #0x1C]
        cmp     r5, #0
        bne     LATS4
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATS0:
        cmn     r5, #0x1F
        bgt     LATS3
        cmp     r3, #0
        ble     LATS2
        ldr     r5, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        sub     r0, r0, #4
LATS1:
        ldr     r6, [r0, #4]
        ldr     r8, [r0, #8]
        subs    r2, r5, r6
        mov     r6, r6, asr #31
        rsc     r6, r6, r5, asr #31
        subs    r7, r4, r8
        mov     r8, r8, asr #31
        rsc     r8, r8, r4, asr #31
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
        bne     LATS1
LATS2:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATS3:
        cmp     r5, #0
        bne     LATS8
LATS4:
        cmp     r3, #0
        ble     LATS12
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        sub     r2, r0, #4
LATS5:
        ldr     r7, [r2, #4]
        ldr     r0, [r2, #8]
        subs    r8, r6, r7
        mov     r7, r7, asr #31
        rsc     r9, r7, r6, asr #31
        subs    r7, r5, r0
        mov     r0, r0, asr #31
        rsc     r0, r0, r5, asr #31
        cmp     r6, #0
        ble     LATS15
        cmp     r8, lr
        sbcs    r9, r9, #0
        movge   r8, lr
LATS6:
        cmp     r5, #0
        str     r8, [r2, #4]
        ble     LATS14
        cmp     r7, lr
        sbcs    r0, r0, #0
        movge   r7, lr
LATS7:
        add     r12, r12, #1
        str     r7, [r2, #8]!
        cmp     r12, r3
        blt     LATS5
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATS8:
        cmp     r5, #0
        ble     LATS10
        sub     r4, r5, #1
        mov     r6, #1
        mov     r4, r6, lsl r4
        cmp     r3, #0
        sub     r7, r4, #1
        ble     LATS12
        ldr     r9, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        sub     r6, r0, #4
        mov     r4, r5, asr #31
        str     r9, [sp, #0xC]
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
LATS9:
        ldr     r1, [r6, #4]
        ldr     r10, [r6, #8]
        ldr     lr, [sp, #0xC]
        subs    r11, r8, r1
        mov     r1, r1, asr #31
        mov     r12, r10, asr #31
        rsc     r9, r1, r8, asr #31
        subs    r10, lr, r10
        rsc     lr, r12, lr, asr #31
        str     lr, [sp, #0x10]
        mov     r0, r11
        mov     r1, r9
        mov     r2, r5
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
        blt     LATS9
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATS10:
        cmp     r3, #0
        rsb     r5, r5, #0
        ble     LATS12
        ldr     r9, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        sub     r7, r0, #4
        mov     r6, r5, asr #31
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
LATS11:
        ldr     r1, [r7, #4]
        mov     r2, r5
        mov     r3, r6
        subs    r0, r9, r1
        mov     r1, r1, asr #31
        rsc     r1, r1, r9, asr #31
        bl      __ashldi3
        ldr     r12, [r7, #8]
        mov     r10, r0
        mov     r11, r1
        subs    r0, r8, r12
        mov     r12, r12, asr #31
        rsc     r1, r12, r8, asr #31
        mov     r3, r6
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
        blt     LATS11
LATS12:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATS13:
        mov     r1, r3
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32sc
LATS14:
        subs    r8, r7, #2, 2
        sbcs    r0, r0, r4
        movlt   r8, #0
        movlt   r0, #0
        orrs    r0, r8, r0
        moveq   r7, #2, 2
        b       LATS7
LATS15:
        subs    r10, r8, #2, 2
        sbcs    r9, r9, r4
        movlt   r10, #0
        movlt   r9, #0
        orrs    r9, r10, r9
        moveq   r8, #2, 2
        b       LATS6
LATS16:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LATS17:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


