        .text
        .align  4
        .globl  __aeabi_fcmpun
        .globl  __unsf2


__aeabi_fcmpun:
__unsf2:
        mov     r12, #0xFF, 8
        cmp     r12, r0, lsl #1
        cmpcs   r12, r1, lsl #1
        movcc   r0, #1
        movcs   r0, #0
        bx      lr


