        .text
        .align  4
        .globl  ownCalcG0_G729A_16s


ownCalcG0_G729A_16s:
        stmdb   sp!, {r0, r4 - r7, lr}
        cmp     r1, #0
        mov     r4, r2
        mov     r6, #0
        bne     LDVQ0
        strh    r6, [r4]
        ldmia   sp!, {r0, r4 - r7, pc}
LDVQ0:
        ldr     r12, [pc, #0x178]
        ldr     r3, [pc, #0x178]
        cmp     r0, #0
        beq     LDVQ3
        movs    lr, r0, asr #16
        bne     LDVQ1
        bic     lr, r0, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r5, lr, asr #8
        movne   lr, r5, lsl #1
        movne   r5, r12
        moveq   lr, lr, lsl #1
        moveq   r5, r3
        ldrsh   lr, [r5, +lr]
        add     lr, lr, #0x10
        mov     lr, lr, lsl #16
        mov     r6, lr, asr #16
        b       LDVQ2
LDVQ1:
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r5, lr, asr #8
        movne   r5, r5, lsl #1
        ldrnesh r6, [r12, +r5]
        moveq   lr, lr, lsl #1
        ldreqsh r6, [r3, +lr]
LDVQ2:
        mov     r0, r0, lsl r6
LDVQ3:
        mov     r5, #2, 2
        sub     lr, r5, #2, 18
        mov     r0, r0, asr #1
        cmp     lr, r0
        mov     lr, #0xFF
        orr     r2, lr, #0x7F, 24
        movle   r0, r2
        ble     LDVQ4
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDVQ4:
        movs    lr, r1, asr #16
        bne     LDVQ5
        bic     lr, r1, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r7, lr, asr #8
        movne   lr, r7, lsl #1
        movne   r3, r12
        moveq   lr, lr, lsl #1
        ldrsh   lr, [r3, +lr]
        add     r3, lr, #0x10
        mov     r3, r3, lsl #16
        mov     r7, r3, asr #16
        b       LDVQ6
LDVQ5:
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r7, lr, asr #8
        movne   r7, r7, lsl #1
        ldrnesh r7, [r12, +r7]
        moveq   lr, lr, lsl #1
        ldreqsh r7, [r3, +lr]
LDVQ6:
        mov     r1, r1, lsl r7
        sub     r3, r5, #2, 18
        cmp     r3, r1
        ble     LDVQ7
        add     r1, r1, #2, 18
        mov     r1, r1, asr #16
        mov     r1, r1, lsl #16
        mov     r2, r1, asr #16
LDVQ7:
        mov     r0, r0, lsl #15
        mov     r1, r2
        bl      __intel_idiv
        sub     r7, r7, r6
        add     r1, r7, #8
        cmp     r1, #0
        rsble   r1, r1, #0
        movle   r5, r0, asr r1
        ble     LDVQ8
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        mvn     r3, #2, 2
        cmp     r0, r3, asr r1
        movgt   r5, r3
        bgt     LDVQ8
        cmp     r0, r5, asr r1
        movge   r5, r0, lsl r1
LDVQ8:
        mov     r0, sp
        str     r5, [sp]
        mov     r1, #1
        bl      _ippsInvSqrt_32s_I
        ldr     r1, [sp]
        mov     r0, #0xCC
        orr     r0, r0, #3, 22
        add     r1, r1, #0x40
        mov     r1, r1, asr #7
        mul     r0, r1, r0
        mov     r0, r0, asr #15
        strh    r0, [r4]
        ldmia   sp!, {r0, r4 - r7, pc}
        .long   NormTable
        .long   NormTable2


