        .text
        .align  4
        .globl  ownsFIRSR64s_16s_Sfs


ownsFIRSR64s_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x74
        ldr     r0, [r0]
        ldr     r10, [sp, #0x98]
        ldr     r4, [sp, #0x9C]
        bic     r9, r3, #3
        cmp     r9, #0
        str     r0, [sp, #0x6C]
        mov     r7, r1
        ble     LBVN19
        cmp     r4, #0x1F
        mov     r5, r4
        mov     r0, #0x1F
        movgt   r5, r0
        cmn     r5, #0x1F
        mvn     r0, #0x1E
        movlt   r5, r0
        rsb     r8, r5, #0
        sub     r0, r8, #1
        mov     r12, #1
        mov     r0, r12, lsl r0
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        str     r12, [sp, #0x24]
        add     r12, r2, #2
        str     r12, [sp, #0x58]
        add     r12, r2, #4
        mov     r11, #0
        str     r12, [sp, #0x5C]
        add     r12, r7, #2
        add     r1, r7, #6
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x24]
        str     r12, [sp, #0x68]
        str     r1, [sp, #0x64]
        sub     r0, r0, #1
        mov     r6, r8, asr #31
        add     lr, r2, #6
        add     r12, r7, #4
        mvn     r1, #0
        str     r1, [sp, #0x60]
        str     r12, [sp, #0x1C]
        str     lr, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     r0, [sp, #0x30]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x40]
        str     r10, [sp, #0x48]
        str     r3, [sp, #0x4C]
        str     r2, [sp, #0x50]
        str     r7, [sp, #0x54]
LBVN0:
        ldr     r0, [sp, #0x48]
        cmp     r0, #0
        ble     LBVN32
        mov     r7, #0
        str     r7, [sp, #0xC]
        mov     r6, r7
        ldr     r3, [sp, #0x3C]
        str     r6, [sp, #0x18]
        ldr     r1, [sp, #0x54]
        mov     r8, r6
        str     r8, [sp, #0x10]
        ldr     r12, [sp, #0x6C]
        mov     r10, r3, lsl #1
        mov     r9, r8
        add     lr, r1, r10
        ldr     r1, [sp, #0x48]
        str     r9, [sp, #8]
        str     r7, [sp, #0x14]
        str     r8, [sp]
        str     r10, [sp, #0x20]
        str     r9, [sp, #4]
        str     r5, [sp, #0x38]
        str     r4, [sp, #0x44]
LBVN1:
        ldrsh   r2, [lr], #2
        ldrsh   r5, [r12], #2
        ldr     r4, [sp, #0x68]
        ldr     r11, [sp, #0x1C]
        mov     r10, r3, lsl #1
        smull   r0, r2, r2, r5
        ldrsh   r4, [r4, +r10]
        ldrsh   r11, [r11, +r10]
        ldr     r8, [sp, #4]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x64]
        ldr     r9, [sp, #0x70]
        add     r3, r3, #1
        ldrsh   r7, [r0, +r10]
        smull   r4, r10, r4, r5
        smull   r11, r0, r11, r5
        adds    r8, r8, r9
        smull   r5, r7, r7, r5
        str     r8, [sp, #4]
        ldr     r8, [sp, #0xC]
        adc     r8, r8, r2
        ldr     r2, [sp]
        str     r8, [sp, #0xC]
        adds    r2, r2, r4
        str     r2, [sp]
        ldr     r2, [sp, #8]
        adc     r2, r2, r10
        str     r2, [sp, #8]
        ldr     r2, [sp, #0x10]
        adds    r6, r6, r11
        adc     r2, r2, r0
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        adds    r2, r2, r5
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x18]
        adc     r2, r2, r7
        subs    r1, r1, #1
        str     r2, [sp, #0x18]
        bne     LBVN1
        ldr     r7, [sp, #0x14]
        ldr     r8, [sp]
        ldr     r10, [sp, #0x20]
        ldr     r9, [sp, #4]
        ldr     r11, [sp, #0x24]
        ldr     r5, [sp, #0x38]
        ldr     r4, [sp, #0x44]
LBVN2:
        cmp     r4, #0
        beq     LBVN4
        cmp     r5, #0
        ble     LBVN3
        mov     r0, r9
        ldr     r1, [sp, #0xC]
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        mov     r9, r0
        str     r1, [sp, #0xC]
        b       LBVN4
LBVN3:
        mov     r0, r9
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x2C]
        bl      __ashrdi3
        ldr     r1, [sp, #0x30]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x34]
        adds    r9, r9, r1
        adc     r1, r3, r1, asr #31
        ldr     r3, [sp, #0x2C]
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r1, r1, #0
        bl      __ashrdi3
        mov     r9, r0
        str     r1, [sp, #0xC]
LBVN4:
        ldr     r3, [sp, #0xC]
        subs    r1, r9, r11
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        bne     LBVN5
        mov     r1, #0
        sub     r1, r1, #2, 18
        cmp     r9, r1
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #0x60]
        sbcs    r3, r3, r1
        movge   r9, r9, lsl #16
        movge   r1, r9, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LBVN6
LBVN5:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LBVN6:
        ldr     r3, [sp, #0x50]
        cmp     r4, #0
        strh    r1, [r3, +r10]
        beq     LBVN8
        cmp     r5, #0
        ble     LBVN7
        mov     r0, r8
        ldr     r1, [sp, #8]
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        mov     r8, r0
        str     r1, [sp, #8]
        b       LBVN8
LBVN7:
        mov     r0, r8
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0x34]
        ldr     r9, [sp, #0x2C]
        mov     r3, r9
        bl      __ashrdi3
        ldr     r1, [sp, #0x30]
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #0x34]
        adds    r8, r1, r8
        adc     r1, r12, r1, asr #31
        and     r0, r0, #1
        adds    r0, r8, r0
        adc     r1, r1, #0
        mov     r3, r9
        bl      __ashrdi3
        mov     r8, r0
        str     r1, [sp, #8]
LBVN8:
        ldr     r3, [sp, #8]
        subs    r1, r8, r11
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        bne     LBVN9
        mov     r1, #0
        sub     r1, r1, #2, 18
        cmp     r8, r1
        ldr     r3, [sp, #8]
        ldr     r1, [sp, #0x60]
        sbcs    r3, r3, r1
        movge   r8, r8, lsl #16
        movge   r1, r8, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LBVN10
LBVN9:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LBVN10:
        ldr     r3, [sp, #0x58]
        cmp     r4, #0
        strh    r1, [r3, +r10]
        beq     LBVN12
        cmp     r5, #0
        ble     LBVN11
        mov     r0, r6
        ldr     r1, [sp, #0x10]
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        mov     r6, r0
        str     r1, [sp, #0x10]
        b       LBVN12
LBVN11:
        mov     r0, r6
        ldr     r3, [sp, #0x2C]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x34]
        mov     r1, r9
        mov     r2, r8
        bl      __ashrdi3
        ldr     r3, [sp, #0x30]
        and     r0, r0, #1
        mov     r2, r8
        adds    r6, r3, r6
        adc     r3, r9, r3, asr #31
        adds    r0, r6, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x2C]
        bl      __ashrdi3
        mov     r6, r0
        str     r1, [sp, #0x10]
LBVN12:
        ldr     r3, [sp, #0x10]
        subs    r1, r6, r11
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        bne     LBVN13
        mov     r1, #0
        sub     r1, r1, #2, 18
        cmp     r6, r1
        ldr     r3, [sp, #0x10]
        ldr     r1, [sp, #0x60]
        sbcs    r3, r3, r1
        movge   r6, r6, lsl #16
        movge   r1, r6, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LBVN14
LBVN13:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LBVN14:
        ldr     r3, [sp, #0x5C]
        cmp     r4, #0
        strh    r1, [r3, +r10]
        beq     LBVN16
        cmp     r5, #0
        ble     LBVN15
        mov     r0, r7
        ldr     r1, [sp, #0x18]
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        mov     r7, r0
        str     r1, [sp, #0x18]
        b       LBVN16
LBVN15:
        mov     r0, r7
        ldr     r9, [sp, #0x18]
        ldr     r8, [sp, #0x34]
        ldr     r6, [sp, #0x2C]
        mov     r1, r9
        mov     r2, r8
        mov     r3, r6
        bl      __ashrdi3
        ldr     r12, [sp, #0x30]
        and     r0, r0, #1
        mov     r2, r8
        adds    r7, r12, r7
        adc     r12, r9, r12, asr #31
        adds    r0, r7, r0
        adc     r1, r12, #0
        mov     r3, r6
        bl      __ashrdi3
        mov     r7, r0
        str     r1, [sp, #0x18]
LBVN16:
        ldr     r3, [sp, #0x18]
        subs    r1, r7, r11
        sbcs    r3, r3, #0
        movlt   r1, #0
        movlt   r3, #0
        orrs    r3, r1, r3
        bne     LBVN17
        mov     r1, #0
        sub     r1, r1, #2, 18
        cmp     r7, r1
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #0x60]
        sbcs    r3, r3, r1
        movge   r7, r7, lsl #16
        movge   r0, r7, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LBVN18
LBVN17:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LBVN18:
        ldr     r1, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        add     r1, r1, #4
        str     r1, [sp, #0x3C]
        cmp     r1, r3
        ldr     r1, [sp, #0x28]
        strh    r0, [r1, +r10]
        blt     LBVN0
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x48]
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x50]
        ldr     r7, [sp, #0x54]
LBVN19:
        cmp     r9, r3
        bge     LBVN29
        cmp     r4, #0x1F
        mov     r6, r4
        mov     r0, #0x1F
        movgt   r6, r0
        cmn     r6, #0x1F
        mvn     r0, #0x1E
        movlt   r6, r0
        rsb     r12, r6, #0
        sub     r0, r12, #1
        mov     lr, #1
        mov     r0, lr, lsl r0
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     r8, lr
        sub     r0, r0, #1
        mov     r5, r12, asr #31
        sub     r11, r10, #6
        mvn     lr, #0
        str     lr, [sp, #0x58]
        str     r11, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r0, [sp, #0x38]
        str     r12, [sp, #0x3C]
        str     r4, [sp, #0x44]
        str     r3, [sp, #0x4C]
        str     r2, [sp, #0x50]
LBVN20:
        cmp     r10, #0
        ble     LBVN31
        cmp     r10, #6
        blt     LBVN30
        ldr     r3, [sp, #0x6C]
        mov     r11, r9, lsl #1
        mov     r12, #0
        add     r0, r7, r11
        mov     r5, r12
        mov     r4, r5
        mov     lr, r0
        str     r11, [sp, #0x68]
        str     r0, [sp, #0x64]
        str     r8, [sp, #0x60]
        str     r6, [sp, #0x5C]
        str     r9, [sp, #0x40]
        str     r10, [sp, #0x48]
        str     r7, [sp, #0x54]
LBVN21:
        ldrsh   r9, [lr]
        ldrsh   r7, [r3]
        ldrsh   r6, [r3, #2]
        ldrsh   r8, [lr, #2]
        ldrsh   r2, [r3, #4]
        smull   r0, r11, r9, r7
        ldrsh   r7, [lr, #4]
        smull   r6, r9, r8, r6
        ldrsh   r8, [r3, #6]
        smull   r2, r10, r7, r2
        ldrsh   r7, [lr, #6]
        adds    r5, r5, r0
        ldrsh   r0, [r3, #8]
        ldrsh   r1, [lr, #8]
        smull   r8, r7, r7, r8
        adc     r11, r4, r11
        smull   r0, r1, r1, r0
        adds    r6, r5, r6
        adc     r9, r11, r9
        adds    r2, r6, r2
        adc     r10, r9, r10
        adds    r8, r2, r8
        ldr     r2, [sp, #0x30]
        adc     r7, r10, r7
        adds    r5, r8, r0
        add     r12, r12, #5
        adc     r4, r7, r1
        cmp     r12, r2
        add     r3, r3, #0xA
        add     lr, lr, #0xA
        ble     LBVN21
        ldr     r11, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        ldr     r8, [sp, #0x60]
        ldr     r6, [sp, #0x5C]
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x48]
        ldr     r7, [sp, #0x54]
LBVN22:
        ldr     r3, [sp, #0x6C]
        mov     lr, r12, lsl #1
        add     r3, r3, r12, lsl #1
LBVN23:
        ldrsh   r2, [r3], #2
        ldrsh   r1, [r0, +lr]
        add     lr, lr, #2
        add     r12, r12, #1
        smull   r1, r2, r1, r2
        adds    r5, r5, r1
        adc     r4, r4, r2
        cmp     r12, r10
        blt     LBVN23
LBVN24:
        ldr     r3, [sp, #0x44]
        cmp     r3, #0
        beq     LBVN26
        cmp     r6, #0
        ble     LBVN25
        mov     r0, r5
        mov     r1, r4
        mov     r2, r6
        mov     r3, #0
        bl      __ashldi3
        mov     r5, r0
        mov     r4, r1
        b       LBVN26
LBVN25:
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x34]
        bl      __ashrdi3
        ldr     r3, [sp, #0x38]
        ldr     r2, [sp, #0x3C]
        adds    r5, r5, r3
        adc     r3, r4, r3, asr #31
        and     r0, r0, #1
        adds    r0, r5, r0
        adc     r1, r3, #0
        ldr     r3, [sp, #0x34]
        bl      __ashrdi3
        mov     r5, r0
        mov     r4, r1
LBVN26:
        subs    r12, r5, r8
        sbcs    r3, r4, #0
        movlt   r12, #0
        movlt   r3, #0
        orrs    r3, r12, r3
        bne     LBVN27
        mov     r3, #0
        sub     r3, r3, #2, 18
        cmp     r5, r3
        ldr     r3, [sp, #0x58]
        sbcs    r4, r4, r3
        movge   r5, r5, lsl #16
        movge   r0, r5, asr #16
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
        b       LBVN28
LBVN27:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r0, r0
LBVN28:
        ldr     r3, [sp, #0x4C]
        add     r9, r9, #1
        cmp     r9, r3
        ldr     r3, [sp, #0x50]
        strh    r0, [r3, +r11]
        blt     LBVN20
LBVN29:
        add     sp, sp, #0x74
        ldmia   sp!, {r4 - r11, pc}
LBVN30:
        mov     r12, #0
        mov     r5, r12
        mov     r11, r9, lsl #1
        mov     r4, r5
        add     r0, r7, r11
        b       LBVN22
LBVN31:
        mov     r4, #0
        mov     r5, r4
        mov     r11, r9, lsl #1
        b       LBVN24
LBVN32:
        mov     r7, #0
        str     r7, [sp, #0xC]
        mov     r6, r7
        str     r6, [sp, #0x18]
        mov     r8, r6
        str     r8, [sp, #0x10]
        ldr     r1, [sp, #0x3C]
        mov     r9, r8
        str     r9, [sp, #8]
        mov     r10, r1, lsl #1
        b       LBVN2


