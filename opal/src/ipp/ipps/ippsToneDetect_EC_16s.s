        .text
        .align  4
        .globl  _ippsToneDetect_EC_16s


_ippsToneDetect_EC_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        cmp     r0, #0
        str     r0, [sp]
        beq     LDJX7
        cmp     r2, #0
        beq     LDJX7
        cmp     r3, #0
        beq     LDJX7
        cmp     r1, #0
        ble     LDJX6
        and     r0, r3, #0xF
        rsb     r0, r0, #0
        and     r12, r0, #0xF
        ldr     r0, [r12, +r3]
        add     lr, r3, r12
        ldrsh   r3, [lr, #0xC]
        cmp     r1, #0
        str     r3, [sp, #0x44]
        ldrsh   r3, [r0]
        str     r3, [sp, #0x20]
        ldrsh   r3, [r0, #2]
        str     r3, [sp, #0x10]
        ldrsh   r11, [r0, #4]
        ldrsh   r9, [r0, #6]
        ldrsh   r0, [lr, #0xE]
        str     r0, [sp, #0x48]
        ldr     r4, [lr, #0x18]
        ldrsh   r6, [lr, #0x10]
        ldrsh   r5, [lr, #0x12]
        ldrsh   r8, [lr, #0x2C]
        ldr     r12, [lr, #4]
        ldr     r3, [lr, #8]
        ldr     r0, [lr, #0x14]
        str     r4, [sp, #0x1C]
        ldr     r4, [lr, #0x1C]
        str     r4, [sp, #0x18]
        ldr     r7, [lr, #0x24]
        ldr     r4, [lr, #0x20]
        str     r7, [sp, #0x14]
        ldr     r7, [lr, #0x28]
        str     r7, [sp, #0x34]
        movle   r7, #0
        ble     LDJX5
        rsb     r9, r9, #0
        mvn     r7, #0xFF
        str     r9, [sp, #4]
        bic     r10, r7, #0x7F, 24
        rsb     r9, r8, #1, 18
        rsb     r11, r11, #0
        str     r9, [sp, #8]
        mov     r7, #0
        str     r11, [sp, #0xC]
        mov     r9, #0x33
        mov     r11, #0xAE, 30
        str     r7, [sp, #0x2C]
        ldr     r7, [sp, #8]
        mvn     r10, r10
        orr     r9, r9, #0x33, 24
        orr     r11, r11, #7, 22
        str     r11, [sp, #0x30]
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     lr, [sp, #0x28]
        str     r2, [sp, #0x24]
LDJX0:
        ldr     lr, [sp]
        ldr     r2, [sp, #0xC]
        ldr     r8, [sp, #0x48]
        ldrsh   r10, [lr], #2
        mul     r2, r2, r6
        str     lr, [sp]
        ldr     lr, [sp, #0x10]
        mla     r2, lr, r8, r2
        ldr     lr, [sp, #4]
        mla     r2, lr, r5, r2
        ldr     lr, [sp, #0x20]
        mla     r2, lr, r10, r2
        ldr     lr, [sp, #0x3C]
        add     r2, r2, #2, 22
        mov     r2, r2, asr #12
        cmp     lr, r2
        blt     LDJX1
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   lr, r2, asr #16
        mvnlt   r2, #0xFF
        biclt   lr, r2, #0x7F, 24
        b       LDJX2
LDJX1:
        mov     r2, #0
        sub     r2, r2, #2, 18
        mvn     lr, r2
LDJX2:
        ldr     r5, [sp, #0x40]
        mul     r11, lr, lr
        smull   r2, r8, r5, r3
        mul     r3, r10, r10
        smull   r12, r5, r5, r12
        str     r5, [sp, #0x4C]
        ldr     r5, [sp, #0x44]
        smull   r3, r9, r7, r3
        str     r10, [sp, #0x44]
        smull   r10, r11, r7, r11
        str     r5, [sp, #0x48]
        adds    r3, r2, r3
        adc     r9, r8, r9
        mov     r5, r6
        mov     r6, lr
        mov     r2, r9, lsl #18
        orr     r3, r2, r3, lsr #14
        ldr     r2, [sp, #0x38]
        adds    r10, r12, r10
        ldr     r12, [sp, #0x4C]
        smull   r2, lr, r2, r3
        mov     r8, lr, lsl #18
        mov     lr, lr, asr #14
        adc     r11, r12, r11
        orr     r2, r8, r2, lsr #14
        mov     r12, r11, lsl #18
        orr     r12, r12, r10, lsr #14
        subs    r2, r12, r2
        rscs    lr, lr, r12, asr #31
        movlt   r2, #0
        movlt   lr, #0
        orrs    lr, r2, lr
        addne   r0, r0, #1
        movne   r4, #0
        bne     LDJX4
        ldr     r2, [sp, #0x30]
        smull   r2, lr, r2, r3
        mov     r8, lr, lsl #18
        mov     lr, lr, asr #14
        orr     r2, r8, r2, lsr #14
        cmp     r12, r2
        rscs    lr, lr, r12, asr #31
        bge     LDJX3
        ldr     r2, [sp, #0x1C]
        cmp     r0, r2
        ble     LDJX3
        ldr     r2, [sp, #0x18]
        cmp     r0, r2
        bge     LDJX3
        ldr     r0, [sp, #0x34]
        add     r0, r0, #1
        cmp     r0, #1
        str     r0, [sp, #0x34]
        movgt   r0, #1
        strgt   r0, [sp, #0x2C]
        mov     r0, #0
LDJX3:
        ldr     r2, [sp, #0x14]
        add     r4, r4, #1
        cmp     r4, r2
        ble     LDJX4
        mov     r0, #0
        str     r0, [sp, #0x34]
        mov     r4, r0
LDJX4:
        subs    r1, r1, #1
        bne     LDJX0
        ldr     r7, [sp, #0x2C]
        ldr     lr, [sp, #0x28]
        ldr     r2, [sp, #0x24]
LDJX5:
        ldr     r1, [sp, #0x34]
        str     r0, [lr, #0x14]
        str     r4, [lr, #0x20]
        str     r1, [lr, #0x28]
        str     r12, [lr, #4]
        str     r3, [lr, #8]
        ldr     r0, [sp, #0x44]
        strh    r0, [lr, #0xC]
        ldr     r0, [sp, #0x48]
        strh    r6, [lr, #0x10]
        strh    r5, [lr, #0x12]
        strh    r0, [lr, #0xE]
        mov     r0, #0
        str     r7, [r2]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDJX6:
        mvn     r0, #4
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LDJX7:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


