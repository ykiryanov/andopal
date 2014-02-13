        .text
        .align  4
        .globl  _ippsFlip_8u


_ippsFlip_8u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LASD3
        cmp     r1, #0
        beq     LASD3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #6
        mov     r3, #0
        sub     r12, r2, #1
        blt     LASD1
        add     lr, r12, #1
        add     lr, lr, r1
        sub     r5, r2, #6
        sub     r4, r0, #1
LASD0:
        ldrb    r6, [r4, #1]
        add     r3, r3, #5
        cmp     r3, r5
        strb    r6, [lr, #-1]
        ldrb    r6, [r4, #2]
        sub     r12, r12, #5
        strb    r6, [lr, #-2]
        ldrb    r6, [r4, #3]
        strb    r6, [lr, #-3]
        ldrb    r6, [r4, #4]
        strb    r6, [lr, #-4]
        ldrb    r6, [r4, #5]!
        strb    r6, [lr, #-5]!
        ble     LASD0
LASD1:
        add     r1, r12, r1
        add     r0, r3, r0
LASD2:
        ldrb    r12, [r0], #1
        add     r3, r3, #1
        cmp     r3, r2
        strb    r12, [r1], #-1
        blt     LASD2
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LASD3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


