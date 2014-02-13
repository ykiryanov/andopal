        .text
        .align  4
        .globl  ownsDivC_64s16s_Sfs


ownsDivC_64s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x3C]
        mov     r6, r0
        mov     r5, r1
        cmp     r12, #0
        mov     r7, r2
        mov     r10, r3
        mvn     r9, #0
        mov     r8, #0
        bne     LCYN5
        cmp     r7, #0
        ble     LCYN11
        mov     r4, #0
        str     r9, [sp, #4]
LCYN0:
        ldr     r9, [r6]
        ldr     r8, [r6, #4]
        orrs    r12, r9, r8
        moveq   r12, #0
        streqh  r12, [r5]
        beq     LCYN4
        tst     r8, r8
        movpl   r12, #1
        strpl   r12, [sp]
        bmi     LCYN12
LCYN1:
        mov     r11, r10, asr #31
        mov     r1, r8
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __divdi3
        rsbs    r2, r10, #0
        umull   r12, lr, r2, r0
        mla     r1, r2, r1, lr
        rsc     lr, r11, #0
        adds    r12, r9, r12
        mla     r1, lr, r0, r1
        adc     r8, r8, r1
        adds    lr, r12, r12
        adc     r12, r8, r8
        cmp     lr, r10
        sbcs    r8, r12, r11
        blt     LCYN3
        subs    lr, lr, r10
        sbcs    r12, r12, r11
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LCYN2
        adds    r0, r0, #1
        b       LCYN3
LCYN2:
        and     r12, r0, #1
        adds    r0, r0, r12
LCYN3:
        ldr     r12, [sp]
        mvn     lr, #0
        umull   r0, r12, r12, r0
        add     r12, lr, #2, 18
        mov     lr, lr, lsl #15
        cmn     r0, #2, 18
        movlt   r0, lr
        cmp     r0, r12
        movlt   r12, r0
        strh    r12, [r5]
LCYN4:
        add     r4, r4, #1
        cmp     r4, r7
        add     r6, r6, #8
        add     r5, r5, #2
        blt     LCYN0
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCYN5:
        cmp     r12, #0
        ble     LCYN14
        cmp     r12, #0x3F
        mov     lr, #0x3F
        movgt   r12, lr
        cmp     r7, #0
        ble     LCYN11
        mov     r4, #0
        str     r12, [sp]
        str     r9, [sp, #4]
LCYN6:
        ldr     r9, [r6]
        ldr     r8, [r6, #4]
        orrs    r12, r9, r8
        moveq   r12, #0
        streqh  r12, [r5]
        beq     LCYN10
        tst     r8, r8
        movpl   r12, #1
        strpl   r12, [sp, #8]
        bmi     LCYN13
LCYN7:
        mov     r11, r10, asr #31
        mov     r1, r8
        mov     r0, r9
        mov     r2, r10
        mov     r3, r11
        bl      __divdi3
        rsbs    r12, r10, #0
        umull   lr, r2, r12, r0
        mla     r2, r12, r1, r2
        rsc     r12, r11, #0
        adds    lr, r9, lr
        mla     r2, r12, r0, r2
        adc     r2, r8, r2
        adds    lr, lr, lr
        adc     r12, r2, r2
        cmp     lr, r10
        sbcs    r8, r12, r11
        blt     LCYN9
        subs    lr, lr, r10
        sbcs    r12, r12, r11
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LCYN8
        adds    r0, r0, #1
        b       LCYN9
LCYN8:
        and     r12, r0, #1
        adds    r0, r0, r12
LCYN9:
        ldr     r12, [sp, #8]
        mov     lr, #1
        umull   r0, r12, r12, r0
        ldr     r12, [sp]
        sub     r8, r12, #1
        add     lr, r0, lr, lsl r8
        mvn     r8, #0
        mov     r0, r0, asr r12
        and     r0, r0, #1
        add     r0, lr, r0
        sub     lr, r0, #1
        mov     r12, lr, asr r12
        cmn     r12, #2, 18
        add     lr, r8, #2, 18
        mov     r8, r8, lsl #15
        movlt   r12, r8
        cmp     r12, lr
        movlt   lr, r12
        strh    lr, [r5]
LCYN10:
        add     r4, r4, #1
        cmp     r4, r7
        add     r6, r6, #8
        add     r5, r5, #2
        blt     LCYN6
LCYN11:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCYN12:
        ldr     r12, [sp, #4]
        rsbs    r9, r9, #0
        rsc     r8, r8, #0
        str     r12, [sp]
        b       LCYN1
LCYN13:
        ldr     r12, [sp, #4]
        rsbs    r9, r9, #0
        rsc     r8, r8, #0
        str     r12, [sp, #8]
        b       LCYN7
LCYN14:
        cmp     r12, #0
        bge     LCYN11
        rsb     r12, r12, #0
        cmp     r12, #0xF
        mov     lr, #0xF
        movgt   r12, lr
        mov     r11, r10, asr #31
        mov     r0, #1, 2
        mov     r1, #0
        mov     r2, r10
        mov     r3, r11
        rsb     r4, r12, #0x1E
        bl      __divdi3
        rsbs    lr, r10, #0
        umull   r12, r2, lr, r0
        mla     r2, lr, r1, r2
        rsc     lr, r11, #0
        adds    r12, r12, #1, 2
        mla     lr, lr, r0, r2
        adc     lr, lr, #0
        adds    r12, r12, r12
        adc     lr, lr, lr
        cmp     r12, r10
        sbcs    r1, lr, r11
        blt     LCYN16
        subs    r12, r12, r10
        sbcs    lr, lr, r11
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCYN15
        adds    r0, r0, #1
        b       LCYN16
LCYN15:
        and     r3, r0, #1
        adds    r0, r0, r3
LCYN16:
        mov     r3, #1
        umull   r0, r12, r3, r0
        cmp     r7, #0
        ble     LCYN11
        mov     r10, #0
        str     r0, [sp]
        str     r9, [sp, #4]
LCYN17:
        ldr     r8, [r6]
        ldr     r12, [r6, #4]
        orrs    r3, r8, r12
        moveq   r3, #0
        streqh  r3, [r5]
        beq     LCYN20
        ldr     r11, [sp]
        sub     r2, r4, #1
        mov     r1, #0
        umull   r0, lr, r11, r8
        umull   r9, r3, r11, r12
        str     r0, [sp, #8]
        mov     r0, r12, asr #31
        mla     r3, r11, r0, r3
        mov     r11, r11, asr #31
        mla     r8, r11, r8, lr
        mov     r0, #1
        mla     r3, r11, r12, r3
        str     r3, [sp, #0xC]
        mov     r3, r2, asr #31
        bl      __ashldi3
        ldr     r3, [sp, #0xC]
        ldr     r12, [sp, #4]
        adds    r11, r8, r9
        adc     r9, r3, #0
        str     r1, [sp, #0x10]
        adds    r0, r0, r12
        ldr     lr, [sp, #0x10]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        adc     r12, lr, r12
        str     r12, [sp, #0x10]
        mov     r8, r4, asr #31
        mov     r1, r11
        mov     r2, r4
        mov     r3, r8
        bl      __lshrdi3
        ldr     lr, [sp, #8]
        and     r12, r0, #1
        ldr     r0, [sp, #0xC]
        adds    lr, lr, r12
        adc     r12, r11, #0
        adds    r0, lr, r0
        mvn     lr, #2, 2
        bic     r11, r11, lr
        ldr     lr, [sp, #0x10]
        adc     r1, r12, lr
        cmp     r11, #0
        mov     lr, #0
        mov     r12, #1
        cmpeq   lr, r12
        mov     r11, r9, asr #31
        bne     LCYN18
        mvn     r12, #2, 2
        bic     r12, r1, r12
        orrs    r12, r12, #0
        bne     LCYN18
        adds    r9, r9, #1
        adc     r11, r11, #0
LCYN18:
        mov     r2, r4
        mov     r3, r8
        bl      __lshrdi3
        rsb     r2, r4, #0x40
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r3, r2, asr #31
        mov     r0, r9
        mov     r1, r11
        bl      __ashldi3
        str     r0, [sp, #8]
        str     r1, [sp, #0x14]
        mov     r0, r9
        mov     r1, r11
        mov     r2, r4
        mov     r3, r8
        bl      __ashrdi3
        ldr     r12, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     lr, [sp, #0xC]
        orr     r12, r12, r3
        orrs    r3, r0, r1, lsl #1
        tstcs   r3, #0
        ldr     r3, [sp, #0x14]
        orr     r3, lr, r3
        movne   r12, r12, lsl #16
        movne   r12, r12, asr #16
        beq     LCYN21
LCYN19:
        strh    r12, [r5]
LCYN20:
        add     r10, r10, #1
        cmp     r10, r7
        add     r6, r6, #8
        add     r5, r5, #2
        blt     LCYN17
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCYN21:
        mvn     lr, #0
        cmp     r0, lr
        sbcs    lr, r1, lr
        movlt   r12, r12, lsl #16
        movlt   r12, r12, asr #16
        blt     LCYN19
        mvn     lr, #0
        add     lr, lr, #2, 18
        cmp     r12, lr
        sbcs    lr, r3, #0
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        bge     LCYN19
        mvn     lr, #0
        cmp     r1, lr
        cmpeq   r0, lr
        beq     LCYN23
LCYN22:
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LCYN19
LCYN23:
        mvn     r8, #0
        subs    lr, r12, r8, lsl #15
        sbcs    r3, r3, r8
        movlt   lr, #0
        movlt   r3, #0
        orrs    r3, lr, r3
        moveq   r12, r12, lsl #16
        moveq   r12, r12, asr #16
        beq     LCYN19
        b       LCYN22


