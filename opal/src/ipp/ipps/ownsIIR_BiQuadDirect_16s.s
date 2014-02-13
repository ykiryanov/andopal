        .text
        .align  4
        .globl  ownsIIR_BiQuadDirect_16s


ownsIIR_BiQuadDirect_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     lr, [sp, #0x7C]
        ldr     r12, [sp, #0x80]
        mov     r5, r2
        cmp     r5, #0
        str     r1, [sp, #0x4C]
        ble     LCIJ5
        mov     r6, #0
        mov     r2, lr, lsl #1
        str     r5, [sp]
        mov     r4, r6
        add     r1, r3, #6
        add     r11, r12, #4
        add     r10, r3, #2
        add     r8, r3, #8
        add     r9, r3, #4
        add     lr, r3, #0xA
        mov     r7, #1
        mov     r5, r6
LCIJ0:
        ldrsh   r7, [r0], #2
        cmp     r2, #0
        mov     r6, r7, asr #31
        ble     LCIJ2
        mov     r4, #0
        str     r1, [sp, #0x18]
        str     r3, [sp, #4]
        str     r10, [sp, #8]
        mov     r5, r8
        str     r9, [sp, #0xC]
        str     lr, [sp, #0x10]
        str     r12, [sp, #0x14]
        str     r11, [sp, #0x1C]
        str     r4, [sp, #0x48]
        str     r0, [sp, #0x40]
        str     lr, [sp, #0x3C]
        str     r9, [sp, #0x38]
        str     r8, [sp, #0x34]
        str     r10, [sp, #0x30]
        str     r11, [sp, #0x2C]
        str     r1, [sp, #0x28]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x24]
        str     r3, [sp, #0x20]
LCIJ1:
        ldr     r0, [sp, #0x18]
        ldrsh   r4, [r0], #0xC
        str     r0, [sp, #0x18]
        cmp     r4, #0
        blt     LCIJ6
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #0x14]
        mov     r8, r4, asr #31
        ldrsh   r12, [r10], #0xC
        sub     r2, r4, #1
        ldr     r0, [r11]
        umull   r9, lr, r7, r12
        mov     r1, r12, asr #31
        mla     r1, r7, r1, lr
        mov     lr, #1
        mov     r2, lr, lsl r2
        mla     r1, r6, r12, r1
        str     r2, [sp, #0x50]
        str     r1, [sp, #0x54]
        bl      __fixsfdi
        ldr     r12, [sp, #0x54]
        adds    r9, r0, r9
        adc     r1, r1, r12
        ldr     r12, [sp, #0x50]
        str     r1, [sp, #0x54]
        mov     r2, r4
        mov     r3, r8
        mov     r0, r9
        sub     r12, r12, #1
        str     r12, [sp, #0x50]
        bl      __ashrdi3
        ldr     r12, [sp, #0x50]
        and     r1, r0, #1
        adds    r1, r12, r1
        mov     r12, r12, asr #31
        adc     r12, r12, #0
        adds    r0, r9, r1
        ldr     r1, [sp, #0x54]
        mov     r2, r4
        adc     r1, r1, r12
        mov     r3, r8
        bl      __ashrdi3
        ldr     r9, [sp, #0x1C]
        mov     r4, r0
        mov     r8, r1
        ldr     r2, [r9]
        str     r10, [sp, #4]
        mov     r0, r2
        bl      __fixsfdi
        ldr     r2, [sp, #8]
        ldrsh   r3, [r5], #0xC
        ldrsh   r2, [r2]
        umull   r12, r10, r7, r2
        mov     lr, r2, asr #31
        mla     lr, r7, lr, r10
        ldr     r10, [sp, #8]
        adds    r12, r0, r12
        mla     lr, r6, r2, lr
        mov     r2, r3, asr #31
        add     r10, r10, #0xC
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x48]
        adc     r1, r1, lr
        rsbs    lr, r3, #0
        add     r10, r10, #2
        str     r10, [sp, #0x48]
        umull   r3, r10, lr, r4
        mla     lr, lr, r8, r10
        rsc     r2, r2, #0
        adds    r0, r12, r3
        mla     lr, r2, r4, lr
        adc     r1, r1, lr
        bl      __floatdisf
        str     r0, [r11], #8
        ldr     r2, [sp, #0x10]
        ldrsh   r3, [r2]
        ldr     r2, [sp, #0xC]
        ldrsh   r12, [r2], #0xC
        str     r11, [sp, #0x14]
        rsbs    r11, r3, #0
        umull   r10, r1, r11, r4
        umull   lr, r0, r7, r12
        mla     r11, r11, r8, r1
        mov     r1, r12, asr #31
        mla     r7, r7, r1, r0
        mov     r3, r3, asr #31
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        mla     r7, r6, r12, r7
        rsc     r3, r3, #0
        mla     r11, r3, r4, r11
        adds    r0, lr, r10
        add     r2, r2, #0xC
        str     r2, [sp, #0x10]
        adc     r1, r7, r11
        bl      __floatdisf
        str     r0, [r9], #8
        ldr     r3, [sp, #0x44]
        ldr     r2, [sp, #0x48]
        str     r9, [sp, #0x1C]
        mov     r7, r4
        cmp     r2, r3
        mov     r6, r8
        blt     LCIJ1
        mov     r5, r8
        ldr     r0, [sp, #0x40]
        ldr     lr, [sp, #0x3C]
        ldr     r9, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        ldr     r10, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x44]
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x20]
LCIJ2:
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r7, r7
        subs    r7, r4, r7
        sbcs    r6, r5, #0
        movlt   r7, #0
        movlt   r6, #0
        orrs    r6, r7, r6
        beq     LCIJ3
        mvn     r7, #0xFF
        bic     r7, r7, #0x7F, 24
        mvn     r6, r7
        b       LCIJ4
LCIJ3:
        mov     r7, #0
        sub     r7, r7, #2, 18
        cmp     r4, r7
        mvn     r7, #0
        sbcs    r7, r5, r7
        movge   r7, r4, lsl #16
        movge   r6, r7, asr #16
        movlt   r7, #0
        sublt   r6, r7, #2, 18
LCIJ4:
        ldr     r7, [sp, #0x4C]
        strh    r6, [r7], #2
        ldr     r6, [sp]
        str     r7, [sp, #0x4C]
        subs    r6, r6, #1
        str     r6, [sp]
        bne     LCIJ0
LCIJ5:
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LCIJ6:
        mvn     r0, #0xC
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}


