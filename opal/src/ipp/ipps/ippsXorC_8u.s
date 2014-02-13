        .text
        .align  4
        .globl  _ippsXorC_8u


_ippsXorC_8u:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_8u
        cmp     r0, #0
        beq     LBJA3
        cmp     r1, #0
        beq     LBJA3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJA1
        sub     r5, r2, #6
        sub     lr, r1, #1
        sub     r12, r0, #1
LBJA0:
        ldrb    r7, [r12, #1]
        add     r6, r6, #5
        cmp     r6, r5
        eor     r7, r4, r7
        strb    r7, [lr, #1]
        ldrb    r7, [r12, #2]
        eor     r7, r4, r7
        strb    r7, [lr, #2]
        ldrb    r7, [r12, #3]
        eor     r7, r4, r7
        strb    r7, [lr, #3]
        ldrb    r7, [r12, #4]
        eor     r7, r4, r7
        strb    r7, [lr, #4]
        ldrb    r7, [r12, #5]!
        eor     r7, r4, r7
        strb    r7, [lr, #5]!
        ble     LBJA0
LBJA1:
        add     r0, r6, r0
        add     r1, r6, r1
LBJA2:
        ldrb    r12, [r0], #1
        add     r6, r6, #1
        eor     r12, r4, r12
        strb    r12, [r1], #1
        cmp     r6, r2
        blt     LBJA2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBJA3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


