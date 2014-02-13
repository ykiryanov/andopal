        .text
        .align  4
        .globl  ownsIIROne_Direct_16s


ownsIIROne_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        mov     r8, r3
        ldr     r7, [sp, #0x78]
        mov     r5, r8, lsl #1
        str     r5, [sp, #0x2C]
        add     r11, r2, #2
        ldrsh   r4, [r11, +r5]
        ldrsh   r12, [r2]
        add     r5, r2, r5
        str     r0, [sp, #4]
        add     r0, r5, #4
        str     r0, [sp, #0x44]
        sub     r0, r4, #1
        mov     lr, #1
        mov     r0, lr, lsl r0
        cmp     r8, #0
        str     r1, [sp, #0x28]
        sub     r9, r0, #1
        mov     r5, r4, asr #31
        beq     LCIK5
        ldr     r1, [sp, #4]
        ldr     r0, [r7]
        smull   r10, r6, r12, r1
        bl      __fixsfdi
        adds    r12, r9, r0
        adc     r9, r1, r9, asr #31
        adds    r0, r0, r10
        adc     r1, r1, r6
        str     r12, [sp, #0x40]
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r10, r10, r0
        ldr     r0, [sp, #0x40]
        adc     r6, r6, #0
        mov     r2, r4
        adds    r0, r0, r10
        adc     r1, r9, r6
        mov     r3, r5
        bl      __ashrdi3
        sub     r2, r8, #1
        cmp     r2, #0
        mov     r5, r0
        mov     r4, r1
        mov     r6, #0
        ble     LCIK8
        sub     r12, r8, #1
        cmp     r12, #5
        blt     LCIK7
        rsbs    r0, r5, #0
        ldr     r10, [sp, #0x44]
        sub     r9, r8, #6
        rsc     lr, r4, #0
        str     lr, [sp, #0xC]
        str     r9, [sp, #0x30]
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #4]
        add     r12, r7, #4
        str     r5, [sp, #0x18]
        mov     lr, r11
        mov     r1, r12
        mov     r3, r7
        str     r4, [sp, #0x14]
        mov     r5, r6
        str     r12, [sp, #0x10]
        str     r3, [sp, #0x34]
        str     r1, [sp, #0x38]
        str     r10, [sp, #0x3C]
        str     lr, [sp, #0x40]
        str     r2, [sp, #8]
        str     r11, [sp, #0x1C]
        mov     r4, r0
        mov     r6, r7
LCIK0:
        ldr     r1, [sp, #0x3C]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x38]
        ldrsh   r1, [r1]
        add     r10, r5, #1
        ldr     r0, [r3]
        ldrsh   r2, [r2]
        umull   r12, r3, r4, r1
        smull   r2, r11, r9, r2
        str     r12, [sp, #0x48]
        mov     r12, r1, asr #31
        mla     r3, r4, r12, r3
        str     r2, [sp, #0x4C]
        mla     r7, r8, r1, r3
        bl      __fixsfdi
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x48]
        adds    r2, r2, r3
        ldr     r3, [sp, #0x40]
        adc     r7, r11, r7
        adds    r0, r2, r0
        adc     r1, r7, r1
        add     r3, r3, #8
        str     r3, [sp, #0x40]
        bl      __floatdisf
        ldr     r1, [sp, #0x34]
        str     r0, [r1]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0x1C]
        ldr     r0, [r1, +r10, lsl #2]
        mov     r1, r10, lsl #1
        ldrsh   r7, [r2, +r1]
        ldr     r2, [sp, #0x44]
        ldrsh   r11, [r2, +r1]
        bl      __fixsfdi
        smull   r7, r3, r9, r7
        umull   r2, r12, r4, r11
        mov     lr, r11, asr #31
        mla     r12, r4, lr, r12
        ldr     lr, [sp, #0x3C]
        adds    r2, r7, r2
        add     lr, lr, #8
        mla     r12, r8, r11, r12
        str     lr, [sp, #0x3C]
        ldr     lr, [sp, #0x38]
        add     r7, r5, #2
        add     lr, lr, #0x10
        str     lr, [sp, #0x38]
        ldr     lr, [sp, #0x34]
        adc     r12, r3, r12
        adds    r0, r2, r0
        adc     r1, r12, r1
        add     lr, lr, #0x10
        str     lr, [sp, #0x34]
        bl      __floatdisf
        mov     r11, r7, lsl #1
        str     r0, [r6, +r10, lsl #2]
        ldr     r1, [sp, #0x44]
        ldrsh   r10, [r1, +r11]
        ldr     r1, [sp, #0x10]
        ldr     r0, [r1, +r7, lsl #2]
        ldr     r1, [sp, #0x1C]
        mov     r2, r10, asr #31
        ldrsh   r1, [r1, +r11]
        umull   r11, r3, r4, r10
        mla     r3, r4, r2, r3
        smull   r1, r2, r9, r1
        str     r2, [sp, #0x50]
        str     r3, [sp, #0x4C]
        str     r1, [sp, #0x48]
        bl      __fixsfdi
        ldr     r3, [sp, #0x48]
        ldr     r2, [sp, #0x4C]
        mla     r2, r8, r10, r2
        adds    r11, r3, r11
        ldr     r3, [sp, #0x50]
        add     r10, r5, #3
        add     r5, r5, #4
        adc     r2, r3, r2
        adds    r0, r11, r0
        adc     r1, r2, r1
        bl      __floatdisf
        str     r0, [r6, +r7, lsl #2]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0x44]
        ldr     r0, [r1, +r10, lsl #2]
        mov     r1, r10, lsl #1
        ldrsh   r7, [r2, +r1]
        ldr     r2, [sp, #0x1C]
        ldrsh   r11, [r2, +r1]
        bl      __fixsfdi
        umull   r2, r3, r4, r7
        mov     lr, r7, asr #31
        mla     r3, r4, lr, r3
        smull   r11, r12, r9, r11
        mla     r3, r8, r7, r3
        adds    r2, r11, r2
        adc     r3, r12, r3
        adds    r0, r2, r0
        adc     r1, r3, r1
        bl      __floatdisf
        ldr     r1, [sp, #0x30]
        str     r0, [r6, +r10, lsl #2]
        cmp     r5, r1
        ble     LCIK0
        mov     r0, r4
        mov     r7, r6
        mov     r6, r5
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #8]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x24]
LCIK1:
        ldr     lr, [sp, #0x44]
        add     r1, r11, r6, lsl #1
        str     r4, [sp, #0x14]
        add     r9, lr, r6, lsl #1
        add     r10, r7, r6, lsl #2
        str     r0, [sp]
        str     r12, [sp, #0x10]
        str     r2, [sp, #8]
        str     r5, [sp, #0x18]
        str     r11, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x24]
        mov     r4, r1
LCIK2:
        ldrsh   r8, [r9], #2
        ldr     lr, [sp]
        ldr     r0, [sp, #0x10]
        ldrsh   r2, [r4], #2
        mov     r12, r8, asr #31
        umull   r11, r3, lr, r8
        mla     r3, lr, r12, r3
        ldr     r0, [r0, +r6, lsl #2]
        str     r3, [sp, #0x50]
        ldr     r3, [sp, #4]
        add     r6, r6, #1
        smull   r7, r5, r3, r2
        bl      __fixsfdi
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x50]
        adds    r11, r7, r11
        mla     r8, r3, r8, r2
        adc     r8, r5, r8
        adds    r0, r11, r0
        adc     r1, r8, r1
        bl      __floatdisf
        str     r0, [r10], #4
        ldr     r0, [sp, #8]
        cmp     r6, r0
        blt     LCIK2
        ldr     r0, [sp]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x24]
LCIK3:
        ldr     r12, [sp, #0x2C]
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #4]
        sub     r12, r12, #2
        mov     r6, r6, lsl #1
        ldrsh   r2, [r2, +r6]
        ldrsh   r11, [r11, +r12]
        mov     r8, r8, lsl #2
        sub     r8, r8, #4
        umull   lr, r12, r0, r2
        smull   r11, r3, r11, r3
        mov     r9, r2, asr #31
        mla     r12, r0, r9, r12
        adds    r0, r11, lr
        ldr     lr, [sp, #0xC]
        mla     r12, lr, r2, r12
        mvn     r2, #0xFF
        bic     r9, r2, #0x7F, 24
        mvn     r2, r9
        adc     r1, r3, r12
        subs    r10, r5, r2
        sbcs    r11, r4, #0
        movlt   r10, #0
        movlt   r11, #0
        bl      __floatdisf
        orrs    r11, r10, r11
        str     r0, [r7, +r8]
        mvnne   r9, r9
        bne     LCIK4
        mov     r2, #0
        sub     r3, r2, #2, 18
        cmp     r5, r3
        mvn     r3, #0
        sbcs    r4, r4, r3
        movge   r5, r5, lsl #16
        movge   r9, r5, asr #16
        sublt   r9, r2, #2, 18
LCIK4:
        ldr     r0, [sp, #0x28]
        strh    r9, [r0]
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCIK5:
        ldr     r0, [sp, #4]
        mov     r7, #0
        mov     r2, r4
        mul     r0, r0, r12
        mov     r3, r5
        mov     r1, r0, asr #31
        adds    r6, r0, r9
        adc     r9, r1, r9, asr #31
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r9, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r3, r2
        subs    r3, r0, r3
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        subne   r7, r7, #2, 18
        mvnne   r2, r7
        bne     LCIK6
        sub     r7, r7, #2, 18
        cmp     r0, r7
        mvn     r3, #0
        sbcs    r1, r1, r3
        movge   r0, r0, lsl #16
        movge   r2, r0, asr #16
LCIK6:
        ldr     r0, [sp, #0x28]
        strh    r2, [r0]
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LCIK7:
        rsbs    r0, r5, #0
        rsc     r12, r4, #0
        str     r12, [sp, #0xC]
        add     r12, r7, #4
        b       LCIK1
LCIK8:
        rsbs    r0, r5, #0
        rsc     r2, r4, #0
        str     r2, [sp, #0xC]
        b       LCIK3


