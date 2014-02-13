        .text
        .align  4
        .globl  ownvc_Copy8x8HP_FH0_8u_C1R


ownvc_Copy8x8HP_FH0_8u_C1R:
        stmdb   sp!, {r4, r5, lr}
        mov     r12, #8
LEKW0:
        mov     lr, r0
        add     r0, r0, r1
        ldrb    r4, [r0]
        ldrb    r5, [lr]
        subs    r12, r12, #1
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2]
        ldrb    r4, [r0, #1]
        ldrb    r5, [lr, #1]
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2, #1]
        ldrb    r4, [r0, #2]
        ldrb    r5, [lr, #2]
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2, #2]
        ldrb    r4, [r0, #3]
        ldrb    r5, [lr, #3]
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2, #3]
        ldrb    r4, [r0, #4]
        ldrb    r5, [lr, #4]
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2, #4]
        ldrb    r4, [r0, #5]
        ldrb    r5, [lr, #5]
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2, #5]
        ldrb    r4, [r0, #6]
        ldrb    r5, [lr, #6]
        add     r4, r5, r4
        add     r4, r4, #1
        mov     r4, r4, asr #1
        strb    r4, [r2, #6]
        ldrb    r4, [r0, #7]
        ldrb    lr, [lr, #7]
        add     r4, lr, r4
        add     lr, r4, #1
        mov     lr, lr, asr #1
        strb    lr, [r2, #7]
        add     r2, r2, r3
        bne     LEKW0
        ldmia   sp!, {r4, r5, pc}

