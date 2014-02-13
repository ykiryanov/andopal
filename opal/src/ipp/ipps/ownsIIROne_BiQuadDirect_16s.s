        .text
        .align  4
        .globl  ownsIIROne_BiQuadDirect_16s


ownsIIROne_BiQuadDirect_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x4C]
        mov     r4, r0
        mov     r3, r3, lsl #1
        cmp     r3, #0
        mov     r10, #0
        mov     r9, r4, asr #31
        movle   r6, r10
        ble     LCIL1
        mov     lr, r10
        add     r6, r2, #6
        mov     r5, #1
        mov     r8, r2
        mov     r7, r12
        str     r6, [sp, #0xC]
        str     lr, [sp, #0x14]
        str     r3, [sp, #4]
        str     r12, [sp, #8]
        str     r2, [sp, #0x10]
        str     r1, [sp]
LCIL0:
        ldr     r1, [sp, #0xC]
        ldrsh   r5, [r1], #0xC
        str     r1, [sp, #0xC]
        cmp     r5, #0
        blt     LCIL3
        ldrsh   r12, [r8], #0xC
        ldr     r0, [r7]
        sub     r3, r5, #1
        umull   r11, lr, r4, r12
        mov     r1, r12, asr #31
        mla     r1, r4, r1, lr
        mov     r6, r5, asr #31
        mov     lr, #1
        mla     r1, r9, r12, r1
        mov     r3, lr, lsl r3
        sub     r3, r3, #1
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x1C]
        bl      __fixsfdi
        ldr     r12, [sp, #0x1C]
        adds    r11, r0, r11
        adc     r1, r1, r12
        str     r1, [sp, #0x1C]
        mov     r2, r5
        mov     r0, r11
        mov     r3, r6
        bl      __ashrdi3
        ldr     lr, [sp, #0x18]
        and     r12, r0, #1
        mov     r1, lr, asr #31
        adds    r12, lr, r12
        adc     r1, r1, #0
        adds    r0, r11, r12
        ldr     r12, [sp, #0x1C]
        mov     r2, r5
        mov     r3, r6
        adc     r1, r12, r1
        bl      __ashrdi3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x14]
        ldr     r11, [sp, #0x10]
        mov     r6, r0
        mov     r5, r1
        add     r2, r2, #4
        str     r2, [sp, #0x1C]
        ldr     r0, [r2, +r3, lsl #2]
        add     r2, r11, #2
        str     r2, [sp, #0x18]
        add     r2, r11, #8
        str     r2, [sp, #0x20]
        add     r2, r11, #4
        str     r2, [sp, #0x24]
        bl      __fixsfdi
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        add     r11, r11, #0xA
        ldrsh   r2, [r2, +r10]
        ldrsh   r3, [r3, +r10]
        str     r0, [sp, #0x20]
        umull   r0, lr, r4, r2
        mov     r12, r2, asr #31
        mla     r12, r4, r12, lr
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x20]
        mov     lr, r3, asr #31
        mla     r12, r9, r2, r12
        adds    r11, r11, r0
        adc     r1, r1, r12
        rsbs    r3, r3, #0
        umull   r2, r12, r3, r6
        mla     r3, r3, r5, r12
        rsc     lr, lr, #0
        mla     r3, lr, r6, r3
        adds    r0, r11, r2
        adc     r1, r1, r3
        bl      __floatdisf
        str     r0, [r7], #8
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x24]
        ldrsh   r2, [r2, +r10]
        ldrsh   r3, [r3, +r10]
        add     r10, r10, #0xC
        rsbs    r12, r2, #0
        umull   r11, r1, r12, r6
        umull   lr, r0, r4, r3
        mla     r12, r12, r5, r1
        mov     r1, r3, asr #31
        mla     r0, r4, r1, r0
        mov     r2, r2, asr #31
        rsc     r2, r2, #0
        mla     r12, r2, r6, r12
        adds    r11, lr, r11
        mla     r3, r9, r3, r0
        mov     r0, r11
        mov     r4, r6
        mov     r9, r5
        adc     r1, r3, r12
        bl      __floatdisf
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x1C]
        str     r0, [r2, +r3, lsl #2]
        ldr     r2, [sp, #4]
        add     r3, r3, #2
        str     r3, [sp, #0x14]
        cmp     r3, r2
        blt     LCIL0
        ldr     r1, [sp]
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r3, r2
        subs    r3, r6, r3
        sbcs    r12, r5, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        mvnne   r2, r2
        bne     LCIL2
        mov     r2, #0
        sub     r3, r2, #2, 18
        cmp     r6, r3
        mvn     r3, #0
        sbcs    r5, r5, r3
        sublt   r2, r2, #2, 18
        blt     LCIL2
LCIL1:
        mov     r6, r6, lsl #16
        mov     r2, r6, asr #16
LCIL2:
        mov     r0, #0
        strh    r2, [r1]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCIL3:
        mvn     r0, #0xC
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


