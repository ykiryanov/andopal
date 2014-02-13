        .text
        .align  4
        .globl  _ippsDeemphasize_AMRWB_32s16s


_ippsDeemphasize_AMRWB_32s16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r12, [sp, #0x28]
        cmp     r1, #0
        beq     LDJQ11
        cmp     r2, #0
        beq     LDJQ11
        cmp     r12, #0
        beq     LDJQ11
        cmp     r3, #0
        ble     LDJQ10
        ldr     r4, [r1]
        mvn     r5, #2, 2
        mov     lr, #2, 2
        bic     r4, r4, #0xF
        cmn     r4, #0x1E, 4
        movgt   r7, r5
        bgt     LDJQ0
        cmp     r4, #0xE, 4
        movge   r7, r4, lsl #2
        movlt   r7, #2, 2
LDJQ0:
        ldrsh   r6, [r12]
        mvn     r4, #0
        mul     r8, r0, r6
        adds    r6, r7, r8
        mov     r8, r8, asr #31
        adc     r7, r8, r7, asr #31
        subs    r9, r6, r5
        sbcs    r8, r7, #0
        movlt   r9, #0
        movlt   r8, #0
        orrs    r8, r9, r8
        movne   r6, r5
        bne     LDJQ1
        cmp     r6, #2, 2
        sbcs    r7, r7, r4
        movlt   r6, #2, 2
LDJQ1:
        cmn     r6, #0x1E, 4
        movgt   r6, r5
        bgt     LDJQ2
        cmp     r6, #0xE, 4
        movge   r6, r6, lsl #2
        movlt   r6, #2, 2
LDJQ2:
        sub     r7, lr, #2, 18
        cmp     r7, r6
        addle   r6, r4, #2, 18
        ble     LDJQ3
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDJQ3:
        cmp     r3, #1
        strh    r6, [r2]
        suble   r6, r2, #2
        ble     LDJQ9
        sub     r6, r2, #2
        sub     lr, lr, #2, 18
        add     r1, r1, #4
        add     r2, r2, #2
        add     r7, r6, #2
        sub     r8, r3, #1
        str     r3, [sp]
LDJQ4:
        ldr     r3, [r1], #4
        bic     r3, r3, #0xF
        cmn     r3, #0x1E, 4
        mvngt   r9, #2, 2
        bgt     LDJQ5
        cmp     r3, #0xE, 4
        movge   r9, r3, lsl #2
        movlt   r9, #2, 2
LDJQ5:
        ldrsh   r3, [r7], #2
        mul     r10, r0, r3
        adds    r3, r9, r10
        mov     r10, r10, asr #31
        adc     r9, r10, r9, asr #31
        subs    r10, r3, r5
        sbcs    r11, r9, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r3, #2, 2
        bne     LDJQ6
        cmp     r3, #2, 2
        sbcs    r9, r9, r4
        movlt   r3, #2, 2
LDJQ6:
        cmn     r3, #0x1E, 4
        mvngt   r3, #2, 2
        bgt     LDJQ7
        cmp     r3, #0xE, 4
        movge   r3, r3, lsl #2
        movlt   r3, #2, 2
LDJQ7:
        cmp     lr, r3
        mvnle   r3, #0
        addle   r3, r3, #2, 18
        ble     LDJQ8
        add     r3, r3, #2, 18
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
LDJQ8:
        strh    r3, [r2], #2
        subs    r8, r8, #1
        bne     LDJQ4
        ldr     r3, [sp]
LDJQ9:
        mov     r3, r3, lsl #1
        ldrsh   r3, [r6, +r3]
        mov     r0, #0
        strh    r3, [r12]
        ldmia   sp!, {r1, r4 - r11, pc}
LDJQ10:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LDJQ11:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


