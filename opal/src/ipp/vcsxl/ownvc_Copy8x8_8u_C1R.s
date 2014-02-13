        .text
        .align  4
        .globl  ownvc_Copy8x8_8u_C1R


ownvc_Copy8x8_8u_C1R:
        stmdb   sp!, {lr}
        mov     r12, #8
LEKQ0:
        ldrb    lr, [r0]
        subs    r12, r12, #1
        strb    lr, [r2]
        ldrb    lr, [r0, #1]
        strb    lr, [r2, #1]
        ldrb    lr, [r0, #2]
        strb    lr, [r2, #2]
        ldrb    lr, [r0, #3]
        strb    lr, [r2, #3]
        ldrb    lr, [r0, #4]
        strb    lr, [r2, #4]
        ldrb    lr, [r0, #5]
        strb    lr, [r2, #5]
        ldrb    lr, [r0, #6]
        strb    lr, [r2, #6]
        ldrb    lr, [r0, #7]
        add     r0, r0, r1
        strb    lr, [r2, #7]
        add     r2, r2, r3
        bne     LEKQ0
        ldr     pc, [sp], #4


