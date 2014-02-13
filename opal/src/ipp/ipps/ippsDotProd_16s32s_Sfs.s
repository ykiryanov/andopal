        .text
        .align  4
        .globl  _ippsDotProd_16s32s_Sfs


_ippsDotProd_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r12, sp
        ldr     r5, [sp, #0x54]
        and     r12, r12, #0x1F
        rsb     r12, r12, #0
        mov     r10, sp
        and     r4, r12, #0x1F
        cmp     r0, #0
        mov     r6, r3
        add     r9, r10, r4
        beq     LCGG6
        cmp     r1, #0
        beq     LCGG6
        cmp     r6, #0
        beq     LCGG6
        cmp     r2, #0
        ble     LCGG3
        mov     r3, r9
        bl      ownps_DotProd_16s16s
        cmp     r5, #0
        mvn     r7, #2, 2
        mvn     r8, #0
        mov     r1, #2, 2
        bne     LCGG1
        ldr     r10, [r4, +r10]
        ldr     r9, [r9, #4]
        subs    r1, r10, r7
        sbcs    r2, r9, #0
        movlt   r1, #0
        movlt   r2, #0
        orrs    r2, r1, r2
        movne   r10, r7
        bne     LCGG0
        cmp     r10, #2, 2
        sbcs    r9, r9, r8
        movlt   r10, #2, 2
LCGG0:
        str     r10, [r6]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCGG1:
        cmp     r5, #0
        ble     LCGG4
        ldr     r4, [r4, +r10]
        cmp     r5, #0x1F
        ldr     r9, [r9, #4]
        mov     r10, #0x1F
        movlt   r10, r5
        sub     r2, r10, #1
        mov     r0, #1
        mov     r1, #0
        mov     r3, r2, asr #31
        bl      __ashldi3
        adds    r11, r0, r4
        mov     r0, r4
        mov     r3, r10, asr #31
        adc     r4, r1, r9
        mov     r1, r9
        mov     r2, r10
        bl      __ashrdi3
        and     r0, r0, #1
        adds    r0, r11, r0
        adc     r4, r4, #0
        adds    r0, r0, r8
        adc     r1, r4, r8
        mov     r3, r5, asr #31
        mov     r2, r5
        bl      __ashrdi3
        subs    r2, r0, r7
        sbcs    r12, r1, #0
        movlt   r2, #0
        movlt   r12, #0
        orrs    r12, r2, r12
        movne   r0, r7
        bne     LCGG2
        cmp     r0, #2, 2
        sbcs    r1, r1, r8
        movlt   r0, #2, 2
LCGG2:
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCGG3:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCGG4:
        mvn     r12, #0x1E
        cmp     r5, r12
        movgt   r12, r5
        rsb     r2, r12, #0
        cmp     r2, #0x20
        movge   r12, #0
        movlt   r12, r1, asr r2
        ldr     r0, [r4, +r10]
        ldr     r1, [r9, #4]
        mov     r4, r7, asr r2
        subs    lr, r0, r4
        sbcs    r4, r1, r4, asr #31
        movlt   lr, #0
        movlt   r4, #0
        orrs    r4, lr, r4
        bne     LCGG5
        cmp     r0, r12
        sbcs    r12, r1, r12, asr #31
        movlt   r7, #2, 2
        blt     LCGG5
        mov     r3, r2, asr #31
        bl      __ashldi3
        mov     r7, r0
LCGG5:
        str     r7, [r6]
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCGG6:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}


