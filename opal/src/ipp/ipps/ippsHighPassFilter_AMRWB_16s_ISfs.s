        .text
        .align  4
        .globl  _ippsHighPassFilter_AMRWB_16s_ISfs


_ippsHighPassFilter_AMRWB_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        beq     LDJK6
        cmp     r2, #0
        beq     LDJK6
        cmp     r1, #0
        ble     LDJK5
        ldrsh   r12, [r2, #0x10]
        ldrsh   r5, [r2, #0x16]
        ldrsh   r6, [r2, #0x12]
        ldrsh   r9, [r2, #0x18]
        ldrsh   r8, [r2, #0x1C]
        ldrsh   lr, [r2, #0x1E]
        cmp     r1, #0
        rsb     r3, r3, #0xF
        ble     LDJK4
        add     r4, r3, #1
        mov     r10, #2, 2
        bic     r4, r4, #0xFF, 8
        bic     r3, r3, #0xFF, 8
        sub     r11, r10, #2, 18
        bic     r4, r4, #0xFF, 16
        bic     r3, r3, #0xFF, 16
        mvn     r7, #2, 2
        str     r11, [sp, #8]
        str     r6, [sp]
        str     r1, [sp, #4]
LDJK0:
        ldrsh   r10, [r2, #8]
        ldrsh   r1, [r2, #2]
        ldrsh   r6, [r2, #4]
        str     r10, [sp, #0xC]
        ldr     r11, [sp]
        mul     r10, r1, r5
        mul     r1, r1, r12
        str     lr, [sp, #0x10]
        mla     r10, r6, r9, r10
        ldrsh   r9, [r2, #0xA]
        mov     lr, r8
        ldrsh   r8, [r0]
        str     r9, [sp, #0x14]
        ldrsh   r9, [r2, #0xC]
        add     r1, r1, #2, 20
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0xC]
        mla     r10, r1, r8, r10
        ldr     r1, [sp, #0x18]
        mla     r6, r6, r11, r1
        ldr     r1, [sp, #0x14]
        mla     r10, r1, lr, r10
        ldr     r1, [sp, #0x10]
        mla     r10, r9, r1, r10
        mov     r1, r10, lsl #1
        add     r6, r1, r6, asr #14
        cmp     r6, r7, asr r4
        mvngt   r1, #2, 2
        bgt     LDJK1
        mov     r1, #2, 2
        cmp     r6, r1, asr r4
        movge   r1, r6, lsl r4
        movlt   r1, #2, 2
LDJK1:
        mov     r10, r1, asr #16
        mov     r6, #0xFF
        str     r12, [sp]
        mov     r9, r5
        mov     r10, r10, lsl #16
        orr     r6, r6, #0x7F, 24
        cmp     r1, r7, asr r3
        mov     r5, r10, asr #16
        and     r12, r6, r1, asr #1
        mvngt   r1, #2, 2
        bgt     LDJK2
        mov     r6, #2, 2
        cmp     r1, r6, asr r3
        movge   r1, r1, lsl r3
        movlt   r1, #2, 2
LDJK2:
        ldr     r6, [sp, #8]
        cmp     r6, r1
        movle   r1, #0xFF
        orrle   r1, r1, #0x7F, 24
        ble     LDJK3
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LDJK3:
        strh    r1, [r0], #2
        ldr     r1, [sp, #4]
        subs    r1, r1, #1
        str     r1, [sp, #4]
        bne     LDJK0
        ldr     r6, [sp]
LDJK4:
        mov     r0, #0
        strh    r12, [r2, #0x10]
        strh    r5, [r2, #0x16]
        strh    r6, [r2, #0x12]
        strh    r9, [r2, #0x18]
        strh    r8, [r2, #0x1C]
        strh    lr, [r2, #0x1E]
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDJK5:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDJK6:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


