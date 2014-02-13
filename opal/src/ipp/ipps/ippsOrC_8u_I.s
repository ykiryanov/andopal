        .text
        .align  4
        .globl  _ippsOrC_8u_I


_ippsOrC_8u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LBJL1
        sub     r12, r2, #6
        sub     r3, r1, #1
LBJL0:
        ldrb    r8, [r3, #1]
        ldrb    r7, [r3, #2]
        ldrb    r6, [r3, #3]
        ldrb    r5, [r3, #4]
        ldrb    r4, [r3, #5]
        orr     r8, r8, r0
        orr     r7, r7, r0
        orr     r6, r6, r0
        orr     r5, r5, r0
        orr     r4, r4, r0
        add     lr, lr, #5
        strb    r8, [r3, #1]
        strb    r7, [r3, #2]
        strb    r6, [r3, #3]
        strb    r5, [r3, #4]
        strb    r4, [r3, #5]!
        cmp     lr, r12
        ble     LBJL0
LBJL1:
        add     r1, lr, r1
LBJL2:
        ldrb    r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        orr     r3, r3, r0
        strb    r3, [r1], #1
        blt     LBJL2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


