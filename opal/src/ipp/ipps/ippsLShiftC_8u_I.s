        .text
        .align  4
        .globl  _ippsLShiftC_8u_I


_ippsLShiftC_8u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #7
        bgt     LAYI3
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r0, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r8, pc}
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LAYI1
        sub     r12, r2, #6
        sub     r3, r1, #1
LAYI0:
        ldrb    r8, [r3, #1]
        ldrb    r7, [r3, #2]
        ldrb    r6, [r3, #3]
        ldrb    r5, [r3, #4]
        ldrb    r4, [r3, #5]
        mov     r8, r8, lsl r0
        mov     r7, r7, lsl r0
        mov     r6, r6, lsl r0
        mov     r5, r5, lsl r0
        mov     r4, r4, lsl r0
        add     lr, lr, #5
        strb    r8, [r3, #1]
        strb    r7, [r3, #2]
        strb    r6, [r3, #3]
        strb    r5, [r3, #4]
        strb    r4, [r3, #5]!
        cmp     lr, r12
        ble     LAYI0
LAYI1:
        add     r1, lr, r1
LAYI2:
        ldrb    r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        mov     r3, r3, lsl r0
        strb    r3, [r1], #1
        blt     LAYI2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYI3:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsZero_8u


