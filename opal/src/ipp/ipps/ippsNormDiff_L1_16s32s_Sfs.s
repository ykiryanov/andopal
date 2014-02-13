        .text
        .align  4
        .globl  _ippsNormDiff_L1_16s32s_Sfs


_ippsNormDiff_L1_16s32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r8, [sp, #0x5C]
        cmp     r0, #0
        mov     r7, r2
        mov     r4, r3
        beq     LBCS20
        cmp     r1, #0
        beq     LBCS20
        cmp     r4, #0
        beq     LBCS20
        cmp     r7, #0
        ble     LBCS21
        cmp     r7, #1, 16
        mov     r9, #0
        ble     LBCS10
        mov     r12, r7, asr #16
        cmp     r12, #0
        movle   r3, #0
        movle   r2, r3
        ble     LBCS2
        mov     r3, #0
        mov     r2, r3
LBCS0:
        mov     r6, #0
        mov     r5, r6
        mov     lr, #1, 16
LBCS1:
        ldrsh   r9, [r0, +r5]
        ldrsh   r10, [r1, +r5]
        subs    r9, r9, r10
        rsbmi   r9, r9, #0
        subs    lr, lr, #1
        add     r6, r6, r9
        add     r5, r5, #2
        bne     LBCS1
        adds    r3, r3, r6
        adc     r2, r2, #0
        subs    r12, r12, #1
        add     r0, r0, #2, 16
        add     r1, r1, #2, 16
        bne     LBCS0
LBCS2:
        bic     r7, r7, #0xFF, 8
        bics    r9, r7, #0xFF, 16
        beq     LBCS7
        cmp     r9, #0
        movle   r10, #0
        ble     LBCS6
        cmp     r9, #6
        movlt   r10, #0
        movlt   r12, r10
        blt     LBCS4
        mov     r10, #0
        mov     lr, #6
        str     lr, [sp, #0x24]
        mov     r12, r10
        str     r10, [sp]
        ldr     r10, [sp, #0x24]
        sub     r11, r9, #6
        mov     r7, r12
        mov     r6, #2
        mov     r5, #4
        mov     lr, #8
        str     r2, [sp, #8]
        str     r3, [sp, #0xC]
        str     r11, [sp, #4]
        str     r9, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r4, [sp, #0x18]
LBCS3:
        ldrsh   r3, [r1, +r7]
        ldrsh   r2, [r0, +r7]
        add     r12, r12, #5
        str     r3, [sp, #0x28]
        ldrsh   r11, [r0, +r10]
        ldrsh   r4, [r6, +r1]
        ldrsh   r8, [r0, +r6]
        ldrsh   r3, [r0, +r5]
        ldrsh   r9, [r5, +r1]
        str     r11, [sp, #0x2C]
        ldrsh   r11, [r10, +r1]
        sub     r4, r8, r4
        sub     r3, r3, r9
        eor     r9, r4, r4, asr #31
        str     r11, [sp, #0x30]
        ldr     r11, [sp, #0x28]
        sub     r9, r9, r4, asr #31
        eor     r4, r3, r3, asr #31
        sub     r2, r2, r11
        ldrsh   r11, [r0, +lr]
        add     r7, r7, #0xA
        eor     r8, r2, r2, asr #31
        add     r6, r6, #0xA
        str     r11, [sp, #0x28]
        ldrsh   r11, [lr, +r1]
        sub     r2, r8, r2, asr #31
        ldr     r8, [sp, #0x2C]
        str     r11, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        str     r4, [sp, #0x30]
        ldr     r4, [sp, #0x28]
        add     r5, r5, #0xA
        sub     r8, r8, r11
        ldr     r11, [sp]
        add     r10, r10, #0xA
        add     lr, lr, #0xA
        add     r2, r2, r11
        ldr     r11, [sp, #0x34]
        add     r2, r9, r2
        ldr     r9, [sp, #0x30]
        sub     r4, r4, r11
        sub     r9, r9, r3, asr #31
        eor     r3, r8, r8, asr #31
        add     r9, r9, r2
        sub     r3, r3, r8, asr #31
        add     r9, r3, r9
        ldr     r3, [sp, #4]
        eor     r2, r4, r4, asr #31
        sub     r2, r2, r4, asr #31
        add     r9, r2, r9
        cmp     r12, r3
        str     r9, [sp]
        ble     LBCS3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r10, [sp]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r4, [sp, #0x18]
LBCS4:
        mov     lr, r12, lsl #1
LBCS5:
        ldrsh   r5, [r0, +lr]
        ldrsh   r6, [r1, +lr]
        add     lr, lr, #2
        add     r12, r12, #1
        cmp     r12, r9
        sub     r5, r5, r6
        eor     r6, r5, r5, asr #31
        sub     r6, r6, r5, asr #31
        add     r10, r6, r10
        blt     LBCS5
LBCS6:
        adds    r3, r3, r10
        adc     r2, r2, #0
LBCS7:
        cmp     r8, #0
        bne     LBCS8
        str     r3, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS8:
        cmp     r8, #0
        mvn     r5, #2, 2
        ble     LBCS17
        cmp     r8, #0x3F
        ble     LBCS9
        mov     r0, #0
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS9:
        mov     r0, r3
        mov     r1, r2
        mov     r3, r8, asr #31
        mov     r2, r8
        bl      __lshrdi3
        cmp     r1, #0
        cmpeq   r0, r5
        movhi   r0, r5
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS10:
        cmp     r7, #6
        movlt   r2, #0
        movlt   r12, r2
        blt     LBCS12
        mov     r2, #0
        mov     r12, r2
        sub     r6, r7, #6
        mov     r5, r0
        mov     lr, r1
        str     r8, [sp, #0x14]
        str     r4, [sp, #0x18]
        str     r7, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x20]
LBCS11:
        ldrsh   r1, [r5]
        ldrsh   r3, [lr]
        ldrsh   r4, [lr, #4]
        ldrsh   r0, [r5, #6]
        ldrsh   r11, [lr, #6]
        sub     r9, r1, r3
        ldrsh   r1, [r5, #2]
        ldrsh   r3, [lr, #2]
        ldrsh   r8, [r5, #8]
        ldrsh   r7, [lr, #8]
        sub     r1, r1, r3
        ldrsh   r3, [r5, #4]
        add     r12, r12, #5
        cmp     r12, r6
        eor     r10, r9, r9, asr #31
        sub     r3, r3, r4
        eor     r4, r1, r1, asr #31
        sub     r10, r10, r9, asr #31
        sub     r0, r0, r11
        sub     r4, r4, r1, asr #31
        eor     r1, r3, r3, asr #31
        add     r2, r10, r2
        add     r2, r4, r2
        sub     r1, r1, r3, asr #31
        add     r2, r1, r2
        eor     r3, r0, r0, asr #31
        sub     r8, r8, r7
        sub     r3, r3, r0, asr #31
        eor     r1, r8, r8, asr #31
        add     r2, r3, r2
        sub     r1, r1, r8, asr #31
        add     r2, r1, r2
        add     r5, r5, #0xA
        add     lr, lr, #0xA
        ble     LBCS11
        ldr     r8, [sp, #0x14]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        mov     r9, #0
LBCS12:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LBCS13:
        ldrsh   lr, [r0], #2
        ldrsh   r5, [r1], #2
        add     r12, r12, #1
        sub     lr, lr, r5
        cmp     r12, r7
        eor     r5, lr, lr, asr #31
        sub     r5, r5, lr, asr #31
        add     r2, r5, r2
        blt     LBCS13
        cmp     r8, #0
        bne     LBCS14
        str     r2, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS14:
        cmp     r8, #0
        ble     LBCS16
        cmp     r8, #0x1F
        ble     LBCS15
        str     r9, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS15:
        mov     r8, r2, lsr r8
        str     r8, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS16:
        cmn     r8, #0x1F
        mvn     r1, #0x1E
        movlt   r8, r1
        rsb     r8, r8, #0
        mov     r0, r2
        mov     r3, r8, asr #31
        mov     r1, #0
        mov     r2, r8
        bl      __ashldi3
        cmp     r1, #0
        mvn     r1, #2, 2
        cmpeq   r0, r1
        movhi   r0, r1
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS17:
        orrs    r12, r3, r2
        bne     LBCS18
        mov     r0, #0
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS18:
        subs    lr, r3, r5
        sbcs    r12, r2, #0
        movlt   lr, #0
        movlt   r12, #0
        orrs    r12, lr, r12
        beq     LBCS19
        str     r5, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS19:
        cmn     r8, #0x20
        mvn     r12, #0x1F
        movlt   r8, r12
        rsb     r8, r8, #0
        mov     r0, r3
        mov     r3, r8, asr #31
        mov     r1, r2
        mov     r2, r8
        bl      __ashldi3
        cmp     r1, #0
        cmpeq   r0, r5
        movhi   r0, r5
        str     r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS20:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LBCS21:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


