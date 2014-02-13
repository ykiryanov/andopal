        .text
        .align  4
        .globl  __aeabi_f2d
        .globl  __extendsfdf2


__aeabi_f2d:
__extendsfdf2:
        movs    r1, r0, lsl #1
        mov     r0, r1, lsl #28
        mov     r1, r1, lsr #4
        orrcs   r1, r1, #2, 2
        ands    r2, r1, #0xFF, 12
        teqne   r2, #0xFF, 12
        beq     LAGA_SPECIAL_INPUT
        add     r1, r1, #0xE, 6
        bx      lr
LAGA_SPECIAL_INPUT:
        cmp     r2, #0xFF, 12
        beq     LAGA_NAN_INF_INPUT
        mov     r2, r1, lsl #12
        orrs    r2, r2, r0, lsr #20
        and     r1, r1, #2, 2
        bxeq    lr
        clz     r12, r2
        mov     r2, r2, lsl r12
        mov     r2, r2, lsl #1
        rsb     r12, r12, #0xE, 26
        orr     r1, r1, r12, lsl #20
        orr     r1, r1, r2, lsr #12
        mov     r0, r2, lsl #20
        bx      lr
LAGA_NAN_INF_INPUT:
        orr     r1, r1, #7, 4
        bx      lr


