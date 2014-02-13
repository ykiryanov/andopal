        .text
        .align  4
        .globl  _ippsIIRGetStateSize32s_BiQuad_16s


_ippsIIRGetStateSize32s_BiQuad_16s:
        stmdb   sp!, {r4, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4, pc}
        cmp     r0, #1
        mvnlt   r0, #0x18
        ldmltia sp!, {r4, pc}
        mov     r2, r0, lsl #3
        add     r2, r2, #7
        add     r12, r0, r0, lsl #3
        bic     r3, r2, #7
        mov     r4, r0, lsl #4
        rsb     r2, r0, r0, lsl #2
        mov     lr, r0, lsl #2
        add     r12, r0, r12
        add     r0, r4, #7
        mov     r2, r2, lsl #3
        mov     r4, #0x48
        add     lr, lr, #7
        add     r2, r2, #7
        add     r12, r12, #7
        orr     r4, r4, #1, 18
        bic     r0, r0, #7
        bic     lr, lr, #7
        bic     r2, r2, #7
        bic     r12, r12, #7
        add     r4, r3, r4
        add     r0, r12, r0
        add     lr, r3, lr
        add     r2, r2, r3
        add     r4, lr, r4
        add     r0, r2, r0
        add     r4, r0, r4
        mov     r0, #0
        str     r4, [r1]
        ldmia   sp!, {r4, pc}


