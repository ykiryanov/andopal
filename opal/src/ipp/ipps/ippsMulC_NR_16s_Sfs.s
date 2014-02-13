        .text
        .align  4
        .globl  _ippsMulC_NR_16s_Sfs


_ippsMulC_NR_16s_Sfs:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        beq     LDRM4
        cmp     r2, #0
        beq     LDRM4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r12, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r7, pc}
        cmp     r12, #0
        mov     r6, #0
        moveq   r4, #0
        beq     LDRM0
        mov     r4, #1
        sub     lr, r12, #1
        mov     r4, r4, lsl lr
LDRM0:
        cmp     r3, #0
        ble     LDRM3
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     r5, lr
LDRM1:
        ldrsh   r7, [r0], #2
        mla     r7, r1, r7, r4
        mov     r7, r7, asr r12
        cmp     r5, r7
        sublt   r7, r6, #2, 18
        mvnlt   r7, r7
        blt     LDRM2
        cmn     r7, #2, 18
        movge   r7, r7, lsl #16
        movge   r7, r7, asr #16
        movlt   r7, lr
LDRM2:
        strh    r7, [r2], #2
        subs    r3, r3, #1
        bne     LDRM1
LDRM3:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDRM4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


