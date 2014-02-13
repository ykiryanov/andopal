        .text
        .align  4
        .globl  _ippsSubC_32s_ISfs


_ippsSubC_32s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r6, r3
        cmp     r6, #0x20
        mov     r4, r0
        mov     r5, r1
        bgt     LATJ11
        cmp     r5, #0
        beq     LATJ14
        cmp     r2, #0
        ble     LATJ13
        cmp     r6, #0
        mvn     r9, #2, 2
        mvn     r10, #0
        mov     r8, #0
        bne     LATJ0
        cmp     r4, #0
        bne     LATJ4
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ0:
        cmn     r6, #0x1F
        bgt     LATJ3
        cmp     r2, #0
        ble     LATJ2
LATJ1:
        ldr     r12, [r5]
        subs    r3, r12, r4
        mov     r12, r12, asr #31
        sbc     r12, r12, r4, asr #31
        orrs    lr, r3, r12, lsl #1
        tstcs   lr, #0
        movne   r3, r9
        movne   r12, r8
        tst     r12, r12
        movmi   r3, #2, 2
        str     r3, [r5], #4
        subs    r2, r2, #1
        bne     LATJ1
LATJ2:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ3:
        cmp     r6, #0
        bne     LATJ6
LATJ4:
        cmp     r4, #0
        blt     LATJ12
LATJ5:
        ldr     r12, [r5]
        subs    r3, r12, r4
        mov     r12, r12, asr #31
        sbc     lr, r12, r4, asr #31
        subs    r12, r3, #2, 2
        sbcs    lr, lr, r10
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        moveq   r3, #2, 2
        add     r8, r8, #1
        str     r3, [r5], #4
        cmp     r8, r2
        blt     LATJ5
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ6:
        cmp     r6, #0
        ble     LATJ8
        sub     lr, r6, #1
        mov     r12, #1
        mov     lr, r12, lsl lr
        cmp     r2, #0
        sub     r12, lr, #1
        ble     LATJ10
        mov     r7, r6, asr #31
        str     r12, [sp, #8]
        str     r2, [sp, #4]
LATJ7:
        ldr     r12, [r5]
        mov     r2, r6
        mov     r3, r7
        subs    r0, r12, r4
        mov     r12, r12, asr #31
        sbc     r1, r12, r4, asr #31
        ldr     r12, [sp, #8]
        adds    r10, r12, r0
        adc     r11, r1, r12, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r11, #0
        mov     r3, r7
        mov     r2, r6
        bl      __ashrdi3
        cmp     r0, r9
        sbcs    r1, r1, #0
        movge   r0, r9
        str     r0, [r5], #4
        ldr     r12, [sp, #4]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LATJ7
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ8:
        cmp     r2, #0
        rsb     r6, r6, #0
        ble     LATJ10
        mov     r11, r8
        str     r8, [sp]
        mov     r8, r4
        mov     r7, r6, asr #31
        mov     r4, r2
LATJ9:
        ldr     r12, [r5]
        mov     r3, r7
        mov     r2, r6
        subs    r0, r12, r8
        mov     r12, r12, asr #31
        sbc     r1, r12, r8, asr #31
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
        str     r0, [r5], #4
        cmp     r11, r4
        blt     LATJ9
LATJ10:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ11:
        mov     r0, r5
        mov     r1, r2
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LATJ12:
        ldr     r12, [r5]
        subs    r3, r12, r4
        mov     r12, r12, asr #31
        sbc     r12, r12, r4, asr #31
        cmp     r3, r9
        sbcs    r12, r12, #0
        movge   r3, r9
        add     r8, r8, #1
        str     r3, [r5], #4
        cmp     r8, r2
        blt     LATJ12
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ13:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LATJ14:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


