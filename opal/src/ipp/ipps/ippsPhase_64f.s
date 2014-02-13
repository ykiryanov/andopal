        .text
        .align  4
        .globl  _ippsPhase_64f


_ippsPhase_64f:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mov     r4, r3
        beq     LBAU2
        cmp     r1, #0
        beq     LBAU2
        cmp     r2, #0
        beq     LBAU2
        cmp     r4, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r7, pc}
        cmp     r4, #0
        ble     LBAU1
        sub     r7, r2, #4
        sub     r6, r1, #4
        sub     r5, r0, #4
LBAU0:
        ldr     r0, [r6, #4]
        ldr     r1, [r6, #8]!
        ldr     r2, [r5, #4]
        ldr     r3, [r5, #8]!
        bl      atan2
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        subs    r4, r4, #1
        bne     LBAU0
LBAU1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBAU2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


