        .text
        .align  4
        .globl  ownsMR64s_16s_Sfs


ownsMR64s_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r12, [sp, #0x98]
        ldr     lr, [sp, #0xA4]
        ldr     r5, [sp, #0x9C]
        ldr     r8, [sp, #0xA0]
        ldr     r7, [sp, #0xA8]
        cmp     r2, #0
        str     lr, [sp, #0x20]
        str     r0, [sp, #0x1C]
        mov     r11, r12
        mov     r6, r3
        ble     LBVJ34
        cmp     r7, #0x1F
        mov     r4, r7
        mov     lr, #0x1F
        movgt   r4, lr
        cmn     r4, #0x1F
        mvn     lr, #0x1E
        movlt   r4, lr
        rsb     lr, r4, #0
        sub     r10, lr, #1
        mov     r0, #1
        mov     r10, r0, lsl r10
        mov     r0, #0
        mvn     r9, #0xFF
        str     r0, [sp, #0x18]
        add     r0, r1, #2
        bic     r9, r9, #0x7F, 24
        str     r0, [sp]
        add     r0, r1, #4
        sub     r10, r10, #1
        mvn     r9, r9
        str     r0, [sp, #0x10]
        str     r10, [sp, #0xC]
        add     r0, r1, #6
        mov     r10, lr, asr #31
        str     r9, [sp, #0x64]
        ldr     r9, [sp, #0x1C]
        str     r0, [sp, #0x14]
        str     r10, [sp, #8]
        sub     r10, r8, #6
        mvn     r0, #0
        str     r0, [sp, #4]
        str     r1, [sp, #0x5C]
        str     r10, [sp, #0x40]
        str     lr, [sp, #0x58]
        str     r6, [sp, #0x60]
        str     r12, [sp, #0x4C]
        str     r3, [sp, #0x50]
        str     r2, [sp, #0x54]
LBVJ0:
        ldr     r1, [r11]
        cmp     r8, #0
        add     r6, r11, #4
        add     r12, r1, r5
        movle   r11, #0
        movle   r10, r11
        ble     LBVJ4
        cmp     r8, #6
        blt     LBVJ38
        mov     r3, #0
        add     r2, r9, r12, lsl #1
        str     r3, [sp, #0x44]
        mov     r12, #6
        str     r12, [sp, #0x48]
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x34]
        str     r5, [sp, #0x3C]
        ldr     r6, [sp, #0x48]
        ldr     r5, [sp, #0x44]
        ldr     r7, [sp, #0x60]
        mov     r10, r3
        mov     r11, r10
        mov     r1, r2
        mov     r0, #2
        mov     lr, #4
        mov     r12, #8
        str     r11, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r4, [sp, #0x30]
        str     r8, [sp, #0x38]
LBVJ1:
        ldrsh   r2, [r7, +r5]
        ldrsh   r4, [r1]
        ldrsh   r8, [r7, +r0]
        ldrsh   r9, [r1, #2]
        ldrsh   r11, [r7, +lr]
        mul     r2, r4, r2
        ldrsh   r4, [r1, #4]
        mul     r8, r9, r8
        add     r3, r3, #5
        mul     r4, r4, r11
        adds    r10, r2, r10
        add     r5, r5, #0xA
        str     r8, [sp, #0x68]
        ldrsh   r8, [r7, +r6]
        add     r0, r0, #0xA
        add     lr, lr, #0xA
        add     r6, r6, #0xA
        str     r8, [sp, #0x6C]
        ldrsh   r9, [r1, #8]
        ldrsh   r8, [r1, #6]
        ldrsh   r11, [r7, +r12]
        str     r9, [sp, #0x70]
        ldr     r9, [sp, #0x6C]
        add     r1, r1, #0xA
        add     r12, r12, #0xA
        mul     r9, r8, r9
        ldr     r8, [sp, #0x24]
        adc     r8, r8, r2, asr #31
        ldr     r2, [sp, #0x70]
        mul     r2, r2, r11
        ldr     r11, [sp, #0x68]
        adds    r10, r11, r10
        adc     r11, r8, r11, asr #31
        adds    r10, r4, r10
        adc     r4, r11, r4, asr #31
        adds    r10, r9, r10
        adc     r9, r4, r9, asr #31
        adds    r10, r2, r10
        adc     r2, r9, r2, asr #31
        str     r2, [sp, #0x24]
        ldr     r2, [sp, #0x40]
        cmp     r3, r2
        ble     LBVJ1
        ldr     r11, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x1C]
LBVJ2:
        ldr     lr, [sp, #0x60]
        mov     r12, r3, lsl #1
LBVJ3:
        ldrsh   r1, [lr, +r12]
        ldrsh   r0, [r2, +r12]
        add     r12, r12, #2
        add     r3, r3, #1
        mul     r1, r0, r1
        adds    r10, r1, r10
        adc     r11, r11, r1, asr #31
        cmp     r3, r8
        blt     LBVJ3
LBVJ4:
        cmp     r7, #0
        beq     LBVJ6
        cmp     r4, #0
        ble     LBVJ5
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r10, r0
        mov     r11, r1
        b       LBVJ6
LBVJ5:
        mov     r0, r10
        mov     r1, r11
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x58]
        adds    r10, r10, r3
        adc     r3, r11, r3, asr #31
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        mov     r10, r0
        mov     r11, r1
LBVJ6:
        ldr     r3, [sp, #0x64]
        subs    r3, r10, r3
        sbcs    r12, r11, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVJ7
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r10, r3
        ldr     r3, [sp, #4]
        sbcs    r11, r11, r3
        movge   r10, r10, lsl #16
        movge   r1, r10, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LBVJ8
LBVJ7:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LBVJ8:
        ldr     r3, [sp, #0x5C]
        cmp     r8, #0
        strh    r1, [r3], #8
        ldr     r1, [r6]
        str     r3, [sp, #0x5C]
        ldr     r3, [sp, #0x60]
        add     r1, r5, r1
        add     r3, r3, r8, lsl #1
        str     r3, [sp, #0x60]
        movle   r11, #0
        movle   r10, r11
        ble     LBVJ12
        cmp     r8, #6
        blt     LBVJ37
        ldr     r3, [sp, #0x60]
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x40]
        mov     r11, #0
        mov     lr, r11
        add     r12, r9, r1, lsl #1
        mov     r10, lr
        mov     r0, r12
        str     r6, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r7, [sp, #0x34]
        str     r5, [sp, #0x3C]
LBVJ9:
        ldrsh   r2, [r3]
        ldrsh   r6, [r0]
        ldrsh   r4, [r3, #2]
        ldrsh   r7, [r0, #2]
        ldrsh   r5, [r3, #4]
        mul     r2, r6, r2
        ldrsh   r6, [r0, #4]
        mul     r4, r7, r4
        ldrsh   r7, [r3, #6]
        mul     r5, r6, r5
        ldrsh   r6, [r0, #6]
        adds    r10, r2, r10
        ldrsh   r9, [r3, #8]
        ldrsh   r1, [r0, #8]
        mul     r7, r6, r7
        adc     r2, r11, r2, asr #31
        mul     r9, r1, r9
        adds    r10, r4, r10
        adc     r4, r2, r4, asr #31
        adds    r10, r5, r10
        adc     r5, r4, r5, asr #31
        adds    r10, r7, r10
        adc     r7, r5, r7, asr #31
        adds    r10, r9, r10
        add     lr, lr, #5
        adc     r11, r7, r9, asr #31
        cmp     lr, r8
        add     r3, r3, #0xA
        add     r0, r0, #0xA
        ble     LBVJ9
        ldr     r6, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x1C]
LBVJ10:
        ldr     r3, [sp, #0x60]
        mov     r0, lr, lsl #1
        add     r3, r3, lr, lsl #1
LBVJ11:
        ldrsh   r1, [r3], #2
        ldrsh   r2, [r12, +r0]
        add     r0, r0, #2
        add     lr, lr, #1
        mul     r1, r2, r1
        adds    r10, r1, r10
        adc     r11, r11, r1, asr #31
        cmp     lr, r8
        blt     LBVJ11
LBVJ12:
        cmp     r7, #0
        beq     LBVJ14
        cmp     r4, #0
        ble     LBVJ13
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r10, r0
        mov     r11, r1
        b       LBVJ14
LBVJ13:
        mov     r0, r10
        mov     r1, r11
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x58]
        adds    r10, r10, r3
        adc     r3, r11, r3, asr #31
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        mov     r10, r0
        mov     r11, r1
LBVJ14:
        ldr     r3, [sp, #0x64]
        subs    r3, r10, r3
        sbcs    r12, r11, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVJ15
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r10, r3
        ldr     r3, [sp, #4]
        sbcs    r11, r11, r3
        movge   r10, r10, lsl #16
        movge   r1, r10, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LBVJ16
LBVJ15:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LBVJ16:
        ldr     r3, [sp]
        cmp     r8, #0
        strh    r1, [r3], #8
        ldr     r1, [r6, #4]
        str     r3, [sp]
        ldr     r3, [sp, #0x60]
        add     r1, r5, r1
        add     r3, r3, r8, lsl #1
        str     r3, [sp, #0x60]
        movle   r11, #0
        movle   r10, r11
        ble     LBVJ20
        cmp     r8, #6
        blt     LBVJ36
        ldr     r3, [sp, #0x60]
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x40]
        mov     r11, #0
        mov     lr, r11
        add     r12, r9, r1, lsl #1
        mov     r10, lr
        mov     r0, r12
        str     r6, [sp, #0x2C]
        str     r4, [sp, #0x30]
        str     r7, [sp, #0x34]
        str     r5, [sp, #0x3C]
LBVJ17:
        ldrsh   r2, [r3]
        ldrsh   r6, [r0]
        ldrsh   r4, [r3, #2]
        ldrsh   r7, [r0, #2]
        ldrsh   r5, [r3, #4]
        mul     r2, r6, r2
        ldrsh   r6, [r0, #4]
        mul     r4, r7, r4
        ldrsh   r7, [r3, #6]
        mul     r5, r6, r5
        ldrsh   r6, [r0, #6]
        adds    r10, r2, r10
        ldrsh   r9, [r3, #8]
        ldrsh   r1, [r0, #8]
        mul     r7, r6, r7
        adc     r2, r11, r2, asr #31
        mul     r9, r1, r9
        adds    r10, r4, r10
        adc     r4, r2, r4, asr #31
        adds    r10, r5, r10
        adc     r5, r4, r5, asr #31
        adds    r10, r7, r10
        adc     r7, r5, r7, asr #31
        adds    r10, r9, r10
        add     lr, lr, #5
        adc     r11, r7, r9, asr #31
        cmp     lr, r8
        add     r3, r3, #0xA
        add     r0, r0, #0xA
        ble     LBVJ17
        ldr     r6, [sp, #0x2C]
        ldr     r4, [sp, #0x30]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x1C]
LBVJ18:
        ldr     r3, [sp, #0x60]
        mov     r0, lr, lsl #1
        add     r3, r3, lr, lsl #1
LBVJ19:
        ldrsh   r2, [r3], #2
        ldrsh   r1, [r12, +r0]
        add     r0, r0, #2
        add     lr, lr, #1
        mul     r2, r1, r2
        adds    r10, r2, r10
        adc     r11, r11, r2, asr #31
        cmp     lr, r8
        blt     LBVJ19
LBVJ20:
        cmp     r7, #0
        beq     LBVJ22
        cmp     r4, #0
        ble     LBVJ21
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r10, r0
        mov     r11, r1
        b       LBVJ22
LBVJ21:
        mov     r0, r10
        mov     r1, r11
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x58]
        adds    r10, r10, r3
        adc     r3, r11, r3, asr #31
        and     r0, r0, #1
        adds    r0, r10, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        mov     r10, r0
        mov     r11, r1
LBVJ22:
        ldr     r3, [sp, #0x64]
        subs    r3, r10, r3
        sbcs    r12, r11, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVJ23
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r10, r3
        ldr     r3, [sp, #4]
        sbcs    r11, r11, r3
        movge   r10, r10, lsl #16
        movge   r1, r10, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LBVJ24
LBVJ23:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LBVJ24:
        ldr     r3, [sp, #0x10]
        cmp     r8, #0
        add     r11, r6, #0xC
        strh    r1, [r3], #8
        ldr     r1, [r6, #8]
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x60]
        add     r3, r3, r8, lsl #1
        str     r3, [sp, #0x60]
        add     r3, r5, r1
        movle   r10, #0
        movle   r6, r10
        ble     LBVJ28
        cmp     r8, #6
        blt     LBVJ35
        add     r12, r9, r3, lsl #1
        ldr     r3, [sp, #0x60]
        ldr     r9, [sp, #0x40]
        mov     r10, #0
        mov     lr, r10
        mov     r6, lr
        mov     r0, r12
        str     r4, [sp, #0x30]
        str     r11, [sp, #0x2C]
        str     r7, [sp, #0x34]
        str     r8, [sp, #0x38]
        str     r5, [sp, #0x3C]
LBVJ25:
        ldrsh   r2, [r3]
        ldrsh   r7, [r0]
        ldrsh   r4, [r3, #2]
        ldrsh   r8, [r0, #2]
        ldrsh   r5, [r3, #4]
        mul     r2, r7, r2
        ldrsh   r7, [r0, #4]
        mul     r4, r8, r4
        ldrsh   r8, [r3, #6]
        mul     r5, r7, r5
        ldrsh   r7, [r0, #6]
        adds    r6, r2, r6
        ldrsh   r11, [r3, #8]
        ldrsh   r1, [r0, #8]
        mul     r8, r7, r8
        adc     r2, r10, r2, asr #31
        mul     r11, r1, r11
        adds    r6, r4, r6
        adc     r4, r2, r4, asr #31
        adds    r6, r5, r6
        adc     r5, r4, r5, asr #31
        adds    r6, r8, r6
        adc     r8, r5, r8, asr #31
        adds    r6, r11, r6
        add     lr, lr, #5
        adc     r10, r8, r11, asr #31
        cmp     lr, r9
        add     r3, r3, #0xA
        add     r0, r0, #0xA
        ble     LBVJ25
        ldr     r4, [sp, #0x30]
        ldr     r11, [sp, #0x2C]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r9, [sp, #0x1C]
LBVJ26:
        ldr     r3, [sp, #0x60]
        mov     r0, lr, lsl #1
        add     r3, r3, lr, lsl #1
LBVJ27:
        ldrsh   r1, [r3], #2
        ldrsh   r2, [r12, +r0]
        add     r0, r0, #2
        add     lr, lr, #1
        mul     r1, r2, r1
        adds    r6, r1, r6
        adc     r10, r10, r1, asr #31
        cmp     lr, r8
        blt     LBVJ27
LBVJ28:
        cmp     r7, #0
        beq     LBVJ30
        cmp     r4, #0
        ble     LBVJ29
        mov     r0, r6
        mov     r1, r10
        mov     r2, r4
        mov     r3, #0
        bl      __ashldi3
        mov     r6, r0
        mov     r10, r1
        b       LBVJ30
LBVJ29:
        mov     r0, r6
        mov     r1, r10
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x58]
        adds    r6, r6, r3
        adc     r3, r10, r3, asr #31
        and     r0, r0, #1
        adds    r0, r6, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #8]
        bl      __ashrdi3
        mov     r6, r0
        mov     r10, r1
LBVJ30:
        ldr     r3, [sp, #0x64]
        subs    r3, r6, r3
        sbcs    r12, r10, #0
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        bne     LBVJ31
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r6, r3
        ldr     r3, [sp, #4]
        sbcs    r10, r10, r3
        movge   r6, r6, lsl #16
        movge   r3, r6, asr #16
        mvnlt   r1, #0xFF
        biclt   r3, r1, #0x7F, 24
        b       LBVJ32
LBVJ31:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r3, r1
LBVJ32:
        ldr     r1, [sp, #0x14]
        strh    r3, [r1], #8
        ldr     r3, [sp, #0x20]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x60]
        cmp     r11, r3
        add     r1, r1, r8, lsl #1
        str     r1, [sp, #0x60]
        bcc     LBVJ33
        ldr     r1, [sp, #0x20]
        ldr     r3, [sp, #0x50]
        ldr     r11, [sp, #0x4C]
        ldr     r1, [r1]
        str     r3, [sp, #0x60]
        add     r5, r1, r5
LBVJ33:
        ldr     r1, [sp, #0x18]
        ldr     r3, [sp, #0x54]
        add     r1, r1, #4
        str     r1, [sp, #0x18]
        cmp     r1, r3
        blt     LBVJ0
LBVJ34:
        mov     r0, r5
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBVJ35:
        mov     r10, #0
        mov     lr, r10
        mov     r6, lr
        add     r12, r9, r3, lsl #1
        b       LBVJ26
LBVJ36:
        mov     r11, #0
        mov     lr, r11
        mov     r10, lr
        add     r12, r9, r1, lsl #1
        b       LBVJ18
LBVJ37:
        mov     r11, #0
        mov     lr, r11
        mov     r10, lr
        add     r12, r9, r1, lsl #1
        b       LBVJ10
LBVJ38:
        mov     r11, #0
        mov     r3, r11
        mov     r10, r3
        add     r2, r9, r12, lsl #1
        b       LBVJ2


