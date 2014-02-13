        .text
        .align  4
        .globl  _ippsDotProd_16sc32sc_Sfs


_ippsDotProd_16sc32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r6, [sp, #0x3C]
        cmp     r0, #0
        mov     r10, r3
        beq     LCGD9
        cmp     r1, #0
        beq     LCGD9
        cmp     r10, #0
        beq     LCGD9
        cmp     r2, #0
        ble     LCGD5
        add     r3, sp, #8
        bl      ownps_DotProd_16sc16sc
        cmp     r6, #0
        mvn     r9, #2, 2
        mvn     r11, #0
        mov     r4, #2, 2
        bne     LCGD2
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0xC]
        subs    r12, r1, r9
        sbcs    lr, r2, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r1, r9
        bne     LCGD0
        cmp     r1, #2, 2
        sbcs    r2, r2, r11
        movlt   r1, #2, 2
LCGD0:
        ldr     r2, [sp, #0x10]
        ldr     r12, [sp, #0x14]
        str     r1, [r10]
        subs    r1, r2, r9
        sbcs    lr, r12, #0
        movlt   r1, #0
        movlt   lr, #0
        orrs    lr, r1, lr
        movne   r2, r9
        bne     LCGD1
        cmp     r2, #2, 2
        sbcs    r12, r12, r11
        movlt   r2, #2, 2
LCGD1:
        str     r2, [r10, #4]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCGD2:
        cmp     r6, #0
        ble     LCGD6
        ldr     r1, [sp, #8]
        cmp     r6, #0x1F
        mov     r4, #0x1F
        str     r1, [sp]
        ldr     r1, [sp, #0xC]
        movlt   r4, r6
        sub     r2, r4, #1
        str     r1, [sp, #4]
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mov     r7, r0
        ldr     r0, [sp]
        mov     r8, r1
        ldr     r1, [sp, #4]
        adds    r12, r7, r0
        str     r12, [sp]
        adc     r12, r8, r1
        str     r12, [sp, #4]
        mov     r5, r4, asr #31
        mov     r2, r4
        mov     r3, r5
        bl      __ashrdi3
        ldr     lr, [sp]
        and     r12, r0, #1
        adds    lr, lr, r12
        ldr     r12, [sp, #4]
        mov     r3, r6, asr #31
        str     r3, [sp]
        mov     r2, r6
        adc     r12, r12, #0
        adds    r0, lr, r11
        adc     r1, r12, r11
        bl      __ashrdi3
        subs    r12, r0, r9
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        movne   r0, r9
        bne     LCGD3
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, #2, 2
LCGD3:
        str     r0, [r10]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        mov     r2, r4
        adds    r7, r0, r7
        mov     r3, r5
        adc     r8, r1, r8
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r7, r0
        ldr     r3, [sp]
        adc     r8, r8, #0
        adds    r0, r0, r11
        adc     r1, r8, r11
        mov     r2, r6
        bl      __ashrdi3
        subs    r2, r0, r9
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        movne   r0, r9
        bne     LCGD4
        cmp     r0, #2, 2
        sbcs    r1, r1, r11
        movlt   r0, #2, 2
LCGD4:
        str     r0, [r10, #4]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCGD5:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCGD6:
        mvn     r1, #0x1E
        cmp     r6, r1
        movgt   r1, r6
        rsb     r5, r1, #0
        cmp     r5, #0x20
        mov     r7, #0
        movge   r12, r7
        movlt   r12, r4, asr r5
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        mov     r6, r9, asr r5
        subs    lr, r0, r6
        sbcs    r8, r1, r6, asr #31
        movlt   lr, #0
        movlt   r8, #0
        orrs    r8, lr, r8
        movne   r0, r9
        bne     LCGD7
        cmp     r0, r12
        sbcs    r12, r1, r12, asr #31
        movlt   r0, #2, 2
        blt     LCGD7
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
LCGD7:
        cmp     r5, #0x20
        str     r0, [r10]
        movlt   r7, r4, asr r5
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        subs    r12, r0, r6
        sbcs    r6, r1, r6, asr #31
        movlt   r12, #0
        movlt   r6, #0
        orrs    r6, r12, r6
        bne     LCGD8
        cmp     r0, r7
        sbcs    r7, r1, r7, asr #31
        movlt   r9, #2, 2
        blt     LCGD8
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashldi3
        mov     r9, r0
LCGD8:
        str     r9, [r10, #4]
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCGD9:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


