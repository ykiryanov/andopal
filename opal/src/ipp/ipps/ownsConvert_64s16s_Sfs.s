        .text
        .align  4
        .globl  ownsConvert_64s16s_Sfs


ownsConvert_64s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r9, r3
        cmp     r9, #0
        mov     r5, r0
        mov     r4, r1
        mov     r6, r2
        mvn     r8, #0
        mov     r7, #0
        bne     LCYO2
        cmp     r6, #0
        ble     LCYO5
        add     r12, r8, #2, 18
        mov     r3, r8, lsl #15
LCYO0:
        ldr     lr, [r5]
        ldr     r9, [r5, #4]
        subs    r10, lr, r12
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        strneh  r12, [r4]
        bne     LCYO1
        cmp     lr, r8, lsl #15
        sbcs    r9, r9, r8
        strgeh  lr, [r4]
        strlth  r3, [r4]
LCYO1:
        add     r7, r7, #1
        cmp     r7, r6
        add     r5, r5, #8
        add     r4, r4, #2
        blt     LCYO0
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCYO2:
        cmp     r9, #0
        ble     LCYO6
        cmp     r9, #0x3F
        mov     r12, #0x3F
        movgt   r9, r12
        cmp     r6, #0
        ble     LCYO5
        sub     r12, r9, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        add     r11, r8, #2, 18
        mov     lr, r8, lsl #15
        mov     r10, r9, asr #31
        str     lr, [sp, #0xC]
        str     r11, [sp]
        str     r12, [sp, #4]
        str     r6, [sp, #8]
LCYO3:
        ldr     r6, [r5]
        ldr     r11, [r5, #4]
        mov     r2, r9
        mov     r0, r6
        mov     r3, r10
        mov     r1, r11
        bl      __ashrdi3
        ldr     r12, [sp, #4]
        and     r0, r0, #1
        mov     r3, r10
        adds    r6, r12, r6
        adc     r11, r11, r12, asr #31
        adds    r6, r6, r0
        adc     r11, r11, #0
        adds    r0, r6, r8
        adc     r1, r11, r8
        mov     r2, r9
        bl      __ashrdi3
        ldr     r12, [sp]
        subs    r12, r0, r12
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        ldrne   r12, [sp]
        strneh  r12, [r4]
        bne     LCYO4
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        sbcs    r1, r1, r8
        strgeh  r0, [r4]
        ldrlt   r12, [sp, #0xC]
        strlth  r12, [r4]
LCYO4:
        ldr     r12, [sp, #8]
        add     r7, r7, #1
        add     r5, r5, #8
        cmp     r7, r12
        add     r4, r4, #2
        blt     LCYO3
LCYO5:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCYO6:
        cmp     r9, #0
        bge     LCYO5
        cmp     r6, #0
        rsb     r9, r9, #0
        ble     LCYO5
        mov     r12, r8, lsl #15
        mov     r10, r9, asr #31
        add     r11, r8, #2, 18
        str     r12, [sp, #0xC]
LCYO7:
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        mov     r3, r10
        mov     r2, r9
        bl      __ashldi3
        subs    r12, r0, r11
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        strneh  r11, [r4]
        bne     LCYO8
        mvn     r12, #0
        cmp     r0, r12, lsl #15
        sbcs    r1, r1, r8
        strgeh  r0, [r4]
        ldrlt   r12, [sp, #0xC]
        strlth  r12, [r4]
LCYO8:
        add     r7, r7, #1
        cmp     r7, r6
        add     r5, r5, #8
        add     r4, r4, #2
        blt     LCYO7
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


