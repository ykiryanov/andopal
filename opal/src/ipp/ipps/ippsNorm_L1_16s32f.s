        .text
        .align  4
        .globl  _ippsNorm_L1_16s32f


_ippsNorm_L1_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        mov     r3, r1
        mov     r4, r2
        beq     LBCF13
        cmp     r4, #0
        beq     LBCF13
        cmp     r3, #0
        ble     LBCF14
        cmp     r3, #1, 16
        mov     r8, #0
        ble     LBCF8
        mov     r7, r3, asr #16
        cmp     r7, #0
        movle   r2, r8
        movle   r1, r2
        ble     LBCF2
        mov     r2, r8
        mov     r1, r2
LBCF0:
        mov     lr, r8
        mov     r5, lr
        mov     r6, #1, 16
LBCF1:
        ldrsh   r12, [r0, +r5]
        cmp     r12, #0
        rsblt   r12, r12, #0
        subs    r6, r6, #1
        add     lr, lr, r12
        add     r5, r5, #2
        bne     LBCF1
        adds    r2, r2, lr
        adc     r1, r1, #0
        subs    r7, r7, #1
        add     r0, r0, #2, 16
        bne     LBCF0
LBCF2:
        bic     r3, r3, #0xFF, 8
        bics    r9, r3, #0xFF, 16
        beq     LBCF7
        cmp     r9, #0
        movle   r3, r8
        ble     LBCF6
        cmp     r9, #6
        movlt   r3, r8
        movlt   r12, r3
        blt     LBCF4
        mov     r3, r8
        sub     r10, r9, #6
        mov     r12, r3
        mov     r7, #2
        mov     r6, #4
        mov     r5, #6
        mov     lr, #8
        str     r1, [sp, #8]
        str     r2, [sp, #0xC]
        str     r10, [sp, #4]
        str     r9, [sp, #0x10]
        str     r4, [sp, #0x14]
        str     r0, [sp]
LBCF3:
        ldr     r0, [sp, #4]
        add     r12, r12, #5
        cmp     r12, r0
        ldr     r0, [sp]
        ldrsh   r2, [r0, +r8]
        add     r8, r8, #0xA
        ldrsh   r4, [r0, +r7]
        ldrsh   r10, [r0, +r6]
        ldrsh   r11, [r0, +r5]
        ldrsh   r0, [r0, +lr]
        eor     r1, r2, r2, asr #31
        eor     r9, r4, r4, asr #31
        str     r9, [sp, #0x18]
        sub     r1, r1, r2, asr #31
        add     r3, r1, r3
        ldr     r1, [sp, #0x18]
        eor     r9, r10, r10, asr #31
        eor     r2, r11, r11, asr #31
        sub     r1, r1, r4, asr #31
        add     r3, r1, r3
        sub     r9, r9, r10, asr #31
        add     r3, r9, r3
        eor     r1, r0, r0, asr #31
        sub     r2, r2, r11, asr #31
        add     r3, r2, r3
        sub     r1, r1, r0, asr #31
        add     r3, r1, r3
        add     r7, r7, #0xA
        add     r6, r6, #0xA
        add     r5, r5, #0xA
        add     lr, lr, #0xA
        ble     LBCF3
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r9, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r0, [sp]
LBCF4:
        mov     lr, r12, lsl #1
LBCF5:
        ldrsh   r5, [r0, +lr]
        add     lr, lr, #2
        add     r12, r12, #1
        eor     r6, r5, r5, asr #31
        cmp     r12, r9
        sub     r6, r6, r5, asr #31
        add     r3, r6, r3
        blt     LBCF5
LBCF6:
        adds    r2, r2, r3
        adc     r1, r1, #0
LBCF7:
        mov     r0, r2
        bl      __floatdisf
        b       LBCF12
LBCF8:
        cmp     r3, #6
        movlt   r1, r8
        blt     LBCF10
        mov     r1, r8
        sub     r5, r3, #6
        mov     lr, r0
LBCF9:
        ldrsh   r11, [lr]
        ldrsh   r12, [lr, #2]
        ldrsh   r6, [lr, #4]
        ldrsh   r7, [lr, #6]
        ldrsh   r9, [lr, #8]
        eor     r10, r11, r11, asr #31
        add     lr, lr, #0xA
        add     r8, r8, #5
        sub     r10, r10, r11, asr #31
        add     r1, r10, r1
        eor     r10, r12, r12, asr #31
        cmp     r8, r5
        sub     r10, r10, r12, asr #31
        eor     r12, r6, r6, asr #31
        add     r1, r10, r1
        sub     r12, r12, r6, asr #31
        add     r1, r12, r1
        eor     r12, r7, r7, asr #31
        sub     r12, r12, r7, asr #31
        add     r1, r12, r1
        eor     r12, r9, r9, asr #31
        sub     r12, r12, r9, asr #31
        add     r1, r12, r1
        ble     LBCF9
LBCF10:
        add     r0, r0, r8, lsl #1
LBCF11:
        ldrsh   r12, [r0], #2
        add     r8, r8, #1
        eor     lr, r12, r12, asr #31
        cmp     r8, r3
        sub     lr, lr, r12, asr #31
        add     r1, lr, r1
        blt     LBCF11
        mov     r0, r1
        bl      __floatunssisf
LBCF12:
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBCF13:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBCF14:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


