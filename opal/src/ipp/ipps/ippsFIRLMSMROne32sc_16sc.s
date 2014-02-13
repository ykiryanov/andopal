        .text
        .align  4
        .globl  _ippsFIRLMSMROne32sc_16sc


_ippsFIRLMSMROne32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r1, #0
        beq     LBWI2
        cmp     r0, #0
        beq     LBWI2
        ldr     r2, [r1]
        ldr     r3, [pc, #0xC0]
        cmp     r3, r2
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r11, pc}
        ldr     r2, [r1, #0x18]
        ldr     r3, [r1, #0x1C]
        ldr     r5, [r1, #0x10]
        ldr     r4, [r1, #0xC]
        ldr     lr, [r1, #8]
        ldr     r1, [r1, #4]
        add     r2, r3, r2
        mov     r12, #0
        add     r2, r2, r5
        mov     r3, r12
        cmp     r4, #0
        sub     r2, r2, #1
        str     r3, [r0]
        str     r3, [r0, #4]
        ble     LBWI1
        add     r1, r1, #4
LBWI0:
        mov     r9, r2, lsl #2
        ldr     r8, [r1]
        ldr     r11, [r1, #-4]
        ldrsh   r10, [lr, +r9]
        add     r6, lr, r9
        ldrsh   r7, [r6, #2]
        mov     r8, r8, asr #16
        mov     r11, r11, asr #16
        mul     r10, r10, r11
        mul     r8, r7, r8
        add     r2, r5, r2
        subs    r4, r4, #1
        sub     r10, r10, r8
        add     r3, r10, r3
        str     r3, [r0]
        ldr     r8, [r1, #-4]
        ldrsh   r7, [r6, #2]
        ldrsh   r9, [lr, +r9]
        ldr     r6, [r1], #8
        mov     r8, r8, asr #16
        mul     r8, r7, r8
        mov     r6, r6, asr #16
        mla     r8, r9, r6, r8
        add     r12, r8, r12
        str     r12, [r0, #4]
        bne     LBWI0
LBWI1:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBWI2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   0x4c4d5343


