        .text
        .align  4
        .globl  ownvc_Copy4x8HP_FH1_8u_C1R


ownvc_Copy4x8HP_FH1_8u_C1R:
        stmdb   sp!, {r4, r5, lr}
        mov     lr, #8
LELJ0:
        mov     r12, r0
        add     r0, r0, r1
        ldrb    r4, [r0]
        ldrb    r5, [r12]
        subs    lr, lr, #1
        add     r4, r5, r4
        mov     r4, r4, asr #1
        strb    r4, [r2]
        ldrb    r4, [r0, #1]
        ldrb    r5, [r12, #1]
        add     r4, r5, r4
        mov     r4, r4, asr #1
        strb    r4, [r2, #1]
        ldrb    r4, [r0, #2]
        ldrb    r5, [r12, #2]
        add     r4, r5, r4
        mov     r4, r4, asr #1
        strb    r4, [r2, #2]
        ldrb    r4, [r0, #3]
        ldrb    r12, [r12, #3]
        add     r4, r12, r4
        mov     r12, r4, asr #1
        strb    r12, [r2, #3]
        add     r2, r2, r3
        bne     LELJ0
        ldmia   sp!, {r4, r5, pc}


