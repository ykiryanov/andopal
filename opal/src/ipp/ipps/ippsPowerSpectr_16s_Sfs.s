        .text
        .align  4
        .globl  _ippsPowerSpectr_16s_Sfs


_ippsPowerSpectr_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r12, [sp, #0x3C]
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
        beq     LBAJ25
        cmp     r6, #0
        beq     LBAJ25
        cmp     r7, #0
        beq     LBAJ25
        cmp     r8, #1
        blt     LBAJ24
        mov     lr, #0xFF
        cmn     r12, #0xE
        orr     r4, lr, #0x7F, 24
        mov     r10, #0
        bge     LBAJ3
        cmp     r8, #0
        ble     LBAJ23
        mov     r12, r10
LBAJ0:
        ldrsh   lr, [r5], #2
        cmp     lr, #0
        bne     LBAJ1
        ldrsh   lr, [r6]
        cmp     lr, #0
        streqh  r10, [r7]
        beq     LBAJ2
LBAJ1:
        strh    r4, [r7]
LBAJ2:
        add     r12, r12, #1
        cmp     r12, r8
        add     r6, r6, #2
        add     r7, r7, #2
        blt     LBAJ0
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ3:
        orr     lr, r5, r6
        orr     lr, lr, r7
        tst     lr, #3
        bne     LBAJ13
        cmp     r12, #0
        blt     LBAJ7
        cmp     r12, #0x1F
        mov     lr, r10
        bgt     LBAJ6
        mov     r2, r8, asr #1
        cmp     r2, #0
        ble     LBAJ5
        mov     r1, r7
        mov     r11, r5
        mov     r0, r6
LBAJ4:
        ldr     lr, [r11], #4
        ldr     r10, [r0], #4
        mov     r9, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, lr, lr
        mov     r9, r9, asr #16
        mul     r9, r9, r9
        mov     r3, r10, lsl #16
        mov     r10, r10, asr #16
        mla     lr, r10, r10, lr
        mov     r3, r3, asr #16
        mla     r9, r3, r3, r9
        mov     lr, lr, lsr r12
        mov     r9, r9, lsr r12
        cmp     r4, r9
        movcc   r9, #0xFF
        orrcc   r9, r9, #0x7F, 24
        cmp     r4, lr
        movcc   lr, #0xFF
        orrcc   lr, lr, #0x7F, 24
        orr     lr, r9, lr, lsl #16
        str     lr, [r1], #4
        subs    r2, r2, #1
        bne     LBAJ4
LBAJ5:
        tst     r8, #1
        beq     LBAJ23
        mov     r8, r8, lsl #1
        sub     r5, r5, #2
        ldrsh   r3, [r5, +r8]
        sub     r6, r6, #2
        ldrsh   r0, [r6, +r8]
        mul     r3, r3, r3
        mov     r1, #0xFF
        sub     r7, r7, #2
        orr     r1, r1, #0x7F, 24
        mla     r3, r0, r0, r3
        mov     r12, r3, lsr r12
        cmp     r1, r12
        movcc   r12, r1
        strh    r12, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ6:
        add     r10, r10, #1
        strh    lr, [r7], #2
        cmp     r10, r8
        blt     LBAJ6
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ7:
        rsb     r9, r12, #0
        cmp     r9, #0xE
        mov     r12, r10
        bge     LBAJ10
        mov     r0, r8, asr #1
        cmp     r0, #0
        ble     LBAJ9
        mov     r12, r6
        mov     lr, r7
        mov     r11, r5
        str     r5, [sp, #0xC]
        str     r6, [sp, #8]
        mov     r10, r9, asr #31
        str     r7, [sp, #4]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r8, [sp]
        mov     r5, r0
        mov     r6, r4
LBAJ8:
        ldr     r1, [sp, #0x14]
        mov     r2, r9
        mov     r3, r10
        ldr     r12, [r1], #4
        str     r1, [sp, #0x14]
        ldr     r1, [r11], #4
        mov     lr, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r7, r12, r12
        mov     r12, r1, lsl #16
        mov     r1, r1, asr #16
        mul     r8, r1, r1
        mov     r12, r12, asr #16
        mul     r1, r12, r12
        mov     lr, lr, asr #16
        mul     r0, lr, lr
        mov     r12, r0, asr #31
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashldi3
        adds    r2, r7, r8
        mov     r7, r7, asr #31
        mov     r12, r1
        adc     r1, r7, r8, asr #31
        mov     r4, r0
        subs    r7, r4, r6
        sbcs    r8, r12, #0
        mov     r0, r2
        mov     r2, r9
        mov     r3, r10
        movlt   r7, #0
        movlt   r8, #0
        bl      __ashldi3
        orrs    r8, r7, r8
        movne   r12, #0xFF
        orrne   r4, r12, #0x7F, 24
        subs    r12, r0, r6
        sbcs    r1, r1, #0
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        movne   r1, #0xFF
        orrne   r0, r1, #0x7F, 24
        ldr     r1, [sp, #0x10]
        orr     r0, r4, r0, lsl #16
        subs    r5, r5, #1
        str     r0, [r1], #4
        str     r1, [sp, #0x10]
        bne     LBAJ8
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r8, [sp]
LBAJ9:
        tst     r8, #1
        beq     LBAJ23
        mov     r8, r8, lsl #1
        sub     r6, r6, #2
        ldrsh   r3, [r6, +r8]
        sub     r5, r5, #2
        ldrsh   r1, [r5, +r8]
        mul     r0, r3, r3
        mov     r3, r9, asr #31
        mov     r2, r9
        mul     r1, r1, r1
        mov     r12, r0, asr #31
        mov     lr, #0xFF
        orr     r4, lr, #0x7F, 24
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        bl      __ashldi3
        subs    r3, r0, r4
        sbcs    r1, r1, #0
        movlt   r3, #0
        movlt   r1, #0
        orrs    r1, r3, r1
        movne   r0, r4
        sub     r7, r7, #2
        strh    r0, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ10:
        ldrsh   lr, [r5], #2
        cmp     lr, #0
        bne     LBAJ11
        ldrsh   lr, [r6]
        cmp     lr, #0
        streqh  r12, [r7]
        beq     LBAJ12
LBAJ11:
        strh    r4, [r7]
LBAJ12:
        add     r10, r10, #1
        cmp     r10, r8
        add     r6, r6, #2
        add     r7, r7, #2
        blt     LBAJ10
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ13:
        cmp     r12, #0
        blt     LBAJ17
        cmp     r12, #0x1F
        bgt     LBAJ15
LBAJ14:
        ldrsh   r9, [r5], #2
        ldrsh   lr, [r6], #2
        mul     r9, r9, r9
        mla     r9, lr, lr, r9
        mov     lr, r9, lsr r12
        cmp     r4, lr
        movcc   lr, r4
        add     r10, r10, #1
        strh    lr, [r7], #2
        cmp     r10, r8
        blt     LBAJ14
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ15:
        mov     r0, r10
LBAJ16:
        add     r0, r0, #1
        strh    r10, [r7], #2
        cmp     r0, r8
        blt     LBAJ16
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ17:
        rsb     r9, r12, #0
        cmp     r9, #0xE
        mov     r12, r10
        blt     LBAJ21
LBAJ18:
        ldrsh   lr, [r5], #2
        cmp     lr, #0
        bne     LBAJ19
        ldrsh   lr, [r6]
        cmp     lr, #0
        streqh  r12, [r7]
        beq     LBAJ20
LBAJ19:
        strh    r4, [r7]
LBAJ20:
        add     r10, r10, #1
        cmp     r10, r8
        add     r6, r6, #2
        add     r7, r7, #2
        blt     LBAJ18
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ21:
        mov     r11, r9, asr #31
LBAJ22:
        ldrsh   lr, [r6], #2
        ldrsh   r12, [r5], #2
        mul     lr, lr, lr
        mul     r12, r12, r12
        mov     r3, r11
        mov     r2, r9
        mov     r1, lr, asr #31
        adds    r0, lr, r12
        adc     r1, r1, r12, asr #31
        bl      __ashldi3
        subs    r12, r0, r4
        sbcs    r1, r1, #0
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        movne   r0, r4
        add     r10, r10, #1
        strh    r0, [r7], #2
        cmp     r10, r8
        blt     LBAJ22
LBAJ23:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ24:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LBAJ25:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


