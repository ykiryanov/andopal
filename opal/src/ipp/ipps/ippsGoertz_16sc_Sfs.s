        .text
        .align  4
        .globl  _ippsGoertz_16sc_Sfs


_ippsGoertz_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r7, [sp, #0x64]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r0, r3
        beq     LBSN15
        cmp     r6, #0
        beq     LBSN15
        cmp     r4, #0
        ble     LBSN16
        bl      __extendsfdf2
        mov     r10, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSN7
        mov     r0, r10
        mov     r3, #0x16, 12
        orr     r8, r3, #1, 2
        sub     r3, r8, #0x17, 12
        mov     r1, r9
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSN7
        ldr     r2, [pc, #0x5CC]
        ldr     r3, [pc, #0x5CC]
        mov     r1, r9
        mov     r0, r10
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        bl      sin
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        mov     r9, r0
        str     r1, [sp, #0x14]
        str     r9, [sp, #0x1C]
        mov     r0, r10
        mov     r1, r11
        bl      cos
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        sub     r3, r5, #4
        mov     lr, r4, lsl #2
        str     r1, [sp, #0x18]
        ldrsh   r8, [r3, +lr]
        add     r10, r3, lr
        ldrsh   r3, [r10, #2]
        mov     r12, #0
        umull   r10, lr, r12, r9
        umull   r9, r2, r12, r0
        mov     r12, r3, lsr #9
        mov     r11, r3, asr #31
        rsbs    r3, r10, r3, lsl #23
        mov     r1, r8, asr #31
        orr     r12, r12, r11, lsl #23
        sbc     r12, r12, lr
        adds    r3, r3, r9
        mov     r11, r8, lsr #9
        adc     r12, r12, r2
        adds    r8, r9, r8, lsl #23
        orr     r1, r11, r1, lsl #23
        adc     r2, r1, r2
        adds    r8, r8, r10
        adc     lr, r2, lr
        subs    r4, r4, #2
        bmi     LBSN3
        cmp     r4, #4
        blt     LBSN1
        mov     r1, r4, lsl #2
        add     r1, r1, #2
        add     r1, r1, r5
        str     r1, [sp]
        str     r4, [sp, #4]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r4, [sp, #0x1C]
        str     r7, [sp, #8]
        str     r6, [sp, #0xC]
        str     r5, [sp, #0x10]
LBSN0:
        umull   r5, r7, r0, r3
        mla     r10, r0, r12, r7
        umull   r9, r7, r0, r8
        mla     r7, r0, lr, r7
        str     r5, [sp, #0x20]
        umull   r5, r6, r4, r8
        mla     r6, r4, lr, r6
        mla     lr, r1, r3, r10
        str     r9, [sp, #0x24]
        umull   r11, r9, r4, r3
        mla     r9, r4, r12, r9
        mla     r6, r2, r8, r6
        mla     r8, r1, r8, r7
        ldr     r12, [sp]
        str     r11, [sp, #0x28]
        mla     r7, r2, r3, r9
        ldr     r3, [sp, #0x20]
        ldrsh   r12, [r12]
        mov     r10, lr, lsl #9
        orr     r10, r10, r3, lsr #23
        ldr     r3, [sp]
        mov     r11, r6, lsl #9
        orr     r5, r11, r5, lsr #23
        subs    r9, r10, r5
        ldrsh   r5, [r3, #-2]
        mov     r6, r6, asr #23
        rsc     lr, r6, lr, asr #23
        ldr     r6, [sp]
        str     r5, [sp, #0x20]
        ldrsh   r5, [r3, #-4]
        ldrsh   r3, [r3, #-6]
        mov     r10, r12, lsr #9
        str     r3, [sp, #0x2C]
        ldrsh   r3, [r6, #-8]
        ldrsh   r6, [r6, #-0xA]
        str     r10, [sp, #0x34]
        str     r6, [sp, #0x30]
        mov     r6, r12, asr #31
        adds    r12, r9, r12, lsl #23
        umull   r9, r10, r0, r12
        str     r9, [sp, #0x38]
        umull   r11, r9, r4, r12
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x34]
        orr     r6, r11, r6, lsl #23
        adc     lr, lr, r6
        mla     r6, r0, lr, r10
        mla     r10, r4, lr, r9
        ldr     lr, [sp, #0x24]
        mov     r11, r8, lsl #9
        mov     r9, r7, lsl #9
        mla     r6, r1, r12, r6
        mla     r12, r2, r12, r10
        ldr     r10, [sp, #0x28]
        orr     lr, r11, lr, lsr #23
        ldr     r11, [sp, #0x20]
        mov     r7, r7, asr #23
        orr     r10, r9, r10, lsr #23
        adds    lr, lr, r10
        adc     r8, r7, r8, asr #23
        ldr     r7, [sp, #0x20]
        adds    lr, lr, r7, lsl #23
        umull   r7, r9, r4, lr
        str     r7, [sp, #0x34]
        umull   r10, r7, r0, lr
        str     r10, [sp, #0x28]
        mov     r10, r11, asr #31
        mov     r11, r11, lsr #9
        orr     r10, r11, r10, lsl #23
        adc     r10, r8, r10
        mla     r8, r4, r10, r9
        mla     r10, r0, r10, r7
        ldr     r7, [sp, #0x38]
        mov     r9, r6, lsl #9
        mla     r8, r2, lr, r8
        mla     lr, r1, lr, r10
        orr     r9, r9, r7, lsr #23
        mov     r7, r5, asr #31
        mov     r10, r5, lsr #9
        mov     r11, r8, lsl #9
        orr     r7, r10, r7, lsl #23
        ldr     r10, [sp, #0x34]
        str     r7, [sp, #0x38]
        mov     r8, r8, asr #23
        mov     r7, r12, lsl #9
        orr     r10, r11, r10, lsr #23
        subs    r10, r9, r10
        rsc     r9, r8, r6, asr #23
        adds    r8, r10, r5, lsl #23
        umull   r6, r10, r0, r8
        umull   r11, r5, r4, r8
        mov     r12, r12, asr #23
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        adc     r9, r9, r11
        mla     r11, r0, r9, r10
        mla     r9, r4, r9, r5
        ldr     r5, [sp, #0x28]
        mov     r10, lr, lsl #9
        orr     r5, r10, r5, lsr #23
        ldr     r10, [sp, #0x3C]
        orr     r10, r7, r10, lsr #23
        mla     r7, r1, r8, r11
        mla     r8, r2, r8, r9
        ldr     r9, [sp, #0x2C]
        adds    r10, r5, r10
        adc     r5, r12, lr, asr #23
        adds    r12, r10, r9, lsl #23
        umull   lr, r11, r4, r12
        str     lr, [sp, #0x3C]
        umull   r10, lr, r0, r12
        str     r10, [sp, #0x38]
        mov     r10, r9, asr #31
        mov     r9, r9, lsr #9
        orr     r10, r9, r10, lsl #23
        adc     r9, r5, r10
        mla     r5, r4, r9, r11
        mla     lr, r0, r9, lr
        ldr     r10, [sp, #0x3C]
        mov     r9, r7, lsl #9
        mla     r5, r2, r12, r5
        mla     lr, r1, r12, lr
        orr     r6, r9, r6, lsr #23
        mov     r9, r3, asr #31
        mov     r12, r3, lsr #9
        mov     r11, r5, lsl #9
        orr     r10, r11, r10, lsr #23
        subs    r6, r6, r10
        mov     r5, r5, asr #23
        rsc     r7, r5, r7, asr #23
        adds    r3, r6, r3, lsl #23
        ldr     r6, [sp, #0x38]
        mov     r5, lr, lsl #9
        orr     r12, r12, r9, lsl #23
        mov     r9, r8, lsl #9
        orr     r5, r5, r6, lsr #23
        ldr     r6, [sp, #0x34]
        adc     r12, r7, r12
        mov     r8, r8, asr #23
        orr     r6, r9, r6, lsr #23
        adds    r5, r5, r6
        adc     lr, r8, lr, asr #23
        ldr     r8, [sp, #0x30]
        mov     r6, r8, asr #31
        mov     r7, r8, lsr #9
        orr     r6, r7, r6, lsl #23
        adds    r8, r5, r8, lsl #23
        ldr     r5, [sp, #4]
        adc     lr, lr, r6
        sub     r5, r5, #3
        str     r5, [sp, #4]
        ldr     r5, [sp, #4]
        cmp     r5, #4
        ldr     r5, [sp]
        sub     r5, r5, #0xC
        str     r5, [sp]
        bge     LBSN0
        ldr     r4, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #0xC]
        ldr     r5, [sp, #0x10]
LBSN1:
        mov     r1, r4, lsl #2
        add     r1, r1, #2
        add     r5, r1, r5
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x1C]
        str     r7, [sp, #8]
        str     r6, [sp, #0xC]
LBSN2:
        umull   r6, r7, r2, r8
        mla     r10, r2, lr, r7
        str     r6, [sp, #0x3C]
        umull   r9, r6, r0, r3
        mla     r7, r0, r12, r6
        str     r9, [sp, #0x38]
        umull   r9, r6, r0, r8
        mla     r6, r0, lr, r6
        mla     lr, r1, r8, r10
        ldr     r10, [sp, #0x18]
        str     r9, [sp, #0x34]
        umull   r11, r9, r2, r3
        mla     r9, r2, r12, r9
        mla     r7, r10, r3, r7
        ldr     r10, [sp, #0x18]
        str     r11, [sp, #0x30]
        ldrsh   r12, [r5]
        mov     r11, lr, lsl #9
        mla     r6, r10, r8, r6
        mla     r8, r1, r3, r9
        ldr     r3, [sp, #0x38]
        mov     r10, r7, lsl #9
        mov     lr, lr, asr #23
        mov     r9, r12, asr #31
        orr     r10, r10, r3, lsr #23
        ldr     r3, [sp, #0x3C]
        orr     r3, r11, r3, lsr #23
        subs    r3, r10, r3
        rsc     r7, lr, r7, asr #23
        ldrsh   lr, [r5, #-2]
        mov     r10, r12, lsr #9
        adds    r3, r3, r12, lsl #23
        orr     r12, r10, r9, lsl #23
        mov     r9, r6, lsl #9
        adc     r12, r7, r12
        ldr     r7, [sp, #0x34]
        mov     r10, r8, lsl #9
        mov     r8, r8, asr #23
        sub     r5, r5, #4
        orr     r9, r9, r7, lsr #23
        ldr     r7, [sp, #0x30]
        orr     r7, r10, r7, lsr #23
        adds    r7, r9, r7
        adc     r6, r8, r6, asr #23
        mov     r9, lr, asr #31
        mov     r10, lr, lsr #9
        adds    r8, r7, lr, lsl #23
        orr     r9, r10, r9, lsl #23
        adc     lr, r6, r9
        subs    r4, r4, #1
        bpl     LBSN2
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #0xC]
LBSN3:
        cmp     r7, #0
        mov     r0, #1
        blt     LBSN10
        add     r1, r7, #0x16
        tst     lr, lr
        mov     r4, r0, lsl r1
        bmi     LBSN9
        adds    r0, r4, r8
        adc     r1, lr, r4, asr #31
LBSN4:
        tst     r12, r12
        bmi     LBSN8
        adds    r8, r3, r4
        adc     r9, r12, r4, asr #31
LBSN5:
        add     r7, r7, #0x17
        mov     r10, r7, asr #31
        mov     r2, r7
        mov     r3, r10
        bl      __ashrdi3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r7
        mov     r3, r10
        bl      __ashrdi3
LBSN6:
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        subs    r12, r4, r3
        sbcs    r5, r5, #0
        movlt   r12, #0
        movlt   r5, #0
        orrs    r5, r12, r5
        movne   r4, r3
        subs    r12, r0, r3
        sbcs    r1, r1, #0
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        strh    r4, [r6]
        movne   r0, r3
        strh    r0, [r6, #2]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBSN7:
        mvn     r0, #0x1A
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBSN8:
        subs    r8, r3, r4
        sbc     r9, r12, r4, asr #31
        b       LBSN5
LBSN9:
        subs    r0, r8, r4
        sbc     r1, lr, r4, asr #31
        b       LBSN4
LBSN10:
        mov     r1, #0x16
        rsb     r4, r7, #0
        subs    r1, r1, r4
        tst     lr, lr
        mov     r5, r0, lsl r1
        bmi     LBSN14
        adds    r0, r5, r8
        adc     r1, lr, r5, asr #31
LBSN11:
        tst     r12, r12
        bmi     LBSN13
        adds    r7, r3, r5
        adc     r9, r12, r5, asr #31
LBSN12:
        mov     r3, #0x17
        subs    r8, r3, r4
        mov     r3, #0
        sbc     r10, r3, r4, asr #31
        mov     r2, r8
        mov     r3, r10
        bl      __ashrdi3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r9
        mov     r2, r8
        mov     r3, r10
        bl      __ashrdi3
        b       LBSN6
LBSN13:
        subs    r7, r3, r5
        sbc     r9, r12, r5, asr #31
        b       LBSN12
LBSN14:
        subs    r0, r8, r5
        sbc     r1, lr, r5, asr #31
        b       LBSN11
LBSN15:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBSN16:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


