        .text
        .align  4
        .globl  ownvc_Copy4x8_8u_C1R


ownvc_Copy4x8_8u_C1R:
        stmdb   sp!, {lr}
        mov     r12, #8
LELE0:
        ldrb    lr, [r0]
        subs    r12, r12, #1
        strb    lr, [r2]
        ldrb    lr, [r0, #1]
        strb    lr, [r2, #1]
        ldrb    lr, [r0, #2]
        strb    lr, [r2, #2]
        ldrb    lr, [r0, #3]
        add     r0, r0, r1
        strb    lr, [r2, #3]
        add     r2, r2, r3
        bne     LELE0
        ldr     pc, [sp], #4


