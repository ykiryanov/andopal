        .text
        .align  4
        .globl  _ippsFIRLMSMROneVal32s_16s


_ippsFIRLMSMROneVal32s_16s:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r2, #0
        beq     LBWH4
        cmp     r1, #0
        beq     LBWH4
        ldr     r12, [r2]
        ldr     r3, [pc, #0x130]
        cmp     r3, r12
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r9, pc}
        ldr     r6, [r2, #0x1C]
        ldr     r7, [r2, #0x14]
        ldr     r4, [r2, #8]
        ldr     lr, [r2, #0x10]
        ldr     r12, [r2, #4]
        ldr     r3, [r2, #0xC]
        mov     r5, r6, lsl #1
        add     r8, r5, r7, lsl #1
        strh    r0, [r4, +r8]
        add     r6, r6, #1
        strh    r0, [r4, +r5]
        cmp     r6, r7
        mov     r5, #0
        movge   r6, r5
        ldr     r0, [r2, #0x18]
        str     r6, [r2, #0x1C]
        add     r6, r6, lr
        add     r0, r6, r0
        mov     r7, r5
        cmp     r3, #0
        sub     r6, r0, #1
        str     r7, [r1]
        ble     LBWH3
        cmp     r3, #5
        blt     LBWH1
        sub     r2, r3, #5
        add     r0, r12, #4
LBWH0:
        ldr     r8, [r0, #-4]
        mov     r9, r6, lsl #1
        ldrsh   r9, [r4, +r9]
        mov     r8, r8, asr #16
        add     r5, r5, #4
        mla     r7, r9, r8, r7
        add     r8, r6, lr
        add     r6, r8, lr
        cmp     r5, r2
        mov     r8, r8, lsl #1
        str     r7, [r1]
        ldr     r9, [r0]
        ldrsh   r8, [r4, +r8]
        mov     r9, r9, asr #16
        mla     r7, r8, r9, r7
        mov     r8, r6, lsl #1
        add     r6, r6, lr
        str     r7, [r1]
        ldr     r9, [r0, #4]
        ldrsh   r8, [r4, +r8]
        mov     r9, r9, asr #16
        mla     r7, r8, r9, r7
        mov     r8, r6, lsl #1
        add     r6, r6, lr
        str     r7, [r1]
        ldr     r9, [r0, #8]
        ldrsh   r8, [r4, +r8]
        add     r0, r0, #0x10
        mov     r9, r9, asr #16
        mla     r7, r8, r9, r7
        str     r7, [r1]
        ble     LBWH0
LBWH1:
        add     r12, r12, r5, lsl #2
LBWH2:
        ldr     r2, [r12], #4
        mov     r0, r6, lsl #1
        ldrsh   r0, [r4, +r0]
        mov     r2, r2, asr #16
        mla     r7, r0, r2, r7
        add     r5, r5, #1
        cmp     r5, r3
        add     r6, r6, lr
        str     r7, [r1]
        blt     LBWH2
LBWH3:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LBWH4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}
        .long   0x4c4d5352


