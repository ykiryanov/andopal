        .text
        .align  4
        .globl  __aeabi_dcmple
        .globl  __ledf2
        .globl  __aeabi_dcmplt
        .globl  __ltdf2


__ltdf2:
__aeabi_dcmplt:
__aeabi_dcmple:
__ledf2:
        orrs    r12, r0, r1, lsl #1
        orreqs  r12, r2, r3, lsl #1
        moveq   r3, r1
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        cmphi   r12, r3, lsl #1
        bls     LAGF_lt_INF_NAN_INPUT
LAGF_BACK_MAIN:
        and     r12, r1, #2, 2
        teq     r1, r3
        movmi   r1, #1
        submi   r0, r1, r12, lsr #30
        bxmi    lr
        mov     r1, r1, lsl #1
        cmp     r1, r3, lsl #1
        cmpeq   r0, r2
        movhi   r0, #1
        mvncc   r0, #0
        moveq   r0, #0
        cmp     r12, #0
        rsbne   r0, r0, #0
        bx      lr
LAGF_lt_INF_NAN_INPUT:
        cmp     r12, r1, lsl #1
        rsbeqs  r0, r0, #0
        movcc   r0, #1
        bxcc    lr
        cmp     r12, r3, lsl #1
        rsbeqs  r2, r2, #0
        movcc   r0, #1
        bxcc    lr
        b       LAGF_BACK_MAIN


