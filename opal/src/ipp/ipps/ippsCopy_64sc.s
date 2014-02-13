        .text
        .align  4
        .globl  _ippsCopy_64sc


_ippsCopy_64sc:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LBNL4
        cmp     r1, #0
        beq     LBNL4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        mov     r2, r2, lsl #4
        cmp     r2, #0
        ble     LBNL3
        cmp     r2, #6
        mov     r3, #0
        blt     LBNL1
        sub     r4, r2, #6
        sub     lr, r1, #1
        sub     r12, r0, #1
LBNL0:
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
        ble     LBNL0
LBNL1:
        add     r0, r3, r0
        add     r1, r3, r1
LBNL2:
        ldrb    r12, [r0], #1
        add     r3, r3, #1
        cmp     r3, r2
        strb    r12, [r1], #1
        blt     LBNL2
LBNL3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBNL4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


