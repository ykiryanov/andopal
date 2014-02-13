        .text
        .align  4
        .globl  _ippsGoertz_16s_Sfs


_ippsGoertz_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r8, [sp, #0x5C]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        mov     r0, r3
        beq     LBSO15
        cmp     r6, #0
        beq     LBSO15
        cmp     r4, #0
        ble     LBSO16
        bl      __extendsfdf2
        mov     r7, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSO7
        mov     r0, r7
        mov     r3, #0x16, 12
        orr     r9, r3, #1, 2
        sub     r3, r9, #0x17, 12
        mov     r1, r10
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSO7
        ldr     r2, [pc, #0x5C4]
        ldr     r3, [pc, #0x5C4]
        mov     r1, r10
        mov     r0, r7
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        bl      sin
        mov     r3, r9
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        str     r1, [sp, #8]
        mov     r7, r0
        mov     r1, r11
        mov     r0, r10
        bl      cos
        mov     r3, r9
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfdi
        mov     r3, #0
        umull   lr, r9, r3, r7
        umull   r11, r10, r3, r0
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r12, r4, lsl #1
        sub     r3, r5, #2
        ldrsh   r2, [r3, +r12]
        subs    r12, r11, lr
        sbc     r3, r10, r9
        mov     r0, r2, asr #31
        mov     r1, r2, lsr #9
        adds    r11, r11, r2, lsl #23
        orr     r0, r1, r0, lsl #23
        adc     r10, r0, r10
        adds    lr, r11, lr
        adc     r9, r10, r9
        subs    r4, r4, #2
        bmi     LBSO3
        cmp     r4, #5
        blt     LBSO1
        str     r8, [sp]
        ldr     r8, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #8]
        add     r1, r5, r4, lsl #1
        str     r1, [sp, #0x1C]
        str     r4, [sp, #0x18]
        str     r6, [sp, #4]
        str     r5, [sp, #0x14]
LBSO0:
        umull   r5, r2, r7, lr
        umull   r6, r0, r7, r12
        mla     r2, r7, r9, r2
        umull   r4, r1, r10, r12
        mla     r1, r10, r3, r1
        str     r6, [sp, #0x20]
        str     r0, [sp, #0x24]
        umull   r6, r0, r10, lr
        mla     r2, r11, lr, r2
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x28]
        mla     r1, r8, r12, r1
        mla     r9, r10, r9, r0
        ldr     r0, [sp, #0x24]
        mla     r3, r7, r3, r0
        ldr     r0, [sp, #0x1C]
        mla     r9, r8, lr, r9
        ldr     lr, [sp, #0x1C]
        ldrsh   r0, [r0]
        mla     r3, r11, r12, r3
        mov     r12, r1, lsl #9
        orr     r4, r12, r4, lsr #23
        str     r0, [sp, #0x28]
        ldrsh   lr, [lr, #-2]
        str     lr, [sp, #0x24]
        mov     lr, r2, lsl #9
        orr     r5, lr, r5, lsr #23
        subs    lr, r4, r5
        umull   r12, r5, r10, lr
        umull   r0, r4, r7, lr
        mov     r2, r2, asr #23
        rsc     r2, r2, r1, asr #23
        mla     r1, r10, r2, r5
        mla     r4, r7, r2, r4
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x1C]
        mov     r5, r9, lsl #9
        mla     r1, r8, lr, r1
        mla     lr, r11, lr, r4
        ldr     r4, [sp, #0x20]
        ldrsh   r0, [r0, #-4]
        mov     r2, r3, lsl #9
        orr     r6, r5, r6, lsr #23
        ldr     r5, [sp, #0x28]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x1C]
        orr     r4, r2, r4, lsr #23
        mov     r3, r3, asr #23
        adds    r6, r6, r4
        ldrsh   r0, [r0, #-6]
        adc     r9, r3, r9, asr #23
        adds    r2, r6, r5, lsl #23
        umull   r6, r3, r10, r2
        str     r0, [sp, #0x34]
        umull   r4, r0, r7, r2
        str     r6, [sp, #0x20]
        mov     r6, r5, asr #31
        mov     r5, r5, lsr #9
        orr     r6, r5, r6, lsl #23
        adc     r6, r9, r6
        mla     r5, r7, r6, r0
        mla     r3, r10, r6, r3
        mov     r6, r1, lsl #9
        orr     r9, r6, r12, lsr #23
        mla     r5, r11, r2, r5
        mla     r2, r8, r2, r3
        ldr     r3, [sp, #0x2C]
        mov     r12, lr, lsl #9
        orr     r6, r12, r3, lsr #23
        mov     r3, lr, asr #23
        ldr     r12, [sp, #0x24]
        mov     lr, r5, lsl #9
        orr     r4, lr, r4, lsr #23
        subs    r9, r9, r4
        umull   lr, r4, r10, r9
        mov     r5, r5, asr #23
        mov     r12, r12, asr #31
        rsc     r5, r5, r1, asr #23
        mla     r1, r10, r5, r4
        str     lr, [sp, #0x2C]
        umull   r0, lr, r7, r9
        mla     lr, r7, r5, lr
        ldr     r5, [sp, #0x20]
        mla     r1, r8, r9, r1
        str     r0, [sp, #0x28]
        mov     r4, r2, lsl #9
        mla     lr, r11, r9, lr
        orr     r5, r4, r5, lsr #23
        ldr     r4, [sp, #0x24]
        adds    r6, r5, r6
        adc     r3, r3, r2, asr #23
        adds    r2, r6, r4, lsl #23
        umull   r6, r9, r7, r2
        umull   r0, r5, r10, r2
        mov     r4, r4, lsr #9
        orr     r12, r4, r12, lsl #23
        adc     r12, r3, r12
        mla     r4, r7, r12, r9
        mla     r5, r10, r12, r5
        ldr     r12, [sp, #0x2C]
        str     r0, [sp, #0x20]
        mla     r4, r11, r2, r4
        mla     r2, r8, r2, r5
        ldr     r5, [sp, #0x28]
        mov     r3, r1, lsl #9
        orr     r12, r3, r12, lsr #23
        mov     r3, lr, lsl #9
        orr     r5, r3, r5, lsr #23
        mov     r3, lr, asr #23
        ldr     lr, [sp, #0x30]
        mov     lr, lr, asr #31
        str     lr, [sp, #0x2C]
        mov     lr, r4, lsl #9
        orr     r6, lr, r6, lsr #23
        subs    lr, r12, r6
        umull   r12, r9, r10, lr
        umull   r0, r6, r7, lr
        mov     r4, r4, asr #23
        rsc     r4, r4, r1, asr #23
        mla     r1, r10, r4, r9
        mla     r6, r7, r4, r6
        ldr     r9, [sp, #0x20]
        str     r0, [sp, #0x28]
        mov     r4, r2, lsl #9
        mla     r1, r8, lr, r1
        mla     lr, r11, lr, r6
        ldr     r6, [sp, #0x30]
        orr     r9, r4, r9, lsr #23
        adds    r5, r9, r5
        adc     r2, r3, r2, asr #23
        adds    r4, r5, r6, lsl #23
        umull   r0, r5, r10, r4
        umull   r3, r9, r7, r4
        mov     r6, r6, lsr #9
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        orr     r0, r6, r0, lsl #23
        adc     r0, r2, r0
        mla     r2, r7, r0, r9
        mla     r5, r10, r0, r5
        mov     r6, r1, lsl #9
        orr     r12, r6, r12, lsr #23
        mla     r2, r11, r4, r2
        mla     r6, r8, r4, r5
        ldr     r4, [sp, #0x28]
        mov     r9, lr, lsl #9
        mov     lr, lr, asr #23
        orr     r5, r9, r4, lsr #23
        ldr     r4, [sp, #0x34]
        mov     r9, r2, lsl #9
        orr     r3, r9, r3, lsr #23
        subs    r12, r12, r3
        mov     r3, r2, asr #23
        rsc     r3, r3, r1, asr #23
        ldr     r1, [sp, #0x24]
        mov     r2, r6, lsl #9
        mov     r4, r4, asr #31
        orr     r1, r2, r1, lsr #23
        ldr     r2, [sp, #0x34]
        adds    r5, r1, r5
        adc     r6, lr, r6, asr #23
        mov     r1, r2, lsr #9
        adds    lr, r5, r2, lsl #23
        ldr     r2, [sp, #0x18]
        orr     r4, r1, r4, lsl #23
        adc     r9, r6, r4
        sub     r2, r2, #4
        str     r2, [sp, #0x18]
        ldr     r1, [sp, #0x18]
        cmp     r1, #5
        ldr     r1, [sp, #0x1C]
        sub     r1, r1, #8
        str     r1, [sp, #0x1C]
        bge     LBSO0
        ldr     r4, [sp, #0x18]
        ldr     r8, [sp]
        ldr     r6, [sp, #4]
        ldr     r5, [sp, #0x14]
LBSO1:
        str     r8, [sp]
        str     r6, [sp, #4]
        ldr     r6, [sp, #0xC]
        ldr     r8, [sp, #8]
        add     r5, r5, r4, lsl #1
LBSO2:
        umull   r11, r0, r6, lr
        umull   r1, r10, r7, lr
        str     r0, [sp, #0x30]
        mla     r10, r7, r9, r10
        str     r11, [sp, #0x2C]
        umull   r0, r11, r7, r12
        mla     r11, r7, r3, r11
        str     r1, [sp, #0x34]
        umull   r2, r1, r6, r12
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        mla     r1, r6, r3, r1
        mla     r3, r8, lr, r10
        mla     r9, r6, r9, r0
        ldr     r0, [sp, #0x10]
        mla     r11, r8, r12, r11
        ldrsh   r10, [r5], #-2
        mla     r1, r0, r12, r1
        mla     r9, r0, lr, r9
        ldr     r12, [sp, #0x34]
        mov     lr, r3, lsl #9
        mov     r3, r3, asr #23
        orr     r12, lr, r12, lsr #23
        mov     lr, r1, lsl #9
        orr     r2, lr, r2, lsr #23
        subs    r12, r2, r12
        mov     r2, r9, lsl #9
        rsc     r3, r3, r1, asr #23
        ldr     r1, [sp, #0x2C]
        mov     lr, r11, lsl #9
        mov     r11, r11, asr #23
        orr     r2, r2, r1, lsr #23
        ldr     r1, [sp, #0x28]
        orr     r1, lr, r1, lsr #23
        adds    r1, r2, r1
        adc     r9, r11, r9, asr #23
        mov     r2, r10, asr #31
        mov     r11, r10, lsr #9
        adds    lr, r1, r10, lsl #23
        orr     r2, r11, r2, lsl #23
        adc     r9, r9, r2
        subs    r4, r4, #1
        bpl     LBSO2
        ldr     r8, [sp]
        ldr     r6, [sp, #4]
LBSO3:
        cmp     r8, #0
        mov     r0, #1
        blt     LBSO10
        add     r1, r8, #0x16
        tst     r9, r9
        mov     r4, r0, lsl r1
        bmi     LBSO9
        adds    r0, r4, lr
        adc     r1, r9, r4, asr #31
LBSO4:
        tst     r3, r3
        bmi     LBSO8
        adds    r7, r12, r4
        adc     r9, r3, r4, asr #31
LBSO5:
        add     r8, r8, #0x17
        mov     r10, r8, asr #31
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
LBSO6:
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
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBSO7:
        mvn     r0, #0x1A
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBSO8:
        subs    r7, r12, r4
        sbc     r9, r3, r4, asr #31
        b       LBSO5
LBSO9:
        subs    r0, lr, r4
        sbc     r1, r9, r4, asr #31
        b       LBSO4
LBSO10:
        mov     r1, #0x16
        rsb     r4, r8, #0
        subs    r1, r1, r4
        tst     r9, r9
        mov     r5, r0, lsl r1
        bmi     LBSO14
        adds    r0, r5, lr
        adc     r1, r9, r5, asr #31
LBSO11:
        tst     r3, r3
        bmi     LBSO13
        adds    r7, r12, r5
        adc     r9, r3, r5, asr #31
LBSO12:
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
        b       LBSO6
LBSO13:
        subs    r7, r12, r5
        sbc     r9, r3, r5, asr #31
        b       LBSO12
LBSO14:
        subs    r0, lr, r5
        sbc     r1, r9, r5, asr #31
        b       LBSO11
LBSO15:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBSO16:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


