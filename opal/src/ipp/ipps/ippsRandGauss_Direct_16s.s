        .text
        .align  4
        .globl  _ippsRandGauss_Direct_16s


_ippsRandGauss_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r9, [sp, #0x74]
        cmp     r0, #0
        str     r0, [sp, #8]
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r3, [sp, #0x2C]
        beq     LAZU11
        cmp     r9, #0
        beq     LAZU11
        ldr     r0, [sp, #0x24]
        cmp     r0, #0
        ble     LAZU12
        ldr     r1, [pc, #0x4D4]
        ldr     r4, [r9]
        ldr     r0, [pc, #0x4D0]
        ldr     r6, [pc, #0x4D0]
        mvn     r11, #0
        mul     r2, r4, r1
        str     r9, [sp, #4]
        add     r10, r2, r0
        mul     r1, r10, r1
        add     r1, r1, r0
        str     r1, [sp]
LAZU0:
        ldr     r1, [sp]
        ldr     r3, [pc, #0x4A4]
        sub     r1, r10, r1
        add     r1, r11, r1
        sub     r10, r4, r10
        mul     r6, r6, r3
        mov     r2, r1, asr #31
        add     r12, r10, r2
        and     lr, r2, #0x12
        mov     r11, r12, asr #31
        add     r2, r6, r0
        mul     r3, r2, r3
        str     r4, [sp]
        and     r4, r11, #0x12
        add     r6, r3, r0
        sub     r10, r1, lr
        sub     r4, r12, r4
        add     r3, r6, r4
        add     r2, r2, r10
        mov     lr, r3, asr #31
        mov     r5, r3, lsr #23
        mov     r1, r2, asr #31
        mov     r12, r2, lsr #23
        orr     lr, r5, lr, lsl #9
        orr     r1, r12, r1, lsl #9
        mov     r12, r3, lsl #9
        mov     r5, lr, lsl #22
        mov     r2, r2, lsl #9
        orr     r8, r5, r12, lsr #10
        umull   r12, r5, r8, r8
        mov     r3, r1, lsl #22
        orr     r3, r3, r2, lsr #10
        mov     r7, lr, asr #10
        mla     r5, r8, r7, r5
        str     r12, [sp, #0x3C]
        umull   r2, r12, r3, r3
        mov     r1, r1, asr #10
        mla     r12, r3, r1, r12
        mla     lr, r7, r8, r5
        mla     r12, r1, r3, r12
        mov     r9, lr, lsl #2
        mov     lr, lr, asr #30
        mov     r5, r12, lsl #2
        orr     r2, r5, r2, lsr #30
        ldr     r5, [sp, #0x3C]
        orr     r5, r9, r5, lsr #30
        adds    r2, r2, r5
        adc     r12, lr, r12, asr #30
        cmp     r2, #1, 2
        sbcs    lr, r12, #0
        bge     LAZU0
        orrs    lr, r2, r12
        beq     LAZU0
        ldr     r9, [sp, #4]
        str     r1, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x48]
        str     r12, [sp, #0x4C]
        str     r2, [sp, #0x44]
        mov     r12, r12, lsl #26
        orr     r2, r12, r2, lsr #6
        str     r2, [sp, #0x40]
        add     r0, sp, #0x44
        mvn     r2, #0x17
        mov     r1, #1
        bl      _ippsLn_32s_ISfs
        ldr     r12, [sp, #0x44]
        ldr     r2, [pc, #0x3A8]
        add     r1, sp, #0x44
        add     r0, sp, #0x40
        sub     r12, r12, r2
        str     r12, [sp, #0x44]
        mov     r2, #1
        mvn     r3, #0xD
        bl      _ippsDiv_32s_ISfs
        ldr     r2, [sp, #0x44]
        mvn     r1, #1
        add     r0, sp, #0x48
        smull   r3, lr, r1, r2
        mov     r2, #0
        mov     r1, #1
        str     r3, [sp, #0x48]
        str     lr, [sp, #0x4C]
        bl      _ippsSqrt_64s_ISfs
        ldr     r0, [sp, #0x24]
        cmp     r0, #1
        ble     LAZU5
        mvn     r0, #0xFF
        bic     r2, r0, #0x7F, 24
        ldr     r0, [sp, #0x2C]
        mvn     r1, #0xF
        str     r6, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r4, [sp, #0x20]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r10, [sp, #8]
        mvn     r5, r2
        mov     r0, r0, asr #31
        mov     r1, r1, lsl #11
        mvn     r2, #1
        str     r9, [sp, #4]
        str     r2, [sp, #0x3C]
        str     r0, [sp, #0x30]
        str     r11, [sp, #0x14]
        mov     r9, r1
LAZU1:
        ldr     lr, [sp, #0x48]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x4C]
        ldr     r12, [sp, #0x30]
        umull   r1, r0, lr, r2
        mla     lr, lr, r12, r0
        umull   r0, r12, r8, r1
        mla     r2, r3, r2, lr
        mla     r12, r8, r2, r12
        mla     r7, r7, r1, r12
        tst     r7, r7
        bmi     LAZU10
        adds    r0, r0, #0
        adc     r7, r7, #0x10
LAZU2:
        umull   r3, r0, r6, r1
        mla     r2, r6, r2, r0
        ldr     r0, [sp, #0x28]
        mla     r2, r4, r1, r2
        add     r0, r0, r7, asr #5
        tst     r2, r2
        bmi     LAZU9
        adds    r3, r3, #0
        adc     r3, r2, #0x10
LAZU3:
        cmp     r0, r5
        mov     r2, r5
        movlt   r2, r0
        ldr     r0, [sp, #0x28]
        add     r3, r0, r3, asr #5
        cmp     r3, r5
        mov     r0, r5
        movlt   r0, r3
        cmp     r2, r9
        mov     r3, r9
        movgt   r3, r2
        cmp     r0, r9
        mov     r2, r9
        movgt   r2, r0
        strh    r3, [r10]
        strh    r2, [r10, #2]
        ldr     r12, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        ldr     lr, [sp]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        str     r5, [sp, #0x38]
        str     r9, [sp, #0x34]
        str     r10, [sp, #8]
LAZU4:
        ldr     r6, [pc, #0x244]
        ldr     r5, [pc, #0x244]
        sub     r1, r2, lr
        mul     lr, r0, r6
        add     r1, r12, r1
        sub     r2, r3, r2
        mov     r0, r1, asr #31
        add     r2, r2, r0
        add     r4, lr, r5
        mul     r6, r4, r6
        mov     r12, r2, asr #31
        mov     lr, r3
        and     r3, r12, #0x12
        and     r7, r0, #0x12
        sub     r3, r2, r3
        add     r0, r6, r5
        sub     r2, r1, r7
        add     r5, r0, r3
        add     r1, r4, r2
        mov     r7, r5, lsr #23
        mov     r8, r5, asr #31
        mov     r4, r1, lsr #23
        mov     r6, r1, asr #31
        orr     r7, r7, r8, lsl #9
        mov     r8, r5, lsl #9
        orr     r4, r4, r6, lsl #9
        mov     r9, r7, lsl #22
        mov     r5, r1, lsl #9
        mov     r6, r4, lsl #22
        orr     r8, r9, r8, lsr #10
        umull   r1, r10, r8, r8
        orr     r6, r6, r5, lsr #10
        umull   r5, r9, r6, r6
        mov     r4, r4, asr #10
        mla     r9, r6, r4, r9
        mov     r7, r7, asr #10
        mla     r10, r8, r7, r10
        mla     r9, r4, r6, r9
        mla     r10, r7, r8, r10
        mov     r11, r9, lsl #2
        orr     r5, r11, r5, lsr #30
        mov     r11, r10, lsl #2
        orr     r1, r11, r1, lsr #30
        adds    r1, r5, r1
        mov     r10, r10, asr #30
        adc     r11, r10, r9, asr #30
        cmp     r1, #1, 2
        sbcs    r5, r11, #0
        bge     LAZU4
        orrs    r5, r1, r11
        beq     LAZU4
        ldr     r5, [sp, #0x38]
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #8]
        str     r0, [sp, #0x18]
        str     r2, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     lr, [sp]
        str     r3, [sp, #0x20]
        str     r1, [sp, #0x48]
        str     r1, [sp, #0x44]
        str     r11, [sp, #0x4C]
        mov     r11, r11, lsl #26
        orr     r1, r11, r1, lsr #6
        str     r1, [sp, #0x40]
        add     r0, sp, #0x44
        mvn     r2, #0x17
        mov     r1, #1
        bl      _ippsLn_32s_ISfs
        ldr     r2, [sp, #0x44]
        ldr     r12, [pc, #0x138]
        add     r1, sp, #0x44
        add     r0, sp, #0x40
        sub     r12, r2, r12
        str     r12, [sp, #0x44]
        mov     r2, #1
        mvn     r3, #0xD
        bl      _ippsDiv_32s_ISfs
        ldr     r3, [sp, #0x3C]
        ldr     r2, [sp, #0x44]
        add     r0, sp, #0x48
        mov     r1, #1
        smull   r3, lr, r3, r2
        mov     r2, #0
        add     r10, r10, #4
        str     r3, [sp, #0x48]
        str     lr, [sp, #0x4C]
        bl      _ippsSqrt_64s_ISfs
        ldr     r0, [sp, #0x24]
        sub     r0, r0, #2
        cmp     r0, #1
        str     r0, [sp, #0x24]
        bgt     LAZU1
        ldr     r4, [sp, #0x20]
        ldr     r9, [sp, #4]
        str     r10, [sp, #8]
LAZU5:
        ldr     r0, [sp, #0x24]
        cmp     r0, #0
        beq     LAZU7
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x48]
        ldr     r2, [sp, #0x4C]
        mvn     r1, #0xF
        mov     lr, r3, asr #31
        umull   r0, r5, r12, r3
        mla     r5, r12, lr, r5
        mla     r3, r2, r3, r5
        umull   r2, r12, r0, r8
        mla     r12, r0, r7, r12
        mla     r12, r3, r8, r12
        tst     r12, r12
        bmi     LAZU8
        adds    r2, r2, #0
        adc     r12, r12, #0x10
LAZU6:
        ldr     r0, [sp, #0x28]
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
        add     r0, r0, r12, asr #5
        cmp     r0, r2
        movlt   r2, r0
        ldr     r0, [sp, #8]
        mov     r1, r1, lsl #11
        cmp     r2, r1
        movgt   r1, r2
        strh    r1, [r0]
LAZU7:
        mov     r0, #0
        str     r4, [r9]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAZU8:
        adds    r2, r2, #0
        adc     r12, r12, r1
        b       LAZU6
LAZU9:
        adds    r3, r3, #0
        mvn     r3, #0xF
        adc     r3, r2, r3
        b       LAZU3
LAZU10:
        adds    r0, r0, #0
        mvn     r0, #0xF
        adc     r7, r7, r0
        b       LAZU2
LAZU11:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LAZU12:
        mvn     r0, #5
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9
        .long   0x14cb5ecf


