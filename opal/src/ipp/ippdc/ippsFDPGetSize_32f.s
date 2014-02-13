        .text
        .align  4
        .globl  _ippsFDPGetSize_32f


_ippsFDPGetSize_32f:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0
        mvnle   r0, #5
        bxle    lr
        add     r2, r0, r0, lsl #2
        add     r2, r0, r2
        mov     r0, r2, lsl #2
        add     r0, r0, #0x41, 30
        str     r0, [r1]
        mov     r0, #0
        bx      lr


