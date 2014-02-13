        .text
        .align  4
        .globl  _ippsMulC_NR_16s_ISfs


_ippsMulC_NR_16s_ISfs:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r3, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r6, pc}
        cmp     r3, #0
        mov     lr, #0
        moveq   r12, #0
        beq     LDRN0
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
LDRN0:
        cmp     r2, #0
        ble     LDRN3
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r5, r4
LDRN1:
        ldrsh   r6, [r1]
        mla     r6, r0, r6, r12
        mov     r6, r6, asr r3
        cmp     r5, r6
        sublt   r6, lr, #2, 18
        mvnlt   r6, r6
        blt     LDRN2
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, r4
LDRN2:
        strh    r6, [r1], #2
        subs    r2, r2, #1
        bne     LDRN1
LDRN3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


