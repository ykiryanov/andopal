        .text
        .align  4
        .globl  __intel_dcmp
        .globl  __cmpdf2


__intel_dcmp:
__cmpdf2:
        mov     r12, #0xFF, 8
        orr     r12, r12, #0xE, 12
        cmp     r12, r1, lsl #1
        cmphi   r12, r3, lsl #1
        bls     LAGV_cmp_INF_NAN_INPUT
LAGV_BACK_MAIN:
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
        mvnne   r0, r0
        addne   r0, r0, #1
        bx      lr
LAGV_cmp_INF_NAN_INPUT:
        cmp     r12, r1, lsl #1
        rsbeqs  r0, r0, #0
        movcc   r0, #2
        bxcc    lr
        cmp     r12, r3, lsl #1
        rsbeqs  r2, r2, #0
        movcc   r0, #2
        bxcc    lr
        b       LAGV_BACK_MAIN


