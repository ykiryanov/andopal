        .text
        .align  4
        .globl  _ippsGoertzTwo_16sc_Sfs


_ippsGoertzTwo_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     r7, [sp, #0x80]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r10, r3
        beq     LBSR21
        cmp     r6, #0
        beq     LBSR21
        cmp     r10, #0
        beq     LBSR21
        cmp     r4, #0
        ble     LBSR22
        ldr     r0, [r10]
        bl      __extendsfdf2
        mov     r9, r0
        mov     r11, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSR7
        mov     r0, r9
        mov     r12, #0x16, 12
        orr     r8, r12, #1, 2
        sub     r3, r8, #0x17, 12
        mov     r1, r11
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSR7
        ldr     r0, [r10, #4]
        bl      __extendsfdf2
        str     r1, [sp]
        mov     r10, r0
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSR7
        mov     r0, r10
        ldr     r1, [sp]
        sub     r3, r8, #0x17, 12
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSR7
        mov     r0, r9
        mov     r1, r11
        ldr     r2, [pc, #0x6D8]
        ldr     r3, [pc, #0x6D8]
        bl      __muldf3
        mov     r9, r1
        mov     r11, r0
        bl      sin
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x14]
        mov     r1, r9
        mov     r0, r11
        bl      cos
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        ldr     r2, [pc, #0x68C]
        ldr     r3, [pc, #0x68C]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp]
        mov     r9, r0
        str     r9, [sp, #4]
        mov     r0, r10
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        bl      sin
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        str     r0, [sp, #8]
        str     r1, [sp, #0x18]
        mov     r1, r10
        mov     r0, r11
        bl      cos
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        ldr     lr, [sp, #0x14]
        str     r1, [sp]
        mov     r3, #0
        umull   r10, r1, r3, r9
        ldr     r9, [sp, #8]
        umull   r8, lr, r3, lr
        umull   r9, r11, r3, r9
        str     r0, [sp, #0xC]
        umull   r3, r0, r3, r0
        sub     r12, r5, #4
        mov     r2, r4, lsl #2
        str     r9, [sp, #0x2C]
        str     r3, [sp, #0x34]
        add     r3, r12, r2
        ldrsh   r3, [r3, #2]
        ldrsh   r9, [r12, +r2]
        rsbs    r2, r8, r3, lsl #23
        mov     r12, r3, asr #31
        str     r12, [sp, #0x30]
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x30]
        mov     r12, r3, lsr #9
        orr     r2, r12, r2, lsl #23
        str     r2, [sp, #0x30]
        sbc     r12, r2, lr
        ldr     r2, [sp, #0x10]
        adds    r2, r2, r10
        str     r2, [sp, #0x10]
        mov     r2, r9, asr #31
        str     r2, [sp, #0x38]
        adc     r12, r12, r1
        adds    r10, r10, r9, lsl #23
        mov     r2, r9, lsr #9
        str     r2, [sp, #0x3C]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x38]
        ldr     r2, [sp, #0x3C]
        orr     r10, r2, r10, lsl #23
        str     r10, [sp, #0x3C]
        adc     r1, r10, r1
        ldr     r10, [sp, #0x40]
        adds    r8, r10, r8
        adc     r10, r1, lr
        ldr     lr, [sp, #0x2C]
        ldr     r1, [sp, #0x34]
        rsbs    lr, lr, r3, lsl #23
        ldr     r3, [sp, #0x30]
        sbc     r3, r3, r11
        adds    lr, lr, r1
        ldr     r1, [sp, #0x34]
        adc     r3, r3, r0
        adds    r9, r1, r9, lsl #23
        ldr     r1, [sp, #0x3C]
        adc     r0, r1, r0
        ldr     r1, [sp, #0x2C]
        adds    r9, r9, r1
        adc     r11, r0, r11
        subs    r4, r4, #2
        bmi     LBSR1
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        mov     r1, r4, lsl #2
        add     r1, r1, #2
        add     r5, r1, r5
        str     r4, [sp, #0x2C]
        str     r3, [sp, #0x30]
        str     r7, [sp, #0x28]
        str     r6, [sp, #0x24]
LBSR0:
        ldr     r1, [sp, #0x14]
        umull   r3, r1, r1, r8
        str     r3, [sp, #0x40]
        ldr     r3, [sp, #4]
        umull   r4, r3, r3, r0
        str     r4, [sp, #0x3C]
        ldr     r4, [sp, #0x14]
        mla     r1, r4, r10, r1
        ldr     r4, [sp, #4]
        mla     r3, r4, r12, r3
        str     r3, [sp, #0x38]
        umull   r6, r3, r4, r8
        mla     r10, r4, r10, r3
        ldr     r3, [sp, #0x20]
        str     r6, [sp, #0x34]
        ldr     r6, [sp, #0x14]
        mla     r4, r3, r8, r1
        ldr     r3, [sp, #0x38]
        umull   r6, r7, r6, r0
        ldr     r1, [sp, #0x1C]
        str     r7, [sp, #0x44]
        mla     r3, r1, r0, r3
        ldr     r1, [sp, #0x14]
        str     r6, [sp, #0x48]
        ldr     r6, [sp, #0x44]
        mla     r12, r1, r12, r6
        umull   r6, r1, r2, lr
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #8]
        str     r6, [sp, #0x38]
        umull   r1, r6, r1, r9
        str     r6, [sp, #0x4C]
        ldr     r6, [sp, #0x1C]
        str     r1, [sp, #0x50]
        ldrsh   r1, [r5]
        mla     r10, r6, r8, r10
        ldr     r6, [sp, #0x20]
        mla     r8, r6, r0, r12
        ldr     r0, [sp, #0x30]
        ldr     r12, [sp, #0x44]
        mla     r12, r2, r0, r12
        ldr     r0, [sp, #8]
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0x4C]
        mla     r0, r0, r11, r12
        umull   r6, r12, r2, r9
        mla     r11, r2, r11, r12
        ldr     r12, [sp, #0x18]
        str     r6, [sp, #0x4C]
        ldr     r6, [sp, #8]
        umull   r6, r7, r6, lr
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #0x44]
        str     r6, [sp, #0x54]
        ldr     r6, [sp]
        mla     r7, r6, lr, r7
        mla     r6, r12, r9, r0
        ldr     r12, [sp, #0x30]
        ldr     r0, [sp, #8]
        str     r7, [sp, #0x44]
        ldr     r7, [sp, #0x10]
        mla     r12, r0, r12, r7
        ldr     r7, [sp]
        mov     r0, r3, lsl #9
        str     r0, [sp, #0x30]
        mla     r11, r7, r9, r11
        ldr     r9, [sp, #0x3C]
        ldr     r7, [sp, #0x30]
        mov     r0, r4, lsl #9
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x34]
        orr     r9, r7, r9, lsr #23
        ldr     r7, [sp, #0x18]
        mov     r4, r4, asr #23
        mla     r7, r7, lr, r12
        ldr     r12, [sp, #0x40]
        mov     lr, r1, asr #31
        orr     r12, r0, r12, lsr #23
        subs    r0, r9, r12
        mov     r9, r10, lsl #9
        rsc     r12, r4, r3, asr #23
        ldrsh   r4, [r5, #-2]
        mov     r3, r1, lsr #9
        orr     r9, r9, r11, lsr #23
        ldr     r11, [sp, #0x48]
        orr     r3, r3, lr, lsl #23
        mov     lr, r8, lsl #9
        adds    r0, r0, r1, lsl #23
        orr     r11, lr, r11, lsr #23
        adc     r12, r12, r3
        adds    r9, r9, r11
        mov     r11, r4, asr #31
        mov     r8, r8, asr #23
        mov     lr, r4, lsr #9
        orr     r11, lr, r11, lsl #23
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x48]
        adc     r10, r8, r10, asr #23
        adds    r8, r9, r4, lsl #23
        ldr     lr, [sp, #0x44]
        adc     r10, r10, r11
        ldr     r11, [sp, #0x38]
        sub     r5, r5, #4
        mov     r9, lr, lsl #9
        mov     lr, r6, lsl #9
        orr     r9, r9, r11, lsr #23
        ldr     r11, [sp, #0x50]
        mov     r6, r6, asr #23
        orr     r11, lr, r11, lsr #23
        subs    lr, r9, r11
        ldr     r9, [sp, #0x44]
        rsc     r6, r6, r9, asr #23
        adds    lr, lr, r1, lsl #23
        ldr     r1, [sp, #0x58]
        adc     r3, r6, r3
        str     r3, [sp, #0x30]
        ldr     r3, [sp, #0x4C]
        mov     r1, r1, lsl #9
        mov     r9, r7, lsl #9
        orr     r1, r1, r3, lsr #23
        ldr     r3, [sp, #0x54]
        mov     r7, r7, asr #23
        orr     r3, r9, r3, lsr #23
        adds    r1, r1, r3
        ldr     r3, [sp, #0x58]
        adc     r3, r7, r3, asr #23
        adds    r9, r1, r4, lsl #23
        ldr     r1, [sp, #0x48]
        adc     r11, r3, r1
        ldr     r1, [sp, #0x2C]
        subs    r1, r1, #1
        str     r1, [sp, #0x2C]
        bpl     LBSR0
        ldr     r3, [sp, #0x30]
        ldr     r7, [sp, #0x28]
        ldr     r6, [sp, #0x24]
        str     r0, [sp, #0x10]
LBSR1:
        cmp     r7, #0
        mov     r0, #1
        blt     LBSR12
        add     r1, r7, #0x16
        tst     r10, r10
        mov     r5, r0, lsl r1
        bmi     LBSR11
        adds    r0, r5, r8
        adc     r1, r10, r5, asr #31
LBSR2:
        tst     r12, r12
        bmi     LBSR10
        ldr     r4, [sp, #0x10]
        adds    r4, r5, r4
        str     r4, [sp]
        adc     r4, r12, r5, asr #31
LBSR3:
        tst     r11, r11
        bmi     LBSR9
        adds    r9, r5, r9
        adc     r11, r11, r5, asr #31
        str     r9, [sp, #0x10]
        str     r11, [sp, #4]
LBSR4:
        tst     r3, r3
        bmi     LBSR8
        adds    lr, lr, r5
        adc     r5, r3, r5, asr #31
        str     lr, [sp, #0xC]
        str     r5, [sp, #8]
LBSR5:
        add     r7, r7, #0x17
        mov     r5, r7, asr #31
        mov     r2, r7
        mov     r3, r5
        bl      __ashrdi3
        mov     r9, r0
        ldr     r0, [sp]
        mov     r8, r1
        mov     r1, r4
        mov     r2, r7
        mov     r3, r5
        bl      __ashrdi3
        str     r1, [sp]
        mov     r4, r0
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #4]
        mov     r2, r7
        mov     r3, r5
        bl      __ashrdi3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r7
        mov     r3, r5
        bl      __ashrdi3
LBSR6:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r12, r3
        subs    r12, r9, r12
        sbcs    r8, r8, #0
        movlt   r12, #0
        movlt   r8, #0
        orrs    r8, r12, r8
        mvnne   r9, r3
        strh    r9, [r6]
        ldr     lr, [sp]
        mvn     r12, r3
        subs    r12, r4, r12
        sbcs    lr, lr, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        mvnne   r4, r3
        mvn     r12, r3
        subs    r12, r10, r12
        sbcs    r11, r11, #0
        movlt   r12, #0
        movlt   r11, #0
        orrs    r11, r12, r11
        strh    r4, [r6, #2]
        mvnne   r10, r3
        mov     r3, #0
        sub     r12, r3, #2, 18
        cmp     r0, r12
        mvn     r12, #0
        sbcs    r1, r1, r12
        strh    r10, [r6, #4]
        sublt   r0, r3, #2, 18
        strh    r0, [r6, #6]
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBSR7:
        mvn     r0, #0x1A
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBSR8:
        subs    lr, lr, r5
        sbc     r3, r3, r5, asr #31
        str     lr, [sp, #0xC]
        str     r3, [sp, #8]
        b       LBSR5
LBSR9:
        subs    r9, r9, r5
        sbc     r11, r11, r5, asr #31
        str     r9, [sp, #0x10]
        str     r11, [sp, #4]
        b       LBSR4
LBSR10:
        ldr     r4, [sp, #0x10]
        subs    r4, r4, r5
        str     r4, [sp]
        sbc     r4, r12, r5, asr #31
        b       LBSR3
LBSR11:
        subs    r0, r8, r5
        sbc     r1, r10, r5, asr #31
        b       LBSR2
LBSR12:
        mov     r1, #0x16
        rsb     r7, r7, #0
        subs    r1, r1, r7
        tst     r10, r10
        mov     r4, r0, lsl r1
        bmi     LBSR20
        adds    r0, r4, r8
        adc     r1, r10, r4, asr #31
LBSR13:
        tst     r12, r12
        bmi     LBSR19
        ldr     r5, [sp, #0x10]
        adds    r5, r4, r5
        adc     r12, r12, r4, asr #31
        str     r5, [sp, #4]
        str     r12, [sp, #0x10]
LBSR14:
        tst     r11, r11
        bmi     LBSR18
        adds    r9, r4, r9
        adc     r11, r11, r4, asr #31
        str     r9, [sp, #0x18]
        str     r11, [sp, #0xC]
LBSR15:
        tst     r3, r3
        bmi     LBSR17
        adds    lr, lr, r4
        adc     r4, r3, r4, asr #31
        str     lr, [sp, #8]
        str     r4, [sp, #0x14]
LBSR16:
        mov     r3, #0x17
        subs    r5, r3, r7
        mov     r3, #0
        sbc     r7, r3, r7, asr #31
        mov     r2, r5
        mov     r3, r7
        bl      __ashrdi3
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r2, r5
        mov     r3, r7
        bl      __ashrdi3
        str     r1, [sp]
        mov     r4, r0
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0xC]
        mov     r2, r5
        mov     r3, r7
        bl      __ashrdi3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x14]
        mov     r2, r5
        mov     r3, r7
        bl      __ashrdi3
        b       LBSR6
LBSR17:
        subs    lr, lr, r4
        sbc     r3, r3, r4, asr #31
        str     lr, [sp, #8]
        str     r3, [sp, #0x14]
        b       LBSR16
LBSR18:
        subs    r9, r9, r4
        sbc     r11, r11, r4, asr #31
        str     r9, [sp, #0x18]
        str     r11, [sp, #0xC]
        b       LBSR15
LBSR19:
        ldr     r5, [sp, #0x10]
        subs    r5, r5, r4
        sbc     r12, r12, r4, asr #31
        str     r5, [sp, #4]
        str     r12, [sp, #0x10]
        b       LBSR14
LBSR20:
        subs    r0, r8, r4
        sbc     r1, r10, r4, asr #31
        b       LBSR13
LBSR21:
        mvn     r0, #7
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LBSR22:
        mvn     r0, #5
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


