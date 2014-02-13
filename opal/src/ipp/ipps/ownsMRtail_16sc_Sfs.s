        .text
        .align  4
        .globl  ownsMRtail_16sc_Sfs


ownsMRtail_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        ldr     r12, [sp, #0x74]
        ldr     lr, [sp, #0x70]
        str     r12, [sp, #4]
        ldr     r12, [sp, #0x78]
        cmp     r2, #0
        str     r12, [sp, #8]
        ldr     r12, [sp, #0x7C]
        str     r0, [sp]
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x80]
        mov     r6, lr
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x84]
        mov     r8, r3
        ble     LBVF12
        cmp     r12, #0x1F
        mov     r5, r12
        mov     r0, #0x1F
        movgt   r5, r0
        cmn     r5, #0x1F
        mvn     r0, #0x1E
        movlt   r5, r0
        rsb     r4, r5, #0
        sub     r0, r4, #1
        mov     r7, #1
        sub     r9, r1, #2
        mov     r0, r7, lsl r0
        mvn     r1, #0xFF
        mvn     r11, #0
        bic     r7, r1, #0x7F, 24
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #8]
        sub     r0, r0, #1
        mov     r1, r4, asr #31
        mvn     r7, r7
        mov     r10, #0
        str     r7, [sp, #0x40]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x2C]
        str     r4, [sp, #0x28]
        str     r5, [sp, #0x48]
        str     r6, [sp, #0x44]
        str     r12, [sp, #0x3C]
        str     lr, [sp, #0x20]
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x34]
LBVF0:
        cmp     r10, #0
        ble     LBVF1
        tst     r10, #3
        bne     LBVF1
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x44]
        cmp     r0, r1
        bcc     LBVF1
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     r0, [r0]
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #4]
        add     r1, r0, r1
        str     r1, [sp, #4]
LBVF1:
        ldr     r1, [sp, #0x44]
        cmp     r11, #0
        ldr     r0, [r1], #4
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #4]
        add     r3, r0, r1
        ble     LBVF14
        ldr     r2, [sp]
        mov     r0, #0
        mov     r5, r0
        mov     r4, r5
        add     r2, r2, r3, lsl #2
        mov     r7, r4
        mov     r6, r7
        sub     lr, r8, #2
        add     r2, r2, #2
        mov     r12, r11
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x1C]
        str     r8, [sp, #0x14]
LBVF2:
        ldr     r8, [sp, #0x10]
        cmp     r8, r3
        ble     LBVF13
        ldr     r8, [sp, #0x14]
        ldrsh   r9, [r2, #-2]
        ldrsh   r1, [r2], #4
        ldrsh   r8, [r8, +r0]
        ldrsh   r10, [lr, #4]!
        add     r3, r3, #1
        add     r0, r0, #4
        mul     r11, r9, r8
        mul     r8, r1, r8
        mul     r1, r10, r1
        mla     r8, r9, r10, r8
        sub     r11, r11, r1
        adds    r7, r7, r11
        adc     r6, r6, r11, asr #31
        adds    r5, r5, r8
        adc     r4, r4, r8, asr #31
        subs    r12, r12, #1
        bne     LBVF2
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x14]
        ldr     r11, [sp, #8]
LBVF3:
        ldr     r2, [sp, #0x3C]
        add     r8, r8, r11, lsl #2
        cmp     r2, #0
        beq     LBVF5
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        ble     LBVF4
        mov     r0, r7
        mov     r1, r6
        ldr     r2, [sp, #0x48]
        mov     r3, #0
        bl      __ashldi3
        mov     r7, r0
        mov     r6, r1
        b       LBVF5
LBVF4:
        mov     r0, r7
        mov     r1, r6
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        bl      __ashrdi3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        adds    r7, r2, r7
        adc     r2, r6, r2, asr #31
        and     r0, r0, #1
        adds    r0, r7, r0
        adc     r1, r2, #0
        ldr     r2, [sp, #0x28]
        bl      __ashrdi3
        mov     r7, r0
        mov     r6, r1
LBVF5:
        ldr     r2, [sp, #0x40]
        subs    r2, r7, r2
        sbcs    r3, r6, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBVF6
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r7, r2
        ldr     r2, [sp, #0x38]
        sbcs    r6, r6, r2
        movge   r7, r7, lsl #16
        movge   r2, r7, asr #16
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        b       LBVF7
LBVF6:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBVF7:
        ldr     r3, [sp, #0x3C]
        strh    r2, [r9, #2]
        cmp     r3, #0
        beq     LBVF9
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        ble     LBVF8
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [sp, #0x48]
        mov     r3, #0
        bl      __ashldi3
        mov     r5, r0
        mov     r4, r1
        b       LBVF9
LBVF8:
        mov     r0, r5
        mov     r1, r4
        ldr     r7, [sp, #0x28]
        ldr     r6, [sp, #0x30]
        mov     r2, r7
        mov     r3, r6
        bl      __ashrdi3
        ldr     r12, [sp, #0x2C]
        and     r0, r0, #1
        mov     r2, r7
        adds    r5, r5, r12
        adc     r12, r4, r12, asr #31
        adds    r0, r5, r0
        adc     r1, r12, #0
        mov     r3, r6
        bl      __ashrdi3
        mov     r5, r0
        mov     r4, r1
LBVF9:
        ldr     r2, [sp, #0x40]
        subs    r2, r5, r2
        sbcs    r3, r4, #0
        movlt   r2, #0
        movlt   r3, #0
        orrs    r3, r2, r3
        bne     LBVF10
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r5, r2
        ldr     r2, [sp, #0x38]
        sbcs    r4, r4, r2
        movge   r5, r5, lsl #16
        movge   r5, r5, asr #16
        mvnlt   r0, #0xFF
        biclt   r5, r0, #0x7F, 24
        b       LBVF11
LBVF10:
        mov     r0, #0
        sub     r0, r0, #2, 18
        mvn     r5, r0
LBVF11:
        strh    r5, [r9, #4]!
        ldr     r0, [sp, #0x34]
        add     r10, r10, #1
        cmp     r10, r0
        blt     LBVF0
LBVF12:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBVF13:
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x14]
        ldr     r11, [sp, #8]
        b       LBVF3
LBVF14:
        mov     r6, #0
        mov     r5, r6
        mov     r4, r5
        mov     r7, r4
        b       LBVF3


