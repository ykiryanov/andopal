        .text
        .align  4
        .globl  _ippsCrossCorr_16s_Sfs


_ippsCrossCorr_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r4, [sp, #0x8C]
        ldr     r6, [sp, #0x90]
        ldr     r10, [sp, #0x94]
        ldr     r5, [sp, #0x98]
        cmp     r0, #0
        str     r0, [sp, #0x5C]
        mov     r8, r1
        mov     r9, r2
        mov     r7, r3
        beq     LCUE152
        cmp     r9, #0
        beq     LCUE152
        cmp     r4, #0
        beq     LCUE152
        cmp     r8, #0
        ble     LCUE151
        cmp     r7, #0
        ble     LCUE151
        cmp     r6, #0
        ble     LCUE151
        rsb     r12, r10, #0
        sub     r12, r12, r8
        add     r12, r12, #1
        cmp     r12, #0
        ble     LCUE0
        cmp     r12, r6
        mov     r11, r6
        movlt   r11, r12
        mov     r1, r11
        mov     r0, r4
        add     r10, r10, r12
        bl      _ippsZero_16s
        subs    r6, r6, r11
        addne   r4, r4, r11, lsl #1
        beq     LCUE1
LCUE0:
        sub     r12, r7, r10
        mov     r11, #0
        cmp     r12, #0
        movgt   r11, r12
        sub     r1, r6, r11
        cmp     r1, #0
        str     r12, [sp, #0x50]
        ble     LCUE2
        add     r0, r4, r11, lsl #1
        bl      _ippsZero_16s
        cmp     r11, #0
        mov     r6, r11
        bne     LCUE2
LCUE1:
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE2:
        mov     r0, r6
        bl      _ippsMalloc_64s
        mov     r1, r0
        cmp     r1, #0
        beq     LCUE153
        cmp     r8, r7
        mov     lr, r7
        movlt   lr, r8
        subs    r2, r8, r7
        mov     r0, r1
        eor     r12, r2, r2, asr #31
        sub     r11, lr, #1
        sub     r12, r12, r2, asr #31
        ble     LCUE58
        cmp     r10, #0
        bge     LCUE40
        rsb     r10, r10, #0
        cmp     r10, r12
        ble     LCUE21
        sub     lr, r10, r12
        cmp     lr, r6
        mov     r0, r6
        movlt   r0, lr
        mov     r8, #0
        sub     lr, lr, r0
        cmp     lr, #0
        movgt   r8, lr
        sub     lr, r11, r8
        ldr     r11, [sp, #0x5C]
        bic     r2, r0, #3
        cmp     r2, #0
        add     r11, r11, r12, lsl #1
        add     r11, r11, #2
        add     r8, r11, r8, lsl #1
        sub     r11, r0, #1
        sub     r3, lr, #3
        add     r11, r1, r11, lsl #3
        str     r11, [sp, #0x50]
        str     r3, [sp, #0x58]
        sub     r11, r0, r2
        sub     lr, lr, r2
        ble     LCUE6
        ldr     r3, [sp, #0x50]
        str     r6, [sp]
        str     lr, [sp, #0x44]
        str     r11, [sp, #0x48]
        str     r2, [sp, #0x4C]
        str     r0, [sp, #0x18]
        str     r10, [sp, #4]
        str     r12, [sp, #0x20]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
LCUE3:
        ldr     r0, [sp, #0x58]
        ldr     r2, [sp, #0x14]
        cmp     r0, #0
        ble     LCUE120
        mov     r7, #0
        mov     r10, r7
        mov     r9, r10
        mov     r0, r9
        mov     r1, r0
        str     r1, [sp, #0x28]
        str     r1, [sp, #0x24]
        str     r1, [sp, #0x2C]
        str     r1, [sp, #0x30]
        add     lr, r8, #2
        add     r12, r8, #4
        str     r1, [sp, #0x34]
        add     r6, r8, #6
        mov     r5, lr
        mov     r4, r12
        str     lr, [sp, #0x3C]
        str     r12, [sp, #0x40]
        str     r3, [sp, #0x50]
        str     r8, [sp, #0x38]
LCUE4:
        ldr     r3, [sp, #0x38]
        ldrsh   lr, [r2], #2
        ldrsh   r8, [r4], #2
        ldrsh   r12, [r3, +r7]
        ldrsh   r11, [r6], #2
        ldrsh   r3, [r5], #2
        mul     r8, lr, r8
        mul     r12, lr, r12
        str     r11, [sp, #0x60]
        mul     r3, lr, r3
        ldr     r11, [sp, #0x60]
        add     r1, r1, #1
        mul     lr, lr, r11
        ldr     r11, [sp, #0x30]
        add     r7, r7, #2
        adds    r11, r11, r12
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x34]
        adc     r11, r11, r12, asr #31
        ldr     r12, [sp, #0x24]
        str     r11, [sp, #0x34]
        adds    r12, r3, r12
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x2C]
        adc     r12, r12, r3, asr #31
        ldr     r3, [sp, #0x28]
        adds    r0, r8, r0
        str     r12, [sp, #0x2C]
        adc     r3, r3, r8, asr #31
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x58]
        adds    r10, lr, r10
        adc     r9, r9, lr, asr #31
        cmp     r1, r3
        blt     LCUE4
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r3, [sp, #0x50]
        ldr     r8, [sp, #0x38]
LCUE5:
        ldrsh   r7, [r2, #2]
        mov     r1, r1, lsl #1
        ldrsh   r4, [r2]
        ldrsh   r11, [r8, +r1]
        ldrsh   r6, [lr, +r1]
        ldrsh   r5, [r12, +r1]
        mul     r11, r4, r11
        add     r8, r8, #8
        mul     r6, r7, r6
        sub     r7, r3, #8
        str     r11, [sp, #0x60]
        ldrsh   r4, [r2, #4]
        str     r7, [sp, #0x54]
        ldr     r11, [sp, #0x34]
        ldr     r7, [sp, #0x60]
        mul     r5, r4, r5
        ldr     r4, [sp, #0x30]
        adds    r4, r4, r7
        adc     r7, r11, r7, asr #31
        ldr     r11, [sp, #0x54]
        sub     r11, r11, #8
        sub     r11, r11, #8
        str     r11, [sp, #0x60]
        adds    r11, r6, r5
        mov     r5, r5, asr #31
        adc     r6, r5, r6, asr #31
        adds    r11, r4, r11
        adc     r6, r7, r6
        str     r6, [r3, #4]
        str     r11, [r3]
        ldrsh   r5, [r12, +r1]
        ldrsh   r6, [r2, #2]
        ldrsh   lr, [lr, +r1]
        ldrsh   r7, [r2]
        ldr     r4, [sp, #0x4C]
        mul     r5, r6, r5
        ldr     r6, [sp, #0x58]
        mul     lr, r7, lr
        sub     r4, r4, #4
        sub     r6, r6, #4
        str     r6, [sp, #0x58]
        mov     r6, r5, asr #31
        str     r4, [sp, #0x4C]
        adds    r5, lr, r5
        adc     lr, r6, lr, asr #31
        ldr     r6, [sp, #0x24]
        adds    r5, r5, r6
        ldr     r6, [sp, #0x2C]
        str     r5, [r3, #-8]
        adc     r6, lr, r6
        str     r6, [r3, #-4]
        ldrsh   r1, [r12, +r1]
        ldrsh   r2, [r2]
        str     r10, [r3, #-0x18]
        str     r9, [r3, #-0x14]
        mul     r1, r2, r1
        adds    r0, r1, r0
        str     r0, [r3, #-0x10]
        ldr     r0, [sp, #0x28]
        adc     r1, r0, r1, asr #31
        str     r1, [r3, #-0xC]
        ldr     r0, [sp, #0x60]
        cmp     r4, #0
        sub     r3, r0, #8
        bgt     LCUE3
        ldr     r6, [sp]
        ldr     lr, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r0, [sp, #0x18]
        ldr     r10, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        str     r3, [sp, #0x50]
LCUE6:
        cmp     r11, #0
        ble     LCUE12
        str     r10, [sp, #4]
        ldr     r10, [sp, #0x50]
        str     r6, [sp]
        str     r0, [sp, #0x18]
        str     r12, [sp, #0x20]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r7, [sp, #0x10]
LCUE7:
        cmp     lr, #0
        mov     r5, r9
        movle   r7, #0
        movle   r6, r7
        ble     LCUE11
        cmp     lr, #6
        blt     LCUE119
        mov     r4, #0
        mov     r6, r4
        mov     r7, r6
        mov     r1, #6
        str     r1, [sp, #0x54]
        mov     r0, r7
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x54]
        sub     r2, lr, #6
        mov     r12, #2
        mov     r3, #4
        mov     r1, #8
        str     r2, [sp, #0x58]
        str     lr, [sp, #0x44]
        str     r11, [sp, #0x48]
        str     r10, [sp, #0x50]
        str     r9, [sp, #0x14]
LCUE8:
        ldrsh   r2, [r8, +r4]
        ldrsh   lr, [r5]
        ldrsh   r9, [r8, +r12]
        ldrsh   r10, [r5, #2]
        ldrsh   r11, [r8, +r3]
        mul     r2, lr, r2
        ldrsh   lr, [r5, #4]
        mul     r9, r10, r9
        add     r0, r0, #5
        mul     lr, lr, r11
        adds    r6, r6, r2
        add     r4, r4, #0xA
        str     r9, [sp, #0x4C]
        ldrsh   r9, [r8, +r7]
        add     r12, r12, #0xA
        add     r3, r3, #0xA
        add     r7, r7, #0xA
        str     r9, [sp, #0x40]
        ldrsh   r10, [r5, #8]
        ldrsh   r9, [r5, #6]
        ldrsh   r11, [r8, +r1]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x40]
        add     r5, r5, #0xA
        add     r1, r1, #0xA
        mul     r10, r9, r10
        ldr     r9, [sp, #0x60]
        adc     r9, r9, r2, asr #31
        ldr     r2, [sp, #0x3C]
        mul     r2, r2, r11
        ldr     r11, [sp, #0x4C]
        adds    r6, r6, r11
        adc     r11, r9, r11, asr #31
        adds    r6, r6, lr
        adc     lr, r11, lr, asr #31
        adds    r6, r6, r10
        adc     r10, lr, r10, asr #31
        adds    r6, r6, r2
        adc     r2, r10, r2, asr #31
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x58]
        cmp     r0, r2
        ble     LCUE8
        ldr     r7, [sp, #0x60]
        ldr     lr, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp, #0x50]
        ldr     r9, [sp, #0x14]
LCUE9:
        mov     r1, r0, lsl #1
LCUE10:
        ldrsh   r12, [r8, +r1]
        ldrsh   r3, [r5], #2
        add     r1, r1, #2
        add     r0, r0, #1
        mul     r12, r3, r12
        adds    r6, r6, r12
        adc     r7, r7, r12, asr #31
        cmp     r0, lr
        blt     LCUE10
LCUE11:
        str     r6, [r10]
        str     r7, [r10, #4]
        subs    r11, r11, #1
        sub     lr, lr, #1
        add     r8, r8, #2
        sub     r10, r10, #8
        bne     LCUE7
        ldr     r6, [sp]
        ldr     r0, [sp, #0x18]
        ldr     r10, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
LCUE12:
        cmp     r5, #0
        mov     r2, r5
        bne     LCUE16
        cmp     r0, #0
        ble     LCUE20
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r3, #0
        mvn     lr, lr
        mov     r2, r3
        mvn     r11, #0
        mov     r8, r1
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
LCUE13:
        ldr     r1, [r8]
        ldr     r5, [r8, #4]
        subs    r7, r1, lr
        sbcs    r9, r5, #0
        movlt   r7, #0
        movlt   r9, #0
        orrs    r9, r7, r9
        beq     LCUE14
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LCUE15
LCUE14:
        mov     r7, #0
        sub     r7, r7, #2, 18
        cmp     r1, r7
        sbcs    r5, r5, r11
        movlt   r1, #0
        sublt   r1, r1, #2, 18
LCUE15:
        add     r2, r2, #1
        strh    r1, [r4, +r3]
        cmp     r2, r0
        add     r8, r8, #8
        add     r3, r3, #2
        blt     LCUE13
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        b       LCUE20
LCUE16:
        cmp     r5, #0
        ble     LCUE115
        cmp     r5, #0x3F
        movgt   r2, #0x1F
        cmp     r0, #0
        ble     LCUE20
        sub     lr, r2, #1
        mov     r8, #1
        mov     lr, r8, lsl lr
        sub     lr, lr, #1
        str     lr, [sp, #0x58]
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #0x58]
        str     lr, [sp, #0x54]
        mvn     r8, #0
        mov     lr, #0
        mov     r3, r2, asr #31
        str     r8, [sp, #0x50]
        str     r6, [sp]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        mov     r11, lr
        mov     r8, r1
        str     r0, [sp, #0x18]
        str     r10, [sp, #4]
        str     r12, [sp, #0x20]
        str     r1, [sp, #8]
        str     r9, [sp, #0x14]
        mov     r5, r2
        mov     r4, r3
        mov     r6, lr
LCUE17:
        ldr     r10, [r8]
        ldr     r9, [r8, #4]
        mov     r2, r5
        mov     r0, r10
        mov     r3, r4
        mov     r1, r9
        bl      __ashrdi3
        adds    r10, r7, r10
        and     r0, r0, #1
        adc     r9, r9, r7, asr #31
        adds    r0, r10, r0
        adc     r1, r9, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x54]
        subs    r12, r0, r12
        sbcs    r9, r1, #0
        movlt   r12, #0
        movlt   r9, #0
        orrs    r9, r12, r9
        beq     LCUE18
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LCUE19
LCUE18:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x50]
        sbcs    r1, r1, r12
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LCUE19:
        ldr     r1, [sp, #0x1C]
        add     r11, r11, #1
        add     r8, r8, #8
        strh    r0, [r1, +r6]
        ldr     r0, [sp, #0x18]
        add     r6, r6, #2
        cmp     r11, r0
        blt     LCUE17
        ldr     r6, [sp]
        ldr     r0, [sp, #0x18]
        ldr     r10, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
LCUE20:
        subs    r6, r6, r0
        sub     r10, r10, r0
        add     r4, r4, r0, lsl #1
        add     r0, r1, r0, lsl #3
        bne     LCUE21
        mov     r0, r1
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE21:
        cmp     r10, r12
        ldr     lr, [sp, #0x5C]
        movlt   r12, r10
        cmp     r12, r6
        mov     r11, r6
        movlt   r11, r12
        bic     r2, r11, #3
        add     r12, lr, r12, lsl #1
        cmp     r2, #0
        mov     lr, r0
        and     r8, r11, #3
        ble     LCUE25
        str     r6, [sp]
        str     r8, [sp, #0x48]
        str     r11, [sp, #0x18]
        str     r10, [sp, #4]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r9, [sp, #0x14]
LCUE22:
        ldr     r0, [sp, #0x14]
        cmp     r7, #0
        str     r0, [sp, #0x60]
        ble     LCUE131
        mov     r0, #0
        mov     r5, r0
        mov     r4, r5
        mov     r1, r4
        sub     r3, r12, #2
        mov     r11, r1
        mov     r10, r11
        str     r3, [sp, #0x54]
        mov     r9, r10
        mov     r8, r9
        sub     r3, r12, #4
        str     r3, [sp, #0x50]
        mov     r6, r8
        str     r7, [sp, #0x58]
        sub     r3, r12, #6
        str     r3, [sp, #0x44]
        str     r6, [sp, #0x38]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x30]
        str     lr, [sp, #0x4C]
        str     r7, [sp, #0x10]
        ldr     lr, [sp, #0x58]
        ldr     r9, [sp, #0x44]
        ldr     r8, [sp, #0x50]
        ldr     r7, [sp, #0x54]
        ldr     r6, [sp, #0x60]
        str     r10, [sp, #0x2C]
        str     r11, [sp, #0x28]
        str     r2, [sp, #0x40]
        str     r12, [sp, #0x3C]
LCUE23:
        ldr     r2, [sp, #0x3C]
        ldrsh   r12, [r6], #2
        ldrsh   r10, [r8], #2
        ldrsh   r3, [r2, +r0]
        ldrsh   r11, [r9], #2
        ldrsh   r2, [r7], #2
        mul     r10, r12, r10
        mul     r3, r12, r3
        str     r11, [sp, #0x20]
        mul     r2, r12, r2
        ldr     r11, [sp, #0x20]
        mul     r12, r12, r11
        ldr     r11, [sp, #0x34]
        add     r0, r0, #2
        adds    r11, r11, r3
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        adc     r11, r11, r3, asr #31
        ldr     r3, [sp, #0x2C]
        str     r11, [sp, #0x38]
        adds    r3, r2, r3
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        adc     r3, r3, r2, asr #31
        ldr     r2, [sp, #0x28]
        adds    r1, r10, r1
        str     r3, [sp, #0x30]
        adc     r2, r2, r10, asr #31
        adds    r5, r12, r5
        str     r2, [sp, #0x28]
        adc     r4, r4, r12, asr #31
        subs    lr, lr, #1
        bne     LCUE23
        ldr     r6, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x28]
        ldr     r2, [sp, #0x40]
        ldr     lr, [sp, #0x4C]
        ldr     r12, [sp, #0x3C]
        ldr     r7, [sp, #0x10]
LCUE24:
        sub     r2, r2, #4
        str     r8, [lr]
        str     r6, [lr, #4]
        str     r10, [lr, #8]
        str     r9, [lr, #0xC]
        str     r1, [lr, #0x10]
        str     r11, [lr, #0x14]
        str     r5, [lr, #0x18]
        str     r4, [lr, #0x1C]
        cmp     r2, #0
        sub     r12, r12, #8
        add     lr, lr, #0x20
        bgt     LCUE22
        ldr     r6, [sp]
        ldr     r8, [sp, #0x48]
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #4]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
LCUE25:
        cmp     r8, #0
        ble     LCUE31
        sub     r2, r7, #6
        str     r6, [sp]
        str     r2, [sp, #0x50]
        str     r11, [sp, #0x18]
        str     r10, [sp, #4]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
LCUE26:
        cmp     r7, #0
        mov     r2, r9
        movle   r3, #0
        movle   r0, r3
        ble     LCUE30
        cmp     r7, #6
        blt     LCUE130
        mov     r11, #0
        mov     r0, r11
        mov     r3, r0
        mov     r1, r3
        mov     r10, #2
        mov     r6, #4
        mov     r5, #6
        mov     r4, #8
        str     r3, [sp, #0x44]
        str     r8, [sp, #0x48]
        str     lr, [sp, #0x4C]
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
LCUE27:
        ldrsh   lr, [r12, +r11]
        ldrsh   r3, [r2]
        ldrsh   r7, [r12, +r10]
        ldrsh   r8, [r2, #2]
        ldrsh   r9, [r12, +r6]
        mul     r3, r3, lr
        ldrsh   lr, [r2, #4]
        mul     r7, r8, r7
        add     r1, r1, #5
        mul     lr, lr, r9
        adds    r0, r0, r3
        add     r11, r11, #0xA
        str     r7, [sp, #0x60]
        ldrsh   r7, [r12, +r5]
        add     r10, r10, #0xA
        add     r6, r6, #0xA
        add     r5, r5, #0xA
        str     r7, [sp, #0x58]
        ldrsh   r8, [r2, #8]
        ldrsh   r7, [r2, #6]
        ldrsh   r9, [r12, +r4]
        str     r8, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        add     r2, r2, #0xA
        add     r4, r4, #0xA
        mul     r8, r7, r8
        ldr     r7, [sp, #0x44]
        adc     r7, r7, r3, asr #31
        ldr     r3, [sp, #0x54]
        mul     r3, r3, r9
        ldr     r9, [sp, #0x60]
        adds    r0, r0, r9
        adc     r9, r7, r9, asr #31
        adds    r0, r0, lr
        adc     lr, r9, lr, asr #31
        adds    r0, r0, r8
        adc     r8, lr, r8, asr #31
        adds    r0, r0, r3
        adc     r3, r8, r3, asr #31
        str     r3, [sp, #0x44]
        ldr     r3, [sp, #0x50]
        cmp     r1, r3
        ble     LCUE27
        ldr     r3, [sp, #0x44]
        ldr     r8, [sp, #0x48]
        ldr     lr, [sp, #0x4C]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
LCUE28:
        mov     r4, r1, lsl #1
LCUE29:
        ldrsh   r6, [r12, +r4]
        ldrsh   r5, [r2], #2
        add     r4, r4, #2
        add     r1, r1, #1
        mul     r6, r5, r6
        adds    r0, r0, r6
        adc     r3, r3, r6, asr #31
        cmp     r1, r7
        blt     LCUE29
LCUE30:
        str     r0, [lr]
        str     r3, [lr, #4]
        subs    r8, r8, #1
        sub     r12, r12, #2
        add     lr, lr, #8
        bne     LCUE26
        ldr     r6, [sp]
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #4]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
LCUE31:
        cmp     r5, #0
        mov     r2, r5
        bne     LCUE35
        cmp     r11, #0
        ble     LCUE39
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mov     r3, #0
        mvn     r12, r12
        mov     r2, r3
        mvn     r8, #0
        mov     lr, r0
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
LCUE32:
        ldr     r1, [r0, +r2, lsl #3]
        ldr     r7, [lr, #4]
        subs    r9, r1, r12
        sbcs    r5, r7, #0
        movlt   r9, #0
        movlt   r5, #0
        orrs    r5, r9, r5
        beq     LCUE33
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LCUE34
LCUE33:
        mov     r5, #0
        sub     r5, r5, #2, 18
        cmp     r1, r5
        sbcs    r7, r7, r8
        movlt   r1, #0
        sublt   r1, r1, #2, 18
LCUE34:
        add     r2, r2, #1
        strh    r1, [r4, +r3]
        cmp     r2, r11
        add     lr, lr, #8
        add     r3, r3, #2
        blt     LCUE32
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        b       LCUE39
LCUE35:
        cmp     r5, #0
        ble     LCUE126
        cmp     r5, #0x3F
        movgt   r2, #0x1F
        cmp     r11, #0
        ble     LCUE39
        sub     r12, r2, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        mov     r3, #0
        sub     r8, r12, #1
        mvn     r12, #0xFF
        mov     lr, r2, asr #31
        str     lr, [sp, #0x58]
        str     r3, [sp, #0x54]
        str     r0, [sp, #0x50]
        bic     r12, r12, #0x7F, 24
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
        str     r9, [sp, #0x14]
        ldr     r7, [sp, #0x50]
        ldr     r5, [sp, #0x58]
        ldr     r9, [sp, #0x54]
        mvn     r12, r12
        mvn     lr, #0
        str     r6, [sp]
        str     r4, [sp, #0x1C]
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x20]
        str     r11, [sp, #0x18]
        str     r10, [sp, #4]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        mov     r4, r2
        mov     r6, r3
LCUE36:
        ldr     r0, [sp, #0x24]
        ldr     r10, [r7, #4]
        mov     r2, r4
        ldr     r11, [r0, +r9, lsl #3]
        mov     r3, r5
        mov     r1, r10
        mov     r0, r11
        bl      __ashrdi3
        adds    r11, r8, r11
        and     r0, r0, #1
        adc     r10, r10, r8, asr #31
        adds    r0, r11, r0
        adc     r1, r10, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r12, [sp, #0x20]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE37
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LCUE38
LCUE37:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x28]
        sbcs    r1, r1, r12
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LCUE38:
        ldr     r1, [sp, #0x1C]
        add     r9, r9, #1
        add     r7, r7, #8
        strh    r0, [r1, +r6]
        ldr     r0, [sp, #0x18]
        add     r6, r6, #2
        cmp     r9, r0
        blt     LCUE36
        ldr     r6, [sp]
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #4]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
LCUE39:
        subs    r6, r6, r11
        sub     r10, r10, r11
        add     r0, r0, r11, lsl #3
        add     r4, r4, r11, lsl #1
        subne   r7, r7, r10
        strne   r7, [sp, #0x50]
        beq     LCUE57
LCUE40:
        ldr     r3, [sp, #0x50]
        add     r10, r9, r10, lsl #1
        mov     r12, r0
        cmp     r3, r6
        movlt   r6, r3
        bic     r8, r6, #3
        sub     r7, r3, #3
        cmp     r8, #0
        sub     r3, r3, r8
        sub     lr, r6, r8
        ble     LCUE44
        str     r6, [sp]
        str     r3, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r8, [sp, #0x2C]
        str     r7, [sp, #0x40]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
LCUE41:
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x5C]
        cmp     r0, #0
        ble     LCUE125
        mov     r9, #0
        mov     r3, r9
        mov     r2, r3
        mov     r0, r2
        mov     r5, r0
        str     r5, [sp, #0x58]
        str     r5, [sp, #0x54]
        str     r5, [sp, #0x50]
        str     r5, [sp, #0x4C]
        add     lr, r10, #2
        add     r4, r10, #4
        str     r5, [sp, #0x48]
        add     r8, r10, #6
        mov     r7, lr
        mov     r6, r4
        str     lr, [sp, #0x3C]
        str     r4, [sp, #0x38]
        str     r12, [sp, #0x28]
        str     r10, [sp, #0x44]
LCUE42:
        ldr     r12, [sp, #0x44]
        ldrsh   r4, [r1], #2
        ldrsh   r10, [r6], #2
        ldrsh   lr, [r12, +r9]
        ldrsh   r11, [r8], #2
        ldrsh   r12, [r7], #2
        mul     r10, r4, r10
        mul     lr, r4, lr
        str     r11, [sp, #0x60]
        mul     r12, r4, r12
        ldr     r11, [sp, #0x60]
        add     r5, r5, #1
        mul     r4, r4, r11
        ldr     r11, [sp, #0x4C]
        add     r9, r9, #2
        adds    r11, r11, lr
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #0x48]
        adc     r11, r11, lr, asr #31
        ldr     lr, [sp, #0x54]
        str     r11, [sp, #0x48]
        adds    lr, r12, lr
        str     lr, [sp, #0x54]
        ldr     lr, [sp, #0x50]
        adc     lr, lr, r12, asr #31
        ldr     r12, [sp, #0x58]
        adds    r0, r10, r0
        str     lr, [sp, #0x50]
        adc     r12, r12, r10, asr #31
        str     r12, [sp, #0x58]
        ldr     r12, [sp, #0x40]
        adds    r3, r4, r3
        adc     r2, r2, r4, asr #31
        cmp     r5, r12
        blt     LCUE42
        ldr     lr, [sp, #0x3C]
        ldr     r4, [sp, #0x38]
        ldr     r12, [sp, #0x28]
        ldr     r10, [sp, #0x44]
LCUE43:
        mov     r5, r5, lsl #1
        ldrsh   r11, [r10, +r5]
        ldrsh   r7, [r1]
        ldrsh   r6, [lr, +r5]
        ldrsh   r9, [r1, #2]
        ldrsh   r8, [r4, +r5]
        mul     r7, r7, r11
        ldrsh   r11, [r1, #4]
        mul     r9, r9, r6
        ldr     r6, [sp, #0x2C]
        mul     r8, r11, r8
        ldr     r11, [sp, #0x4C]
        add     r10, r10, #8
        sub     r6, r6, #4
        str     r6, [sp, #0x2C]
        adds    r11, r11, r7
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x48]
        adc     r7, r11, r7, asr #31
        ldr     r11, [sp, #0x40]
        sub     r11, r11, #4
        str     r11, [sp, #0x40]
        adds    r11, r9, r8
        mov     r8, r8, asr #31
        adc     r9, r8, r9, asr #31
        ldr     r8, [sp, #0x60]
        adds    r11, r8, r11
        adc     r9, r7, r9
        str     r9, [r12, #4]
        str     r11, [r12]
        ldrsh   r7, [r1, #2]
        ldrsh   r9, [r1]
        ldrsh   r8, [r4, +r5]
        ldrsh   lr, [lr, +r5]
        mul     r7, r7, r8
        mul     r9, r9, lr
        mov     r8, r7, asr #31
        adds    lr, r9, r7
        adc     r7, r8, r9, asr #31
        ldr     r8, [sp, #0x54]
        adds    lr, lr, r8
        ldr     r8, [sp, #0x50]
        str     lr, [r12, #8]
        adc     r8, r7, r8
        str     r8, [r12, #0xC]
        ldrsh   r5, [r4, +r5]
        ldrsh   r1, [r1]
        str     r3, [r12, #0x18]
        str     r2, [r12, #0x1C]
        mul     r5, r1, r5
        adds    r0, r5, r0
        str     r0, [r12, #0x10]
        ldr     r0, [sp, #0x58]
        adc     r5, r0, r5, asr #31
        str     r5, [r12, #0x14]
        cmp     r6, #0
        add     r12, r12, #0x20
        bgt     LCUE41
        ldr     r6, [sp]
        ldr     r3, [sp, #0x34]
        ldr     lr, [sp, #0x30]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
LCUE44:
        cmp     lr, #0
        ble     LCUE50
        ldr     r9, [sp, #0x5C]
        str     r6, [sp]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
LCUE45:
        cmp     r3, #0
        mov     r6, r9
        movle   r8, #0
        movle   r7, r8
        ble     LCUE49
        cmp     r3, #6
        blt     LCUE138
        mov     r1, #6
        str     r1, [sp, #0x50]
        mov     r5, #0
        str     lr, [sp, #0x30]
        ldr     lr, [sp, #0x50]
        mov     r7, r5
        mov     r8, r7
        sub     r11, r3, #6
        mov     r0, r8
        mov     r4, #2
        mov     r2, #4
        mov     r1, #8
        str     r8, [sp, #0x58]
        str     r11, [sp, #0x54]
        str     r3, [sp, #0x34]
        str     r12, [sp, #0x28]
LCUE46:
        ldrsh   r3, [r10, +r5]
        ldrsh   r12, [r6]
        ldrsh   r8, [r10, +r4]
        ldrsh   r9, [r6, #2]
        ldrsh   r11, [r10, +r2]
        mul     r3, r12, r3
        ldrsh   r12, [r6, #4]
        mul     r8, r9, r8
        add     r0, r0, #5
        mul     r12, r12, r11
        adds    r7, r7, r3
        add     r5, r5, #0xA
        str     r8, [sp, #0x60]
        ldrsh   r8, [r10, +lr]
        add     r4, r4, #0xA
        add     r2, r2, #0xA
        add     lr, lr, #0xA
        str     r8, [sp, #0x4C]
        ldrsh   r9, [r6, #8]
        ldrsh   r8, [r6, #6]
        ldrsh   r11, [r10, +r1]
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        add     r6, r6, #0xA
        add     r1, r1, #0xA
        mul     r9, r8, r9
        ldr     r8, [sp, #0x58]
        adc     r8, r8, r3, asr #31
        ldr     r3, [sp, #0x48]
        mul     r3, r3, r11
        ldr     r11, [sp, #0x60]
        adds    r7, r7, r11
        adc     r11, r8, r11, asr #31
        adds    r7, r7, r12
        adc     r12, r11, r12, asr #31
        adds    r7, r7, r9
        adc     r9, r12, r9, asr #31
        adds    r7, r7, r3
        adc     r3, r9, r3, asr #31
        str     r3, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        cmp     r0, r3
        ble     LCUE46
        ldr     r8, [sp, #0x58]
        ldr     r3, [sp, #0x34]
        ldr     lr, [sp, #0x30]
        ldr     r12, [sp, #0x28]
        ldr     r9, [sp, #0x5C]
LCUE47:
        mov     r1, r0, lsl #1
LCUE48:
        ldrsh   r4, [r10, +r1]
        ldrsh   r2, [r6], #2
        add     r1, r1, #2
        add     r0, r0, #1
        mul     r4, r2, r4
        adds    r7, r7, r4
        adc     r8, r8, r4, asr #31
        cmp     r0, r3
        blt     LCUE48
LCUE49:
        str     r7, [r12]
        str     r8, [r12, #4]
        subs    lr, lr, #1
        sub     r3, r3, #1
        add     r10, r10, #2
        add     r12, r12, #8
        bne     LCUE45
        ldr     r6, [sp]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
LCUE50:
        mvn     r3, #0xFF
        cmp     r5, #0
        bic     r3, r3, #0x7F, 24
        mvn     r12, #0
        mov     r11, #0
        bne     LCUE53
        cmp     r6, #0
        ble     LCUE113
        mov     r8, r11
        mvn     r7, r3
        mov     lr, r0
LCUE51:
        ldr     r5, [r0, +r8, lsl #3]
        ldr     r10, [lr, #4]
        subs    r2, r5, r7
        sbcs    r9, r10, #0
        movlt   r2, #0
        movlt   r9, #0
        orrs    r9, r2, r9
        mvnne   r5, r3
        bne     LCUE52
        mov     r2, #0
        sub     r9, r2, #2, 18
        cmp     r5, r9
        sbcs    r10, r10, r12
        sublt   r5, r2, #2, 18
LCUE52:
        add     r8, r8, #1
        strh    r5, [r4, +r11]
        cmp     r8, r6
        add     lr, lr, #8
        add     r11, r11, #2
        blt     LCUE51
        b       LCUE113
LCUE53:
        cmp     r5, #0
        ble     LCUE121
        cmp     r5, #0x3F
        movgt   r5, #0x1F
        cmp     r6, #0
        ble     LCUE113
        sub     lr, r5, #1
        mov     r7, #1
        mov     lr, r7, lsl lr
        mvn     r3, r3
        sub     r8, lr, #1
        mov     r10, r11
        mov     r7, r5, asr #31
        mov     r9, r0
        str     r6, [sp]
        str     r3, [sp, #0x58]
        str     r12, [sp, #0x5C]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r4, [sp, #0x1C]
LCUE54:
        ldr     r0, [sp, #0x24]
        ldr     r4, [r9, #4]
        mov     r2, r5
        ldr     r6, [r0, +r10, lsl #3]
        mov     r3, r7
        mov     r1, r4
        mov     r0, r6
        bl      __ashrdi3
        adds    r6, r8, r6
        and     r0, r0, #1
        adc     r4, r4, r8, asr #31
        adds    r0, r6, r0
        adc     r1, r4, #0
        mov     r3, r7
        mov     r2, r5
        bl      __ashrdi3
        ldr     r12, [sp, #0x58]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE55
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LCUE56
LCUE55:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x5C]
        sbcs    r1, r1, r12
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LCUE56:
        ldr     r1, [sp, #0x1C]
        add     r10, r10, #1
        add     r9, r9, #8
        strh    r0, [r1, +r11]
        ldr     r0, [sp]
        add     r11, r11, #2
        cmp     r10, r0
        blt     LCUE54
        ldr     r1, [sp, #8]
        b       LCUE113
LCUE57:
        mov     r0, r1
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE58:
        cmp     r10, #0
        bge     LCUE77
        rsb     r10, r10, #0
        cmp     r10, r6
        mov     r0, r6
        movlt   r0, r10
        ldr     r7, [sp, #0x5C]
        mov     r3, #0
        sub     r10, r10, r0
        cmp     r10, #0
        movgt   r3, r10
        sub     r11, r11, r3
        add     r7, r7, r3, lsl #1
        sub     r3, r0, #1
        str     r11, [sp, #0x60]
        add     r3, r1, r3, lsl #3
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x60]
        bic     r2, r0, #3
        add     r7, r7, #2
        str     r7, [sp, #0x38]
        sub     r11, r3, #3
        cmp     r2, #0
        sub     r7, r0, r2
        sub     r3, r3, r2
        ble     LCUE62
        str     r2, [sp, #0x18]
        str     r5, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r5, [sp, #0x38]
        str     r6, [sp]
        str     r3, [sp, #0x28]
        str     r7, [sp, #0x24]
        str     r11, [sp, #0x34]
        str     r0, [sp, #4]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r1, [sp, #8]
        str     r10, [sp, #0x54]
        str     r4, [sp, #0x1C]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x58]
LCUE59:
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #0x14]
        cmp     r0, #0
        ble     LCUE150
        mov     r10, #0
        mov     r12, r10
        mov     r3, r12
        mov     r0, r3
        mov     r6, r0
        str     r6, [sp, #0x50]
        str     r6, [sp, #0x48]
        str     r6, [sp, #0x44]
        str     r6, [sp, #0x40]
        add     lr, r5, #2
        add     r4, r5, #4
        str     r6, [sp, #0x3C]
        add     r9, r5, #6
        mov     r8, lr
        mov     r7, r4
        str     lr, [sp, #0x30]
        str     r4, [sp, #0x2C]
        str     r2, [sp, #0x10]
        str     r5, [sp, #0x38]
LCUE60:
        ldr     r2, [sp, #0x38]
        ldrsh   r4, [r1], #2
        ldrsh   r5, [r7], #2
        ldrsh   lr, [r2, +r10]
        ldrsh   r11, [r9], #2
        ldrsh   r2, [r8], #2
        mul     r5, r4, r5
        mul     lr, r4, lr
        str     r11, [sp, #0x60]
        mul     r2, r4, r2
        ldr     r11, [sp, #0x60]
        add     r6, r6, #1
        mul     r4, r4, r11
        ldr     r11, [sp, #0x40]
        add     r10, r10, #2
        adds    r11, r11, lr
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x3C]
        adc     r11, r11, lr, asr #31
        ldr     lr, [sp, #0x48]
        str     r11, [sp, #0x3C]
        adds    lr, lr, r2
        str     lr, [sp, #0x48]
        ldr     lr, [sp, #0x44]
        adc     lr, lr, r2, asr #31
        ldr     r2, [sp, #0x50]
        adds    r0, r0, r5
        str     lr, [sp, #0x44]
        adc     r2, r2, r5, asr #31
        str     r2, [sp, #0x50]
        ldr     r2, [sp, #0x34]
        adds    r12, r12, r4
        adc     r3, r3, r4, asr #31
        cmp     r6, r2
        blt     LCUE60
        ldr     lr, [sp, #0x30]
        ldr     r4, [sp, #0x2C]
        ldr     r2, [sp, #0x10]
        ldr     r5, [sp, #0x38]
LCUE61:
        ldrsh   r7, [r1]
        ldrsh   r9, [r1, #2]
        mov     r6, r6, lsl #1
        ldrsh   r11, [r5, +r6]
        ldrsh   r8, [lr, +r6]
        ldrsh   r10, [r4, +r6]
        add     r5, r5, #8
        mul     r7, r7, r11
        ldrsh   r11, [r1, #4]
        mul     r8, r9, r8
        sub     r9, r2, #8
        mul     r10, r11, r10
        ldr     r11, [sp, #0x40]
        sub     r9, r9, #8
        sub     r9, r9, #8
        str     r9, [sp, #0x40]
        adds    r11, r11, r7
        str     r11, [sp, #0x60]
        ldr     r11, [sp, #0x3C]
        adc     r7, r11, r7, asr #31
        adds    r9, r8, r10
        mov     r10, r10, asr #31
        adc     r8, r10, r8, asr #31
        ldr     r10, [sp, #0x60]
        adds    r9, r10, r9
        adc     r8, r7, r8
        str     r9, [r2]
        str     r8, [r2, #4]
        ldrsh   r7, [lr, +r6]
        ldrsh   r10, [r1]
        ldrsh   r9, [r4, +r6]
        ldrsh   r8, [r1, #2]
        ldr     lr, [sp, #0x18]
        mul     r7, r10, r7
        ldr     r10, [sp, #0x34]
        mul     r9, r8, r9
        ldr     r8, [sp, #0x48]
        sub     r10, r10, #4
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x44]
        adds    r8, r8, r7
        sub     lr, lr, #4
        str     lr, [sp, #0x18]
        adc     r7, r10, r7, asr #31
        adds    r8, r8, r9
        adc     r9, r7, r9, asr #31
        str     r8, [r2, #-8]
        str     r9, [r2, #-4]
        ldrsh   r6, [r4, +r6]
        ldrsh   r1, [r1]
        str     r12, [r2, #-0x18]
        str     r3, [r2, #-0x14]
        mul     r6, r1, r6
        adds    r0, r0, r6
        str     r0, [r2, #-0x10]
        ldr     r0, [sp, #0x50]
        adc     r6, r0, r6, asr #31
        str     r6, [r2, #-0xC]
        ldr     r0, [sp, #0x40]
        cmp     lr, #0
        sub     r2, r0, #8
        bgt     LCUE59
        str     r5, [sp, #0x38]
        ldr     r6, [sp]
        ldr     r3, [sp, #0x28]
        ldr     r7, [sp, #0x24]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x54]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x58]
        str     r2, [sp, #0x10]
LCUE62:
        cmp     r7, #0
        ble     LCUE68
        str     r6, [sp]
        ldr     r11, [sp, #0x10]
        ldr     r6, [sp, #0x38]
        str     r0, [sp, #4]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r10, [sp, #0x54]
        str     r4, [sp, #0x1C]
        str     r8, [sp, #0x58]
LCUE63:
        cmp     r3, #0
        mov     r5, r9
        movle   r10, #0
        movle   r8, r10
        ble     LCUE67
        cmp     r3, #6
        blt     LCUE149
        mov     r1, #6
        str     r1, [sp, #0x48]
        mov     r4, #0
        str     r7, [sp, #0x24]
        ldr     r7, [sp, #0x48]
        mov     r8, r4
        mov     r10, r8
        sub     r2, r3, #6
        mov     r0, r10
        mov     lr, #2
        mov     r12, #4
        mov     r1, #8
        str     r10, [sp, #0x60]
        str     r2, [sp, #0x50]
        str     r3, [sp, #0x28]
        str     r11, [sp, #0x10]
        str     r9, [sp, #0x14]
LCUE64:
        ldrsh   r2, [r6, +r4]
        ldrsh   r3, [r5]
        ldrsh   r9, [r6, +lr]
        ldrsh   r10, [r5, #2]
        ldrsh   r11, [r6, +r12]
        mul     r2, r3, r2
        ldrsh   r3, [r5, #4]
        mul     r9, r10, r9
        add     r0, r0, #5
        mul     r3, r3, r11
        adds    r8, r8, r2
        add     r4, r4, #0xA
        str     r9, [sp, #0x44]
        ldrsh   r9, [r6, +r7]
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        add     r7, r7, #0xA
        str     r9, [sp, #0x40]
        ldrsh   r10, [r5, #8]
        ldrsh   r9, [r5, #6]
        ldrsh   r11, [r6, +r1]
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x40]
        add     r5, r5, #0xA
        add     r1, r1, #0xA
        mul     r10, r9, r10
        ldr     r9, [sp, #0x60]
        adc     r9, r9, r2, asr #31
        ldr     r2, [sp, #0x3C]
        mul     r2, r2, r11
        ldr     r11, [sp, #0x44]
        adds    r8, r8, r11
        adc     r11, r9, r11, asr #31
        adds    r8, r8, r3
        adc     r3, r11, r3, asr #31
        adds    r8, r8, r10
        adc     r10, r3, r10, asr #31
        adds    r8, r8, r2
        adc     r2, r10, r2, asr #31
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x50]
        cmp     r0, r2
        ble     LCUE64
        ldr     r10, [sp, #0x60]
        ldr     r3, [sp, #0x28]
        ldr     r7, [sp, #0x24]
        ldr     r11, [sp, #0x10]
        ldr     r9, [sp, #0x14]
LCUE65:
        mov     r1, r0, lsl #1
LCUE66:
        ldrsh   lr, [r6, +r1]
        ldrsh   r12, [r5], #2
        add     r1, r1, #2
        add     r0, r0, #1
        mul     lr, r12, lr
        adds    r8, r8, lr
        adc     r10, r10, lr, asr #31
        cmp     r0, r3
        blt     LCUE66
LCUE67:
        str     r8, [r11]
        str     r10, [r11, #4]
        subs    r7, r7, #1
        sub     r3, r3, #1
        add     r6, r6, #2
        sub     r11, r11, #8
        bne     LCUE63
        ldr     r6, [sp]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x54]
        ldr     r4, [sp, #0x1C]
        ldr     r8, [sp, #0x58]
LCUE68:
        cmp     r5, #0
        mov     r2, r5
        bne     LCUE72
        cmp     r0, #0
        ble     LCUE76
        mvn     r7, #0
        str     r7, [sp, #0x50]
        mvn     r3, #0xFF
        str     r5, [sp, #0xC]
        ldr     r5, [sp, #0x50]
        bic     r3, r3, #0x7F, 24
        mov     r2, #0
        mvn     r3, r3
        mov     r11, r2
        mov     r7, r1
        str     r1, [sp, #8]
        str     r10, [sp, #0x54]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x58]
LCUE69:
        ldr     r1, [r7]
        ldr     r10, [r7, #4]
        subs    r9, r1, r3
        sbcs    r8, r10, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        beq     LCUE70
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LCUE71
LCUE70:
        mov     r8, #0
        sub     r8, r8, #2, 18
        cmp     r1, r8
        sbcs    r10, r10, r5
        movlt   r1, #0
        sublt   r1, r1, #2, 18
LCUE71:
        add     r11, r11, #1
        strh    r1, [r4, +r2]
        cmp     r11, r0
        add     r7, r7, #8
        add     r2, r2, #2
        blt     LCUE69
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x54]
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x58]
        b       LCUE76
LCUE72:
        cmp     r5, #0
        ble     LCUE145
        cmp     r5, #0x3F
        movgt   r2, #0x1F
        cmp     r0, #0
        ble     LCUE76
        mvn     r3, #0xFF
        str     r3, [sp, #0x60]
        mov     r3, #0
        mov     r11, #1
        sub     r7, r2, #1
        str     r3, [sp, #0x50]
        mov     r11, r11, lsl r7
        ldr     r7, [sp, #0x60]
        str     r3, [sp, #0x44]
        mov     r3, r2, asr #31
        sub     r11, r11, #1
        str     r3, [sp, #0x40]
        str     r11, [sp, #0x48]
        bic     r7, r7, #0x7F, 24
        str     r6, [sp]
        str     r5, [sp, #0xC]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x58]
        ldr     r6, [sp, #0x48]
        ldr     r5, [sp, #0x40]
        ldr     r8, [sp, #0x44]
        ldr     r9, [sp, #0x50]
        mvn     r3, r7
        mvn     r11, #0
        str     r4, [sp, #0x1C]
        mov     r7, r1
        str     r11, [sp, #0x60]
        str     r3, [sp, #0x3C]
        str     r0, [sp, #4]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r1, [sp, #8]
        str     r10, [sp, #0x54]
        mov     r4, r2
LCUE73:
        ldr     r11, [r7]
        ldr     r10, [r7, #4]
        mov     r2, r4
        mov     r0, r11
        mov     r3, r5
        mov     r1, r10
        bl      __ashrdi3
        adds    r11, r6, r11
        and     r0, r0, #1
        adc     r10, r10, r6, asr #31
        adds    r0, r11, r0
        adc     r1, r10, #0
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     r12, [sp, #0x3C]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE74
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LCUE75
LCUE74:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x60]
        sbcs    r1, r1, r12
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LCUE75:
        ldr     r1, [sp, #0x1C]
        add     r8, r8, #1
        add     r7, r7, #8
        strh    r0, [r1, +r9]
        ldr     r0, [sp, #4]
        add     r9, r9, #2
        cmp     r8, r0
        blt     LCUE73
        ldr     r6, [sp]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x54]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x58]
LCUE76:
        subs    r6, r6, r0
        add     r4, r4, r0, lsl #1
        add     r0, r1, r0, lsl #3
        beq     LCUE114
LCUE77:
        cmp     r10, r12
        subge   r10, r10, r12
        bge     LCUE96
        sub     r3, r12, r10
        cmp     r3, r6
        mov     r11, r6
        movlt   r11, r3
        bic     r7, r11, #3
        cmp     r7, #0
        add     r10, r9, r10, lsl #1
        str     r0, [sp, #0x48]
        and     r3, r11, #3
        ble     LCUE81
        str     r11, [sp, #0x50]
        ldr     r11, [sp, #0x48]
        str     r6, [sp]
        str     r3, [sp, #0x44]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r9, [sp, #0x14]
LCUE78:
        ldr     r0, [sp, #0x5C]
        cmp     r8, #0
        str     r0, [sp, #0x54]
        ble     LCUE137
        mov     r0, #0
        mov     r12, r0
        mov     r3, r12
        mov     r2, r3
        mov     r9, r2
        add     r1, r10, #2
        str     r1, [sp, #0x3C]
        mov     r6, r9
        mov     r5, r6
        add     r1, r10, #4
        str     r1, [sp, #0x38]
        str     r8, [sp, #0x40]
        mov     r4, r5
        add     r1, r10, #6
        str     r1, [sp, #0x34]
        str     r5, [sp, #0x10]
        str     r6, [sp, #4]
        str     r9, [sp, #0x60]
        str     r7, [sp, #0x30]
        str     r8, [sp, #0x58]
        ldr     r5, [sp, #0x40]
        ldr     r9, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r6, [sp, #0x54]
        mov     lr, r4
        str     lr, [sp, #0x28]
        str     r4, [sp, #0x18]
        str     r11, [sp, #0x48]
        str     r10, [sp, #0x2C]
LCUE79:
        ldr     r1, [sp, #0x2C]
        ldrsh   r4, [r6], #2
        ldrsh   r10, [r8], #2
        ldrsh   lr, [r1, +r0]
        ldrsh   r11, [r9], #2
        ldrsh   r1, [r7], #2
        mul     r10, r4, r10
        mul     lr, r4, lr
        str     r11, [sp, #0x64]
        mul     r1, r4, r1
        ldr     r11, [sp, #0x64]
        mul     r4, r4, r11
        ldr     r11, [sp, #0x18]
        add     r0, r0, #2
        adds    r11, r11, lr
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x28]
        adc     r11, r11, lr, asr #31
        ldr     lr, [sp, #4]
        str     r11, [sp, #0x28]
        adds    lr, r1, lr
        str     lr, [sp, #4]
        ldr     lr, [sp, #0x10]
        adc     lr, lr, r1, asr #31
        ldr     r1, [sp, #0x60]
        adds    r2, r10, r2
        str     lr, [sp, #0x10]
        adc     r1, r1, r10, asr #31
        adds    r12, r4, r12
        str     r1, [sp, #0x60]
        adc     r3, r3, r4, asr #31
        subs    r5, r5, #1
        bne     LCUE79
        ldr     lr, [sp, #0x28]
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #4]
        ldr     r9, [sp, #0x60]
        ldr     r7, [sp, #0x30]
        ldr     r11, [sp, #0x48]
        ldr     r10, [sp, #0x2C]
        ldr     r8, [sp, #0x58]
LCUE80:
        sub     r7, r7, #4
        str     r4, [r11]
        str     lr, [r11, #4]
        str     r6, [r11, #8]
        str     r5, [r11, #0xC]
        str     r2, [r11, #0x10]
        str     r9, [r11, #0x14]
        str     r12, [r11, #0x18]
        str     r3, [r11, #0x1C]
        cmp     r7, #0
        add     r10, r10, #8
        add     r11, r11, #0x20
        bgt     LCUE78
        str     r11, [sp, #0x48]
        ldr     r6, [sp]
        ldr     r3, [sp, #0x44]
        ldr     r11, [sp, #0x50]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
LCUE81:
        cmp     r3, #0
        ble     LCUE87
        str     r11, [sp, #0x50]
        str     r1, [sp, #8]
        ldr     r11, [sp, #0x48]
        ldr     r1, [sp, #0x5C]
        sub     r7, r8, #6
        str     r6, [sp]
        str     r7, [sp, #0x54]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r0, [sp, #0x24]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r9, [sp, #0x14]
LCUE82:
        cmp     r8, #0
        mov     r6, r1
        movle   r9, #0
        movle   r7, r9
        ble     LCUE86
        cmp     r8, #6
        blt     LCUE136
        mov     r5, #0
        mov     r7, r5
        mov     r9, r7
        mov     r0, r9
        mov     r4, #2
        mov     lr, #4
        mov     r12, #6
        mov     r2, #8
        str     r9, [sp, #0x40]
        str     r3, [sp, #0x44]
        str     r11, [sp, #0x48]
        str     r8, [sp, #0x58]
LCUE83:
        ldrsh   r3, [r10, +r5]
        ldrsh   r1, [r6]
        ldrsh   r8, [r10, +r4]
        ldrsh   r9, [r6, #2]
        ldrsh   r11, [r10, +lr]
        mul     r3, r1, r3
        ldrsh   r1, [r6, #4]
        mul     r8, r9, r8
        add     r0, r0, #5
        mul     r9, r1, r11
        adds    r1, r7, r3
        add     r5, r5, #0xA
        str     r8, [sp, #0x64]
        ldrsh   r8, [r10, +r12]
        add     r4, r4, #0xA
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        str     r8, [sp, #0x60]
        ldrsh   r7, [r6, #8]
        ldrsh   r8, [r6, #6]
        ldrsh   r11, [r10, +r2]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x60]
        add     r6, r6, #0xA
        add     r2, r2, #0xA
        mul     r8, r8, r7
        ldr     r7, [sp, #0x40]
        adc     r7, r7, r3, asr #31
        ldr     r3, [sp, #0x3C]
        mul     r3, r3, r11
        ldr     r11, [sp, #0x64]
        adds    r1, r1, r11
        adc     r11, r7, r11, asr #31
        adds    r1, r1, r9
        adc     r9, r11, r9, asr #31
        adds    r1, r1, r8
        adc     r8, r9, r8, asr #31
        adds    r7, r1, r3
        ldr     r1, [sp, #0x54]
        adc     r3, r8, r3, asr #31
        str     r3, [sp, #0x40]
        cmp     r0, r1
        ble     LCUE83
        ldr     r9, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        ldr     r11, [sp, #0x48]
        ldr     r8, [sp, #0x58]
        ldr     r1, [sp, #0x5C]
LCUE84:
        mov     r2, r0, lsl #1
LCUE85:
        ldrsh   r12, [r10, +r2]
        ldrsh   lr, [r6], #2
        add     r2, r2, #2
        add     r0, r0, #1
        mul     r12, lr, r12
        adds    r7, r7, r12
        adc     r9, r9, r12, asr #31
        cmp     r0, r8
        blt     LCUE85
LCUE86:
        str     r7, [r11]
        str     r9, [r11, #4]
        subs    r3, r3, #1
        add     r10, r10, #2
        add     r11, r11, #8
        bne     LCUE82
        ldr     r6, [sp]
        ldr     r11, [sp, #0x50]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
LCUE87:
        cmp     r5, #0
        mov     r2, r5
        bne     LCUE91
        cmp     r11, #0
        ble     LCUE95
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     r2, #0
        mvn     r3, r3
        mov     r10, r2
        mvn     r8, #0
        mov     r7, r0
        str     lr, [sp, #0x4C]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r9, [sp, #0x14]
LCUE88:
        ldr     r1, [r0, +r10, lsl #3]
        ldr     lr, [r7, #4]
        subs    r5, r1, r3
        sbcs    r9, lr, #0
        movlt   r5, #0
        movlt   r9, #0
        orrs    r9, r5, r9
        beq     LCUE89
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
        b       LCUE90
LCUE89:
        mov     r5, #0
        sub     r5, r5, #2, 18
        cmp     r1, r5
        sbcs    lr, lr, r8
        movlt   r1, #0
        sublt   r1, r1, #2, 18
LCUE90:
        add     r10, r10, #1
        strh    r1, [r4, +r2]
        cmp     r10, r11
        add     r7, r7, #8
        add     r2, r2, #2
        blt     LCUE88
        ldr     lr, [sp, #0x4C]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        b       LCUE95
LCUE91:
        cmp     r5, #0
        ble     LCUE132
        cmp     r5, #0x3F
        movgt   r2, #0x1F
        cmp     r11, #0
        ble     LCUE95
        sub     r3, r2, #1
        mov     r7, #1
        mov     r3, r7, lsl r3
        sub     r7, r3, #1
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     r10, #0
        mvn     r3, r3
        str     r10, [sp, #0x54]
        str     r6, [sp]
        ldr     r6, [sp, #0x54]
        mvn     r8, #0
        str     r3, [sp, #0x58]
        mov     r3, r2, asr #31
        str     r8, [sp, #0x48]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
        mov     r8, r0
        str     r11, [sp, #0x50]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r9, [sp, #0x14]
        mov     r5, r2
        mov     r4, r3
LCUE92:
        ldr     r0, [sp, #0x24]
        ldr     r9, [r8, #4]
        mov     r2, r5
        ldr     r11, [r0, +r6, lsl #3]
        mov     r3, r4
        mov     r1, r9
        mov     r0, r11
        bl      __ashrdi3
        adds    r11, r7, r11
        and     r0, r0, #1
        adc     r9, r9, r7, asr #31
        adds    r0, r11, r0
        adc     r1, r9, #0
        mov     r2, r5
        mov     r3, r4
        bl      __ashrdi3
        ldr     r12, [sp, #0x58]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE93
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LCUE94
LCUE93:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x48]
        sbcs    r1, r1, r12
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LCUE94:
        ldr     r1, [sp, #0x1C]
        add     r6, r6, #1
        add     r8, r8, #8
        strh    r0, [r1, +r10]
        ldr     r0, [sp, #0x50]
        add     r10, r10, #2
        cmp     r6, r0
        blt     LCUE92
        ldr     r6, [sp]
        ldr     r11, [sp, #0x50]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
LCUE95:
        subs    r6, r6, r11
        add     r0, r0, r11, lsl #3
        add     r4, r4, r11, lsl #1
        movne   r10, #0
        bne     LCUE96
        mov     r0, r1
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE96:
        cmp     lr, r6
        add     r12, r9, r12, lsl #1
        sub     r3, lr, r10
        movlt   r6, lr
        add     r12, r12, r10, lsl #1
        bic     r10, r6, #3
        sub     r8, r3, #3
        cmp     r10, #0
        mov     lr, r0
        sub     r3, r3, r10
        sub     r7, r6, r10
        ble     LCUE100
        str     r3, [sp, #0x48]
        str     r7, [sp, #0x4C]
        str     r10, [sp, #0x58]
        str     r8, [sp, #0x40]
        str     r6, [sp]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
LCUE97:
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x5C]
        cmp     r0, #0
        ble     LCUE144
        mov     r10, #0
        mov     r3, r10
        mov     r2, r3
        mov     r0, r2
        mov     r6, r0
        str     r6, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     r6, [sp, #0x30]
        str     r6, [sp, #0x34]
        add     r4, r12, #2
        add     r5, r12, #4
        str     r6, [sp, #0x3C]
        add     r9, r12, #6
        mov     r8, r4
        mov     r7, r5
        str     r4, [sp, #0x44]
        str     r5, [sp, #0x54]
        str     lr, [sp, #0x50]
        str     r12, [sp, #0x38]
LCUE98:
        ldr     r12, [sp, #0x38]
        ldrsh   r4, [r1], #2
        ldrsh   r5, [r7], #2
        ldrsh   lr, [r12, +r10]
        ldrsh   r11, [r9], #2
        ldrsh   r12, [r8], #2
        mul     r5, r4, r5
        mul     lr, r4, lr
        str     r11, [sp, #0x64]
        mul     r12, r4, r12
        ldr     r11, [sp, #0x64]
        add     r6, r6, #1
        mul     r4, r4, r11
        ldr     r11, [sp, #0x34]
        add     r10, r10, #2
        adds    r11, r11, lr
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x3C]
        adc     r11, r11, lr, asr #31
        ldr     lr, [sp, #0x2C]
        str     r11, [sp, #0x3C]
        adds    lr, r12, lr
        str     lr, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        adc     lr, lr, r12, asr #31
        ldr     r12, [sp, #0x28]
        adds    r0, r5, r0
        str     lr, [sp, #0x30]
        adc     r12, r12, r5, asr #31
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0x40]
        adds    r3, r4, r3
        adc     r2, r2, r4, asr #31
        cmp     r6, r12
        blt     LCUE98
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #0x54]
        ldr     lr, [sp, #0x50]
        ldr     r12, [sp, #0x38]
LCUE99:
        mov     r6, r6, lsl #1
        ldrsh   r11, [r1]
        ldrsh   r8, [r12, +r6]
        ldrsh   r10, [r1, #2]
        ldrsh   r7, [r4, +r6]
        ldrsh   r9, [r5, +r6]
        mul     r8, r11, r8
        ldrsh   r11, [r1, #4]
        mul     r10, r10, r7
        ldr     r7, [sp, #0x58]
        mul     r9, r11, r9
        ldr     r11, [sp, #0x34]
        add     r12, r12, #8
        sub     r7, r7, #4
        str     r7, [sp, #0x58]
        adds    r11, r11, r8
        str     r11, [sp, #0x64]
        ldr     r11, [sp, #0x3C]
        adc     r8, r11, r8, asr #31
        ldr     r11, [sp, #0x40]
        sub     r11, r11, #4
        str     r11, [sp, #0x40]
        adds    r11, r10, r9
        mov     r9, r9, asr #31
        adc     r10, r9, r10, asr #31
        ldr     r9, [sp, #0x64]
        adds    r11, r9, r11
        adc     r10, r8, r10
        str     r10, [lr, #4]
        str     r11, [lr]
        ldrsh   r9, [r1]
        ldrsh   r8, [r5, +r6]
        ldrsh   r4, [r4, +r6]
        ldrsh   r10, [r1, #2]
        mul     r9, r9, r4
        mul     r8, r10, r8
        adds    r4, r9, r8
        mov     r10, r8, asr #31
        adc     r8, r10, r9, asr #31
        ldr     r9, [sp, #0x2C]
        adds    r4, r4, r9
        ldr     r9, [sp, #0x30]
        str     r4, [lr, #8]
        adc     r9, r8, r9
        str     r9, [lr, #0xC]
        ldrsh   r6, [r5, +r6]
        ldrsh   r1, [r1]
        str     r3, [lr, #0x18]
        str     r2, [lr, #0x1C]
        mul     r6, r1, r6
        adds    r0, r6, r0
        str     r0, [lr, #0x10]
        ldr     r0, [sp, #0x28]
        adc     r6, r0, r6, asr #31
        str     r6, [lr, #0x14]
        cmp     r7, #0
        add     lr, lr, #0x20
        bgt     LCUE97
        ldr     r3, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        ldr     r6, [sp]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
LCUE100:
        cmp     r7, #0
        mov     r10, #0
        ble     LCUE106
        ldr     r9, [sp, #0x5C]
        str     r6, [sp]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x1C]
LCUE101:
        cmp     r3, #0
        mov     r6, r9
        movle   r0, r10
        movle   r8, r0
        ble     LCUE105
        cmp     r3, #6
        blt     LCUE143
        mov     r2, #4
        mov     r5, #0
        mov     r0, r5
        str     r2, [sp, #0x54]
        mov     r8, r0
        mov     r2, #6
        str     r2, [sp, #0x58]
        mov     r1, r8
        str     r8, [sp, #0x3C]
        str     r7, [sp, #0x4C]
        ldr     r7, [sp, #0x58]
        ldr     r8, [sp, #0x54]
        sub     r11, r3, #6
        mov     r4, #2
        mov     r2, #8
        str     r11, [sp, #0x40]
        str     r10, [sp, #0x44]
        str     r3, [sp, #0x48]
        str     lr, [sp, #0x50]
LCUE102:
        ldrsh   lr, [r12, +r5]
        ldrsh   r3, [r6]
        ldrsh   r9, [r12, +r4]
        ldrsh   r10, [r6, #2]
        ldrsh   r11, [r12, +r8]
        mul     r3, r3, lr
        ldrsh   lr, [r6, #4]
        mul     r9, r10, r9
        add     r1, r1, #5
        mul     lr, lr, r11
        adds    r0, r0, r3
        add     r5, r5, #0xA
        str     r9, [sp, #0x64]
        ldrsh   r9, [r12, +r7]
        add     r4, r4, #0xA
        add     r8, r8, #0xA
        add     r7, r7, #0xA
        str     r9, [sp, #0x60]
        ldrsh   r10, [r6, #8]
        ldrsh   r9, [r6, #6]
        ldrsh   r11, [r12, +r2]
        str     r10, [sp, #0x34]
        ldr     r10, [sp, #0x60]
        add     r6, r6, #0xA
        add     r2, r2, #0xA
        mul     r10, r9, r10
        ldr     r9, [sp, #0x3C]
        adc     r9, r9, r3, asr #31
        ldr     r3, [sp, #0x34]
        mul     r3, r3, r11
        ldr     r11, [sp, #0x64]
        adds    r0, r0, r11
        adc     r11, r9, r11, asr #31
        adds    r0, r0, lr
        adc     lr, r11, lr, asr #31
        adds    r0, r0, r10
        adc     r10, lr, r10, asr #31
        adds    r0, r0, r3
        adc     r3, r10, r3, asr #31
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        cmp     r1, r3
        ble     LCUE102
        ldr     r8, [sp, #0x3C]
        ldr     r10, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        ldr     r7, [sp, #0x4C]
        ldr     lr, [sp, #0x50]
        ldr     r9, [sp, #0x5C]
LCUE103:
        mov     r2, r1, lsl #1
LCUE104:
        ldrsh   r4, [r12, +r2]
        ldrsh   r5, [r6], #2
        add     r2, r2, #2
        add     r1, r1, #1
        mul     r4, r5, r4
        adds    r0, r0, r4
        adc     r8, r8, r4, asr #31
        cmp     r1, r3
        blt     LCUE104
LCUE105:
        str     r0, [lr]
        str     r8, [lr, #4]
        subs    r7, r7, #1
        sub     r3, r3, #1
        add     r12, r12, #2
        add     lr, lr, #8
        bne     LCUE101
        ldr     r6, [sp]
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
LCUE106:
        mvn     r3, #0xFF
        cmp     r5, #0
        bic     r3, r3, #0x7F, 24
        mvn     r12, #0
        bne     LCUE109
        cmp     r6, #0
        ble     LCUE113
        mov     r8, r10
        mvn     r7, r3
        mov     lr, r0
LCUE107:
        ldr     r9, [r0, +r8, lsl #3]
        ldr     r5, [lr, #4]
        subs    r11, r9, r7
        sbcs    r2, r5, #0
        movlt   r11, #0
        movlt   r2, #0
        orrs    r2, r11, r2
        mvnne   r9, r3
        bne     LCUE108
        mov     r2, #0
        sub     r11, r2, #2, 18
        cmp     r9, r11
        sbcs    r5, r5, r12
        sublt   r9, r2, #2, 18
LCUE108:
        add     r8, r8, #1
        strh    r9, [r4, +r10]
        cmp     r8, r6
        add     lr, lr, #8
        add     r10, r10, #2
        blt     LCUE107
        b       LCUE113
LCUE109:
        cmp     r5, #0
        ble     LCUE139
        cmp     r5, #0x3F
        movgt   r5, #0x1F
        cmp     r6, #0
        ble     LCUE113
        sub     lr, r5, #1
        mov     r7, #1
        mov     lr, r7, lsl lr
        mvn     r3, r3
        mov     r2, r10
        str     r4, [sp, #0x1C]
        sub     r8, lr, #1
        mov     r7, r5, asr #31
        mov     r9, r0
        str     r3, [sp, #0x5C]
        str     r12, [sp, #0x10]
        str     r6, [sp]
        str     r0, [sp, #0x24]
        str     r1, [sp, #8]
        mov     r4, r2
LCUE110:
        ldr     r0, [sp, #0x24]
        ldr     r6, [r9, #4]
        mov     r2, r5
        ldr     r11, [r0, +r4, lsl #3]
        mov     r3, r7
        mov     r1, r6
        mov     r0, r11
        bl      __ashrdi3
        adds    r11, r8, r11
        and     r0, r0, #1
        adc     r6, r6, r8, asr #31
        adds    r0, r11, r0
        adc     r1, r6, #0
        mov     r3, r7
        mov     r2, r5
        bl      __ashrdi3
        ldr     r12, [sp, #0x5C]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE111
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
        b       LCUE112
LCUE111:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x10]
        sbcs    r1, r1, r12
        movlt   r0, #0
        sublt   r0, r0, #2, 18
LCUE112:
        ldr     r1, [sp, #0x1C]
        add     r4, r4, #1
        add     r9, r9, #8
        strh    r0, [r1, +r10]
        ldr     r0, [sp]
        add     r10, r10, #2
        cmp     r4, r0
        blt     LCUE110
        ldr     r1, [sp, #8]
LCUE113:
        mov     r0, r1
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE114:
        mov     r0, r1
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE115:
        cmp     r5, #0
        bge     LCUE20
        rsb     r2, r5, #0
        cmp     r2, #0x3F
        movgt   r2, #0x1F
        cmp     r0, #0
        ble     LCUE20
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        str     lr, [sp, #0x58]
        mvn     lr, #0
        mov     r8, #0
        str     r10, [sp, #4]
        ldr     r10, [sp, #0x58]
        str     lr, [sp, #0x54]
        str     r9, [sp, #0x14]
        mov     r11, r8
        mov     r3, r2, asr #31
        mov     lr, r1
        str     r6, [sp]
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
        mov     r9, r8
        str     r12, [sp, #0x20]
        str     r1, [sp, #8]
        mov     r7, r0
        mov     r6, r2
        mov     r5, r3
        mov     r8, lr
LCUE116:
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        mov     r2, r6
        mov     r3, r5
        bl      __ashldi3
        subs    r12, r0, r10
        sbcs    r2, r1, #0
        movlt   r12, #0
        movlt   r2, #0
        orrs    r2, r12, r2
        beq     LCUE117
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
        b       LCUE118
LCUE117:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x54]
        sbcs    r1, r1, r12
        movlt   r1, #0
        sublt   r0, r1, #2, 18
LCUE118:
        add     r11, r11, #1
        strh    r0, [r4, +r9]
        cmp     r11, r7
        add     r8, r8, #8
        add     r9, r9, #2
        blt     LCUE116
        mov     r0, r7
        ldr     r6, [sp]
        ldr     r10, [sp, #4]
        ldr     r12, [sp, #0x20]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        b       LCUE20
LCUE119:
        mov     r0, #0
        mov     r6, r0
        mov     r7, r6
        b       LCUE9
LCUE120:
        mov     r1, #0
        mov     r10, r1
        mov     r9, r10
        mov     r0, r9
        mov     r4, r0
        str     r4, [sp, #0x28]
        str     r4, [sp, #0x24]
        str     r4, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r4, [sp, #0x34]
        add     lr, r8, #2
        add     r12, r8, #4
        b       LCUE5
LCUE121:
        cmp     r5, #0
        bge     LCUE113
        rsb     r10, r5, #0
        cmp     r10, #0x3F
        movgt   r10, #0x1F
        cmp     r6, #0
        ble     LCUE113
        mvn     r5, r3
        mov     r3, r10, asr #31
        mov     r9, r4
        mov     r8, r11
        mov     r7, r0
        str     r3, [sp, #0x60]
        str     r12, [sp, #0x5C]
        str     r1, [sp, #8]
        mov     r4, r0
LCUE122:
        ldr     r3, [sp, #0x60]
        ldr     r0, [r4, +r8, lsl #3]
        ldr     r1, [r7, #4]
        mov     r2, r10
        bl      __ashldi3
        subs    r3, r0, r5
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        beq     LCUE123
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
        b       LCUE124
LCUE123:
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r0, r3
        ldr     r3, [sp, #0x5C]
        sbcs    r1, r1, r3
        movlt   r1, #0
        sublt   r0, r1, #2, 18
LCUE124:
        add     r8, r8, #1
        strh    r0, [r9, +r11]
        cmp     r8, r6
        add     r7, r7, #8
        add     r11, r11, #2
        blt     LCUE122
        ldr     r1, [sp, #8]
        b       LCUE113
LCUE125:
        mov     r5, #0
        mov     r3, r5
        mov     r2, r3
        mov     r0, r2
        mov     r4, r0
        str     r4, [sp, #0x58]
        str     r4, [sp, #0x54]
        str     r4, [sp, #0x50]
        str     r4, [sp, #0x4C]
        str     r4, [sp, #0x48]
        add     lr, r10, #2
        add     r4, r10, #4
        b       LCUE43
LCUE126:
        cmp     r5, #0
        bge     LCUE39
        rsb     r2, r5, #0
        cmp     r2, #0x3F
        movgt   r2, #0x1F
        cmp     r11, #0
        ble     LCUE39
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        str     r12, [sp, #0x58]
        mov     r12, #0
        mvn     lr, #0
        mov     r8, r12
        str     lr, [sp, #0x54]
        str     r5, [sp, #0xC]
        str     r9, [sp, #0x14]
        mov     r3, r2, asr #31
        mov     lr, r0
        str     r6, [sp]
        str     r10, [sp, #4]
        str     r7, [sp, #0x10]
        mov     r5, r4
        mov     r9, r8
        str     r1, [sp, #8]
        mov     r4, r0
        mov     r7, r2
        mov     r6, r3
        mov     r8, lr
        mov     r10, r12
LCUE127:
        ldr     r0, [r4, +r9, lsl #3]
        ldr     r1, [r8, #4]
        mov     r2, r7
        mov     r3, r6
        bl      __ashldi3
        ldr     r2, [sp, #0x58]
        subs    r2, r0, r2
        sbcs    r3, r1, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        beq     LCUE128
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
        b       LCUE129
LCUE128:
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r0, r2
        ldr     r2, [sp, #0x54]
        sbcs    r1, r1, r2
        movlt   r1, #0
        sublt   r0, r1, #2, 18
LCUE129:
        add     r9, r9, #1
        strh    r0, [r5, +r10]
        cmp     r9, r11
        add     r8, r8, #8
        add     r10, r10, #2
        blt     LCUE127
        mov     r0, r4
        mov     r4, r5
        ldr     r6, [sp]
        ldr     r10, [sp, #4]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        b       LCUE39
LCUE130:
        mov     r1, #0
        mov     r0, r1
        mov     r3, r0
        b       LCUE28
LCUE131:
        mov     r6, #0
        mov     r5, r6
        mov     r4, r5
        mov     r1, r4
        mov     r11, r1
        mov     r10, r11
        mov     r9, r10
        mov     r8, r9
        b       LCUE24
LCUE132:
        cmp     r5, #0
        bge     LCUE95
        rsb     r2, r5, #0
        cmp     r2, #0x3F
        movgt   r2, #0x1F
        cmp     r11, #0
        ble     LCUE95
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     r7, #0
        mvn     r8, r3
        mvn     r10, #0
        str     r7, [sp, #0x54]
        str     r0, [sp, #0x58]
        str     r10, [sp, #0x60]
        str     r8, [sp, #0x48]
        ldr     r8, [sp, #0x58]
        ldr     r10, [sp, #0x54]
        str     r9, [sp, #0x14]
        mov     r3, r2, asr #31
        str     r6, [sp]
        str     r5, [sp, #0xC]
        mov     r9, r4
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r1, [sp, #8]
        mov     r4, r0
        mov     r6, r2
        mov     r5, r3
LCUE133:
        ldr     r0, [r4, +r10, lsl #3]
        ldr     r1, [r8, #4]
        mov     r2, r6
        mov     r3, r5
        bl      __ashldi3
        ldr     r12, [sp, #0x48]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE134
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
        b       LCUE135
LCUE134:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x60]
        sbcs    r1, r1, r12
        movlt   r1, #0
        sublt   r0, r1, #2, 18
LCUE135:
        add     r10, r10, #1
        strh    r0, [r9, +r7]
        cmp     r10, r11
        add     r8, r8, #8
        add     r7, r7, #2
        blt     LCUE133
        mov     r0, r4
        mov     r4, r9
        ldr     r6, [sp]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r9, [sp, #0x14]
        b       LCUE95
LCUE136:
        mov     r0, #0
        mov     r7, r0
        mov     r9, r7
        b       LCUE84
LCUE137:
        mov     lr, #0
        mov     r12, lr
        mov     r3, r12
        mov     r2, r3
        mov     r9, r2
        mov     r6, r9
        mov     r5, r6
        mov     r4, r5
        b       LCUE80
LCUE138:
        mov     r0, #0
        mov     r7, r0
        mov     r8, r7
        b       LCUE47
LCUE139:
        cmp     r5, #0
        bge     LCUE113
        rsb     r2, r5, #0
        cmp     r2, #0x3F
        movgt   r2, #0x1F
        cmp     r6, #0
        ble     LCUE113
        mvn     r5, r3
        mov     r7, r10
        mov     r3, r2, asr #31
        mov     r9, r4
        mov     r11, r10
        mov     r8, r0
        str     r3, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r1, [sp, #8]
        mov     r4, r0
        mov     r10, r2
LCUE140:
        ldr     r3, [sp, #0x14]
        ldr     r0, [r4, +r7, lsl #3]
        ldr     r1, [r8, #4]
        mov     r2, r10
        bl      __ashldi3
        subs    r3, r0, r5
        sbcs    r12, r1, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        beq     LCUE141
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
        b       LCUE142
LCUE141:
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r0, r3
        ldr     r3, [sp, #0x10]
        sbcs    r1, r1, r3
        movlt   r1, #0
        sublt   r0, r1, #2, 18
LCUE142:
        add     r7, r7, #1
        strh    r0, [r9, +r11]
        cmp     r7, r6
        add     r8, r8, #8
        add     r11, r11, #2
        blt     LCUE140
        ldr     r1, [sp, #8]
        b       LCUE113
LCUE143:
        mov     r1, #0
        mov     r0, r1
        mov     r8, r0
        b       LCUE103
LCUE144:
        mov     r6, #0
        mov     r3, r6
        mov     r2, r3
        mov     r0, r2
        mov     r4, r0
        str     r4, [sp, #0x28]
        str     r4, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r4, [sp, #0x3C]
        add     r4, r12, #2
        add     r5, r12, #4
        b       LCUE99
LCUE145:
        cmp     r5, #0
        bge     LCUE76
        rsb     r2, r5, #0
        cmp     r2, #0x3F
        movgt   r2, #0x1F
        cmp     r0, #0
        ble     LCUE76
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mov     r7, #0
        mvn     r3, r3
        str     r3, [sp, #0x48]
        str     r7, [sp, #0x44]
        str     r10, [sp, #0x54]
        str     r9, [sp, #0x14]
        ldr     r10, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        mvn     r11, #0
        mov     r3, r2, asr #31
        str     r11, [sp, #0x50]
        str     r6, [sp]
        str     r5, [sp, #0xC]
        str     r8, [sp, #0x58]
        mov     r11, r1
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x4C]
        str     r1, [sp, #8]
        mov     r8, r0
        mov     r6, r2
        mov     r5, r3
LCUE146:
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        mov     r2, r6
        mov     r3, r5
        bl      __ashldi3
        subs    r12, r0, r10
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        beq     LCUE147
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
        b       LCUE148
LCUE147:
        mov     r12, #0
        sub     r12, r12, #2, 18
        cmp     r0, r12
        ldr     r12, [sp, #0x50]
        sbcs    r1, r1, r12
        movlt   r1, #0
        sublt   r0, r1, #2, 18
LCUE148:
        add     r9, r9, #1
        strh    r0, [r4, +r7]
        cmp     r9, r8
        add     r11, r11, #8
        add     r7, r7, #2
        blt     LCUE146
        mov     r0, r8
        ldr     r6, [sp]
        ldr     r12, [sp, #0x20]
        ldr     lr, [sp, #0x4C]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x54]
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x58]
        b       LCUE76
LCUE149:
        mov     r0, #0
        mov     r8, r0
        mov     r10, r8
        b       LCUE65
LCUE150:
        mov     r6, #0
        mov     r12, r6
        mov     r3, r12
        mov     r0, r3
        mov     r4, r0
        str     r4, [sp, #0x50]
        str     r4, [sp, #0x48]
        str     r4, [sp, #0x44]
        str     r4, [sp, #0x40]
        str     r4, [sp, #0x3C]
        add     lr, r5, #2
        add     r4, r5, #4
        b       LCUE61
LCUE151:
        mvn     r0, #5
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE152:
        mvn     r0, #7
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LCUE153:
        mvn     r0, #8
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}


