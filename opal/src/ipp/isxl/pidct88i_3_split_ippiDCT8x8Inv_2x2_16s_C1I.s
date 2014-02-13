        .text
        .align  4
        .globl  _ippiDCT8x8Inv_2x2_16s_C1I


_ippiDCT8x8Inv_2x2_16s_C1I:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        ldrsh   r3, [r0, #0x10]
        ldrsh   r2, [r0, #0x12]
        mov     r12, #0x8A
        orr     r12, r12, #0x7D, 24
        mul     r10, r3, r12
        mul     r8, r2, r12
        mov     r1, #0xA1
        orr     r1, r1, #0x16, 24
        add     r12, r1, #0x96, 30
        mul     r7, r3, r12
        mul     r9, r2, r12
        ldrsh   r5, [r0]
        ldrsh   r3, [r0, #2]
        add     r12, r10, #2, 22
        add     r2, r7, #2, 22
        add     r4, r8, #2, 22
        mov     r12, r12, asr #12
        mul     r12, r12, r1
        mov     r2, r2, asr #12
        mul     lr, r2, r1
        add     r6, r10, r7
        sub     r10, r10, r7
        add     r7, r8, r9
        add     r2, r9, #2, 22
        sub     r8, r8, r9
        add     r9, r12, r5, lsl #15
        rsb     r12, r12, r5, lsl #15
        add     r12, r12, #2, 22
        mov     r4, r4, asr #12
        mul     r4, r4, r1
        mov     r12, r12, asr #12
        strh    r12, [r0, #0x70]
        add     r12, r6, r5, lsl #15
        add     r12, r12, #2, 22
        mov     r2, r2, asr #12
        mul     r2, r2, r1
        mov     r12, r12, asr #12
        strh    r12, [r0, #0x10]
        add     r12, r10, r5, lsl #15
        rsb     r6, r6, r5, lsl #15
        add     r12, r12, #2, 22
        add     r6, r6, #2, 22
        mov     r12, r12, asr #12
        mov     r6, r6, asr #12
        strh    r12, [r0, #0x20]
        strh    r6, [r0, #0x60]
        add     r12, lr, r5, lsl #15
        rsb     r6, lr, r5, lsl #15
        rsb     r10, r10, r5, lsl #15
        add     lr, r4, r3, lsl #15
        rsb     r5, r4, r3, lsl #15
        add     r4, r12, #2, 22
        add     r12, r6, #2, 22
        mov     r4, r4, asr #12
        mov     r12, r12, asr #12
        strh    r12, [r0, #0x40]
        strh    r4, [r0, #0x30]
        add     r12, r8, r3, lsl #15
        add     r4, r7, r3, lsl #15
        add     r6, lr, #2, 22
        add     lr, r5, #2, 22
        add     r5, r2, r3, lsl #15
        rsb     r7, r7, r3, lsl #15
        rsb     r8, r8, r3, lsl #15
        rsb     r3, r2, r3, lsl #15
        add     r9, r9, #2, 22
        add     r10, r10, #2, 22
        add     r2, r4, #2, 22
        add     r7, r7, #2, 22
        add     r12, r12, #2, 22
        add     r8, r8, #2, 22
        add     r5, r5, #2, 22
        add     r3, r3, #2, 22
        mov     r6, r6, asr #12
        mov     r9, r9, asr #12
        mov     r10, r10, asr #12
        strh    r6, [r0, #2]
        mov     lr, lr, asr #12
        mov     r2, r2, asr #12
        mov     r7, r7, asr #12
        mov     r12, r12, asr #12
        mov     r8, r8, asr #12
        mov     r5, r5, asr #12
        mov     r3, r3, asr #12
        strh    r9, [r0]
        strh    r10, [r0, #0x50]
        strh    lr, [r0, #0x72]
        strh    r2, [r0, #0x12]
        strh    r7, [r0, #0x62]
        strh    r12, [r0, #0x22]
        strh    r8, [r0, #0x52]
        strh    r5, [r0, #0x32]
        strh    r3, [r0, #0x42]
        mov     r6, #8
LKHP0:
        ldrsh   r3, [r0, #2]
        ldrsh   r4, [r0]
        mov     r2, #0x8A
        orr     r2, r2, #0x7D, 24
        mul     r2, r3, r2
        add     r12, r1, #0x96, 30
        mul     lr, r3, r12
        subs    r6, r6, #1
        add     r12, r2, #2, 22
        mov     r12, r12, asr #12
        mul     r12, r12, r1
        add     r3, lr, #2, 22
        add     r7, r2, lr
        mov     r3, r3, asr #12
        mul     r3, r3, r1
        sub     r5, r2, lr
        add     lr, r7, r4, lsl #15
        rsb     r2, r7, r4, lsl #15
        add     r7, r5, r4, lsl #15
        rsb     r8, r5, r4, lsl #15
        add     r9, r12, r4, lsl #15
        add     r5, r3, r4, lsl #15
        rsb     r12, r12, r4, lsl #15
        rsb     r4, r3, r4, lsl #15
        add     r3, r9, #1, 12
        add     r12, r12, #1, 12
        add     lr, lr, #1, 12
        add     r2, r2, #1, 12
        add     r7, r7, #1, 12
        add     r8, r8, #1, 12
        add     r5, r5, #1, 12
        add     r4, r4, #1, 12
        mov     r3, r3, asr #21
        mov     r12, r12, asr #21
        mov     lr, lr, asr #21
        mov     r2, r2, asr #21
        mov     r7, r7, asr #21
        mov     r8, r8, asr #21
        mov     r5, r5, asr #21
        mov     r4, r4, asr #21
        strh    r3, [r0]
        strh    r12, [r0, #0xE]
        strh    lr, [r0, #2]
        strh    r2, [r0, #0xC]
        strh    r7, [r0, #4]
        strh    r8, [r0, #0xA]
        strh    r5, [r0, #6]
        strh    r4, [r0, #8]
        add     r0, r0, #0x10
        bne     LKHP0
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


