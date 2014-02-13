        .text
        .align  4
        .globl  _ippsNorm_L1_16s64s_Sfs


_ippsNorm_L1_16s64s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r4, r2
        cmp     r0, #0
        mov     r7, r1
        mov     r2, r3
        beq     LBCD18
        cmp     r4, #0
        beq     LBCD18
        cmp     r7, #0
        ble     LBCD19
        cmp     r7, #1, 16
        mov     r12, #0
        ble     LBCD11
        mov     r9, r7, asr #16
        cmp     r9, #0
        movle   r3, r12
        movle   r1, r3
        ble     LBCD2
        mov     r3, r12
        mov     r1, r3
LBCD0:
        mov     r5, r12
        mov     r6, r5
        mov     r8, #1, 16
LBCD1:
        ldrsh   lr, [r0, +r6]
        cmp     lr, #0
        rsblt   lr, lr, #0
        subs    r8, r8, #1
        add     r5, r5, lr
        add     r6, r6, #2
        bne     LBCD1
        adds    r3, r3, r5
        adc     r1, r1, #0
        subs    r9, r9, #1
        add     r0, r0, #2, 16
        bne     LBCD0
LBCD2:
        bic     r7, r7, #0xFF, 8
        bics    r9, r7, #0xFF, 16
        mov     r10, #0
        beq     LBCD7
        cmp     r9, #0
        movle   r12, r10
        ble     LBCD6
        cmp     r9, #6
        movlt   r12, r10
        movlt   lr, r12
        blt     LBCD4
        mov     r12, r10
        sub     r11, r9, #6
        mov     r5, #6
        str     r5, [sp, #0x20]
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x20]
        mov     lr, r12
        mov     r8, lr
        mov     r7, #2
        mov     r6, #4
        mov     r5, #8
        str     r2, [sp, #8]
        str     r1, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r10, [sp, #0x18]
        str     r4, [sp, #0x1C]
        str     r0, [sp]
LBCD3:
        ldr     r0, [sp]
        add     lr, lr, #5
        ldrsh   r2, [r0, +r8]
        ldrsh   r3, [r0, +r7]
        ldrsh   r9, [r0, +r6]
        ldrsh   r10, [r0, +r11]
        ldrsh   r0, [r0, +r5]
        eor     r1, r2, r2, asr #31
        eor     r4, r3, r3, asr #31
        sub     r1, r1, r2, asr #31
        str     r4, [sp, #0x24]
        add     r12, r1, r12
        ldr     r1, [sp, #0x24]
        eor     r4, r9, r9, asr #31
        eor     r2, r10, r10, asr #31
        sub     r1, r1, r3, asr #31
        add     r12, r1, r12
        eor     r1, r0, r0, asr #31
        sub     r4, r4, r9, asr #31
        add     r12, r4, r12
        sub     r1, r1, r0, asr #31
        ldr     r0, [sp, #4]
        sub     r2, r2, r10, asr #31
        add     r12, r2, r12
        add     r12, r1, r12
        cmp     lr, r0
        add     r8, r8, #0xA
        add     r7, r7, #0xA
        add     r6, r6, #0xA
        add     r11, r11, #0xA
        add     r5, r5, #0xA
        ble     LBCD3
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r0, [sp]
LBCD4:
        mov     r5, lr, lsl #1
LBCD5:
        ldrsh   r6, [r0, +r5]
        add     r5, r5, #2
        add     lr, lr, #1
        eor     r7, r6, r6, asr #31
        cmp     lr, r9
        sub     r7, r7, r6, asr #31
        add     r12, r7, r12
        blt     LBCD5
LBCD6:
        adds    r3, r3, r12
        adc     r1, r1, #0
LBCD7:
        cmp     r2, #0
        bne     LBCD8
        str     r3, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD8:
        cmp     r2, #0
        ble     LBCD9
        mov     r0, r3
        mov     r3, r2, asr #31
        bl      __ashrdi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD9:
        cmn     r2, #0x3F
        mvn     r12, #0x3E
        movlt   r2, r12
        cmp     r3, #0
        sbcs    r12, r1, #1
        movlt   lr, r3
        movge   lr, r1
        movge   r10, #0x20
        cmp     lr, #1, 16
        addcs   r10, r10, #0x10
        movcs   lr, lr, lsr #16
        cmp     lr, #1, 24
        addcs   r10, r10, #8
        movcs   lr, lr, lsr #8
        ldr     r12, [pc, #0x1EC]
        and     lr, lr, #0xFF
        ldrb    r12, [lr, +r12]
        add     r12, r10, r12
        sub     r12, r12, r2
        cmp     r12, #0x3F
        ble     LBCD10
        mvn     r0, #0
        mvn     r1, #2, 2
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD10:
        rsb     r2, r2, #0
        mov     r0, r3
        mov     r3, r2, asr #31
        bl      __ashldi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD11:
        cmp     r7, #6
        movlt   r3, r12
        movlt   lr, r3
        blt     LBCD13
        mov     r3, r12
        mov     lr, r3
        sub     r6, r7, #6
        mov     r5, r0
        str     r7, [sp, #0x18]
        str     r0, [sp]
LBCD12:
        ldrsh   r11, [r5]
        ldrsh   r7, [r5, #2]
        ldrsh   r1, [r5, #4]
        ldrsh   r8, [r5, #6]
        ldrsh   r9, [r5, #8]
        eor     r10, r11, r11, asr #31
        add     lr, lr, #5
        cmp     lr, r6
        sub     r10, r10, r11, asr #31
        add     r3, r10, r3
        eor     r11, r7, r7, asr #31
        eor     r0, r1, r1, asr #31
        add     r5, r5, #0xA
        sub     r11, r11, r7, asr #31
        add     r3, r11, r3
        sub     r0, r0, r1, asr #31
        add     r3, r0, r3
        eor     r10, r8, r8, asr #31
        eor     r0, r9, r9, asr #31
        sub     r10, r10, r8, asr #31
        add     r3, r10, r3
        sub     r0, r0, r9, asr #31
        add     r3, r0, r3
        ble     LBCD12
        ldr     r7, [sp, #0x18]
        ldr     r0, [sp]
LBCD13:
        add     r0, r0, lr, lsl #1
LBCD14:
        ldrsh   r5, [r0], #2
        add     lr, lr, #1
        eor     r6, r5, r5, asr #31
        cmp     lr, r7
        sub     r6, r6, r5, asr #31
        add     r3, r6, r3
        blt     LBCD14
        cmp     r2, #0
        bne     LBCD15
        str     r3, [r4]
        str     r12, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD15:
        cmp     r2, #0
        ble     LBCD16
        mov     r0, r3
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashrdi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD16:
        cmn     r2, #0x3F
        mvn     r1, #0x3E
        movlt   r2, r1
        cmp     r3, #1, 16
        mov     lr, r3
        movcs   lr, r3, lsr #16
        movcs   r12, #0x10
        cmp     lr, #1, 24
        addcs   r12, r12, #8
        movcs   lr, lr, lsr #8
        ldr     r1, [pc, #0x70]
        and     lr, lr, #0xFF
        ldrb    r1, [lr, +r1]
        add     r1, r12, r1
        sub     r1, r1, r2
        cmp     r1, #0x3F
        ble     LBCD17
        mvn     r0, #0
        mvn     r1, #2, 2
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD17:
        rsb     r2, r2, #0
        mov     r0, r3
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD18:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBCD19:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   LBCD_bittbl


        .data
        .align  4


LBCD_bittbl:
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


