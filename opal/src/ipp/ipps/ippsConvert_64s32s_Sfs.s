        .text
        .align  4
        .globl  _ippsConvert_64s32s_Sfs


_ippsConvert_64s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r12, [sp, #0x44]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LCVX22
        cmp     r4, #0
        beq     LCVX22
        cmp     r6, #0
        ble     LCVX21
        cmp     r12, #0x1F
        mvn     r8, #2, 2
        mvn     r9, #0
        mov     r7, #0
        mov     r10, #0x3F
        ble     LCVX0
        cmp     r3, #1
        beq     LCVX12
        b       LCVX4
LCVX0:
        cmp     r12, #0
        mov     r11, #2, 2
        bne     LCVX3
        cmp     r6, #0
        ble     LCVX11
LCVX1:
        ldr     r3, [r5]
        ldr     r12, [r5, #4]
        subs    r10, r3, r8
        sbcs    lr, r12, #0
        movlt   r10, #0
        movlt   lr, #0
        orrs    lr, r10, lr
        movne   r3, r8
        bne     LCVX2
        cmp     r3, #2, 2
        sbcs    r12, r12, r9
        movlt   r3, #2, 2
LCVX2:
        add     r7, r7, #1
        str     r3, [r4], #4
        cmp     r7, r6
        add     r5, r5, #8
        blt     LCVX1
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCVX3:
        cmp     r12, #0
        ble     LCVX7
        cmp     r3, #1
        beq     LCVX16
LCVX4:
        cmp     r12, #0x3F
        movlt   r10, r12
        cmp     r6, #0
        ble     LCVX11
        mov     r11, r10, asr #31
LCVX5:
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        mov     r3, r11
        mov     r2, r10
        bl      __ashrdi3
        subs    r12, r0, r8
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r0, r8
        bne     LCVX6
        cmp     r0, #2, 2
        sbcs    r1, r1, r9
        movlt   r0, #2, 2
LCVX6:
        add     r7, r7, #1
        str     r0, [r4], #4
        cmp     r7, r6
        add     r5, r5, #8
        blt     LCVX5
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCVX7:
        mvn     r3, #0x1E
        cmp     r12, r3
        movgt   r3, r12
        cmp     r6, #0
        rsb     r9, r3, #0
        ble     LCVX11
LCVX8:
        ldr     r1, [r5, #4]
        ldr     r0, [r5]
        tst     r1, r1
        bmi     LCVX19
        mov     r12, r8, asr r9
        subs    r3, r0, r12
        sbcs    r12, r1, r12, asr #31
        movlt   r3, #0
        movlt   r12, #0
        orrs    r12, r3, r12
        movne   r0, r8
        bne     LCVX9
        mov     r3, r9, asr #31
        mov     r2, r9
        bl      __ashldi3
LCVX9:
        str     r0, [r4]
LCVX10:
        add     r7, r7, #1
        cmp     r7, r6
        add     r5, r5, #8
        add     r4, r4, #4
        blt     LCVX8
LCVX11:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCVX12:
        cmp     r12, #0x3F
        movlt   r10, r12
        sub     r2, r10, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        cmp     r6, #0
        ble     LCVX15
        adds    r12, r0, r9
        adc     r3, r1, r9
        orr     r12, r0, r12
        orr     lr, r1, r3
        mov     r7, r10, asr #31
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r1, [sp, #4]
        str     r0, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r8, [sp, #8]
        str     r4, [sp]
LCVX13:
        ldr     r12, [sp, #0x10]
        ldr     r0, [r5]
        ldr     lr, [sp, #0x14]
        ldr     r1, [r5, #4]
        mov     r2, r10
        and     r12, r0, r12
        adds    r11, lr, r12
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #4]
        mov     r3, r7
        and     r12, r1, r12
        adc     r9, lr, r12
        bl      __ashrdi3
        mov     r8, r0
        and     r12, r8, #1
        adds    r11, r11, r12
        mvn     r12, #0
        adc     r9, r9, #0
        adds    r0, r11, r12
        mov     r4, r1
        adc     r1, r9, r12
        mov     r3, r7
        mov     r2, r10
        bl      __ashrdi3
        adds    r8, r8, r0
        adc     r4, r4, r1
        ldr     r1, [sp, #8]
        subs    r1, r8, r1
        sbcs    r12, r4, #0
        movlt   r1, #0
        movlt   r12, #0
        orrs    r12, r1, r12
        mvnne   r8, #2, 2
        bne     LCVX14
        ldr     r1, [sp, #0x18]
        cmp     r8, #2, 2
        sbcs    r4, r4, r1
        movlt   r8, #2, 2
LCVX14:
        ldr     r1, [sp]
        subs    r6, r6, #1
        add     r5, r5, #8
        str     r8, [r1], #4
        str     r1, [sp]
        bne     LCVX13
LCVX15:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCVX16:
        sub     lr, r12, #1
        mov     r3, #1
        cmp     r6, #0
        mov     r11, r3, lsl lr
        ble     LCVX11
        sub     r3, r11, #1
        orr     r10, r11, r3
        str     r6, [sp, #0x1C]
        mov     r3, r12, asr #31
        mov     r6, r4
        str     r3, [sp, #0x14]
        str     r9, [sp, #0x18]
        mov     r4, r12
LCVX17:
        ldr     r0, [r5]
        ldr     r3, [sp, #0x14]
        ldr     r1, [r5, #4]
        and     lr, r0, r10
        mov     r2, r4
        add     r9, r11, lr
        bl      __ashrdi3
        and     r3, r0, #1
        add     r3, r9, r3
        sub     r3, r3, #1
        adds    r3, r0, r3, lsr r4
        adc     r1, r1, #0
        subs    lr, r3, r8
        sbcs    r9, r1, #0
        movlt   lr, #0
        movlt   r9, #0
        orrs    r9, lr, r9
        movne   r3, r8
        bne     LCVX18
        ldr     lr, [sp, #0x18]
        cmp     r3, #2, 2
        sbcs    r1, r1, lr
        movlt   r3, #2, 2
LCVX18:
        str     r3, [r6], #4
        ldr     r3, [sp, #0x1C]
        add     r7, r7, #1
        cmp     r7, r3
        add     r5, r5, #8
        blt     LCVX17
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCVX19:
        mov     r3, r11, asr r9
        cmp     r0, r3
        sbcs    r3, r1, r3, asr #31
        movlt   r0, #2, 2
        blt     LCVX20
        mov     r3, r9, asr #31
        mov     r2, r9
        bl      __ashldi3
LCVX20:
        str     r0, [r4]
        b       LCVX10
LCVX21:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCVX22:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


