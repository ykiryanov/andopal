        .text
        .align  4
        .globl  _ippsDotProd_16s_Sfs


_ippsDotProd_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r7, [sp, #0x2C]
        cmp     r0, #0
        mov     r4, r3
        beq     LCGF6
        cmp     r1, #0
        beq     LCGF6
        cmp     r4, #0
        beq     LCGF6
        cmp     r2, #0
        ble     LCGF3
        mov     r3, sp
        bl      ownps_DotProd_16s16s
        cmp     r7, #0
        mvn     r5, #0
        bne     LCGF1
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     r2, r5, #2, 18
        subs    r2, r0, r2
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        addne   r0, r5, #2, 18
        bne     LCGF0
        cmp     r0, r5, lsl #15
        sbcs    r1, r1, r5
        movlt   r0, r5, lsl #15
LCGF0:
        strh    r0, [r4]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCGF1:
        cmp     r7, #0
        ble     LCGF4
        cmp     r7, #0x1F
        mov     r6, #0x1F
        movlt   r6, r7
        ldr     r10, [sp]
        ldr     r8, [sp, #4]
        sub     r2, r6, #1
        mov     r0, #1
        mov     r3, r2, asr #31
        mov     r1, #0
        bl      __ashldi3
        adds    r9, r10, r0
        mov     r3, r6, asr #31
        adc     r11, r8, r1
        mov     r0, r10
        mov     r1, r8
        mov     r2, r6
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r9, r0
        adc     r11, r11, #0
        adds    r0, r0, r5
        adc     r1, r11, r5
        mov     r3, r7, asr #31
        mov     r2, r7
        bl      __ashrdi3
        add     r2, r5, #2, 18
        subs    r2, r0, r2
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        addne   r0, r5, #2, 18
        bne     LCGF2
        cmp     r0, r5, lsl #15
        sbcs    r1, r1, r5
        movlt   r0, r5, lsl #15
LCGF2:
        strh    r0, [r4]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCGF3:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCGF4:
        mvn     r0, #0xE
        cmp     r7, r0
        movgt   r0, r7
        rsb     r2, r0, #0
        cmp     r2, #0x10
        movge   r12, #0
        movlt   r0, r5, lsl #15
        movlt   r12, r0, asr r2
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        add     lr, r5, #2, 18
        mov     r6, lr, asr r2
        subs    lr, r0, r6
        sbcs    r6, r1, r6, asr #31
        movlt   lr, #0
        movlt   r6, #0
        orrs    r6, lr, r6
        addne   r0, r5, #2, 18
        bne     LCGF5
        cmp     r0, r12
        sbcs    r12, r1, r12, asr #31
        movlt   r0, r5, lsl #15
        blt     LCGF5
        mov     r3, r2, asr #31
        bl      __ashldi3
LCGF5:
        strh    r0, [r4]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCGF6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


