        .text
        .align  4
        .globl  ownsMDCTInv_Radix2_32s


ownsMDCTInv_Radix2_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r12, [sp, #0x90]
        ldr     r7, [sp, #0x8C]
        mov     r4, r0
        str     r12, [sp, #0x1C]
        mov     r5, r1
        mov     r12, r7, asr #2
        subs    r6, r12, #1
        str     r12, [sp, #0x18]
        mov     r11, #0
        mov     r9, r6
        movmi   r10, r11
        bmi     LGGS1
        mov     r12, r7, asr #1
        sub     r12, r12, #1
        sub     r1, r7, #1
        add     r12, r4, r12, lsl #3
        str     r12, [sp, #0x28]
        sub     r12, r7, #2
        add     r0, r5, r1, lsl #2
        mov     lr, r9, lsl #3
        str     r0, [sp, #0x2C]
        add     r0, r4, r12, lsl #2
        add     r12, r5, r12, lsl #2
        add     lr, lr, #0xC
        str     r12, [sp, #0x40]
        add     lr, lr, r4
        mov     r12, r9, lsl #1
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x3C]
        add     r8, r5, r9, lsl #3
        add     lr, r4, r9, lsl #3
        mov     r12, #4
        str     r3, [sp, #0x24]
        str     r5, [sp, #4]
        ldr     r5, [sp, #0x3C]
        ldr     r3, [sp, #0x30]
        mov     r10, r11
        add     r1, r4, r1, lsl #2
        add     lr, r12, lr
        str     r1, [sp, #0x38]
        str     r0, [sp, #0x34]
        add     r12, r12, r8
        str     r10, [sp, #0xC]
        str     r6, [sp, #0x14]
        str     r7, [sp, #0x20]
        str     r2, [sp, #8]
        str     r4, [sp]
        str     r11, [sp, #0x10]
LGGS0:
        ldr     r0, [r3, #-0xC]
        ldr     r2, [sp, #0x34]
        rsb     r1, r5, #0
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x38]
        ldr     r4, [r12]
        ldr     r2, [r2, +r1, lsl #2]
        ldr     r10, [r0, +r1, lsl #2]
        ldr     r0, [r8]
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x54]
        smull   r11, r7, r4, r10
        rsb     r4, r9, #0
        sub     r5, r5, #2
        smull   r0, r6, r0, r2
        ldr     r2, [lr], #-8
        adds    r11, r0, r11
        adc     r0, r6, r7
        str     r0, [r3, #-0xC]
        ldr     r11, [r8], #-8
        ldr     r6, [r12], #-8
        eor     r7, r0, r0, asr #31
        smull   r10, r11, r11, r10
        sub     r7, r7, r0, asr #31
        ldr     r0, [sp, #0x54]
        smull   r6, r0, r6, r0
        str     r6, [sp, #0x54]
        ldr     r6, [sp, #0xC]
        adds    r6, r7, r6
        str     r6, [sp, #0x4C]
        ldr     r6, [sp, #0x10]
        adc     r7, r6, r7, asr #31
        ldr     r6, [sp, #0x54]
        str     r7, [sp, #0x48]
        subs    r10, r10, r6
        sbc     r10, r11, r0
        str     r10, [r3, #-8]!
        ldr     r0, [sp, #0x40]
        ldr     r7, [sp, #0x50]
        eor     r11, r10, r10, asr #31
        ldr     r6, [r0, +r1, lsl #2]
        ldr     r0, [sp, #0x2C]
        sub     r11, r11, r10, asr #31
        ldr     r0, [r0, +r1, lsl #2]
        smull   r6, r7, r6, r7
        smull   r10, r0, r0, r2
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x4C]
        adds    r0, r11, r0
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        adc     r0, r0, r11, asr #31
        adds    r10, r6, r10
        ldr     r6, [sp, #0x54]
        adc     r6, r7, r6
        ldr     r7, [sp, #0x28]
        str     r6, [r7, +r4, lsl #3]
        ldr     r7, [sp, #0x40]
        ldr     r10, [sp, #0x2C]
        ldr     r7, [r7, +r1, lsl #2]
        ldr     r1, [r10, +r1, lsl #2]
        eor     r10, r6, r6, asr #31
        smull   r2, r7, r7, r2
        sub     r6, r10, r6, asr #31
        ldr     r10, [sp, #0x50]
        smull   r10, r11, r1, r10
        ldr     r1, [sp, #0x4C]
        adds    r1, r6, r1
        adc     r6, r0, r6, asr #31
        ldr     r0, [sp, #0x28]
        subs    r2, r2, r10
        sbc     r7, r7, r11
        add     r4, r0, r4, lsl #3
        str     r7, [r4, #4]
        eor     r0, r7, r7, asr #31
        sub     r7, r0, r7, asr #31
        adds    r1, r7, r1
        adc     r7, r6, r7, asr #31
        subs    r9, r9, #1
        str     r1, [sp, #0xC]
        str     r7, [sp, #0x10]
        bpl     LGGS0
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
        ldr     r11, [sp, #0x10]
LGGS1:
        mvn     lr, #0xE, 4
        subs    r12, r10, lr
        sbcs    r8, r11, #0
        movlt   r12, #0
        movlt   r8, #0
        orrs    r8, r12, r8
        moveq   r12, #0
        beq     LGGS6
        mov     r12, #0
LGGS2:
        mov     r8, r11, lsl #31
        orr     r10, r8, r10, lsr #1
        subs    r9, r10, lr
        mov     r11, r11, asr #1
        sbcs    r8, r11, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        add     r12, r12, #1
        bne     LGGS2
        cmp     r12, #0
        ble     LGGS6
        cmp     r7, #0
        sub     r11, r12, #1
        mov     r10, #1
        ble     LGGS6
        cmp     r7, #6
        movlt   lr, #0
        blt     LGGS4
        mov     lr, #0
        sub     r9, r7, #6
        add     r8, r4, #4
        str     r2, [sp, #8]
        str     r5, [sp, #4]
        str     r4, [sp]
LGGS3:
        ldr     r0, [r8, #-4]
        ldr     r1, [r8]
        ldr     r2, [r8, #4]
        ldr     r4, [r8, #8]
        ldr     r5, [r8, #0xC]
        add     r0, r0, r10, lsl r11
        add     r1, r1, r10, lsl r11
        add     r2, r2, r10, lsl r11
        add     r4, r4, r10, lsl r11
        add     r5, r5, r10, lsl r11
        mov     r0, r0, asr r12
        mov     r1, r1, asr r12
        mov     r2, r2, asr r12
        mov     r4, r4, asr r12
        mov     r5, r5, asr r12
        add     lr, lr, #5
        str     r0, [r8, #-4]
        str     r1, [r8]
        str     r2, [r8, #4]
        str     r4, [r8, #8]
        str     r5, [r8, #0xC]
        cmp     lr, r9
        add     r8, r8, #0x14
        ble     LGGS3
        ldr     r2, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
LGGS4:
        add     r8, r4, lr, lsl #2
LGGS5:
        ldr     r9, [r8]
        add     lr, lr, #1
        cmp     lr, r7
        add     r9, r9, r10, lsl r11
        mov     r9, r9, asr r12
        str     r9, [r8], #4
        blt     LGGS5
LGGS6:
        ldr     r1, [sp, #0x1C]
        mov     r0, r4
        sub     r8, r1, r12
        bl      ownsIMDCT_FFT_32sc_I
        sub     r2, r8, #3
        cmp     r2, #0
        mov     r3, r7, asr #3
        ble     LGGS9
        sub     r12, r2, #1
        subs    r3, r3, #1
        str     r12, [sp, #0x2C]
        bmi     LGGS8
        ldr     r12, [sp, #0x18]
        mov     r8, r7, asr #1
        sub     r9, r8, #2
        str     r9, [sp, #0x50]
        ldr     r1, [sp, #0x50]
        add     r6, r4, r6, lsl #3
        str     r6, [sp, #0x28]
        add     r1, r4, r1, lsl #2
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x50]
        sub     lr, r8, #1
        add     r12, r4, r12, lsl #3
        add     r1, r5, r1, lsl #2
        str     r1, [sp, #0x20]
        add     r1, r4, lr, lsl #2
        str     r12, [sp, #0x54]
        sub     r0, r7, #1
        add     r12, r8, #1
        str     r1, [sp, #0x1C]
        add     r1, r5, lr, lsl #2
        sub     r11, r7, #2
        add     lr, r4, lr, lsl #3
        add     r7, r4, r12, lsl #2
        str     lr, [sp, #0x14]
        str     r7, [sp, #0x4C]
        add     lr, r5, r0, lsl #2
        mov     r6, r3, lsl #3
        add     r7, r4, r8, lsl #2
        add     r8, r5, r8, lsl #2
        str     r8, [sp, #0x34]
        add     r9, r6, #4
        str     lr, [sp, #0x18]
        add     lr, r4, r0, lsl #2
        add     r10, r6, #0xC
        add     r8, r5, r3, lsl #3
        add     r0, r4, r11, lsl #2
        add     r6, r4, r3, lsl #3
        add     r12, r5, r12, lsl #2
        add     r4, r9, r4
        add     r11, r5, r11, lsl #2
        mov     r9, #4
        mov     r5, #4
        str     r8, [sp, #0x40]
        add     r6, r9, r6
        add     r8, r5, r8
        ldr     r9, [sp, #0x34]
        ldr     r5, [sp, #0x4C]
        add     r12, r12, r3, lsl #3
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x54]
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x2C]
        str     r0, [sp, #0x10]
        mov     r0, r3, lsl #1
        add     r5, r5, r3, lsl #3
        add     r9, r9, r3, lsl #3
        add     r7, r7, r3, lsl #3
        add     r1, r10, r1
        str     r7, [sp, #0x34]
        str     r9, [sp, #8]
        str     r6, [sp]
        str     r5, [sp, #0xC]
        str     r8, [sp, #0x44]
        str     r0, [sp, #0x48]
        str     r11, [sp, #0x3C]
        str     lr, [sp, #0x38]
LGGS7:
        ldr     r0, [sp, #0x40]
        ldr     lr, [r4, #-4]
        ldr     r5, [r4]
        ldr     r6, [r0]
        ldr     r0, [sp, #0x44]
        rsb     r8, r3, #0
        ldr     r0, [r0]
        smull   r7, r9, r6, lr
        str     r9, [sp, #0x50]
        smull   r6, r9, r6, r5
        str     r7, [sp, #0x54]
        smull   r5, r7, r0, r5
        ldr     r11, [sp, #0x54]
        str     r7, [sp, #0x4C]
        smull   r7, r10, lr, r0
        ldr     lr, [sp, #0x14]
        adds    r5, r11, r5
        ldr     r11, [sp, #0x4C]
        ldr     r0, [lr, +r8, lsl #3]
        ldr     r5, [sp, #0x50]
        add     lr, lr, r8, lsl #3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x28]
        adc     r5, r5, r11
        ldr     r11, [sp, #0x28]
        ldr     r0, [r0, +r8, lsl #3]
        subs    r6, r6, r7
        mov     r6, #1
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x48]
        ldr     lr, [lr, #4]
        add     r8, r11, r8, lsl #3
        ldr     r8, [r8, #4]
        add     r5, r5, r6, lsl r12
        ldr     r6, [sp, #0x38]
        sbc     r9, r9, r10
        str     r8, [sp, #0x54]
        mov     r5, r5, asr r2
        rsb     r5, r5, #0
        rsb     r0, r0, #0
        str     r5, [r6, +r0, lsl #2]
        ldr     r6, [sp, #0x1C]
        mov     r5, #1
        add     r5, r9, r5, lsl r12
        mov     r5, r5, asr r2
        rsb     r5, r5, #0
        str     r5, [r6, +r0, lsl #2]
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x3C]
        ldr     r8, [sp, #0x58]
        ldr     r5, [r5, +r0, lsl #2]
        ldr     r11, [sp, #0x40]
        ldr     r9, [r6, +r0, lsl #2]
        ldr     r6, [r1, #-0xC]
        sub     r11, r11, #8
        str     r6, [sp, #0x50]
        smull   r6, r7, r5, lr
        str     r7, [sp, #0x4C]
        smull   r5, r7, r8, r5
        smull   r10, r8, r8, r9
        str     r10, [sp, #0x58]
        smull   r9, r10, r9, lr
        ldr     lr, [r1, #-8]!
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x44]
        sub     r11, r11, #8
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x58]
        adds    r6, r11, r6
        ldr     r6, [sp, #0x4C]
        adc     r8, r8, r6
        subs    r9, r9, r5
        mov     r5, #1
        add     r8, r8, r5, lsl r12
        ldr     r5, [sp, #0x24]
        mov     r8, r8, asr r2
        sbc     r10, r10, r7
        str     r8, [r5, +r0, lsl #2]
        ldr     r6, [sp, #0x10]
        mov     r5, #1
        add     r5, r10, r5, lsl r12
        mov     r5, r5, asr r2
        str     r5, [r6, +r0, lsl #2]
        ldr     r6, [sp, #0x30]
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x5C]
        ldr     r9, [r6, +r0, lsl #2]
        ldr     r11, [sp, #0x48]
        ldr     r5, [r5, +r0, lsl #2]
        ldr     r0, [sp, #0x5C]
        sub     r11, r11, #2
        str     r11, [sp, #0x48]
        smull   r6, r8, r0, r5
        ldr     r0, [sp, #0x54]
        smull   r5, r7, r5, r0
        str     r7, [sp, #0x58]
        smull   r0, r7, r9, r0
        smull   r9, r10, r10, r9
        adds    r0, r6, r0
        adc     r7, r8, r7
        mov     r0, #1
        add     r0, r7, r0, lsl r12
        subs    r5, r5, r9
        ldr     r5, [sp, #0x58]
        mov     r0, r0, asr r2
        rsb     r0, r0, #0
        sbc     r10, r5, r10
        ldr     r5, [sp, #0xC]
        str     r0, [r5]
        mov     r0, #1
        ldr     r5, [sp]
        add     r0, r10, r0, lsl r12
        mov     r0, r0, asr r2
        rsb     r0, r0, #0
        str     r0, [r5]
        ldr     r5, [sp, #8]
        ldr     r0, [sp, #4]
        ldr     r7, [sp, #0x50]
        ldr     r10, [r5]
        ldr     r5, [sp, #0xC]
        ldr     r0, [r0]
        ldr     r11, [sp]
        sub     r5, r5, #8
        str     r5, [sp, #0xC]
        smull   r6, r8, r0, lr
        smull   r5, r9, r0, r7
        smull   r0, r7, r7, r10
        smull   lr, r10, r10, lr
        sub     r11, r11, #8
        str     r11, [sp]
        ldr     r11, [sp, #4]
        adds    r6, r0, r6
        adc     r8, r7, r8
        sub     r11, r11, #8
        str     r11, [sp, #4]
        ldr     r11, [sp, #8]
        mov     r0, #1
        add     r8, r8, r0, lsl r12
        sub     r11, r11, #8
        str     r11, [sp, #8]
        subs    lr, lr, r5
        mov     r8, r8, asr r2
        str     r8, [r4, #-4]
        ldr     lr, [sp, #0x34]
        mov     r0, #1
        sbc     r10, r10, r9
        add     r0, r10, r0, lsl r12
        mov     r0, r0, asr r2
        str     r0, [lr], #-8
        subs    r3, r3, #1
        str     lr, [sp, #0x34]
        sub     r4, r4, #8
        bpl     LGGS7
LGGS8:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LGGS9:
        subs    r3, r3, #1
        bmi     LGGS8
        mov     r1, r3, lsl #3
        mov     lr, r7, asr #1
        add     r2, r2, #0x1F
        sub     r8, r7, #1
        sub     r11, r7, #2
        str     r2, [sp, #0x30]
        add     r7, r1, #4
        add     r0, r1, #0xC
        add     r1, r4, r3, lsl #3
        sub     r2, lr, #2
        str     r2, [sp, #0x58]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x58]
        add     r6, r4, r6, lsl #3
        str     r6, [sp, #0x24]
        ldr     r6, [sp, #0x18]
        add     r1, r4, r1, lsl #2
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x58]
        add     r6, r4, r6, lsl #3
        str     r6, [sp, #0x5C]
        add     r1, r5, r1, lsl #2
        sub     r6, lr, #1
        str     r1, [sp, #0x18]
        add     r1, r4, r6, lsl #2
        str     r1, [sp, #0x1C]
        add     r1, r5, r6, lsl #2
        add     r6, r4, r6, lsl #3
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x30]
        add     r12, lr, #1
        add     r10, r4, lr, lsl #2
        mov     r6, r6, asr #31
        str     r6, [sp, #0xC]
        add     r6, r5, r8, lsl #2
        add     r2, r5, lr, lsl #2
        str     r6, [sp, #8]
        add     r6, r4, r11, lsl #2
        add     r9, r4, r12, lsl #2
        add     lr, r5, r3, lsl #3
        add     r12, r5, r12, lsl #2
        str     r6, [sp, #0x28]
        ldr     r6, [sp, #0x44]
        add     r11, r5, r11, lsl #2
        mov     r5, #4
        add     r8, r4, r8, lsl #2
        add     r7, r7, r4
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x5C]
        add     r4, r5, lr
        add     r5, r5, r6
        str     r5, [sp]
        str     r4, [sp, #0x38]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x30]
        add     r0, r0, r1
        mov     r1, r3, lsl #1
        add     r9, r9, r3, lsl #3
        add     r12, r12, r3, lsl #3
        add     r2, r2, r3, lsl #3
        add     r10, r10, r3, lsl #3
        str     r8, [sp, #0x2C]
        str     r10, [sp, #0x44]
        str     r2, [sp, #0x40]
        str     r12, [sp, #0x3C]
        str     r9, [sp, #0x34]
        str     lr, [sp, #0x4C]
        str     r1, [sp, #4]
        str     r0, [sp, #0x50]
        str     r11, [sp, #0x48]
        str     r3, [sp, #0x54]
LGGS10:
        ldr     r9, [r7, #-4]
        ldr     r1, [sp, #0x4C]
        ldr     r0, [r7]
        ldr     r3, [sp, #0x10]
        ldr     r12, [r1]
        ldr     r1, [sp, #0x38]
        ldr     r8, [r1]
        ldr     r1, [sp, #4]
        rsb     r6, r1, #0
        smull   r11, r1, r12, r9
        smull   r12, lr, r12, r0
        smull   r0, r2, r8, r0
        smull   r9, r8, r9, r8
        adds    r0, r11, r0
        adc     r1, r1, r2
        str     r9, [sp, #0x5C]
        ldr     r9, [sp, #0x54]
        ldr     r11, [sp, #0x5C]
        mov     r2, r4
        rsb     r9, r9, #0
        ldr     r10, [r3, +r9, lsl #3]
        subs    r12, r12, r11
        add     r3, r3, r9, lsl #3
        sbc     r8, lr, r8
        str     r10, [sp, #0x58]
        ldr     r10, [r3, #4]
        mov     r3, r5
        str     r12, [sp, #0x5C]
        bl      __ashrdi3
        mov     r11, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r8
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r1, [sp, #0x24]
        mov     r2, r4
        mov     r3, r5
        ldr     r8, [r1, +r9, lsl #3]
        add     r9, r1, r9, lsl #3
        ldr     r1, [r9, #4]
        rsb     r11, r11, #0
        rsb     r0, r0, #0
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x2C]
        str     r11, [r1, +r6, lsl #2]
        ldr     r1, [sp, #0x1C]
        str     r0, [r1, +r6, lsl #2]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #8]
        ldr     lr, [sp, #0x58]
        ldr     r9, [r1, +r6, lsl #2]
        ldr     r1, [sp, #0x4C]
        ldr     r0, [r0, +r6, lsl #2]
        sub     r1, r1, #8
        str     r1, [sp, #0x4C]
        smull   r12, r1, r0, r10
        smull   r0, r11, lr, r0
        str     r11, [sp, #0x60]
        smull   r10, r11, r9, r10
        str     r0, [sp, #0x64]
        smull   r0, lr, lr, r9
        ldr     r9, [sp, #0x38]
        adds    r0, r0, r12
        adc     r1, lr, r1
        sub     r9, r9, #8
        str     r9, [sp, #0x38]
        bl      __ashrdi3
        ldr     r1, [sp, #0x64]
        mov     r9, r0
        mov     r2, r4
        subs    r0, r10, r1
        ldr     r1, [sp, #0x60]
        mov     r3, r5
        sbc     r1, r11, r1
        bl      __ashrdi3
        ldr     r12, [sp, #0x50]
        mov     r2, r4
        ldr     r1, [r12, #-0xC]
        mov     r3, r5
        str     r1, [sp, #0x64]
        ldr     r10, [r12, #-8]
        ldr     r1, [sp, #0x20]
        str     r9, [r1, +r6, lsl #2]
        ldr     r1, [sp, #0x28]
        str     r0, [r1, +r6, lsl #2]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     lr, [sp, #0x5C]
        ldr     r0, [r0, +r6, lsl #2]
        ldr     r11, [sp, #0x50]
        ldr     r9, [r1, +r6, lsl #2]
        smull   r12, r1, r8, r0
        smull   r6, r0, r0, lr
        str     r0, [sp, #0x60]
        smull   r0, lr, r9, lr
        smull   r8, r9, r8, r9
        sub     r11, r11, #8
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #4]
        adds    r0, r12, r0
        adc     r1, r1, lr
        sub     r11, r11, #2
        str     r11, [sp, #4]
        bl      __ashrdi3
        ldr     r1, [sp, #0x60]
        mov     r11, r0
        subs    r0, r6, r8
        sbc     r1, r1, r9
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r1, [sp, #0x34]
        rsb     r11, r11, #0
        rsb     r0, r0, #0
        str     r11, [r1]
        ldr     r1, [sp]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r1]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x64]
        ldr     r9, [r1]
        ldr     r1, [sp, #0x34]
        ldr     r11, [sp]
        ldr     r0, [r0]
        sub     r1, r1, #8
        str     r1, [sp, #0x34]
        smull   r1, r12, r0, r10
        smull   r6, r8, r0, lr
        smull   r0, lr, lr, r9
        smull   r10, r9, r9, r10
        sub     r11, r11, #8
        str     r11, [sp]
        ldr     r11, [sp, #0x3C]
        adds    r0, r0, r1
        adc     r1, lr, r12
        sub     r11, r11, #8
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x40]
        sub     r11, r11, #8
        str     r11, [sp, #0x40]
        bl      __ashrdi3
        subs    r10, r10, r6
        sbc     r1, r9, r8
        mov     r6, r0
        mov     r0, r10
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        str     r6, [r7, #-4]
        ldr     r1, [sp, #0x44]
        sub     r7, r7, #8
        str     r0, [r1], #-8
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0x44]
        subs    r0, r0, #1
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x54]
        bpl     LGGS10
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}


