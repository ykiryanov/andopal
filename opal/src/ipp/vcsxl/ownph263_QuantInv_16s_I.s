        .text
        .align  4
        .globl  ownph263_QuantInv_16s_I


ownph263_QuantInv_16s_I:
        stmdb   sp!, {r4, r5, lr}
        tst     r1, #1
        subeq   lr, r1, #1
        movne   lr, r1
        cmp     r3, r2
        bgt     LFFV2
        mov     r12, #0xFF
        sub     r4, r3, #1
        orr     r12, r12, #7, 24
        add     r0, r0, r3, lsl #1
        sub     r2, r2, r4
        mvn     r3, r12
LFFV0:
        ldrsh   r5, [r0]
        cmp     r5, #0
        beq     LFFV1
        cmp     r5, #0
        rsble   r4, lr, #0
        movgt   r4, lr
        mov     r5, r5, lsl #1
        mla     r4, r1, r5, r4
        mov     r5, r3
        cmp     r12, r4
        movlt   r4, r12
        cmp     r4, r3
        movgt   r5, r4
        strh    r5, [r0]
LFFV1:
        subs    r2, r2, #1
        add     r0, r0, #2
        bne     LFFV0
LFFV2:
        ldmia   sp!, {r4, r5, pc}


