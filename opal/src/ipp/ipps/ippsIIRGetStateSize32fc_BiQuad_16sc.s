        .text
        .align  4
        .globl  _ippsIIRGetStateSize32fc_BiQuad_16sc


_ippsIIRGetStateSize32fc_BiQuad_16sc:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #1
        mvnlt   r0, #0x18
        bxlt    lr
        rsb     r2, r0, r0, lsl #2
        mov     r3, r0, lsl #4
        mov     r2, r2, lsl #4
        add     r2, r2, #7
        add     r3, r3, #7
        bic     r2, r2, #7
        bic     r3, r3, #7
        add     r2, r2, r3
        add     r3, r0, r0, lsl #2
        mov     r0, r0, lsl #5
        mov     r3, r3, lsl #2
        add     r0, r0, #7
        add     r3, r3, #7
        bic     r0, r0, #7
        bic     r3, r3, #7
        add     r0, r0, #0x50
        add     r2, r2, r3
        add     r0, r2, r0
        str     r0, [r1]
        mov     r0, #0
        bx      lr


