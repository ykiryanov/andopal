        .text
        .align  4
        .globl  _ippsFIRLMSMROneVal32sc_16sc


_ippsFIRLMSMROneVal32sc_16sc:
        stmdb   sp!, {r1, r4 - r10, lr}
        cmp     r2, #0
        str     r0, [sp]
        beq     LBWG3
        cmp     r1, #0
        beq     LBWG3
        ldr     r0, [r2]
        ldr     r3, [pc, #0x100]
        cmp     r3, r0
        bne     LBWG2
        ldr     r4, [r2, #0x1C]
        ldr     r8, [r2, #0x14]
        ldr     r12, [r2, #8]
        ldr     r3, [r2, #0x10]
        ldr     r5, [r2, #4]
        ldr     r0, [r2, #0xC]
        ldrsh   r7, [sp]
        mov     r6, r4, lsl #2
        ldrsh   lr, [sp, #2]
        add     r4, r4, #1
        cmp     r4, r8
        add     r8, r6, r8, lsl #2
        strh    r7, [r8, +r12]
        strh    r7, [r12, +r6]
        add     r8, r12, r8
        strh    lr, [r8, #2]
        add     r6, r12, r6
        strh    lr, [r6, #2]
        mov     lr, #0
        movge   r4, lr
        ldr     r6, [r2, #0x18]
        str     r4, [r2, #0x1C]
        add     r4, r4, r3
        add     r6, r4, r6
        mov     r4, lr
        cmp     r0, #0
        sub     r2, r6, #1
        str     r4, [r1]
        str     r4, [r1, #4]
        ble     LBWG1
        add     r5, r5, #4
LBWG0:
        ldr     r10, [r5, #-4]
        mov     r9, r2, lsl #2
        ldrsh   r8, [r12, +r9]
        ldr     r7, [r5]
        mov     r10, r10, asr #16
        add     r2, r2, r3
        mul     r10, r8, r10
        add     r6, r12, r9
        ldrsh   r8, [r6, #2]
        mov     r7, r7, asr #16
        subs    r0, r0, #1
        mul     r7, r8, r7
        sub     r10, r10, r7
        add     r4, r10, r4
        str     r4, [r1]
        ldr     r8, [r5, #-4]
        ldrsh   r7, [r6, #2]
        ldrsh   r9, [r12, +r9]
        ldr     r6, [r5], #8
        mov     r8, r8, asr #16
        mul     r8, r7, r8
        mov     r6, r6, asr #16
        mla     r8, r9, r6, r8
        add     lr, r8, lr
        str     lr, [r1, #4]
        bne     LBWG0
LBWG1:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r10, pc}
LBWG2:
        mvn     r0, #0x10
        ldmia   sp!, {r1, r4 - r10, pc}
LBWG3:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r10, pc}
        .long   0x4c4d5343


