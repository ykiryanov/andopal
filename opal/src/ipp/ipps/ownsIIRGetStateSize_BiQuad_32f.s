        .text
        .align  4
        .globl  ownsIIRGetStateSize_BiQuad_32f


ownsIIRGetStateSize_BiQuad_32f:
        add     r2, r0, r0, lsl #2
        mov     r0, r0, lsl #3
        mov     r2, r2, lsl #2
        add     r0, r0, #0xF
        add     r2, r2, #0xF
        bic     r0, r0, #0xF
        bic     r2, r2, #0xF
        add     r0, r2, r0
        add     r0, r0, #0x40
        str     r0, [r1]
        mov     r0, #0
        bx      lr


