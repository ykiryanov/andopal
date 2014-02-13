        .text
        .align  4
        .globl  _ippsFIRSubbandLow_EC_32sc_Sfs


_ippsFIRSubbandLow_EC_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB0
        ldr     r10, [sp, #0xD4]
        ldr     r12, [sp, #0xD8]
        ldr     r4, [sp, #0xDC]
        cmp     r0, #0
        mov     r7, r2
        mov     r6, r3
        beq     LDKQ18
        cmp     r1, #0
        beq     LDKQ18
        cmp     r6, #0
        beq     LDKQ18
        cmp     r7, #0
        ble     LDKQ17
        cmp     r7, #0xFF
        bgt     LDKQ17
        cmp     r10, #0
        blt     LDKQ17
        cmp     r10, r12
        bgt     LDKQ17
        cmp     r12, #0
        ble     LDKQ16
        mov     lr, #1
        orr     lr, lr, #1, 20
        cmp     lr, r12
        blt     LDKQ16
        cmp     r4, #0
        blt     LDKQ17
        cmp     r4, #0x1F
        bgt     LDKQ17
        sub     lr, r12, #4
        cmp     r10, lr
        bge     LDKQ15
        mov     r8, r10, lsl #3
        add     r9, r6, #0x18
        str     r9, [sp, #0x4C]
        add     r11, r6, #8
        add     r3, r6, #0x10
        add     r2, r8, #8
        add     r9, r8, #0x10
        str     r6, [sp, #0x28]
        mov     r5, r4, asr #31
        add     r8, r8, #0x18
        str     r3, [sp, #0x7C]
        str     r11, [sp, #0x38]
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x24]
        str     r7, [sp, #0x14]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
        mov     r6, r2
LDKQ0:
        ldr     r0, [sp, #0x14]
        cmp     r0, #0
        ble     LDKQ14
        mov     r0, #0
        str     r0, [sp, #0x58]
        mov     r1, r0
        mov     r2, r1
        str     r2, [sp, #0x70]
        str     r2, [sp, #0x74]
        str     r2, [sp, #0x68]
        str     r2, [sp, #0x64]
        str     r2, [sp, #0x6C]
        str     r2, [sp, #0x60]
        str     r2, [sp, #0x5C]
        str     r2, [sp, #0x78]
        str     r2, [sp, #0x54]
        str     r2, [sp, #0x50]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        str     r2, [sp]
        str     r2, [sp, #4]
        mov     r7, r10, lsl #3
        str     r2, [sp, #8]
        str     r7, [sp, #0x48]
        str     r1, [sp, #0x10]
        str     r0, [sp, #0x18]
        str     r11, [sp, #0x3C]
        str     lr, [sp, #0x44]
        str     r12, [sp, #0x40]
        str     r5, [sp, #0x34]
        str     r4, [sp, #0x30]
        str     r10, [sp, #0x2C]
LDKQ1:
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        ldr     r2, [r1], #4
        ldr     r0, [r0]
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x48]
        ldr     r3, [r2, +r6]
        ldr     r12, [r0, +r6]
        add     r1, r1, r2
        ldr     r7, [r1, #4]
        ldr     r1, [sp, #0x48]
        ldr     r10, [r2, +r1]
        add     r1, r1, r0
        ldr     r4, [r1, #4]
        ldr     r1, [sp, #0x48]
        ldr     r5, [r0, +r1]
        smull   r1, lr, r10, r5
        str     lr, [sp, #0x80]
        smull   lr, r11, r7, r4
        smull   r7, r5, r7, r5
        smull   r4, r10, r4, r10
        str     r5, [sp, #0x8C]
        str     r11, [sp, #0x84]
        str     r10, [sp, #0x88]
        smull   r10, r5, r3, r12
        str     r5, [sp, #0x94]
        subs    r5, r1, lr
        ldr     r11, [sp, #0x84]
        str     r10, [sp, #0x90]
        ldr     r10, [r0, +r8]
        ldr     lr, [r9, +r2]
        ldr     r1, [r0, +r9]
        str     r10, [sp, #0x98]
        ldr     r10, [r8, +r2]
        str     r10, [sp, #0x9C]
        ldr     r10, [sp, #0x80]
        sbc     r10, r10, r11
        str     r10, [sp, #0x84]
        smull   r11, r10, lr, r1
        adds    r7, r4, r7
        str     r10, [sp, #0xA0]
        ldr     r10, [sp, #0x8C]
        ldr     r4, [sp, #0x98]
        str     r7, [sp, #0xA4]
        ldr     r7, [sp, #0x9C]
        str     r11, [sp, #0x80]
        ldr     r11, [sp, #0x88]
        smull   r4, r7, r7, r4
        str     r7, [sp, #0xA8]
        adc     r10, r11, r10
        ldr     r11, [sp, #0x84]
        str     r4, [sp, #0xAC]
        add     r4, r6, r2
        ldr     r7, [r4, #4]
        add     r4, r6, r0
        ldr     r4, [r4, #4]
        str     r10, [sp, #0x8C]
        smull   r12, r10, r7, r12
        str     r10, [sp, #0x88]
        ldr     r10, [sp, #0x18]
        adds    r10, r10, r5
        str     r10, [sp, #0x18]
        smull   r10, r5, r7, r4
        smull   r4, r7, r4, r3
        ldr     r3, [sp, #0x10]
        adc     r3, r3, r11
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x70]
        ldr     r11, [sp, #0xA4]
        adds    r3, r3, r11
        str     r3, [sp, #0x70]
        ldr     r3, [sp, #0x74]
        ldr     r11, [sp, #0x8C]
        adc     r3, r3, r11
        str     r3, [sp, #0x74]
        ldr     r3, [sp, #0x90]
        subs    r3, r3, r10
        ldr     r10, [sp, #0x94]
        sbc     r10, r10, r5
        adds    r12, r4, r12
        ldr     r5, [sp, #0x88]
        str     r10, [sp, #0xA4]
        ldr     r11, [sp, #0xA4]
        add     r4, r0, r9
        ldr     r10, [r4, #4]
        adc     r5, r7, r5
        add     r4, r2, r9
        ldr     r4, [r4, #4]
        smull   lr, r7, lr, r10
        str     r7, [sp, #0x94]
        ldr     r7, [sp, #0x68]
        add     r0, r0, r8
        add     r2, r2, r8
        adds    r7, r7, r3
        smull   r10, r3, r10, r4
        str     r7, [sp, #0x68]
        smull   r7, r4, r1, r4
        ldr     r1, [sp, #0x64]
        adc     r1, r1, r11
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x6C]
        ldr     r11, [sp, #0x78]
        adds    r1, r1, r12
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x60]
        ldr     r12, [sp, #0xA0]
        adc     r1, r1, r5
        str     r1, [sp, #0x60]
        ldr     r1, [sp, #0x80]
        ldr     r5, [r2, #4]
        subs    r1, r1, r10
        sbc     r3, r12, r3
        adds    lr, lr, r7
        ldr     r7, [r0, #4]
        ldr     r0, [sp, #0x94]
        ldr     r10, [sp, #0x5C]
        adc     r4, r0, r4
        ldr     r0, [sp, #0x9C]
        adds    r10, r10, r1
        adc     r11, r11, r3
        ldr     r3, [sp, #0x54]
        smull   r0, r12, r0, r7
        smull   r7, r1, r7, r5
        str     r10, [sp, #0x5C]
        ldr     r10, [sp, #0x98]
        adds    r3, r3, lr
        str     r3, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        smull   r5, r10, r10, r5
        str     r11, [sp, #0x78]
        adc     r3, r3, r4
        str     r3, [sp, #0x50]
        ldr     r3, [sp, #0xAC]
        subs    r7, r3, r7
        ldr     r3, [sp, #0xA8]
        sbc     r1, r3, r1
        adds    r5, r0, r5
        ldr     r0, [sp]
        adc     r10, r12, r10
        adds    r0, r0, r7
        str     r0, [sp]
        ldr     r0, [sp, #4]
        adc     r0, r0, r1
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        adds    r0, r0, r5
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #4
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x58]
        adc     r0, r0, r10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x3C]
        subs    r0, r0, #1
        str     r0, [sp, #0x3C]
        bne     LDKQ1
        ldr     r7, [sp, #0x48]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x18]
        ldr     r5, [sp, #0x34]
        ldr     r4, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
LDKQ2:
        ldr     r11, [sp, #0x28]
        mov     r2, r4
        mov     r3, r5
        add     r12, r11, r7
        str     r12, [sp, #0xAC]
        bl      __ashrdi3
        str     r0, [r7, +r11]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x74]
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r1, [sp, #0xAC]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r1, #4]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x64]
        add     r10, r10, #4
        add     r6, r6, #0x20
        bl      __ashrdi3
        ldr     r11, [sp, #0x38]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r11, +r7]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x60]
        add     r11, r7, r11
        add     r9, r9, #0x20
        bl      __ashrdi3
        str     r0, [r11, #4]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x78]
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r11, [sp, #0x7C]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r11, +r7]
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x50]
        add     r11, r7, r11
        add     r8, r8, #0x20
        bl      __ashrdi3
        str     r0, [r11, #4]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r11, [sp, #0x4C]
        mov     r2, r4
        mov     r3, r5
        str     r0, [r11, +r7]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0x58]
        add     r11, r7, r11
        bl      __ashrdi3
        ldr     r1, [sp, #0xC]
        str     r0, [r11, #4]
        cmp     r10, r1
        blt     LDKQ0
        ldr     r12, [sp, #0x24]
        ldr     r11, [sp, #0x38]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x14]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        sub     lr, r12, #2
        cmp     r10, lr
        bge     LDKQ7
LDKQ3:
        mov     r8, r10, lsl #3
        add     r8, r8, #8
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x24]
        str     r7, [sp, #0x14]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LDKQ4:
        ldr     r0, [sp, #0x14]
        cmp     r0, #0
        ble     LDKQ13
        mov     r0, #0
        str     r0, [sp, #4]
        mov     r1, r0
        mov     r7, r1
        str     r7, [sp]
        str     r7, [sp, #8]
        mov     r2, r7
        str     r2, [sp, #0xC]
        str     r2, [sp, #0x10]
        ldr     lr, [sp, #0x20]
        ldr     r2, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        mov     r9, r10, lsl #3
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
        str     r7, [sp, #0x44]
        str     r2, [sp, #0x48]
        str     lr, [sp, #0x4C]
        str     r11, [sp, #0x38]
        str     r5, [sp, #0x34]
        str     r4, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r6, [sp, #0x28]
LDKQ5:
        ldr     r2, [sp, #0x4C]
        ldr     r0, [r12], #4
        ldr     r1, [r2], #4
        str     r2, [sp, #0x4C]
        ldr     r5, [r0, +r9]
        ldr     r7, [r1, +r9]
        ldr     r4, [r1, +r8]
        ldr     r6, [r0, +r8]
        add     r2, r9, r1
        ldr     r3, [r2, #4]
        add     r2, r9, r0
        ldr     lr, [r2, #4]
        smull   r2, r10, r7, r5
        str     r10, [sp, #0xAC]
        add     r1, r8, r1
        smull   r10, r11, r3, lr
        smull   lr, r7, lr, r7
        str     r7, [sp, #0xA0]
        smull   r7, r3, r3, r5
        str     r3, [sp, #0x9C]
        smull   r3, r5, r4, r6
        str     r10, [sp, #0xA8]
        ldr     r10, [sp, #0xAC]
        str     r11, [sp, #0xA4]
        ldr     r11, [sp, #0x9C]
        str     r3, [sp, #0x98]
        ldr     r3, [sp, #0xA8]
        ldr     r1, [r1, #4]
        add     r0, r8, r0
        ldr     r0, [r0, #4]
        subs    r2, r2, r3
        ldr     r3, [sp, #0xA4]
        sbc     r3, r10, r3
        smull   r6, r10, r1, r6
        adds    lr, lr, r7
        ldr     r7, [sp, #0xA0]
        adc     r7, r7, r11
        ldr     r11, [sp, #0x40]
        adds    r11, r11, r2
        smull   r1, r2, r1, r0
        smull   r4, r0, r0, r4
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        adc     r11, r11, r3
        ldr     r3, [sp]
        str     r11, [sp, #0x3C]
        adds    r3, r3, lr
        str     r3, [sp]
        ldr     r3, [sp, #8]
        adc     r3, r3, r7
        str     r3, [sp, #8]
        ldr     r3, [sp, #0x98]
        subs    r1, r3, r1
        sbc     r5, r5, r2
        adds    r6, r4, r6
        adc     r10, r0, r10
        ldr     r0, [sp, #0x44]
        adds    r0, r0, r1
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0xC]
        adc     r0, r0, r5
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        adds    r0, r0, r6
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #4]
        adc     r0, r0, r10
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x48]
        subs    r0, r0, #1
        str     r0, [sp, #0x48]
        bne     LDKQ5
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        ldr     r7, [sp, #0x44]
        ldr     r11, [sp, #0x38]
        ldr     r5, [sp, #0x34]
        ldr     r4, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
LDKQ6:
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        str     r0, [r9, +r6]
        ldr     r0, [sp]
        ldr     r1, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        add     r12, r6, r9
        str     r0, [r12, #4]
        ldr     r1, [sp, #0xC]
        mov     r0, r7
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        str     r0, [r11, +r9]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r1, [sp, #0x18]
        add     r10, r10, #2
        add     r9, r9, r11
        cmp     r10, r1
        str     r0, [r9, #4]
        add     r8, r8, #0x10
        blt     LDKQ4
        ldr     r12, [sp, #0x24]
        ldr     r7, [sp, #0x14]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
LDKQ7:
        cmp     r10, r12
        bge     LDKQ11
        mov     r5, r4, asr #31
        str     r12, [sp, #0x24]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LDKQ8:
        cmp     r7, #0
        mov     r8, #0
        ble     LDKQ12
        mov     r2, r8
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x1C]
        mov     r1, r2
        mov     r9, r1
        mov     r11, r10, lsl #3
        mov     r0, r7
        str     r2, [sp, #0x48]
        str     r9, [sp, #0x4C]
        str     r5, [sp, #0x44]
        str     r4, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x14]
LDKQ9:
        ldr     r2, [lr], #4
        ldr     r3, [r12], #4
        add     r4, r11, r2
        ldr     r7, [r4, #4]
        ldr     r2, [r2, +r11]
        add     r4, r11, r3
        ldr     r6, [r4, #4]
        ldr     r9, [r3, +r11]
        smull   r10, r5, r7, r6
        smull   r4, r3, r2, r9
        smull   r2, r6, r6, r2
        smull   r9, r7, r7, r9
        str     r10, [sp, #0xAC]
        ldr     r10, [sp, #0xAC]
        subs    r4, r4, r10
        sbc     r3, r3, r5
        adds    r9, r2, r9
        ldr     r2, [sp, #0x48]
        adc     r7, r6, r7
        adds    r2, r2, r4
        str     r2, [sp, #0x48]
        ldr     r2, [sp, #0x4C]
        adc     r1, r1, r3
        adds    r2, r2, r9
        str     r2, [sp, #0x4C]
        adc     r8, r8, r7
        subs    r0, r0, #1
        bne     LDKQ9
        ldr     r2, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        ldr     r5, [sp, #0x44]
        ldr     r4, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x14]
LDKQ10:
        mov     r0, r2
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        str     r0, [r11, +r6]
        mov     r0, r9
        mov     r1, r8
        mov     r3, r5
        mov     r2, r4
        bl      __ashrdi3
        add     r11, r6, r11
        str     r0, [r11, #4]
        ldr     r0, [sp, #0x24]
        add     r10, r10, #1
        cmp     r10, r0
        blt     LDKQ8
LDKQ11:
        mov     r0, #0
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LDKQ12:
        mov     r2, r8
        mov     r1, r2
        mov     r9, r1
        mov     r11, r10, lsl #3
        b       LDKQ10
LDKQ13:
        mov     r0, #0
        str     r0, [sp, #4]
        mov     r1, r0
        mov     r7, r1
        str     r7, [sp]
        str     r7, [sp, #8]
        mov     r2, r7
        str     r2, [sp, #0xC]
        str     r2, [sp, #0x10]
        mov     r9, r10, lsl #3
        b       LDKQ6
LDKQ14:
        mov     r0, #0
        str     r0, [sp, #0x58]
        mov     r1, r0
        mov     r2, r1
        str     r2, [sp, #0x70]
        str     r2, [sp, #0x74]
        str     r2, [sp, #0x68]
        str     r2, [sp, #0x64]
        str     r2, [sp, #0x6C]
        str     r2, [sp, #0x60]
        str     r2, [sp, #0x5C]
        str     r2, [sp, #0x78]
        str     r2, [sp, #0x54]
        str     r2, [sp, #0x50]
        str     r2, [sp]
        str     r2, [sp, #4]
        str     r2, [sp, #8]
        mov     r7, r10, lsl #3
        b       LDKQ2
LDKQ15:
        sub     lr, r12, #2
        cmp     r10, lr
        movlt   r5, r4, asr #31
        addlt   r11, r6, #8
        blt     LDKQ3
        b       LDKQ7
LDKQ16:
        mvn     r0, #0x76
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LDKQ17:
        mvn     r0, #6
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LDKQ18:
        mvn     r0, #7
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}


