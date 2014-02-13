        .text
        .align  4
        .globl  _ippsRandUniform_Direct_16s


_ippsRandUniform_Direct_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        ldr     r12, [sp, #0x54]
        cmp     r0, #0
        beq     LAZR3
        cmp     r12, #0
        beq     LAZR3
        cmp     r1, #0
        ble     LAZR4
        ldr     r4, [pc, #0x240]
        ldr     lr, [r12]
        ldr     r7, [pc, #0x23C]
        ldr     r5, [pc, #0x23C]
        cmp     r1, #4
        mul     r6, lr, r4
        sub     r8, r3, r2
        add     r3, r2, r3
        mvn     r10, #0
        mov     r9, r8, lsr #24
        add     r6, r6, r7
        mul     r2, r6, r4
        mov     r4, r8, asr #31
        orr     r4, r9, r4, lsl #8
        add     r7, r2, r7
        mov     r2, r8, lsl #8
        movlt   r8, #0
        blt     LAZR1
        sub     r11, r1, #4
        mov     r8, #0
        mov     r9, r0
        str     r11, [sp, #4]
        str     r10, [sp]
        str     r12, [sp, #8]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
LAZR0:
        ldr     r0, [pc, #0x1D8]
        ldr     r1, [pc, #0x1D8]
        ldr     r12, [sp]
        mul     r0, r5, r0
        sub     r7, r6, r7
        add     r5, r7, r12
        sub     r6, lr, r6
        mov     r7, r5, asr #31
        add     r12, r6, r7
        ldr     r6, [pc, #0x1B4]
        add     r0, r0, r1
        and     r7, r7, #0x12
        sub     r7, r5, r7
        mul     r6, r0, r6
        mov     r5, r12, asr #31
        sub     lr, r7, lr
        add     r0, r7, r0
        add     r10, r6, r1
        ldr     r6, [pc, #0x190]
        add     lr, lr, r5
        and     r5, r5, #0x12
        add     r8, r8, #3
        mul     r6, r10, r6
        str     r6, [sp, #0x18]
        umull   r6, r11, r2, r0
        str     r11, [sp, #0x1C]
        str     r6, [sp, #0x20]
        sub     r6, r12, r5
        add     r12, r6, r10
        umull   r5, r10, r2, r12
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x28]
        mov     r5, lr, asr #31
        str     r5, [sp]
        and     r10, r5, #0x12
        ldr     r5, [sp, #0x18]
        sub     lr, lr, r10
        add     r5, r5, r1
        add     r1, lr, r5
        umull   r10, r11, r2, r1
        str     r11, [sp, #0x18]
        mov     r11, r0, asr #31
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x1C]
        mla     r10, r2, r11, r10
        mov     r11, r12, asr #31
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x20]
        adds    r10, r10, #0
        ldr     r10, [sp, #0x24]
        mla     r10, r2, r11, r10
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0x1C]
        mla     r11, r4, r0, r10
        ldr     r0, [sp, #0x18]
        mov     r10, r1, asr #31
        mla     r0, r2, r10, r0
        ldr     r10, [sp, #0x24]
        mla     r10, r4, r12, r10
        adc     r12, r11, r3, lsl #7
        ldr     r11, [sp, #0x28]
        mla     r0, r4, r1, r0
        ldr     r1, [sp, #0x2C]
        mov     r12, r12, asr #8
        adds    r11, r11, #0
        adc     r10, r10, r3, lsl #7
        adds    r1, r1, #0
        adc     r0, r0, r3, lsl #7
        strh    r12, [r9]
        mov     r10, r10, asr #8
        mov     r0, r0, asr #8
        strh    r0, [r9, #4]
        strh    r10, [r9, #2]
        ldr     r0, [sp, #4]
        add     r9, r9, #6
        cmp     r8, r0
        ble     LAZR0
        ldr     r10, [sp]
        ldr     r12, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x10]
LAZR1:
        add     r0, r0, r8, lsl #1
        str     r3, [sp, #0x14]
        str     r12, [sp, #8]
LAZR2:
        ldr     r3, [pc, #0x88]
        ldr     r12, [pc, #0x88]
        add     r8, r8, #1
        mul     r5, r5, r3
        sub     r7, r6, r7
        add     r3, r7, r10
        mov     r7, r6
        mov     r10, r3, asr #31
        and     r6, r10, #0x12
        add     r5, r5, r12
        sub     r3, r3, r6
        add     r12, r3, r5
        umull   r9, r11, r2, r12
        mov     r6, lr
        mov     lr, r12, asr #31
        mla     r11, r2, lr, r11
        mov     lr, r3
        adds    r9, r9, #0
        mla     r11, r4, r12, r11
        ldr     r12, [sp, #0x14]
        adc     r12, r11, r12, lsl #7
        cmp     r8, r1
        mov     r12, r12, asr #8
        strh    r12, [r0], #2
        blt     LAZR2
        ldr     r12, [sp, #8]
        mov     r0, #0
        str     r3, [r12]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAZR3:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAZR4:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


