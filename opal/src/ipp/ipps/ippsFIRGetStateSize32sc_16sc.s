        .text
        .align  4
        .globl  _ippsFIRGetStateSize32sc_16sc


_ippsFIRGetStateSize32sc_16sc:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0
        mvnle   r0, #0x19
        bxle    lr
        add     r3, r0, r0, lsl #1
        add     r3, r3, #4
        mov     r2, r0, lsl #2
        mov     r3, r3, lsl #2
        mov     r0, r0, lsl #3
        add     r3, r3, #0xF
        add     r2, r2, #0xF
        add     r0, r0, #0xF
        bic     r3, r3, #0xF
        bic     r2, r2, #0xF
        bic     r0, r0, #0xF
        add     r3, r2, r3
        add     r0, r2, r0
        add     r3, r0, r3
        mov     r0, #0x80
        orr     r0, r0, #2, 18
        add     r0, r3, r0
        str     r0, [r1]
        mov     r0, #0
        bx      lr


