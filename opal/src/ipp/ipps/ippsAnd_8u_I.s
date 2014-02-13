        .text
        .align  4
        .globl  _ippsAnd_8u_I


_ippsAnd_8u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBJX3
        cmp     r1, #0
        beq     LBJX3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJX1
        sub     r5, r2, #6
        sub     r4, r1, #1
        sub     lr, r0, #1
LBJX0:
        ldrb    r12, [lr, #1]
        ldrb    r8, [r4, #1]
        ldrb    r3, [r4, #2]
        ldrb    r7, [r4, #3]
        add     r6, r6, #5
        and     r12, r8, r12
        strb    r12, [r4, #1]
        ldrb    r8, [lr, #2]
        ldrb    r12, [r4, #4]
        cmp     r6, r5
        and     r8, r3, r8
        strb    r8, [r4, #2]
        ldrb    r8, [lr, #3]
        ldrb    r3, [r4, #5]
        and     r8, r7, r8
        strb    r8, [r4, #3]
        ldrb    r7, [lr, #4]
        and     r7, r12, r7
        strb    r7, [r4, #4]
        ldrb    r12, [lr, #5]!
        and     r12, r3, r12
        strb    r12, [r4, #5]!
        ble     LBJX0
LBJX1:
        add     r1, r6, r1
        add     r0, r6, r0
LBJX2:
        ldrb    r3, [r0], #1
        ldrb    r12, [r1]
        add     r6, r6, #1
        cmp     r6, r2
        and     r3, r12, r3
        strb    r3, [r1], #1
        blt     LBJX2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBJX3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


