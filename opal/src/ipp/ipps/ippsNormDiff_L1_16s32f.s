        .text
        .align  4
        .globl  _ippsNormDiff_L1_16s32f


_ippsNormDiff_L1_16s32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        cmp     r0, #0
        mov     r4, r3
        beq     LBCT13
        cmp     r1, #0
        beq     LBCT13
        cmp     r4, #0
        beq     LBCT13
        cmp     r2, #0
        ble     LBCT14
        cmp     r2, #1, 16
        mov     r12, #0
        ble     LBCT8
        mov     lr, r2, asr #16
        cmp     lr, #0
        movle   r8, r12
        movle   r3, r8
        ble     LBCT2
        mov     r8, r12
        mov     r3, r8
LBCT0:
        mov     r7, r12
        mov     r6, r7
        mov     r5, #1, 16
LBCT1:
        ldrsh   r9, [r0, +r6]
        ldrsh   r10, [r1, +r6]
        subs    r9, r9, r10
        rsbmi   r9, r9, #0
        subs    r5, r5, #1
        add     r7, r7, r9
        add     r6, r6, #2
        bne     LBCT1
        adds    r8, r8, r7
        adc     r3, r3, #0
        subs    lr, lr, #1
        add     r0, r0, #2, 16
        add     r1, r1, #2, 16
        bne     LBCT0
LBCT2:
        bic     r2, r2, #0xFF, 8
        bics    r9, r2, #0xFF, 16
        beq     LBCT7
        cmp     r9, #0
        mov     r7, #0
        movle   r10, r7
        ble     LBCT6
        cmp     r9, #6
        movlt   r10, r7
        movlt   r2, r10
        blt     LBCT4
        mov     r10, r7
        sub     r11, r9, #6
        mov     r2, r10
        mov     r6, #2
        mov     r5, #4
        mov     lr, #6
        mov     r12, #8
        str     r3, [sp, #8]
        str     r8, [sp, #0xC]
        str     r10, [sp]
        str     r11, [sp, #4]
        str     r9, [sp, #0x10]
        str     r4, [sp, #0x14]
LBCT3:
        ldrsh   r4, [r1, +r7]
        ldrsh   r3, [r0, +r7]
        add     r2, r2, #5
        str     r4, [sp, #0x1C]
        ldrsh   r11, [r0, +lr]
        ldrsh   r8, [r6, +r1]
        ldrsh   r9, [r0, +r6]
        ldrsh   r4, [r0, +r5]
        ldrsh   r10, [r5, +r1]
        str     r11, [sp, #0x20]
        ldrsh   r11, [lr, +r1]
        sub     r8, r9, r8
        sub     r4, r4, r10
        eor     r10, r8, r8, asr #31
        str     r11, [sp, #0x24]
        ldr     r11, [sp, #0x1C]
        sub     r10, r10, r8, asr #31
        eor     r8, r4, r4, asr #31
        sub     r3, r3, r11
        ldrsh   r11, [r0, +r12]
        add     r7, r7, #0xA
        eor     r9, r3, r3, asr #31
        add     r6, r6, #0xA
        str     r11, [sp, #0x1C]
        ldrsh   r11, [r12, +r1]
        sub     r3, r9, r3, asr #31
        ldr     r9, [sp, #0x20]
        str     r11, [sp, #0x28]
        ldr     r11, [sp, #0x24]
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x1C]
        add     r5, r5, #0xA
        sub     r9, r9, r11
        ldr     r11, [sp]
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        add     r3, r3, r11
        ldr     r11, [sp, #0x28]
        add     r3, r10, r3
        ldr     r10, [sp, #0x24]
        sub     r8, r8, r11
        sub     r10, r10, r4, asr #31
        eor     r4, r9, r9, asr #31
        add     r10, r10, r3
        sub     r4, r4, r9, asr #31
        add     r10, r4, r10
        ldr     r4, [sp, #4]
        eor     r3, r8, r8, asr #31
        sub     r3, r3, r8, asr #31
        add     r10, r3, r10
        cmp     r2, r4
        str     r10, [sp]
        ble     LBCT3
        ldr     r3, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r10, [sp]
        ldr     r9, [sp, #0x10]
        ldr     r4, [sp, #0x14]
LBCT4:
        mov     r12, r2, lsl #1
LBCT5:
        ldrsh   lr, [r0, +r12]
        ldrsh   r5, [r1, +r12]
        add     r12, r12, #2
        add     r2, r2, #1
        cmp     r2, r9
        sub     lr, lr, r5
        eor     r5, lr, lr, asr #31
        sub     r5, r5, lr, asr #31
        add     r10, r5, r10
        blt     LBCT5
LBCT6:
        adds    r8, r8, r10
        adc     r3, r3, #0
LBCT7:
        mov     r0, r8
        mov     r1, r3
        bl      __floatdisf
        b       LBCT12
LBCT8:
        cmp     r2, #6
        movlt   r3, r12
        blt     LBCT10
        mov     r3, r12
        sub     r6, r2, #6
        mov     r5, r0
        mov     lr, r1
        str     r0, [sp, #0x18]
LBCT9:
        ldrsh   r8, [r5]
        ldrsh   r9, [lr]
        ldrsh   r7, [r5, #2]
        ldrsh   r11, [lr, #2]
        ldrsh   r10, [lr, #4]
        sub     r8, r8, r9
        ldrsh   r9, [r5, #4]
        sub     r7, r7, r11
        ldrsh   r11, [r5, #6]
        ldrsh   r0, [lr, #8]
        sub     r9, r9, r10
        ldrsh   r10, [lr, #6]
        add     r12, r12, #5
        cmp     r12, r6
        add     lr, lr, #0xA
        sub     r11, r11, r10
        ldrsh   r10, [r5, #8]
        add     r5, r5, #0xA
        sub     r10, r10, r0
        eor     r0, r8, r8, asr #31
        sub     r0, r0, r8, asr #31
        add     r3, r0, r3
        eor     r0, r7, r7, asr #31
        sub     r0, r0, r7, asr #31
        add     r3, r0, r3
        eor     r0, r9, r9, asr #31
        sub     r0, r0, r9, asr #31
        add     r3, r0, r3
        eor     r0, r11, r11, asr #31
        sub     r0, r0, r11, asr #31
        add     r3, r0, r3
        eor     r0, r10, r10, asr #31
        sub     r0, r0, r10, asr #31
        add     r3, r0, r3
        ble     LBCT9
        ldr     r0, [sp, #0x18]
LBCT10:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LBCT11:
        ldrsh   lr, [r0], #2
        ldrsh   r5, [r1], #2
        add     r12, r12, #1
        sub     lr, lr, r5
        cmp     r12, r2
        eor     r5, lr, lr, asr #31
        sub     r5, r5, lr, asr #31
        add     r3, r5, r3
        blt     LBCT11
        mov     r0, r3
        bl      __floatunssisf
LBCT12:
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBCT13:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBCT14:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


