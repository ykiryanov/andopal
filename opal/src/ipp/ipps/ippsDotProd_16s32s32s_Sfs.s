        .text
        .align  4
        .globl  _ippsDotProd_16s32s32s_Sfs


_ippsDotProd_16s32s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r6, [sp, #0x38]
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r3
        beq     LCGH13
        cmp     r8, #0
        beq     LCGH13
        cmp     r7, #0
        beq     LCGH13
        cmp     r2, #0
        ble     LCGH14
        mov     r10, r2, asr #16
        bic     r2, r2, #0xFF, 8
        cmp     r10, #0
        bic     r2, r2, #0xFF, 16
        movle   r5, #0
        movle   r4, r5
        ble     LCGH2
        mov     r5, #0
        mov     r4, r5
        str     r2, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LCGH0:
        mov     r2, #0
        mov     lr, r9
        mov     r1, r2
        mov     r12, r8
        mov     r6, r1
        str     r10, [sp, #0x10]
LCGH1:
        ldr     r0, [r12], #0x10
        ldrsh   r11, [lr], #8
        add     r10, r6, #1
        ldr     r7, [r8, +r10, lsl #2]
        mov     r10, r10, lsl #1
        mul     r3, r11, r0
        ldrsh   r10, [r9, +r10]
        add     r0, r6, #2
        ldr     r11, [r8, +r0, lsl #2]
        mul     r10, r10, r7
        adds    r7, r2, r3
        adc     r1, r1, r3, asr #31
        mov     r0, r0, lsl #1
        ldrsh   r0, [r9, +r0]
        adds    r7, r7, r10
        add     r3, r6, #3
        mul     r11, r0, r11
        ldr     r2, [r8, +r3, lsl #2]
        adc     r10, r1, r10, asr #31
        mov     r3, r3, lsl #1
        ldrsh   r0, [r9, +r3]
        adds    r7, r7, r11
        mul     r0, r0, r2
        adc     r11, r10, r11, asr #31
        add     r6, r6, #4
        adds    r2, r7, r0
        adc     r1, r11, r0, asr #31
        cmp     r6, #1, 16
        blt     LCGH1
        ldr     r10, [sp, #0x10]
        mov     r0, r2
        bl      __floatdidf
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        subs    r10, r10, #1
        mov     r5, r0
        mov     r4, r1
        bne     LCGH0
        ldr     r2, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LCGH2:
        cmp     r2, #0
        beq     LCGH7
        cmp     r2, #0
        mov     r11, #0
        movle   r0, r11
        movle   r1, r0
        ble     LCGH6
        cmp     r2, #6
        movlt   r0, r11
        movlt   r1, r0
        blt     LCGH4
        mov     r0, r11
        mov     r1, r0
        sub     r10, r2, #6
        mov     lr, r9
        mov     r12, r8
        str     r5, [sp, #0xC]
        str     r2, [sp, #8]
        str     r6, [sp, #4]
        str     r7, [sp]
LCGH3:
        ldr     r6, [r12], #0x14
        ldrsh   r7, [lr], #0xA
        add     r5, r11, #1
        ldr     r2, [r8, +r5, lsl #2]
        mov     r5, r5, lsl #1
        mul     r7, r7, r6
        ldrsh   r3, [r9, +r5]
        add     r6, r11, #2
        ldr     r5, [r8, +r6, lsl #2]
        mul     r2, r3, r2
        adds    r0, r0, r7
        mov     r6, r6, lsl #1
        ldrsh   r3, [r9, +r6]
        adc     r1, r1, r7, asr #31
        adds    r6, r0, r2
        add     r7, r11, #3
        mul     r5, r3, r5
        ldr     r0, [r8, +r7, lsl #2]
        adc     r2, r1, r2, asr #31
        add     r3, r11, #4
        ldr     r1, [r8, +r3, lsl #2]
        mov     r7, r7, lsl #1
        ldrsh   r7, [r9, +r7]
        adds    r6, r6, r5
        adc     r5, r2, r5, asr #31
        mov     r3, r3, lsl #1
        mul     r0, r7, r0
        ldrsh   r2, [r9, +r3]
        mul     r1, r2, r1
        adds    r6, r6, r0
        adc     r5, r5, r0, asr #31
        add     r11, r11, #5
        adds    r0, r6, r1
        adc     r1, r5, r1, asr #31
        cmp     r11, r10
        ble     LCGH3
        ldr     r5, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LCGH4:
        add     r9, r9, r11, lsl #1
        add     r8, r8, r11, lsl #2
LCGH5:
        ldr     lr, [r8], #4
        ldrsh   r12, [r9], #2
        add     r11, r11, #1
        mul     lr, r12, lr
        adds    r0, r0, lr
        adc     r1, r1, lr, asr #31
        cmp     r11, r2
        blt     LCGH5
LCGH6:
        bl      __floatdidf
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
LCGH7:
        mov     r0, r5
        mov     r1, r4
        bl      __fixdfdi
        cmp     r6, #0
        mov     r4, r0
        mov     r5, r1
        mvn     r9, #2, 2
        mvn     r11, #0
        mov     r12, #2, 2
        bne     LCGH9
        subs    r2, r4, r9
        sbcs    r12, r5, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        movne   r4, r9
        bne     LCGH8
        cmp     r4, #2, 2
        sbcs    r5, r5, r11
        movlt   r4, #2, 2
LCGH8:
        str     r4, [r7]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGH9:
        cmp     r6, #0
        ble     LCGH11
        cmp     r6, #0x1F
        mov     r8, #0x1F
        movlt   r8, r6
        sub     r2, r8, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r10, r4, r0
        mov     r0, r4
        mov     r3, r8, asr #31
        adc     r4, r5, r1
        mov     r1, r5
        mov     r2, r8
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r4, r4, #0
        adds    r0, r0, r11
        adc     r1, r4, r11
        mov     r3, r6, asr #31
        mov     r2, r6
        bl      __ashrdi3
        subs    r2, r0, r9
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        movne   r0, r9
        bne     LCGH10
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, #2, 2
LCGH10:
        str     r0, [r7]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGH11:
        mvn     lr, #0x1E
        cmp     r6, lr
        movgt   lr, r6
        rsb     r2, lr, #0
        cmp     r2, #0x20
        movge   r12, #0
        movlt   r12, r12, asr r2
        mov     r6, r9, asr r2
        subs    lr, r4, r6
        sbcs    r6, r5, r6, asr #31
        movlt   lr, #0
        movlt   r6, #0
        orrs    r6, lr, r6
        bne     LCGH12
        cmp     r4, r12
        sbcs    r12, r5, r12, asr #31
        movlt   r9, #2, 2
        blt     LCGH12
        mov     r0, r4
        mov     r1, r5
        mov     r3, r2, asr #31
        bl      __ashldi3
        mov     r9, r0
LCGH12:
        str     r9, [r7]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGH13:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGH14:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


