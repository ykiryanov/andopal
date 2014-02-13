        .text
        .align  4
        .globl  _ippsHighPassFilter_AMRWB_16s_Sfs


_ippsHighPassFilter_AMRWB_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r5, [sp, #0x50]
        cmp     r0, #0
        beq     LDJJ17
        cmp     r1, #0
        beq     LDJJ17
        cmp     r3, #0
        beq     LDJJ17
        cmp     r2, #0
        ble     LDJJ16
        ldr     r4, [r3, #0x24]
        cmp     r5, r4
        beq     LDJJ9
        ldrsh   lr, [r3, #0x14]
        ldrsh   r12, [r3, #0x1A]
        subs    r6, r4, r5
        mov     lr, lr, lsl #1
        mvn     r7, #2, 2
        add     r12, lr, r12, lsl #16
        mov     r8, #2, 2
        rsbmi   lr, r6, #0
        movmi   lr, r12, asr lr
        bmi     LDJJ0
        bic     lr, r6, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        cmp     r12, r7, asr lr
        movgt   lr, r7
        bgt     LDJJ0
        cmp     r12, r8, asr lr
        movge   lr, r12, lsl lr
        movlt   lr, #2, 2
LDJJ0:
        ldrsh   r4, [r3, #0x12]
        ldrsh   r12, [r3, #0x18]
        cmp     r6, #0
        mov     r4, r4, lsl #1
        mov     r9, lr, asr #16
        add     r12, r4, r12, lsl #16
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        and     lr, r4, lr, asr #1
        strh    r9, [r3, #0x1A]
        strh    lr, [r3, #0x14]
        rsblt   lr, r6, #0
        movlt   lr, r12, asr lr
        blt     LDJJ1
        bic     lr, r6, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        cmp     r12, r7, asr lr
        movgt   lr, r7
        bgt     LDJJ1
        cmp     r12, r8, asr lr
        movge   lr, r12, lsl lr
        movlt   lr, #2, 2
LDJJ1:
        ldrsh   r8, [r3, #0x10]
        ldrsh   r12, [r3, #0x16]
        cmp     r6, #0
        mov     r8, r8, lsl #1
        add     r12, r8, r12, lsl #16
        mov     r8, lr, asr #16
        and     lr, r4, lr, asr #1
        strh    r8, [r3, #0x18]
        strh    lr, [r3, #0x12]
        rsblt   lr, r6, #0
        movlt   lr, r12, asr lr
        blt     LDJJ2
        bic     lr, r6, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        cmp     r12, r7, asr lr
        mov     r8, #2, 2
        movgt   lr, r7
        bgt     LDJJ2
        cmp     r12, r8, asr lr
        movge   lr, r12, lsl lr
        movlt   lr, #2, 2
LDJJ2:
        ldrsh   r12, [r3, #0x1C]
        mov     r8, lr, asr #16
        and     lr, r4, lr, asr #1
        cmp     r6, #0
        strh    r8, [r3, #0x16]
        strh    lr, [r3, #0x10]
        mov     r12, r12, lsl #16
        rsblt   lr, r6, #0
        movlt   lr, r12, asr lr
        blt     LDJJ3
        bic     lr, r6, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        cmp     r12, r7, asr lr
        mov     r8, #2, 2
        movgt   lr, r7
        bgt     LDJJ3
        cmp     r12, r8, asr lr
        movge   lr, r12, lsl lr
        movlt   lr, #2, 2
LDJJ3:
        mov     r12, #2, 2
        sub     r8, r12, #2, 18
        cmp     r8, lr
        ble     LDJJ4
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     r4, lr, asr #16
LDJJ4:
        ldrsh   lr, [r3, #0x1E]
        cmp     r6, #0
        strh    r4, [r3, #0x1C]
        mov     lr, lr, lsl #16
        rsblt   r12, r6, #0
        movlt   lr, lr, asr r12
        blt     LDJJ5
        bic     r8, r6, #0xFF, 8
        bic     r8, r8, #0xFF, 16
        cmp     lr, r7, asr r8
        movgt   lr, r7
        bgt     LDJJ5
        cmp     lr, r12, asr r8
        movge   lr, lr, lsl r8
        movlt   lr, #2, 2
LDJJ5:
        mov     r12, #2, 2
        sub     r12, r12, #2, 18
        cmp     r12, lr
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        movle   lr, r12
        ble     LDJJ6
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDJJ6:
        ldrsh   r8, [r3, #0x20]
        cmp     r6, #0
        strh    lr, [r3, #0x1E]
        mov     r8, r8, lsl #16
        rsblt   r6, r6, #0
        movlt   r6, r8, asr r6
        blt     LDJJ7
        bic     r6, r6, #0xFF, 8
        bic     r9, r6, #0xFF, 16
        cmp     r8, r7, asr r9
        mov     r6, #2, 2
        movgt   r6, r7
        bgt     LDJJ7
        cmp     r8, r6, asr r9
        movge   r6, r8, lsl r9
LDJJ7:
        mov     r7, #2, 2
        sub     r7, r7, #2, 18
        cmp     r7, r6
        ble     LDJJ8
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r12, r6, asr #16
LDJJ8:
        str     r5, [r3, #0x24]
        strh    r12, [r3, #0x20]
        b       LDJJ10
LDJJ9:
        ldrsh   r4, [r3, #0x1C]
        ldrsh   lr, [r3, #0x1E]
        ldrsh   r12, [r3, #0x20]
LDJJ10:
        ldrsh   r7, [r3, #0x10]
        ldrsh   r6, [r3, #0x16]
        ldrsh   r5, [r3, #0x12]
        ldrsh   r8, [r3, #0x18]
        ldrsh   r10, [r3, #0x14]
        ldrsh   r9, [r3, #0x1A]
        cmp     r2, #0
        ble     LDJJ15
        mov     r11, #2, 2
        sub     r11, r11, #2, 18
        str     r11, [sp, #0xC]
        str     r10, [sp]
        str     r2, [sp, #4]
        str     r1, [sp, #8]
LDJJ11:
        ldrsh   r11, [r3, #2]
        ldrsh   r2, [r3, #4]
        ldrsh   r1, [r3, #6]
        mul     r10, r11, r6
        mul     r11, r11, r7
        str     r11, [sp, #0x10]
        ldrsh   r11, [r3, #8]
        mla     r10, r2, r8, r10
        str     r11, [sp, #0x14]
        ldrsh   r11, [r3, #0xA]
        str     r11, [sp, #0x18]
        ldrsh   r11, [r3, #0xC]
        str     r12, [sp, #0x20]
        mla     r10, r1, r9, r10
        str     r11, [sp, #0x1C]
        mov     r12, lr
        mov     lr, r4
        ldrsh   r4, [r0], #2
        str     r10, [sp, #0x24]
        ldrsh   r9, [r3, #0xE]
        ldr     r11, [sp, #0x14]
        ldr     r10, [sp, #0x24]
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x10]
        mla     r10, r11, r4, r10
        ldr     r11, [sp, #0x18]
        add     r9, r9, #2, 20
        mla     r9, r2, r5, r9
        ldr     r2, [sp]
        str     r10, [sp, #0x24]
        mov     r2, r2, lsl #16
        mov     r10, r2, asr #16
        ldr     r2, [sp, #0x24]
        str     r9, [sp, #0x14]
        ldr     r9, [sp, #0x20]
        mla     r2, r11, lr, r2
        ldr     r11, [sp, #0x14]
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        mla     r10, r1, r10, r11
        ldr     r1, [sp, #0x1C]
        mla     r2, r1, r12, r2
        ldr     r1, [sp, #0x28]
        mla     r2, r1, r9, r2
        mov     r1, r2, lsl #1
        add     r10, r1, r10, asr #14
        cmn     r10, #0x1E, 4
        mvngt   r1, #2, 2
        bgt     LDJJ12
        cmp     r10, #0xE, 4
        movge   r1, r10, lsl #2
        movlt   r1, #2, 2
LDJJ12:
        mov     r10, r1, asr #16
        mov     r2, #0xFF
        mov     r9, r8
        str     r5, [sp]
        mov     r8, r6
        mov     r5, r7
        mov     r10, r10, lsl #16
        orr     r2, r2, #0x7F, 24
        cmn     r1, #7, 2
        mov     r6, r10, asr #16
        and     r7, r2, r1, asr #1
        mvngt   r1, #2, 2
        bgt     LDJJ13
        cmp     r1, #3, 2
        movge   r1, r1, lsl #1
        movlt   r1, #2, 2
LDJJ13:
        ldr     r2, [sp, #0xC]
        cmp     r2, r1
        movle   r1, #0xFF
        orrle   r2, r1, #0x7F, 24
        ble     LDJJ14
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
LDJJ14:
        ldr     r1, [sp, #8]
        strh    r2, [r1], #2
        ldr     r2, [sp, #4]
        str     r1, [sp, #8]
        subs    r2, r2, #1
        str     r2, [sp, #4]
        bne     LDJJ11
        ldr     r10, [sp]
LDJJ15:
        mov     r0, #0
        strh    r7, [r3, #0x10]
        strh    r6, [r3, #0x16]
        strh    r5, [r3, #0x12]
        strh    r8, [r3, #0x18]
        strh    r10, [r3, #0x14]
        strh    r9, [r3, #0x1A]
        strh    r4, [r3, #0x1C]
        strh    lr, [r3, #0x1E]
        strh    r12, [r3, #0x20]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDJJ16:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDJJ17:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


