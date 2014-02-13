        .text
        .align  4
        .globl  _ippsAddC_32sc_Sfs


_ippsAddC_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r9, [sp, #0x50]
        ldr     r6, [sp, #0x4C]
        str     r1, [sp, #0x20]
        cmp     r9, #0x20
        str     r2, [sp, #0x24]
        mov     r5, r0
        mov     r4, r3
        ble     LDCK0
        cmp     r5, #0
        beq     LDCK15
        mov     r0, r4
        mov     r1, r6
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32sc
LDCK0:
        cmp     r5, #0
        beq     LDCK15
        cmp     r4, #0
        beq     LDCK15
        cmp     r6, #0
        ble     LDCK14
        cmn     r9, #0x1F
        mvn     r12, #2, 2
        mov     r8, #0
        bgt     LDCK3
        cmp     r6, #0
        ble     LDCK2
        ldr     lr, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        sub     r4, r4, #4
LDCK1:
        ldr     r3, [r5]
        ldr     r10, [r5, #4]
        adds    r9, lr, r3
        mov     r3, r3, asr #31
        adc     r3, r3, lr, asr #31
        adds    r7, r2, r10
        mov     r10, r10, asr #31
        adc     r10, r10, r2, asr #31
        orrs    r11, r9, r3, lsl #1
        tstcs   r11, #0
        movne   r9, r12
        movne   r3, r8
        orrs    r11, r7, r10, lsl #1
        tstcs   r11, #0
        movne   r7, r12
        movne   r10, r8
        tst     r3, r3
        movmi   r9, #2, 2
        tst     r10, r10
        str     r9, [r4, #4]
        movmi   r7, #2, 2
        str     r7, [r4, #8]!
        subs    r6, r6, #1
        add     r5, r5, #8
        bne     LDCK1
LDCK2:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCK3:
        cmp     r9, #0
        mvn     r7, #0
        bne     LDCK7
        cmp     r6, #0
        ble     LDCK11
        ldr     r12, [sp, #0x20]
        ldr     r2, [sp, #0x24]
        sub     r4, r4, #4
LDCK4:
        ldr     r3, [r5]
        ldr     lr, [r5, #4]
        adds    r10, r12, r3
        mov     r3, r3, asr #31
        adc     r3, r3, r12, asr #31
        adds    r9, r2, lr
        mov     lr, lr, asr #31
        adc     lr, lr, r2, asr #31
        cmp     r12, #0
        ble     LDCK13
        mvn     r11, #2, 2
        cmp     r10, r11
        sbcs    r3, r3, #0
        movge   r10, r11
LDCK5:
        cmp     r2, #0
        str     r10, [r4, #4]
        ble     LDCK12
        mvn     r3, #2, 2
        cmp     r9, r3
        sbcs    lr, lr, #0
        movge   r9, r3
LDCK6:
        add     r8, r8, #1
        str     r9, [r4, #8]!
        cmp     r8, r6
        add     r5, r5, #8
        blt     LDCK4
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCK7:
        cmp     r9, #0
        ble     LDCK9
        sub     r2, r9, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r12, r0, r7
        adc     r7, r1, r7
        cmp     r6, #0
        ble     LDCK11
        ldr     lr, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        sub     r0, r5, #4
        sub     r4, r4, #4
        mov     r5, r9, asr #31
        str     r0, [sp, #8]
        str     r10, [sp, #0xC]
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r6, [sp, #0x10]
LDCK8:
        ldr     r0, [sp, #8]
        ldr     lr, [sp, #4]
        mov     r2, r9
        ldr     r1, [r0, #4]
        ldr     r12, [r0, #8]!
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        mov     r3, r5
        add     r8, r8, #1
        adds    r6, r0, r1
        mov     r1, r1, asr #31
        adc     r1, r1, lr, asr #31
        ldr     lr, [sp, #0xC]
        str     r1, [sp, #0x18]
        mov     r0, r6
        mov     r11, r12, asr #31
        adds    r10, lr, r12
        adc     r11, r11, lr, asr #31
        bl      __ashrdi3
        ldr     r12, [sp]
        and     r0, r0, #1
        adds    r6, r12, r6
        ldr     r12, [sp, #0x18]
        mov     r2, r9
        mov     r3, r5
        adc     r12, r7, r12
        adds    r0, r6, r0
        adc     r1, r12, #0
        ldr     r12, [sp]
        adds    r6, r12, r10
        adc     r12, r7, r11
        str     r12, [sp, #0x18]
        bl      __ashrdi3
        str     r0, [r4, #4]
        mov     r0, r10
        mov     r1, r11
        mov     r2, r9
        mov     r3, r5
        bl      __ashrdi3
        ldr     r1, [sp, #0x18]
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r1, #0
        mov     r3, r5
        mov     r2, r9
        bl      __ashrdi3
        str     r0, [r4, #8]!
        ldr     r0, [sp, #0x10]
        cmp     r8, r0
        blt     LDCK8
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCK9:
        cmp     r6, #0
        rsb     r9, r9, #0
        ble     LDCK11
        ldr     r11, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        mov     r3, r9, asr #31
        sub     r4, r4, #4
        str     r3, [sp, #8]
        str     r8, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r6, [sp, #0x10]
LDCK10:
        ldr     r1, [r5]
        ldr     r3, [sp, #8]
        mov     r2, r9
        adds    r0, r11, r1
        mov     r1, r1, asr #31
        adc     r1, r1, r11, asr #31
        bl      __ashldi3
        ldr     r12, [r5, #4]
        mov     r8, r0
        ldr     r3, [sp, #8]
        adds    r0, r10, r12
        mov     r12, r12, asr #31
        mov     r6, r1
        adc     r1, r12, r10, asr #31
        mov     r2, r9
        bl      __ashldi3
        ldr     r3, [sp, #0xC]
        cmp     r8, r3
        sbcs    r3, r6, #0
        mvnge   r8, #2, 2
        movge   r6, #0
        mvn     r3, #2, 2
        cmp     r0, r3
        sbcs    r3, r1, #0
        mvnge   r0, #2, 2
        movge   r1, #0
        subs    r3, r8, #2, 2
        sbcs    r6, r6, r7
        movlt   r3, #0
        movlt   r6, #0
        orrs    r6, r3, r6
        moveq   r8, #2, 2
        subs    r3, r0, #2, 2
        sbcs    r1, r1, r7
        movlt   r3, #0
        movlt   r1, #0
        orrs    r1, r3, r1
        str     r8, [r4, #4]
        moveq   r0, #2, 2
        str     r0, [r4, #8]!
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        add     r1, r1, #1
        str     r1, [sp, #0x14]
        cmp     r1, r3
        add     r5, r5, #8
        blt     LDCK10
LDCK11:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCK12:
        subs    r3, r9, #2, 2
        sbcs    lr, lr, r7
        movlt   r3, #0
        movlt   lr, #0
        orrs    lr, r3, lr
        moveq   r9, #2, 2
        b       LDCK6
LDCK13:
        subs    r11, r10, #2, 2
        sbcs    r3, r3, r7
        movlt   r11, #0
        movlt   r3, #0
        orrs    r3, r11, r3
        moveq   r10, #2, 2
        b       LDCK5
LDCK14:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDCK15:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


