        .text
        .align  4
        .globl  _ipps_ibMpyBySqrt2_32s


_ipps_ibMpyBySqrt2_32s:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r1, #0
        ble     LCCB3
        mov     r2, #0x82
        cmp     r1, #5
        orr     r2, r2, #0x5A, 24
        mov     lr, #0
        blt     LCCB1
        sub     r12, r1, #5
        add     r3, r0, #4
LCCB0:
        ldr     r7, [r3, #-4]
        ldr     r8, [r3]
        ldr     r4, [r3, #4]
        ldr     r5, [r3, #8]
        bic     r6, r7, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        mul     r6, r6, r2
        mov     r7, r7, asr #16
        mul     r7, r7, r2
        add     lr, lr, #4
        mov     r6, r6, asr #15
        cmp     lr, r12
        bic     r9, r8, #0xFF, 8
        add     r7, r6, r7, lsl #1
        str     r7, [r3, #-4]
        bic     r7, r4, #0xFF, 8
        bic     r6, r5, #0xFF, 8
        bic     r9, r9, #0xFF, 16
        mul     r9, r9, r2
        bic     r7, r7, #0xFF, 16
        mul     r7, r7, r2
        bic     r6, r6, #0xFF, 16
        mul     r6, r6, r2
        mov     r8, r8, asr #16
        mul     r8, r8, r2
        mov     r4, r4, asr #16
        mul     r4, r4, r2
        mov     r5, r5, asr #16
        mul     r5, r5, r2
        mov     r9, r9, asr #15
        mov     r7, r7, asr #15
        mov     r6, r6, asr #15
        add     r8, r9, r8, lsl #1
        add     r4, r7, r4, lsl #1
        add     r5, r6, r5, lsl #1
        str     r8, [r3]
        str     r4, [r3, #4]
        str     r5, [r3, #8]
        add     r3, r3, #0x10
        ble     LCCB0
LCCB1:
        add     r0, r0, lr, lsl #2
LCCB2:
        ldr     r12, [r0]
        add     lr, lr, #1
        cmp     lr, r1
        bic     r3, r12, #0xFF, 8
        bic     r3, r3, #0xFF, 16
        mul     r3, r3, r2
        mov     r12, r12, asr #16
        mul     r12, r12, r2
        mov     r3, r3, asr #15
        add     r12, r3, r12, lsl #1
        str     r12, [r0], #4
        blt     LCCB2
LCCB3:
        ldmia   sp!, {r4 - r9, pc}


