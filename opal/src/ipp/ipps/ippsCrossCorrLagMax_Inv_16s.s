        .text
        .align  4
        .globl  _ippsCrossCorrLagMax_Inv_16s


_ippsCrossCorrLagMax_Inv_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r7, [sp, #0x5C]
        ldr     r6, [sp, #0x60]
        ldr     r5, [sp, #0x64]
        cmp     r3, r7
        mov     r10, r3
        bgt     LDQY6
        sub     lr, r2, #6
        mvn     r12, #0
        mov     r9, #2, 2
        mvn     r8, #2, 2
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x34]
        str     r0, [sp, #0x24]
LDQY0:
        cmp     r2, #0
        movle   lr, #0
        movle   r12, lr
        ble     LDQY4
        cmp     r2, #6
        blt     LDQY7
        ldr     r11, [sp, #0x24]
        rsb     r0, r10, #0
        mov     r4, #0
        mov     r12, r4
        add     r0, r1, r0, lsl #1
        str     r0, [sp, #0x2C]
        str     r11, [sp, #0x30]
        str     r8, [sp, #0x20]
        str     r9, [sp, #0x1C]
        str     r7, [sp, #0xC]
        ldr     r8, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        ldr     r9, [sp, #0x34]
        mov     lr, r12
        str     r10, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp]
LDQY1:
        ldrsh   r1, [r7]
        ldrsh   r5, [r8]
        ldrsh   r2, [r7, #2]
        ldrsh   r6, [r8, #2]
        ldrsh   r3, [r7, #4]
        mul     r1, r5, r1
        ldrsh   r5, [r8, #4]
        mul     r2, r6, r2
        ldrsh   r6, [r7, #6]
        mul     r3, r5, r3
        ldrsh   r5, [r8, #6]
        adds    r12, r12, r1
        ldrsh   r10, [r7, #8]
        ldrsh   r11, [r8, #8]
        mul     r6, r5, r6
        adc     r1, lr, r1, asr #31
        mul     r10, r11, r10
        adds    r12, r12, r2
        adc     r2, r1, r2, asr #31
        adds    r12, r12, r3
        adc     r3, r2, r3, asr #31
        adds    r12, r12, r6
        adc     r6, r3, r6, asr #31
        adds    r12, r12, r10
        add     r4, r4, #5
        adc     lr, r6, r10, asr #31
        cmp     r4, r9
        add     r7, r7, #0xA
        add     r8, r8, #0xA
        ble     LDQY1
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp]
LDQY2:
        mov     r11, r4, lsl #1
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x24]
        str     r7, [sp, #0xC]
        str     r3, [sp, #8]
        add     r11, r11, r4, lsl #1
        str     r11, [sp, #0x30]
        str     r1, [sp]
        ldr     r1, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
LDQY3:
        ldrsh   r11, [r0, +r3]
        ldrsh   r7, [r1], #2
        add     r3, r3, #2
        add     r4, r4, #1
        mul     r11, r7, r11
        adds    r12, r12, r11
        adc     lr, lr, r11, asr #31
        cmp     r4, r2
        blt     LDQY3
        ldr     r7, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r1, [sp]
LDQY4:
        mov     r0, r12, lsl #1
        mov     r4, r12, lsr #31
        subs    r12, r0, r8
        orr     lr, r4, lr, lsl #1
        sbcs    r4, lr, #0
        movlt   r12, #0
        movlt   r4, #0
        orrs    r4, r12, r4
        mvnne   r0, #2, 2
        bne     LDQY5
        ldr     r12, [sp, #0x28]
        cmp     r0, #2, 2
        sbcs    lr, lr, r12
        movlt   r0, #2, 2
LDQY5:
        cmp     r0, r9
        movgt   r9, r0
        movgt   r3, r10
        str     r9, [r6]
        add     r10, r10, #1
        cmp     r10, r7
        str     r3, [r5]
        ble     LDQY0
LDQY6:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LDQY7:
        mov     r4, #0
        rsb     r0, r10, #0
        mov     r12, r4
        mov     lr, r12
        add     r0, r1, r0, lsl #1
        b       LDQY2


