        .text
        .align  4
        .globl  _ippsLShiftC_8u


_ippsLShiftC_8u:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_8u
        cmp     r4, #7
        ble     LAYJ0
        cmp     r0, #0
        beq     LAYJ4
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsZero_8u
LAYJ0:
        cmp     r0, #0
        beq     LAYJ4
        cmp     r1, #0
        beq     LAYJ4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r4, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LAYJ2
        sub     r5, r2, #6
        sub     lr, r1, #1
        sub     r12, r0, #1
LAYJ1:
        ldrb    r7, [r12, #1]
        add     r6, r6, #5
        cmp     r6, r5
        mov     r7, r7, lsl r4
        strb    r7, [lr, #1]
        ldrb    r7, [r12, #2]
        mov     r7, r7, lsl r4
        strb    r7, [lr, #2]
        ldrb    r7, [r12, #3]
        mov     r7, r7, lsl r4
        strb    r7, [lr, #3]
        ldrb    r7, [r12, #4]
        mov     r7, r7, lsl r4
        strb    r7, [lr, #4]
        ldrb    r7, [r12, #5]!
        mov     r7, r7, lsl r4
        strb    r7, [lr, #5]!
        ble     LAYJ1
LAYJ2:
        add     r0, r6, r0
        add     r1, r6, r1
LAYJ3:
        ldrb    r12, [r0], #1
        add     r6, r6, #1
        mov     r12, r12, lsl r4
        strb    r12, [r1], #1
        cmp     r6, r2
        blt     LAYJ3
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAYJ4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


