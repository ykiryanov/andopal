        .text
        .align  4
        .globl  ownph263_QuantInv_ModQ_16s_I


ownph263_QuantInv_ModQ_16s_I:
        stmdb   sp!, {lr}
        tst     r1, #1
        subeq   r12, r1, #1
        movne   r12, r1
        cmp     r3, r2
        bgt     LFFT2
        sub     lr, r3, #1
        add     r0, r0, r3, lsl #1
        sub     r2, r2, lr
LFFT0:
        ldrsh   lr, [r0]
        cmp     lr, #0
        beq     LFFT1
        cmp     lr, #0
        rsble   r3, r12, #0
        movgt   r3, r12
        mov     lr, lr, lsl #1
        mla     r3, r1, lr, r3
        strh    r3, [r0]
LFFT1:
        subs    r2, r2, #1
        add     r0, r0, #2
        bne     LFFT0
LFFT2:
        ldr     pc, [sp], #4


