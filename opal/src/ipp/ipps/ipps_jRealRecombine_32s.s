        .text
        .align  4
        .globl  _ipps_jRealRecombine_32s


_ipps_jRealRecombine_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        movs    lr, r1, asr #1
        beq     LCAE2
        cmp     r2, #0
        sub     r1, r1, #1
        mov     r12, #0
        ble     LCAE3
        cmp     lr, #1
        ble     LCAE1
        mov     r1, r1, lsl #4
        add     r1, r1, #0x1C
        add     r3, r3, #4
        sub     r2, lr, #1
        add     r1, r1, r0
        add     r8, r0, #0xC
        str     r2, [sp, #4]
        str     r3, [sp]
        str     lr, [sp, #8]
        str     r0, [sp, #0xC]
LCAE0:
        ldr     r12, [r8, #4]
        ldr     r2, [r1, #-0x18]
        ldr     r0, [r1, #-0x1C]
        str     r2, [sp, #0x10]
        ldr     r2, [r8, #8]
        ldr     lr, [sp, #0x10]
        str     r2, [sp, #0x14]
        ldr     r2, [r1, #-0x14]
        ldr     r3, [sp, #0x14]
        str     r2, [sp, #0x18]
        ldr     r2, [r8, #0xC]
        str     r2, [sp, #0x1C]
        ldr     r2, [r1, #-0x10]
        str     r2, [sp, #0x20]
        ldr     r2, [r8, #0x10]
        str     r2, [sp, #0x24]
        subs    r2, r12, r0
        str     r2, [sp, #0x28]
        ldr     r2, [sp]
        sbc     lr, r3, lr
        ldr     r3, [sp, #0x1C]
        ldr     r9, [r2, #4]
        ldr     r4, [r2, #8]
        ldr     r2, [sp, #0x18]
        mov     r10, lr, asr #1
        mov     lr, lr, lsl #31
        adds    r6, r3, r2
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x20]
        adc     r5, r3, r2
        umull   r2, r7, r10, r4
        str     r7, [sp, #0x2C]
        rsb     r3, r9, #0
        adds    r0, r12, r0
        str     r2, [sp, #0x30]
        umull   r2, r7, r9, r10
        str     r7, [sp, #0x34]
        str     r2, [sp, #0x38]
        mov     r2, r5, asr #1
        umull   r7, r11, r2, r3
        str     r11, [sp, #0x3C]
        mov     r5, r5, lsl #31
        orr     r6, r5, r6, lsr #1
        str     r7, [sp, #0x40]
        umull   r7, r11, r4, r2
        ldr     r5, [sp, #0x14]
        str     r11, [sp, #0x44]
        mov     r11, r3, asr #31
        str     r7, [sp, #0x48]
        ldr     r7, [sp, #0x28]
        str     r0, [sp, #0x28]
        mov     r6, r6, lsr #1
        orr     lr, lr, r7, lsr #1
        ldr     r7, [sp, #0x18]
        mov     r0, lr, lsr #1
        umull   r12, lr, r4, r0
        str     lr, [sp, #0x4C]
        str     r12, [sp, #0x50]
        umull   r12, lr, r9, r0
        str     lr, [sp, #0x54]
        str     r12, [sp, #0x58]
        umull   r12, lr, r3, r6
        str     lr, [sp, #0x5C]
        str     r12, [sp, #0x60]
        umull   r12, lr, r4, r6
        str     lr, [sp, #0x64]
        ldr     lr, [sp, #0x2C]
        str     r12, [sp, #0x68]
        mov     r12, r4, asr #31
        mla     lr, r10, r12, lr
        str     lr, [sp, #0x2C]
        ldr     lr, [sp, #0x10]
        adc     lr, r5, lr
        ldr     r5, [sp, #0x1C]
        subs    r5, r5, r7
        str     r5, [sp, #0x1C]
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp, #0x20]
        str     r11, [sp, #0x24]
        sbc     r5, r5, r7
        ldr     r7, [sp, #0x3C]
        mla     r7, r2, r11, r7
        ldr     r11, [sp, #0x4C]
        str     r7, [sp, #0x3C]
        mov     r7, #0
        mov     r7, r7, asr #1
        mla     r11, r4, r7, r11
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x54]
        mla     r11, r9, r7, r11
        mov     r7, #0
        mov     r7, r7, asr #1
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x5C]
        mla     r11, r3, r7, r11
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x64]
        mla     r11, r4, r7, r11
        ldr     r7, [sp, #0x4C]
        mla     r7, r12, r0, r7
        str     r11, [sp, #0x64]
        mov     r11, r10, asr #31
        str     r11, [sp, #0x20]
        str     r7, [sp, #0x4C]
        ldr     r7, [sp, #0x2C]
        mla     r7, r11, r4, r7
        ldr     r11, [sp, #0x24]
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #0x5C]
        mla     r7, r11, r6, r7
        ldr     r11, [sp, #0x20]
        str     r7, [sp, #0x5C]
        ldr     r7, [sp, #0x34]
        mla     r7, r9, r11, r7
        mov     r11, lr, lsl #31
        mov     r9, r9, asr #31
        str     r7, [sp, #0x34]
        ldr     r7, [sp, #0x64]
        mla     r7, r12, r6, r7
        mov     r6, r2, asr #31
        str     r7, [sp, #0x64]
        ldr     r7, [sp, #0x3C]
        mla     r3, r6, r3, r7
        ldr     r7, [sp, #0x44]
        mla     r7, r4, r6, r7
        ldr     r4, [sp, #0x40]
        ldr     r6, [sp, #0x30]
        mla     r7, r12, r2, r7
        ldr     r12, [sp, #0x50]
        ldr     r2, [sp, #0x60]
        adds    r4, r6, r4
        ldr     r6, [sp, #0x28]
        orr     r6, r11, r6, lsr #1
        ldr     r11, [sp, #0x2C]
        adc     r3, r11, r3
        adds    r2, r12, r2
        ldr     r12, [sp, #0x5C]
        ldr     r11, [sp, #0x4C]
        adc     r12, r11, r12
        ldr     r11, [sp, #0x34]
        mla     r10, r9, r10, r11
        ldr     r11, [sp, #0x54]
        mla     r0, r9, r0, r11
        mov     r9, r12, lsl #3
        orr     r9, r9, r2, lsr #29
        mov     r2, r4, lsr #30
        orr     r3, r2, r3, lsl #2
        adds    r4, r9, r4, lsl #2
        adc     r12, r3, r12, asr #29
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        ldr     r9, [sp, #0x58]
        adds    r2, r3, r2
        ldr     r3, [sp, #0x68]
        adc     r7, r10, r7
        mov     r10, r5, lsl #31
        adds    r3, r9, r3
        ldr     r9, [sp, #0x64]
        adc     r9, r0, r9
        ldr     r0, [sp, #0x1C]
        orr     r0, r10, r0, lsr #1
        mov     r10, r9, lsl #3
        orr     r3, r10, r3, lsr #29
        mov     r10, r2, lsr #30
        adds    r3, r3, r2, lsl #2
        orr     r7, r10, r7, lsl #2
        adc     r2, r7, r9, asr #29
        subs    r7, r6, r4
        rsc     r9, r12, lr, asr #1
        adds    r4, r6, r4
        adc     r6, r12, lr, asr #1
        subs    r12, r0, r3
        rsc     lr, r2, r5, asr #1
        str     r7, [r8, #4]
        str     r9, [r8, #8]
        rsbs    r3, r3, #0
        str     r4, [r1, #-0x1C]
        str     r6, [r1, #-0x18]
        rsc     r2, r2, #0
        subs    r3, r3, r0
        str     r12, [r8, #0xC]
        str     lr, [r8, #0x10]!
        sbc     r2, r2, r5, asr #1
        str     r2, [r1, #-0x10]
        str     r3, [r1, #-0x14]
        ldr     r0, [sp, #4]
        ldr     r2, [sp]
        sub     r1, r1, #0x10
        subs    r0, r0, #1
        str     r0, [sp, #4]
        add     r2, r2, #8
        str     r2, [sp]
        bne     LCAE0
        ldr     lr, [sp, #8]
        ldr     r0, [sp, #0xC]
LCAE1:
        add     lr, r0, lr, lsl #4
        ldr     r1, [lr, #8]
        ldr     r0, [lr, #0xC]
        rsbs    r1, r1, #0
        str     r1, [lr, #8]
        rsc     r0, r0, #0
        str     r0, [lr, #0xC]
LCAE2:
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LCAE3:
        cmp     lr, #1
        ble     LCAE2
        mov     r1, r1, lsl #4
        add     r1, r1, #0x1C
        add     r2, r1, r0
        add     r3, r3, #4
        sub     lr, lr, #1
        add     r1, r0, #0xC
        str     lr, [sp, #0xC]
        str     r3, [sp, #4]
LCAE4:
        ldr     r3, [r2, #-0x18]
        ldr     lr, [r1, #4]
        ldr     r0, [r2, #-0x1C]
        str     r3, [sp, #0x68]
        ldr     r3, [r1, #8]
        ldr     r4, [sp, #0x68]
        subs    r7, r0, lr
        str     r3, [sp, #0x64]
        ldr     r3, [r2, #-0x14]
        ldr     r12, [sp, #0x64]
        str     r3, [sp, #0x60]
        ldr     r3, [r1, #0xC]
        ldr     r5, [sp, #0x60]
        sbc     r4, r4, r12
        str     r3, [sp, #0x5C]
        ldr     r3, [r2, #-0x10]
        ldr     r12, [sp, #0x5C]
        mov     r10, r4, asr #1
        str     r3, [sp, #0x58]
        ldr     r3, [r1, #0x10]
        mov     r4, r4, lsl #31
        adds    r5, r12, r5
        str     r3, [sp, #0x54]
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #0x54]
        orr     r7, r4, r7, lsr #1
        ldr     r9, [r3, #4]
        ldr     r3, [r3, #8]
        str     r5, [sp, #0x50]
        ldr     r5, [sp, #0x58]
        ldr     r4, [sp, #0x50]
        adc     r6, r12, r5
        rsb     r5, r3, #0
        umull   r8, r3, r10, r5
        str     r3, [sp, #0x4C]
        adds    r0, lr, r0
        str     r0, [sp, #0x50]
        mov     r0, r7, lsr #1
        str     r8, [sp, #0x48]
        umull   r8, r3, r9, r10
        str     r3, [sp, #0x44]
        ldr     r7, [sp, #0x60]
        rsb     r12, r9, #0
        mov     r3, r6, asr #1
        str     r8, [sp, #0x40]
        umull   r11, r8, r3, r12
        mov     r6, r6, lsl #31
        str     r8, [sp, #0x3C]
        orr     r4, r6, r4, lsr #1
        umull   r6, lr, r5, r0
        str     r11, [sp, #0x38]
        umull   r11, r8, r5, r3
        str     lr, [sp, #0x2C]
        str     r6, [sp, #0x28]
        umull   r6, lr, r9, r0
        str     r8, [sp, #0x34]
        str     lr, [sp, #0x24]
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x3C]
        str     r6, [sp, #0x20]
        ldr     r6, [sp, #0x68]
        mov     r8, r4, lsr #1
        umull   r4, lr, r12, r8
        str     lr, [sp, #0x1C]
        str     r4, [sp, #0x18]
        umull   r4, lr, r5, r8
        str     lr, [sp, #0x14]
        mov     lr, r5, asr #31
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x4C]
        mla     r4, r10, lr, r4
        str     r4, [sp, #0x4C]
        ldr     r4, [sp, #0x64]
        adc     r4, r4, r6
        ldr     r6, [sp, #0x5C]
        subs    r7, r7, r6
        str     r7, [sp, #0x68]
        ldr     r7, [sp, #0x58]
        ldr     r6, [sp, #0x54]
        sbc     r6, r7, r6
        mov     r7, r12, asr #31
        mla     r11, r3, r7, r11
        str     r7, [sp, #0x64]
        mov     r7, #0
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x2C]
        mov     r7, r7, asr #1
        mla     r11, r5, r7, r11
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0x1C]
        mla     r11, r12, r7, r11
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x24]
        mla     r11, r9, r7, r11
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x14]
        mla     r11, r5, r7, r11
        ldr     r7, [sp, #0x5C]
        mla     r7, lr, r0, r7
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x4C]
        str     r7, [sp, #0x5C]
        mov     r7, r10, asr #31
        str     r7, [sp, #0x2C]
        mla     r11, r7, r5, r11
        ldr     r7, [sp, #0x64]
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x58]
        mla     r11, r7, r8, r11
        ldr     r7, [sp, #0x2C]
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x44]
        mla     r11, r9, r7, r11
        ldr     r7, [sp, #0x3C]
        mov     r9, r9, asr #31
        str     r11, [sp, #0x58]
        mla     r7, lr, r8, r7
        ldr     r8, [sp, #0x60]
        ldr     r11, [sp, #0x50]
        str     r7, [sp, #0x44]
        mov     r7, r3, asr #31
        mla     r12, r7, r12, r8
        ldr     r8, [sp, #0x34]
        mla     r8, r5, r7, r8
        ldr     r5, [sp, #0x48]
        ldr     r7, [sp, #0x38]
        mla     r8, lr, r3, r8
        ldr     r3, [sp, #0x28]
        ldr     lr, [sp, #0x18]
        adds    r5, r5, r7
        mov     r7, r4, lsl #31
        orr     r7, r7, r11, lsr #1
        ldr     r11, [sp, #0x4C]
        adc     r12, r11, r12
        ldr     r11, [sp, #0x64]
        adds    r3, r3, lr
        ldr     lr, [sp, #0x5C]
        adc     lr, lr, r11
        ldr     r11, [sp, #0x58]
        mla     r10, r9, r10, r11
        ldr     r11, [sp, #0x54]
        mla     r0, r9, r0, r11
        mov     r9, lr, lsl #3
        orr     r9, r9, r3, lsr #29
        mov     r3, r5, lsr #30
        orr     r12, r3, r12, lsl #2
        adds    r5, r9, r5, lsl #2
        adc     lr, r12, lr, asr #29
        ldr     r3, [sp, #0x40]
        ldr     r12, [sp, #0x30]
        ldr     r9, [sp, #0x10]
        adds    r3, r3, r12
        ldr     r12, [sp, #0x20]
        adc     r8, r10, r8
        ldr     r10, [sp, #0x68]
        adds    r12, r12, r9
        ldr     r9, [sp, #0x44]
        adc     r9, r0, r9
        mov     r0, r6, lsl #31
        orr     r0, r0, r10, lsr #1
        mov     r10, r9, lsl #3
        orr     r12, r10, r12, lsr #29
        mov     r10, r3, lsr #30
        adds    r12, r12, r3, lsl #2
        orr     r8, r10, r8, lsl #2
        adc     r3, r8, r9, asr #29
        subs    r8, r7, r5
        rsc     r9, lr, r4, asr #1
        adds    r5, r7, r5
        adc     r7, lr, r4, asr #1
        subs    lr, r0, r12
        rsc     r4, r3, r6, asr #1
        str     r8, [r1, #4]
        str     r9, [r1, #8]
        rsbs    r12, r12, #0
        str     r5, [r2, #-0x1C]
        str     r7, [r2, #-0x18]
        rsc     r3, r3, #0
        subs    r12, r12, r0
        str     lr, [r1, #0xC]
        str     r4, [r1, #0x10]!
        sbc     r3, r3, r6, asr #1
        str     r3, [r2, #-0x10]
        str     r12, [r2, #-0x14]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #4]
        sub     r2, r2, #0x10
        subs    r3, r3, #1
        str     r3, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #4]
        bne     LCAE4
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}


