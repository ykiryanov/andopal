        .text
        .align  4
        .globl  _ippsFullbandController_EC_16s


_ippsFullbandController_EC_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r5, [sp, #0x4C]
        ldr     r12, [sp, #0x50]
        mov     r6, r0
        cmp     r6, #0
        mov     r0, r2
        beq     LDKK20
        cmp     r1, #0
        beq     LDKK20
        cmp     r0, #0
        beq     LDKK20
        cmp     r3, #0
        beq     LDKK20
        cmp     r5, #0
        beq     LDKK20
        cmp     r12, #0
        beq     LDKK20
        and     lr, r12, #0xF
        rsb     lr, lr, #0
        and     lr, lr, #0xF
        add     r4, r12, lr
        ldr     r7, [r4, #0x30]
        mov     r2, #0
        cmp     r7, #0
        movle   r8, r2
        ble     LDKK3
        mov     r8, r2
        mvn     lr, #2, 2
        mvn     r12, #0
LDKK0:
        ldrsh   r10, [r6], #2
        mov     r9, r2, asr #31
        mul     r10, r10, r10
        add     r10, r10, #8
        mov     r10, r10, asr #4
        adds    r2, r10, r2
        adc     r9, r9, r10, asr #31
        subs    r11, r2, lr
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r2, #2, 2
        bne     LDKK1
        cmp     r2, #2, 2
        sbcs    r9, r9, r12
        movlt   r2, #2, 2
LDKK1:
        ldrsh   r10, [r1], #2
        mov     r9, r8, asr #31
        mul     r10, r10, r10
        add     r10, r10, #8
        mov     r10, r10, asr #4
        adds    r8, r10, r8
        adc     r9, r9, r10, asr #31
        subs    r11, r8, lr
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r8, #2, 2
        bne     LDKK2
        cmp     r8, #2, 2
        sbcs    r9, r9, r12
        movlt   r8, #2, 2
LDKK2:
        subs    r7, r7, #1
        bne     LDKK0
LDKK3:
        ldr     r7, [r4, #0x18]
        ldr     r12, [r4, #4]
        mov     lr, #1, 18
        subs    lr, lr, r7
        umull   r11, r10, r2, lr
        smull   r9, r1, r12, r7
        mov     r12, #0
        mov     r6, r7, asr #31
        sbc     r12, r12, r6
        mla     r10, r2, r12, r10
        mov     r2, r2, asr #31
        adds    r9, r9, r11
        mvn     r11, #2, 2
        mla     r10, r2, lr, r10
        mov     r2, #0
        adc     r10, r1, r10
        adds    r9, r9, #2, 20
        adc     r10, r10, #0
        mov     r1, r10, lsl #18
        orr     r9, r1, r9, lsr #14
        subs    r1, r9, r11
        rscs    r2, r2, r10, asr #14
        movlt   r1, #0
        movlt   r2, #0
        orrs    r2, r1, r2
        movne   r9, r11
        bne     LDKK4
        cmp     r9, #2, 2
        mvn     r11, #0
        rscs    r10, r11, r10, asr #14
        movlt   r9, #2, 2
LDKK4:
        umull   r10, r11, r8, lr
        mla     r11, r8, r12, r11
        ldr     r12, [r4, #8]
        mov     r8, r8, asr #31
        str     r9, [r4, #4]
        mla     lr, r8, lr, r11
        smull   r11, r8, r12, r7
        mvn     r12, #2, 2
        mov     r1, #0
        adds    r10, r11, r10
        adc     lr, r8, lr
        adds    r8, r10, #2, 20
        adc     lr, lr, #0
        mov     r10, lr, lsl #18
        orr     r10, r10, r8, lsr #14
        subs    r8, r10, r12
        rscs    r11, r1, lr, asr #14
        movlt   r8, #0
        movlt   r11, #0
        orrs    r11, r8, r11
        movne   r10, r12
        bne     LDKK5
        cmp     r10, #2, 2
        mvn     r12, #0
        rscs    lr, r12, lr, asr #14
        movlt   r10, #2, 2
LDKK5:
        ldr     r12, [r4, #0x34]
        str     r12, [sp, #0x18]
        str     r10, [r4, #8]
        cmp     r12, #0
        movle   r12, r1
        movle   r8, r12
        ble     LDKK9
        ldr     r12, [sp, #0x18]
        cmp     r12, #6
        movlt   r12, r1
        movlt   r8, r12
        blt     LDKK7
        mov     r12, r1
        ldr     lr, [sp, #0x18]
        mov     r8, r12
        mov     r11, r0
        sub     lr, lr, #6
        str     r4, [sp, #0xC]
        str     r5, [sp, #8]
        str     r3, [sp, #4]
        str     r0, [sp]
LDKK6:
        ldrsh   r0, [r11]
        ldrsh   r2, [r11, #2]
        ldrsh   r3, [r11, #4]
        mul     r0, r0, r0
        ldrsh   r4, [r11, #6]
        mul     r2, r2, r2
        mul     r3, r3, r3
        mul     r4, r4, r4
        adds    r5, r0, r12
        ldrsh   r12, [r11, #8]
        adc     r0, r8, r0, asr #31
        adds    r5, r2, r5
        adc     r2, r0, r2, asr #31
        mul     r0, r12, r12
        adds    r5, r3, r5
        adc     r3, r2, r3, asr #31
        adds    r5, r4, r5
        adc     r4, r3, r4, asr #31
        adds    r12, r0, r5
        add     r1, r1, #5
        adc     r8, r4, r0, asr #31
        cmp     r1, lr
        add     r11, r11, #0xA
        ble     LDKK6
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
LDKK7:
        ldr     r11, [sp, #0x18]
        add     lr, r0, r1, lsl #1
LDKK8:
        ldrsh   r2, [lr], #2
        add     r1, r1, #1
        mul     r2, r2, r2
        adds    r12, r2, r12
        adc     r8, r8, r2, asr #31
        cmp     r1, r11
        blt     LDKK8
LDKK9:
        ldr     lr, [r4, #0x10]
        ldr     r11, [r4, #0x14]
        subs    r1, lr, r12
        str     r1, [sp, #0x10]
        sbc     r1, r11, r8
        tst     r1, r1
        str     r1, [sp, #0x14]
        bpl     LDKK10
        ldr     r1, [sp, #0x10]
        rsbs    r1, r1, #0
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        rsc     r1, r1, #0
        str     r1, [sp, #0x14]
LDKK10:
        umull   r1, r2, lr, r7
        mla     r2, lr, r6, r2
        rsbs    lr, r7, #0
        rsc     r6, r6, #0
        str     r6, [sp, #0x24]
        str     r1, [sp, #0x1C]
        adds    r6, lr, #1, 18
        umull   lr, r1, r6, r12
        mla     r6, r6, r8, r1
        str     r2, [sp, #0x20]
        ldr     r1, [sp, #0x20]
        mla     r11, r11, r7, r1
        ldr     r7, [sp, #0x24]
        adc     r1, r7, #0
        ldr     r7, [sp, #0x1C]
        mla     r1, r1, r12, r6
        mvn     r6, #2, 2
        adds    r7, r7, #2, 20
        adc     r11, r11, #0
        adds    r7, lr, r7
        adc     r1, r1, r11
        mov     lr, r1, lsl #18
        orr     lr, lr, r7, lsr #14
        subs    r6, lr, r6
        mov     r7, #0
        rscs    r7, r7, r1, asr #14
        movlt   r6, #0
        movlt   r7, #0
        orrs    r7, r6, r7
        mvnne   lr, #2, 2
        bne     LDKK11
        cmp     lr, #2, 2
        mvn     r6, #0
        rscs    r1, r6, r1, asr #14
        movlt   lr, #2, 2
LDKK11:
        str     lr, [r4, #0x10]
        mov     lr, lr, asr #31
        str     lr, [r4, #0x14]
        mov     lr, #0xA
        smull   r6, r7, lr, r9
        mov     lr, r10, asr #31
        subs    r6, r10, r6
        sbcs    r7, lr, r7
        movlt   r6, #0
        movlt   r7, #0
        orrs    r7, r6, r7
        beq     LDKK13
        ldr     r7, [sp, #0x10]
        mov     r6, #5
        umull   r7, r6, r6, r7
        subs    r12, r12, r7
        ldr     r7, [sp, #0x14]
        add     r7, r7, r7, lsl #2
        add     r6, r7, r6
        sbcs    r8, r8, r6
        movlt   r12, #0
        movlt   r8, #0
        orrs    r8, r12, r8
        beq     LDKK13
        ldr     r2, [sp, #0x18]
        mov     r1, r3
        bl      _ippsCopy_16s
        ldr     r0, [r4, #0x3C]
        ldr     r2, [r4, #0x20]
        ldr     r10, [r4, #4]
        mvn     r1, #2, 2
        mul     r0, r0, r2
        str     r10, [r4, #8]
        mov     r2, #0
        add     r0, r0, #2, 20
        mov     r0, r0, asr #14
        subs    r3, r0, r1
        rscs    r2, r2, r0, asr #31
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        movne   r0, r1
        bne     LDKK12
        cmp     r0, #2, 2
        mvn     r1, #0
        rscs    r1, r1, r0, asr #31
        movlt   r0, #2, 2
LDKK12:
        str     r0, [r4, #0x3C]
        b       LDKK15
LDKK13:
        mov     r12, #0x3B
        orr     r12, r12, #0x31, 24
        smull   r9, r6, r12, r9
        adds    r12, r9, #2, 20
        adc     r6, r6, #0
        mov     r7, r6, lsl #18
        orr     r12, r7, r12, lsr #14
        cmp     r10, r12
        sbcs    lr, lr, r6, asr #14
        ldrge   r0, [r4, #0x3C]
        bge     LDKK15
        ldr     r2, [sp, #0x18]
        mov     r1, r0
        mov     r0, r3
        bl      _ippsCopy_16s
        ldr     r1, [r4, #0x20]
        ldr     r0, [r4, #0x3C]
        ldr     r10, [r4, #8]
        rsb     r2, r1, #1, 18
        mov     r2, r2, lsl #14
        mla     r0, r0, r1, r2
        str     r10, [r4, #4]
        mvn     r1, #2, 2
        mov     r2, #0
        add     r0, r0, #2, 20
        mov     r0, r0, asr #14
        subs    r3, r0, r1
        rscs    r2, r2, r0, asr #31
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        movne   r0, r1
        bne     LDKK14
        cmp     r0, #2, 2
        mvn     r1, #0
        rscs    r1, r1, r0, asr #31
        movlt   r0, #2, 2
LDKK14:
        str     r0, [r4, #0x3C]
LDKK15:
        cmp     r0, #2, 20
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mov     r1, #0
        bge     LDKK16
        ldr     r2, [r4, #0xC]
        mov     r3, #0xCC
        orr     r3, r3, #3, 22
        mul     r3, r2, r3
        add     r2, r3, #2, 20
        cmp     r10, r2, asr #14
        movlt   r3, #0
        blt     LDKK17
LDKK16:
        mvn     r3, r0
LDKK17:
        ldr     r6, [r4, #0x28]
        ldr     lr, [r4, #0x38]
        mvn     r2, #2, 2
        rsb     r12, r6, #0
        add     r12, r12, #1, 18
        mul     r6, lr, r6
        add     lr, r6, #2, 20
        mla     lr, r12, r3, lr
        mov     r3, lr, asr #14
        subs    r12, r3, r2
        rscs    lr, r1, r3, asr #31
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r3, r2
        bne     LDKK18
        cmp     r3, #2, 2
        mvn     r2, #0
        rscs    r2, r2, r3, asr #31
        movlt   r3, #2, 2
LDKK18:
        mvn     r2, r0
        cmp     r2, r3
        str     r3, [r4, #0x38]
        sublt   r1, r1, #2, 18
        mvnlt   r0, r1
        blt     LDKK19
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r0, r3, asr #16
LDKK19:
        strh    r0, [r5]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LDKK20:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


