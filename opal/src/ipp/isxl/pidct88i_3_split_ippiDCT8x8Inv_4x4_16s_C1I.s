        .text
        .align  4
        .globl  ippiDCT8x8Inv_4x4_16s_C1I


ippiDCT8x8Inv_4x4_16s_C1I:
        stmdb   sp!, {lr}
        mov     r1, r0
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        mov     r0, r1
        bl      LKHN_dct_8x8_inv_4x4_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LKHN_dct_8x8_inv_4x4_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r5, #0x3D
        mvn     r12, #0xC7, 30
        mov     r4, #0x6E
        mov     lr, #0x8A
        mov     r3, #0xA1
        mov     r2, #0x46
        orr     r7, r4, #0x6A, 24
        orr     r8, lr, #0x7D, 24
        orr     r5, r5, #0xA7, 24
        bic     r12, r12, #0x11, 22
        orr     r3, r3, #0x16, 24
        orr     r2, r2, #0x45, 24
        mov     r4, r1
        mov     lr, #4
        str     r1, [sp, #0xC]
        str     r8, [sp]
        str     r7, [sp, #4]
        str     r12, [sp, #0x10]
        str     r5, [sp, #8]
LKHN0:
        ldr     r12, [sp]
        ldrsh   r9, [r0, #0x10]
        ldr     r5, [sp, #4]
        ldrsh   r1, [r0, #0x30]
        ldrsh   r6, [r0, #0x20]
        mul     r12, r9, r12
        ldrsh   r8, [r0], #2
        mul     r5, r1, r5
        ldr     r7, [sp, #0x10]
        add     r10, r3, #0x96, 30
        mul     r9, r9, r10
        subs    lr, lr, #1
        mul     r1, r1, r7
        ldr     r7, [sp, #8]
        add     r10, r12, r5
        sub     r12, r12, r5
        add     r5, r10, #2, 22
        mul     r7, r6, r7
        mul     r6, r6, r2
        add     r10, r9, r1
        sub     r9, r9, r1
        add     r1, r10, #2, 22
        mov     r5, r5, asr #12
        mul     r5, r5, r3
        mov     r1, r1, asr #12
        mul     r10, r1, r3
        add     r1, r12, r9
        sub     r12, r12, r9
        add     r9, r7, r8, lsl #15
        rsb     r11, r7, r8, lsl #15
        add     r7, r6, r8, lsl #15
        rsb     r8, r6, r8, lsl #15
        add     r6, r5, r9
        sub     r5, r9, r5
        add     r9, r1, r7
        sub     r1, r7, r1
        add     r7, r12, r8
        sub     r12, r8, r12
        add     r8, r10, r11
        sub     r11, r11, r10
        add     r6, r6, #2, 22
        add     r5, r5, #2, 22
        add     r9, r9, #2, 22
        add     r1, r1, #2, 22
        add     r7, r7, #2, 22
        add     r12, r12, #2, 22
        add     r8, r8, #2, 22
        add     r11, r11, #2, 22
        mov     r6, r6, asr #12
        mov     r5, r5, asr #12
        mov     r9, r9, asr #12
        mov     r1, r1, asr #12
        mov     r7, r7, asr #12
        mov     r12, r12, asr #12
        mov     r8, r8, asr #12
        mov     r11, r11, asr #12
        strh    r6, [r4]
        strh    r5, [r4, #0x70]
        strh    r9, [r4, #0x10]
        strh    r1, [r4, #0x60]
        strh    r7, [r4, #0x20]
        strh    r12, [r4, #0x50]
        strh    r8, [r4, #0x30]
        strh    r11, [r4, #0x40]
        add     r4, r4, #2
        bne     LKHN0
        ldr     r8, [sp]
        ldr     r7, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        mov     r6, #8
        str     r8, [sp]
        str     r7, [sp, #4]
        str     r5, [sp, #8]
LKHN1:
        ldr     lr, [sp]
        ldrsh   r8, [r1, #2]
        ldrsh   r0, [r1, #6]
        ldrsh   r7, [r1, #4]
        ldrsh   r11, [r1]
        mul     r4, r8, lr
        ldr     lr, [sp, #4]
        mul     r5, r0, r12
        add     r9, r3, #0x96, 30
        mul     r10, r8, r9
        mul     lr, r0, lr
        ldr     r0, [sp, #8]
        subs    r6, r6, #1
        mul     r0, r7, r0
        mul     r7, r7, r2
        add     r8, r4, lr
        sub     r9, r4, lr
        add     r4, r10, r5
        sub     r10, r10, r5
        add     lr, r8, #2, 22
        add     r5, r4, #2, 22
        add     r8, r0, r11, lsl #15
        mov     lr, lr, asr #12
        mul     r4, lr, r3
        mov     r5, r5, asr #12
        mul     lr, r5, r3
        add     r5, r9, r10
        sub     r10, r9, r10
        add     r9, r7, r11, lsl #15
        rsb     r0, r0, r11, lsl #15
        rsb     r11, r7, r11, lsl #15
        add     r7, r4, r8
        sub     r4, r8, r4
        add     r8, r5, r9
        sub     r5, r9, r5
        add     r9, r10, r11
        sub     r10, r11, r10
        add     r11, lr, r0
        sub     r0, r0, lr
        add     r7, r7, #1, 12
        add     r4, r4, #1, 12
        add     r8, r8, #1, 12
        add     r5, r5, #1, 12
        add     r9, r9, #1, 12
        add     r10, r10, #1, 12
        add     r11, r11, #1, 12
        add     r0, r0, #1, 12
        mov     r7, r7, asr #21
        mov     r4, r4, asr #21
        mov     r8, r8, asr #21
        mov     r5, r5, asr #21
        mov     r9, r9, asr #21
        mov     r10, r10, asr #21
        mov     r11, r11, asr #21
        mov     r0, r0, asr #21
        strh    r7, [r1]
        strh    r4, [r1, #0xE]
        strh    r8, [r1, #2]
        strh    r5, [r1, #0xC]
        strh    r9, [r1, #4]
        strh    r10, [r1, #0xA]
        strh    r11, [r1, #6]
        strh    r0, [r1, #8]
        add     r1, r1, #0x10
        bne     LKHN1
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


