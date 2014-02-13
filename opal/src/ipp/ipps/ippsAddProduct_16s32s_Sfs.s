        .text
        .align  4
        .globl  _ippsAddProduct_16s32s_Sfs


_ippsAddProduct_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r9, [sp, #0x38]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDBR9
        cmp     r5, #0
        beq     LDBR9
        cmp     r4, #0
        beq     LDBR9
        cmp     r3, #0
        ble     LDBR10
        cmp     r9, #0
        mvn     r0, #2, 2
        mvn     r1, #0
        mov     r7, #0
        bne     LDBR1
        cmp     r3, #0
        ble     LDBR3
        mov     r12, r7
LDBR0:
        ldrsh   r2, [r5], #2
        ldrsh   lr, [r6], #2
        ldr     r9, [r4]
        mul     r2, lr, r2
        adds    lr, r9, r2
        mov     r2, r2, asr #31
        adc     r9, r2, r9, asr #31
        cmp     lr, r0
        sbcs    r2, r9, #0
        movge   lr, r0
        movge   r9, r7
        subs    r2, lr, #2, 2
        sbcs    r9, r9, r1
        movlt   r2, #0
        movlt   r9, #0
        orrs    r9, r2, r9
        moveq   lr, #2, 2
        add     r12, r12, #1
        str     lr, [r4], #4
        cmp     r12, r3
        blt     LDBR0
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBR1:
        cmp     r9, #0
        ble     LDBR5
        cmp     r9, #0x1E
        bgt     LDBR4
        sub     r12, r9, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        cmp     r3, #0
        sub     r10, r12, #1
        ble     LDBR3
        mov     r11, r7
        mov     r8, r9, asr #31
        str     r5, [sp, #0x10]
        str     r7, [sp]
        str     r1, [sp, #4]
        str     r0, [sp, #0xC]
        str     r3, [sp, #8]
LDBR2:
        ldr     r12, [sp, #0x10]
        mov     r2, r9
        mov     r3, r8
        ldrsh   r1, [r12], #2
        str     r12, [sp, #0x10]
        ldrsh   r12, [r6], #2
        mul     r12, r12, r1
        ldr     r1, [r4]
        adds    r7, r1, r12
        mov     r0, r7
        mov     r12, r12, asr #31
        adc     r5, r12, r1, asr #31
        mov     r1, r5
        bl      __ashrdi3
        adds    r7, r10, r7
        and     r0, r0, #1
        adc     r5, r5, r10, asr #31
        adds    r0, r7, r0
        adc     r1, r5, #0
        mov     r3, r8
        mov     r2, r9
        bl      __ashrdi3
        ldr     r12, [sp, #0xC]
        cmp     r0, r12
        sbcs    r12, r1, #0
        ldrge   r0, [sp, #0xC]
        ldrge   r1, [sp]
        ldr     lr, [sp, #4]
        subs    r12, r0, #2, 2
        sbcs    r1, r1, lr
        movlt   r12, #0
        movlt   r1, #0
        orrs    r1, r12, r1
        moveq   r0, #2, 2
        str     r0, [r4], #4
        ldr     r1, [sp, #8]
        add     r11, r11, #1
        cmp     r11, r1
        blt     LDBR2
LDBR3:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBR4:
        mov     r0, r4
        mov     r1, r3
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16sc
LDBR5:
        cmn     r9, #0x1F
        bgt     LDBR7
        cmp     r3, #0
        ble     LDBR3
        mov     r12, r7
LDBR6:
        ldrsh   r10, [r5], #2
        ldrsh   r9, [r6], #2
        ldr     lr, [r4]
        mul     r10, r9, r10
        adds    r9, lr, r10
        mov     r10, r10, asr #31
        adc     lr, r10, lr, asr #31
        orrs    r10, r9, lr, lsl #1
        tstcs   r10, #0
        movne   r9, r0
        movne   lr, r7
        tst     lr, lr
        movmi   r9, #2, 2
        add     r12, r12, #1
        str     r9, [r4], #4
        cmp     r12, r3
        blt     LDBR6
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBR7:
        cmp     r3, #0
        rsb     r9, r9, #0
        ble     LDBR3
        mov     r11, r0
        mov     r10, r1
        mov     r8, r3
LDBR8:
        ldrsh   lr, [r5], #2
        ldrsh   r0, [r6], #2
        ldr     r12, [r4]
        mul     lr, r0, lr
        adds    r0, r12, lr
        mov     lr, lr, asr #31
        adc     r1, lr, r12, asr #31
        subs    lr, r0, #2, 2
        sbcs    r12, r1, r10
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        moveq   r0, #2, 2
        moveq   r1, r10
        cmp     r0, r11
        sbcs    r12, r1, #0
        movge   r0, r11
        movge   r1, #0
        mov     r2, r9
        mov     r3, #0
        bl      __ashldi3
        subs    lr, r0, #2, 2
        sbcs    r12, r1, r10
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        moveq   r0, #2, 2
        moveq   r1, r10
        cmp     r0, r11
        sbcs    r1, r1, #0
        movge   r0, r11
        add     r7, r7, #1
        str     r0, [r4], #4
        cmp     r7, r8
        blt     LDBR8
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBR9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LDBR10:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


