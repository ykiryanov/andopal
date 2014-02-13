        .text
        .align  4
        .globl  _ippsDotProd_G729A_16s32s


_ippsDotProd_G729A_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r8, r0
        cmp     r8, #0
        beq     LDRT6
        cmp     r1, #0
        beq     LDRT6
        cmp     r3, #0
        beq     LDRT6
        cmp     r2, #0
        ble     LDRT7
        cmp     r2, #0xC
        blt     LDRT5
        mov     r0, #0
        mov     r12, r0
        mov     r4, r12
        sub     r7, r2, #0xC
        mov     r6, r1
        mov     r5, r8
        str     r1, [sp, #4]
        str     r8, [sp]
LDRT0:
        ldrsh   r1, [r6]
        ldrsh   lr, [r5]
        ldrsh   r8, [r5, #4]
        ldrsh   r10, [r6, #8]
        ldrsh   r11, [r5, #8]
        mul     r1, lr, r1
        ldrsh   lr, [r6, #4]
        mul     r10, r11, r10
        ldrsh   r9, [r5, #0xC]
        mul     lr, r8, lr
        ldrsh   r8, [r6, #0xC]
        ldrsh   r11, [r6, #0x10]
        adds    r0, r0, r1
        adc     r1, r12, r1, asr #31
        mul     r8, r9, r8
        ldrsh   r9, [r5, #0x10]
        adds    r0, r0, lr
        adc     lr, r1, lr, asr #31
        mul     r11, r9, r11
        adds    r0, r0, r10
        adc     r10, lr, r10, asr #31
        adds    r0, r0, r8
        adc     r8, r10, r8, asr #31
        adds    r0, r0, r11
        add     r4, r4, #0xA
        add     r6, r6, #0x14
        add     r5, r5, #0x14
        adc     r12, r8, r11, asr #31
        cmp     r4, r7
        ble     LDRT0
        ldr     r1, [sp, #4]
        ldr     r8, [sp]
LDRT1:
        add     r1, r1, r4, lsl #1
        add     r8, r8, r4, lsl #1
LDRT2:
        ldrsh   lr, [r1], #4
        ldrsh   r5, [r8], #4
        add     r4, r4, #2
        mul     lr, r5, lr
        adds    r0, r0, lr
        adc     r12, r12, lr, asr #31
        cmp     r4, r2
        blt     LDRT2
        mov     r1, r0, lsl #1
        mov     r0, r0, lsr #31
        orr     r12, r0, r12, lsl #1
        mvn     r0, #2, 2
        subs    r2, r1, r0
        sbcs    lr, r12, #0
        movlt   r2, #0
        movlt   lr, #0
        orrs    lr, r2, lr
        mov     r2, #1
        movne   r1, r0
        bne     LDRT3
        cmp     r1, #2, 2
        mvn     r0, #0
        sbcs    r12, r12, r0
        movge   r2, #0
        movlt   r1, #2, 2
LDRT3:
        cmp     r2, #0
        str     r1, [r3]
        beq     LDRT4
        mov     r0, #0xC
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRT4:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRT5:
        mov     r0, #0
        mov     r12, r0
        mov     r4, r12
        b       LDRT1
LDRT6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDRT7:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


