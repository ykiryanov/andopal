        .text
        .align  4
        .globl  _ippsPhase_16s32f


_ippsPhase_16s32f:
        stmdb   sp!, {r4 - r9, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        mov     r6, r3
        beq     LBBB2
        cmp     r8, #0
        beq     LBBB2
        cmp     r7, #0
        beq     LBBB2
        cmp     r6, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r9, pc}
        cmp     r6, #0
        ble     LBBB1
LBBB0:
        ldrsh   r0, [r9], #2
        bl      __floatsidf
        mov     r5, r0
        ldrsh   r0, [r8], #2
        mov     r4, r1
        bl      __floatsidf
        mov     r3, r4
        mov     r2, r5
        bl      atan2
        bl      __truncdfsf2
        str     r0, [r7], #4
        subs    r6, r6, #1
        bne     LBBB0
LBBB1:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LBBB2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


