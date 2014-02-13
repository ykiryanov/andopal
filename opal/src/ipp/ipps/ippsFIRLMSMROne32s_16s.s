        .text
        .align  4
        .globl  _ippsFIRLMSMROne32s_16s


_ippsFIRLMSMROne32s_16s:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r1, #0
        beq     LBWJ4
        cmp     r0, #0
        beq     LBWJ4
        ldr     r3, [r1]
        ldr     r2, [pc, #0x10C]
        cmp     r2, r3
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r9, pc}
        ldr     r3, [r1, #0x18]
        ldr     r2, [r1, #0x1C]
        ldr     r5, [r1, #0x10]
        ldr     r12, [r1, #0xC]
        ldr     r4, [r1, #8]
        ldr     r1, [r1, #4]
        add     r3, r2, r3
        mov     lr, #0
        add     r2, r3, r5
        mov     r7, lr
        cmp     r12, #0
        sub     r6, r2, #1
        str     r7, [r0]
        ble     LBWJ3
        cmp     r12, #5
        blt     LBWJ1
        sub     r3, r12, #5
        add     r2, r1, #4
LBWJ0:
        ldr     r8, [r2, #-4]
        mov     r9, r6, lsl #1
        ldrsh   r9, [r4, +r9]
        mov     r8, r8, asr #16
        add     lr, lr, #4
        mla     r7, r9, r8, r7
        add     r8, r5, r6
        add     r6, r5, r8
        cmp     lr, r3
        mov     r8, r8, lsl #1
        str     r7, [r0]
        ldr     r9, [r2]
        ldrsh   r8, [r4, +r8]
        mov     r9, r9, asr #16
        mla     r7, r8, r9, r7
        mov     r8, r6, lsl #1
        add     r6, r5, r6
        str     r7, [r0]
        ldr     r9, [r2, #4]
        ldrsh   r8, [r4, +r8]
        mov     r9, r9, asr #16
        mla     r7, r8, r9, r7
        mov     r8, r6, lsl #1
        add     r6, r5, r6
        str     r7, [r0]
        ldr     r9, [r2, #8]
        ldrsh   r8, [r4, +r8]
        add     r2, r2, #0x10
        mov     r9, r9, asr #16
        mla     r7, r8, r9, r7
        str     r7, [r0]
        ble     LBWJ0
LBWJ1:
        add     r1, r1, lr, lsl #2
LBWJ2:
        ldr     r3, [r1], #4
        mov     r2, r6, lsl #1
        ldrsh   r2, [r4, +r2]
        mov     r3, r3, asr #16
        mla     r7, r2, r3, r7
        add     lr, lr, #1
        cmp     lr, r12
        add     r6, r5, r6
        str     r7, [r0]
        blt     LBWJ2
LBWJ3:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LBWJ4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}
        .long   0x4c4d5352


