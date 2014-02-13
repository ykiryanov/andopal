        .text
        .align  4
        .globl  __aeabi_i2d
        .globl  __floatsidf


__aeabi_i2d:
__floatsidf:
        cmp     r0, #0
        moveq   r1, #0
        bxeq    lr
        ands    r12, r0, #2, 2
        rsbne   r0, r0, #0
        clz     r2, r0
        mov     r3, r0, lsl r2
        rsb     r2, r2, #0x41, 28
        add     r2, r2, #0xD
        orr     r2, r12, r2, lsl #20
        mov     r0, r3, lsl #21
        add     r1, r2, r3, lsr #11
        bx      lr


