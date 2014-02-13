        .text
        .align  4
        .globl  _ippsIIR16s_G728_16s


_ippsIIR16s_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x30]
        cmp     r0, #0
        beq     LDGB7
        cmp     r1, #0
        beq     LDGB7
        cmp     r2, #0
        beq     LDGB7
        cmp     r12, #0
        beq     LDGB7
        cmp     r3, #0
        ble     LDGB6
        cmp     r3, #0
        add     r8, r12, #0x20
        add     r7, r0, #0x14
        ble     LDGB5
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        mvn     r6, #2, 2
        mvn     r5, #0
LDGB0:
        ldrsh   r10, [r1]
        ldrsh   r9, [r0]
        ldrsh   r4, [r12]
        mov     r10, r10, lsl #14
        mov     r11, #0xA
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #2]
        ldrsh   r9, [r0, #2]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #4]
        ldrsh   r9, [r0, #4]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #6]
        ldrsh   r9, [r0, #6]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #8]
        ldrsh   r9, [r0, #8]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #0xA]
        ldrsh   r9, [r0, #0xA]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #0xC]
        ldrsh   r9, [r0, #0xC]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #0xE]
        ldrsh   r9, [r0, #0xE]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #0x10]
        ldrsh   r9, [r0, #0x10]
        mla     r10, r4, r9, r10
        ldrsh   r4, [r12, #0x12]
        ldrsh   r9, [r0, #0x12]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r0, [sp]
        mla     r4, r4, r9, r10
        mov     r9, r7
        mov     r10, r8
LDGB1:
        ldrsh   r2, [r9], #2
        ldrsh   r3, [r10], #2
        mov     r0, r4, asr #31
        mul     r2, r3, r2
        subs    r4, r4, r2
        sbc     r0, r0, r2, asr #31
        subs    r3, r4, r6
        sbcs    r2, r0, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        mvnne   r4, #2, 2
        bne     LDGB2
        cmp     r4, #2, 2
        sbcs    r0, r0, r5
        movlt   r4, #2, 2
LDGB2:
        subs    r11, r11, #1
        bne     LDGB1
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        ldrsh   r9, [r12, #0x10]
        ldrsh   r10, [r12, #0x30]
        mov     r4, r4, asr #14
        cmp     lr, r4
        strh    r9, [r12, #0x12]
        ldrsh   r9, [r12, #0xE]
        strh    r10, [r12, #0x32]
        ldrsh   r10, [r12, #0x2E]
        strh    r9, [r12, #0x10]
        ldrsh   r9, [r12, #0xC]
        strh    r10, [r12, #0x30]
        ldrsh   r10, [r12, #0x2C]
        strh    r9, [r12, #0xE]
        ldrsh   r9, [r12, #0xA]
        strh    r10, [r12, #0x2E]
        ldrsh   r10, [r12, #0x2A]
        strh    r9, [r12, #0xC]
        ldrsh   r9, [r12, #8]
        strh    r10, [r12, #0x2C]
        ldrsh   r10, [r12, #0x28]
        strh    r9, [r12, #0xA]
        ldrsh   r9, [r12, #6]
        strh    r10, [r12, #0x2A]
        ldrsh   r10, [r12, #0x26]
        strh    r9, [r12, #8]
        ldrsh   r9, [r12, #4]
        strh    r10, [r12, #0x28]
        ldrsh   r10, [r12, #0x24]
        strh    r9, [r12, #6]
        ldrsh   r9, [r12, #2]
        strh    r10, [r12, #0x26]
        ldrsh   r10, [r12, #0x22]
        strh    r9, [r12, #4]
        ldrsh   r9, [r12]
        strh    r10, [r12, #0x24]
        ldrsh   r10, [r12, #0x20]
        strh    r9, [r12, #2]
        strh    r10, [r12, #0x22]
        ldrsh   r9, [r1], #2
        strh    r9, [r12]
        blt     LDGB3
        cmn     r4, #2, 18
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r4, #0xFF
        biclt   r4, r4, #0x7F, 24
        b       LDGB4
LDGB3:
        mvn     r4, #2, 2
        mov     r4, r4, lsl #15
        mvn     r4, r4
LDGB4:
        strh    r4, [r12, #0x20]
        strh    r4, [r2], #2
        subs    r3, r3, #1
        bne     LDGB0
LDGB5:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDGB6:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDGB7:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


