        .text
        .align  4
        .globl  _ippsMul_NR_16s_ISfs


_ippsMul_NR_16s_ISfs:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LDRK4
        cmp     r1, #0
        beq     LDRK4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r3, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r7, pc}
        cmp     r3, #0
        mov     r5, #0
        moveq   lr, #0
        beq     LDRK0
        mov     lr, #1
        sub     r12, r3, #1
        mov     lr, lr, lsl r12
LDRK0:
        cmp     r2, #0
        ble     LDRK3
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r4, r12
LDRK1:
        ldrsh   r7, [r0], #2
        ldrsh   r6, [r1]
        mla     r7, r6, r7, lr
        mov     r6, r7, asr r3
        cmp     r4, r6
        sublt   r6, r5, #2, 18
        mvnlt   r6, r6
        blt     LDRK2
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, r12
LDRK2:
        strh    r6, [r1], #2
        subs    r2, r2, #1
        bne     LDRK1
LDRK3:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDRK4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


