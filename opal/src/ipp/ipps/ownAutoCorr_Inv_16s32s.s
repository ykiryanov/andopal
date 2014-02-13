        .text
        .align  4
        .globl  ownAutoCorr_Inv_16s32s


ownAutoCorr_Inv_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r3, #0
        ble     LDVX6
        sub     r12, r1, #6
        mov     r10, #0
        mvn     r9, #2, 2
        mvn     r8, #0
        str     r12, [sp, #0x1C]
LDVX0:
        cmp     r1, #0
        movle   r12, #0
        movle   lr, r12
        ble     LDVX4
        cmp     r1, #6
        blt     LDVX7
        rsb     r4, r10, #0
        str     r9, [sp, #0x14]
        ldr     r9, [sp, #0x1C]
        mov     r12, #0
        mov     lr, r12
        add     r4, r0, r4, lsl #1
        mov     r5, lr
        mov     r7, r4
        mov     r6, r0
        str     r8, [sp, #0x18]
        str     r10, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDVX1:
        ldrsh   r0, [r7]
        ldrsh   r3, [r6]
        ldrsh   r1, [r7, #2]
        ldrsh   r8, [r6, #2]
        ldrsh   r2, [r7, #4]
        mul     r0, r3, r0
        ldrsh   r3, [r6, #4]
        mul     r1, r8, r1
        ldrsh   r8, [r7, #6]
        mul     r2, r3, r2
        ldrsh   r3, [r6, #6]
        adds    r12, r12, r0
        ldrsh   r10, [r7, #8]
        ldrsh   r11, [r6, #8]
        mul     r8, r3, r8
        adc     r0, lr, r0, asr #31
        mul     r10, r11, r10
        adds    r12, r12, r1
        adc     r1, r0, r1, asr #31
        adds    r12, r12, r2
        adc     r2, r1, r2, asr #31
        adds    r12, r12, r8
        adc     r8, r2, r8, asr #31
        adds    r12, r12, r10
        add     r5, r5, #5
        adc     lr, r8, r10, asr #31
        cmp     r5, r9
        add     r7, r7, #0xA
        add     r6, r6, #0xA
        ble     LDVX1
        ldr     r8, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDVX2:
        mov     r7, r5, lsl #1
        add     r6, r0, r5, lsl #1
        str     r0, [sp]
LDVX3:
        ldrsh   r11, [r4, +r7]
        ldrsh   r0, [r6], #2
        add     r7, r7, #2
        add     r5, r5, #1
        mul     r11, r0, r11
        adds    r12, r12, r11
        adc     lr, lr, r11, asr #31
        cmp     r5, r1
        blt     LDVX3
        ldr     r0, [sp]
LDVX4:
        subs    r5, r12, r9
        sbcs    r4, lr, #0
        movlt   r5, #0
        movlt   r4, #0
        orrs    r4, r5, r4
        mvnne   r12, #2, 2
        bne     LDVX5
        cmp     r12, #2, 2
        sbcs    lr, lr, r8
        movlt   r12, #2, 2
LDVX5:
        add     r10, r10, #1
        str     r12, [r2], #4
        cmp     r10, r3
        blt     LDVX0
LDVX6:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDVX7:
        mov     r12, #0
        rsb     r4, r10, #0
        mov     lr, r12
        mov     r5, lr
        add     r4, r0, r4, lsl #1
        b       LDVX2


