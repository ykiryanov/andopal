        .text
        .align  4
        .globl  ownFindAbsMaximum_GSMAMR


ownFindAbsMaximum_GSMAMR:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r1, #0
        mov     r3, #5
        movle   r0, r3
        ldmleia sp!, {r4 - r6, pc}
        mov     r12, #0
LDQH0:
        cmp     r12, #0x28
        mov     lr, r12
        movge   r4, #0
        bge     LDQH2
        mov     r4, #0
LDQH1:
        ldr     r5, [r0, +lr, lsl #2]
        add     lr, r2, lr
        eor     r6, r5, r5, asr #31
        sub     r6, r6, r5, asr #31
        cmp     r6, r4
        movgt   r4, r6
        cmp     lr, #0x28
        blt     LDQH1
LDQH2:
        add     r12, r12, #1
        cmp     r12, r1
        add     r3, r3, r4
        blt     LDQH0
        mov     r0, r3
        ldmia   sp!, {r4 - r6, pc}


