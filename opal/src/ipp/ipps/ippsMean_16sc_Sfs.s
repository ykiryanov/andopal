        .text
        .align  4
        .globl  _ippsMean_16sc_Sfs


_ippsMean_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        mov     r6, r2
        mov     r7, r3
        beq     LAVH24
        cmp     r6, #0
        beq     LAVH24
        cmp     r1, #0
        ble     LAVH25
        mov     r10, r1, asr #16
        cmp     r10, #0
        ble     LAVH23
        mov     r5, #0
        mov     r4, r5
        mov     r8, r4
        mov     r9, r8
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
        str     r1, [sp, #4]
LAVH0:
        mov     r3, #0
        mov     r2, r3
        mov     lr, r2
        sub     r12, r0, #2
        str     r9, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x10]
        str     r0, [sp]
LAVH1:
        ldrsh   r6, [r12, #4]
        ldrsh   r1, [r12, #2]
        ldrsh   r7, [r12, #6]
        ldrsh   r8, [r12, #8]
        ldrsh   r9, [r12, #0xA]
        ldrsh   r10, [r12, #0xC]
        ldrsh   r11, [r12, #0xE]
        ldrsh   r0, [r12, #0x10]!
        add     r3, r3, r1
        add     r6, r2, r6
        add     r7, r3, r7
        add     r8, r6, r8
        add     lr, lr, #4
        add     r9, r7, r9
        add     r10, r8, r10
        cmp     lr, #1, 16
        add     r3, r9, r11
        add     r2, r10, r0
        blt     LAVH1
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        ldr     r0, [sp]
        adds    r5, r5, r3
        adc     r4, r4, r3, asr #31
        adds    r8, r8, r2
        adc     r9, r9, r2, asr #31
        subs    r10, r10, #1
        bne     LAVH0
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r1, [sp, #4]
LAVH2:
        bic     r12, r1, #0xFF, 8
        bics    r3, r12, #0xFF, 16
        beq     LAVH7
        cmp     r3, #0
        mov     r2, #0
        movle   r12, r2
        movle   lr, r12
        ble     LAVH6
        cmp     r3, #6
        movlt   r12, r2
        movlt   lr, r12
        blt     LAVH4
        mov     r12, r2
        mov     lr, r12
        sub     r11, r3, #6
        sub     r10, r0, #2
        str     r5, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r3, [sp, #0x10]
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LAVH3:
        ldrsh   r9, [r10, #4]
        ldrsh   r1, [r10, #2]
        ldrsh   r6, [r10, #6]
        ldrsh   r3, [r10, #8]
        ldrsh   r0, [r10, #0xA]
        ldrsh   r8, [r10, #0xC]
        ldrsh   r5, [r10, #0xE]
        ldrsh   r7, [r10, #0x10]
        add     r9, r9, lr
        add     r12, r12, r1
        ldrsh   r1, [r10, #0x12]
        ldrsh   lr, [r10, #0x14]!
        add     r9, r3, r9
        add     r6, r12, r6
        add     r9, r8, r9
        add     r0, r6, r0
        add     r2, r2, #5
        add     r5, r0, r5
        add     r9, r7, r9
        cmp     r2, r11
        add     r12, r5, r1
        add     lr, lr, r9
        ble     LAVH3
        ldr     r5, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAVH4:
        mov     r10, r2, lsl #2
        sub     r10, r10, #2
        add     r0, r10, r0
LAVH5:
        ldrsh   r10, [r0, #2]
        add     r2, r2, #1
        cmp     r2, r3
        add     r12, r12, r10
        ldrsh   r10, [r0, #4]!
        add     lr, r10, lr
        blt     LAVH5
LAVH6:
        adds    r5, r5, r12
        adc     r4, r4, r12, asr #31
        adds    r8, r8, lr
        adc     r9, r9, lr, asr #31
LAVH7:
        cmn     r7, #0xF
        ble     LAVH15
        mov     r0, r1
        bl      __floatsidf
        mov     r10, r0
        mov     r11, r1
        mov     r0, r5
        mov     r1, r4
        bl      __floatdidf
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #4]
        mov     r0, r8
        mov     r1, r9
        bl      __floatdidf
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        tst     r4, r4
        mov     r10, r0
        mov     r11, r1
        bmi     LAVH22
LAVH8:
        tst     r9, r9
        eormi   r11, r11, #2, 2
        cmp     r7, #0
        bne     LAVH9
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #4]
        mov     r12, #0xFE, 12
        orr     r7, r12, #3, 4
        mov     r1, r7
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
        mov     r1, r7
        mov     r2, r10
        mov     r3, r11
        mov     r0, #0
        bl      __adddf3
        str     r0, [sp, #4]
        mov     r7, r1
        b       LAVH10
LAVH9:
        cmp     r7, #0
        mov     r12, #1
        ble     LAVH21
        mov     r0, r12, lsl r7
        bl      __floatsidf
        str     r0, [sp]
        mov     r7, r1
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp]
        mov     r3, r7
        bl      __divdf3
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        str     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        ldr     r2, [sp]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r3, r7
        mov     r0, r10
        mov     r1, r11
        bl      __divdf3
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        str     r0, [sp, #4]
        mov     r7, r1
LAVH10:
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        bl      __fixdfsi
        mov     r11, r0
        ldr     r0, [sp, #4]
        mov     r1, r7
        bl      __fixdfsi
        tst     r11, #1
        mov     r10, r0
        beq     LAVH11
        mov     r0, r11
        bl      __floatsidf
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LAVH11:
        tst     r10, #1
        beq     LAVH12
        mov     r0, r10
        bl      __floatsidf
        ldr     r2, [sp, #4]
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        subeq   r10, r10, #1
LAVH12:
        orrs    r4, r5, r4, lsl #1
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        tstcs   r4, #0
        mov     r12, #0
        mvn     lr, r3
        beq     LAVH20
        cmp     lr, r11
        mvnlt   r11, r3
        blt     LAVH13
        cmn     r11, #2, 18
        sub     lr, r12, #2, 18
        movlt   r11, lr
LAVH13:
        orrs    r9, r8, r9, lsl #1
        tstcs   r9, #0
        strh    r11, [r6]
        mvn     r1, r3
        beq     LAVH18
        cmp     r1, r10
        mvnlt   r10, r3
        blt     LAVH14
        cmn     r10, #2, 18
        sub     r12, r12, #2, 18
        movlt   r10, r12
LAVH14:
        strh    r10, [r6, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVH15:
        mvn     r3, #0xFF
        orrs    lr, r5, r4
        bic     r3, r3, #0x7F, 24
        mov     r12, #0
        streqh  r12, [r6]
        beq     LAVH16
        orrs    r4, r5, r4, lsl #1
        tstcs   r4, #0
        subeq   lr, r12, #2, 18
        mvnne   lr, r3
        strh    lr, [r6]
LAVH16:
        orrs    lr, r8, r9
        streqh  r12, [r6, #2]
        beq     LAVH17
        orrs    r9, r8, r9, lsl #1
        tstcs   r9, #0
        subeq   r3, r12, #2, 18
        mvnne   r3, r3
        strh    r3, [r6, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVH17:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVH18:
        rsb     r10, r10, #0
        cmp     r1, r10
        mvnlt   r10, r3
        blt     LAVH19
        cmn     r10, #2, 18
        sub     r12, r12, #2, 18
        movlt   r10, r12
LAVH19:
        strh    r10, [r6, #2]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVH20:
        rsb     r11, r11, #0
        cmp     lr, r11
        mvnlt   r11, r3
        blt     LAVH13
        cmn     r11, #2, 18
        sub     lr, r12, #2, 18
        movlt   r11, lr
        b       LAVH13
LAVH21:
        rsb     r7, r7, #0
        mov     r0, r12, lsl r7
        bl      __floatsidf
        str     r1, [sp]
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp]
        mov     r7, r0
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        str     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        ldr     r3, [sp]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r2, r7
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r3, [sp, #4]
        mov     r2, #0
        bl      __adddf3
        str     r0, [sp, #4]
        mov     r7, r1
        b       LAVH10
LAVH22:
        ldr     r12, [sp, #4]
        eor     r12, r12, #2, 2
        str     r12, [sp, #4]
        b       LAVH8
LAVH23:
        mov     r5, #0
        mov     r4, r5
        mov     r8, r4
        mov     r9, r8
        b       LAVH2
LAVH24:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAVH25:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


