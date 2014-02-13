        .text
        .align  4
        .globl  _ippiDCT8x8Fwd_16s_C1I


_ippiDCT8x8Fwd_16s_C1I:
        stmdb   sp!, {lr}
        mov     r1, r0
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r0, r1
        bl      LKHZ_dct_8x8_fwd_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LKHZ_dct_8x8_fwd_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, #0x7E, 30
        mov     r2, #0x4E
        mov     r3, #5
        mvn     r12, #0x69
        mvn     lr, #0x63, 28
        mvn     r5, #0xCF
        mvn     r6, #0x82
        mov     r4, #0x46
        orr     r8, r7, #6, 20
        orr     r9, r4, #0x45, 24
        orr     r2, r2, #0xD, 24
        orr     r3, r3, #0xB5, 24
        bic     r12, r12, #1, 22
        bic     lr, lr, #1, 20
        bic     r5, r5, #0x12, 24
        bic     r6, r6, #0x3B, 22
        mov     r7, r1
        mov     r4, #8
        str     r7, [sp]
        str     r1, [sp, #0x24]
        str     r9, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r5, [sp, #8]
        str     lr, [sp, #4]
        str     r12, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0x14]
LKHZ0:
        ldrsh   r7, [r0, #8]
        ldrsh   r2, [r0, #0xE]
        ldrsh   r10, [r0]
        ldrsh   r1, [r0, #0xC]
        ldrsh   r9, [r0, #2]
        ldrsh   r12, [r0, #6]
        ldrsh   r3, [r0, #0xA]
        ldrsh   r5, [r0, #4]
        ldr     r11, [sp, #0x10]
        str     r7, [sp, #0x28]
        sub     r8, r10, r2
        sub     r7, r12, r7
        mul     r7, r7, r11
        mul     r8, r8, r11
        sub     lr, r9, r1
        sub     r6, r5, r3
        add     r1, r9, r1
        add     r9, r7, #2, 22
        ldr     r11, [sp, #8]
        add     r7, r8, #2, 22
        add     r2, r10, r2
        add     r3, r5, r3
        ldr     r5, [sp, #0x28]
        add     r8, r6, lr
        sub     r10, lr, r6
        ldr     r6, [sp, #0x1C]
        add     r12, r12, r5
        mov     lr, r7, asr #12
        sub     r5, r2, r12
        mul     r6, r5, r6
        ldr     r7, [sp, #0x18]
        subs    r4, r4, #1
        mov     r9, r9, asr #12
        add     r12, r2, r12
        str     r6, [sp, #0x28]
        sub     r6, r1, r3
        mul     r7, r6, r7
        add     r6, r5, r6
        ldr     r5, [sp, #0x20]
        add     r3, r1, r3
        str     r7, [sp, #0x2C]
        add     r7, lr, r8, lsl #3
        mul     r5, r6, r5
        sub     lr, lr, r8, lsl #3
        ldr     r8, [sp, #0xC]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        add     r0, r0, #0x10
        mul     r8, lr, r8
        add     r1, r1, r5
        add     r5, r2, r5
        add     r1, r1, #2, 22
        add     r5, r5, #2, 22
        str     r8, [sp, #0x30]
        add     r8, r9, r10, lsl #3
        mul     r11, r8, r11
        sub     r10, r9, r10, lsl #3
        ldr     r9, [sp, #4]
        add     r8, r7, r8
        str     r11, [sp, #0x34]
        ldr     r2, [sp, #0x34]
        mul     r9, r10, r9
        add     lr, lr, r10
        ldr     r10, [sp, #0x14]
        rsb     r6, r8, r8, lsl #2
        mov     r1, r1, asr #12
        mul     lr, lr, r10
        add     r6, r8, r6, lsl #3
        sub     r10, r10, #0xBC
        mul     r7, r7, r10
        rsb     r8, r8, r6, lsl #5
        ldr     r6, [sp, #0x30]
        add     r9, lr, r9
        add     r2, r8, r2
        add     lr, lr, r6
        add     r6, r12, r3
        sub     r12, r12, r3
        ldr     r3, [sp]
        add     r7, r8, r7
        add     r7, r7, #2, 22
        add     r2, r2, #2, 22
        add     r9, r9, #2, 22
        add     lr, lr, #2, 22
        mov     r6, r6, lsl #3
        mov     r12, r12, lsl #3
        mov     r5, r5, asr #12
        mov     r7, r7, asr #12
        mov     r2, r2, asr #12
        mov     r9, r9, asr #12
        mov     lr, lr, asr #12
        strh    r6, [r3]
        strh    r12, [r3, #8]
        strh    r1, [r3, #4]
        strh    r5, [r3, #0xC]
        strh    r7, [r3, #2]
        strh    r2, [r3, #0xE]
        strh    r9, [r3, #6]
        strh    lr, [r3, #0xA]
        add     r3, r3, #0x10
        str     r3, [sp]
        bne     LKHZ0
        ldr     r9, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        ldr     r5, [sp, #8]
        ldr     lr, [sp, #4]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x24]
        mov     r7, #8
        str     r9, [sp, #0x20]
        str     r8, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r5, [sp, #8]
        str     lr, [sp, #4]
        str     r12, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0x14]
LKHZ1:
        ldrsh   r12, [r1]
        ldrsh   r10, [r1, #0x70]
        ldrsh   r0, [r1, #0x50]
        ldrsh   lr, [r1, #0x60]
        ldrsh   r9, [r1, #0x10]
        ldrsh   r4, [r1, #0x20]
        ldr     r6, [sp, #0x10]
        str     r0, [sp, #0x34]
        ldrsh   r8, [r1, #0x30]
        ldrsh   r5, [r1, #0x40]
        sub     r3, r12, r10
        mul     r3, r3, r6
        sub     r2, r9, lr
        sub     r11, r8, r5
        mul     r6, r11, r6
        add     lr, r9, lr
        ldr     r11, [sp, #8]
        add     r12, r10, r12
        add     r9, r3, #2, 22
        sub     r0, r4, r0
        add     r10, r6, #2, 22
        add     r6, r0, r2
        sub     r3, r2, r0
        mov     r2, r9, asr #12
        ldr     r9, [sp, #0x34]
        subs    r7, r7, #1
        mov     r0, r10, asr #12
        ldr     r10, [sp, #0x18]
        add     r4, r4, r9
        ldr     r9, [sp, #0x1C]
        add     r5, r8, r5
        sub     r8, r12, r5
        add     r5, r12, r5
        mul     r9, r8, r9
        str     r9, [sp, #0x34]
        sub     r9, lr, r4
        mul     r10, r9, r10
        ldr     r12, [sp, #0x34]
        add     r9, r8, r9
        add     lr, lr, r4
        str     r10, [sp, #0x30]
        add     r10, r2, r6, lsl #3
        sub     r2, r2, r6, lsl #3
        ldr     r6, [sp, #0xC]
        mul     r6, r2, r6
        str     r6, [sp, #0x2C]
        add     r6, r0, r3, lsl #3
        mul     r11, r6, r11
        add     r6, r10, r6
        rsb     r8, r6, r6, lsl #2
        str     r11, [sp, #0x28]
        sub     r11, r0, r3, lsl #3
        ldr     r3, [sp, #0x20]
        ldr     r0, [sp, #4]
        add     r8, r6, r8, lsl #3
        mul     r3, r9, r3
        ldr     r9, [sp, #0x14]
        mul     r0, r11, r0
        add     r11, r2, r11
        mul     r2, r11, r9
        rsb     r4, r6, r8, lsl #5
        add     r6, r5, lr
        sub     lr, r5, lr
        ldr     r5, [sp, #0x30]
        sub     r9, r9, #0xBC
        mul     r10, r10, r9
        add     r12, r12, r3
        add     r3, r5, r3
        ldr     r5, [sp, #0x28]
        add     r0, r2, r0
        add     r10, r4, r10
        add     lr, lr, #0x20
        add     r4, r4, r5
        ldr     r5, [sp, #0x2C]
        add     r12, r12, #1, 12
        add     r3, r3, #1, 12
        add     r10, r10, #1, 12
        add     r5, r2, r5
        add     r2, r6, #0x20
        add     r4, r4, #1, 12
        add     r0, r0, #1, 12
        add     r5, r5, #1, 12
        mov     r2, r2, asr #6
        mov     lr, lr, asr #6
        mov     r12, r12, asr #21
        mov     r3, r3, asr #21
        mov     r10, r10, asr #21
        mov     r4, r4, asr #21
        mov     r0, r0, asr #21
        mov     r5, r5, asr #21
        strh    r2, [r1]
        strh    lr, [r1, #0x40]
        strh    r12, [r1, #0x20]
        strh    r3, [r1, #0x60]
        strh    r10, [r1, #0x10]
        strh    r4, [r1, #0x70]
        strh    r0, [r1, #0x30]
        strh    r5, [r1, #0x50]
        add     r1, r1, #2
        bne     LKHZ1
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}


