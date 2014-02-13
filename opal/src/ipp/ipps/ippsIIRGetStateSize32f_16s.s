        .text
        .align  4
        .globl  _ippsIIRGetStateSize32f_16s


_ippsIIRGetStateSize32f_16s:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r0, #1
        mvnlt   r0, #0x18
        ldrlt   pc, [sp], #4
        bl      LBRS_ownsIIRGetStateSize32f_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBRS_ownsIIRGetStateSize32f_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r12, #0
        mov     r2, r12
        cmp     r0, #0
        mov     r3, #1
        movlt   r2, r3
        adds    lr, r0, #1
        movmi   r12, r3
        add     r12, r0, r12
        add     r3, r12, #1
        add     r2, r0, r2
        and     r12, r0, #1
        cmp     r12, #1
        mov     r2, r2, asr #1
        mov     r3, r3, asr #1
        addeq   r2, r2, #1
        addne   r3, r3, #1
        add     r4, r0, #2
        mov     r12, r0, lsl #2
        mov     lr, lr, lsl #2
        mov     r0, r0, lsl #3
        mov     r4, r4, lsl #3
        add     lr, lr, #7
        add     r5, r0, #7
        mov     r2, r2, lsl #2
        add     r12, r12, #7
        add     r4, r4, #7
        bic     lr, lr, #7
        bic     r0, r4, #7
        add     r2, r2, #7
        bic     r12, r12, #7
        bic     r5, r5, #7
        add     lr, lr, r5
        add     r0, r0, r12
        bic     r2, r2, #7
        mov     r3, r3, lsl #2
        add     lr, r0, lr
        add     r2, r12, r2
        add     r3, r3, #7
        mov     r0, #0x48
        add     r2, lr, r2
        bic     r3, r3, #7
        orr     r0, r0, #1, 18
        add     r2, r2, r3
        add     r0, r2, r0
        str     r0, [r1]
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}


