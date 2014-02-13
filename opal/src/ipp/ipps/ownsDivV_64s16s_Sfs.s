        .text
        .align  4
        .globl  ownsDivV_64s16s_Sfs


ownsDivV_64s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     lr, [sp, #0x38]
        mov     r7, r0
        mov     r6, r1
        cmp     lr, #0
        mov     r8, r2
        mov     r4, r3
        mvn     r5, #0
        mov     r12, #0
        mov     r10, #1
        bne     LCYM5
        cmp     r8, #0
        ble     LCYM11
        mov     r11, #0
        str     r5, [sp, #4]
LCYM0:
        ldr     r9, [r7]
        ldr     r5, [r7, #4]
        orrs    r12, r9, r5
        moveq   r12, #0
        streqh  r12, [r6]
        beq     LCYM4
        tst     r5, r5
        movpl   r12, #1
        strpl   r12, [sp]
        bmi     LCYM12
LCYM1:
        mov     r10, r4, asr #31
        mov     r1, r5
        mov     r0, r9
        mov     r2, r4
        mov     r3, r10
        bl      __divdi3
        rsbs    r2, r4, #0
        umull   r12, lr, r2, r0
        mla     r1, r2, r1, lr
        rsc     lr, r10, #0
        adds    r12, r9, r12
        mla     r1, lr, r0, r1
        adc     r5, r5, r1
        adds    lr, r12, r12
        adc     r12, r5, r5
        cmp     lr, r4
        sbcs    r5, r12, r10
        blt     LCYM3
        subs    lr, lr, r4
        sbcs    r12, r12, r10
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LCYM2
        adds    r0, r0, #1
        b       LCYM3
LCYM2:
        and     r12, r0, #1
        adds    r0, r0, r12
LCYM3:
        ldr     r12, [sp]
        mvn     lr, #0
        umull   r0, r12, r12, r0
        add     r12, lr, #2, 18
        mov     lr, lr, lsl #15
        cmn     r0, #2, 18
        movlt   r0, lr
        cmp     r0, r12
        movlt   r12, r0
        strh    r12, [r6]
LCYM4:
        add     r11, r11, #1
        cmp     r11, r8
        add     r7, r7, #8
        add     r6, r6, #2
        sub     r4, r4, #1
        blt     LCYM0
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCYM5:
        cmp     lr, #0
        ble     LCYM14
        cmp     lr, #0x3F
        mov     r9, #0x3F
        movgt   lr, r9
        cmp     r8, #0
        ble     LCYM11
        mov     r11, #0
        str     lr, [sp]
        str     r5, [sp, #4]
LCYM6:
        ldr     r9, [r7]
        ldr     r5, [r7, #4]
        orrs    r12, r9, r5
        moveq   r12, #0
        streqh  r12, [r6]
        beq     LCYM10
        tst     r5, r5
        movpl   r12, #1
        strpl   r12, [sp, #8]
        bmi     LCYM13
LCYM7:
        mov     r10, r4, asr #31
        mov     r1, r5
        mov     r0, r9
        mov     r2, r4
        mov     r3, r10
        bl      __divdi3
        rsbs    r12, r4, #0
        umull   lr, r2, r12, r0
        mla     r2, r12, r1, r2
        rsc     r12, r10, #0
        adds    lr, r9, lr
        mla     r2, r12, r0, r2
        adc     r2, r5, r2
        adds    lr, lr, lr
        adc     r12, r2, r2
        cmp     lr, r4
        sbcs    r5, r12, r10
        blt     LCYM9
        subs    lr, lr, r4
        sbcs    r12, r12, r10
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LCYM8
        adds    r0, r0, #1
        b       LCYM9
LCYM8:
        and     r12, r0, #1
        adds    r0, r0, r12
LCYM9:
        ldr     r12, [sp, #8]
        mov     lr, #1
        umull   r0, r12, r12, r0
        ldr     r12, [sp]
        sub     r5, r12, #1
        add     lr, r0, lr, lsl r5
        mvn     r5, #0
        mov     r0, r0, asr r12
        and     r0, r0, #1
        add     r0, lr, r0
        sub     lr, r0, #1
        mov     r12, lr, asr r12
        cmn     r12, #2, 18
        add     lr, r5, #2, 18
        mov     r5, r5, lsl #15
        movlt   r12, r5
        cmp     r12, lr
        movlt   lr, r12
        strh    lr, [r6]
LCYM10:
        add     r11, r11, #1
        cmp     r11, r8
        add     r7, r7, #8
        add     r6, r6, #2
        sub     r4, r4, #1
        blt     LCYM6
LCYM11:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCYM12:
        ldr     r12, [sp, #4]
        rsbs    r9, r9, #0
        rsc     r5, r5, #0
        str     r12, [sp]
        b       LCYM1
LCYM13:
        ldr     r12, [sp, #4]
        rsbs    r9, r9, #0
        rsc     r5, r5, #0
        str     r12, [sp, #8]
        b       LCYM7
LCYM14:
        cmp     lr, #0
        bge     LCYM11
        rsb     lr, lr, #0
        cmp     lr, #0xF
        mov     r5, #0xF
        movgt   lr, r5
        cmp     r8, #0
        rsb     r5, lr, #0x1E
        ble     LCYM11
        mov     r9, #0
LCYM15:
        mov     r10, r4, asr #31
        mov     r0, #1, 2
        mov     r1, #0
        mov     r2, r4
        mov     r3, r10
        bl      __divdi3
        rsbs    r11, r4, #0
        umull   r12, lr, r11, r0
        mla     r1, r11, r1, lr
        rsc     lr, r10, #0
        adds    r12, r12, #1, 2
        mla     r1, lr, r0, r1
        adc     r11, r1, #0
        adds    lr, r12, r12
        adc     r12, r11, r11
        cmp     lr, r4
        sbcs    r11, r12, r10
        blt     LCYM17
        subs    lr, lr, r4
        sbcs    r12, r12, r10
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LCYM16
        adds    r0, r0, #1
        b       LCYM17
LCYM16:
        and     r12, r0, #1
        adds    r0, r0, r12
LCYM17:
        mov     r12, #1
        umull   r12, lr, r12, r0
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        orrs    lr, r0, r1
        moveq   r12, #0
        streqh  r12, [r6]
        beq     LCYM20
        umull   r2, r10, r12, r0
        umull   r11, lr, r12, r1
        str     r2, [sp, #8]
        mov     r2, r1, asr #31
        mla     lr, r12, r2, lr
        mov     r12, r12, asr #31
        mla     r10, r12, r0, r10
        sub     r2, r5, #1
        mov     r0, #1
        mla     lr, r12, r1, lr
        mov     r3, r2, asr #31
        mov     r1, #0
        str     lr, [sp, #4]
        bl      __ashldi3
        ldr     r12, [sp, #4]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        adds    r11, r10, r11
        mov     r3, r5, asr #31
        adc     r10, r12, #0
        str     r1, [sp, #0x10]
        str     r3, [sp]
        mvn     r12, #0
        str     r12, [sp, #4]
        mov     r1, r11
        mov     r2, r5
        bl      __lshrdi3
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #4]
        ldr     r1, [sp, #0x10]
        and     r0, r0, #1
        adds    lr, lr, r12
        adc     r12, r1, r12
        ldr     r1, [sp, #8]
        adds    r0, r1, r0
        adc     r1, r11, #0
        adds    r0, r0, lr
        mvn     lr, #2, 2
        bic     r11, r11, lr
        adc     r1, r1, r12
        cmp     r11, #0
        mov     lr, #0
        mov     r12, #1
        cmpeq   lr, r12
        mov     r11, r10, asr #31
        bne     LCYM18
        mvn     r12, #2, 2
        bic     r12, r1, r12
        orrs    r12, r12, #0
        bne     LCYM18
        adds    r10, r10, #1
        adc     r11, r11, #0
LCYM18:
        mov     r2, r5
        ldr     r3, [sp]
        bl      __lshrdi3
        rsb     r2, r5, #0x40
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r3, r2, asr #31
        mov     r0, r10
        mov     r1, r11
        bl      __ashldi3
        ldr     r3, [sp]
        str     r0, [sp, #8]
        str     r1, [sp, #4]
        mov     r0, r10
        mov     r1, r11
        mov     r2, r5
        bl      __ashrdi3
        ldr     lr, [sp, #0x10]
        ldr     r12, [sp, #8]
        ldr     r10, [sp, #0xC]
        orr     lr, lr, r12
        ldr     r12, [sp, #4]
        orr     r12, r10, r12
        orrs    r10, r0, r1, lsl #1
        tstcs   r10, #0
        movne   lr, lr, lsl #16
        movne   lr, lr, asr #16
        beq     LCYM21
LCYM19:
        strh    lr, [r6]
LCYM20:
        add     r9, r9, #1
        cmp     r9, r8
        add     r7, r7, #8
        add     r6, r6, #2
        sub     r4, r4, #1
        blt     LCYM15
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCYM21:
        mvn     r10, #0
        cmp     r0, r10
        sbcs    r10, r1, r10
        movlt   lr, lr, lsl #16
        movlt   lr, lr, asr #16
        blt     LCYM19
        mvn     r10, #0
        add     r10, r10, #2, 18
        cmp     lr, r10
        sbcs    r10, r12, #0
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        bge     LCYM19
        mvn     r10, #0
        cmp     r1, r10
        cmpeq   r0, r10
        beq     LCYM23
LCYM22:
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LCYM19
LCYM23:
        subs    r11, lr, r10, lsl #15
        sbcs    r12, r12, r10
        movlt   r11, #0
        movlt   r12, #0
        orrs    r12, r11, r12
        moveq   lr, lr, lsl #16
        moveq   lr, lr, asr #16
        beq     LCYM19
        b       LCYM22


