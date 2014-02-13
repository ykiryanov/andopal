        .text
        .align  4
        .globl  _ippsPhase_32fc


_ippsPhase_32fc:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBAW2
        cmp     r5, #0
        beq     LBAW2
        cmp     r4, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r8, pc}
        cmp     r4, #0
        ble     LBAW1
        sub     r6, r0, #4
LBAW0:
        ldr     r0, [r6, #4]
        bl      __extendsfdf2
        mov     r8, r0
        ldr     r0, [r6, #8]!
        mov     r7, r1
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r8
        bl      atan2
        bl      __truncdfsf2
        str     r0, [r5], #4
        subs    r4, r4, #1
        bne     LBAW0
LBAW1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBAW2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


