        .text
        .align  4
        .globl  _ippsPhase_32f


_ippsPhase_32f:
        stmdb   sp!, {r4 - r9, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r7, r2
        mov     r6, r3
        beq     LBAX2
        cmp     r8, #0
        beq     LBAX2
        cmp     r7, #0
        beq     LBAX2
        cmp     r6, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r9, pc}
        cmp     r6, #0
        ble     LBAX1
LBAX0:
        ldr     r0, [r9], #4
        bl      __extendsfdf2
        mov     r5, r0
        ldr     r0, [r8], #4
        mov     r4, r1
        bl      __extendsfdf2
        mov     r3, r4
        mov     r2, r5
        bl      atan2
        bl      __truncdfsf2
        str     r0, [r7], #4
        subs    r6, r6, #1
        bne     LBAX0
LBAX1:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LBAX2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


