        .text
        .align  4
        .globl  _ippsPhase_64fc


_ippsPhase_64fc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mov     r4, r2
        beq     LBAT2
        cmp     r1, #0
        beq     LBAT2
        cmp     r4, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r6, pc}
        cmp     r4, #0
        ble     LBAT1
        sub     r6, r0, #4
        sub     r5, r1, #4
LBAT0:
        ldr     r0, [r6, #0xC]
        ldr     r1, [r6, #0x10]
        ldr     r2, [r6, #4]
        ldr     r3, [r6, #8]
        bl      atan2
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        subs    r4, r4, #1
        add     r6, r6, #0x10
        bne     LBAT0
LBAT1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBAT2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


