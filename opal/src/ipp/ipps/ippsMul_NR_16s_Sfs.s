        .text
        .align  4
        .globl  _ippsMul_NR_16s_Sfs


_ippsMul_NR_16s_Sfs:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r12, [sp, #0x18]
        cmp     r0, #0
        beq     LDRJ4
        cmp     r1, #0
        beq     LDRJ4
        cmp     r2, #0
        beq     LDRJ4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r12, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r8, pc}
        cmp     r12, #0
        mov     r6, #0
        moveq   r4, #0
        beq     LDRJ0
        mov     r4, #1
        sub     lr, r12, #1
        mov     r4, r4, lsl lr
LDRJ0:
        cmp     r3, #0
        ble     LDRJ3
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     r5, lr
LDRJ1:
        ldrsh   r8, [r1], #2
        ldrsh   r7, [r0], #2
        mla     r8, r7, r8, r4
        mov     r7, r8, asr r12
        cmp     r5, r7
        sublt   r7, r6, #2, 18
        mvnlt   r7, r7
        blt     LDRJ2
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        movlt   r7, lr
LDRJ2:
        strh    r7, [r2], #2
        subs    r3, r3, #1
        bne     LDRJ1
LDRJ3:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDRJ4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


