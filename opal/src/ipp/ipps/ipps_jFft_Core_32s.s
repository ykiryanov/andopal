        .text
        .align  4
        .globl  _ipps_jFft_Core_32s


_ipps_jFft_Core_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB8
        cmp     r1, #2
        mov     r4, r1
        mov     lr, r1, asr #3
        mov     r12, r1, asr #2
        beq     LCAF15
        cmp     r2, #0
        blt     LCAF13
LCAF0:
        cmp     r1, #2
        mov     r7, r1
        ble     LCAF10
        ldr     r6, [pc, #0xFEC]
        mov     r2, #1
        str     r3, [sp, #0x24]
        rsb     r5, r6, #0
        str     r5, [sp, #0x28]
LCAF1:
        cmp     r1, #0
        ble     LCAF3
        mov     r9, #0
        str     r2, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r12, [sp]
        str     lr, [sp, #0x14]
        str     r4, [sp, #8]
        str     r1, [sp, #4]
LCAF2:
        ldr     r2, [sp]
        add     r1, r9, r2
        str     r1, [sp, #0x38]
        add     r3, r2, r1
        str     r3, [sp, #0x34]
        ldr     r6, [r0, +r3, lsl #4]
        ldr     r3, [sp, #0x34]
        ldr     r11, [r0, +r9, lsl #4]
        ldr     r1, [r0, +r1, lsl #4]
        add     lr, r2, r3
        add     r2, r0, r9, lsl #4
        str     lr, [sp, #0x30]
        add     r3, r0, r3, lsl #4
        str     r3, [sp, #0x2C]
        str     r2, [sp, #0x20]
        ldr     r7, [r2, #4]
        ldr     r5, [r3, #4]
        ldr     r8, [r0, +lr, lsl #4]
        ldr     r2, [r2, #8]
        ldr     r3, [sp, #0x2C]
        adds    r12, r11, r6
        adc     r4, r7, r5
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        ldr     r3, [r3, #8]
        add     lr, r0, lr, lsl #4
        ldr     r2, [r2, #0xC]
        subs    r6, r11, r6
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x2C]
        sbc     r5, r7, r5
        adds    r7, r1, r8
        ldr     r3, [r3, #0xC]
        str     r12, [sp, #0x40]
        ldr     r12, [sp, #0x38]
        add     r12, r0, r12, lsl #4
        str     r12, [sp, #0x44]
        ldr     r12, [r12, #4]
        str     lr, [sp, #0x48]
        ldr     r10, [lr, #4]
        str     r4, [sp, #0x4C]
        ldr     lr, [lr, #8]
        ldr     r4, [sp, #0x44]
        adc     r11, r12, r10
        str     lr, [sp, #0x50]
        ldr     lr, [sp, #0x44]
        subs    r1, r1, r8
        sbc     r12, r12, r10
        ldr     lr, [lr, #8]
        ldr     r10, [sp, #0x18]
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x48]
        ldr     r4, [r4, #0xC]
        ldr     lr, [lr, #0xC]
        str     r12, [sp, #0x5C]
        ldr     r12, [sp, #0x1C]
        str     r11, [sp, #0x58]
        ldr     r11, [sp, #0x50]
        adds    r8, r12, r10
        str     r8, [sp, #0x60]
        adc     r8, r2, r3
        subs    r12, r12, r10
        sbc     r2, r2, r3
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x54]
        adds    r10, r2, r11
        adc     r3, r4, lr
        subs    r2, r2, r11
        sbc     r4, r4, lr
        ldr     lr, [sp, #0x40]
        ldr     r11, [sp, #0x4C]
        adds    lr, lr, r7
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x58]
        adc     lr, r11, lr
        str     lr, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        str     lr, [r0, +r9, lsl #4]
        ldr     r11, [sp, #0x50]
        adds    lr, r2, r6
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x20]
        str     r11, [lr, #4]
        adc     lr, r4, r5
        str     lr, [sp, #0x50]
        ldr     lr, [sp, #0x34]
        ldr     r11, [sp, #0x54]
        str     r11, [r0, +lr, lsl #4]
        ldr     lr, [sp, #0x40]
        ldr     r11, [sp, #0x50]
        subs    r7, lr, r7
        ldr     lr, [sp, #0x2C]
        str     r11, [lr, #4]
        ldr     r11, [sp, #0x58]
        ldr     lr, [sp, #0x4C]
        sbc     lr, lr, r11
        ldr     r11, [sp, #0x38]
        subs    r6, r6, r2
        sbc     r5, r5, r4
        str     r7, [r0, +r11, lsl #4]
        ldr     r2, [sp, #0x44]
        str     lr, [r2, #4]
        ldr     r2, [sp, #0x30]
        str     r6, [r0, +r2, lsl #4]
        ldr     lr, [sp, #0x48]
        ldr     r2, [sp, #0x60]
        str     r5, [lr, #4]
        ldr     r4, [sp, #0x60]
        adds    r2, r2, r10
        adc     lr, r8, r3
        subs    r10, r4, r10
        sbc     r8, r8, r3
        ldr     r3, [sp, #0x20]
        str     lr, [r3, #0xC]
        str     r2, [r3, #8]
        ldr     r3, [sp, #0x1C]
        ldr     lr, [sp, #0x5C]
        subs    r2, r12, r1
        sbc     r3, r3, lr
        ldr     lr, [sp, #0x44]
        adds    r12, r1, r12
        str     r10, [lr, #8]
        str     r8, [lr, #0xC]
        ldr     r1, [sp, #0x2C]
        str     r2, [r1, #8]
        str     r3, [r1, #0xC]
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0x5C]
        add     r9, r9, r1
        ldr     r1, [sp, #0x1C]
        adc     r1, r2, r1
        ldr     r2, [sp, #4]
        cmp     r9, r2
        ldr     r2, [sp, #0x48]
        str     r12, [r2, #8]
        str     r1, [r2, #0xC]
        blt     LCAF2
        ldr     r2, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x14]
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #4]
LCAF3:
        cmp     r7, #4
        ble     LCAF9
        cmp     r12, #1
        ble     LCAF9
        ldr     r3, [pc, #0xD68]
        mov     r6, #1
        mov     r5, #0
        str     r7, [sp, #0x10]
        str     r4, [sp, #8]
LCAF4:
        cmp     r6, lr
        add     r5, r2, r5
        beq     LCAF6
        mov     r9, r5, lsl #1
        cmp     r6, r1
        add     r8, r5, r9
        mov     r7, r6
        bge     LCAF8
        str     r12, [sp]
        ldr     r12, [sp, #0x24]
        mov     r4, r5, lsl #3
        mov     r10, r5, lsl #4
        str     r10, [sp, #0x18]
        str     r4, [sp, #0x34]
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x2C]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r2, [sp, #0xC]
        str     lr, [sp, #0x14]
        str     r1, [sp, #4]
        str     r0, [sp, #0x3C]
LCAF5:
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        ldr     lr, [sp, #0x3C]
        ldr     r2, [sp, #0x3C]
        ldr     r9, [r0, +r1, lsl #4]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x38]
        ldr     r3, [r12, +r0, lsl #3]
        ldr     r0, [sp]
        add     r1, r1, r0
        str     r1, [sp, #0x60]
        ldr     r2, [r2, +r1, lsl #4]
        str     r2, [sp, #0x5C]
        add     r2, r0, r1
        ldr     r1, [sp, #0x3C]
        str     r2, [sp, #0x58]
        ldr     r8, [r1, +r2, lsl #4]
        ldr     r2, [sp, #0x38]
        add     r1, r1, r2, lsl #4
        str     r1, [sp, #0x54]
        ldr     r2, [r1, #0xC]
        ldr     r4, [r1, #8]
        ldr     r10, [r1, #4]
        ldr     r1, [sp, #0x58]
        add     lr, lr, r1, lsl #4
        str     lr, [sp, #0x50]
        ldr     r11, [lr, #4]
        ldr     r5, [lr, #8]
        ldr     lr, [lr, #0xC]
        add     r1, r0, r1
        ldr     r0, [sp, #0x3C]
        str     r1, [sp, #0x4C]
        ldr     r7, [sp, #0x4C]
        ldr     r1, [r0, +r1, lsl #4]
        adds    r0, r9, r8
        str     r0, [sp, #0x44]
        adc     r0, r10, r11
        str     r1, [sp, #0x48]
        str     r0, [sp, #0x40]
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x3C]
        subs    r9, r9, r8
        sbc     r8, r10, r11
        ldr     r10, [sp, #0x48]
        add     r0, r0, r1, lsl #4
        str     r0, [sp, #0x64]
        ldr     r6, [r0, #4]
        ldr     r1, [r0, #8]
        str     r1, [sp, #0x68]
        ldr     r1, [r0, #0xC]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, r7, lsl #4
        str     r0, [sp, #0x6C]
        ldr     r7, [r0, #4]
        ldr     r0, [r0, #8]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        ldr     r0, [r0, #0xC]
        str     r9, [sp, #0x74]
        ldr     r9, [sp, #0x5C]
        adds    r10, r9, r10
        adc     r9, r6, r7
        str     r9, [sp, #0x7C]
        str     r10, [sp, #0x78]
        ldr     r10, [sp, #0x5C]
        ldr     r9, [sp, #0x48]
        subs    r10, r10, r9
        sbc     r6, r6, r7
        str     r6, [sp, #0x48]
        adds    r6, r4, r5
        str     r6, [sp, #0x80]
        adc     r6, r2, lr
        str     r6, [sp, #0x84]
        subs    r5, r4, r5
        sbc     r6, r2, lr
        ldr     r2, [sp, #0x68]
        ldr     lr, [sp, #0x70]
        str     r10, [sp, #0x5C]
        adds    lr, r2, lr
        adc     r2, r1, r0
        str     r2, [sp, #0x8C]
        str     lr, [sp, #0x88]
        ldr     lr, [sp, #0x68]
        ldr     r2, [sp, #0x70]
        subs    r2, lr, r2
        sbc     r1, r1, r0
        ldr     r0, [sp, #0x74]
        adds    r0, r2, r0
        str     r0, [sp, #0x70]
        adc     r0, r1, r8
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x30]
        add     r0, r12, r0, lsl #3
        str     r0, [sp, #0x90]
        ldr     r7, [r0, #4]
        ldr     r0, [sp, #0x74]
        subs    r2, r0, r2
        sbc     r4, r8, r1
        umull   r1, r0, r4, r3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x5C]
        mov     r2, r2, lsr #1
        adds    lr, r0, r5
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x94]
        mov     lr, lr, lsr #1
        umull   r10, r9, lr, r7
        adc     r1, r0, r6
        umull   r0, r8, r1, r7
        str     r10, [sp, #0x9C]
        mov     r10, r1, asr #31
        str     r10, [sp, #0xA0]
        mov     r10, r4, asr #31
        str     r0, [sp, #0x98]
        str     r10, [sp, #0xA4]
        umull   r11, r10, r2, r3
        str     r10, [sp, #0xA8]
        mov     r0, #0
        mov     r10, r7, asr #31
        mla     r8, r1, r10, r8
        mla     r10, lr, r10, r9
        str     r11, [sp, #0xAC]
        ldr     r11, [sp, #0x74]
        mov     r0, r0, asr #1
        mov     r9, r3, asr #31
        mla     r11, r4, r9, r11
        str     r11, [sp, #0x74]
        ldr     r11, [sp, #0xA0]
        mla     r8, r11, r7, r8
        mla     r7, r0, r7, r10
        ldr     r11, [sp, #0xA8]
        ldr     r10, [sp, #0x5C]
        mla     r9, r2, r9, r11
        subs    r5, r5, r10
        ldr     r10, [sp, #0x74]
        str     r5, [sp, #0xA8]
        ldr     r5, [sp, #0xA4]
        mla     r9, r0, r3, r9
        mla     r5, r5, r3, r10
        ldr     r3, [sp, #0x48]
        ldr     r10, [sp, #0x44]
        sbc     r3, r6, r3
        ldr     r6, [sp, #0x78]
        subs    r10, r10, r6
        ldr     r6, [sp, #0x7C]
        str     r10, [sp, #0x74]
        ldr     r10, [sp, #0x40]
        sbc     r10, r10, r6
        str     r10, [sp, #0x5C]
        ldr     r10, [sp, #0x80]
        ldr     r6, [sp, #0x88]
        subs    r10, r10, r6
        str     r10, [sp, #0x48]
        ldr     r6, [sp, #0x8C]
        ldr     r10, [sp, #0x84]
        sbc     r10, r10, r6
        ldr     r6, [sp, #0x94]
        str     r10, [sp, #0xB0]
        ldr     r10, [sp, #0x98]
        adds    r6, r6, r10
        adc     r8, r5, r8
        ldr     r5, [sp, #0xAC]
        ldr     r10, [sp, #0x9C]
        adds    r5, r5, r10
        adc     r7, r9, r7
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x4C]
        add     r9, r12, r9
        str     r9, [sp, #0xAC]
        ldr     r9, [sp, #0x34]
        add     r9, r12, r9
        str     r9, [sp, #0x9C]
        mov     r9, r7, lsl #3
        orr     r9, r9, r5, lsr #29
        mov     r5, r6, lsr #30
        adds    r6, r9, r6, lsl #2
        ldr     r9, [sp, #0x3C]
        orr     r8, r5, r8, lsl #2
        adc     r7, r8, r7, asr #29
        str     r6, [r9, +r10, lsl #4]
        ldr     r5, [sp, #0x6C]
        str     r7, [r5, #4]
        ldr     r5, [sp, #0x90]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x68]
        ldr     r5, [r5, #4]
        ldr     r6, [r12, +r6, lsl #3]
        mov     r7, r7, asr #31
        str     r7, [sp, #0x98]
        rsb     r5, r5, #0
        umull   r7, r11, r4, r5
        str     r7, [sp, #0x94]
        umull   r8, r7, r1, r6
        str     r7, [sp, #0x90]
        umull   r7, r9, r2, r5
        str     r7, [sp, #0x4C]
        umull   r10, r7, lr, r6
        str     r10, [sp, #0xB4]
        mov     r10, r5, asr #31
        mla     r9, r2, r10, r9
        mla     r4, r4, r10, r11
        ldr     r10, [sp, #0x90]
        mov     r2, r6, asr #31
        mla     r7, lr, r2, r7
        ldr     lr, [sp, #0x94]
        mla     r1, r1, r2, r10
        ldr     r2, [sp, #0xA4]
        adds    r8, lr, r8
        ldr     lr, [sp, #0xA0]
        mla     r7, r0, r6, r7
        mla     r2, r2, r5, r4
        mla     r5, r0, r5, r9
        mla     lr, lr, r6, r1
        ldr     r4, [sp, #0x70]
        mov     r1, r8, lsr #30
        mov     r6, r3, asr #31
        str     r6, [sp, #0xA4]
        mov     r4, r4, lsr #1
        adc     r6, r2, lr
        ldr     lr, [sp, #0xB4]
        ldr     r2, [sp, #0x4C]
        orr     r6, r1, r6, lsl #2
        adds    r2, r2, lr
        adc     r7, r5, r7
        ldr     lr, [sp, #0xA8]
        mov     r1, r7, lsl #3
        orr     r2, r1, r2, lsr #29
        ldr     r1, [sp, #0x6C]
        adds    r8, r2, r8, lsl #2
        mov     lr, lr, lsr #1
        adc     r7, r6, r7, asr #29
        str     r8, [r1, #8]
        ldr     r1, [sp, #0x6C]
        str     r7, [r1, #0xC]
        ldr     r1, [sp, #0x9C]
        ldr     r2, [sp, #0x5C]
        ldr     r8, [r1, #4]
        ldr     r1, [sp, #0x34]
        umull   r5, r6, lr, r8
        mov     r2, r2, asr #31
        ldr     r1, [r12, +r1]
        str     r2, [sp, #0xB4]
        umull   r9, r2, r3, r8
        str     r5, [sp, #0xA8]
        umull   r11, r10, r4, r1
        ldr     r5, [sp, #0x68]
        str     r10, [sp, #0xA0]
        mov     r10, r8, asr #31
        mla     r2, r3, r10, r2
        mla     r10, lr, r10, r6
        umull   r7, r5, r5, r1
        str     r11, [sp, #0x94]
        ldr     r11, [sp, #0x68]
        mov     r6, r1, asr #31
        mla     r5, r11, r6, r5
        ldr     r11, [sp, #0xA0]
        adds    r9, r7, r9
        ldr     r7, [sp, #0x98]
        mla     r6, r4, r6, r11
        ldr     r11, [sp, #0xA4]
        mla     r5, r7, r1, r5
        mla     r7, r0, r1, r6
        ldr     r1, [sp, #0xB0]
        mla     r2, r11, r8, r2
        mla     r8, r0, r8, r10
        ldr     r10, [sp, #0xA8]
        mov     r6, r9, lsr #30
        mov     r1, r1, asr #31
        str     r1, [sp, #0xA0]
        ldr     r1, [sp, #0x74]
        adc     r2, r5, r2
        ldr     r5, [sp, #0x94]
        mov     r1, r1, lsr #1
        orr     r6, r6, r2, lsl #2
        ldr     r2, [sp, #0x48]
        adds    r5, r5, r10
        adc     r8, r7, r8
        mov     r7, r8, lsl #3
        mov     r2, r2, lsr #1
        orr     r5, r7, r5, lsr #29
        ldr     r7, [sp, #0x58]
        adds    r9, r5, r9, lsl #2
        ldr     r5, [sp, #0x3C]
        adc     r8, r6, r8, asr #29
        str     r9, [r5, +r7, lsl #4]
        ldr     r5, [sp, #0x50]
        str     r8, [r5, #4]
        ldr     r5, [sp, #0x9C]
        ldr     r10, [sp, #0x68]
        ldr     r6, [r5, #4]
        ldr     r5, [sp, #0x34]
        rsb     r6, r6, #0
        umull   r8, r7, r10, r6
        ldr     r5, [r12, +r5]
        str     r8, [sp, #0xA8]
        umull   r9, r8, r4, r6
        str     r8, [sp, #0x9C]
        str     r9, [sp, #0x94]
        umull   r8, r9, r3, r5
        str     r9, [sp, #0x90]
        umull   r11, r9, lr, r5
        str     r9, [sp, #0x74]
        mov     r9, r6, asr #31
        mla     r7, r10, r9, r7
        ldr     r10, [sp, #0x9C]
        str     r11, [sp, #0x70]
        mla     r4, r4, r9, r10
        ldr     r10, [sp, #0x90]
        mov     r9, r5, asr #31
        mla     r3, r3, r9, r10
        ldr     r10, [sp, #0x74]
        mla     r4, r0, r6, r4
        mla     lr, lr, r9, r10
        ldr     r9, [sp, #0x98]
        mla     r7, r9, r6, r7
        ldr     r6, [sp, #0xA8]
        mla     lr, r0, r5, lr
        adds    r8, r6, r8
        ldr     r6, [sp, #0xA4]
        mla     r6, r6, r5, r3
        ldr     r5, [sp, #0x94]
        mov     r3, r8, lsr #30
        adc     r7, r7, r6
        ldr     r6, [sp, #0x70]
        orr     r7, r3, r7, lsl #2
        adds    r5, r5, r6
        adc     lr, r4, lr
        mov     r3, lr, lsl #3
        orr     r5, r3, r5, lsr #29
        ldr     r3, [sp, #0x50]
        adds    r8, r5, r8, lsl #2
        adc     lr, r7, lr, asr #29
        str     r8, [r3, #8]
        str     lr, [r3, #0xC]
        ldr     r3, [sp, #0xAC]
        ldr     r11, [sp, #0xB0]
        ldr     r4, [r3, #4]
        ldr     r3, [sp, #0x2C]
        umull   r5, r6, r4, r2
        mla     r6, r4, r0, r6
        ldr     lr, [r12, +r3, lsl #3]
        ldr     r3, [sp, #0xB0]
        str     r5, [sp, #0xA8]
        ldr     r5, [sp, #0x5C]
        umull   r8, r10, lr, r1
        umull   r3, r7, r3, r4
        umull   r5, r9, r5, lr
        str     r8, [sp, #0xA4]
        mla     r8, lr, r0, r10
        mov     r10, r4, asr #31
        mla     r7, r11, r10, r7
        mla     r6, r10, r2, r6
        ldr     r11, [sp, #0x5C]
        mov     r10, lr, asr #31
        mla     r8, r10, r1, r8
        mla     r9, r11, r10, r9
        ldr     r10, [sp, #0xA0]
        adds    r3, r5, r3
        ldr     r5, [sp, #0xA8]
        mla     r7, r10, r4, r7
        ldr     r4, [sp, #0xB4]
        mla     r9, r4, lr, r9
        ldr     r4, [sp, #0xA4]
        mov     lr, r3, lsr #30
        adc     r7, r9, r7
        adds    r4, r4, r5
        adc     r6, r8, r6
        orr     r7, lr, r7, lsl #2
        mov     lr, r6, lsl #3
        orr     r4, lr, r4, lsr #29
        adds    r3, r4, r3, lsl #2
        ldr     lr, [sp, #0x3C]
        ldr     r4, [sp, #0x60]
        adc     r6, r7, r6, asr #29
        str     r3, [lr, +r4, lsl #4]
        ldr     r3, [sp, #0x64]
        str     r6, [r3, #4]
        ldr     r3, [sp, #0xAC]
        ldr     lr, [sp, #0x2C]
        ldr     r3, [r3, #4]
        ldr     r4, [r12, +lr, lsl #3]
        rsb     r10, r3, #0
        umull   r9, r7, r10, r1
        ldr     r3, [sp, #0x5C]
        umull   r8, r11, r4, r2
        umull   r5, lr, r10, r3
        ldr     r3, [sp, #0xB4]
        str     r7, [sp, #0xB4]
        ldr     r7, [sp, #0xA0]
        mla     r6, r10, r3, lr
        ldr     r3, [sp, #0xB0]
        umull   lr, r3, r4, r3
        mla     r7, r4, r7, r3
        ldr     r3, [sp, #0xB4]
        mla     r3, r10, r0, r3
        mla     r0, r4, r0, r11
        ldr     r11, [sp, #0x5C]
        mov     r10, r10, asr #31
        mov     r4, r4, asr #31
        mla     r6, r10, r11, r6
        ldr     r11, [sp, #0xB0]
        mla     r3, r10, r1, r3
        mla     r0, r4, r2, r0
        mla     r7, r4, r11, r7
        adds    lr, r5, lr
        ldr     r2, [sp, #0x78]
        adc     r7, r6, r7
        adds    r8, r9, r8
        mov     r1, lr, lsr #30
        adc     r0, r3, r0
        orr     r7, r1, r7, lsl #2
        mov     r1, r0, lsl #3
        orr     r8, r1, r8, lsr #29
        ldr     r1, [sp, #0x44]
        adds    lr, r8, lr, lsl #2
        adc     r0, r7, r0, asr #29
        adds    r1, r1, r2
        ldr     r2, [sp, #0x64]
        str     r0, [r2, #0xC]
        str     lr, [r2, #8]
        ldr     r0, [sp, #0x40]
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x38]
        adc     r0, r0, r2
        ldr     r2, [sp, #0x3C]
        str     r1, [r2, +r3, lsl #4]
        ldr     r1, [sp, #0x80]
        ldr     r2, [sp, #0x88]
        ldr     r3, [sp, #0x38]
        ldr     lr, [sp, #4]
        adds    r1, r1, r2
        ldr     r2, [sp, #8]
        add     r3, r3, r2
        str     r3, [sp, #0x38]
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x8C]
        adc     r2, r2, r3
        ldr     r3, [sp, #0x38]
        cmp     r3, lr
        ldr     r3, [sp, #0x54]
        str     r0, [r3, #4]
        str     r1, [r3, #8]
        str     r2, [r3, #0xC]
        blt     LCAF5
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r3, [pc, #0x600]
        ldr     r2, [sp, #0xC]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x14]
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #0x3C]
        b       LCAF8
LCAF6:
        cmp     r6, r1
        mov     r4, r6
        bge     LCAF8
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r2, [sp, #0xC]
        str     r12, [sp]
        str     lr, [sp, #0x14]
        str     r1, [sp, #4]
LCAF7:
        ldr     r4, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r5, [sp, #0x18]
        add     r1, r2, r4
        str     r1, [sp, #0xB4]
        ldr     r12, [sp, #0xB4]
        add     r1, r4, r1
        str     r1, [sp, #0xB0]
        ldr     r2, [r0, +r2, lsl #4]
        ldr     r6, [r0, +r1, lsl #4]
        ldr     lr, [r0, +r12, lsl #4]
        ldr     r12, [pc, #0x590]
        add     r4, r4, r1
        str     r4, [sp, #0xAC]
        ldr     r4, [r0, +r4, lsl #4]
        add     r5, r0, r5, lsl #4
        ldr     r10, [r5, #0xC]
        ldr     r9, [r5, #8]
        ldr     r7, [r5, #4]
        add     r1, r0, r1, lsl #4
        str     r1, [sp, #0xA8]
        ldr     r8, [r1, #4]
        adds    r1, r2, r6
        str     r1, [sp, #0xA4]
        ldr     r1, [sp, #0xB4]
        add     r1, r0, r1, lsl #4
        ldr     r11, [r1, #4]
        str     r11, [sp, #0xA0]
        adc     r11, r7, r8
        subs    r2, r2, r6
        str     r2, [sp, #0x98]
        ldr     r2, [sp, #0xAC]
        sbc     r7, r7, r8
        str     r11, [sp, #0x9C]
        str     r7, [sp, #0x94]
        add     r2, r0, r2, lsl #4
        ldr     r7, [r2, #4]
        adds    r6, lr, r4
        ldr     r4, [sp, #0x9C]
        rsb     lr, r12, #0
        str     lr, [sp, #0x90]
        ldr     lr, [sp, #0xA0]
        adc     r7, lr, r7
        ldr     lr, [sp, #0xA4]
        str     r7, [sp, #0xA0]
        adds    lr, lr, r6
        adc     r7, r4, r7
        ldr     r4, [sp, #0x18]
        str     lr, [r0, +r4, lsl #4]
        str     r7, [r5, #4]
        ldr     lr, [sp, #0xA8]
        ldr     r4, [lr, #8]
        str     r4, [sp, #0x8C]
        ldr     lr, [lr, #0xC]
        str     lr, [sp, #0x88]
        ldr     r11, [r1, #8]
        ldr     r7, [r2, #8]
        ldr     lr, [r1, #0xC]
        ldr     r4, [sp, #0x88]
        str     lr, [sp, #0x84]
        ldr     lr, [sp, #0x8C]
        ldr     r8, [r2, #0xC]
        adds    lr, r9, lr
        adc     r4, r10, r4
        adds    r7, r11, r7
        ldr     r11, [sp, #0x84]
        adc     r8, r11, r8
        ldr     r11, [sp, #0x8C]
        subs    r9, r9, r11
        str     r9, [sp, #0x8C]
        ldr     r9, [sp, #0x88]
        sbc     r9, r10, r9
        adds    r11, lr, r7
        adc     r10, r4, r8
        str     r10, [r5, #0xC]
        str     r11, [r5, #8]
        ldr     r5, [sp, #0xAC]
        ldr     r5, [r0, +r5, lsl #4]
        str     r5, [sp, #0x88]
        ldr     r5, [sp, #0xB4]
        ldr     r10, [r0, +r5, lsl #4]
        ldr     r5, [r2, #4]
        str     r5, [sp, #0x84]
        ldr     r5, [r1, #4]
        ldr     r11, [r1, #8]
        str     r11, [sp, #0x80]
        ldr     r11, [sp, #0x88]
        subs    r10, r10, r11
        ldr     r11, [sp, #0x84]
        str     r10, [sp, #0x88]
        ldr     r10, [r1, #0xC]
        sbc     r5, r5, r11
        subs    lr, lr, r7
        ldr     r7, [sp, #0xB4]
        sbc     r4, r4, r8
        str     lr, [r0, +r7, lsl #4]
        str     r4, [r1, #4]
        ldr     lr, [r2, #8]
        ldr     r4, [r2, #0xC]
        ldr     r11, [sp, #0x90]
        mov     r7, #0
        mov     r7, r7, asr #1
        str     r7, [sp, #0xB4]
        mul     r7, r7, r12
        ldr     r8, [sp, #0xB4]
        str     r7, [sp, #0x84]
        ldr     r7, [sp, #0x90]
        mul     r7, r8, r7
        ldr     r8, [sp, #0xB4]
        str     r7, [sp, #0x7C]
        ldr     r7, [sp, #0x90]
        mul     r7, r8, r7
        str     r7, [sp, #0x78]
        ldr     r7, [sp, #0x80]
        subs    lr, r7, lr
        sbc     r10, r10, r4
        ldr     r4, [sp, #0xA4]
        subs    r6, r6, r4
        str     r6, [sp, #0xA4]
        ldr     r6, [sp, #0x9C]
        ldr     r4, [sp, #0xA0]
        sbc     r4, r4, r6
        str     r4, [sp, #0xA0]
        ldr     r4, [sp, #0x8C]
        adds    r7, r4, lr
        adc     r8, r9, r10
        umull   r4, r6, r3, r8
        str     r6, [sp, #0x9C]
        mov     r7, r7, lsr #1
        str     r4, [sp, #0x80]
        ldr     r4, [sp, #0x8C]
        subs    r4, r4, lr
        ldr     lr, [sp, #0x28]
        str     r4, [sp, #0x8C]
        sbc     r4, r9, r10
        umull   lr, r6, lr, r4
        str     r6, [sp, #0x74]
        ldr     r6, [sp, #0x88]
        str     lr, [sp, #0x70]
        ldr     lr, [sp, #0x98]
        subs    r10, lr, r6
        ldr     lr, [sp, #0x94]
        ldr     r6, [sp, #0x28]
        sbc     lr, lr, r5
        umull   r6, r9, r6, lr
        str     r9, [sp, #0x6C]
        ldr     r9, [sp, #0x98]
        str     r6, [sp, #0x68]
        ldr     r6, [sp, #0x88]
        rsbs    r6, r6, #0
        rsc     r5, r5, #0
        subs    r6, r6, r9
        str     r6, [sp, #0x98]
        ldr     r6, [sp, #0x94]
        sbc     r9, r5, r6
        umull   r6, r5, r3, r9
        str     r5, [sp, #0x88]
        adds    r5, r8, lr
        mov     r8, r8, asr #31
        str     r6, [sp, #0x94]
        umull   r6, r5, r3, r5
        str     r5, [sp, #0x64]
        mov     r5, lr, asr #31
        mul     r11, r5, r11
        adc     r5, r8, r5
        mul     r5, r5, r12
        str     r11, [sp, #0x60]
        mul     r11, r8, r12
        mov     r8, r10, lsr #1
        str     r5, [sp, #0x58]
        ldr     r5, [sp, #0x28]
        str     r11, [sp, #0x5C]
        ldr     r11, [sp, #0xA4]
        umull   r5, r10, r5, r8
        str     r10, [sp, #0x54]
        str     r5, [sp, #0x50]
        umull   r10, r5, r3, r7
        adds    r7, r7, r8
        str     r5, [sp, #0x48]
        ldr     r5, [sp, #0xB4]
        str     r10, [sp, #0x4C]
        umull   r7, r10, r3, r7
        str     r11, [r1, #8]
        ldr     r11, [sp, #0xA0]
        adc     r5, r5, r5
        mul     r5, r5, r12
        str     r11, [r1, #0xC]
        ldr     r1, [sp, #0x64]
        ldr     r11, [sp, #0x58]
        add     r10, r5, r10
        mov     r5, r4, asr #31
        add     r1, r11, r1
        mov     r11, r6, lsr #30
        orr     r1, r11, r1, lsl #2
        ldr     r11, [sp, #0x90]
        mul     r11, r5, r11
        str     r11, [sp, #0xA4]
        mov     r11, r10, lsl #3
        orr     r7, r11, r7, lsr #29
        adds    r6, r7, r6, lsl #2
        adc     r10, r1, r10, asr #29
        str     r6, [sp, #0xA0]
        adds    r1, r4, r9
        umull   r1, r6, r3, r1
        str     r6, [sp, #0x64]
        mov     r9, r9, asr #31
        mul     r6, r9, r12
        str     r10, [sp, #0x90]
        adc     r9, r5, r9
        mul     r7, r9, r12
        ldr     r5, [sp, #0x8C]
        str     r6, [sp, #0x58]
        ldr     r6, [sp, #0x28]
        mov     r5, r5, lsr #1
        umull   r9, r6, r6, r5
        str     r9, [sp, #0x8C]
        ldr     r9, [sp, #0x98]
        mov     r9, r9, lsr #1
        umull   r11, r10, r3, r9
        str     r10, [sp, #0x44]
        adds    r9, r5, r9
        umull   r10, r9, r3, r9
        str     r11, [sp, #0x98]
        ldr     r11, [sp, #0xA0]
        str     r10, [sp, #0x40]
        ldr     r10, [sp, #0xB4]
        adc     r10, r10, r10
        mul     r12, r10, r12
        ldr     r10, [sp, #0xB0]
        str     r11, [r0, +r10, lsl #4]
        ldr     r10, [sp, #0xA8]
        ldr     r11, [sp, #0x90]
        add     r9, r12, r9
        str     r11, [r10, #4]
        ldr     r10, [sp, #0x64]
        ldr     r12, [sp, #0x9C]
        mov     r11, r9, lsl #3
        add     r7, r7, r10
        mov     r10, r1, lsr #30
        orr     r7, r10, r7, lsl #2
        ldr     r10, [sp, #0x5C]
        add     r12, r10, r12
        ldr     r10, [sp, #0x40]
        orr     r10, r11, r10, lsr #29
        adds    r1, r10, r1, lsl #2
        adc     r9, r7, r9, asr #29
        ldr     r7, [sp, #0xA8]
        str     r9, [r7, #0xC]
        str     r1, [r7, #8]
        ldr     r1, [sp, #0x6C]
        ldr     r7, [sp, #0x60]
        ldr     r9, [sp, #0x80]
        ldr     r10, [sp, #0x84]
        add     r7, r7, r1
        ldr     r1, [sp, #0x68]
        rsb     r7, lr, r7
        adds    r1, r9, r1
        adc     lr, r12, r7
        ldr     r7, [sp, #0x7C]
        ldr     r12, [sp, #0x54]
        ldr     r9, [sp, #0x4C]
        add     r7, r7, r12
        ldr     r12, [sp, #0x50]
        rsb     r7, r8, r7
        mov     r8, r1, lsr #30
        orr     lr, r8, lr, lsl #2
        adds    r12, r9, r12
        ldr     r9, [sp, #0x48]
        add     r9, r10, r9
        adc     r7, r9, r7
        mov     r9, r7, lsl #3
        orr     r12, r9, r12, lsr #29
        adds    r1, r12, r1, lsl #2
        adc     r12, lr, r7, asr #29
        ldr     lr, [sp, #0xAC]
        str     r1, [r0, +lr, lsl #4]
        ldr     lr, [sp, #0xA4]
        ldr     r1, [sp, #0x74]
        ldr     r7, [sp, #0x70]
        add     lr, lr, r1
        ldr     r1, [sp, #0x94]
        rsb     r4, r4, lr
        ldr     lr, [sp, #0x88]
        adds    r1, r7, r1
        ldr     r7, [sp, #0x58]
        add     lr, r7, lr
        adc     lr, r4, lr
        ldr     r4, [sp, #0x78]
        ldr     r7, [sp, #0x8C]
        add     r6, r4, r6
        ldr     r4, [sp, #0x98]
        rsb     r5, r5, r6
        ldr     r6, [sp, #0x44]
        adds    r4, r7, r4
        ldr     r7, [sp, #0x84]
        str     r12, [r2, #4]
        add     r6, r7, r6
        adc     r5, r5, r6
        mov     r12, r5, lsl #3
        orr     r4, r12, r4, lsr #29
        mov     r12, r1, lsr #30
        orr     lr, r12, lr, lsl #2
        ldr     r12, [sp, #0x18]
        adds    r1, r4, r1, lsl #2
        ldr     r4, [sp, #8]
        adc     r5, lr, r5, asr #29
        add     r12, r12, r4
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #4]
        ldr     lr, [sp, #0x18]
        str     r1, [r2, #8]
        str     r5, [r2, #0xC]
        cmp     lr, r12
        blt     LCAF7
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r2, [sp, #0xC]
        ldr     r12, [sp]
        ldr     lr, [sp, #0x14]
        ldr     r1, [sp, #4]
LCAF8:
        add     r6, r6, #1
        cmp     r6, r12
        blt     LCAF4
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #8]
LCAF9:
        mov     r7, r7, asr #2
        cmp     r7, #2
        mov     lr, lr, asr #2
        mov     r4, r4, asr #2
        mov     r12, r12, asr #2
        mov     r2, r2, lsl #2
        bgt     LCAF1
LCAF10:
        cmp     r7, #1
        ble     LCAF12
        cmp     r1, #0
        ble     LCAF12
        sub     r2, r0, #4
        mov     r3, #0
        sub     r0, r0, #0x14
LCAF11:
        ldr     r4, [r0, #0x14]
        ldr     r5, [r2, #0x14]
        ldr     lr, [r2, #0x18]
        ldr     r12, [r0, #0x18]
        add     r3, r3, #2
        adds    r6, r4, r5
        str     r6, [r0, #0x14]
        adc     r6, r12, lr
        str     r6, [r0, #0x18]
        subs    r4, r4, r5
        sbc     r12, r12, lr
        str     r4, [r2, #0x14]
        str     r12, [r2, #0x18]
        ldr     r5, [r0, #0x1C]
        ldr     r6, [r2, #0x1C]
        ldr     lr, [r2, #0x20]
        ldr     r12, [r0, #0x20]
        adds    r4, r5, r6
        str     r4, [r0, #0x1C]
        adc     r4, r12, lr
        subs    r5, r5, r6
        str     r4, [r0, #0x20]!
        sbc     r12, r12, lr
        str     r5, [r2, #0x1C]
        str     r12, [r2, #0x20]!
        cmp     r3, r1
        blt     LCAF11
LCAF12:
        add     sp, sp, #0xB8
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000000
        .long   0x2d413ccd
LCAF13:
        mov     r2, r1, asr #1
        cmp     r2, #1
        sub     r5, r1, #1
        ble     LCAF0
        mov     r5, r5, lsl #4
        add     r5, r5, #0x1C
        add     r5, r5, r0
        sub     r2, r2, #1
        add     r6, r0, #0xC
LCAF14:
        ldr     r10, [r6, #4]
        ldr     r11, [r6, #8]
        ldr     r7, [r6, #0xC]
        ldr     r8, [r6, #0x10]
        ldr     r9, [r5, #-0x1C]
        str     r10, [r5, #-0x1C]
        ldr     r10, [r5, #-0x18]
        str     r11, [r5, #-0x18]
        ldr     r11, [r5, #-0x14]
        str     r7, [r5, #-0x14]
        ldr     r7, [r5, #-0x10]
        str     r8, [r5, #-0x10]!
        str     r9, [r6, #4]
        str     r10, [r6, #8]
        str     r11, [r6, #0xC]
        str     r7, [r6, #0x10]!
        subs    r2, r2, #1
        bne     LCAF14
        b       LCAF0
LCAF15:
        ldr     r3, [r0]
        ldr     r12, [r0, #0x10]
        ldr     r6, [r0, #0x14]
        ldr     r5, [r0, #4]
        ldr     r1, [r0, #0x18]
        adds    r4, r12, r3
        ldr     r2, [r0, #8]
        adc     lr, r6, r5
        subs    r7, r3, r12
        ldr     r12, [r0, #0x1C]
        ldr     r3, [r0, #0xC]
        sbc     r5, r5, r6
        str     r4, [r0]
        adds    r4, r1, r2
        str     lr, [r0, #4]
        adc     lr, r12, r3
        subs    r2, r2, r1
        sbc     r3, r3, r12
        str     r7, [r0, #0x10]
        str     r5, [r0, #0x14]
        str     r4, [r0, #8]
        str     lr, [r0, #0xC]
        str     r2, [r0, #0x18]
        str     r3, [r0, #0x1C]
        add     sp, sp, #0xB8
        ldmia   sp!, {r4 - r11, pc}


