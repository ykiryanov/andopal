        .text
        .align  4
        .globl  _ipps_jCcsRecombine_32s


_ipps_jCcsRecombine_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        movs    r12, r1, asr #1
        beq     LCAG2
        cmp     r2, #0
        sub     r1, r1, #1
        mov     r2, #0
        ble     LCAG4
        cmp     r12, #1
        ble     LCAG3
        mov     r1, r1, lsl #4
        add     r1, r1, #0x1C
        add     r3, r3, #4
        sub     lr, r12, #1
        add     r1, r1, r0
        add     r6, r0, #0xC
        str     lr, [sp, #4]
        str     r3, [sp]
        str     r12, [sp, #8]
        str     r0, [sp, #0xC]
LCAG0:
        ldr     r4, [r1, #-0x1C]
        ldr     r3, [r6, #4]
        ldr     r5, [r6, #8]
        ldr     r8, [r1, #-0x18]
        ldr     r0, [r6, #0xC]
        subs    r2, r3, r4
        str     r0, [sp, #0x10]
        ldr     r0, [r1, #-0x14]
        sbc     r9, r5, r8
        str     r0, [sp, #0x14]
        ldr     r0, [r6, #0x10]
        str     r0, [sp, #0x18]
        ldr     r0, [r1, #-0x10]
        ldr     r7, [sp, #0x18]
        str     r0, [sp, #0x1C]
        ldr     r0, [sp]
        ldr     r10, [r0, #4]
        str     r2, [sp, #0x20]
        ldr     lr, [r0, #8]
        umull   r0, r2, r10, r9
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x14]
        adds    r2, r2, r0
        umull   r0, r12, r9, lr
        str     r12, [sp, #0x2C]
        rsb     r12, r10, #0
        mov     r2, r2, lsr #1
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x1C]
        adc     r0, r7, r0
        umull   r7, r11, r0, r12
        str     r11, [sp, #0x34]
        adds    r4, r3, r4
        str     r4, [sp, #0x64]
        str     r7, [sp, #0x38]
        umull   r7, r11, lr, r0
        ldr     r3, [sp, #0x10]
        str     r11, [sp, #0x3C]
        adc     r4, r5, r8
        ldr     r8, [sp, #0x1C]
        str     r7, [sp, #0x40]
        ldr     r7, [sp, #0x20]
        ldr     r5, [sp, #0x14]
        mov     r7, r7, lsr #1
        str     r7, [sp, #0x20]
        umull   r7, r11, lr, r7
        str     r11, [sp, #0x44]
        subs    r3, r3, r5
        ldr     r5, [sp, #0x18]
        str     r7, [sp, #0x48]
        ldr     r7, [sp, #0x20]
        sbc     r5, r5, r8
        str     r5, [sp, #0x1C]
        ldr     r5, [sp, #0x34]
        umull   r7, r11, r10, r7
        str     r11, [sp, #0x4C]
        mov     r8, r12, asr #31
        mla     r5, r0, r8, r5
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x50]
        umull   r7, r11, r12, r2
        str     r11, [sp, #0x54]
        str     r5, [sp, #0x34]
        mov     r5, #0
        str     r7, [sp, #0x58]
        umull   r7, r11, lr, r2
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x2C]
        mov     r8, r5, asr #1
        ldr     r5, [sp, #0x44]
        str     r7, [sp, #0x60]
        mov     r7, lr, asr #31
        mla     r11, r9, r7, r11
        mla     r5, lr, r8, r5
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x4C]
        mla     r11, r10, r8, r11
        mov     r8, #0
        mov     r8, r8, asr #1
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x54]
        mla     r11, r12, r8, r11
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x5C]
        mla     r11, lr, r8, r11
        ldr     r8, [sp, #0x20]
        mla     r5, r7, r8, r5
        ldr     r8, [sp, #0x2C]
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x18]
        str     r5, [sp, #0x44]
        mov     r5, r9, asr #31
        mla     r8, r5, lr, r8
        str     r8, [sp, #0x2C]
        ldr     r8, [sp, #0x54]
        mla     r8, r11, r2, r8
        ldr     r11, [sp, #0x34]
        str     r8, [sp, #0x54]
        ldr     r8, [sp, #0x24]
        mla     r8, r10, r5, r8
        ldr     r5, [sp, #0x5C]
        mov     r10, r10, asr #31
        mla     r2, r7, r2, r5
        mla     r8, r10, r9, r8
        mov     r5, r0, asr #31
        mla     r12, r5, r12, r11
        ldr     r11, [sp, #0x3C]
        ldr     r9, [sp, #0x4C]
        mla     r5, lr, r5, r11
        ldr     lr, [sp, #0x38]
        ldr     r11, [sp, #0x30]
        adds    lr, r11, lr
        ldr     r11, [sp, #0x20]
        mla     r5, r7, r0, r5
        ldr     r0, [sp, #0x2C]
        mla     r9, r10, r11, r9
        ldr     r7, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        adc     r12, r0, r12
        ldr     r0, [sp, #0x58]
        adds    r7, r7, r0
        ldr     r0, [sp, #0x54]
        adc     r0, r10, r0
        mov     r10, lr, lsr #30
        orr     r12, r10, r12, lsl #2
        mov     r10, r0, lsl #3
        orr     r7, r10, r7, lsr #29
        adds    lr, r7, lr, lsl #2
        adc     r0, r12, r0, asr #29
        ldr     r12, [sp, #0x40]
        ldr     r7, [sp, #0x28]
        adds    r12, r7, r12
        adc     r5, r8, r5
        ldr     r7, [sp, #0x60]
        ldr     r8, [sp, #0x50]
        adds    r7, r8, r7
        mov     r8, r12, lsr #30
        adc     r2, r9, r2
        orr     r5, r8, r5, lsl #2
        mov     r8, r2, lsl #3
        orr     r7, r8, r7, lsr #29
        ldr     r8, [sp, #0x64]
        adds    r12, r7, r12, lsl #2
        adc     r2, r5, r2, asr #29
        adds    r7, r8, lr
        adc     r5, r4, r0
        str     r5, [r6, #8]
        str     r7, [r6, #4]
        ldr     r5, [sp, #0x1C]
        subs    lr, r8, lr
        sbc     r4, r4, r0
        adds    r0, r3, r12
        str     lr, [r1, #-0x1C]
        str     r4, [r1, #-0x18]
        adc     r5, r5, r2
        str     r0, [r6, #0xC]
        str     r5, [r6, #0x10]!
        ldr     r0, [sp, #0x1C]
        subs    r12, r12, r3
        str     r12, [r1, #-0x14]
        sbc     r2, r2, r0
        str     r2, [r1, #-0x10]!
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
        subs    r0, r0, #1
        str     r0, [sp, #4]
        add     r2, r2, #8
        str     r2, [sp]
        bne     LCAG0
        ldr     r12, [sp, #8]
        ldr     r0, [sp, #0xC]
        mov     r12, r12, lsl #4
        add     r2, r0, r12
        ldr     r1, [r2, #8]
        ldr     r3, [r2, #0xC]
LCAG1:
        ldr     r5, [r12, +r0]
        add     r2, r0, r12
        ldr     r4, [r2, #4]
        mov     lr, r5, lsr #31
        mov     r5, r5, lsl #1
        str     r5, [r12, +r0]
        mov     r0, r1, lsr #31
        orr     r4, lr, r4, lsl #1
        orr     r3, r0, r3, lsl #1
        mov     r1, r1, lsl #1
        str     r4, [r2, #4]
        str     r1, [r2, #8]
        str     r3, [r2, #0xC]
LCAG2:
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCAG3:
        mov     r12, r12, lsl #4
        add     r2, r0, r12
        ldr     r1, [r2, #8]
        ldr     r3, [r2, #0xC]
        b       LCAG1
LCAG4:
        cmp     r12, #1
        ble     LCAG6
        mov     r1, r1, lsl #4
        add     r1, r1, #0x1C
        add     r3, r3, #4
        sub     lr, r12, #1
        add     r1, r1, r0
        add     r6, r0, #0xC
        str     lr, [sp, #4]
        str     r3, [sp]
        str     r12, [sp, #8]
        str     r0, [sp, #0xC]
LCAG5:
        ldr     r4, [r6, #4]
        ldr     r9, [r6, #8]
        ldr     r5, [r1, #-0x1C]
        ldr     r0, [r1, #-0x18]
        subs    r2, r4, r5
        str     r0, [sp, #0x64]
        ldr     r0, [r6, #0xC]
        str     r0, [sp, #0x60]
        ldr     r0, [r1, #-0x14]
        str     r0, [sp, #0x5C]
        ldr     r0, [r6, #0x10]
        str     r0, [sp, #0x58]
        ldr     r0, [sp]
        ldr     lr, [r1, #-0x10]
        ldr     r10, [r0, #4]
        ldr     r0, [r0, #8]
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x64]
        rsb     r12, r10, #0
        sbc     r8, r9, r2
        umull   r3, r2, r10, r8
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x60]
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x5C]
        adds    r3, r2, r3
        str     r3, [sp, #0x48]
        rsb     r2, r0, #0
        umull   r3, r0, r8, r2
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x58]
        str     r3, [sp, #0x40]
        adc     r0, r0, lr
        umull   r7, r3, r0, r12
        str     r3, [sp, #0x3C]
        adds    r5, r4, r5
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #0x60]
        str     r7, [sp, #0x38]
        umull   r7, r3, r2, r0
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x54]
        ldr     r4, [sp, #0x64]
        str     r7, [sp, #0x30]
        mov     r3, r3, lsr #1
        str     r3, [sp, #0x54]
        umull   r3, r7, r2, r3
        str     r7, [sp, #0x2C]
        adc     r4, r9, r4
        str     r4, [sp, #0x64]
        ldr     r4, [sp, #0x5C]
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x54]
        ldr     r9, [sp, #0x3C]
        subs    r4, r5, r4
        umull   r3, r7, r10, r3
        ldr     r5, [sp, #0x58]
        str     r7, [sp, #0x24]
        sbc     lr, r5, lr
        mov     r5, r12, asr #31
        mla     r9, r0, r5, r9
        str     r3, [sp, #0x20]
        ldr     r3, [sp, #0x48]
        str     r5, [sp, #0x60]
        mov     r5, #0
        str     r9, [sp, #0x5C]
        ldr     r9, [sp, #0x2C]
        mov     r3, r3, lsr #1
        umull   r11, r7, r12, r3
        str     r7, [sp, #0x48]
        mov     r5, r5, asr #1
        mla     r9, r2, r5, r9
        str     r11, [sp, #0x1C]
        umull   r11, r7, r2, r3
        str     r7, [sp, #0x18]
        mov     r7, r2, asr #31
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x44]
        mla     r11, r8, r7, r11
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        mla     r11, r12, r5, r11
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x24]
        mla     r11, r10, r5, r11
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x18]
        mla     r11, r2, r5, r11
        ldr     r5, [sp, #0x54]
        mla     r9, r7, r5, r9
        mov     r5, r8, asr #31
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x58]
        str     r9, [sp, #0x2C]
        ldr     r9, [sp, #0x44]
        mla     r9, r5, r2, r9
        str     r9, [sp, #0x44]
        ldr     r9, [sp, #0x60]
        mla     r11, r9, r3, r11
        ldr     r9, [sp, #0x50]
        mla     r9, r10, r5, r9
        ldr     r5, [sp, #0x3C]
        mov     r10, r10, asr #31
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x5C]
        mla     r3, r7, r3, r5
        mla     r9, r10, r8, r9
        mov     r5, r0, asr #31
        mla     r12, r5, r12, r11
        ldr     r11, [sp, #0x34]
        ldr     r8, [sp, #0x54]
        mla     r5, r2, r5, r11
        ldr     r11, [sp, #0x38]
        ldr     r2, [sp, #0x40]
        adds    r2, r2, r11
        ldr     r11, [sp, #0x48]
        mla     r5, r7, r0, r5
        ldr     r0, [sp, #0x44]
        ldr     r7, [sp, #0x1C]
        mla     r8, r10, r8, r11
        ldr     r10, [sp, #0x60]
        adc     r12, r0, r12
        ldr     r0, [sp, #0x28]
        adds    r7, r0, r7
        ldr     r0, [sp, #0x2C]
        adc     r0, r0, r10
        mov     r10, r2, lsr #30
        orr     r12, r10, r12, lsl #2
        mov     r10, r0, lsl #3
        orr     r7, r10, r7, lsr #29
        adds    r2, r7, r2, lsl #2
        adc     r0, r12, r0, asr #29
        ldr     r12, [sp, #0x4C]
        ldr     r7, [sp, #0x30]
        adds    r12, r12, r7
        adc     r9, r9, r5
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x14]
        adds    r5, r5, r7
        mov     r7, r12, lsr #30
        adc     r3, r8, r3
        orr     r9, r7, r9, lsl #2
        mov     r7, r3, lsl #3
        ldr     r8, [sp, #0x10]
        orr     r5, r7, r5, lsr #29
        ldr     r7, [sp, #0x64]
        adds    r12, r5, r12, lsl #2
        adc     r3, r9, r3, asr #29
        adds    r5, r8, r2
        adc     r7, r7, r0
        subs    r2, r8, r2
        ldr     r8, [sp, #0x64]
        str     r5, [r1, #-0x1C]
        str     r7, [r1, #-0x18]
        str     r2, [r6, #4]
        sbc     r0, r8, r0
        adds    r5, r4, r12
        str     r0, [r6, #8]
        adc     r7, lr, r3
        str     r5, [r1, #-0x14]
        str     r7, [r1, #-0x10]!
        subs    r12, r12, r4
        sbc     r3, r3, lr
        str     r12, [r6, #0xC]
        str     r3, [r6, #0x10]!
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        subs    r2, r2, #1
        str     r2, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp]
        bne     LCAG5
        ldr     r12, [sp, #8]
        ldr     r0, [sp, #0xC]
LCAG6:
        mov     r12, r12, lsl #4
        add     r2, r0, r12
        ldr     r1, [r2, #8]
        ldr     r3, [r2, #0xC]
        rsbs    r1, r1, #0
        str     r1, [r2, #8]
        rsc     r3, r3, #0
        str     r3, [r2, #0xC]
        b       LCAG1


