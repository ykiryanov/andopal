        .text
        .align  4
        .globl  ippiDCT8x8Inv_16s_C1I


ippiDCT8x8Inv_16s_C1I:
        stmdb   sp!, {lr}
        mov     r1, r0
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r0, r1
        bl      LKHX_dct_8x8_inv_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LKHX_dct_8x8_inv_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r12, #0x7E, 30
        mov     lr, #0x46
        mov     r4, #0x92
        mvn     r5, #0x8A
        mvn     r6, #0x35, 28
        mov     r7, #0x6E
        mov     r3, #0xA1
        mvn     r2, #0x82
        orr     r9, r7, #0x6A, 24
        orr     r12, r12, #6, 20
        orr     lr, lr, #0x45, 24
        orr     r4, r4, #0x19, 22
        bic     r5, r5, #0xB1, 24
        bic     r6, r6, #2, 20
        orr     r3, r3, #0x16, 24
        bic     r2, r2, #0x3B, 22
        mov     r8, r1
        mov     r7, #8
        str     r1, [sp, #0x18]
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r4, [sp, #8]
        str     lr, [sp, #4]
        str     r12, [sp]
LKHX0:
        ldrsh   r4, [r0, #0x50]
        ldrsh   r12, [r0, #0x30]
        ldrsh   r5, [r0, #0x10]
        ldrsh   r1, [r0, #0x70]
        ldr     lr, [sp, #0x10]
        subs    r7, r7, #1
        mul     lr, r4, lr
        str     lr, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        mul     lr, r12, lr
        add     r12, r4, r12
        ldr     r4, [sp, #0x14]
        str     lr, [sp, #0x24]
        ldr     lr, [sp, #8]
        ldrsh   r9, [r0, #0x20]
        mul     r4, r12, r4
        ldr     r12, [sp]
        mul     lr, r5, lr
        ldrsh   r10, [r0, #0x60]
        mul     r12, r9, r12
        ldr     r11, [sp, #0x24]
        str     r4, [sp, #0x28]
        add     r5, r5, r1
        str     r12, [sp, #0x2C]
        mul     r12, r10, r2
        add     r10, r9, r10
        ldr     r9, [sp, #4]
        str     r12, [sp, #0x30]
        add     r12, r3, #0x96, 30
        mul     r6, r5, r12
        mul     r9, r10, r9
        ldrsh   r5, [r0]
        ldrsh   r4, [r0, #0x40]
        add     r12, r2, #0x56, 24
        mul     r12, r1, r12
        ldr     r1, [sp, #0x28]
        add     lr, lr, r6
        add     r0, r0, #2
        str     r12, [sp, #0x34]
        ldr     r12, [sp, #0x20]
        ldr     r10, [sp, #0x34]
        add     r12, r12, r1
        add     r1, r11, r1
        ldr     r11, [sp, #0x30]
        add     r6, r10, r6
        add     r10, r12, lr
        sub     lr, lr, r12
        add     r12, r1, r6
        add     r10, r10, #2, 22
        sub     r6, r6, r1
        add     r1, r12, #2, 22
        mov     r10, r10, asr #12
        mul     r12, r10, r3
        add     r10, r5, r4
        sub     r5, r5, r4
        ldr     r4, [sp, #0x2C]
        add     r11, r11, r9
        mov     r1, r1, asr #12
        mul     r1, r1, r3
        add     r4, r4, r9
        add     r9, lr, r6
        sub     lr, lr, r6
        add     r6, r4, r10, lsl #15
        rsb     r4, r4, r10, lsl #15
        add     r10, r11, r5, lsl #15
        rsb     r5, r11, r5, lsl #15
        add     r11, r12, r6
        sub     r12, r6, r12
        add     r6, r9, r10
        sub     r10, r10, r9
        add     r9, lr, r5
        sub     r5, r5, lr
        add     lr, r1, r4
        sub     r4, r4, r1
        add     r11, r11, #2, 22
        add     r12, r12, #2, 22
        add     r6, r6, #2, 22
        add     r10, r10, #2, 22
        add     r9, r9, #2, 22
        add     r5, r5, #2, 22
        add     lr, lr, #2, 22
        add     r4, r4, #2, 22
        mov     r11, r11, asr #12
        mov     r12, r12, asr #12
        mov     r6, r6, asr #12
        mov     r10, r10, asr #12
        mov     r9, r9, asr #12
        mov     r5, r5, asr #12
        mov     lr, lr, asr #12
        mov     r4, r4, asr #12
        strh    r11, [r8]
        strh    r12, [r8, #0x70]
        strh    r6, [r8, #0x10]
        strh    r10, [r8, #0x60]
        strh    r9, [r8, #0x20]
        strh    r5, [r8, #0x50]
        strh    lr, [r8, #0x30]
        strh    r4, [r8, #0x40]
        add     r8, r8, #2
        bne     LKHX0
        ldr     r9, [sp, #0x14]
        ldr     r6, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     lr, [sp, #4]
        ldr     r12, [sp]
        ldr     r1, [sp, #0x18]
        mov     r0, #8
        str     r9, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r4, [sp, #8]
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r2, [sp, #0x1C]
LKHX1:
        ldrsh   r4, [r1, #0xA]
        ldr     r5, [sp, #0xC]
        ldrsh   lr, [r1, #6]
        ldr     r2, [sp, #0x10]
        ldrsh   r12, [r1, #2]
        mul     r6, lr, r5
        ldrsh   r7, [r1, #0xE]
        mul     r2, r4, r2
        ldr     r5, [sp, #8]
        add     lr, r4, lr
        ldr     r4, [sp, #0x14]
        ldr     r10, [sp]
        mul     r5, r12, r5
        subs    r0, r0, #1
        mul     r4, lr, r4
        add     r12, r12, r7
        add     lr, r3, #0x96, 30
        mul     lr, r12, lr
        str     r4, [sp, #0x34]
        ldrsh   r8, [r1, #4]
        ldrsh   r9, [r1, #0xC]
        ldrsh   r4, [r1]
        ldrsh   r12, [r1, #8]
        mul     r10, r8, r10
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x1C]
        mul     r11, r9, r10
        add     r9, r8, r9
        add     r10, r10, #0x56, 24
        mul     r7, r7, r10
        ldr     r10, [sp, #0x34]
        str     r11, [sp, #0x2C]
        add     r2, r2, r10
        add     r6, r6, r10
        add     r10, r5, lr
        ldr     r5, [sp, #4]
        add     r8, r7, lr
        add     r7, r2, r10
        sub     lr, r10, r2
        mul     r5, r9, r5
        sub     r9, r8, r6
        add     r2, r6, r8
        add     r7, r7, #2, 22
        add     r6, r12, r4
        add     r2, r2, #2, 22
        mov     r7, r7, asr #12
        mul     r8, r7, r3
        sub     r12, r4, r12
        ldr     r4, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        mov     r2, r2, asr #12
        mul     r2, r2, r3
        add     r4, r4, r5
        add     r7, r7, r5
        add     r5, lr, r9
        sub     lr, lr, r9
        add     r9, r4, r6, lsl #15
        rsb     r4, r4, r6, lsl #15
        add     r6, r7, r12, lsl #15
        rsb     r12, r7, r12, lsl #15
        add     r7, r8, r9
        sub     r8, r9, r8
        add     r9, r5, r6
        sub     r6, r6, r5
        add     r5, lr, r12
        sub     r12, r12, lr
        add     lr, r2, r4
        sub     r4, r4, r2
        add     r7, r7, #1, 12
        add     r8, r8, #1, 12
        add     r9, r9, #1, 12
        add     r6, r6, #1, 12
        add     r5, r5, #1, 12
        add     r12, r12, #1, 12
        add     lr, lr, #1, 12
        add     r4, r4, #1, 12
        mov     r7, r7, asr #21
        mov     r8, r8, asr #21
        mov     r9, r9, asr #21
        mov     r6, r6, asr #21
        mov     r5, r5, asr #21
        mov     r12, r12, asr #21
        mov     lr, lr, asr #21
        mov     r4, r4, asr #21
        strh    r7, [r1]
        strh    r8, [r1, #0xE]
        strh    r9, [r1, #2]
        strh    r6, [r1, #0xC]
        strh    r5, [r1, #4]
        strh    r12, [r1, #0xA]
        strh    lr, [r1, #6]
        strh    r4, [r1, #8]
        add     r1, r1, #0x10
        bne     LKHX1
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


