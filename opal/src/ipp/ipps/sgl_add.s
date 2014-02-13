        .text
        .align  4
        .globl  __rsbsf3
        .globl  __aeabi_frsub
        .globl  __aeabi_fsub
        .globl  __subsf3
        .globl  __aeabi_fadd
        .globl  __addsf3


__rsbsf3:
__aeabi_frsub:
        mov     r12, r0
        mov     r0, r1
        mov     r1, r12
__aeabi_fsub:
__subsf3:
        mov     r12, #0xFF, 8
        cmp     r12, r1, lsl #1
        bcc     LAFJ_SGL_SUB_SPECIAL
        eor     r1, r1, #2, 2
__addsf3:
__aeabi_fadd:
        mov     r0, r0, ror #31
        mov     r1, r1, ror #31
        mov     r12, #0xFF
        ands    r3, r1, r12, lsl #25
        teqne   r3, r12, lsl #25
        andnes  r2, r0, r12, lsl #25
        teqne   r2, r12, lsl #25
        beq     LAFJ_SGL_ADD_SPECIAL
LAFJ_RETURN_MAIN_A:
        subs    r2, r1, r0
        addcs   r0, r0, r2
        subcs   r1, r1, r2
        mvn     r12, r12, ror #1
        and     r3, r12, r1, lsl #6
        orr     r3, r3, #1, 2
        and     r2, r12, r0, lsl #6
        orr     r2, r2, #1, 2
        mov     r1, r1, ror #24
LAFJ_RETURN_DENORMAL:
        rsb     r1, r1, r0, ror #24
        tst     r1, #1, 24
        rsbne   r3, r3, #0
        add     r2, r2, r3, asr r1
        clz     r12, r2
        movs    r2, r2, lsl r12
        moveq   r0, #0
        subs    r0, r0, r12, lsl #24
        bcc     LAFJ_SGL_UF_ADD
        movs    r12, r2, lsr #8
        mov     r0, r0, ror #24
        adc     r0, r12, r0, lsl #23
        movcss  r12, r0, rrx
        bxcc    lr
        movs    r2, r2, lsl #25
        rsbeq   r1, r1, #0x20
        moveqs  r3, r3, lsl r1
        biceq   r0, r0, #1
        bx      lr
LAFJ_B_INF:
        eor     r2, r0, r1
        cmp     r2, #2, 2
        moveq   r0, #0xFF, 8
        orreq   r0, r0, #3, 10
        movne   r0, r1
LAFJ_RETURN:
        ldmia   sp!, {r4 - r8}
        bx      lr
LAFJ_SGL_ADD_SPECIAL_B:
        cmp     r4, r7
        orrhi   r0, r0, #1, 10
        bhi     LAFJ_RETURN
        cmp     r5, r7
        orrhi   r0, r1, #1, 10
        bhi     LAFJ_RETURN
        beq     LAFJ_B_INF
        cmp     r4, #0x32, 10
        bcs     LAFJ_RETURN
        cmp     r5, r4
        movhi   r6, r5
        movhi   r5, r4
        movhi   r4, r6
        movhi   r6, r2
        movhi   r2, r3
        movhi   r3, r6
        mvn     r7, #1
        mov     r1, r3, lsr #23
        orr     r1, r1, #1
        mov     r0, r2, lsr #31
        and     r3, r5, r7, lsr #9
        and     r2, r4, r7, lsr #9
        cmp     r4, #2, 10
        orrcs   r2, r2, #2, 10
        orrcs   r0, r0, r4, lsl #1
        orrcc   r0, r0, #1, 8
        mov     r3, r3, lsl #7
        mov     r2, r2, lsl #7
        ldmia   sp!, {r4 - r8}
        b       LAFJ_RETURN_DENORMAL
LAFJ_SGL_SUB_SPECIAL:
        mov     r0, r0, ror #31
        mov     r1, r1, ror #31
LAFJ_SGL_ADD_SPECIAL:
        cmp     r0, #2
        bcc     LAFJ_A_ZERO_CHECK_B
        cmp     r1, #2
        bcc     LAFJ_B_ZERO
        stmdb   sp!, {r4 - r8}
        mov     r0, r0, ror #1
        mov     r1, r1, ror #1
        and     r2, r0, #2, 2
        and     r3, r1, #2, 2
        bic     r4, r0, #2, 2
        bic     r5, r1, #2, 2
        mov     r6, #0xFF
        mov     r7, r6, lsl #23
        tst     r6, r5, lsr #23
        teqne   r6, r5, lsr #23
        beq     LAFJ_SGL_ADD_SPECIAL_B
        tst     r6, r4, lsr #23
        teqne   r6, r4, lsr #23
        beq     LAFJ_SGL_ADD_SPECIAL_A
        teq     r2, r3
        beq     LAFJ_CONTINUE_OF_CHECK
LAFJ_RET_MAIN:
        mov     r0, r0, ror #31
        mov     r1, r1, ror #31
        ldmia   sp!, {r4 - r8}
        b       LAFJ_RETURN_MAIN_A
LAFJ_CONTINUE_OF_CHECK:
        and     r8, r6, r5, lsr #23
        cmp     r8, #0xFE
        beq     LAFJ_B_LARGE_EXPON
        and     r8, r6, r4, lsr #23
        cmp     r8, #0xFE
        bne     LAFJ_RET_MAIN
LAFJ_A_LARGE_EXPON:
        sub     r8, r8, r5, lsr #23
        cmp     r8, #0x19
        bcs     LAFJ_RETURN
        mov     r1, r1, lsl #8
        orr     r1, r1, #2, 2
        add     r8, r8, #8
        add     r4, r4, r1, lsr r8
        rsb     r6, r8, #0x20
        mov     r6, r1, lsl r6
        movs    r6, r6, lsl #1
        orr     r6, r6, r4, lsl #31
        subcss  r6, r6, #1
        adc     r4, r4, #0
        mov     r6, r4, lsr #23
        cmp     r6, #0xFF
        orrcc   r0, r2, r4
        bcc     LAFJ_RETURN
LAFJ_SGL_OF_ADD:
        orr     r0, r2, #0x7F, 8
        orr     r0, r0, #2, 10
        ldmia   sp!, {r4 - r8}
        bx      lr
LAFJ_B_LARGE_EXPON:
        mov     r6, r1
        mov     r1, r0
        mov     r0, r6
        mov     r6, r4
        mov     r4, r5
        mov     r5, r6
        b       LAFJ_A_LARGE_EXPON
LAFJ_SGL_ADD_SPECIAL_A:
        cmp     r4, r7
        orrhi   r0, r0, #1, 10
        bcs     LAFJ_RETURN
        cmp     r5, #0x32, 10
        movcs   r0, r1
        bcs     LAFJ_RETURN
        mov     r6, r5
        mov     r5, r4
        mov     r4, r6
        mov     r6, r2
        mov     r2, r3
        mov     r3, r6
        mvn     r7, #1
        mov     r0, r2, lsr #31
        orr     r0, r0, r4, lsl #1
        mov     r1, r3, lsr #23
        orr     r1, r1, #1
        and     r3, r5, r7, lsr #9
        and     r2, r4, r7, lsr #9
        orr     r2, r2, #2, 10
        mov     r3, r3, lsl #7
        mov     r2, r2, lsl #7
        ldmia   sp!, {r4 - r8}
        b       LAFJ_RETURN_DENORMAL
LAFJ_SGL_UF_ADD:
        add     r0, r0, r12, lsl #24
        sub     r1, r12, r0, lsr #24
        add     r1, r1, #8
        mov     r2, r2, lsr r1
        orr     r0, r2, r0, lsl #31
        bx      lr
LAFJ_A_ZERO_CHECK_B:
        cmp     r1, #2
        andcc   r0, r0, r1
        movcc   r0, r0, ror #1
        bxcc    lr
        bic     r2, r1, #1
        cmp     r2, #0xFF, 8
        mov     r0, r1, ror #1
        orrhi   r0, r0, #1, 10
        bx      lr
LAFJ_B_ZERO:
        bic     r2, r0, #1
        cmp     r2, #0xFF, 8
        mov     r0, r0, ror #1
        orrhi   r0, r0, #1, 10
        bx      lr


