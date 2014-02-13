        .text
        .align  4
        .globl  _ippsNormDiff_L1_16s64s_Sfs


_ippsNormDiff_L1_16s64s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     r5, [sp, #0x64]
        cmp     r0, #0
        mov     r8, r2
        mov     r4, r3
        beq     LBCR18
        cmp     r1, #0
        beq     LBCR18
        cmp     r4, #0
        beq     LBCR18
        cmp     r8, #0
        ble     LBCR19
        cmp     r8, #1, 16
        mov     r9, #0
        ble     LBCR11
        mov     r12, r8, asr #16
        cmp     r12, #0
        movle   r3, r9
        movle   r2, r3
        ble     LBCR2
        mov     r3, r9
        mov     r2, r3
LBCR0:
        mov     r7, r9
        mov     r6, r7
        mov     lr, #1, 16
LBCR1:
        ldrsh   r10, [r0, +r6]
        ldrsh   r11, [r1, +r6]
        subs    r10, r10, r11
        rsbmi   r10, r10, #0
        subs    lr, lr, #1
        add     r7, r7, r10
        add     r6, r6, #2
        bne     LBCR1
        adds    r3, r3, r7
        adc     r2, r2, #0
        subs    r12, r12, #1
        add     r0, r0, #2, 16
        add     r1, r1, #2, 16
        bne     LBCR0
LBCR2:
        bic     r8, r8, #0xFF, 8
        bics    r8, r8, #0xFF, 16
        mov     r10, #0
        beq     LBCR7
        cmp     r8, #0
        movle   r9, r10
        ble     LBCR6
        cmp     r8, #6
        movlt   r9, r10
        movlt   r12, r9
        blt     LBCR4
        mov     r9, r10
        mov     lr, #4
        str     lr, [sp, #0x28]
        mov     lr, #6
        str     lr, [sp, #0x2C]
        mov     r12, r9
        str     r9, [sp]
        str     r10, [sp, #0x18]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x28]
        sub     r11, r8, #6
        mov     r7, r12
        mov     r6, #2
        mov     lr, #8
        str     r5, [sp, #8]
        str     r2, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r11, [sp, #4]
        str     r8, [sp, #0x14]
        str     r4, [sp, #0x1C]
LBCR3:
        ldrsh   r3, [r1, +r7]
        ldrsh   r2, [r0, +r7]
        add     r12, r12, #5
        str     r3, [sp, #0x30]
        ldrsh   r11, [r0, +r9]
        ldrsh   r4, [r6, +r1]
        ldrsh   r5, [r0, +r6]
        ldrsh   r3, [r0, +r10]
        ldrsh   r8, [r10, +r1]
        str     r11, [sp, #0x34]
        ldrsh   r11, [r9, +r1]
        sub     r4, r5, r4
        sub     r3, r3, r8
        eor     r8, r4, r4, asr #31
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x30]
        sub     r8, r8, r4, asr #31
        eor     r4, r3, r3, asr #31
        sub     r2, r2, r11
        ldrsh   r11, [r0, +lr]
        add     r7, r7, #0xA
        eor     r5, r2, r2, asr #31
        add     r6, r6, #0xA
        str     r11, [sp, #0x30]
        ldrsh   r11, [lr, +r1]
        sub     r2, r5, r2, asr #31
        ldr     r5, [sp, #0x34]
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        str     r4, [sp, #0x38]
        ldr     r4, [sp, #0x30]
        add     r10, r10, #0xA
        sub     r5, r5, r11
        ldr     r11, [sp]
        add     r9, r9, #0xA
        add     lr, lr, #0xA
        add     r2, r2, r11
        ldr     r11, [sp, #0x3C]
        add     r2, r8, r2
        ldr     r8, [sp, #0x38]
        sub     r4, r4, r11
        sub     r8, r8, r3, asr #31
        eor     r3, r5, r5, asr #31
        add     r8, r8, r2
        sub     r3, r3, r5, asr #31
        add     r8, r3, r8
        ldr     r3, [sp, #4]
        eor     r2, r4, r4, asr #31
        sub     r2, r2, r4, asr #31
        add     r8, r2, r8
        cmp     r12, r3
        str     r8, [sp]
        ble     LBCR3
        ldr     r5, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        ldr     r9, [sp]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
LBCR4:
        mov     lr, r12, lsl #1
LBCR5:
        ldrsh   r6, [r0, +lr]
        ldrsh   r7, [r1, +lr]
        add     lr, lr, #2
        add     r12, r12, #1
        cmp     r12, r8
        sub     r6, r6, r7
        eor     r7, r6, r6, asr #31
        sub     r7, r7, r6, asr #31
        add     r9, r7, r9
        blt     LBCR5
LBCR6:
        adds    r3, r3, r9
        adc     r2, r2, #0
LBCR7:
        cmp     r5, #0
        bne     LBCR8
        str     r3, [r4]
        str     r2, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR8:
        cmp     r5, #0
        ble     LBCR9
        mov     r0, r3
        mov     r1, r2
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashrdi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR9:
        cmn     r5, #0x3F
        mvn     r12, #0x3E
        movlt   r5, r12
        cmp     r3, #0
        sbcs    r12, r2, #1
        movlt   lr, r3
        movge   lr, r2
        movge   r10, #0x20
        cmp     lr, #1, 16
        addcs   r10, r10, #0x10
        movcs   lr, lr, lsr #16
        cmp     lr, #1, 24
        addcs   r10, r10, #8
        movcs   lr, lr, lsr #8
        ldr     r12, [pc, #0x258]
        and     lr, lr, #0xFF
        ldrb    r12, [lr, +r12]
        add     r12, r10, r12
        sub     r12, r12, r5
        cmp     r12, #0x3F
        ble     LBCR10
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r4]
        str     r0, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR10:
        rsb     r5, r5, #0
        mov     r0, r3
        mov     r3, r5, asr #31
        mov     r1, r2
        mov     r2, r5
        bl      __ashldi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR11:
        cmp     r8, #6
        movlt   r2, r9
        movlt   r12, r2
        blt     LBCR13
        mov     r2, r9
        mov     r12, r2
        sub     r7, r8, #6
        mov     r6, r0
        mov     lr, r1
        str     r5, [sp, #8]
        str     r9, [sp, #0x18]
        str     r4, [sp, #0x1C]
        str     r8, [sp, #0x14]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
LBCR12:
        ldrsh   r1, [r6]
        ldrsh   r3, [lr]
        ldrsh   r4, [lr, #4]
        ldrsh   r0, [r6, #6]
        ldrsh   r11, [lr, #6]
        sub     r9, r1, r3
        ldrsh   r1, [r6, #2]
        ldrsh   r3, [lr, #2]
        ldrsh   r8, [r6, #8]
        ldrsh   r5, [lr, #8]
        sub     r1, r1, r3
        ldrsh   r3, [r6, #4]
        add     r12, r12, #5
        cmp     r12, r7
        eor     r10, r9, r9, asr #31
        sub     r3, r3, r4
        eor     r4, r1, r1, asr #31
        sub     r10, r10, r9, asr #31
        sub     r0, r0, r11
        sub     r4, r4, r1, asr #31
        eor     r1, r3, r3, asr #31
        add     r2, r10, r2
        add     r2, r4, r2
        sub     r1, r1, r3, asr #31
        add     r2, r1, r2
        eor     r3, r0, r0, asr #31
        sub     r8, r8, r5
        sub     r3, r3, r0, asr #31
        eor     r1, r8, r8, asr #31
        add     r2, r3, r2
        sub     r1, r1, r8, asr #31
        add     r2, r1, r2
        add     r6, r6, #0xA
        add     lr, lr, #0xA
        ble     LBCR12
        ldr     r5, [sp, #8]
        ldr     r9, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r8, [sp, #0x14]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x24]
LBCR13:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LBCR14:
        ldrsh   lr, [r0], #2
        ldrsh   r6, [r1], #2
        add     r12, r12, #1
        sub     lr, lr, r6
        cmp     r12, r8
        eor     r6, lr, lr, asr #31
        sub     r6, r6, lr, asr #31
        add     r2, r6, r2
        blt     LBCR14
        cmp     r5, #0
        bne     LBCR15
        str     r2, [r4]
        str     r9, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR15:
        cmp     r5, #0
        ble     LBCR16
        mov     r0, r2
        mov     r3, r5, asr #31
        mov     r1, #0
        mov     r2, r5
        bl      __ashrdi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR16:
        cmn     r5, #0x3F
        mvn     r1, #0x3E
        movlt   r5, r1
        cmp     r2, #1, 16
        mov     r12, r2
        movcs   r12, r2, lsr #16
        movcs   r9, #0x10
        cmp     r12, #1, 24
        addcs   r9, r9, #8
        movcs   r12, r12, lsr #8
        ldr     r1, [pc, #0x74]
        and     r12, r12, #0xFF
        ldrb    r1, [r12, +r1]
        add     r1, r9, r1
        sub     r1, r1, r5
        cmp     r1, #0x3F
        ble     LBCR17
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r4]
        str     r0, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR17:
        rsb     r5, r5, #0
        mov     r0, r2
        mov     r3, r5, asr #31
        mov     r1, #0
        mov     r2, r5
        bl      __ashldi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR18:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LBCR19:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   LBCR_bittbl


        .data
        .align  4


LBCR_bittbl:
        .byte   0x00,0x01,0x02,0x02,0x03,0x03,0x03,0x03,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04
        .byte   0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05,0x05
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06,0x06
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07,0x07
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
        .byte   0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08


