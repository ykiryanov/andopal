        .text
        .align  4
        .globl  _ippsAddC_8u_ISfs


_ippsAddC_8u_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r3, #9
        bgt     LDCJ9
        cmn     r3, #7
        bge     LDCJ0
        cmp     r0, #0
        beq     LDCJ0
        mov     r0, #0xFF
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsSet_8u
LDCJ0:
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r3, #0
        mov     r12, #0
        mov     lr, #0xFF
        bne     LDCJ4
        cmp     r0, #0
        beq     LDCJ8
        cmp     r2, #6
        blt     LDCJ2
        sub     r5, r2, #6
        sub     r4, r1, #1
LDCJ1:
        ldrb    r7, [r4, #1]
        ldrb    r6, [r4, #2]
        ldrb    r3, [r4, #3]
        add     r7, r0, r7
        cmp     r7, #0xFF
        mov     r8, lr
        movcc   r8, r7
        add     r7, r0, r6
        ldrb    r6, [r4, #4]
        strb    r8, [r4, #1]
        cmp     r7, #0xFF
        mov     r8, lr
        movcc   r8, r7
        add     r7, r0, r3
        ldrb    r3, [r4, #5]
        strb    r8, [r4, #2]
        cmp     r7, #0xFF
        mov     r8, lr
        movcc   r8, r7
        add     r7, r0, r6
        cmp     r7, #0xFF
        mov     r6, lr
        movcc   r6, r7
        add     r3, r0, r3
        cmp     r3, #0xFF
        mov     r7, lr
        movcc   r7, r3
        add     r12, r12, #5
        strb    r8, [r4, #3]
        strb    r6, [r4, #4]
        strb    r7, [r4, #5]!
        cmp     r12, r5
        ble     LDCJ1
LDCJ2:
        add     r1, r12, r1
LDCJ3:
        ldrb    r3, [r1]
        add     r12, r12, #1
        mov     r4, lr
        add     r3, r0, r3
        cmp     r3, #0xFF
        movcc   r4, r3
        strb    r4, [r1], #1
        cmp     r12, r2
        blt     LDCJ3
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCJ4:
        cmp     r3, #0
        ble     LDCJ10
        sub     lr, r3, #1
        mov     r4, #1
        mov     lr, r4, lsl lr
        cmp     r2, #5
        sub     r6, lr, #1
        blt     LDCJ6
        sub     r8, r2, #5
        sub     r7, r1, #1
LDCJ5:
        ldrb    lr, [r7, #1]
        ldrb    r5, [r7, #2]
        ldrb    r4, [r7, #3]
        ldrb    r9, [r7, #4]
        add     lr, r0, lr
        mov     r10, lr, lsr r3
        and     r10, r10, #1
        add     lr, r6, lr
        add     r10, lr, r10
        mov     lr, r10, lsr r3
        add     r5, r0, r5
        strb    lr, [r7, #1]
        mov     lr, r5, lsr r3
        and     lr, lr, #1
        add     r5, r6, r5
        add     lr, r5, lr
        mov     lr, lr, lsr r3
        add     r4, r0, r4
        strb    lr, [r7, #2]
        mov     lr, r4, lsr r3
        and     lr, lr, #1
        add     r4, r6, r4
        add     r9, r0, r9
        add     lr, r4, lr
        mov     r4, r9, lsr r3
        and     r4, r4, #1
        add     r9, r6, r9
        add     r4, r9, r4
        mov     lr, lr, lsr r3
        mov     r4, r4, lsr r3
        add     r12, r12, #4
        strb    lr, [r7, #3]
        strb    r4, [r7, #4]!
        cmp     r12, r8
        ble     LDCJ5
LDCJ6:
        add     r1, r12, r1
LDCJ7:
        ldrb    lr, [r1]
        add     r12, r12, #1
        cmp     r12, r2
        add     lr, r0, lr
        mov     r4, lr, lsr r3
        and     r4, r4, #1
        add     lr, r6, lr
        add     r4, lr, r4
        mov     lr, r4, lsr r3
        strb    lr, [r1], #1
        blt     LDCJ7
LDCJ8:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCJ9:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_8u
LDCJ10:
        cmn     r3, #7
        bge     LDCJ12
        cmp     r2, #0
        ble     LDCJ8
        mov     r3, r12
LDCJ11:
        ldrb    lr, [r1]
        cmp     lr, #0
        moveq   lr, r12
        movne   lr, #0xFF
        add     r3, r3, #1
        strb    lr, [r1], #1
        cmp     r3, r2
        blt     LDCJ11
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCJ12:
        cmp     r2, #6
        rsb     r3, r3, #0
        blt     LDCJ14
        sub     r6, r2, #6
        sub     r5, r1, #1
LDCJ13:
        ldrb    r8, [r5, #1]
        ldrb    r7, [r5, #2]
        ldrb    r4, [r5, #3]
        add     r8, r0, r8
        mov     r8, r8, lsl r3
        cmp     r8, #0xFF
        mov     r9, lr
        add     r7, r0, r7
        movcc   r9, r8
        mov     r7, r7, lsl r3
        cmp     r7, #0xFF
        mov     r8, lr
        movcc   r8, r7
        ldrb    r7, [r5, #4]
        add     r4, r0, r4
        mov     r4, r4, lsl r3
        strb    r8, [r5, #2]
        cmp     r4, #0xFF
        mov     r8, lr
        movcc   r8, r4
        ldrb    r4, [r5, #5]
        add     r7, r0, r7
        mov     r7, r7, lsl r3
        strb    r8, [r5, #3]
        cmp     r7, #0xFF
        mov     r8, lr
        movcc   r8, r7
        add     r4, r0, r4
        mov     r4, r4, lsl r3
        cmp     r4, #0xFF
        mov     r7, lr
        movcc   r7, r4
        add     r12, r12, #5
        strb    r9, [r5, #1]
        strb    r8, [r5, #4]
        strb    r7, [r5, #5]!
        cmp     r12, r6
        ble     LDCJ13
LDCJ14:
        add     r1, r12, r1
LDCJ15:
        ldrb    r4, [r1]
        add     r12, r12, #1
        mov     r5, lr
        add     r4, r0, r4
        mov     r4, r4, lsl r3
        cmp     r4, #0xFF
        movcc   r5, r4
        strb    r5, [r1], #1
        cmp     r12, r2
        blt     LDCJ15
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


