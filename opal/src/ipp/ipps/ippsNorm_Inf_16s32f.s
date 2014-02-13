        .text
        .align  4
        .globl  _ippsNorm_Inf_16s32f


_ippsNorm_Inf_16s32f:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mov     r4, r2
        beq     LBCJ2
        cmp     r4, #0
        beq     LBCJ2
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, pc}
        cmp     r1, #0
        mov     r2, #0
        ble     LBCJ1
LBCJ0:
        ldrsh   r3, [r0], #2
        eor     r12, r3, r3, asr #31
        sub     r12, r12, r3, asr #31
        cmp     r12, r2
        movgt   r2, r12
        subs    r1, r1, #1
        bne     LBCJ0
LBCJ1:
        mov     r0, r2
        bl      __floatsisf
        str     r0, [r4]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LBCJ2:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


