        .text
        .align  4
        .globl  _ippsDotProd_16sc_Sfs


_ippsDotProd_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r6, [sp, #0x38]
        cmp     r0, #0
        mov     r8, r3
        beq     LCGC9
        cmp     r1, #0
        beq     LCGC9
        cmp     r8, #0
        beq     LCGC9
        cmp     r2, #0
        ble     LCGC5
        add     r3, sp, #4
        bl      ownps_DotProd_16sc16sc
        cmp     r6, #0
        mvn     r11, #0
        bne     LCGC2
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        add     r2, r11, #2, 18
        subs    r2, r0, r2
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        addne   r0, r11, #2, 18
        bne     LCGC0
        cmp     r0, r11, lsl #15
        sbcs    r1, r1, r11
        movlt   r0, r11, lsl #15
LCGC0:
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        strh    r0, [r8]
        add     r0, r11, #2, 18
        subs    r0, r1, r0
        sbcs    r12, r2, #0
        movlt   r0, #0
        movlt   r12, #0
        orrs    r12, r0, r12
        addne   r1, r11, #2, 18
        bne     LCGC1
        cmp     r1, r11, lsl #15
        sbcs    r2, r2, r11
        movlt   r1, r11, lsl #15
LCGC1:
        strh    r1, [r8, #2]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGC2:
        cmp     r6, #0
        ble     LCGC6
        ldr     r0, [sp, #4]
        cmp     r6, #0x1F
        mov     r5, #0x1F
        movlt   r5, r6
        ldr     r4, [sp, #8]
        sub     r2, r5, #1
        str     r0, [sp]
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        mov     r9, r0
        ldr     r0, [sp]
        mov     r10, r1
        mov     r7, r5, asr #31
        adds    r12, r9, r0
        str     r12, [sp]
        mov     r1, r4
        mov     r2, r5
        mov     r3, r7
        adc     r4, r10, r4
        bl      __ashrdi3
        ldr     lr, [sp]
        and     r12, r0, #1
        adds    r12, lr, r12
        adc     r4, r4, #0
        adds    r0, r12, r11
        adc     r1, r4, r11
        mov     r4, r6, asr #31
        mov     r2, r6
        mov     r3, r4
        bl      __ashrdi3
        add     r12, r11, #2, 18
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        addne   r0, r11, #2, 18
        bne     LCGC3
        cmp     r0, r11, lsl #15
        sbcs    r1, r1, r11
        movlt   r0, r11, lsl #15
LCGC3:
        ldr     r12, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        strh    r0, [r8]
        adds    r9, r12, r9
        mov     r0, r12
        adc     r10, r1, r10
        mov     r2, r5
        mov     r3, r7
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r10, r10, #0
        adds    r0, r0, r11
        adc     r1, r10, r11
        mov     r2, r6
        mov     r3, r4
        bl      __ashrdi3
        add     r2, r11, #2, 18
        subs    r2, r0, r2
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        addne   r0, r11, #2, 18
        bne     LCGC4
        cmp     r0, r11, lsl #15
        sbcs    r1, r1, r11
        movlt   r0, r11, lsl #15
LCGC4:
        strh    r0, [r8, #2]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGC5:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGC6:
        mvn     r0, #0xE
        cmp     r6, r0
        movgt   r0, r6
        rsb     r4, r0, #0
        cmp     r4, #0x10
        mov     r5, #0
        movge   r12, r5
        movlt   r0, r11, lsl #15
        movlt   r12, r0, asr r4
        ldr     r0, [sp, #4]
        ldr     r1, [sp, #8]
        add     lr, r11, #2, 18
        mov     r6, lr, asr r4
        subs    lr, r0, r6
        sbcs    r7, r1, r6, asr #31
        movlt   lr, #0
        movlt   r7, #0
        orrs    r7, lr, r7
        addne   r0, r11, #2, 18
        bne     LCGC7
        cmp     r0, r12
        sbcs    r12, r1, r12, asr #31
        movlt   r0, r11, lsl #15
        blt     LCGC7
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LCGC7:
        cmp     r4, #0x10
        strh    r0, [r8]
        movlt   r0, r11, lsl #15
        movlt   r5, r0, asr r4
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        subs    r12, r0, r6
        sbcs    r6, r1, r6, asr #31
        movlt   r12, #0
        movlt   r6, #0
        orrs    r6, r12, r6
        addne   r0, r11, #2, 18
        bne     LCGC8
        cmp     r0, r5
        sbcs    r5, r1, r5, asr #31
        movlt   r0, r11, lsl #15
        blt     LCGC8
        mov     r3, r4, asr #31
        mov     r2, r4
        bl      __ashldi3
LCGC8:
        strh    r0, [r8, #2]
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCGC9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


