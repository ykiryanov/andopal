        .text
        .align  4
        .globl  ownvc_Copy8x8HP_HF1_8u_C1R


ownvc_Copy8x8HP_HF1_8u_C1R:
        stmdb   sp!, {r4, lr}
        mov     r12, #8
LEKT0:
        ldrb    r4, [r0]
        ldrb    lr, [r0, #1]
        subs    r12, r12, #1
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2]
        ldrb    lr, [r0, #2]
        ldrb    r4, [r0, #1]
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #1]
        ldrb    lr, [r0, #3]
        ldrb    r4, [r0, #2]
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #2]
        ldrb    lr, [r0, #4]
        ldrb    r4, [r0, #3]
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #3]
        ldrb    lr, [r0, #5]
        ldrb    r4, [r0, #4]
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #4]
        ldrb    lr, [r0, #6]
        ldrb    r4, [r0, #5]
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #5]
        ldrb    lr, [r0, #7]
        ldrb    r4, [r0, #6]
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #6]
        ldrb    lr, [r0, #8]
        ldrb    r4, [r0, #7]
        add     r0, r0, r1
        add     lr, r4, lr
        mov     lr, lr, asr #1
        strb    lr, [r2, #7]
        add     r2, r2, r3
        bne     LEKT0
        ldmia   sp!, {r4, pc}


