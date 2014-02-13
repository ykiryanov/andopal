        .text
        .align  4
        .globl  ownvc_Copy8x4HP_FH1_8u_C1R


ownvc_Copy8x4HP_FH1_8u_C1R:
        stmdb   sp!, {r4, r5, lr}
        mov     r12, #4
LELC0:
        mov     lr, r0
        ldrb    r4, [lr]
        add     r0, r0, r1
        ldrb    r5, [r0]
        subs    r12, r12, #1
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2]
        ldrb    r4, [lr, #1]
        ldrb    r5, [r0, #1]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2, #1]
        ldrb    r5, [r0, #2]
        ldrb    r4, [lr, #2]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2, #2]
        ldrb    r5, [r0, #3]
        ldrb    r4, [lr, #3]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2, #3]
        ldrb    r5, [r0, #4]
        ldrb    r4, [lr, #4]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2, #4]
        ldrb    r5, [r0, #5]
        ldrb    r4, [lr, #5]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2, #5]
        ldrb    r5, [r0, #6]
        ldrb    r4, [lr, #6]
        add     r5, r4, r5
        mov     r4, r5, asr #1
        strb    r4, [r2, #6]
        ldrb    r4, [r0, #7]
        ldrb    lr, [lr, #7]
        add     r4, lr, r4
        mov     lr, r4, asr #1
        strb    lr, [r2, #7]
        add     r2, r2, r3
        bne     LELC0
        ldmia   sp!, {r4, r5, pc}


