        .text
        .align  4
        .globl  __intel_fcmp
        .globl  __cmpsf2


__intel_fcmp:
__cmpsf2:
        mov     r12, #0xFF, 8
        cmp     r12, r0, lsl #1
        cmphi   r12, r1, lsl #1
        bls     LAFI_SGLCMP_NAN_INF
LAFI_SGLCMP_BACK_MAIN:
        cmp     r0, r1
        moveq   r0, #0
        bxeq    lr
        teq     r0, r1
        movmi   r0, r0, asr #31
        orrmi   r0, r0, #1
        bxmi    lr
        cmp     r0, r1
        movcs   r0, #1
        mvncc   r0, #0
        cmp     r1, #0
        rsbmi   r0, r0, #0
        bx      lr
LAFI_SGLCMP_NAN_INF:
        cmp     r12, r0, lsl #1
        movcc   r0, #2
        bxcc    lr
        cmp     r12, r1, lsl #1
        movcc   r0, #2
        bxcc    lr
        b       LAFI_SGLCMP_BACK_MAIN


