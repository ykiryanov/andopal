        .text
        .align  4
        .globl  ownvc_Copy4x8HP_HF0_8u_C1R


ownvc_Copy4x8HP_HF0_8u_C1R:
        stmdb   sp!, {r4, lr}
        mov     r12, #8
LELI0:
        ldrb    lr, [r0, #1]
        ldrb    r4, [r0]
        subs    r12, r12, #1
        add     lr, r4, lr
        add     lr, lr, #1
        mov     lr, lr, asr #1
        strb    lr, [r2]
        ldrb    lr, [r0, #2]
        ldrb    r4, [r0, #1]
        add     lr, r4, lr
        add     lr, lr, #1
        mov     lr, lr, asr #1
        strb    lr, [r2, #1]
        ldrb    lr, [r0, #3]
        ldrb    r4, [r0, #2]
        add     lr, r4, lr
        add     lr, lr, #1
        mov     lr, lr, asr #1
        strb    lr, [r2, #2]
        ldrb    lr, [r0, #4]
        ldrb    r4, [r0, #3]
        add     r0, r0, r1
        add     lr, r4, lr
        add     lr, lr, #1
        mov     lr, lr, asr #1
        strb    lr, [r2, #3]
        add     r2, r2, r3
        bne     LELI0
        ldmia   sp!, {r4, pc}


