        .text
        .align  4
        .globl  __aeabi_ui2d
        .globl  __floatunssidf


__aeabi_ui2d:
__floatunssidf:
        cmp     r0, #0
        moveq   r1, #0
        bxeq    lr
        clz     r2, r0
        mov     r3, r0, lsl r2
        rsb     r2, r2, #0x41, 28
        add     r2, r2, #0xD
        mov     r2, r2, lsl #20
        mov     r0, r3, lsl #21
        add     r1, r2, r3, lsr #11
        bx      lr


