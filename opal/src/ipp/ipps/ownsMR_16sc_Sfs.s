        .text
        .align  4
        .globl  ownsMR_16sc_Sfs


ownsMR_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r12, [sp, #0x78]
        ldr     r9, [sp, #0x70]
        ldr     r4, [sp, #0x74]
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x7C]
        cmp     r2, #0
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x80]
        str     r0, [sp, #8]
        mov     r8, r9
        mov     lr, r3
        ble     LBVG34
        cmp     r12, #0x1F
        mov     r6, r12
        mov     r5, #0x1F
        movgt   r6, r5
        cmn     r6, #0x1F
        mvn     r5, #0x1E
        add     r0, r1, #8
        movlt   r6, r5
        str     r0, [sp, #4]
        mvn     r5, #0xFF
        add     r0, r1, #0xC
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x18]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        rsb     r10, r6, #0
        str     r0, [sp]
        bic     r5, r5, #0x7F, 24
        mov     r11, #0
        sub     r0, r10, #1
        mvn     r5, r5
        add     r7, r1, #4
        str     r0, [sp, #0x3C]
        str     r10, [sp, #0x38]
        str     r11, [sp, #0x2C]
        str     r9, [sp, #0x20]
LBVG0:
        ldr     r9, [r8], #4
        cmp     r2, #0
        add     r10, r9, r4
        movle   r10, #0
        movle   r9, r10
        ble     LBVG2
        add     r11, r3, r10, lsl #2
        add     r11, r11, #2
        mov     r9, #0
        str     r11, [sp, #0x48]
        str     r9, [sp, #0x40]
        sub     r0, lr, #2
        str     r0, [sp, #0x44]
        mov     r11, r2
        str     r4, [sp, #0x24]
        str     r1, [sp, #0x14]
        ldr     r2, [sp, #0x48]
        ldr     r1, [sp, #0x44]
        ldr     r4, [sp, #0x40]
        mov     r10, r9
        str     r6, [sp, #0x34]
        str     r7, [sp, #0x30]
        str     r12, [sp, #0x28]
LBVG1:
        ldrsh   r0, [lr, +r4]
        ldrsh   r7, [r2]
        ldrsh   r3, [r2, #-2]
        ldrsh   r12, [r1, #4]!
        add     r4, r4, #4
        mul     r6, r7, r0
        mul     r0, r3, r0
        mul     r7, r12, r7
        add     r2, r2, #4
        mla     r6, r3, r12, r6
        subs    r11, r11, #1
        sub     r0, r0, r7
        add     r10, r0, r10
        add     r9, r6, r9
        bne     LBVG1
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #8]
LBVG2:
        cmp     r12, #0
        beq     LBVG3
        cmp     r6, #0
        movgt   r10, r10, lsl r6
        bgt     LBVG3
        ldr     r11, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, r10, asr r11
        str     r11, [sp, #0x48]
        mov     r11, #1
        add     r0, r10, r11, lsl r0
        ldr     r10, [sp, #0x48]
        str     r0, [sp, #0x44]
        ldr     r11, [sp, #0x44]
        and     r10, r10, #1
        add     r10, r11, r10
        ldr     r11, [sp, #0x38]
        sub     r10, r10, #1
        mov     r10, r10, asr r11
LBVG3:
        cmp     r5, r10
        blt     LBVG4
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        movlt   r10, #0
        sublt   r10, r10, #2, 18
        b       LBVG5
LBVG4:
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
LBVG5:
        cmp     r12, #0
        strh    r10, [r1]
        beq     LBVG6
        cmp     r6, #0
        movgt   r9, r9, lsl r6
        bgt     LBVG6
        ldr     r10, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, r9, asr r10
        str     r11, [sp, #0x48]
        mov     r11, #1
        add     r9, r9, r11, lsl r0
        ldr     r11, [sp, #0x48]
        and     r11, r11, #1
        add     r11, r9, r11
        sub     r9, r11, #1
        mov     r9, r9, asr r10
LBVG6:
        cmp     r5, r9
        blt     LBVG7
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        movlt   r9, #0
        sublt   r9, r9, #2, 18
        b       LBVG8
LBVG7:
        mvn     r9, #0xFF
        bic     r9, r9, #0x7F, 24
        mvn     r9, r9
LBVG8:
        strh    r9, [r1, #2]
        ldr     r10, [r8]
        add     r9, lr, r2, lsl #2
        cmp     r2, #0
        add     lr, r4, r10
        movle   r10, #0
        movle   lr, r10
        ble     LBVG10
        add     r11, r3, lr, lsl #2
        add     r11, r11, #2
        add     r0, r9, #2
        str     r11, [sp, #0x44]
        str     r0, [sp, #0x40]
        str     r12, [sp, #0x28]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x44]
        ldr     r12, [sp, #0x40]
        mov     r10, #0
        mov     lr, r10
        mov     r11, r2
        str     r7, [sp, #0x30]
        str     r4, [sp, #0x24]
LBVG9:
        ldrsh   r0, [r12, #-2]
        ldrsh   r7, [r1]
        ldrsh   r2, [r1, #-2]
        ldrsh   r3, [r12], #4
        mul     r4, r7, r0
        mul     r0, r2, r0
        mul     r7, r3, r7
        add     r1, r1, #4
        subs    r11, r11, #1
        mla     r4, r2, r3, r4
        sub     r0, r0, r7
        add     r10, r0, r10
        add     lr, r4, lr
        bne     LBVG9
        ldr     r7, [sp, #0x30]
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #8]
LBVG10:
        cmp     r12, #0
        beq     LBVG11
        cmp     r6, #0
        movgt   r10, r10, lsl r6
        bgt     LBVG11
        ldr     r11, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, r10, asr r11
        str     r11, [sp, #0x48]
        mov     r11, #1
        add     r0, r10, r11, lsl r0
        ldr     r10, [sp, #0x48]
        str     r0, [sp, #0x44]
        ldr     r11, [sp, #0x44]
        and     r10, r10, #1
        add     r10, r11, r10
        ldr     r11, [sp, #0x38]
        sub     r10, r10, #1
        mov     r10, r10, asr r11
LBVG11:
        cmp     r5, r10
        blt     LBVG12
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        movlt   r10, #0
        sublt   r10, r10, #2, 18
        b       LBVG13
LBVG12:
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
LBVG13:
        cmp     r12, #0
        strh    r10, [r7]
        beq     LBVG14
        cmp     r6, #0
        movgt   lr, lr, lsl r6
        bgt     LBVG14
        ldr     r10, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, lr, asr r10
        str     r11, [sp, #0x48]
        mov     r11, #1
        add     lr, lr, r11, lsl r0
        ldr     r11, [sp, #0x48]
        and     r11, r11, #1
        add     r11, lr, r11
        sub     lr, r11, #1
        mov     lr, lr, asr r10
LBVG14:
        cmp     r5, lr
        blt     LBVG15
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LBVG16
LBVG15:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LBVG16:
        strh    lr, [r7, #2]
        ldr     lr, [r8, #4]
        cmp     r2, #0
        add     r10, r9, r2, lsl #2
        add     lr, r4, lr
        movle   r11, #0
        movle   r9, r11
        ble     LBVG18
        add     r0, r10, #2
        str     r0, [sp, #0x40]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x28]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x44]
        ldr     r12, [sp, #0x40]
        add     lr, r3, lr, lsl #2
        mov     r11, #0
        mov     r9, r11
        add     lr, lr, #2
        str     r7, [sp, #0x30]
        str     r4, [sp, #0x24]
LBVG17:
        ldrsh   r0, [r12, #-2]
        ldrsh   r7, [lr]
        ldrsh   r2, [lr, #-2]
        ldrsh   r3, [r12], #4
        mul     r4, r7, r0
        mul     r0, r2, r0
        mul     r7, r3, r7
        add     lr, lr, #4
        subs    r1, r1, #1
        mla     r4, r2, r3, r4
        sub     r0, r0, r7
        add     r11, r0, r11
        add     r9, r4, r9
        bne     LBVG17
        ldr     r7, [sp, #0x30]
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #8]
LBVG18:
        cmp     r12, #0
        beq     LBVG19
        cmp     r6, #0
        movgt   r11, r11, lsl r6
        bgt     LBVG19
        ldr     lr, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     lr, r11, asr lr
        str     lr, [sp, #0x48]
        mov     lr, #1
        add     r0, r11, lr, lsl r0
        ldr     lr, [sp, #0x48]
        str     r0, [sp, #0x44]
        ldr     r11, [sp, #0x44]
        and     lr, lr, #1
        add     lr, r11, lr
        ldr     r11, [sp, #0x38]
        sub     lr, lr, #1
        mov     r11, lr, asr r11
LBVG19:
        cmp     r5, r11
        blt     LBVG20
        cmn     r11, #2, 18
        movge   r11, r11, lsl #16
        movge   lr, r11, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LBVG21
LBVG20:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LBVG21:
        ldr     r11, [sp, #4]
        cmp     r12, #0
        strh    lr, [r11]
        beq     LBVG22
        cmp     r6, #0
        movgt   r9, r9, lsl r6
        bgt     LBVG22
        ldr     lr, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, r9, asr lr
        str     r11, [sp, #0x48]
        mov     r11, #1
        add     r9, r9, r11, lsl r0
        ldr     r11, [sp, #0x48]
        and     r11, r11, #1
        add     r11, r9, r11
        sub     r9, r11, #1
        mov     r9, r9, asr lr
LBVG22:
        cmp     r5, r9
        blt     LBVG23
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   lr, r9, asr #16
        movlt   lr, #0
        sublt   lr, lr, #2, 18
        b       LBVG24
LBVG23:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
LBVG24:
        ldr     r9, [sp, #4]
        cmp     r2, #0
        strh    lr, [r9, #2]
        ldr     r9, [r8, #8]
        add     lr, r10, r2, lsl #2
        add     r8, r8, #0xC
        add     r9, r4, r9
        movle   r10, #0
        movle   r9, r10
        ble     LBVG26
        add     r11, r3, r9, lsl #2
        add     r11, r11, #2
        add     r0, lr, #2
        str     r11, [sp, #0x44]
        str     r0, [sp, #0x40]
        str     r12, [sp, #0x28]
        str     r1, [sp, #0x14]
        ldr     r1, [sp, #0x44]
        ldr     r12, [sp, #0x40]
        mov     r10, #0
        mov     r9, r10
        mov     r11, r2
        str     r8, [sp, #0x48]
        str     r4, [sp, #0x24]
LBVG25:
        ldrsh   r0, [r12, #-2]
        ldrsh   r8, [r1]
        ldrsh   r2, [r1, #-2]
        ldrsh   r3, [r12], #4
        mul     r4, r8, r0
        mul     r0, r2, r0
        mul     r8, r3, r8
        add     r1, r1, #4
        subs    r11, r11, #1
        mla     r4, r2, r3, r4
        sub     r0, r0, r8
        add     r10, r0, r10
        add     r9, r4, r9
        bne     LBVG25
        ldr     r8, [sp, #0x48]
        ldr     r12, [sp, #0x28]
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #0x24]
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #8]
LBVG26:
        cmp     r12, #0
        beq     LBVG27
        cmp     r6, #0
        movgt   r10, r10, lsl r6
        bgt     LBVG27
        ldr     r11, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, r10, asr r11
        str     r11, [sp, #0x44]
        mov     r11, #1
        add     r0, r10, r11, lsl r0
        ldr     r10, [sp, #0x44]
        str     r0, [sp, #0x40]
        ldr     r11, [sp, #0x40]
        and     r10, r10, #1
        add     r10, r11, r10
        ldr     r11, [sp, #0x38]
        sub     r10, r10, #1
        mov     r10, r10, asr r11
LBVG27:
        cmp     r5, r10
        blt     LBVG28
        cmn     r10, #2, 18
        movge   r10, r10, lsl #16
        movge   r10, r10, asr #16
        movlt   r10, #0
        sublt   r10, r10, #2, 18
        b       LBVG29
LBVG28:
        mvn     r10, #0xFF
        bic     r10, r10, #0x7F, 24
        mvn     r10, r10
LBVG29:
        ldr     r11, [sp]
        cmp     r12, #0
        strh    r10, [r11]
        beq     LBVG30
        cmp     r6, #0
        movgt   r9, r9, lsl r6
        bgt     LBVG30
        ldr     r10, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r11, r9, asr r10
        str     r11, [sp, #0x44]
        mov     r11, #1
        add     r9, r9, r11, lsl r0
        ldr     r11, [sp, #0x44]
        and     r11, r11, #1
        add     r11, r9, r11
        sub     r9, r11, #1
        mov     r9, r9, asr r10
LBVG30:
        cmp     r5, r9
        blt     LBVG31
        cmn     r9, #2, 18
        movge   r9, r9, lsl #16
        movge   r9, r9, asr #16
        mvnlt   r9, #0xFF
        biclt   r9, r9, #0x7F, 24
        b       LBVG32
LBVG31:
        mov     r9, #0
        sub     r9, r9, #2, 18
        mvn     r9, r9
LBVG32:
        ldr     r10, [sp, #0x10]
        add     lr, lr, r2, lsl #2
        cmp     r8, r10
        ldr     r10, [sp]
        strh    r9, [r10, #2]
        bcc     LBVG33
        ldr     lr, [sp, #0x10]
        ldr     r8, [sp, #0x20]
        ldr     r9, [lr]
        ldr     lr, [sp, #0x1C]
        add     r4, r9, r4
LBVG33:
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x18]
        add     r7, r7, #0x10
        add     r9, r9, #4
        str     r9, [sp, #0x2C]
        cmp     r9, r10
        ldr     r9, [sp]
        add     r1, r1, #0x10
        add     r9, r9, #0x10
        str     r9, [sp]
        ldr     r9, [sp, #4]
        add     r9, r9, #0x10
        str     r9, [sp, #4]
        blt     LBVG0
LBVG34:
        mov     r0, r4
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}


