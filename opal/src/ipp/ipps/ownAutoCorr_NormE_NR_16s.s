        .text
        .align  4
        .globl  ownAutoCorr_NormE_NR_16s


ownAutoCorr_NormE_NR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r5, [sp, #0x58]
        mov     r6, r3
        cmp     r6, #1
        mov     r4, r0
        mov     r8, r1
        mov     r7, r2
        ble     LDVW8
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        sub     r12, r12, #2, 2
        mvn     lr, #0
        mov     r10, #1
        mvn     r9, #2, 2
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x24]
LDVW0:
        sub     r3, r8, r10
        cmp     r3, #0
        mov     lr, #0
        ble     LDVW10
        cmp     r3, #6
        blt     LDVW9
        mov     r11, r10, lsl #1
        add     r2, r4, r11
        str     r2, [sp, #0x30]
        str     r4, [sp, #0x2C]
        str     r7, [sp, #8]
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x2C]
        ldr     r7, [sp, #0x30]
        mov     r0, lr
        mov     r1, r0
        sub     r12, r3, #6
        str     r2, [sp, #0x20]
        str     r3, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x14]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r4, [sp]
LDVW1:
        ldrsh   r2, [r7]
        ldrsh   r5, [r8]
        ldrsh   r3, [r7, #2]
        ldrsh   r6, [r8, #2]
        ldrsh   r4, [r7, #4]
        mul     r2, r5, r2
        ldrsh   r5, [r8, #4]
        mul     r3, r6, r3
        ldrsh   r6, [r7, #6]
        mul     r4, r5, r4
        ldrsh   r5, [r8, #6]
        adds    r0, r0, r2
        ldrsh   r9, [r7, #8]
        ldrsh   r10, [r8, #8]
        mul     r6, r5, r6
        adc     r2, r1, r2, asr #31
        mul     r9, r10, r9
        adds    r0, r0, r3
        adc     r3, r2, r3, asr #31
        adds    r0, r0, r4
        adc     r4, r3, r4, asr #31
        adds    r0, r0, r6
        adc     r6, r4, r6, asr #31
        adds    r0, r0, r9
        add     lr, lr, #5
        adc     r1, r6, r9, asr #31
        cmp     lr, r12
        add     r7, r7, #0xA
        add     r8, r8, #0xA
        ble     LDVW1
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x14]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r4, [sp]
LDVW2:
        mov     r12, lr, lsl #1
        str     r12, [sp, #0x2C]
        add     r12, r4, lr, lsl #1
        str     r4, [sp]
        ldr     r4, [sp, #0x2C]
        str     r7, [sp, #8]
        str     r8, [sp, #4]
LDVW3:
        ldrsh   r8, [r2, +r4]
        ldrsh   r7, [r12], #2
        add     r4, r4, #2
        add     lr, lr, #1
        mul     r8, r7, r8
        adds    r0, r0, r8
        adc     r1, r1, r8, asr #31
        cmp     lr, r3
        blt     LDVW3
        ldr     r7, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r4, [sp]
LDVW4:
        mov     r2, r5
        mov     r3, #0
        bl      __ashldi3
        subs    r12, r0, r9
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        bne     LDVW6
        ldr     r12, [sp, #0x24]
        cmp     r0, #2, 2
        sbcs    r1, r1, r12
        mvnlt   r12, #0xFF
        biclt   r12, r12, #0x7F, 24
        blt     LDVW7
        ldr     r12, [sp, #0x28]
        cmp     r12, r0
        ble     LDVW5
        add     r0, r0, #2, 18
        mov     r12, r0, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDVW7
LDVW5:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
        b       LDVW7
LDVW6:
        mov     r12, #0
        sub     r12, r12, #2, 18
        mvn     r12, r12
LDVW7:
        add     r10, r10, #1
        cmp     r10, r6
        strh    r12, [r7, +r11]
        blt     LDVW0
LDVW8:
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LDVW9:
        mov     r0, lr
        mov     r11, r10, lsl #1
        mov     r1, r0
        add     r2, r4, r11
        b       LDVW2
LDVW10:
        mov     r0, lr
        mov     r1, r0
        mov     r11, r10, lsl #1
        b       LDVW4


