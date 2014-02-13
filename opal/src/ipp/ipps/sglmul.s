        .text
        .align  4
        .globl  __aeabi_fmul
        .globl  __mulsf3


__aeabi_fmul:
__mulsf3:
        mov     r12, #0xFF
        ands    r3, r12, r1, lsr #23
        teqne   r12, r3
        andnes  r2, r12, r0, lsr #23
        teqne   r12, r2
        beq     LAFB_SGL_MUL_SPECIAL
LAFB_RETURN_MAIN_A:
        teq     r0, r1
        mov     r12, #2, 2
        orr     r1, r12, r1, lsl #8
        orr     r0, r12, r0, lsl #8
        umull   r12, r1, r0, r1
        add     r2, r2, r3
        movmi   r3, #2, 2
        movpl   r3, #0
        cmp     r1, #2, 2
        sbc     r2, r2, #0x7F
        movcc   r1, r1, lsl #1
        orr     r12, r12, r1, lsl #25
        cmp     r2, #0xFD
        bcs     LAFB_SPECIAL_MUL_EXPONENT
        orrs    r0, r3, r1, lsr #8
        orr     r12, r12, r0, lsl #31
        subcss  r3, r12, #1
        adc     r0, r0, r2, lsl #23
        bx      lr
LAFB_RETURN:
        ldmia   sp!, {r4 - r6}
        bx      lr
LAFB_B_INF:
        cmp     r4, #0
        moveq   r0, #0xFF, 8
        orreq   r0, r0, #3, 10
        orrne   r0, r5, r2
        ldmia   sp!, {r4 - r6}
        bx      lr
LAFB_SGL_MUL_SPECIAL_B:
        cmp     r4, r12
        orrhi   r0, r0, #1, 10
        bhi     LAFB_RETURN
        cmp     r5, r12
        orrhi   r0, r1, #1, 10
        bhi     LAFB_RETURN
        beq     LAFB_B_INF
LAFB_norm_b:
        add     r3, r3, #1
        mov     r5, r5, lsl #1
        cmp     r5, #2, 10
        bcc     LAFB_norm_b
        and     r1, r1, #2, 2
        orr     r1, r1, r5
        tst     r6, r4, lsr #23
        teqne   r6, r4, lsr #23
        beq     LAFB_SGL_MUL_SPECIAL_A
        mov     r6, #0xFF
        and     r2, r6, r0, lsr #23
        sub     r2, r2, r3
        and     r3, r6, r1, lsr #23
        ldmia   sp!, {r4 - r6}
        b       LAFB_RETURN_MAIN_A
LAFB_SGL_MUL_SPECIAL:
        movs    r3, r0, lsl #1
        beq     LAFB_SGLMUL_A_ZERO_CHECK_B
        movs    r3, r1, lsl #1
        beq     LAFB_SGLMUL_B_ZERO
        stmdb   sp!, {r4 - r6}
        mov     r3, #0
        bic     r4, r0, #2, 2
        bic     r5, r1, #2, 2
        mov     r12, r12, lsl #23
        eor     r2, r0, r1
        and     r2, r2, #2, 2
        mov     r6, #0xFF
        tst     r6, r5, lsr #23
        teqne   r6, r5, lsr #23
        beq     LAFB_SGL_MUL_SPECIAL_B
LAFB_SGL_MUL_SPECIAL_A:
        cmp     r4, r12
        orrhi   r0, r0, #1, 10
        orreq   r0, r4, r2
        bcs     LAFB_RETURN
LAFB_norm_a:
        add     r3, r3, #1
        mov     r4, r4, lsl #1
        cmp     r4, #2, 10
        bcc     LAFB_norm_a
        and     r5, r0, #2, 2
        orr     r0, r5, r4
        mov     r6, #0xFF
        and     r2, r6, r0, lsr #23
        sub     r2, r2, r3
        and     r3, r6, r1, lsr #23
        ldmia   sp!, {r4 - r6}
        b       LAFB_RETURN_MAIN_A
LAFB_SPECIAL_MUL_EXPONENT:
        stmdb   sp!, {r4 - r6}
        mov     r0, r1, lsr #7
        cmp     r2, #0xFD
        bge     LAFB_SGL_MUL_OVERFLOW
        mov     r1, #0
        sub     r4, r1, r2
        cmp     r4, #0x1A
        movhi   r0, #0
        mov     r1, #1
        mov     r5, r1, lsl r4
        sub     r5, r5, r1
        and     r5, r0, r5
        mov     r0, r0, lsr r4
        orr     r12, r12, r5
        and     r6, r0, #1
        mov     r0, r0, lsr #1
        and     r1, r0, #1
        orr     r1, r12, r1
        mov     r4, #0
        cmp     r1, #0
        movne   r4, #1
        and     r4, r4, r6
        cmp     r4, #0
        addne   r0, r0, #1
        orr     r0, r0, r3
        ldmia   sp!, {r4 - r6}
        bx      lr
LAFB_SGL_MUL_OVERFLOW:
        movs    r6, r0, lsr #1
        orr     r12, r12, r6, lsl #31
        subcss  r6, r12, #1
        mov     r12, #0
        adc     r0, r12, r0, lsr #1
        cmp     r0, #1, 8
        movcs   r0, r0, lsr #1
        addcs   r2, r2, #1
        cmp     r2, #0xFE
        bcs     LAFB_RETURN_SGLMUL_OVERFLOW
        add     r0, r0, r2, lsl #23
        orr     r0, r0, r3
        ldmia   sp!, {r4 - r6}
        bx      lr
LAFB_RETURN_SGLMUL_OVERFLOW:
        mov     r0, #0x7F, 8
        add     r0, r0, #2, 10
        orr     r0, r0, r3
        ldmia   sp!, {r4 - r6}
        bx      lr
LAFB_SGLMUL_A_ZERO_CHECK_B:
        mov     r3, #0xFF, 8
        cmp     r3, r1, lsl #1
        moveq   r0, #0xFF, 8
        movcc   r0, r1
        orrls   r0, r0, #3, 10
        eorhi   r0, r0, r1
        andhi   r0, r0, #2, 2
        bx      lr
LAFB_SGLMUL_B_ZERO:
        mov     r3, #0xFF, 8
        cmp     r3, r0, lsl #1
        moveq   r0, #0xFF, 8
        orrls   r0, r0, #3, 10
        eorhi   r0, r0, r1
        andhi   r0, r0, #2, 2
        bx      lr


