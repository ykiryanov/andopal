        .text
        .align  4
        .globl  _ippsPowerSpectr_16sc_Sfs


_ippsPowerSpectr_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r5, r2
        beq     LBAH24
        cmp     r6, #0
        beq     LBAH24
        cmp     r5, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r11, pc}
        mov     r12, #0xFF
        cmn     r3, #0xE
        orr     r7, r12, #0x7F, 24
        mov     r8, #0
        bge     LBAH3
        cmp     r5, #0
        ble     LBAH23
        mov     r12, r8
        mov     r3, r12
LBAH0:
        ldr     r9, [r4], #4
        sub     r10, r8, #1, 16
        movs    lr, r9, lsl #16
        and     r10, r9, r10
        bne     LBAH1
        cmp     r10, #0
        streqh  r3, [r6]
        beq     LBAH2
LBAH1:
        strh    r7, [r6]
LBAH2:
        add     r12, r12, #1
        cmp     r12, r5
        add     r6, r6, #2
        blt     LBAH0
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH3:
        tst     r4, #3
        bne     LBAH13
        cmp     r3, #0
        blt     LBAH7
        cmp     r3, #0x1F
        bgt     LBAH5
LBAH4:
        ldr     lr, [r4], #4
        mov     r12, lr, asr #16
        mul     r12, r12, r12
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mla     r12, lr, lr, r12
        mov     r12, r12, lsr r3
        cmp     r7, r12
        movcc   r12, r7
        add     r8, r8, #1
        strh    r12, [r6], #2
        cmp     r8, r5
        blt     LBAH4
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH5:
        mov     r0, r8
LBAH6:
        add     r0, r0, #1
        strh    r8, [r6], #2
        cmp     r0, r5
        blt     LBAH6
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH7:
        rsb     r9, r3, #0
        cmp     r9, #0xE
        blt     LBAH11
        mov     r3, r8
LBAH8:
        ldr     lr, [r4], #4
        sub     r9, r8, #1, 16
        movs    r12, lr, lsl #16
        and     r9, lr, r9
        bne     LBAH9
        cmp     r9, #0
        streqh  r8, [r6]
        beq     LBAH10
LBAH9:
        strh    r7, [r6]
LBAH10:
        add     r3, r3, #1
        cmp     r3, r5
        add     r6, r6, #2
        blt     LBAH8
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH11:
        mov     r10, r9, asr #31
LBAH12:
        ldr     r12, [r4], #4
        mov     r3, r10
        mov     lr, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, r12
        mov     lr, lr, asr #16
        mul     lr, lr, lr
        mov     r2, r9
        mov     r11, r12, asr #31
        adds    r0, lr, r12
        adc     r1, r11, lr, asr #31
        bl      __ashldi3
        subs    r12, r0, r7
        sbcs    r1, r1, #0
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        movne   r0, r7
        add     r8, r8, #1
        strh    r0, [r6], #2
        cmp     r8, r5
        blt     LBAH12
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH13:
        cmp     r3, #0
        blt     LBAH17
        cmp     r3, #0x1F
        bgt     LBAH15
LBAH14:
        ldrsh   lr, [r4]
        ldrsh   r12, [r4, #2]
        mul     lr, lr, lr
        mla     lr, r12, r12, lr
        mov     r12, lr, lsr r3
        cmp     r7, r12
        movcc   r12, r7
        add     r8, r8, #1
        strh    r12, [r6], #2
        cmp     r8, r5
        add     r4, r4, #4
        blt     LBAH14
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH15:
        mov     r0, r8
LBAH16:
        add     r0, r0, #1
        strh    r8, [r6], #2
        cmp     r0, r5
        blt     LBAH16
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH17:
        rsb     r9, r3, #0
        cmp     r9, #0xE
        mov     r3, r8
        blt     LBAH21
LBAH18:
        ldrsh   r12, [r4]
        cmp     r12, #0
        bne     LBAH19
        ldrsh   r12, [r4, #2]
        cmp     r12, #0
        streqh  r3, [r6]
        beq     LBAH20
LBAH19:
        strh    r7, [r6]
LBAH20:
        add     r8, r8, #1
        cmp     r8, r5
        add     r4, r4, #4
        add     r6, r6, #2
        blt     LBAH18
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH21:
        mov     r10, r9, asr #31
LBAH22:
        ldrsh   lr, [r4, #2]
        ldrsh   r12, [r4]
        mov     r3, r10
        mul     lr, lr, lr
        mov     r2, r9
        mul     r12, r12, r12
        mov     r11, lr, asr #31
        adds    r0, lr, r12
        adc     r1, r11, r12, asr #31
        bl      __ashldi3
        subs    r12, r0, r7
        sbcs    r1, r1, #0
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        movne   r0, r7
        add     r8, r8, #1
        strh    r0, [r6], #2
        cmp     r8, r5
        add     r4, r4, #4
        blt     LBAH22
LBAH23:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAH24:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


