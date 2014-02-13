        .text
        .align  4
        .globl  _ippsCrossCorr_16s64s


_ippsCrossCorr_16s64s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        ldr     r8, [sp, #0x80]
        ldr     r10, [sp, #0x84]
        ldr     r9, [sp, #0x88]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        beq     LCUF80
        cmp     r5, #0
        beq     LCUF80
        cmp     r8, #0
        beq     LCUF80
        cmp     r6, #0
        ble     LCUF79
        cmp     r4, #0
        ble     LCUF79
        cmp     r10, #0
        ble     LCUF79
        rsb     r12, r9, #0
        sub     r12, r12, r6
        add     r12, r12, #1
        cmp     r12, #0
        ble     LCUF0
        cmp     r12, r10
        mov     r11, r10
        movlt   r11, r12
        mov     r1, r11
        mov     r0, r8
        add     r9, r9, r12
        bl      _ippsZero_64s
        subs    r10, r10, r11
        addne   r8, r8, r11, lsl #3
        beq     LCUF12
LCUF0:
        sub     r12, r4, r9
        mov     r11, #0
        cmp     r12, #0
        movgt   r11, r12
        sub     r1, r10, r11
        cmp     r1, #0
        str     r12, [sp, #0x30]
        ble     LCUF1
        add     r0, r8, r11, lsl #3
        bl      _ippsZero_64s
        cmp     r11, #0
        mov     r10, r11
        bne     LCUF1
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCUF1:
        cmp     r6, r4
        mov     lr, r4
        movlt   lr, r6
        subs    r0, r6, r4
        sub     r11, lr, #1
        eor     r12, r0, r0, asr #31
        sub     r12, r12, r0, asr #31
        ble     LCUF34
        cmp     r9, #0
        bge     LCUF24
        rsb     r9, r9, #0
        cmp     r9, r12
        ble     LCUF13
        sub     r1, r9, r12
        cmp     r1, r10
        mov     r0, r10
        movlt   r0, r1
        mov     lr, #0
        sub     r1, r1, r0
        cmp     r1, #0
        movgt   lr, r1
        add     r6, r7, r12, lsl #1
        add     r6, r6, #2
        sub     r1, r11, lr
        add     r6, r6, lr, lsl #1
        bic     r2, r0, #3
        sub     lr, r0, #1
        sub     r3, r1, #3
        cmp     r2, #0
        add     lr, r8, lr, lsl #3
        sub     r1, r1, r2
        sub     r11, r0, r2
        ble     LCUF5
        str     r8, [sp, #0x1C]
        str     r1, [sp, #0x28]
        str     r11, [sp, #0x2C]
        str     r2, [sp, #0x30]
        str     r3, [sp, #0x18]
        str     r0, [sp, #0x38]
        str     r9, [sp, #0x3C]
        str     r12, [sp, #0x40]
        str     r10, [sp, #0x44]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x4C]
        str     r7, [sp, #0x50]
LCUF2:
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x4C]
        cmp     r0, #0
        ble     LCUF68
        mov     r10, #0
        mov     r3, r10
        mov     r2, r3
        mov     r0, r2
        mov     r5, r0
        str     r5, [sp]
        str     r5, [sp, #4]
        str     r5, [sp, #8]
        str     r5, [sp, #0xC]
        add     r4, r6, #2
        add     r12, r6, #4
        str     r5, [sp, #0x10]
        add     r9, r6, #6
        mov     r8, r4
        mov     r7, r12
        str     r4, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     lr, [sp, #0x34]
        str     r6, [sp, #0x14]
LCUF3:
        ldr     r12, [sp, #0x14]
        ldrsh   r4, [r1], #2
        ldrsh   r6, [r7], #2
        ldrsh   lr, [r12, +r10]
        ldrsh   r11, [r9], #2
        ldrsh   r12, [r8], #2
        mul     r6, r4, r6
        mul     lr, r4, lr
        str     r11, [sp, #0x54]
        mul     r12, r4, r12
        ldr     r11, [sp, #0x54]
        add     r5, r5, #1
        mul     r4, r4, r11
        ldr     r11, [sp, #0xC]
        add     r10, r10, #2
        adds    r11, r11, lr
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        adc     r11, r11, lr, asr #31
        ldr     lr, [sp, #4]
        str     r11, [sp, #0x10]
        adds    lr, r12, lr
        str     lr, [sp, #4]
        ldr     lr, [sp, #8]
        adc     lr, lr, r12, asr #31
        ldr     r12, [sp]
        adds    r0, r6, r0
        str     lr, [sp, #8]
        adc     r12, r12, r6, asr #31
        str     r12, [sp]
        ldr     r12, [sp, #0x18]
        adds    r3, r4, r3
        adc     r2, r2, r4, asr #31
        cmp     r5, r12
        blt     LCUF3
        ldr     r4, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x34]
        ldr     r6, [sp, #0x14]
LCUF4:
        ldrsh   r7, [r1]
        ldrsh   r9, [r1, #2]
        mov     r5, r5, lsl #1
        ldrsh   r11, [r6, +r5]
        ldrsh   r8, [r4, +r5]
        ldrsh   r10, [r12, +r5]
        add     r6, r6, #8
        mul     r7, r7, r11
        mul     r8, r9, r8
        ldrsh   r11, [r1, #4]
        sub     r9, lr, #8
        sub     r9, r9, #8
        sub     r9, r9, #8
        mul     r10, r11, r10
        ldr     r11, [sp, #0xC]
        adds    r11, r11, r7
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x10]
        str     r9, [sp, #0x10]
        adc     r7, r11, r7, asr #31
        adds    r9, r8, r10
        mov     r10, r10, asr #31
        adc     r8, r10, r8, asr #31
        ldr     r10, [sp, #0x54]
        adds    r9, r10, r9
        adc     r8, r7, r8
        str     r8, [lr, #4]
        str     r9, [lr]
        ldrsh   r8, [r12, +r5]
        ldrsh   r9, [r1, #2]
        ldrsh   r4, [r4, +r5]
        ldrsh   r10, [r1]
        ldr     r7, [sp, #0x30]
        mul     r8, r9, r8
        ldr     r9, [sp, #0x18]
        mul     r4, r10, r4
        sub     r7, r7, #4
        sub     r9, r9, #4
        str     r9, [sp, #0x18]
        mov     r9, r8, asr #31
        str     r7, [sp, #0x30]
        adds    r8, r4, r8
        adc     r4, r9, r4, asr #31
        ldr     r9, [sp, #4]
        adds    r8, r8, r9
        ldr     r9, [sp, #8]
        str     r8, [lr, #-8]
        adc     r9, r4, r9
        str     r9, [lr, #-4]
        ldrsh   r5, [r12, +r5]
        ldrsh   r1, [r1]
        str     r3, [lr, #-0x18]
        str     r2, [lr, #-0x14]
        mul     r5, r1, r5
        adds    r0, r5, r0
        str     r0, [lr, #-0x10]
        ldr     r0, [sp]
        adc     r5, r0, r5, asr #31
        str     r5, [lr, #-0xC]
        ldr     r0, [sp, #0x10]
        cmp     r7, #0
        sub     lr, r0, #8
        bgt     LCUF2
        ldr     r8, [sp, #0x1C]
        ldr     r1, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        ldr     r0, [sp, #0x38]
        ldr     r9, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x4C]
        ldr     r7, [sp, #0x50]
LCUF5:
        cmp     r11, #0
        ble     LCUF11
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x38]
        str     r9, [sp, #0x3C]
        str     r12, [sp, #0x40]
        str     r10, [sp, #0x44]
        str     r4, [sp, #0x48]
        str     r7, [sp, #0x50]
LCUF6:
        cmp     r1, #0
        mov     r9, r5
        movle   r10, #0
        movle   r0, r10
        ble     LCUF10
        cmp     r1, #6
        blt     LCUF67
        mov     r12, #6
        str     r12, [sp, #0x24]
        mov     r8, #0
        str     lr, [sp, #0x34]
        ldr     lr, [sp, #0x24]
        mov     r0, r8
        mov     r10, r0
        sub     r2, r1, #6
        mov     r3, r10
        mov     r7, #2
        mov     r4, #4
        mov     r12, #8
        str     r10, [sp, #0x54]
        str     r2, [sp, #0x30]
        str     r1, [sp, #0x28]
        str     r11, [sp, #0x2C]
        str     r5, [sp, #0x4C]
LCUF7:
        ldrsh   r1, [r6, +r8]
        ldrsh   r2, [r9]
        ldrsh   r5, [r6, +r7]
        ldrsh   r10, [r9, #2]
        ldrsh   r11, [r6, +r4]
        mul     r1, r2, r1
        ldrsh   r2, [r9, #4]
        mul     r5, r10, r5
        add     r3, r3, #5
        mul     r2, r2, r11
        adds    r0, r0, r1
        add     r8, r8, #0xA
        str     r5, [sp, #0x20]
        ldrsh   r5, [r6, +lr]
        add     r7, r7, #0xA
        add     r4, r4, #0xA
        add     lr, lr, #0xA
        str     r5, [sp, #0x18]
        ldrsh   r10, [r9, #8]
        ldrsh   r5, [r9, #6]
        ldrsh   r11, [r6, +r12]
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x18]
        add     r9, r9, #0xA
        add     r12, r12, #0xA
        mul     r10, r5, r10
        ldr     r5, [sp, #0x54]
        adc     r5, r5, r1, asr #31
        ldr     r1, [sp, #0x10]
        mul     r1, r1, r11
        ldr     r11, [sp, #0x20]
        adds    r0, r0, r11
        adc     r11, r5, r11, asr #31
        adds    r0, r0, r2
        adc     r2, r11, r2, asr #31
        adds    r0, r0, r10
        adc     r10, r2, r10, asr #31
        adds    r0, r0, r1
        adc     r1, r10, r1, asr #31
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x30]
        cmp     r3, r1
        ble     LCUF7
        ldr     r10, [sp, #0x54]
        ldr     r1, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        ldr     lr, [sp, #0x34]
        ldr     r5, [sp, #0x4C]
LCUF8:
        mov     r12, r3, lsl #1
LCUF9:
        ldrsh   r7, [r6, +r12]
        ldrsh   r4, [r9], #2
        add     r12, r12, #2
        add     r3, r3, #1
        mul     r7, r4, r7
        adds    r0, r0, r7
        adc     r10, r10, r7, asr #31
        cmp     r3, r1
        blt     LCUF9
LCUF10:
        str     r0, [lr]
        str     r10, [lr, #4]
        subs    r11, r11, #1
        sub     r1, r1, #1
        add     r6, r6, #2
        sub     lr, lr, #8
        bne     LCUF6
        ldr     r8, [sp, #0x1C]
        ldr     r0, [sp, #0x38]
        ldr     r9, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        ldr     r4, [sp, #0x48]
        ldr     r7, [sp, #0x50]
LCUF11:
        subs    r10, r10, r0
        sub     r9, r9, r0
        add     r8, r8, r0, lsl #3
        bne     LCUF13
LCUF12:
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCUF13:
        cmp     r9, r12
        movlt   r12, r9
        cmp     r12, r10
        mov     r11, r10
        movlt   r11, r12
        bic     r6, r11, #3
        cmp     r6, #0
        add     r12, r7, r12, lsl #1
        mov     r1, r8
        and     lr, r11, #3
        ble     LCUF17
        str     r8, [sp, #0x1C]
        str     lr, [sp, #0x40]
        str     r11, [sp, #0x30]
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x44]
        str     r5, [sp, #0x4C]
        str     r7, [sp, #0x50]
LCUF14:
        ldr     r0, [sp, #0x4C]
        cmp     r4, #0
        str     r0, [sp, #0x54]
        ble     LCUF72
        mov     r0, #0
        mov     r5, r0
        mov     lr, r5
        mov     r2, lr
        sub     r3, r12, #2
        mov     r11, r2
        mov     r10, r11
        str     r3, [sp, #0x2C]
        mov     r9, r10
        mov     r8, r9
        sub     r3, r12, #4
        str     r3, [sp, #0x28]
        mov     r7, r8
        str     r4, [sp, #0x34]
        sub     r3, r12, #6
        str     r3, [sp, #0x24]
        str     r7, [sp, #0x14]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r6, [sp, #0x20]
        str     r4, [sp, #0x48]
        ldr     r4, [sp, #0x34]
        ldr     r9, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        ldr     r6, [sp, #0x54]
        str     r10, [sp, #8]
        str     r11, [sp, #4]
        str     r1, [sp, #0x38]
        str     r12, [sp, #0x18]
LCUF15:
        ldr     r1, [sp, #0x18]
        ldrsh   r12, [r6], #2
        ldrsh   r10, [r8], #2
        ldrsh   r3, [r1, +r0]
        ldrsh   r11, [r9], #2
        ldrsh   r1, [r7], #2
        mul     r10, r12, r10
        mul     r3, r12, r3
        str     r11, [sp]
        mul     r1, r12, r1
        ldr     r11, [sp]
        mul     r12, r12, r11
        ldr     r11, [sp, #0x10]
        add     r0, r0, #2
        adds    r11, r11, r3
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        adc     r11, r11, r3, asr #31
        ldr     r3, [sp, #8]
        str     r11, [sp, #0x14]
        adds    r3, r1, r3
        str     r3, [sp, #8]
        ldr     r3, [sp, #0xC]
        adc     r3, r3, r1, asr #31
        ldr     r1, [sp, #4]
        adds    r2, r10, r2
        str     r3, [sp, #0xC]
        adc     r1, r1, r10, asr #31
        adds    r5, r12, r5
        str     r1, [sp, #4]
        adc     lr, lr, r12, asr #31
        subs    r4, r4, #1
        bne     LCUF15
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r11, [sp, #4]
        ldr     r6, [sp, #0x20]
        ldr     r1, [sp, #0x38]
        ldr     r12, [sp, #0x18]
        ldr     r4, [sp, #0x48]
LCUF16:
        sub     r6, r6, #4
        str     r8, [r1]
        str     r7, [r1, #4]
        str     r10, [r1, #8]
        str     r9, [r1, #0xC]
        str     r2, [r1, #0x10]
        str     r11, [r1, #0x14]
        str     r5, [r1, #0x18]
        str     lr, [r1, #0x1C]
        cmp     r6, #0
        sub     r12, r12, #8
        add     r1, r1, #0x20
        bgt     LCUF14
        ldr     r8, [sp, #0x1C]
        ldr     lr, [sp, #0x40]
        ldr     r11, [sp, #0x30]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r7, [sp, #0x50]
LCUF17:
        cmp     lr, #0
        ble     LCUF23
        sub     r6, r4, #6
        str     r8, [sp, #0x1C]
        str     r6, [sp, #0x34]
        str     r11, [sp, #0x30]
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x44]
        str     r7, [sp, #0x50]
LCUF18:
        cmp     r4, #0
        mov     r2, r5
        movle   r3, #0
        movle   r0, r3
        ble     LCUF22
        cmp     r4, #6
        blt     LCUF71
        mov     r11, #0
        mov     r0, r11
        mov     r3, r0
        mov     r6, r3
        mov     r10, #2
        mov     r9, #4
        mov     r8, #6
        mov     r7, #8
        str     r3, [sp, #0x54]
        str     lr, [sp, #0x40]
        str     r1, [sp, #0x38]
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x4C]
LCUF19:
        ldrsh   r1, [r12, +r11]
        ldrsh   r3, [r2]
        ldrsh   lr, [r12, +r10]
        ldrsh   r4, [r2, #2]
        ldrsh   r5, [r12, +r9]
        mul     r1, r3, r1
        ldrsh   r3, [r2, #4]
        mul     lr, r4, lr
        add     r6, r6, #5
        mul     r3, r3, r5
        adds    r0, r0, r1
        add     r11, r11, #0xA
        str     lr, [sp, #0x2C]
        ldrsh   lr, [r12, +r8]
        add     r10, r10, #0xA
        add     r9, r9, #0xA
        add     r8, r8, #0xA
        str     lr, [sp, #0x28]
        ldrsh   r4, [r2, #8]
        ldrsh   lr, [r2, #6]
        ldrsh   r5, [r12, +r7]
        str     r4, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        add     r2, r2, #0xA
        add     r7, r7, #0xA
        mul     r4, lr, r4
        ldr     lr, [sp, #0x54]
        adc     lr, lr, r1, asr #31
        ldr     r1, [sp, #0x24]
        mul     r1, r1, r5
        ldr     r5, [sp, #0x2C]
        adds    r0, r0, r5
        adc     r5, lr, r5, asr #31
        adds    r0, r0, r3
        adc     r3, r5, r3, asr #31
        adds    r0, r0, r4
        adc     r4, r3, r4, asr #31
        adds    r0, r0, r1
        adc     r1, r4, r1, asr #31
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x34]
        cmp     r6, r1
        ble     LCUF19
        ldr     r3, [sp, #0x54]
        ldr     lr, [sp, #0x40]
        ldr     r1, [sp, #0x38]
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x4C]
LCUF20:
        mov     r7, r6, lsl #1
LCUF21:
        ldrsh   r9, [r12, +r7]
        ldrsh   r8, [r2], #2
        add     r7, r7, #2
        add     r6, r6, #1
        mul     r9, r8, r9
        adds    r0, r0, r9
        adc     r3, r3, r9, asr #31
        cmp     r6, r4
        blt     LCUF21
LCUF22:
        str     r0, [r1]
        str     r3, [r1, #4]
        subs    lr, lr, #1
        sub     r12, r12, #2
        add     r1, r1, #8
        bne     LCUF18
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x30]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [sp, #0x44]
        ldr     r7, [sp, #0x50]
LCUF23:
        subs    r10, r10, r11
        sub     r9, r9, r11
        add     r8, r8, r11, lsl #3
        subne   r4, r4, r9
        strne   r4, [sp, #0x30]
        beq     LCUF12
LCUF24:
        ldr     r1, [sp, #0x30]
        add     r9, r5, r9, lsl #1
        cmp     r1, r10
        movlt   r10, r1
        bic     r2, r10, #3
        cmp     r2, #0
        sub     r10, r10, r2
        sub     r3, r1, #3
        sub     r5, r1, r2
        ble     LCUF28
        str     r5, [sp, #0x44]
        str     r10, [sp, #0x48]
        str     r2, [sp, #0x4C]
        str     r3, [sp, #0x38]
        str     r7, [sp, #0x50]
LCUF25:
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x50]
        cmp     r1, #0
        ble     LCUF70
        mov     r12, #0
        mov     r3, r12
        mov     r1, r3
        mov     r5, r1
        str     r5, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r5, [sp, #0x2C]
        str     r5, [sp, #0x30]
        add     lr, r9, #2
        add     r4, r9, #4
        add     r11, r9, #6
        mov     r10, r5
        mov     r7, lr
        mov     r6, r4
        str     r8, [sp, #0x1C]
        str     lr, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r9, [sp, #0x34]
LCUF26:
        ldr     r0, [sp, #0x34]
        ldrsh   r4, [r2], #2
        ldrsh   r8, [r6], #2
        ldrsh   lr, [r0, +r10]
        ldrsh   r9, [r11], #2
        ldrsh   r0, [r7], #2
        mul     r8, r4, r8
        mul     lr, r4, lr
        str     r9, [sp, #0x54]
        mul     r0, r4, r0
        ldr     r9, [sp, #0x54]
        add     r5, r5, #1
        mul     r4, r4, r9
        ldr     r9, [sp, #0x2C]
        add     r10, r10, #2
        adds    r9, r9, lr
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        adc     r9, r9, lr, asr #31
        ldr     lr, [sp, #0x24]
        str     r9, [sp, #0x30]
        adds    lr, r0, lr
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #0x28]
        adc     lr, lr, r0, asr #31
        ldr     r0, [sp, #0x20]
        adds    r1, r8, r1
        str     lr, [sp, #0x28]
        adc     r0, r0, r8, asr #31
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x38]
        adds    r12, r4, r12
        adc     r3, r3, r4, asr #31
        cmp     r5, r0
        blt     LCUF26
        ldr     r8, [sp, #0x1C]
        ldr     lr, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r9, [sp, #0x34]
LCUF27:
        mov     r5, r5, lsl #1
        ldrsh   r0, [r2]
        ldrsh   r7, [r9, +r5]
        ldrsh   r11, [r2, #2]
        ldrsh   r6, [lr, +r5]
        ldrsh   r10, [r4, +r5]
        mul     r7, r0, r7
        ldrsh   r0, [r2, #4]
        mul     r11, r11, r6
        ldr     r6, [sp, #0x4C]
        mul     r10, r0, r10
        ldr     r0, [sp, #0x2C]
        add     r9, r9, #8
        sub     r6, r6, #4
        str     r6, [sp, #0x4C]
        adds    r0, r0, r7
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x30]
        adc     r7, r0, r7, asr #31
        ldr     r0, [sp, #0x38]
        sub     r0, r0, #4
        str     r0, [sp, #0x38]
        adds    r0, r11, r10
        mov     r10, r10, asr #31
        adc     r11, r10, r11, asr #31
        ldr     r10, [sp, #0x54]
        adds    r0, r10, r0
        adc     r11, r7, r11
        str     r11, [r8, #4]
        str     r0, [r8]
        ldrsh   r10, [r2]
        ldrsh   r7, [r4, +r5]
        ldrsh   lr, [lr, +r5]
        ldrsh   r11, [r2, #2]
        mul     r10, r10, lr
        mul     r7, r11, r7
        adds    lr, r10, r7
        mov     r11, r7, asr #31
        adc     r7, r11, r10, asr #31
        ldr     r10, [sp, #0x24]
        adds    lr, lr, r10
        ldr     r10, [sp, #0x28]
        str     lr, [r8, #8]
        adc     r10, r7, r10
        str     r10, [r8, #0xC]
        ldrsh   r5, [r4, +r5]
        ldrsh   r2, [r2]
        str     r12, [r8, #0x18]
        str     r3, [r8, #0x1C]
        mul     r5, r2, r5
        adds    r1, r5, r1
        str     r1, [r8, #0x10]
        ldr     r1, [sp, #0x20]
        adc     r5, r1, r5, asr #31
        str     r5, [r8, #0x14]
        cmp     r6, #0
        add     r8, r8, #0x20
        bgt     LCUF25
        ldr     r5, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r7, [sp, #0x50]
LCUF28:
        cmp     r10, #0
        ble     LCUF66
LCUF29:
        cmp     r5, #0
        mov     r4, #0
        mov     lr, r7
        movle   r6, r4
        movle   r11, r6
        ble     LCUF33
        cmp     r5, #6
        blt     LCUF69
        mov     r6, r4
        mov     r2, #6
        str     r2, [sp, #0x4C]
        str     r10, [sp, #0x48]
        ldr     r10, [sp, #0x4C]
        mov     r11, r6
        sub     r0, r5, #6
        mov     r1, r11
        mov     r12, #2
        mov     r3, #4
        mov     r2, #8
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x3C]
        str     r0, [sp, #0x40]
        str     r5, [sp, #0x44]
        str     r7, [sp, #0x50]
LCUF30:
        ldrsh   r5, [r9, +r4]
        ldrsh   r0, [lr]
        ldrsh   r7, [r9, +r12]
        ldrsh   r8, [lr, #2]
        ldrsh   r11, [r9, +r3]
        mul     r5, r0, r5
        ldrsh   r0, [lr, #4]
        mul     r7, r8, r7
        add     r1, r1, #5
        mul     r8, r0, r11
        adds    r0, r6, r5
        add     r4, r4, #0xA
        str     r7, [sp, #0x54]
        ldrsh   r7, [r9, +r10]
        add     r12, r12, #0xA
        add     r3, r3, #0xA
        add     r10, r10, #0xA
        str     r7, [sp, #0x38]
        ldrsh   r6, [lr, #8]
        ldrsh   r7, [lr, #6]
        ldrsh   r11, [r9, +r2]
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x38]
        add     lr, lr, #0xA
        add     r2, r2, #0xA
        mul     r7, r7, r6
        ldr     r6, [sp, #0x3C]
        adc     r6, r6, r5, asr #31
        ldr     r5, [sp, #0x30]
        mul     r5, r5, r11
        ldr     r11, [sp, #0x54]
        adds    r0, r0, r11
        adc     r11, r6, r11, asr #31
        adds    r0, r0, r8
        adc     r8, r11, r8, asr #31
        adds    r0, r0, r7
        adc     r7, r8, r7, asr #31
        adds    r6, r0, r5
        ldr     r0, [sp, #0x40]
        adc     r5, r7, r5, asr #31
        str     r5, [sp, #0x3C]
        cmp     r1, r0
        ble     LCUF30
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x3C]
        ldr     r5, [sp, #0x44]
        ldr     r10, [sp, #0x48]
        ldr     r7, [sp, #0x50]
LCUF31:
        mov     r2, r1, lsl #1
LCUF32:
        ldrsh   r12, [r9, +r2]
        ldrsh   r3, [lr], #2
        add     r2, r2, #2
        add     r1, r1, #1
        mul     r12, r3, r12
        adds    r6, r6, r12
        adc     r11, r11, r12, asr #31
        cmp     r1, r5
        blt     LCUF32
LCUF33:
        str     r6, [r8]
        str     r11, [r8, #4]
        subs    r10, r10, #1
        sub     r5, r5, #1
        add     r9, r9, #2
        add     r8, r8, #8
        bne     LCUF29
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCUF34:
        cmp     r9, #0
        bge     LCUF45
        rsb     r9, r9, #0
        cmp     r9, r10
        mov     r0, r10
        movlt   r0, r9
        mov     r3, #0
        sub     r9, r9, r0
        cmp     r9, #0
        movgt   r3, r9
        sub     r4, r11, r3
        sub     r11, r0, #1
        bic     r1, r0, #3
        add     r11, r8, r11, lsl #3
        add     r3, r7, r3, lsl #1
        sub     r2, r4, #3
        str     r11, [sp, #0x2C]
        cmp     r1, #0
        add     r3, r3, #2
        sub     r11, r0, r1
        sub     r4, r4, r1
        ble     LCUF38
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x2C]
        str     r8, [sp, #0x1C]
        str     r4, [sp, #0x24]
        str     r11, [sp, #0x28]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x48]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x44]
        str     r5, [sp, #0x4C]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x50]
LCUF35:
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x4C]
        cmp     r0, #0
        ble     LCUF78
        mov     r10, #0
        mov     lr, r10
        mov     r12, lr
        mov     r0, r12
        mov     r6, r0
        str     r6, [sp, #0x54]
        str     r6, [sp]
        str     r6, [sp, #4]
        str     r6, [sp, #8]
        add     r4, r3, #2
        add     r5, r3, #4
        str     r6, [sp, #0xC]
        add     r9, r3, #6
        mov     r8, r4
        mov     r7, r5
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x20]
        str     r2, [sp, #0x2C]
        str     r3, [sp, #0x10]
LCUF36:
        ldr     r2, [sp, #0x10]
        ldrsh   r4, [r1], #2
        ldrsh   r5, [r7], #2
        ldrsh   r3, [r2, +r10]
        ldrsh   r11, [r9], #2
        ldrsh   r2, [r8], #2
        mul     r5, r4, r5
        mul     r3, r4, r3
        str     r11, [sp, #0x58]
        mul     r2, r4, r2
        ldr     r11, [sp, #0x58]
        add     r6, r6, #1
        mul     r4, r4, r11
        ldr     r11, [sp, #8]
        add     r10, r10, #2
        adds    r11, r11, r3
        str     r11, [sp, #8]
        ldr     r11, [sp, #0xC]
        adc     r11, r11, r3, asr #31
        ldr     r3, [sp]
        str     r11, [sp, #0xC]
        adds    r3, r3, r2
        str     r3, [sp]
        ldr     r3, [sp, #4]
        adc     r3, r3, r2, asr #31
        ldr     r2, [sp, #0x54]
        adds    r0, r0, r5
        str     r3, [sp, #4]
        adc     r2, r2, r5, asr #31
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x14]
        adds    lr, lr, r4
        adc     r12, r12, r4, asr #31
        cmp     r6, r2
        blt     LCUF36
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x20]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x10]
LCUF37:
        ldrsh   r11, [r1]
        ldrsh   r9, [r1, #2]
        mov     r6, r6, lsl #1
        ldrsh   r7, [r3, +r6]
        ldrsh   r8, [r4, +r6]
        ldrsh   r10, [r5, +r6]
        add     r3, r3, #8
        mul     r7, r11, r7
        ldrsh   r11, [r1, #4]
        mul     r8, r9, r8
        sub     r9, r2, #8
        mul     r10, r11, r10
        ldr     r11, [sp, #8]
        sub     r9, r9, #8
        sub     r9, r9, #8
        adds    r11, r11, r7
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0xC]
        str     r9, [sp, #0xC]
        adc     r7, r11, r7, asr #31
        adds    r9, r8, r10
        mov     r10, r10, asr #31
        adc     r8, r10, r8, asr #31
        ldr     r10, [sp, #0x58]
        adds    r9, r10, r9
        adc     r8, r7, r8
        str     r9, [r2]
        str     r8, [r2, #4]
        ldrsh   r7, [r4, +r6]
        ldrsh   r10, [r1]
        ldrsh   r9, [r5, +r6]
        ldrsh   r8, [r1, #2]
        ldr     r4, [sp, #0x30]
        mul     r7, r10, r7
        ldr     r10, [sp, #0x14]
        mul     r9, r8, r9
        ldr     r8, [sp]
        sub     r10, r10, #4
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #4]
        adds    r8, r8, r7
        sub     r4, r4, #4
        str     r4, [sp, #0x30]
        adc     r7, r10, r7, asr #31
        adds    r8, r8, r9
        adc     r9, r7, r9, asr #31
        str     r8, [r2, #-8]
        str     r9, [r2, #-4]
        ldrsh   r6, [r5, +r6]
        ldrsh   r1, [r1]
        str     lr, [r2, #-0x18]
        str     r12, [r2, #-0x14]
        mul     r6, r1, r6
        adds    r0, r0, r6
        str     r0, [r2, #-0x10]
        ldr     r0, [sp, #0x54]
        adc     r6, r0, r6, asr #31
        str     r6, [r2, #-0xC]
        ldr     r0, [sp, #0xC]
        cmp     r4, #0
        sub     r2, r0, #8
        bgt     LCUF35
        ldr     r8, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        ldr     r10, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x50]
        str     r2, [sp, #0x2C]
LCUF38:
        cmp     r11, #0
        ble     LCUF44
        str     r10, [sp, #0x44]
        ldr     r10, [sp, #0x2C]
        str     r8, [sp, #0x1C]
        str     r0, [sp, #0x48]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x50]
LCUF39:
        cmp     r4, #0
        mov     r7, r5
        movle   r9, #0
        movle   r8, r9
        ble     LCUF43
        cmp     r4, #6
        blt     LCUF77
        mov     r1, #6
        str     r1, [sp, #0x30]
        mov     r6, #0
        str     r5, [sp, #0x4C]
        ldr     r5, [sp, #0x30]
        mov     r8, r6
        mov     r9, r8
        sub     r2, r4, #6
        mov     r0, r9
        mov     lr, #2
        mov     r12, #4
        mov     r1, #8
        str     r9, [sp, #0x18]
        str     r2, [sp, #0x20]
        str     r4, [sp, #0x24]
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x2C]
LCUF40:
        ldrsh   r4, [r3, +r6]
        ldrsh   r2, [r7]
        ldrsh   r9, [r3, +lr]
        ldrsh   r10, [r7, #2]
        ldrsh   r11, [r3, +r12]
        mul     r2, r2, r4
        ldrsh   r4, [r7, #4]
        mul     r9, r10, r9
        add     r0, r0, #5
        mul     r4, r4, r11
        adds    r8, r8, r2
        add     r6, r6, #0xA
        str     r9, [sp, #0x58]
        ldrsh   r9, [r3, +r5]
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        add     r5, r5, #0xA
        str     r9, [sp, #0x54]
        ldrsh   r10, [r7, #8]
        ldrsh   r9, [r7, #6]
        ldrsh   r11, [r3, +r1]
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x54]
        add     r7, r7, #0xA
        add     r1, r1, #0xA
        mul     r10, r9, r10
        ldr     r9, [sp, #0x18]
        adc     r9, r9, r2, asr #31
        ldr     r2, [sp, #0x14]
        mul     r2, r2, r11
        ldr     r11, [sp, #0x58]
        adds    r8, r8, r11
        adc     r11, r9, r11, asr #31
        adds    r8, r8, r4
        adc     r4, r11, r4, asr #31
        adds    r8, r8, r10
        adc     r10, r4, r10, asr #31
        adds    r8, r8, r2
        adc     r2, r10, r2, asr #31
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0x20]
        cmp     r0, r2
        ble     LCUF40
        ldr     r9, [sp, #0x18]
        ldr     r4, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r10, [sp, #0x2C]
        ldr     r5, [sp, #0x4C]
LCUF41:
        mov     r1, r0, lsl #1
LCUF42:
        ldrsh   r12, [r3, +r1]
        ldrsh   lr, [r7], #2
        add     r1, r1, #2
        add     r0, r0, #1
        mul     r12, lr, r12
        adds    r8, r8, r12
        adc     r9, r9, r12, asr #31
        cmp     r0, r4
        blt     LCUF42
LCUF43:
        str     r8, [r10]
        str     r9, [r10, #4]
        subs    r11, r11, #1
        sub     r4, r4, #1
        add     r3, r3, #2
        sub     r10, r10, #8
        bne     LCUF39
        ldr     r8, [sp, #0x1C]
        ldr     r0, [sp, #0x48]
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        ldr     r10, [sp, #0x44]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x50]
LCUF44:
        subs    r10, r10, r0
        add     r8, r8, r0, lsl #3
        beq     LCUF12
LCUF45:
        cmp     r9, r12
        subge   r9, r9, r12
        bge     LCUF56
        sub     r3, r12, r9
        cmp     r3, r10
        mov     r0, r10
        movlt   r0, r3
        bic     r11, r0, #3
        cmp     r11, #0
        add     r9, r5, r9, lsl #1
        mov     r4, r8
        and     r3, r0, #3
        ble     LCUF49
        str     r8, [sp, #0x1C]
        str     r3, [sp, #0x28]
        str     r4, [sp, #0x2C]
        str     r0, [sp, #0x24]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x34]
        str     r10, [sp, #0x44]
        str     r5, [sp, #0x4C]
        str     r7, [sp, #0x50]
LCUF46:
        ldr     r0, [sp, #0x50]
        cmp     r6, #0
        ble     LCUF74
        mov     r4, #0
        mov     r12, r4
        mov     r3, r12
        add     lr, r9, #2
        str     lr, [sp, #0x48]
        mov     r2, r3
        mov     r1, r2
        add     lr, r9, #4
        mov     r10, r1
        mov     r8, r10
        str     lr, [sp, #0x38]
        mov     r7, r8
        add     lr, r9, #6
        str     lr, [sp, #0x30]
        mov     r5, r7
        str     r7, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #0x30]
        ldr     r8, [sp, #0x38]
        ldr     r7, [sp, #0x48]
        mov     lr, r6
        str     r5, [sp, #0x14]
        str     r10, [sp, #8]
        str     r1, [sp, #4]
        str     r11, [sp, #0x20]
        str     r6, [sp, #0x3C]
LCUF47:
        ldr     r1, [sp, #0x18]
        ldrsh   r6, [r0], #2
        ldrsh   r10, [r8], #2
        ldrsh   r5, [r1, +r4]
        ldrsh   r11, [r9], #2
        ldrsh   r1, [r7], #2
        mul     r10, r6, r10
        mul     r5, r6, r5
        str     r11, [sp, #0x58]
        mul     r1, r6, r1
        ldr     r11, [sp, #0x58]
        mul     r6, r6, r11
        ldr     r11, [sp, #0x10]
        add     r4, r4, #2
        adds    r11, r11, r5
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        adc     r11, r11, r5, asr #31
        ldr     r5, [sp, #8]
        str     r11, [sp, #0x14]
        adds    r5, r1, r5
        str     r5, [sp, #8]
        ldr     r5, [sp, #0xC]
        adc     r5, r5, r1, asr #31
        ldr     r1, [sp, #4]
        adds    r2, r10, r2
        str     r5, [sp, #0xC]
        adc     r1, r1, r10, asr #31
        adds    r12, r6, r12
        str     r1, [sp, #4]
        adc     r3, r3, r6, asr #31
        subs    lr, lr, #1
        bne     LCUF47
        ldr     r5, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r11, [sp, #0x20]
        ldr     r9, [sp, #0x18]
        ldr     r6, [sp, #0x3C]
LCUF48:
        ldr     r0, [sp, #0x2C]
        sub     r11, r11, #4
        cmp     r11, #0
        str     r7, [r0]
        str     r5, [r0, #4]
        str     r10, [r0, #8]
        str     r8, [r0, #0xC]
        str     r2, [r0, #0x10]
        str     r1, [r0, #0x14]
        str     r12, [r0, #0x18]
        str     r3, [r0, #0x1C]
        add     r0, r0, #0x20
        add     r9, r9, #8
        str     r0, [sp, #0x2C]
        bgt     LCUF46
        ldr     r8, [sp, #0x1C]
        ldr     r3, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x34]
        ldr     r10, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r7, [sp, #0x50]
LCUF49:
        cmp     r3, #0
        ble     LCUF55
        sub     r11, r6, #6
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x38]
        str     r0, [sp, #0x24]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x34]
        str     r10, [sp, #0x44]
        str     r5, [sp, #0x4C]
LCUF50:
        cmp     r6, #0
        mov     r0, r7
        movle   r1, #0
        movle   r2, r1
        ble     LCUF54
        cmp     r6, #6
        blt     LCUF73
        mov     r11, #0
        mov     r2, r11
        mov     r1, r2
        mov     r12, r1
        mov     r10, #2
        mov     r8, #4
        mov     r5, #6
        mov     lr, #8
        str     r1, [sp, #0x48]
        str     r3, [sp, #0x28]
        str     r4, [sp, #0x2C]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x50]
LCUF51:
        ldrsh   r1, [r9, +r11]
        ldrsh   r3, [r0]
        ldrsh   r4, [r9, +r10]
        ldrsh   r6, [r0, #2]
        ldrsh   r7, [r9, +r8]
        mul     r1, r3, r1
        ldrsh   r3, [r0, #4]
        mul     r4, r6, r4
        add     r12, r12, #5
        mul     r3, r3, r7
        adds    r2, r2, r1
        add     r11, r11, #0xA
        str     r4, [sp, #0x58]
        ldrsh   r4, [r9, +r5]
        add     r10, r10, #0xA
        add     r8, r8, #0xA
        add     r5, r5, #0xA
        str     r4, [sp, #0x54]
        ldrsh   r6, [r0, #8]
        ldrsh   r4, [r0, #6]
        ldrsh   r7, [r9, +lr]
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x54]
        add     r0, r0, #0xA
        add     lr, lr, #0xA
        mul     r6, r4, r6
        ldr     r4, [sp, #0x48]
        adc     r4, r4, r1, asr #31
        ldr     r1, [sp, #0x30]
        mul     r1, r1, r7
        ldr     r7, [sp, #0x58]
        adds    r2, r2, r7
        adc     r7, r4, r7, asr #31
        adds    r2, r2, r3
        adc     r3, r7, r3, asr #31
        adds    r2, r2, r6
        adc     r6, r3, r6, asr #31
        adds    r2, r2, r1
        adc     r1, r6, r1, asr #31
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x38]
        cmp     r12, r1
        ble     LCUF51
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x28]
        ldr     r4, [sp, #0x2C]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x50]
LCUF52:
        mov     lr, r12, lsl #1
LCUF53:
        ldrsh   r8, [r9, +lr]
        ldrsh   r5, [r0], #2
        add     lr, lr, #2
        add     r12, r12, #1
        mul     r8, r5, r8
        adds    r2, r2, r8
        adc     r1, r1, r8, asr #31
        cmp     r12, r6
        blt     LCUF53
LCUF54:
        str     r2, [r4]
        str     r1, [r4, #4]
        subs    r3, r3, #1
        add     r9, r9, #2
        add     r4, r4, #8
        bne     LCUF50
        ldr     r8, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
        ldr     r12, [sp, #0x40]
        ldr     lr, [sp, #0x34]
        ldr     r10, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
LCUF55:
        subs    r10, r10, r0
        add     r8, r8, r0, lsl #3
        movne   r9, #0
        beq     LCUF12
LCUF56:
        cmp     lr, r10
        movlt   r10, lr
        bic     r2, r10, #3
        sub     lr, lr, r9
        add     r12, r5, r12, lsl #1
        cmp     r2, #0
        add     r1, r12, r9, lsl #1
        sub     r10, r10, r2
        sub     r3, lr, #3
        sub     r6, lr, r2
        ble     LCUF60
        str     r6, [sp, #0x44]
        str     r10, [sp, #0x40]
        str     r2, [sp, #0x4C]
        str     r3, [sp, #0x38]
        str     r7, [sp, #0x50]
LCUF57:
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x50]
        cmp     r2, #0
        ble     LCUF76
        mov     lr, #0
        mov     r12, lr
        mov     r2, r12
        mov     r6, r2
        str     r6, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     r6, [sp, #0x30]
        add     r4, r1, #2
        add     r5, r1, #4
        add     r11, r1, #6
        mov     r10, r6
        mov     r9, r4
        mov     r7, r5
        str     r4, [sp, #0x3C]
        str     r5, [sp, #0x48]
        str     r1, [sp, #0x34]
        str     r8, [sp, #0x1C]
LCUF58:
        ldr     r0, [sp, #0x34]
        ldrsh   r4, [r3], #2
        ldrsh   r5, [r7], #2
        ldrsh   r1, [r0, +r10]
        ldrsh   r8, [r11], #2
        ldrsh   r0, [r9], #2
        mul     r5, r4, r5
        mul     r1, r4, r1
        str     r8, [sp, #0x58]
        mul     r0, r4, r0
        ldr     r8, [sp, #0x58]
        add     r6, r6, #1
        mul     r4, r4, r8
        ldr     r8, [sp, #0x2C]
        add     r10, r10, #2
        adds    r8, r8, r1
        str     r8, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        adc     r8, r8, r1, asr #31
        ldr     r1, [sp, #0x24]
        str     r8, [sp, #0x30]
        adds    r1, r0, r1
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        adc     r1, r1, r0, asr #31
        ldr     r0, [sp, #0x20]
        adds    r2, r5, r2
        str     r1, [sp, #0x28]
        adc     r0, r0, r5, asr #31
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x38]
        adds    lr, r4, lr
        adc     r12, r12, r4, asr #31
        cmp     r6, r0
        blt     LCUF58
        ldr     r4, [sp, #0x3C]
        ldr     r5, [sp, #0x48]
        ldr     r1, [sp, #0x34]
        ldr     r8, [sp, #0x1C]
LCUF59:
        mov     r6, r6, lsl #1
        ldrsh   r0, [r3]
        ldrsh   r9, [r1, +r6]
        ldrsh   r11, [r3, #2]
        ldrsh   r7, [r4, +r6]
        ldrsh   r10, [r5, +r6]
        mul     r9, r0, r9
        ldrsh   r0, [r3, #4]
        mul     r11, r11, r7
        ldr     r7, [sp, #0x4C]
        mul     r10, r0, r10
        ldr     r0, [sp, #0x2C]
        add     r1, r1, #8
        sub     r7, r7, #4
        str     r7, [sp, #0x4C]
        adds    r0, r0, r9
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x30]
        adc     r9, r0, r9, asr #31
        ldr     r0, [sp, #0x38]
        sub     r0, r0, #4
        str     r0, [sp, #0x38]
        adds    r0, r11, r10
        mov     r10, r10, asr #31
        adc     r11, r10, r11, asr #31
        ldr     r10, [sp, #0x58]
        adds    r0, r10, r0
        adc     r11, r9, r11
        str     r11, [r8, #4]
        str     r0, [r8]
        ldrsh   r10, [r3]
        ldrsh   r9, [r5, +r6]
        ldrsh   r4, [r4, +r6]
        ldrsh   r11, [r3, #2]
        mul     r10, r10, r4
        mul     r9, r11, r9
        adds    r4, r10, r9
        mov     r11, r9, asr #31
        adc     r9, r11, r10, asr #31
        ldr     r10, [sp, #0x24]
        adds    r4, r4, r10
        ldr     r10, [sp, #0x28]
        str     r4, [r8, #8]
        adc     r10, r9, r10
        str     r10, [r8, #0xC]
        ldrsh   r6, [r5, +r6]
        ldrsh   r3, [r3]
        str     lr, [r8, #0x18]
        str     r12, [r8, #0x1C]
        mul     r6, r3, r6
        adds    r2, r6, r2
        str     r2, [r8, #0x10]
        ldr     r2, [sp, #0x20]
        adc     r6, r2, r6, asr #31
        str     r6, [r8, #0x14]
        cmp     r7, #0
        add     r8, r8, #0x20
        bgt     LCUF57
        ldr     r6, [sp, #0x44]
        ldr     r10, [sp, #0x40]
        ldr     r7, [sp, #0x50]
LCUF60:
        cmp     r10, #0
        ble     LCUF66
LCUF61:
        cmp     r6, #0
        mov     r5, #0
        mov     r4, r7
        movle   r11, r5
        movle   r9, r11
        ble     LCUF65
        cmp     r6, #6
        blt     LCUF75
        mov     r11, r5
        mov     r3, #6
        str     r3, [sp, #0x3C]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0x3C]
        mov     r9, r11
        sub     r0, r6, #6
        mov     r2, r9
        mov     lr, #2
        mov     r12, #4
        mov     r3, #8
        str     r9, [sp, #0x4C]
        str     r0, [sp, #0x48]
        str     r6, [sp, #0x44]
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x50]
LCUF62:
        ldrsh   r0, [r1, +r5]
        ldrsh   r6, [r4]
        ldrsh   r7, [r1, +lr]
        ldrsh   r8, [r4, #2]
        ldrsh   r9, [r1, +r12]
        mul     r6, r6, r0
        ldrsh   r0, [r4, #4]
        mul     r7, r8, r7
        add     r2, r2, #5
        mul     r9, r0, r9
        adds    r0, r11, r6
        add     r5, r5, #0xA
        str     r7, [sp, #0x58]
        ldrsh   r7, [r1, +r10]
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        add     r10, r10, #0xA
        str     r7, [sp, #0x54]
        ldrsh   r8, [r4, #8]
        ldrsh   r7, [r4, #6]
        ldrsh   r11, [r1, +r3]
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x54]
        add     r4, r4, #0xA
        add     r3, r3, #0xA
        mul     r8, r7, r8
        ldr     r7, [sp, #0x4C]
        adc     r7, r7, r6, asr #31
        ldr     r6, [sp, #0x38]
        mul     r6, r6, r11
        ldr     r11, [sp, #0x58]
        adds    r0, r0, r11
        adc     r11, r7, r11, asr #31
        adds    r0, r0, r9
        adc     r9, r11, r9, asr #31
        adds    r0, r0, r8
        adc     r8, r9, r8, asr #31
        adds    r11, r0, r6
        ldr     r0, [sp, #0x48]
        adc     r6, r8, r6, asr #31
        str     r6, [sp, #0x4C]
        cmp     r2, r0
        ble     LCUF62
        ldr     r9, [sp, #0x4C]
        ldr     r6, [sp, #0x44]
        ldr     r10, [sp, #0x40]
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x50]
LCUF63:
        mov     r3, r2, lsl #1
LCUF64:
        ldrsh   lr, [r1, +r3]
        ldrsh   r12, [r4], #2
        add     r3, r3, #2
        add     r2, r2, #1
        mul     lr, r12, lr
        adds    r11, r11, lr
        adc     r9, r9, lr, asr #31
        cmp     r2, r6
        blt     LCUF64
LCUF65:
        str     r11, [r8]
        str     r9, [r8, #4]
        subs    r10, r10, #1
        sub     r6, r6, #1
        add     r1, r1, #2
        add     r8, r8, #8
        bne     LCUF61
LCUF66:
        mov     r0, #0
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCUF67:
        mov     r3, #0
        mov     r0, r3
        mov     r10, r0
        b       LCUF8
LCUF68:
        mov     r5, #0
        mov     r3, r5
        mov     r2, r3
        mov     r0, r2
        mov     r4, r0
        str     r4, [sp]
        str     r4, [sp, #4]
        str     r4, [sp, #8]
        str     r4, [sp, #0xC]
        str     r4, [sp, #0x10]
        add     r4, r6, #2
        add     r12, r6, #4
        b       LCUF4
LCUF69:
        mov     r6, r4
        mov     r11, r6
        mov     r1, r11
        b       LCUF31
LCUF70:
        mov     r12, #0
        mov     r3, r12
        mov     r1, r3
        mov     r5, r1
        str     r5, [sp, #0x20]
        str     r5, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r5, [sp, #0x2C]
        str     r5, [sp, #0x30]
        add     lr, r9, #2
        add     r4, r9, #4
        b       LCUF27
LCUF71:
        mov     r6, #0
        mov     r0, r6
        mov     r3, r0
        b       LCUF20
LCUF72:
        mov     r7, #0
        mov     r5, r7
        mov     lr, r5
        mov     r2, lr
        mov     r11, r2
        mov     r10, r11
        mov     r9, r10
        mov     r8, r9
        b       LCUF16
LCUF73:
        mov     r12, #0
        mov     r2, r12
        mov     r1, r2
        b       LCUF52
LCUF74:
        mov     r5, #0
        mov     r12, r5
        mov     r3, r12
        mov     r2, r3
        mov     r1, r2
        mov     r10, r1
        mov     r8, r10
        mov     r7, r8
        b       LCUF48
LCUF75:
        mov     r11, r5
        mov     r9, r11
        mov     r2, r9
        b       LCUF63
LCUF76:
        mov     lr, #0
        mov     r12, lr
        mov     r2, r12
        mov     r6, r2
        str     r6, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     r6, [sp, #0x30]
        add     r4, r1, #2
        add     r5, r1, #4
        b       LCUF59
LCUF77:
        mov     r0, #0
        mov     r8, r0
        mov     r9, r8
        b       LCUF41
LCUF78:
        mov     r6, #0
        mov     lr, r6
        mov     r12, lr
        mov     r0, r12
        mov     r4, r0
        str     r4, [sp, #0x54]
        str     r4, [sp]
        str     r4, [sp, #4]
        str     r4, [sp, #8]
        str     r4, [sp, #0xC]
        add     r4, r3, #2
        add     r5, r3, #4
        b       LCUF37
LCUF79:
        mvn     r0, #5
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCUF80:
        mvn     r0, #7
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}


