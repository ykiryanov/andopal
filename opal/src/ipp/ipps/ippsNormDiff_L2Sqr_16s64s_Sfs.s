        .text
        .align  4
        .globl  _ippsNormDiff_L2Sqr_16s64s_Sfs


_ippsNormDiff_L2Sqr_16s64s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r5, [sp, #0x30]
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        mov     r4, r3
        beq     LBCO6
        cmp     r10, #0
        beq     LBCO6
        cmp     r4, #0
        beq     LBCO6
        cmp     r2, #0
        ble     LBCO7
        cmp     r2, #5
        mov     r3, #0
        movlt   r0, r3
        movlt   r1, r0
        blt     LBCO1
        mov     r0, r3
        mov     r1, r0
        sub     r8, r2, #5
        mov     r7, r9
        mov     r6, r10
        str     r2, [sp, #8]
        str     r10, [sp, #4]
        str     r9, [sp]
LBCO0:
        ldrsh   lr, [r7]
        ldrsh   r12, [r6]
        ldrsh   r2, [r7, #2]
        ldrsh   r9, [r6, #4]
        ldrsh   r10, [r7, #4]
        sub     lr, lr, r12
        mul     r12, lr, lr
        ldrsh   lr, [r6, #2]
        ldrsh   r11, [r6, #6]
        add     r3, r3, #4
        sub     r2, r2, lr
        mul     lr, r2, r2
        ldrsh   r2, [r7, #6]
        adds    r0, r0, r12
        adc     r12, r1, r12, asr #31
        sub     r10, r10, r9
        mul     r1, r10, r10
        adds    r0, r0, lr
        adc     lr, r12, lr, asr #31
        sub     r2, r2, r11
        mul     r12, r2, r2
        adds    r0, r0, r1
        adc     r1, lr, r1, asr #31
        add     r7, r7, #8
        add     r6, r6, #8
        adds    r0, r0, r12
        adc     r1, r1, r12, asr #31
        cmp     r3, r8
        ble     LBCO0
        ldr     r2, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r9, [sp]
LBCO1:
        add     r9, r9, r3, lsl #1
        add     r10, r10, r3, lsl #1
LBCO2:
        ldrsh   lr, [r9], #2
        ldrsh   r12, [r10], #2
        add     r3, r3, #1
        sub     lr, lr, r12
        mul     lr, lr, lr
        adds    r0, r0, lr
        adc     r1, r1, lr, asr #31
        cmp     r3, r2
        blt     LBCO2
        cmp     r5, #0
        bne     LBCO3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCO3:
        cmp     r5, #0
        ble     LBCO4
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashrdi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCO4:
        cmn     r5, #0x3F
        mvn     r12, #0x3E
        movlt   r5, r12
        cmp     r0, #0
        sbcs    r12, r1, #1
        movlt   r6, r0
        movlt   r12, #0
        movge   r6, r1
        movge   r12, #0x20
        cmp     r6, #1, 16
        addcs   r12, r12, #0x10
        movcs   r6, r6, lsr #16
        cmp     r6, #1, 24
        addcs   r12, r12, #8
        movcs   r6, r6, lsr #8
        ldr     lr, [pc, #0x68]
        and     r6, r6, #0xFF
        ldrb    lr, [r6, +lr]
        add     lr, r12, lr
        sub     r12, lr, r5
        cmp     r12, #0x3F
        ble     LBCO5
        mvn     r1, #0
        mvn     r0, #2, 2
        str     r1, [r4]
        str     r0, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCO5:
        rsb     r2, r5, #0
        mov     r3, r2, asr #31
        bl      __ashldi3
        str     r0, [r4]
        str     r1, [r4, #4]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCO6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBCO7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   LBCO_bittbl


        .data
        .align  4


LBCO_bittbl:
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


