        .text
        .align  4
        .globl  _ippsSynthesisFilter_AMRWBE_16s32s_I


_ippsSynthesisFilter_AMRWBE_16s32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x2C]
        cmp     r0, #0
        beq     LDJE12
        cmp     r2, #0
        beq     LDJE12
        cmp     r3, #0
        beq     LDJE12
        cmp     r1, #0
        ble     LDJE11
        cmp     r12, #0
        ble     LDJE11
        cmp     r12, #0
        ble     LDJE9
        mov     r5, #0
        mvn     r4, #2, 2
        mvn     lr, #0
LDJE0:
        cmp     r1, #1
        blt     LDJE10
        mov     r7, r5, lsl #2
        mov     r10, #0
        mov     r9, #1
        add     r6, r3, r7
        add     r8, r0, #2
        str     r3, [sp, #4]
        str     r0, [sp]
LDJE1:
        rsb     r0, r9, #0
        ldr     r0, [r6, +r0, lsl #2]
        ldrsh   r3, [r8], #2
        mvn     r11, #0
        add     r11, r11, #1, 20
        and     r0, r11, r0, asr #4
        mul     r3, r3, r0
        mov     r0, r10, asr #31
        mov     r3, r3, lsl #1
        subs    r10, r10, r3
        sbc     r0, r0, r3, asr #31
        subs    r3, r10, r4
        sbcs    r11, r0, #0
        movlt   r3, #0
        movlt   r11, #0
        orrs    r11, r3, r11
        mvnne   r10, #2, 2
        bne     LDJE2
        cmp     r10, #2, 2
        sbcs    r0, r0, lr
        movlt   r10, #2, 2
LDJE2:
        add     r9, r9, #1
        cmp     r9, r1
        ble     LDJE1
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
LDJE3:
        ldrsh   r9, [r2], #2
        mov     r8, r10, asr #12
        ldrsh   r10, [r0]
        mul     r9, r10, r9
        mov     r9, r9, lsl #1
        adds    r10, r8, r9
        mov     r9, r9, asr #31
        adc     r8, r9, r8, asr #31
        subs    r9, r10, r4
        sbcs    r11, r8, #0
        movlt   r9, #0
        movlt   r11, #0
        orrs    r11, r9, r11
        mvnne   r10, #2, 2
        bne     LDJE4
        cmp     r10, #2, 2
        sbcs    r8, r8, lr
        movlt   r10, #2, 2
LDJE4:
        cmp     r1, #1
        blt     LDJE7
        mov     r9, #1
        add     r8, r0, #2
        str     r3, [sp, #4]
        str     r0, [sp]
LDJE5:
        ldrsh   r0, [r8], #2
        rsb     r3, r9, #0
        ldr     r11, [r6, +r3, lsl #2]
        mov     r3, r10, asr #31
        mov     r11, r11, asr #16
        mul     r0, r11, r0
        mov     r0, r0, lsl #1
        subs    r10, r10, r0
        sbc     r3, r3, r0, asr #31
        subs    r11, r10, r4
        sbcs    r0, r3, #0
        movlt   r11, #0
        movlt   r0, #0
        orrs    r0, r11, r0
        mvnne   r10, #2, 2
        bne     LDJE6
        cmp     r10, #2, 2
        sbcs    r3, r3, lr
        movlt   r10, #2, 2
LDJE6:
        add     r9, r9, #1
        cmp     r9, r1
        ble     LDJE5
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
LDJE7:
        cmn     r10, #0x1F, 4
        mvngt   r10, #2, 2
        bgt     LDJE8
        cmp     r10, #0xF, 4
        movge   r10, r10, lsl #3
        movlt   r10, #2, 2
LDJE8:
        add     r5, r5, #1
        cmp     r5, r12
        str     r10, [r7, +r3]
        blt     LDJE0
LDJE9:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDJE10:
        mov     r7, r5, lsl #2
        mov     r10, #0
        add     r6, r3, r7
        b       LDJE3
LDJE11:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LDJE12:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


