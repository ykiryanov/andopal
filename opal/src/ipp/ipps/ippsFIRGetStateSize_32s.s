        .text
        .align  4
        .globl  _ippsFIRGetStateSize_32s


_ippsFIRGetStateSize_32s:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0
        mvnle   r0, #0x19
        bxle    lr
        add     r2, r0, r0, lsl #1
        add     r2, r2, #4
        mov     r0, r0, lsl #3
        mov     r2, r2, lsl #3
        add     r0, r0, #0xF
        add     r2, r2, #0xF
        bic     r0, r0, #0xF
        bic     r2, r2, #0xF
        add     r0, r0, r2
        mov     r2, #0x7F
        orr     r2, r2, #2, 18
        add     r2, r0, r2
        mov     r0, #0
        str     r2, [r1]
        bx      lr


