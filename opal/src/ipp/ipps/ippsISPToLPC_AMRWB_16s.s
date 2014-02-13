        .text
        .align  4
        .globl  _ippsISPToLPC_AMRWB_16s


_ippsISPToLPC_AMRWB_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB0
        add     lr, sp, #0x3C
        add     r12, sp, #0x78
        and     r4, lr, #0xF
        rsb     r5, r4, #0
        and     r12, r12, #0xF
        rsb     r4, r12, #0
        mov     r9, r0
        and     r12, r5, #0xF
        add     r3, sp, #0x3C
        add     lr, sp, #0x78
        and     r10, r4, #0xF
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        add     r6, r3, r12
        add     r5, lr, r10
        beq     LDIM41
        cmp     r8, #0
        beq     LDIM41
        cmp     r7, #0
        ble     LDIM42
        cmp     r7, #0x14
        bgt     LDIM42
        ldrsh   lr, [r9]
        mov     r4, r7, asr #1
        cmp     r4, #8
        rsb     lr, lr, #0
        ble     LDIM15
        mov     lr, lr, lsl #7
        str     lr, [r6, #4]
        mov     lr, #2, 12
        cmp     r4, #2
        str     lr, [r12, +r3]
        blt     LDIM6
        mov     r3, #2
        sub     r2, r6, #4
        str     r3, [sp, #0x38]
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x38]
        sub     r1, r6, #8
        mvn     r0, #2, 2
        mvn     r11, #0
        add     r12, r1, #8
        add     lr, r6, #8
        str     r1, [sp, #0x14]
        str     r5, [sp, #0x20]
        str     r10, [sp, #0x24]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x30]
LDIM0:
        ldr     r5, [r12], #4
        cmp     r2, #1
        str     r5, [lr], #4
        mov     r1, r2
        movle   r10, r3, lsl #1
        ble     LDIM4
        mov     r10, r3, lsl #1
        ldrsh   r7, [r9, +r10]
        add     r5, r6, r1, lsl #2
        str     r5, [sp, #4]
        ldr     r5, [sp, #0x14]
        mov     r8, #1
        str     r12, [sp, #8]
        add     r5, r5, r1, lsl #2
        str     r5, [sp]
        ldr     r5, [sp, #0x10]
        str     r3, [sp, #0x18]
        ldr     r3, [sp]
        ldr     r12, [sp, #4]
        add     r5, r5, r1, lsl #2
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     r9, [sp, #0x34]
LDIM1:
        ldr     r4, [r5], #-4
        mvn     lr, #0
        add     lr, lr, #2, 18
        and     lr, lr, r4, asr #1
        mul     lr, r7, lr
        mov     r6, r4, asr #16
        ldr     r4, [r12]
        mov     r6, r6, lsl #16
        mov     lr, lr, asr #15
        mov     r6, r6, asr #16
        mla     lr, r7, r6, lr
        mov     r6, lr, lsl #2
        subs    lr, r4, r6
        mov     r6, r6, asr #31
        rsc     r4, r6, r4, asr #31
        subs    r9, lr, r0
        sbcs    r6, r4, #0
        movlt   r9, #0
        movlt   r6, #0
        orrs    r6, r9, r6
        mvnne   lr, #2, 2
        bne     LDIM2
        cmp     lr, #2, 2
        sbcs    r4, r4, r11
        movlt   lr, #2, 2
LDIM2:
        str     lr, [r12]
        ldr     r6, [r3], #-4
        adds    r4, lr, r6
        mov     r6, r6, asr #31
        adc     lr, r6, lr, asr #31
        subs    r9, r4, r0
        sbcs    r6, lr, #0
        movlt   r9, #0
        movlt   r6, #0
        orrs    r6, r9, r6
        mvnne   r4, #2, 2
        bne     LDIM3
        cmp     r4, #2, 2
        sbcs    lr, lr, r11
        movlt   r4, #2, 2
LDIM3:
        add     r8, r8, #1
        str     r4, [r12], #-4
        cmp     r8, r2
        sub     r1, r1, #1
        blt     LDIM1
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x28]
        ldr     r9, [sp, #0x34]
LDIM4:
        ldrsh   r10, [r10, +r9]
        ldr     r5, [r6, +r1, lsl #2]
        mov     r1, r1, lsl #2
        mov     r10, r10, lsl #7
        subs    r7, r5, r10
        mov     r10, r10, asr #31
        rsc     r5, r10, r5, asr #31
        subs    r8, r7, r0
        sbcs    r10, r5, #0
        movlt   r8, #0
        movlt   r10, #0
        orrs    r10, r8, r10
        mvnne   r7, #2, 2
        bne     LDIM5
        cmp     r7, #2, 2
        sbcs    r5, r5, r11
        movlt   r7, #2, 2
LDIM5:
        add     r2, r2, #1
        cmp     r2, r4
        str     r7, [r6, +r1]
        add     r3, r3, #2
        ble     LDIM0
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LDIM6:
        mov     r2, r4
        mov     r1, r6
        mov     r0, #2
        bl      _ippsLShiftC_32s_I
        ldr     r12, [r6, +r4, lsl #2]
        mov     lr, r4, lsl #2
        mvn     r3, #2, 2
        cmn     r12, #0x1E, 4
        str     lr, [sp, #0x14]
        movgt   r12, r3
        bgt     LDIM7
        cmp     r12, #0xE, 4
        movge   r12, r12, lsl #2
        movlt   r12, #2, 2
LDIM7:
        str     r12, [r6, +r4, lsl #2]
        ldrsh   r12, [r9, #2]
        sub     r11, r4, #1
        cmp     r11, #2
        rsb     r12, r12, #0
        mov     lr, #2, 12
        mov     r12, r12, lsl #7
        str     r12, [r5, #4]
        add     r12, sp, #0x78
        str     lr, [r10, +r12]
        blt     LDIM14
        sub     r10, r5, #8
        add     r2, r10, #8
        str     r2, [sp, #0x24]
        add     r2, r5, #8
        str     r2, [sp, #0x38]
        add     r12, r9, #6
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x34]
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp, #0x38]
        sub     r1, r5, #4
        mov     r0, #2
        mvn     lr, #0
        str     r1, [sp, #0xC]
        str     r4, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x2C]
LDIM8:
        ldr     r2, [r8], #4
        cmp     r0, #1
        str     r2, [r9], #4
        mov     r7, r0
        ldrlesh r6, [r12]
        ble     LDIM12
        ldrsh   r6, [r12]
        add     r1, r10, r7, lsl #2
        str     r1, [sp, #4]
        ldr     r1, [sp, #0xC]
        mov     r4, #1
        add     r2, r5, r7, lsl #2
        add     r1, r1, r7, lsl #2
        str     r1, [sp]
        str     r12, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r12, [sp]
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x10]
        str     r11, [sp, #0x18]
        str     r5, [sp, #0x20]
LDIM9:
        ldr     r9, [r12], #-4
        mvn     r5, #0
        add     r5, r5, #2, 18
        and     r5, r5, r9, asr #1
        mul     r5, r6, r5
        mov     r10, r9, asr #16
        ldr     r9, [r2]
        mov     r10, r10, lsl #16
        mov     r5, r5, asr #15
        mov     r10, r10, asr #16
        mla     r5, r6, r10, r5
        mov     r10, r5, lsl #2
        subs    r5, r9, r10
        mov     r10, r10, asr #31
        rsc     r9, r10, r9, asr #31
        subs    r10, r5, r3
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r5, #2, 2
        bne     LDIM10
        cmp     r5, #2, 2
        sbcs    r9, r9, lr
        movlt   r5, #2, 2
LDIM10:
        str     r5, [r2]
        ldr     r10, [r1], #-4
        adds    r9, r5, r10
        mov     r10, r10, asr #31
        adc     r5, r10, r5, asr #31
        subs    r10, r9, r3
        sbcs    r11, r5, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r9, #2, 2
        bne     LDIM11
        cmp     r9, #2, 2
        sbcs    r5, r5, lr
        movlt   r9, #2, 2
LDIM11:
        add     r4, r4, #1
        str     r9, [r2], #-4
        cmp     r4, r0
        sub     r7, r7, #1
        blt     LDIM9
        ldr     r9, [sp, #0x38]
        ldr     r12, [sp, #8]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x20]
LDIM12:
        ldr     r2, [r5, +r7, lsl #2]
        mov     r6, r6, lsl #7
        mov     r7, r7, lsl #2
        subs    r4, r2, r6
        mov     r6, r6, asr #31
        rsc     r2, r6, r2, asr #31
        subs    r1, r4, r3
        sbcs    r6, r2, #0
        movlt   r1, #0
        movlt   r6, #0
        orrs    r6, r1, r6
        mvnne   r4, #2, 2
        bne     LDIM13
        cmp     r4, #2, 2
        sbcs    r2, r2, lr
        movlt   r4, #2, 2
LDIM13:
        add     r0, r0, #1
        cmp     r0, r11
        str     r4, [r5, +r7]
        add     r12, r12, #4
        ble     LDIM8
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x34]
LDIM14:
        mov     r2, r4
        mov     r1, r5
        mov     r0, #2
        bl      _ippsLShiftC_32s_I
        b       LDIM29
LDIM15:
        mov     lr, lr, lsl #9
        str     lr, [r6, #4]
        mov     lr, #2, 10
        cmp     r4, #2
        str     lr, [r12, +r3]
        blt     LDIM22
        sub     r1, r6, #8
        add     r2, r1, #8
        str     r2, [sp, #0x10]
        add     r2, r6, #8
        str     r2, [sp, #0xC]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        mov     r11, #2
        sub     r0, r6, #4
        mov     lr, r11
        mvn     r12, #2, 2
        mvn     r3, #0
        str     r0, [sp, #8]
        str     r5, [sp, #0x20]
        str     r10, [sp, #0x24]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x30]
LDIM16:
        ldr     r5, [r1], #4
        cmp     lr, #1
        str     r5, [r2], #4
        mov     r0, lr
        movle   r10, r11, lsl #1
        ble     LDIM20
        mov     r10, r11, lsl #1
        ldrsh   r7, [r9, +r10]
        add     r5, r6, r0, lsl #2
        str     r5, [sp, #0x14]
        ldr     r5, [sp, #4]
        mov     r8, #1
        str     r1, [sp, #0x10]
        add     r5, r5, r0, lsl #2
        str     r5, [sp, #0x18]
        ldr     r5, [sp, #8]
        str     r2, [sp, #0xC]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        add     r5, r5, r0, lsl #2
        str     r11, [sp]
        str     r4, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     r9, [sp, #0x34]
LDIM17:
        ldr     r6, [r5], #-4
        mvn     r4, #0
        add     r4, r4, #2, 18
        and     r4, r4, r6, asr #1
        mul     r4, r7, r4
        mov     r9, r6, asr #16
        ldr     r6, [r2]
        mov     r9, r9, lsl #16
        mov     r4, r4, asr #15
        mov     r9, r9, asr #16
        mla     r4, r7, r9, r4
        mov     r9, r4, lsl #2
        subs    r4, r6, r9
        mov     r9, r9, asr #31
        rsc     r6, r9, r6, asr #31
        subs    r11, r4, r12
        sbcs    r9, r6, #0
        movlt   r11, #0
        movlt   r9, #0
        orrs    r9, r11, r9
        mvnne   r4, #2, 2
        bne     LDIM18
        cmp     r4, #2, 2
        sbcs    r6, r6, r3
        movlt   r4, #2, 2
LDIM18:
        str     r4, [r2]
        ldr     r9, [r1], #-4
        adds    r6, r4, r9
        mov     r9, r9, asr #31
        adc     r4, r9, r4, asr #31
        subs    r11, r6, r12
        sbcs    r9, r4, #0
        movlt   r11, #0
        movlt   r9, #0
        orrs    r9, r11, r9
        mvnne   r6, #2, 2
        bne     LDIM19
        cmp     r6, #2, 2
        sbcs    r4, r4, r3
        movlt   r6, #2, 2
LDIM19:
        add     r8, r8, #1
        str     r6, [r2], #-4
        cmp     r8, lr
        sub     r0, r0, #1
        blt     LDIM17
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r11, [sp]
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x28]
        ldr     r9, [sp, #0x34]
LDIM20:
        ldrsh   r10, [r10, +r9]
        ldr     r5, [r6, +r0, lsl #2]
        mov     r0, r0, lsl #2
        mov     r10, r10, lsl #9
        subs    r7, r5, r10
        mov     r10, r10, asr #31
        rsc     r5, r10, r5, asr #31
        subs    r8, r7, r12
        sbcs    r10, r5, #0
        movlt   r8, #0
        movlt   r10, #0
        orrs    r10, r8, r10
        mvnne   r7, #2, 2
        bne     LDIM21
        cmp     r7, #2, 2
        sbcs    r5, r5, r3
        movlt   r7, #2, 2
LDIM21:
        add     lr, lr, #1
        cmp     lr, r4
        str     r7, [r6, +r0]
        add     r11, r11, #2
        ble     LDIM16
        ldr     r5, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LDIM22:
        ldrsh   r3, [r9, #2]
        sub     r11, r4, #1
        cmp     r11, #2
        rsb     r3, r3, #0
        mov     lr, #2, 10
        add     r12, sp, #0x78
        mov     r3, r3, lsl #9
        str     lr, [r10, +r12]
        str     r3, [r5, #4]
        movlt   r3, r4, lsl #2
        strlt   r3, [sp, #0x14]
        blt     LDIM29
        sub     r3, r5, #4
        sub     r1, r5, #8
        str     r3, [sp, #0x38]
        mov     r2, #2
        mvn     r0, #2, 2
        mvn     r10, #0
        add     lr, r9, #6
        add     r3, r1, #8
        add     r12, r5, #8
        str     r4, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x34]
LDIM23:
        ldr     r4, [r3], #4
        cmp     r2, #1
        str     r4, [r12], #4
        mov     r9, r2
        ldrlesh r8, [lr]
        ble     LDIM27
        ldrsh   r8, [lr]
        add     r4, r1, r9, lsl #2
        str     r4, [sp, #0xC]
        ldr     r4, [sp, #0x38]
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0xC]
        mov     r7, #1
        add     r6, r5, r9, lsl #2
        add     r4, r4, r9, lsl #2
        str     r12, [sp, #0x10]
        str     lr, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r5, [sp, #0x20]
LDIM24:
        ldr     lr, [r4], #-4
        mvn     r12, #0
        add     r12, r12, #2, 18
        and     r12, r12, lr, asr #1
        mul     r12, r8, r12
        mov     r5, lr, asr #16
        ldr     lr, [r6]
        mov     r5, r5, lsl #16
        mov     r12, r12, asr #15
        mov     r5, r5, asr #16
        mla     r12, r8, r5, r12
        mov     r5, r12, lsl #2
        subs    r12, lr, r5
        mov     r5, r5, asr #31
        rsc     lr, r5, lr, asr #31
        subs    r5, r12, r0
        sbcs    r11, lr, #0
        movlt   r5, #0
        movlt   r11, #0
        orrs    r11, r5, r11
        mvnne   r12, #2, 2
        bne     LDIM25
        cmp     r12, #2, 2
        sbcs    lr, lr, r10
        movlt   r12, #2, 2
LDIM25:
        str     r12, [r6]
        ldr     r5, [r1], #-4
        adds    lr, r12, r5
        mov     r5, r5, asr #31
        adc     r12, r5, r12, asr #31
        subs    r5, lr, r0
        sbcs    r11, r12, #0
        movlt   r5, #0
        movlt   r11, #0
        orrs    r11, r5, r11
        mvnne   lr, #2, 2
        bne     LDIM26
        cmp     lr, #2, 2
        sbcs    r12, r12, r10
        movlt   lr, #2, 2
LDIM26:
        add     r7, r7, #1
        str     lr, [r6], #-4
        cmp     r7, r2
        sub     r9, r9, #1
        blt     LDIM24
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r1, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        ldr     r5, [sp, #0x20]
LDIM27:
        ldr     r4, [r5, +r9, lsl #2]
        mov     r8, r8, lsl #9
        mov     r9, r9, lsl #2
        subs    r6, r4, r8
        mov     r8, r8, asr #31
        rsc     r4, r8, r4, asr #31
        subs    r8, r6, r0
        sbcs    r7, r4, #0
        movlt   r8, #0
        movlt   r7, #0
        orrs    r7, r8, r7
        mvnne   r6, #2, 2
        bne     LDIM28
        cmp     r6, #2, 2
        sbcs    r4, r4, r10
        movlt   r6, #2, 2
LDIM28:
        add     r2, r2, #1
        cmp     r2, r11
        str     r6, [r5, +r9]
        add     lr, lr, #4
        ble     LDIM23
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        ldr     r9, [sp, #0x34]
        mov     r3, r4, lsl #2
        str     r3, [sp, #0x14]
LDIM29:
        cmp     r11, #1
        ble     LDIM33
        sub     r3, r11, #1
        cmp     r3, #6
        sublt   r12, r5, #8
        blt     LDIM31
        mov     r3, r11, lsl #2
        sub     r3, r3, #4
        sub     r12, r5, #8
        add     lr, r3, r5
        add     r3, r3, r12
LDIM30:
        ldr     r10, [lr, #4]
        ldr     r0, [r3, #4]
        sub     r11, r11, #5
        cmp     r11, #7
        sub     r10, r10, r0
        str     r10, [lr, #4]
        ldr     r10, [lr]
        ldr     r0, [r3]
        sub     r10, r10, r0
        str     r10, [lr]
        ldr     r10, [lr, #-4]
        ldr     r0, [r3, #-4]
        sub     r10, r10, r0
        str     r10, [lr, #-4]
        ldr     r10, [lr, #-8]
        ldr     r0, [r3, #-8]
        sub     r10, r10, r0
        str     r10, [lr, #-8]
        ldr     r10, [lr, #-0xC]
        ldr     r0, [r3, #-0xC]
        sub     r3, r3, #0x14
        sub     r10, r10, r0
        str     r10, [lr, #-0xC]
        sub     lr, lr, #0x14
        bge     LDIM30
LDIM31:
        add     r3, r5, r11, lsl #2
LDIM32:
        ldr     r10, [r3]
        ldr     lr, [r12, +r11, lsl #2]
        sub     r11, r11, #1
        cmp     r11, #1
        sub     r10, r10, lr
        str     r10, [r3], #-4
        bgt     LDIM32
LDIM33:
        cmp     r4, #0
        suble   r9, r9, #2
        movle   r3, r7, lsl #1
        ble     LDIM36
        sub     r9, r9, #2
        mov     r3, r7, lsl #1
        ldrsh   r1, [r9, +r3]
        mvn     r11, #2, 2
        mvn     r10, #0
        mov     r0, r6
        mov     lr, r5
        mov     r12, r4
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x2C]
        str     r8, [sp, #0x30]
LDIM34:
        ldr     r7, [r0]
        mvn     r6, #0
        add     r6, r6, #2, 18
        and     r6, r6, r7, asr #1
        mul     r6, r6, r1
        mov     r8, r7, asr #16
        mov     r8, r8, lsl #16
        mov     r6, r6, asr #15
        mov     r8, r8, asr #16
        mla     r6, r8, r1, r6
        mov     r8, r6, lsl #1
        adds    r6, r7, r8
        mov     r8, r8, asr #31
        adc     r7, r8, r7, asr #31
        subs    r2, r6, r11
        sbcs    r8, r7, #0
        movlt   r2, #0
        movlt   r8, #0
        orrs    r8, r2, r8
        mvnne   r6, #2, 2
        bne     LDIM35
        cmp     r6, #2, 2
        sbcs    r7, r7, r10
        movlt   r6, #2, 2
LDIM35:
        ldr     r8, [lr]
        mvn     r7, #0
        add     r7, r7, #2, 18
        and     r7, r7, r8, asr #1
        mul     r7, r7, r1
        mov     r2, r8, asr #16
        str     r6, [r0], #4
        mov     r6, r2, lsl #16
        mov     r7, r7, asr #15
        mov     r6, r6, asr #16
        mla     r7, r6, r1, r7
        subs    r12, r12, #1
        sub     r8, r8, r7, lsl #1
        str     r8, [lr], #4
        bne     LDIM34
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LDIM36:
        mov     r0, #1, 20
        cmp     r4, #1
        strh    r0, [r8]
        sub     r7, r7, #1
        ble     LDIM39
        add     r0, r8, r7, lsl #1
        add     r5, r5, #4
        mvn     r11, #2, 2
        mvn     r10, #0
        add     r12, r6, #4
        add     r7, r8, #2
        sub     lr, r4, #1
        str     r3, [sp, #0x34]
        str     r4, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     r8, [sp, #0x30]
LDIM37:
        ldr     r3, [r5], #4
        ldr     r4, [r12], #4
        mov     r1, r3, asr #31
        adds    r2, r4, r3
        adc     r1, r1, r4, asr #31
        subs    r6, r2, r11
        sbcs    r8, r1, #0
        movlt   r6, #0
        movlt   r8, #0
        orrs    r8, r6, r8
        mvnne   r2, #2, 2
        bne     LDIM38
        cmp     r2, #2, 2
        sbcs    r1, r1, r10
        movlt   r2, #2, 2
LDIM38:
        sub     r4, r4, r3
        add     r2, r2, #2, 22
        add     r4, r4, #2, 22
        mov     r2, r2, asr #12
        strh    r2, [r7], #2
        mov     r4, r4, asr #12
        strh    r4, [r0], #-2
        subs    lr, lr, #1
        bne     LDIM37
        ldr     r3, [sp, #0x34]
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x28]
        ldr     r8, [sp, #0x30]
LDIM39:
        ldr     r0, [sp, #0x14]
        mvn     lr, #0
        add     r12, lr, #2, 18
        ldr     r6, [r0, +r6]
        ldrsh   r0, [r3, +r9]
        and     r12, r12, r6, asr #1
        mul     r12, r12, r0
        mov     r5, r6, asr #16
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        mov     r12, r12, asr #15
        mla     r0, r5, r0, r12
        mvn     r12, #2, 2
        mov     r5, r0, lsl #1
        adds    r0, r6, r5
        mov     r5, r5, asr #31
        adc     r6, r5, r6, asr #31
        subs    r7, r0, r12
        sbcs    r5, r6, #0
        movlt   r7, #0
        movlt   r5, #0
        orrs    r5, r7, r5
        movne   r0, r12
        bne     LDIM40
        cmp     r0, #2, 2
        sbcs    r6, r6, lr
        movlt   r0, #2, 2
LDIM40:
        add     r0, r0, #2, 22
        mov     r4, r4, lsl #1
        mov     r0, r0, asr #12
        strh    r0, [r8, +r4]
        ldrsh   r9, [r3, +r9]
        mov     r0, #0
        add     r2, r9, #4
        mov     r2, r2, asr #3
        strh    r2, [r8, +r3]
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LDIM41:
        mvn     r0, #7
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}
LDIM42:
        mvn     r0, #5
        add     sp, sp, #0xB0
        ldmia   sp!, {r4 - r11, pc}


