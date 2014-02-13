        .text
        .align  4
        .globl  _ippsAdd_16s32s_I


_ippsAdd_16s32s_I:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LDCG2
        cmp     r1, #0
        beq     LDCG2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r2, #0
        ble     LDCG1
        mvn     r12, #2, 2
        mvn     r3, #0
LDCG0:
        ldr     r5, [r1]
        ldrsh   r4, [r0], #2
        adds    lr, r4, r5
        mov     r5, r5, asr #31
        adc     r4, r5, r4, asr #31
        cmp     lr, r12
        sbcs    r5, r4, #0
        movge   lr, r12
        movge   r4, #0
        subs    r5, lr, #2, 2
        sbcs    r4, r4, r3
        movlt   r5, #0
        movlt   r4, #0
        orrs    r4, r5, r4
        moveq   lr, #2, 2
        str     lr, [r1], #4
        subs    r2, r2, #1
        bne     LDCG0
LDCG1:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LDCG2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


