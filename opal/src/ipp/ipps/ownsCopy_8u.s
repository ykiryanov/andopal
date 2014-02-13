        .text
        .align  4
        .globl  ownsCopy_8u


ownsCopy_8u:
        stmdb   sp!, {r4, r5, lr}
        cmp     r2, #0
        ble     LCVI3
        cmp     r2, #6
        mov     r3, #0
        blt     LCVI1
        sub     r4, r2, #6
        sub     lr, r1, #1
        sub     r12, r0, #1
LCVI0:
        ldrb    r5, [r12, #1]
        add     r3, r3, #5
        cmp     r3, r4
        strb    r5, [lr, #1]
        ldrb    r5, [r12, #2]
        strb    r5, [lr, #2]
        ldrb    r5, [r12, #3]
        strb    r5, [lr, #3]
        ldrb    r5, [r12, #4]
        strb    r5, [lr, #4]
        ldrb    r5, [r12, #5]!
        strb    r5, [lr, #5]!
        ble     LCVI0
LCVI1:
        add     r0, r3, r0
        add     r12, r3, r1
LCVI2:
        ldrb    lr, [r0], #1
        add     r3, r3, #1
        cmp     r3, r2
        strb    lr, [r12], #1
        blt     LCVI2
LCVI3:
        mov     r0, r1
        ldmia   sp!, {r4, r5, pc}


