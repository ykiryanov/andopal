        .text
        .align  4
        .globl  _ippsAnd_8u


_ippsAnd_8u:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBJY3
        cmp     r1, #0
        beq     LBJY3
        cmp     r2, #0
        beq     LBJY3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #6
        mov     r6, #0
        blt     LBJY1
        sub     r5, r3, #6
        sub     r4, r2, #1
        sub     lr, r0, #1
        sub     r12, r1, #1
LBJY0:
        ldrb    r7, [r12, #1]
        ldrb    r8, [lr, #1]
        add     r6, r6, #5
        cmp     r6, r5
        and     r7, r8, r7
        strb    r7, [r4, #1]
        ldrb    r7, [r12, #2]
        ldrb    r8, [lr, #2]
        and     r7, r8, r7
        strb    r7, [r4, #2]
        ldrb    r7, [r12, #3]
        ldrb    r8, [lr, #3]
        and     r7, r8, r7
        strb    r7, [r4, #3]
        ldrb    r7, [r12, #4]
        ldrb    r8, [lr, #4]
        and     r7, r8, r7
        strb    r7, [r4, #4]
        ldrb    r7, [r12, #5]!
        ldrb    r8, [lr, #5]!
        and     r7, r8, r7
        strb    r7, [r4, #5]!
        ble     LBJY0
LBJY1:
        add     r0, r6, r0
        add     r1, r6, r1
        add     r2, r6, r2
LBJY2:
        ldrb    r12, [r1], #1
        ldrb    lr, [r0], #1
        add     r6, r6, #1
        and     r12, lr, r12
        strb    r12, [r2], #1
        cmp     r6, r3
        blt     LBJY2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBJY3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


