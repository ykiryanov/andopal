        .text
        .align  4
        .globl  ownDotProd_16s32s_PX


ownDotProd_16s32s_PX:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r2, #0
        mov     r6, #0
        movle   r12, r6
        ble     LDRH3
        cmp     r2, #6
        movlt   r12, r6
        blt     LDRH1
        mov     r12, r6
        sub     r5, r2, #6
        mov     r4, r1
        mov     lr, r0
LDRH0:
        ldrsh   r7, [r4]
        ldrsh   r8, [lr]
        add     r6, r6, #5
        cmp     r6, r5
        mla     r12, r8, r7, r12
        ldrsh   r7, [r4, #2]
        ldrsh   r8, [lr, #2]
        mla     r12, r8, r7, r12
        ldrsh   r7, [r4, #4]
        ldrsh   r8, [lr, #4]
        mla     r12, r8, r7, r12
        ldrsh   r7, [r4, #6]
        ldrsh   r8, [lr, #6]
        mla     r12, r8, r7, r12
        ldrsh   r7, [r4, #8]
        ldrsh   r8, [lr, #8]
        add     r4, r4, #0xA
        add     lr, lr, #0xA
        mla     r12, r8, r7, r12
        ble     LDRH0
LDRH1:
        add     r1, r1, r6, lsl #1
        add     r0, r0, r6, lsl #1
LDRH2:
        ldrsh   r4, [r1], #2
        ldrsh   lr, [r0], #2
        add     r6, r6, #1
        mla     r12, lr, r4, r12
        cmp     r6, r2
        blt     LDRH2
LDRH3:
        str     r12, [r3]
        ldmia   sp!, {r4 - r8, pc}


