        .text
        .align  4
        .globl  _ippsAndC_8u


_ippsAndC_8u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r1, #0
        bne     LBKE0
        cmp     r0, #0
        beq     LBKE4
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsZero_8u
LBKE0:
        cmp     r0, #0
        beq     LBKE4
        cmp     r2, #0
        beq     LBKE4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r3, #6
        mov     r5, #0
        blt     LBKE2
        sub     r4, r3, #6
        sub     lr, r2, #1
        sub     r12, r0, #1
LBKE1:
        ldrb    r6, [r12, #1]
        add     r5, r5, #5
        cmp     r5, r4
        and     r6, r1, r6
        strb    r6, [lr, #1]
        ldrb    r6, [r12, #2]
        and     r6, r1, r6
        strb    r6, [lr, #2]
        ldrb    r6, [r12, #3]
        and     r6, r1, r6
        strb    r6, [lr, #3]
        ldrb    r6, [r12, #4]
        and     r6, r1, r6
        strb    r6, [lr, #4]
        ldrb    r6, [r12, #5]!
        and     r6, r1, r6
        strb    r6, [lr, #5]!
        ble     LBKE1
LBKE2:
        add     r0, r5, r0
        add     r2, r5, r2
LBKE3:
        ldrb    r12, [r0], #1
        add     r5, r5, #1
        and     r12, r1, r12
        strb    r12, [r2], #1
        cmp     r5, r3
        blt     LBKE3
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBKE4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


