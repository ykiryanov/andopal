        .text
        .align  4
        .globl  __aeabi_fneg
        .globl  __negsf2


__aeabi_fneg:
__negsf2:
        eor     r0, r0, #2, 2
        mov     r12, r0, lsl #1
        cmp     r12, #0xFF, 8
        bxls    lr
        eor     r0, r0, #2, 2
        orr     r0, r0, #1, 10
        bx      lr


