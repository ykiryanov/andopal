        .text
        .align  4
        .globl  ownph263_QuantInv_AdvIntra_16s_I


ownph263_QuantInv_AdvIntra_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r2, #0
        mov     r1, r1, lsl #1
        blt     LFFU3
        cmp     r2, #6
        mov     lr, #0
        blt     LFFU1
        sub     r12, r2, #6
        mov     r3, r0
LFFU0:
        ldrsh   r5, [r3]
        ldrsh   r4, [r3, #2]
        ldrsh   r6, [r3, #4]
        mul     r5, r1, r5
        ldrsh   r7, [r3, #6]
        mul     r4, r1, r4
        mul     r6, r1, r6
        mul     r7, r1, r7
        strh    r5, [r3]
        ldrsh   r5, [r3, #8]
        strh    r4, [r3, #2]
        strh    r6, [r3, #4]
        strh    r7, [r3, #6]
        mul     r5, r1, r5
        add     lr, lr, #5
        cmp     lr, r12
        strh    r5, [r3, #8]
        add     r3, r3, #0xA
        ble     LFFU0
LFFU1:
        add     r0, r0, lr, lsl #1
LFFU2:
        ldrsh   r3, [r0]
        add     lr, lr, #1
        cmp     lr, r2
        mul     r3, r1, r3
        strh    r3, [r0], #2
        ble     LFFU2
LFFU3:
        ldmia   sp!, {r4 - r7, pc}


