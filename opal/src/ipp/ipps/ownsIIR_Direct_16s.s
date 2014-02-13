        .text
        .align  4
        .globl  ownsIIR_Direct_16s


ownsIIR_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     lr, [sp, #0x94]
        ldr     r7, [sp, #0x98]
        mov     r12, lr, lsl #1
        mvn     r8, #0xFF
        add     r6, r3, r12
        bic     r10, r8, #0x7F, 24
        cmp     lr, #0
        mov     r4, r0
        mov     r5, r1
        add     r6, r6, #4
        mvn     r9, #0
        add     r8, r3, #2
        beq     LCII7
        cmp     r2, #0
        ble     LCII11
        mvn     r10, r10
        str     r10, [sp, #8]
        mov     r10, lr, lsl #2
        mov     r11, #0
        sub     r0, lr, #1
        str     r11, [sp, #0x18]
        sub     r10, r10, #4
        sub     r1, r12, #2
        add     r11, r7, #4
        sub     lr, lr, #6
        str     r4, [sp, #0x44]
        str     lr, [sp, #0x48]
        str     r11, [sp, #0x60]
        str     r10, [sp, #0x40]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x38]
        str     r6, [sp, #0x5C]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r5, [sp, #0x34]
        str     r9, [sp, #0x14]
LCII0:
        ldr     r1, [sp, #0xC]
        ldr     r10, [sp, #0x44]
        ldr     r0, [r7]
        ldrsh   r4, [r8, +r1]
        ldr     r1, [sp]
        ldrsh   r5, [r10], #2
        mov     r11, r4, asr #31
        str     r5, [sp, #0x24]
        ldrsh   r6, [r1]
        bl      __fixsfdi
        sub     r12, r4, #1
        smull   r5, r6, r6, r5
        mov     r3, #1
        mov     r12, r3, lsl r12
        sub     r3, r12, #1
        adds    r9, r3, r0
        str     r10, [sp, #0x44]
        adc     r10, r1, r3, asr #31
        adds    r0, r0, r5
        adc     r1, r1, r6
        mov     r2, r4
        mov     r3, r11
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r5, r0
        adc     r6, r6, #0
        adds    r0, r9, r0
        adc     r1, r10, r6
        mov     r2, r4
        mov     r3, r11
        bl      __ashrdi3
        ldr     r2, [sp, #0x3C]
        mov     r6, r0
        mov     r5, r1
        cmp     r2, #0
        ble     LCII4
        ldr     r2, [sp, #0x3C]
        cmp     r2, #5
        blt     LCII12
        ldr     r12, [sp, #0x5C]
        ldr     lr, [sp, #0x60]
        mov     r9, r7
        rsbs    r2, r6, #0
        str     r9, [sp, #0x4C]
        ldr     r9, [sp, #0x24]
        rsc     r1, r5, #0
        mov     r0, #0
        mov     r3, r8
        str     r5, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     lr, [sp, #0x50]
        str     r12, [sp, #0x54]
        str     r3, [sp, #0x58]
        str     r8, [sp, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
LCII1:
        ldr     lr, [sp, #0x50]
        ldr     r3, [sp, #0x54]
        ldr     r12, [sp, #0x58]
        ldr     r0, [lr]
        add     r10, r4, #1
        ldrsh   r3, [r3]
        ldrsh   r12, [r12]
        umull   r8, lr, r6, r3
        str     r8, [sp, #0x64]
        mov     r8, r3, asr #31
        mla     lr, r6, r8, lr
        smull   r12, r8, r9, r12
        mla     r11, r5, r3, lr
        str     r12, [sp, #0x68]
        bl      __fixsfdi
        ldr     r3, [sp, #0x68]
        ldr     r12, [sp, #0x64]
        adds    r3, r3, r12
        ldr     r12, [sp, #0x58]
        adc     r11, r8, r11
        adds    r0, r3, r0
        adc     r1, r11, r1
        add     r12, r12, #8
        str     r12, [sp, #0x58]
        bl      __floatdisf
        ldr     r3, [sp, #0x4C]
        str     r0, [r3]
        ldr     r3, [sp, #0x60]
        ldr     r12, [sp, #4]
        ldr     r0, [r3, +r10, lsl #2]
        mov     r3, r10, lsl #1
        ldrsh   r8, [r12, +r3]
        ldr     r12, [sp, #0x5C]
        ldrsh   r11, [r12, +r3]
        bl      __fixsfdi
        smull   r8, r3, r9, r8
        umull   r2, r12, r6, r11
        mov     lr, r11, asr #31
        mla     r12, r6, lr, r12
        ldr     lr, [sp, #0x54]
        adds    r2, r8, r2
        add     r8, r4, #2
        add     lr, lr, #8
        mla     r12, r5, r11, r12
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x50]
        mov     r11, r8, lsl #1
        add     lr, lr, #0x10
        str     lr, [sp, #0x50]
        ldr     lr, [sp, #0x4C]
        adc     r12, r3, r12
        adds    r0, r2, r0
        add     lr, lr, #0x10
        str     lr, [sp, #0x4C]
        adc     r1, r12, r1
        bl      __floatdisf
        str     r0, [r7, +r10, lsl #2]
        ldr     r3, [sp, #0x5C]
        ldrsh   r10, [r3, +r11]
        ldr     r3, [sp, #0x60]
        ldr     r0, [r3, +r8, lsl #2]
        ldr     r3, [sp, #4]
        mov     r12, r10, asr #31
        ldrsh   r3, [r3, +r11]
        umull   r11, lr, r6, r10
        mla     lr, r6, r12, lr
        smull   r3, r12, r9, r3
        str     r12, [sp, #0x6C]
        str     lr, [sp, #0x68]
        str     r3, [sp, #0x64]
        bl      __fixsfdi
        ldr     r3, [sp, #0x68]
        mla     r2, r5, r10, r3
        ldr     r3, [sp, #0x64]
        add     r10, r4, #3
        add     r4, r4, #4
        adds    r11, r3, r11
        ldr     r3, [sp, #0x6C]
        adc     r2, r3, r2
        adds    r0, r11, r0
        adc     r1, r2, r1
        bl      __floatdisf
        str     r0, [r7, +r8, lsl #2]
        ldr     r3, [sp, #0x60]
        ldr     r12, [sp, #0x5C]
        ldr     r0, [r3, +r10, lsl #2]
        mov     r3, r10, lsl #1
        ldrsh   r8, [r12, +r3]
        ldr     r12, [sp, #4]
        ldrsh   r11, [r12, +r3]
        bl      __fixsfdi
        umull   r2, r3, r6, r8
        mov     lr, r8, asr #31
        mla     r3, r6, lr, r3
        smull   r11, r12, r9, r11
        mla     r3, r5, r8, r3
        adds    r2, r11, r2
        adc     r3, r12, r3
        adds    r0, r2, r0
        adc     r1, r3, r1
        bl      __floatdisf
        ldr     r3, [sp, #0x48]
        str     r0, [r7, +r10, lsl #2]
        cmp     r4, r3
        ble     LCII1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r8, [sp, #4]
LCII2:
        ldr     r3, [sp, #0x5C]
        add     r4, r8, r0, lsl #1
        add     r11, r7, r0, lsl #2
        add     r10, r3, r0, lsl #1
        ldr     r3, [sp, #0x60]
        str     r5, [sp, #0x28]
        str     r1, [sp, #0x20]
        str     r2, [sp, #0x1C]
        add     r9, r3, r0, lsl #2
        str     r6, [sp, #0x2C]
        str     r8, [sp, #4]
        str     r7, [sp, #0x30]
        mov     r5, r0
LCII3:
        ldrsh   r6, [r10], #2
        ldr     r12, [sp, #0x1C]
        ldr     r0, [r9], #4
        ldrsh   r1, [r4], #2
        mov     r3, r6, asr #31
        umull   r7, r2, r12, r6
        mla     r2, r12, r3, r2
        str     r2, [sp, #0x6C]
        ldr     r2, [sp, #0x24]
        add     r5, r5, #1
        smull   r1, r8, r2, r1
        str     r1, [sp, #0x68]
        bl      __fixsfdi
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x20]
        mla     r6, r3, r6, r2
        ldr     r2, [sp, #0x68]
        adds    r7, r2, r7
        adc     r6, r8, r6
        adds    r0, r7, r0
        adc     r1, r6, r1
        bl      __floatdisf
        str     r0, [r11], #4
        ldr     r1, [sp, #0x3C]
        cmp     r5, r1
        blt     LCII3
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r8, [sp, #4]
        ldr     r7, [sp, #0x30]
LCII4:
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x38]
        ldrsh   r3, [r3, +r2]
        ldrsh   r12, [r8, +r2]
        rsbs    lr, r3, #0
        umull   r2, r4, lr, r6
        mla     lr, lr, r5, r4
        ldr     r4, [sp, #0x24]
        mov     r3, r3, asr #31
        rsc     r3, r3, #0
        mla     lr, r3, r6, lr
        smull   r4, r12, r12, r4
        adds    r0, r4, r2
        ldr     r2, [sp, #8]
        adc     r1, r12, lr
        subs    r4, r6, r2
        sbcs    r9, r5, #0
        movlt   r4, #0
        movlt   r9, #0
        bl      __floatdisf
        ldr     r2, [sp, #0x40]
        orrs    r9, r4, r9
        str     r0, [r7, +r2]
        beq     LCII5
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r1, r0
        b       LCII6
LCII5:
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r6, r2
        ldr     r2, [sp, #0x14]
        sbcs    r5, r5, r2
        movge   r6, r6, lsl #16
        movge   r1, r6, asr #16
        movlt   r0, #0
        sublt   r1, r0, #2, 18
LCII6:
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0x34]
        add     r0, r0, #1
        str     r0, [sp, #0x18]
        strh    r1, [r2], #2
        ldr     r1, [sp, #0x10]
        str     r2, [sp, #0x34]
        cmp     r0, r1
        blt     LCII0
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LCII7:
        cmp     r2, #0
        ble     LCII11
        mvn     r10, r10
        mov     lr, #0
        mov     r6, #0
        mov     r7, #1
        str     r10, [sp, #8]
        str     r8, [sp, #4]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r9, [sp, #0x14]
LCII8:
        ldr     r3, [sp]
        ldrsh   r2, [r4], #2
        ldrsh   r3, [r3]
        mov     lr, #1
        mul     r9, r3, r2
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #4]
        ldrsh   r7, [r3, +r2]
        mov     r10, r9, asr #31
        mov     r1, r10
        mov     r0, r9
        sub     r12, r7, #1
        mov     r8, r7, asr #31
        mov     r11, lr, lsl r12
        mov     r2, r7
        mov     r3, r8
        bl      __ashrdi3
        sub     r11, r11, #1
        adds    r9, r9, r11
        and     r0, r0, #1
        adc     r11, r10, r11, asr #31
        adds    r0, r9, r0
        adc     r1, r11, #0
        mov     r2, r7
        mov     r3, r8
        bl      __ashrdi3
        ldr     r2, [sp, #8]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LCII9
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r0, r2
        ldr     r2, [sp, #0x14]
        sbcs    r1, r1, r2
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r2, #0xFF
        biclt   r0, r2, #0x7F, 24
        b       LCII10
LCII9:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     r0, r2
LCII10:
        strh    r0, [r5], #2
        ldr     r2, [sp, #0x10]
        add     r6, r6, #1
        cmp     r6, r2
        blt     LCII8
LCII11:
        mov     r0, #0
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LCII12:
        rsbs    r2, r6, #0
        mov     r0, #0
        rsc     r1, r5, #0
        b       LCII2


