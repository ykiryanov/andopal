        .text
        .align  4
        .globl  _ippsMean_16s_Sfs


_ippsMean_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r8, r2
        mov     r7, r3
        beq     LAVI17
        cmp     r8, #0
        beq     LAVI17
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mov     lr, r4, asr #16
        cmp     lr, #0
        mov     r12, #0
        movle   r6, r12
        movle   r5, r6
        ble     LAVI2
        mov     r6, r12
        mov     r5, r6
LAVI0:
        mov     r2, r12
        mov     r10, r2
        mov     r9, r0
LAVI1:
        ldrsh   r3, [r9]
        ldrsh   r11, [r9, #2]
        ldrsh   r1, [r9, #4]
        add     r3, r2, r3
        add     r10, r10, #4
        add     r11, r3, r11
        add     r1, r11, r1
        ldrsh   r11, [r9, #6]
        cmp     r10, #1, 16
        add     r9, r9, #8
        add     r2, r1, r11
        blt     LAVI1
        adds    r6, r6, r2
        adc     r5, r5, r2, asr #31
        subs    lr, lr, #1
        bne     LAVI0
LAVI2:
        bic     lr, r4, #0xFF, 8
        bics    lr, lr, #0xFF, 16
        beq     LAVI7
        cmp     lr, #0
        movle   r9, r12
        ble     LAVI6
        cmp     lr, #6
        movlt   r9, r12
        blt     LAVI4
        mov     r9, r12
        sub     r11, lr, #6
        mov     r10, r0
LAVI3:
        ldrsh   r2, [r10]
        ldrsh   r1, [r10, #2]
        add     r12, r12, #5
        add     r2, r9, r2
        ldrsh   r9, [r10, #6]
        add     r1, r2, r1
        ldrsh   r2, [r10, #4]
        cmp     r12, r11
        add     r2, r1, r2
        ldrsh   r1, [r10, #8]
        add     r9, r2, r9
        add     r10, r10, #0xA
        add     r9, r9, r1
        ble     LAVI3
LAVI4:
        add     r0, r0, r12, lsl #1
LAVI5:
        ldrsh   r10, [r0], #2
        add     r12, r12, #1
        cmp     r12, lr
        add     r9, r9, r10
        blt     LAVI5
LAVI6:
        adds    r6, r6, r9
        adc     r5, r5, r9, asr #31
LAVI7:
        mvn     r12, #0xFF
        cmn     r7, #0xF
        bic     r9, r12, #0x7F, 24
        ble     LAVI12
        mov     r0, r6
        mov     r1, r5
        bl      __floatdidf
        mov     r10, r0
        mov     r0, r4
        mov     r4, r1
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r4
        bl      __divdf3
        tst     r5, r5
        mov     r4, r0
        mov     r10, r1
        eormi   r10, r10, #2, 2
        mov     r12, #0xFE, 12
        cmp     r7, #0
        orr     r11, r12, #3, 4
        bne     LAVI8
        mov     r1, r11
        mov     r2, r4
        mov     r3, r10
        mov     r0, #0
        bl      __adddf3
        mov     r4, r0
        mov     r7, r1
        b       LAVI9
LAVI8:
        cmp     r7, #0
        mov     r12, #1
        ble     LAVI16
        mov     r0, r12, lsl r7
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r10
        bl      __divdf3
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        mov     r4, r0
        mov     r7, r1
LAVI9:
        mov     r0, r4
        mov     r1, r7
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LAVI10
        mov     r0, r10
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        subeq   r10, r10, #1
LAVI10:
        orrs    r5, r6, r5, lsl #1
        tstcs   r5, #0
        mvn     r1, r9
        beq     LAVI14
        cmp     r1, r10
        mvnlt   r10, r9
        blt     LAVI11
        mov     r1, #0
        cmn     r10, #2, 18
        sub     r1, r1, #2, 18
        movlt   r10, r1
LAVI11:
        strh    r10, [r8]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVI12:
        orrs    r3, r6, r5
        moveq   r0, #0
        streqh  r0, [r8]
        beq     LAVI13
        orrs    r5, r6, r5, lsl #1
        tstcs   r5, #0
        moveq   r0, #0
        subeq   r9, r0, #2, 18
        mvnne   r9, r9
        strh    r9, [r8]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVI13:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVI14:
        rsb     r10, r10, #0
        cmp     r1, r10
        mvnlt   r10, r9
        blt     LAVI15
        mov     r0, #0
        cmn     r10, #2, 18
        sub     r0, r0, #2, 18
        movlt   r10, r0
LAVI15:
        strh    r10, [r8]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LAVI16:
        rsb     r7, r7, #0
        mov     r0, r12, lsl r7
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r10
        bl      __muldf3
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        mov     r4, r0
        mov     r7, r1
        b       LAVI9
LAVI17:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


